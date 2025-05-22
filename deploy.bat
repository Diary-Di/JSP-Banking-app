@echo off
echo Building and Redeploying the project...
mvn clean package tomcat7:redeploy
pause
