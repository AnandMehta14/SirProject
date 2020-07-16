FROM tomcat


EXPOSE 8080
COPY  /var/lib/jenkins/workspace/My_Project1/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps
