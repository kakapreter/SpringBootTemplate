/*
Navicat MySQL Data Transfer

Source Server         : 2023
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : nnshop

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2023-10-14 20:20:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `product_manage_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `FK_ADMIN_RELATIONS_PRODUCTM` (`product_manage_id`),
  KEY `FK_ADMIN_RELATIONS_INVETORY` (`record_id`),
  CONSTRAINT `FK_ADMIN_RELATIONS_INVETORY` FOREIGN KEY (`record_id`) REFERENCES `inventory_record` (`record_id`),
  CONSTRAINT `FK_ADMIN_RELATIONS_PRODUCTM` FOREIGN KEY (`product_manage_id`) REFERENCES `product_manage` (`product_manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_CART_RELATIONS_USER` (`user_id`),
  CONSTRAINT `FK_CART_RELATIONS_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `FK_CARTITEM_REFERENCE_PRODUCT` (`product_id`),
  KEY `FK_CARTITEM_RELATIONS_CART` (`cart_id`),
  CONSTRAINT `FK_CARTITEM_REFERENCE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_CARTITEM_RELATIONS_CART` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_record
-- ----------------------------
DROP TABLE IF EXISTS `inventory_record`;
CREATE TABLE `inventory_record` (
  `record_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `operate_type` char(10) DEFAULT NULL,
  `operate_count` int(11) DEFAULT NULL,
  `operate_time` date DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FK_INVETORY_RELATIONS_ADMIN` (`admin_id`),
  CONSTRAINT `FK_INVETORY_RELATIONS_ADMIN` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of inventory_record
-- ----------------------------
INSERT INTO `inventory_record` VALUES ('1', null, '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `order_time` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_ORDERS_RELATIONS_USER` (`user_id`),
  KEY `FK_ORDERS_RELATIONS_ORDERITE` (`order_item_id`),
  CONSTRAINT `FK_ORDERS_RELATIONS_ORDERITE` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`),
  CONSTRAINT `FK_ORDERS_RELATIONS_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `FK_ORDERITE_RELATIONS_PRODUCT` (`product_id`),
  KEY `FK_ORDERITE_RELATIONS_ORDERS` (`order_id`),
  CONSTRAINT `FK_ORDERITE_RELATIONS_ORDERS` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_ORDERITE_RELATIONS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) DEFAULT NULL,
  `product_manage_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `product_details` varchar(255) DEFAULT NULL,
  `product_price` float DEFAULT NULL,
  `product_total` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_PRODUCT_RELATIONS_PODUCTCO` (`category_id`),
  KEY `FK_PRODUCT_RELATIONS_INVETORY` (`record_id`),
  KEY `FK_PRODUCT_RELATIONS_PRODUCTM` (`product_manage_id`),
  KEY `FK_PRODUCT_RELATIONS_ORDERITE` (`order_item_id`),
  CONSTRAINT `FK_PRODUCT_RELATIONS_INVETORY` FOREIGN KEY (`record_id`) REFERENCES `inventory_record` (`record_id`),
  CONSTRAINT `FK_PRODUCT_RELATIONS_ORDERITE` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`),
  CONSTRAINT `FK_PRODUCT_RELATIONS_PODUCTCO` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`),
  CONSTRAINT `FK_PRODUCT_RELATIONS_PRODUCTM` FOREIGN KEY (`product_manage_id`) REFERENCES `product_manage` (`product_manage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', null, null, null, null, '小米粥', '早餐', '2', '99', null, null);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', null, null, null);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `img_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `FK_PRODUCTI_RELATIONS_PRODUCT` (`product_id`),
  CONSTRAINT `FK_PRODUCTI_RELATIONS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_image
-- ----------------------------

-- ----------------------------
-- Table structure for product_manage
-- ----------------------------
DROP TABLE IF EXISTS `product_manage`;
CREATE TABLE `product_manage` (
  `product_manage_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `operate_type` char(10) DEFAULT NULL,
  `operate_time` date DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_manage_id`),
  KEY `FK_PRODUCTM_RELATIONS_ADMIN` (`admin_id`),
  CONSTRAINT `FK_PRODUCTM_RELATIONS_ADMIN` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_manage
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
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_USER_RELATIONS_ORDERS` (`order_id`),
  KEY `FK_USER_RELATIONS_CART` (`cart_id`),
  CONSTRAINT `FK_USER_RELATIONS_CART` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FK_USER_RELATIONS_ORDERS` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, null, 'jack', '222222', '111@gmail.com', '18866666612', '杭州市', null, null);
INSERT INTO `user` VALUES ('2', null, null, 'job', '444462', '444@gmail.com', '18884444311', '北京市', null, null);
INSERT INTO `user` VALUES ('3', null, null, 'tom', '123442', '222@gmail.com', '18866666611', '北京市', '2023-10-14 15:11:47', '2023-10-14 15:11:47');
INSERT INTO `user` VALUES ('4', null, null, 'marry', '133332', '333@gmail.com', '18884444411', '上海市', '2023-10-14 15:19:49', '2023-10-14 15:19:49');
