#!/bin/bash
mysql -u root -p < ./bpmspace_liam3_v1_create.sql
mysql -u bpmspace_liam3_v1 -p bpmspace_liam3_v1 < ./bpmspace_liam3_v1_structur.sql
mysql -u bpmspace_liam3_v1 -p bpmspace_liam3_v1 < ./bpmspace_liam3_v1_statemachine.sql
mysql -u bpmspace_liam3_v1 -p bpmspace_liam3_v1 < ./bpmspace_liam3_v1_min.sql 
mysql -u bpmspace_liam3_v1 -p bpmspace_liam3_v1 < ./bpmspace_liam3_v1_diff.sql