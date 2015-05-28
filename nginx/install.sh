# normal
mkdir -p /data/tgz
mkdir -p /data/logs/nginx
cd /data/tgz

# nginx

wget -c http://nginx.org/download/nginx-1.8.0.tar.gz
tar zxvf nginx-1.8.0.tar.gz
cd nginx-1.8.0
./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre --with-http_realip_module --with-http_image_filter_module
make && make install

mv /data/nginx /etc/init.d/nginx
chown root:root /etc/init.d/nginx
chmod +x /etc/init.d/nginx

chkconfig --level 2345 nginx on

echo " " > /data/logs/nginx/access.log
echo " " > /data/logs/nginx/error.log

ln -sf /data/logs/nginx/access.log /dev/stdout 
ln -sf /data/logs/nginx/error.log  /dev/stderr 

rm -rf /data/tgz