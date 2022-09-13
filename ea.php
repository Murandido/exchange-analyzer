#!/usr/bin/env php
<?php

// CLI usage help
$help = <<<help
Usage: ea [OPTIONS] <COMMAND>

A website that helps you with recommendations to buy exchanges and make a profit

Options:
    -h, --help          Show this help

Commands:
    init          Start the backend and frontend of the website
    stop          Stop the backend and frontend of the website

help;

// init command usage help
$initHelp = <<<initHelp
Usage: ea init [OPTIONS] 

A command to start the backend and frontend of the website

Options:
    -h, --help          Show this help
    -b, --build         Build (or rebuild) all ".Dockerfile"

initHelp;

// stop the execution if there is no command
if ($argc == 1) {
    echo "\033[31mNo command or option detected\033[0m\n\n" . $help;
    exit;
}

// check the first argument
switch ($argv[1]) {
    // commands

    // init command
    case "init":
        // if more than three arguments are passed, stop the command execution
        if ($argc > 3) {
            echo "\033[31mCommand or option doesn't exist\033[0m\n\n" . $initHelp;
            break;
        }

        // if is the first time the command has been run, run "composer install" in the composer container, and after tthis, up the containers normally
        if (!is_dir(__DIR__ . "/backend/server/php/vendor")) {
            // "composer install" in the composer container | command used: "docker-compose run --rm <container-name-in-the-docker-compose> <command>"
            shell_exec("docker-compose run --rm composer composer install");    
        }

        // sub commands / command options
        if ($argc == 3) {
            switch ($argv[2]) {
                // help option
                case "-h":
                case "--help":
                    echo $initHelp;
                    exit;
                
                // rebuild the Dockerfiles, up the containers, and get off the script
                case "-b":
                case "--build":
                    shell_exec("docker-compose up -d --build");
                    exit;
                
                // if there is no valid command, get off the script
                default:
                    echo "\033[31mCommand or option doesn't exist\033[0m\n\n" . $initHelp;
                    exit;
            }
        }

        // up the containers if there is no sub command
        shell_exec("docker-compose up -d");

        break;

    // stop command
    case "stop":
        // if there is more than 1 argument passed (two considering with the script call), get off the script
        if ($argc > 2) {
            echo "\033[31mCommand or option doesn't exist\033[0m\n\n" . $help;
            break;
        }

        // down the containers
        shell_exec("docker-compose down");
        break;

    // options

    // help option
    case "-h":
    case "--help":
        // if there is more than 1 argument passed (two considering with the script call), get off the script
        if ($argc > 2) {
            echo "\033[31mCommand or option doesn't exist\033[0m\n\n" . $help;
            break;
        }

        // print the help
        echo $help;
        break;
    
    // if command or option doesnt exist, get off the script
    default:
        echo "\033[31mCommand or option doesn't exist\033[0m\n\n" . $help;
        break;
}