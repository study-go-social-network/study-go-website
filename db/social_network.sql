SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Admin id',
  `aname` varchar(255) NOT NULL COMMENT 'Admin Name',
  `apassword` varchar(255) NOT NULL COMMENT 'Admin Code',
  `atime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Signup Time',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Table';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '2018-04-12 01:33:06');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Article id',
  `titles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Article Title',
  `fcontent` varchar(2000) NOT NULL COMMENT 'Article Content',
  `photo` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Article Photo',
  `bname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Forum Name',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Article Time',
  `userid` int(11) NOT NULL COMMENT 'User id',
  `username` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT 'User Name',
  `status` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT 'Article Review Status (0: to be check，1: pass review，2: not pass，default: 0)',
  PRIMARY KEY (`fid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='Article Table';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('40', 'Java', 'Hello World\r\nSystem.out.println("Hello World")\r\nprintf("Hello World")\r\n', 'bc90df36-9ee5-4109-84fa-88d03453796fc21a18e75b816164119a5b193b43aabf.png', 'Java', '2019-02-08 21:12:25', '26', 'Jack', '00000000001');
INSERT INTO `article` VALUES ('41', 'C++', 'Hello World\r\nSystem.out.println("Hello World")\r\nprintf("Hello World")\r\n', '43e07293-b21f-4acc-86a2-fe872e2b2f37TIM20180417211544.png', 'C++', '2019-02-08 21:16:18', '28', 'Jack', '00000000001');
INSERT INTO `article` VALUES ('42', 'Java', 'Hello World\r\nSystem.out.println("Hello World")\r\nprintf("Hello World")\r\n', 'af22fd04-500d-4efb-b5bc-1c3664f5c77b162d2fb6ff55f58d.gif', 'Frontend', '2019-06-02 21:07:04', '29', 'Mike', '00000000001');
INSERT INTO `article` VALUES ('43', 'C++', 'Hello World\r\nSystem.out.println("Hello World")\r\nprintf("Hello World")\r\n', 'c1798a8b-cb55-4368-8b58-91635ee7706c4be57d50d7eb0ef7bac518d2e417c5b0.jpg', 'Python', '2019-06-04 08:15:23', '43', 'Jervis', '00000000001');
INSERT INTO `article` VALUES ('44', 'Java', 'Hello World\r\nSystem.out.println("Hello World")\r\nprintf("Hello World")\r\n', '706cc9ec-e0e0-4d19-bda6-75c268dab634TIM20180417221545.png', 'Github', '2019-09-28 17:48:58', '44', 'Tom', '00000000001');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Follow Table id',
  `userid` int(11) NOT NULL COMMENT 'Active Follow id',
  `beuserid` int(11) NOT NULL COMMENT 'Passive Follow id',
  PRIMARY KEY (`gid`),
  KEY `userid` (`userid`),
  KEY `beuserid` (`beuserid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Follow Table';

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Favorite Table id',
  `userid` int(11) NOT NULL COMMENT 'Collector id',
  `fid` int(11) NOT NULL COMMENT 'Favorite Article id',
  PRIMARY KEY (`sid`),
  KEY `userid` (`userid`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Favorite Table';

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Comment id',
  `pcontent` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Comment Content',
  `userid` int(11) NOT NULL COMMENT 'Comment User',
  `fid` int(11) NOT NULL COMMENT 'Commented Article id',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Comment Time',
  PRIMARY KEY (`cid`),
  KEY `userid` (`userid`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='Comment Table';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('26', 'Hello World', '28', '44', '2019-12-17 21:34:46');
INSERT INTO `comment` VALUES ('27', 'Hello World', '28', '42', '2019-12-17 21:35:49');
INSERT INTO `comment` VALUES ('29', 'Hello World', '26', '43', '2019-12-17 21:36:49');
INSERT INTO `comment` VALUES ('30', 'Hello World', '26', '42', '2019-12-17 21:37:13');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'forum id',
  `bname` varchar(255) NOT NULL COMMENT 'forum Name',
  `btime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'forum Create Time',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='forum Table';

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('1', 'Java', '2018-03-30 18:08:51');
INSERT INTO `forum` VALUES ('2', 'C++', '2018-03-30 18:55:29');
INSERT INTO `forum` VALUES ('3', 'Python', '2018-04-17 20:00:42');
INSERT INTO `forum` VALUES ('19', 'AI', '2018-04-17 20:01:55');
INSERT INTO `forum` VALUES ('20', 'Mobile', '2018-04-17 20:03:56');
INSERT INTO `forum` VALUES ('21', 'Life', '2018-04-17 20:04:25');
INSERT INTO `forum` VALUES ('22', 'Frontend', '2018-04-17 20:05:00');
INSERT INTO `forum` VALUES ('23', 'Linux', '2018-04-17 20:05:05');
INSERT INTO `forum` VALUES ('24', 'Windows', '2018-04-17 20:05:10');
INSERT INTO `forum` VALUES ('26', 'Github', '2018-06-04 10:09:34');
INSERT INTO `forum` VALUES ('27', 'C#', '2018-10-11 12:58:03');
INSERT INTO `forum` VALUES ('29', 'Other', '2019-04-11 12:58:03');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User id',
  `name` varchar(45) NOT NULL COMMENT 'User Name',
  `age` int(11) DEFAULT NULL COMMENT 'Age',
  `sex` varchar(255) DEFAULT NULL COMMENT 'Sex',
  `password` varchar(45) NOT NULL COMMENT 'User Password',
  `email` varchar(45) NOT NULL COMMENT 'User Email',
  `family` varchar(45) DEFAULT NULL COMMENT 'User Address',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Personal Description',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Signup Time',
  `stime` decimal(10, 2) DEFAULT NULL COMMENT 'Study time',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='User Table';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('26', 'Viavatarn', null, null, '123', '924818949@gmail.com', null, null, '2019-05-17 20:07:06', '0.00');
INSERT INTO `user` VALUES ('28', 'Jack', null, null, '123', '6755656565@gmail.com', null, null, '2019-05-17 21:29:57', '0.00');
INSERT INTO `user` VALUES ('29', 'Mike', '48', 'Male', '888999', 'maliangnansheng@gmail.com', 'Hong Kong', 'Null', '2019-06-03 22:58:12', '0.00');
INSERT INTO `user` VALUES ('43', 'Jervis', '48', 'Male', '123', '924818949@gmail.com', 'Hong Kong', 'YA', '2019-06-04 10:08:14', '0.00');
INSERT INTO `user` VALUES ('44', 'Tom', null, null, '123', '225778@gmail.com', null, null, '2019-08-28 23:59:32', '0.00');
INSERT INTO `user` VALUES ('45', 'a', null, null, 'a', 'a@a.com', null, null, '2019-09-15 14:32:42', '0.00');
INSERT INTO `user` VALUES ('46', 'b', null, null, '123', '77373737@gmail.com', null, null, '2019-09-28 17:33:09', '0.00');
INSERT INTO `user` VALUES ('47', '111', null, null, '111', 'xiang.wang@gmail.com', null, null, '2019-09-21 14:42:36', '0.00');
INSERT INTO `user` VALUES ('49', 'unknown', null, null, '123456', '123456@gmail.com', null, null, '2019-10-11 12:32:46', '0.00');
INSERT INTO `user` VALUES ('52', 'Google', '18', 'Male', '735014', '1295632566@gmail.com', 'Orange', 'Apple', '2019-10-13 17:04:13', '0.00');
INSERT INTO `user` VALUES ('53', 'Microsoft', null, null, '123456', '1179820776@gmail.com', null, null, '2019-10-15 17:22:13', '0.00');
INSERT INTO `user` VALUES ('54', 'Hello', null, null, '123', '968526@gmail.com', null, null, '2019-10-16 23:53:49', '0.00');

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar` (
  `userid` int(11) NOT NULL COMMENT 'User id',
  `photo` varchar(255) NOT NULL COMMENT 'User Photo',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Photo Table';

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES ('26', 'cbe21bee-bd76-49c3-ac80-25329539bf24beijing3.png');
INSERT INTO `avatar` VALUES ('28', 'ae736c2d-b55b-4135-8c32-7fc433d2ab39156e36861bcbe7ccd83b9bada2e99322.jpg');
INSERT INTO `avatar` VALUES ('29', '6bf20733-8291-4d42-a29f-87c8368c968f2017_9_1_16_57_31_id7_814f253234a906a1d422f3c4fe832fa1.jpg');
INSERT INTO `avatar` VALUES ('54', 'a6fea7d5-4245-437e-b845-c21572787d68-3b7a0f0c9e1beb73.jpg');

DROP TABLE IF EXISTS `ranking`;
CREATE TABLE `ranking` (
	`rid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ranking Table id (Rank)',
	`userid` int(11) NOT NULL COMMENT 'User id',
	`username` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT 'User Name',
    `time` decimal(10, 8) NOT NULL COMMENT 'Study Time',
    `rate` int(11) NOT NULL COMMENT 'Rating',
    `postnum` int(10) NOT NULL COMMENT 'Post Number' ,
    `favoritenum` int(10) NOT NULL COMMENT 'Number of Favorite' DEFAULT '0',
    `follownum` int(10) NOT NULL COMMENT 'Follow Number',
    `level` int(10) NOT NULL COMMENT 'Level',
    `sstime` int(10) NOT NULL COMMENT 'Successfully Study Time',
    `total` decimal(10, 8) NOT NULL COMMENT 'Total score',
    PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ranking Table';

-- ----------------------------
-- Records of ranking
-- ----------------------------

INSERT INTO `ranking` VALUES ('1', '26', 'Viavatarn', '0.00', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('2', '28', 'Jack', '0.00', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('3', '29', 'Mike', '0.00', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('4', '43', 'Jervis', '0.00', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('5', '44', 'Tom', '0.00', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('6', '45', 'a', '0.00', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('7', '46', 'b', '0.00', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('8', '47', '111', '0.00', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('9', '49', 'unknown', '0.00', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('10', '52', 'Google', '0.00', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('11', '53', 'Microsoft', '0.00', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `ranking` VALUES ('12', '54', 'Hello', '0.00', '0', '0', '0', '0', '0', '0', '0');

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
	`userid` int(11) DEFAULT NULL COMMENT 'Sponsor id',
    `slat` decimal(10, 8) NOT NULL COMMENT 'Sponsor latitude',
    `slng` decimal(11, 8) NOT NULL COMMENT 'Sponsor longtitude',
	`end_time` datetime DEFAULT NULL COMMENT 'Study end time',
    `description` varchar(255) DEFAULT NULL COMMENT 'Event description',
    `eventid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Event id',
    `title` varchar(255) DEFAULT NULL COMMENT 'Event title',
    PRIMARY KEY (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='Event Table';

DROP TABLE IF EXISTS `study`;
CREATE TABLE `study` (
	`eventid` int(11) NOT NULL COMMENT 'Study table id',
	`userid` int(11) NOT NULL COMMENT 'Sponsor',
	`ustart` datetime DEFAULT NULL COMMENT 'Sponsor study start time',
    `uend` datetime DEFAULT NULL COMMENT 'Sponsor end time',    
    `pid` int(11) DEFAULT NULL COMMENT 'Study partner',
	`pstart` datetime DEFAULT NULL COMMENT 'Partner study end time',    
    `urate` int(10) DEFAULT NULL COMMENT 'Sponsor rate',
    `prate` int(10) DEFAULT NULL COMMENT 'Partner rate'
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='Study Table';

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
	`hid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Status table id',
	`userid` int(11) NOT NULL COMMENT 'Sponsor',
    `pid` int(11) NOT NULL COMMENT 'Study partner',
    `user_allow` varchar(2) NOT NULL COMMENT 'Sponsor''s allowance Y/N',
    PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='Status Table';

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
    `fromuserid` int(11) DEFAULT NULL COMMENT 'From side userid',
    `touserid` int(11) DEFAULT NULL COMMENT 'To side userd',
    `messageType` varchar(255) DEFAULT NULL COMMENT 'Message type',
    `eventid` int(11) DEFAULT NULL COMMENT 'Event id',
    `isRead` varchar(255) NOT NULL COMMENT 'If the message is read'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Message Table';