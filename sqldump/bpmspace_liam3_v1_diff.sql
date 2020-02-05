ALTER TABLE `liam3`.`role_user` 
ADD INDEX `role_user_user_idx` (`user_id` ASC);
ALTER TABLE `liam3`.`role_user` 
ADD CONSTRAINT `role_user_user`
  FOREIGN KEY (`user_id`)
  REFERENCES `liam3`.`liam3_user` (`liam3_User_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `liam3_user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam3_user_email` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam3_email` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam3_user_loginattempt` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam3_loginattempts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `liam3_user` (`liam3_User_id`,`liam3_User_firstname`,`liam3_User_lastname`,`liam3_User_password`,`liam3_User_salt`) VALUES
-- ('','','','','');
-- INSERT INTO `liam3_user_email` (`liam3_User_email_id`,`liam3_User_id_fk_164887`,`liam3_email_id_fk_396224`) VALUES
-- ('','','');
-- INSERT INTO `liam3_email` (`liam3_email_id`,`liam3_email_text`) VALUES
-- ('','');
-- INSERT INTO `liam3_user_loginattempt` (`liam3_User_LoginAttempt_id`,`liam3_User_id_fk_955788`,`liam3_LoginAttempts_id_fk_234561`) VALUES
-- ('','','');
-- INSERT INTO `liam3_loginattempts` (`liam3_LoginAttempts_id`,`liam3_LoginAttempts_time`,`liam3_LoginAttempts_info`) VALUES
-- ('','','');