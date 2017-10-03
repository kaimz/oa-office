/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : oaoffice

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-04-21 17:46:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `id` char(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `all_day` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `employee` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1b3p7rt0pshbhpdykde142v1v` (`employee`),
  CONSTRAINT `FK_1b3p7rt0pshbhpdykde142v1v` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendar
-- ----------------------------
INSERT INTO `calendar` VALUES ('4028815c5b55f08d015b55f258d00000', 'asdasd ', '2017-04-09 00:00:00', '2017-04-10 00:00:00', '1', '2017-04-10 11:39:57', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b55f08d015b55f5dd2f0001', 'zcszxc', '2017-04-10 00:00:00', '2017-04-10 00:00:00', '0', '2017-04-10 11:43:47', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b566e0a015b567bb2880000', 'asdasd', '2017-04-10 00:00:00', null, '1', '2017-04-10 14:09:58', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b566e0a015b567c85d20001', 'xzzxzx', '2017-04-09 00:00:00', '2017-04-12 00:00:00', '0', '2017-04-10 14:10:53', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b566e0a015b568127990002', 'dsd', '2017-04-10 00:00:00', '2017-04-10 00:00:00', '0', '2017-04-10 14:15:56', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b566e0a015b5697b51f0003', 'zxzxcxzc', '2017-04-10 00:00:00', '2017-04-10 00:00:00', '0', '2017-04-10 14:40:34', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b569e93015b56a1c6610000', 'jjjjj', '2017-04-10 14:51:28', '2017-04-10 14:51:29', '0', '2017-04-10 14:51:34', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b569e93015b56a5e6600001', '吃饭', '2017-04-09 00:00:00', null, '1', '2017-04-10 14:56:04', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b569e93015b56a6619a0002', '午睡', '2017-04-10 12:56:22', '2017-04-10 13:56:30', '0', '2017-04-10 14:56:36', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b56b16f015b56b23f630000', '午餐', '2017-04-11 12:09:26', null, '0', '2017-04-10 15:09:33', null, null, 'afasdfsaf');
INSERT INTO `calendar` VALUES ('4028815c5b56b16f015b56b4b77d0001', '午睡', '2017-04-10 12:12:01', null, '0', '2017-04-10 15:12:15', null, null, 'asdasfaf');
INSERT INTO `calendar` VALUES ('4028815c5b6191b2015b61a0b9de0012', 'chifan', '2017-04-12 12:06:01', '2017-04-12 12:30:08', '0', '2017-04-12 18:06:15', null, null, 'sadsa');
INSERT INTO `calendar` VALUES ('4028815c5b61a1c1015b61a296160000', 'asdas ', '2017-04-12 00:00:00', null, '1', '2017-04-12 18:08:16', null, null, 'sadsa');
INSERT INTO `calendar` VALUES ('4028815c5b6bd332015b6be0433e0000', '吃饭', '2017-04-14 12:00:39', '2017-04-14 17:51:47', '0', '2017-04-14 17:51:51', null, null, 'afasdfsaf');

-- ----------------------------
-- Table structure for deparment
-- ----------------------------
DROP TABLE IF EXISTS `deparment`;
CREATE TABLE `deparment` (
  `id` char(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` char(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parent` (`parentid`),
  CONSTRAINT `fk_parent` FOREIGN KEY (`parentid`) REFERENCES `deparment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deparment
-- ----------------------------
INSERT INTO `deparment` VALUES ('4028815c5b60f683015b60f8066f0000', '研发部三', '9b410bd609e811e781a3807ae40a8476', '', '2017-04-12 15:01:59', '2017-04-12 15:37:53');
INSERT INTO `deparment` VALUES ('4028815c5b60fdd0015b610102340000', '研发部四', '9b410bd609e811e781a3807ae40a8476', '就这样吧', '2017-04-12 15:11:47', '2017-04-19 17:01:41');
INSERT INTO `deparment` VALUES ('9b410bd609e811e781a3807ae40a8410', '研发部一', '9b410bd609e811e781a3807ae40a8476', null, '2017-03-20 10:13:38', null);
INSERT INTO `deparment` VALUES ('9b410bd609e811e781a3807ae40a8412', '研发部二', '9b410bd609e811e781a3807ae40a8476', null, '2017-03-20 10:13:42', null);
INSERT INTO `deparment` VALUES ('9b410bd609e811e781a3807ae40a8470', '财务部', null, null, '2017-03-20 10:13:45', null);
INSERT INTO `deparment` VALUES ('9b410bd609e811e781a3807ae40a8476', '研发部', null, null, '2017-03-20 10:13:48', null);
INSERT INTO `deparment` VALUES ('9b410bd609e811e781a3807ae40a8478', '综合管理部', null, null, '2017-03-20 10:13:51', null);
INSERT INTO `deparment` VALUES ('9b410bd609e811e781a3807ae40a8479', '人事部', null, null, '2017-03-20 10:13:54', null);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` char(32) NOT NULL,
  `loginname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `card` char(18) NOT NULL,
  `sex` int(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `realname` varchar(50) NOT NULL,
  `job` char(32) NOT NULL,
  `departmentid` char(32) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `roleid` char(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `isusing` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_loginname` (`loginname`),
  KEY `fk_job` (`job`),
  KEY `fk_depart` (`departmentid`),
  KEY `fk_role` (`roleid`),
  KEY `email` (`email`),
  CONSTRAINT `fk_depart` FOREIGN KEY (`departmentid`) REFERENCES `deparment` (`id`),
  CONSTRAINT `fk_job` FOREIGN KEY (`job`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('21312312', '123', '123456', '421', '1', '213@qq.com', '1311354532', 'sd', 'xiaozhang', '9b410bd609e811e781a3807ae40a8477', '9b410bd609e811e781a3807ae40a8479', null, '1111111', '2017-03-20 10:14:14', '2017-04-12 08:44:38', '1', '2017-04-11');
INSERT INTO `employee` VALUES ('4028815c5b5bd574015b5bd6a59c0000', 'zhnagkai', '123456', '421102199402195217', '1', 'qnight@qnight.cn', '18772383543', null, '张凯', '9b410bd609e811e781a3807ae40a8479', '9b410bd609e811e781a3807ae40a8412', null, '1111111', '2017-04-11 15:07:21', null, '1', '2017-04-11');
INSERT INTO `employee` VALUES ('afasdfsaf', '111', '123456', '234234', '1', '122312@qq.com', '1231241242', '123123', 'xiaozhu', '9b410bd609e811e781a3807ae40a8477', '9b410bd609e811e781a3807ae40a8412', null, '1111111', '2017-03-20 15:04:09', null, '1', '2017-04-11');
INSERT INTO `employee` VALUES ('asdasfaf', '11111', '123456', '21312312', '1', '12@qq.com', '123231231231', '12312', 'xiaokang', '9b410bd609e811e781a3807ae40a8477', '9b410bd609e811e781a3807ae40a8412', null, '1111111', '2017-04-10 09:06:48', '2017-04-11 16:34:20', '1', null);
INSERT INTO `employee` VALUES ('sadsa', '112', '123456', '213123', '0', '21@qq.com', '13131144', '23123', '朱亚文', '9b410bd609e811e781a3807ae40a8477', '9b410bd609e811e781a3807ae40a8410', null, '3333', '2017-04-10 16:40:07', null, '1', null);
INSERT INTO `employee` VALUES ('sefasdf', '1111', '123456', '123123', '1', '12312@qq.com', '12312312312', '214134', 'xiaoming', '9b410bd609e811e781a3807ae40a8478', '9b410bd609e811e781a3807ae40a8410', null, '1111111', '2017-03-20 16:54:39', null, '1', null);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('9b410bd609e811e781a3807ae40a8477', '部门经理', null, '2017-03-20 16:46:18', null);
INSERT INTO `job` VALUES ('9b410bd609e811e781a3807ae40a8478', '实习生', null, '2017-03-20 16:46:21', null);
INSERT INTO `job` VALUES ('9b410bd609e811e781a3807ae40a8479', '员工', null, '2017-03-20 16:46:24', null);

-- ----------------------------
-- Table structure for journal
-- ----------------------------
DROP TABLE IF EXISTS `journal`;
CREATE TABLE `journal` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `employeeid` char(32) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型，0是工作日志，1为个人日志别人看不到',
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5fh9qqdek4bh6s5t3asecjo59` (`employeeid`),
  CONSTRAINT `FK_5fh9qqdek4bh6s5t3asecjo59` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journal
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `isenble` tinyint(1) NOT NULL DEFAULT '0' COMMENT '启用，默认启用',
  `istop` tinyint(1) DEFAULT '0' COMMENT '置顶，默认no',
  `isRecommend` tinyint(1) DEFAULT '0' COMMENT '推荐,默认no',
  `employee` char(32) NOT NULL,
  `newstype` char(32) NOT NULL COMMENT '新闻类别，0是公司新闻，1是学习新闻',
  `is_recommend` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_drcbgdt3rkbnvkk5lhys9e1rh` (`newstype`),
  KEY `FK_554fioyvpn4a376b7ts6tgvc6` (`employee`),
  CONSTRAINT `FK_554fioyvpn4a376b7ts6tgvc6` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_drcbgdt3rkbnvkk5lhys9e1rh` FOREIGN KEY (`newstype`) REFERENCES `newtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('4028815c5b6689e9015b668abfdc0000', 'asdasd ', '<img alt=\"哭\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/cry.gif\" />', '1', null, '0', 'afasdfsaf', '13413413', null, null, '2017-04-13 17:00:19', null);
INSERT INTO `news` VALUES ('4028815c5b6689e9015b66928a6e0001', 'asdasdasd', 'asdasdasdasdzcas<img alt=\"偷笑\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/titter.gif\" />', '1', null, '0', 'afasdfsaf', '13413413', null, null, '2017-04-13 17:08:51', null);
INSERT INTO `news` VALUES ('4028815c5b6689e9015b669b0cc60002', 'asdasdas', '												dasdasd<img alt=\"大哭\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/wail.gif\" />', '1', null, '0', 'afasdfsaf', '355546465', null, '这是一则公告', '2017-04-13 17:18:09', '2017-04-14 11:55:04');
INSERT INTO `news` VALUES ('4028815c5b6689e9015b669bb2ff0003', 'asdasd ', 'asdasd', '0', null, '0', 'afasdfsaf', '13413413', null, 'asdasd', '2017-04-13 17:18:51', null);
INSERT INTO `news` VALUES ('4028815c5b6a9909015b6b107c2f0000', '斯蒂芬森的', '<img alt=\"惊讶\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/ohmy.gif\" />斯蒂芬斯蒂芬<img alt=\"吐舌头\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/tongue.gif\" />', '1', null, '0', 'afasdfsaf', '13413413', null, '斯蒂芬斯蒂芬', '2017-04-14 14:04:54', null);
INSERT INTO `news` VALUES ('4028815c5b7976e5015b7989465d0000', '图片', '<img src=\"/oa-office/upload/9d5f2598-24c0-4e4b-b457-40a5c967c40e.png\" alt=\"\" />', '1', null, '0', 'afasdfsaf', 'receive', null, '', '2017-04-17 09:31:31', null);

-- ----------------------------
-- Table structure for newtype
-- ----------------------------
DROP TABLE IF EXISTS `newtype`;
CREATE TABLE `newtype` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newtype
-- ----------------------------
INSERT INTO `newtype` VALUES ('13413413', '公告', null, '2017-04-13 14:49:15', null);
INSERT INTO `newtype` VALUES ('355546465', '技术新闻', null, '2017-04-13 14:49:18', null);
INSERT INTO `newtype` VALUES ('receive', '公司新闻', null, '2017-04-13 14:49:20', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `card` int(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1111111', 'admin', '0', null, null, '2017-04-10 16:38:19', null);
INSERT INTO `role` VALUES ('2222222', 'user', '1', null, null, '2017-04-10 16:38:16', null);
INSERT INTO `role` VALUES ('3333', 'personnel', '2', null, null, '2017-04-10 16:38:13', null);

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `employeeid` char(32) NOT NULL,
  `iscomplete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成，默认为0未完成',
  `description` varchar(20000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_h4bf1kxyr83867tbyd4wja44g` (`employeeid`),
  KEY `FK_b4keu6vn6yitvewpqgjbrr1sw` (`parentid`),
  CONSTRAINT `FK_b4keu6vn6yitvewpqgjbrr1sw` FOREIGN KEY (`parentid`) REFERENCES `schedule` (`id`),
  CONSTRAINT `FK_h4bf1kxyr83867tbyd4wja44g` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('12312142', '142423', 'afasdfsaf', '1', '2342314234', '2017-03-20 15:05:48', null, null, '0');
INSERT INTO `schedule` VALUES ('123123', '12312', '21312312', '1', '13123123', '2017-03-20 11:08:09', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b18ce1f015b18cebbac0000', 'asdas', '21312312', '0', 'dasdasdas', '2017-03-29 14:44:12', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b18e5c0015b18e6f2d30000', '123123', '21312312', '0', '123123123', '2017-03-29 15:10:39', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b18f726015b18f7cd4d0001', 'sdfsdf', '21312312', '1', 'sdfsdfsdf', '2017-03-29 15:29:04', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b18f726015b18fa0d900003', 'sadasd', '21312312', '1', 'asddasd', '2017-03-29 15:31:28', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b18fc0e015b18fca0580001', '123123', '21312312', '1', '123123123', '2017-03-29 15:34:21', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b19022c015b190645940001', '555555555555555', '21312312', '1', '55555555555555555555555555', '2017-03-29 15:44:53', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b19022c015b190a0a770004', 'sdffffffffffffffffffffff', 'afasdfsaf', '1', 'sdfffffffffffffffffffffffffff', '2017-03-29 15:49:00', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b196c2e015b196d1daa0001', 'asdasdasd', '21312312', '1', '<img src=\"/oa-office/upload/QQ图片20170206182541.png\" alt=\"\" />					', '2017-03-29 17:37:13', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b1d2424015b1d2db9610001', '88888888888888888888', '21312312', '1', '78888888888888888888888888888888', '2017-03-30 11:06:27', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b224d7d015b224e0eba0000', '33333', '21312312', '0', '333333333', '2017-03-31 10:59:52', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b227034015b2277a7ac0001', '213123', 'afasdfsaf', '1', '<img alt=\"???\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/tongue.gif\" /><img alt=\"??\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/smile.gif\" /><img alt=\"??\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/titter.gif\" /><img src=\"/oa-office/upload/QQ??20170206182541.png\" alt=\"\" />					', '2017-03-31 11:45:18', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b22fab0015b22fb4d230001', '4444444', 'afasdfsaf', '1', 'qwqeqweqw<img alt=\"??\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/mad.gif\" /><img alt=\"??\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/curse.gif\" /><img src=\"/oa-office/upload/00339b90-ffba-4b24-81f4-e78b6de39450.png\" alt=\"\" />', '2017-03-31 14:09:06', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b3baac5015b3bad04750001', '???4444444', '21312312', '1', 'adasdasdas', '2017-04-05 09:14:06', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b3bb232015b3bb2ebd70001', '???4444444', '21312312', '1', 'ssfsfsdfsd', '2017-04-05 09:20:33', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b3bb45f015b3bb56ff10001', '???4444444', '21312312', '1', 'asdasdas', '2017-04-05 09:23:18', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b3ca37e015b3cae20b60001', '???4444444', '21312312', '1', 'zxccscsdcsdcasx', '2017-04-05 13:54:56', null, '4028815c5b22fab0015b22fb4d230001', '0');
INSERT INTO `schedule` VALUES ('4028815c5b3ca37e015b3cb80a740003', '?????????', 'afasdfsaf', '1', '????????', '2017-04-05 14:05:26', null, null, '1');
INSERT INTO `schedule` VALUES ('4028815c5b3ca37e015b3cbfa0380005', '??????', 'afasdfsaf', '1', '??????', '2017-04-05 14:13:48', null, null, '1');
INSERT INTO `schedule` VALUES ('4028815c5b3cc324015b3cc3f9390001', '三翻四复', 'afasdfsaf', '1', '阿斯打扫打扫', '2017-04-05 14:18:36', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b4111b9015b411482c10001', '在心脏猝死增速', 'afasdfsaf', '0', '阿斯达斯', '2017-04-06 10:25:14', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b4111b9015b41348baf0003', '三翻四复', 'afasdfsaf', '1', '						阿斯打扫打扫', '2017-04-06 11:00:14', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b413c9a015b413d459e0001', '在心脏猝死增速', 'afasdfsaf', '1', '						阿斯达斯', '2017-04-06 11:09:46', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b413c9a015b4143d4c60003', '回复：???4444444', 'afasdfsaf', '1', '<img src=\"/oa-office/upload/5e28e472-035c-4989-bfe0-6498fe1d8dd7.png\" alt=\"\" />', '2017-04-06 11:16:56', null, '4028815c5b3ca37e015b3cae20b60001', '0');
INSERT INTO `schedule` VALUES ('4028815c5b413c9a015b4149428b0005', '在心脏猝死增速', 'afasdfsaf', '0', '						<img alt=\"偷笑\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/titter.gif\" /><img alt=\"微笑\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/smile.gif\" />阿斯达斯', '2017-04-06 11:22:51', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b60fdd0015b6109d7020002', 'test', '21312312', '1', '<img alt=\"偷笑\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/titter.gif\" /><img src=\"/oa-office/upload/f21b9bff-af80-4395-8056-323296ba2bd3.png\" alt=\"\" />', '2017-04-12 15:21:26', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b614ff6015b6151d3e50001', 'sadasdas', 'afasdfsaf', '1', 'adsdasdasd', '2017-04-12 16:40:04', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b615c37015b615e064f0001', 'zxcsdc', 'afasdfsaf', '1', 'asdasdasd', '2017-04-12 16:53:23', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b618a40015b618b52050001', 'adasd', 'afasdfsaf', '1', '大三大四阿斯大撒旦', '2017-04-12 17:42:52', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b618a40015b618cf1f60003', 'asdasd', 'afasdfsaf', '1', 'asdasdas', '2017-04-12 17:44:38', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b618a40015b618d9a2f0009', 'dasdasd', 'afasdfsaf', '1', 'asdasd', '2017-04-12 17:45:21', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b618a40015b618f6271000b', 'asdas', 'afasdfsaf', '1', 'dasd', '2017-04-12 17:47:18', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6191b2015b619652c10001', '21', 'afasdfsaf', '1', '123', '2017-04-12 17:54:53', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6191b2015b619886c70003', '阿斯大撒旦', 'afasdfsaf', '1', '阿萨德阿萨德', '2017-04-12 17:57:17', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6191b2015b619ae7c90009', 'sads', 'afasdfsaf', '1', '大三大四的', '2017-04-12 17:59:53', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6191b2015b619d3859000b', '阿斯大撒旦', 'afasdfsaf', '1', '阿萨德&nbsp;', '2017-04-12 18:02:25', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6191b2015b619d9996000d', 'a撒打算', 'afasdfsaf', '1', '阿萨德&nbsp;', '2017-04-12 18:02:50', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6191b2015b619ec488000f', 'asdas', 'afasdfsaf', '1', '大撒撒旦', '2017-04-12 18:04:06', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6191b2015b619fa5720011', '回复：asdas', 'sadsa', '1', '阿斯大撒旦<img alt=\"微笑\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/smile.gif\" />', '2017-04-12 18:05:04', null, '4028815c5b6191b2015b619ec488000f', '0');
INSERT INTO `schedule` VALUES ('4028815c5b64ba4b015b64bbbbb30001', '阿斯大撒旦', 'afasdfsaf', '1', '阿萨德的', '2017-04-13 08:34:36', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64ba4b015b64bc17f50003', '阿斯达斯', 'afasdfsaf', '1', '阿萨德的', '2017-04-13 08:35:00', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64ba4b015b64bc89ba0005', 'dsfds', 'afasdfsaf', '1', '范德萨第三方', '2017-04-13 08:35:29', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64ba4b015b64bcde970007', '阿斯达斯', 'afasdfsaf', '1', '阿萨德', '2017-04-13 08:35:51', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64ba4b015b64be60c40009', 'a速度', 'afasdfsaf', '1', '阿萨德', '2017-04-13 08:37:29', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64ba4b015b64beb9bd000b', '阿萨德', 'afasdfsaf', '1', '速度', '2017-04-13 08:37:52', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64d5aa015b6542f7120001', 'sdfsf', 'afasdfsaf', '1', 'asdasd', '2017-04-13 11:02:19', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64d5aa015b65438ccf0003', 'asdasd', 'afasdfsaf', '1', 'asdasd', '2017-04-13 11:02:57', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b64d5aa015b6543c1900005', 'asdasd', 'afasdfsaf', '1', 'asdasd', '2017-04-13 11:03:10', null, null, '0');
INSERT INTO `schedule` VALUES ('4028815c5b6bd332015b6be14f340002', 'asdasdasd', 'afasdfsaf', '1', 'asdasdas<img alt=\"微笑\" src=\"/oa-office/lib/dwz/xheditor/xheditor_emot/default/smile.gif\" />', '2017-04-14 17:52:59', null, null, '0');

-- ----------------------------
-- Table structure for semail
-- ----------------------------
DROP TABLE IF EXISTS `semail`;
CREATE TABLE `semail` (
  `id` char(32) NOT NULL,
  `scheduleid` char(32) NOT NULL,
  `sendid` char(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `isview` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_pfg0812n05abmbbpr61jf5ewb` (`scheduleid`),
  KEY `FK_7si6iq8hp37tedixptrrffnl2` (`sendid`),
  CONSTRAINT `FK_7si6iq8hp37tedixptrrffnl2` FOREIGN KEY (`sendid`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_pfg0812n05abmbbpr61jf5ewb` FOREIGN KEY (`scheduleid`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of semail
-- ----------------------------
INSERT INTO `semail` VALUES ('4028815c5b18f726015b18f7cd460000', '4028815c5b18f726015b18f7cd4d0001', 'afasdfsaf', '2017-03-29 15:29:04', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b18f726015b18fa0d900002', '4028815c5b18f726015b18fa0d900003', 'afasdfsaf', '2017-03-29 15:31:32', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b18fc0e015b18fca0510000', '4028815c5b18fc0e015b18fca0580001', 'afasdfsaf', '2017-03-29 15:34:21', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b19022c015b1906457d0000', '4028815c5b19022c015b190645940001', 'sefasdf', '2017-03-29 15:44:53', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b19022c015b190645cf0002', '4028815c5b19022c015b190645940001', 'afasdfsaf', '2017-03-29 15:44:53', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b19022c015b190a0a760003', '4028815c5b19022c015b190a0a770004', 'sefasdf', '2017-03-29 15:49:00', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b19022c015b190a0aac0005', '4028815c5b19022c015b190a0a770004', '21312312', '2017-03-29 15:49:00', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b196c2e015b196d1d800000', '4028815c5b196c2e015b196d1daa0001', 'afasdfsaf', '2017-03-29 17:37:13', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b196c2e015b196d1ebd0002', '4028815c5b196c2e015b196d1daa0001', 'sefasdf', '2017-03-29 17:37:13', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b1d2424015b1d2db95d0000', '4028815c5b1d2424015b1d2db9610001', 'afasdfsaf', '2017-03-30 11:06:27', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b1d2424015b1d2dba630002', '4028815c5b1d2424015b1d2db9610001', 'sefasdf', '2017-03-30 11:06:27', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b227034015b2277a7a60000', '4028815c5b227034015b2277a7ac0001', '21312312', '2017-03-31 11:45:18', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b22fab0015b22fb4d1d0000', '4028815c5b22fab0015b22fb4d230001', '21312312', '2017-03-31 14:09:06', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b3baac5015b3bad045f0000', '4028815c5b3baac5015b3bad04750001', 'afasdfsaf', '2017-04-05 09:14:06', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b3bb232015b3bb2ebca0000', '4028815c5b3bb232015b3bb2ebd70001', 'afasdfsaf', '2017-04-05 09:20:33', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b3bb232015b3bb2ec480002', '4028815c5b3bb232015b3bb2ebd70001', 'sefasdf', '2017-04-05 09:20:33', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b3bb45f015b3bb56fd80000', '4028815c5b3bb45f015b3bb56ff10001', 'afasdfsaf', '2017-04-05 09:23:18', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b3ca37e015b3cae20af0000', '4028815c5b3ca37e015b3cae20b60001', 'afasdfsaf', '2017-04-05 13:54:56', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b3ca37e015b3cb80a730002', '4028815c5b3ca37e015b3cb80a740003', '21312312', '2017-04-05 14:05:40', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b3ca37e015b3cbfa0370004', '4028815c5b3ca37e015b3cbfa0380005', '21312312', '2017-04-05 14:13:48', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b3cc324015b3cc3f91f0000', '4028815c5b3cc324015b3cc3f9390001', '21312312', '2017-04-05 14:18:36', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b4111b9015b41348baf0002', '4028815c5b4111b9015b41348baf0003', '21312312', '2017-04-06 11:00:14', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b413c9a015b413d45980000', '4028815c5b413c9a015b413d459e0001', '21312312', '2017-04-06 11:09:46', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b413c9a015b4143d4c60002', '4028815c5b413c9a015b4143d4c60003', '21312312', '2017-04-06 11:16:56', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b413c9a015b4143d5f10004', '4028815c5b413c9a015b4143d4c60003', 'sefasdf', '2017-04-06 11:16:56', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b60fdd0015b6109d7010001', '4028815c5b60fdd0015b6109d7020002', 'sadsa', '2017-04-12 15:21:26', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b60fdd0015b6109d9540003', '4028815c5b60fdd0015b6109d7020002', '4028815c5b5bd574015b5bd6a59c0000', '2017-04-12 15:21:27', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b614ff6015b6151d3e10000', '4028815c5b614ff6015b6151d3e50001', 'sadsa', '2017-04-12 16:40:04', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b615c37015b615e06260000', '4028815c5b615c37015b615e064f0001', 'sadsa', '2017-04-12 16:53:23', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618b51f90000', '4028815c5b618a40015b618b52050001', 'sadsa', '2017-04-12 17:42:52', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618cf1f60002', '4028815c5b618a40015b618cf1f60003', 'sadsa', '2017-04-12 17:44:38', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618cf21d0004', '4028815c5b618a40015b618cf1f60003', 'asdasfaf', '2017-04-12 17:44:38', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618cf24b0005', '4028815c5b618a40015b618cf1f60003', '4028815c5b5bd574015b5bd6a59c0000', '2017-04-12 17:44:38', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618cf2610006', '4028815c5b618a40015b618cf1f60003', 'sefasdf', '2017-04-12 17:44:38', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618cf28e0007', '4028815c5b618a40015b618cf1f60003', '21312312', '2017-04-12 17:44:38', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618d9a2f0008', '4028815c5b618a40015b618d9a2f0009', 'sadsa', '2017-04-12 17:45:21', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b618a40015b618f6271000a', '4028815c5b618a40015b618f6271000b', 'sadsa', '2017-04-12 17:47:18', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619652ba0000', '4028815c5b6191b2015b619652c10001', 'sadsa', '2017-04-12 17:54:53', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619886c70002', '4028815c5b6191b2015b619886c70003', 'sadsa', '2017-04-12 17:57:17', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b6198b8600004', '4028815c5b6191b2015b619886c70003', '4028815c5b5bd574015b5bd6a59c0000', '2017-04-12 17:57:30', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b6198e1ff0005', '4028815c5b6191b2015b619886c70003', '21312312', '2017-04-12 17:57:40', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b6198fe900006', '4028815c5b6191b2015b619886c70003', 'asdasfaf', '2017-04-12 17:57:48', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619901280007', '4028815c5b6191b2015b619886c70003', 'sefasdf', '2017-04-12 17:57:48', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619ae7c90008', '4028815c5b6191b2015b619ae7c90009', 'sadsa', '2017-04-12 17:59:53', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619d3859000a', '4028815c5b6191b2015b619d3859000b', 'sadsa', '2017-04-12 18:02:25', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619d9996000c', '4028815c5b6191b2015b619d9996000d', 'sadsa', '2017-04-12 18:02:50', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619ec488000e', '4028815c5b6191b2015b619ec488000f', 'sadsa', '2017-04-12 18:04:06', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b6191b2015b619fa5720010', '4028815c5b6191b2015b619fa5720011', 'afasdfsaf', '2017-04-12 18:05:04', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64ba4b015b64bbbbae0000', '4028815c5b64ba4b015b64bbbbb30001', 'sadsa', '2017-04-13 08:34:36', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64ba4b015b64bc17f50002', '4028815c5b64ba4b015b64bc17f50003', 'sadsa', '2017-04-13 08:35:00', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64ba4b015b64bc89ba0004', '4028815c5b64ba4b015b64bc89ba0005', 'sadsa', '2017-04-13 08:35:29', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64ba4b015b64bcde970006', '4028815c5b64ba4b015b64bcde970007', 'sadsa', '2017-04-13 08:35:51', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64ba4b015b64be60c30008', '4028815c5b64ba4b015b64be60c40009', 'sadsa', '2017-04-13 08:37:29', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64ba4b015b64beb9bd000a', '4028815c5b64ba4b015b64beb9bd000b', 'sadsa', '2017-04-13 08:37:52', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64d5aa015b6542f70c0000', '4028815c5b64d5aa015b6542f7120001', '4028815c5b5bd574015b5bd6a59c0000', '2017-04-13 11:02:19', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64d5aa015b65438ccf0002', '4028815c5b64d5aa015b65438ccf0003', 'sadsa', '2017-04-13 11:02:57', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b64d5aa015b6543c1900004', '4028815c5b64d5aa015b6543c1900005', 'sadsa', '2017-04-13 11:03:10', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6bd332015b6be14f340001', '4028815c5b6bd332015b6be14f340002', '4028815c5b5bd574015b5bd6a59c0000', '2017-04-14 17:52:59', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6bd332015b6be1599e0003', '4028815c5b6bd332015b6be14f340002', 'asdasfaf', '2017-04-14 17:53:02', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6bd332015b6be15a7d0004', '4028815c5b6bd332015b6be14f340002', '21312312', '2017-04-14 17:53:02', null, null, '1');
INSERT INTO `semail` VALUES ('4028815c5b6bd332015b6be15aaa0005', '4028815c5b6bd332015b6be14f340002', 'sadsa', '2017-04-14 17:53:02', null, null, '0');
INSERT INTO `semail` VALUES ('4028815c5b6bd332015b6be15b5b0006', '4028815c5b6bd332015b6be14f340002', 'sefasdf', '2017-04-14 17:53:02', null, null, '0');
INSERT INTO `semail` VALUES ('dwerwrwer', '12312142', 'afasdfsaf', '2017-03-30 16:16:18', null, null, '1');
INSERT INTO `semail` VALUES ('sfsdfsdaf', '123123', '21312312', '2017-03-29 10:51:32', null, null, '1');
