FROM tomcat:8.0
ADD server.xml /usr/local/tomcat/conf/server.xml
ADD sample.war /usr/local/tomcat/webapps/sample.war
EXPOSE 9080