#!/bin/sh
mysql -u root -ppassword -e "drop database test; create database test;"

if screen -ls | grep -q "test-sc"; then
    screen -X -S test-sc quit
fi

today=$(date +"%m_%d_%Y")
screen -dm -S test-sc -L -Logfile ./deploy-logs/run-$today.log ./deploy.sh
