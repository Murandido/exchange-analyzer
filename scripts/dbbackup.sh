if [ $1 ]; then
    touch ../backend/database/dbdumps/dbdump_latest.sql

    echo "CREATE DATABASE IF NOT EXISTS exchange_analyzer;" > ../backend/database/dbdumps/dbdump_latest.sql

    echo "USE exchange_analyzer;" >> ../backend/database/dbdumps/dbdump_latest.sql

    docker exec $1 /usr/bin/mysqldump -u root -p27112021 exchange_analyzer >> ../backend/database/dbdumps/dbdump_latest.sql
else
    echo "ERROR: Needs MySQL container name or id"
fi
