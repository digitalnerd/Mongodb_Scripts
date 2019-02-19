#!/usr/bin/env bash

# Import usages to Mongodb

MONGOIMPORT=$(whereis -b mongoimport | cut -d ' ' -f2)

set -e

read -p 'Master Host: ' masterhost
read -p 'User: ' username
read -sp 'Password: ' mongopass
echo
read -p 'DB: ' db
read -p 'Collection: ' collection
read -p 'File: ' file

for i in {1..9}
do
  $MONGOIMPORT --host $masterhost --port 8635 --username $username --password $mongopass --authenticationDatabase admin -d ${db}_db_test-0${i} -c ${collection} --file ${file}.json
done
