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

/*
 * Parte 1: INVESTIMENTO
 * 
 * Assumindo um investimento hoje de 200 euros em reais:
 *  1- buscamos a cotacao atual do euro em real
 *  2- calculamos o valor investido
 *  3- setamos a lista de moedas exploradas
 */
$moeda_base = "BRL";
$moeda_investida = "EUR";
$quantia_moeda_investida = 200;
$url_moeda_investida_moeda_base = API_URL . "/v6/" . API_KEY . "/pair/$moeda_investida/$moeda_base";
$response = ($fetch->get($url_moeda_investida_moeda_base))["response"];
$cotação_moeda_investida_em_moeda_base_antigo = (float) $response["conversion_rate"]; //valor dia 01/11
$valor_investido = $quantia_moeda_investida * $cotação_moeda_investida_em_moeda_base_antigo;
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
 *  3- 
 */
foreach ($moedas_exploradas as $nome_moeda => $info_moeda) {
    // busca o valor da moeda investida na moeda explorada
    $url_moeda_investida_moeda_explorada = API_URL . "/v6/" . API_KEY . "/pair/$moeda_investida/{$info_moeda["codigo"]}";
    $moeda_investida_explorada = ($fetch->get($url_moeda_investida_moeda_explorada))["response"];
    $valor_moeda_investida_explorada = $moeda_investida_explorada["conversion_rate"];
    
    // busca o valor da moeda explorada na moeda base
    $url_moeda_explorada_moeda_base = API_URL . "/v6/" . API_KEY . "/pair/{$info_moeda["codigo"]}/$moeda_base";
    $moeda_explorada_base = ($fetch->get($url_moeda_explorada_moeda_base))["response"];
    $valor_moeda_explorada_base = $moeda_explorada_base["conversion_rate"];

    $total_cambiado = $quantia_moeda_investida * $valor_moeda_investida_explorada * $valor_moeda_explorada_base;

    if ($total_cambiado > $valor_investido) {
        echo "\n----------------------\n"
        . "TRANSACAO FAVORAVEL\n"
        . "investimento inicial:$moeda_base($moeda_investida)=$quantia_moeda_investida*$cotação_moeda_investida_em_moeda_base_antigo=$valor_investido\n"
        . "\t$moeda_investida -> {$info_moeda['codigo']} -> $moeda_base\n"
        . "\t\tvalores: $moeda_investida({$info_moeda['codigo']})=$valor_moeda_investida_explorada, "
        . "{$info_moeda['codigo']}($moeda_base)=$valor_moeda_explorada_base\n"
        . "\t\ttotal: $total_cambiado\n";
    }
}