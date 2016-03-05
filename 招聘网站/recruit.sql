/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : recruit

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-03-01 08:38:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(250) DEFAULT NULL,
  `companyname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `introduction` varchar(250) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '2', '2', '2', 'sss', 'www', 'www', '2');
INSERT INTO `company` VALUES ('3', '中国', '软件公司', '3333333@qq.com', '怎么没有了', 'eee', 'eee', '1234567');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(250) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `yaoqiu` varchar(250) DEFAULT NULL,
  `xinzi` varchar(50) DEFAULT NULL,
  `riqi` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('2', '北京', 'java工程师', '3', '任职要求：\r\n\r\n1、计算机相关专业，本科及以上学历；\r\n\r\n2、具备3年以上使用Java进行web开发的经验；精通SpringMVC、Mybatis、JQuery等框架开发；\r\n\r\n3、熟悉Linux下的常用命令，熟悉Linux下java开发，熟悉JAVAEE规范，具备技术架构设计能力；\r\n\r\n4、精通java语言开发，Java基础扎实，熟悉分布式、缓存、信息、搜索等机制；', '面议', '11', '1', '2');
INSERT INTO `job` VALUES ('3', '北京', '高级软件工程师', '1', '1、计算机相关专业，本科及以上学历；\r\n\r\n2、具备3年以上使用Java进行web开发的经验；精通SpringMVC、Mybatis、JQuery等框架开发；\r\n\r\n3、熟悉Linux下的常用命令，熟悉Linux下java开发，熟悉JAVAEE规范，具备技术架构设计能力；\r\n\r\n4、精通java语言开发，Java基础扎实，熟悉分布式、缓存、信息、搜索等机制；', '10000/月', '2016-02-05-10:41:58', '1', '2');
INSERT INTO `job` VALUES ('5', '34', '34', '34', '34', '34', '2016-02-05-13:47:50', '1', '2');
INSERT INTO `job` VALUES ('6', '2', 'w2', '1', 'wwwwq', 'w', '2016-02-05-18:54:25', '1', '2');
INSERT INTO `job` VALUES ('7', 'Washington', 'Washington', '2', 'Washington', 'Washington', '2016-02-05-18:25:55', '1', '2');
INSERT INTO `job` VALUES ('8', '中国', '软件工程师', '2', '会java会web', '面议', '2016-02-05-18:37:43', '3', '软件公司');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `mstatus` varchar(50) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `jid` int(11) DEFAULT NULL,
  `jname` varchar(50) DEFAULT NULL,
  `mshijian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('4', '1', '2', '已投递，公司已查看', '1', '1', 'qqq', '2', 'java工程师', '2016-02-05-16:02:38');
INSERT INTO `message` VALUES ('5', '1', '2', '已投递，公司已查看', '1', '1', 'qqq', '3', '高级软件工程师', '2016-02-05-17:32:48');
INSERT INTO `message` VALUES ('6', '1', '2', '已投递，公司已查看', '4', '1', 'qqq', '2', 'java工程师', '2016-02-05-17:46:56');
INSERT INTO `message` VALUES ('7', '1', '2', '已投递，公司已查看', '6', '1', 'qqq', '5', '34', '2016-02-05-18:16:07');
INSERT INTO `message` VALUES ('10', '3', '软件公司', '已投递，公司已拒接', '8', '1', 'qqq', '8', '软件工程师', '2016-02-05-18:38:00');
INSERT INTO `message` VALUES ('11', '3', '软件公司', '已投递，公司未查看', '11', '4', 'ttt', '8', '软件工程师', '2016-02-05-18:48:58');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `experience` longtext,
  `jobwant` varchar(250) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES ('1', '232', '232', '33', '33', '按时到岗', '333', '33', '2323', '女', '333', '1');
INSERT INTO `resume` VALUES ('2', '啊啊女', '按说', 'ww', 'www', 'qqwvv<br>', 'ww', '阿萨德', 'qqww', '男', '速度', '1');
INSERT INTO `resume` VALUES ('4', '22', '22', '22', '22', '22<br>', '22', '22', '22', '男', '22', '1');
INSERT INTO `resume` VALUES ('5', 'QQ', 'QWE', 'QQ', 'QQ', 'QQ<br>', 'QQ', 'QWE', 'QQ', '男', 'QWE', '1');
INSERT INTO `resume` VALUES ('6', 'aa', '1', 'Texas', 'Alabama', 'wweeq', 'Texas', '简历1', 'a', '男', '11', '1');
INSERT INTO `resume` VALUES ('8', '中国', '1999.9.9', '本科', '111111111111@qq.com', '从事java开发3年，有多个大型项目经验', 'java工程师', '我的简历', '111111111111', '女', '张三', '1');
INSERT INTO `resume` VALUES ('9', '齐全', '让人', '22ww', '11ww', '从事java开发3年，有多个大型项目经验', '33ww', '让人', '问问', '男', '让人', '1');
INSERT INTO `resume` VALUES ('11', 'tt', 'Massachusetts', 't', 'tt', 'tttt', 'ttt', 'tttqq', 'tt', '男', 'ttt', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'qqq', 'qqq');
INSERT INTO `user` VALUES ('3', 'www', 'qwe');
INSERT INTO `user` VALUES ('4', 'ttt', 'ttt');
INSERT INTO `user` VALUES ('5', 'rrrs', 'rrrs');
