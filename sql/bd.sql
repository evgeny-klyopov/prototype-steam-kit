/*
Navicat MySQL Data Transfer

Source Server         : proxmox-215
Source Server Version : 50718
Source Host           : 192.168.0.215:3306
Source Database       : calc

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-22 19:26:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for steam_badge
-- ----------------------------
DROP TABLE IF EXISTS `steam_badge`;
CREATE TABLE `steam_badge` (
  `badgeId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор значка (не связан со стимом)',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название',
  `gameCardId` int(11) unsigned NOT NULL COMMENT 'Идентификатор игры',
  `isFoil` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Флаг металлического значка',
  PRIMARY KEY (`badgeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Значки стима';

-- ----------------------------
-- Records of steam_badge
-- ----------------------------

-- ----------------------------
-- Table structure for steam_game
-- ----------------------------
DROP TABLE IF EXISTS `steam_game`;
CREATE TABLE `steam_game` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `dateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  `appId` int(11) unsigned NOT NULL COMMENT 'Идентификатор приложения',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Название игры',
  `isDownloadableContent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Дополнительный контент',
  `parentGameId` bigint(20) unsigned DEFAULT NULL COMMENT 'Идентификатор игры (нужно для доп. контента)',
  PRIMARY KEY (`id`),
  KEY `parentGameId` (`parentGameId`),
  CONSTRAINT `steam_game_ibfk_1` FOREIGN KEY (`parentGameId`) REFERENCES `steam_game` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Игры';

-- ----------------------------
-- Records of steam_game
-- ----------------------------

-- ----------------------------
-- Table structure for steam_game_price
-- ----------------------------
DROP TABLE IF EXISTS `steam_game_price`;
CREATE TABLE `steam_game_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `dateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  `steamGameId` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор игры',
  `steamPriceTypeId` tinyint(2) unsigned NOT NULL COMMENT 'Идентификатор типа цены',
  `steamPriceCurrencyId` tinyint(2) unsigned NOT NULL COMMENT 'Идентификатор валюты',
  `price` decimal(10,2) unsigned NOT NULL COMMENT 'Цена',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gameTypeCurrencyUnique` (`steamGameId`,`steamPriceTypeId`,`steamPriceCurrencyId`) USING BTREE,
  KEY `steamPriceTypeId` (`steamPriceTypeId`) USING BTREE,
  KEY `steamPriceCurrencyId` (`steamPriceCurrencyId`) USING BTREE,
  KEY `steamGameId` (`steamGameId`) USING BTREE,
  CONSTRAINT `steam_game_price_ibfk_1` FOREIGN KEY (`steamGameId`) REFERENCES `steam_game` (`id`),
  CONSTRAINT `steam_game_price_ibfk_2` FOREIGN KEY (`steamPriceTypeId`) REFERENCES `steam_price_type` (`id`),
  CONSTRAINT `steam_game_price_ibfk_3` FOREIGN KEY (`steamPriceCurrencyId`) REFERENCES `steam_price_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Цены игр';

-- ----------------------------
-- Records of steam_game_price
-- ----------------------------

-- ----------------------------
-- Table structure for steam_item
-- ----------------------------
DROP TABLE IF EXISTS `steam_item`;
CREATE TABLE `steam_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор вещи',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `appId` int(11) unsigned NOT NULL COMMENT 'Идентификатор приложения в стиме',
  `marketHashName` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Алиас вещи на торговой площадке',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appId_marketHashName_unique` (`appId`,`marketHashName`) USING BTREE,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Информация о вещях в стиме';

-- ----------------------------
-- Records of steam_item
-- ----------------------------

-- ----------------------------
-- Table structure for steam_item_price
-- ----------------------------
DROP TABLE IF EXISTS `steam_item_price`;
CREATE TABLE `steam_item_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `dateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  `steamItemId` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор вещи',
  `steamPriceTypeId` tinyint(2) unsigned NOT NULL COMMENT 'Идентификатор типа цены',
  `steamPriceCurrencyId` tinyint(2) unsigned NOT NULL COMMENT 'Идентификатор валюты',
  `price` decimal(10,2) unsigned NOT NULL COMMENT 'Цена',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemTypeCurrencyUnique` (`steamItemId`,`steamPriceTypeId`,`steamPriceCurrencyId`) USING BTREE,
  KEY `steamPriceTypeId` (`steamPriceTypeId`) USING BTREE,
  KEY `steamPriceCurrencyId` (`steamPriceCurrencyId`) USING BTREE,
  KEY `steamItemId` (`steamItemId`) USING BTREE,
  CONSTRAINT `steam_item_price_ibfk_2` FOREIGN KEY (`steamItemId`) REFERENCES `steam_item` (`id`),
  CONSTRAINT `steam_item_price_ibfk_3` FOREIGN KEY (`steamPriceTypeId`) REFERENCES `steam_price_type` (`id`),
  CONSTRAINT `steam_item_price_ibfk_4` FOREIGN KEY (`steamPriceCurrencyId`) REFERENCES `steam_price_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Цены вещей на торговой площадке';

-- ----------------------------
-- Records of steam_item_price
-- ----------------------------

-- ----------------------------
-- Table structure for steam_price_currency
-- ----------------------------
DROP TABLE IF EXISTS `steam_price_currency`;
CREATE TABLE `steam_price_currency` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Код валюты',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Список валют';

-- ----------------------------
-- Records of steam_price_currency
-- ----------------------------
INSERT INTO `steam_price_currency` VALUES ('1', 'USD');
INSERT INTO `steam_price_currency` VALUES ('2', 'GBP');
INSERT INTO `steam_price_currency` VALUES ('3', 'EUR');
INSERT INTO `steam_price_currency` VALUES ('4', 'RUB');

-- ----------------------------
-- Table structure for steam_price_type
-- ----------------------------
DROP TABLE IF EXISTS `steam_price_type`;
CREATE TABLE `steam_price_type` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Типы цен';

-- ----------------------------
-- Records of steam_price_type
-- ----------------------------
INSERT INTO `steam_price_type` VALUES ('1', 'Минимальная цена вещи');
INSERT INTO `steam_price_type` VALUES ('2', 'Средняя цена вещи');
INSERT INTO `steam_price_type` VALUES ('3', 'Оригинальная цена игры');
INSERT INTO `steam_price_type` VALUES ('4', 'Цена игры');

-- ----------------------------
-- Table structure for steam_user
-- ----------------------------
DROP TABLE IF EXISTS `steam_user`;
CREATE TABLE `steam_user` (
  `steamId64` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор пользователя в стиме',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `dateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  `communityId` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Идентификатор пользователя в сообществе стиме',
  PRIMARY KEY (`steamId64`),
  UNIQUE KEY `communityId` (`communityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи стим';

-- ----------------------------
-- Records of steam_user
-- ----------------------------

-- ----------------------------
-- Table structure for steam_user_badge
-- ----------------------------
DROP TABLE IF EXISTS `steam_user_badge`;
CREATE TABLE `steam_user_badge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `dateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  `steamId64` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор пользователя в стиме',
  `badgeId` int(11) unsigned NOT NULL COMMENT 'Идентификатор игры',
  `level` int(11) unsigned NOT NULL COMMENT 'Уровень значка у пользователя',
  PRIMARY KEY (`id`),
  UNIQUE KEY `steamId64_badgeId_unique` (`steamId64`,`badgeId`) USING BTREE,
  CONSTRAINT `steam_user_badge_ibfk_1` FOREIGN KEY (`steamId64`) REFERENCES `steam_user` (`steamId64`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользовательские значки';

-- ----------------------------
-- Records of steam_user_badge
-- ----------------------------

-- ----------------------------
-- Table structure for steam_user_game
-- ----------------------------
DROP TABLE IF EXISTS `steam_user_game`;
CREATE TABLE `steam_user_game` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `dateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  `steamId64` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор пользователя в стиме',
  `steamGameId` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор игры',
  PRIMARY KEY (`id`),
  UNIQUE KEY `steamId64SteamGameIdUnique` (`steamId64`,`steamGameId`),
  KEY `steamGameId` (`steamGameId`),
  KEY `steamId64` (`steamId64`),
  CONSTRAINT `steam_user_game_ibfk_1` FOREIGN KEY (`steamId64`) REFERENCES `steam_user` (`steamId64`),
  CONSTRAINT `steam_user_game_ibfk_2` FOREIGN KEY (`steamGameId`) REFERENCES `steam_game` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Игры пользователей';

-- ----------------------------
-- Records of steam_user_game
-- ----------------------------

-- ----------------------------
-- Table structure for steam_user_inventory
-- ----------------------------
DROP TABLE IF EXISTS `steam_user_inventory`;
CREATE TABLE `steam_user_inventory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ИД',
  `dateInsert` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  `dateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления',
  `steamId64` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор пользователя в стиме',
  `steamItemId` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор вещи',
  `quantity` int(11) unsigned NOT NULL COMMENT 'Количество вещей',
  PRIMARY KEY (`id`),
  UNIQUE KEY `steamId64_steamItemId_unique` (`steamId64`,`steamItemId`) USING BTREE,
  KEY `steamItemId` (`steamItemId`),
  CONSTRAINT `steam_user_inventory_ibfk_2` FOREIGN KEY (`steamId64`) REFERENCES `steam_user` (`steamId64`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `steam_user_inventory_ibfk_3` FOREIGN KEY (`steamItemId`) REFERENCES `steam_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Инвентарь пользователя';

-- ----------------------------
-- Records of steam_user_inventory
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
