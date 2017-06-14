/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : mybirger

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-05-18 22:03:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for din
-- ----------------------------
DROP TABLE IF EXISTS `din`;
CREATE TABLE `din` (
  `Username` varchar(20) NOT NULL,
  `Hao` varchar(10) NOT NULL,
  `Qifei` varchar(20) NOT NULL,
  `Mudi` varchar(20) NOT NULL,
  `Rqi` varchar(20) NOT NULL,
  `Jiage` varchar(10) NOT NULL,
  `Piao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of din
-- ----------------------------
INSERT INTO `din` VALUES ('eggpeijun', 'T101', '武汉', '北京', '2009-12-11', '10', '1');
INSERT INTO `din` VALUES ('eggpeijun', 'T114', '长沙', '北京', '2010-01-01', '540', '2');
INSERT INTO `din` VALUES ('jamestest', 'T110', '武汉', '北京', '2010-02-09', '100', '0');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '修改信息', '/Reservation/Modification.do');
INSERT INTO `power` VALUES ('2', '预订机票', '/Reservation/BookingAction.do');
INSERT INTO `power` VALUES ('3', '修改密码', '/Reservation/ChangePassword.do');
INSERT INTO `power` VALUES ('4', '查看订单', '/Reservation/CheckOrder.do');
INSERT INTO `power` VALUES ('5', '制定航班', '/Reservation/FormulateAction.do');
INSERT INTO `power` VALUES ('6', '安排航班', '/Reservation/ArrangeAction.do');
INSERT INTO `power` VALUES ('7', '查看航班', '/Reservation/CheckAction.do');
INSERT INTO `power` VALUES ('8', '会员管理', '/Reservation/Management.do');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员');
INSERT INTO `role` VALUES ('2', '会员');

-- ----------------------------
-- Table structure for role_power
-- ----------------------------
DROP TABLE IF EXISTS `role_power`;
CREATE TABLE `role_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `power_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `k_role_id` (`role_id`),
  KEY `k_power_id` (`power_id`),
  CONSTRAINT `k_power_id` FOREIGN KEY (`power_id`) REFERENCES `power` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `k_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_power
-- ----------------------------
INSERT INTO `role_power` VALUES ('1', '1', '5');
INSERT INTO `role_power` VALUES ('2', '1', '6');
INSERT INTO `role_power` VALUES ('3', '1', '7');
INSERT INTO `role_power` VALUES ('4', '2', '1');
INSERT INTO `role_power` VALUES ('5', '2', '2');
INSERT INTO `role_power` VALUES ('6', '2', '3');
INSERT INTO `role_power` VALUES ('7', '2', '4');
INSERT INTO `role_power` VALUES ('8', '1', '8');

-- ----------------------------
-- Table structure for sch
-- ----------------------------
DROP TABLE IF EXISTS `sch`;
CREATE TABLE `sch` (
  `Hao` varchar(10) NOT NULL,
  `Qifei` varchar(20) NOT NULL,
  `Rqi` date DEFAULT NULL,
  `Mudi` varchar(20) NOT NULL,
  `Jiage` int(5) NOT NULL,
  `Piaosu` int(11) NOT NULL,
  PRIMARY KEY (`Hao`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sch
-- ----------------------------
INSERT INTO `sch` VALUES ('T101', '武汉', '2009-12-11', '北京', '10', '0');
INSERT INTO `sch` VALUES ('T110', '武汉', '2010-02-09', '北京', '100', '10');
INSERT INTO `sch` VALUES ('T114', '长沙', '2010-01-01', '北京', '540', '198');
INSERT INTO `sch` VALUES ('T125', '上海', '2010-01-06', '北京', '270', '30');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Roleid` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Sex` varchar(2) NOT NULL,
  `Tel` varchar(16) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '张君', '男', '01012122121', '123456QQ.com');
INSERT INTO `user` VALUES ('2', 'eggpeijun', '123456', '张三', '男', '010456789123', 'fdsfds@ffwe.com');
INSERT INTO `user` VALUES ('2', 'jamestest', '123456', '杨波', '男', '01023232323', '123@qq.com');
