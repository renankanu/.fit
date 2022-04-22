CREATE TABLE IF NOT EXISTS `kn_fit_database`.`exercise` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `muscle_group_id` INT NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `description` VARCHAR(60) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
  `image_url` VARCHAR(124) NULL,
  `video_url` VARCHAR(124) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_exercise_muscle_group_idx` (`muscle_group_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_muscle_group`
    FOREIGN KEY (`muscle_group_id`)
    REFERENCES `kn_fit_database`.`muscle_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4