#!/bin/bash
for i in {1..50}
do
# check if db is up 
mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME -e "use bpmspace_liam3-v1;"
	if [ $? -eq 0 ]
	then
		mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_structure.sql
		mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_statemachine.sql
		mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_min.sql 
		mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_diff.sql
	  exit 0
	else
		sleep 5
	fi
done
echo "Failure: Could not connect to $DB_HOST $DB_NAME" >&2
exit 1
