# Host: localhost  (Version: 5.5.15)
# Date: 2018-03-21 21:36:28
# Generator: MySQL-Front 5.3  (Build 4.13)

/*!40101 SET NAMES utf8 */;

#
# Source for table "company"
#

CREATE TABLE `company` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_name` varchar(255) NOT NULL DEFAULT '',
  `com_pass` varchar(255) NOT NULL DEFAULT '',
  `com_ceo_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "company"
#


#
# Source for table "service"
#

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` int(11) NOT NULL DEFAULT '0',
  `service_title` varchar(255) NOT NULL DEFAULT '',
  `service_type` varchar(255) DEFAULT NULL,
  `service_detail` varchar(255) DEFAULT NULL,
  `service_time` date DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `com_id` (`com_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `company` (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "service"
#


#
# Source for table "user"
#

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'111','111'),(2,'222','222'),(3,'123','123');

#
# Source for table "demand"
#

CREATE TABLE `demand` (
  `demand_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `demand_title` varchar(255) NOT NULL DEFAULT '',
  `demand_type` varchar(255) DEFAULT NULL,
  `demand_detail` varchar(255) DEFAULT NULL,
  `demand_time` date DEFAULT NULL,
  PRIMARY KEY (`demand_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `demand_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "demand"
#


#
# Source for table "bid"
#

CREATE TABLE `bid` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `demand_id` int(11) NOT NULL DEFAULT '0',
  `service_id` int(11) NOT NULL DEFAULT '0',
  `bid_time` date DEFAULT NULL,
  `bid_state` varchar(255) DEFAULT '',
  PRIMARY KEY (`bid_id`),
  KEY `demand_id` (`demand_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`demand_id`) REFERENCES `demand` (`demand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "bid"
#


#
# Source for table "order"
#

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `demand_id` int(11) NOT NULL DEFAULT '0',
  `service_id` int(11) NOT NULL DEFAULT '0',
  `order_time` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `demand_id` (`demand_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`demand_id`) REFERENCES `demand` (`demand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "order"
#

