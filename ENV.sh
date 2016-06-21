#!/bin/bash
set -e
#if [ -z "MYSQLBSI" ]; then
    eval dbuser=\$BSI_${MYSQLBSI}_USERNAME
    eval dbpass=\$BSI_${MYSQLBSI}_PASSWORD
    eval hostname=\$BSI_${MYSQLBSI}_HOST 
    eval dbport=\$BSI_${MYSQLBSI}_PORT
    eval dbname=\$BSI_${MYSQLBSI}_NAME
    
    sed -i 's/#hostname#/'$hostname'/g' /usr/local/tomcat/webapps/SkyEyes/WEB-INF/classes/springmvc-servlet.xml
    sed -i 's/#dbuser#/'$dbuser'/g' /usr/local/tomcat/webapps/SkyEyes/WEB-INF/classes/springmvc-servlet.xml
    sed -i 's/#dbpass#/'$dbpass'/g' /usr/local/tomcat/webapps/SkyEyes/WEB-INF/classes/springmvc-servlet.xml
    sed -i 's/#dbport#/'$dbport'/g' /usr/local/tomcat/webapps/SkyEyes/WEB-INF/classes/springmvc-servlet.xml
    sed -i 's/#dbname#/'$dbname'/g' /usr/local/tomcat/webapps/SkyEyes/WEB-INF/classes/springmvc-servlet.xml
