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

 Date: 11/03/2023 02:11:04
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
INSERT INTO `admin` VALUES (1, 'admin', '123456', '冯云熙', '男', '755-924-6747');
INSERT INTO `admin` VALUES (2, 'Xiaoming', '762169', '邱晓明', '男', '28-149-3782');
INSERT INTO `admin` VALUES (3, 'Shihan', '117610', '袁詩涵', '女', '755-840-3116');

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
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (5, 'Mango', '蔡安琪', 1, 6, '2', '23:33:13', '乐丰六路499号');
INSERT INTO `course` VALUES (6, 'iOrnnge', '韩云熙', 1, 8, '3', '13:28:41', '闵行区宾川路869号');
INSERT INTO `course` VALUES (7, 'Maygo', '汤晓明', 1, 15, '4', '17:16:39', '延庆区028县道328号');
INSERT INTO `course` VALUES (8, 'Chqrry', '余安琪', 1, 8, '5', '10:06:01', '東城区東直門內大街220号');
INSERT INTO `course` VALUES (9, 'Strawberry air', '袁宇宁', 1, 4, '7', '09:58:55', '房山区岳琉路734号');
INSERT INTO `course` VALUES (10, 'ambi-Mango', '邓璐', 1, 12, '5', '12:57:51', '罗湖区田贝一路546号');
INSERT INTO `course` VALUES (11, 'Kiwi', '龙子韬', 1, 8, '6', '16:55:48', '朝阳区三里屯路19号');
INSERT INTO `course` VALUES (12, 'Mango elite', '陶宇宁', 1, 9, '5', '16:13:56', '东城区东单王府井东街250号');
INSERT INTO `course` VALUES (13, 'ztrawberry mini', '黄宇宁', 1, 5, '6', '12:57:34', '朝阳区三里屯路664号');
INSERT INTO `course` VALUES (14, 'Mango', '顾嘉伦', 1, 13, '6', '17:17:28', '白云区机场路棠苑街五巷970号');
INSERT INTO `course` VALUES (15, 'Atple premium', '陶安琪', 1, 12, '6', '17:46:28', '浦东新区健祥路680号');
INSERT INTO `course` VALUES (16, 'xMaigo', '向岚', 1, 3, '5', '12:07:44', '龙岗区学园一巷939号');
INSERT INTO `course` VALUES (17, 'Raspbeary', '吴秀英', 1, 18, '3', '16:44:15', '西城区西長安街284号');
INSERT INTO `course` VALUES (18, 'gango', '孟安琪', 1, 13, '1', '16:31:43', '罗湖区清水河一路604号');
INSERT INTO `course` VALUES (19, 'Ooange', '郝致远', 1, 7, '4', '12:50:39', '罗湖区蔡屋围深南东路196号');
INSERT INTO `course` VALUES (20, 'Mango se', '马杰宏', 1, 16, '4', '15:17:31', '東城区東直門內大街750号');
INSERT INTO `course` VALUES (21, 'Raspbeyry', '莫詩涵', 1, 5, '星期一', '16:17:41', '锦江区人民南路四段361号');
INSERT INTO `course` VALUES (22, 'iGrape', '孔杰宏', 1, 9, '4', '17:09:29', '京华商圈华夏街806号');
INSERT INTO `course` VALUES (23, 'Pluots', '向子异', 1, 12, '7', '14:28:07', '西城区西長安街349号');
INSERT INTO `course` VALUES (24, 'Ryspberry', '徐詩涵', 1, 16, '6', '17:49:37', '坑美十五巷414号');
INSERT INTO `course` VALUES (25, 'Raspcerry', '韩嘉伦', 1, 16, '6', '10:50:57', '延庆区028县道884号');
INSERT INTO `course` VALUES (26, 'Grape core', '毛杰宏', 1, 3, '5', '14:11:31', '福田区景田东一街765号');
INSERT INTO `course` VALUES (27, 'Apple', '钟云熙', 1, 10, '2', '17:20:44', '東城区東直門內大街131号');
INSERT INTO `course` VALUES (28, 'omni-Mango', '唐詩涵', 1, 2, '3', '13:02:12', '闵行区宾川路803号');
INSERT INTO `course` VALUES (29, 'Kewi', '崔睿', 1, 5, '2', '16:12:57', '东泰五街718号');
INSERT INTO `course` VALUES (30, 'frange', '萧云熙', 1, 16, '1', '13:40:32', '朝阳区三里屯路318号');
INSERT INTO `course` VALUES (31, 'Orange', '余震南', 1, 4, '1', '11:16:01', '罗湖区清水河一路316号');
INSERT INTO `course` VALUES (32, 'iPluots', '龚安琪', 1, 6, '3', '13:51:12', '东泰五街940号');
INSERT INTO `course` VALUES (33, 'Oranfe', '叶杰宏', 1, 16, '2', '15:34:32', '浦东新区橄榄路656号');
INSERT INTO `course` VALUES (34, 'Apple pro', '彭嘉伦', 1, 16, '6', '10:22:32', '闵行区宾川路673号');
INSERT INTO `course` VALUES (35, 'Raspberry', '萧睿', 1, 11, '1', '10:15:33', '龙岗区学园一巷662号');
INSERT INTO `course` VALUES (36, 'Strawberuy', '张震南', 1, 17, '3', '14:15:29', '浦东新区健祥路268号');
INSERT INTO `course` VALUES (37, 'qambutan premium', '毛子异', 1, 9, '5', '14:00:08', '海淀区清河中街68号233号');
INSERT INTO `course` VALUES (38, 'Kiwi', '苏宇宁', 1, 18, '1', '10:09:16', '东泰五街349号');
INSERT INTO `course` VALUES (39, 'uiwi', '向致远', 1, 18, '1', '11:31:42', '朝阳区三里屯路715号');
INSERT INTO `course` VALUES (40, 'Rambutan', '任致远', 1, 5, '6', '16:33:13', '黄浦区淮海中路912号');
INSERT INTO `course` VALUES (41, 'Grape', '沈晓明', 1, 9, '3', '16:48:34', '罗湖区蔡屋围深南东路342号');
INSERT INTO `course` VALUES (42, 'Orange', '武詩涵', 1, 11, '3', '15:28:19', '東城区東直門內大街418号');
INSERT INTO `course` VALUES (43, 'aiwi pi', '王杰宏', 1, 9, '3', '13:49:20', '成华区二仙桥东三路718号');
INSERT INTO `course` VALUES (44, 'Cherry', '尹宇宁', 1, 6, '5', '10:49:36', '紫马岭商圈中山五路921号');
INSERT INTO `course` VALUES (45, 'Mango elite', '唐秀英', 1, 11, '3', '10:14:20', '坑美十五巷470号');
INSERT INTO `course` VALUES (46, 'Adple', '莫杰宏', 1, 16, '5', '16:39:29', '白云区机场路棠苑街五巷991号');
INSERT INTO `course` VALUES (47, 'Strawaerry', '丁睿', 1, 10, '2', '16:08:06', '白云区机场路棠苑街五巷743号');
INSERT INTO `course` VALUES (52, '玉婷', '刘', NULL, NULL, NULL, '10:26:22', '');
INSERT INTO `course` VALUES (53, 'Mango', '', NULL, NULL, NULL, '11:53:16', '乐丰六路499号');
INSERT INTO `course` VALUES (54, 'Mango', '蔡安琪', NULL, NULL, NULL, '11:53:16', '乐丰六路499号');

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
) ENGINE = InnoDB AUTO_INCREMENT = 287 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listen
-- ----------------------------
INSERT INTO `listen` VALUES (1, 26, 16, '0', '1');
INSERT INTO `listen` VALUES (4, 5, 39, '0', '1');
INSERT INTO `listen` VALUES (5, 19, 12, '0', '0');
INSERT INTO `listen` VALUES (6, 3, 24, '0', '0');
INSERT INTO `listen` VALUES (7, 17, 8, '0', '0');
INSERT INTO `listen` VALUES (8, 5, 6, '0', '1');
INSERT INTO `listen` VALUES (9, 30, 7, '0', '1');
INSERT INTO `listen` VALUES (10, 13, 23, '0', '0');
INSERT INTO `listen` VALUES (11, 13, 23, '0', '1');
INSERT INTO `listen` VALUES (12, 13, 23, '0', '1');
INSERT INTO `listen` VALUES (13, 13, 23, '0', '0');
INSERT INTO `listen` VALUES (15, 12, 45, '1', '0');
INSERT INTO `listen` VALUES (16, 8, 42, '1', '1');
INSERT INTO `listen` VALUES (17, 7, 36, '1', '1');
INSERT INTO `listen` VALUES (18, 32, 45, '1', '0');
INSERT INTO `listen` VALUES (19, 31, 12, '0', '0');
INSERT INTO `listen` VALUES (20, 22, 24, '1', '1');
INSERT INTO `listen` VALUES (21, 29, 45, '0', '1');
INSERT INTO `listen` VALUES (22, 14, 28, '1', '1');
INSERT INTO `listen` VALUES (24, 26, 20, '1', '0');
INSERT INTO `listen` VALUES (25, 3, 20, '1', '0');
INSERT INTO `listen` VALUES (65, 4, 7, '2', '1');
INSERT INTO `listen` VALUES (257, 51, 5, '1', '1');
INSERT INTO `listen` VALUES (259, 51, 7, '1', '1');
INSERT INTO `listen` VALUES (260, 51, 8, '1', '1');
INSERT INTO `listen` VALUES (261, 51, 9, '1', '1');
INSERT INTO `listen` VALUES (262, 51, 10, '1', '1');
INSERT INTO `listen` VALUES (264, 51, 12, '1', '1');
INSERT INTO `listen` VALUES (265, 51, 13, '1', '1');
INSERT INTO `listen` VALUES (266, 51, 14, '1', '1');
INSERT INTO `listen` VALUES (267, 51, 15, '1', '1');
INSERT INTO `listen` VALUES (268, 51, 16, '1', '0');
INSERT INTO `listen` VALUES (269, 51, 17, '1', '0');
INSERT INTO `listen` VALUES (270, 51, 18, '1', '0');
INSERT INTO `listen` VALUES (271, 51, 19, '1', '0');
INSERT INTO `listen` VALUES (280, 51, 5, '1', '3');
INSERT INTO `listen` VALUES (281, 51, 6, '1', '3');
INSERT INTO `listen` VALUES (282, 51, 7, '1', '3');
INSERT INTO `listen` VALUES (285, 51, 14, '0', '0');
INSERT INTO `listen` VALUES (286, 51, 11, '0', '0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 257, 67, 28, 20.78, 'Navicat is a multi-connections                    ', 'If you wait, all that happens is you get older.');
INSERT INTO `record` VALUES (3, 13, 78, 67, 87.95, 'The Main Window consists of several               ', 'I will greet this day with love in my heart.');
INSERT INTO `record` VALUES (4, 15, 27, 49, 41.22, 'It can also manage cloud databases                ', 'SSH serves to prevent such vulnerabilities        ');
INSERT INTO `record` VALUES (5, 10, 16, 36, 87.86, 'Navicat Data Modeler is a powerful                ', 'The On Startup feature allows you                 ');
INSERT INTO `record` VALUES (6, 21, 75, 8, 0.09, 'Navicat Monitor is a safe, simple                 ', 'The Information Pane shows the                    ');
INSERT INTO `record` VALUES (7, 5, 52, 53, 74.61, 'Import Wizard allows you to import                ', 'Sometimes you win, sometimes you learn.');
INSERT INTO `record` VALUES (9, 10, 58, 9, 30.07, 'Export Wizard allows you to export                ', 'It can also manage cloud databases                ');
INSERT INTO `record` VALUES (10, 5, 93, 27, 1.73, 'Success consists of going from                    ', 'A man is not old until regrets                    ');
INSERT INTO `record` VALUES (14, 12, 1, 1, 36.02, 'To open a query using an external                 ', 'If opportunity doesn’t knock, build a door.');
INSERT INTO `record` VALUES (15, 13, 24, 14, 70.5, 'Actually it is just in an idea                    ', 'It can also manage cloud databases                ');
INSERT INTO `record` VALUES (16, 4, 22, 57, 41.14, 'If it scares you, it might be a good thing to try.', 'It wasn’t raining when Noah built the ark.');
INSERT INTO `record` VALUES (17, 25, 17, 88, 78.84, 'It can also manage cloud databases                ', 'HTTP Tunneling is a method for                    ');
INSERT INTO `record` VALUES (18, 22, 72, 68, 90.85, 'A comfort zone is a beautiful place,              ', 'You must be the change you wish                   ');
INSERT INTO `record` VALUES (20, 19, 55, 43, 36.3, 'Champions keep playing until they get it right.', 'It collects process metrics such                  ');
INSERT INTO `record` VALUES (21, 6, 45, 24, 73.15, 'Navicat Monitor can be installed                  ', 'If the plan doesn’t work, change                ');
INSERT INTO `record` VALUES (23, 9, 48, 19, 71.08, 'To clear or reload various internal               ', 'To start working with your server                 ');
INSERT INTO `record` VALUES (25, 4, 22, 28, 10.74, 'I may not have gone where I intended              ', 'To start working with your server                 ');
INSERT INTO `record` VALUES (27, 1, 94, 21, 10.34, 'If opportunity doesn’t knock, build a door.     ', 'All journeys have secret destinations             ');
INSERT INTO `record` VALUES (28, 20, 87, 72, 3.83, 'Navicat allows you to transfer                    ', 'The On Startup feature allows you                 ');
INSERT INTO `record` VALUES (29, 18, 10, 10, 40.71, 'How we spend our days is, of course,              ', 'In other words, Navicat provides                  ');
INSERT INTO `record` VALUES (30, 13, 52, 20, 31.11, 'Monitored servers include MySQL,                  ', 'There is no way to happiness. Happiness           ');
INSERT INTO `record` VALUES (31, 12, 100, 49, 17.66, 'In the middle of winter I at last                 ', 'To successfully establish a new                   ');
INSERT INTO `record` VALUES (35, 10, 77, 72, 82.81, 'I will greet this day with love in my heart.', 'Navicat Monitor requires a repository             ');
INSERT INTO `record` VALUES (36, 65, 75, 73, 56.44, 'Navicat Monitor requires a repository             ', 'How we spend our days is, of course,              ');
INSERT INTO `record` VALUES (37, 6, 78, 93, 99.88, 'It can also manage cloud databases                ', 'Champions keep playing until they get it right.');
INSERT INTO `record` VALUES (38, 17, 33, 77, 44.72, 'To connect to a database or schema,               ', 'Navicat is a multi-connections                    ');
INSERT INTO `record` VALUES (40, 8, 4, 0, 29.22, 'Optimism is the one quality more                  ', 'The On Startup feature allows you                 ');
INSERT INTO `record` VALUES (42, 17, 71, 57, 83.49, 'Secure SHell (SSH) is a program                   ', 'A comfort zone is a beautiful place,              ');
INSERT INTO `record` VALUES (43, 11, 94, 65, 50.66, 'Remember that failure is an event, not a person.', 'Navicat Cloud could not connect                   ');
INSERT INTO `record` VALUES (45, 5, 23, 20, 89.66, 'HTTP Tunneling is a method for                    ', 'A comfort zone is a beautiful place,              ');
INSERT INTO `record` VALUES (46, 8, 95, 1, 56.85, 'To get a secure connection, the                   ', 'The Synchronize to Database function              ');
INSERT INTO `record` VALUES (47, 17, 5, 78, 22.78, 'The repository database can be                    ', 'Navicat allows you to transfer                    ');
INSERT INTO `record` VALUES (49, 21, 55, 31, 92.85, 'The On Startup feature allows you                 ', 'Navicat Monitor can be installed                  ');
INSERT INTO `record` VALUES (50, 11, 73, 27, 23.06, 'After comparing data, the window                  ', 'Actually it is just in an idea                    ');
INSERT INTO `record` VALUES (53, 259, 1, 1, 1, '1', '1');
INSERT INTO `record` VALUES (59, 280, 1, 1, 1, '1', '1');
INSERT INTO `record` VALUES (60, 281, 123, 123, 123, '123', '123');
INSERT INTO `record` VALUES (61, 282, 1, 1, 1, 'asdasd\nasdasdasd', 'asdaeqweas\nasdasdasd');

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supervisor
-- ----------------------------
INSERT INTO `supervisor` VALUES (1, '刘玉婷', 'Shihan', '123456', '女', '兽医助理', '10010');
INSERT INTO `supervisor` VALUES (2, '王安琪', 'Anqi', '373382', '女', '物流协调员', '149-1096-0439');
INSERT INTO `supervisor` VALUES (3, '孟安琪', 'Anqi', '212631', '女', '药剂师', '10-0342-5824');
INSERT INTO `supervisor` VALUES (4, '姚子异', 'Ziyi', '574777', '男', '办公室文员', '769-562-8937');
INSERT INTO `supervisor` VALUES (5, '秦宇宁', 'Yuning', '204316', '男', 'UX / UI设计员', '174-8955-6804');
INSERT INTO `supervisor` VALUES (6, '汤晓明', 'Xiaoming', '145293', '男', '兽医助理', '20-3407-2535');
INSERT INTO `supervisor` VALUES (7, '韦璐', 'Lu', '498596', '女', '财务分析师', '199-6740-9391');
INSERT INTO `supervisor` VALUES (8, '李嘉伦', 'Jialun', '183241', '男', '保险销售代理', '185-7598-6443');
INSERT INTO `supervisor` VALUES (9, '林云熙', 'Yunxi', '839774', '男', '销售经理', '755-850-4432');
INSERT INTO `supervisor` VALUES (10, '邓宇宁', 'Yuning', '115184', '男', '化妆师', '188-6056-9464');
INSERT INTO `supervisor` VALUES (11, '钱睿', 'Rui', '719112', '男', '活动经理', '20-0685-2912');
INSERT INTO `supervisor` VALUES (12, '孔震南', 'Zhennan', '836442', '男', '办公室文员', '10-8176-3891');
INSERT INTO `supervisor` VALUES (13, '马璐', 'Lu', '350756', '女', '客户服务经理', '161-3029-1636');
INSERT INTO `supervisor` VALUES (14, '邓致远', 'Zhiyuan', '302438', '男', '软件开发员', '185-7173-0927');
INSERT INTO `supervisor` VALUES (15, '唐安琪', 'Anqi', '937690', '女', '园艺家', '154-5875-4174');
INSERT INTO `supervisor` VALUES (16, '郭嘉伦', 'Jialun', '765881', '男', '药剂师', '10-0032-7505');
INSERT INTO `supervisor` VALUES (17, '尹震南', 'Zhennan', '608790', '男', '医生', '755-9159-7485');
INSERT INTO `supervisor` VALUES (18, '郑睿', 'Rui', '764765', '男', '软件开发员', '138-2676-8202');
INSERT INTO `supervisor` VALUES (19, '金子韬', 'Zitao', '214325', '男', '管家', '199-7864-4362');
INSERT INTO `supervisor` VALUES (20, '陶子异', 'Ziyi', '170963', '男', '化妆师', '191-0971-5452');
INSERT INTO `supervisor` VALUES (21, '宋晓明', 'Xiaoming', '956957', '男', '婚礼筹办者', '760-8565-0924');
INSERT INTO `supervisor` VALUES (22, '薛震南', 'Zhennan', '321582', '男', '牙医', '174-1962-1379');
INSERT INTO `supervisor` VALUES (23, '唐震南', 'Zhennan', '703810', '男', '水疗经理', '164-1109-2445');
INSERT INTO `supervisor` VALUES (24, '彭震南', 'Zhennan', '663824', '男', '客户经理', '755-155-5935');
INSERT INTO `supervisor` VALUES (25, '王杰宏', 'Jiehong', '353640', '男', '团体领导', '150-1406-2486');
INSERT INTO `supervisor` VALUES (26, '彭睿', 'Rui', '260218', '男', '作家', '10-4327-5974');
INSERT INTO `supervisor` VALUES (27, '姜子异', 'Ziyi', '507724', '男', '作家', '130-1295-6800');
INSERT INTO `supervisor` VALUES (28, '贺嘉伦', 'Jialun', '123046', '男', '美容师', '182-5205-7079');
INSERT INTO `supervisor` VALUES (29, '魏秀英', 'Xiuying', '498709', '女', '活动经理', '142-2570-6534');
INSERT INTO `supervisor` VALUES (30, '薛安琪', 'Anqi', '318231', '女', '管家', '176-9189-9229');
INSERT INTO `supervisor` VALUES (31, '郝震南', 'Zhennan', '426655', '男', '图书馆管理员', '140-9044-1790');
INSERT INTO `supervisor` VALUES (32, '熊致远', 'Zhiyuan', '461938', '男', '药剂师', '28-740-3771');
INSERT INTO `supervisor` VALUES (51, 'mimico', 'mimico', '123456', '男', 'mimico', '18070937682');

SET FOREIGN_KEY_CHECKS = 1;
