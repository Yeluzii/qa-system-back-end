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

 Date: 19/10/2024 19:54:18
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES (1, '俺也不会', 1, 1, '2024-10-18 13:55:40');
INSERT INTO `answers` VALUES (2, '+1', 1, 2, '2024-10-18 13:56:00');
INSERT INTO `answers` VALUES (3, '求大神们教教！！！', 1, 4, '2024-10-18 13:56:25');
INSERT INTO `answers` VALUES (4, '多喝热水！！！', 2, 2, '2024-10-18 14:29:43');
INSERT INTO `answers` VALUES (5, '好不了一点儿\n', 2, 4, '2024-10-18 14:30:02');
INSERT INTO `answers` VALUES (6, '快快快！！！', 1, 1, '2024-10-18 15:11:51');
INSERT INTO `answers` VALUES (7, 'good！！！', 23, 1, '2024-10-19 14:36:28');
INSERT INTO `answers` VALUES (8, '1', 21, 1, '2024-10-19 15:40:10');
INSERT INTO `answers` VALUES (9, '2', 25, 4, '2024-10-19 15:42:14');
INSERT INTO `answers` VALUES (10, '1', 26, 1, '2024-10-19 17:29:27');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `questions` VALUES (14, '后端排序？', '后端排序？', 5, '2024-10-19 12:30:39');
INSERT INTO `questions` VALUES (15, '123', '123', 5, '2024-10-19 13:26:26');
INSERT INTO `questions` VALUES (16, '456', '123', 5, '2024-10-19 13:26:35');
INSERT INTO `questions` VALUES (17, '678', '123', 5, '2024-10-19 13:26:42');
INSERT INTO `questions` VALUES (18, 'yyy', '123', 5, '2024-10-19 13:27:01');
INSERT INTO `questions` VALUES (19, '333', '123', 5, '2024-10-19 13:27:35');
INSERT INTO `questions` VALUES (20, '2525', '123', 7, '2024-10-19 13:37:49');
INSERT INTO `questions` VALUES (21, '23456', '234', 2, '2024-10-19 13:44:03');
INSERT INTO `questions` VALUES (22, '测试富文本wangEditoor', '<h1 id=\"tfm1j\">test</h1><p><span style=\"background-color: rgb(238, 236, 224);\"><span style=\"font-size: var(--font-size);\">测试内容</span></span></p><pre><code class=\"JavaScript\">import NavList from \'@/components/NavList.vue\';\nimport { ref, computed, onMounted, nextTick } from \'vue\';\nimport axios from \'axios\';\nimport { useRouter } from \'vue-router\';\nimport { useStore } from \'vuex\';\nimport E from \'wangeditor\';\n\nconst store = useStore();\nconst router = useRouter();\nconst editorElem = ref(null);\nconst editorContent = ref(\'\');\n\nconst title = ref(\'\');\n\n// 使用 computed 获取 userId\nconst userId = computed(() =&gt; store.getters.getUserId);\n\n// 在组件挂载时获取当前用户信息\nonMounted(() =&gt; {\n    store.dispatch(\'fetchCurrentUser\');\n    nextTick(() =&gt; {\n        const editor = new E(editorElem.value);\n        editor.config.onchange = (newHtml: string) =&gt; {\n            editorContent.value = newHtml;\n        };\n        editor.create();\n    });\n});\n\nconst askQuestion = async () =&gt; {\n    try {\n        console.log(\"userId为：\" + userId.value);\n        if (!userId.value) {\n            alert(\"请先登录！\");\n            router.push(\"/login\");\n            return;\n        }\n\n        const response = await axios.post(\'http://localhost:8080/questions/ask\', { title: title.value, content: editorContent.value, userId: userId.value });\n        console.log(\'问题：\', response.data);\n        if (response.data.code === 201) {\n            alert(\"提问成功！\");\n            router.push(\'/questions\');\n        } else {\n            alert(\"提问失败！\");\n        }\n    } catch (error) {\n        console.error(\'提问失败:\', error);\n    }\n};</code></pre><p><span style=\"font-size: var(--font-size);\"></span><br/></p>', 1, '2024-10-19 14:16:45');
INSERT INTO `questions` VALUES (23, 'test富文本', '<h1 id=\"6uj0z\">test</h1><p><img src=\"https://tse4-mm.cn.bing.net/th/id/OIP-C.Ea8Uofam6YdbkX9gSbqxHQAAAA?w=148&amp;h=158&amp;c=7&amp;r=0&amp;o=5&amp;pid=1.7\" alt=\"测试个图片\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 4, '2024-10-19 14:20:47');
INSERT INTO `questions` VALUES (24, '视频', '<h1 id=\"wf899\">测试视频</h1><p><iframe height=\"600px\" width=\"800px\" src=\"https://www.bilibili.com/video/av230037074/?vd_source=d4211be49b60d8eedc7e53e8e89e984c\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>', 4, '2024-10-19 14:25:56');
INSERT INTO `questions` VALUES (25, 'iframe视频框架', '<p>测试iframe</p><p><iframe height=\"600px\" width=\"800px\" frameborder=\"0\" allowfullscreen=\"\" src=\"https://m3u8player.org/player.html?url=https://www.bilibili.com/video/av230037074/?vd_source=d4211be49b60d8eedc7e53e8e89e984c\"></iframe></p>', 1, '2024-10-19 15:09:09');
INSERT INTO `questions` VALUES (26, '图片视频显示大小？', '<p><img src=\"https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410161753623.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><iframe frameborder=\"0\" allowfullscreen=\"\" src=\"https://m3u8player.org/player.html?url=https://www.bilibili.com/video/av230037074/?vd_source=d4211be49b60d8eedc7e53e8e89e984c\"></iframe></p><p><video src=\"undefined\" poster=\"undefined\" controls=\"\" style=\"width: 60vw; height: auto;\"></video><br/></p>', 5, '2024-10-19 17:24:58');
INSERT INTO `questions` VALUES (27, '自定义图片上传接口', '<p><img src=\"http://localhost:8080/uploads/1729338608732_child1.jpg\" alt=\"图片描述\" data-href=\"%2Fuploads%2F1729338608732_child1.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1, '2024-10-19 19:50:33');
INSERT INTO `questions` VALUES (28, '视频自定义上传接口', '<p><video src=\"http://localhost:8080/uploads/1729338671137_关联查询接口测试演示.mp4\" controls=\"controls\" style=\"max-width:100%\"></video></p>', 1, '2024-10-19 19:51:32');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1@qq.com', '2024-10-18 13:46:38', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410161753623.jpg');
INSERT INTO `users` VALUES (2, 'user1', 'c4ca4238a0b923820dcc509a6f75849b', 'user1@qq.com', '2024-10-18 13:48:16', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410161813754.png');
INSERT INTO `users` VALUES (3, 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'admin@qq.com', '2024-10-18 13:51:32', 'https://yeluzi-pic-go.oss-cn-hangzhou.aliyuncs.com/md/202410091043632.jpg');
INSERT INTO `users` VALUES (4, '2', 'c4ca4238a0b923820dcc509a6f75849b', '2@qq.com', '2024-10-18 13:52:33', 'https://yeluzi08-bucket.oss-cn-nanjing.aliyuncs.com/507586d3-22ae-417a-aaaf-ca9af87046c6_child1.jpg');
INSERT INTO `users` VALUES (5, 'user2', 'c4ca4238a0b923820dcc509a6f75849b', 'user2@qq.com', '2024-10-18 13:53:41', 'https://yeluzi08-bucket.oss-cn-nanjing.aliyuncs.com/11f29cad-b54c-4743-a9a0-1a7dfee47dc0_%E6%BC%AB%E7%94%BB%E9%A3%8E%E5%B0%8F%E5%AD%A91.webp');
INSERT INTO `users` VALUES (7, '3', 'c4ca4238a0b923820dcc509a6f75849b', '1@qq.com', '2024-10-18 17:29:48', NULL);
INSERT INTO `users` VALUES (8, 'user3', 'c4ca4238a0b923820dcc509a6f75849b', 'user3@qq.com', '2024-10-19 15:06:05', NULL);

SET FOREIGN_KEY_CHECKS = 1;
