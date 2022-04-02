CREATE TABLE IF NOT EXISTS `kn_fit_database`.`personal_training` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(70) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` CHAR(64) NOT NULL,
  `cref_type_id` INT UNSIGNED NOT NULL,
  `cref_number` TINYINT NOT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_personal_training_cref_type_idx` (`cref_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_personal_training_cref_type`
    FOREIGN KEY (`cref_type_id`)
    REFERENCES `kn_fit_database`.`cref_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;