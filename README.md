# Exchange Analyzer

A project with a backend written in PHP, with MySQL as a database, a frontend written in JavaScript using the React framework, which observes exchange quotas using an API and helps you profit from your purchased exchange.

## Table of contents

- [Authors](#ruthors)
- [Requirements](#requirements)
- [Setup](#Setup)
  - [With the CLI](#with-the-cli)
  - [Manually](#manually)
- [How to use the CLI](#how-to-use-the-cli)
  - [Init command](#init-command)
  - [Stop command](#stop-command)
  - [Composer Command](#composer-command)
  - [Php-script command](#php-script-command)
  - [DBbackup command](#dbbackup-command)
- [How to use CLI commands without the CLI](#how-to-use-cli-commands-without-the-cli)
  - [Init command](<#init-command-(without-cli)>)
  - [Stop command](<#stop-command-(without-cli)>)
  - [Composer Command](<#composer-command-(without-cli)>)
  - [Php-script command](<#php-script-command-(without-cli)>)
  - [DBbackup command](<#dbbackup-command-(without-cli)>)

## Authors

- [@Murandido](https://github.com/Murandido)
- [@Jorgeley Júnior](https://github.com/Jorgeley)
- [@Ivan Freeza](https://github.com/IvanFrezzaJr)

## Requirements

- Docker ^20.10.17
- Docker Compose ^1.29.2
- PHP ^7.4

## Setup

First, you need to clone the repository in your computer:

```bash
  git clone https://github.com/Murandido/portifolio.git (name of the directory that will be the repository)
```

There are two ways to setup the project, with the CLI, or manually.

#### With the CLI

To use the cli, you need to make the CLI file an executable using this command in your bash:

```bash
  sudo chmod a+x ea
```

After, run:

```bash
  ./ea init
```

The CLI will ask you a few questions if this is your first time booting, answer correctly, and the containers will go up, go to http://localhost:3000 to see the project.
If you want to stop the execution of the project, use this command:

```bash
  ./ea stop
```

#### Manually

First, you need to configure the .env file. Create the .env on "backend/server/php", use the envs on .env.sample, and set the envs.
After, you need to install the composer libs.
With the docker-compose:

```bash
  docker-compose run --rm composer composer install
```

With composer in your local machine:

```bash
  cd backend/server/php
  composer install
```

With the .env configurated and the composer libs isntalled, run:

```bash
  docker-compose up -d
```

And here is it, the containers are up-to-date and configurated,go to http://localhost:3000 to see the project.
If you want to stop the execution of the project, use this command:

```bash
  docker-compose down
```

## How to use the CLI

The CLI also has commands to simplify some things, like use commands in a composer container, run php scripts in a container and dump the database to a file.
If you have a doubt how to use some command, type:

```bash
  ./ea -h
```

or

```bash
  ./ea --help
```

#### Init command

The init command is for initialize the project. There are two ways to use it.
Up the containers normally:

```bash
  ./ea init
```

Up the containers normally, but rebuilding the ISOs:

```bash
  ./ea init -b
```

or

```bash
  ./ea init --build
```

If you have a doubt how to use some command, type:

```bash
  ./ea init -h
```

or

```bash
  ./ea init --help
```

#### Stop command

The stop command is self explanatory, it stops the project execution

```bash
  ./ea stop
```

#### Composer command

The composer command is to use PHP composer inside a container. There are 5 options to use.
Install the libs on composer.json (-i or --install):

```bash
  ./ea composer -i
```

Update the libs (-u or --update):

```bash
  ./ea composer -u
```

Install a new lib (-a or --add):

```bash
  ./ea composer -a (lib name)
```

Remove a lib (-d or --remove):

```bash
  ./ea composer -d (lib name)
```

Execute a composer command (-r or --run):

```bash
  ./ea composer -r (composer command)
```

If you have a doubt how to use some command, type:

```bash
  ./ea composer -h
```

or

```bash
  ./ea composer --help
```

#### Php-script command

The php-script command is als self explanatory, it runs a php script inside the "/backend/server/php" dir. There are two oprions to use.
Execute script (-e or --execute):

```bash
  ./ea php-script -e (path of the script, considering "/backend/server/php" as the root dir)
```

Run php commands (-r --run):

```bash
  ./ea php-script -r (php command)
```

If you have a doubt how to use some command, type:

```bash
  ./ea php-script -h
```

or

```bash
  ./ea php-script --help
```

#### DBbackup command

The dbbackup command is to dump the database on the "backend/database/dbdumps" dir. There is just one option to use.
Dump the backup:

```bash
  ./ea dbbackup (mysql container name or id)
```

Restore a dump (-r or --restore):

```bash
  ./ea dbbackup -r (mysql container name or id) (.sql file to restore)
```

If you have a doubt how to use some command, type:

```bash
  ./ea dbbackup -h
```

or

```bash
  ./ea dbbackup --help
```

## How to use CLI commands without the CLI

If you want to use the commands of the CLI, but for some reason you can't use, here is the solution.

#### Init command (without CLI)

The init command is for initialize the project.
Up the containers normally:

```bash
  docker-compose up -d
```

Up the containers normally, but rebuilding the ISOs:

```bash
  docker-compose up -d --build
```

#### Stop command (without CLI)

The stop command is self explanatory, it stops the project execution

```bash
  docker-compose down
```

#### Composer command (without CLI)

The composer command is to use PHP composer (need to install and be in "backend/server/php" directory).
Install the libs on composer.json :

```bash
  composer install
```

Update the libs:

```bash
  composer update
```

Install a new lib:

```bash
  composer require (lib name)
```

Remove a lib:

```bash
  composer remove (lib name)
```

#### Php-script command (without CLI)

The php-script command is als self explanatory, it runs a php script.
Execute script:

```bash
  php (path of the script)
```

Run php commands:

```bash
  ./ea php-script -r (php command)
```

#### DBbackup command (without CLI)

The dbbackup command is to dump the database on the "backend/database/dbdumps" dir.
Dump the backup:

```bash
  docker exec -i (mysql container name or id) sh -c 'exec mysqldump -uroot -p(database password)' exchange_analyzer > (path to the new dbdump file)
```

Restore a dump:

```bash
  docker exec -i (mysql container name or id) sh -c 'exec mysql -uroot -p(database password)' exchange_analyzer < (path to the dbdump file to restore)
```
