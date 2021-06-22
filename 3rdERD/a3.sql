-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Orders'
-- 
-- ---

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `order_time` TIMESTAMP NULL DEFAULT NULL,
  `id_Packages` INTEGER NULL DEFAULT NULL,
  `id_CashRegisters` INTEGER NULL DEFAULT NULL,
  `sum` INTEGER NULL DEFAULT NULL,
  `tax_inicluded` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'OrdersDetails'
-- 
-- ---

DROP TABLE IF EXISTS `OrdersDetails`;

CREATE TABLE `OrdersDetails` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Orders` INTEGER NULL DEFAULT NULL,
  `count` INTEGER NULL DEFAULT NULL,
  `id_Items` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Items'
-- 
-- ---

DROP TABLE IF EXISTS `Items`;

CREATE TABLE `Items` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `price` INTEGER NULL DEFAULT NULL,
  `setItemsCategories` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'SetCompositions'
-- 
-- ---

DROP TABLE IF EXISTS `SetCompositions`;

CREATE TABLE `SetCompositions` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  ` setItemsId` INTEGER NULL DEFAULT NULL,
  `compositionsItemsId` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'CashRegisters'
-- 
-- ---

DROP TABLE IF EXISTS `CashRegisters`;

CREATE TABLE `CashRegisters` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `number` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Packages'
-- 
-- ---

DROP TABLE IF EXISTS `Packages`;

CREATE TABLE `Packages` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Depositing'
-- 
-- ---

DROP TABLE IF EXISTS `Depositing`;

CREATE TABLE `Depositing` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Orders` INTEGER NULL DEFAULT NULL,
  `price` INTEGER NULL DEFAULT NULL,
  `changes` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Orders` ADD FOREIGN KEY (id_Packages) REFERENCES `Packages` (`id`);
ALTER TABLE `Orders` ADD FOREIGN KEY (id_CashRegisters) REFERENCES `CashRegisters` (`id`);
ALTER TABLE `OrdersDetails` ADD FOREIGN KEY (id_Orders) REFERENCES `Orders` (`id`);
ALTER TABLE `OrdersDetails` ADD FOREIGN KEY (id_Items) REFERENCES `Items` (`id`);
ALTER TABLE `SetCompositions` ADD FOREIGN KEY ( setItemsId) REFERENCES `Items` (`id`);
ALTER TABLE `SetCompositions` ADD FOREIGN KEY (compositionsItemsId) REFERENCES `Items` (`id`);
ALTER TABLE `Depositing` ADD FOREIGN KEY (id_Orders) REFERENCES `Orders` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Orders` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `OrdersDetails` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Items` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `SetCompositions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `CashRegisters` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Packages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Depositing` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Orders` (`id`,`order_time`,`id_Packages`,`id_CashRegisters`,`sum`,`tax_inicluded`) VALUES
-- ('','','','','','');
-- INSERT INTO `OrdersDetails` (`id`,`id_Orders`,`count`,`id_Items`) VALUES
-- ('','','','');
-- INSERT INTO `Items` (`id`,`name`,`price`,`setItemsCategories`) VALUES
-- ('','','','');
-- INSERT INTO `SetCompositions` (`id`,` setItemsId`,`compositionsItemsId`) VALUES
-- ('','','');
-- INSERT INTO `CashRegisters` (`id`,`number`) VALUES
-- ('','');
-- INSERT INTO `Packages` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Depositing` (`id`,`id_Orders`,`price`,`changes`) VALUES
-- ('','','','');