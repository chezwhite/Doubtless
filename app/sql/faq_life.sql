-- MySQL Script generated by MySQL Workbench
-- 12/27/15 15:48:28
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema faq_life
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `faq_life` DEFAULT CHARACTER SET utf8 ;


-- -----------------------------------------------------
-- Users And Pivileges
-- -----------------------------------------------------
CREATE USER IF NOT EXISTS 'faq_life'@'localhost' identified by 'faqpass';
GRANT ALL PRIVILEGES ON faq_life.* TO 'faq_life'@'localhost' WITH GRANT OPTION;

USE `faq_life` ;

-- -----------------------------------------------------
-- Table `faq_life`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faq_life`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `foto` VARCHAR(50) NULL DEFAULT 'default.png',
  `idioma` VARCHAR(3) NULL DEFAULT 'spa',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `faq_life`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faq_life`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `faq_life`.`preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faq_life`.`preguntas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` LONGTEXT NOT NULL,
  `cuerpo` LONGTEXT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `visto` INT NULL DEFAULT 0,
  `respuestas` INT NULL DEFAULT 0,
  `positivos` INT NULL DEFAULT 0,
  `negativos` INT NULL DEFAULT 0,
  `usuarios_id` INT NOT NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_preguntas_usuarios_idx` (`usuarios_id` ASC),
  INDEX `fk_preguntas_categorias1_idx` (`categorias_id` ASC),
  CONSTRAINT `fk_preguntas_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `faq_life`.`usuarios` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_preguntas_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `faq_life`.`categorias` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `faq_life`.`respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faq_life`.`respuestas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuerpo_res` LONGTEXT NOT NULL,
  `fecha_res` DATETIME NOT NULL,
  `positivos` INT NOT NULL DEFAULT 0,
  `negativos` INT NOT NULL DEFAULT 0,
  `usuarios_id` INT NOT NULL,
  `preguntas_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_respuestas_preguntas1_idx` (`preguntas_id` ASC),
  CONSTRAINT `fk_respuestas_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `faq_life`.`usuarios` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_respuestas_preguntas`
    FOREIGN KEY (`preguntas_id`)
    REFERENCES `faq_life`.`preguntas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `faq_life`.`usuarios_has_respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faq_life`.`usuarios_has_respuestas` (
  `usuarios_id` INT NOT NULL,
  `respuestas_id` INT NOT NULL,
  `voto` CHAR NOT NULL,
  PRIMARY KEY (`usuarios_id`, `respuestas_id`),
  INDEX `fk_usuarios_has_respuestas_respuestas1_idx` (`respuestas_id` ASC),
  INDEX `fk_usuarios_has_respuestas_usuarios1_idx` (`usuarios_id` ASC),
  CONSTRAINT `fk_usuarios_has_respuestas_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `faq_life`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_respuestas_respuestas1`
    FOREIGN KEY (`respuestas_id`)
    REFERENCES `faq_life`.`respuestas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `faq_life`.`usuarios_has_preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `faq_life`.`usuarios_has_preguntas` (
  `usuarios_id` INT NOT NULL,
  `preguntas_id` INT UNSIGNED NOT NULL,
  `voto` CHAR NOT NULL,
  PRIMARY KEY (`usuarios_id`, `preguntas_id`),
  INDEX `fk_usuarios_has_preguntas_preguntas1_idx` (`preguntas_id` ASC),
  INDEX `fk_usuarios_has_preguntas_usuarios1_idx` (`usuarios_id` ASC),
  CONSTRAINT `fk_usuarios_has_preguntas_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `faq_life`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_preguntas_preguntas1`
    FOREIGN KEY (`preguntas_id`)
    REFERENCES `faq_life`.`preguntas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Other Options
-- -----------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Insert Data Into Tables
-- -----------------------------------------------------
INSERT INTO `usuarios` (`id`,`username`, `password`, `nombre`, `foto`, `idioma`) VALUES
(null, 'manolo', '$2a$10$OwSsRUbGDPwJwJ9kT9Mz..vT/w8fEqbRNVwXfKtqq7XSQufpQgSUO', 'Manolo Pérez', 'img_users/superman.jpg', 'spa'),
(null, 'juanito', '$2a$10$BJdR5.cvZrV9Y06qmMUNe..zJkHHM3T./WIhT1NxniKNjBBh7hWUq', 'Juan Sánchez', 'img_users/default.png', 'eng'),
(null, 'carlitos', '$2a$10$JlS1DEAdsVXIV8ieoWTp/.zKEiObYAw9BTBNL.kAVyXENpsKK86V2', 'Carlos Méndez', 'img_users/default.png', 'glg'),
(null, 'marco', '$2a$10$zSn4yxbFaLUv5HrBqNAUL.VBSzGdwOBuMHt4K6KF/7kDp1Z9c6Ghm', 'Marco Pérez', 'img_users/pluto_lengua.jpg', 'spa'),
(null, 'lucas', '$2a$10$4YTabU7ZcCIBxHVXZMJd8OUIM5/ASXJGmfPjJwmB9o5TLiTt8t.Zq', 'Lucas Rodriguez', 'img_users/pluto_posando.jpg', 'eng');

INSERT INTO `categorias` (`id`, `nombre_categoria`) VALUES
(null, 'Religion'),
(null, 'Electricidad'),
(null, 'Noticias');

INSERT INTO `preguntas` (`id`, `titulo`, `cuerpo`, `fecha`, `visto`, `respuestas`, `positivos`, `negativos`, `usuarios_id`, `categorias_id`) VALUES
(null, '¿Si satanas castiga a los malos, eso no lo hace ser bueno?', 'Pues los malos se van al infierno y satanas les da su merecido, eso no lo hace bueno?', '2015-10-22 10:20:00', 0, 2, 0, 0, 1, 1),
(null, '¿A dónde va la luz cuando le doy al interruptor?', 'Simpre que le doy al interruptor para apagar la luz me pregunto a donde va, porque cuando le vuelvo a dar se vuelve a encender inmediatamente. Se queda esperando?', '2015-10-18 11:30:00', 0, 0, 0, 0, 3, 2),
(null, 'Carlinhos Brown perseguirá a los morosos tocando el tambor', 'Tras expirar su contrato con el correccional de Guantánamo, el cantante y percusionista Carlinhos Brown ha creado la empresa “Pe pe pe pepepe pe pe SL”, que ofrece un servicio de cobro de morosos.
El artista brasileño perseguirá a los deudores bailando al ritmo de una samba y tocando el tambor constantemente, una actividad que el cerebro humano no puede soportar más de dos horas seguidas, según los expertos.', '2015-10-19 22:41:00', 0, 0, 0, 0, 3, 3);

INSERT INTO `respuestas` (`id`, `cuerpo_res`, `fecha_res`, `positivos`, `negativos`, `usuarios_id`, `preguntas_id`) VALUES
(null, 'yo siempre dije q satanas era un buen loco incomprendido por esta sociedad posmoderna', '2015-10-18 11:30:00', 0, 0, 4, 1),
(null, 'Tus premisas son acertadas pero como Satanas no existe eso no es valido', '2015-11-08 1:28:00', 0, 0, 5, 1);
