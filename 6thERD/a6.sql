-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'InspectionsOfAMeter'
-- 
-- ---

DROP TABLE IF EXISTS `InspectionsOfAMeter`;

CREATE TABLE `InspectionsOfAMeter` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Clients` INTEGER NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `indicator_number` INTEGER NULL DEFAULT NULL,
  `id_ActingManagers` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Clients'
-- 
-- ---

DROP TABLE IF EXISTS `Clients`;

CREATE TABLE `Clients` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'BusinessAgents'
-- 
-- ---

DROP TABLE IF EXISTS `BusinessAgents`;

CREATE TABLE `BusinessAgents` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ActingManagers'
-- 
-- ---

DROP TABLE IF EXISTS `ActingManagers`;

CREATE TABLE `ActingManagers` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_BusinessAgents` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'PriceLists'
-- 
-- ---

DROP TABLE IF EXISTS `PriceLists`;

CREATE TABLE `PriceLists` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `min_use` INTEGER NULL DEFAULT NULL,
  `max_use` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'UnitCharges'
-- 
-- ---

DROP TABLE IF EXISTS `UnitCharges`;

CREATE TABLE `UnitCharges` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `applicable_years_and_months` DATETIME NULL DEFAULT NULL,
  `basic_rate` INTEGER NULL DEFAULT NULL,
  `new field` INTEGER NULL DEFAULT NULL,
  `id_PriceLists` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `InspectionsOfAMeter` ADD FOREIGN KEY (id_Clients) REFERENCES `Clients` (`id`);
ALTER TABLE `InspectionsOfAMeter` ADD FOREIGN KEY (id_ActingManagers) REFERENCES `ActingManagers` (`id`);
ALTER TABLE `ActingManagers` ADD FOREIGN KEY (id_BusinessAgents) REFERENCES `BusinessAgents` (`id`);
ALTER TABLE `UnitCharges` ADD FOREIGN KEY (id_PriceLists) REFERENCES `PriceLists` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `InspectionsOfAMeter` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Clients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `BusinessAgents` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ActingManagers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `PriceLists` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `UnitCharges` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `InspectionsOfAMeter` (`id`,`id_Clients`,`date`,`indicator_number`,`id_ActingManagers`) VALUES
-- ('','','','','');
-- INSERT INTO `Clients` (`id`,`name`,`number`) VALUES
-- ('','','');
-- INSERT INTO `BusinessAgents` (`id`) VALUES
-- ('');
-- INSERT INTO `ActingManagers` (`id`,`id_BusinessAgents`) VALUES
-- ('','');
-- INSERT INTO `PriceLists` (`id`,`name`,`min_use`,`max_use`) VALUES
-- ('','','','');
-- INSERT INTO `UnitCharges` (`id`,`applicable_years_and_months`,`basic_rate`,`new field`,`id_PriceLists`) VALUES
-- ('','','','','');