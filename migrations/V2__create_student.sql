CREATE TABLE IF NOT EXISTS `kn_fit_database`.`student` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `avatar` VARCHAR(100) NULL,
  `full_name` VARCHAR(70) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `called_by` VARCHAR(70) NULL DEFAULT NULL,
  `gender` ENUM('female', 'male', 'other') NOT NULL,
  `password` CHAR(64) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personal_training_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `personal_training_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_student_personal_training_idx` (`personal_training_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_personal_training`
    FOREIGN KEY (`personal_training_id`)
    REFERENCES `kn_fit_database`.`personal_training` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci