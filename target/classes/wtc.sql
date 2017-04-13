/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : frank

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-03-03 15:15:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for basemessage
-- ----------------------------
DROP TABLE IF EXISTS `basemessage`;
CREATE TABLE `basemessage` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `basename` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '名字',
  `parendbaseid` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '父编码ID',
  `basesiteid` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '数据权限id',
  `basetype` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '01(学生)02(老师)',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `creator` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `createtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of basemessage
-- ----------------------------
INSERT INTO `basemessage` VALUES ('0a5799aacdbf48b9963defe17f98cc9b', '教师', 'a8b6f01f131c43fca3ca6f3e9b641a0a', '0', '02', '1', 'frank', '2016-03-04 17:35:19');
INSERT INTO `basemessage` VALUES ('6a69ef9d8ac84616b5aa3b6e4cfd4d33', '学生', 'a8b6f01f131c43fca3ca6f3e9b641a0a', '0', '01', '1', 'frank', '2016-03-04 17:35:07');
INSERT INTO `basemessage` VALUES ('a6c9405906dd4b7d9ec964a5f599b1c5', '语文', '0a5799aacdbf48b9963defe17f98cc9b', '0', '02', '2', 'frank', '2016-03-04 17:35:35');
INSERT INTO `basemessage` VALUES ('a8b6f01f131c43fca3ca6f3e9b641a0a', '空越', '0', '0', '00', '0', 'frank', '2016-03-04 17:26:10');
INSERT INTO `basemessage` VALUES ('fe61b7623d4d4deb97194ddd3c339281', '一年级', '6a69ef9d8ac84616b5aa3b6e4cfd4d33', '0', '01', '2', 'frank', '2016-03-04 17:35:48');

-- ----------------------------
-- Table structure for carparking
-- ----------------------------
DROP TABLE IF EXISTS `carparking`;
CREATE TABLE `carparking` (
  `id` varchar(32) NOT NULL,
  `number` varchar(32) DEFAULT NULL,
  `carshotidone` varchar(32) DEFAULT NULL,
  `carshotidtwo` varchar(32) DEFAULT NULL,
  `collecttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carparking
-- ----------------------------
INSERT INTO `carparking` VALUES ('71a7854f7d52486582829296142fd2ff', '鄂A95XV7', '1259742af31e4862944d673013c2c408', '3c7f6c63fa7a48e7acd1f7d47c71e6ed', '2016-12-26 14:10:33');
INSERT INTO `carparking` VALUES ('3bca1fb9e7654199b7ef00a0c7ef5f7f', '鄂AP3B20', '0d8dc02d6f234ad79cc93983e757076c', 'ec6b345a320f47fc844933eec20e4837', '2016-12-26 14:07:56');
INSERT INTO `carparking` VALUES ('28b7c3f61b6d4128bcaafbead8c1be45', '鄂AFD912', 'd3ed9ced422347cea890514a5307ce12', '4a140871c68f4eefbb823bf3268bb0c4', '2016-12-26 14:02:58');

