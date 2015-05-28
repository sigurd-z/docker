FROM sigurdz/centos:v1

MAINTAINER sigurd <z1012726@gmail.com>

VOLUME ["/etc/conf", "/data/logs"]

ADD ./install.sh       /data/
ADD ./init.d/          /data/
ADD ./conf             /etc/conf

ADD ./bootstrap.sh     /opt/

RUN bash /data/install.sh

RUN yum clean all

EXPOSE 9000  

CMD ["/opt/bootstrap.sh"]

# docker rmi -f php
# docker rm -f php
# docker build -t php .

# 创建容器
## docker run -t -i ~/data:/data/data --name webfiles sigurdz/centos:v1 /bin/bash 

# 容器挂载
## docker run --name php -p 9000:9000 -d --volumes-from webfiles -v ~/data:/data/data sigurdz/php:v1

## docker exec -t -i php /bin/bash