/*
Navicat MySQL Data Transfer

Source Server         : zhao
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : db_zxh

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-06-25 10:28:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('8', '丽丽', '22', '女', '18636446482', '太原', '1');
INSERT INTO `students` VALUES ('10', '赵旭伟', '22', '男', '17703404293', '太原', '1');
INSERT INTO `students` VALUES ('11', '李梅', '21', '女', '18838149986', '北京', '1');
INSERT INTO `students` VALUES ('12', '贺晓伟', '22', '男', '13994820145', '山西吕梁', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_sinhala_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_sinhala_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_sinhala_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'root', 'root');
INSERT INTO `t_user` VALUES ('2', 'zhao', 'zhao');
