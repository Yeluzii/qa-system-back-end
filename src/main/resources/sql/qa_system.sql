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

 Date: 18/10/2024 17:30:40
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
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES (1, '俺也不会', 1, 1, '2024-10-18 13:55:40');
INSERT INTO `answers` VALUES (2, '+1', 1, 2, '2024-10-18 13:56:00');
INSERT INTO `answers` VALUES (3, '求大神们教教！！！', 1, 4, '2024-10-18 13:56:25');
INSERT INTO `answers` VALUES (4, '多喝热水！！！', 2, 2, '2024-10-18 14:29:43');
INSERT INTO `answers` VALUES (5, '好不了一点儿\n', 2, 4, '2024-10-18 14:30:02');
INSERT INTO `answers` VALUES (6, '快快快！！！', 1, 1, '2024-10-18 15:11:51');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, '问题与回复一对多怎么弄啊？', '问题与回复一对多，QuestionMapper.xml怎么写啊？', 5, '2024-10-18 13:55:12');
INSERT INTO `questions` VALUES (2, '感冒发烧不挂水能好么？', '39度，不挂水，不打针能好么？', 1, '2024-10-18 14:29:12');
INSERT INTO `questions` VALUES (3, '111', '111', 3, '2024-10-18 14:44:17');
INSERT INTO `questions` VALUES (4, '222', '222', 3, '2024-10-18 14:44:24');
INSERT INTO `questions` VALUES (5, '333', '333', 3, '2024-10-18 14:44:30');
INSERT INTO `questions` VALUES (6, '444', '444', 3, '2024-10-18 14:44:40');
INSERT INTO `questions` VALUES (7, '555', '555', 3, '2024-10-18 14:44:50');
INSERT INTO `questions` VALUES (8, '666', '666', 3, '2024-10-18 14:45:28');
INSERT INTO `questions` VALUES (9, '777', '777', 3, '2024-10-18 14:45:33');
INSERT INTO `questions` VALUES (10, '888', '888', 3, '2024-10-18 14:45:37');
INSERT INTO `questions` VALUES (11, '999', '999', 3, '2024-10-18 14:45:47');
INSERT INTO `questions` VALUES (12, '10', '10', 1, '2024-10-18 14:47:06');
INSERT INTO `questions` VALUES (13, '11', '11', 1, '2024-10-18 14:47:42');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1@qq.com', '2024-10-18 13:46:38', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410161753623.jpg');
INSERT INTO `users` VALUES (2, 'user1', 'c4ca4238a0b923820dcc509a6f75849b', 'user1@qq.com', '2024-10-18 13:48:16', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410161813754.png');
INSERT INTO `users` VALUES (3, 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'admin@qq.com', '2024-10-18 13:51:32', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410091043632.jpg');
INSERT INTO `users` VALUES (4, '2', 'c4ca4238a0b923820dcc509a6f75849b', '2@qq.com', '2024-10-18 13:52:33', 'https://yeluzi08-bucket.oss-cn-nanjing.aliyuncs.com/507586d3-22ae-417a-aaaf-ca9af87046c6_child1.jpg');
INSERT INTO `users` VALUES (5, 'user2', 'c4ca4238a0b923820dcc509a6f75849b', 'user2@qq.com', '2024-10-18 13:53:41', 'https://yeluzi08-bucket.oss-cn-nanjing.aliyuncs.com/11f29cad-b54c-4743-a9a0-1a7dfee47dc0_%E6%BC%AB%E7%94%BB%E9%A3%8E%E5%B0%8F%E5%AD%A91.webp');
INSERT INTO `users` VALUES (7, '3', 'c4ca4238a0b923820dcc509a6f75849b', '1@qq.com', '2024-10-18 17:29:48', NULL);

SET FOREIGN_KEY_CHECKS = 1;
