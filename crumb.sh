crumb=$(curl -u "admin:admin" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
curl -u "admin:admin" -H "$crumb" -X POST http://jenkins.local:8080/job/ENV/build?delay=0
#curl -u "admin:admin" -H "$crumb" -X POST  http://jenkins.local:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-backup
