#!/bin/bash 

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin 
export PATH 

echo "" 
echo "the start ssh command is 'docker run -d -p 8080:8080 --name webserver web_server /opt/bootstrap.sh'" 
echo "" 

# nginx start 
service php-fpm start
service nginx start

tail -F /dev/stdout