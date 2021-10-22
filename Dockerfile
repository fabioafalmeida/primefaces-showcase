FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install openjdk-7-jre-headless curl
RUN mkdir -p /usr/share/tomcat
RUN curl https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz | tar zxf - --strip=1 -C /usr/share/tomcat/
RUN sudo apt-get install wget
RUN wget https://repository.primefaces.org/org/primefaces/showcase/5.3/showcase-5.3.war -P /usr/share/tomcat/webapps --no-check-certificate

CMD ["/usr/bin/java","-Djava.util.logging.config.file=/usr/share/tomcat/conf/logging.properties","-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager","-Djava.endorsed.dirs=/usr/share/tomcat/endorsed","-classpath","/usr/sh$

EXPOSE 8080