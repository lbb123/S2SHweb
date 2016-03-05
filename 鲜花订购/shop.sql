/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-02-26 11:34:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atype` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '0', 'admin', 'admin');
INSERT INTO `admin` VALUES ('2', '1', 'www', 'www');
INSERT INTO `admin` VALUES ('3', '1', 'eee', 'eee');
INSERT INTO `admin` VALUES ('4', '1', 'rrr', 'rrr');
INSERT INTO `admin` VALUES ('6', '1', '2323', '2323');
INSERT INTO `admin` VALUES ('7', '1', '111', '111');
INSERT INTO `admin` VALUES ('8', '1', 'eee', 'eee');

-- ----------------------------
-- Table structure for catelog
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cdetail` varchar(50) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `ctype` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '玫瑰鲜花', '浪漫恋情', '0');
INSERT INTO `catelog` VALUES ('2', '用途生日祝福', '生日祝福', '0');
INSERT INTO `catelog` VALUES ('3', '送友人', '友谊长久', '0');
INSERT INTO `catelog` VALUES ('4', '会议办公花', '会议用花', '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `gdate` varchar(50) DEFAULT NULL,
  `gdetail` varchar(250) DEFAULT NULL,
  `gkucun` int(11) DEFAULT NULL,
  `gname` varchar(50) DEFAULT NULL,
  `gpic` varchar(50) DEFAULT NULL,
  `gprice` varchar(50) DEFAULT NULL,
  `gtype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', '2016-02-24-21:43:16', '历经万世轮回，唯有对你的爱永世不忘。', '898', '一生一世', 'x1.png', '999', '0');
INSERT INTO `goods` VALUES ('3', '1', '2016-02-24-22:18:17', '特价就急急急急急急', '212', '特价玫瑰', 'x1.png', '22', '1');
INSERT INTO `goods` VALUES ('4', '1', '2016-02-26-10:28:13', '9朵红玫瑰+满天星+黄莺点缀.内衬白色棉纸,外围红色皱纹纸,粉色棉纸束腰,粉色丝带搭配', '999', '一生的期盼', '20160226102813x12.png', '199', '0');
INSERT INTO `goods` VALUES ('5', '2', '2016-02-26-10:30:37', '19朵香槟玫瑰单朵独立包装，紫色勿忘我外围，白紫色卷边纸双层包装，同色系丝带打结；12寸奶油蛋糕，赠送蜡烛、刀叉盘。', '999', '淡淡的祝福', '20160226103037x21.png', '888', '0');
INSERT INTO `goods` VALUES ('6', '3', '2016-02-26-10:36:10', '4枝多头白色百合,勿忘我、黄莺搭配,绿色皱纹纸圆形多层包装,绿色丝带扎束', '999', '你是我仅有的财富 我是你仅有的唯一', '20160226103610x31.png', '399', '2');
INSERT INTO `goods` VALUES ('7', '4', '2016-02-26-10:38:51', '粉百合16朵，粉玫瑰20朵，紫色洋兰20枝，配草点缀', '999', '会议桌花', '20160226103851x41.png', '399', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `mcontent` varchar(250) DEFAULT NULL,
  `mdate` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '花真的不错', '2016-02-25-18:25:43', '1');
INSERT INTO `message` VALUES ('2', '1', '花真的不错2', '2016-02-25-18:29:21', '1');
INSERT INTO `message` VALUES ('3', '1', '花真的不错3', '2016-02-25-18:29:27', '1');
INSERT INTO `message` VALUES ('4', '1', '花真的不错4', '2016-02-25-18:29:35', '1');
INSERT INTO `message` VALUES ('7', '3', 'aaaaaaaaaa', '2016-02-25-18:51:54', '1');
INSERT INTO `message` VALUES ('8', '3', 'qqq', '2016-02-25-20:34:33', '2');
INSERT INTO `message` VALUES ('9', '7', '这个花不错', '2016-02-26-10:42:56', '1');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `oiid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `gnum` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oiid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('2', '1', '2', '4');
INSERT INTO `orderitem` VALUES ('3', '1', '2', '5');
INSERT INTO `orderitem` VALUES ('4', '3', '3', '5');
INSERT INTO `orderitem` VALUES ('5', '3', '10', '6');
INSERT INTO `orderitem` VALUES ('6', '1', '100', '7');
INSERT INTO `orderitem` VALUES ('7', '1', '3', '8');
INSERT INTO `orderitem` VALUES ('8', '1', '1', '9');
INSERT INTO `orderitem` VALUES ('9', '3', '10', '10');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `oaddress` varchar(50) DEFAULT NULL,
  `obeizhu` varchar(250) DEFAULT NULL,
  `obiaohao` varchar(50) DEFAULT NULL,
  `odate` varchar(50) DEFAULT NULL,
  `oemail` varchar(50) DEFAULT NULL,
  `ofasong` varchar(50) DEFAULT NULL,
  `ofukuang` varchar(50) DEFAULT NULL,
  `oname` varchar(50) DEFAULT NULL,
  `ophone` varchar(50) DEFAULT NULL,
  `otype` varchar(50) DEFAULT NULL,
  `ozongjia` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('4', '中北大学', '111x', '20160225162603', '2016-02-25-16:26:03', 'qqq@qq.com', '送货上门', '货到付款', 'qqq', '11111111', '已付款未发货', '1998', '1');
INSERT INTO `orderlist` VALUES ('5', '中北大学', '22', '20160225162818', '2016-02-25-16:28:18', 'qqq@qq.com', '送货上门', '货到付款', 'qqq', '11111111', '已付款未发货', '2064', '1');
INSERT INTO `orderlist` VALUES ('6', '中北大学', 'w', '20160225162939', '2016-02-25-18:01:08', 'qqq@qq.com', '送货上门', '货到付款', 'qqq', '11111111', '已付款，商品已出库', '220', '1');
INSERT INTO `orderlist` VALUES ('7', '中北大学', '11', '20160225163029', '2016-02-25-17:59:55', 'qqq@qq.com', '送货上门', '货到付款', 'qqq', '11111111', '已付款，商品已出库', '99900', '1');
INSERT INTO `orderlist` VALUES ('10', '111', '', '20160225203021', '2016-02-25-20:30:21', '111', '送货上门', '货到付款', 'www', '111', '已付款未发货', '220', '2');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rcontent` varchar(50) DEFAULT NULL,
  `rdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '7', 'asdasdasd', '2016-02-25-19:38:59');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `idcard` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `uaddress` varchar(50) DEFAULT NULL,
  `udate` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'qqq@qq.com', '1111111111111x', 'qqq', 'qqq', '11111111', '男', '中北大学', '2016-02-25-20:18:22', '张三');
INSERT INTO `user` VALUES ('2', '111', '11111111111', 'www', 'www', '1111112', '男', '中北大学', '2016-02-26-11:00:18', '李四');
