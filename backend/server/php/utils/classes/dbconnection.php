<?php

date_default_timezone_set("America/Sao_Paulo");

/**
 * Object oriented database
 * 
 * @version 0.0.1
 */
class database {
    private $pdo;

    private $connected;

    private $error_message = null;

    /**
     * Tries to connect to the database
     *
     * @param string $DB_HOST
     * @param string $DB_PORT
     * @param string $DB_USER
     * @param string $DB_PASSWORD
     * @param string $DB_NAME
     */
    function __construct(string $DB_HOST, string $DB_PORT, string $DB_USER, string $DB_PASSWORD, string $DB_NAME) {
        try {
            $dsn = "mysql:host=$DB_HOST:$DB_PORT;dbname=$DB_NAME";

            $this->pdo = new PDO($dsn, $DB_USER, $DB_PASSWORD);
            $this->connected = true;
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
        } catch (PDOException $err) {
            $this->error_message = $err->getMessage();
            $this->connected = false; 
        }
    }

    /**
     * Getter for the connection state
     *
     * @return boolean
     */
    public function is_connected() {
        return $this->connected;
    }

    /**
     * Getter for an error message
     *
     * @return null|string|array
     */
    public function get_error_message() {
        return $this->error_message;
    }

    /**
     * Execution of many queries on the database
     *
     *  Expected queries array 
     * 
     *      $queries [
     *          "query1" => [
     *              "sql" => "INSERT INTO {table_name} ({columns}) VALUES ({:values})")"
     *   
     *              "params" => [
     *                  "{param}" => (options) [
     *                      "value" => {value},
     *                      "type" => {type}
     *                  ]
     *                  "{param}" => ...,
     *                     
     *              ]
     *          ],
     *      
     *          "querry2" => [...]
     *       ] 
     * 
     * @param array $queries
     * @return boolean
     */
    public function execute_many_queries(array $queries) : bool {

        // start the transaction
        $this->pdo->beginTransaction();

        // tries to execute the queries one per one, and catch PDOException errors
        try {
            foreach ($queries as $query_name => $func_query) {
                $pdo_query = $this->pdo->prepare($func_query["sql"]);

                // bind params
                foreach ($func_query["params"] as $param => $options) {

                    // int
                    if ($options["type"] == "int" || $options["type"] == "integer") {
                        $pdo_query->bindParam(":$param", $options["value"], PDO::PARAM_INT);
                    }

                    // str
                    if ($options["type"] == "str" || $options["type"] == "string") {
                        $pdo_query->bindParam(":$param", $options["value"], PDO::PARAM_STR);
                    }

                    // bool
                    if ($options["type"] == "bool" || $options["type"] == "boolean") {
                        $pdo_query->bindParam(":$param", $options["value"], PDO::PARAM_BOOL);
                    }
                }

                $response = $pdo_query->execute();
                
                // if a query doesn't work
                if (!$response) {
                    $this->error_message = "Something went wrong with the SQL in the '$query_name' query.";
                    var_dump($this->pdo->errorInfo());

                    $this->pdo->rollBack();
                    
                    return false;
                }
            }
  
        } catch (PDOException $err) {
            $this->error_message = $err->getMessage();
            $this->pdo->rollBack();

            return false;
        }

        $this->pdo->commit();

        return true;
    }
}
