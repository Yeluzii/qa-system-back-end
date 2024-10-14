/*
 Navicat Premium Data Transfer

 Source Server         : yyy
 Source Server Type    : MySQL
 Source Server Version : 90000
 Source Host           : localhost:3306
 Source Schema         : qa_system

 Target Server Type    : MySQL
 Target Server Version : 90000
 File Encoding         : 65001

 Date: 14/10/2024 21:50:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES (1, 'answer', 1, 1, '2024-10-14 18:16:09');
INSERT INTO `answers` VALUES (2, 'answer321541', 1, 1, '2024-10-14 18:16:46');
INSERT INTO `answers` VALUES (3, 'testtesttest', 1, 1, '2024-10-14 18:36:45');
INSERT INTO `answers` VALUES (4, '我也不知道', 4, 1, '2024-10-14 20:58:00');
INSERT INTO `answers` VALUES (5, '求大神们教教', 4, 1, '2024-10-14 21:03:05');
INSERT INTO `answers` VALUES (7, '+1', 4, 5, '2024-10-14 21:10:46');
INSERT INTO `answers` VALUES (8, '俺也不会', 4, 5, '2024-10-14 21:11:51');
INSERT INTO `answers` VALUES (9, '+111', 4, 5, '2024-10-14 21:12:47');
INSERT INTO `answers` VALUES (10, '谁会啊啊啊啊啊啊', 4, 5, '2024-10-14 21:16:00');
INSERT INTO `answers` VALUES (11, '好不了一点儿。。。', 5, 5, '2024-10-14 21:35:08');
INSERT INTO `answers` VALUES (12, 'aaa', 6, 5, '2024-10-14 21:37:47');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(0) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 'test', 'test', 1, '2024-10-14 12:35:05');
INSERT INTO `questions` VALUES (2, 'title111', 'content111', 1, '2024-10-14 13:09:18');
INSERT INTO `questions` VALUES (4, '问题和回复一对多怎么弄', 'content111', 4, '2024-10-14 20:14:31');
INSERT INTO `questions` VALUES (5, '感冒发烧最佳解决办法？？？', '不吃药能好么。。。', 1, '2024-10-14 21:34:52');
INSERT INTO `questions` VALUES (6, 'test', 'test', 1, '2024-10-14 21:37:25');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@qq.com', '2024-10-14 10:32:55');
INSERT INTO `users` VALUES (4, 'admin1', 'd41d8cd98f00b204e9800998ecf8427e', NULL, '2024-10-14 12:05:41');
INSERT INTO `users` VALUES (5, 'admin111', 'd41d8cd98f00b204e9800998ecf8427e', 'admin111@qq.com', '2024-10-14 12:08:46');

SET FOREIGN_KEY_CHECKS = 1;
