-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Patients'
-- 
-- ---

DROP TABLE IF EXISTS `Patients`;

CREATE TABLE `Patients` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `patient_number` INTEGER NULL DEFAULT NULL,
  `ID` VARCHAR NULL DEFAULT NULL,
  `birth` DATETIME NULL DEFAULT NULL,
  `id_Insurances` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Insurances'
-- 
-- ---

DROP TABLE IF EXISTS `Insurances`;

CREATE TABLE `Insurances` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Insurance_category` VARCHAR NULL DEFAULT NULL,
  `insurance_contribution` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Receptions'
-- 
-- ---

DROP TABLE IF EXISTS `Receptions`;

CREATE TABLE `Receptions` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `reception_datetime` DATETIME NULL DEFAULT NULL,
  `id_Patients` INTEGER NULL DEFAULT NULL,
  `id_ReceptionTerminals` INTEGER NULL DEFAULT NULL,
  `account_number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Requests'
-- 
-- ---

DROP TABLE IF EXISTS `Requests`;

CREATE TABLE `Requests` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `issue_date` DATETIME NULL DEFAULT NULL,
  `account_number` INTEGER NULL DEFAULT NULL,
  `id_ConsultationDepartments` INTEGER NULL DEFAULT NULL,
  `billing_period_start_date` DATETIME NULL DEFAULT NULL,
  `billing_period_end_date` DATETIME NULL DEFAULT NULL,
  `tax_included` INTEGER NULL DEFAULT NULL,
  `id_OutpatientHospitalizationClassifications` INTEGER NULL DEFAULT NULL,
  `id_PaymentTerminals` INTEGER NULL DEFAULT NULL,
  `remarks` VARCHAR NULL DEFAULT NULL,
  `id_Patients` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ReceptionTerminals'
-- 
-- ---

DROP TABLE IF EXISTS `ReceptionTerminals`;

CREATE TABLE `ReceptionTerminals` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `number` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ReceptionsDetails'
-- 
-- ---

DROP TABLE IF EXISTS `ReceptionsDetails`;

CREATE TABLE `ReceptionsDetails` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `consultation_time` DATETIME NULL DEFAULT NULL,
  `id_Receptions` INTEGER NULL DEFAULT NULL,
  `id_ConsultationDepartments` INTEGER NULL DEFAULT NULL,
  `id_MedicalExaminationDetails` INTEGER NULL DEFAULT NULL,
  `id_Doctors` INTEGER NULL DEFAULT NULL,
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
-- Table 'ConsultationDepartments'
-- 
-- ---

DROP TABLE IF EXISTS `ConsultationDepartments`;

CREATE TABLE `ConsultationDepartments` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'MedicalExaminations'
-- 
-- ---

DROP TABLE IF EXISTS `MedicalExaminations`;

CREATE TABLE `MedicalExaminations` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'OutpatientHospitalizationClassifications'
-- 
-- ---

DROP TABLE IF EXISTS `OutpatientHospitalizationClassifications`;

CREATE TABLE `OutpatientHospitalizationClassifications` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'PaymentTerminals'
-- 
-- ---

DROP TABLE IF EXISTS `PaymentTerminals`;

CREATE TABLE `PaymentTerminals` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'RequestsDetails'
-- 
-- ---

DROP TABLE IF EXISTS `RequestsDetails`;

CREATE TABLE `RequestsDetails` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Requests` INTEGER NULL DEFAULT NULL,
  `id_MedicalExaminationDetails` INTEGER NULL DEFAULT NULL,
  `score` INTEGER NULL DEFAULT NULL,
  `insurance_price` INTEGER NULL DEFAULT NULL,
  `personal_expenses` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'MedicalExaminationDetails'
-- 
-- ---

DROP TABLE IF EXISTS `MedicalExaminationDetails`;

CREATE TABLE `MedicalExaminationDetails` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_MedicalExaminations` INTEGER NULL DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `id_ClassificationOfExaminations` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ClassificationOfExaminations'
-- 
-- ---

DROP TABLE IF EXISTS `ClassificationOfExaminations`;

