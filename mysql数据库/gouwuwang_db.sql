/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : gouwuwang_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-04-12 16:44:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '评论id',
  `productObj` int(11) NOT NULL COMMENT '被评商品',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `userObj` varchar(30) NOT NULL COMMENT '评论用户',
  `commentTime` varchar(20) default NULL COMMENT '评论时间',
  PRIMARY KEY  (`commentId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '很好干净,不错', 'user1', '2019-03-27 14:15:13');
INSERT INTO `t_comment` VALUES ('2', '1', '非常好很清香', 'user1', '2019-03-27 22:31:11');
INSERT INTO `t_comment` VALUES ('3', '2', '我想要这个洗衣服', 'user2', '2019-03-31 13:58:26');
INSERT INTO `t_comment` VALUES ('4', '2', '我同学也是这里洗衣服的', 'user2', '2019-03-31 13:59:14');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '111', '222', 'user1', '2019-03-25 23:46:29', '333', '2019-03-28 23:46:33');
INSERT INTO `t_leaveword` VALUES ('2', 'aa', 'bb', 'user1', '2019-03-25 23:08:02', '很好', '2019-03-28 23:28:01');
INSERT INTO `t_leaveword` VALUES ('3', '太好了，我可以买宝贝了', '这个网站我有很多喜欢的宝贝，太高兴了！', 'user2', '2019-03-31 14:04:17', '你喜欢就好！', '2019-03-31 14:09:07');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', 'aaaa', '<p>bbbb</p>', '2019-03-27 23:47:02');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderNo` varchar(30) NOT NULL COMMENT 'orderNo',
  `userObj` varchar(30) NOT NULL COMMENT '下单用户',
  `totalMoney` float NOT NULL COMMENT '订单总金额',
  `payWay` varchar(20) NOT NULL COMMENT '支付方式',
  `orderStateObj` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '下单时间',
  `receiveName` varchar(20) NOT NULL COMMENT '收货人',
  `telephone` varchar(20) NOT NULL COMMENT '收货人电话',
  `address` varchar(80) NOT NULL COMMENT '收货人地址',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  PRIMARY KEY  (`orderNo`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('user120190331140642', 'user1', '10517', '支付宝', '已付款', '2019-03-31 14:06:42', '双鱼林', '13598308394', '四川成都红星路13号', 'test');
INSERT INTO `t_orderinfo` VALUES ('user120190918154447', 'user1', '898', '支付宝', '待取衣服', '2019-09-18 15:44:47', '双鱼林', '13598308394', '四川成都红星路13号', '麻烦老板快点发货哦');
INSERT INTO `t_orderinfo` VALUES ('user220190331140236', 'user2', '2899', '支付宝', '待取衣服', '2019-03-31 14:02:36', '王小琴', '13598039934', '四川南充海阳路12号', '赶快发货哦！');
INSERT INTO `t_orderinfo` VALUES ('user220190331140256', 'user2', '49', '支付宝', '正在洗衣', '2019-03-31 14:02:56', '王小琴', '13598039934', '四川南充海阳路12号', '我要这个用于学习');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `itemId` int(11) NOT NULL auto_increment COMMENT '条目id',
  `orderObj` varchar(30) NOT NULL COMMENT '所属订单',
  `productObj` int(11) NOT NULL COMMENT '订单商品',
  `price` float NOT NULL COMMENT '商品单价',
  `orderNumer` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`itemId`),
  KEY `orderObj` (`orderObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_orderitem_ibfk_1` FOREIGN KEY (`orderObj`) REFERENCES `t_orderinfo` (`orderNo`),
  CONSTRAINT `t_orderitem_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('8', 'user220190331140236', '2', '1299', '1');
INSERT INTO `t_orderitem` VALUES ('9', 'user220190331140236', '1', '800', '2');
INSERT INTO `t_orderitem` VALUES ('10', 'user220190331140256', '5', '49', '1');
INSERT INTO `t_orderitem` VALUES ('11', 'user120190331140642', '4', '1773', '3');
INSERT INTO `t_orderitem` VALUES ('12', 'user120190331140642', '3', '2599', '2');
INSERT INTO `t_orderitem` VALUES ('13', 'user120190918154447', '1', '800', '1');
INSERT INTO `t_orderitem` VALUES ('14', 'user120190918154447', '5', '49', '2');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品图片',
  `productNum` int(11) NOT NULL COMMENT '商品库存',
  `price` float NOT NULL COMMENT '商品价格',
  `recommandFlag` varchar(20) NOT NULL COMMENT '是否推荐',
  `recipeFlag` varchar(20) NOT NULL COMMENT '是否处方药',
  `productDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '男士羽绒服干洗', 'upload/aa4debb1-4a15-4746-b820-b1ae16e6a82b.jpg', '99', '50', '是', '否', '<p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p><p>男士羽绒服干洗优惠中。。。。</p>', '2019-03-25 23:43:22');
INSERT INTO `t_product` VALUES ('2', '1', '女士羽绒服干洗', 'upload/aa4debb1-4a15-4746-b820-b1ae16e6a82b.jpg', '100', '80', '是', '否', '<p><br/></p><p>女士羽绒服干洗大优惠</p><p>女士羽绒服干洗大优惠</p><p>女士羽绒服干洗大优惠</p><p>女士羽绒服干洗大优惠</p><p><br/></p><p>女士羽绒服干洗大优惠</p><p>女士羽绒服干洗大优惠</p><p>女士羽绒服干洗大优惠</p><p>女士羽绒服干洗大优惠</p>', '2019-03-25 22:57:14');
INSERT INTO `t_product` VALUES ('3', '2', '成人内衣水洗', 'upload/aa4debb1-4a15-4746-b820-b1ae16e6a82b.jpg', '200', '20', '是', '否', '<p>成人内衣水洗快来啊！<br/></p><p>成人内衣水洗快来啊！</p><p>成人内衣水洗快来啊！</p><p>成人内衣水洗快来啊！</p><p>成人内衣水洗快来啊！</p><p>成人内衣水洗快来啊！</p><p>成人内衣水洗快来啊！</p><p>成人内衣水洗快来啊！</p><p>成人内衣水洗快来啊！</p><p><br/></p>', '2019-03-25 16:47:30');
INSERT INTO `t_product` VALUES ('4', '3', '男女牛仔裤干洗', 'upload/aa4debb1-4a15-4746-b820-b1ae16e6a82b.jpg', '240', '70', '是', '否', '<p>男女牛仔裤干洗速度了！男女牛仔裤干洗速度了！</p><p>男女牛仔裤干洗速度了！男女牛仔裤干洗速度了！</p><p>男女牛仔裤干洗速度了！男女牛仔裤干洗速度了！</p><p>男女牛仔裤干洗速度了！男女牛仔裤干洗速度了！</p>', '2019-03-25 16:52:54');
INSERT INTO `t_product` VALUES ('5', '4', '少女夏裙水洗', 'upload/aa4debb1-4a15-4746-b820-b1ae16e6a82b.jpg', '258', '15', '是', '是', '<p>少女夏裙水洗快啦！<br/></p><p>少女夏裙水洗快啦！</p><p>少女夏裙水洗快啦！</p><p>少女夏裙水洗快啦！</p><p>少女夏裙水洗快啦！</p><p>少女夏裙水洗快啦！</p><p>少女夏裙水洗快啦！</p><p>少女夏裙水洗快啦！</p><p>少女夏裙水洗快啦！</p><p><br/></p>', '2019-03-25 16:55:19');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '羽绒服干洗', '羽绒服干洗');
INSERT INTO `t_productclass` VALUES ('2', '内衣机洗', '内衣机洗');
INSERT INTO `t_productclass` VALUES ('3', '牛仔裤干洗', '牛仔裤干洗');
INSERT INTO `t_productclass` VALUES ('4', '女裙机洗', '女裙机洗');

