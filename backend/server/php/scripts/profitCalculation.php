<?php

require __DIR__ . "/../vendor/autoload.php";
require __DIR__ . "/../utils/classes/fetch.php";

// carregar dotenv
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . "/../");
$dotenv->load();

// constantes
define('API_URL', $_ENV['API_URL']);
define('API_KEY', $_ENV['API_KEY']);

// variáveis
$moeda_base = "BRL";
$moeda_investida = "EUR";
$quantia_moeda_investida = 200;

$cotação_moeda_investida_em_moeda_base_antigo = 5.08; //valor dia 01/11
$valor_investido = $quantia_moeda_investida * $cotação_moeda_investida_em_moeda_base_antigo;

// fetch
$fetch = new fetch();

$moedas_exploradas = [
    "Dólar" => [
        "valor" => 5.24,
        "código" => "USD"
    ],
    "Peso Argentino" => [
        "valor" => 0.3,
        "código" => "ARS"
    ],
    "Franco Suiço" => [
        "valor" => 5.56,
        "código" => "CHF"    
    ]
]; // valores dia 06/12


foreach ($moedas_exploradas as $nome_moeda => $info_moeda) {
    $url = API_URL . "/v6/" . API_KEY . "/pair/$moeda_investida/{$info_moeda["código"]}";
    $response = ($fetch->get($url))["response"];

    $valor_moeda_investida_em_moeda_explorada = $response["conversion_rate"];

    $total_cambiado = $quantia_moeda_investida * $valor_moeda_investida_em_moeda_explorada * $info_moeda["valor"];

    if ($total_cambiado > $valor_investido) {
        echo "Tamo ganhando dinheiro\n";
    }
}