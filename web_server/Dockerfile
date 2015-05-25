FROM sigurdz/centos:v1

MAINTAINER sigurd <z1012726@gmail.com>

ADD ./install_nginx.sh /data/
ADD ./install_php.sh   /data/
ADD ./init.d/          /data/
ADD ./www              /data/www
ADD ./conf             /etc/conf

ADD ./bootstrap.sh     /opt/

RUN mkdir -p /data/logs/nginx

RUN /usr/sbin/groupadd nginx
RUN /usr/sbin/useradd -g nginx nginx

RUN chown -R nginx:nginx /data/www
#RUN chown -R nginx:nginx /data/logs
RUN chmod -R 755 /data/www
RUN chmod -R 755 /data/logs

RUN bash /data/install_nginx.sh
RUN bash /data/install_php.sh

RUN yum clean all

EXPOSE 8080  

VOLUME ["/etc/conf", "/data/www", "/data/logs"]

#CMD ["/usr/local/nginx/sbin/nginx", "-c", "/etc/conf/nginx.conf"]
CMD ["/opt/bootstrap.sh"]

# docker rmi -f web_server
# docker rm -f webserver
# docker build -t web_server .

# docker run --name sigurdz/webserver_files:v1 web_server /bin/bash 

# 文件系统挂载
## docker run --name webserver -p 8080:8080 -d -v /Users/sigurd/Project/docker/web_server/www:/data/www sigurdz/web_server:v1
# 容器挂载
## docker run --name webserver -p 8080:8080 -d --volumes-from webserver_files sigurdz/web_server:v1
# 
## docker exec -t -i webserver /bin/bash