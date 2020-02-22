#!/bin/bash
mysql -u $DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME < ./bpmspace_liam3_v1_structure.sql
mysql -u $DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME < ./bpmspace_liam3_v1_statemachine.sql
mysql -u $DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME < ./bpmspace_liam3_v1_min.sql 
mysql -u $DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME < ./bpmspace_liam3_v1_diff.sql