CREATE TABLE `ClassificationOfExaminations` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Patients` ADD FOREIGN KEY (id_Insurances) REFERENCES `Insurances` (`id`);
ALTER TABLE `Receptions` ADD FOREIGN KEY (id_Patients) REFERENCES `Patients` (`id`);
ALTER TABLE `Receptions` ADD FOREIGN KEY (id_ReceptionTerminals) REFERENCES `ReceptionTerminals` (`id`);
ALTER TABLE `Requests` ADD FOREIGN KEY (id_ConsultationDepartments) REFERENCES `ConsultationDepartments` (`id`);
ALTER TABLE `Requests` ADD FOREIGN KEY (id_OutpatientHospitalizationClassifications) REFERENCES `OutpatientHospitalizationClassifications` (`id`);
ALTER TABLE `Requests` ADD FOREIGN KEY (id_PaymentTerminals) REFERENCES `PaymentTerminals` (`id`);
ALTER TABLE `Requests` ADD FOREIGN KEY (id_Patients) REFERENCES `Patients` (`id`);
ALTER TABLE `ReceptionsDetails` ADD FOREIGN KEY (id_Receptions) REFERENCES `Receptions` (`id`);
ALTER TABLE `ReceptionsDetails` ADD FOREIGN KEY (id_ConsultationDepartments) REFERENCES `ConsultationDepartments` (`id`);
ALTER TABLE `ReceptionsDetails` ADD FOREIGN KEY (id_MedicalExaminationDetails) REFERENCES `MedicalExaminations` (`id`);
ALTER TABLE `ReceptionsDetails` ADD FOREIGN KEY (id_Doctors) REFERENCES `Doctors` (`id`);
ALTER TABLE `RequestsDetails` ADD FOREIGN KEY (id_Requests) REFERENCES `Requests` (`id`);
ALTER TABLE `RequestsDetails` ADD FOREIGN KEY (id_MedicalExaminationDetails) REFERENCES `MedicalExaminationDetails` (`id`);
ALTER TABLE `MedicalExaminationDetails` ADD FOREIGN KEY (id_MedicalExaminations) REFERENCES `MedicalExaminations` (`id`);
ALTER TABLE `MedicalExaminationDetails` ADD FOREIGN KEY (id_ClassificationOfExaminations) REFERENCES `ClassificationOfExaminations` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Patients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Insurances` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Receptions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Requests` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ReceptionTerminals` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ReceptionsDetails` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Doctors` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ConsultationDepartments` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `MedicalExaminations` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `OutpatientHospitalizationClassifications` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `PaymentTerminals` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `RequestsDetails` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `MedicalExaminationDetails` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ClassificationOfExaminations` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Patients` (`id`,`patient_number`,`ID`,`birth`,`id_Insurances`) VALUES
-- ('','','','','');
-- INSERT INTO `Insurances` (`id`,`Insurance_category`,`insurance_contribution`) VALUES
-- ('','','');
-- INSERT INTO `Receptions` (`id`,`reception_datetime`,`id_Patients`,`id_ReceptionTerminals`,`account_number`) VALUES
-- ('','','','','');
-- INSERT INTO `Requests` (`id`,`issue_date`,`account_number`,`id_ConsultationDepartments`,`billing_period_start_date`,`billing_period_end_date`,`tax_included`,`id_OutpatientHospitalizationClassifications`,`id_PaymentTerminals`,`remarks`,`id_Patients`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `ReceptionTerminals` (`id`,`number`) VALUES
-- ('','');
-- INSERT INTO `ReceptionsDetails` (`id`,`consultation_time`,`id_Receptions`,`id_ConsultationDepartments`,`id_MedicalExaminationDetails`,`id_Doctors`) VALUES
-- ('','','','','','');
-- INSERT INTO `Doctors` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `ConsultationDepartments` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `MedicalExaminations` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `OutpatientHospitalizationClassifications` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `PaymentTerminals` (`id`,`number`) VALUES
-- ('','');
-- INSERT INTO `RequestsDetails` (`id`,`id_Requests`,`id_MedicalExaminationDetails`,`score`,`insurance_price`,`personal_expenses`) VALUES
-- ('','','','','','');
-- INSERT INTO `MedicalExaminationDetails` (`id`,`id_MedicalExaminations`,`name`,`id_ClassificationOfExaminations`) VALUES
-- ('','','','');
-- INSERT INTO `ClassificationOfExaminations` (`id`,`name`) VALUES
-- ('','');