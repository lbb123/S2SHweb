/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : collect

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-03-01 08:21:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) DEFAULT NULL,
  `atype` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '宣传部', '宣传部', 'admin', 'admin');

-- ----------------------------
-- Table structure for catelog
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) DEFAULT NULL,
  `ctype` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '经济', '启用');
INSERT INTO `catelog` VALUES ('2', '政治', '启用');
INSERT INTO `catelog` VALUES ('3', '人口资源环境', '启用');
INSERT INTO `catelog` VALUES ('4', '教科文卫体', '启用');
INSERT INTO `catelog` VALUES ('5', '社会和法制', '启用');
INSERT INTO `catelog` VALUES ('6', '民族和宗教', '启用');
INSERT INTO `catelog` VALUES ('7', '港澳台侨', '启用');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `mauthor` varchar(50) DEFAULT NULL,
  `mbeizhu` varchar(50) DEFAULT NULL,
  `mbianji` varchar(50) DEFAULT NULL,
  `mcatelog` varchar(50) DEFAULT NULL,
  `mcontent` varchar(250) DEFAULT NULL,
  `mdate` varchar(50) DEFAULT NULL,
  `mfenshu` varchar(50) DEFAULT NULL,
  `mfenshudate` varchar(50) DEFAULT NULL,
  `mlevel` varchar(50) DEFAULT NULL,
  `mnewcontent` varchar(250) DEFAULT NULL,
  `mpifu` varchar(50) DEFAULT NULL,
  `msendid` int(11) DEFAULT NULL,
  `msendname` varchar(50) DEFAULT NULL,
  `msendrole` varchar(50) DEFAULT NULL,
  `mtitle` varchar(150) DEFAULT NULL,
  `mtype` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `utype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '某民主党派和工商联', '无', '宣传部', '经济', '路灯太少，夜路不好走', '2016-02-29-16:46:24', '6', '2016-02-29-21:17:16', '急', '路灯太少，夜路不好走', '全国政协', '8', '全国政协', '全国政协', '关于路灯的建设2', '已采用', '1', '某民主党派和工商联', '民主党派和工商联');
INSERT INTO `message` VALUES ('2', '3', '某直报点', '无', '某直报点', '人口资源环境', '水污染严重', '2016-03-01-08:17:30', null, null, '普通', null, null, '0', null, null, '关于水的问', '等待上报', '5', '某直报点', '群众建议');
INSERT INTO `message` VALUES ('3', '3', '某直报点', '无', '宣传部', '人口资源环境', '水污染严重', '2016-03-01-08:19:34', '2', '2016-03-01-08:20:44', '普通', '水污染严重', '相关部门', '11', '相关部门', '相关部门', '关于水的问题2', '已采用', '5', '某直报点', '群众建议');
INSERT INTO `message` VALUES ('4', '1', '某直报点', '无', '某直报点', '经济', '好好修', '2016-03-01-08:19:20', null, null, '紧急', null, null, '0', null, null, '关于路灯的建设2', '等待上报', '5', '某直报点', '群众建议');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `urole` varchar(50) DEFAULT NULL,
  `utype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'qqq', 'qqq', '某民主党派和工商联', '上报信息单位', '民主党派和工商联');
INSERT INTO `user` VALUES ('2', 'qqq1', 'qqq', '张三委员', '上报信息单位', '政协委员');
INSERT INTO `user` VALUES ('3', 'qqq2', 'qqq2', '某市州政协', '上报信息单位', '市州政协');
INSERT INTO `user` VALUES ('4', 'qqq3', 'qqq', '某专委会', '上报信息单位', '专委会');
INSERT INTO `user` VALUES ('5', 'qqq4', 'qqq', '某直报点', '上报信息单位', '直报点');
INSERT INTO `user` VALUES ('6', 'www', 'www', '测试x', '上报信息单位', '测试x');
INSERT INTO `user` VALUES ('8', 'www1', 'www', '全国政协', '全国政协', '全国政协');
INSERT INTO `user` VALUES ('9', 'www2', 'www', '省委省政府领导', '专报省委省政府相关领导', '省委省政府相关领导');
INSERT INTO `user` VALUES ('10', 'www3', 'www', '省级部门', '省级部门', '省级部门');
INSERT INTO `user` VALUES ('11', 'www4', 'www', '相关部门', '相关部门', '相关部门');