-- ----------------------------
-- Table structure for `t_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `rechargeId` int(11) NOT NULL auto_increment COMMENT '充值id',
  `userObj` varchar(30) NOT NULL COMMENT '充值用户',
  `rechargeMoney` float NOT NULL COMMENT '充值金额',
  `rechargeMemo` varchar(500) default NULL COMMENT '充值备注',
  `rechargeTime` varchar(20) default NULL COMMENT '充值时间',
  PRIMARY KEY  (`rechargeId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recharge_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('1', 'user1', '100', 'test', '2019-03-27 23:46:49');
INSERT INTO `t_recharge` VALUES ('2', 'user1', '50', 'test22', '2019-03-27 23:31:50');
INSERT INTO `t_recharge` VALUES ('3', 'user1', '50', '333', '2019-03-27 23:33:05');
INSERT INTO `t_recharge` VALUES ('4', 'user2', '3000', '给用户充值', '2019-03-31 14:01:58');

-- ----------------------------
-- Table structure for `t_recipel`
-- ----------------------------
DROP TABLE IF EXISTS `t_recipel`;
CREATE TABLE `t_recipel` (
  `recipelId` int(11) NOT NULL auto_increment COMMENT '处方id',
  `recipelPhoto` varchar(60) NOT NULL COMMENT '处方照片',
  `userObj` varchar(30) NOT NULL COMMENT '上传用户',
  `recipelMemo` varchar(500) default NULL COMMENT '处方备注',
  `handState` varchar(20) NOT NULL COMMENT '处理状态',
  `addTime` varchar(20) default NULL COMMENT '上传时间',
  PRIMARY KEY  (`recipelId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recipel_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recipel
-- ----------------------------
INSERT INTO `t_recipel` VALUES ('1', 'upload/NoImage.jpg', 'user1', 'dddd', '待处理', '2019-01-14 23:46:00');
INSERT INTO `t_recipel` VALUES ('2', 'upload/NoImage.jpg', 'user1', 'bbb', '已处理', '2019-01-23 22:51:44');

-- ----------------------------
-- Table structure for `t_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `cartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `userObj` varchar(30) NOT NULL COMMENT '用户',
  `price` float NOT NULL COMMENT '单价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`cartId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_shopcart_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_shopcart_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `userMoney` float NOT NULL COMMENT '账户余额',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2019-03-24', 'upload/2a4f0e05-2407-44d0-b510-0b04a8cfa620.jpg', '13598308394', 'dashen@163.com', '四川成都红星路13号', '9200.4', '2019-03-25 23:41:53');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '王小琴', '女', '2019-03-30', 'upload/5623884d-dacc-455d-8ec7-2ff9148dc228.jpg', '13598039934', 'xiaoqin@163.com', '四川南充海阳路12号', '52', '2019-03-31 13:58:00');