-- ----------------------------
-- Table structure for carshot
-- ----------------------------
DROP TABLE IF EXISTS `carshot`;
CREATE TABLE `carshot` (
  `id` varchar(32) NOT NULL,
  `number` varchar(32) DEFAULT NULL,
  `carcolor` varchar(32) DEFAULT NULL,
  `longitude` varchar(32) DEFAULT NULL,
  `latitude` varchar(32) DEFAULT NULL,
  `speed` varchar(32) DEFAULT NULL,
  `elevational` varchar(32) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `bigpicture` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `carterminalid` varchar(32) DEFAULT NULL,
  `rstpUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carshot
-- ----------------------------
INSERT INTO `carshot` VALUES ('d3ed9ced422347cea890514a5307ce12', '鄂AFD912', '蓝', '114.130135', '30.512288', '28.3', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu4.png', 'bidui1.jpg', null, '2016-12-26 13:01:13', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('0d8dc02d6f234ad79cc93983e757076c', '鄂AP3B20', '蓝', '114.231144', '30.513299', '24.1', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu5.png', 'bidui2.jpg', null, '2016-12-26 13:50:05', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('adc94c3f357e470ba80eaa1f6df278ca', '鄂AAD644', '蓝', '114.332109', '30.514293', '20.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu1.png', 'datu1.jpg', null, '2016-12-26 13:16:31', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('de788ef5441548a799b994262ad7a91a', '鄂A7F248', '蓝', '114.433117', '30.515289', '23.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu2.png', 'datu2.jpg', null, '2016-12-26 13:19:00', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('c7569dd0f74941cb9cbd525bca342b37', '鄂A5Y783', '蓝', '114.534123', '30.500083', '27.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu3.png', 'datu3.jpg', null, '2016-12-26 13:21:11', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('4a140871c68f4eefbb823bf3268bb0c4', '鄂AFD912', '蓝', '114.635128', '30.517274', '29.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu4.png', 'datu4.jpg', null, '2016-12-26 13:23:11', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('ec6b345a320f47fc844933eec20e4837', '鄂AP3B20', '蓝', '114.736132', '30.518265', '26.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu5.png', 'datu5.jpg', null, '2016-12-26 13:25:05', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('1259742af31e4862944d673013c2c408', '鄂A95XV7', '蓝', '114.837139', '30.519259', '28.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu6.png', 'datu6.jpg', null, '2016-12-26 13:27:19', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('297013cec6a24c63a252f9f21879c795', '鄂AK4F16', '蓝', '114.938153', '30.537251', '31.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu7.png', 'datu7.jpg', null, '2016-12-26 13:28:31', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('36a9d5b3dbeb4cf1bcdf05160c89beef', '鄂APOX49', '蓝', '114.439164', '30.599945', '33.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu8.png', 'datu8.jpg', null, '2016-12-26 13:29:35', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('a7b7018a76254b2893a68c943c4339fb', '鄂A1JZ39', '蓝', '114.431067', '30.523233', '32.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu9.png', 'datu9.jpg', null, '2016-12-26 13:36:17', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('7f0fcd04a13c4dc4bedec5198720ea85', '鄂A8RZ23', '蓝', '114.431172', '30.578226', '29.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu10.png', 'datu10.jpg', null, '2016-12-26 13:36:19', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('3c7f6c63fa7a48e7acd1f7d47c71e6ed', '鄂A95XV7', '蓝', '114.431241', '30.525276', '27.5', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu6.png', 'bidui3.jpg', null, '2016-12-26 13:59:19', '3518430244309797487', null);
INSERT INTO `carshot` VALUES ('f6a26ea0523d4917894c8b5a6bad179e', '鄂AUU142', '蓝', '114.431373', '30.526218', '30.0', '0', '0.0', 'http://aaceshi.aabang.me/Tachograph/static/upload/xiaotu11(2).png', 'datu11.jpg', null, '2016-12-26 13:36:21', '3518430244309797487', null);

-- ----------------------------
-- Table structure for carterminal
-- ----------------------------
DROP TABLE IF EXISTS `carterminal`;
CREATE TABLE `carterminal` (
  `id` varchar(32) NOT NULL,
  `terminalNO` varchar(32) DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `rstpUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carterminal
-- ----------------------------
INSERT INTO `carterminal` VALUES ('c59825915d8642099762bbf9814785d1', '4199887235774597504', 'wanxin', null, 'test');
INSERT INTO `carterminal` VALUES ('849c2291f7534f82b5e647558d7f5d26', '4364279270285095319', '123456', null, null);
INSERT INTO `carterminal` VALUES ('b40a6e14e5714471ab51f1dbe733b3f6', '4204880623911077194', '视频', null, null);
INSERT INTO `carterminal` VALUES ('1391b1709b5346d0a0d404959c32ea55', '3518430244309797487', '严毅', null, 'test');

-- ----------------------------
-- Table structure for operator
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator` (
  `id` varchar(32) NOT NULL,
  `usertype` varchar(20) DEFAULT NULL COMMENT '1：是学生，02：辅导老师，03：系统用户，04：测试人员，05：企事业单位账户，06：人事主管部门账户，07施教机构',
  `username` varchar(128) NOT NULL DEFAULT '' COMMENT '用户名',
  `userpasswd` varchar(60) NOT NULL DEFAULT '' COMMENT '密码',
  `memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `logonnum` decimal(10,2) DEFAULT '0.00',
  `lastlogontime` varchar(32) DEFAULT '0',
  `userstatus` varchar(2) DEFAULT '00' COMMENT '用户登录状态(00:可以登录,01不能登录)',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `lasteditor` varchar(32) DEFAULT NULL COMMENT '最后修改人',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `lastedittime` varchar(32) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台系统操作员';

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES ('c759c5ea42a24c0d9e4b3ec1067f753a', '03', 'frank', '202cb962ac59075b964b07152d234b70', '程海', null, null, '00', 'caa92b8f1112491c83085c56a48b9a64', 'c759c5ea42a24c0d9e4b3ec1067f753a', '2015-11-20 10:18:05', '2017-02-22 18:43:57');
INSERT INTO `operator` VALUES ('caa92b8f1112491c83085c56a48b9a64', '03', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', null, null, '00', '7b0bb1b1a1aa40d08b16002615d53d88', 'caa92b8f1112491c83085c56a48b9a64', '2014-9-30 10:15:00', '2015-11-18 09:20:40');

-- ----------------------------
-- Table structure for operatorrole
-- ----------------------------
DROP TABLE IF EXISTS `operatorrole`;
CREATE TABLE `operatorrole` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '系统操作员ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '功能角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of operatorrole
-- ----------------------------
INSERT INTO `operatorrole` VALUES ('5091cb90663741c89b64dd45bf454777', 'c759c5ea42a24c0d9e4b3ec1067f753a', 'c3f8906159274750b15774106565affc');
INSERT INTO `operatorrole` VALUES ('fbc9f13693b94bed926dfad203f3bce3', 'caa92b8f1112491c83085c56a48b9a64', '0');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `permission_name` varchar(100) DEFAULT '' COMMENT '权限名称',
  `permission_url` varchar(255) DEFAULT '' COMMENT '权限url',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父节点',
  `icolcss` varchar(50) DEFAULT NULL COMMENT '样式',
  `orders` varchar(10) DEFAULT NULL COMMENT '顺序',
  `permission_type` varchar(2) DEFAULT NULL COMMENT '权限类型(01：菜单权限，02：按钮权限)',
  `button_id` varchar(50) DEFAULT NULL COMMENT '按钮ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('0', 'root', '', '', '', '0', '01', null);
INSERT INTO `permission` VALUES ('03f39bf102344b358bb6efea079e446e', '套牌管理', 'transportation/carshot!showDeckPage.action', '3b927f3c9e284570bd625166aa887096', '', '1', '01', '');
INSERT INTO `permission` VALUES ('1', '系统管理', '', '0', 'menu-system', '1', '01', '');
INSERT INTO `permission` VALUES ('2', '系统用户管理', 'system/operator!operator.action', '1', 'menu-user', '5', '01', '');
INSERT INTO `permission` VALUES ('3b927f3c9e284570bd625166aa887096', '车辆信息管理', '', '0', '', '4', '01', '');
INSERT INTO `permission` VALUES ('4', '角色关联权限', 'system/role!role.action', '1', 'menu_roleuser', '3', '01', '');
INSERT INTO `permission` VALUES ('43caa94094074f5f882ebd485beb51b9', '终端实时管理', 'transportation/carterminal!showPage.action', '7177e5367ad04ea499d01282e409fe4d', '', '2', '01', '');
INSERT INTO `permission` VALUES ('5', '用户关联角色', 'system/role-user!roleuser.action', '1', 'menu-roleuser', '4', '01', '');
INSERT INTO `permission` VALUES ('7177e5367ad04ea499d01282e409fe4d', '终端管理', '', '0', '', '3', '01', '');
INSERT INTO `permission` VALUES ('9dc230cc4e77405ba434de672476e10e', '权限菜单管理', 'system/permission!permission.action', '1', '', '2', '01', '');
INSERT INTO `permission` VALUES ('b051e9b377a34fbcb8db1e725369d1bb', '角色管理', 'baseMessage/teacher!showPage.action', 'b4d6f0e4cac04ffcb0a41a67f660ed32', '', '3', '01', '');
INSERT INTO `permission` VALUES ('b4d6f0e4cac04ffcb0a41a67f660ed32', '基本信息管理', '', '0', '', '2', '01', '');
INSERT INTO `permission` VALUES ('ca46aaca322449789de5aa4c34bb8cdc', '基本信息', 'baseMessage/basemessage!showPage.action', 'b4d6f0e4cac04ffcb0a41a67f660ed32', '', '1', '01', '');
INSERT INTO `permission` VALUES ('df26b93bc93347bfa04e73898c9f9b2b', '人员管理', 'baseMessage/student!showPage.action', 'b4d6f0e4cac04ffcb0a41a67f660ed32', '', '2', '01', '');
INSERT INTO `permission` VALUES ('e7d8a8bc652a46a89267bb00cadd37bc', '违停管理', 'transportation/carparking!showPage.action', '3b927f3c9e284570bd625166aa887096', '', '2', '01', '');
INSERT INTO `permission` VALUES ('f1994fc3003a4a95bfd2174c9ab45d0b', '终端采集数据管理', 'transportation/carshot!showPage.action', '7177e5367ad04ea499d01282e409fe4d', '', '3', '01', '');
INSERT INTO `permission` VALUES ('f956091bd2374f5b8080a375e6c7b97e', '车辆轨迹管理', 'transportation/carshot!showTrajectoryPage.action', '3b927f3c9e284570bd625166aa887096', '', '3', '01', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `data_role_name` varchar(50) DEFAULT '' COMMENT '功能角色名称',
  `is_enable` varchar(2) DEFAULT '1' COMMENT '是否启用 0：启用 1：禁用',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(32) DEFAULT '' COMMENT '创建时间',
  `updator` varchar(32) DEFAULT NULL COMMENT '最后修改人',
  `update_time` varchar(32) DEFAULT NULL COMMENT '最后修改时间',
  `creatorName` varchar(255) DEFAULT NULL,
  `updatorName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0', '系统管理员', '0', '23ad962f527e4010acf91eab868892c2', '2014-9-30 14:42:16', 'caa92b8f1112491c83085c56a48b9a64', '2016-12-26 01:09:25', 'admin', 'admin');
INSERT INTO `role` VALUES ('c3f8906159274750b15774106565affc', '普通管理员', '0', 'caa92b8f1112491c83085c56a48b9a64', '2017-02-22 16:51:41', 'caa92b8f1112491c83085c56a48b9a64', '2017-02-22 16:51:41', 'admin', 'admin');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '对应角色的ID',
  `permission_id` varchar(32) DEFAULT NULL COMMENT '对应的权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('03b551742b4c49a7825edec97fb4e8e1', '0', '5');
INSERT INTO `rolepermission` VALUES ('146f9f91a5ae4555a8c7869e0b3ddc18', '3', '1e28c5bd77be4c7eabc64ad3c1cc71da');
INSERT INTO `rolepermission` VALUES ('2138ce86aa9441c0a539ba2eac247667', '3', '77831e6443864928aad86dfdd9821f2f');
INSERT INTO `rolepermission` VALUES ('2783719ed520477dbfcf665f28957c7f', '0', 'f1994fc3003a4a95bfd2174c9ab45d0b');
INSERT INTO `rolepermission` VALUES ('3e9653831acd40d9ad5707fce002e3d9', '3', 'a38f63ba34c443c2afba9bef309c5942');
INSERT INTO `rolepermission` VALUES ('4b82be4a276c4e88936df8bc41f06456', '3', '9c67460bfc504e3a91e1a895919e109d');
INSERT INTO `rolepermission` VALUES ('5139ea7b04fd47d696eb82453ee66abb', '3', 'bb1c385e10ee48e495af94d7647bbb6f');
INSERT INTO `rolepermission` VALUES ('54e963c68118407fb18af94ef03ff3c2', '0', 'f956091bd2374f5b8080a375e6c7b97e');
INSERT INTO `rolepermission` VALUES ('56247b87457e4d618244a86396ca00df', '4', '4f16bcddfdd0404281b8d434913f8f7c');
INSERT INTO `rolepermission` VALUES ('63982b94e3274c8ea5dd8bab3e1ac010', '0', 'e7d8a8bc652a46a89267bb00cadd37bc');
INSERT INTO `rolepermission` VALUES ('6416876019504703a500125da71fc043', '0', '03f39bf102344b358bb6efea079e446e');
INSERT INTO `rolepermission` VALUES ('66f60a6309094022abc400b77bac08c5', '4', '0');
INSERT INTO `rolepermission` VALUES ('6b836562a3f544679a0f4d60cdc3a52e', '0', '4');
INSERT INTO `rolepermission` VALUES ('6c04a9bf2eb44b7ea2a264fd146cca25', '1', '068fd382ef0c4f7d92b3232708ce2f4e');
INSERT INTO `rolepermission` VALUES ('74454b9741b749fcb0f2144462097595', '3', '1');
INSERT INTO `rolepermission` VALUES ('74b2f8ddbfe247588cd9e619a4215ab3', '0', '2');
INSERT INTO `rolepermission` VALUES ('75e1ffbb88ee4c4a91062ddc03341a34', '3', '14b1bff5eead4d5b8ed4e1568cd777b6');
INSERT INTO `rolepermission` VALUES ('795bee7ab22e4eb3aa897569084fa410', '3', '00d606b49a7e4a009f2ef7731d207cba');
INSERT INTO `rolepermission` VALUES ('7b8c4b4e435242879e2608c63775ad59', '0', '7177e5367ad04ea499d01282e409fe4d');
INSERT INTO `rolepermission` VALUES ('7c97bda2733646569a622668cebe8a7e', '3', 'a603248efe0e49fca2bd72d2abab6140');
INSERT INTO `rolepermission` VALUES ('7f2f101faf9e4b0da95ce829fbd48810', '3', 'ff08074f25b94519b712245965cf54fb');
INSERT INTO `rolepermission` VALUES ('8100cda8565c492c9824dde2d60886fa', 'c3f8906159274750b15774106565affc', 'f956091bd2374f5b8080a375e6c7b97e');
INSERT INTO `rolepermission` VALUES ('8c512a3157484ad4818956a63b23b84b', 'c3f8906159274750b15774106565affc', '03f39bf102344b358bb6efea079e446e');
INSERT INTO `rolepermission` VALUES ('9dbdf393d7f24fcea56fbd58f8de7c2a', '4', 'ff08074f25b94519b712245965cf54fb');
INSERT INTO `rolepermission` VALUES ('9ed8320502f44357b4a8ee5802d3a295', '0', '3b927f3c9e284570bd625166aa887096');
INSERT INTO `rolepermission` VALUES ('a60e468aff114a85a2ca952b5ab355fe', '3', '4f16bcddfdd0404281b8d434913f8f7c');
INSERT INTO `rolepermission` VALUES ('b1f1d34169e24e8f86cffd027f9c1d3b', '3', 'd07061a8adbf498db3b5a7a8bb8301da');
INSERT INTO `rolepermission` VALUES ('b6d6fca079c04ac090d7a15ae4cc11f4', 'c3f8906159274750b15774106565affc', '3b927f3c9e284570bd625166aa887096');
INSERT INTO `rolepermission` VALUES ('bb4bf3660f8f45c0ad9ebb13e8d3cb8c', '3', '0');
INSERT INTO `rolepermission` VALUES ('c034b801ae67497baa9431ce46dba306', 'c3f8906159274750b15774106565affc', 'e7d8a8bc652a46a89267bb00cadd37bc');
INSERT INTO `rolepermission` VALUES ('c3cc0036de864309a2b687aaa2145e3c', '0', '0');
INSERT INTO `rolepermission` VALUES ('c4e6c7658a544b6782f8ba8b304960c7', '4', '162c25c7a4f64829b99778889f25e4da');
INSERT INTO `rolepermission` VALUES ('c5bb15cdf8e9440b88e048ae8284fe55', '3', '669e3de72aa444199643e58e5a81ce67');
INSERT INTO `rolepermission` VALUES ('c97f1c83387d4f03b855130d334e82f6', '4', '1');
INSERT INTO `rolepermission` VALUES ('cea7494215f0428bab863266406fb10a', '1', '4f16bcddfdd0404281b8d434913f8f7c');
INSERT INTO `rolepermission` VALUES ('d13002404d1d46d7bad532a786e47dd5', '3', '83d9c9571f9f4b03b5c1de21dba9ffeb');
INSERT INTO `rolepermission` VALUES ('d3fee16d20e947b7946e2e311e76b027', '1', 'd48d7793d7434b56b9063456cabcd507');
INSERT INTO `rolepermission` VALUES ('d991112d1ced47199bb72a673f1d1809', '4', '1e28c5bd77be4c7eabc64ad3c1cc71da');
INSERT INTO `rolepermission` VALUES ('da3a42a58c64452b92aff081917062da', '4', '76cedb57b3d1469dbf47d1ae1ced6754');
INSERT INTO `rolepermission` VALUES ('dd8179d8e3d74aed9a3ddfbc221d4621', '0', '9dc230cc4e77405ba434de672476e10e');
INSERT INTO `rolepermission` VALUES ('e4d547a3f824490181d3467d509cd099', '3', '59e3e6c3f57f4424b2f83cbc776ebd95');
INSERT INTO `rolepermission` VALUES ('e6e15223247a4f44b9477fe9c005e894', '1', '0');
INSERT INTO `rolepermission` VALUES ('ee3ca9d5872c41179fbbd58ca004c499', '0', '43caa94094074f5f882ebd485beb51b9');
INSERT INTO `rolepermission` VALUES ('f6a2a63860b14b3f8be779034622fa8f', '3', '76cedb57b3d1469dbf47d1ae1ced6754');
INSERT INTO `rolepermission` VALUES ('f824d8cf35234587aba792ef15d28aa0', '0', '1');
INSERT INTO `rolepermission` VALUES ('f9bdb8356b3d4015be74b02a6c4a361c', 'c3f8906159274750b15774106565affc', '0');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT 'id',
  `basemessageid` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '基本信息id',
  `studentname` varchar(100) DEFAULT NULL,
  `no` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '学号',
  `sex` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '生日',
  `emial` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `imageurl` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '图像url',
  `classname` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '班级名称',
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '学生名字',
  `basemessageid` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '基本信息id',
  `no` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '编号',
  `sex` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '生日',
  `emial` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮件',
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `imageurl` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '图像地址',
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher
-- ----------------------------
