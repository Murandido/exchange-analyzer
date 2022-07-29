if [ $1 ]; then
    touch ../backend/database/dbdumps/dbdump:latest.sql

    echo "CREATE DATABASE IF NOT EXISTS exchange_analyzer;" > ../backend/database/dbdumps/dbdump:latest.sql

    echo "USE exchange_analyzer;" >> ../backend/database/dbdumps/dbdump:latest.sql

    docker exec $1 /usr/bin/mysqldump -u root -p27112021 exchange_analyzer >> ../backend/database/dbdumps/dbdump:latest.sql
else
    echo "ERROR: Needs MySQL container name or id"
fi
