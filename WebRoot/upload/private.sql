/*
Navicat MySQL Data Transfer

Source Server         : 周周
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : private

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-06-02 17:04:41
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
  CONSTRAINT `fk_t_fileinfo_id` FOREIGN KEY (`t_fileinfo_id`) REFERENCES `t_fileinfo` (`t_fileinfo_id`),
  CONSTRAINT `t_accessoryfile_ibfk_1` FOREIGN KEY (`t_fileinfo_filetypeid`) REFERENCES `t_filetypeinfo` (`t_fileinfo_filetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_accessoryfile
-- ----------------------------
INSERT INTO `t_accessoryfile` VALUES ('1', '1', '文档txt', '30', '1', '2017-06-02 15:09:53', 'D://jhojhojknkj');
INSERT INTO `t_accessoryfile` VALUES ('2', '2', '文件word', '50', '2', '2017-06-02 15:10:36', 'D://jhojhojknkj');
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
  CONSTRAINT `fk_t_branchinfo_id` FOREIGN KEY (`t_branchinfo_id`) REFERENCES `t_branchinfo` (`t_branchinfo_id`),
  CONSTRAINT `fk_t_userinfo_id` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`)
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
  CONSTRAINT `t_fileinfo_ibfk_1` FOREIGN KEY (`t_fileinfo_filetypeid`) REFERENCES `t_filetypeinfo` (`t_fileinfo_filetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fileinfo
-- ----------------------------
INSERT INTO `t_fileinfo` VALUES ('1', 'file1', '1', '备注1', '孙楷', '2017-06-02 00:00:00', '1', 'c://giuhi', '2');
INSERT INTO `t_fileinfo` VALUES ('2', 'file2', '1', '备注2', '孙楷', '2017-06-02 00:00:00', '1', 'c://giuhi', '2');
INSERT INTO `t_fileinfo` VALUES ('3', 'file3', '1', '备注3', '孙楷', '2017-06-02 00:00:00', '1', 'c://giuhi', '2');

-- ----------------------------
-- Table structure for t_filetypeinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_filetypeinfo`;
CREATE TABLE `t_filetypeinfo` (
  `t_fileinfo_filetypeid` int(11) DEFAULT NULL,
  `t_filetypeinfo_name` varchar(50) DEFAULT NULL,
  `t_filetypeinfo_image` varchar(50) DEFAULT NULL,
  `t_filetypeinfo_suffix` varchar(50) DEFAULT NULL,
  KEY `t_fileinfo_filetypeid` (`t_fileinfo_filetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_filetypeinfo
-- ----------------------------
INSERT INTO `t_filetypeinfo` VALUES ('1', 'txt', 'image1', '.txt');
INSERT INTO `t_filetypeinfo` VALUES ('2', 'word', 'image2', '.word');
INSERT INTO `t_filetypeinfo` VALUES ('3', 'excel', 'image3', '.sxml');

-- ----------------------------
-- Table structure for t_loginlog
-- ----------------------------
DROP TABLE IF EXISTS `t_loginlog`;
CREATE TABLE `t_loginlog` (
  `t_loginlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_userinfo_id` int(11) NOT NULL,
  `t_loginlog_time` datetime NOT NULL,
  `t_loginlog_ifsuccess` int(11) NOT NULL,
  `t_loginlog_userip` varchar(100) NOT NULL,
  `t_loginlog_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`t_loginlog_id`),
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_loginlog_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loginlog
-- ----------------------------
INSERT INTO `t_loginlog` VALUES ('1', '2', '2017-06-01 16:24:03', '1', 'shishe', '不存在');
INSERT INTO `t_loginlog` VALUES ('2', '4', '2017-05-29 16:26:24', '0', '232', '不存在');

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
  CONSTRAINT `t_manualsign_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manualsign
-- ----------------------------
INSERT INTO `t_manualsign` VALUES ('1', '1', '2017-06-02 15:23:47', 'hiknbi', '888');
INSERT INTO `t_manualsign` VALUES ('2', '3', '2017-06-02 15:24:20', 'hjokmn', '888');
INSERT INTO `t_manualsign` VALUES ('3', '5', '2017-06-02 15:24:38', 'hykjhn', '888');
INSERT INTO `t_manualsign` VALUES ('4', '2', '2017-06-02 15:24:55', 'tyihn', '888');
INSERT INTO `t_manualsign` VALUES ('5', '4', '2017-06-02 15:25:10', 'dsgfv', '888');

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
  KEY `t_messagetype_id` (`t_messagetype_id`)
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
  CONSTRAINT `k_t_message_id` FOREIGN KEY (`t_message_id`) REFERENCES `t_message` (`t_message_id`) ON DELETE NO ACTION,
  CONSTRAINT `k_t_userinfo_id` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE NO ACTION
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
  KEY `t_messagetype_id` (`t_messagetype_id`),
  CONSTRAINT `t_messagetype_ibfk_1` FOREIGN KEY (`t_messagetype_id`) REFERENCES `t_message` (`t_messagetype_id`)
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
INSERT INTO `t_mynote` VALUES ('1', '记事本', '我不想上班', '2017-06-02 16:29:28', '张永强');

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
  CONSTRAINT `t_operatelog_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operatelog
-- ----------------------------
INSERT INTO `t_operatelog` VALUES ('1', '2', '登录', '登录qq', '速度速度', '2017-06-21 16:35:16');
INSERT INTO `t_operatelog` VALUES ('2', '3', '注册', '注册微信', '收到收到', '2017-06-13 16:36:03');

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
  CONSTRAINT `t_precontract_ibfk_1` FOREIGN KEY (`t_schedule_id`) REFERENCES `t_schedule` (`t_schedule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `t_precontract_ibfk_2` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for t_roleright
-- ----------------------------
DROP TABLE IF EXISTS `t_roleright`;
CREATE TABLE `t_roleright` (
  `t_roleright_id` int(11) NOT NULL,
  `t_roleinfo_id` int(11) DEFAULT NULL,
  `t_roleright_uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_roleright_id`),
  KEY `fk_t_roleinfo_id` (`t_roleinfo_id`),
  CONSTRAINT `fk_t_roleinfo_id` FOREIGN KEY (`t_roleinfo_id`) REFERENCES `t_roleinfo` (`t_roleinfo_id`)
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
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`t_meetinginfo_id`) REFERENCES `t_meetinginfo` (`t_meetinginfo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('1', '考察', '会以大楼', '2', '2017-05-31 16:37:59', '2017-06-01 16:38:04', '针对不想上班的问题 开展三查一严的讨论', '张经理', '2017-06-01 16:39:30', '1');
INSERT INTO `t_schedule` VALUES ('2', '开展', '食堂', '3', '2017-06-02 16:40:10', '2017-06-06 16:40:14', '光盘行动', '孙总', '2017-06-04 16:41:09', '0');

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
  CONSTRAINT `fk_t_userstate_id` FOREIGN KEY (`t_userstate_id`) REFERENCES `t_userstate` (`t_userstate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('1', '张三', '123', '1', '男', '1', '1');
INSERT INTO `t_userinfo` VALUES ('2', '小丽', '1234', '2', '女', '2', '1');
INSERT INTO `t_userinfo` VALUES ('3', '陈晨', '12345', '3', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('4', '程璧', '123456', '4', '男', '2', '1');
INSERT INTO `t_userinfo` VALUES ('5', '罗丽', '1234567', '1', '女', '2', '1');

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
