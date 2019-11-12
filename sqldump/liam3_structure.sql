-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'liam3_user'
-- 
-- ---

DROP TABLE IF EXISTS `liam3_user`;
		
CREATE TABLE `liam3_user` (
  `liam3_User_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam3_User_firstname` VARCHAR(60) NULL DEFAULT NULL,
  `liam3_User_lastname` VARCHAR(60) NULL DEFAULT NULL,
  `liam3_User_password` MEDIUMTEXT NULL DEFAULT NULL,
  `liam3_User_salt` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`liam3_User_id`)
);

-- ---
-- Table 'liam3_user_email'
-- 
-- ---

DROP TABLE IF EXISTS `liam3_user_email`;
		
CREATE TABLE `liam3_user_email` (
  `liam3_User_email_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam3_User_id_fk_164887` BIGINT(20) NOT NULL,
  `liam3_email_id_fk_396224` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`liam3_User_email_id`),
KEY (`liam3_email_id_fk_396224`),
KEY (`liam3_User_id_fk_164887`)
);

-- ---
-- Table 'liam3_email'
-- 
-- ---

DROP TABLE IF EXISTS `liam3_email`;
		
CREATE TABLE `liam3_email` (
  `liam3_email_id` INT(11) NOT NULL AUTO_INCREMENT,
  `liam3_email_text` VARCHAR(254) NULL DEFAULT NULL,
  PRIMARY KEY (`liam3_email_id`)
);

-- ---
-- Table 'liam3_user_loginattempt'
-- 
-- ---

DROP TABLE IF EXISTS `liam3_user_loginattempt`;
		
CREATE TABLE `liam3_user_loginattempt` (
  `liam3_User_LoginAttempt_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam3_User_id_fk_955788` BIGINT(20) NOT NULL,
  `liam3_LoginAttempts_id_fk_234561` BIGINT(20) NOT NULL,
KEY (`liam3_User_id_fk_955788`),
  PRIMARY KEY (`liam3_User_LoginAttempt_id`),
KEY (`liam3_LoginAttempts_id_fk_234561`)
);

-- ---
-- Table 'liam3_loginattempts'
-- 
-- ---

DROP TABLE IF EXISTS `liam3_loginattempts`;
		
CREATE TABLE `liam3_loginattempts` (
  `liam3_LoginAttempts_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam3_LoginAttempts_time` DATETIME NULL DEFAULT NULL,
  `liam3_LoginAttempts_info` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`liam3_LoginAttempts_id`)
);


-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `liam3_user_email` ADD FOREIGN KEY (liam3_User_id_fk_164887) REFERENCES `liam3_user` (`liam3_User_id`);
ALTER TABLE `liam3_user_email` ADD FOREIGN KEY (liam3_email_id_fk_396224) REFERENCES `liam3_email` (`liam3_email_id`);
ALTER TABLE `liam3_user_loginattempt` ADD FOREIGN KEY (liam3_User_id_fk_955788) REFERENCES `liam3_user` (`liam3_User_id`);
ALTER TABLE `liam3_user_loginattempt` ADD FOREIGN KEY (liam3_LoginAttempts_id_fk_234561) REFERENCES `liam3_loginattempts` (`liam3_LoginAttempts_id`);

