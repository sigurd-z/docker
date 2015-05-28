FROM sigurdz/centos:v1

MAINTAINER sigurd <z1012726@gmail.com>

VOLUME ["/etc/conf", "/data/www", "/data/logs"]

ADD ./install.sh       /data/
ADD ./init.d/          /data/
ADD ./www              /data/www
ADD ./conf             /etc/conf

ADD ./bootstrap.sh     /opt/

#RUN /usr/sbin/groupadd nginx
#RUN /usr/sbin/useradd -g nginx nginx
#
#RUN chown -R nginx:nginx /data/www
#RUN chown -R nginx:nginx /data/logs

RUN bash /data/install.sh

RUN yum clean all

EXPOSE 8080  

CMD ["/opt/bootstrap.sh"]

# docker rmi -f nginx
# docker rm -f nginx
# docker build -t nginx .

# 创建容器
## docker run --name webfiles sigurdz/centos:v1 /bin/bash 

# 容器挂载
## docker run --name nginx -p 8080:8080 --link php:php -d --volumes-from webfiles -v ~/data:/data/data sigurdz/nginx:v1

## docker exec -t -i nginx /bin/bash