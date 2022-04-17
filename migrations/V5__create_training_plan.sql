CREATE TABLE IF NOT EXISTS `kn_fit_database`.`training_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT UNSIGNED NOT NULL,
  `division` ENUM('A', 'AB', 'ABC', 'ABCD', 'ABCDE', 'ABCDEF') NOT NULL DEFAULT 'A',
  `pre_training` VARCHAR(45) NULL,
  `pos_training` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_training_plan_student_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_training_plan_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `kn_fit_database`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4