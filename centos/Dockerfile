FROM centos:centos6  

MAINTAINER sigurd <z1012726@gmail.com>

RUN yum -y install vim
RUN yum -y install wget
RUN yum -y install pcre pcre-devel
RUN yum -y install openssl*
RUN yum -y install tar
RUN yum -y install gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel mcrypt libmcrypt libmcrypt-devel mhash mhash-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers make gd gd2 gd-devel gd2-devel
RUN yum -y install svn git

RUN ulimit -SHn 65535

RUN yum clean all

EXPOSE 22 

CMD ["/bin/bash"]

# docker rmi -f server
# docker rm -f server
# docker build -t server .
# docker run -i -t -P -v /Users/sigurd/Project/docker/server/testdir:/data/testdir --name=servertest server_test