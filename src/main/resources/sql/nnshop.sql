/*
Navicat MariaDB Data Transfer

Source Server         : 2023-08-23
Source Server Version : 100519
Source Host           : localhost:3306
Source Database       : nnshop

Target Server Type    : MariaDB
Target Server Version : 100519
File Encoding         : 65001

Date: 2023-09-14 14:34:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `productManage_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `FK_ADMIN_RELATIONS_PRODUCTM` (`productManage_id`),
  KEY `FK_ADMIN_RELATIONS_INVETORY` (`record_id`),
  CONSTRAINT `FK_ADMIN_RELATIONS_INVETORY` FOREIGN KEY (`record_id`) REFERENCES `invetoryrecord` (`record_id`),
  CONSTRAINT `FK_ADMIN_RELATIONS_PRODUCTM` FOREIGN KEY (`productManage_id`) REFERENCES `productmanagement` (`productManage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_CART_RELATIONS_USER` (`user_id`),
  CONSTRAINT `FK_CART_RELATIONS_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartItem_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartItem_id`),
  KEY `FK_CARTITEM_REFERENCE_PRODUCT` (`product_id`),
  KEY `FK_CARTITEM_RELATIONS_CART` (`cart_id`),
  CONSTRAINT `FK_CARTITEM_REFERENCE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_CARTITEM_RELATIONS_CART` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cartitem
-- ----------------------------

-- ----------------------------
-- Table structure for invetoryrecord
-- ----------------------------
DROP TABLE IF EXISTS `invetoryrecord`;
CREATE TABLE `invetoryrecord` (
  `record_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `operate_type` char(10) DEFAULT NULL,
  `operate_count` int(11) DEFAULT NULL,
  `operate_time` date DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FK_INVETORY_RELATIONS_ADMIN` (`admin_id`),
  CONSTRAINT `FK_INVETORY_RELATIONS_ADMIN` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of invetoryrecord
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `orderItem_id` int(11) DEFAULT NULL,
  `order_time` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderItem_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for poductcotegory
-- ----------------------------
DROP TABLE IF EXISTS `poductcotegory`;
CREATE TABLE `poductcotegory` (
  `cotegory_id` int(11) NOT NULL,
  `cotegory_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cotegory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of poductcotegory
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderItem_id` int(11) DEFAULT NULL,
  `productManage_id` int(11) DEFAULT NULL,
  `cotegory_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `product_detials` varchar(255) DEFAULT NULL,
  `product_price` float DEFAULT NULL,
  `product_total` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for productimage
-- ----------------------------
DROP TABLE IF EXISTS `productimage`;
CREATE TABLE `productimage` (
  `img_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `FK_PRODUCTI_RELATIONS_PRODUCT` (`product_id`),
  CONSTRAINT `FK_PRODUCTI_RELATIONS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of productimage
-- ----------------------------

-- ----------------------------
-- Table structure for productmanagement
-- ----------------------------
DROP TABLE IF EXISTS `productmanagement`;
CREATE TABLE `productmanagement` (
  `productManage_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `operate_type` char(10) DEFAULT NULL,
  `operate_time` date DEFAULT NULL,
  PRIMARY KEY (`productManage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of productmanagement
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
