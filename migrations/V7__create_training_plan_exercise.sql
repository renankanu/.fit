CREATE TABLE IF NOT EXISTS `kn_fit_database`.`training_plan_exercise` (
  `training_plan_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `series` TINYINT NOT NULL,
  `repetitions` TINYINT NOT NULL,
  `rest_seconds` SMALLINT NULL DEFAULT 30,
  `comment` VARCHAR(124) NULL,
  PRIMARY KEY (`training_plan_id`, `exercise_id`),
  INDEX `fk_training_plan_has_exercise_exercise_idx` (`exercise_id` ASC) VISIBLE,
  INDEX `fk_training_plan_has_exercise_training_plan_idx` (`training_plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_training_plan_has_exercise_training_plan`
    FOREIGN KEY (`training_plan_id`)
    REFERENCES `kn_fit_database`.`training_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_training_plan_has_exercise_exercise`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `kn_fit_database`.`exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4