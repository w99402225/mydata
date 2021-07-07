/*
 Navicat Premium Data Transfer

 Source Server         : old database
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3307
 Source Schema         : maven3

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 28/06/2021 19:39:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for afford
-- ----------------------------
DROP TABLE IF EXISTS `afford`;
CREATE TABLE `afford`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `goods_id` int(0) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `buytime` datetime(0) NULL DEFAULT NULL,
  `amount` int(0) NOT NULL,
  `state` int(0) NOT NULL COMMENT '订单状态：0为待发货，1为已发货，2为确认收货',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodsid`(`goods_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `goodsid` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of afford
-- ----------------------------
INSERT INTO `afford` VALUES (2, 1, 2, 8184.00, '2021-01-18 22:32:06', 22, 0, NULL);
INSERT INTO `afford` VALUES (3, 7, 2, 3720.00, '2021-01-19 11:41:38', 10, 0, NULL);
INSERT INTO `afford` VALUES (4, 1, 3, 14014.00, '2021-06-24 13:12:26', 13, 0, NULL);
INSERT INTO `afford` VALUES (5, 1, 8, 12712.00, '2021-06-24 13:14:08', 14, 1, '浙江科技学院西和公寓');
INSERT INTO `afford` VALUES (6, 1, 5, 35065.00, '2021-06-24 13:20:25', 5, 1, '浙江科技学院西和公寓');
INSERT INTO `afford` VALUES (7, 1, 27, 4149.00, '2021-06-25 00:30:29', 3, 1, '浙江科技学院西和公寓');
INSERT INTO `afford` VALUES (8, 1, 31, 79764.00, '2021-06-25 02:43:38', 12, 1, '浙江科技学院');
INSERT INTO `afford` VALUES (9, 1, 21, 4920.00, '2021-06-25 04:17:16', 12, 1, '浙江科技学院');
INSERT INTO `afford` VALUES (10, 1, 21, 5330.00, '2021-06-26 18:17:07', 13, 0, '浙江科技学院');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `goods_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`user_id`) USING BTREE,
  INDEX `FK5pqwrvai06wp5v7r4yf5jcsdu`(`goods_id`) USING BTREE,
  CONSTRAINT `FK5pqwrvai06wp5v7r4yf5jcsdu` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (5, 4, 6, '4');
INSERT INTO `cart` VALUES (17, 27, 1, '2');
INSERT INTO `cart` VALUES (18, 31, 1, '3');
INSERT INTO `cart` VALUES (19, 5, 1, '2');
INSERT INTO `cart` VALUES (20, 8, 1, '2');
INSERT INTO `cart` VALUES (21, 34, 1, '5');
INSERT INTO `cart` VALUES (22, 1, 1, '1');
INSERT INTO `cart` VALUES (23, 1, 1, '3');
INSERT INTO `cart` VALUES (24, 6, 1, '2');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `gdesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `store_id` int(0) NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKddfqaioer9n24ptytr1gcuwq1`(`store_id`) USING BTREE,
  CONSTRAINT `FKddfqaioer9n24ptytr1gcuwq1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 503 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '商品114514', '1919810', 1000.00, '0.jpg', 1, 0);
INSERT INTO `goods` VALUES (2, '芳乃', 'yoshino', 372.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (3, '栞那', '花洒', 1078.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (4, '商品1', '商品描述1', 4296.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (5, '小丛雨一只', '丛雨', 666.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (6, '商品3', '商品描述3', 2595.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (7, '奶黄包', '蕾娜', 2204.00, '5.jpg', 1, 0);
INSERT INTO `goods` VALUES (8, '商品5', '商品描述5', 908.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (9, '商品6', '商品描述6', 2401.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (10, '商品7', '商品描述7', 2024.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (11, '商品8', '商品描述8', 4733.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (12, '商品9', '商品描述9', 621.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (13, '商品10', '商品描述10', 1072.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (14, '商品11', '商品描述11', 7031.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (15, '商品12', '商品描述12', 634.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (16, '商品13', '商品描述13', 8524.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (17, '商品14', '商品描述14', 1099.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (18, '商品15', '商品描述15', 5353.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (19, '商品16', '商品描述16', 9110.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (20, '商品17', '商品描述17', 3005.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (21, '商品18', '商品描述18', 410.00, '1.jpg', 1, 0);
INSERT INTO `goods` VALUES (22, '商品19', '商品描述19', 9145.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (23, '商品20', '商品描述20', 7056.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (24, '商品21', '商品描述21', 3611.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (25, '商品22', '商品描述22', 4149.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (26, '商品23', '商品描述23', 2469.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (27, '商品24', '商品描述24', 1383.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (28, '商品25', '商品描述25', 2621.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (29, '商品26', '商品描述26', 5305.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (30, '商品27', '商品描述27', 1745.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (31, '商品28', '商品描述28', 6647.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (32, '商品29', '商品描述29', 9462.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (33, '商品30', '商品描述30', 3353.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (34, '商品31', '商品描述31', 9524.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (35, '商品32', '商品描述32', 3990.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (36, '商品33', '商品描述33', 9557.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (37, '商品34', '商品描述34', 8109.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (38, '商品35', '商品描述35', 4435.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (39, '商品36', '商品描述36', 9849.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (40, '商品37', '商品描述37', 1706.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (41, '商品38', '商品描述38', 8539.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (42, '商品39', '商品描述39', 2657.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (43, '商品40', '商品描述40', 5424.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (44, '商品41', '商品描述41', 608.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (45, '商品42', '商品描述42', 8748.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (46, '商品43', '商品描述43', 8762.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (47, '商品44', '商品描述44', 371.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (48, '商品45', '商品描述45', 3619.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (49, '商品46', '商品描述46', 5878.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (50, '商品47', '商品描述47', 6290.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (51, '商品48', '商品描述48', 6697.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (52, '商品49', '商品描述49', 3355.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (53, '商品50', '商品描述50', 7124.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (54, '商品51', '商品描述51', 898.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (55, '商品52', '商品描述52', 1351.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (56, '商品53', '商品描述53', 227.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (57, '商品54', '商品描述54', 5626.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (58, '商品55', '商品描述55', 1446.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (59, '商品56', '商品描述56', 8456.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (60, '商品57', '商品描述57', 1534.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (61, '商品58', '商品描述58', 7431.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (62, '商品59', '商品描述59', 6859.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (63, '商品60', '商品描述60', 4689.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (64, '商品61', '商品描述61', 6188.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (65, '商品62', '商品描述62', 4275.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (66, '商品63', '商品描述63', 9125.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (67, '商品64', '商品描述64', 3769.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (68, '商品65', '商品描述65', 6694.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (69, '商品66', '商品描述66', 9394.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (70, '商品67', '商品描述67', 5274.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (71, '商品68', '商品描述68', 8535.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (72, '商品69', '商品描述69', 2475.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (73, '商品70', '商品描述70', 6114.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (74, '商品71', '商品描述71', 3704.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (75, '商品72', '商品描述72', 1581.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (76, '商品73', '商品描述73', 1146.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (77, '商品74', '商品描述74', 1412.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (78, '商品75', '商品描述75', 2679.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (79, '商品76', '商品描述76', 7949.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (80, '商品77', '商品描述77', 6841.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (81, '商品78', '商品描述78', 9213.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (82, '商品79', '商品描述79', 1385.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (83, '商品80', '商品描述80', 5823.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (84, '商品81', '商品描述81', 7194.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (85, '商品82', '商品描述82', 619.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (86, '商品83', '商品描述83', 6359.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (87, '商品84', '商品描述84', 3725.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (88, '商品85', '商品描述85', 3073.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (89, '商品86', '商品描述86', 815.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (90, '商品87', '商品描述87', 8678.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (91, '商品88', '商品描述88', 5189.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (92, '商品89', '商品描述89', 7667.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (93, '商品90', '商品描述90', 4865.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (94, '商品91', '商品描述91', 9727.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (95, '商品92', '商品描述92', 4369.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (96, '商品93', '商品描述93', 4038.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (97, '商品94', '商品描述94', 7142.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (98, '商品95', '商品描述95', 5925.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (99, '商品96', '商品描述96', 8583.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (100, '商品97', '商品描述97', 2727.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (101, '商品98', '商品描述98', 1598.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (102, '商品99', '商品描述99', 5242.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (103, '商品100', '商品描述100', 6253.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (104, '商品101', '商品描述101', 3519.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (105, '商品102', '商品描述102', 2618.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (106, '商品103', '商品描述103', 864.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (107, '商品104', '商品描述104', 1222.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (108, '商品105', '商品描述105', 7977.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (109, '商品106', '商品描述106', 8673.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (110, '商品107', '商品描述107', 9865.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (111, '商品108', '商品描述108', 6929.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (112, '商品109', '商品描述109', 1833.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (113, '商品110', '商品描述110', 3504.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (114, '商品111', '商品描述111', 7225.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (115, '商品112', '商品描述112', 6408.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (116, '商品113', '商品描述113', 8851.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (117, '商品114', '商品描述114', 2066.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (118, '商品115', '商品描述115', 8055.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (119, '商品116', '商品描述116', 6604.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (120, '商品117', '商品描述117', 248.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (121, '商品118', '商品描述118', 948.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (122, '商品119', '商品描述119', 3376.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (123, '商品120', '商品描述120', 7960.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (124, '商品121', '商品描述121', 6296.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (125, '商品122', '商品描述122', 5509.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (126, '商品123', '商品描述123', 7305.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (127, '商品124', '商品描述124', 2781.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (128, '商品125', '商品描述125', 9181.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (129, '商品126', '商品描述126', 8447.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (130, '商品127', '商品描述127', 6000.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (131, '商品128', '商品描述128', 8315.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (132, '商品129', '商品描述129', 8743.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (133, '商品130', '商品描述130', 7033.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (134, '商品131', '商品描述131', 1215.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (135, '商品132', '商品描述132', 3067.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (136, '商品133', '商品描述133', 5187.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (137, '商品134', '商品描述134', 8728.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (138, '商品135', '商品描述135', 3814.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (139, '商品136', '商品描述136', 7289.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (140, '商品137', '商品描述137', 5366.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (141, '商品138', '商品描述138', 7429.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (142, '商品139', '商品描述139', 5105.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (143, '商品140', '商品描述140', 1142.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (144, '商品141', '商品描述141', 1743.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (145, '商品142', '商品描述142', 5038.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (146, '商品143', '商品描述143', 6327.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (147, '商品144', '商品描述144', 6504.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (148, '商品145', '商品描述145', 5630.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (149, '商品146', '商品描述146', 5621.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (150, '商品147', '商品描述147', 9167.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (151, '商品148', '商品描述148', 890.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (152, '商品149', '商品描述149', 8809.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (153, '商品150', '商品描述150', 1848.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (154, '商品151', '商品描述151', 2635.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (155, '商品152', '商品描述152', 4479.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (156, '商品153', '商品描述153', 131.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (157, '商品154', '商品描述154', 5957.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (158, '商品155', '商品描述155', 4159.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (159, '商品156', '商品描述156', 3700.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (160, '商品157', '商品描述157', 6194.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (161, '商品158', '商品描述158', 9975.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (162, '商品159', '商品描述159', 5259.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (163, '商品160', '商品描述160', 7383.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (164, '商品161', '商品描述161', 7719.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (165, '商品162', '商品描述162', 2405.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (166, '商品163', '商品描述163', 4631.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (167, '商品164', '商品描述164', 3924.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (168, '商品165', '商品描述165', 5694.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (169, '商品166', '商品描述166', 1118.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (170, '商品167', '商品描述167', 4019.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (171, '商品168', '商品描述168', 458.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (172, '商品169', '商品描述169', 3919.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (173, '商品170', '商品描述170', 4675.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (174, '商品171', '商品描述171', 4698.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (175, '商品172', '商品描述172', 7509.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (176, '商品173', '商品描述173', 7032.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (177, '商品174', '商品描述174', 6802.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (178, '商品175', '商品描述175', 4947.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (179, '商品176', '商品描述176', 5097.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (180, '商品177', '商品描述177', 5630.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (181, '商品178', '商品描述178', 1246.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (182, '商品179', '商品描述179', 1344.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (183, '商品180', '商品描述180', 8778.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (184, '商品181', '商品描述181', 2580.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (185, '商品182', '商品描述182', 6741.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (186, '商品183', '商品描述183', 9241.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (187, '商品184', '商品描述184', 6592.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (188, '商品185', '商品描述185', 7124.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (189, '商品186', '商品描述186', 4310.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (190, '商品187', '商品描述187', 275.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (191, '商品188', '商品描述188', 393.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (192, '商品189', '商品描述189', 5878.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (193, '商品190', '商品描述190', 1618.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (194, '商品191', '商品描述191', 7258.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (195, '商品192', '商品描述192', 7547.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (196, '商品193', '商品描述193', 2327.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (197, '商品194', '商品描述194', 1631.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (198, '商品195', '商品描述195', 9303.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (199, '商品196', '商品描述196', 1466.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (200, '商品197', '商品描述197', 8927.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (201, '商品198', '商品描述198', 5270.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (202, '商品199', '商品描述199', 2541.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (203, '商品200', '商品描述200', 1953.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (204, '商品201', '商品描述201', 8390.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (205, '商品202', '商品描述202', 319.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (206, '商品203', '商品描述203', 4270.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (207, '商品204', '商品描述204', 8846.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (208, '商品205', '商品描述205', 3289.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (209, '商品206', '商品描述206', 1295.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (210, '商品207', '商品描述207', 895.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (211, '商品208', '商品描述208', 4924.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (212, '商品209', '商品描述209', 5552.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (213, '商品210', '商品描述210', 7512.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (214, '商品211', '商品描述211', 2514.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (215, '商品212', '商品描述212', 6561.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (216, '商品213', '商品描述213', 9965.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (217, '商品214', '商品描述214', 9070.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (218, '商品215', '商品描述215', 9490.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (219, '商品216', '商品描述216', 3102.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (220, '商品217', '商品描述217', 8288.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (221, '商品218', '商品描述218', 2982.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (222, '商品219', '商品描述219', 8873.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (223, '商品220', '商品描述220', 8432.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (224, '商品221', '商品描述221', 3064.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (225, '商品222', '商品描述222', 4185.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (226, '商品223', '商品描述223', 1014.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (227, '商品224', '商品描述224', 726.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (228, '商品225', '商品描述225', 2751.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (229, '商品226', '商品描述226', 8645.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (230, '商品227', '商品描述227', 9229.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (231, '商品228', '商品描述228', 8843.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (232, '商品229', '商品描述229', 2260.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (233, '商品230', '商品描述230', 8287.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (234, '商品231', '商品描述231', 7859.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (235, '商品232', '商品描述232', 6359.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (236, '商品233', '商品描述233', 5500.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (237, '商品234', '商品描述234', 9989.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (238, '商品235', '商品描述235', 6587.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (239, '商品236', '商品描述236', 6685.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (240, '商品237', '商品描述237', 9045.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (241, '商品238', '商品描述238', 3340.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (242, '商品239', '商品描述239', 1347.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (243, '商品240', '商品描述240', 5287.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (244, '商品241', '商品描述241', 8514.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (245, '商品242', '商品描述242', 4421.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (246, '商品243', '商品描述243', 4697.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (247, '商品244', '商品描述244', 7450.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (248, '商品245', '商品描述245', 1762.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (249, '商品246', '商品描述246', 5304.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (250, '商品247', '商品描述247', 993.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (251, '商品248', '商品描述248', 2579.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (252, '商品249', '商品描述249', 5502.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (253, '商品250', '商品描述250', 1522.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (254, '商品251', '商品描述251', 4217.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (255, '商品252', '商品描述252', 8508.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (256, '商品253', '商品描述253', 4432.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (257, '商品254', '商品描述254', 2218.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (258, '商品255', '商品描述255', 8816.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (259, '商品256', '商品描述256', 1805.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (260, '商品257', '商品描述257', 4497.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (261, '商品258', '商品描述258', 214.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (262, '商品259', '商品描述259', 6405.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (263, '商品260', '商品描述260', 2528.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (264, '商品261', '商品描述261', 4368.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (265, '商品262', '商品描述262', 1708.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (266, '商品263', '商品描述263', 3675.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (267, '商品264', '商品描述264', 4431.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (268, '商品265', '商品描述265', 1743.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (269, '商品266', '商品描述266', 7850.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (270, '商品267', '商品描述267', 9366.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (271, '商品268', '商品描述268', 4078.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (272, '商品269', '商品描述269', 3582.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (273, '商品270', '商品描述270', 2900.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (274, '商品271', '商品描述271', 657.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (275, '商品272', '商品描述272', 4863.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (276, '商品273', '商品描述273', 1864.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (277, '商品274', '商品描述274', 6211.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (278, '商品275', '商品描述275', 1821.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (279, '商品276', '商品描述276', 4382.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (280, '商品277', '商品描述277', 8975.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (281, '商品278', '商品描述278', 7753.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (282, '商品279', '商品描述279', 496.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (283, '商品280', '商品描述280', 6169.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (284, '商品281', '商品描述281', 9329.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (285, '商品282', '商品描述282', 9415.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (286, '商品283', '商品描述283', 9429.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (287, '商品284', '商品描述284', 9242.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (288, '商品285', '商品描述285', 6320.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (289, '商品286', '商品描述286', 6802.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (290, '商品287', '商品描述287', 4036.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (291, '商品288', '商品描述288', 1455.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (292, '商品289', '商品描述289', 6207.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (293, '商品290', '商品描述290', 8752.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (294, '商品291', '商品描述291', 8639.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (295, '商品292', '商品描述292', 5126.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (296, '商品293', '商品描述293', 3037.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (297, '商品294', '商品描述294', 4319.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (298, '商品295', '商品描述295', 6727.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (299, '商品296', '商品描述296', 5911.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (300, '商品297', '商品描述297', 1203.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (301, '商品298', '商品描述298', 9418.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (302, '商品299', '商品描述299', 3088.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (303, '商品300', '商品描述300', 8417.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (304, '商品301', '商品描述301', 4746.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (305, '商品302', '商品描述302', 7886.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (306, '商品303', '商品描述303', 8170.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (307, '商品304', '商品描述304', 4515.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (308, '商品305', '商品描述305', 4990.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (309, '商品306', '商品描述306', 4171.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (310, '商品307', '商品描述307', 7527.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (311, '商品308', '商品描述308', 2833.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (312, '商品309', '商品描述309', 624.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (313, '商品310', '商品描述310', 7380.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (314, '商品311', '商品描述311', 1687.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (315, '商品312', '商品描述312', 411.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (316, '商品313', '商品描述313', 6827.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (317, '商品314', '商品描述314', 8906.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (318, '商品315', '商品描述315', 4303.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (319, '商品316', '商品描述316', 9996.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (320, '商品317', '商品描述317', 2538.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (321, '商品318', '商品描述318', 8376.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (322, '商品319', '商品描述319', 8944.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (323, '商品320', '商品描述320', 8939.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (324, '商品321', '商品描述321', 7470.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (325, '商品322', '商品描述322', 5130.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (326, '商品323', '商品描述323', 7364.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (327, '商品324', '商品描述324', 8186.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (328, '商品325', '商品描述325', 2977.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (329, '商品326', '商品描述326', 4963.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (330, '商品327', '商品描述327', 4608.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (331, '商品328', '商品描述328', 2338.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (332, '商品329', '商品描述329', 3365.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (333, '商品330', '商品描述330', 4365.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (334, '商品331', '商品描述331', 8811.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (335, '商品332', '商品描述332', 4242.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (336, '商品333', '商品描述333', 6763.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (337, '商品334', '商品描述334', 6970.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (338, '商品335', '商品描述335', 6034.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (339, '商品336', '商品描述336', 110.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (340, '商品337', '商品描述337', 7136.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (341, '商品338', '商品描述338', 9457.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (342, '商品339', '商品描述339', 2989.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (343, '商品340', '商品描述340', 3631.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (344, '商品341', '商品描述341', 1563.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (345, '商品342', '商品描述342', 6613.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (346, '商品343', '商品描述343', 3010.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (347, '商品344', '商品描述344', 48.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (348, '商品345', '商品描述345', 9362.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (349, '商品346', '商品描述346', 7802.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (350, '商品347', '商品描述347', 3116.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (351, '商品348', '商品描述348', 3690.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (352, '商品349', '商品描述349', 2179.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (353, '商品350', '商品描述350', 9551.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (354, '商品351', '商品描述351', 2521.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (355, '商品352', '商品描述352', 4927.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (356, '商品353', '商品描述353', 6636.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (357, '商品354', '商品描述354', 1487.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (358, '商品355', '商品描述355', 5446.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (359, '商品356', '商品描述356', 5021.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (360, '商品357', '商品描述357', 3635.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (361, '商品358', '商品描述358', 5356.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (362, '商品359', '商品描述359', 3568.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (363, '商品360', '商品描述360', 9861.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (364, '商品361', '商品描述361', 927.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (365, '商品362', '商品描述362', 9339.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (366, '商品363', '商品描述363', 5984.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (367, '商品364', '商品描述364', 6052.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (368, '商品365', '商品描述365', 8047.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (369, '商品366', '商品描述366', 2401.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (370, '商品367', '商品描述367', 7015.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (371, '商品368', '商品描述368', 5326.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (372, '商品369', '商品描述369', 5212.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (373, '商品370', '商品描述370', 5897.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (374, '商品371', '商品描述371', 4723.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (375, '商品372', '商品描述372', 5771.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (376, '商品373', '商品描述373', 286.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (377, '商品374', '商品描述374', 2159.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (378, '商品375', '商品描述375', 5480.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (379, '商品376', '商品描述376', 838.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (380, '商品377', '商品描述377', 416.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (381, '商品378', '商品描述378', 2294.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (382, '商品379', '商品描述379', 2438.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (383, '商品380', '商品描述380', 9610.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (384, '商品381', '商品描述381', 7432.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (385, '商品382', '商品描述382', 7916.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (386, '商品383', '商品描述383', 8269.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (387, '商品384', '商品描述384', 4308.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (388, '商品385', '商品描述385', 8628.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (389, '商品386', '商品描述386', 4047.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (390, '商品387', '商品描述387', 5002.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (391, '商品388', '商品描述388', 3508.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (392, '商品389', '商品描述389', 7009.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (393, '商品390', '商品描述390', 2898.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (394, '商品391', '商品描述391', 6337.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (395, '商品392', '商品描述392', 2052.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (396, '商品393', '商品描述393', 7613.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (397, '商品394', '商品描述394', 774.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (398, '商品395', '商品描述395', 254.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (399, '商品396', '商品描述396', 1124.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (400, '商品397', '商品描述397', 9015.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (401, '商品398', '商品描述398', 2815.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (402, '商品399', '商品描述399', 2303.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (403, '商品400', '商品描述400', 4466.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (404, '商品401', '商品描述401', 1606.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (405, '商品402', '商品描述402', 2813.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (406, '商品403', '商品描述403', 2399.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (407, '商品404', '商品描述404', 9222.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (408, '商品405', '商品描述405', 6746.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (409, '商品406', '商品描述406', 7816.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (410, '商品407', '商品描述407', 492.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (411, '商品408', '商品描述408', 2368.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (412, '商品409', '商品描述409', 3408.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (413, '商品410', '商品描述410', 9761.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (414, '商品411', '商品描述411', 8951.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (415, '商品412', '商品描述412', 6224.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (416, '商品413', '商品描述413', 1396.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (417, '商品414', '商品描述414', 8856.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (418, '商品415', '商品描述415', 2022.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (419, '商品416', '商品描述416', 9005.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (420, '商品417', '商品描述417', 2754.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (421, '商品418', '商品描述418', 5929.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (422, '商品419', '商品描述419', 5210.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (423, '商品420', '商品描述420', 8913.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (424, '商品421', '商品描述421', 5456.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (425, '商品422', '商品描述422', 3487.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (426, '商品423', '商品描述423', 9930.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (427, '商品424', '商品描述424', 2717.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (428, '商品425', '商品描述425', 5985.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (429, '商品426', '商品描述426', 7702.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (430, '商品427', '商品描述427', 1287.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (431, '商品428', '商品描述428', 2318.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (432, '商品429', '商品描述429', 9901.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (433, '商品430', '商品描述430', 6048.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (434, '商品431', '商品描述431', 9333.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (435, '商品432', '商品描述432', 5273.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (436, '商品433', '商品描述433', 1999.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (437, '商品434', '商品描述434', 7824.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (438, '商品435', '商品描述435', 6655.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (439, '商品436', '商品描述436', 7746.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (440, '商品437', '商品描述437', 162.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (441, '商品438', '商品描述438', 7282.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (442, '商品439', '商品描述439', 7635.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (443, '商品440', '商品描述440', 868.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (444, '商品441', '商品描述441', 9499.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (445, '商品442', '商品描述442', 1591.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (446, '商品443', '商品描述443', 7254.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (447, '商品444', '商品描述444', 3989.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (448, '商品445', '商品描述445', 5890.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (449, '商品446', '商品描述446', 8361.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (450, '商品447', '商品描述447', 9766.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (451, '商品448', '商品描述448', 783.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (452, '商品449', '商品描述449', 520.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (453, '商品450', '商品描述450', 9958.00, '1.jpg', 1, 1);
INSERT INTO `goods` VALUES (454, '商品451', '商品描述451', 121.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (455, '商品452', '商品描述452', 6696.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (456, '商品453', '商品描述453', 9511.00, '4.jpg', 1, 1);
INSERT INTO `goods` VALUES (457, '商品454', '商品描述454', 4328.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (458, '商品455', '商品描述455', 3463.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (459, '商品456', '商品描述456', 8709.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (460, '商品457', '商品描述457', 5258.00, '2.jpg', 2, 1);
INSERT INTO `goods` VALUES (461, '商品458', '商品描述458', 4564.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (462, '商品459', '商品描述459', 571.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (463, '商品460', '商品描述460', 896.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (464, '商品461', '商品描述461', 8564.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (465, '商品462', '商品描述462', 1946.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (466, '商品463', '商品描述463', 9592.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (467, '商品464', '商品描述464', 1740.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (468, '商品465', '商品描述465', 3176.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (469, '商品466', '商品描述466', 9664.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (470, '商品467', '商品描述467', 6908.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (471, '商品468', '商品描述468', 1704.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (472, '商品469', '商品描述469', 6833.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (473, '商品470', '商品描述470', 6973.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (474, '商品471', '商品描述471', 2506.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (475, '商品472', '商品描述472', 2019.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (476, '商品473', '商品描述473', 5407.00, '6.jpg', 1, 1);
INSERT INTO `goods` VALUES (477, '商品474', '商品描述474', 5984.00, '1.jpg', 3, 1);
INSERT INTO `goods` VALUES (478, '商品475', '商品描述475', 7680.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (479, '商品476', '商品描述476', 8173.00, '3.jpg', 2, 1);
INSERT INTO `goods` VALUES (480, '商品477', '商品描述477', 9268.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (481, '商品478', '商品描述478', 5840.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (482, '商品479', '商品描述479', 5443.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (483, '商品480', '商品描述480', 4065.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (484, '商品481', '商品描述481', 3442.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (485, '商品482', '商品描述482', 1482.00, '3.jpg', 1, 1);
INSERT INTO `goods` VALUES (486, '商品483', '商品描述483', 6472.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (487, '商品484', '商品描述484', 5323.00, '5.jpg', 2, 1);
INSERT INTO `goods` VALUES (488, '商品485', '商品描述485', 5693.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (489, '商品486', '商品描述486', 6748.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (490, '商品487', '商品描述487', 5965.00, '2.jpg', 3, 1);
INSERT INTO `goods` VALUES (491, '商品488', '商品描述488', 2744.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (492, '商品489', '商品描述489', 9109.00, '4.jpg', 2, 1);
INSERT INTO `goods` VALUES (493, '商品490', '商品描述490', 4027.00, '5.jpg', 3, 1);
INSERT INTO `goods` VALUES (494, '商品491', '商品描述491', 9238.00, '6.jpg', 2, 1);
INSERT INTO `goods` VALUES (495, '商品492', '商品描述492', 9330.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (496, '商品493', '商品描述493', 8303.00, '2.jpg', 1, 1);
INSERT INTO `goods` VALUES (497, '商品494', '商品描述494', 5183.00, '3.jpg', 3, 1);
INSERT INTO `goods` VALUES (498, '商品495', '商品描述495', 6432.00, '4.jpg', 3, 1);
INSERT INTO `goods` VALUES (499, '商品496', '商品描述496', 6922.00, '5.jpg', 1, 1);
INSERT INTO `goods` VALUES (500, '商品497', '商品描述497', 838.00, '6.jpg', 3, 1);
INSERT INTO `goods` VALUES (501, '商品498', '商品描述498', 996.00, '1.jpg', 2, 1);
INSERT INTO `goods` VALUES (502, '商品499', '商品描述499', 9169.00, '2.jpg', 3, 1);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `simg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, 'navel', 'navel.jpg', 15);
INSERT INTO `store` VALUES (2, 'august', 'august.png', 17);
INSERT INTO `store` VALUES (3, 'bamboo', 'bamboo.jpg', 7);
INSERT INTO `store` VALUES (4, 'yuzusoft', 'yuzusoft.jpg', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '1',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1180310022', '1234', '1', '浙江科技学院');
INSERT INTO `user` VALUES (2, 'w99402225', '123', '1', NULL);
INSERT INTO `user` VALUES (3, '111', '12345', '1', NULL);
INSERT INTO `user` VALUES (4, 'aaaaaa', '231', '1', NULL);
INSERT INTO `user` VALUES (6, '张三', '123', '1', NULL);
INSERT INTO `user` VALUES (7, '潘谦睿', '123', '2', NULL);
INSERT INTO `user` VALUES (15, 'navel', '123', '2', NULL);
INSERT INTO `user` VALUES (16, 'admin', 'admin', '0', NULL);
INSERT INTO `user` VALUES (17, 'august', '123', '2', NULL);

SET FOREIGN_KEY_CHECKS = 1;
