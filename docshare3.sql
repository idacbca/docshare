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
  `goodsid` int(6) NOT NULL COMMENT '商品id',
  `categoryid` int(6) NOT NULL COMMENT '种类id',
  `goodtype` int(1) NOT NULL COMMENT '商品类型 1电子 0实体',
  `categoryname` varchar(255) NOT NULL COMMENT '种类名称',
  `goodsname` varchar(255) NOT NULL COMMENT '商品名称',
  `unitprice` decimal(10,2) NOT NULL COMMENT '单位价格',
  `status` int(1) NOT NULL COMMENT '1 上架 2审核中 3冻结4下架5售罄',
  `quantity` int(6) NOT NULL COMMENT '库存数量',
  `goodsdetail` varchar(255) DEFAULT NULL COMMENT '附加信息',
  PRIMARY KEY (`goodsid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  docshare.goods 的数据：1 rows
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`goodsid`, `categoryid`, `goodtype`, `categoryname`, `goodsname`, `unitprice`, `status`, `quantity`, `goodsdetail`) VALUES
	(1, 0, 0, '0', '《经管-数据结构期末考试真题2017》', 1.00, 0, 9999, '经管期末真题，来源可靠，有针对性'),
	(2, 0, 0, '0', '《北工大2018经管学院管理系统工程考研》', 4.00, 0, 9999, '考研真题，供2019年考生参考使用');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

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
