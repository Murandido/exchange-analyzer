<?php 

/**
 * Simplify the usage of curl in PHP.
 * 
 * @version 0.0.1
 */
class fetch {
    /**
     * Consume an api with GET
     *
     * @param string $url
     * @param array $headers — [optional]
     * @return array["status_code", "response"]
     */
    public function get( string $url, array $headers = []) : array {
        $ch = curl_init($url);

        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $response = json_decode(curl_exec($ch), true);

        $status_code = curl_getinfo($ch, CURLINFO_RESPONSE_CODE);

        curl_close($ch);

        return [
            "status_code" => $status_code,
            "response" => $response
        ];
    }
}