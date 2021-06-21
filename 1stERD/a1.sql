-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Customers'
-- 顧客: リソース系エンティティ
-- ---

DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT 'NOT NULL',
  `call_number` VARCHAR(100) NULL DEFAULT 'NOT NULL',
  PRIMARY KEY (`id`),
KEY (`id`)
) COMMENT '顧客: リソース系エンティティ';

-- ---
-- Table 'Items'
-- 商品: リソース系エンティティ
-- ---

DROP TABLE IF EXISTS `Items`;

CREATE TABLE `Items` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT 'NOT NULL',
  `amount` INTEGER NULL DEFAULT NOT NULL,
  `tax_included_amount` INTEGER NULL DEFAULT NULL,
  `id_Categories` INTEGER NULL DEFAULT NULL,
  `id_ItemsClassification` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT '商品: リソース系エンティティ';

-- ---
-- Table 'Orders'
-- 注文するためのイベント系エンティティ
-- ---

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `order_count` INTEGER NOT NULL DEFAULT NULL,
  `id_Customers` INTEGER NULL DEFAULT NOT NULL,
  `id_Items` INTEGER NULL DEFAULT NOT NULL,
  `orders_time` TIMESTAMP NULL DEFAULT 'NOT NULL',
  PRIMARY KEY (`id`)
) COMMENT '注文するためのイベント系エンティティ';

-- ---
-- Table 'Categories'
-- 商品カテゴリ
-- ---

DROP TABLE IF EXISTS `Categories`;

CREATE TABLE `Categories` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT '商品カテゴリ';

-- ---
-- Table 'ItemsClassification'
-- 
-- ---

DROP TABLE IF EXISTS `ItemsClassification`;

CREATE TABLE `ItemsClassification` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT 'NOT NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Items` ADD FOREIGN KEY (id_Categories) REFERENCES `Categories` (`id`);
ALTER TABLE `Items` ADD FOREIGN KEY (id_ItemsClassification) REFERENCES `ItemsClassification` (`id`);
ALTER TABLE `Orders` ADD FOREIGN KEY (id_Customers) REFERENCES `Customers` (`id`);
ALTER TABLE `Orders` ADD FOREIGN KEY (id_Items) REFERENCES `Items` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Customers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Items` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Orders` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ItemsClassification` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Customers` (`id`,`name`,`call_number`) VALUES
-- ('','','');
-- INSERT INTO `Items` (`id`,`name`,`amount`,`tax_included_amount`,`id_Categories`,`id_ItemsClassification`) VALUES
-- ('','','','','','');
-- INSERT INTO `Orders` (`id`,`order_count`,`id_Customers`,`id_Items`,`orders_time`) VALUES
-- ('','','','','');
-- INSERT INTO `Categories` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `ItemsClassification` (`id`,`name`) VALUES
-- ('','');