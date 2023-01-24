<?php

require __DIR__ . "/../vendor/autoload.php";
require __DIR__ . "/../utils/classes/fetch.php";

// carregar dotenv
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . "/../");
$dotenv->load();

// constantes
define('API_URL', $_ENV['API_URL']);
define('API_KEY', $_ENV['API_KEY']);

// fetch
$fetch = new fetch();

echo "\n **** Running proposal collections " . date('l jS \of F Y h:i:s A') . "****\n";

/*
 * Parte 1: INVESTIMENTO
 * 
 * Assumindo um investimento hoje de 200 euros em reais:
 *  1- buscamos a cotacao atual do euro em real
 *  2- calculamos o valor investido
 *  3- setamos a lista de moedas exploradas
 */
$MB = "BRL";  // moeda base
$MI = "EUR";  // moeda investida
$qMI = 2000;  // quantidade moeda investida
$url_MI_MB = API_URL . "/v6/" . API_KEY . "/pair/$MI/$MB";
$response = ($fetch->get($url_MI_MB))["response"];
//$cotacao_MI_MB = (float) $response["conversion_rate"]; //valor dia 01/11
$cotacao_MI_MB = 5.63;  # collected on 21/1/23
$total_investido = $qMI * $cotacao_MI_MB;

/**
 * @TODO: move this to a .ini file
 */
$moedas_exploradas = [
    "Dólar" => [
        "codigo" => "USD"
    ],
    "Peso Argentino" => [
        "codigo" => "ARS"
    ],
    "Franco Suiço" => [
        "codigo" => "CHF"    
    ],
    "Australian Dollar" => [
        "codigo" => "AUD"    
    ],
    "Bolivia" => [
        "codigo" => "BOB"    
    ],
    "Belarus" => [
        "codigo" => "BYR"    
    ],
    "Canadian Dollar" => [
        "codigo" => "CAD"    
    ],
    "Peso Chileno" => [
        "codigo" => "CLP"    
    ],
    "Fiji" => [
        "codigo" => "FJD"    
    ],
    "Indonesia" => [
        "codigo" => "IDR"    
    ],
    "India" => [
        "codigo" => "INR"    
    ],
    "Jamaican Dollar" => [
        "codigo" => "JMD"    
    ],
    "Japan" => [
        "codigo" => "JPY"    
    ],
    "North Korea" => [
        "codigo" => "KPW"    
    ],
    "South Korea" => [
        "codigo" => "KRW"    
    ],
    "Marroco" => [
        "codigo" => "MAD"    
    ],
    "Mexico" => [
        "codigo" => "MXN"    
    ],
    "Pakistan" => [
        "codigo" => "PKR"    
    ],
    "Romenia" => [
        "codigo" => "RON"    
    ],
    "Serbia" => [
        "codigo" => "RSD"    
    ],
]; // valores dia 06/12

/*
 * Parte 2: EXPLORAR MOEDAS
 * 
 * Para cada moeda explorada na lista acima:
 *  1- buscamos a cotacao atual da moeda investida em moeda explorada:
 *   1.2- seguindo nosso exemplo, moeda investida euro combinando a lista acima:
 *    1.2.1- euro em dolar
 *    1.2.2- euro em peso
 *    1.2.3- euro em franco
 *  2- calculamos o total cambiado (moeda investida em moeda explorada)
 *  3- imprimimos em teal
 */
foreach ($moedas_exploradas as $nome_moeda => $info_moeda) {
    // busca o valor da moeda investida na moeda explorada
    $url_MI_ME = API_URL . "/v6/" . API_KEY . "/pair/$MI/{$info_moeda["codigo"]}";
    $response = $fetch->get($url_MI_ME)["response"];
    $cotacao_MI_ME = $response["conversion_rate"];
    
    // busca o valor da moeda explorada na moeda base
    $url_ME_MB = API_URL . "/v6/" . API_KEY . "/pair/{$info_moeda["codigo"]}/$MB";
    $response = ($fetch->get($url_ME_MB))["response"];
    $cotacao_ME_MB = $response["conversion_rate"];

    $total_cambiado = $qMI * $cotacao_MI_ME * $cotacao_ME_MB;

    if ($total_cambiado > $total_investido) {
        echo "\n----------------------\n"
        . "TRANSACAO FAVORAVEL\n"
        . "investimento inicial:$MB($MI)=$qMI*$cotacao_MI_MB=$total_investido\n"
        . "\t$MI -> {$info_moeda['codigo']} -> $MB\n"
        . "\t\tvalores: $MI({$info_moeda['codigo']})=$cotacao_MI_ME, "
        . "{$info_moeda['codigo']}($MB)=$cotacao_ME_MB\n"
        . "\t\ttotal: $total_cambiado\n"
        . "\t\tlucro: " .($total_cambiado - $total_investido) . "\n";
    }
}
