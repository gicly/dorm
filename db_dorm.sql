/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_dorm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2022-05-21 16:21:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '111', 'Lero', '男', '123');

-- ----------------------------
-- Table structure for t_dorm
-- ----------------------------
DROP TABLE IF EXISTS `t_dorm`;
CREATE TABLE `t_dorm` (
  `dormId` int(11) NOT NULL AUTO_INCREMENT,
  `dormBuildId` int(11) DEFAULT NULL,
  `dormName` varchar(20) DEFAULT NULL,
  `dormType` varchar(20) DEFAULT NULL,
  `dormNumber` int(11) DEFAULT NULL,
  `dormTel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dormId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dorm
-- ----------------------------
INSERT INTO `t_dorm` VALUES ('1', '1', '220', '男', '6', '110');

-- ----------------------------
-- Table structure for t_dormbuild
-- ----------------------------
DROP TABLE IF EXISTS `t_dormbuild`;
CREATE TABLE `t_dormbuild` (
  `dormBuildId` int(11) NOT NULL AUTO_INCREMENT,
  `dormBuildName` varchar(20) DEFAULT NULL,
  `dormBuildDetail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dormBuildId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dormbuild
-- ----------------------------
INSERT INTO `t_dormbuild` VALUES ('1', '1栋', '这是一栋。。。');
INSERT INTO `t_dormbuild` VALUES ('4', '2栋', '这是2栋');
INSERT INTO `t_dormbuild` VALUES ('5', '3栋', '');
INSERT INTO `t_dormbuild` VALUES ('6', '4栋', '');
INSERT INTO `t_dormbuild` VALUES ('7', '5栋', '');
INSERT INTO `t_dormbuild` VALUES ('8', '6栋', '');
INSERT INTO `t_dormbuild` VALUES ('9', '7号楼', '女生宿舍');
INSERT INTO `t_dormbuild` VALUES ('10', '10号楼', '10号楼');

-- ----------------------------
-- Table structure for t_dormmanager
-- ----------------------------
DROP TABLE IF EXISTS `t_dormmanager`;
CREATE TABLE `t_dormmanager` (
  `dormManId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `dormBuildId` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dormManId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dormmanager
-- ----------------------------
INSERT INTO `t_dormmanager` VALUES ('2', 'manager2', '123', '4', '小张', '男', '123');
INSERT INTO `t_dormmanager` VALUES ('3', 'manager3', '123', '1', '小李', '女', '123');
INSERT INTO `t_dormmanager` VALUES ('4', 'manager4', '123', '5', '小陈', '男', '123');
INSERT INTO `t_dormmanager` VALUES ('5', 'manager5', '123', null, '小宋', '男', '123');
INSERT INTO `t_dormmanager` VALUES ('7', 'manager6', '123', null, '呵呵 ', '女', '123');
INSERT INTO `t_dormmanager` VALUES ('8', 'manager1', '123', '6', '小白', '男', '123');
INSERT INTO `t_dormmanager` VALUES ('9', 'manager7', '123', '7', '哈哈', '女', '123');
INSERT INTO `t_dormmanager` VALUES ('10', 'xiaoming', '123', '9', '小明', '男', '18789897878');
INSERT INTO `t_dormmanager` VALUES ('11', 'xiaolan', '123123', '10', '小兰', '女', '18789897878');

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record` (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `studentNumber` varchar(20) DEFAULT NULL,
  `studentName` varchar(30) DEFAULT NULL,
  `dormBuildId` int(11) DEFAULT NULL,
  `dormName` varchar(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`recordId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_record
-- ----------------------------
INSERT INTO `t_record` VALUES ('1', '002', '李四', '4', '120', '2014-01-01', '123');
INSERT INTO `t_record` VALUES ('3', '007', '测试1', '1', '221', '2014-08-11', '123');
INSERT INTO `t_record` VALUES ('4', '005', '赵起', '4', '220', '2014-08-12', '...');
INSERT INTO `t_record` VALUES ('5', '006', '王珂珂', '4', '111', '2014-08-12', '00');
INSERT INTO `t_record` VALUES ('6', '004', '李进', '6', '220', '2014-08-12', '....');
INSERT INTO `t_record` VALUES ('7', '004', '李进', '6', '220', '2014-08-12', '22');
INSERT INTO `t_record` VALUES ('8', '002', '李四', '4', '120', '2022-04-06', '上午缺勤');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `stuNum` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `dormBuildId` int(11) DEFAULT NULL,
  `dormName` varchar(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('2', '002', '123', '李四', '4', '120', '男', '32');
INSERT INTO `t_student` VALUES ('3', '003', '123', '王五', '5', '201', '男', '2');
INSERT INTO `t_student` VALUES ('4', '004', '123', '李进', '6', '220', '女', '1');
INSERT INTO `t_student` VALUES ('5', '005', '123', '赵起', '4', '220', '女', '123');
INSERT INTO `t_student` VALUES ('6', '006', '123', '王珂珂', '4', '111', '女', '111');
INSERT INTO `t_student` VALUES ('9', '007', '123', '测试1', '1', '221', '男', '123');
INSERT INTO `t_student` VALUES ('28', '001', '123', '测试1', '1', '111', '男', '123');
INSERT INTO `t_student` VALUES ('29', '008', '123', '测试3', '6', '123', '男', '123');
INSERT INTO `t_student` VALUES ('30', '009', '123', '测试4', '5', '123', '男', '123');
INSERT INTO `t_student` VALUES ('31', '010', '123', '小强', '4', '222', '男', '111');
INSERT INTO `t_student` VALUES ('32', '011', '123', '张三', '1', '101', '男', '18789897878');
INSERT INTO `t_student` VALUES ('33', '012', '123123', '赵六六', '4', '101', '男', '18789897878');
