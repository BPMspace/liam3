#!/bin/bash
mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_structure.sql
mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_statemachine.sql
mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_min.sql 
mysql -u root -p$DB_ROOT_PASSWORD -h $DB_HOST $DB_NAME < /var/www/html/sqldump/bpmspace_liam3_v1_diff.sql
