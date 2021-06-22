-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Reservations'
-- 
-- ---

DROP TABLE IF EXISTS `Reservations`;

CREATE TABLE `Reservations` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `request_date` DATE NULL DEFAULT NULL,
  `id_Books` INTEGER NULL DEFAULT NULL,
  `id_ContactAddress` INTEGER NULL DEFAULT NULL,
  `id_Libraries` INTEGER NULL DEFAULT NULL,
  `signature_permission` INTEGER NULL DEFAULT NULL,
  `no_contact_required_category` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'How_to_contacts'
-- 
-- ---

DROP TABLE IF EXISTS `How_to_contacts`;

CREATE TABLE `How_to_contacts` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT 'NOT NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Subscriber'
-- 
-- ---

DROP TABLE IF EXISTS `Subscriber`;

CREATE TABLE `Subscriber` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `furigana` VARCHAR(100) NULL DEFAULT NULL,
  `lending_number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'how_to_know'
-- 
-- ---

DROP TABLE IF EXISTS `how_to_know`;

CREATE TABLE `how_to_know` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Subscriber` INTEGER NULL DEFAULT NULL,
  `id_Books` INTEGER NULL DEFAULT NULL,
  `new_arrival_book_guide_number` INTEGER NULL DEFAULT NULL,
  `news_name` VARCHAR(100) NULL DEFAULT NULL,
  `newspaper_date` DATE NULL DEFAULT 'NOT NULL',
  `other` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'publishing_house'
-- 
-- ---

DROP TABLE IF EXISTS `publishing_house`;

CREATE TABLE `publishing_house` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Books'
-- 
-- ---

DROP TABLE IF EXISTS `Books`;

CREATE TABLE `Books` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `author` VARCHAR NULL DEFAULT NULL,
  `publication_year` YEAR NULL DEFAULT NULL,
  `id_publishing_house` INTEGER NULL DEFAULT NULL,
  `price` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Libraries'
-- 
-- ---

DROP TABLE IF EXISTS `Libraries`;

CREATE TABLE `Libraries` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ContactAddress'
-- 
-- ---

DROP TABLE IF EXISTS `ContactAddress`;

CREATE TABLE `ContactAddress` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Subscriber` INTEGER NULL DEFAULT NULL,
  `id_How_to_contacts` INTEGER NULL DEFAULT NULL,
  `number` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Reservations` ADD FOREIGN KEY (id_Books) REFERENCES `Books` (`id`);
ALTER TABLE `Reservations` ADD FOREIGN KEY (id_ContactAddress) REFERENCES `ContactAddress` (`id`);
ALTER TABLE `Reservations` ADD FOREIGN KEY (id_Libraries) REFERENCES `Libraries` (`id`);
ALTER TABLE `how_to_know` ADD FOREIGN KEY (id_Subscriber) REFERENCES `Subscriber` (`id`);
ALTER TABLE `how_to_know` ADD FOREIGN KEY (id_Books) REFERENCES `Books` (`id`);
ALTER TABLE `Books` ADD FOREIGN KEY (id_publishing_house) REFERENCES `publishing_house` (`id`);
ALTER TABLE `ContactAddress` ADD FOREIGN KEY (id_Subscriber) REFERENCES `Subscriber` (`id`);
ALTER TABLE `ContactAddress` ADD FOREIGN KEY (id_How_to_contacts) REFERENCES `How_to_contacts` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Reservations` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `How_to_contacts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Subscriber` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `how_to_know` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `publishing_house` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Books` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Libraries` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ContactAddress` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Reservations` (`id`,`request_date`,`id_Books`,`id_ContactAddress`,`id_Libraries`,`signature_permission`,`no_contact_required_category`) VALUES
-- ('','','','','','','');
-- INSERT INTO `How_to_contacts` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Subscriber` (`id`,`name`,`furigana`,`lending_number`) VALUES
-- ('','','','');
-- INSERT INTO `how_to_know` (`id`,`id_Subscriber`,`id_Books`,`new_arrival_book_guide_number`,`news_name`,`newspaper_date`,`other`) VALUES
-- ('','','','','','','');
-- INSERT INTO `publishing_house` (`id`) VALUES
-- ('');
-- INSERT INTO `Books` (`id`,`name`,`author`,`publication_year`,`id_publishing_house`,`price`) VALUES
-- ('','','','','','');
-- INSERT INTO `Libraries` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `ContactAddress` (`id`,`id_Subscriber`,`id_How_to_contacts`,`number`) VALUES
-- ('','','','');