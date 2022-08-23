<?php

function completeFilePath(string $file, bool $test = true){
    if ($test == false) {
        $completeFilePath = __DIR__ . "/$file";
        return $completeFilePath;
    }

    $completeFilePath = realpath(__DIR__ . "/$file");
    return $completeFilePath;    
}
