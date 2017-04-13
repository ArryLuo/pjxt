-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-04-13 12:30:43
-- 服务器版本： 5.7.10-log
-- PHP Version: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- 表的结构 `operator`
--

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
  `lastedittime` varchar(32) DEFAULT NULL COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `operator`
--

INSERT INTO `operator` (`id`, `usertype`, `username`, `userpasswd`, `memo`, `logonnum`, `lastlogontime`, `userstatus`, `creator`, `lasteditor`, `createtime`, `lastedittime`) VALUES
('c759c5ea42a24c0d9e4b3ec1067f753a', '03', 'frank', '202cb962ac59075b964b07152d234b70', '程海', NULL, NULL, '00', 'caa92b8f1112491c83085c56a48b9a64', 'c759c5ea42a24c0d9e4b3ec1067f753a', '2015-11-20 10:18:05', '2017-02-22 18:43:57'),
('caa92b8f1112491c83085c56a48b9a64', '03', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, NULL, '00', '7b0bb1b1a1aa40d08b16002615d53d88', 'caa92b8f1112491c83085c56a48b9a64', '2014-9-30 10:15:00', '2015-11-18 09:20:40');

-- --------------------------------------------------------

--
-- 表的结构 `permission`
--

CREATE TABLE `permission` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `permission_name` varchar(100) DEFAULT '' COMMENT '权限名称',
  `permission_url` varchar(255) DEFAULT '' COMMENT '权限url',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父节点',
  `icolcss` varchar(50) DEFAULT NULL COMMENT '样式',
  `orders` varchar(10) DEFAULT NULL COMMENT '顺序',
  `permission_type` varchar(2) DEFAULT NULL COMMENT '权限类型(01：菜单权限，02：按钮权限)',
  `button_id` varchar(50) DEFAULT NULL COMMENT '按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `permission`
--

INSERT INTO `permission` (`id`, `permission_name`, `permission_url`, `parentid`, `icolcss`, `orders`, `permission_type`, `button_id`) VALUES
('0', 'root', '', '', '', '0', '01', NULL),
('03f39bf102344b358bb6efea079e446e', '套牌管理', 'transportation/carshot!showDeckPage.action', '3b927f3c9e284570bd625166aa887096', '', '1', '01', ''),
('1', '系统管理', '', '0', 'menu-system', '1', '01', ''),
('2', '系统用户管理', 'system/operator!operator.action', '1', 'menu-user', '5', '01', ''),
('3b927f3c9e284570bd625166aa887096', '车辆信息管理', '', '0', '', '4', '01', ''),
('4', '角色关联权限', 'system/role!role.action', '1', 'menu_roleuser', '3', '01', ''),
('43caa94094074f5f882ebd485beb51b9', '终端实时管理', 'transportation/carterminal!showPage.action', '7177e5367ad04ea499d01282e409fe4d', '', '2', '01', ''),
('5', '用户关联角色', 'system/role-user!roleuser.action', '1', 'menu-roleuser', '4', '01', ''),
('7177e5367ad04ea499d01282e409fe4d', '终端管理', '', '0', '', '3', '01', ''),
('9dc230cc4e77405ba434de672476e10e', '权限菜单管理', 'system/permission!permission.action', '1', '', '2', '01', ''),
('b051e9b377a34fbcb8db1e725369d1bb', '角色管理', 'baseMessage/teacher!showPage.action', 'b4d6f0e4cac04ffcb0a41a67f660ed32', '', '3', '01', ''),
('b4d6f0e4cac04ffcb0a41a67f660ed32', '基本信息管理', '', '0', '', '2', '01', ''),
('ca46aaca322449789de5aa4c34bb8cdc', '基本信息', 'baseMessage/basemessage!showPage.action', 'b4d6f0e4cac04ffcb0a41a67f660ed32', '', '1', '01', ''),
('df26b93bc93347bfa04e73898c9f9b2b', '人员管理', 'baseMessage/student!showPage.action', 'b4d6f0e4cac04ffcb0a41a67f660ed32', '', '2', '01', ''),
('e7d8a8bc652a46a89267bb00cadd37bc', '违停管理', 'transportation/carparking!showPage.action', '3b927f3c9e284570bd625166aa887096', '', '2', '01', ''),
('f1994fc3003a4a95bfd2174c9ab45d0b', '终端采集数据管理', 'transportation/carshot!showPage.action', '7177e5367ad04ea499d01282e409fe4d', '', '3', '01', ''),
('f956091bd2374f5b8080a375e6c7b97e', '车辆轨迹管理', 'transportation/carshot!showTrajectoryPage.action', '3b927f3c9e284570bd625166aa887096', '', '3', '01', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
