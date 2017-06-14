/*
Navicat MySQL Data Transfer

Source Server         : chance
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : oasystem

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-06-14 09:55:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_accessoryfile
-- ----------------------------
DROP TABLE IF EXISTS `t_accessoryfile`;
CREATE TABLE `t_accessoryfile` (
  `t_accessoryfile_id` int(11) NOT NULL,
  `t_fileinfo_id` int(11) DEFAULT NULL,
  `t_accessoryfile_name` varchar(50) DEFAULT NULL,
  `t_accessoryfile_size` int(11) DEFAULT NULL,
  `t_fileinfo_filetypeid` int(11) DEFAULT NULL,
  `t_accessoryfile_createdate` datetime DEFAULT NULL,
  `t_accessoryfile_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`t_accessoryfile_id`),
  KEY `fk_t_fileinfo_id` (`t_fileinfo_id`),
  KEY `t_fileinfo_filetypeid` (`t_fileinfo_filetypeid`),
  CONSTRAINT `fk_t_fileinfo_id` FOREIGN KEY (`t_fileinfo_id`) REFERENCES `t_fileinfo` (`t_fileinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_accessoryfile_ibfk_1` FOREIGN KEY (`t_fileinfo_filetypeid`) REFERENCES `t_filetypeinfo` (`t_fileinfo_filetypeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_accessoryfile
-- ----------------------------
INSERT INTO `t_accessoryfile` VALUES ('1', '1', '文档txt', '30', '1', '2017-06-02 15:09:53', 'D://jhojhojknkj');
INSERT INTO `t_accessoryfile` VALUES ('3', '3', '文件excel', '100', '3', '2017-06-02 15:11:03', 'D://jhojhojknkj');

-- ----------------------------
-- Table structure for t_branchinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_branchinfo`;
CREATE TABLE `t_branchinfo` (
  `t_branchinfo_id` int(11) NOT NULL,
  `t_branchinfo_name` varchar(50) DEFAULT NULL,
  `t_branchinfo_shortname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_branchinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_branchinfo
-- ----------------------------
INSERT INTO `t_branchinfo` VALUES ('1', '华北电力科学研究院', '花店');
INSERT INTO `t_branchinfo` VALUES ('2', '中国科学院声学研究所', '中科声研究所');
INSERT INTO `t_branchinfo` VALUES ('3', '北大青鸟集团', '青鸟');
INSERT INTO `t_branchinfo` VALUES ('4', '大唐国际盘山发点有限公司', '盘电');

-- ----------------------------
-- Table structure for t_departinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_departinfo`;
CREATE TABLE `t_departinfo` (
  `t_departinfo_id` int(11) NOT NULL,
  `t_departinfo_name` varchar(50) DEFAULT NULL,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_departinfo_tel` bigint(20) DEFAULT NULL,
  `t_departinfo_mobiletel` bigint(20) DEFAULT NULL,
  `t_departinfo_faxes` bigint(20) DEFAULT NULL,
  `t_branchinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_departinfo_id`),
  KEY `fk_t_userinfo_id` (`t_userinfo_id`),
  KEY `fk_t_branchinfo_id` (`t_branchinfo_id`),
  CONSTRAINT `fk_t_branchinfo_id` FOREIGN KEY (`t_branchinfo_id`) REFERENCES `t_branchinfo` (`t_branchinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_t_userinfo_id` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_departinfo
-- ----------------------------
INSERT INTO `t_departinfo` VALUES ('1', '研发部', '1', '87784070', '18200291077', '87784070', '1');
INSERT INTO `t_departinfo` VALUES ('2', '销售部', '2', '87784000', '18200291076', '87784000', '2');
INSERT INTO `t_departinfo` VALUES ('3', '财务部', '3', '87700000', '18200291075', '87700000', '3');
INSERT INTO `t_departinfo` VALUES ('4', '技术部', '4', '87000000', '18200291074', '8700000', '4');

-- ----------------------------
-- Table structure for t_fileinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_fileinfo`;
CREATE TABLE `t_fileinfo` (
  `t_fileinfo_id` int(11) NOT NULL,
  `t_fileinfo_name` varchar(50) DEFAULT NULL,
  `t_fileinfo_filetypeid` int(11) DEFAULT NULL,
  `t_fileinfo_remark` varchar(50) DEFAULT NULL,
  `t_fileinfo_owner` varchar(50) DEFAULT NULL,
  `t_fileinfo_createdate` datetime DEFAULT NULL,
  `t_fileinfo_parentid` int(11) DEFAULT NULL,
  `t_fileinfo_filepath` varchar(200) DEFAULT NULL,
  `t_fileinfo_ifdelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_fileinfo_id`),
  KEY `t_fileinfo_filetypeid` (`t_fileinfo_filetypeid`),
  CONSTRAINT `t_fileinfo_ibfk_1` FOREIGN KEY (`t_fileinfo_filetypeid`) REFERENCES `t_filetypeinfo` (`t_fileinfo_filetypeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fileinfo
-- ----------------------------
INSERT INTO `t_fileinfo` VALUES ('1', 'file1', '1', '备注1', '孙楷', '2017-06-02 00:00:00', '1', 'C:\\Users\\Administrator\\Desktop\\share小分队\\Office\\OfficeAutomationSystem\\WebRoot\\upload\\航空订票系统权限表.docx', '2');
INSERT INTO `t_fileinfo` VALUES ('3', 'file3', '3', '备注3', '孙楷', '2017-06-02 00:00:00', '1', 'C:\\Users\\Administrator\\Desktop\\share小分队\\Office\\OfficeAutomationSystem\\WebRoot\\upload\\航空订票系统权限表.docx', '2');
INSERT INTO `t_fileinfo` VALUES ('6', '说明.txt', '1', '78978', '张三', '2017-06-07 09:53:27', '1', 'C:\\Users\\Administrator\\Desktop\\share小分队\\Office\\OfficeAutomationSystem\\WebRoot\\upload\\航空订票系统权限表.docx', '2');
INSERT INTO `t_fileinfo` VALUES ('34', '图书推荐.txt', '1', '23423423', '张三', '2017-06-08 18:31:45', null, 'D:\\1MyInstall\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\图书推荐.txt', '1');
INSERT INTO `t_fileinfo` VALUES ('123', '查询.txt', '1', '123', '张三', '2017-06-12 17:33:04', null, 'D:\\JavaEE\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\查询.txt', '2');

-- ----------------------------
-- Table structure for t_filetypeinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_filetypeinfo`;
CREATE TABLE `t_filetypeinfo` (
  `t_fileinfo_filetypeid` int(11) NOT NULL,
  `t_filetypeinfo_name` varchar(50) DEFAULT NULL,
  `t_filetypeinfo_image` varchar(50) DEFAULT NULL,
  `t_filetypeinfo_suffix` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_fileinfo_filetypeid`),
  KEY `t_fileinfo_filetypeid` (`t_fileinfo_filetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_filetypeinfo
-- ----------------------------
INSERT INTO `t_filetypeinfo` VALUES ('1', 'txt', 'images\\txt.jpg', '.txt');
INSERT INTO `t_filetypeinfo` VALUES ('2', 'word', 'images\\word.jpg', '.word');
INSERT INTO `t_filetypeinfo` VALUES ('3', 'excel', 'images\\excel.jpg', '.sxml');

-- ----------------------------
-- Table structure for t_loginlog
-- ----------------------------
DROP TABLE IF EXISTS `t_loginlog`;
CREATE TABLE `t_loginlog` (
  `t_loginlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_loginlog_time` datetime DEFAULT NULL,
  `t_loginlog_ifsuccess` int(11) DEFAULT NULL,
  `t_loginlog_userip` varchar(100) DEFAULT NULL,
  `t_loginlog_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`t_loginlog_id`),
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_loginlog_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loginlog
-- ----------------------------
INSERT INTO `t_loginlog` VALUES ('1', '2', '2017-06-01 16:24:03', '1', 'shishe', '不存在');
INSERT INTO `t_loginlog` VALUES ('2', '4', '2017-05-29 16:26:24', '0', '232', '不存在');
INSERT INTO `t_loginlog` VALUES ('18', '1', '2017-06-09 18:40:43', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('19', '1', '2017-06-12 09:32:36', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('20', '1', '2017-06-12 09:37:36', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('21', '1', '2017-06-12 14:12:35', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('22', '1', '2017-06-12 15:34:29', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('23', '1', '2017-06-12 15:52:06', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('24', '1', '2017-06-12 15:58:54', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('25', '1', '2017-06-12 17:18:49', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('26', '1', '2017-06-12 17:21:32', null, '127.0.0.1', null);
INSERT INTO `t_loginlog` VALUES ('27', '1', '2017-06-12 19:10:25', null, '127.0.0.1', null);

-- ----------------------------
-- Table structure for t_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_manage`;
CREATE TABLE `t_manage` (
  `t_manage_id` int(11) NOT NULL,
  `t_manage_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`t_manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_manage
-- ----------------------------
INSERT INTO `t_manage` VALUES ('1', '人事管理 ');
INSERT INTO `t_manage` VALUES ('2', '日程管理');
INSERT INTO `t_manage` VALUES ('3', '文档管理');
INSERT INTO `t_manage` VALUES ('4', '消息传递');
INSERT INTO `t_manage` VALUES ('5', '系统管理');
INSERT INTO `t_manage` VALUES ('6', '考勤管理');
INSERT INTO `t_manage` VALUES ('7', '个人考情管理');

-- ----------------------------
-- Table structure for t_manage_power
-- ----------------------------
DROP TABLE IF EXISTS `t_manage_power`;
CREATE TABLE `t_manage_power` (
  `t_manage_power_id` int(11) NOT NULL,
  `t_manage_id` int(11) NOT NULL,
  `t_power_id` int(11) NOT NULL,
  PRIMARY KEY (`t_manage_power_id`),
  KEY `t_manage_id` (`t_manage_id`),
  KEY `t_power_id` (`t_power_id`),
  CONSTRAINT `t_manage_power_ibfk_1` FOREIGN KEY (`t_manage_id`) REFERENCES `t_manage` (`t_manage_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_manage_power_ibfk_2` FOREIGN KEY (`t_power_id`) REFERENCES `t_power` (`t_power_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_manage_power
-- ----------------------------
INSERT INTO `t_manage_power` VALUES ('1', '1', '1');
INSERT INTO `t_manage_power` VALUES ('2', '1', '2');
INSERT INTO `t_manage_power` VALUES ('3', '1', '3');
INSERT INTO `t_manage_power` VALUES ('4', '2', '4');
INSERT INTO `t_manage_power` VALUES ('5', '2', '5');
INSERT INTO `t_manage_power` VALUES ('6', '2', '6');
INSERT INTO `t_manage_power` VALUES ('7', '3', '7');
INSERT INTO `t_manage_power` VALUES ('8', '3', '9');
INSERT INTO `t_manage_power` VALUES ('9', '3', '10');
INSERT INTO `t_manage_power` VALUES ('10', '4', '11');
INSERT INTO `t_manage_power` VALUES ('11', '4', '12');
INSERT INTO `t_manage_power` VALUES ('12', '5', '13');
INSERT INTO `t_manage_power` VALUES ('13', '5', '14');
INSERT INTO `t_manage_power` VALUES ('14', '5', '15');
INSERT INTO `t_manage_power` VALUES ('16', '6', '16');
INSERT INTO `t_manage_power` VALUES ('17', '6', '17');
INSERT INTO `t_manage_power` VALUES ('18', '7', '18');

-- ----------------------------
-- Table structure for t_manualsign
-- ----------------------------
DROP TABLE IF EXISTS `t_manualsign`;
CREATE TABLE `t_manualsign` (
  `t_manualsign_id` int(11) DEFAULT NULL,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_manualsign_time` datetime DEFAULT NULL,
  `t_manualsign_desc` varchar(200) DEFAULT NULL,
  `t_manualsign_tag` int(11) DEFAULT NULL,
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_manualsign_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manualsign
-- ----------------------------
INSERT INTO `t_manualsign` VALUES ('1', '1', '2017-06-02 15:23:47', 'hiknbi', '888');
INSERT INTO `t_manualsign` VALUES ('2', '3', '2017-06-02 15:24:20', 'hjokmn', '888');
INSERT INTO `t_manualsign` VALUES ('3', '5', '2017-06-02 15:24:38', 'hykjhn', '888');
INSERT INTO `t_manualsign` VALUES ('4', '2', '2017-06-02 15:24:55', 'tyihn', '888');
INSERT INTO `t_manualsign` VALUES ('5', '4', '2017-06-02 15:25:10', 'dsgfv', '888');
INSERT INTO `t_manualsign` VALUES (null, '1', '2017-06-12 17:21:37', null, null);
INSERT INTO `t_manualsign` VALUES (null, '1', '2017-06-12 17:23:14', null, null);

-- ----------------------------
-- Table structure for t_meetinginfo
-- ----------------------------
DROP TABLE IF EXISTS `t_meetinginfo`;
CREATE TABLE `t_meetinginfo` (
  `t_meetinginfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_meetinginfo_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`t_meetinginfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_meetinginfo
-- ----------------------------
INSERT INTO `t_meetinginfo` VALUES ('1', '部门会议');
INSERT INTO `t_meetinginfo` VALUES ('2', '机构会议');
INSERT INTO `t_meetinginfo` VALUES ('3', '公司会议');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `t_message_id` int(11) NOT NULL,
  `t_message_title` varchar(100) DEFAULT NULL,
  `t_message_content` varchar(255) DEFAULT NULL,
  `t_messagetype_id` int(11) DEFAULT NULL,
  `t_message_begintime` datetime DEFAULT NULL,
  `t_message_endtime` datetime DEFAULT NULL,
  `t_userinfo_id` varchar(50) DEFAULT NULL,
  `t_message_ifpublish` int(11) DEFAULT NULL,
  `t_message_recordtime` datetime DEFAULT NULL,
  PRIMARY KEY (`t_message_id`),
  KEY `t_messagetype_id` (`t_messagetype_id`),
  CONSTRAINT `t_message_ibfk_1` FOREIGN KEY (`t_messagetype_id`) REFERENCES `t_messagetype` (`t_messagetype_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '消息1', '消息内容1', '1', '2017-06-02 12:28:04', '2017-06-15 15:28:20', '1', '1', '2017-06-02 10:28:53');
INSERT INTO `t_message` VALUES ('2', '消息2', '消息内容2', '2', '2017-06-02 13:29:21', '2017-06-22 15:29:32', '2', '1', '2017-06-02 13:29:43');
INSERT INTO `t_message` VALUES ('3', '消息3', '消息内容3', '3', '2017-06-02 15:30:05', '2017-06-20 15:30:11', '3', '1', '2017-06-02 15:30:25');

-- ----------------------------
-- Table structure for t_messagetouser
-- ----------------------------
DROP TABLE IF EXISTS `t_messagetouser`;
CREATE TABLE `t_messagetouser` (
  `t_messagetouser_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_message_id` int(11) NOT NULL,
  `t_userinfo_id` int(11) NOT NULL,
  `t_id_read` int(11) NOT NULL,
  PRIMARY KEY (`t_messagetouser_id`),
  KEY `k_t_message_id` (`t_message_id`),
  KEY `k_t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `k_t_message_id` FOREIGN KEY (`t_message_id`) REFERENCES `t_message` (`t_message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `k_t_userinfo_id` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_messagetouser
-- ----------------------------
INSERT INTO `t_messagetouser` VALUES ('1', '2', '2', '1');
INSERT INTO `t_messagetouser` VALUES ('2', '3', '2', '1');
INSERT INTO `t_messagetouser` VALUES ('3', '1', '4', '0');

-- ----------------------------
-- Table structure for t_messagetype
-- ----------------------------
DROP TABLE IF EXISTS `t_messagetype`;
CREATE TABLE `t_messagetype` (
  `t_messagetype_id` int(11) DEFAULT NULL,
  `t_messagetype_name` varchar(50) DEFAULT NULL,
  `t_messagetype_desc` varchar(50) DEFAULT NULL,
  KEY `t_messagetype_id` (`t_messagetype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_messagetype
-- ----------------------------
INSERT INTO `t_messagetype` VALUES ('1', '公告消息', '公告');
INSERT INTO `t_messagetype` VALUES ('2', '新闻消息', '新闻');
INSERT INTO `t_messagetype` VALUES ('3', '奖惩消息', '奖惩');

-- ----------------------------
-- Table structure for t_mynote
-- ----------------------------
DROP TABLE IF EXISTS `t_mynote`;
CREATE TABLE `t_mynote` (
  `t_mynote_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_mynote_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `t_mynote_content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `t_mynote_createtime` datetime NOT NULL,
  `t_mynote_createuser` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`t_mynote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_mynote
-- ----------------------------
INSERT INTO `t_mynote` VALUES ('1', '记事本', '我不想上班，说的是', '2017-06-02 16:29:28', '张永强');

-- ----------------------------
-- Table structure for t_operatelog
-- ----------------------------
DROP TABLE IF EXISTS `t_operatelog`;
CREATE TABLE `t_operatelog` (
  `t_operatelog_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_userinfo_id` int(11) NOT NULL,
  `t_operatelog_name` varchar(50) NOT NULL,
  `t_operatelog_objectid` varchar(50) NOT NULL,
  `t_operatelog_desc` varchar(200) NOT NULL,
  `t_operatelog_time` datetime NOT NULL,
  PRIMARY KEY (`t_operatelog_id`),
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_operatelog_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operatelog
-- ----------------------------
INSERT INTO `t_operatelog` VALUES ('1', '2', '登录', '登录qq', '速度速度', '2017-06-21 16:35:16');
INSERT INTO `t_operatelog` VALUES ('2', '3', '注册', '注册微信', '收到收到', '2017-06-13 16:36:03');

-- ----------------------------
-- Table structure for t_operationlog
-- ----------------------------
DROP TABLE IF EXISTS `t_operationlog`;
CREATE TABLE `t_operationlog` (
  `t_operationlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_operationlog_name` varchar(50) NOT NULL,
  `t_operationlog_username` varchar(22) NOT NULL,
  `t_operationlog_time` datetime NOT NULL,
  `t_operationlog_content` text NOT NULL,
  PRIMARY KEY (`t_operationlog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operationlog
-- ----------------------------
INSERT INTO `t_operationlog` VALUES ('1', '查询', '张三', '2017-06-12 09:37:36', 'findManagePower[参数1，类型：String，值：(getBytes : [B@5cc70d27)]');
INSERT INTO `t_operationlog` VALUES ('2', '查询', '张三', '2017-06-12 09:37:39', 'findLogBean[参数1，类型：BindingAwareModelMap，值：]');
INSERT INTO `t_operationlog` VALUES ('3', '查询', '张三', '2017-06-12 09:39:10', 'findManagePower[参数1，类型：String，值：(getBytes : [B@2fa3f095)]');
INSERT INTO `t_operationlog` VALUES ('4', '查询', '小丽', '2017-06-12 09:39:18', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('5', '查询', '小丽', '2017-06-12 09:39:18', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('6', '查询', '张三', '2017-06-12 14:12:48', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('7', '查询', '张三', '2017-06-12 14:12:53', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('8', '查询', '张三', '2017-06-12 14:12:53', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('9', '查询', '张三', '2017-06-12 14:12:55', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('10', '查询', '张三', '2017-06-12 14:12:55', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('11', '查询', '张三', '2017-06-12 14:14:05', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('12', '查询', '张三', '2017-06-12 14:14:05', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('13', '查询', '张三', '2017-06-12 14:14:08', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('14', '查询', '张三', '2017-06-12 14:14:08', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('15', '查询', '张三', '2017-06-12 14:14:12', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('16', '查询', '张三', '2017-06-12 14:14:12', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('17', '查询', '张三', '2017-06-12 14:14:31', 'findRole');
INSERT INTO `t_operationlog` VALUES ('18', '查询', '张三', '2017-06-12 14:14:31', 'findUser[参数1，类型：String，值：(getBytes : [B@2b129e33)]');
INSERT INTO `t_operationlog` VALUES ('19', '查询', '张三', '2017-06-12 14:14:31', 'findUser[参数1，类型：String，值：(getBytes : [B@87497b8)]');
INSERT INTO `t_operationlog` VALUES ('20', '查询', '张三', '2017-06-12 14:18:39', 'findRole');
INSERT INTO `t_operationlog` VALUES ('21', '查询', '张三', '2017-06-12 14:18:39', 'findUser[参数1，类型：String，值：(getBytes : [B@2adb087b)]');
INSERT INTO `t_operationlog` VALUES ('22', '查询', '张三', '2017-06-12 14:18:39', 'findUser[参数1，类型：String，值：(getBytes : [B@2ab86f27)]');
INSERT INTO `t_operationlog` VALUES ('23', '修改', '张三', '2017-06-12 14:20:16', 'myNoteUpdate[参数1，类型：MyNoteBean，值：(getT_mynote_content : 我不想上班，说的是)(getT_mynote_title : 记事本)(getT_mynote_id : 1)]');
INSERT INTO `t_operationlog` VALUES ('24', '查询', '张三', '2017-06-12 14:20:43', 'findLogBean[参数1，类型：BindingAwareModelMap，值：]');
INSERT INTO `t_operationlog` VALUES ('25', '查询', '张三', '2017-06-12 14:22:23', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('26', '查询', '张三', '2017-06-12 14:22:31', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('27', '查询', '张三', '2017-06-12 14:22:31', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('28', '查询', '张三', '2017-06-12 14:22:32', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('29', '查询', '张三', '2017-06-12 14:22:33', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('30', '查询', '张三', '2017-06-12 14:22:35', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('31', '查询', '张三', '2017-06-12 14:22:35', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('32', '查询', '张三', '2017-06-12 14:22:45', 'findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@551d7eed)]');
INSERT INTO `t_operationlog` VALUES ('33', '查询', '张三', '2017-06-12 14:22:46', 'findUserSendMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('34', '查询', '张三', '2017-06-12 14:22:46', 'findSendCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('35', '查询', '张三', '2017-06-12 14:22:46', 'findUserHoldMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('36', '查询', '张三', '2017-06-12 14:22:46', 'findHoldCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('37', '查询', '张三', '2017-06-12 14:22:50', 'findRole');
INSERT INTO `t_operationlog` VALUES ('38', '查询', '张三', '2017-06-12 14:22:50', 'findUser[参数1，类型：String，值：(getBytes : [B@52e80601)]');
INSERT INTO `t_operationlog` VALUES ('39', '查询', '张三', '2017-06-12 14:22:50', 'findUser[参数1，类型：String，值：(getBytes : [B@19f370cf)]');
INSERT INTO `t_operationlog` VALUES ('40', '查询', '张三', '2017-06-12 14:24:11', 'findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@5acba4e0)]');
INSERT INTO `t_operationlog` VALUES ('41', '查询', '张三', '2017-06-12 14:24:11', 'findUserSendMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('42', '查询', '张三', '2017-06-12 14:24:11', 'findSendCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('43', '查询', '张三', '2017-06-12 14:24:11', 'findUserHoldMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('44', '查询', '张三', '2017-06-12 14:24:11', 'findHoldCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('45', '刪除', '张三', '2017-06-12 14:24:13', 'deleteMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('46', '查询', '张三', '2017-06-12 14:24:13', 'findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@500e9783)]');
INSERT INTO `t_operationlog` VALUES ('47', '查询', '张三', '2017-06-12 14:24:13', 'findUserSendMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('48', '查询', '张三', '2017-06-12 14:24:13', 'findSendCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('49', '查询', '张三', '2017-06-12 14:24:13', 'findUserHoldMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('50', '查询', '张三', '2017-06-12 14:24:13', 'findHoldCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('51', '查询', '张三', '2017-06-12 15:50:07', 'findRole');
INSERT INTO `t_operationlog` VALUES ('52', '查询', '张三', '2017-06-12 15:50:07', 'findUser[参数1，类型：String，值：(getBytes : [B@470dceea)]');
INSERT INTO `t_operationlog` VALUES ('53', '查询', '张三', '2017-06-12 15:50:07', 'findUser[参数1，类型：String，值：(getBytes : [B@593ee5ef)]');
INSERT INTO `t_operationlog` VALUES ('54', '查询', '张三', '2017-06-12 15:52:06', 'findManagePower[参数1，类型：String，值：(getBytes : [B@904d2f7)]');
INSERT INTO `t_operationlog` VALUES ('55', '查询', '张三', '2017-06-12 16:55:47', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('56', '查询', '张三', '2017-06-12 16:56:00', 'findSchedule[参数1，类型：ScheduleOb，值：(getT_schedule_begintime : 2017-06-06)(getT_schedule_endtime : 2017-06-07)(getT_branchinfo_id : 0)(getT_departinfo_id : 0)(getT_userinfo_id : 0)]');
INSERT INTO `t_operationlog` VALUES ('57', '查询', '张三', '2017-06-12 17:00:35', 'findSchedule[参数1，类型：ScheduleOb，值：]');
INSERT INTO `t_operationlog` VALUES ('58', '查询', '张三', '2017-06-12 17:18:52', 'findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@ca623ab)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@525759f)(getCookies : [Ljavax.servlet.http.Cookie;@55472b36)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@6d3b9322)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@503d5e55)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13165)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@7e9a4040)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@1268da3e)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@237bf9d2)][参数2，类型：BindingAwareModelMap，值：]');
INSERT INTO `t_operationlog` VALUES ('59', '查询', '张三', '2017-06-12 17:18:55', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('60', '查询', '张三', '2017-06-12 17:18:58', 'findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@ca623ab)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@525759f)(getCookies : [Ljavax.servlet.http.Cookie;@1422a68b)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@4ef92171)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@42b03213)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13165)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@47b1bc2b)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@46a64ca8)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@237bf9d2)][参数2，类型：BindingAwareModelMap，值：]');
INSERT INTO `t_operationlog` VALUES ('61', '查询', '张三', '2017-06-12 17:19:00', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('62', '查询', '张三', '2017-06-12 17:21:32', 'findManagePower[参数1，类型：String，值：(getBytes : [B@78854254)]');
INSERT INTO `t_operationlog` VALUES ('63', '查询', '张三', '2017-06-12 17:22:07', 'findRole');
INSERT INTO `t_operationlog` VALUES ('64', '查询', '张三', '2017-06-12 17:22:07', 'findUser[参数1，类型：String，值：(getBytes : [B@50f92e1f)]');
INSERT INTO `t_operationlog` VALUES ('65', '查询', '张三', '2017-06-12 17:22:07', 'findUser[参数1，类型：String，值：(getBytes : [B@704adaf1)]');
INSERT INTO `t_operationlog` VALUES ('66', '查询', '张三', '2017-06-12 17:23:52', 'findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@656e1b9c)]');
INSERT INTO `t_operationlog` VALUES ('67', '查询', '张三', '2017-06-12 17:23:52', 'findUserSendMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('68', '查询', '张三', '2017-06-12 17:23:52', 'findSendCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('69', '查询', '张三', '2017-06-12 17:23:52', 'findUserHoldMessage[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('70', '查询', '张三', '2017-06-12 17:23:52', 'findHoldCount[参数1，类型：Integer，值：]');
INSERT INTO `t_operationlog` VALUES ('71', '查询', '张三', '2017-06-12 17:24:36', 'findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@464e3eb1)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@339ba537)(getCookies : [Ljavax.servlet.http.Cookie;@da9f057)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@668b7397)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@51877241)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13424)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@3f5bc75b)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@7d32b3af)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@40187055)][参数2，类型：BindingAwareModelMap，值：]');
INSERT INTO `t_operationlog` VALUES ('72', '查询', '张三', '2017-06-12 17:24:37', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('73', '查询', '张三', '2017-06-12 17:24:41', 'findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@464e3eb1)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@339ba537)(getCookies : [Ljavax.servlet.http.Cookie;@44a69c59)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@3fd5ea7b)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@3028b48b)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13424)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@3f98835e)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@4fac84a0)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@40187055)][参数2，类型：BindingAwareModelMap，值：]');
INSERT INTO `t_operationlog` VALUES ('74', '查询', '张三', '2017-06-12 17:24:42', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('75', '查询', '张三', '2017-06-12 17:24:44', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('76', '查询', '张三', '2017-06-12 17:24:44', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('77', '查询', '张三', '2017-06-12 17:24:46', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('78', '查询', '张三', '2017-06-12 17:24:46', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('79', '查询', '张三', '2017-06-12 17:24:53', 'findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@464e3eb1)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@339ba537)(getCookies : [Ljavax.servlet.http.Cookie;@2fb60da9)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@115436e8)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@717c67b3)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13424)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@70e2e568)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@6fa67598)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@40187055)][参数2，类型：BindingAwareModelMap，值：]');
INSERT INTO `t_operationlog` VALUES ('80', '查询', '张三', '2017-06-12 17:25:07', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('81', '查询', '张三', '2017-06-12 17:25:07', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('82', '查询', '张三', '2017-06-12 17:25:22', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('83', '查询', '张三', '2017-06-12 17:25:22', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('84', '查询', '张三', '2017-06-12 17:25:51', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('85', '查询', '张三', '2017-06-12 17:25:51', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('86', '查询', '张三', '2017-06-12 17:28:01', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('87', '查询', '张三', '2017-06-12 17:28:01', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('88', '查询', '张三', '2017-06-12 17:28:57', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('89', '查询', '张三', '2017-06-12 17:28:57', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('90', '添加', '张三', '2017-06-12 17:33:04', 'addFile[参数1，类型：FileInfoBean，值：(getT_fileinfo_owner : 张三)(getT_fileinfo_createdate : 2017-06-12 17:33:04)(getT_fileinfo_filepath : D:\\JavaEE\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\查询.txt)(getT_fileinfo_remark : 123)(getT_fileinfo_filetypeid : 1)(getT_fileinfo_parentid : 0)(getT_fileinfo_id : 123)(getT_fileinfo_ifdelete : 2)(getT_fileinfo_name : 查询.txt)]');
INSERT INTO `t_operationlog` VALUES ('91', '查询', '张三', '2017-06-12 17:33:04', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('92', '查询', '张三', '2017-06-12 17:33:04', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('93', '查询', '张三', '2017-06-12 17:34:50', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('94', '查询', '张三', '2017-06-12 17:34:50', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('95', '查询', '张三', '2017-06-12 17:34:52', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('96', '查询', '张三', '2017-06-12 17:34:52', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('97', '查询', '张三', '2017-06-12 17:34:53', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('98', '查询', '张三', '2017-06-12 17:34:53', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('99', '查询', '张三', '2017-06-12 17:34:54', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('100', '查询', '张三', '2017-06-12 17:34:54', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('101', '查询', '张三', '2017-06-12 17:34:54', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('102', '查询', '张三', '2017-06-12 17:34:54', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('103', '查询', '张三', '2017-06-12 17:34:56', 'findFileDetailsInfo');
INSERT INTO `t_operationlog` VALUES ('104', '查询', '张三', '2017-06-12 17:34:56', 'findAllFilecount');
INSERT INTO `t_operationlog` VALUES ('105', '查询', '张三', '2017-06-12 17:35:28', 'findAllDepart');
INSERT INTO `t_operationlog` VALUES ('106', '查询', '张三', '2017-06-12 19:43:01', 'findRole');
INSERT INTO `t_operationlog` VALUES ('107', '查询', '张三', '2017-06-12 19:43:01', 'findUser[参数1，类型：String，值：(getBytes : [B@755008bf)]');
INSERT INTO `t_operationlog` VALUES ('108', '查询', '张三', '2017-06-12 19:43:01', 'findUser[参数1，类型：String，值：(getBytes : [B@537cb869)]');
INSERT INTO `t_operationlog` VALUES ('109', '查询', '张三', '2017-06-12 19:43:04', 'findRole');
INSERT INTO `t_operationlog` VALUES ('110', '查询', '张三', '2017-06-12 19:43:04', 'findUser[参数1，类型：String，值：(getBytes : [B@19c6a6be)]');
INSERT INTO `t_operationlog` VALUES ('111', '查询', '张三', '2017-06-12 19:43:04', 'findUser[参数1，类型：String，值：(getBytes : [B@35d0208f)]');
INSERT INTO `t_operationlog` VALUES ('112', '查询', '张三', '2017-06-12 19:43:06', 'findUserRole[参数1，类型：String，值：(getBytes : [B@4d18c2da)]');
INSERT INTO `t_operationlog` VALUES ('113', '查询', '张三', '2017-06-12 19:43:12', 'findRole');
INSERT INTO `t_operationlog` VALUES ('114', '查询', '张三', '2017-06-12 19:43:12', 'findUser[参数1，类型：String，值：(getBytes : [B@56222b01)]');
INSERT INTO `t_operationlog` VALUES ('115', '查询', '张三', '2017-06-12 19:43:12', 'findUser[参数1，类型：String，值：(getBytes : [B@7e9f201d)]');
INSERT INTO `t_operationlog` VALUES ('116', '查询', '张三', '2017-06-12 19:43:21', 'findUserRole[参数1，类型：String，值：(getBytes : [B@dd0ec73)]');
INSERT INTO `t_operationlog` VALUES ('117', '查询', '张三', '2017-06-12 19:43:25', 'findRole');
INSERT INTO `t_operationlog` VALUES ('118', '查询', '张三', '2017-06-12 19:43:25', 'findUser[参数1，类型：String，值：(getBytes : [B@47957cd3)]');
INSERT INTO `t_operationlog` VALUES ('119', '查询', '张三', '2017-06-12 19:43:25', 'findUser[参数1，类型：String，值：(getBytes : [B@61e17170)]');
INSERT INTO `t_operationlog` VALUES ('120', '查询', '张三', '2017-06-12 19:43:30', 'findUserRole[参数1，类型：String，值：(getBytes : [B@25a91e12)]');
INSERT INTO `t_operationlog` VALUES ('121', '查询', '张三', '2017-06-12 19:43:32', 'findRole');
INSERT INTO `t_operationlog` VALUES ('122', '查询', '张三', '2017-06-12 19:43:32', 'findUser[参数1，类型：String，值：(getBytes : [B@1a321fe)]');
INSERT INTO `t_operationlog` VALUES ('123', '查询', '张三', '2017-06-12 19:43:32', 'findUser[参数1，类型：String，值：(getBytes : [B@58e94c06)]');

-- ----------------------------
-- Table structure for t_power
-- ----------------------------
DROP TABLE IF EXISTS `t_power`;
CREATE TABLE `t_power` (
  `t_power_id` int(11) NOT NULL,
  `t_power_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `t_power_uri` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`t_power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_power
-- ----------------------------
INSERT INTO `t_power` VALUES ('1', '机构管理', 'branch_management.do');
INSERT INTO `t_power` VALUES ('2', '部门管理', 'depart_management.do');
INSERT INTO `t_power` VALUES ('3', '员工管理', 'user_management.do');
INSERT INTO `t_power` VALUES ('4', '我的日程', 'my_schedule.do');
INSERT INTO `t_power` VALUES ('5', '部门日程', 'depart_schedule.do');
INSERT INTO `t_power` VALUES ('6', '我的便签', 'my_note.do');
INSERT INTO `t_power` VALUES ('7', '文件管理', 'file_management.do');
INSERT INTO `t_power` VALUES ('9', '回收站', 'trash.do');
INSERT INTO `t_power` VALUES ('10', '文件搜索', 'file_search.do');
INSERT INTO `t_power` VALUES ('11', '消息管理', 'message_management.do');
INSERT INTO `t_power` VALUES ('12', '公告', 'publish.do');
INSERT INTO `t_power` VALUES ('13', '角色管理', 'role_management.do');
INSERT INTO `t_power` VALUES ('14', '登录日志', 'login_log.do');
INSERT INTO `t_power` VALUES ('15', '操作日志', 'operate_log.do');
INSERT INTO `t_power` VALUES ('16', '考勤', 'manualsign.do');
INSERT INTO `t_power` VALUES ('17', '考勤历史记录查询', 'manualsign_check.do');
INSERT INTO `t_power` VALUES ('18', '员工签到签退', 'sign.do');

-- ----------------------------
-- Table structure for t_precontract
-- ----------------------------
DROP TABLE IF EXISTS `t_precontract`;
CREATE TABLE `t_precontract` (
  `t_precontract_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_schedule_id` int(11) NOT NULL,
  `t_userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`t_precontract_id`),
  KEY `t_schedule_id` (`t_schedule_id`),
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_precontract_ibfk_1` FOREIGN KEY (`t_schedule_id`) REFERENCES `t_schedule` (`t_schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_precontract_ibfk_2` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_precontract
-- ----------------------------
INSERT INTO `t_precontract` VALUES ('1', '2', '3');
INSERT INTO `t_precontract` VALUES ('2', '1', '4');
INSERT INTO `t_precontract` VALUES ('3', '1', '5');

-- ----------------------------
-- Table structure for t_roleinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_roleinfo`;
CREATE TABLE `t_roleinfo` (
  `t_roleinfo_id` int(11) NOT NULL,
  `t_roleinfo_name` varchar(50) DEFAULT NULL,
  `t_roleinfo_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_roleinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roleinfo
-- ----------------------------
INSERT INTO `t_roleinfo` VALUES ('1', '系统管理员', '系统管理员');
INSERT INTO `t_roleinfo` VALUES ('2', '普通用户', '普通用户');

-- ----------------------------
-- Table structure for t_roleinfo_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_roleinfo_manage`;
CREATE TABLE `t_roleinfo_manage` (
  `t_roleinfo_manage_id` int(11) NOT NULL,
  `t_roleinfo_id` int(11) NOT NULL,
  `t_manage_id` int(11) NOT NULL,
  PRIMARY KEY (`t_roleinfo_manage_id`),
  KEY `t_roleinfo_id` (`t_roleinfo_id`),
  KEY `t_manage_id` (`t_manage_id`),
  CONSTRAINT `t_roleinfo_manage_ibfk_1` FOREIGN KEY (`t_roleinfo_id`) REFERENCES `t_roleinfo` (`t_roleinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_roleinfo_manage_ibfk_2` FOREIGN KEY (`t_manage_id`) REFERENCES `t_manage` (`t_manage_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_roleinfo_manage
-- ----------------------------
INSERT INTO `t_roleinfo_manage` VALUES ('1', '1', '1');
INSERT INTO `t_roleinfo_manage` VALUES ('2', '1', '2');
INSERT INTO `t_roleinfo_manage` VALUES ('3', '1', '3');
INSERT INTO `t_roleinfo_manage` VALUES ('4', '1', '4');
INSERT INTO `t_roleinfo_manage` VALUES ('5', '1', '5');
INSERT INTO `t_roleinfo_manage` VALUES ('6', '1', '6');
INSERT INTO `t_roleinfo_manage` VALUES ('7', '2', '2');
INSERT INTO `t_roleinfo_manage` VALUES ('8', '2', '3');
INSERT INTO `t_roleinfo_manage` VALUES ('9', '2', '4');
INSERT INTO `t_roleinfo_manage` VALUES ('10', '2', '7');

-- ----------------------------
-- Table structure for t_roleright
-- ----------------------------
DROP TABLE IF EXISTS `t_roleright`;
CREATE TABLE `t_roleright` (
  `t_roleright_id` int(11) NOT NULL,
  `t_roleinfo_id` int(11) DEFAULT NULL,
  `t_roleright_uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_roleright_id`),
  KEY `fk_t_roleinfo_id` (`t_roleinfo_id`),
  CONSTRAINT `fk_t_roleinfo_id` FOREIGN KEY (`t_roleinfo_id`) REFERENCES `t_roleinfo` (`t_roleinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roleright
-- ----------------------------
INSERT INTO `t_roleright` VALUES ('1', '1', '/oasystem/ManagerAction.do');
INSERT INTO `t_roleright` VALUES ('2', '2', '/oasystem/UserAction.do');

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule` (
  `t_schedule_id` int(11) NOT NULL,
  `t_schedule_title` varchar(50) NOT NULL,
  `t_schedule_address` varchar(50) NOT NULL,
  `t_meetinginfo_id` int(11) NOT NULL,
  `t_schedule_begintime` datetime NOT NULL,
  `t_schedule_endtime` datetime NOT NULL,
  `t_schedule_content` varchar(500) NOT NULL,
  `t_schedule_createuser` varchar(50) NOT NULL,
  `t_schedule_createtime` datetime NOT NULL,
  `t_schedule_ifprivate` int(11) NOT NULL,
  PRIMARY KEY (`t_schedule_id`),
  KEY `t_meetinginfo_id` (`t_meetinginfo_id`),
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`t_meetinginfo_id`) REFERENCES `t_meetinginfo` (`t_meetinginfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('1', '考察', '会以大楼', '2', '2017-05-31 16:37:59', '2017-06-01 16:38:04', '针对不想上班的问题 开展三查一严的讨论', '张经理', '2017-06-01 16:39:30', '1');
INSERT INTO `t_schedule` VALUES ('2', '开展', '食堂', '3', '2017-06-02 16:40:10', '2017-06-06 16:40:14', '光盘行动', '孙总', '2017-06-04 16:41:09', '0');

-- ----------------------------
-- Table structure for t_scheduleob
-- ----------------------------
DROP TABLE IF EXISTS `t_scheduleob`;
CREATE TABLE `t_scheduleob` (
  `t_scheduleob_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_departinfo_id` int(11) NOT NULL,
  `t_schedule_id` int(11) NOT NULL,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_branchinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_scheduleob_id`),
  KEY `t_scheduleob_ibfk_1` (`t_departinfo_id`),
  KEY `t_scheduleob_ibfk_2` (`t_schedule_id`),
  KEY `t_scheduleob_ibfk_3` (`t_userinfo_id`),
  KEY `t_scheduleob_ibfk_4` (`t_branchinfo_id`),
  CONSTRAINT `t_scheduleob_ibfk_1` FOREIGN KEY (`t_departinfo_id`) REFERENCES `t_departinfo` (`t_departinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_scheduleob_ibfk_2` FOREIGN KEY (`t_schedule_id`) REFERENCES `t_schedule` (`t_schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_scheduleob_ibfk_3` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_scheduleob_ibfk_4` FOREIGN KEY (`t_branchinfo_id`) REFERENCES `t_branchinfo` (`t_branchinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_scheduleob
-- ----------------------------
INSERT INTO `t_scheduleob` VALUES ('1', '1', '1', '4', '3');
INSERT INTO `t_scheduleob` VALUES ('3', '1', '2', '3', '4');
INSERT INTO `t_scheduleob` VALUES ('4', '1', '2', '2', '2');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `t_userinfo_id` int(11) NOT NULL,
  `t_userinfo_name` varchar(50) DEFAULT NULL,
  `t_userinfo_password` varchar(50) DEFAULT NULL,
  `t_departinfo_id` int(11) DEFAULT NULL,
  `t_userinfo_gender` varchar(10) DEFAULT NULL,
  `t_roleinfo_id` int(11) DEFAULT NULL,
  `t_userstate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_userinfo_id`),
  KEY `fk_t_userstate_id` (`t_userstate_id`),
  KEY `fk1_t_roleinfo_id` (`t_roleinfo_id`),
  CONSTRAINT `fk_t_userstate_id` FOREIGN KEY (`t_userstate_id`) REFERENCES `t_userstate` (`t_userstate_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('1', '张三', '123', '1', '男', '1', '1');
INSERT INTO `t_userinfo` VALUES ('2', '小丽', '1234', '2', '女', '2', '1');
INSERT INTO `t_userinfo` VALUES ('3', '陈晨', '12345', '3', '男', '1', '1');
INSERT INTO `t_userinfo` VALUES ('4', '程璧', '123456', '4', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('5', '罗丽', '1234567', '1', '女', '2', '1');
INSERT INTO `t_userinfo` VALUES ('6', '黄强', '123', '1', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('7', '黄瓜', '123', '1', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('8', '黄爆', '123', '1', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('9', '黄希', '123', '1', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('10', '黄牛', '123', '1', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('11', '黄倩', '123', '1', '男', '2', '1');

-- ----------------------------
-- Table structure for t_userstate
-- ----------------------------
DROP TABLE IF EXISTS `t_userstate`;
CREATE TABLE `t_userstate` (
  `t_userstate_id` int(11) NOT NULL,
  `t_userstate_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_userstate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userstate
-- ----------------------------
INSERT INTO `t_userstate` VALUES ('0', '被屏蔽');
INSERT INTO `t_userstate` VALUES ('1', '正常状态');

-- ----------------------------
-- Table structure for t_worktime
-- ----------------------------
DROP TABLE IF EXISTS `t_worktime`;
CREATE TABLE `t_worktime` (
  `t_worktime_id` int(11) DEFAULT NULL,
  `t_worktime_ondutytime` varchar(50) DEFAULT NULL,
  `t_worktime_offdutytime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_worktime
-- ----------------------------
INSERT INTO `t_worktime` VALUES ('1', '8:00', '17:00');
INSERT INTO `t_worktime` VALUES ('2', '8:00', '19:00');
INSERT INTO `t_worktime` VALUES ('3', '19:00', '7:00');
INSERT INTO `t_worktime` VALUES ('4', '19:00', '5:00');
