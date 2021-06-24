-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Billings'
-- 
-- ---

DROP TABLE IF EXISTS `Billings`;

CREATE TABLE `Billings` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `issue_date` DATETIME NULL DEFAULT NULL,
  `account_number` INTEGER NULL DEFAULT NULL,
  `id_ConsultationDepartments` INTEGER NULL DEFAULT NULL,
  `id_Patients` INTEGER NULL DEFAULT NULL,
  `blling_period_start_date` INTEGER NULL DEFAULT NULL,
  `billing_period_end_date` DATETIME NULL DEFAULT NULL,
  `tax_included` INTEGER NULL DEFAULT NULL,
  `id_OutpatientHospitalizationClassification` INTEGER NULL DEFAULT NULL,
  `id_Terminals` INTEGER NULL DEFAULT NULL,
  `remark` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'BillingDetails'
-- 
-- ---

DROP TABLE IF EXISTS `BillingDetails`;

CREATE TABLE `BillingDetails` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Billings` INTEGER NULL DEFAULT NULL,
  `id_BillingContents` INTEGER NULL DEFAULT NULL,
  ` score` INTEGER NULL DEFAULT NULL,
  `insurance_price` INTEGER NULL DEFAULT NULL,
  `personal_expenses` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Patients'
-- 
-- ---

DROP TABLE IF EXISTS `Patients`;

CREATE TABLE `Patients` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `patients_number` INTEGER NULL DEFAULT NULL,
  `id_Insurances` INTEGER NULL DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'BillingContents'
-- 
-- ---

DROP TABLE IF EXISTS `BillingContents`;

CREATE TABLE `BillingContents` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `id_BillingCategories` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'BillingCategories'
-- 
-- ---

DROP TABLE IF EXISTS `BillingCategories`;

CREATE TABLE `BillingCategories` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Insurances'
-- 
-- ---

DROP TABLE IF EXISTS `Insurances`;

CREATE TABLE `Insurances` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `insurance_categories_name` VARCHAR NULL DEFAULT NULL,
  `contribution_rate` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ConsultationDepartments'
-- 
-- ---

DROP TABLE IF EXISTS `ConsultationDepartments`;

CREATE TABLE `ConsultationDepartments` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Terminals'
-- 
-- ---

DROP TABLE IF EXISTS `Terminals`;

CREATE TABLE `Terminals` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `terminal_number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'OutpatientHospitalizationClassification'
-- 
-- ---

DROP TABLE IF EXISTS `OutpatientHospitalizationClassification`;

CREATE TABLE `OutpatientHospitalizationClassification` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Billings` ADD FOREIGN KEY (id_ConsultationDepartments) REFERENCES `ConsultationDepartments` (`id`);
ALTER TABLE `Billings` ADD FOREIGN KEY (id_Patients) REFERENCES `Patients` (`id`);
ALTER TABLE `Billings` ADD FOREIGN KEY (id_OutpatientHospitalizationClassification) REFERENCES `OutpatientHospitalizationClassification` (`id`);
ALTER TABLE `Billings` ADD FOREIGN KEY (id_Terminals) REFERENCES `Terminals` (`id`);
ALTER TABLE `BillingDetails` ADD FOREIGN KEY (id_Billings) REFERENCES `Billings` (`id`);
ALTER TABLE `BillingDetails` ADD FOREIGN KEY (id_BillingContents) REFERENCES `BillingContents` (`id`);
ALTER TABLE `Patients` ADD FOREIGN KEY (id_Insurances) REFERENCES `Insurances` (`id`);
ALTER TABLE `BillingContents` ADD FOREIGN KEY (id_BillingCategories) REFERENCES `BillingCategories` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Billings` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `BillingDetails` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Patients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `BillingContents` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `BillingCategories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Insurances` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ConsultationDepartments` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Terminals` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `OutpatientHospitalizationClassification` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Billings` (`id`,`issue_date`,`account_number`,`id_ConsultationDepartments`,`id_Patients`,`blling_period_start_date`,`billing_period_end_date`,`tax_included`,`id_OutpatientHospitalizationClassification`,`id_Terminals`,`remark`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `BillingDetails` (`id`,`id_Billings`,`id_BillingContents`,` score`,`insurance_price`,`personal_expenses`) VALUES
-- ('','','','','','');
-- INSERT INTO `Patients` (`id`,`patients_number`,`id_Insurances`,`name`) VALUES
-- ('','','','');
-- INSERT INTO `BillingContents` (`id`,`name`,`id_BillingCategories`) VALUES
-- ('','','');
-- INSERT INTO `BillingCategories` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Insurances` (`id`,`insurance_categories_name`,`contribution_rate`) VALUES
-- ('','','');
-- INSERT INTO `ConsultationDepartments` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Terminals` (`id`,`terminal_number`) VALUES
-- ('','');
-- INSERT INTO `OutpatientHospitalizationClassification` (`id`,`name`) VALUES
-- ('','');