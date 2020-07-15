FROM tomcat


EXPOSE 8080
COPY  . /usr/local/tomcat/webapps
