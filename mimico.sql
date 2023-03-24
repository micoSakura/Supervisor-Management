/*
 Navicat Premium Data Transfer

 Source Server         : mimico
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : mimico

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 25/03/2023 04:20:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `loginName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码',
  `realName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', 'admin', '男', '18070937682');
INSERT INTO `admin` VALUES (2, 'Xiaoming', '762169', '邱晓明', '男', '19114919459');
INSERT INTO `admin` VALUES (3, 'Shihan', '117610', '袁詩涵', '女', '13595453525');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courseNum` int NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `courseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `teacherName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师姓名',
  `startWeek` int NULL DEFAULT NULL COMMENT '起始周',
  `endWeek` int NULL DEFAULT NULL COMMENT '结束周',
  `courseWeek` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课星期',
  `courseTime` time NULL DEFAULT NULL COMMENT '上课时间',
  `courseAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课地点',
  PRIMARY KEY (`courseNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for listen
-- ----------------------------
DROP TABLE IF EXISTS `listen`;
CREATE TABLE `listen`  (
  `listenNum` int NOT NULL AUTO_INCREMENT COMMENT '听课编号',
  `supNum` int NULL DEFAULT NULL COMMENT '督导编号',
  `courseNum` int NULL DEFAULT NULL COMMENT '课程编号',
  `verifyState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '审核状态',
  `listenState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '听课状态',
  PRIMARY KEY (`listenNum`) USING BTREE,
  INDEX `courseNum`(`courseNum` ASC) USING BTREE,
  INDEX `supNum`(`supNum` ASC) USING BTREE,
  CONSTRAINT `courseNum` FOREIGN KEY (`courseNum`) REFERENCES `course` (`courseNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supNum` FOREIGN KEY (`supNum`) REFERENCES `supervisor` (`supNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listen
-- ----------------------------

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `recordNum` int NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `listenNum` int NOT NULL COMMENT '听课编号',
  `selection` int NULL DEFAULT NULL COMMENT '选课人数',
  `attendance` int NULL DEFAULT NULL COMMENT '出勤人数',
  `evaluation` float NULL DEFAULT NULL COMMENT '督导评分',
  `suggestion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '督导意见',
  `courseContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授课内容',
  PRIMARY KEY (`recordNum`) USING BTREE,
  INDEX `listenNum`(`listenNum` ASC) USING BTREE,
  CONSTRAINT `listenNum` FOREIGN KEY (`listenNum`) REFERENCES `listen` (`listenNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for supervisor
-- ----------------------------
DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE `supervisor`  (
  `supNum` int NOT NULL AUTO_INCREMENT COMMENT '督导编号',
  `supName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '督导姓名',
  `loginName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`supNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supervisor
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
