# php libs
mkdir -p /data/tgz
mkdir -p /etc/conf
cd /data/tgz

wget -c --content-disposition "http://downloads.sourceforge.net/mcrypt/libmcrypt-2.5.8.tar.gz?big_mirror=0"
tar zxvf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8/
./configure --prefix=/usr/lib
make && make install
cd libltdl/
./configure --prefix=/usr/lib --enable-ltdl-install
make && make install
cd ../../

echo "/usr/lib/lib" >> /etc/ld.so.conf
ldconfig

# php
wget -c --content-disposition http://cn2.php.net/get/php-5.6.4.tar.gz/from/this/mirror
tar zxvf php-5.6.4.tar.gz
cd php-5.6.4/
./configure --prefix=/usr/local/php --with-config-file-path=/etc/conf --with-iconv-dir --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-fpm --enable-mbstring --with-mcrypt=/usr/lib --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --enable-opcache --with-pdo-mysql --enable-maintainer-zts
make && make install
cd ../

wget -c http://pecl.php.net/get/memcache-2.2.7.tgz
tar zxvf memcache-2.2.7.tgz
cd memcache-2.2.7/
/usr/local/php/bin/phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install

# echo "extension_dir=\"/usr/local/php/lib/php/extensions/no-debug-zts-20131226/\"" >> /etc/conf/php.ini
# echo "extension=memcache.so" >> /etc/conf/php.ini

mv /data/php-fpm /etc/init.d/php-fpm
chown root:root /etc/init.d/php-fpm
chmod +x /etc/init.d/php-fpm

chkconfig --level 2345 php-fpm on

rm -rf /data/tgz