FROM sigurdz/centos:v1  
   
RUN yum install -y mysql-server mysql  
   
RUN /etc/init.d/mysqld start &&\  
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY '=puGLytWLEQks+7vi#6gkY';"&&\
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'127.0.0.1' IDENTIFIED BY '=puGLytWLEQks+7vi#6gkY';"&&\
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY '=puGLytWLEQks+7vi#6gkY';"&&\
	mysql -u root -e "FLUSH PRIVILEGES;"&&\
	
	mysql -u admin -p'=puGLytWLEQks+7vi#6gkY' -e "show databases;"  

RUN yum clean all

EXPOSE 3306  
   
CMD ["/usr/bin/mysqld_safe"]  

# docker rmi -f mysql_server
# docker rm -f mysqlserver
# docker build -t mysql_server .
# docker run --name=mysqlserver -d -p 3306:3306 mysql_server