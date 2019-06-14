-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.25 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5284
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 docshare 的数据库结构
CREATE DATABASE IF NOT EXISTS `docshare` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `docshare`;

-- 导出  表 docshare.admin 结构
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(6) NOT NULL COMMENT '管理员编号',
  `adname` varchar(255) NOT NULL COMMENT '用户民',
  `adpassword` varchar(255) NOT NULL COMMENT '密码',
  `phonenumber` int(11) NOT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`,`adname`,`phonenumber`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.admin 的数据：0 rows
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 导出  表 docshare.goods 结构
CREATE TABLE IF NOT EXISTS `goods` (
  `goodsid` int(6) NOT NULL AUTO_INCREMENT COMMENT '商品自增id',
  `categoryid` int(6) NOT NULL COMMENT '种类id',
  `goodtype` int(1) NOT NULL COMMENT '商品类型 1电子 0实体',
  `goodsname` varchar(255) NOT NULL COMMENT '商品名称',
  `freight` int(2) DEFAULT NULL COMMENT '邮费',
  `unitprice` decimal(10,2) NOT NULL COMMENT '单位价格',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `quantity` int(6) NOT NULL COMMENT '库存数量',
  `goodsdetail` varchar(255) DEFAULT NULL COMMENT '附加信息',
  `filepath` varchar(255) DEFAULT NULL COMMENT '文件id',
  PRIMARY KEY (`goodsid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.goods 的数据：10 rows
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`goodsid`, `categoryid`, `goodtype`, `goodsname`, `freight`, `unitprice`, `create_time`, `update_time`, `quantity`, `goodsdetail`, `filepath`) VALUES
	(1, 0, 0, '《经管-数据结构期末考试真题2017》', NULL, 1.00, NULL, NULL, 9999, '经管期末真题，来源可靠，有针对性', NULL),
	(2, 0, 0, '《北工大2018经管学院管理系统工程考研》', NULL, 4.00, NULL, NULL, 9999, '考研真题，供2019年考生参考使用', NULL),
	(3, 0, 0, '西红柿', 3, 2.00, '2019-05-30 18:10:39', '2019-05-30 18:10:39', 2, NULL, NULL),
	(4, 0, 0, '324', 0, 0.00, '2019-05-30 18:19:44', '2019-05-30 18:19:44', 0, NULL, NULL),
	(5, 0, 0, '西红柿', 4, 2.00, '2019-05-30 18:54:09', '2019-05-30 18:54:09', 1, NULL, NULL),
	(6, 0, 0, '西红', 2, 2.00, '2019-05-30 20:44:31', '2019-05-30 20:44:31', 1, NULL, '47'),
	(7, 1, 0, '喜欢红', 123, 2.00, '2019-05-30 21:11:01', '2019-05-30 21:11:01', 4, NULL, '48'),
	(8, 0, 0, '西红柿', 1, 2.00, '2019-05-30 21:25:49', '2019-05-30 21:25:49', 1, NULL, '50'),
	(9, 0, 1, '是的', 7, 2.00, '2019-05-30 21:32:34', '2019-05-30 21:32:34', 1, NULL, '51'),
	(10, 0, 1, '喜欢红', 4, 2.00, '2019-05-30 21:35:36', '2019-05-30 21:35:36', 1, '<p>贵公司</p>', '52');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 导出  表 docshare.goods_files 结构
CREATE TABLE IF NOT EXISTS `goods_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.goods_files 的数据：~7 rows (大约)
DELETE FROM `goods_files`;
/*!40000 ALTER TABLE `goods_files` DISABLE KEYS */;
INSERT INTO `goods_files` (`id`, `filepath`) VALUES
	(47, '/uploads/20190530/2de32575398055d9298527165da152ff.doc'),
	(48, '/uploads/20190530/649184cc0642bc6ed3af009e4e157698.doc'),
	(50, '/uploads/20190530/a8298545f6e19e260d59ad2d9edc8501.xlsx'),
	(51, '/uploads/20190530/63bd905750d9da63f3dcb91ced17c55d.pptx'),
	(52, '/uploads/20190530/24ff313626c6cdb31049bc58118eece4.pptx'),
	(53, '/uploads/20190530/ea1ebfcf1be4411e6483c60d15eff040.pptx'),
	(54, '/uploads/20190530/b954e8ae699a1a5468d492de33372a6b.pptx');
/*!40000 ALTER TABLE `goods_files` ENABLE KEYS */;

-- 导出  表 docshare.goods_img 结构
CREATE TABLE IF NOT EXISTS `goods_img` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.goods_img 的数据：~0 rows (大约)
DELETE FROM `goods_img`;
/*!40000 ALTER TABLE `goods_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_img` ENABLE KEYS */;

-- 导出  表 docshare.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(6) NOT NULL COMMENT '订单号',
  `username` varchar(255) NOT NULL COMMENT '顾客',
  `address` varchar(255) NOT NULL COMMENT '运送地址',
  `orderstate` int(1) NOT NULL COMMENT '1 已签收 2已送达 3运送中',
  `payinfo` varchar(255) NOT NULL COMMENT '支付信息（总价格）',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.orders 的数据：0 rows
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 导出  表 docshare.ordersdetail 结构
CREATE TABLE IF NOT EXISTS `ordersdetail` (
  `id` int(6) NOT NULL COMMENT 'id编号',
  `orderid` int(6) NOT NULL COMMENT '订单编号',
  `goods` varchar(255) NOT NULL COMMENT '商品名称',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `unitprice` varchar(10) NOT NULL COMMENT '单价',
  `appraisal` varchar(255) DEFAULT NULL COMMENT '商品评价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.ordersdetail 的数据：0 rows
DELETE FROM `ordersdetail`;
/*!40000 ALTER TABLE `ordersdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersdetail` ENABLE KEYS */;

-- 导出  表 docshare.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(6) NOT NULL COMMENT '用户编号',
  `userName` varchar(255) NOT NULL COMMENT '用户名',
  `userPhoneNumber` int(11) NOT NULL COMMENT '电话号码',
  `userPassword` varchar(20) NOT NULL COMMENT '用户密码',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `iron` varchar(255) DEFAULT NULL COMMENT '充值积分',
  `gold` varchar(255) DEFAULT NULL COMMENT '可提现积分',
  PRIMARY KEY (`id`,`userPhoneNumber`,`userName`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.user 的数据：0 rows
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
