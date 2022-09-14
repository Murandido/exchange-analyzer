<?php

// require of the classes used in the code
require __DIR__ . '/../utils/functions.php'; 
require completeFilePath("../vendor/autoload.php");
require completeFilePath("../utils/classes/fetch.php");
require completeFilePath("../utils/classes/dbconnection.php");

// load env file with dotenv library
$dotenv = Dotenv\Dotenv::createImmutable(completeFilePath("../"));
$dotenv->load();

// declare environment variables as constants
define('API_URL', $_ENV['API_URL']);
define('API_KEY', $_ENV['API_KEY']);
define('DB_HOST', $_ENV['DB_HOST']);
define('DB_PORT', $_ENV['DB_PORT']);
define('DB_USER', $_ENV['DB_USER']);
define('DB_PASSWORD', $_ENV['DB_PASSWORD']);


// the complete url
$url = API_URL . "/v6/" . API_KEY . "/latest/BRL";

// quota fetch
$fetch = new fetch();
$response = $fetch->get($url);

// array with 179 iso 4217 codes with respective currency name
$iso4217 = json_decode(file_get_contents(realpath(dirname(__FILE__) . "/../utils/iso4217.json")), true);

$exchanges = [];

// formatting the response of the fetch to an array with all exchanges information
foreach ($response["response"]["conversion_rates"] as $key => $value) {
    $currency_name = $iso4217[$key];
    $iso4217_code = $key;
    $currency_value = round($value, 2);

    $exchanges[$currency_name] = ["iso4217_code" => $iso4217_code, "value" => $currency_value];
}
/*  ^ Output ^
    $exchanges [
        "{currency_name}" => [
            "iso4217_code" => {iso 4217 code of the currency},
            "value" => {currency value}
        ],
        "{currency_name}" => [ ... ],

        ...
    ]
*/

// instatiation of database class
$db = new database(DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, "exchange_analyzer");

// if the db connection is not established, exit early
if (!$db->is_connected()) {
    echo "Database connection is not established!";
    exit;
}

$queries = [];

// formatting the exchanges array to suit the input of the function execute_many_queries of the database class
foreach ($exchanges as $currency_name => $options_array) {
    $i = (isset($i)) ? $i : 0;
    ++$i;

    $queries["querry $i"] = [
        "sql" => "INSERT INTO quotas (
            datetime,
            timezone,
            base_currency_id,
            quoted_currency,
            iso_4217_code,
            quota
        ) VALUES (
            :datetime,
            :timezone,
            :base_currency_id,
            :quoted_currency,
            :iso_4217_code,
            :quota
        ) ON DUPLICATE KEY UPDATE 
            datetime = :datetime,
            timezone = :timezone,
            base_currency_id = :base_currency_id,
            quoted_currency = :quoted_currency,
            iso_4217_code = :iso_4217_code,
            quota = :quota",

        "params" => [
            "datetime" => [
                "value" => date("Y-m-d H:i:s"),
                "type" => "str"
            ],
            "timezone" => [
                "value" => date("e"),
                "type" => "str"
            ],
            "base_currency_id" => [
                "value" => 1,
                "type" => "int"
            ],
            "quoted_currency" => [
                "value" => $currency_name,
                "type" => "str"
            ],
            "iso_4217_code" => [
                "value" => $options_array["iso4217_code"],
                "type" => "str"
            ],
            "quota" => [
                "value" => (string) $options_array["value"],
                "type" => "str"
            ]
        ]
    ];
}
/* ^ Output ^ 
    $queries = [
        "query1" => [
               "sql" => "INSERT INTO {table_name} ({columns}) VALUES ({:values})")"
    
               "params" => [
                   "{param}" => (options) [
                       "value" => {value},
                       "type" => {type}
                   ]
                   "{param}" => ...,
                      
               ]
           ],
       
           "querry2" => [...]
        ]
    ]
*/

// inserting queries into the database
$insert_db = $db->execute_many_queries($queries);

// if fail
if (!$insert_db) {
    echo "An error occurred!\n";
    print_r($db->get_error_message() . "\n");
    exit;
} 

echo "All queries are inserted/updated!\n";
