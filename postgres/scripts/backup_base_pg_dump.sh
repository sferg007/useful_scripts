#!/bin/sh
PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

PGPASSWORD=$(cat /home/ibtorgadmin/.secret_pass.txt | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:'password_for_openssl')
export PGPASSWORD
pathB=backup_path
pathLOG=log_path
dbUser=postgres

find $pathB -type f -mtime +31 -delete

for dbname in `echo "SELECT datname FROM pg_database;" | psql -U $dbUser -t | egrep -v 'template0|template1|postgres'`;
do pg_dump -U $dbUser $dbname | gzip > $pathB/$dbname-$(date "+%Y-%m-%d").sql.gz
done;
