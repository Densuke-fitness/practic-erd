-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'ReceptionDetails'
-- 
-- ---

DROP TABLE IF EXISTS `ReceptionDetails`;

CREATE TABLE `ReceptionDetails` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `reception_date` TIMESTAMP NULL DEFAULT NULL,
  `id_Reception` INTEGER NULL DEFAULT NULL,
  `id_MedicalClinics` INTEGER NULL DEFAULT NULL,
  `id_ContentOfConsultation` INTEGER NULL DEFAULT NULL,
  `id_Doctors` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Reception'
-- 
-- ---

DROP TABLE IF EXISTS `Reception`;

CREATE TABLE `Reception` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `date` DATETIME NULL DEFAULT 'NOT NULL',
  `id_Patients` INTEGER NULL DEFAULT NULL,
  `id_Terminals` INTEGER NULL DEFAULT NULL,
  `account_number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Patients'
-- 
-- ---

DROP TABLE IF EXISTS `Patients`;

CREATE TABLE `Patients` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `ID` INTEGER NULL DEFAULT NULL,
  `birth` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'MedicalClinics'
-- 
-- ---

DROP TABLE IF EXISTS `MedicalClinics`;

CREATE TABLE `MedicalClinics` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ContentOfConsultation'
-- 
-- ---

DROP TABLE IF EXISTS `ContentOfConsultation`;

CREATE TABLE `ContentOfConsultation` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Doctors'
-- 
-- ---

DROP TABLE IF EXISTS `Doctors`;

CREATE TABLE `Doctors` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Terminals'
-- 
-- ---

DROP TABLE IF EXISTS `Terminals`;

CREATE TABLE `Terminals` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'MedicalDoctors'
-- 
-- ---

DROP TABLE IF EXISTS `MedicalDoctors`;

CREATE TABLE `MedicalDoctors` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_MedicalClinics` INTEGER NULL DEFAULT NULL,
  `id_Doctors` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'PossibleContentsOfConsultationByDepartment'
-- 
-- ---

DROP TABLE IF EXISTS `PossibleContentsOfConsultationByDepartment`;

CREATE TABLE `PossibleContentsOfConsultationByDepartment` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_MedicalClinics` INTEGER NULL DEFAULT NULL,
  `id_ContentOfConsultation` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `ReceptionDetails` ADD FOREIGN KEY (id_Reception) REFERENCES `Reception` (`id`);
ALTER TABLE `ReceptionDetails` ADD FOREIGN KEY (id_MedicalClinics) REFERENCES `MedicalClinics` (`id`);
ALTER TABLE `ReceptionDetails` ADD FOREIGN KEY (id_ContentOfConsultation) REFERENCES `ContentOfConsultation` (`id`);
ALTER TABLE `ReceptionDetails` ADD FOREIGN KEY (id_Doctors) REFERENCES `Doctors` (`id`);
ALTER TABLE `Reception` ADD FOREIGN KEY (id_Patients) REFERENCES `Patients` (`id`);
ALTER TABLE `Reception` ADD FOREIGN KEY (id_Terminals) REFERENCES `Terminals` (`id`);
ALTER TABLE `MedicalDoctors` ADD FOREIGN KEY (id_MedicalClinics) REFERENCES `MedicalClinics` (`id`);
ALTER TABLE `MedicalDoctors` ADD FOREIGN KEY (id_Doctors) REFERENCES `Doctors` (`id`);
ALTER TABLE `PossibleContentsOfConsultationByDepartment` ADD FOREIGN KEY (id_MedicalClinics) REFERENCES `MedicalClinics` (`id`);
ALTER TABLE `PossibleContentsOfConsultationByDepartment` ADD FOREIGN KEY (id_ContentOfConsultation) REFERENCES `ContentOfConsultation` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `ReceptionDetails` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reception` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Patients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `MedicalClinics` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ContentOfConsultation` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Doctors` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Terminals` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `MedicalDoctors` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `PossibleContentsOfConsultationByDepartment` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `ReceptionDetails` (`id`,`reception_date`,`id_Reception`,`id_MedicalClinics`,`id_ContentOfConsultation`,`id_Doctors`) VALUES
-- ('','','','','','');
-- INSERT INTO `Reception` (`id`,`date`,`id_Patients`,`id_Terminals`,`account_number`) VALUES
-- ('','','','','');
-- INSERT INTO `Patients` (`id`,`name`,`ID`,`birth`) VALUES
-- ('','','','');
-- INSERT INTO `MedicalClinics` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `ContentOfConsultation` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Doctors` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Terminals` (`id`,`number`) VALUES
-- ('','');
-- INSERT INTO `MedicalDoctors` (`id`,`id_MedicalClinics`,`id_Doctors`) VALUES
-- ('','','');
-- INSERT INTO `PossibleContentsOfConsultationByDepartment` (`id`,`id_MedicalClinics`,`id_ContentOfConsultation`) VALUES
-- ('','','');