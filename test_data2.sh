#!/bin/bash

REMOTE_SERVER="helios.cs.ifmo.ru"
SSH_PORT=2222
SSH_USER="s333714"
PG_HOST="pg"
PG_DATABASE="studs"
LOCAL_SQL_FILE="test_data2.sql"

#ssh -p $SSH_PORT $SSH_USER@$REMOTE_SERVER "echo '$(cat $LOCAL_SQL_FILE)' | psql -h $PG_HOST -d $PG_DATABASE"


psql -h localhost -p 5432 -d lab4 -U konstantin -f $LOCAL_SQL_FILE
