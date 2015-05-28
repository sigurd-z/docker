#!/bin/bash 

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin 
export PATH 

service php-fpm start

tail -F /dev/stdout