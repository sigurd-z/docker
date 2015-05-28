FROM sigurdz/centos:v1

MAINTAINER sigurd <z1012726@gmail.com>

ADD ./init.d/          /data/
ADD ./www              /data/www
ADD ./conf             /etc/conf

ADD ./bootstrap.sh     /opt/

# normal
RUN mkdir -p /data/tgz &&\ 
    mkdir -p /data/logs/nginx &&\ 
    cd /data/tgz

#RUN /usr/sbin/groupadd nginx &&\ 
#    /usr/sbin/useradd -g nginx nginx &&\ 
#
#    chown -R nginx:nginx /data/www &&\ 
#    chown -R nginx:nginx /data/logs &&\ 
#    chmod -R 755 /data/www &&\ 
#    chmod -R 777 /data/logs &&\ 

RUN yum install -y mysql  

# nginx
RUN wget -c http://nginx.org/download/nginx-1.8.0.tar.gz &&\ 
    tar zxvf nginx-1.8.0.tar.gz &&\ 
    cd nginx-1.8.0 &&\ 
    
	./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre --with-http_realip_module --with-http_image_filter_module &&\ 
    make && make install &&\ 
    
	mv /data/nginx /etc/init.d/nginx &&\ 
    chown root:root /etc/init.d/nginx &&\ 
    chmod +x /etc/init.d/nginx &&\ 
    chkconfig --level 2345 nginx on &&\ 

    echo "<p>hello</p>" > /data/www/index.html &&\ 
    echo "<?php \n    phpinfo();" > /data/www/phpinfo.php &&\ 
    echo " " > /data/logs/nginx/access.log &&\ 
    echo " " > /data/logs/nginx/error.log &&\ 
    ln -sf /data/logs/nginx/access.log /dev/stdout  &&\ 
    ln -sf /data/logs/nginx/error.log  /dev/stderr 

# php libs
RUN wget -c --content-disposition "http://downloads.sourceforge.net/mcrypt/libmcrypt-2.5.8.tar.gz?big_mirror=0" &&\ 
    tar zxvf libmcrypt-2.5.8.tar.gz &&\ 
    cd libmcrypt-2.5.8/ &&\ 
	
    ./configure --prefix=/usr/lib &&\ 
    make && make install &&\ 
    cd libltdl/ &&\ 
    ./configure --prefix=/usr/lib --enable-ltdl-install &&\ 
    make && make install &&\ 
    cd ../../ &&\ 

    echo "/usr/lib/lib" >> /etc/ld.so.conf &&\ 
    ldconfig &&\ 

    wget -c --content-disposition http://cn2.php.net/get/php-5.6.4.tar.gz/from/this/mirror &&\ 
    tar zxvf php-5.6.4.tar.gz &&\ 
    cd php-5.6.4/ &&\ 
	
    ./configure --prefix=/usr/local/php --with-config-file-path=/etc/conf --with-iconv-dir --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-fpm --enable-mbstring --with-mcrypt=/usr/lib --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --enable-opcache --with-pdo-mysql --with-mysql --with-mysqli --enable-maintainer-zts &&\ 
    make && make install &&\ 
    cd ../ &&\ 

    wget -c http://pecl.php.net/get/memcache-2.2.7.tgz &&\ 
    tar zxvf memcache-2.2.7.tgz &&\ 
    cd memcache-2.2.7/ &&\ 
    /usr/local/php/bin/phpize &&\ 

    ./configure --with-php-config=/usr/local/php/bin/php-config &&\ 
    make && make install &&\
    cd ../ &&\ 

    mv /data/php-fpm /etc/init.d/php-fpm &&\ 
    chown root:root /etc/init.d/php-fpm &&\ 
    chmod +x /etc/init.d/php-fpm &&\ 
    chkconfig --level 2345 php-fpm on &&\ 

    rm -rf /data/tgz &&\ 
    yum clean all &&\ 
    rm -f /data/install_nginx.sh /data/install_php.sh

# start server
RUN /etc/init.d/nginx start &&\ 
    /etc/init.d/php-fpm start


EXPOSE 8080  

VOLUME ["/etc/conf", "/data/www", "/data/logs"]

#CMD ["/usr/local/nginx/sbin/nginx", "-c", "/etc/conf/nginx.conf"]
CMD ["/opt/bootstrap.sh"]

# docker rmi -f web_server
# docker rm -f webserver
# docker build -t web_server .

# 创建容器
## docker run --name webserver_files sigurdz/web_server:v1 /bin/bash 

# 文件系统挂载
## docker run --name webserver -p 8080:8080 -d -v {BuildDir}/www:/data/www -v {BuildDir}/conf:/etc/conf -v {BuildDir}/logs:/data/logs sigurdz/web_server:v1
## docker run --name webserver -p 8080:8080 -d -v ~/Project/www:/data/www -v ~/Project/logs:/data/logs sigurdz/web_server:v1
# 容器挂载
## docker run --name webserver -p 8080:8080 -d -v {BuildDir}:/data/tmp --volumes-from webserver_files -v ~/Project/git:/data/vol sigurdz/web_server:v1
# 
## docker exec -t -i webserver /bin/bash
# rsync -avPh