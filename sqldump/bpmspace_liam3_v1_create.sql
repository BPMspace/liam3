CREATE DATABASE bpmspace_liam3_v1;
CREATE USER 'bpmspace_liam3_v1'@'localhost' IDENTIFIED BY 'password';
GRANT CREATE, INSERT , SELECT , UPDATE ON bpmspace_liam3_v1.* TO 'bpmspace_liam3_v1'@'localhost';
FLUSH PRIVILEGES;
USE bpmspace_liam3_v1;
