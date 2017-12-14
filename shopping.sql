/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-12-14 20:27:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `userid` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES ('1', '张三', '111');
INSERT INTO `consumer` VALUES ('2', '李四', '222');
INSERT INTO `consumer` VALUES ('3', '王五', '333');
INSERT INTO `consumer` VALUES ('4', '赵六', '444');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price` float(10,2) NOT NULL,
  `picture` varchar(20) NOT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '数据结构', '图书', '19.99', '1.jpg');
INSERT INTO `goods` VALUES ('2', '编译原理', '图书', '24.99', '2.jpg');
INSERT INTO `goods` VALUES ('3', '面包', '食品', '5.99', '3.jpg');
INSERT INTO `goods` VALUES ('4', '薯条', '食品', '6.99', '4.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordernumber` int(10) NOT NULL,
  `total` float(10,2) NOT NULL,
  `userid` int(10) NOT NULL,
  PRIMARY KEY (`ordernumber`),
  KEY `FK4995t2edbvcp4x5a0ppmuf7y5` (`userid`),
  CONSTRAINT `FK4995t2edbvcp4x5a0ppmuf7y5` FOREIGN KEY (`userid`) REFERENCES `consumer` (`userid`),
  CONSTRAINT `userid2` FOREIGN KEY (`userid`) REFERENCES `consumer` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for ordersdetail
-- ----------------------------
DROP TABLE IF EXISTS `ordersdetail`;
CREATE TABLE `ordersdetail` (
  `ordernumber` int(10) NOT NULL,
  `goodsid` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `total` float(10,2) NOT NULL,
  PRIMARY KEY (`ordernumber`,`goodsid`),
  KEY `FKotg5x10rxxxht5a3nkjml7nj9` (`goodsid`),
  CONSTRAINT `goodsid2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`),
  CONSTRAINT `ordernumber` FOREIGN KEY (`ordernumber`) REFERENCES `orders` (`ordernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordersdetail
-- ----------------------------

-- ----------------------------
-- Table structure for shoppingtrolley
-- ----------------------------
DROP TABLE IF EXISTS `shoppingtrolley`;
CREATE TABLE `shoppingtrolley` (
  `userid` int(10) NOT NULL,
  `goodsid` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `total` float(10,2) NOT NULL,
  PRIMARY KEY (`userid`,`goodsid`),
  KEY `FKjkwn8edp86ph0uvniyycwti7d` (`goodsid`),
  CONSTRAINT `FK6qtlpkadgj275f3258fsncvti` FOREIGN KEY (`userid`) REFERENCES `consumer` (`userid`),
  CONSTRAINT `FKjkwn8edp86ph0uvniyycwti7d` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`),
  CONSTRAINT `goodsid1` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`),
  CONSTRAINT `userid1` FOREIGN KEY (`userid`) REFERENCES `consumer` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingtrolley
-- ----------------------------
INSERT INTO `shoppingtrolley` VALUES ('1', '4', '3', '20.97');
