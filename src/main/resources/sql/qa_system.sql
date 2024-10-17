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

 Date: 17/10/2024 19:54:24
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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `answers` VALUES (13, '我不会啊啊啊啊啊啊啊啊', 4, 5, '2024-10-14 22:06:24');
INSERT INTO `answers` VALUES (14, 'sadf', 1, 5, '2024-10-16 12:46:50');
INSERT INTO `answers` VALUES (15, '。。。', 5, 5, '2024-10-16 14:12:35');
INSERT INTO `answers` VALUES (16, '谁会啊，根本不会！！！', 8, 6, '2024-10-16 15:56:14');
INSERT INTO `answers` VALUES (17, '123456', 2, 10, '2024-10-16 16:03:09');
INSERT INTO `answers` VALUES (18, '嗨嗨嗨', 1, 10, '2024-10-16 17:11:53');
INSERT INTO `answers` VALUES (19, 'user1', 12, 15, '2024-10-17 19:11:31');
INSERT INTO `answers` VALUES (20, '看头像！！！', 2, 1, '2024-10-17 19:39:27');
INSERT INTO `answers` VALUES (21, '超长文本啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊超长文本啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊超长文本啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊超长文本啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊超长文本啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊超长文本啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', 2, 1, '2024-10-17 19:40:25');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 'test', 'test', 1, '2024-10-14 12:35:05');
INSERT INTO `questions` VALUES (2, 'title111', 'content111', 1, '2024-10-14 13:09:18');
INSERT INTO `questions` VALUES (4, '问题和回复一对多怎么弄', 'content111', 4, '2024-10-14 20:14:31');
INSERT INTO `questions` VALUES (5, '感冒发烧最佳解决办法？？？', '不吃药能好么。。。', 1, '2024-10-14 21:34:52');
INSERT INTO `questions` VALUES (6, 'test', 'test', 1, '2024-10-14 21:37:25');
INSERT INTO `questions` VALUES (7, 'sdafa', 'asfadfa', 1, '2024-10-16 15:41:15');
INSERT INTO `questions` VALUES (8, '谁会玩vue3', 'vue的store好难啊，根本不会获取session', 6, '2024-10-16 15:42:13');
INSERT INTO `questions` VALUES (9, 'sadsd', 'safdd', 10, '2024-10-17 18:08:46');
INSERT INTO `questions` VALUES (10, '超长标题啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', 'sdafdgafwfq', 10, '2024-10-17 18:21:03');
INSERT INTO `questions` VALUES (11, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'safweafw', 10, '2024-10-17 18:21:21');
INSERT INTO `questions` VALUES (12, 'user1', 'user1', 15, '2024-10-17 19:11:21');

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
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@qq.com', '2024-10-14 10:32:55', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410161753623.jpg');
INSERT INTO `users` VALUES (4, 'admin1', 'd41d8cd98f00b204e9800998ecf8427e', NULL, '2024-10-14 12:05:41', NULL);
INSERT INTO `users` VALUES (5, 'admin111', 'd41d8cd98f00b204e9800998ecf8427e', 'admin111@qq.com', '2024-10-14 12:08:46', NULL);
INSERT INTO `users` VALUES (6, 'admin001', 'e10adc3949ba59abbe56e057f20f883e', 'admin001@qq.com', '2024-10-16 14:43:15', NULL);
INSERT INTO `users` VALUES (7, 'admin002', 'e10adc3949ba59abbe56e057f20f883e', 'admin002@qq.com', '2024-10-16 14:46:12', NULL);
INSERT INTO `users` VALUES (9, 'admin003', 'e10adc3949ba59abbe56e057f20f883e', 'admin003@qq.com', '2024-10-16 15:02:15', NULL);
INSERT INTO `users` VALUES (10, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1@qq.com', '2024-10-16 15:58:07', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410161813754.png');
INSERT INTO `users` VALUES (11, '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3@qq.com', '2024-10-17 19:01:56', NULL);
INSERT INTO `users` VALUES (12, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'c4ca4238a0b923820dcc509a6f75849b', 'q@qq.com', '2024-10-17 19:05:32', NULL);
INSERT INTO `users` VALUES (13, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'c4ca4238a0b923820dcc509a6f75849b', 'q@qq.com', '2024-10-17 19:07:04', NULL);
INSERT INTO `users` VALUES (14, '4', 'a87ff679a2f3e71d9181a67b7542122c', '4@qq.com', '2024-10-17 19:08:21', NULL);
INSERT INTO `users` VALUES (15, 'user1', 'c4ca4238a0b923820dcc509a6f75849b', 'user1@qq.com', '2024-10-17 19:11:00', NULL);

SET FOREIGN_KEY_CHECKS = 1;
