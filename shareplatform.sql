/*
 Navicat Premium Data Transfer

 Source Server         : duoduo
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : shareplatform

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 29/05/2019 16:09:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(6) NOT NULL COMMENT '管理员编号',
  `adname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户民',
  `adpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phonenumber` int(11) NOT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`, `adname`, `phonenumber`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodsid` int(6) NOT NULL COMMENT '商品id',
  `categoryid` int(6) NOT NULL COMMENT '种类id',
  `categoryname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类名称',
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `unitprice` decimal(10, 2) NOT NULL COMMENT '单位价格',
  `status` int(1) NOT NULL COMMENT '1 上架 2审核中 3冻结4下架5售罄',
  `quantity` int(6) NOT NULL COMMENT '库存数量',
  `goodsdetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加信息',
  PRIMARY KEY (`goodsid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int(6) NOT NULL COMMENT '订单号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顾客',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运送地址',
  `orderstate` int(1) NOT NULL COMMENT '1 已签收 2已送达 3运送中',
  `payinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付信息（总价格）',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ordersdetail
-- ----------------------------
DROP TABLE IF EXISTS `ordersdetail`;
CREATE TABLE `ordersdetail`  (
  `id` int(6) NOT NULL COMMENT 'id编号',
  `orderid` int(6) NOT NULL COMMENT '订单编号',
  `goods` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `quantity` int(4) NOT NULL COMMENT '数量',
  `unitprice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单价',
  `appraisal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品评价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(6) NOT NULL COMMENT '用户编号',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `userPhoneNumber` int(11) NOT NULL COMMENT '电话号码',
  `userPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `iron` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值积分',
  `gold` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可提现积分',
  PRIMARY KEY (`id`, `userPhoneNumber`, `userName`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
