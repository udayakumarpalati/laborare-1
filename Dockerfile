FROM centos
RUN yum install java -y
ADD http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.8/bin/apache-tomcat-9.0.8.tar.gz /tmp/apache-tomcat-9.0.8.tar.gz
RUN mkdir /tomcat
RUN cd /tomcat && tar -xf /tmp/apache-tomcat-9.0.8.tar.gz && mv apache-tomcat-9.0.8 app1
RUN rm -f apache-tomcat-9.0.8.tar.gz
ADD https://github.com/carreerit/cogito/raw/master/appstack/mysql-connector-java-5.1.40.jar /tomcat/app1/lib/mysql-connector-java-5.1.40.jar
ADD https://github.com/carreerit/cogito/raw/master/appstack/student.war /tomcat/app1/lib/student.war
EXPOSE 8080
EXPOSE 8009
CMD nohup /tomcat/app1/bin/catalina.sh run
