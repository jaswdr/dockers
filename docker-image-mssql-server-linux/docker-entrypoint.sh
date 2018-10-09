#!/bin/bash

set -x

sqlservr &

sleep 15

sqlcmd \
    -S localhost \
    -U sa \
    -P $MSSQL_SA_PASSWORD \
    -Q """
CREATE DATABASE $MSSQL_DATABASE
ON
    ( NAME = db_file,
    FILENAME = '/data/$MSSQL_DATABASE.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
    ( NAME = db_log,
    FILENAME = '/data/$MSSQL_DATABASE.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB )
COLLATE Latin1_General_CI_AI
"""

sleep 15

function user_db_query() {
    sqlcmd \
        -S localhost \
        -d $MSSQL_DATABASE \
        -U sa \
        -P $MSSQL_SA_PASSWORD \
        -Q "$@"
}

user_db_query "CREATE LOGIN $MSSQL_USER WITH PASSWORD = '$MSSQL_PASSWORD'"
user_db_query "CREATE USER $MSSQL_USER FOR LOGIN $MSSQL_USER"
user_db_query "EXEC sp_addrolemember N'db_owner', N'$MSSQL_USER'"

tail -f /data/$MSSQL_DATABASE.ldf
