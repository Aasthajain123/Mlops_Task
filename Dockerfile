FROM centos:latest

RUN yum install -y java-11-openjdk.x86_64 \
			net-tools 	\
			git 	\
			wget


RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

RUN yum install -y jenkins

RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz



RUN tar -xvzf apache-tomcat-9.0.46.tar.gz

# apache configurations 

COPY ./server.xml  /apache-tomcat-9.0.46/conf/
COPY ./ho_context.xml /apache-tomcat-9.0.46/webapps/host-manager/META-INF/context.xml
COPY ./context.xml /apache-tomcat-9.0.46/webapps/manager/META-INF/context.xml
COPY ./tomcat-users.xml /apache-tomcat-9.0.46/conf/

COPY ./myscript.sh  /script.sh

RUN chmod +x /script.sh 

CMD ["./script.sh"]

EXPOSE 8080
EXPOSE 8081
