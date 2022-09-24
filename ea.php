#!/usr/bin/env php
<?php

// CLI usage help
$help = <<<help
Usage: ea [OPTIONS] <COMMAND>

A website that helps you with recommendations to buy exchanges and make a profit

Options:
    -h, --help          Show this help

Commands:
    init [OPTIONS]      Start the backend and frontend of the website
    stop                Stop the backend and frontend of the website
    composer [OPTIONS]  Up composer container and run commands inside it

help;

// init command usage help
$initHelp = <<<initHelp
Usage: ea init [OPTIONS] 

A command to start the backend and frontend of the website

Options:
    -h, --help          Show this help
    -b, --build         Build (or rebuild) all ".Dockerfile"

initHelp;

// composer command usage help
$composerHelp = <<<composerHelp
Usage: ea composer [OPTIONS] [ARGUMENT] 

A command to up the composer container and run commands inside it

Options:
    -h, --help          Show this help
    -i, --install       Install the composer.json packages
    -u, --update        Update vendor directory in accord to composer.json
    -a, --add           Adds the library indicated in the [ARGUMENT]
    -d, --remove        Removes the library indicated in the [ARGUMENT]
    -r, --run           Run the [ARGUMENT] as command inside the container

composerHelp;

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

        // if is the first time the command has been run (or the vendor dir just doesn't exist), run "composer install" in the composer container, and after tthis, up the containers normally
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

    // composer container commands
    case "composer":
        // if there is more than 4 arguments passed, stopt the execution
        if ($argc > 4) {
            echo "\033[31mNo command or option detected\033[0m\n\n" . $composerHelp;
            exit;
        }

        // if there is 4 arguments passed, verify the third argument, because the fourth argument is a command/argument to run inside the container
        if ($argc == 4) {
            switch ($argv[2]) {
                // add option, it runs composer require command, adding the package requested in the fourth argument
                case "-a":
                case "--add":
                    shell_exec("docker-compose run --rm composer composer require " . $argv[3]);
                exit;

                // remove option, it runs composer remove command, removing the package requested in the fourth argument
                case "-d":
                case "--remove":
                    shell_exec("docker-compose run --rm composer composer remove " . $argv[3]);
                exit;

                // run option, it runs a command requested in the fourth argument inside the container
                case "-r":
                case "--run":
                    shell_exec("docker-compose run --rm composer " . $argv[3]);
                exit;
                
                // stop the execution if there is no existing command/option
                default:
                    echo "\033[31mNo command or option detected\033[0m\n\n" . $composerHelp;
                exit;
            }
        }

        // if there is 3 arguments, verify the argument and run the option/command
        switch ($argv[2]) {
            // install option, it runs composer install command if there is a composer.json
            case "-i":
            case "--install":
                shell_exec("docker-compose run --rm composer composer install");
            exit;

            // update option, it runs composer update command according the composer.json
            case "-u":
            case "--update":
                shell_exec("docker-compose run --rm composer composer update");
            exit;

            // help option, it shows the help
            case "-h":
            case "--help":
                echo $composerHelp;
            exit;
            
            // stop the execution if there is no existing command/option 
            default:
                echo "\033[31mNo command or option detected\033[0m\n\n" . $composerHelp;
            exit;
        }
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