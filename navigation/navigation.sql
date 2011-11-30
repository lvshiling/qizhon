/*
Navicat MySQL Data Transfer

Source Server         : 192.168.82.213@chuanyong
Source Server Version : 50027
Source Host           : 192.168.82.213:3306
Source Database       : navigation

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2011-11-30 10:49:47
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO area VALUES ('1', 'qule');
INSERT INTO area VALUES ('2', 'jiasu');

-- ----------------------------
-- Table structure for `file_gpass`
-- ----------------------------
DROP TABLE IF EXISTS `file_gpass`;
CREATE TABLE `file_gpass` (
  `id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `file_key` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `file_key` (`file_key`),
  KEY `file_name` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_gpass
-- ----------------------------

-- ----------------------------
-- Table structure for `file_search`
-- ----------------------------
DROP TABLE IF EXISTS `file_search`;
CREATE TABLE `file_search` (
  `id` int(11) NOT NULL auto_increment,
  `file_name` varchar(100) NOT NULL,
  `file_path` text,
  `file_ext` varchar(20) default NULL,
  `is_folder` int(11) default '0',
  `is_common` int(11) default '0',
  `host_folder` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `file_name` (`file_name`),
  KEY `is_common` (`is_common`),
  KEY `file_ext` (`file_ext`),
  KEY `host_folder` (`host_folder`),
  CONSTRAINT `file_search_fk` FOREIGN KEY (`host_folder`) REFERENCES `file_search_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_search
-- ----------------------------

-- ----------------------------
-- Table structure for `file_search_config`
-- ----------------------------
DROP TABLE IF EXISTS `file_search_config`;
CREATE TABLE `file_search_config` (
  `id` int(11) NOT NULL auto_increment,
  `folder_name` varchar(20) default NULL,
  `folder_path` varchar(200) default NULL,
  `folder_real_path` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_search_config
-- ----------------------------
INSERT INTO file_search_config VALUES ('2', '测试', 'E:\\tmp', 'E:\\tmp	');
INSERT INTO file_search_config VALUES ('3', '游戏策划与运营', '\\\\192.168.35.50\\fas270\\游戏策划与运营', 'Y:\\游戏策划与运营');
INSERT INTO file_search_config VALUES ('4', '电影', '\\\\192.168.35.50\\fas270\\电影', 'Y:\\电影');
INSERT INTO file_search_config VALUES ('5', '剧集', '\\\\192.168.35.50\\fas270\\剧集', 'Y:\\剧集');
INSERT INTO file_search_config VALUES ('6', '电子书', '\\\\192.168.35.50\\fas270\\电子书', 'Y:\\电子书');
INSERT INTO file_search_config VALUES ('7', '软件共享', '\\\\192.168.35.10\\g_public\\tools', 'X:\\tools');

-- ----------------------------
-- Table structure for `game`
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO game VALUES ('1', '111', '0');
INSERT INTO game VALUES ('2', '222', '0');
INSERT INTO game VALUES ('3', '333', '0');

-- ----------------------------
-- Table structure for `game_area`
-- ----------------------------
DROP TABLE IF EXISTS `game_area`;
CREATE TABLE `game_area` (
  `id` int(11) NOT NULL auto_increment,
  `game_id` int(11) NOT NULL,
  `area_name` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `game_area_fk` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_area
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(200) NOT NULL,
  `content` text,
  `add_time` datetime default NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `news_fk` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO news VALUES ('1', '1111', '1111', '2011-07-04 11:23:35', '2');
INSERT INTO news VALUES ('2', '222', '222', '2011-07-04 11:30:04', '2');
INSERT INTO news VALUES ('3', '333', '333', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('4', '444', '444', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('5', '555', '555', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('6', '666', '666', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('7', '777', '777', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('8', '888', '888', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('9', '999', '999', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('10', '1000', '0000', '2011-07-04 11:30:12', '2');
INSERT INTO news VALUES ('11', '111', '111', '2011-07-04 11:30:12', '2');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL auto_increment,
  `room_no` int(11) default NULL,
  `user_id` int(11) default NULL,
  `room_name` varchar(30) default NULL,
  `create_time` datetime default NULL,
  `occupants_count` int(11) default NULL,
  `room_key` varchar(40) default NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_room_1` (`room_no`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO room VALUES ('1', '10001', '67', '10001', '2011-11-24 14:33:00', '2', '133dad6cf44dad14ada52d50002');
INSERT INTO room VALUES ('2', '10002', '93', '10002', '2011-11-24 14:33:01', null, null);
INSERT INTO room VALUES ('3', '10003', '14', '10003', '2011-11-24 14:33:01', null, null);
INSERT INTO room VALUES ('4', '10004', '38', '10004', '2011-11-24 14:33:01', '2', '133ef76e3b8ef76e3b852d54925');
INSERT INTO room VALUES ('5', '10005', '36', '10005', '2011-11-24 14:33:01', '4', '133d449582ed4484c6b52d52493');
INSERT INTO room VALUES ('6', '10006', '89', '10006', '2011-11-24 14:33:02', null, null);
INSERT INTO room VALUES ('7', '10007', '66', '10007', '2011-11-24 14:33:02', null, null);
INSERT INTO room VALUES ('8', '10008', '94', '10008', '2011-11-24 14:39:04', '3', '133d50cc3a5d50cc3a552d50001');
INSERT INTO room VALUES ('9', '10009', '8', '10009', '2011-11-28 11:47:43', null, null);
INSERT INTO room VALUES ('10', '10010', '76', '10010', '2011-11-28 12:36:40', null, null);
INSERT INTO room VALUES ('11', '10011', '95', '10011', '2011-11-28 19:56:44', null, null);
INSERT INTO room VALUES ('12', '10012', '96', '10012', '2011-11-29 17:36:07', null, null);
INSERT INTO room VALUES ('13', '10013', '68', '10013', '2011-11-29 19:31:24', null, null);

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL auto_increment,
  `tag_name` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `user_name` varchar(100) default NULL,
  `status` int(11) default NULL,
  `name` varchar(100) default NULL,
  `content` varchar(800) default NULL,
  `offer_price` float default NULL,
  `start_date` datetime default NULL,
  `end_date` datetime default NULL,
  `winner_id` int(11) default NULL,
  `winner_name` varchar(100) default NULL,
  `task_acpt_id` int(11) default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for `task_accept`
-- ----------------------------
DROP TABLE IF EXISTS `task_accept`;
CREATE TABLE `task_accept` (
  `id` int(11) NOT NULL auto_increment,
  `task_id` int(11) default NULL,
  `task_name` varchar(100) default NULL,
  `user_id` int(11) default NULL,
  `user_name` varchar(100) default NULL,
  `status` int(11) default NULL,
  `quote_price` float default NULL,
  `user_acct` varchar(100) default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_accept
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL auto_increment,
  `sort_id` int(11) default NULL,
  `title` varchar(200) NOT NULL,
  `content` text,
  `author_id` int(11) NOT NULL,
  `author_name` varchar(20) default NULL,
  `last_reply_user_id` int(11) default NULL,
  `last_reply_author_name` varchar(20) default NULL,
  `add_time` datetime default NULL,
  `last_reply_time` datetime default NULL,
  `state` int(11) NOT NULL default '0',
  `sync_id` bigint(20) default NULL,
  `reply_count` int(11) default '0',
  `subscribe_count` int(11) default '0',
  `is_fake` int(11) default '0',
  `ip_address` varchar(20) default NULL,
  `area_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `author_id` (`author_id`),
  KEY `last_reply_user_id` (`last_reply_user_id`),
  KEY `sync_id` (`sync_id`),
  KEY `sort_id` (`sort_id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `topic_fk` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `topic_fk1` FOREIGN KEY (`last_reply_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `topic_fk2` FOREIGN KEY (`sort_id`) REFERENCES `topic_sort` (`id`),
  CONSTRAINT `topic_fk3` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO topic VALUES ('528', null, '巨人自主研发的代号为“M2”的新一代游戏引擎，将随着《龙魂》的内测浮出水面。“M2”引擎代表了目前网游业“成都造”3D引擎的最高水平。M2由Men2简化而来，Men2寓意《龙魂》的真男人二代定位。M2引擎在内部还有个非常本土化的名字，叫大熊猫引擎。  http://sinaurl.cn/beBvk', '', '9', '@巨人网络', null, null, '2010-08-12 11:40:31', '2010-08-12 11:40:31', '0', '1680730568', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('529', null, '【支持《龙魂》内测，赢ipad！】《龙魂》8月12日开启内测。现在起成为巨人微博粉丝，转发或评论本帖，转帖或评论每突破1千条，将随机抽取一名参与者送微博光电鼠标；突破1万条后，将由@新浪游戏 在8月31日活动截止当天，从参与转帖或评论博友中，抽出《龙魂》iPad(16G WIFI)大奖。届时公布获奖结果！', '<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag8d9d312e2e51&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag8d9d312e2e51&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-12 18:04:16', '2010-08-12 18:04:16', '0', '1689388991', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('530', null, '转发微博。', '@柳岩：「有生之年，狭路相逢，终不能幸免，手心忽然长出纠缠的曲线。」--王菲「流年」，各位七夕快乐，一个人的，就跟自己谈个恋爱，对自己更好一点。<a href=\'http://ss2.sinaimg.cn/orignal/62047bf248de9b5eb7a21&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/62047bf248de9b5eb7a21&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-16 13:46:43', '2010-08-16 13:46:43', '0', '1780535385', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('531', null, '【#七夕围脖织爱#，抢鼠标】七夕来临，巨人与大家一起见证特别时刻！现在起，只要成为巨人粉丝，转发本贴，并且在转发评论中分享你的“甜蜜心情”。第77，177，277楼(逢100进)...将获得巨人-新浪微博光电鼠标1只，快递上门！本活动于今日24：00截止（重复转以第一次中标为准）@统计评论', '<a href=\'http://ss11.sinaimg.cn/orignal/6232cd9ag8dea8c9bf72a&690\' target=\'_blank\'><img src=\'http://ss11.sinaimg.cn/thumbnail/6232cd9ag8dea8c9bf72a&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-16 14:00:31', '2010-08-16 14:00:31', '0', '1780872168', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('532', null, '正值七夕佳节，巨人旗下游戏当然也不闲着，纷纷推出七夕特别活动----《征途》“爱要大声说出来”活动让千万玩家见证你的爱情；《仙途》“我是女王，谁是情圣？”活动夺取情人节专属称号；《巨人》&quot;七夕情缘五重惊喜&quot;活动给你接连不断的节日惊喜！在这个特殊的日子，千万别错过你所喜爱游戏的精彩！', '', '9', '@巨人网络', null, null, '2010-08-16 16:31:11', '2010-08-16 16:31:11', '0', '1784301129', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('533', null, '巨人微博女孩Yuki Q：接到前台电话，去抱回好大一束香水百合，太扎眼啦，很快就引来一堆同事围观。更雷的是，翻了半天居然没找到署名，不过非常感谢这位送花的朋友，Yuki很开心哦！七夕节啦，祝大家节日快乐，有情人终成眷属！', '<a href=\'http://ss16.sinaimg.cn/orignal/6232cd9ag8deccffe499f&690\' target=\'_blank\'><img src=\'http://ss16.sinaimg.cn/thumbnail/6232cd9ag8deccffe499f&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-16 16:42:39', '2010-08-16 16:42:39', '0', '1784574741', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('534', null, '【#七夕围脖织爱#，抢鼠标】活动圆满落幕啦！感谢各位博友热情踊跃地参与！让我们去看看哪些幸运的博友获得了这款巨人-新浪微博光电鼠标吧（注：重复中标以第一次为准），获奖的朋友请于8月31日之前通过“发私信”将礼品快递的地址及联系方式告知我们，我们届时将把奖品快递给各位。', '<a href=\'http://ss13.sinaimg.cn/orignal/6232cd9ag8dfc0f84ba0c&690\' target=\'_blank\'><img src=\'http://ss13.sinaimg.cn/thumbnail/6232cd9ag8dfc0f84ba0c&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-17 10:55:04', '2010-08-17 10:55:04', '0', '1801547697', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('535', null, '热烈庆祝巨人网络官方微博粉丝数过10000啦！巨人网络开博至今，越来越多的博友们加入到了这个大家庭，在此感谢大家这些日子的关注和支持，我们将为第10000位粉丝 @筱筱圣姑 送上巨人-新浪微博光电鼠标一个！请这位幸运的粉丝通过“发私信”将礼品快递的地址及联系方式告知我们，我们将把奖品快递给您。', '<a href=\'http://ss13.sinaimg.cn/orignal/6232cd9ag8dfc34ae92cc&690\' target=\'_blank\'><img src=\'http://ss13.sinaimg.cn/thumbnail/6232cd9ag8dfc34ae92cc&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-17 11:04:54', '2010-08-17 11:04:54', '0', '1801773705', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('536', null, '转帖过千，第一位幸运的获奖者已经产生！祝贺 @何梓洋KK 获得“巨人-新浪微博光电鼠标”一个！然而，最终的《龙魂》ipad大奖依然在等待它的主人！8月31日以前，赶快来试试自己的运气吧，也许ipad的主人就是你！', '@巨人网络：【支持《龙魂》内测，赢ipad！】《龙魂》8月12日开启内测。现在起成为巨人微博粉丝，转发或评论本帖，转帖或评论每突破1千条，将随机抽取一名参与者送微博光电鼠标；突破1万条后，将由@新浪游戏 在8月31日活动截止当天，从参与转帖或评论博友中，抽出《龙魂》iPad(16G WIFI)大奖。届时公布获奖结果！<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag8d9d312e2e51&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag8d9d312e2e51&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-17 13:43:18', '2010-08-17 13:43:18', '0', '1805468246', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('537', null, '转发微博。', '@龙魂官博：【转贴，抢龙魂3D鼠标垫】活动圆满落幕，感谢各位热情参与！现公布获奖名单（注：重复中标以第一次为准），获奖博主请于8月31日前，将快递地址“发私信”给我们。（注释：此活动以转发统计为准，查看链接  http://sinaurl.cn/5PQbG，链接中可切换至评论统计链接，请勿混淆。）<a href=\'http://ss8.sinaimg.cn/orignal/6a834f57g8e102091e767&690\' target=\'_blank\'><img src=\'http://ss8.sinaimg.cn/thumbnail/6a834f57g8e102091e767&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-18 10:57:48', '2010-08-18 10:57:48', '0', '1826791856', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('538', null, '转发微博。', '@纪学锋：征途2测试开始满2天了，几乎都是不眠之夜，团队兄弟都是好样的，发现问题，解决问题，调整内容。这个团队同样有做征途时候的执行力，甚慰', '9', '@巨人网络', null, null, '2010-08-19 09:52:35', '2010-08-19 09:52:35', '0', '1851026819', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('539', null, '前不久公司又入职了一批新员工，巨人家族的规模越来越庞大了！这是拓展训练时的留影，这个游戏很考验团队合作，很神奇吧？', '<a href=\'http://ss1.sinaimg.cn/orignal/6232cd9ag8e275df6b6f0&690\' target=\'_blank\'><img src=\'http://ss1.sinaimg.cn/thumbnail/6232cd9ag8e275df6b6f0&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-19 14:34:44', '2010-08-19 14:34:44', '0', '1858079868', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('540', null, '转发微博。', '@iPad中文报：《iiPad新广告：好吃、好玩、好神奇》苹果公司昨天在黄金时间发布了一支iPad新广告。从美食烹饪，娱乐、学习到办公，这支新广告强调了iPad应用的丰富性，也就是说iPad其实已经渗透到了生活的方方面面，充分展现iPad魅力所在。观看视频，请登录：http://sinaurl.cn/GvXg3<a href=\'http://ss5.sinaimg.cn/orignal/683fbf2ct8e23843f7614&690\' target=\'_blank\'><img src=\'http://ss5.sinaimg.cn/thumbnail/683fbf2ct8e23843f7614&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-19 14:45:49', '2010-08-19 14:45:49', '0', '1858353269', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('541', null, '巨人首款横版3D格斗闯关网游、首款代理的韩国网游《艾尔之光》开始织围脖。', '@艾尔之光：[嘻嘻] 热烈庆祝《艾尔之光》官方微博上线！~', '9', '@巨人网络', null, null, '2010-08-19 17:31:35', '2010-08-19 17:31:35', '0', '1862555300', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('542', null, '很动人的漫画风来袭', '@艾尔之光：《艾尔之光》日服超唯美宣传视频！ http://sinaurl.cn/5hjM2', '9', '@巨人网络', null, null, '2010-08-19 17:39:01', '2010-08-19 17:39:01', '0', '1862745356', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('543', null, '旗舰续作《征途2》迎第三次删档研发测试，开始吭哧吭哧织围脖。', '@征途2：征途2，低调开始织围脖。', '9', '@巨人网络', null, null, '2010-08-19 17:43:54', '2010-08-19 17:43:54', '0', '1862869406', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('544', null, '转发微博。', '@龙魂官博：“高价收购QQ签名活动”一经推出就受到无数玩家追捧。而“团购QQ签名”就是在高价收购QQ签名活动的基础上进行升级的版本。单独玩家除了通过添加官方活动QQ为好友参加活动以外，还能通过添加你的团长或者会长的团购QQ号为好友，更加便捷的参与到我们的活动中来。<a href=\'http://ss7.sinaimg.cn/orignal/6a834f57g8e2a4497e526&690\' target=\'_blank\'><img src=\'http://ss7.sinaimg.cn/thumbnail/6a834f57g8e2a4497e526&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-20 10:00:32', '2010-08-20 10:00:32', '0', '1878377328', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('545', null, '真男人《龙魂》送出的幸运仍在继续，随着转帖突破2000大关，第二位幸运的获奖者产生了----让我们一起祝贺@小明斯基 ，同样送上“巨人-新浪微博光电鼠标”一个！那么谁又能成为最终拥有最多幸运的那个人呢？大奖ipad究竟花落谁家？我们还将拭目以待！', '@巨人网络：【支持《龙魂》内测，赢ipad！】《龙魂》8月12日开启内测。现在起成为巨人微博粉丝，转发或评论本帖，转帖或评论每突破1千条，将随机抽取一名参与者送微博光电鼠标；突破1万条后，将由@新浪游戏 在8月31日活动截止当天，从参与转帖或评论博友中，抽出《龙魂》iPad(16G WIFI)大奖。届时公布获奖结果！<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag8d9d312e2e51&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag8d9d312e2e51&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-20 10:03:07', '2010-08-20 10:03:07', '0', '1878438455', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('546', null, '听说《征途2》第三次研发测试的激活码所剩不多，有需求的玩家赶快去试试运气哦！', '@征途2：【转贴，抢《征途2》激活码】迎《征途2》研发测试，马上成为《征途2》官博粉丝，转发本贴，并在转发评论中发表对《征途2》的祝福、建议。第200，400位(逢200进)...转发的博主将获《征途2》研发测试激活码一个！通过私信发。本条于1000位截止（重复转以第一次中标为准）@统计评论<a href=\'http://ss16.sinaimg.cn/orignal/64a0c959g749f996a887f&690\' target=\'_blank\'><img src=\'http://ss16.sinaimg.cn/thumbnail/64a0c959g749f996a887f&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-20 15:37:37', '2010-08-20 15:37:37', '0', '1887082558', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('547', null, '故事与古诗的完美融合', '@征途2：随着《征途2》任务的进程，玩家能体验到各种凄美的爱情故事，《征途2》用自己的故事重新诠释了一些千古名诗。当你慢慢随着任务细细品味各种相识之酸、相恋之甜、相思之苦、相交之辣，就会体会到这些流传千古的名句和你自己的人生更深层次的寓意。<a href=\'http://ss4.sinaimg.cn/orignal/64a0c959g8e3d295d4c93&690\' target=\'_blank\'><img src=\'http://ss4.sinaimg.cn/thumbnail/64a0c959g8e3d295d4c93&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-21 12:16:54', '2010-08-21 12:16:54', '0', '1908633992', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('548', null, '1000G移动硬盘很实用，人多力量大，组团来PK。', '@征途2：【发祝福，抢硬盘】《征途2》周末推大礼！马上成《征途2》官博粉丝，发新帖，帖中包含#史上最华丽的2D游戏征途2测试#。9月5日24:00活动截止时，若《征途2》官博粉丝突破1999人，将向所发该话题新帖被转发次数最多的博主，送出这希捷1000G移动硬盘1套。快递上门。公开透明，发动好友帮转吧！@统计评论<a href=\'http://ss1.sinaimg.cn/orignal/64a0c959g8e462f4117d0&690\' target=\'_blank\'><img src=\'http://ss1.sinaimg.cn/thumbnail/64a0c959g8e462f4117d0&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-21 12:24:02', '2010-08-21 12:24:02', '0', '1908780146', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('549', null, '活动转帖突破3000，在此感谢广大博友们持续的热情！在此祝贺我们的第三位获奖者@柚子茶2012 ，送上“巨人-新浪微博光电鼠标”一个！《龙魂》送出的幸运依然在继续，想要获得最终的《龙魂》iapd终极大奖吗？机不可失，赶快努力吧！', '@巨人网络：【支持《龙魂》内测，赢ipad！】《龙魂》8月12日开启内测。现在起成为巨人微博粉丝，转发或评论本帖，转帖或评论每突破1千条，将随机抽取一名参与者送微博光电鼠标；突破1万条后，将由@新浪游戏 在8月31日活动截止当天，从参与转帖或评论博友中，抽出《龙魂》iPad(16G WIFI)大奖。届时公布获奖结果！<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag8d9d312e2e51&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag8d9d312e2e51&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-23 11:09:51', '2010-08-23 11:09:51', '0', '1955539521', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('550', null, '一起见证史上最华丽的2D游戏', '@征途2：《征途2》这次研发测试暂时只开放两个国家，“楚汉争霸”谱写了一段金戈铁马、热血沸腾的战争传奇。而在《征途2》中，从一测开始，参与测试的每个玩家都在演绎自己的传奇。这也是《征途2》所期望延续《征途》的经典之一，更是《征途2》的魅力所在！<a href=\'http://ss12.sinaimg.cn/orignal/64a0c959g8e774ccb250b&690\' target=\'_blank\'><img src=\'http://ss12.sinaimg.cn/thumbnail/64a0c959g8e774ccb250b&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-23 15:03:43', '2010-08-23 15:03:43', '0', '1961306423', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('551', null, '之前官博活动中有部分获奖者还未联系我们，他们是：【#七夕围脖织爱#，抢鼠标】的获奖者@路劭痴 @maowenqq @凑脚丫 @gemmay @tutukong @哎呀玮 @28巨人 @缘梦惜缘 ，【支持《龙魂》内测，赢ipad！】的获奖者@小明斯基 。请这些博友尽快将快递奖品的地址和联系方式“发私信”我们。', '', '9', '@巨人网络', null, null, '2010-08-23 16:01:04', '2010-08-23 16:01:04', '0', '1962645130', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('552', null, '《征途2》又送第三次研发测试激活码了，赶快抢吧。', '@征途2：【抢激活码】《征途2》第三次研发删档测试得到了大家高度关注与支持，激活码目前也是一码难求。为答谢玩家，我们官博在线活动争取到第二批激活码！规则：成为官博粉丝，第200，400，600，800，1000楼转贴，以及第100，300，500，700，900楼评论，将获得《征途2》激活码一个！请赶快下手！@统计评论<a href=\'http://ss16.sinaimg.cn/orignal/64a0c959g8e89e4a5769f&690\' target=\'_blank\'><img src=\'http://ss16.sinaimg.cn/thumbnail/64a0c959g8e89e4a5769f&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-24 13:57:09', '2010-08-24 13:57:09', '0', '1988103540', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('553', null, '《龙魂》带你体验“真男人”的世界。', '@龙魂官博：真男人成王败寇战场中，兄弟情义舍命易。《龙魂》世界中，从20级开始就能组建家族，40级便能创建军团，和志同道合的战友一起成就不世霸业！PK战、家族战、国战……《龙魂》兄弟情义千金不易，执兵狂笑战天下。 “真男人”的世界中，你能成为他们最信赖的战友吗？<a href=\'http://ss7.sinaimg.cn/orignal/6a834f57g8e892df023d6&690\' target=\'_blank\'><img src=\'http://ss7.sinaimg.cn/thumbnail/6a834f57g8e892df023d6&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-25 13:25:46', '2010-08-25 13:25:46', '0', '2017609735', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('554', null, '随着转帖破4000，第4位“巨人-新浪微博光电鼠标”获得者诞生了，祝贺博友@橙月09 获奖！（请将奖品快递地址和联系方式“发私信”给我们。）《龙魂》终极大奖依然等着大家来挑战，只需要一些努力+一些运气，也许《龙魂》ipad将会属于你哦，赶快行动吧！', '@巨人网络：【支持《龙魂》内测，赢ipad！】《龙魂》8月12日开启内测。现在起成为巨人微博粉丝，转发或评论本帖，转帖或评论每突破1千条，将随机抽取一名参与者送微博光电鼠标；突破1万条后，将由@新浪游戏 在8月31日活动截止当天，从参与转帖或评论博友中，抽出《龙魂》iPad(16G WIFI)大奖。届时公布获奖结果！<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag8d9d312e2e51&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag8d9d312e2e51&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-25 13:43:44', '2010-08-25 13:43:44', '0', '2018134624', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('555', null, '呼唤各路英雄人马，前来一展身手。', '@征途2：《征途2》已于8月16日开启第三次删档研发测试，现诚邀编辑记者等专业人士鉴定游戏。凡被认定为专业人士，并提交了相关《征途2》评测报告，根据评测报告的内容和深度，《征途2》将送出超级大奖以示感激。如果您是业内人士，请一定要来见证史上最华丽的2D游戏《征途2》的再一次华丽蜕变。', '9', '@巨人网络', null, null, '2010-08-25 17:41:59', '2010-08-25 17:41:59', '0', '2024495249', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('556', null, '真金白银发Q币，走过路过别错过！', '@征途2：【支持征途2测试，抢Q币】规则：关注《征途2》微博，转发此帖并在评论中发表对《征途2》祝福或建议，在粉丝达到1599时，向第200位转贴者送出10个Q币；1699时，向第400位转贴者送出10个Q币，以此类推，本帖在1000位转贴截止。私信发送。重复者以第一次中标为准。@统计评论<a href=\'http://ss11.sinaimg.cn/orignal/64a0c959g8ea31962d14a&690\' target=\'_blank\'><img src=\'http://ss11.sinaimg.cn/thumbnail/64a0c959g8ea31962d14a&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-25 20:17:52', '2010-08-25 20:17:52', '0', '2028372046', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('557', null, '悠游网与巨人网络签订合作协议，由巨人提供地面推广支持，双方共同推广奇幻修真网游《飘邈之旅2010 OL》。该游戏由智冠集团旗下的智乐堂研发，取材自拥有上亿点击的修真小说《飘邈之旅》。', '<a href=\'http://ss11.sinaimg.cn/orignal/6232cd9ag8ea7c42c220a&690\' target=\'_blank\'><img src=\'http://ss11.sinaimg.cn/thumbnail/6232cd9ag8ea7c42c220a&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-25 23:45:23', '2010-08-25 23:45:23', '0', '2034819603', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('558', null, '今天《飘渺之旅》会议中，认识对方一位协理张益民。听说台湾公司中，协理等同部门最高主管。张协理18岁进入智冠，做了22年，体重从90斤做到90公斤。我们部门最近不少面试，充满张力的新面孔一张张加入。老大愿望是，找一群志同道合的实在人一起做事。这其中，会出一个张协理么？（巨人宣传中心阿Ming）', '<a href=\'http://ss15.sinaimg.cn/orignal/6232cd9ag8ea7f26a675e&690\' target=\'_blank\'><img src=\'http://ss15.sinaimg.cn/thumbnail/6232cd9ag8ea7f26a675e&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-25 23:58:32', '2010-08-25 23:58:32', '0', '2035182152', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('559', null, '【巨人网络微博第二季代言人票选！】我们从员工中选出4位候选人，请支持您喜欢的MM。转发+评论数最多的MM将是巨人新一季微博代言人，届时将在微博与大家分享她生活的精彩点滴！我们还将在参与互动的博主中随机抽取10位，送上微博限量版鼠标！截止时间，8月30日24时。第一位：妩媚精灵，玉玉。@统计评论', '<a href=\'http://ss6.sinaimg.cn/orignal/6232cd9ag8eb3a986bc15&690\' target=\'_blank\'><img src=\'http://ss6.sinaimg.cn/thumbnail/6232cd9ag8eb3a986bc15&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-26 13:56:53', '2010-08-26 13:56:53', '0', '2047343323', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('560', null, '【巨人网络微博第二季代言人票选！】我们从员工中选出4位候选人，请支持您喜欢的MM。转发+评论数最多的MM将是巨人新一季微博代言人，届时将在微博与大家分享她生活的点滴！我们还将在参与互动的博主中随机抽取10位，送上微博限量版鼠标！截止时间，8月30日24时。第二位：搞怪精灵，糯米丸子。@统计评论', '<a href=\'http://ss5.sinaimg.cn/orignal/6232cd9ag8eb3b0068a04&690\' target=\'_blank\'><img src=\'http://ss5.sinaimg.cn/thumbnail/6232cd9ag8eb3b0068a04&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-26 13:58:56', '2010-08-26 13:58:56', '0', '2047397408', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('561', null, '【巨人网络微博第二季代言人票选！】我们从员工中选出4位候选人，请支持您喜欢的MM。转发+评论数最多的MM将是巨人新一季微博代言人，届时将在微博与大家分享她生活的精彩点滴！我们还将在参与互动的博主中随机抽取10位，送上微博限量版鼠标！截止时间，8月30日24时。第三位：浪漫精灵，小鹿。@统计评论', '<a href=\'http://ss8.sinaimg.cn/orignal/6232cd9ag8eb3b5897dd7&690\' target=\'_blank\'><img src=\'http://ss8.sinaimg.cn/thumbnail/6232cd9ag8eb3b5897dd7&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-26 14:00:12', '2010-08-26 14:00:12', '0', '2047431418', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('562', null, '【巨人网络微博第二季代言人票选！】我们从员工中选出4位候选人，请支持您喜欢的MM。转发+评论数最多的MM将是巨人新一季微博代言人，届时将在微博与大家分享她生活精彩点滴！我们还将在参与互动的博主中随机抽取10位，送上微博限量版鼠标！截止时间，8月30日24时。第四位：可爱精灵，猫小雪。@统计评论', '<a href=\'http://ss10.sinaimg.cn/orignal/6232cd9ag8eb3bb75ad29&690\' target=\'_blank\'><img src=\'http://ss10.sinaimg.cn/thumbnail/6232cd9ag8eb3bb75ad29&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-26 14:01:47', '2010-08-26 14:01:47', '0', '2047474478', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('563', null, '【巨人网络微博第二季代言人票选！】正在如火如荼地进行中，感谢大家对于巨人微博一如既往的支持！我们祝贺参与互动的@elainehl ，@点评点 2位幸运的博主获得了我们的奖品“微博限量版鼠标”！（请获奖者将奖品快递地址和联系方式“发私信”给我们）奖品还将继续送出，请密切关注微博代言人评选动向！', '', '9', '@巨人网络', null, null, '2010-08-27 16:50:03', '2010-08-27 16:50:03', '0', '2079916326', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('564', null, '【巨人网络微博第二季代言人票选！】已进入最后一天，我们从所有热情参与互动的博友中继续随机抽出三位幸运者 @rexchu  @dongxue1987 @m欧米嘎e ，恭喜各位获得“微博限量版鼠标”一个！”！（请获奖者将奖品快递地址和联系方式“发私信”给我们）如果你也想得到我们的奖品，就请持续关注我们的评选。', '', '9', '@巨人网络', null, null, '2010-08-30 09:34:43', '2010-08-30 09:34:43', '0', '2150807410', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('565', null, '【巨人网络微博第二季代言人票选！】第2期巨人微博代言人诞生啦！撒花~~~！她就是----集万千宠爱于一身的“可爱精灵&quot;猫小雪！同时祝贺@古月贝如 @aaronpi @仙人掌吉 @诺亚方舟船票专卖 @龙潭一跃 这些参与互动的幸运博主获得我们的微博限量版鼠标！请将奖品快递地址及联系方式私信我们。', '@巨人网络：【巨人网络微博第二季代言人票选！】我们从员工中选出4位候选人，请支持您喜欢的MM。转发+评论数最多的MM将是巨人新一季微博代言人，届时将在微博与大家分享她生活精彩点滴！我们还将在参与互动的博主中随机抽取10位，送上微博限量版鼠标！截止时间，8月30日24时。第四位：可爱精灵，猫小雪。@统计评论<a href=\'http://ss10.sinaimg.cn/orignal/6232cd9ag8eb3bb75ad29&690\' target=\'_blank\'><img src=\'http://ss10.sinaimg.cn/thumbnail/6232cd9ag8eb3bb75ad29&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-31 10:31:50', '2010-08-31 10:31:50', '0', '2180083495', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('566', null, '《热血征途》将于9月3日正式上线，它是《征途怀旧版》全新资料片！不久前，《征途怀旧版》刚刚度过它的2周岁生日。新资料片《热血征途》中，众多全新玩法将与大家见面，其中由“问鼎天下”、“至尊总舵”、“团队争霸”组成的“三大战役”，将给大家带来前所未有的万人激战畅爽感受！', '<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag8f1b4281ff31&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag8f1b4281ff31&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-08-31 17:32:51', '2010-08-31 17:32:51', '0', '2191114148', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('567', null, '此活动已截止，感谢大家的支持，为最后两位幸运博友送上微博光电鼠标一个，他们是@小影天成 @何处话浮图 （请将快递地址“发私信”给我们。）遗憾此次转贴未达最终大奖送出要求，请继续关注巨人微博的新活动。', '@巨人网络：【支持《龙魂》内测，赢ipad！】《龙魂》8月12日开启内测。现在起成为巨人微博粉丝，转发或评论本帖，转帖或评论每突破1千条，将随机抽取一名参与者送微博光电鼠标；突破1万条后，将由@新浪游戏 在8月31日活动截止当天，从参与转帖或评论博友中，抽出《龙魂》iPad(16G WIFI)大奖。届时公布获奖结果！<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag8d9d312e2e51&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag8d9d312e2e51&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-01 10:37:15', '2010-09-01 10:37:15', '0', '2208265502', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('568', null, '巨人版“非诚勿扰”上演！八月，牵手季节。为给单身人儿带来幸福，公司邀请近百位窈窕佳人，与众经济适用男联谊。现场有吃有喝，美女如云，速配成功者还有机会获得精心准备的奖品。这是一部属于巨人的恋爱白皮书，相遇、回眸、牵手，有时爱情就那么简单。联谊将不定时、不定期、不定式举办，非诚勿扰。', '<a href=\'http://ss7.sinaimg.cn/orignal/6232cd9ag74b7abc7ad36&690\' target=\'_blank\'><img src=\'http://ss7.sinaimg.cn/thumbnail/6232cd9ag74b7abc7ad36&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-01 14:22:39', '2010-09-01 14:22:39', '0', '2213899930', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('569', null, '巨人版“非诚勿扰”之一分钟交流环节：通过一分钟的交谈迅速了解对方概况，这也许是时下最潮的沟通方式。一见钟情永远是爱情最美好的萌芽。看男女嘉宾们认真交谈的样子，可见大家都是为了幸福而来绝非玩票哦！为自己心仪的对象写下一张张小卡片，送出一份份贴心的礼物，绵绵的情意在整个会场上空环绕。', '<a href=\'http://ss8.sinaimg.cn/orignal/6232cd9ag8f2cbd86eaf7&690\' target=\'_blank\'><img src=\'http://ss8.sinaimg.cn/thumbnail/6232cd9ag8f2cbd86eaf7&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-01 14:24:11', '2010-09-01 14:24:11', '0', '2213936413', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('570', null, '《征途2》公开征集“征途兔”卡通形象。', '@征途2：《征途2》公开征集“征途兔”卡通形象，对游戏有着浓厚兴趣的绘画爱好者均可参与活动角逐大奖。参赛方案被《征途2》录用的设计者将有机会与《征途2》签约，并负责后续一系列衍生形象的设计，具体活动规则请见《征途2》官网。 http://sinaurl.cn/bDzJe 赶快参与吧，用你的独特创意为《征途2》再添精彩！<a href=\'http://ss1.sinaimg.cn/orignal/64a0c959g8f2ec7286840&690\' target=\'_blank\'><img src=\'http://ss1.sinaimg.cn/thumbnail/64a0c959g8f2ec7286840&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-01 16:53:20', '2010-09-01 16:53:20', '0', '2217606310', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('571', null, '好消息！《征途2》研发测试结束时间延期至9月20日。', '@征途2：好消息：《征途2》自8月16日技术删档测试开启至今，游戏内容在广大玩家的热情帮助下逐渐完善。为感谢广大玩家的厚爱，让更多玩家见证《征途2》的成长，《征途2》研发测试结束时间从9月6日延期至9月20日，并将于近日在官网，论坛，微博中陆续增发约2000个激活码，请大家继续关注《征途2》！<a href=\'http://ss11.sinaimg.cn/orignal/64a0c959g8f2ecf36957a&690\' target=\'_blank\'><img src=\'http://ss11.sinaimg.cn/thumbnail/64a0c959g8f2ecf36957a&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-01 16:55:14', '2010-09-01 16:55:14', '0', '2217661253', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('572', null, '转发微博。', '@征途2：【熬夜达人第一弹 抢征途2激活码】现在起，只要成为《征途2》微博粉丝，转发本贴，并且在转发评论中带上对《征途2》的祝福或建议，第99，199，299位(逢100进)...转发的博主，将获得《征途2》激活码1个，私信发送！本条活动于9月2日9:00截止（重复转以第一次中标为准）@统计评论<a href=\'http://ss14.sinaimg.cn/orignal/64a0c959g8f3240d5f4bd&690\' target=\'_blank\'><img src=\'http://ss14.sinaimg.cn/thumbnail/64a0c959g8f3240d5f4bd&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-01 21:15:05', '2010-09-01 21:15:05', '0', '2224505209', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('573', null, '巨人微博MM猫小雪：哈喽！小雪在这里跟博友们打招呼啦！在这里首先要感谢一下在第二季代言人评选里投小雪一票的朋友！是你们的支持让小雪可以有机会在这里跟大家见面，分享生活中、工作中的趣事。作为巨人大家庭的一员，今后小雪会负起“代言”巨人官方微博的“重任”的！嗯嗯，为自己加油！', '<a href=\'http://ss10.sinaimg.cn/orignal/6232cd9ag8f4095acd719&690\' target=\'_blank\'><img src=\'http://ss10.sinaimg.cn/thumbnail/6232cd9ag8f4095acd719&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-02 14:04:27', '2010-09-02 14:04:27', '0', '2241322327', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('574', null, '巨人微博MM猫小雪：漫步江南水乡古镇，暂别城市的喧嚣，远离快节奏的工作，小桥、流水作伴，这是小雪最喜欢的悠然自得。', '<a href=\'http://ss3.sinaimg.cn/orignal/6232cd9ag74c1cbf61a52&690\' target=\'_blank\'><img src=\'http://ss3.sinaimg.cn/thumbnail/6232cd9ag74c1cbf61a52&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-06 15:10:02', '2010-09-06 15:10:02', '0', '2355984700', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('575', null, '转发微博。', '@艾尔之光：[花心] 这就是我们的团队以及团队里那些可亲可爱、个性迥异的宝贝们，他们乐观积极、勇于挑战、谦逊好学、为了保护艾尔大陆的命运，义无反顾，坚守着小黑屋和脚下的这片正义之土。而属于团队及宝贝们的故事仍在不间断地上演着。 请期待宝贝们的运营日志！真实记录《艾尔之光》运营那点事！[哈哈]<a href=\'http://ss14.sinaimg.cn/orignal/67cfcc78g8f8e9c2d167d&690\' target=\'_blank\'><img src=\'http://ss14.sinaimg.cn/thumbnail/67cfcc78g8f8e9c2d167d&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-08 12:04:23', '2010-09-08 12:04:23', '0', '2409247595', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('576', null, '《征途2》第三次研发测试延长至10月15日结束。', '@征途2：《征途2》已于8月16日开启第三次研发测试。为了让玩家能够充分体验高等级的游戏功能，从而进行全面的测试，本次删档测试将延长至10月15日结束。《征途2》各类活动火热进行中，海量点卡、限量周边、4999元现金大奖、更有与巨人网络签约机会等你来： 了解更多活动信息：http://sinaurl.cn/bDzJe<a href=\'http://ss9.sinaimg.cn/orignal/64a0c959g74c580243c78&690\' target=\'_blank\'><img src=\'http://ss9.sinaimg.cn/thumbnail/64a0c959g74c580243c78&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-08 12:05:27', '2010-09-08 12:05:27', '0', '2409273690', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('577', null, '转发微博。', '@征途2：【快乐周末 《征途2》激活码再起风云】现在起，只要成为《征途2》微博粉丝，转发本贴，并且在转发评论带上《征途2》的祝福，第100，200，300位(逢100进)...转发博主，将获得《征途2》激活码1个，私信发送！本条活动于9月13日9:00截止（重复转以第一次为准，中标者粉丝少于10个不记录奖励）@统计评论<a href=\'http://ss8.sinaimg.cn/orignal/64a0c959g8fe53cc9b8d7&690\' target=\'_blank\'><img src=\'http://ss8.sinaimg.cn/thumbnail/64a0c959g8fe53cc9b8d7&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-10 22:10:35', '2010-09-10 22:10:35', '0', '2501634581', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('578', null, '喜欢这个地方是因为它的名字“寻梦园”。这个梦开始的地方很美，花儿如繁星点点，天空也仿佛特别蓝。小雪喜欢一切美的事物，一到大自然中就乐不思蜀了。这组照片小雪很喜欢，有没有点“人面桃花相映红”的感觉呢？[嘻嘻]', '<a href=\'http://ss12.sinaimg.cn/orignal/6232cd9ag901e0944159b&690\' target=\'_blank\'><img src=\'http://ss12.sinaimg.cn/thumbnail/6232cd9ag901e0944159b&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-13 14:16:47', '2010-09-13 14:16:47', '0', '2585738500', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('579', null, '《艾尔之光》爱莎大献身！热血动漫大片即将上演！', '@艾尔之光：爱莎大现身！热血动漫大片即将上演！ http://sinaurl.cn/h9JZJH', '9', '@巨人网络', null, null, '2010-09-14 14:46:12', '2010-09-14 14:46:12', '0', '2616385740', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('580', null, '转发微博。', '@征途2：【迎中秋，抢充气沙发】中秋将至，《征途2》与你喜迎佳节！马上成为《征途2》官博粉丝，转发本帖，在转发评论中送出对《征途2》祝福。第500，1000位(逢500进)...转发博主将获《征途2》时尚充气沙发1只，快递上门！活动于1万条转帖或9月16日9时截止，以先到者为准。重复转以第一次中标为准。@统计评论<a href=\'http://ss16.sinaimg.cn/orignal/64a0c959g9045f0229f6f&690\' target=\'_blank\'><img src=\'http://ss16.sinaimg.cn/thumbnail/64a0c959g9045f0229f6f&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-15 14:14:05', '2010-09-15 14:14:05', '0', '2645286831', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('581', null, '巨人微博MM猫小雪：公司发中秋福利啦：2瓶大名鼎鼎的黄金酒+1盒breadtalk的月饼，很好的配搭！祝大家月圆人团圆，中秋快乐！', '<a href=\'http://ss5.sinaimg.cn/orignal/6232cd9ag90720d1adc44&690\' target=\'_blank\'><img src=\'http://ss5.sinaimg.cn/thumbnail/6232cd9ag90720d1adc44&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-17 18:33:42', '2010-09-17 18:33:42', '0', '2713714171', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('582', null, '转发微博。', '@征途2：【热迎中秋 《征途2》激活码大放送】现在起，只要成为《征途2》微博粉丝，转发本贴，并且在转发评论带上《征途2》的祝福，第99，199，299位(逢100进)...转发博主，将获得《征途2》激活码1个，私信发送！本条活动于9月20日9:00截止（重复转以第一次为准，中标者粉丝少于10个不记录奖励）@统计评论<a href=\'http://ss10.sinaimg.cn/orignal/64a0c959g9073f06a3539&690\' target=\'_blank\'><img src=\'http://ss10.sinaimg.cn/thumbnail/64a0c959g9073f06a3539&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-17 22:32:52', '2010-09-17 22:32:52', '0', '2721473015', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('583', null, '巨人微博MM猫小雪：这几天天凉了，大家要注意保暖小心着凉哦！中秋假期大家有没有出去走走逛逛呢？小雪翻出了一张很“保暖”的老照片，夕阳西下，微风吹过高楼伫立的江面，泛起层层波澜，很和谐的一幕。都说城市让生活更美好，那一刻很有同感。', '<a href=\'http://ss2.sinaimg.cn/orignal/6232cd9ag74e596505a21&690\' target=\'_blank\'><img src=\'http://ss2.sinaimg.cn/thumbnail/6232cd9ag74e596505a21&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-24 10:10:04', '2010-09-24 10:10:04', '0', '2808539645', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('584', null, '2010巨人网络版《快乐男声》“海选工作”，在掌声和欢呼声中落下帷幕！台上，满腔热情的麦霸GG们各施绝招：1，自带粉丝团现场助阵；2，稳稳踱步的”世外高人”；3，遇到停电也处乱不惊的“颤音哥”；4，张信哲和林志炫的“组合体”...我们这些激情四射的巨人们，与电视上的“快男”比也毫不逊色吧！', '<a href=\'http://ss15.sinaimg.cn/orignal/6232cd9ag90fb12cf955e&690\' target=\'_blank\'><img src=\'http://ss15.sinaimg.cn/thumbnail/6232cd9ag90fb12cf955e&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-24 14:00:02', '2010-09-24 14:00:02', '0', '2810975009', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('585', null, '转发微博。', '@征途2：【征途2新粉丝专场，抢激活码】成为征途2微博粉丝，当您幸运成为指定粉丝数（3610、3620..逢10进）时截取截图，并到论坛活动专题贴http://sinaurl.cn/h9KGRv跟帖并上传截图。通过审核后，您将得到征途2激活码一枚。本活动粉丝数达到5000时截止。（具体截图规则请看下图）<a href=\'http://ss16.sinaimg.cn/orignal/64a0c959g74e639daff1f&690\' target=\'_blank\'><img src=\'http://ss16.sinaimg.cn/thumbnail/64a0c959g74e639daff1f&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-24 17:51:53', '2010-09-24 17:51:53', '0', '2813335907', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('586', null, '巨人网络羽毛球公开赛圆满结束了！整场比赛凸显了“我运动，我健康，我快乐”的主题。比起往届，此次的参赛选手水平都不容小觑，一番激烈“厮杀”之后才决出最后名次。今后，巨人也将开展更多类似竞赛，让员工们在提高身体素质的同时愉悦身心,增进友谊。', '<a href=\'http://ss7.sinaimg.cn/orignal/6232cd9ag913805e38ca6&690\' target=\'_blank\'><img src=\'http://ss7.sinaimg.cn/thumbnail/6232cd9ag913805e38ca6&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-09-27 14:41:53', '2010-09-27 14:41:53', '0', '2847886989', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('587', null, '巨人微博MM猫小雪：国庆长假结束了，大家一定都玩得很尽兴吧？在经过假期的调整以后，我们要再一次投入紧张忙碌的工作中了！在此小雪祝各位一直以来支持巨人网络的博友们一切顺利！附近照一张，偶尔带黑框眼镜装一下深沉，哈哈。', '<a href=\'http://ss12.sinaimg.cn/orignal/6232cd9ag92112ff93f2b&690\' target=\'_blank\'><img src=\'http://ss12.sinaimg.cn/thumbnail/6232cd9ag92112ff93f2b&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-08 09:47:17', '2010-10-08 09:47:17', '0', '2988689821', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('588', null, '转发微博。', '@龙魂官博：【喜迎新区《龙魂》微博送豪礼】现在起，成为《龙魂》官博粉丝，转发本帖，并在转发评论带上祝福。第100，200位(逢100进)...转发博主，将获得10元巨人一卡通一张（私信发放）游戏内更将获得龙魂宝石99个（发至游戏邮箱）（重复获奖以第一次为准，中标者粉丝少于10个不记奖励）转贴满5000止@统计评论<a href=\'http://ss14.sinaimg.cn/orignal/6a834f57g927b3a513dfd&690\' target=\'_blank\'><img src=\'http://ss14.sinaimg.cn/thumbnail/6a834f57g927b3a513dfd&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-13 16:27:51', '2010-10-13 16:27:51', '0', '3068024923', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('589', null, '被誉为游戏“奥斯卡”的2010年度“金翎奖”今日揭晓，巨人网络自主研发的2D网游巨作《征途2》获“玩家最期待的十大网络游戏”。此次参选游戏中，巨人一共三款大作获奖。除了《征途2》，还有《绿色征途》获“玩家最喜爱的十大网络游戏”，《征途》则获“最佳原创网络游戏”。', '', '9', '@巨人网络', null, null, '2010-10-13 20:27:16', '2010-10-13 20:27:16', '0', '3071327623', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('590', null, '巨人校园行--2011全国巡回招聘开始啦！这一站，巨人来到武汉华中科技大学，这里的同学们都格外珍惜这个机会：宣讲会上人潮涌动，同学们认真听讲踊跃提问，在了解巨人的同时也向巨人展示了自己的专长和才华。我们这个充满活力的团队需要更多新鲜血液的加入，愿巨人家园成为莘莘学子们梦想孵化的摇篮！', '<a href=\'http://ss13.sinaimg.cn/orignal/6232cd9ag92df77b8a4dc&690\' target=\'_blank\'><img src=\'http://ss13.sinaimg.cn/thumbnail/6232cd9ag92df77b8a4dc&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-18 15:53:13', '2010-10-18 15:53:13', '0', '3145224043', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('591', null, '转发微博。', '@龙魂官博：【开心玩《龙魂》快乐拿大奖】《龙魂》豪礼继续送！现在起，成为《龙魂》官博粉丝，转发本帖，并在转发评论中带上你的祝福。第200，400位(逢200进)...转发博主，将获得[30元]巨人一卡通一张（私信发放）（重复获奖以第一次为准，中标者粉丝少于10个不记奖励）转贴满5000止@统计评论<a href=\'http://ss10.sinaimg.cn/orignal/6a834f57g751a33497949&690\' target=\'_blank\'><img src=\'http://ss10.sinaimg.cn/thumbnail/6a834f57g751a33497949&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-20 13:53:06', '2010-10-20 13:53:06', '0', '3176414255', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('592', null, '2010年网博会今天顺利开幕啦！本届展会巨人网络携旗下多款游戏重磅出击！showgirl依然是展会上一道亮丽的风景线。这是巨人的showgirlMM们，先来个全体亮相，怎么样，是不是颇有几分群芳争艳的感觉呢？', '<a href=\'http://ss8.sinaimg.cn/orignal/6232cd9at931fef5511c7&690\' target=\'_blank\'><img src=\'http://ss8.sinaimg.cn/thumbnail/6232cd9at931fef5511c7&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-21 20:47:59', '2010-10-21 20:47:59', '0', '3199870375', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('593', null, '本次网博会巨人showgirl MM们的表现赢得了满堂喝彩，为了与广大玩家近距离接触，MM们不时向台下派发小礼品，得到了台下玩家朋友们的热烈响应，你们的支持是巨人继续前进的最大动力。', '<a href=\'http://ss15.sinaimg.cn/orignal/6232cd9at9320118bc8ce&690\' target=\'_blank\'><img src=\'http://ss15.sinaimg.cn/thumbnail/6232cd9at9320118bc8ce&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-21 20:57:36', '2010-10-21 20:57:36', '0', '3200040535', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('594', null, '巨人MM们的气场还是很强的~[嘻嘻]', '@征途2：《征途2》参展网博会，这些亮丽的SG们是我们《征途2》的海报女郎。美女丛林中，大家看到远处《征途2》若隐若现的LOGO没？<a href=\'http://ss16.sinaimg.cn/orignal/64a0c959t931ff2931bcf&690\' target=\'_blank\'><img src=\'http://ss16.sinaimg.cn/thumbnail/64a0c959t931ff2931bcf&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-21 21:08:18', '2010-10-21 21:08:18', '0', '3200232355', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('595', null, '转发微博。', '@龙魂官博：【开心《龙魂》，幸福周末】现在起关注《龙魂》微博，转发此帖并@3个以上好友，第200，400位(逢200进)...转发博主，将获得10元巨人一卡通一张（私信发放）游戏内更将获得守魂石1个（价值66元，发至游戏邮箱）（重复获奖以第一次为准，中标者粉丝少于10个不记奖励）转贴满10000止@统计评论<a href=\'http://ss9.sinaimg.cn/orignal/6a834f57g932d5004fe38&690\' target=\'_blank\'><img src=\'http://ss9.sinaimg.cn/thumbnail/6a834f57g932d5004fe38&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-22 13:19:40', '2010-10-22 13:19:40', '0', '3210009447', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('596', null, '很喜欢这动人的一瞬间', '@征途2：兄弟游戏《艾尔之光》在网博会中请到的双胞胎姐妹花。这对双胞姐们受邀参加挑战《艾尔之光》的活动，在游戏中击败姐妹花的玩家能获得现金大奖。是不是比“蒙哥马利”还萌呢。<a href=\'http://ss13.sinaimg.cn/orignal/64a0c959t93303badbd4c&690\' target=\'_blank\'><img src=\'http://ss13.sinaimg.cn/thumbnail/64a0c959t93303badbd4c&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-22 16:31:59', '2010-10-22 16:31:59', '0', '3212788833', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('597', null, '#网博会# 可爱的征途兔MM，与征途兔。', '<a href=\'http://ss8.sinaimg.cn/orignal/6232cd9at934191e69bf7&690\' target=\'_blank\'><img src=\'http://ss8.sinaimg.cn/thumbnail/6232cd9at934191e69bf7&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-23 12:55:42', '2010-10-23 12:55:42', '0', '3226576191', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('598', null, '2010中国网络文化盛典颁奖仪式在网博会期间举行，巨人网络获“中国网络游戏产业推动奖”，一同获奖的还有美国EA等公司。', '', '9', '@巨人网络', null, null, '2010-10-23 13:01:45', '2010-10-23 13:01:45', '0', '3226671929', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('599', null, '为期4天的2010网博会，即将圆满落幕。而《征途2》的精彩，才刚刚拉开序幕。请大家拭目以待！', '@田丰ZT2：再来一张<a href=\'http://ss16.sinaimg.cn/orignal/659d85c54931aaba6c78f&690\' target=\'_blank\'><img src=\'http://ss16.sinaimg.cn/thumbnail/659d85c54931aaba6c78f&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-24 15:05:33', '2010-10-24 15:05:33', '0', '3245984543', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('600', null, '《征途2》不删档压力测试今日17：00正式开启!', '@征途2：《征途2》不删档压力测试今日17：00正式开启，再次提醒已激活账号的玩家朋友们，请提前打开《征途2》客户端进行自动更新哦，以确保自己的客户端开服后能够直接进去游戏O(∩_∩)O~~~今日攻略：《征途2》新手指南专区http://sinaurl.cn/h9gb5t', '9', '@巨人网络', null, null, '2010-10-25 17:06:35', '2010-10-25 17:06:35', '0', '3264335151', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('601', null, '巨人微博MM猫小雪：#征途2测试火爆#，与大家在游戏中相见。', '', '9', '@巨人网络', null, null, '2010-10-27 15:42:56', '2010-10-27 15:42:56', '0', '3296720873', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('602', null, '”今天请人吃饭，席间聊到游戏。结帐开发票后，服务员死活要我给几个《征途2》的激活码。“--刚刚发生在一个巨人同事身上的真实故事。', '', '9', '@巨人网络', null, null, '2010-10-27 21:55:52', '2010-10-27 21:55:52', '0', '3302528423', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('603', null, '巨人微博MM猫小雪：《征途2》压力测试正在火热进行中！小雪今天也地加入了庞大的玩家队伍，这是在游戏里的留影，你找到小雪了吗？嘿嘿，似乎有点难度哈。不过事实证明，《征途2》同样很适合MM玩家，小雪觉得一点都不难上手。下次上线的时候，别忘了找小雪一起组队打怪哦！', '<a href=\'http://ss9.sinaimg.cn/orignal/6232cd9ag93b9eb750d38&690\' target=\'_blank\'><img src=\'http://ss9.sinaimg.cn/thumbnail/6232cd9ag93b9eb750d38&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-10-29 12:31:48', '2010-10-29 12:31:48', '0', '3327292967', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('604', null, '封测在即《艾尔之光》官网华丽改版!', '@艾尔之光：封测在即《艾尔之光》官网华丽改版 史上最华丽的漫画格斗网游《艾尔之光》即将华丽开启国内首次封测。为迎接本次封测，《艾尔之光》官方网站华丽改版，清新上线！  此次改版官网依然以清新的蓝色为主色调，页面上增加了醒目的封测倒计时栏。同时，官网将开放“申请激活码”.....详见els.ztgame.com<a href=\'http://ss8.sinaimg.cn/orignal/67cfcc78g940b9c6ce0d7&690\' target=\'_blank\'><img src=\'http://ss8.sinaimg.cn/thumbnail/67cfcc78g940b9c6ce0d7&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-03 09:44:18', '2010-11-03 09:44:18', '0', '3410184289', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('605', null, '今天下午，被誉为游戏界奥斯卡的“金翎奖”颁奖典礼在北京举行，《征途2》获得“玩家最期待十大网络游戏”！一切还要归功于广大玩家对《征途2》的喜爱，你们支持让《征途2》能在今天的舞台上绽放耀眼的光芒！', '@ChinaJoy官方微博：#金翎奖#玩家最期待十大 网络游戏领奖嘉宾<a href=\'http://ss13.sinaimg.cn/orignal/6b2d7e35x75369a3880cc&690\' target=\'_blank\'><img src=\'http://ss13.sinaimg.cn/thumbnail/6b2d7e35x75369a3880cc&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-03 20:41:29', '2010-11-03 20:41:29', '0', '3421649509', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('606', null, '转发微博。', '@征途2：据金翎奖前方来电，《征途2》一位工作人员在颁奖典礼抽奖环节中，被抽中最重磅奖项--xbox360一台，看来好运特别眷顾《征途2》。', '9', '@巨人网络', null, null, '2010-11-03 21:05:45', '2010-11-03 21:05:45', '0', '3422234535', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('607', null, '《征途2》获 金翎奖“玩家最期待十大网络游戏”，巨人网络副总裁汤敏上台领奖。', '<a href=\'http://ss9.sinaimg.cn/orignal/6232cd9ag9426419acc78&690\' target=\'_blank\'><img src=\'http://ss9.sinaimg.cn/thumbnail/6232cd9ag9426419acc78&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-03 21:45:43', '2010-11-03 21:45:43', '0', '3423240815', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('608', null, '//@征途2:意外发现一个超搞怪的视频!', '@勤快可比可比：比网瘾战争更牛，不看后悔，超搞笑的视频！！ http://sinaurl.cn/h9B2YB', '9', '@巨人网络', null, null, '2010-11-05 12:09:20', '2010-11-05 12:09:20', '0', '3453798613', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('609', null, '额滴绳呐。飘过。', '@非专业程序员：史玉柱和冯小刚我啷个老是搞混喃，玩游戏玩史老师的，看电影看冯小刚的。感觉他们性格很像....', '9', '@巨人网络', null, null, '2010-11-09 00:46:03', '2010-11-09 00:46:03', '0', '3525817667', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('610', null, '抢《艾尔之光》限量封测激活码！！！', '@艾尔之光：[火炬] 【活动】【第一季 艾尔之光萌系漫画看不完】。。即日起至11.12日，成为《艾尔之光》的粉丝，并根据每日活动主题转帖回复，就有机会获得华丽萌系格斗网游《艾尔之光》的限量封测激活码哦，先到先得，精彩不限！官方会根据每日统计名单抽取10位幸运粉丝私信发送（每人最多获奖一次）@统计评论<a href=\'http://ss14.sinaimg.cn/orignal/67cfcc78g948228a1bbad&690\' target=\'_blank\'><img src=\'http://ss14.sinaimg.cn/thumbnail/67cfcc78g948228a1bbad&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-09 10:59:48', '2010-11-09 10:59:48', '0', '3530004607', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('611', null, '巨人内部讲坛近日举办了一期“高峰论坛”，总裁刘伟，携研发、运营“四大护法”(纪学锋、丁国强、彭程、张志宏)等到场，这是巨人讲坛有史以来规格最高的一次。领导们与大家交流了游戏策划、产品运营、公司战略等多方面话题。', '<a href=\'http://ww1.sinaimg.cn/large/6232cd9agw6db80al05lyj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6232cd9agw6db80al05lyj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-09 21:35:06', '2010-11-09 21:35:06', '0', '3541356573', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('612', null, '小刀(丁国强)传授成为“金牌策划”诀窍：每玩一个游戏的时候都要去思考，尤其是玩得开心的时候；生活中也有很多细节可以提高策划能力，要多观察留意，多跟游戏联系一下；频繁跳槽不利于能力的培养；要在游戏运营后跟玩家的交流中提高自己，策划过程中一定要跟着团队的目标原则走。--巨人“高峰论坛”。', '', '9', '@巨人网络', null, null, '2010-11-09 21:35:54', '2010-11-09 21:35:54', '0', '3541373765', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('613', null, '巨人网络今日发布2010年Q3财报，本季度净营收3.387亿人民币（约合5060万美元），环比增长5.3%，同比增长16.7%。净利润2.087亿人民币（约合3120万美元），环比增长12.2%，同比增长5.5%。目前已实现连续三个季度增长。', '', '9', '@巨人网络', null, null, '2010-11-17 10:14:05', '2010-11-17 10:14:05', '0', '3694812653', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('614', null, '巨人网络CEO史玉柱今日表示，将积极开发并测试产品线中的新游戏，比如《征途2》和两款代理的游戏《艾尔之光》、《巫师之怒》。他透露，最近已将一些产品成功代理到中国台湾地区、韩国、日本、巴西和土耳其，预计不久还会包括泰国和欧美地区等。（注：附图为美丽的土耳其，来源微博。）', '<a href=\'http://ww1.sinaimg.cn/large/6232cd9agw6dbgrdklbvgj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6232cd9agw6dbgrdklbvgj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-17 11:17:29', '2010-11-17 11:17:29', '0', '3696100697', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('615', null, '转发微博。', '@史玉柱：巨人网络今晨公布三季度财报：单季净利3120万美元，环比增长12.2%，同比增长5.6%，现金储备8。6亿美元。营收环比增长5.3%。本年3个季度都保持了5%以上环比增长，现仍处上升通道，明夏开始能否保持势头，取决于19日不限号技术测试的征途2，建议持股者19号进去看看，作出自己判断。股市有风险，需谨慎哈', '9', '@巨人网络', null, null, '2010-11-17 11:44:18', '2010-11-17 11:44:18', '0', '3696646443', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('616', null, '给力啊 ^ ^', '@美女推荐：ikaca从今天开始，本微博推荐在新浪微博美女们 今天推荐的是 @语千 非常青春，如果去做游戏的showgirl绝对是没问题的。貌似她也是@巨人网络 微博的第一期的微博女孩。看来是美女员工啊！ http://sinaurl.cn/h4estk   点击链接 马上查看(来自ikaca.com)<a href=\'http://ss3.sinaimg.cn/orignal/6fa561ea4953a41a150c2&690\' target=\'_blank\'><img src=\'http://ss3.sinaimg.cn/thumbnail/6fa561ea4953a41a150c2&690\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-17 15:12:31', '2010-11-17 15:12:31', '0', '3700919015', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('617', null, '巨人六岁啦！六岁对一位小盆友来说，是刚步入学前班的年纪；而巨人一路走来，已打造了《征途2》等多款精品，并在纽交所上市。这些成绩，离不开外界的支持，更离不开所有新老“巨人”的努力。公司食堂今天免费，给力啊！', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9agw6dbhwmtk40ej.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9agw6dbhwmtk40ej.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-18 11:04:05', '2010-11-18 11:04:05', '0', '3717640025', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('618', null, '猜猜这是哪？没错，位于松江的巨人园区！这里是小雪在每天必经的园区芦苇丛边的留影。很喜欢这个新家，超现代的建筑风格和绿树蓝天的完美结合，在大自然中工作真的是一种享受！', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9agw6dbi3z6hhedj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9agw6dbi3z6hhedj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-18 15:18:16', '2010-11-18 15:18:16', '0', '3722807843', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('619', null, '巨人微博MM猫小雪：为了迎接巨人六周岁生日，这位工作人员大哥昨天凌晨2点还在扎气球墙，真的辛苦了！', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9agw6dbi6tli2l3j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9agw6dbi6tli2l3j.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-18 16:56:31', '2010-11-18 16:56:31', '0', '3724622829', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('620', null, '巨人微博MM猫小雪：今天的食堂可以说是花团锦簇，是不是颇有几分节日的情调呢，哈哈，一顿免费生日大餐正等着大家哦！', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9agw6dbi7j7i22aj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9agw6dbi7j7i22aj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-18 17:21:02', '2010-11-18 17:21:02', '0', '3725090777', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('621', null, '六周岁刚过，今天巨人又迎来另一盛事！', '@征途2：征途2不限号测试邀您拍砖------今日17时，《征途2》开启不限号技术测试，两大新区逐鹿中原（电信）、金戈铁马（网通）火爆开启。到底好不好，玩家说了算！我们诚挚邀请您来《征途2》，来挑刺、来找毛病、来拍砖！抢鲜观看真人宣传片：http://sinaurl.cn/h4FxYc 抢新手卡：http://sinaurl.cn/h4nZXx', '9', '@巨人网络', null, null, '2010-11-19 13:07:28', '2010-11-19 13:07:28', '0', '3741838579', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('622', null, '《征途2》不限号测试进入倒计时，你准备好了吗？', '@征途2：离《征途2》不限号测试还有1个小时20分钟，不知道朋友们是否已经准备好了呢？账号、客户端、新手卡一个都不能少哦… 账号注册地址：https://vip.ztgame.com:8081/registe/register.jsp?source=zt2_site 最新客户端下载地址：http://sinaurl.cn/h4FpKv 抢新手卡：http://sinaurl.cn/h4nZXx', '9', '@巨人网络', null, null, '2010-11-19 16:53:16', '2010-11-19 16:53:16', '0', '3746285911', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('623', null, '邀您一同见证《征途2》的火爆！ //@征途2:您要先感谢国家^^', '@田丰ZT2：《征途2》破10万了，对于一个还在测试阶段的游戏来说，呵呵，算是个很不错的成绩了。感谢玩家啊。。。。', '9', '@巨人网络', null, null, '2010-11-22 09:36:43', '2010-11-22 09:36:43', '0', '3801764983', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('624', null, '转发微博。', '@史玉柱：我下定决心排除万难，抛弃网络语言：感恩节里更感恩。感恩是人的美德，和谐的根源。我感恩党，实施改革开放，不然我仍上山下乡；我感恩人民，缔造祖国强大，身处欧洲被当贵宾；我感恩同事，敬业拼搏造就公司成就；我感恩父母，给我来这星球旅游3万天的机会。我感恩未来GF，给我挑战她BF的机会。3Q！', '9', '@巨人网络', null, null, '2010-11-25 12:55:38', '2010-11-25 12:55:38', '0', '3870400307', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('625', null, '一年一度的感恩节来临，在这个温情的季节里，感谢就要大声说出口！在此，巨人网络衷心感谢广大玩家朋友们，巨人一路走来能有今天的成绩，离不开你们始终不变的支持和鼓励，祝愿所有玩家朋友以及你们的亲朋好友永远健康快乐！', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9agw6dbq7x1xozwj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9agw6dbq7x1xozwj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-11-25 15:39:00', '2010-11-25 15:39:00', '0', '3873663099', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('626', null, '我的粉丝真给力，再过几天就到100万啦。到了100万时该我请曹国伟吃饭呢，还是他请我呢？其实该我请粉丝吃饭，但一下找不到一百万个碗。[伤心]', '', '8', '@史玉柱', null, null, '2010-11-28 12:24:47', '2010-11-28 12:24:47', '0', '3933457455', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('627', null, '转发微博。', '@芭莎男士：感谢《芭莎男士》所有的读者、客户，所有支持我们与关注我们的人！尤其感谢对我们提出批评的人，谢谢你们的真诚！作为中国第一本高端男性商业品味杂志，我们会不断努力，一直向前！！！<a href=\'http://ww2.sinaimg.cn/large/6332d38fjw6dbq3u45e9qj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6332d38fjw6dbq3u45e9qj.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2010-11-28 18:27:46', '2010-11-28 18:27:46', '0', '3940194489', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('628', null, '粉丝人数将达100万。粉丝中有爱我的、恨我的、发言的、打酱油的、俊男、美女、竞争对手雇的枪手、僵尸。哈哈，来者就是客，我决定付每位粉丝一元（别骂我抠门哈），再把这100万元集中起来以粉丝们的名义做一件慈善，全过程向粉丝们透明公开。我助手已在论证寻找最有价值的善事，大家也一起出出主意哈。', '', '8', '@史玉柱', null, null, '2010-11-29 23:23:13', '2010-11-29 23:23:13', '0', '3968127319', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('629', null, '转发微博。', '@史玉柱：粉丝人数将达100万。粉丝中有爱我的、恨我的、发言的、打酱油的、俊男、美女、竞争对手雇的枪手、僵尸。哈哈，来者就是客，我决定付每位粉丝一元（别骂我抠门哈），再把这100万元集中起来以粉丝们的名义做一件慈善，全过程向粉丝们透明公开。我助手已在论证寻找最有价值的善事，大家也一起出出主意哈。', '9', '@巨人网络', null, null, '2010-11-30 10:34:38', '2010-11-30 10:34:38', '0', '3973947309', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('630', null, '[哈哈]', '@史玉柱：粉丝人数将达100万。粉丝中有爱我的、恨我的、发言的、打酱油的、俊男、美女、竞争对手雇的枪手、僵尸。哈哈，来者就是客，我决定付每位粉丝一元（别骂我抠门哈），再把这100万元集中起来以粉丝们的名义做一件慈善，全过程向粉丝们透明公开。我助手已在论证寻找最有价值的善事，大家也一起出出主意哈。', '17', '@巨人刘伟', null, null, '2010-11-30 16:21:08', '2010-11-30 16:21:08', '0', '3980652531', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('631', null, '巨人技术序首批晋升名单诞生，祝贺他们！我们的“双向晋升发展通道”推出后，得到内外部的关注和支持，成效显著。我们也期待着更多的技术专才们通过技术序列晋升通道，小步快跑，星途闪耀。', '', '9', '@巨人网络', null, null, '2010-11-30 17:38:17', '2010-11-30 17:38:17', '0', '3982123455', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('632', null, '我路过，不买[哈哈]  //@期待电影:啊，原来如此。[有钱]  //@欧洲电影:爱马仕Birkin以她的名字命名', '@意大利电影：【爱马仕Birkin以她的名字命名】 Jane 出生在一个贵族家庭。父亲是英国有名望家族的后裔，担任皇家海军的指挥官。但60年代，是一个充满偶然性与可能性的年代。简追随母亲的脚步进入表演界。年轻时的Jane Birk...http://sinaurl.cn/h6iv2X<a href=\'http://ss14.sinaimg.cn/orignal/6d37db2e494d789cae59d&690\' target=\'_blank\'><img src=\'http://ss14.sinaimg.cn/thumbnail/6d37db2e494d789cae59d&690\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-11-30 22:26:40', '2010-11-30 22:26:40', '0', '3988265661', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('633', null, '今天中午已将我欠粉丝的1006706元，汇到了爱佑华夏慈善基金会。我将结合粉丝们想做的善事提要求，该基金会负责实施并通报。中国的慈善基金会大多要扣捐款的10%-15%做管理费，但该基金会一分不扣。另向曹国伟童鞋举报微博粉丝数显示的BUG：我公司财务人员说汇款时是1006706个粉丝，汇完立马少了4000多个', '', '8', '@史玉柱', null, null, '2010-11-30 22:38:29', '2010-11-30 22:38:29', '0', '3988593365', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('634', null, '转发微博。', '@史玉柱：今天中午已将我欠粉丝的1006706元，汇到了爱佑华夏慈善基金会。我将结合粉丝们想做的善事提要求，该基金会负责实施并通报。中国的慈善基金会大多要扣捐款的10%-15%做管理费，但该基金会一分不扣。另向曹国伟童鞋举报微博粉丝数显示的BUG：我公司财务人员说汇款时是1006706个粉丝，汇完立马少了4000多个', '9', '@巨人网络', null, null, '2010-12-01 13:13:48', '2010-12-01 13:13:48', '0', '3995930597', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('635', null, '这张请款单昨天中午2：00我签出去的，特此证明[哈哈]', '@史玉柱：今天中午已将我欠粉丝的1006706元，汇到了爱佑华夏慈善基金会。我将结合粉丝们想做的善事提要求，该基金会负责实施并通报。中国的慈善基金会大多要扣捐款的10%-15%做管理费，但该基金会一分不扣。另向曹国伟童鞋举报微博粉丝数显示的BUG：我公司财务人员说汇款时是1006706个粉丝，汇完立马少了4000多个', '17', '@巨人刘伟', null, null, '2010-12-01 16:44:30', '2010-12-01 16:44:30', '0', '3999477145', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('636', null, '大家关心是不是老史个人捐的，答案是“是滴”。那也需要走流程啊，有人签字，财务才能汇出去[哈哈]', '', '17', '@巨人刘伟', null, null, '2010-12-01 17:56:56', '2010-12-01 17:56:56', '0', '4001031325', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('637', null, '[哈哈]', '@阿良哥哥：http://sinaurl.cn/b8SwC 毛新宇谈民办教师 字幕牛逼透了', '17', '@巨人刘伟', null, null, '2010-12-01 18:37:52', '2010-12-01 18:37:52', '0', '4001879383', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('638', null, '乔布斯[哈哈]', '@期待电影：苹果4无忌惮！！我在北京苹果销售点登记排队买它，已有近一个月了仍无回音。老乔够猛！<a href=\'http://ww3.sinaimg.cn/large/5cfa224ejw6dbxbg4ldqxj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/5cfa224ejw6dbxbg4ldqxj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-01 19:08:24', '2010-12-01 19:08:24', '0', '4002507135', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('639', null, '我坦白此次捐款是公司不是个人，因我个人没多少现金。老板可能股权值钱，但现金不一定多。根据法律，股东只占有公司股权不能占有公司资产和现金，我们规范意识较强，非上市公司每年都经审计。我的工资和董事津贴的年税后收入不足百万，当然已足够我消费。此次捐款是在公司每年的慈善捐款预算内开支的。', '', '8', '@史玉柱', null, null, '2010-12-02 10:01:25', '2010-12-02 10:01:25', '0', '4014226707', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('640', null, '可是那更不是我出的钱，是陕西瑞德宝尔公司出的钱。 //@幸福工程:您凭借个人魅力也可以支持许多慈善事业的[鼓掌]  上次拍卖三小时时间的捐款就可以帮助到近500位贫困母亲，改变她们的命运。再次表示感谢！', '@史玉柱：我坦白此次捐款是公司不是个人，因我个人没多少现金。老板可能股权值钱，但现金不一定多。根据法律，股东只占有公司股权不能占有公司资产和现金，我们规范意识较强，非上市公司每年都经审计。我的工资和董事津贴的年税后收入不足百万，当然已足够我消费。此次捐款是在公司每年的慈善捐款预算内开支的。', '8', '@史玉柱', null, null, '2010-12-02 10:31:39', '2010-12-02 10:31:39', '0', '4014859103', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('641', null, '巨人网络成立了“声优CLUB”，这个团体给热爱配音又喜欢游戏动漫的同事提供发挥的舞台，巨人将挖掘公司内部具有特点的“好声音”，提供专业录音棚以及培训，建立一支具有准专业甚至专业水准的配音团队，经过磨练的配音达人还有可能成为游戏公司的御用声优。', '', '9', '@巨人网络', null, null, '2010-12-02 17:07:10', '2010-12-02 17:07:10', '0', '4023074179', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('642', null, '[偷笑]', '@当时我震惊了：海豚音、绵羊音都已经过时了，惊世骇俗的“烈马音”登场.太给力了。。。http://sinaurl.cn/hEEwz', '17', '@巨人刘伟', null, null, '2010-12-02 22:38:46', '2010-12-02 22:38:46', '0', '4040302379', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('643', null, '政府对企业的最大支持就是少去骚扰企业，而不是给企业多少贷款和土地优惠。政府是扶持不出好企业的，只要创造出好的投资环境，让企业自我优胜劣汰。除了正常检查，如果各个职能部门轮番骚扰企业，企业会很累很不稳定。朋友们都说广东政府这方面做得很好。', '', '8', '@史玉柱', null, null, '2010-12-03 00:38:02', '2010-12-03 00:38:02', '0', '4043088675', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('644', null, '如果有钱了，买两杯豆浆，喝一杯倒一杯；如果有钱了，买200辆QQ开在路上，一会儿摆成S，一会儿摆成B；如果有6个iPad呢，你怎么办捏？', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9agw6dbzid61fbfj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9agw6dbzid61fbfj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-12-03 16:32:06', '2010-12-03 16:32:06', '0', '4055160589', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('645', null, '可能是玩游戏养成的习惯哦，聊天喜欢发表情，在游戏里被欺负了就[泪]，人品爆发了就[酷] ，冒充小女生就[害羞] ，现在每天早上爬起来，先去《征途2》的庄园里收下菜，晚上回到家，回家族里和弟弟妹妹一起划龙舟，聊聊天，开心哦[花心]', '', '17', '@巨人刘伟', null, null, '2010-12-03 16:43:42', '2010-12-03 16:43:42', '0', '4055412795', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('646', null, '[做鬼脸]', '@郑晓蔚：金正日，不吹牛逼会死啊。<a href=\'http://ww2.sinaimg.cn/large/55ec33b3gw6dbzkr7fd2xj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/55ec33b3gw6dbzkr7fd2xj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-03 21:44:35', '2010-12-03 21:44:35', '0', '4062012519', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('647', null, '[馋嘴]', '@吉承：我要宅在家～“空格键”在那，不管不顾没有之后。。。<a href=\'http://ww2.sinaimg.cn/large/68f0696egw6dbzpmwxyprj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/68f0696egw6dbzpmwxyprj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-03 21:46:26', '2010-12-03 21:46:26', '0', '4062058865', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('648', null, '保健品业务我退出已8年，看征途2的态势，网游业务我也将退出管理。以后我重点搞金融和天使投资。金融团队很健全，但天使投资团队仍需要一年建设，要依附1-3所大学，天使投资主要方向是刚毕业大学生。网游业务现无负债8.6亿美金现金，我正在找无风险3年回报一倍的财务投资，让3年后现金》现市值。望推荐', '', '8', '@史玉柱', null, null, '2010-12-04 01:13:21', '2010-12-04 01:13:21', '0', '4067066033', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('649', null, '晕倒！巴菲特在二级市场买股票中国人人称赞。我支持大学生创业的天使投资就被跟贴称为毫无社会价值。被郭大侠灌多了，丧失狡辩能力，洗洗睡，886', '', '8', '@史玉柱', null, null, '2010-12-04 01:47:51', '2010-12-04 01:47:51', '0', '4067396763', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('650', null, '我向全国人民检举沈国军喝高了，居然忘了放照片。', '@沈国军：去年的夏天我前往青海高原，参加爱佑华夏慈善基金会的患儿探访活动，所到之处，所见之人，令人感慨万分，是一次心灵的净化和洗礼！让你更加懂得珍惜，更加懂得感恩，爱佑华夏慈善基金会也是最规范，最温馨，做得最好的非公募基金会。这是去定点医院看望救助第五千名天心病儿童照片。到现在被救助的更多', '8', '@史玉柱', null, null, '2010-12-04 10:19:28', '2010-12-04 10:19:28', '0', '4070540637', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('651', null, '我俩长得像吗？不勒个是吧', '@宁财神：上次在飞机上，对方指着我惊呼“史玉柱怎么也坐经济舱”，这次……http://sinaurl.cn/hbZjXj', '8', '@史玉柱', null, null, '2010-12-04 10:35:47', '2010-12-04 10:35:47', '0', '4070842689', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('652', null, '转发微博。', '@ITHK：IT Design: 复古iPad机械打字机!  近年来时装界一直吹着复古风，很多店舖都用旧式打字机作装饰，但已经没有人会用它来打字，因为一切都电子化了，可有了这个设计，把iPad同打字机结合，生活就可以品味跟实用并重啦!<a href=\'http://ww1.sinaimg.cn/large/67149d03jw6dbzjaaimanj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/67149d03jw6dbzjaaimanj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-04 20:09:52', '2010-12-04 20:09:52', '0', '4082424113', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('653', null, '今晚佘山高尔夫会所的巧遇，雷。。。。', '', '8', '@史玉柱', null, null, '2010-12-05 00:27:07', '2010-12-05 00:27:07', '0', '4089210647', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('654', null, '该谁给谁红包？我给财神，还是财神给我？有网友说财神和姚晨张的特像，真的？   //@姚晨:见面要红包了吗？ //@封新城:还真像。', '', '8', '@史玉柱', null, null, '2010-12-05 13:54:16', '2010-12-05 13:54:16', '0', '4097751115', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('655', null, '仰望天上无数的星星，它们大多距离我们几十亿光年，我们看到的是几十亿年前发出的光，而星星的寿命也大多就几十亿年。结论：我们看到的星星，此时此刻很多已经死亡啦。联想人的一生多么短暂多么渺小，名利、财富、恩怨、爱恨。。。。神马都是浮云。哈哈，快乐每一天就好。', '', '8', '@史玉柱', null, null, '2010-12-06 01:23:57', '2010-12-06 01:23:57', '0', '4112607025', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('656', null, 'http://sinaurl.cn/hbxchU', '', '17', '@巨人刘伟', null, null, '2010-12-06 13:56:59', '2010-12-06 13:56:59', '0', '4121013933', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('657', null, '昨晚参加东航的千万会员庆贺活动，我意外抽到特等奖：2张国际任意航线的商务仓机票。周立波和陈伟鸿调侃我，特等奖给了最不需要的人。历史上我从未抽到过奖，这次得奖还真不知是好事还是坏事。一不留神被刘绍勇灌了好多酒，忘了来微博打酱油。', '', '8', '@史玉柱', null, null, '2010-12-07 09:57:41', '2010-12-07 09:57:41', '0', '4139589675', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('658', null, '世界60多亿人口，若你平静地活着，你就比其余30亿人更幸运。若你识字，就比20亿不识字的人幸运。若你从未经历过战争、牢狱、饥荒，就比5亿人更幸运。若你有屋栖身，衣食无忧，你就比70%的人更富有。若你银行有存款、包里有现金、每周还有班上，则你已经位列世界上最富有的8%行列。-----转与大家共勉', '', '9', '@巨人网络', null, null, '2010-12-07 13:13:19', '2010-12-07 13:13:19', '0', '4143919111', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('659', null, '转发微博。', '@史玉柱：王中军给我说，他想拍一个古装电影，计划牛根生演大地主，马云演刺客，郭光昌演太极拳师，我演算命先生，十几个老板出演各类角色。再请一批二线女明星演丫鬟。这些老板下属员工百万，员工都会买票到电影院看老板的演技，这就保证本部电影已赚钱。我当场晕倒！', '9', '@巨人网络', null, null, '2010-12-07 15:53:44', '2010-12-07 15:53:44', '0', '4147149605', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('660', null, '办公室版《盗梦空间》', '@征途2：天气变冷了，大家多穿点衣服御寒哦，不过《征途2》的办公室里很火热，本兔子做梦在玩《征途2》被领导抓住，醒来一看，咦？杯具的本兔真的是在玩《征途2》而且被领导叫醒了……', '9', '@巨人网络', null, null, '2010-12-07 19:03:46', '2010-12-07 19:03:46', '0', '4151092551', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('661', null, '这么快就公布了啊。这事决策时我投了赞成票，过程我没参与，都是刘伟和中军在谈判和操作。网游和影视同属娱乐行业，应该能探索出结合模式，这可能是双方合作的最大意义。刘伟老公是个非常优秀的年轻电影导演。这次合作，刘伟的影视细胞会进一步增生，哈哈。', '@新浪科技：华谊兄弟宣布将与巨人网络成立合资公司“华谊巨人”，合作运营巨人网络的3D大型多人在线角色扮演游戏《万王之王3》。这意味着华谊兄弟正式进军游戏市场。华谊兄弟出资7000万元获得华谊巨人51%股权，成为合资公司主要股东。http://sinaurl.cn/hbiKGG<a href=\'http://ww2.sinaimg.cn/large/61e89b74jw6dc48qg5m7qj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/61e89b74jw6dc48qg5m7qj.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2010-12-07 22:47:47', '2010-12-07 22:47:47', '0', '4156977043', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('662', null, '转发微博。', '@新浪科技：华谊兄弟宣布将与巨人网络成立合资公司“华谊巨人”，合作运营巨人网络的3D大型多人在线角色扮演游戏《万王之王3》。这意味着华谊兄弟正式进军游戏市场。华谊兄弟出资7000万元获得华谊巨人51%股权，成为合资公司主要股东。http://sinaurl.cn/hbiKGG<a href=\'http://ww2.sinaimg.cn/large/61e89b74jw6dc48qg5m7qj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/61e89b74jw6dc48qg5m7qj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-12-08 00:42:22', '2010-12-08 00:42:22', '0', '4159635823', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('663', null, '不知道神马时候媒体给我起的外号“史大胆”和“赌徒”开始流行的。其实企业家朋友圈里还没发现一个比我更胆小的：没有把握的事不做，我掌管的投资和网游业务负债率为0，公司储存够发20年以上工资的现金储备。被骂多了我也在反向反思，是不是我太保守了，是不是负债率可以提到15%的上限。', '', '8', '@史玉柱', null, null, '2010-12-09 10:31:43', '2010-12-09 10:31:43', '0', '4188032165', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('664', null, '只要有变化就必须跟进，这是做好互联网产品的前提，不管是大变化或是小变化，也不管是变好或者变坏，能否及时发现和解决，是成败关键。----巨人讲坛精彩语录', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9agw6dc69ezcpkej.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9agw6dc69ezcpkej.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-12-09 12:39:44', '2010-12-09 12:39:44', '0', '4190871011', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('665', null, '男人的成熟在于眼神，样子还是这个样子，成熟，是因为你的眼神变成熟了。眼神为什么会成熟？因为你懂得观察了！----巨人讲坛精彩语录', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9agw6dc69hy1g84j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9agw6dc69hy1g84j.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2010-12-09 12:42:33', '2010-12-09 12:42:33', '0', '4190940311', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('666', null, '[哈哈]OMG，原来这就是我的卡通形象啊！我没这么贪吃吧', '<a href=\'http://ww1.sinaimg.cn/large/6e615fb6jw6dc6sfm5muuj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6e615fb6jw6dc6sfm5muuj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-09 23:37:40', '2010-12-09 23:37:40', '0', '4206209817', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('667', null, '这是刚拍的作品，自我感觉水平有一点点提高。仍是酒店窗边拍的。', '<a href=\'http://ww2.sinaimg.cn/large/638b4670jw6dc7epupo7gj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw6dc7epupo7gj.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2010-12-10 12:28:41', '2010-12-10 12:28:41', '0', '4214594153', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('668', null, '转发微博。', '@全球时尚：Youtube上传第一天就超过1,000,000人观看，竟然在真实世界里也能做出来 http://sinaurl.cn/hbaPMD', '17', '@巨人刘伟', null, null, '2010-12-10 23:06:29', '2010-12-10 23:06:29', '0', '4228883417', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('669', null, '转发微博。', '@TechWeb：谷歌副总裁梅姐(Marissa Mayer)：今后你将不再需要搜索。因为，Google正开发的下一个重要产品为“情境发现”(contextual discovery)，就是根据用户浏览习惯和所处地理位置主动推送最有价值的信息。这样用户就无需进行任何搜索活动http://sinaurl.cn/hboBbx<a href=\'http://ww1.sinaimg.cn/large/61e61e8cjw6dc7asclxksj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/61e61e8cjw6dc7asclxksj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-10 23:23:12', '2010-12-10 23:23:12', '0', '4229356795', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('670', null, '未来几天我的商务正装，比穿西服爽啊，过足喜欢白衣的瘾。', '<a href=\'http://ww1.sinaimg.cn/large/638b4670jw6dc7xnbfuxyj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670jw6dc7xnbfuxyj.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2010-12-10 23:23:37', '2010-12-10 23:23:37', '0', '4229368637', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('671', null, '老板去会拉登了[偷笑]', '@史玉柱：未来几天我的商务正装，比穿西服爽啊，过足喜欢白衣的瘾。<a href=\'http://ww1.sinaimg.cn/large/638b4670jw6dc7xnbfuxyj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670jw6dc7xnbfuxyj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-10 23:26:44', '2010-12-10 23:26:44', '0', '4229455747', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('672', null, '[迪拜12月12日电】今天下午，柳传志大酋长在马路边亲切会见了史玉柱小酋长，会谈在友好气氛中进行。双方就两部落接壤地区的鸟粪开采达成一致意见。史玉柱对柳传志无偿援助的蛤蟆镜表示衷心感谢。', '<a href=\'http://ww4.sinaimg.cn/large/638b4670jw6dc9bn0hmu0j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw6dc9bn0hmu0j.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2010-12-12 04:17:01', '2010-12-12 04:17:01', '0', '4255934303', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('673', null, '转发微博。', '@这个微博很给力：【26岁Facebook创始人租房住】今年，年仅26岁的Facebook的创始人马克·扎克伯格，以40 亿美元身价登上2010 福布斯全球最年轻富豪榜榜首。目前已把自己过半财产捐赠给慈善事业。扎克伯格拥有亿万身家，但他至今仍和华裔女友普莉希拉·陈生活在一套租来的住房里，每天走路或骑自行车上班。<a href=\'http://ww1.sinaimg.cn/large/6927e7a5jw6dc93evic5vj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6927e7a5jw6dc93evic5vj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-12 20:28:02', '2010-12-12 20:28:02', '0', '4270860949', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('674', null, '转发微博。', '@搞笑大百科：不想动，不想说话，就这么一动不动，就算中国移动我也不动...<a href=\'http://ww4.sinaimg.cn/large/642beb18gw6dc8g3xymcuj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/642beb18gw6dc8g3xymcuj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-12 21:11:02', '2010-12-12 21:11:02', '0', '4271913547', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('675', null, '转发微博。', '@新浪科技：[迪拜12月12日电】今天下午，柳传志大酋长在马路边亲切会见了史玉柱小酋长，会谈在友好气氛中进行。双方就两部落接壤地区的鸟粪开采达成一致意见。史玉柱对柳传志无偿援助的蛤蟆镜表示衷心感谢。[哈哈] 图片及文字版权来源，巨人网络CEO @史玉柱<a href=\'http://ww2.sinaimg.cn/large/61e89b74jw6dc9m2ig6pdj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/61e89b74jw6dc9m2ig6pdj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-12 21:19:13', '2010-12-12 21:19:13', '0', '4272124831', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('676', null, '转发微博。', '@蔡文胜：新浪科技讯:社交网络地图显示Facebook领先优势逐渐扩大。地图基于本月的Alexa和谷歌趋势数据。地图显示,Facebook在全球多个国家超过了一些地区性社交网络,在欧洲这一现象尤为明显。根据分析,Facebook目前已统计132个国家中的115个取得领先。其他上升势头明显社交网站包括LinkedIn和Twitter。<a href=\'http://ww4.sinaimg.cn/large/671b76e5jw6dc9rcark7mj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/671b76e5jw6dc9rcark7mj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-12 21:32:13', '2010-12-12 21:32:13', '0', '4272464783', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('677', null, '转发微博。', '@游戏邦：万众期待的CityVille终于在Facebook社交网站正式发布啦！cityVille中包含了诸如船舶，商品生产，农田等多种游戏功能，基本囊括了Zynga及其竞争公司近年来采用的各种游戏机制。并且cityville采用的是3D画面效果，比起其他的2D游戏显得更加震撼http://sinaurl.cn/hb5aKV<a href=\'http://ww2.sinaimg.cn/large/670dfcfejw6dbz9x2fa65j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/670dfcfejw6dbz9x2fa65j.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2010-12-12 21:33:20', '2010-12-12 21:33:20', '0', '4272493033', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('678', null, '回复@雷蒙黄:我不爱吃萝卜，兔子爱吃青菜~~ //@雷蒙黄:可惜你在上海要不就送一筐萝卜过去了 //@征途2:回复@不闷骚不:来点烧烤啥的就行了~~~口水ING~~ //@不闷骚不:想吃什么？说', '@征途2：#饥饿的兔子#加班中……兔子饿的头昏眼花，有人送点吃的来么……', '10', '@征途2', null, null, '2011-04-06 21:39:51', '2011-04-06 21:39:51', '0', '8758807074', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('679', null, '凌晨2点半，向每个已睡着的人道声：晚安。向每个还未睡着的人道声：早。对自己道一声：兔子，加油！', '', '10', '@征途2', null, null, '2011-04-07 02:24:27', '2011-04-07 02:24:27', '0', '8768812576', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('680', null, '公司公关部通知我参加下午3点新浪科技微博访谈。微博访谈是个啥东东？微博上居然还能访谈，千奇百怪。', '', '8', '@史玉柱', null, null, '2011-04-07 11:23:31', '2011-04-07 11:23:31', '0', '8778243358', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('681', null, '祝玩的开心哈。', '@Nolan89：2天的游戏历程，发现征途2是个好游戏，巨人是个好股票，只是现在价格没法入，但期权交易又很奚冷，定价很坑爹~[衰]', '13', '@纪学锋', null, null, '2011-04-07 11:52:56', '2011-04-07 11:52:56', '0', '8779418516', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('682', null, '[good] ，就是这个理儿。 //@steven22:关注游戏民生问题，建设幸福征途2。坚持包容性增长，做到发展为了玩家，发展依靠玩家，发展成果由玩家共享 //@史玉柱:哈哈 纪大硕士该改称纪总理了', '@纪学锋：征途2的第三代商业模式和社区化努力总结起来其实就是：调整游戏中玩家收入分配的合理性及关注游戏中的民生、增加玩家在游戏中的幸福指数。这个过程很漫长，但我们会一直努力！！', '13', '@纪学锋', null, null, '2011-04-07 11:54:32', '2011-04-07 11:54:32', '0', '8779482256', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('683', null, '#征途2语录#脱机的人永远不知道联机的人等了ta多久……', '', '10', '@征途2', null, null, '2011-04-07 12:18:09', '2011-04-07 12:18:09', '0', '8780427474', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('684', null, '纠结啥，丢个硬币，正面就冲新区，反面就留在老区。游戏，只要开心就好。 //@lzc_成成成成成:兔子我在纠结是不是要冲新区！纠结阿纠结。', '@征途2：凌晨2点半，向每个已睡着的人道声：晚安。向每个还未睡着的人道声：早。对自己道一声：兔子，加油！', '10', '@征途2', null, null, '2011-04-07 12:19:14', '2011-04-07 12:19:14', '0', '8780473232', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('685', null, '嗯，就是官网滴~~ //@俊太语录:在征途2官网看到过 我还截图了', '@征途2：#征途2语录#脱机的人永远不知道联机的人等了ta多久……', '10', '@征途2', null, null, '2011-04-07 12:35:51', '2011-04-07 12:35:51', '0', '8781217874', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('686', null, '史总作客“微访谈”。', '@新浪科技：有人说他是营销天才、商界巨人；也有人认为他是赌徒，是网络游戏行业的暗黑破坏者。他对红和白两种色彩情有独钟，也对市场敏锐有加。他是不安分的“搅局者”，他言语洒脱不按套路出牌。今天15:00，巨人网络CEO@史玉柱 做客微访谈，与大家探讨成功基因，欢迎提问！http://t.cn/hBR85v<a href=\'http://ww4.sinaimg.cn/large/61e89b74jw1dfzs3me0wtj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/61e89b74jw1dfzs3me0wtj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-07 12:54:06', '2011-04-07 12:54:06', '0', '8782122392', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('687', null, '回复@吳東達:这个想法不错…… //@吳東達:兔子，一起玩新区呀。我们组建给围脖家族 //@征途2:纠结啥，丢个硬币，正面就冲新区，反面就留在老区。游戏，只要开心就好。 //@lzc_成成成成成:兔子我在纠结是不是要冲新区！纠结阿纠结。', '@征途2：凌晨2点半，向每个已睡着的人道声：晚安。向每个还未睡着的人道声：早。对自己道一声：兔子，加油！', '10', '@征途2', null, null, '2011-04-07 13:32:37', '2011-04-07 13:32:37', '0', '8783963756', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('688', null, '征途2今天发人数目标奖金，研发、运营、推广同事每人一个信封，看着每个人从会议室出来开心的笑脸，我也很幸福。喜欢和大家一起拼搏努力并取得成绩的感觉，也喜欢给大家发奖金的感觉。一个团队一起努力取得成绩，然后一起分享，感觉真好！', '', '13', '@纪学锋', null, null, '2011-04-07 13:56:42', '2011-04-07 13:56:42', '0', '8784935074', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('689', null, '//@焦3仙://@庞升东:哈哈，做游戏太有意思了。 // @纪学锋 :回复 @史玉柱 :[害羞] ，貌似温总也在考虑这个事情啊。不过我们的复杂度比人家的差远了。现实社会太复杂，还是游戏单纯些。唉！ // @史玉柱 :哈哈 纪大硕士该改称纪总理了', '@纪学锋：征途2的第三代商业模式和社区化努力总结起来其实就是：调整游戏中玩家收入分配的合理性及关注游戏中的民生、增加玩家在游戏中的幸福指数。这个过程很漫长，但我们会一直努力！！', '10', '@征途2', null, null, '2011-04-07 14:11:21', '2011-04-07 14:11:21', '0', '8785488632', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('690', null, '征途2转播: 老大把信封拿在手上对兔子说：你最近表现不错，继续保持。兔子顿时泪流满面，欢欣鼓舞的走出办公室，连信封都忘了拿了……', '@纪学锋：征途2今天发人数目标奖金，研发、运营、推广同事每人一个信封，看着每个人从会议室出来开心的笑脸，我也很幸福。喜欢和大家一起拼搏努力并取得成绩的感觉，也喜欢给大家发奖金的感觉。一个团队一起努力取得成绩，然后一起分享，感觉真好！', '10', '@征途2', null, null, '2011-04-07 14:11:55', '2011-04-07 14:11:55', '0', '8785510370', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('691', null, '大家有人的捧个人场，有钱的还是捧个人场……HOHO~偶像偶像啊！', '@新浪科技：有人说他是营销天才、商界巨人；也有人认为他是赌徒，是网络游戏行业的暗黑破坏者。他对红和白两种色彩情有独钟，也对市场敏锐有加。他是不安分的“搅局者”，他言语洒脱不按套路出牌。今天15:00，巨人网络CEO@史玉柱 做客微访谈，与大家探讨成功基因，欢迎提问！http://t.cn/hBR85v<a href=\'http://ww4.sinaimg.cn/large/61e89b74jw1dfzs3me0wtj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/61e89b74jw1dfzs3me0wtj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-07 14:15:42', '2011-04-07 14:15:42', '0', '8785652854', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('692', null, '转发微博。', '@新浪科技：有人说他是营销天才、商界巨人；也有人认为他是赌徒，是网络游戏行业的暗黑破坏者。他对红和白两种色彩情有独钟，也对市场敏锐有加。他是不安分的“搅局者”，他言语洒脱不按套路出牌。今天15:00，巨人网络CEO@史玉柱 做客微访谈，与大家探讨成功基因，欢迎提问！http://t.cn/hBR85v<a href=\'http://ww4.sinaimg.cn/large/61e89b74jw1dfzs3me0wtj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/61e89b74jw1dfzs3me0wtj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-07 15:00:31', '2011-04-07 15:00:31', '0', '8787327178', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('693', null, '转发微博。', '@梵兔佳游：在巨人上海松江新园区CEO办公室见到史玉柱时，他开着两块屏幕：一台苹果笔记本电脑上，是新浪微博的窗口。而另一块大液晶屏上则是《征途2》画面，这款游戏下个月将启动内测。而马云送他的纯种德国猎犬——奥巴马，不时在桌子底下钻来钻去。', '13', '@纪学锋', null, null, '2011-04-07 15:03:06', '2011-04-07 15:03:06', '0', '8787423362', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('694', null, '奥巴马是元旦出生的，3个多月了', '@偶系麦子呀：向@史玉柱 提问：你家奥巴马长多大了呀··好久木有看到你发PP了，秀一下你和他的pp呀史总[嘻嘻]', '8', '@史玉柱', null, null, '2011-04-07 15:07:50', '2011-04-07 15:07:50', '0', '8787602168', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('695', null, '企业家最珍贵的是信誉，重于生命', '@舒咏平：向@史玉柱 提问：珠海巨人大厦是你的心疼之所，但也是中国企业家家东山再起的、信誉重铸的纪念碑，你同意此看法吗？如同意，你能否为此加入创意与再投资呢？', '8', '@史玉柱', null, null, '2011-04-07 15:10:32', '2011-04-07 15:10:32', '0', '8787702154', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('696', null, '//@史玉柱:企业家最珍贵的是信誉，重于生命', '@舒咏平：向@史玉柱 提问：珠海巨人大厦是你的心疼之所，但也是中国企业家家东山再起的、信誉重铸的纪念碑，你同意此看法吗？如同意，你能否为此加入创意与再投资呢？', '13', '@纪学锋', null, null, '2011-04-07 15:17:15', '2011-04-07 15:17:15', '0', '8787955216', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('697', null, '我做啥都会有争议，我习惯了', '@叶开sa：向@史玉柱 提问：微博让更多人了解了一个更加真实的史玉柱，包括我。当从脑白金，到现在的巨人网络，您所从事的发家的事业都争议颇多，您如何开袋这些争议？比如脑白金真实的营养价值及巨人网络游戏对很多青少年的误导。', '8', '@史玉柱', null, null, '2011-04-07 15:19:53', '2011-04-07 15:19:53', '0', '8788052242', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('698', null, '马云比我聪明', '@秋琼小屋：向@史玉柱 提问：您怎么评价马云 啊', '8', '@史玉柱', null, null, '2011-04-07 15:21:08', '2011-04-07 15:21:08', '0', '8788098360', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('699', null, '创业钱不是万能的，关键是商业模式和创业者激情', '@Chair冯：向@史玉柱 提问：您好，如今贫二代要创业，既没有富二代有钱，又没有官二代有关系，您觉得贫二代创业还有优势吗？贫二代创业最需要的品质是什么？', '8', '@史玉柱', null, null, '2011-04-07 15:21:41', '2011-04-07 15:21:41', '0', '8788119004', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('700', null, '申请破产会失去信誉，以后无法在江湖混了', '@钟钟钟钟hy：对 @史玉柱 提问:曾经负债很多。完全可以申请破产  是什么信念让你支持到现在', '8', '@史玉柱', null, null, '2011-04-07 15:25:04', '2011-04-07 15:25:04', '0', '8788244058', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('701', null, '我喜欢脑白金广告，但广告播多了总会让人烦的', '@_徐鹏展：向@史玉柱 提问：史先生，从你个人审美角度而言，你喜欢脑白金的广告吗？', '8', '@史玉柱', null, null, '2011-04-07 15:27:59', '2011-04-07 15:27:59', '0', '8788351978', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('702', null, '走上创业之路的原始想法是改善生活，有了规模后就变成了事业追求', '@林梓滨：向@史玉柱 提问：史总，我已经忍您很久了。请问您抱什么心态去创业？是什么让您走上创业之路？老实回答...', '8', '@史玉柱', null, null, '2011-04-07 15:29:12', '2011-04-07 15:29:12', '0', '8788397160', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('703', null, '回复@老万老烦:呵呵，好的传统必须坚持！ //@老万老烦:巨人研发老传统了，发现金，嗲的～以前坐在财务室门口，经常看见一两个大汉扛着几箱现金.....', '@纪学锋：征途2今天发人数目标奖金，研发、运营、推广同事每人一个信封，看着每个人从会议室出来开心的笑脸，我也很幸福。喜欢和大家一起拼搏努力并取得成绩的感觉，也喜欢给大家发奖金的感觉。一个团队一起努力取得成绩，然后一起分享，感觉真好！', '13', '@纪学锋', null, null, '2011-04-07 15:31:48', '2011-04-07 15:31:48', '0', '8788492932', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('704', null, '没这个计划，我很讨厌领带勒脖子的感觉', '@杨鹏yangpeng：向@史玉柱 提问：呵呵什么时候准备穿西服照张相', '8', '@史玉柱', null, null, '2011-04-07 15:33:04', '2011-04-07 15:33:04', '0', '8788540714', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('705', null, '玩游戏', '@杨文军sire：向@史玉柱 提问：您认为最好的减压方式是什么？', '8', '@史玉柱', null, null, '2011-04-07 15:33:37', '2011-04-07 15:33:37', '0', '8788562538', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('706', null, '我没觉得我脑子活，但我的团队脑子很活，点子多，我只负责选中他们的点子', '@绛宇堇年：对 @史玉柱 提问:觉得您脑子特活，点子多，创新能力非人般的强，如何做到的？', '8', '@史玉柱', null, null, '2011-04-07 15:34:24', '2011-04-07 15:34:24', '0', '8788591062', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('707', null, '[哈哈]  //@史玉柱:不愿意', '@徐军_Frank：向@史玉柱 提问：史总，你可否愿意借点钱给一个不认识的人吗？', '13', '@纪学锋', null, null, '2011-04-07 15:35:24', '2011-04-07 15:35:24', '0', '8788628782', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('708', null, '大多数男人是这样，我例外', '@朱威廉：向@史玉柱 提问：每一个成功男人的背后，都有一个伟大的女人，史总同意这个观点吗？', '8', '@史玉柱', null, null, '2011-04-07 15:35:24', '2011-04-07 15:35:24', '0', '8788628924', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('709', null, '//@史玉柱:申请破产会失去信誉，以后无法在江湖混了', '@钟钟钟钟hy：对 @史玉柱 提问:曾经负债很多。完全可以申请破产  是什么信念让你支持到现在', '13', '@纪学锋', null, null, '2011-04-07 15:36:53', '2011-04-07 15:36:53', '0', '8788686900', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('710', null, '保健品的生命周期关键是在它的产品效果，没效的产品生命周期不超过三年', '@那山那人那家子：向@史玉柱 提问：您说过任何一个保健品都有它的生命周期！请问您觉得那个保健品现在生命周期最长？', '8', '@史玉柱', null, null, '2011-04-07 15:38:07', '2011-04-07 15:38:07', '0', '8788735288', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('711', null, '当前经营与政府官员的关系越来越不重要', '@嘎嘎嘎嘎噶：对 @史玉柱 提问:就您个人经验，您认为经营与政府官员的关系在多大程度上决定着企业的生命？', '8', '@史玉柱', null, null, '2011-04-07 15:40:35', '2011-04-07 15:40:35', '0', '8788831464', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('712', null, '//@史玉柱:走上创业之路的原始想法是改善生活，有了规模后就变成了事业追求', '@林梓滨：向@史玉柱 提问：史总，我已经忍您很久了。请问您抱什么心态去创业？是什么让您走上创业之路？老实回答...', '13', '@纪学锋', null, null, '2011-04-07 15:43:39', '2011-04-07 15:43:39', '0', '8788952604', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('713', null, '多想想美好的未来就不会想自杀了', '@刘远见：对 @史玉柱 提问:当时低落时想自杀吗？对现在一些低落的人有什么建议？谢谢！', '8', '@史玉柱', null, null, '2011-04-07 15:44:10', '2011-04-07 15:44:10', '0', '8788973294', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('714', null, '从当前情况来看第三代商业模式应该是顶峰，再过几年就难说了', '@达拉拉dafy：向@史玉柱 提问：在网游这个领域，有人说第三代商业模式已经让商业模式爬到了顶峰，您认为是这样的吗？未来还会出现新的搅局者吗？您认为在网游领域要想成为一个成功的搅局者应该具备哪些条件。', '8', '@史玉柱', null, null, '2011-04-07 15:44:56', '2011-04-07 15:44:56', '0', '8789002364', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('715', null, '能力和人品', '@光环阿菜：对 @史玉柱 提问:您最看重员工的什么', '8', '@史玉柱', null, null, '2011-04-07 15:45:12', '2011-04-07 15:45:12', '0', '8789012526', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('716', null, '现在脑白金已进入淡季，广告也很少，下次广告密集的时候是中秋节', '@锁具专家南京东屋电气：向@史玉柱 提问：你的脑白金广告能不能停一停，我们都很有意见哦。[嘻嘻]', '8', '@史玉柱', null, null, '2011-04-07 15:45:55', '2011-04-07 15:45:55', '0', '8789040612', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('717', null, '很新奇，很好玩', '@CNCYY：向@史玉柱 提问：史总，如你早上所说的：微博上居然还能访谈，千奇百怪。请问下，你现在在做访谈是一个怎样的感觉？谢谢！', '8', '@史玉柱', null, null, '2011-04-07 15:48:04', '2011-04-07 15:48:04', '0', '8789123324', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('718', null, '能力比文凭重要', '@怪怪璟：向@史玉柱 提问：招聘时，文凭比能力重要麽？首先看中的是个人的哪方面？谢谢！', '8', '@史玉柱', null, null, '2011-04-07 15:49:10', '2011-04-07 15:49:10', '0', '8789165434', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('719', null, '如果徒弟能力超过师傅，师傅应该感到开心', '@老人与游戏新时代：向@史玉柱 提问：史总你好，您谈到您的徒弟纪学锋在做第三代商业模式的时候坚持自己的看法，很多时候不听你这个师傅的，这次您被自己的徒弟搅局了，您有什么感受？', '8', '@史玉柱', null, null, '2011-04-07 15:50:27', '2011-04-07 15:50:27', '0', '8789214286', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('720', null, '//@史玉柱:捐款，捐300万', '@任俊宇：您的围脖粉丝如果到了三百万。你打算做什么？捐款？还是其他。', '13', '@纪学锋', null, null, '2011-04-07 15:51:35', '2011-04-07 15:51:35', '0', '8789258124', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('721', null, '给他很好的待遇，给他很好的舞台', '@大帅强：向@史玉柱 提问：您好，请问怎么留住人才。', '8', '@史玉柱', null, null, '2011-04-07 15:52:26', '2011-04-07 15:52:26', '0', '8789291164', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('722', null, '没有从政打算，员工富裕是老板最大的光荣', '@恶马劣根：向@史玉柱 提问：中国之关注GDP的发展而忽视了小民富足。您是否带领团队走向富足，以后是否有从政打算？你认为中国商业繁荣能持续多久？', '8', '@史玉柱', null, null, '2011-04-07 15:52:47', '2011-04-07 15:52:47', '0', '8789303518', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('723', null, '我每天都会吃脑白金，骗你是小狗', '@农夫起凡90后：向@史玉柱 提问：据我了解保健品是暴利行业，我想问您平时会吃脑白金么？', '8', '@史玉柱', null, null, '2011-04-07 15:53:05', '2011-04-07 15:53:05', '0', '8789315220', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('724', null, '现在是三个月大的小狗，咬人也不疼', '@记忆游乐园：对 @史玉柱 提问:请问奥巴马是您家的狗狗吗？是也不能老放出来咬人的哦！哈哈～', '8', '@史玉柱', null, null, '2011-04-07 15:54:31', '2011-04-07 15:54:31', '0', '8789371792', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('725', null, '//@史玉柱:从当前情况来看第三代商业模式应该是顶峰，再过几年就难说了', '@达拉拉dafy：向@史玉柱 提问：在网游这个领域，有人说第三代商业模式已经让商业模式爬到了顶峰，您认为是这样的吗？未来还会出现新的搅局者吗？您认为在网游领域要想成为一个成功的搅局者应该具备哪些条件。', '13', '@纪学锋', null, null, '2011-04-07 15:54:53', '2011-04-07 15:54:53', '0', '8789384166', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('726', null, '勤奋可以让人变得更聪明', '@怪怪璟：向@史玉柱 提问：怎样、才能变得聪明？是学识麽？', '8', '@史玉柱', null, null, '2011-04-07 15:55:42', '2011-04-07 15:55:42', '0', '8789415944', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('727', null, '是本人在口述，工作人员在打字', '@草莓德男人：对 @史玉柱 提问:请问此时此刻是您在回答我们的问题，还是您的助手在替您？只因为我看见您的回答很幽默风趣，谢谢。', '8', '@史玉柱', null, null, '2011-04-07 15:57:12', '2011-04-07 15:57:12', '0', '8789473870', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('728', null, '很少发生，因为我不管公司具体事务，烦恼也少', '@sina穿越网络：向@史玉柱 提问：您会因为公司事务失眠吗？', '8', '@史玉柱', null, null, '2011-04-07 15:58:29', '2011-04-07 15:58:29', '0', '8789522738', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('729', null, '那就先到其他公司打工，边工作边学习和锻炼', '@哎呀那个米米：向@史玉柱 提问：对想创业但还没有创业，想挣钱但找不到挣钱的路子，想出去拼搏但又陷在温室里踌躇的年轻人说句话吧', '8', '@史玉柱', null, null, '2011-04-07 16:00:07', '2011-04-07 16:00:07', '0', '8789586604', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('730', null, '柳传志，马云', '@农夫起凡90后：向@史玉柱 提问：中国那么多企业家，除了史玉柱，史总最佩服谁？？？？？', '8', '@史玉柱', null, null, '2011-04-07 16:00:32', '2011-04-07 16:00:32', '0', '8789603396', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('731', null, '同时在线40万就意味着这款游戏取得了较大成功', '@科学与幻想：向@史玉柱 提问：为什么《征途2》不到40万会放奥巴马咬人，这个数字怎么定出来的？ 请问奥巴马的哥哥准备起什么名字？', '8', '@史玉柱', null, null, '2011-04-07 16:02:07', '2011-04-07 16:02:07', '0', '8789666068', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('732', null, '//@史玉柱:因为我玩盛大游戏的时候被盛大封号了', '@刘允：向@史玉柱 提问：您到时怎么突然想起来做游戏的', '13', '@纪学锋', null, null, '2011-04-07 16:03:25', '2011-04-07 16:03:25', '0', '8789717080', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('733', null, '找到老婆就退休', '@姚曦1982：向@史玉柱 提问：什么时候退休？退休想做点什么？为什么那么喜欢红色的立领衣服，一天天的穿？', '8', '@史玉柱', null, null, '2011-04-07 16:04:47', '2011-04-07 16:04:47', '0', '8789770780', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('734', null, '//@史玉柱:没有从政打算，员工富裕是老板最大的光荣', '@恶马劣根：向@史玉柱 提问：中国之关注GDP的发展而忽视了小民富足。您是否带领团队走向富足，以后是否有从政打算？你认为中国商业繁荣能持续多久？', '13', '@纪学锋', null, null, '2011-04-07 16:05:11', '2011-04-07 16:05:11', '0', '8789786682', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('735', null, '[哈哈]  //@史玉柱:我每天都会吃脑白金，骗你是小狗', '@农夫起凡90后：向@史玉柱 提问：据我了解保健品是暴利行业，我想问您平时会吃脑白金么？', '13', '@纪学锋', null, null, '2011-04-07 16:06:07', '2011-04-07 16:06:07', '0', '8789822892', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('736', null, '转发微博。', '@新浪科技：史玉柱：1)创业时钱不是万能的，关键是商业模式和创业者激情；想放弃的时候多想一想光明的前途；2)我不认为我是搅局者，我们做决策时不会墨守成规，而是从实际情况出发，这样有时会被误认为是搅局。本次微访谈到此结束，感谢大家的参与！http://t.cn/hBR85v<a href=\'http://ww1.sinaimg.cn/large/61e89b74jw1dg005ebcyfj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/61e89b74jw1dg005ebcyfj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-07 16:20:17', '2011-04-07 16:20:17', '0', '8790370606', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('737', null, '兔子愿意嫁给你…… //@史玉柱:找到老婆就退休', '@姚曦1982：向@史玉柱 提问：什么时候退休？退休想做点什么？为什么那么喜欢红色的立领衣服，一天天的穿？', '10', '@征途2', null, null, '2011-04-07 16:20:48', '2011-04-07 16:20:48', '0', '8790392316', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('738', null, '转发微博。', '@新浪科技：巨人网络董事长兼CEO@史玉柱；我开始做游戏是因为玩盛大游戏时被封号。史玉柱微访谈正在进行中，延长10分钟，欢迎大家继续提问！http://t.cn/hBR85v<a href=\'http://ww2.sinaimg.cn/large/61e89b74jw1dg000v0jtvj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/61e89b74jw1dg000v0jtvj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-07 16:21:27', '2011-04-07 16:21:27', '0', '8790417344', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('739', null, '//@史玉柱:那就先到其他公司打工，边工作边学习和锻炼', '@哎呀那个米米：向@史玉柱 提问：对想创业但还没有创业，想挣钱但找不到挣钱的路子，想出去拼搏但又陷在温室里踌躇的年轻人说句话吧', '10', '@征途2', null, null, '2011-04-07 16:22:00', '2011-04-07 16:22:00', '0', '8790438678', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('740', null, '上次被兔子追着杀，HOHO //@史玉柱:80级，菜鸟', '@一壶老酒二锅头：向@史玉柱 提问：你在征途2的号多少级了？什么装备？', '10', '@征途2', null, null, '2011-04-07 16:22:35', '2011-04-07 16:22:35', '0', '8790461156', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('741', null, '//@史玉柱:勤奋可以让人变得更聪明', '@怪怪璟：向@史玉柱 提问：怎样、才能变得聪明？是学识麽？', '10', '@征途2', null, null, '2011-04-07 16:22:58', '2011-04-07 16:22:58', '0', '8790477880', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('742', null, '//@史玉柱:我每天都会吃脑白金，骗你是小狗', '@农夫起凡90后：向@史玉柱 提问：据我了解保健品是暴利行业，我想问您平时会吃脑白金么？', '10', '@征途2', null, null, '2011-04-07 16:23:44', '2011-04-07 16:23:44', '0', '8790507058', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('743', null, '//@史玉柱:如果徒弟能力超过师傅，师傅应该感到开心', '@老人与游戏新时代：向@史玉柱 提问：史总你好，您谈到您的徒弟纪学锋在做第三代商业模式的时候坚持自己的看法，很多时候不听你这个师傅的，这次您被自己的徒弟搅局了，您有什么感受？', '10', '@征途2', null, null, '2011-04-07 16:24:14', '2011-04-07 16:24:14', '0', '8790526258', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('744', null, '//@史玉柱:能力和人品', '@光环阿菜：对 @史玉柱 提问:您最看重员工的什么', '10', '@征途2', null, null, '2011-04-07 16:25:11', '2011-04-07 16:25:11', '0', '8790562352', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('745', null, '//@史玉柱:从当前情况来看第三代商业模式应该是顶峰，再过几年就难说了', '@达拉拉dafy：向@史玉柱 提问：在网游这个领域，有人说第三代商业模式已经让商业模式爬到了顶峰，您认为是这样的吗？未来还会出现新的搅局者吗？您认为在网游领域要想成为一个成功的搅局者应该具备哪些条件。', '10', '@征途2', null, null, '2011-04-07 16:25:21', '2011-04-07 16:25:21', '0', '8790570298', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('746', null, '//@史玉柱:你把他当成有同样人格的人去对待，部下就会尊重你', '@稻菊老鞠：向@史玉柱 提问：史總，您是我最崇拜的偶像，我想再問您一個問題：到底團隊應該用什麼樣的心態去帶呢？', '10', '@征途2', null, null, '2011-04-07 16:25:53', '2011-04-07 16:25:53', '0', '8790592124', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('747', null, '晕死 参加微博访谈说的话 都在这显示 把我的窝搞乱了', '', '8', '@史玉柱', null, null, '2011-04-07 16:41:32', '2011-04-07 16:41:32', '0', '8791206334', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('748', null, '这个这个。。。，游戏只是娱乐。要适度', '@lilyzllove：向@史玉柱 提问：还有啊，你的征途2已经成为“小3”，成功介入了我和男友之间了。我想问你的游戏魅力为何会如此之大呢？', '13', '@纪学锋', null, null, '2011-04-07 16:47:05', '2011-04-07 16:47:05', '0', '8791430252', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('749', null, '回复@神级贱晟619:\"云网游\"这个概念兔子喜欢 //@神级贱晟619:这是“云”网游。把现实的商业模式和火爆话题完完整整搬到了游戏中， 例如拍卖行、股票系统、投票系统、物价调控、等级调控、甚至还加上了微博和日记.....太多了//@征途2://@史玉柱:从当前情况来看第三代商业模式应该是顶峰，再过几', '@达拉拉dafy：向@史玉柱 提问：在网游这个领域，有人说第三代商业模式已经让商业模式爬到了顶峰，您认为是这样的吗？未来还会出现新的搅局者吗？您认为在网游领域要想成为一个成功的搅局者应该具备哪些条件。', '10', '@征途2', null, null, '2011-04-07 16:59:04', '2011-04-07 16:59:04', '0', '8791916788', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('750', null, '回复@lilyzllove:[害羞] //@lilyzllove:魅力大，档也档不住的。只怪你们这款游戏开发地太适合上班族了。每天出去吃饭时，男友都不忘说一句“*，赶不上国运了”…… //@纪学锋:这个这个。。。，游戏只是娱乐。要适度 //@纪学锋:这个这个。。。，游戏只是娱乐。要适度', '@lilyzllove：向@史玉柱 提问：还有啊，你的征途2已经成为“小3”，成功介入了我和男友之间了。我想问你的游戏魅力为何会如此之大呢？', '13', '@纪学锋', null, null, '2011-04-07 17:12:56', '2011-04-07 17:12:56', '0', '8792465638', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('751', null, '回复@纪学锋:赶紧来吧！我们都在等你呢！ //@纪学锋:注册下载客户端即可玩，不需激活', '@0413大米：@征途2 你好，明天内测，注册就能玩吗？还是需要内测帐号，谢谢。', '10', '@征途2', null, null, '2011-04-08 00:21:23', '2011-04-08 00:21:23', '0', '8812550058', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('752', null, '丰哥，丢番茄行不行~~鸡蛋涨价了。', '@田丰ZT2：今天下午5点内测，《征途2》就要出阁了[害羞] 。欢迎SINA的朋友来拍砖，丢鸡蛋（不过要避开脸[可怜] ）。希望从今年开始，每年都有更多的玩家朋友，共庆4月8日。有木有？一定有！[耶]', '10', '@征途2', null, null, '2011-04-08 00:23:50', '2011-04-08 00:23:50', '0', '8812625518', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('753', null, '回复@语千YukiQ:等着你呢 //@语千YukiQ:下午候着呢！客户端已安装完毕我来也我来也！ //@征途2:丰哥，丢番茄行不行~~鸡蛋涨价了。', '@田丰ZT2：今天下午5点内测，《征途2》就要出阁了[害羞] 。欢迎SINA的朋友来拍砖，丢鸡蛋（不过要避开脸[可怜] ）。希望从今年开始，每年都有更多的玩家朋友，共庆4月8日。有木有？一定有！[耶]', '10', '@征途2', null, null, '2011-04-08 10:54:12', '2011-04-08 10:54:12', '0', '8823267178', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('754', null, '回复@语千YukiQ:兔子会误会滴~~讨厌~~ //@语千YukiQ:[害羞] [爱你] //@征途2:回复@语千YukiQ:等着你呢 //@语千YukiQ:下午候着呢！客户端已安装完毕我来也我来也！ //@征途2:丰哥，丢番茄行不行~~鸡蛋涨价了。', '@田丰ZT2：今天下午5点内测，《征途2》就要出阁了[害羞] 。欢迎SINA的朋友来拍砖，丢鸡蛋（不过要避开脸[可怜] ）。希望从今年开始，每年都有更多的玩家朋友，共庆4月8日。有木有？一定有！[耶]', '10', '@征途2', null, null, '2011-04-08 11:14:36', '2011-04-08 11:14:36', '0', '8824163434', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('755', null, '今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！', '<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 11:15:09', '2011-04-08 11:15:09', '0', '8824186602', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('756', null, '今天进办公楼门口好多花篮，仔细一看原来都是各媒体和兄弟公司送来祝贺征途2内测成功的，很感动。在这里谢谢朋友们，我们现在离成功还很远，只是在路上......。风雨征途路，我们一直相伴，谢谢大家！', '', '13', '@纪学锋', null, null, '2011-04-08 11:32:45', '2011-04-08 11:32:45', '0', '8824942332', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('757', null, '回复@周胜飞:同喜同喜 //@周胜飞:转发此微博:作为一代骨灰，绝对要恭喜征途大踏步向社交网游迈进！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 11:36:20', '2011-04-08 11:36:20', '0', '8825093788', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('758', null, '我喜欢这种感觉！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-08 12:27:15', '2011-04-08 12:27:15', '0', '8827225910', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('759', null, '淡定，淡定', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-08 12:36:40', '2011-04-08 12:36:40', '0', '8827685324', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('760', null, '兔子非常兴奋！ //@纪学锋:我喜欢这种感觉！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 12:40:57', '2011-04-08 12:40:57', '0', '8827900810', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('761', null, '//@nowherelian:@巨人刘伟 @老人与游戏新时代 @征途2  @巨人Game @巨人网络 @大麦的兜响当当 @不吃胡萝卜的小兔子 @郑敏_小米', '@新浪游戏播报：【八问巨人女总裁刘伟：直面第三代商业模式质疑】新浪游戏讯  4月8日消息，巨人年度重要游戏《征途2》将于4月8日开启内测，并正式推出第三代网游收费模式。测试前夕，新浪游戏独家专访了巨人总裁刘伟，她表示本次测试将更注重非付费玩家的体验。 http://t.cn/hBrV7y<a href=\'http://ww3.sinaimg.cn/large/727cacf1jw1dg0ya7z3btj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/727cacf1jw1dg0ya7z3btj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 12:42:09', '2011-04-08 12:42:09', '0', '8827960486', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('762', null, '征途2注定要成为一个传说！ //@yaya119:广告经常做，这个永流传 //@大麦的兜响当当:霸气 //@征途2:回复@周胜飞:同喜同喜 //@周胜飞:转发此微博:作为一代骨灰，绝对要恭喜征途大踏步向社交网游迈进！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 12:42:48', '2011-04-08 12:42:48', '0', '8827994000', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('763', null, '纪“总理”的演出将要开始，是骡子是驴拉出来溜溜。等我下飞机就能得到首日人数数据。 //@纪学锋:我喜欢这种感觉！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-08 12:49:21', '2011-04-08 12:49:21', '0', '8828330766', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('764', null, '我晕，上17173网才看见清上个贴的图。主页广告全被纪败家子包了，崽卖爷田心不疼！！！！', '', '8', '@史玉柱', null, null, '2011-04-08 13:03:12', '2011-04-08 13:03:12', '0', '8829082868', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('765', null, '[酷]', '@史玉柱：我晕，上17173网才看见清上个贴的图。主页广告全被纪败家子包了，崽卖爷田心不疼！！！！', '13', '@纪学锋', null, null, '2011-04-08 13:12:23', '2011-04-08 13:12:23', '0', '8829573690', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('766', null, '史总，下午17时，兔子在新区等你，你懂的！ //@史玉柱:纪“总理”的演出将要开始，是骡子是驴拉出来溜溜。等我下飞机就能得到首日人数数据。 //@纪学锋:我喜欢这种感觉！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 13:36:19', '2011-04-08 13:36:19', '0', '8830744210', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('767', null, '我很傻，但是我好玩哦~ //@皇后於镜:又见这只傻啦吧唧的兔子... //@史玉柱:纪“总理”的演出将要开始，是骡子是驴拉出来溜溜。等我下飞机就能得到首日人数数据。 //@纪学锋:我喜欢这种感觉！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 13:38:09', '2011-04-08 13:38:09', '0', '8830830400', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('768', null, '回复@猎人汀:征途2威武！！！ //@猎人汀:征途2威武！！！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 13:59:52', '2011-04-08 13:59:52', '0', '8831782928', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('769', null, '回复@瑞丽女装:来嘛~兔子等你！ //@瑞丽女装:我要玩新区拉，，哈哈[哈哈][哈哈][哈哈][哈哈] //@征途2:回复@猎人汀:征途2威武！！！ //@猎人汀:征途2威武！！！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 14:07:26', '2011-04-08 14:07:26', '0', '8832095514', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('770', null, '回复@马健Jerry:必须有啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 //@马健Jerry:真霸气！有木有！ //@纪学锋:我喜欢这种感觉！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 14:27:44', '2011-04-08 14:27:44', '0', '8832898292', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('771', null, '回复@猎人汀:COME ON BABY！！~ //@猎人汀:要不我也来试试？ //@征途2: 回复@瑞丽女装:来嘛~兔子等你！ //@瑞丽女装:我要玩新区拉，，哈哈[哈哈][哈哈][哈哈][哈哈] //@征途2:回复@猎人汀:征途2威武！！！ //@猎人汀:征途2威武！！！ //@征途2:回复@瑞丽女装:来嘛~兔子等你！', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-08 14:27:57', '2011-04-08 14:27:57', '0', '8832906702', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('772', null, '转发微博。', '@Amazonzx：今天的173主页，被征途2包场了～～<a href=\'http://ww3.sinaimg.cn/large/721fcbfejw1dg121avqn5j.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/721fcbfejw1dg121avqn5j.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-08 15:10:38', '2011-04-08 15:10:38', '0', '8834576974', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('773', null, '[哈哈] 粉墨登场', '@征途2：今天17：00 《征途2》霸气内测！！就是要霸气！！有木有！！包场了！！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg0xbsuizqj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg0xbsuizqj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-08 15:17:43', '2011-04-08 15:17:43', '0', '8834851268', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('774', null, '[害羞]', '@Amazonzx：今天的173主页，被征途2包场了～～<a href=\'http://ww3.sinaimg.cn/large/721fcbfejw1dg121avqn5j.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/721fcbfejw1dg121avqn5j.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-08 15:21:48', '2011-04-08 15:21:48', '0', '8835007774', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('775', null, '确实要公平 //@茶仔:公平！公平！还是TMD公平！哈哈哈～ //@陆悦:太夸张鸟 //@Ceplay:围观 //@谢天瑞:[抓狂] 刚去看了 90%都是征途2。。。 //@梁夏aleX:有钱淫啊~~啥时候我们项目能有这待遇~~ //@熊貓団子:太扎眼了...', '@积木V：征途2太TMD有钱了，竟然把173给包了<a href=\'http://ww3.sinaimg.cn/large/3fbd463djw1dg0vb2vlktj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/3fbd463djw1dg0vb2vlktj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-08 15:28:27', '2011-04-08 15:28:27', '0', '8835265726', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('776', null, '这张挺好看', '@自游劲：17173 被征途包场了，征途2太给力了<a href=\'http://ww4.sinaimg.cn/large/5622efd5jw1dg0vju6r2ij.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5622efd5jw1dg0vju6r2ij.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-08 15:31:48', '2011-04-08 15:31:48', '0', '8835396156', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('777', null, '关键时刻，我还是很大方的[害羞] ，对不？', '@自游劲：17173 被征途包场了，征途2太给力了<a href=\'http://ww4.sinaimg.cn/large/5622efd5jw1dg0vju6r2ij.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5622efd5jw1dg0vju6r2ij.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-08 15:35:04', '2011-04-08 15:35:04', '0', '8835520302', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('778', null, '哈哈  很是 震撼  //@巨人刘伟:关键时刻，我还是很大方的[害羞] ，对不？', '@自游劲：17173 被征途包场了，征途2太给力了<a href=\'http://ww4.sinaimg.cn/large/5622efd5jw1dg0vju6r2ij.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5622efd5jw1dg0vju6r2ij.jpg\' class=\'thumbNailPic\'></a>', '11', '@巨人Game', null, null, '2011-04-08 16:11:43', '2011-04-08 16:11:43', '0', '8836984458', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('779', null, '这个  败 的 好 ，败的 妙， 败的 有震撼力  [嘻嘻]', '@史玉柱：我晕，上17173网才看见清上个贴的图。主页广告全被纪败家子包了，崽卖爷田心不疼！！！！', '11', '@巨人Game', null, null, '2011-04-08 16:14:41', '2011-04-08 16:14:41', '0', '8837100238', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('780', null, '哈哈  不错  不错   我们征途2  太给力了', '@爆笑雷人：17173上面都是，就连这网吧也被包场咯<a href=\'http://ww2.sinaimg.cn/large/6a74ce11jw1dg16aom144j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6a74ce11jw1dg16aom144j.jpg\' class=\'thumbNailPic\'></a>', '11', '@巨人Game', null, null, '2011-04-08 16:26:05', '2011-04-08 16:26:05', '0', '8837546860', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('781', null, '转发微博。', '@纪学锋：今天进办公楼门口好多花篮，仔细一看原来都是各媒体和兄弟公司送来祝贺征途2内测成功的，很感动。在这里谢谢朋友们，我们现在离成功还很远，只是在路上......。风雨征途路，我们一直相伴，谢谢大家！', '11', '@巨人Game', null, null, '2011-04-08 16:47:01', '2011-04-08 16:47:01', '0', '8838391772', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('782', null, '还有10分钟，《征途2》内测正式启动！！！！！！兄弟们，姐妹们，雷迪生AND乡亲们！拿起鼠标，敲起键盘，跟兔子闹网游革命去吧！！！我们的目标是——没有蛀牙，哎呀，错了错了，是让丰哥裸奔！让纪总傻乐！让史总辞职！！', '', '10', '@征途2', null, null, '2011-04-08 16:51:27', '2011-04-08 16:51:27', '0', '8838574498', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('783', null, '大家都猜我们在线多少，这个不重要，我们也不太在意，最重要的是口碑。今天只是征途2推广的开始，我们只是在路上，只有真正对玩家好，给他们开心好玩的游戏才是好游戏。所以希望大家多关注征途2游戏本身，做游戏拉来多少人玩不重要，最重要的是留下多少人，谢谢大家！', '', '13', '@纪学锋', null, null, '2011-04-08 17:17:25', '2011-04-08 17:17:25', '0', '8839624524', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('784', null, '请大家多关注学锋的作品，少关注学锋的八卦[哈哈]', '@纪学锋：大家都猜我们在线多少，这个不重要，我们也不太在意，最重要的是口碑。今天只是征途2推广的开始，我们只是在路上，只有真正对玩家好，给他们开心好玩的游戏才是好游戏。所以希望大家多关注征途2游戏本身，做游戏拉来多少人玩不重要，最重要的是留下多少人，谢谢大家！', '17', '@巨人刘伟', null, null, '2011-04-08 17:33:22', '2011-04-08 17:33:22', '0', '8840278460', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('785', null, '马派太极', '<a href=\'http://ww3.sinaimg.cn/large/638b4670jw1dg1d8l16cej.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/638b4670jw1dg1d8l16cej.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-08 20:25:25', '2011-04-08 20:25:25', '0', '8847738624', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('786', null, '回复@荒漠甘泉V:呵呵，大家咋都能误会呢？人太多了，要加开新区了，看样子低调也会被误会啊。现在区人已满，周日加开新区。 //@荒漠甘泉V:怎么？表现不如预期？？？', '@纪学锋：大家都猜我们在线多少，这个不重要，我们也不太在意，最重要的是口碑。今天只是征途2推广的开始，我们只是在路上，只有真正对玩家好，给他们开心好玩的游戏才是好游戏。所以希望大家多关注征途2游戏本身，做游戏拉来多少人玩不重要，最重要的是留下多少人，谢谢大家！', '13', '@纪学锋', null, null, '2011-04-08 20:36:48', '2011-04-08 20:36:48', '0', '8848280650', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('787', null, '我勒个去，开了腾讯微博才2万粉丝。是这里的0.9%。http://t.cn/hBkYbE', '', '8', '@史玉柱', null, null, '2011-04-09 00:58:24', '2011-04-09 00:58:24', '0', '8861756851', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('788', null, '昨晚李连杰要请我出演他的戏里一个瞎子算命先生。我提出瞎子需要一个人扶，怕摔跤。我的小九九，你们明白的。', '', '8', '@史玉柱', null, null, '2011-04-09 12:56:49', '2011-04-09 12:56:49', '0', '8876297308', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('789', null, '家里老婆养的牡丹开始开花了！；）', '<a href=\'http://ww2.sinaimg.cn/large/64651a16jw1dg29lpgkurj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/64651a16jw1dg29lpgkurj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-09 15:05:13', '2011-04-09 15:05:13', '0', '8881545545', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('790', null, '回复@赵宁的感悟分享:在家里的院子里，我老婆养的牡丹开始开花啦啦啦啦啦啦啊！！[抓狂] 。你们真八卦，哈哈 //@赵宁的感悟分享:哈哈，是啊，外边老婆养的什么花？', '@纪学锋：家里老婆养的牡丹开始开花了！；）<a href=\'http://ww2.sinaimg.cn/large/64651a16jw1dg29lpgkurj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/64651a16jw1dg29lpgkurj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-09 15:21:40', '2011-04-09 15:21:40', '0', '8882169484', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('791', null, '回复@高宁1986:[委屈] //@高宁1986:家里，老婆养的牡丹开始开花了！；） ----一个标点符号引发的血案，建议您老婆来看看你这条微博。[嘻嘻] //@纪学锋:回复@赵宁的感悟分享:在家里的院子里，我老婆养的牡丹开始开花啦啦啦啦啦啦啊！！[抓狂] 。你们真八卦，哈哈', '@纪学锋：家里老婆养的牡丹开始开花了！；）<a href=\'http://ww2.sinaimg.cn/large/64651a16jw1dg29lpgkurj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/64651a16jw1dg29lpgkurj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-09 15:24:56', '2011-04-09 15:24:56', '0', '8882290122', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('792', null, '貌似妒嫉的人还不少，我从不评价其他公司和产品，大家比我好的我都尊重和学习，不认同的也尊重他们的产品和公司。我希望几个发酸的知名公司老大多把心思放在自己产品的研发和运营上，竞争力不在嘴上，用数据来证明自己。攻击别人只会显得自己更狭隘，做老大的都应心胸开阔些。', '', '13', '@纪学锋', null, null, '2011-04-09 23:26:20', '2011-04-09 23:26:20', '0', '8904808503', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('793', null, '感冒中。。。 发烧咳嗽嗓子痛。坚持不吃药，让免疫力操练一把。[嘻嘻]', '', '8', '@史玉柱', null, null, '2011-04-10 08:08:26', '2011-04-10 08:08:26', '0', '8913572495', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('794', null, '人一旦俗了，就不需装了。向冯光头学习，将俗进行到底。', '@冯仑and风马牛：#冯仑#你要想变得更有意思，你就稍微低俗一点。<a href=\'http://ww4.sinaimg.cn/large/46f42ecajw1dfzqqag6wij.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/46f42ecajw1dfzqqag6wij.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-10 09:05:03', '2011-04-10 09:05:03', '0', '8914849365', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('795', null, '看看  学习了 不少  ，老板 很给力', '@新浪科技：有人说他是营销天才、商界巨人；也有人认为他是赌徒，是网络游戏行业的暗黑破坏者。他对红和白两种色彩情有独钟，也对市场敏锐有加。他是不安分的“搅局者”，他言语洒脱不按套路出牌。今天15:00，巨人网络CEO@史玉柱 做客微访谈，与大家探讨成功基因，欢迎提问！http://t.cn/hBR85v<a href=\'http://ww4.sinaimg.cn/large/61e89b74jw1dfzs3me0wtj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/61e89b74jw1dfzs3me0wtj.jpg\' class=\'thumbNailPic\'></a>', '11', '@巨人Game', null, null, '2011-04-10 12:34:44', '2011-04-10 12:34:44', '0', '8923374158', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('796', null, '看你的喽 哈哈 //@郭佳flora:[哈哈] 偶很有兴趣编个征2版本', '@运动戦：[生病] 从此不敢再听“听海”http://t.cn/hBAOka', '11', '@巨人Game', null, null, '2011-04-10 12:47:56', '2011-04-10 12:47:56', '0', '8924000286', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('797', null, '纪总 有史总的  味道了  [哈哈]', '@纪学锋：貌似妒嫉的人还不少，我从不评价其他公司和产品，大家比我好的我都尊重和学习，不认同的也尊重他们的产品和公司。我希望几个发酸的知名公司老大多把心思放在自己产品的研发和运营上，竞争力不在嘴上，用数据来证明自己。攻击别人只会显得自己更狭隘，做老大的都应心胸开阔些。', '11', '@巨人Game', null, null, '2011-04-10 12:51:15', '2011-04-10 12:51:15', '0', '8924159768', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('798', null, '还有5分钟加开的服务器【气贯长虹】就要开了！！！！冲！冲！！冲！！！', '', '10', '@征途2', null, null, '2011-04-10 13:54:57', '2011-04-10 13:54:57', '0', '8927112942', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('799', null, '征途2：想截个征途2官网帖子188888的图，只截到188886的，再刷新就是188900了，泪下！听纪老大说，通过帖子数和内容可以看出一个游戏的人气和现状，独立帖子数超10万就是不错的游戏。去年一年新游戏独立贴超过10万的国产游戏，都活得不错。', '<a href=\'http://ww4.sinaimg.cn/large/64a0c959jw1dg3goyjwokj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/64a0c959jw1dg3goyjwokj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-10 15:56:12', '2011-04-10 15:56:12', '0', '8932030452', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('800', null, '回复@雷蒙黄:场面异常火爆啊~~感谢你的问候，早点回来玩游戏哈 //@雷蒙黄:我在香港问候征途兔', '@征途2：还有5分钟加开的服务器【气贯长虹】就要开了！！！！冲！冲！！冲！！！', '10', '@征途2', null, null, '2011-04-10 15:56:45', '2011-04-10 15:56:45', '0', '8932052744', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('801', null, '征途2论坛主题帖突破18万8千8百8十8条，按制作人纪学锋的分析，征途2未来会活得非常不错！', '@征途2：征途2：想截个征途2官网帖子188888的图，只截到188886的，再刷新就是188900了，泪下！听纪老大说，通过帖子数和内容可以看出一个游戏的人气和现状，独立帖子数超10万就是不错的游戏。去年一年新游戏独立贴超过10万的国产游戏，都活得不错。<a href=\'http://ww4.sinaimg.cn/large/64a0c959jw1dg3goyjwokj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/64a0c959jw1dg3goyjwokj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-10 16:02:54', '2011-04-10 16:02:54', '0', '8932291130', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('802', null, '研发兄弟们熬了3年，为了征途2这个娃，娶媳妇都耽误了。', '@田丰ZT2：周五半夜定下周日加开新区以来，宣传、产品、媒介、设计各部门的兄弟们一直忙到现在，基本没怎么休息，感谢你们[心] ~~~《征途2》有你们这帮兄弟是幸福的[心] 。另外，衷心感谢媒体朋友们的帮助，临时改广告和新闻给你们添麻烦了[握手] 。', '9', '@巨人网络', null, null, '2011-04-10 16:06:18', '2011-04-10 16:06:18', '0', '8932424494', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('803', null, '必须顶，咱们巨人的首轮推广攻势刚开始，好戏在后头 //@巨人刘伟:关键时刻，我还是很大方的[害羞] ，对不？', '@自游劲：17173 被征途包场了，征途2太给力了<a href=\'http://ww4.sinaimg.cn/large/5622efd5jw1dg0vju6r2ij.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5622efd5jw1dg0vju6r2ij.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-10 16:09:45', '2011-04-10 16:09:45', '0', '8932561298', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('804', null, '巨人微博MM瑶瑶：巨人松江总部新园区附近，方圆不超过3公里，开满盛放的油菜花。无图无真相，瑶瑶找时间给大伙儿拍点美图上来。', '', '9', '@巨人网络', null, null, '2011-04-10 16:12:15', '2011-04-10 16:12:15', '0', '8932659936', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('805', null, '刚才公司一员工和我聊创业，问我如何算是领军人物，我和他说：“如果一个人能在宏观上方向对头、目标明确、低调务实；在微观上亲自死抠产品细节、对用户体验细节要求到近乎变态；管理上以身作则、以能服人、以情感人”。那么这样的人值得你追随，如果你自己能做到你就可以自己当老大了。', '', '13', '@纪学锋', null, null, '2011-04-10 17:14:56', '2011-04-10 17:14:56', '0', '8935178508', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('806', null, '转发微博。', '@全球热门排行榜：【低调：是态度，也是智慧】1.别人持才自傲，你却虚怀若谷。2.别人卖弄口才。你却多思慎言。3.别人拼命外显，你却韬光养晦。4.别人你斗我争，你却远离是非。5.别人直来直去，你却融方于圆。6.别人争破头颅，你却以退为进。7.别人拿放不起，你却能屈能伸。8.别人趾高气扬，你却不显不炫。@时尚礼仪顾问<a href=\'http://ww1.sinaimg.cn/large/4aa5b28cjw1dg4gc7jbguj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/4aa5b28cjw1dg4gc7jbguj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-11 12:32:44', '2011-04-11 12:32:44', '0', '8970552773', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('807', null, '巨人微博MM瑶瑶：给大家晒晒我们松江园区员工宿舍的标配哦！除了舒适的床铺以外，还有电视机、洗衣机、冰箱、微波炉、热水器、饮水机等电器一应俱全，真正做到让大家有回家的感觉！', '', '9', '@巨人网络', null, null, '2011-04-11 18:56:49', '2011-04-11 18:56:49', '0', '8987598543', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('808', null, '不会吧？基金这么菜。长期看，长期价值投资赚多亏少，短期投机亏多赚少。', '@新浪证券：如果炒股亏损，不必自责，看看机构：截至3月31日，A股238只通股票型基金一季度平均亏损 了2.5%，整体跑输大盘逾6%，其中亏损的基金达到95只，占比82%；而126只偏股混合型基金平均亏损也为2 .5%，其中亏损的基金达到102只，占比也为82%，跑赢大盘的更是只有1只。via@长盛', '8', '@史玉柱', null, null, '2011-04-12 00:14:15', '2011-04-12 00:14:15', '0', '9004640303', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('809', null, '我要求我自己和我们的团队：学习时眼睛多盯着别人，多看别人做得好的地方，然后学习并努力做得更好；挑毛病的时候多盯着自己，发现自己的不足并改进，忽视别人可能的缺点或不足，这和我们没关系。如果老大和团队总喜欢贬低别人夸大自己，专挑别人的毛病这个团队产品没戏，这个公司也难长久。', '', '13', '@纪学锋', null, null, '2011-04-12 14:54:14', '2011-04-12 14:54:14', '0', '9028205399', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('810', null, '回复@神级贱晟619:有！这个可以有! //@神级贱晟619:[嘻嘻] 不知道我拉我们网会员来玩 有没有新手卡提供呀 //@征途2:回复@雷蒙黄:场面异常火爆啊~~感谢你的问候，早点回来玩游戏哈 //@雷蒙黄:我在香港问候征途兔', '@征途2：还有5分钟加开的服务器【气贯长虹】就要开了！！！！冲！冲！！冲！！！', '10', '@征途2', null, null, '2011-04-12 17:53:53', '2011-04-12 17:53:53', '0', '9035746579', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('811', null, '【史玉柱：拧巴着“出世”】一个屡出奇招的符号式人物应该如何进退于生意和生活，才能获得某种精确的平衡，既不会以败局收场，又不会终生沦为商业的奴隶？最新一期@中国企业家杂志 http://t.cn/hrc3EE', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dg5vco3sfqj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dg5vco3sfqj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-12 17:54:57', '2011-04-12 17:54:57', '0', '9035795307', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('812', null, '今天星期二，兔子上了征途2，当里个当，当里格当，让我们来表表武二郎~~哎呀哎呀，串了串了~~今天上了游戏，偷了某BOSS的菜，大家千万不要告诉丰哥~~嘘~~', '', '10', '@征途2', null, null, '2011-04-12 17:55:02', '2011-04-12 17:55:02', '0', '9035798107', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('813', null, '拧巴是神马意思啊？', '@巨人网络：【史玉柱：拧巴着“出世”】一个屡出奇招的符号式人物应该如何进退于生意和生活，才能获得某种精确的平衡，既不会以败局收场，又不会终生沦为商业的奴隶？最新一期@中国企业家杂志 http://t.cn/hrc3EE<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dg5vco3sfqj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dg5vco3sfqj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-12 18:30:26', '2011-04-12 18:30:26', '0', '9037313911', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('814', null, '[哈哈]', '@一页书殇：征途2   国战<a href=\'http://ww1.sinaimg.cn/large/799ec87bgw1dg635o565tj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/799ec87bgw1dg635o565tj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-12 22:58:20', '2011-04-12 22:58:20', '0', '9050837427', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('815', null, '昨晚饭席间，一朋友说茅台能治感冒，不喝白酒的我立马茅台敬他。酩酊大醉，早上起来，低烧没了，咳嗽加剧。我的人体试验证明：茅台不能治感冒。', '', '8', '@史玉柱', null, null, '2011-04-13 08:56:39', '2011-04-13 08:56:39', '0', '9061210839', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('816', null, '你们太坏了~[偷笑]  //@糖_小夭:恩  。。。  我们都不告诉丰哥是兔子偷了他的菜', '@征途2：今天星期二，兔子上了征途2，当里个当，当里格当，让我们来表表武二郎~~哎呀哎呀，串了串了~~今天上了游戏，偷了某BOSS的菜，大家千万不要告诉丰哥~~嘘~~', '10', '@征途2', null, null, '2011-04-13 12:13:36', '2011-04-13 12:13:36', '0', '9069358106', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('817', null, '史总，要喝黄金酒才治感冒……兔子试过=。-', '@史玉柱：昨晚饭席间，一朋友说茅台能治感冒，不喝白酒的我立马茅台敬他。酩酊大醉，早上起来，低烧没了，咳嗽加剧。我的人体试验证明：茅台不能治感冒。', '10', '@征途2', null, null, '2011-04-13 12:24:20', '2011-04-13 12:24:20', '0', '9069787614', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('818', null, '回复@点点的眼镜光芒四射:哈哈 //@点点的眼镜光芒四射:你家老总整天在微博卖萌…… //@征途2:史总，要喝黄金酒才治感冒……兔子试过=。-', '@史玉柱：昨晚饭席间，一朋友说茅台能治感冒，不喝白酒的我立马茅台敬他。酩酊大醉，早上起来，低烧没了，咳嗽加剧。我的人体试验证明：茅台不能治感冒。', '10', '@征途2', null, null, '2011-04-13 12:26:38', '2011-04-13 12:26:38', '0', '9069883514', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('819', null, '大家想要么？想要你就尖叫~~~~~~兔子一定尽量满足大家 //@风一样流浪:兔子最近很活跃啊，你也不给玩家们谋点福利，想什么贵宾新手卡，什么兔子玩偶神马的，难得都怎么关心你！', '@征途2：还有5分钟加开的服务器【气贯长虹】就要开了！！！！冲！冲！！冲！！！', '10', '@征途2', null, null, '2011-04-13 12:29:24', '2011-04-13 12:29:24', '0', '9070001984', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('820', null, '//@阳中睿:黄金酒好喝不上头，还治疗感冒，想喝让你儿子买去！ //@征途2:史总，要喝黄金酒才治感冒……兔子试过=。-', '@史玉柱：昨晚饭席间，一朋友说茅台能治感冒，不喝白酒的我立马茅台敬他。酩酊大醉，早上起来，低烧没了，咳嗽加剧。我的人体试验证明：茅台不能治感冒。', '10', '@征途2', null, null, '2011-04-13 13:40:50', '2011-04-13 13:40:50', '0', '9073425386', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('821', null, '【第一财经周刊：巨人新征途】《征途2》是巨人新赌注，试图再次依靠一种全新的经济系统出奇制胜。它想要逐渐褪去以深刻洞察人性需求著称的史玉柱的个人风格，将卖“设备”获得收入转为“手续费”获得收入，希望吸引更多普通玩家。这次巨人能够走多远？http://t.cn/hrJYPy @第一财经周刊  @谢灵宁', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dg6ynaav26j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dg6ynaav26j.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-13 16:39:32', '2011-04-13 16:39:32', '0', '9080311154', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('822', null, '转发微博。', '@巨人网络：【第一财经周刊：巨人新征途】《征途2》是巨人新赌注，试图再次依靠一种全新的经济系统出奇制胜。它想要逐渐褪去以深刻洞察人性需求著称的史玉柱的个人风格，将卖“设备”获得收入转为“手续费”获得收入，希望吸引更多普通玩家。这次巨人能够走多远？http://t.cn/hrJYPy @第一财经周刊  @谢灵宁<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dg6ynaav26j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dg6ynaav26j.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-13 16:44:42', '2011-04-13 16:44:42', '0', '9080526204', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('823', null, '转发微博。', '@巨人网络：【史玉柱：拧巴着“出世”】一个屡出奇招的符号式人物应该如何进退于生意和生活，才能获得某种精确的平衡，既不会以败局收场，又不会终生沦为商业的奴隶？最新一期@中国企业家杂志 http://t.cn/hrc3EE<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dg5vco3sfqj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dg5vco3sfqj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-13 16:44:48', '2011-04-13 16:44:48', '0', '9080530542', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('824', null, '就差一个妹子了~~~~', '@巨人网络：巨人微博MM瑶瑶：给大家晒晒我们松江园区员工宿舍的标配哦！除了舒适的床铺以外，还有电视机、洗衣机、冰箱、微波炉、热水器、饮水机等电器一应俱全，真正做到让大家有回家的感觉！', '10', '@征途2', null, null, '2011-04-13 16:45:30', '2011-04-13 16:45:30', '0', '9080558392', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('825', null, '//@淡墨zt:一样的征途2，不一样的玩法，或热衷PK，或倾心偷菜，或专注于繁殖玄兽，又或埋头任务全心全意冲级…   我比较懒，怕做任务又看重等级，喜欢PK偏偏武艺不精，想加入偷菜大军却无奈总是慢别人半拍，心血来潮钻进仙兽谷，一小时只成功捕获两只孙猴子… 不过即便这样也依然乐在其中，哈哈哈', '@战陀的围脖：征途2#微测评# 在《征途2》中,有这样的一帮人,天天守在庄园入口,每当系统提示哪家紫菜熟了,就立即投入工作当中,而这帮庞大而行踪诡秘的群体被一些人称为“偷菜一族”,平日神龙见首不见尾,关键时候从不缺席，最讨厌偷菜一族了，我的菜总是去收的时候都么有了。', '13', '@纪学锋', null, null, '2011-04-13 17:53:37', '2011-04-13 17:53:37', '0', '9083143554', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('826', null, '兔子一个月没回家了，这个礼拜必须回家陪陪爸妈，大家也记得常回家看看哦。', '<a href=\'http://ww4.sinaimg.cn/large/64a0c959jw1dg71wg6yykj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/64a0c959jw1dg71wg6yykj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-13 18:27:02', '2011-04-13 18:27:02', '0', '9084220467', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('827', null, '任志强说：“华远地产股东大会决定给我年薪700多万，但国资委不同意我拿那么多，每年只给我60多万，去年奖励我5万元，是74万”。任总被退职后，可以专心讨薪维权啦，哈哈。http://t.cn/hrXDWc', '', '8', '@史玉柱', null, null, '2011-04-14 13:06:23', '2011-04-14 13:06:23', '0', '9120743665', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('828', null, '转发微博。', '@征途2：兔子一个月没回家了，这个礼拜必须回家陪陪爸妈，大家也记得常回家看看哦。<a href=\'http://ww4.sinaimg.cn/large/64a0c959jw1dg71wg6yykj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/64a0c959jw1dg71wg6yykj.jpg\' class=\'thumbNailPic\'></a>', '15', '@关注巨人', null, null, '2011-04-14 15:34:37', '2011-04-14 15:34:37', '0', '9127419251', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('829', null, '这要感谢我们运营推广团队的创意，也要感谢我们地推团队的敬业，这次我们团队做的还可以。//@Toky珲:广告创意不错！！！不过~~~贴的人更有才~', '@猫片：中午出去买东西，发现了@征途2  的海报，开始以为是公安局的什么悬赏，走近一看竟然是网游，虽然做的思路还是有山寨感，但还是感觉很厉害：1.能在珠海这种小地方看见@征途2，2.能让一个人的注意力吸引10秒左右，无论广告创意如何，它都成功了。@纪学锋 ，你们很强~<a href=\'http://ww3.sinaimg.cn/large/67584be3gw1dg7ys4ugbwj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/67584be3gw1dg7ys4ugbwj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-14 16:01:28', '2011-04-14 16:01:28', '0', '9128568313', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('830', null, '喜欢是淡淡的爱，爱是深深的喜欢//@麻贵-:让我想起征途2中的一句话：“喜欢是淡淡的爱，爱是深深的喜欢” //@李一鸣Fisher:给自己的伴侣更多美好的回忆！', '@当时我震惊了：12岁澳洲小朋友克拉克，骑车送报结识了小女孩琼，两人长大后相爱结婚。62年过去，克拉克已是74岁高龄，妻子患上了老年失忆症，甚至不再认识丈夫，却仍然记得少女时代的青涩往事。于是克拉克老头蹬起自行车，成为了澳洲年纪最老的送报人，让爱妻仍然生活在小女孩时代的甜蜜梦境中。<a href=\'http://ww1.sinaimg.cn/large/620626d0jw1dg6mqlayiwj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/620626d0jw1dg6mqlayiwj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-14 16:16:02', '2011-04-14 16:16:02', '0', '9129192429', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('831', null, '知人不必言尽，留三分余地与人，留些口德与己；责人不必苛尽，留三分余地与人，留些肚量与己；才能不必傲尽，留三分余地与人，留些内涵与己；锋芒不必露尽，留三分余地与人，留些深敛与己；有功不必邀尽，留三分余地与人，留些谦让与己；得理不必抢尽，留三分余地与人，留些宽和与己。---努力做到！', '', '13', '@纪学锋', null, null, '2011-04-14 16:56:49', '2011-04-14 16:56:49', '0', '9131012757', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('832', null, '#分享照片#兔子骑摩托~~~~帅不帅？！你只要回答：帅！就行了！', '<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg87dfgxbvj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg87dfgxbvj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-14 18:21:29', '2011-04-14 18:21:29', '0', '9134802447', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('833', null, '//@宋仕良:这创意确实不错[good]  //@纪学锋:这要感谢我们运营推广团队的创意，也要感谢我们地推团队的敬业，这次我们团队做的还可以。//@Toky珲:广告创意不错！！！不过~~~贴的人更有才~', '@猫片：中午出去买东西，发现了@征途2  的海报，开始以为是公安局的什么悬赏，走近一看竟然是网游，虽然做的思路还是有山寨感，但还是感觉很厉害：1.能在珠海这种小地方看见@征途2，2.能让一个人的注意力吸引10秒左右，无论广告创意如何，它都成功了。@纪学锋 ，你们很强~<a href=\'http://ww3.sinaimg.cn/large/67584be3gw1dg7ys4ugbwj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/67584be3gw1dg7ys4ugbwj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-14 18:23:58', '2011-04-14 18:23:58', '0', '9134911415', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('834', null, '回复@梁冰0115:这……[害羞] 可不能被你老公发现，哈哈。 //@梁冰0115:兔子啊，我昨天晚上竟然梦见你了，虽然没见过你，但那帅哥亲口告诉我是征途兔 //@征途2:大家想要么？想要你就尖叫~~~~~~兔子一定尽量满足大家', '@征途2：还有5分钟加开的服务器【气贯长虹】就要开了！！！！冲！冲！！冲！！！', '10', '@征途2', null, null, '2011-04-14 18:28:34', '2011-04-14 18:28:34', '0', '9135118533', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('835', null, '回复@假日季星:你是妹子就要~~嘿嘿 //@假日季星:转发此微博:还要人不？//@征途2:就差一个妹子了~~~~ //@征途2:就差一个妹子了~~~~', '@巨人网络：巨人微博MM瑶瑶：给大家晒晒我们松江园区员工宿舍的标配哦！除了舒适的床铺以外，还有电视机、洗衣机、冰箱、微波炉、热水器、饮水机等电器一应俱全，真正做到让大家有回家的感觉！', '10', '@征途2', null, null, '2011-04-14 18:28:46', '2011-04-14 18:28:46', '0', '9135126363', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('836', null, '回复@刘玉莺:哈哈，你猜~~[害羞] //@刘玉莺:差什么样子的妹子喃，说说大家帮你参考下…… //@征途2:就差一个妹子了~~~~', '@巨人网络：巨人微博MM瑶瑶：给大家晒晒我们松江园区员工宿舍的标配哦！除了舒适的床铺以外，还有电视机、洗衣机、冰箱、微波炉、热水器、饮水机等电器一应俱全，真正做到让大家有回家的感觉！', '10', '@征途2', null, null, '2011-04-14 18:30:01', '2011-04-14 18:30:01', '0', '9135184493', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('837', null, '//@纪学锋://@淡墨zt:一样的征途2，不一样的玩法，或热衷PK，或倾心偷菜，或专注于繁殖玄兽，又或埋头任务全心全意冲级…   我比较懒，怕做任务又看重等级，喜欢PK偏偏武艺不精，想加入偷菜大军却无奈总是慢别人半拍，心血来潮钻进仙兽谷，一小时只成功捕获两只孙猴子… 不过即便这样也依然乐在其中，', '@战陀的围脖：征途2#微测评# 在《征途2》中,有这样的一帮人,天天守在庄园入口,每当系统提示哪家紫菜熟了,就立即投入工作当中,而这帮庞大而行踪诡秘的群体被一些人称为“偷菜一族”,平日神龙见首不见尾,关键时候从不缺席，最讨厌偷菜一族了，我的菜总是去收的时候都么有了。', '10', '@征途2', null, null, '2011-04-14 18:42:02', '2011-04-14 18:42:02', '0', '9135734557', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('838', null, '一起加油，努力！兔子与你共勉', '@一九九一月神：玩@征途2 看到李商隐的《锦瑟》，感慨，锦瑟无题胜有题，人生又何德何能，小李诗才又如何，自叹人生不逢时而已<a href=\'http://ww1.sinaimg.cn/large/6c807e9ftw1dg87ozwqkmj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6c807e9ftw1dg87ozwqkmj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-14 18:45:17', '2011-04-14 18:45:17', '0', '9135884597', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('839', null, '哈哈哈，你太坏了 //@糖_小夭:帅[泪] 。。。。。。。。太委屈人了[泪]', '@征途2：#分享照片#兔子骑摩托~~~~帅不帅？！你只要回答：帅！就行了！<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dg87dfgxbvj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dg87dfgxbvj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-14 18:54:25', '2011-04-14 18:54:25', '0', '9136304615', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('840', null, '前不久，巨人网络“无处不篮球”篮球挑战赛在松江园区的篮球场火热开赛！卧虎队和藏龙队展开了一番厮杀，两队实力相当，比分始终咬得很近，场上场下气氛几度high到极点，最终，卧虎队以27:23的微弱优势获胜，全场MVP还获得了惊喜大奖手机一部。', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dg88e8s3jmj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dg88e8s3jmj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-14 18:56:53', '2011-04-14 18:56:53', '0', '9136420059', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('841', null, '虽然失恋不久，可充实的工作没有让兔子迷失自我。还没来得及悲伤，兔子已经从阴影中走了出来，放一首分手快乐，然后继续在空无一人的办公室，打拼着自己的未来。凌晨2：38，兔子加班随笔。', '', '10', '@征途2', null, null, '2011-04-15 02:40:48', '2011-04-15 02:40:48', '0', '9156052173', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('842', null, '转发微博。', '@田丰ZT2：抬头一看，已经是周五凌晨了，兄弟们依然在热烈的讨论着新功能，我不得不命令他们：再不回去休息，就扣奖金！今天下午17点又要开新区了！每次新区我都想唱忐忑……开区各个环节检查了一遍又一遍，嗯，明天起来还要检查三遍！', '10', '@征途2', null, null, '2011-04-15 02:41:05', '2011-04-15 02:41:05', '0', '9156054281', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('843', null, '还是吃点什么吧。。。', '@懒得理人ing：整玩了三小时的征途2,一点都不饿。', '10', '@征途2', null, null, '2011-04-15 02:59:52', '2011-04-15 02:59:52', '0', '9156185537', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('844', null, '小时候，我与马云的差距：他爱打架，我不敢打架。http://t.cn/hraRSt', '', '8', '@史玉柱', null, null, '2011-04-15 08:06:05', '2011-04-15 08:06:05', '0', '9158748767', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('845', null, '回复@崔小米middy:[哈哈] //@崔小米middy:是那只可爱的不吃胡萝卜的兔子麻？干吧爹！', '@征途2：虽然失恋不久，可充实的工作没有让兔子迷失自我。还没来得及悲伤，兔子已经从阴影中走了出来，放一首分手快乐，然后继续在空无一人的办公室，打拼着自己的未来。凌晨2：38，兔子加班随笔。', '10', '@征途2', null, null, '2011-04-15 10:17:12', '2011-04-15 10:17:12', '0', '9163998235', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('846', null, '回复@语千YukiQ:把征途2打开~~ //@语千YukiQ:小兔子乖乖！[兔子]', '@征途2：虽然失恋不久，可充实的工作没有让兔子迷失自我。还没来得及悲伤，兔子已经从阴影中走了出来，放一首分手快乐，然后继续在空无一人的办公室，打拼着自己的未来。凌晨2：38，兔子加班随笔。', '10', '@征途2', null, null, '2011-04-15 10:21:47', '2011-04-15 10:21:47', '0', '9164215445', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('847', null, '一穿着超短裙的美女同事跑到兔子身边悄悄的说：兔百万，我今天没穿裤子哦……兔子噗的一下，一口血喷在显示器上……大清早的，要不要这么勾引兔子啊！！', '', '10', '@征途2', null, null, '2011-04-15 11:01:47', '2011-04-15 11:01:47', '0', '9166122865', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('848', null, '回复@崔小米middy:=。-哈哈 你可以送给兔子。。 //@崔小米middy:。。。昨天拿到一个生肖挂件，我一看是鸡，和本人不符，想送给合适的人，于是大叫：谁是鸡啊，这里谁是鸡啊？？事后心想，幸好没人回答我。。。', '@征途2：一穿着超短裙的美女同事跑到兔子身边悄悄的说：兔百万，我今天没穿裤子哦……兔子噗的一下，一口血喷在显示器上……大清早的，要不要这么勾引兔子啊！！', '10', '@征途2', null, null, '2011-04-15 11:14:38', '2011-04-15 11:14:38', '0', '9166734417', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('849', null, '还是要让大家多休息，必须地，今天我监督[酷]', '@田丰ZT2：凌晨1点多，兄弟们依然在热烈的讨论着新功能，我命令兄弟们赶紧睡去，有个哥们居然说：“丰哥，别担心，我们不会过劳死的，最多就是兴奋死……”NND，大半夜的，兴奋啥啊，不就是要开两个区嘛。兴奋，或者不兴奋，人数就在那里，只增不减！大家要注意休息哈，咱们虽然是IT民工，但也要注意自己的身体！', '13', '@纪学锋', null, null, '2011-04-15 11:38:48', '2011-04-15 11:38:48', '0', '9167815835', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('850', null, '靠，谁！谁把我的照片放出来的！！被兔肉搜索了~~NND //@语千YukiQ:@征途2 兔兔，这个是你的亲戚吧！(*^__^*) 嘻嘻……', '@冷笑话精选：生活就是要这种态度，牙再大，也要笑！哈哈[哈哈] (@微博冷笑话段子 投稿)<a href=\'http://ww3.sinaimg.cn/large/62037b5ajw1dg976cnbwhj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/62037b5ajw1dg976cnbwhj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-15 15:58:40', '2011-04-15 15:58:40', '0', '9174320980', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('851', null, '平平淡淡才是真！', '', '13', '@纪学锋', null, null, '2011-04-15 16:34:17', '2011-04-15 16:34:17', '0', '9175166425', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('852', null, '17点，两大内测新区即将震撼开启： 电信：【锦绣河山】 网通：【碧海晴天】 赶紧的！！！冲啊！！！！！！！！！', '', '10', '@征途2', null, null, '2011-04-15 16:58:11', '2011-04-15 16:58:11', '0', '9175748680', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('853', null, '前天，上海交通大学师生组团前来参观巨人园区，同学们表示对于巨人新园区的超现代设计早有耳闻。园区的主建筑“巨龙”在全球建筑业享有较高盛誉，此前也多次有海内外专家前来参观。主建筑的设计师曾获得建筑界最高奖项--普里茨克奖，向来以大胆、创新的风格著称。', '<a href=\'http://ww1.sinaimg.cn/large/6232cd9ajw1dg9ann4e0zj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6232cd9ajw1dg9ann4e0zj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-15 17:00:47', '2011-04-15 17:00:47', '0', '9175812091', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('854', null, '“第64届戛纳电影节,华语片再度无缘入围”，真的假的？太小看中国人了吧。http://t.cn/hrHfVY', '', '8', '@史玉柱', null, null, '2011-04-16 16:37:53', '2011-04-16 16:37:53', '0', '9207984708', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('855', null, '好看是好看，但花期太短了，我家院子那个1个星期前开的，现在已经都凋落了。 //@倪德猛:转发微博。', '@刘大鸿：花开富贵，见者富贵！祝大家都富贵！<a href=\'http://ww3.sinaimg.cn/large/63ee4d1fjw1dgagti2am8j.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/63ee4d1fjw1dgagti2am8j.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-16 17:29:13', '2011-04-16 17:29:13', '0', '9210148588', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('856', null, '//@微博搞笑排行榜:懂得选择，学会放弃，耐得住寂寞，经得起诱惑。', '@收录唯美图片：人生四项基本原则：懂得选择，学会放弃，耐得住寂寞，经得起诱惑。<a href=\'http://ww3.sinaimg.cn/large/6b6e567cgw6df2eth3wp3j.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6b6e567cgw6df2eth3wp3j.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-16 21:50:38', '2011-04-16 21:50:38', '0', '9222749082', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('857', null, '刚加完息，央行今天又加准备金，看来CPI还在上升通道中。', '', '8', '@史玉柱', null, null, '2011-04-17 23:24:43', '2011-04-17 23:24:43', '0', '9278370088', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('858', null, '这么多，什么活动啊？', '@兰小丫頭：收到的征途2的周边…<a href=\'http://ww1.sinaimg.cn/large/723feb69jw1dgchbhycwwj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/723feb69jw1dgchbhycwwj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-18 13:52:17', '2011-04-18 13:52:17', '0', '9299455462', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('859', null, '惊叹！大自然的鬼斧神工！', '@当时我震惊了：【美轮美奂的自然现象】 大自然的鬼斧神工常令我辈凡人目瞪口呆，造物主才是最伟大的创意天才。看完这组照片，希望你会更爱这个绚丽多姿的世界。（来自@华夏地理）<a href=\'http://ww1.sinaimg.cn/large/620626d0jw1dgcicam332j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/620626d0jw1dgcicam332j.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-18 16:46:09', '2011-04-18 16:46:09', '0', '9306215652', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('860', null, '[偷笑]', '@朱威廉：你戴一副Gucci墨镜，不时地挥动左手以提醒Chopard手表和Cartier钻戒的存在。你在交谈中没忘记用Vertu拨出几通电话，LV裤子的惟一缺点是商标不够明显，不过那只翘在二郎腿上的Bally皮鞋却无所遁形。这一切都看似雍容华贵、完美无缺。但我想问的是，你为何不遮掩刻在你额头上的那两个大字：傻逼', '13', '@纪学锋', null, null, '2011-04-18 20:27:52', '2011-04-18 20:27:52', '0', '9315784498', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('861', null, '其实就是管理能力和执行力，确实这是你的强项，同时你的点子也不少，继续加油吧！[嘻嘻]', '@田丰ZT2：上周末跟一位同事聊天，我总结了在征途2这样一个大团队里，我起到了什么样的作用：1、确保团队长期团结、激情、有创造力和战斗力，重点在长期；2、确保游戏开发不偏离方向，制作人（纪学锋）的想法可以被团队理解、接受，并得到有效实现。除了这2点，我也只能陪兄弟们熬熬夜了[咖啡] ，呵呵。', '13', '@纪学锋', null, null, '2011-04-19 00:54:56', '2011-04-19 00:54:56', '0', '9328906342', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('862', null, '征途2发布会上，这帮混小子恶搞我，我的紫砂壶长得不是这样子嗒。', '<a href=\'http://ww1.sinaimg.cn/large/638b4670tw1dgd70qjpm4j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670tw1dgd70qjpm4j.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-19 01:59:35', '2011-04-19 01:59:35', '0', '9329767790', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('863', null, '凌晨4点15分，兔子依然在……在官网上看见这句话，很喜欢，与大家共勉：生活是个大游戏，我们要学会的不仅仅是练级……', '', '10', '@征途2', null, null, '2011-04-19 04:17:02', '2011-04-19 04:17:02', '0', '9330512992', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('864', null, '[哈哈]', '@史玉柱：征途2发布会上，这帮混小子恶搞我，我的紫砂壶长得不是这样子嗒。<a href=\'http://ww1.sinaimg.cn/large/638b4670tw1dgd70qjpm4j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670tw1dgd70qjpm4j.jpg\' class=\'thumbNailPic\'></a>', '11', '@巨人Game', null, null, '2011-04-19 08:47:23', '2011-04-19 08:47:23', '0', '9333580288', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('865', null, '[嘻嘻] ，那天我看到这个笑晕了，我们营销团队就是胆大！', '@史玉柱：征途2发布会上，这帮混小子恶搞我，我的紫砂壶长得不是这样子嗒。<a href=\'http://ww1.sinaimg.cn/large/638b4670tw1dgd70qjpm4j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670tw1dgd70qjpm4j.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-19 11:15:37', '2011-04-19 11:15:37', '0', '9339694638', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('866', null, '前不久，中科大“巨人网络杯电子竞技大赛”拉开战幕，经过两场5V5比赛以及一场单中对决后，决赛的冠军最终产生。在活动过程中，赞助方巨人网络在和同学们的交流中透露了公司选“才”标准：对游戏有自己的理解或者能自主开发，还需要具备“刻苦钻研，善于沟通，团队合作，不惧压力”这些特质。', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dgdtwr3iu9j.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dgdtwr3iu9j.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-19 15:09:45', '2011-04-19 15:09:45', '0', '9350170356', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('867', null, '以后会多赞助这个，在大学那会儿搞个活动拉个赞助好难哦！ //@汤敏:转发微博。', '@巨人网络：前不久，中科大“巨人网络杯电子竞技大赛”拉开战幕，经过两场5V5比赛以及一场单中对决后，决赛的冠军最终产生。在活动过程中，赞助方巨人网络在和同学们的交流中透露了公司选“才”标准：对游戏有自己的理解或者能自主开发，还需要具备“刻苦钻研，善于沟通，团队合作，不惧压力”这些特质。<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dgdtwr3iu9j.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dgdtwr3iu9j.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-19 15:18:40', '2011-04-19 15:18:40', '0', '9350519128', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('868', null, '开光影后好像更有意境。', '@朢見：征途2里面的摘抄。<a href=\'http://ww4.sinaimg.cn/large/59d1f606jw1dgdwkknvfgj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/59d1f606jw1dgdwkknvfgj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-19 18:33:28', '2011-04-19 18:33:28', '0', '9358787712', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('869', null, '确实不容易 //@庞升东:谢霆锋也是一路拼命过来的，真不容易！  //@环球经典:霆锋和霆锋的家庭一路走来不容易！', '@潮英语：#香港电影~金像奖# 最感人一幕：谢霆锋在台上说：“谢谢太太今晚陪我来。”张柏芝在台下已经哭红双眼。谢霆锋又对爸爸说：“请你原谅这么麻烦的一个小孩，你养大了他，你才是最佳男主角！” 观众动容。 I LOVE YOU<a href=\'http://ww4.sinaimg.cn/large/6ed8a358jw1dgcr2wdckrj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6ed8a358jw1dgcr2wdckrj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-19 19:10:42', '2011-04-19 19:10:42', '0', '9360379280', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('870', null, '我好崇拜我，我刚刚成功忽悠没剃过光头的柳传志向我学习，剃个大光头！！！！！有木有！！！！有木有！！！', '<a href=\'http://ww4.sinaimg.cn/large/638b4670jw1dge2rz7gigj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw1dge2rz7gigj.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-19 20:15:50', '2011-04-19 20:15:50', '0', '9363350270', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('871', null, '兔子下次也去剃个光头，和史总比比看谁的亮~~哼哼~·', '@史玉柱：我好崇拜我，我刚刚成功忽悠没剃过光头的柳传志向我学习，剃个大光头！！！！！有木有！！！！有木有！！！<a href=\'http://ww4.sinaimg.cn/large/638b4670jw1dge2rz7gigj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw1dge2rz7gigj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-19 20:27:18', '2011-04-19 20:27:18', '0', '9363901824', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('872', null, '哈哈~~//@假日季星:恩恩，还要学会承受眼睁睁看着BOSS被别人刷了痛苦[兔子]', '@征途2：凌晨4点15分，兔子依然在……在官网上看见这句话，很喜欢，与大家共勉：生活是个大游戏，我们要学会的不仅仅是练级……', '10', '@征途2', null, null, '2011-04-19 20:29:22', '2011-04-19 20:29:22', '0', '9364001034', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('873', null, '回复@梁冰0115:哈哈 这个必须有~~ //@梁冰0115:[害羞] 还要学会泡妞。', '@征途2：凌晨4点15分，兔子依然在……在官网上看见这句话，很喜欢，与大家共勉：生活是个大游戏，我们要学会的不仅仅是练级……', '10', '@征途2', null, null, '2011-04-19 20:29:57', '2011-04-19 20:29:57', '0', '9364029116', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('874', null, '转发微博。', '@史玉柱：我好崇拜我，我刚刚成功忽悠没剃过光头的柳传志向我学习，剃个大光头！！！！！有木有！！！！有木有！！！<a href=\'http://ww4.sinaimg.cn/large/638b4670jw1dge2rz7gigj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw1dge2rz7gigj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-19 20:52:58', '2011-04-19 20:52:58', '0', '9365175188', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('875', null, '柳总剃完光头，和2个罪魁忽悠大坏蛋合影纪个念。细细一瞧，老柳还真有些佛缘。', '<a href=\'http://ww1.sinaimg.cn/large/638b4670tw1dge5d8sf4ej.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670tw1dge5d8sf4ej.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-19 21:51:24', '2011-04-19 21:51:24', '0', '9368377528', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('876', null, '柳总面相确实和佛家有缘[呵呵]', '@史玉柱：柳总剃完光头，和2个罪魁忽悠大坏蛋合影纪个念。细细一瞧，老柳还真有些佛缘。<a href=\'http://ww1.sinaimg.cn/large/638b4670tw1dge5d8sf4ej.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670tw1dge5d8sf4ej.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-19 22:28:10', '2011-04-19 22:28:10', '0', '9370599972', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('877', null, '一个人很难改变一个环境，但是一个环境可以改变一个人。做老大的要尽量营造一种氛围、一种环境，给大家自由发表自己创造力和话语权的空间，同时要牢牢抓好执行力。一个团队会通过自己的产品把团队的氛围传递给自己的用户，团队是朝气蓬勃的还是死气沉沉的？你的用户通过你的产品会感受到。', '', '13', '@纪学锋', '7', '关注巨人', '2011-04-20 00:00:57', '2011-04-20 10:53:10', '0', '9375499890', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('878', null, '哈哈', '@冷笑话精选:上班途中，有一人在车厢里睡着了。突然其手机响起：“启奏皇上，有一刁民求见，是接了还是斩了。。”顿时，地铁里鸦雀无声。。。(@创意趣闻 投稿)<a href=\'http://ww3.sinaimg.cn/large/62037b5ajw1dgevyhnxstj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/62037b5ajw1dgevyhnxstj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-20 13:12:24', '2011-04-20 13:12:24', '0', '9393634732', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('879', null, '付出不一定马上就有回报，但是持续的付出一定会有回报。有的时候成功就在我们面前，只不过中间隔了一层纸，而自己却以为是一堵墙，其实只要再坚持一下，前进一步就能达到目标。----看一个同行写游戏行业后有感而发。', '', '13', '@纪学锋', null, null, '2011-04-20 15:14:37', '2011-04-20 15:14:37', '0', '9398791604', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('880', null, '巨人微博MM瑶瑶：公司一年一度的员工体检又开始啦，虽然平时工作很忙碌，但是大家也要时刻关注自己的健康哦，身体才是革命的本钱嘛。不过想到体检抽血要被针扎，瑶瑶表示鸭梨很大。', '', '9', '@巨人网络', null, null, '2011-04-20 18:55:59', '2011-04-20 18:55:59', '0', '9408524294', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('881', null, '快被扎针时，用指甲掐自己，能分散扎针的痛感。掐得痛是自己能控制的，没恐惧感；扎针的痛自己无法控制，会有恐惧感。这方法我屡试不爽，哈哈。', '@巨人网络:巨人微博MM瑶瑶：公司一年一度的员工体检又开始啦，虽然平时工作很忙碌，但是大家也要时刻关注自己的健康哦，身体才是革命的本钱嘛。不过想到体检抽血要被针扎，瑶瑶表示鸭梨很大。', '8', '@史玉柱', null, null, '2011-04-21 03:06:57', '2011-04-21 03:06:57', '0', '9427657418', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('882', null, '呵呵', '@史玉柱:柳总剃完光头，和2个罪魁忽悠大坏蛋合影纪个念。细细一瞧，老柳还真有些佛缘。<a href=\'http://ww1.sinaimg.cn/large/638b4670tw1dge5d8sf4ej.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670tw1dge5d8sf4ej.jpg\' class=\'thumbNailPic\'></a>', '11', '@巨人Game', null, null, '2011-04-21 10:15:52', '2011-04-21 10:15:52', '0', '9434366746', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('883', null, '巨人网络已成立一家名为浩基网络的全新子公司，主攻网页游戏市场。该子公司首款面向国内市场的网页游戏《绒绒大战》已进入深度研发阶段，有望在近期推向市场。http://t.cn/hdcAVq', '<a href=\'http://ww1.sinaimg.cn/large/6232cd9ajw1dgfz0nw08jj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6232cd9ajw1dgfz0nw08jj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-21 11:37:21', '2011-04-21 11:37:21', '0', '9437994898', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('884', null, '要注意和工作平衡好啊，游戏只是一个娱乐而已', '@JUno5_:迷上了征途2，开始不务正业了。囧啊~@征途2', '13', '@纪学锋', null, null, '2011-04-21 11:54:52', '2011-04-21 11:54:52', '0', '9438745036', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('885', null, '确实，在这个小天地里我们公司从无到有，到发展，那里留下了太多的记忆！！！', '@汤敏:打包封箱、装车送货,公司部分员工明天要搬进新办公楼了。桂林路的办公楼,应该永远不会再回,但以后路过,一定会感慨万千。。。。', '13', '@纪学锋', null, null, '2011-04-21 14:52:50', '2011-04-21 14:52:50', '0', '9446816100', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('886', null, '[钟]  //@郑铖鑫:还记得那天楼上墙上NYSE的画面，楼下汤总开香槟。。时光飞逝，我们挥洒的青春还在征途上！ //@汤敏:回复@纪学锋:是啊，虽然破旧点，但有太多的记忆[咖啡] //@纪学锋:确实，在这个小天地里我们公司从无到有，到发展，那里留下了太多的记忆！！！', '@汤敏:打包封箱、装车送货,公司部分员工明天要搬进新办公楼了。桂林路的办公楼,应该永远不会再回,但以后路过,一定会感慨万千。。。。', '13', '@纪学锋', null, null, '2011-04-21 15:02:37', '2011-04-21 15:02:37', '0', '9447216354', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('887', null, '努力中。。。。。。', '@雷蒙黄:淘宝一周虚拟交易排行榜  装备成交排行榜 征途2 第3  游戏币成交排行榜 征途2 第3 一周淘宝账号交易排行榜 征途2第9  看来@征途2 非常火爆 兔子要多加油 还有要让促进这些交易在系统内完成 http://t.cn/hdbNnh', '13', '@纪学锋', null, null, '2011-04-21 15:38:12', '2011-04-21 15:38:12', '0', '9448651886', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('888', null, '这也行？过两天体检的时候试试。//@史玉柱:快被扎针时，用指甲掐自己，能分散扎针的痛感。掐得痛是自己能控制的，没恐惧感；扎针的痛自己无法控制，会有恐惧感。这方法我屡试不爽，哈哈。', '@巨人网络:巨人微博MM瑶瑶：公司一年一度的员工体检又开始啦，虽然平时工作很忙碌，但是大家也要时刻关注自己的健康哦，身体才是革命的本钱嘛。不过想到体检抽血要被针扎，瑶瑶表示鸭梨很大。', '13', '@纪学锋', null, null, '2011-04-21 16:08:53', '2011-04-21 16:08:53', '0', '9449947480', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('889', null, '恭喜曾经的巨人员工，现在巨人的家属邹鹏。其导演的电影，是入围戛纳电影节唯一的华语片。 //@期待电影:转发微博', '@赵静静赵:中国导演邹鹏凭借香港公司出品的《嫦娥》入围戛纳“影评人周”单元，成华语电影参赛戛纳的唯一代表。与其处女作《东北东北》相似，《嫦娥》又是一部充满地域文化的影片。该片聚焦于中国改革开放的前沿珠海：有人离开，有人误入歧途，有人寻找明天…邹鹏对其入围很意外，称能代表华语片走出去很开心。<a href=\'http://ww2.sinaimg.cn/large/61e42599tw1dgfv5wg0c3j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/61e42599tw1dgfv5wg0c3j.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-21 17:57:00', '2011-04-21 17:57:00', '0', '9454718778', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('890', null, '成功入围今年戛纳电影节唯一的华语电影《嫦娥》的青年导演邹鹏，是巨人集团总裁刘伟的老公。哈哈，我是娱乐八卦小报狗仔队队员。', '', '8', '@史玉柱', null, null, '2011-04-21 18:22:20', '2011-04-21 18:22:20', '0', '9455812978', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('891', null, '桂林路虽说简朴了点儿，但是我们巨人网络的福地啊，还会一直保有这个福地的。 //@纪学锋: 确实，在这个小天地里我们公司从无到有，到发展，那里留下了太多的记忆！！！', '@汤敏:打包封箱、装车送货,公司部分员工明天要搬进新办公楼了。桂林路的办公楼,应该永远不会再回,但以后路过,一定会感慨万千。。。。', '17', '@巨人刘伟', null, null, '2011-04-21 20:21:42', '2011-04-21 20:21:42', '0', '9461259201', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('892', null, '[嘻嘻]', '@史玉柱:成功入围今年戛纳电影节唯一的华语电影《嫦娥》的青年导演邹鹏，是巨人集团总裁刘伟的老公。哈哈，我是娱乐八卦小报狗仔队队员。', '13', '@纪学锋', null, null, '2011-04-21 21:25:55', '2011-04-21 21:25:55', '0', '9464586874', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('893', null, '看到很多史总粉丝让史总上刘总和她老公照片，我就上一张。可惜是背影还是远景。这可是真正的狗仔队偷拍。哈哈。照片是某日中午在巨人园区食堂饭后刘总和老公走在我前面，看着特般配，故偷拍照片一张。', '<a href=\'http://ww1.sinaimg.cn/large/64651a16jw1dgggd6bgt2j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64651a16jw1dgggd6bgt2j.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-21 21:37:07', '2011-04-21 21:37:07', '0', '9465192249', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('894', null, 'sony确实不错，但我对日本不感冒哈，对产品不对人[酷]', '@落叶道:昨天去了星光，冲着GF2去的，因为只有黑色的，又不想白跑一趟，所以入了个NEX-5C，反正老公是忠实的sony迷。打算花一天时间研究下。', '13', '@纪学锋', null, null, '2011-04-21 22:10:42', '2011-04-21 22:10:42', '0', '9467126276', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('895', null, '这些砖家怎么什么事情都能用来诋毁下自己国家，什么心态...... //@丁国强:跟应试教育有P关系，谁不是这样过来的。这难道可以成为捅人8刀的理由？', '@郑渊洁:判药家鑫死刑，相当于也判了应试教育死刑。你同意我这句话吗？<a href=\'http://ww1.sinaimg.cn/large/473abae6jw1dgg6kidv9xj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/473abae6jw1dgg6kidv9xj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-21 22:34:35', '2011-04-21 22:34:35', '0', '9468561076', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('896', null, '恩，帅锅，鉴定完毕！ //@江南春: 瘦身成功形象超帅@曹国伟  //@老沉:[赞]', '@芭莎男士:恭喜“厂长”曹国伟成为美国《时代》周刊2011年度全球最具影响力人物，同时登上《芭莎男士》5月号封面！ 全新封面首次曝光！5月2日上市，大家等着看吧！@时尚芭莎@老沉@曹国伟@景璐BAZAAR@HaoNing@芭莎艺术<a href=\'http://ww2.sinaimg.cn/large/6332d38fjw1dgggn9h0jtj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6332d38fjw1dgggn9h0jtj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-22 03:38:24', '2011-04-22 03:38:24', '0', '9476966707', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('897', null, '这位老板 真实诚，呵呵//@江南春: 我也怕药加薪的', '@伊美尔李镔:今天出门儿，听见一老板模样的人问：谁要加薪？旁边一人答：正议论是不是枪毙药家鑫。老板忙说：不至于不至于，不加不就得了，枪毙就有点过了。旁边一人说：天下有良知的人都说要枪毙这王八蛋。老板愣那儿了。', '17', '@巨人刘伟', null, null, '2011-04-22 04:10:45', '2011-04-22 04:10:45', '0', '9477104041', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('898', null, '如此婚礼迎亲车队豪华得真夸张。迷恋这场面的新娘子再漂亮，送给我我都不要。呵呵，别骂我损哈。', '<a href=\'http://ww4.sinaimg.cn/large/638b4670tw1dgh0b9z0abj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670tw1dgh0b9z0abj.jpg\' class=\'thumbNailPic\'></a>', '8', '@史玉柱', null, null, '2011-04-22 09:15:29', '2011-04-22 09:15:29', '0', '9481443654', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('899', null, '//@周鸿祎:说得真好 谁说的', '@夏勇峰:“互联网会改变一切，但很多功成名就的人忘了这一点，反而成为这股冲劲的阻止者。很多大互联网公司，我觉得他们忙着把自己手里的东西放在脸上，把现成的米放到锅里，但是他们不愿意去充当未来世界的先行者、领航者、先知先觉者。他们忙于生存发展，可是殊不知，只有领航者才能带着大家一起往前跑。”', '13', '@纪学锋', null, null, '2011-04-22 12:52:38', '2011-04-22 12:52:38', '0', '9491657598', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('900', null, '我们的兔子也可以来一个 //@淡云:兔子，兔子，你也来跳一支吧@征途2 @田丰ZT2 @纪学锋', '@冷笑话精选:钢管舞兔子版，各种销魂，各种萌啊！！！[哈哈] <a href=\'http://ww1.sinaimg.cn/large/62037b5ajw1dggfcdn271g.gif\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/62037b5ajw1dggfcdn271g.gif\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-22 13:15:57', '2011-04-22 13:15:57', '0', '9492996138', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('901', null, 'http://t.cn/hdaSec，惊奇、进步！', '', '13', '@纪学锋', null, null, '2011-04-22 20:16:05', '2011-04-22 20:16:05', '0', '9512592340', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('902', null, '强烈支持老徐！', '@徐宥箴:你关注我1下，我出2元。受@傅蔚冈 行动鼓舞。从即刻起至4月30日0:00截止，我根据截止时本人粉丝数量捐款粉丝数量X2的人民币金额给药家鑫事件中的张妙家人，上限200万人民币。在截止捐款完成后我会将捐款成功图片发布到微博。再次感谢张妙的丈夫对丑恶行为拒不收钱妥协的正义行为。欢迎转发。', '13', '@纪学锋', null, null, '2011-04-22 21:38:29', '2011-04-22 21:38:29', '0', '9516982088', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('903', null, '我加入了LOVE NBA，一个专属NBA球迷的聚集地，成为了@LOVE_湖人 的粉丝。览资讯看直播、侃球竞猜，玩活动赢奖品，快一起加入吧，我等你来挑战。链接：http://t.cn/hBnuSQ', '', '11', '@巨人Game', null, null, '2011-04-23 00:45:42', '2011-04-23 00:45:42', '0', '9527005003', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('904', null, '《征途2》全区将于4月23日，4月24日19点、20点、21点在王城、桃花源城内举行3场\"满城尽摘黄金果\"活动，每场活动持续20分钟，参加活动就能摘取到祝福果，并有机率摘取到不绑定的祝福果。朋友们，心动不如行动哦！满城尽摘黄金果大家齐欢乐！[嘻嘻] [嘻嘻]', '', '10', '@征途2', null, null, '2011-04-23 09:38:41', '2011-04-23 09:38:41', '0', '9533967510', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('905', null, '今年夏粮丰收，国际油价冲击减小，货币政策仍在紧缩，CPI向上动能已很弱。结合翘尾因素（今年四个季度分别为3.2 3.3 2.7 0.7），预测今年CPI：一季度5.0 二季度5.3 三季度4.7 四季度3.0。我这是鼻孔插葱，冒充经济学家。', '', '8', '@史玉柱', null, null, '2011-04-23 10:51:28', '2011-04-23 10:51:28', '0', '9536843290', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('906', null, '清华与北大的相似：化学系女生对铊的运用都很娴熟', '@Emma嘟嘟胖:zz:清华与北大的区别：北大学生批评北大会商制，各地校友会联名上书要求开除学工领导。清华学生蒋方舟批评清华，各地校友会联名上书要求开除蒋方舟。', '17', '@巨人刘伟', null, null, '2011-04-24 08:22:01', '2011-04-24 08:22:01', '0', '9581659831', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('907', null, '转发微博', '@全球热门排行榜:凤姐，走，我带你一起去建造一座只属于我们的开心城市，那里没有撞上冰山的泰坦尼克，没有回不了头的梦境，没有跟我抢你的春哥，只有我们的千万粉丝。<a href=\'http://ww2.sinaimg.cn/large/4aa5b28cjw1dgh52tleibj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/4aa5b28cjw1dgh52tleibj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-25 08:08:12', '2011-04-25 08:08:12', '0', '9622307681', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('908', null, '[爱你] 难度太大了！！ //@纪学锋:我们的兔子也可以来一个 //@淡云:兔子，兔子，你也来跳一支吧@征途2 @田丰ZT2 @纪学锋', '@冷笑话精选:钢管舞兔子版，各种销魂，各种萌啊！！！[哈哈] <a href=\'http://ww1.sinaimg.cn/large/62037b5ajw1dggfcdn271g.gif\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/62037b5ajw1dggfcdn271g.gif\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-25 10:27:28', '2011-04-25 10:27:28', '0', '9625113030', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('909', null, '很多人问我征途2目标是多少，我历来不做大目标，都是10万10万的往上做，现在我的目标是40万，因为现在同时在线是30多万；还有很多同行想用公平模式，但是担心亏本，征途2收入已在公司占了相当比重，当然不会亏本。其实最让我开心的是征途2人数收入持续上升的同时征途免费很稳定，这个对我们很重要。', '', '13', '@纪学锋', null, null, '2011-04-25 16:54:11', '2011-04-25 16:54:11', '0', '9634650403', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('910', null, '老板的奥巴马派不上用场了[哈哈]', '@纪学锋:很多人问我征途2目标是多少，我历来不做大目标，都是10万10万的往上做，现在我的目标是40万，因为现在同时在线是30多万；还有很多同行想用公平模式，但是担心亏本，征途2收入已在公司占了相当比重，当然不会亏本。其实最让我开心的是征途2人数收入持续上升的同时征途免费很稳定，这个对我们很重要。', '17', '@巨人刘伟', null, null, '2011-04-25 17:43:32', '2011-04-25 17:43:32', '0', '9635850510', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('911', null, '曝一个内部流传的版本，史总对《征途2》的要求是：20万是起点，30万是及格，40万不放奥巴马咬人，60万辞去CEO。祝贺《征途2》交出了首份及格的成绩单！', '@纪学锋:很多人问我征途2目标是多少，我历来不做大目标，都是10万10万的往上做，现在我的目标是40万，因为现在同时在线是30多万；还有很多同行想用公平模式，但是担心亏本，征途2收入已在公司占了相当比重，当然不会亏本。其实最让我开心的是征途2人数收入持续上升的同时征途免费很稳定，这个对我们很重要。', '9', '@巨人网络', null, null, '2011-04-25 18:13:04', '2011-04-25 18:13:04', '0', '9636581129', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('912', null, '纪总，你怎么把兔子的家底给曝了呢？不过回想兔子上学时的唯一目标就是：及格万岁！热烈庆祝《征途2》交出首份30W及格成绩单！', '@纪学锋:很多人问我征途2目标是多少，我历来不做大目标，都是10万10万的往上做，现在我的目标是40万，因为现在同时在线是30多万；还有很多同行想用公平模式，但是担心亏本，征途2收入已在公司占了相当比重，当然不会亏本。其实最让我开心的是征途2人数收入持续上升的同时征途免费很稳定，这个对我们很重要。', '10', '@征途2', null, null, '2011-04-25 18:25:23', '2011-04-25 18:25:23', '0', '9636879554', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('913', null, '这就三十万人同时在线了？我还在训练奥巴马咬人呐，计划到不了40万人去咬纪大硕士。', '@纪学锋:很多人问我征途2目标是多少，我历来不做大目标，都是10万10万的往上做，现在我的目标是40万，因为现在同时在线是30多万；还有很多同行想用公平模式，但是担心亏本，征途2收入已在公司占了相当比重，当然不会亏本。其实最让我开心的是征途2人数收入持续上升的同时征途免费很稳定，这个对我们很重要。', '8', '@史玉柱', null, null, '2011-04-25 19:13:09', '2011-04-25 19:13:09', '0', '9638079450', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('914', null, '巨人网络旗舰新游《征途2》今日宣布正式成立微博客服团队，史玉柱出任“高级专家客服”，这是网游界首支微博客服团队。重视用户调研、注重抓细节，是史玉柱做产品非常核心的理念。几年前亲自带队开发《征途》时，他经常每天亲自做十几个小时的客服工作，收集用户意见，改善游戏。http://t.cn/hd8GZF', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dglb3ffn8hj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dglb3ffn8hj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-26 02:22:38', '2011-04-26 02:22:38', '0', '9648083605', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('915', null, '漫画确实是亮点哦 [馋嘴]  此次史总重新“挂帅”客服工作，不仅因为他重视这款产品，更与《征途2》的研发理念有关。', '@新浪科技:2011年旗舰新游戏《征途2》今日宣布正式成立微博客服团队，巨人网络董事长兼CEO @史玉柱 出任高级专家客服。据悉，这是中国网游界首支微博客服团队。即日起，玩家可在微博上向 @征途2 提出各种相关的问题，该团队将7x24小时为玩家排忧解难。附图为“高级专家客服”，漫画Q不？http://t.cn/hd8GZF<a href=\'http://ww1.sinaimg.cn/large/61e89b74jw1dglasxuxzcj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/61e89b74jw1dglasxuxzcj.jpg\' class=\'thumbNailPic\'></a>', '9', '@巨人网络', null, null, '2011-04-26 02:27:09', '2011-04-26 02:27:09', '0', '9648106696', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('916', null, '1', '1111', '19', 'wanghui2', '19', 'wanghui2', '2011-04-26 18:45:08', '2011-04-27 09:07:56', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('917', null, '我考，这都行，兔子我都没见过史老大的名片 ...', '@风一样流浪:“搞到一张史玉柱名片，给大家晒一下，被上面一连串的头衔雷到鸟”.0......<a href=\'http://ww1.sinaimg.cn/large/43982bbcjw1dglr2pw6kgj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/43982bbcjw1dglr2pw6kgj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-26 11:41:01', '2011-04-26 11:41:01', '0', '9660058555', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('918', null, '祝玩的开心//@李保朋:哈哈，我就是征途2的非人民币玩家，整体感觉还可以//@巨人网络：漫画确实是亮点哦 [馋嘴] 此次史总重新“挂帅”客服工作，不仅因为他重视这款产品，更与《征途2》的研发理念有关。', '@新浪科技:2011年旗舰新游戏《征途2》今日宣布正式成立微博客服团队，巨人网络董事长兼CEO @史玉柱 出任高级专家客服。据悉，这是中国网游界首支微博客服团队。即日起，玩家可在微博上向 @征途2 提出各种相关的问题，该团队将7x24小时为玩家排忧解难。附图为“高级专家客服”，漫画Q不？http://t.cn/hd8GZF<a href=\'http://ww1.sinaimg.cn/large/61e89b74jw1dglasxuxzcj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/61e89b74jw1dglasxuxzcj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-26 12:10:40', '2011-04-26 12:10:40', '0', '9661470146', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('919', null, '谢谢大家支持我们的工作！[嘻嘻]  //@纪学锋:祝玩的开心//@李保朋:哈哈，我就是征途2的非人民币玩家，整体感觉还可以//@巨人网络：漫画确实是亮点哦 [馋嘴] 此次史总重新“挂帅”客服工作，不仅因为他重视这款产品，更与《征途2》的研发理念有关。', '@新浪科技:2011年旗舰新游戏《征途2》今日宣布正式成立微博客服团队，巨人网络董事长兼CEO @史玉柱 出任高级专家客服。据悉，这是中国网游界首支微博客服团队。即日起，玩家可在微博上向 @征途2 提出各种相关的问题，该团队将7x24小时为玩家排忧解难。附图为“高级专家客服”，漫画Q不？http://t.cn/hd8GZF<a href=\'http://ww1.sinaimg.cn/large/61e89b74jw1dglasxuxzcj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/61e89b74jw1dglasxuxzcj.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-26 12:24:58', '2011-04-26 12:24:58', '0', '9662155724', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('920', null, '一开始听到要成立微博客服团队的时候，史总说要担任高级专家客服，兔子心里一喜，因为那样兔子就成为史总的领导了……嗯嗯，后来才知道，原来是史总亲自挂帅，兔子做助手，哎，还是逃脱不了被领导的命运啊~大家有啥问题尽可在微博上和兔子说哦，我们竭诚为您服务。', '', '10', '@征途2', null, null, '2011-04-26 17:07:48', '2011-04-26 17:07:48', '0', '9675236718', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('921', null, '征途2论坛帖子数，很吉利的数字，居然恰巧这个时候我打开了论坛，转瞬即逝啊....', '<a href=\'http://ww2.sinaimg.cn/large/64651a16jw1dgm12rv8c4j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/64651a16jw1dgm12rv8c4j.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-26 17:21:34', '2011-04-26 17:21:34', '0', '9675761197', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('922', null, '[呵呵]', '@风一样流浪:“搞到一张史玉柱名片，给大家晒一下，被上面一连串的头衔雷到鸟”.0......<a href=\'http://ww1.sinaimg.cn/large/43982bbcjw1dglr2pw6kgj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/43982bbcjw1dglr2pw6kgj.jpg\' class=\'thumbNailPic\'></a>', '13', '@纪学锋', null, null, '2011-04-26 17:53:04', '2011-04-26 17:53:04', '0', '9677227147', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('923', null, '这个数字果然吉利，不会它会越来越好！[呵呵]', '@纪学锋:征途2论坛帖子数，很吉利的数字，居然恰巧这个时候我打开了论坛，转瞬即逝啊....<a href=\'http://ww2.sinaimg.cn/large/64651a16jw1dgm12rv8c4j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/64651a16jw1dgm12rv8c4j.jpg\' class=\'thumbNailPic\'></a>', '10', '@征途2', null, null, '2011-04-26 17:54:05', '2011-04-26 17:54:05', '0', '9677276657', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('924', null, '老板的大牙是亮点[偷笑]', '@新浪科技:2011年旗舰新游戏《征途2》今日宣布正式成立微博客服团队，巨人网络董事长兼CEO @史玉柱 出任高级专家客服。据悉，这是中国网游界首支微博客服团队。即日起，玩家可在微博上向 @征途2 提出各种相关的问题，该团队将7x24小时为玩家排忧解难。附图为“高级专家客服”，漫画Q不？http://t.cn/hd8GZF<a href=\'http://ww1.sinaimg.cn/large/61e89b74jw1dglasxuxzcj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/61e89b74jw1dglasxuxzcj.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-26 18:18:40', '2011-04-26 18:18:40', '0', '9678405021', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('925', null, '有个东北银要感谢我[害羞]', '@全球热门排行榜:男人要永远感谢在他20多岁的时候曾经陪在他身边的女人。因为20多岁的男人处在一生中的最低点，没钱，没事业；而20多岁的女人却是她一生最灿烂的时候。<a href=\'http://ww4.sinaimg.cn/large/4aa5b28cjw1dglpxzsdc6j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/4aa5b28cjw1dglpxzsdc6j.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-26 18:22:15', '2011-04-26 18:22:15', '0', '9678567963', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('926', null, '五一劳动节《征途2》准备了两重丰富的的活动给大家，第一个是家族祝福果活动，还有一个是年年有鱼活动，具体的活动大家查看官网哦。活动非常经常，没有等级要求，没有装备要求，希望大家喜欢！[嘻嘻]', '', '10', '@征途2', null, null, '2011-04-26 18:58:38', '2011-04-26 18:58:38', '0', '9680257553', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('927', null, '终结者的终结', '@冷笑话精选:州长再也不是终结者了。州长老了……(@瞬间乐翻你 投稿)<a href=\'http://ww1.sinaimg.cn/large/62037b5ajw1dgm7ojqbm5j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/62037b5ajw1dgm7ojqbm5j.jpg\' class=\'thumbNailPic\'></a>', '17', '@巨人刘伟', null, null, '2011-04-26 22:15:33', '2011-04-26 22:15:33', '0', '9690905531', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('928', null, '一个好友劝我：保健品业务全关闭，1万8千人的销售队伍全转为卖保险。琢磨中。。。。', '', '8', '@史玉柱', null, null, '2011-04-27 09:11:26', '2011-04-27 09:11:26', '2', '9705676349', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('929', null, '1111', '1111', '19', 'wanghui2', '7', '关注巨人', '2011-04-28 15:33:36', '2011-04-29 11:28:32', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('930', null, 'test', 'test', '20', '@演出树', null, null, '2011-04-28 19:11:33', '2011-04-28 19:11:33', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('931', null, 'test2', 'test2', '20', '@演出树', null, null, '2011-04-28 19:15:35', '2011-04-28 19:15:35', '-1', '9786013091', '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('932', '1', '新闻测试', '新闻测试', '7', '关注巨人', null, null, '2011-04-29 15:30:14', '2011-04-29 15:30:14', '1', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('933', '0', '11111111', '11111111111111', '7', '关注巨人', null, null, '2011-04-29 15:42:20', '2011-04-29 15:42:20', '0', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('934', '1', '国王的演讲，强烈推荐', '\\\\192.168.35.50\\fas270\\720p.国王的演讲.mkv', '19', 'wanghui2', null, null, '2011-04-29 15:52:33', '2011-04-29 15:52:33', '0', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('935', '3', '求租宜山附近一室户', '求租宜山附近一室户', '19', 'wanghui2', null, null, '2011-04-29 15:53:05', '2011-04-29 15:53:05', '0', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('936', '0', '求租宜山附近一室户，速度啊', '求租宜山附近一室户，速度啊，有意请：[OCS:WANGHUI2]', '19', 'wanghui2', '19', 'wanghui2', '2011-04-29 16:08:14', '2011-04-29 17:03:59', '0', null, '2', '0', '0', null, '1');
INSERT INTO topic VALUES ('937', '0', 'test', '[OCS:wanghui2]', '19', 'wanghui2', null, null, '2011-04-29 16:45:44', '2011-04-29 16:45:44', '0', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('938', '0', 'wangxin', '[OCS:wangxin]', '19', 'wanghui2', null, null, '2011-04-29 16:46:43', '2011-04-29 16:46:43', '0', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('939', '0', 'test', '[OCS:王慧]', '19', 'wanghui2', null, null, '2011-04-29 16:47:37', '2011-04-29 16:47:37', '0', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('940', '2', '巨人成立网游微博客服团队 史玉柱亲自挂帅', 'http://tech.sina.com.cn/i/2011-04-26/01455448607.shtml', '7', '关注巨人', null, null, '2011-04-29 17:21:08', '2011-04-29 17:21:08', '1', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('941', '0', '1111111111', '1111111111111', '7', '关注巨人', '1', '匿名', '2011-05-03 10:25:34', '2011-05-04 10:53:23', '0', null, '2', '0', '0', null, '1');
INSERT INTO topic VALUES ('942', '0', '1111', '11111', '1', '匿名', '19', 'wanghui2', '2011-05-04 10:54:03', '2011-05-04 11:00:22', '0', null, '4', '0', '1', null, '1');
INSERT INTO topic VALUES ('943', '0', '222', '2222', '1', '匿名', null, null, '2011-05-04 10:55:40', '2011-05-04 10:55:40', '0', null, null, '0', '0', null, '1');
INSERT INTO topic VALUES ('944', '0', '1111', '111111', '19', 'wanghui2', '1', '匿名', '2011-05-04 11:00:42', '2011-05-04 11:38:02', '0', null, '2', '0', '1', null, '1');
INSERT INTO topic VALUES ('945', '0', '111111111111111111111111111111', '11111111111111111111111111111', '19', 'wanghui2', null, null, '2011-05-04 11:39:17', '2011-05-04 11:39:17', '0', null, null, '1', '0', null, '1');
INSERT INTO topic VALUES ('946', '0', '测试订阅数量', '测试订阅数量', '19', 'wanghui2', null, null, '2011-05-04 11:55:45', '2011-05-04 11:55:45', '0', null, '0', '1', '0', null, '1');
INSERT INTO topic VALUES ('947', '4', '1111', '111111', '19', 'wanghui2', null, null, '2011-05-04 14:04:19', '2011-05-04 14:04:19', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('948', '4', '222', '2222', '19', 'wanghui2', null, null, '2011-05-04 14:04:24', '2011-05-04 14:04:24', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('949', '4', '3333', '3333', '19', 'wanghui2', null, null, '2011-05-04 14:04:29', '2011-05-04 14:04:29', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('950', '4', '4444', '4444', '19', 'wanghui2', null, null, '2011-05-04 14:04:34', '2011-05-04 14:04:34', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('951', '4', '5555', '5555', '19', 'wanghui2', null, null, '2011-05-04 14:04:39', '2011-05-04 14:04:39', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('952', '4', '6666', '6666', '19', 'wanghui2', null, null, '2011-05-04 14:04:44', '2011-05-04 14:04:44', '0', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('953', '0', '222', '2222', '19', 'wanghui2', null, null, '2011-05-04 14:20:00', '2011-05-04 14:20:00', '0', null, '0', '0', '1', null, '1');
INSERT INTO topic VALUES ('954', '4', '标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长', '标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长', '19', 'wanghui2', '7', '关注巨人', '2011-05-04 14:33:38', '2011-05-05 18:08:14', '0', null, '1', '0', '1', null, '1');
INSERT INTO topic VALUES ('955', '2', '11111', '11111111111111', '7', '关注巨人', null, null, '2011-05-04 18:10:48', '2011-05-04 18:10:48', '1', null, '0', '0', '0', null, '1');
INSERT INTO topic VALUES ('956', '0', '111', '1111', '7', '关注巨人', '19', '匿名', '2011-05-05 18:08:57', '2011-05-09 11:31:55', '0', null, '4', '1', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('957', '0', '标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长', '标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长标题很长', '19', '王慧', null, null, '2011-05-09 11:28:58', '2011-05-09 11:28:58', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('958', '0', '111', '1111', '19', '王慧', '1', '匿名', '2011-05-09 11:45:39', '2011-05-09 12:30:31', '0', null, '2', '1', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('959', null, '转发微博。', '@新浪科技:#告诉你真正的网购#马云说，电子商务有三个帮助：1.让诚信等同于财富，网上越诚信的人越赚钱；2.去掉中间环节，让消费者越来越聪明，自主选择空间大，低收入者也能买得起东西，用钱去投票；3.帮助小企业转型突围，除了生产，还需要品牌、营销和服务。电子商务承受了中国经济转型之痛。<a href=\'http://ww2.sinaimg.cn/large/61e89b74jw1dgn2qngu83j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/61e89b74jw1dgn2qngu83j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-27 15:10:27', '2011-04-27 15:10:27', '2', '9723385214', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('960', null, '目前是内测，不删档的', '@浓妆土拨鼠:对@征途2 说：这次测试删档么？什么时候公测啊？[疑问]', '26', '@征途2', null, null, '2011-04-28 11:44:20', '2011-04-28 11:44:20', '2', '9765143366', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('961', null, '全区维护完毕了，别急~可以进了', '@杰杰-高:征途2全线维护。。。。。。急', '26', '@征途2', null, null, '2011-04-28 11:44:56', '2011-04-28 11:44:56', '2', '9765170490', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('962', null, '15日新区之前一直没有客户端更新内容，如果反复需要更新，是不是装还原精灵啦，建议换个盘重新装装看吧', '@隆依:@纪学锋 为什么明明是征途2的最新版本客户端，怎么隔天总要我更新呢？而且更新的速度超级慢！更新一次都够我重新下一次游戏都不止了。。官方也没发布更新消息啊？真奇怪', '26', '@征途2', null, null, '2011-04-28 11:52:52', '2011-04-28 11:52:52', '2', '9765524690', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('963', null, '是的，暴雪意识到这一点一定可以做的很好，很期待他们的下一个作品 //@桃公子:这个发现是不是有点晚了，中国已经有了吧。@史玉柱 家的征途2是不是这类的？', '@新浪科技:暴雪总裁兼CEO、联合创始人麦克-莫汉：我们在运营《魔兽世界》的几年中，看到了一些新的趋势。游戏的体验互联性、社交型、移动性变得更强。我们希望把学到的经验，运用到下一代MMO中。其中就包括社交方面，我们希望把下一代MMO做成社交的网络。 http://t.cn/hdd9f3<a href=\'http://ww2.sinaimg.cn/large/61e89b74jw1dgnvzlm3m2j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/61e89b74jw1dgnvzlm3m2j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-28 12:00:28', '2011-04-28 12:00:28', '2', '9765860506', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('964', null, '明天有新区，呵呵，应该就不用排队了：）', '@ptl李:最近玩上征途2了，那个人多啊，服务器三万五爆满还要排队。但游戏设置玩得不累', '25', '@纪学锋', null, null, '2011-04-28 12:01:43', '2011-04-28 12:01:43', '2', '9765915570', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('965', null, '转发微博。', '@时尚经典语录:当我们快乐时，快乐的原因，并不是因为我们多拥有了什么，而是减少了一些烦恼和执着；当我们痛苦时，痛苦的原因，并不是因为我们缺乏了什么，而是增加了一些自私和欲望。<a href=\'http://ww2.sinaimg.cn/large/49b1aaf5tw1dgo4vtru2mj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/49b1aaf5tw1dgo4vtru2mj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-28 13:07:16', '2011-04-28 13:07:16', '2', '9769199302', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('966', null, '量确实不小...', '@5173网游交易:5173一周游戏币成交排行榜： 1.魔兽世界(国服) 2.地下城与勇士 3.龙之谷 4.征途2↑1 5.问道↓1 6.大唐无双 7.诛仙2 8.永恒之塔↑2 9.QQ西游↓1 10. 蜀门↓1', '25', '@纪学锋', null, null, '2011-04-28 13:22:14', '2011-04-28 13:22:14', '2', '9769986892', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('967', null, '......', '@5173网游交易:5173一周网游总交易额排行 1.地下城与勇士↑1 2.魔兽世界(国服)↓1 3.诛仙2 4.天龙八部2 5.问道 6.龙之谷 7.征途2↑2 8.完美国际 9.征途↓2 10.蜀门', '25', '@纪学锋', null, null, '2011-04-28 13:23:20', '2011-04-28 13:23:20', '2', '9770041944', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('968', null, '转发微博。', '@田丰ZT2:“一波流”指的是那种依靠广告攻势，在短期内迅速开几十个区，快速把人数拉上去的游戏。这类游戏涨得快，跌得也快。《征途2》不做“一波流”，而是一步一个脚印，靠游戏性慢慢积累人数，这样更扎实。对于新游戏，人数重要，但口碑更重要。现在领风骚且长久不衰的游戏都是这样走出来的。', '25', '@纪学锋', null, null, '2011-04-28 13:32:15', '2011-04-28 13:32:15', '2', '9770475802', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('969', null, '征途2不靠线上活动强制拉人，每次突破都是真实的人数，人多好玩。', '@田丰ZT2:“一波流”指的是那种依靠广告攻势，在短期内迅速开几十个区，快速把人数拉上去的游戏。这类游戏涨得快，跌得也快。《征途2》不做“一波流”，而是一步一个脚印，靠游戏性慢慢积累人数，这样更扎实。对于新游戏，人数重要，但口碑更重要。现在领风骚且长久不衰的游戏都是这样走出来的。', '26', '@征途2', null, null, '2011-04-28 14:06:21', '2011-04-28 14:06:21', '2', '9771974520', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('970', null, '回复@隆依:早上花一个小时又重新下了次客户端，更新正常呀，每次更新是data文件有更新吗，资源修复看看是不是缺文件了。 //@隆依:。。。我个人电脑又不是网吧，装还原精灵干嘛。。 //@征途2:15日新区之前一直没有客户端更新内容，如果反复需要更新，是不是装还原精灵啦，建议换个盘重新装装看吧', '@隆依:@纪学锋 为什么明明是征途2的最新版本客户端，怎么隔天总要我更新呢？而且更新的速度超级慢！更新一次都够我重新下一次游戏都不止了。。官方也没发布更新消息啊？真奇怪', '26', '@征途2', null, null, '2011-04-28 14:21:39', '2011-04-28 14:21:39', '2', '9772623264', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('971', null, '不收费又担心好像以前传奇一样，大群小号跑进去抢怪抢装备，弄的大家都没怪打了，收费数量可以商讨下啊', '@破风子:对@征途2 建议那些万宝宫等进去不收费或少收点呀,在游戏都够穷的了.进去一次要20L,是不是太贵了点呀.', '26', '@征途2', null, null, '2011-04-28 14:25:39', '2011-04-28 14:25:39', '2', '9772794256', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('972', null, '回复@破风子:田丰同学最近开会讨论的主题就是大力简化道具和任务流程，没想到你也想到了，看来也有当主策划的潜质啊~~ //@破风子:建议能否把一些技能和盗具的升级,还有任务简化些,太复杂了,搞得玩游戏好象搞研究似的.要轻松玩游戏嘛.', '@隆依:@纪学锋 为什么明明是征途2的最新版本客户端，怎么隔天总要我更新呢？而且更新的速度超级慢！更新一次都够我重新下一次游戏都不止了。。官方也没发布更新消息啊？真奇怪', '26', '@征途2', null, null, '2011-04-28 14:39:13', '2011-04-28 14:39:13', '2', '9773359518', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('973', null, '征途2最创新的是他的运营模式，画面只是一部分，再好的画片看多了也会腻，轻松的游戏，交更多的朋友，更热血的战斗，更能让玩家接受，细细品味你会发现真的变化很大，更耐玩。', '@輕舞_-飛揚:反正我玩了5年，各种版本都玩过，征途2只是画面好，真正的创新不太多。我们家族又跑了2个区老征途。没钱钱难 。', '26', '@征途2', null, null, '2011-04-28 16:00:46', '2011-04-28 16:00:46', '2', '9776738483', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('974', null, '不做“一波流”。', '@田丰ZT2:“一波流”指的是那种依靠广告攻势，在短期内迅速开几十个区，快速把人数拉上去的游戏。这类游戏涨得快，跌得也快。《征途2》不做“一波流”，而是一步一个脚印，靠游戏性慢慢积累人数，这样更扎实。对于新游戏，人数重要，但口碑更重要。现在领风骚且长久不衰的游戏都是这样走出来的。', '27', '@巨人网络', null, null, '2011-04-28 16:22:38', '2011-04-28 16:22:38', '2', '9777791133', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('975', null, '《仙途》合作电影《饮食男女2》日前已在杭州开拍，蓝正龙在影片中饰演《仙途》的主策，整日沉迷于网络游戏，并由此展开了许多趣事。该剧是国内首部以网游策划为题材的电影。', '@新浪游戏频道:#新闻报道#【蓝正龙新剧扮演《仙途》主策 称最中意PK类游戏】4月28日消息，《饮食男女2》近日在风景秀丽的杭州西溪湿地取景拍摄，据悉电影男主角蓝正龙在片中饰演的是一个游戏主策，而此款游戏正是巨人旗下的2.5D仙侠网游《仙途》，为此新浪游戏特地前往剧组一探究竟。点击查看:http://t.cn/hdgl2j<a href=\'http://ww4.sinaimg.cn/large/4ad9ebb8jw1dgobb4ggzgj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/4ad9ebb8jw1dgobb4ggzgj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-04-28 18:42:10', '2011-04-28 18:42:10', '2', '9784306383', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('976', null, '马蔚华坚定认为招商银行后劲十足。', '<a href=\'http://ww4.sinaimg.cn/large/638b4670jw1dgofptej1wj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw1dgofptej1wj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-04-28 19:19:11', '2011-04-28 19:19:11', '2', '9786212223', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('977', null, '转发微博。', '@史玉柱:马蔚华坚定认为招商银行后劲十足。<a href=\'http://ww4.sinaimg.cn/large/638b4670jw1dgofptej1wj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw1dgofptej1wj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-28 19:20:31', '2011-04-28 19:20:31', '2', '9786281357', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('978', null, '转发微博。', '@创意工坊:★超可爱的外国小盆友学中文！彻底被萌翻了！ http://t.cn/h6XzXE', '25', '@纪学锋', null, null, '2011-04-28 22:47:12', '2011-04-28 22:47:12', '2', '9797936839', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('979', null, '回复@wenlaosan:按住shif他，鼠标点击你要发布的玄兽，聊天窗就会出现发布链接哦。 //@wenlaosan:请问一下聊天的时候怎么发布玄兽信息？？？？', '@輕舞_-飛揚:反正我玩了5年，各种版本都玩过，征途2只是画面好，真正的创新不太多。我们家族又跑了2个区老征途。没钱钱难 。', '26', '@征途2', null, null, '2011-04-29 10:16:27', '2011-04-29 10:16:27', '2', '9813388337', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('980', null, '回复@演员罗筐:策划老大门开了好多天的会，一直讨论为大家减负，大家的希望就是我们的目标。 //@演员罗筐:@征途２ 任务耗时费力，没有蜻蜓一类的 道具，人物像慢镜头，24小时都有任务做也做不完，休闲特点不 突出，看来征途2自己也在犹豫，是走红色ＰＫ路线还是走绿色休闲路线拿不定主意的感觉，多数人', '@輕舞_-飛揚:反正我玩了5年，各种版本都玩过，征途2只是画面好，真正的创新不太多。我们家族又跑了2个区老征途。没钱钱难 。', '26', '@征途2', null, null, '2011-04-29 10:19:58', '2011-04-29 10:19:58', '2', '9813556429', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('981', null, '回复@he瑶瑶:正常注册就好啦~~以前巨人网络的所有账号都可以通用的。 //@he瑶瑶:我是新手，问个愚笨的问题，内测是不是要申请个内测号？还是直接正常在官网注册就好了？', '@征途2:五一劳动节《征途2》准备了两重丰富的的活动给大家，第一个是家族祝福果活动，还有一个是年年有鱼活动，具体的活动大家查看官网哦。活动非常经常，没有等级要求，没有装备要求，希望大家喜欢！[嘻嘻]', '26', '@征途2', null, null, '2011-04-29 10:26:25', '2011-04-29 10:26:25', '2', '9813859113', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('982', null, '回复@晶晶咩:注册身份证记得吗，官网可以用身份证直接改密码的哦 //@晶晶咩:好不容易注册了个号，结果密码设太复杂，忘记了……555咋办啊', '@征途2:五一劳动节《征途2》准备了两重丰富的的活动给大家，第一个是家族祝福果活动，还有一个是年年有鱼活动，具体的活动大家查看官网哦。活动非常经常，没有等级要求，没有装备要求，希望大家喜欢！[嘻嘻]', '26', '@征途2', null, null, '2011-04-29 10:26:57', '2011-04-29 10:26:57', '2', '9813883841', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('983', null, '//@5173网游交易:征途2在线已经30万了啦！！ //@纪学锋:量确实不小...', '@5173网游交易:5173一周游戏币成交排行榜： 1.魔兽世界(国服) 2.地下城与勇士 3.龙之谷 4.征途2↑1 5.问道↓1 6.大唐无双 7.诛仙2 8.永恒之塔↑2 9.QQ西游↓1 10. 蜀门↓1', '26', '@征途2', null, null, '2011-04-29 11:37:16', '2011-04-29 11:37:16', '2', '9817286533', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('984', null, '回复@琪琪王子:完美的结合也是我们的期望，磨合期是漫长的，希望能尽快找到平衡点，大家意见提起来吧~感激 //@琪琪王子:我觉着如果征途2能将红色版与绿色版综合起来那将是个重大突破！还有就是国战家族战应该改下模式了！长期以往缺乏新意！无战术可言。无技术可言。一成不变.....再好的游戏也有让人腻', '@輕舞_-飛揚:反正我玩了5年，各种版本都玩过，征途2只是画面好，真正的创新不太多。我们家族又跑了2个区老征途。没钱钱难 。', '26', '@征途2', null, null, '2011-04-29 11:48:02', '2011-04-29 11:48:02', '2', '9817789301', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('985', null, '很期待呀', '@开阝松:巨人第三代商业模式，能否催熟专业游戏代练链条？ @史玉柱  @ 纪学锋<a href=\'http://ww4.sinaimg.cn/large/791bc61bjw1dgp675jcrdj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/791bc61bjw1dgp675jcrdj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-04-29 12:00:42', '2011-04-29 12:00:42', '2', '9818374835', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('986', null, '向着40万不被狗咬的目标前进！', '@新浪科技:巨人称《征途2》在线人数已突破30万人，此前，@史玉柱 定下的内部目标是：20万人是起点，30万人是及格；不到40万人将放狗咬游戏制作人，突破60万人则辞去巨人网络CEO，彻底给年轻团队放权。http://t.cn/hdFMxj<a href=\'http://ww1.sinaimg.cn/large/61e89b74jw1dgp8ecb37fj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/61e89b74jw1dgp8ecb37fj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-04-29 12:37:22', '2011-04-29 12:37:22', '2', '9820030396', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('987', null, '新区很给力呀', '@偷心的贼2010:征途2--“中国最佳客服”24小时为您排忧解难 http://t.cn/hBm069<a href=\'http://ww2.sinaimg.cn/large/6a9880f1jw1dgpavrbugnj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6a9880f1jw1dgpavrbugnj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-04-29 14:19:25', '2011-04-29 14:19:25', '2', '9825011034', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('988', null, '主要是他对市场有信心，我相信他的坚定是数据给他的', '@史玉柱:马蔚华坚定认为招商银行后劲十足。<a href=\'http://ww4.sinaimg.cn/large/638b4670jw1dgofptej1wj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw1dgofptej1wj.jpg\' class=\'thumbNailPic\'></a>', '29', '@巨人Game', null, null, '2011-04-29 15:20:45', '2011-04-29 15:20:45', '2', '9827608616', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('989', null, '[微风]', '@史玉柱:一个好友劝我：保健品业务全关闭，1万8千人的销售队伍全转为卖保险。琢磨中。。。。', '29', '@巨人Game', null, null, '2011-04-29 15:22:36', '2011-04-29 15:22:36', '2', '9827688268', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('990', null, '女性：女孩子的时候喜欢男孩儿，女人的时候喜欢男人；男性：男孩子的时候喜欢女孩儿，男人的时候也喜欢女孩儿。这个论断多大程度上靠谱？刚和一同事正好闲聊此话题。', '', '25', '@纪学锋', null, null, '2011-04-29 15:35:28', '2011-04-29 15:35:28', '2', '9828235486', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('991', null, '口碑效益已起？？', '', '25', '@纪学锋', null, null, '2011-04-29 17:25:09', '2011-04-29 17:25:09', '2', '9833135644', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('992', null, '回复@Jason_07:这次开区没啥广告和推广，满了。 //@Jason_07:人好多，喜事', '@纪学锋:口碑效益已起？？', '25', '@纪学锋', null, null, '2011-04-29 17:44:34', '2011-04-29 17:44:34', '2', '9834035624', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('993', null, '巨人微博MM瑶瑶：一场雷雨过后，炙热的阳光带走了一整个冬季的寒气，不知不觉进入了初夏，绽放中的花花草草把巨人园区点缀得生机盎然。听到有人在呼唤瑶瑶，为大家送上桂纶镁经典侧面cos照一张！', '<a href=\'http://ww1.sinaimg.cn/large/6232cd9ajw1dgpisjhqbwj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6232cd9ajw1dgpisjhqbwj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-04-29 17:51:24', '2011-04-29 17:51:24', '2', '9834347808', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('994', null, '确实有道理 //@徐宥箴:全部看完，写的非常专业，十分认同', '@薛蛮子:分享王学宗的博文：微博社会心理学原理 推荐给@头条博客 http://t.cn/h5dOf6', '25', '@纪学锋', null, null, '2011-04-29 18:14:59', '2011-04-29 18:14:59', '2', '9835407719', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('995', null, '听说《征途2》今日对玩家的口碑效应展开测试，在没啥推广投入的情况下，仅用29分钟就达到了测试服务器的人数上限。看来《征途2》的游戏性已获得玩家肯定，靠口碑传播已能带来自增长。加油！http://t.cn/hgPJdg', '', '27', '@巨人网络', null, null, '2011-04-29 18:15:21', '2011-04-29 18:15:21', '2', '9835424161', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('996', null, '我这是在哪？我在哪个城市？谁把我灌醉了？', '<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dgpjnome0uj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dgpjnome0uj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-04-29 18:21:06', '2011-04-29 18:21:06', '2', '9835840283', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('997', null, '这个这个......,我只知道你在北京，其他......', '@史玉柱:我这是在哪？我在哪个城市？谁把我灌醉了？<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dgpjnome0uj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dgpjnome0uj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-29 18:31:15', '2011-04-29 18:31:15', '2', '9836237065', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('998', null, '回复@与你共永久:2号（周一）加开新区，不好意思，真的没想到这么多人...... //@与你共永久:你就不会把服务器人数整多点？登录都进不去，现在好了，进不去游戏，被压着出去请客去了。。。。[泪] //@纪学锋:这个这个......,我只知道你在北京，其他......', '@史玉柱:我这是在哪？我在哪个城市？谁把我灌醉了？<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dgpjnome0uj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dgpjnome0uj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-29 19:04:21', '2011-04-29 19:04:21', '2', '9837898621', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('999', null, '回复@与你共永久:[害羞] ，2号进来玩吧，这个区实在人太多了，里边已经卡了。我决策失误啊。 //@与你共永久:回复@纪学锋:[泪] 你陪我请客的钱 //@纪学锋:这个这个......,我只知道你在北京，其他......', '@史玉柱:我这是在哪？我在哪个城市？谁把我灌醉了？<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dgpjnome0uj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dgpjnome0uj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-29 19:07:08', '2011-04-29 19:07:08', '2', '9838035363', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1000', null, '回复@与你共永久:[委屈] //@与你共永久:2号。。。兄台你是让我多请两天客嘛？晚上回来晚点进看看能进得去不，如果还是进不去，投诉你。 //@纪学锋:回复@与你共永久:[害羞] ，2号进来玩吧，这个区实在人太多了，里边已经卡了。我决策失误啊。 //@与你共永久:回复@纪学锋:[泪] 你陪我请客的钱', '@史玉柱:我这是在哪？我在哪个城市？谁把我灌醉了？<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dgpjnome0uj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dgpjnome0uj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-29 20:47:29', '2011-04-29 20:47:29', '2', '9843227597', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1001', null, '呵呵', '@雷蒙黄:GA今日价量齐升。目前在9元附近徘徊 再努把力站稳9元就是新的起点了 @纪学锋 @征途2', '25', '@纪学锋', null, null, '2011-04-30 01:10:36', '2011-04-30 01:10:36', '2', '9857249263', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1002', null, '哪个游戏可以这么练？', '@火星亾:征途2开新服，中午吃饭围桌有网游爱好者在拉人，其中一大叔级网游高手拒绝加入，其理由不是不喜欢新游戏，而是目前这个游戏在练十个号，忙不过来。偶差点贫血晕倒，这是人玩游戏还是游戏玩人啊？网游离我有一段日子远了。[害羞]', '25', '@纪学锋', null, null, '2011-04-30 01:14:37', '2011-04-30 01:14:37', '2', '9857344161', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1003', null, '谢谢肯定还要努力', '@黃師傅飛:子曰：两情若是长久时，又岂在朝朝暮暮！子再曰：是感觉？错觉？还是幻觉？<顺便表扬一下征途2的美工><a href=\'http://ww2.sinaimg.cn/large/5e665f43gw1dgptluv9zsj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/5e665f43gw1dgptluv9zsj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-30 01:15:47', '2011-04-30 01:15:47', '2', '9857370895', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1004', null, '[馋嘴]', '@书墨寒香客:这密密麻麻的征途2,真让我眼花缭乱阿..眼睛受不了 了.<a href=\'http://ww4.sinaimg.cn/large/79c67771jw1dgpqy322x7j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/79c67771jw1dgpqy322x7j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-04-30 01:19:10', '2011-04-30 01:19:10', '2', '9857448271', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1005', null, '景色优美+气温适中+没蚊虫=人间天堂', '<a href=\'http://ww4.sinaimg.cn/large/638b4670jw1dgqtg343l7j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/638b4670jw1dgqtg343l7j.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-04-30 20:45:20', '2011-04-30 20:45:20', '2', '9893158733', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1006', null, '深夜熟睡被摇醒，睁眼一看，是身边保安领着刘伟和陈国等高管在我床边。陈国说“老板，快躲躲吧，公安马上来找你麻烦”我：“为啥？”他：“你在微博里说话不严肃”我问法律副总：“我没反党反国家，没色情，就是语言吊儿郎当，这违法?\"他点头。我郁闷“我哪都不去，你帮我写申诉，我方便下”—内急梦醒', '', '28', '@史玉柱', null, null, '2011-05-01 08:21:48', '2011-05-01 08:21:48', '2', '9912008515', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1007', null, '分享图片', '<a href=\'http://ww1.sinaimg.cn/large/6e615fb6jw1dgs2xu33mfj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6e615fb6jw1dgs2xu33mfj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-01 22:59:22', '2011-05-01 22:59:22', '2', '9951540571', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1008', null, '建兵确是如此。坦荡//@顾建兵:我工作十年，跳槽两次，都告诉原东家去哪，下家的领导都给原东家领导电话。道理其实很简单，坦率，在阳光下，其实是最简单的，也是最有效的。', '@盛轶炯:员工离职时经常有如下几种措辞:1.身体不适,回家去休养;2.家里人身体不好,回去照顾;3.自己出去做生意......等等,总之,没有提去别的同类公司任职,难道是觉得我会不放行?理由可能都是善意的谎言!突然之间很感慨,人活着为什么不能单纯一点,有好的发展,我不会限制任何人!只是突然感慨,无事实发生!切勿乱猜!', '25', '@纪学锋', null, null, '2011-05-02 00:44:12', '2011-05-02 00:44:12', '2', '9957143469', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1009', null, '冯光头力气比我大？', '<a href=\'http://ww3.sinaimg.cn/large/638b4670jw1dgt5cq9jkfj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/638b4670jw1dgt5cq9jkfj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-02 21:08:27', '2011-05-02 21:08:27', '2', '9997145540', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1010', null, '转发微博。', '@微天下:据奥巴马反恐顾问布伦南披露，发起对拉登打击行动中，白宫一直对前方进行着实时监测。白宫发布了奥巴马等人在战情室监测战事进展的照片，在座人员包括美国副总统拜登、国务卿希拉里及国家安全小组成员。<a href=\'http://ww3.sinaimg.cn/large/70e11e0fjw1dgtk83d36qj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/70e11e0fjw1dgtk83d36qj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-03 15:20:08', '2011-05-03 15:20:08', '2', '10032878704', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1011', null, ' //@闾丘露薇: //@袁莉wsj:“这位激进的年轻沙特人、有钱的二流工科学生，成年时正逢伊斯兰世界处于政治动荡时期...80年代报道阿富汗战争的新闻记者们开始听闻一位高大帅气的男子，他穿着阿富汗长袍，但靴子是英国定制的...他拜访受伤的战士，用干果和巧克力安慰他们，并给他们的', '@华尔街日报中文网:【本·拉登的一生】- 本·拉登在成为恐怖分子之前，曾是一个富有的年轻人，成长过程中与沙特阿拉伯的政治精英互有往来，他的父亲还曾为恢复伊斯兰教圣地出过力。http://t.cn/hgcIQW<a href=\'http://ww2.sinaimg.cn/large/624c2f04jw1dgu4gw4720j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/624c2f04jw1dgu4gw4720j.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-03 20:31:40', '2011-05-03 20:31:40', '2', '10047383185', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1012', null, '[嘻嘻] //@雷蒙黄:同喜 巨人已经连续3天冲9元了 在昨天的惨烈大市下还能涨3%很强了 站稳9元只是时间问题', '@2alpha:巨人网络(GA)股价今天创52周新高，$8.88.  恭喜 @巨人刘伟 @巨人CFO @纪学锋 @史玉柱', '25', '@纪学锋', null, null, '2011-05-04 10:54:09', '2011-05-04 10:54:09', '2', '10072691340', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1013', null, '假期归来，又要重新投入快节奏的工作中了，整理一下屋子，整理一下心情，准备重新出发了，加油！', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dguyujvrmxj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dguyujvrmxj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-04 10:54:44', '2011-05-04 10:54:44', '2', '10072721612', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1014', null, '转发微博。', '@巨人网络:假期归来，又要重新投入快节奏的工作中了，整理一下屋子，整理一下心情，准备重新出发了，加油！<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dguyujvrmxj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dguyujvrmxj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-04 11:12:55', '2011-05-04 11:12:55', '2', '10073621862', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1015', null, '给力的视频！', '@新浪游戏视频:#游戏视频#《征途2》：穿越时空的爱恋 美眉玩家视频寻夫 http://t.cn/hgI1rz<a href=\'http://ww1.sinaimg.cn/large/4ce4fe8ejw1dgv2dxw8s7j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/4ce4fe8ejw1dgv2dxw8s7j.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-04 13:38:27', '2011-05-04 13:38:27', '2', '10081208056', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1016', null, '转发微博。', '@宋仕良:mark一下，在游戏圈混了整整九年。', '25', '@纪学锋', null, null, '2011-05-04 15:56:04', '2011-05-04 15:56:04', '2', '10087337364', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1017', null, ' //@蔡文胜: 恭喜@陈一舟 。互联网不断诞生奇迹。', '@i美股:【互联网新贵！ 人人市值超新浪！！！】截止21:50，人人上涨36%报19.04美元，市值74.82亿美元；而新浪目前市值为74.56亿美元。http://t.cn/hgMMgM 目前人人市值超越了搜狐、分众、优酷、网易、携程、新浪，排在在美上市的中概第二，仅次于百度；成为中国互联网市值第三的公司（仅次于腾讯和百度）<a href=\'http://ww2.sinaimg.cn/large/6593e433jw1dgvi0fd4fxj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6593e433jw1dgvi0fd4fxj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-04 22:35:21', '2011-05-04 22:35:21', '2', '10105254029', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1018', null, '预测即将公布的4月CPII略低于3月，6月达到高点后将一路下跌，年底跌到三点多。主要目标将应该由防通胀，改为保增长保就业。', '', '28', '@史玉柱', null, null, '2011-05-05 08:45:47', '2011-05-05 08:45:47', '2', '10113186398', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1019', null, '还需要努力[握手] //@丁东Jessica:不得不说很多方面征途2做到了…[嘻嘻]@纪学峰', '@新浪游戏播报:【拒绝一夜情 玩家畅谈心目中理想网游】什么样的网游才是玩家心目中最喜欢的网游，这一直是厂商们所关心的问题。近日，玩家们在论坛发起了心目中的理想网游话题，玩家们各抒己见，畅谈了自己认为理想网游该具备的所有条件。http://t.cn/hg6HPr<a href=\'http://ww3.sinaimg.cn/large/727cacf1jw1dgw4cbqyygj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/727cacf1jw1dgw4cbqyygj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-05 13:59:05', '2011-05-05 13:59:05', '2', '10124735606', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1020', null, '应该是1周的吧？ //@华宜永恒:请问这是多久的交易额排行榜？是最近一周？还是历史累计？要是历史累计，那征途2太牛啦！这可是新游戏呀！4月才正式公测的！', '@5173网游交易:5173网游总交易额排行榜： 1. 地下城与勇士↑1 2. 魔兽世界(国服)↓1 3. 天龙八部2↑1 4. 诛仙2↓1 5. 问道 6. 龙之谷 7. 征途2 8. 蜀门 9. 征途 10. 剑侠世界↑1', '25', '@纪学锋', null, null, '2011-05-05 14:00:15', '2011-05-05 14:00:15', '2', '10124789538', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1021', null, '感谢认可，不敢说成功，我们还在路上！', '@黑脸粉丝2:一点感悟：今天看到《征途2》的在线超30W的新闻，不知为何，心里很开心。声明一点，我不是巨人员工，也未曾和该公司有什么合作，我只想客观说下自己的感受。我们总是在仰望别人的成功，而忽略成功背后的问题。我佩服巨人甘冒风险，勇于开创的精神。我也渴望自己能够有这样的勇敢！', '25', '@纪学锋', null, null, '2011-05-05 14:04:29', '2011-05-05 14:04:29', '2', '10124983908', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1022', null, '确实，还有不少问题，公测还要过段时间，还在不停完善 //@july1011:更正下，是4月内测，非公测也！ //@纪学锋:应该是1周的吧？ //@华宜永恒:请问这是多久的交易额排行榜？是最近一周？还是历史累计？要是历史累计，那征途2太牛啦！这可是新游戏呀！4月才正式公测的！', '@5173网游交易:5173网游总交易额排行榜： 1. 地下城与勇士↑1 2. 魔兽世界(国服)↓1 3. 天龙八部2↑1 4. 诛仙2↓1 5. 问道 6. 龙之谷 7. 征途2 8. 蜀门 9. 征途 10. 剑侠世界↑1', '25', '@纪学锋', null, null, '2011-05-05 14:05:51', '2011-05-05 14:05:51', '2', '10125046736', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1023', null, '母亲节将至，快来为妈妈送上祝福吧！', '@艾尔之光:“妈妈我爱你”——母亲节贺卡传情拿惊喜激活码 母亲节就要到了，在这个特殊的日子里，我们该拿什么奉献给我们伟大的母亲呢？为此我们决定隆重开展“妈妈我爱你——母亲节贺卡传情”活动。只要上传自己亲手制作的母亲节贺卡即可参加活动，就有机会活动艾尔之光压测激活码哦http://t.cn/hgMXRP<a href=\'http://ww1.sinaimg.cn/large/67cfcc78jw1dgv5wxmtp5j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/67cfcc78jw1dgv5wxmtp5j.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-05 16:37:06', '2011-05-05 16:37:06', '2', '10131999798', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1024', null, '《巨人“试错”》--从美国硅谷视角看《征途2》尝试第三代网游商业模式的是与非 http://t.cn/hg7VPT', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dgwfr1ij7uj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dgwfr1ij7uj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-05 17:25:18', '2011-05-05 17:25:18', '2', '10134334724', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1025', null, '做互联网行业，没有谁天生就不是我们的用户，如果他不买我们的帐，说明我们做的还不够好。', '', '25', '@纪学锋', null, null, '2011-05-05 19:13:22', '2011-05-05 19:13:22', '2', '10139548524', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1026', null, '奥巴马的耳朵好奇怪', '<a href=\'http://ww3.sinaimg.cn/large/638b4670jw1dgwk3qyg3lj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/638b4670jw1dgwk3qyg3lj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-05 19:55:29', '2011-05-05 19:55:29', '2', '10141615118', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1027', null, '史总现在比这个帅多了...', '@巨人网络:《巨人“试错”》--从美国硅谷视角看《征途2》尝试第三代网游商业模式的是与非 http://t.cn/hg7VPT<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dgwfr1ij7uj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dgwfr1ij7uj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-05 20:02:15', '2011-05-05 20:02:15', '2', '10141950838', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1028', null, '哈哈，厉害啊，老徐，这个应该招过来做你老婆！！！', '@徐宥箴:我助理帮我招秘书，面试时助理问她：“你觉得作为一个秘书，最重要是要做好什么事情？”。应聘者回答：“最重要的是发现老板的错误，把老板的错误都纠正过来!”', '25', '@纪学锋', null, null, '2011-05-05 20:15:17', '2011-05-05 20:15:17', '2', '10142602210', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1029', null, '史玉柱：任何成功都离不开两点：一是专注，二是勤奋，成功要靠心血去浇灌，不可能靠投机取巧。这两点缺少任何一点，创业都很难成功。成功其实没有弯路，只要你有很好的悟性，只要你的智商正常，剩下的就是专注和勤奋。', '', '25', '@纪学锋', null, null, '2011-05-06 12:27:29', '2011-05-06 12:27:29', '2', '10174720828', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1030', null, '确实很漂亮：）', '@马全智:公司园区屋顶的花，很烂漫地开了。从窗户看出去，有种“漫山遍野”的错觉。当初设计师理念是，一年四季让屋顶开满不同颜色的鲜花。这可能是国内最大的屋顶绿植，巨人家园。<a href=\'http://ww4.sinaimg.cn/large/4728f666jw1dgxga19svqj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/4728f666jw1dgxga19svqj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-06 14:31:46', '2011-05-06 14:31:46', '2', '10181231338', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1031', null, '美丽的巨人园区 //@纪学锋:确实很漂亮：）', '@马全智:公司园区屋顶的花，很烂漫地开了。从窗户看出去，有种“漫山遍野”的错觉。当初设计师理念是，一年四季让屋顶开满不同颜色的鲜花。这可能是国内最大的屋顶绿植，巨人家园。<a href=\'http://ww4.sinaimg.cn/large/4728f666jw1dgxga19svqj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/4728f666jw1dgxga19svqj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-06 14:41:36', '2011-05-06 14:41:36', '2', '10181685378', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1032', null, '母亲节到，公司给每位员工发了一条围裙。员工可拿回家孝敬妈妈，也可亲批围裙为妈妈下厨。图为《征途2》主策划田丰披上围裙，由“主策”变身“主妇”。', '<a href=\'http://ww4.sinaimg.cn/large/64a0c959jw1dgxm7ar44sj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/64a0c959jw1dgxm7ar44sj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-06 17:53:57', '2011-05-06 17:53:57', '2', '10190726004', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1033', null, '母亲节,在开心游戏的同时，可以关心一下您的母亲哦[心]  //@马全智:刚开会回到办公桌，发现桌面上也放着一围裙，HR同事考虑的很贴心。在考虑寄回家，还是私藏了。ps，@田丰ZT2 最近忙游戏内测修改，这胡茬子长的很有大厨的范儿。', '@征途2:母亲节到，公司给每位员工发了一条围裙。员工可拿回家孝敬妈妈，也可亲批围裙为妈妈下厨。图为《征途2》主策划田丰披上围裙，由“主策”变身“主妇”。<a href=\'http://ww4.sinaimg.cn/large/64a0c959jw1dgxm7ar44sj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/64a0c959jw1dgxm7ar44sj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-06 18:06:23', '2011-05-06 18:06:23', '2', '10191341258', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1034', null, '公司园区屋顶的花，开啦开啦！下午爬上去拍了一张，感受这种“漫山遍野”的灿烂。设计师主张的理念是，一年四季让屋顶开满不同颜色的鲜花。总面积1.5万平方米，这可能是国内最大的屋顶绿化。', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dgxmq7xllej.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dgxmq7xllej.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-06 18:12:47', '2011-05-06 18:12:47', '2', '10191652388', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1035', null, '哈哈 //@慧心_陈诗惠:呀~这胡子有味道//@马全智:刚开会回到办公桌，发现桌面上也放着一围裙，HR同事考虑的很贴心。在考虑寄回家，还是私藏了。ps， @田丰ZT2  最近忙游戏内测修改，这胡茬子长的很有大厨的范儿。', '@征途2:母亲节到，公司给每位员工发了一条围裙。员工可拿回家孝敬妈妈，也可亲批围裙为妈妈下厨。图为《征途2》主策划田丰披上围裙，由“主策”变身“主妇”。<a href=\'http://ww4.sinaimg.cn/large/64a0c959jw1dgxm7ar44sj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/64a0c959jw1dgxm7ar44sj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-06 18:14:12', '2011-05-06 18:14:12', '2', '10191722466', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1036', null, '5月第二个周日（8号）是母亲节，公司给每位员工准备了一条围裙。让大家在繁忙的工作之余，能亲披围裙为妈妈下一次厨。不求美味，可贵的是一份心意，感谢HR同事的贴心！当然体贴妈妈的举动不会只在母亲节，祝全天下的母亲节日快乐！', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dgxn5k09qzj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dgxn5k09qzj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-06 18:26:47', '2011-05-06 18:26:47', '2', '10192341390', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1037', null, '转发微博。', '@巨人网络:5月第二个周日（8号）是母亲节，公司给每位员工准备了一条围裙。让大家在繁忙的工作之余，能亲披围裙为妈妈下一次厨。不求美味，可贵的是一份心意，感谢HR同事的贴心！当然体贴妈妈的举动不会只在母亲节，祝全天下的母亲节日快乐！<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dgxn5k09qzj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dgxn5k09qzj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-06 18:29:55', '2011-05-06 18:29:55', '2', '10192495356', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1038', null, '//@汤敏:// @纪学锋 :无', '@巨人网络:5月第二个周日（8号）是母亲节，公司给每位员工准备了一条围裙。让大家在繁忙的工作之余，能亲披围裙为妈妈下一次厨。不求美味，可贵的是一份心意，感谢HR同事的贴心！当然体贴妈妈的举动不会只在母亲节，祝全天下的母亲节日快乐！<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dgxn5k09qzj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dgxn5k09qzj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-06 20:19:08', '2011-05-06 20:19:08', '2', '10198075042', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1039', null, '那样你不就是提前有ipad3了？[嘻嘻]', '@丁国强:老婆前几天中奖获得了1台IPAD1。她很得意的跟我说你现在有2个ipad1了，加起来就是个2，不用买2代了。我欲哭无泪啊，招行你们搞活动送奖品不能送个ipad2啊。', '25', '@纪学锋', null, null, '2011-05-06 20:29:20', '2011-05-06 20:29:20', '2', '10198614190', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1040', null, '曾接超级喜欢汪国真的诗，总是那么的让人心动，忆往昔青葱岁月稠，现在看诗经常只是打酱油啊！', '@汪国真:#母亲节#我们也爱母亲，却和母亲爱我们不一样。我们的爱是溪流，母亲的爱是海洋，岌岌草上的露珠又圆又亮，那是太阳给予的光芒。四月的日子，半是烂漫半是辉煌，那是春风走过的地方。我们的欢乐是母亲脸上的微笑；我们的痛苦是母亲眼里深深的忧伤。我们可以走得很远很远，却总也走不出，母亲心灵的广场', '25', '@纪学锋', null, null, '2011-05-06 20:35:03', '2011-05-06 20:35:03', '2', '10198924982', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1041', null, '......，哪个学校？哪个音乐？', '@乱世清浅:今天在校园里听到一阵征途2的音乐，大惊还以为自己有沉迷到幻听的程度，结果发现是广场搞活动有人在放音乐', '25', '@纪学锋', null, null, '2011-05-07 13:19:38', '2011-05-07 13:19:38', '2', '10232531254', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1042', null, '5.1刚去过，在同一个地方拍了同样的照片，同感。北京景区管理确实太差，和城市定位不符。', '@李小萌:【 不到长城非好汉，到了长城真遗憾 】 1.长城脚下，三碗炸酱面四个凉菜，180块。2.厕所收费。3.狭窄的城门洞，人车混行，汽车疯狂鸣笛，只有外国游客高声抗议。4.买门票，问多少钱，一个声音说：“自己看! ” 5.长城边，山坡上，巨型过期标语，碍眼碍心。6.烽火台上，尿气冲天。<a href=\'http://ww2.sinaimg.cn/large/65566a88jw1dgylgtqcnij.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/65566a88jw1dgylgtqcnij.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-07 14:44:12', '2011-05-07 14:44:12', '2', '10236626532', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1043', null, '完全认同并向这个目标努力ing,[抱抱] //@落叶道:转给老公看，看完要评论！！！@纪学锋', '@冷笑话精选:结婚后男孩会对自己妻子比结婚前更好。一次聚会，朋友笑他：怎么结婚了还那么腻。他笑着说道：结婚前，很多男生都想追她，有很多男生会对她好，我只有对她更好才能追到她；结婚后，对她好的男生越来越少，我只有对她更好，才能不让她失落。说完，所有朋友都沉默了，没有嘲笑，只有敬佩。。。<a href=\'http://ww1.sinaimg.cn/large/62037b5ajw1dgyno6jnohj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/62037b5ajw1dgyno6jnohj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-07 16:38:44', '2011-05-07 16:38:44', '2', '10242001518', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1044', null, '大嘴巴要付代价滴。我不当言论得罪了健康业务全体管理层，不得不跑到国外，到其3百名骨干正在集体度假之地赔礼道歉：我错鸟，我以后不敢了。偶同时建议：选出公司最重要和贡献最大的100名骨干，组成合伙人，公司年利润的20%划拨给合伙人。但愿他们能接受，肿摸样？', '<a href=\'http://ww1.sinaimg.cn/large/638b4670jw1dgyqsoqm4tj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670jw1dgyqsoqm4tj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-07 17:19:55', '2011-05-07 17:19:55', '2', '10243969540', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1045', null, '看得见风景的房间。午后，看着窗外，幸福感油然而生••••••', '@巨人网络:公司园区屋顶的花，开啦开啦！下午爬上去拍了一张，感受这种“漫山遍野”的灿烂。设计师主张的理念是，一年四季让屋顶开满不同颜色的鲜花。总面积1.5万平方米，这可能是国内最大的屋顶绿化。<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dgxmq7xllej.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dgxmq7xllej.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-07 23:06:10', '2011-05-07 23:06:10', '2', '10263813541', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1046', null, '正在观看大象表演的健康业务骨干们，目光从大象转到我这个不速之客。打量多年没见面的昔日老板，奇怪的目光投向我穿的酒店简易拖鞋，估计他们内心在嘀咕：OMG，昔日严肃认真的老板咋这范儿，这不是马路边的小混混吗？', '<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dh0jq485gxj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dh0jq485gxj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-09 08:01:39', '2011-05-09 08:01:39', '2', '10331756301', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1047', null, '大象捏？', '@史玉柱:正在观看大象表演的健康业务骨干们，目光从大象转到我这个不速之客。打量多年没见面的昔日老板，奇怪的目光投向我穿的酒店简易拖鞋，估计他们内心在嘀咕：OMG，昔日严肃认真的老板咋这范儿，这不是马路边的小混混吗？<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dh0jq485gxj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dh0jq485gxj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-09 10:30:55', '2011-05-09 10:30:55', '2', '10337832947', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1048', null, '今天，公司食堂门口贴出了海报，引来不少同事驻足，看起来像是一个有关于我们儿时的游戏机的故事，到底这葫芦里卖的是什么药？好奇ing。', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh0x71fw4xj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh0x71fw4xj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-09 14:31:57', '2011-05-09 14:31:57', '2', '10350575149', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1049', null, '回复@DavyZhong:我说的是人生历练后对人性需求判断的准确性，和投资无关。很多人经历了很多之后也还是自以为是，把自己失败归结在客观原因，这样的人就很难成功了。估计我刚才没表达明白，呵呵。没谁能预测未来，但每个人可以把握自己的现在。 //@DavyZhong:回复@纪学锋: 算是吧....他们已经是创业成功', '@纪学锋:刚才公司一员工和我聊创业，问我如何算是领军人物，我和他说：“如果一个人能在宏观上方向对头、目标明确、低调务实；在微观上亲自死抠产品细节、对用户体验细节要求到近乎变态；管理上以身作则、以能服人、以情感人”。那么这样的人值得你追随，如果你自己能做到你就可以自己当老大了。', '25', '@纪学锋', null, null, '2011-05-09 21:53:53', '2011-05-09 21:53:53', '2', '10373571259', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1050', null, '有朋友问我对成功的定义是什么，其实每个人的定义都不一样，我对我自己成功的定义就是：成功就是一步一步实现自己的既定目标和理想，这个目标可以很小，当然也可以很大，而不是总是徘徊在自己的目标门前，停步不前甚至退缩。', '', '25', '@纪学锋', null, null, '2011-05-09 22:19:04', '2011-05-09 22:19:04', '2', '10375305563', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1051', null, 'http://t.cn/hg1ay5；小人！！', '', '25', '@纪学锋', null, null, '2011-05-10 11:40:53', '2011-05-10 11:40:53', '2', '10398928957', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1052', null, '巨人网络第一部电影即将闪亮登场，全部由巨人员工自编、自导、自演的回忆我们青葱岁月的电影《玩大的》，今晚内部首映。期待ing，游戏公司的人不但能玩着做出好游戏，也能玩着拍出好电影。在巨人，工作就是玩，玩就是工作，喜欢这种氛围！', '@淡云:再多各自牛逼的岁月，也比不上一起傻逼的岁月……怀念一起为了纪念“玩大的”曾经，努力拍摄的每一天，每一刻，也希望看到的人会感叹一句：当年，我也这样！http://t.cn/hguMPx', '25', '@纪学锋', null, null, '2011-05-10 12:07:48', '2011-05-10 12:07:48', '2', '10400296307', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1053', null, '欢迎各位有条件的同事朋友前来观映，可自带女眷，板凳，可乐，爆米花 //@纪学锋:巨人网络第一部电影即将闪亮登场，全部由巨人员工自编、自导、自演的回忆我们青葱岁月的电影#玩大的#，今晚内部首映。期待ing，游戏公司的人不但能玩着做出好游戏，也能玩着拍出好电影。在巨人，工作就是玩，玩就是工作。', '@淡云:再多各自牛逼的岁月，也比不上一起傻逼的岁月……怀念一起为了纪念“玩大的”曾经，努力拍摄的每一天，每一刻，也希望看到的人会感叹一句：当年，我也这样！http://t.cn/hguMPx', '27', '@巨人网络', null, null, '2011-05-10 12:37:08', '2011-05-10 12:37:08', '2', '10401915149', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1054', null, '再多各自牛逼的时光，也比不上一起傻逼的岁月--巨人网络第一部员工自拍微电影#玩大的#，即将闪亮登场。全部由巨人员工自编、自导、自演，追忆缅怀70、80后在电子游戏中走过的青葱岁月。影片今晚在公司内部“全球”首映，期待ing。我们不仅能玩着做出好游戏，也能玩着拍出好电影。http://t.cn/hg132T', '', '27', '@巨人网络', null, null, '2011-05-10 14:46:37', '2011-05-10 14:46:37', '2', '10409043383', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1055', null, '[抱抱]  //@慧心_陈诗惠:看一次 哭一次~//@詹早早：5个月的筹备-拍摄-制作，心血浇灌，唯求诚恳。', '@汤敏:兴趣是最好的老师。公司很多员工,从小痴迷游戏,对被“毒害”的青春,一往情深。以他们的经历为背景、自编自导自演的影片《玩大的》,今天全球首映。<a href=\'http://ww1.sinaimg.cn/large/6331ea33jw1dh247rvsn8j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6331ea33jw1dh247rvsn8j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-10 15:24:21', '2011-05-10 15:24:21', '2', '10410842303', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1056', null, '哈哈 //@汤敏:回复@盛轶炯:没潜规则导演，所以没机会出镜[哼] //@盛轶炯:好期盼。。。晚上看首映。。。汤姐在片中客串了没。。。', '@汤敏:兴趣是最好的老师。公司很多员工,从小痴迷游戏,对被“毒害”的青春,一往情深。以他们的经历为背景、自编自导自演的影片《玩大的》,今天全球首映。<a href=\'http://ww1.sinaimg.cn/large/6331ea33jw1dh247rvsn8j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6331ea33jw1dh247rvsn8j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-10 15:46:51', '2011-05-10 15:46:51', '2', '10411917911', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1057', null, '#玩大的#今天晚上兔子要出席一部电影的首映，咳~咳~兔子也要走红地毯啦~~~没错，这部电影兔子亲自参与演出，HOHO~请叫我死跑龙套滴~先放一张非常给力的海报！大家想看高清无码无删减版正片吗？！吼来来~转起来~顶起来~~~~~', '<a href=\'http://ww1.sinaimg.cn/large/64a0c959jw1dh2653f38cj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/64a0c959jw1dh2653f38cj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-10 16:25:50', '2011-05-10 16:25:50', '2', '10413814691', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1058', null, '期待中……//@纪学锋：哈哈 //@汤敏:回复@盛轶炯:没潜规则导演，所以没机会出镜[哼] //@盛轶炯:好期盼。。。晚上看首映。。。汤姐在片中客串了没。。。', '@汤敏:兴趣是最好的老师。公司很多员工,从小痴迷游戏,对被“毒害”的青春,一往情深。以他们的经历为背景、自编自导自演的影片《玩大的》,今天全球首映。<a href=\'http://ww1.sinaimg.cn/large/6331ea33jw1dh247rvsn8j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6331ea33jw1dh247rvsn8j.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-10 17:00:49', '2011-05-10 17:00:49', '2', '10415596765', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1059', null, '以前一提起人妖，我顿感恶心。陪大家看了一场大型人妖表演，改变了我的偏见，原来人妖也可以这么女人，漂亮和性感。', '', '28', '@史玉柱', null, null, '2011-05-10 17:35:47', '2011-05-10 17:35:47', '2', '10417386437', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1060', null, '那啥，我好像真瘦了哈[酷] //@淡云:这么小的人影你也看得出来？ //@沈迪锋_司马德操:左边的妹子是@淡云 ？', '@慧心_陈诗惠:《玩大的》制片方讲话~[哈哈]<a href=\'http://ww1.sinaimg.cn/large/643edb89jw1dh2dnt0n8lj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/643edb89jw1dh2dnt0n8lj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-10 21:49:01', '2011-05-10 21:49:01', '2', '10431340779', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1061', null, '同感ing //@淡云:重逢的一幕看了好多遍了，依旧有要落泪的冲动。', '@田丰ZT2:刚刚参加完《玩大的》内部首映，第一次完整的看完了整个影片，被感动了[泪] ，勾起了一大堆小时候的回忆。的确，我们是玩大的一代，每个人小时候都有一个关于“游戏”的梦，也许她已经很久远，但却藏在记忆的最深处。', '25', '@纪学锋', null, null, '2011-05-10 21:49:48', '2011-05-10 21:49:48', '2', '10431391669', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1062', null, '呵呵 //@朱威廉:Skype虽然没有利润，但却是一家有道德并且值得用户信赖的公司。85亿美元值得。', '@唐骏:微软要以85亿美元收购SKYPE,一家有用户没有利润的公司,不值这么多！只能说微软实在需要一家有用户的互联网公司,当年微软没有收购雅虎是正确的,要是现在不收购S,也会是个正确的决定…', '25', '@纪学锋', null, null, '2011-05-10 22:35:43', '2011-05-10 22:35:43', '2', '10434571709', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1063', null, '转发微博。', '@马全智:晚上站着把《玩大的》内部首映看完了。这是首部巨人员工自制微电影，片长40分钟，有笑点，有泪点，无尿点。站了40分钟不是学姜文，到的晚没位置了。不多做剧透，请大家期待5月18日的正式首映。 http://t.cn/hg132T', '25', '@纪学锋', null, null, '2011-05-10 22:54:15', '2011-05-10 22:54:15', '2', '10435880921', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1064', null, '(^_-) //@期待电影: “山本娜蒙”必需通知卢浮宫典藏 //@TON-T:[给力]', '@微博搞笑排行榜:蒙娜丽山的微笑！[威武] [哈哈]<a href=\'http://ww2.sinaimg.cn/large/6628711bgw6dbw8m7g39nj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6628711bgw6dbw8m7g39nj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-10 23:05:17', '2011-05-10 23:05:17', '2', '10436643077', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1065', null, '今晚看了首映，一点怀旧、一点感动、一点惊喜••••••一部倾注情感的创作，一种呼之欲出的表达﹣≪玩大的≫', '@巨人网络:再多各自牛逼的时光，也比不上一起傻逼的岁月--巨人网络第一部员工自拍微电影#玩大的#，即将闪亮登场。全部由巨人员工自编、自导、自演，追忆缅怀70、80后在电子游戏中走过的青葱岁月。影片今晚在公司内部“全球”首映，期待ing。我们不仅能玩着做出好游戏，也能玩着拍出好电影。http://t.cn/hg132T', '30', '@巨人刘伟', null, null, '2011-05-10 23:13:26', '2011-05-10 23:13:26', '2', '10437183363', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1066', null, '//@巨人刘伟:今晚看了首映，一点怀旧、一点感动、一点惊喜••••••一部倾注情感的创作，一种呼之欲出的表达﹣≪玩大的≫', '@巨人网络:再多各自牛逼的时光，也比不上一起傻逼的岁月--巨人网络第一部员工自拍微电影#玩大的#，即将闪亮登场。全部由巨人员工自编、自导、自演，追忆缅怀70、80后在电子游戏中走过的青葱岁月。影片今晚在公司内部“全球”首映，期待ing。我们不仅能玩着做出好游戏，也能玩着拍出好电影。http://t.cn/hg132T', '25', '@纪学锋', null, null, '2011-05-10 23:16:40', '2011-05-10 23:16:40', '2', '10437398705', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1067', null, '//@巨人刘伟：今晚看了首映，一点怀旧、一点感动、一点惊喜••••••一部倾注情感的创作，一种呼之欲出的表达﹣≪玩大的≫', '@巨人网络:再多各自牛逼的时光，也比不上一起傻逼的岁月--巨人网络第一部员工自拍微电影#玩大的#，即将闪亮登场。全部由巨人员工自编、自导、自演，追忆缅怀70、80后在电子游戏中走过的青葱岁月。影片今晚在公司内部“全球”首映，期待ing。我们不仅能玩着做出好游戏，也能玩着拍出好电影。http://t.cn/hg132T', '26', '@征途2', null, null, '2011-05-10 23:21:21', '2011-05-10 23:21:21', '2', '10437702079', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1068', null, '我勒个去，玩起电影啦？不让我演，还不让我看，得！得！得！我等18号公映。 //@巨人刘伟:今晚看了首映，一点怀旧、一点感动、一点惊喜••••••一部倾注情感的创作，一种呼之欲出的表达﹣≪玩大的≫', '@巨人网络:再多各自牛逼的时光，也比不上一起傻逼的岁月--巨人网络第一部员工自拍微电影#玩大的#，即将闪亮登场。全部由巨人员工自编、自导、自演，追忆缅怀70、80后在电子游戏中走过的青葱岁月。影片今晚在公司内部“全球”首映，期待ing。我们不仅能玩着做出好游戏，也能玩着拍出好电影。http://t.cn/hg132T', '28', '@史玉柱', null, null, '2011-05-10 23:54:42', '2011-05-10 23:54:42', '2', '10439651869', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1069', null, '[害羞] //@史玉柱:我勒个去，玩起电影啦？不让我演，还不让我看，得！得！得！我等18号公映。 //@巨人刘伟:今晚看了首映，一点怀旧、一点感动、一点惊喜••••••一部倾注情感的创作，一种呼之欲出的表达﹣≪玩大的≫', '@巨人网络:再多各自牛逼的时光，也比不上一起傻逼的岁月--巨人网络第一部员工自拍微电影#玩大的#，即将闪亮登场。全部由巨人员工自编、自导、自演，追忆缅怀70、80后在电子游戏中走过的青葱岁月。影片今晚在公司内部“全球”首映，期待ing。我们不仅能玩着做出好游戏，也能玩着拍出好电影。http://t.cn/hg132T', '25', '@纪学锋', null, null, '2011-05-11 00:03:39', '2011-05-11 00:03:39', '2', '10440110817', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1070', null, '刚公布的CPI为5.3，略低于3月的5.4，让鼻孔插葱的经济学家蒙对了。', '@史玉柱:预测即将公布的4月CPII略低于3月，6月达到高点后将一路下跌，年底跌到三点多。主要目标将应该由防通胀，改为保增长保就业。', '28', '@史玉柱', null, null, '2011-05-11 10:17:25', '2011-05-11 10:17:25', '2', '10453214831', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1071', null, '威武！！！ //@史玉柱:刚公布的CPI为5.3，略低于3月的5.4，让鼻孔插葱的经济学家蒙对了。', '@史玉柱:预测即将公布的4月CPII略低于3月，6月达到高点后将一路下跌，年底跌到三点多。主要目标将应该由防通胀，改为保增长保就业。', '26', '@征途2', null, null, '2011-05-11 10:21:12', '2011-05-11 10:21:12', '2', '10453410233', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1072', null, '#玩大的#昨天首映大获成功，全场轰动，兔子也圆了一把电影梦。想看么~么~么~么~么~？HOHO，先放个预告片给大家抢鲜一下~~http://t.cn/hguMPx', '', '26', '@征途2', null, null, '2011-05-11 11:18:07', '2011-05-11 11:18:07', '2', '10456500229', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1073', null, '转发微博。', '@徐宥箴:新人分辨哪个公司值得去，就像买股票。你不应该找市值最高的股票(比如中石化)，应该去成长性高的公司。想想从现在起，哪个公司最可能5年市值翻３倍，就去哪个公司。公司高速成长必然与员工平均实力成长成正比的。应该去最需要你且有足够实力买得起单的公司那。和公司大小无关。', '25', '@纪学锋', null, null, '2011-05-11 12:38:43', '2011-05-11 12:38:43', '2', '10460724358', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1074', null, '巨人微博MM瑶瑶：昨天，《玩大的》在同事们的期待下终于首映了！臭美一下，瑶瑶这次很意外地被选为影片女主角--妞儿的扮演者，妞儿是男猪脚黑胖的妹妹，眼镜的“梦中情人”，是个经常跟在两个男生后面的“小尾巴”，瑶瑶的演技如何，还要大家看过影片以后再给出评价了。', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh3dl40rwij.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh3dl40rwij.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-11 17:32:14', '2011-05-11 17:32:14', '2', '10475766138', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1075', null, '哈哈，我的不大，pc的脸才大//@大麦的兜响当当:哈哈[哈哈] 看到大饼形容好逗 //@汤敏:回复 @巨人刘伟:你是脸小，俺是被两张大饼脸遮住了[偷笑] //@巨人刘伟:咱俩的小脸都看不着了，早知坐第一排了[哈哈]', '@汤敏:《玩大的》昨晚首映,片子和首映仪式,给我很多感慨。片子品质,在观众热烈的掌声中得到肯定。做这件事,看到很多自发、充满激情投入的人,集体沉浸在不求功利、尽情挥洒才华的氛围中——回到简单、纯粹的快乐,一如《玩大的》娓娓叙述的点滴。<a href=\'http://ww1.sinaimg.cn/large/6331ea33jw1dh31jmk9lwj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6331ea33jw1dh31jmk9lwj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-11 17:39:30', '2011-05-11 17:39:30', '2', '10476154006', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1076', null, '是啊，祝贺师姐龚海燕。 //@落叶道:我和老公 @纪学锋 也是世纪佳缘上认识的。', '@陈志武:世纪佳缘一小时后在纳斯达克上市,IPO 价格每股11美元,市值3亿5美元。草根创业,你也能！祝贺龚海燕！<a href=\'http://ww2.sinaimg.cn/large/48e12262jw1dh3ivzjqilj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/48e12262jw1dh3ivzjqilj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-11 21:34:13', '2011-05-11 21:34:13', '2', '10489197112', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1077', null, '回复@永璞:呵呵，我和我老婆认识的时候，世纪佳缘还很小，龚和我都住在复旦北区，捧师姐场注册的，真的没想到有今天呢，恭喜她，她创业确实出于成人之美的爱心，很不容易。 //@永璞:转发此微博:真人宣传，这个效果好！/@纪学锋:是啊，祝贺师姐龚海燕。 @落叶道 :我和老公  @纪学锋  也是世纪佳缘上认识', '@陈志武:世纪佳缘一小时后在纳斯达克上市,IPO 价格每股11美元,市值3亿5美元。草根创业,你也能！祝贺龚海燕！<a href=\'http://ww2.sinaimg.cn/large/48e12262jw1dh3ivzjqilj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/48e12262jw1dh3ivzjqilj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-11 21:42:44', '2011-05-11 21:42:44', '2', '10489738130', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1078', null, '回复@许单单-互联网分析师:网游厂商必须随着用户喜好变化改变自己的设计内容和理念。任何事物都是随着时间和环境变化的，只有我们设计的核心始终追寻着当前用户的真正需求和喜好，才能不被抛弃。网游是如此，甚至每个行业可能都是如此。 //@许单单-互联网分析师:回复@纪学锋:不知道这轮泡沫之后，市场', '@许单单-互联网分析师:人人网破发啦！破发啦！！！！！发行价14元，现在13.9元<a href=\'http://ww2.sinaimg.cn/large/5ce0f950jw1dh3koeekjfj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/5ce0f950jw1dh3koeekjfj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-11 22:41:51', '2011-05-11 22:41:51', '2', '10493771268', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1079', null, '爱 //@一块去旅行: 最爱绿茶口味了', '@美食工场:抹茶控们，快来看啊~~有沒有嗅到淡淡的抹茶味了么？[鼓掌] <a href=\'http://ww1.sinaimg.cn/large/76c3809cjw1dh37zrs84vj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/76c3809cjw1dh37zrs84vj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-11 23:03:39', '2011-05-11 23:03:39', '2', '10495312527', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1080', null, '2万亿元占中国国民经济比重小吗？服务器歇菜会影响多少中小企业和个人？美国和日本人卖掉阿里巴巴集团部分股权，股份比例降到50%以下，赚几十亿美金现金后，剩下股份全是净赚的，他们赚的少吗？美国人日本人赖着控股权，中国政府能安心吗？', '', '28', '@史玉柱', null, null, '2011-05-12 03:43:20', '2011-05-12 03:43:20', '2', '10503121717', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1081', null, '@征途2 #《征途2》NPC配音大赛#\"一分钟、一句话、一千元！\" 你的一句话，不仅能获得1000元，还将长留在《征途2》游戏中，数百万玩家侧耳倾听！机会难得，快来参加！ 活动地址：http://t.cn/hgkyG2', '<a href=\'http://ww2.sinaimg.cn/large/64a0c959jw1dh471bb6boj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/64a0c959jw1dh471bb6boj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-12 10:29:33', '2011-05-12 10:29:33', '2', '10512717605', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1082', null, '《玩大的》仅预告片在微博上对外公布以后，就达到了剧组同事们的预期效果：引起了观众们对于自己童年游戏时代的回忆。期待完整版对外公映以后大家的观后感。----《玩大的》编剧早早', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh485pco3xj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh485pco3xj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-12 11:06:55', '2011-05-12 11:06:55', '2', '10514747235', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1083', null, '华为收购美国20人公司，国会否决。如果在美国一企业的平台支撑百万企业万亿交易，其数据库实时反映国民经济，比总统报表早一个月。这家新型金融企业被中国人控股，国会早已下狠手。企业做大靠的是德，阿里契约精神当然不需你我操心，我操心爱国流氓这只破草帽会让马云愤慨，索回奥巴马。大嘴巴不好当啊', '', '28', '@史玉柱', null, null, '2011-05-12 12:00:44', '2011-05-12 12:00:44', '2', '10517630087', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1084', null, '//@虞锋:中海油、中铝等等哪个收购老外批准了？老美金融危机时让中投投的那些金融机构哪个让我们进了董事会？一个涉及几亿人金融数据的公司应该由老外控制？雅虎不是今天才知道中国金融政策，但在中美战略峰会当口提这个问题让美国政府来压中国，不就是为了谈个好价钱？', '@史玉柱:华为收购美国20人公司，国会否决。如果在美国一企业的平台支撑百万企业万亿交易，其数据库实时反映国民经济，比总统报表早一个月。这家新型金融企业被中国人控股，国会早已下狠手。企业做大靠的是德，阿里契约精神当然不需你我操心，我操心爱国流氓这只破草帽会让马云愤慨，索回奥巴马。大嘴巴不好当啊', '28', '@史玉柱', null, null, '2011-05-12 12:56:56', '2011-05-12 12:56:56', '2', '10520823432', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1085', null, '几百万企业几亿人的金融数据的控制权，美国政府对中国政府正在进行的施压力不可怕，中国的“仁义君子”们乱扣帽子才可怕。', '', '28', '@史玉柱', null, null, '2011-05-12 13:48:17', '2011-05-12 13:48:17', '2', '10523758878', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1086', null, '再多各自牛逼的时光，也比不上一起傻逼的岁月......', '', '25', '@纪学锋', null, null, '2011-05-12 14:24:35', '2011-05-12 14:24:35', '2', '10525503642', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1087', null, '《征途2》再次给力！再开新区！  2011年5月13日17:00 ，我们将再开放两组新服：    电信：缥缈凌云          网通：剑荡乾坤            官网地址：http://t.cn/hePGoF 希望大家喜欢！希望大家像我一样期待！[花] [花] [花]', '', '26', '@征途2', null, null, '2011-05-12 16:06:50', '2011-05-12 16:06:50', '2', '10530358738', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1088', null, '巨人第一部员工自拍微电影#玩大的#，全部由员工自编、自导、自演，追忆70、80后在电子游戏中走过的青葱岁月。今年唯一入围戛纳电影节华语片导演给它评语是：电影是用激情拍出来的！一个由网游公司员工组成的“草台班子”折腾了大半年。往往能够带来新奇和突破的都是跨行之举。 http://t.cn/hge8c6', '', '27', '@巨人网络', null, null, '2011-05-12 18:34:06', '2011-05-12 18:34:06', '2', '10537435454', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1089', null, '奥巴马拉便便，架势贼难看。我不经意一句“爱国流氓”的调侃惹恼了马云，都不接我电话，小气鬼！关于奥巴马去留，律师给我说：“马云当初的口头契约是：除了交配权，其他都无偿赠与你了。马云是不会索回的”。哎，伤不起啊伤不起！！！以后不做大嘴巴了...', '<a href=\'http://ww3.sinaimg.cn/large/638b4670jw1dh4kro74ioj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/638b4670jw1dh4kro74ioj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-12 18:38:12', '2011-05-12 18:38:12', '2', '10537638324', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1090', null, '现在估计不行了吧，哈哈，邹导现在应该在戛纳吧？//@期待电影:魂斗罗3条命起步我曾经能打通关，当时老兴奋了！', '@巨人网络:《玩大的》仅预告片在微博上对外公布以后，就达到了剧组同事们的预期效果：引起了观众们对于自己童年游戏时代的回忆。期待完整版对外公映以后大家的观后感。----《玩大的》编剧早早<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh485pco3xj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh485pco3xj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-12 19:56:11', '2011-05-12 19:56:11', '2', '10541586506', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1091', null, '5月13日消息，巨人网络(纽交所:GA)发布了截止于2011年03月31日未经审计的第一季度财报。报告显示，巨人网络2011年第一季度净营收4.033亿人民币(约合6160万美元)，环比增长9.6%，同比增长32.5%；第一季度净利润为2.621亿人民币(约合4000万美元)，环比增长13.3%，同比增长41.5%。http://t.cn/he7dh3', '', '27', '@巨人网络', null, null, '2011-05-13 09:34:49', '2011-05-13 09:34:49', '2', '10566012612', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1092', null, '《征途2》仍处测试阶段 最高在线人数破30万http://t.cn/he7Fbe 巨人网络副总裁纪学锋今天称，《征途2》首创的第三代商业模式——公平游戏模式已成为行业焦点。玩家热烈追捧，以及其他厂商纷纷跟进的态势表明，这一模式可能成为网游新一代主流模式。', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh5b5rm4yhj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh5b5rm4yhj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-13 09:36:33', '2011-05-13 09:36:33', '2', '10566098656', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1093', null, '《征途2》什么时候公测，做更大规模宣传？巨人网络副总裁、《征途2》制作人纪学锋在财报会议后回答分析师提问时表示，公测节点会结合游戏性的修改进度和宣传节奏定。《征途2》预计会在今年第三季度或第四季度，开始大规模推广。背景资料：《征途2》目前处于内测阶段，最高在线已突破30万人。', '', '27', '@巨人网络', null, null, '2011-05-13 09:57:45', '2011-05-13 09:57:45', '2', '10567103694', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1094', null, '总裁刘伟：巨人网络走精品战略，未来主要精力放在自主研发网游上。同时公司看好两个领域，一是网游与社区的融合，二是在互联网内以及其他在中国高成长的投资机会。希望通过好的投资机会，给股东带来更好回报。', '', '27', '@巨人网络', null, null, '2011-05-13 10:23:53', '2011-05-13 10:23:53', '2', '10568373542', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1095', null, '转发微博。', '@董小刚1978:我国首款自主知识产权的军事游戏《光荣使命》研发成功 http://t.cn/hezUqV  （分享自 @新浪视频）', '25', '@纪学锋', null, null, '2011-05-13 10:31:07', '2011-05-13 10:31:07', '2', '10568726414', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1096', null, '巨人网络GA今发布一季报：季净利润4000万美元，同比+31%；现金储备9.4亿美元。已连续5个季度收入环比上升，现仍保持上升态势。GA策略保守，对外无负债，投资谨慎。GA继续坚持不做未成年市场，不许未成年注册。我没过问的征途2势头很好，同时在线已突破30万人，继续增长中，这很有意义：现管理层比我牛', '', '28', '@史玉柱', null, null, '2011-05-13 10:41:34', '2011-05-13 10:41:34', '2', '10569248478', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1097', null, '转发微博。', '@新浪科技:南京军区携手地方企业研发完成军事游戏《光荣使命》，拥有完全自主知识产权，填补了我军军事游戏空白。该游戏以代号为“光荣使命”的大型实兵对抗演习为主线，分为“基础训练、单兵任务、班组对抗”三个模块，涵盖军事、政治、后装基础知识。http://t.cn/hezfpZ http://t.cn/hezUqV<a href=\'http://ww3.sinaimg.cn/large/61e89b74jw1dh5axrfdxsj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/61e89b74jw1dh5axrfdxsj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-13 10:44:09', '2011-05-13 10:44:09', '2', '10569379448', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1098', null, '[偷笑]', '@史玉柱:巨人网络GA今发布一季报：季净利润4000万美元，同比+31%；现金储备9.4亿美元。已连续5个季度收入环比上升，现仍保持上升态势。GA策略保守，对外无负债，投资谨慎。GA继续坚持不做未成年市场，不许未成年注册。我没过问的征途2势头很好，同时在线已突破30万人，继续增长中，这很有意义：现管理层比我牛', '25', '@纪学锋', null, null, '2011-05-13 10:52:15', '2011-05-13 10:52:15', '2', '10569780002', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1099', null, '我去无锡巨人研发基地看过，团队不错，军方支持很大，产品社会效益大于经济效益。产品还需要继续完善。我给研发留一句话：好游戏是改出来的。', '@新浪科技:南京军区携手地方企业研发完成军事游戏《光荣使命》，拥有完全自主知识产权，填补了我军军事游戏空白。该游戏以代号为“光荣使命”的大型实兵对抗演习为主线，分为“基础训练、单兵任务、班组对抗”三个模块，涵盖军事、政治、后装基础知识。http://t.cn/hezfpZ http://t.cn/hezUqV<a href=\'http://ww3.sinaimg.cn/large/61e89b74jw1dh5axrfdxsj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/61e89b74jw1dh5axrfdxsj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-13 11:32:54', '2011-05-13 11:32:54', '2', '10571815108', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1100', null, '80、90甚至70后，每个人都玩过游戏，青涩的岁月里，都会有很多不羁的想法，有很多天马行空的梦想，尽管电子游戏背负很多骂名，但我们这一代人，依然享受着游戏带来的单纯快乐，游戏伴随着我们成长，我们其中的许多人，更是怀着一个游戏梦想而成为一名游戏制作者。继续《玩大的》', '@淡云:新一版预告片上了，TX们可以围观鸟http://t.cn/heZzao', '25', '@纪学锋', null, null, '2011-05-13 12:03:12', '2011-05-13 12:03:12', '2', '10573244874', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1101', null, '回复@荒漠甘泉V:自己拍着玩的，呵呵。我们就是一群爱玩的人 //@荒漠甘泉V:你们是打算进军电影产业分一杯羹是把', '@淡云:新一版预告片上了，TX们可以围观鸟http://t.cn/heZzao', '25', '@纪学锋', null, null, '2011-05-13 12:16:00', '2011-05-13 12:16:00', '2', '10573833220', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1102', null, '回复@徐宥箴:我觉得你看了肯定比我有感触，我基本还是个乖学生，你就是个逃学玩游戏被家长追着打的“坏孩子”。[嘻嘻] //@徐宥箴:我一定会去看的', '@淡云:新一版预告片上了，TX们可以围观鸟http://t.cn/heZzao', '25', '@纪学锋', null, null, '2011-05-13 13:35:46', '2011-05-13 13:35:46', '2', '10578411170', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1103', null, '转发微博。', '@巨人网络:《征途2》什么时候公测，做更大规模宣传？巨人网络副总裁、《征途2》制作人纪学锋在财报会议后回答分析师提问时表示，公测节点会结合游戏性的修改进度和宣传节奏定。《征途2》预计会在今年第三季度或第四季度，开始大规模推广。背景资料：《征途2》目前处于内测阶段，最高在线已突破30万人。', '26', '@征途2', null, null, '2011-05-13 16:22:30', '2011-05-13 16:22:30', '2', '10586091824', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1104', null, '转发微博。', '@巨人网络:《征途2》仍处测试阶段 最高在线人数破30万http://t.cn/he7Fbe 巨人网络副总裁纪学锋今天称，《征途2》首创的第三代商业模式——公平游戏模式已成为行业焦点。玩家热烈追捧，以及其他厂商纷纷跟进的态势表明，这一模式可能成为网游新一代主流模式。<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh5b5rm4yhj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh5b5rm4yhj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-13 16:22:40', '2011-05-13 16:22:40', '2', '10586100028', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1105', null, '呵呵', '@许单单-互联网分析师:【巨人一季度财报】低头不语的巨人今日发布了财报，一季度收入4亿，净利润2.62亿，净利率66%。付费用户178万，arpu是216元。人人网一季度收入1.3亿但亏损，优酷收入1.2亿也亏损，新浪收入6.5亿净利润1.1亿，不到巨人的一半。巨人市值21亿，新浪71、优酷48亿、人人50亿。叫的欢的未必赚钱！<a href=\'http://ww4.sinaimg.cn/large/5ce0f950jw1dh5lx12g87j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5ce0f950jw1dh5lx12g87j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-13 18:12:38', '2011-05-13 18:12:38', '2', '10591459982', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1106', null, '回复@许单单-互联网分析师:[握手] 网游行业产品为王，踏实做出好游戏才是硬道理。包装大概念俺们不擅长，也觉得没必要。 //@许单单-互联网分析师:恭喜恭喜，我本来预测就很乐观，结果还是超我预期啊 //@纪学锋:呵呵', '@许单单-互联网分析师:【巨人一季度财报】低头不语的巨人今日发布了财报，一季度收入4亿，净利润2.62亿，净利率66%。付费用户178万，arpu是216元。人人网一季度收入1.3亿但亏损，优酷收入1.2亿也亏损，新浪收入6.5亿净利润1.1亿，不到巨人的一半。巨人市值21亿，新浪71、优酷48亿、人人50亿。叫的欢的未必赚钱！<a href=\'http://ww4.sinaimg.cn/large/5ce0f950jw1dh5lx12g87j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5ce0f950jw1dh5lx12g87j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-13 18:50:47', '2011-05-13 18:50:47', '2', '10593305628', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1107', null, '哈哈，因为我人长的丑，公司作风保守。如果我整整容，公司四处乱投资搞些概念，估计巨人市值能翻番。声明：我不是大嘴巴。', '@许单单-互联网分析师:【巨人一季度财报】低头不语的巨人今日发布了财报，一季度收入4亿，净利润2.62亿，净利率66%。付费用户178万，arpu是216元。人人网一季度收入1.3亿但亏损，优酷收入1.2亿也亏损，新浪收入6.5亿净利润1.1亿，不到巨人的一半。巨人市值21亿，新浪71、优酷48亿、人人50亿。叫的欢的未必赚钱！<a href=\'http://ww4.sinaimg.cn/large/5ce0f950jw1dh5lx12g87j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5ce0f950jw1dh5lx12g87j.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-13 21:26:52', '2011-05-13 21:26:52', '2', '10601617016', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1108', null, '//@史玉柱:哈哈，因为我人长的丑，公司作风保守。如果我整整容，公司四处乱投资搞些概念，估计巨人市值能翻番。声明：我不是大嘴巴。', '@许单单-互联网分析师:【巨人一季度财报】低头不语的巨人今日发布了财报，一季度收入4亿，净利润2.62亿，净利率66%。付费用户178万，arpu是216元。人人网一季度收入1.3亿但亏损，优酷收入1.2亿也亏损，新浪收入6.5亿净利润1.1亿，不到巨人的一半。巨人市值21亿，新浪71、优酷48亿、人人50亿。叫的欢的未必赚钱！<a href=\'http://ww4.sinaimg.cn/large/5ce0f950jw1dh5lx12g87j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/5ce0f950jw1dh5lx12g87j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-13 21:32:39', '2011-05-13 21:32:39', '2', '10601954506', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1109', null, '同感，是否应该对造谣、传谣的行为追责？而不仅仅是辟谣。', '@老沉:一些极端明显的谣言，仍然被一些影响巨大的V用户毫无顾忌地转载？真是匪夷所思，如此神奇的国度，老汉我欲哭无泪。', '25', '@纪学锋', null, null, '2011-05-13 22:19:11', '2011-05-13 22:19:11', '2', '10604860462', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1110', null, '//@老沉:针对这个词汇，胡总的团队至少是作了认真考证的，严肃的事情要三思而后行，多少人能做到呢？', '@胡锡进:希拉里在辱没自己的国务卿之尊。她日前批评中国人权，称中国“试图阻止历史”，是“fool’s errand”。北大英语教授王逢鑫说，这个词组是指做蠢事、傻事、徒劳的事，显然是贬义词。高官不是媒体，她作为美国第一外交官尤其不得无礼。20名受访中国学者大多数认为她外交失礼，其中12人认为她应做出解释。', '25', '@纪学锋', null, null, '2011-05-13 22:59:30', '2011-05-13 22:59:30', '2', '10607517828', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1111', null, ' //@李宁中欧: 回复@春雨中的小伞: 吴老说之所以他坚持来面授，是希望我们不用花更多的精力看很多书，就能了解他们经历了半世纪的中国经济改革的历程。一天课下来，我想吴老真正希望的是我们能正确理解目前经济现象背后的实质，在当今的十字路口，在国家主导和自由市场争辩中保持清醒的认识。', '@李宁中欧:81岁高龄的吴敬琏教授坚持亲自给同学授课中国经济 感动！<a href=\'http://ww2.sinaimg.cn/large/692ba552jw1dh5ap2g818j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/692ba552jw1dh5ap2g818j.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-14 09:14:28', '2011-05-14 09:14:28', '2', '10619855057', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1112', null, '分析用户数据很有意思，这两年玩家行为变化很大，以往都是周末人最多，现在不是了；现在人均每天在线时间减少，但是每日人均登陆次数大幅增加了；用户行为在变，我们也要随着变，调整自己的游戏内容，别给用户增加负担，多给用户快乐。多观察，缓下结论对做游戏的和分析别人游戏的人都适用。', '', '25', '@纪学锋', null, null, '2011-05-14 13:31:47', '2011-05-14 13:31:47', '2', '10631638170', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1113', null, '所有应该都是90%[酷] //@微博搞笑排行榜:有道理！[哈哈]', '@最喷饭:一部高档手机，70%的功能都是没用的；一款高档轿车，70%的速度都是多余的；一幢豪华别墅，70%的面积都是空闲的；一个科研单位，70%的设备都是摆样的；一所名牌大学，70%的教授都是扯淡的；一把美女情人，70%都是帮着别人养的。<a href=\'http://ww3.sinaimg.cn/large/6b72e8degw1dh4kc5k2eij.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6b72e8degw1dh4kc5k2eij.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-14 14:30:06', '2011-05-14 14:30:06', '2', '10634326098', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1114', null, '好熟悉的黄色马路牙，记得刷上黄色马路牙的第二天就看到陈小春在复旦校园拍《第一次亲密接触》。一晃好多年过去了...', '@复旦大学:#早安·复旦#<a href=\'http://ww4.sinaimg.cn/large/671386f7jw1dh5a2734enj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/671386f7jw1dh5a2734enj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-14 16:21:20', '2011-05-14 16:21:20', '2', '10639102376', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1115', null, '史玉柱、曹国伟、马化腾、李彦宏、江南春...这些互联网大佬如果聚在一起搞个拍卖，会拿出怎样的镇宅之宝，来让大家开眼界呢？在今晚由爱佑华夏慈善基金会主办的“2011爱佑心生慈善晚宴”中，这些悬念将一一揭晓。晚宴今晚17：30在北京盘古酒店举办，巨人网络官方微博带来前方一手资料。', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dh6u85j1v1j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dh6u85j1v1j.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 17:21:35', '2011-05-14 17:21:35', '2', '10641910754', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1116', null, '曝料，曝料：跟俺征途兔有关！', '@巨人网络:史玉柱、曹国伟、马化腾、李彦宏、江南春...这些互联网大佬如果聚在一起搞个拍卖，会拿出怎样的镇宅之宝，来让大家开眼界呢？在今晚由爱佑华夏慈善基金会主办的“2011爱佑心生慈善晚宴”中，这些悬念将一一揭晓。晚宴今晚17：30在北京盘古酒店举办，巨人网络官方微博带来前方一手资料。<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dh6u85j1v1j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dh6u85j1v1j.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-14 17:25:06', '2011-05-14 17:25:06', '2', '10642080300', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1117', null, '史玉柱今晚将拍卖“史玉柱”！#爱佑华夏慈善晚宴#继续曝料，具体请见配图，更多悬念待晚会现场揭晓。慈善晚会进展：正处于发布会采访环节。', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh6vvg4ql1j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh6vvg4ql1j.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 18:19:07', '2011-05-14 18:19:07', '2', '10644660776', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1118', null, '好熟悉的背景哦', '@巨人网络:史玉柱今晚将拍卖“史玉柱”！#爱佑华夏慈善晚宴#继续曝料，具体请见配图，更多悬念待晚会现场揭晓。慈善晚会进展：正处于发布会采访环节。<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh6vvg4ql1j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh6vvg4ql1j.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-14 18:26:39', '2011-05-14 18:26:39', '2', '10645021260', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1119', null, '#爱佑华夏# 慈善晚宴，#史玉柱拍卖史玉柱#。图为老史现身酒会，还是那身熟悉的没有悬念的红衣服。', '<a href=\'http://ww1.sinaimg.cn/large/6232cd9ajw1dh6whfyjwcj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6232cd9ajw1dh6whfyjwcj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 18:39:41', '2011-05-14 18:39:41', '2', '10645653296', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1120', null, '转发微博。', '@巨人网络:#爱佑华夏# 慈善晚宴，#史玉柱拍卖史玉柱#。图为老史现身酒会，还是那身熟悉的没有悬念的红衣服。<a href=\'http://ww1.sinaimg.cn/large/6232cd9ajw1dh6whfyjwcj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6232cd9ajw1dh6whfyjwcj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-14 18:44:52', '2011-05-14 18:44:52', '2', '10645908372', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1121', null, '转发微博。', '@新浪科技:爱佑华夏慈善基金会晚宴今晚在北京举行，此次晚宴吸引了众多社会爱心人士的参加，包括曹国伟、李彦宏、冯仑、史玉柱、江南春、郁亮等知名企业家，同时，还有一位特殊的小嘉宾——来自云南峨山县的施双明。新浪网正在进行视频直播http://t.cn/7fdMh，微直播地址http://t.cn/hewjbv<a href=\'http://ww3.sinaimg.cn/large/61e89b74jw1dh6x1mzmpfj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/61e89b74jw1dh6x1mzmpfj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 19:01:55', '2011-05-14 19:01:55', '2', '10646748910', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1122', null, '期待揭晓悬念，是否会跟微博有关？', '@曹国伟:爱佑华夏基金会2011年慈善年会开始了。今晚新浪微博将贡献一件特殊的拍卖品，拭目以待。<a href=\'http://ww4.sinaimg.cn/large/3c0ad8c9jw1dh6x0yz073j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/3c0ad8c9jw1dh6x0yz073j.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 19:02:16', '2011-05-14 19:02:16', '2', '10646765864', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1123', null, '#史玉柱拍卖史玉柱#两大悬念：1，能卖多少钱？2，卖了干啥用？今晚#爱佑华夏#慈善晚宴将揭晓答案。', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dh6xaynepqj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dh6xaynepqj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 19:08:09', '2011-05-14 19:08:09', '2', '10647055640', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1124', null, '兔子没钱，给征途2点卡可以参与拍卖么？', '@巨人网络:#史玉柱拍卖史玉柱#两大悬念：1，能卖多少钱？2，卖了干啥用？今晚#爱佑华夏#慈善晚宴将揭晓答案。<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dh6xaynepqj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dh6xaynepqj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-14 19:10:57', '2011-05-14 19:10:57', '2', '10647193254', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1125', null, '转发微博。', '@沈国军:爱佑华夏慈善基金会救助一万名儿童，感动亿万人，理事长王兵感慨创办和管理基金会的艰辛<a href=\'http://ww4.sinaimg.cn/large/679bc339jw1dh6xjptgzbj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/679bc339jw1dh6xjptgzbj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 19:21:56', '2011-05-14 19:21:56', '2', '10647752610', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1126', null, '马化腾为曹国伟颁发理事证书，@曹国伟 成爱佑华夏慈善基金会理事会理事。在#爱佑华夏#慈善晚宴，右一为刚刚也成为理事的李彦宏。', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh6yqobdlqj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh6yqobdlqj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 19:58:51', '2011-05-14 19:58:51', '2', '10649638892', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1127', null, '曹国伟、史玉柱、马化腾、李彦宏等大佬集体\"献声\"。本环节为爱佑华夏慈善基金会理事会全体理事，现场合唱基金会的会曲《理想》，#爱佑华夏#慈善晚宴。', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh6z6zi6z9j.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh6z6zi6z9j.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 20:15:23', '2011-05-14 20:15:23', '2', '10650511334', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1128', null, '新浪今晚带来的慈善拍品揭晓，果然与微博有关--“888888” 微博号码以150万元拍出，买家是恒基兆业地产有限公司副主席李家杰先生。', '@曹国伟:weibo.com/888888 域名得主李家杰先生<a href=\'http://ww3.sinaimg.cn/large/3c0ad8c9jw1dh6zd29i1zj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/3c0ad8c9jw1dh6zd29i1zj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 20:29:02', '2011-05-14 20:29:02', '2', '10651241180', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1129', null, '史玉柱今晚带来的拍品--《征途2》游戏中的“史玉柱”角色帐号，以220万元被拍下。该游戏角色为史玉柱独家授权，这是他形象第一次出现在《征途2》中，也是迄今唯一一次出现在游戏中，帐号里还有史总个人充值的价值1万元的人民币的游戏点卡。买家李家杰是香港恒基兆业地产集团副主席，也是一名游戏玩家。', '<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh70exdg7cj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh70exdg7cj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 20:55:37', '2011-05-14 20:55:37', '2', '10652706584', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1130', null, '偶也拍卖一个叫“小二丫头”的角色，那就是偶了(^○^)', '@巨人网络:史玉柱今晚带来的拍品--《征途2》游戏中的“史玉柱”角色帐号，以220万元被拍下。该游戏角色为史玉柱独家授权，这是他形象第一次出现在《征途2》中，也是迄今唯一一次出现在游戏中，帐号里还有史总个人充值的价值1万元的人民币的游戏点卡。买家李家杰是香港恒基兆业地产集团副主席，也是一名游戏玩家。<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh70exdg7cj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh70exdg7cj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-14 21:02:51', '2011-05-14 21:02:51', '2', '10653096391', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1131', null, '转发微博。', '@巨人网络:史玉柱今晚将拍卖“史玉柱”！#爱佑华夏慈善晚宴#继续曝料，具体请见配图，更多悬念待晚会现场揭晓。慈善晚会进展：正处于发布会采访环节。<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh6vvg4ql1j.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh6vvg4ql1j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-14 21:05:29', '2011-05-14 21:05:29', '2', '10653266896', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1132', null, '哇哇哇，偶兔百万真的身价百万啦！！！', '@巨人网络:史玉柱今晚带来的拍品--《征途2》游戏中的“史玉柱”角色帐号，以220万元被拍下。该游戏角色为史玉柱独家授权，这是他形象第一次出现在《征途2》中，也是迄今唯一一次出现在游戏中，帐号里还有史总个人充值的价值1万元的人民币的游戏点卡。买家李家杰是香港恒基兆业地产集团副主席，也是一名游戏玩家。<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh70exdg7cj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh70exdg7cj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-14 21:07:39', '2011-05-14 21:07:39', '2', '10653395294', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1133', null, '史玉柱独家授权的《征途2》游戏角色帐号\"史玉柱\"，刚在#爱佑华夏#慈善晚宴以220万元被拍下，史玉柱表示要给这个帐号的人做小弟，以防对方用自己名字在游戏中做坏事。晚宴主持人陈辰说，之前不玩游戏，经过这次拍卖，她也一定要玩玩《征途2》，体验下这个游戏，并找找游戏中的“史玉柱”在做什么。', '<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dh70tfm6ecj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dh70tfm6ecj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-14 21:09:37', '2011-05-14 21:09:37', '2', '10653509592', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1134', null, '史总把自己卖了，还挺值钱[偷笑] 巨人所有游戏绝无仅有的', '@巨人网络:史玉柱今晚带来的拍品--《征途2》游戏中的“史玉柱”角色帐号，以220万元被拍下。该游戏角色为史玉柱独家授权，这是他形象第一次出现在《征途2》中，也是迄今唯一一次出现在游戏中，帐号里还有史总个人充值的价值1万元的人民币的游戏点卡。买家李家杰是香港恒基兆业地产集团副主席，也是一名游戏玩家。<a href=\'http://ww3.sinaimg.cn/large/6232cd9ajw1dh70exdg7cj.jpg\' target=\'_blank\'><img src=\'http://ww3.sinaimg.cn/thumbnail/6232cd9ajw1dh70exdg7cj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-14 21:10:51', '2011-05-14 21:10:51', '2', '10653580908', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1135', null, '史总不做小弟很久啦，哈哈 //@倪德猛:转发微博。', '@巨人网络:史玉柱独家授权的《征途2》游戏角色帐号\"史玉柱\"，刚在#爱佑华夏#慈善晚宴以220万元被拍下，史玉柱表示要给这个帐号的人做小弟，以防对方用自己名字在游戏中做坏事。晚宴主持人陈辰说，之前不玩游戏，经过这次拍卖，她也一定要玩玩《征途2》，体验下这个游戏，并找找游戏中的“史玉柱”在做什么。<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dh70tfm6ecj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dh70tfm6ecj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-14 21:21:47', '2011-05-14 21:21:47', '2', '10654225326', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1136', null, '李彦宏先生拍卖的是百度品牌专区。', '@新浪科技:百度CEO李彦宏 今晚在“爱由心生”慈善晚宴上，拍卖价值100万的“品牌专区”服务，起拍价30万，经过多轮竞拍，最后以180万元成交。新浪网正在视频直播及微博直播：http://t.cn/he4h7k', '27', '@巨人网络', null, null, '2011-05-14 21:36:44', '2011-05-14 21:36:44', '2', '10655131202', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1137', null, '李家杰先生今天满载而归！', '@新浪科技:#爱佑华夏#@史玉柱 刚刚拍卖自己在《征途》游戏中的＂史玉柱＂虚拟人物，成交价为220万，竞拍者还是之前拍下weibo.com/888888靓号的香港恒基兆业地产副主席李家杰。新浪网正在视频直播及微博直播：http://t.cn/he4h7k', '27', '@巨人网络', null, null, '2011-05-14 21:37:33', '2011-05-14 21:37:33', '2', '10655181814', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1138', null, '今天爱佑华夏慈善拍卖会，拍卖款全部用于救治贫困家庭心脏病孩子。沈国军拿出一块女士手表，最后被我160万举牌拍得。刚拿到手表2秒钟，沈国军坏蛋和陈伟鸿主持当众逼我捐出来，我还没看清手表长相，该表又被拍卖一次。一女二嫁，一个拍品卖二次，契约精神都哪里去了？', '<a href=\'http://ww1.sinaimg.cn/large/638b4670jw1dh7206vx6rj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670jw1dh7206vx6rj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-14 22:04:24', '2011-05-14 22:04:24', '2', '10656940584', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1139', null, '提起沈国军这个慈善流氓，我就想放奥巴马咬他。不过慈善拍卖会上也有开心事：巨人网络提供一个拍品，征途2的特别帐号，角色名：史玉柱，头像是我的。被香港富商李家杰220万拍走，能救助55个心脏病孩子。这个征途老玩家当众表示他计划在游戏里给“史玉柱”变性成女人。晕，我在泰国真不该看人妖表演。', '<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dh73awd1ibj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dh73awd1ibj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-14 22:49:13', '2011-05-14 22:49:13', '2', '10660027250', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1140', null, '[吃惊]', '@史玉柱:提起沈国军这个慈善流氓，我就想放奥巴马咬他。不过慈善拍卖会上也有开心事：巨人网络提供一个拍品，征途2的特别帐号，角色名：史玉柱，头像是我的。被香港富商李家杰220万拍走，能救助55个心脏病孩子。这个征途老玩家当众表示他计划在游戏里给“史玉柱”变性成女人。晕，我在泰国真不该看人妖表演。<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dh73awd1ibj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dh73awd1ibj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-14 23:04:38', '2011-05-14 23:04:38', '2', '10661099168', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1141', null, '绯闻出来了[嘻嘻]  //@邓昆:情侣装哦，某人差点祝新人\"年年有今朝\" ，哈哈//@yaya119:俺们这对也不赖啊[哈哈]', '@田丰ZT2:在小胖子的婚礼上，他俩很开心。<a href=\'http://ww4.sinaimg.cn/large/659d85c5jw1dh822hfhjcj.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/659d85c5jw1dh822hfhjcj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-15 19:02:58', '2011-05-15 19:02:58', '2', '10701586138', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1142', null, '朋友是一辈子的；）', '@邓昆:今天是好朋友hank的大喜日子，为他开心。借这个机会与很多老同事欢聚一堂，很开心。见到每一个人都很开心，没有任何的陌生，仿佛老样子，没有客气，没有寒暄，就那么自然的打成一片。突然有种错觉，仿佛一切都没有变化。祝福大家，我为你们骄傲着！', '25', '@纪学锋', null, null, '2011-05-15 21:29:18', '2011-05-15 21:29:18', '2', '10709523928', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1143', null, '你们太坏了[偷笑]  //@邓昆:纠正一下，这杯被@田丰 命名为＂百年好合鸡头酒＂，据说是对应鸡尾酒的，我相信如果他能从菜里找到鸡屁股一定会插上去的！', '@邓昆:为新郎准备了一杯百年好合，汇聚了各式菜汁、饮料、酒，汇聚了三位制作人，一位公关总监，一位艺术总监，以及最坏的jason的创意，期待着新郎饮下这杯\"百年好合\"！<a href=\'http://ww1.sinaimg.cn/large/6841b1f1jw1dh84b2cqv3j.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/6841b1f1jw1dh84b2cqv3j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-15 21:34:32', '2011-05-15 21:34:32', '2', '10709860456', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1144', null, '新郎赶紧入洞房，还在微薄混啥[馋嘴]  //@盛轶炯:酸甜苦辣：（', '@yaya119:hank，喝的真给力！哈哈能告诉偶们啥味道么[哈哈]<a href=\'http://ww1.sinaimg.cn/large/66a60197jw1dh84pq1r1bj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/66a60197jw1dh84pq1r1bj.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-15 21:44:48', '2011-05-15 21:44:48', '2', '10710539718', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1145', null, '//@田丰ZT2：//@纪学锋：[吃惊]', '@史玉柱:提起沈国军这个慈善流氓，我就想放奥巴马咬他。不过慈善拍卖会上也有开心事：巨人网络提供一个拍品，征途2的特别帐号，角色名：史玉柱，头像是我的。被香港富商李家杰220万拍走，能救助55个心脏病孩子。这个征途老玩家当众表示他计划在游戏里给“史玉柱”变性成女人。晕，我在泰国真不该看人妖表演。<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dh73awd1ibj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dh73awd1ibj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-16 10:51:16', '2011-05-16 10:51:16', '2', '10729198664', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1146', null, '//@田丰ZT2：呵呵，想知道老史拍卖啥，可以去征途2的官网去看，有相关的新闻[嘻嘻] //@征途2:曝料，曝料：跟俺征途兔有关！', '@巨人网络:史玉柱、曹国伟、马化腾、李彦宏、江南春...这些互联网大佬如果聚在一起搞个拍卖，会拿出怎样的镇宅之宝，来让大家开眼界呢？在今晚由爱佑华夏慈善基金会主办的“2011爱佑心生慈善晚宴”中，这些悬念将一一揭晓。晚宴今晚17：30在北京盘古酒店举办，巨人网络官方微博带来前方一手资料。<a href=\'http://ww4.sinaimg.cn/large/6232cd9ajw1dh6u85j1v1j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/6232cd9ajw1dh6u85j1v1j.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-16 10:51:30', '2011-05-16 10:51:30', '2', '10729206523', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1147', null, '果然很V5~', '@史玉柱:提起沈国军这个慈善流氓，我就想放奥巴马咬他。不过慈善拍卖会上也有开心事：巨人网络提供一个拍品，征途2的特别帐号，角色名：史玉柱，头像是我的。被香港富商李家杰220万拍走，能救助55个心脏病孩子。这个征途老玩家当众表示他计划在游戏里给“史玉柱”变性成女人。晕，我在泰国真不该看人妖表演。<a href=\'http://ww2.sinaimg.cn/large/638b4670jw1dh73awd1ibj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/638b4670jw1dh73awd1ibj.jpg\' class=\'thumbNailPic\'></a>', '26', '@征途2', null, null, '2011-05-16 10:53:41', '2011-05-16 10:53:41', '2', '10729268850', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1148', null, '[嘻嘻]', '@汤敏:周末儿子不愿一起去参加同事婚宴,说要在家做作业。婚宴间隙打电话回家,阿姨说他在上电脑,说是做关于生物学和物理学的题目,可小学没学这两门课呀？！叫来儿子一问,才支支吾吾地说在玩和植物有关的《植物大战僵尸》,还有和抛物线有关的《愤怒的小鸟》[晕]', '25', '@纪学锋', null, null, '2011-05-16 13:45:23', '2011-05-16 13:45:23', '2', '10734570743', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1149', null, '值得期待 //@徐军_mutou8:这个是我们自主研发的引擎：） 我们还在努力做的更好！', '@徐军_mutou8:研发中的代号《巨人X》 分享照片[酷]<a href=\'http://ww4.sinaimg.cn/large/69eab35djw1dh8zzx5gp3j.jpg\' target=\'_blank\'><img src=\'http://ww4.sinaimg.cn/thumbnail/69eab35djw1dh8zzx5gp3j.jpg\' class=\'thumbNailPic\'></a>', '25', '@纪学锋', null, null, '2011-05-16 15:00:09', '2011-05-16 15:00:09', '2', '10736498164', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1150', null, '被慈善流氓忽悠买手表的款，今天已汇给爱佑华夏慈善基金会。想到160万元能救治80个贫困家庭先天心脏病儿童（每个手术费2万元，前一个贴算错了），感觉不错。算啦，小人不计小人过，就不和沈国军计较了。', '<a href=\'http://ww1.sinaimg.cn/large/638b4670jw1dh9132glinj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/638b4670jw1dh9132glinj.jpg\' class=\'thumbNailPic\'></a>', '28', '@史玉柱', null, null, '2011-05-16 15:00:29', '2011-05-16 15:00:29', '2', '10736507487', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1151', null, '中欧的转起[耶] //@中欧校友会官方微博：//@中欧国际工商学院：激昂的精神状态！奋发的斗志！戈壁上中欧的帅哥美女们分外惹眼！挺~~~ //@风生水起CEIBS:B39是不是@李爱辉10sh6 ？ //@中欧戈友会:转发微博', '@姚红juju:出发！<a href=\'http://ww1.sinaimg.cn/large/718650fcjw1dh8tgjjkgsj.jpg\' target=\'_blank\'><img src=\'http://ww1.sinaimg.cn/thumbnail/718650fcjw1dh8tgjjkgsj.jpg\' class=\'thumbNailPic\'></a>', '30', '@巨人刘伟', null, null, '2011-05-16 15:58:40', '2011-05-16 15:58:40', '2', '10737984850', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1152', null, '上周，复旦大学师生受HR之邀参观了巨人松江家园，图为师生们在照片墙前驻足。照片墙以时间为节点记录了巨人网络每一年的“大事记”，可以称得上是巨人网络“浓缩的历史”。', '<a href=\'http://ww2.sinaimg.cn/large/6232cd9ajw1dh93i33k4uj.jpg\' target=\'_blank\'><img src=\'http://ww2.sinaimg.cn/thumbnail/6232cd9ajw1dh93i33k4uj.jpg\' class=\'thumbNailPic\'></a>', '27', '@巨人网络', null, null, '2011-05-16 16:13:48', '2011-05-16 16:13:48', '2', '10738374443', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1153', null, '田丰，做好自己，不要乱评价，真话也不行.....', '@田丰ZT2:产品推出之前宣传要实事求是，莫夸大，一步一步积累用户，给用户太高期望值不一定是好事，期望越高就可能让更高百分比的人失望，得不偿失，很多一波流就是这么来的。夸大宣传+一口气开几十个区=一个月后的人去楼空[不要] .', '25', '@纪学锋', null, null, '2011-05-16 21:30:46', '2011-05-16 21:30:46', '2', '10747470767', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1154', null, '爱佑华夏慈善基金会的管理费是0%，捐款100%用于贫困家庭先天心脏病儿童。发生的管理费都由理事们分摊，理事们牛人多：王兵，马云，马化腾，沈国军，冯仑和我等等，眼睛里都揉不进沙子的，基金会运作很规范。爱佑华夏慈善基金会管理费为0%毫无普遍性，但愿不会对其他慈善基金造成冲击。', '', '28', '@史玉柱', null, null, '2011-05-17 08:45:03', '2011-05-17 08:45:03', '2', '10759177025', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1155', null, '“私奔”是微薄新搞的游戏么？ //@蔡文胜: 如此微博宣示私奔,真性情！[good]', '@王功权:各位亲友，各位同事，我放弃一切，和王琴私奔了。感谢大家多年的关怀和帮助，祝大家幸福！没法面对大家的期盼和信任，也没法和大家解释，也不好意思，故不告而别。叩请宽恕！功权鞠躬', '30', '@巨人刘伟', null, null, '2011-05-17 08:59:16', '2011-05-17 08:59:16', '2', '10759524093', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1156', null, '为什么一觉醒来，大家都在议论私奔？昨晚临睡前恰好看完≪1Q84≫，结局是私奔•••••', '', '30', '@巨人刘伟', null, null, '2011-05-17 09:06:12', '2011-05-17 09:06:12', '2', '10759706543', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1157', null, '犯了逻辑错误，上个贴我居然恬不知耻地说自己是牛人，言行之卑鄙实在令人发指，特在此向广大粉丝深表道歉。顺便广告下：爱佑华夏慈善基金会网站里有捐款账号，其财务公开透明，财务做帐外包给会计事务所。http://t.cn/heJSfy', '', '28', '@史玉柱', null, null, '2011-05-17 10:24:27', '2011-05-17 10:24:27', '2', '10761892639', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1158', null, '人生就像一场游戏，导演总是想让你骚一点……', '', '25', '@纪学锋', null, null, '2011-05-17 11:43:26', '2011-05-17 11:43:26', '2', '10764211159', '0', '0', null, null, '1');
INSERT INTO topic VALUES ('1159', '0', 'test', null, '19', '王慧', null, null, '2011-05-27 18:37:05', '2011-05-27 18:37:05', '0', '11290137821', '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1160', '4', '求安慰', null, '19', '王慧', null, null, '2011-05-27 18:56:49', '2011-05-27 18:56:49', '0', '11290718457', '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1161', '0', 'title', 'content', '1', '路过', null, null, '2011-06-15 14:03:26', '2011-06-15 14:03:26', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1162', '0', '111111111', '111222222222222222', '1', '路过', null, null, '2011-06-15 14:05:28', '2011-06-15 14:05:28', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1163', '0', '222', '2111', '1', '路过', null, null, '2011-06-15 14:08:15', '2011-06-15 14:08:15', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1164', '0', '111', '111', '1', '路过', null, null, '2011-06-15 14:31:58', '2011-06-15 14:31:58', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1165', '0', '11', '11111111111111', '1', '路过', null, null, '2011-06-15 14:32:45', '2011-06-15 14:32:45', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1166', '0', '22222', '222222222222222', '1', '路过', null, null, '2011-06-15 14:32:48', '2011-06-15 14:32:48', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1167', '0', '3333', '33333333333333', '1', '路过', null, null, '2011-06-15 14:34:58', '2011-06-15 14:34:58', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1168', '0', '11111', '22222', '1', '路过', null, null, '2011-06-15 15:03:58', '2011-06-15 15:03:58', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1169', '0', '终于出太阳了', null, '1', '路过', null, null, '2011-06-23 12:06:38', '2011-06-23 12:06:38', '0', '12819404317', '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1170', '0', '1111', null, '1', '路过', null, null, '2011-06-23 12:16:15', '2011-06-23 12:16:15', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1171', '0', '说点啥吧.', null, '1', '路过', null, null, '2011-06-23 12:17:47', '2011-06-23 12:17:47', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1172', '0', '1111111', null, '1', '路过', null, null, '2011-06-23 12:19:00', '2011-06-23 12:19:00', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1173', '0', '1111', null, '1', '路过', null, null, '2011-06-23 12:19:47', '2011-06-23 12:19:47', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1174', '0', '1111', null, '1', '路过', null, null, '2011-06-23 12:20:36', '2011-06-23 12:20:36', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1175', '0', '111222', null, '1', '路过', null, null, '2011-06-23 12:21:16', '2011-06-23 12:21:16', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1176', '0', '说点啥吧.', null, '1', '路过', null, null, '2011-06-23 12:26:42', '2011-06-23 12:26:42', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1177', '0', '1111', null, '1', '路过', null, null, '2011-06-23 12:27:44', '2011-06-23 12:27:44', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1178', '0', '12333', null, '1', '路过', null, null, '2011-06-23 12:28:27', '2011-06-23 12:28:27', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1179', '0', '说点啥吧.', null, '1', '路过', null, null, '2011-06-23 12:33:43', '2011-06-23 12:33:43', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1180', '0', '112345', null, '1', '路过', null, null, '2011-06-23 12:33:58', '2011-06-23 12:33:58', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1181', '5', '111', '1111', '36', 'wangxin', null, null, '2011-07-06 16:34:59', '2011-07-06 16:34:59', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1182', '5', '222', '222222', '36', 'wangxin', '36', 'wangxin', '2011-07-06 18:49:26', '2011-07-06 20:00:15', '0', null, '1', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1183', '5', '3333333333333333', '222222', '36', 'wangxin', '36', 'wangxin', '2011-07-06 18:49:41', '2011-07-07 08:47:40', '0', null, '2', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1184', '5', '333333', '222222', '36', 'wangxin', null, null, '2011-07-06 18:58:47', '2011-07-06 18:58:47', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1185', '5', '44444', '222222', '36', 'wangxin', null, null, '2011-07-06 18:59:42', '2011-07-06 18:59:42', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1186', '5', '55555555555', '2222225555555555555555555555', '36', 'wangxin', null, null, '2011-07-06 19:01:18', '2011-07-06 19:01:18', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1187', '5', '666', '6666', '36', 'wangxin', '36', 'wangxin', '2011-07-06 19:01:28', '2011-07-07 09:21:44', '0', null, '5', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1188', '5', '666777777', '6666', '36', 'wangxin', null, null, '2011-07-06 19:02:01', '2011-07-06 19:02:01', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1189', '5', '666777777', '6666', '36', 'wangxin', null, null, '2011-07-06 19:02:24', '2011-07-06 19:02:24', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1190', '5', '666777777', '6666', '36', 'wangxin', null, null, '2011-07-06 19:02:26', '2011-07-06 19:02:26', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1191', '5', '666777777', '6666', '36', 'wangxin', null, null, '2011-07-06 19:02:29', '2011-07-06 19:02:29', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1192', '5', '666777777', '6666', '36', 'wangxin', '36', 'wangxin', '2011-07-06 19:02:32', '2011-07-06 19:59:55', '0', null, '7', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1193', '5', '2222', '2222', '36', 'wangxin', null, null, '2011-07-06 20:00:50', '2011-07-06 20:00:50', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1194', '5', '44444', '22224444444444444444', '36', 'wangxin', null, null, '2011-07-06 20:01:04', '2011-07-06 20:01:04', '0', null, '0', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1195', '5', '555555555555555', '22224444444444444444', '36', 'wangxin', '36', 'wangxin', '2011-07-06 20:01:11', '2011-07-07 08:52:36', '0', null, '1', '0', '0', '192.168.82.87', '2');
INSERT INTO topic VALUES ('1196', '0', '11', '1111111111', '1', '路过', null, null, '2011-07-08 11:35:00', '2011-07-08 11:35:00', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1197', '0', '111', '1111111111111111', '36', 'wangxin1', null, null, '2011-07-11 15:34:07', '2011-07-11 15:34:07', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1198', '0', '22222', '', '1', '路过', null, null, '2011-07-15 15:59:31', '2011-07-15 15:59:31', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1199', '0', '111111111', '', '1', '路过', null, null, '2011-07-15 16:01:10', '2011-07-15 16:01:10', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1200', '0', '11111', '11111<br />', '1', '路过', null, null, '2011-07-15 16:12:37', '2011-07-15 16:12:37', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1201', '0', '2222', '22222<span style=\"color: rgb(255, 102, 102);\">2222</span>22<span style=\"background-color: rgb(255, 255, 51);\">2</span>222', '1', '路过', null, null, '2011-07-15 16:12:53', '2011-07-15 16:12:53', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1202', '0', '222222', '1111122222<br />', '19', '王慧', '1', '匿名', '2011-07-15 16:29:18', '2011-07-15 16:58:01', '0', null, '3', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1203', '0', '22222', '', '19', '王慧', '1', '匿名', '2011-07-15 16:58:48', '2011-07-21 08:30:47', '0', null, '2', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1204', '0', '2222', '', '19', '王慧', null, null, '2011-07-18 12:14:56', '2011-07-18 12:14:56', '0', null, '0', '0', '0', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1205', '0', '22222', '', '1', '路过', null, null, '2011-07-21 08:31:05', '2011-07-21 08:31:05', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1206', '0', '2222222', '', '1', '路过', null, null, '2011-07-21 09:09:21', '2011-07-21 09:09:21', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1207', '0', '111111', '', '1', '路过', '1', '匿名', '2011-07-21 09:09:52', '2011-07-21 09:10:00', '0', null, '1', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1208', '0', '333', '3333<br />', '1', '路过', null, null, '2011-07-21 09:11:16', '2011-07-21 09:11:16', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1209', '0', '编辑器测试', '测<span style=\"background-color: rgb(255, 255, 0);\">试</span>测试', '1', '路过', '1', '匿名', '2011-07-21 09:11:48', '2011-07-21 09:14:56', '0', null, '4', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1210', '0', '222222', '[OCS:222]', '1', '路过', '1', '匿名', '2011-07-21 09:36:22', '2011-07-21 10:02:58', '0', null, '5', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1211', '0', '22222222222222222', '2222222222222222222222222222<br />', '1', '路过', '1', '匿名', '2011-07-21 09:46:51', '2011-07-21 09:55:57', '0', null, '2', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1212', '0', '111111', '<img src=\"http://192.168.82.87/upload/attachment/1311217622406.jpg\" alt=\"\" /><br />', '1', '路过', '1', '路过', '2011-07-21 11:07:18', '2011-07-28 14:58:42', '0', null, '3', '1', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1213', '0', '22222', '<img src=\"http://192.168.82.87/upload/attachment/1311218228765.jpg\" width=\"460\" alt=\"\" /><br />', '1', '路过', null, null, '2011-07-21 11:17:43', '2011-07-21 11:17:43', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1214', '0', '2222', '<img src=\"http://192.168.82.87/upload/attachment/1311219236046.jpg\" width=\"460\" alt=\"\" /><br />', '1', '路过', null, null, '2011-07-21 11:34:01', '2011-07-21 11:34:01', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1215', '0', '111111', '<img src=\"http://192.168.82.87/upload/attachment/1311219748703.png\" alt=\"\" /><br />', '1', '路过', null, null, '2011-07-21 11:42:37', '2011-07-21 11:42:37', '0', null, '0', '0', '1', '192.168.82.87', '1');
INSERT INTO topic VALUES ('1216', '0', '2111', '<img src=\"http://192.168.82.87/upload/attachment/1311219938796.jpg\" alt=\"\" /><img src=\"http://192.168.82.87/upload/attachment/1311219956796.jpg\" alt=\"\" /><br />', '1', '路过', null, null, '2011-07-21 11:46:01', '2011-07-21 11:46:01', '0', null, '0', '0', '1', '192.168.82.87', '1');

-- ----------------------------
-- Table structure for `topic_reply`
-- ----------------------------
DROP TABLE IF EXISTS `topic_reply`;
CREATE TABLE `topic_reply` (
  `id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) NOT NULL,
  `reply_user_id` int(11) NOT NULL,
  `reply_user_name` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `is_fake` int(11) default '0',
  `ip_address` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `reply_user_id` (`reply_user_id`),
  CONSTRAINT `topic_reply_fk` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `topic_reply_fk1` FOREIGN KEY (`reply_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic_reply
-- ----------------------------
INSERT INTO topic_reply VALUES ('1', '877', '7', '关注巨人', '团队文化!', '2011-04-20 10:53:09', '0', null);
INSERT INTO topic_reply VALUES ('2', '916', '7', '关注巨人', '1111', '2011-04-26 18:47:17', '0', null);
INSERT INTO topic_reply VALUES ('3', '929', '19', 'wanghui2', '1234', '2011-04-28 15:34:37', '0', null);
INSERT INTO topic_reply VALUES ('4', '929', '19', 'wanghui2', '回复 wanghui2：1111', '2011-04-28 15:34:50', '0', null);
INSERT INTO topic_reply VALUES ('5', '929', '19', 'wanghui2', '2222', '2011-04-28 15:35:23', '0', null);
INSERT INTO topic_reply VALUES ('6', '929', '19', 'wanghui2', '11111', '2011-04-28 15:35:29', '0', null);
INSERT INTO topic_reply VALUES ('7', '929', '19', 'wanghui2', 'xxxxxxxxxxx', '2011-04-28 15:35:36', '0', null);
INSERT INTO topic_reply VALUES ('8', '929', '7', '关注巨人', '111111111', '2011-04-29 11:28:32', '0', null);
INSERT INTO topic_reply VALUES ('9', '936', '19', 'wanghui2', '[OCS:wanghui2]', '2011-04-29 17:03:41', '0', null);
INSERT INTO topic_reply VALUES ('10', '936', '19', 'wanghui2', '[OCS:wangxin]', '2011-04-29 17:03:59', '0', null);
INSERT INTO topic_reply VALUES ('11', '941', '1', 'wanghui', '1111', '2011-05-04 10:51:57', '1', null);
INSERT INTO topic_reply VALUES ('12', '941', '1', '匿名', '回复 wanghui：122', '2011-05-04 10:53:23', '1', null);
INSERT INTO topic_reply VALUES ('13', '942', '1', '匿名', '回复 wanghui：2222', '2011-05-04 10:55:15', '1', null);
INSERT INTO topic_reply VALUES ('14', '942', '1', '匿名', '回复 匿名：2222', '2011-05-04 10:55:23', '0', null);
INSERT INTO topic_reply VALUES ('15', '942', '19', 'wanghui2', '回复 匿名：11111', '2011-05-04 11:00:16', '0', null);
INSERT INTO topic_reply VALUES ('16', '942', '19', 'wanghui2', '回复 匿名：11111', '2011-05-04 11:00:22', '1', null);
INSERT INTO topic_reply VALUES ('17', '944', '1', '匿名', '回复 匿名：123', '2011-05-04 11:37:58', '1', null);
INSERT INTO topic_reply VALUES ('18', '944', '1', '匿名', '回复 匿名：2222', '2011-05-04 11:38:02', '1', null);
INSERT INTO topic_reply VALUES ('19', '954', '7', '关注巨人', '111111111', '2011-05-05 18:08:13', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('20', '956', '1', '匿名', '1234', '2011-05-09 10:40:30', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('21', '956', '19', '王慧', '回复 匿名：1111', '2011-05-09 11:26:26', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('22', '956', '19', '王慧', '1111', '2011-05-09 11:26:41', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('23', '956', '19', '王慧', '1111', '2011-05-09 11:31:55', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('24', '958', '1', '匿名', '1111111111111111', '2011-05-09 12:30:11', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('25', '958', '1', '匿名', '回复 匿名：222', '2011-05-09 12:30:31', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('26', '1192', '36', 'wangxin', '1111', '2011-07-06 19:44:57', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('27', '1192', '36', 'wangxin', '2222', '2011-07-06 19:45:49', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('28', '1192', '36', 'wangxin', '2222', '2011-07-06 19:48:50', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('29', '1192', '36', 'wangxin', '2222', '2011-07-06 19:59:29', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('30', '1192', '36', 'wangxin', '22223333', '2011-07-06 19:59:50', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('31', '1192', '36', 'wangxin', '22222', '2011-07-06 19:59:52', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('32', '1192', '36', 'wangxin', '3333', '2011-07-06 19:59:55', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('33', '1182', '36', 'wangxin', '1233', '2011-07-06 20:00:15', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('34', '1183', '36', 'wangxin', '111', '2011-07-06 20:01:17', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('35', '1183', '36', 'wangxin', '2222', '2011-07-07 08:47:40', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('36', '1195', '36', 'wangxin', '122222', '2011-07-07 08:52:36', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('37', '1187', '36', 'wangxin', '123', '2011-07-07 08:53:08', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('38', '1187', '36', 'wangxin', '123', '2011-07-07 08:53:13', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('39', '1187', '36', 'wangxin', '123', '2011-07-07 08:53:13', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('40', '1187', '36', 'wangxin', '345', '2011-07-07 08:54:29', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('41', '1187', '36', 'wangxin', '5555', '2011-07-07 09:21:44', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('42', '1202', '19', '王慧', '', '2011-07-15 16:34:44', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('43', '1202', '1', '路过', '', '2011-07-15 16:57:16', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('44', '1202', '1', '路过', '回复 匿名：', '2011-07-15 16:58:01', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('45', '1203', '1', '路过', '', '2011-07-21 08:30:41', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('46', '1203', '1', '路过', '', '2011-07-21 08:30:47', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('47', '1207', '1', '路过', '', '2011-07-21 09:10:00', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('48', '1209', '1', '路过', '1222', '2011-07-21 09:14:02', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('49', '1209', '1', '路过', '回复 匿名：<strong>22</strong>222<strong>22</strong> 11<strong>111</strong>1<br />', '2011-07-21 09:14:34', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('50', '1209', '1', '路过', '', '2011-07-21 09:14:49', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('51', '1209', '1', '路过', '回复 匿名：', '2011-07-21 09:14:56', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('52', '1211', '1', '路过', '', '2011-07-21 09:55:43', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('53', '1211', '1', '路过', '回复 匿名：', '2011-07-21 09:55:57', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('54', '1210', '1', '路过', '', '2011-07-21 09:56:09', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('55', '1210', '1', '路过', '', '2011-07-21 09:58:35', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('56', '1210', '1', '路过', '', '2011-07-21 10:00:25', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('57', '1210', '1', '路过', '1111', '2011-07-21 10:02:49', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('58', '1210', '1', '路过', '222222222222222222', '2011-07-21 10:02:58', '1', '192.168.82.87');
INSERT INTO topic_reply VALUES ('59', '1212', '1', '路过', '[OCS:00]', '2011-07-21 12:20:04', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('60', '1212', '19', '王慧', '11111', '2011-07-28 14:58:19', '0', '192.168.82.87');
INSERT INTO topic_reply VALUES ('61', '1212', '1', '路过', '回复 王慧：222222', '2011-07-28 14:58:42', '0', '192.168.82.87');

-- ----------------------------
-- Table structure for `topic_sort`
-- ----------------------------
DROP TABLE IF EXISTS `topic_sort`;
CREATE TABLE `topic_sort` (
  `id` int(11) NOT NULL auto_increment,
  `sort_name` varchar(30) NOT NULL,
  `sort_degree` int(11) NOT NULL default '0',
  `sort_parent` int(11) default NULL,
  `state` int(11) NOT NULL default '0' COMMENT '0nomal,99delete,1hidden',
  `area_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `sort_parent` (`sort_parent`),
  KEY `sort_degree` (`sort_degree`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `topic_sort_fk` FOREIGN KEY (`sort_parent`) REFERENCES `topic_sort` (`id`),
  CONSTRAINT `topic_sort_fk1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic_sort
-- ----------------------------
INSERT INTO topic_sort VALUES ('0', '综合讨论', '0', '0', '0', '1');
INSERT INTO topic_sort VALUES ('1', '娱乐影音游戏', '0', '0', '0', '1');
INSERT INTO topic_sort VALUES ('2', '新闻动态', '1', '0', '1', '1');
INSERT INTO topic_sort VALUES ('3', '生活信息二手信息', '0', '0', '0', '1');
INSERT INTO topic_sort VALUES ('4', '专业游戏策划', '0', '0', '0', '1');
INSERT INTO topic_sort VALUES ('5', 'faq', '0', null, '0', '2');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `mail` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(20) default NULL,
  `icon` varchar(200) default NULL,
  `is_vip` int(11) default '0',
  `poster` varchar(200) default NULL,
  `is_auth` tinyint(4) default NULL,
  `pic` varchar(100) default NULL,
  `hashid` varchar(300) default NULL,
  `is_admin` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', '319962@163.com', '96E79218965EB72C92A549DD5A330112', '路过', '/images/default.jpg', '0', null, null, null, '', null);
INSERT INTO user VALUES ('2', 'i319962@163.com', '96E79218965EB72C92A549DD5A330112', 'wanghui2', '/images/default.jpg', '0', null, null, null, null, null);
INSERT INTO user VALUES ('3', 'tammy2000s@hotmail.com', '96E79218965EB72C92A549DD5A330112', 'tammy', '/images/default.jpg', '0', null, null, null, null, null);
INSERT INTO user VALUES ('4', 'i319962@gmail.com', '96E79218965EB72C92A549DD5A330112', '动不动', '/images/default.jpg', '0', null, null, null, null, null);
INSERT INTO user VALUES ('5', 'test@ztgame.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'test', '/images/default.jpg', '0', null, null, null, null, null);
INSERT INTO user VALUES ('7', 'wanghui1@ztgame.com', '96E79218965EB72C92A549DD5A330112', '关注巨人', '/images/default.jpg', '0', null, null, null, null, null);
INSERT INTO user VALUES ('8', '史玉柱@ztgame.com', 'DFF2C8BDAA7FDB50BB0F2B7DC94C0C1D', '@史玉柱', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('9', '巨人网络@ztgame.com', 'DFF2C8BDAA7FDB50BB0F2B7DC94C0C1D', '@巨人网络', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('10', '征途2@ztgame.com', 'DFF2C8BDAA7FDB50BB0F2B7DC94C0C1D', '@征途2', '/images/default.jpg', '0', null, null, null, null, null);
INSERT INTO user VALUES ('11', '巨人Game@ztgame.com', '9F06C5D9DA9AD8C43972BFFE87B1CC06', '@巨人Game', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('12', '319962@ztgame.com', '96E79218965EB72C92A549DD5A330112', '319962', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('13', '纪学锋@ztgame.com', 'C62B9BA0C763CFCA2D4955FBED4101A7', '@纪学锋', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('14', 'wangxin@ztgame.com', 'E10ADC3949BA59ABBE56E057F20F883E', '加速大神', '/images/default.jpg', '0', '/upload/haibao/14_n.jpg', '1', '14_1322567614822.jpg', null, null);
INSERT INTO user VALUES ('15', '关注巨人@ztgame.com', 'D53CA03281DE5C43A258E58CD61BB8D3', '@关注巨人', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('16', 'shelley_80@163.com', '6741E9E7C64E14D46DA607063E0A473E', 'momo', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('17', '巨人刘伟@ztgame.com', '7217051FA950785BA9F5B7B0B732EAFF', '@巨人刘伟', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('19', 'wanghui2@ztgame.com', 'B64C8C39FA0097A993537B35EC7DB752', '王慧', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('20', '1912304521', '92CE684D19F1E3A4C6225BF61D70BC3B', '@演出树', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('21', '2081411633', '9887FD6690B3FF64C76DB9BD1CAB8BA8', '@关注巨人', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('22', 'zhoujingwu@ztgame.com', '60549d132fbd0b3be17058476c0d8cbb', '周敬武', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('23', 'zjwxpy@163.com', 'E10ADC3949BA59ABBE56E057F20F883E', '123456', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('24', 'houxingang@ztgame.com', '2869718BAA534FD2BCB7AD7AC8402969', 'houxingang', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('25', '1684347414', '95768226EE2A31148143BCCC9DA59DE2', '@纪学锋', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('26', '1688258905', '95768226EE2A31148143BCCC9DA59DE2', '@征途2', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('27', '1647496602', '8423BC3D58C48C721AAD6E19D55FF7C9', '@巨人网络', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('28', '1670071920', '8423BC3D58C48C721AAD6E19D55FF7C9', '@史玉柱', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('29', '1860004212', '0243BF30D71CD67BA5C186FE7DF6CDFF', '@巨人Game', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('30', '1851875254', '77D9956570C7964F5BA76F5F858A2619', '@巨人刘伟', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('31', 'yaolijun@ztgame.com', '4873916A8F7044A7511550837772BB5B', '姚利军', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('32', 'i319962@1631.com', '96E79218965EB72C92A549DD5A330112', 'i319962', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('33', 'i319962@16312.com', '96E79218965EB72C92A549DD5A330112', 'i319962', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('34', 'i319962@gmail1.com', '96E79218965EB72C92A549DD5A330112', 'i319962', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('35', 'i319962@gmail11.com', '96E79218965EB72C92A549DD5A330112', 'i319962', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('36', 'wangxin@163.com', 'E10ADC3949BA59ABBE56E057F20F883E', '加速大神', '/images/default.jpg', '0', '/upload/haibao/36_n.jpg', '2', null, '1_123456123456', null);
INSERT INTO user VALUES ('37', 'temp@ztgame.com', '96E79218965EB72C92A549DD5A330112', 'temp', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('38', '111@111.com', '698D51A19D8A121CE581499D7B701668', '星星点点', '/images/default.jpg', '0', '/upload/haibao/38_n.jpg', '2', '38_1322567530634.jpg', '1_123456789012', '1');
INSERT INTO user VALUES ('39', '222@222.com', 'BCBE3365E6AC95EA2C0343A2395834DD', '222', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('47', '333@333.com', '310DCBBF4CCE62F762A2AAA148D556BD', '333', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('49', '444@444.com', '550A141F12DE6341FBA65B0AD0433500', '444', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('50', '555@555.com', '15DE21C670AE7C3F6F3F1F37029303C9', '555', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('53', '666@666.com', 'FAE0B27C451C728867A567E8C1BB4E53', '666', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('54', '777@777.com', 'F1C1592588411002AF340CBAEDD6FC33', '777', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('55', '888@777.com', '0A113EF6B61820DAA5611C870ED8D5EE', '888', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('56', '888@888.com', '0A113EF6B61820DAA5611C870ED8D5EE', '888', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('57', '1111@111.com', '698D51A19D8A121CE581499D7B701668', '111', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('59', '112222@111.com', '698D51A19D8A121CE581499D7B701668', '111', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('60', '222@2222.com', 'BCBE3365E6AC95EA2C0343A2395834DD', '222', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('63', '22@2222.com', '182BE0C5CDCD5072BB1864CDEE4D3D6E', '33', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('65', 'lvshiling@ztgame.com', 'FEA0F6268F454D39C08B7303E324EEE0', 'lvshiling', '/images/default.jpg', '0', null, '1', null, null, null);
INSERT INTO user VALUES ('66', 'lvshiling@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'sxd', '/images/default.jpg', null, '/upload/haibao/66_n.jpg', '1', null, null, null);
INSERT INTO user VALUES ('67', '123@123.com', '202CB962AC59075B964B07152D234B70', '李飘飘', '/images/default.jpg', null, null, '2', '67_1322481276357.jpg', null, null);
INSERT INTO user VALUES ('68', 'qule@qule.com', 'CFE14FAF52AD8D1B721427B378B9E65C', 'qule', '/images/default.jpg', null, null, '2', null, null, null);
INSERT INTO user VALUES ('69', 'qv@qv.com', '919E190D3A24095D669E5BB66899ABAC', 'qv', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('70', '13@13.com', 'C51CE410C124A10E0DB5E4B97FC2AF39', '13', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('71', 'sgl@123.com', '202CB962AC59075B964B07152D234B70', 'sgl', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('72', 'zhangyi@123.com', '202CB962AC59075B964B07152D234B70', 'zhangyi', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('73', 'abc@abc', '900150983CD24FB0D6963F7D28E17F72', 'abc', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('74', 'alex@qule.com', '534B44A19BF18D20B71ECC4EB77C572F', 'alex', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('75', '88@88.com', '21218CCA77804D2BA1922C33E0151105', '888888', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('76', 'ryan_rao@163.com', 'C4CA4238A0B923820DCC509A6F75849B', '123', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('77', 'aaa@aaa.com', '47BCE5C74F589F4867DBD57E9CA9F808', 'aaa', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('78', 'zcy@zcy.com', '7CA91D69339BEF8F49213DCEB24E00DB', 'zcy', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('79', 'ql@ql.com', '1D2B7612B3D09D15B0393C6208B4A4AD', 'ql', '/images/default.jpg', null, null, '1', null, null, null);
INSERT INTO user VALUES ('80', 'test@test.com', '96E79218965EB72C92A549DD5A330112', 'test', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('81', 'steve@qule.com', '96E79218965EB72C92A549DD5A330112', 'steve', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('82', 'allanzue@126.com', '96E79218965EB72C92A549DD5A330112', 'allanzue', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('83', 'alan@alan.com', '96E79218965EB72C92A549DD5A330112', '天涯共此时', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('84', 'tiffany@qule.com', '96E79218965EB72C92A549DD5A330112', 'tiffany', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('85', '1122@qule.com', '96E79218965EB72C92A549DD5A330112', '1122', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('86', 'v@qule.com', '96E79218965EB72C92A549DD5A330112', 'v', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('87', 'er@qule.com', '96E79218965EB72C92A549DD5A330112', 'er', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('88', 'vv@vv.com', '96E79218965EB72C92A549DD5A330112', 'vv', '/images/default.jpg', null, '/images/poster.jpg', '1', null, null, null);
INSERT INTO user VALUES ('89', 'denny@qule.com', '96E79218965EB72C92A549DD5A330112', 'denny', '/images/default.jpg', null, '/images/poster.jpg', null, null, null, null);
INSERT INTO user VALUES ('90', 'lvshiling@baidu.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'baidu', '/images/default.jpg', null, '/images/poster.jpg', null, null, null, null);
INSERT INTO user VALUES ('91', 'test20111101@qq.com', '489E7AE47C7F79E46A09C06EEBE93018', 'gwegd', '/images/default.jpg', null, '/images/poster.jpg', null, null, null, null);
INSERT INTO user VALUES ('92', 'test20111107@qq.com', '489E7AE47C7F79E46A09C06EEBE93018', 'AAA', '/images/default.jpg', null, '/images/poster.jpg', null, null, null, null);
INSERT INTO user VALUES ('93', 'baidu@baidu.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'baidu', '/images/default.jpg', null, '/images/poster.jpg', null, null, null, null);
INSERT INTO user VALUES ('94', 'wangxin@sina.com', 'E10ADC3949BA59ABBE56E057F20F883E', '神啊稳定点', '/images/default.jpg', null, '/upload/haibao/94_n.jpg', null, null, '1_666666', null);
INSERT INTO user VALUES ('95', 'alex@alex.com', '96E79218965EB72C92A549DD5A330112', 'alex', '/images/default.jpg', null, '/images/poster.jpg', '1', '95_1322481421841.jpg', null, null);
INSERT INTO user VALUES ('96', 'v5@v5.com', '96E79218965EB72C92A549DD5A330112', 'v5', '/images/default.jpg', null, '/images/poster.jpg', '1', '96_1322559391993.jpg', '1_555555', null);

-- ----------------------------
-- Table structure for `user_area`
-- ----------------------------
DROP TABLE IF EXISTS `user_area`;
CREATE TABLE `user_area` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `user_area_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_area_fk1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_area
-- ----------------------------
INSERT INTO user_area VALUES ('3', '66', '1');
INSERT INTO user_area VALUES ('4', '67', '1');
INSERT INTO user_area VALUES ('5', '68', '1');
INSERT INTO user_area VALUES ('6', '69', '1');
INSERT INTO user_area VALUES ('7', '70', '1');
INSERT INTO user_area VALUES ('8', '71', '1');
INSERT INTO user_area VALUES ('9', '72', '1');
INSERT INTO user_area VALUES ('10', '73', '1');
INSERT INTO user_area VALUES ('11', '74', '1');
INSERT INTO user_area VALUES ('12', '75', '1');
INSERT INTO user_area VALUES ('13', '76', '1');
INSERT INTO user_area VALUES ('14', '77', '1');
INSERT INTO user_area VALUES ('15', '78', '1');
INSERT INTO user_area VALUES ('16', '79', '1');
INSERT INTO user_area VALUES ('17', '80', '1');
INSERT INTO user_area VALUES ('18', '81', '1');
INSERT INTO user_area VALUES ('19', '82', '1');
INSERT INTO user_area VALUES ('20', '83', '1');
INSERT INTO user_area VALUES ('21', '84', '1');
INSERT INTO user_area VALUES ('22', '85', '1');
INSERT INTO user_area VALUES ('23', '86', '1');
INSERT INTO user_area VALUES ('24', '87', '1');
INSERT INTO user_area VALUES ('25', '88', '1');
INSERT INTO user_area VALUES ('26', '89', '1');
INSERT INTO user_area VALUES ('27', '90', '1');
INSERT INTO user_area VALUES ('28', '91', '1');
INSERT INTO user_area VALUES ('29', '92', '1');
INSERT INTO user_area VALUES ('30', '93', '1');
INSERT INTO user_area VALUES ('31', '94', '1');
INSERT INTO user_area VALUES ('32', '95', '1');
INSERT INTO user_area VALUES ('33', '96', '1');

-- ----------------------------
-- Table structure for `user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `status` tinyint(4) default NULL,
  `photo_name` varchar(400) default NULL,
  `operator` int(11) default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO user_auth VALUES ('1', '36', '3', '36_1320310007880.jpg', null, '2011-11-03 16:47:05', '2011-11-03 16:47:05');
INSERT INTO user_auth VALUES ('2', '68', '3', '68_1320310569805.jpg', null, '2011-11-03 16:56:29', '2011-11-03 16:56:29');
INSERT INTO user_auth VALUES ('3', '38', '3', '38_1320315470540.jpg', null, '2011-11-03 18:18:10', '2011-11-03 18:18:10');
INSERT INTO user_auth VALUES ('4', '67', '3', '67_1320400159914.jpg', null, '2011-11-04 17:49:37', '2011-11-04 17:49:37');
INSERT INTO user_auth VALUES ('5', '95', '2', '95_1322481421638.jpg', null, '2011-11-28 19:57:10', '2011-11-28 19:57:10');
INSERT INTO user_auth VALUES ('6', '96', '2', '96_1322559391993.jpg', null, '2011-11-29 17:37:02', '2011-11-29 17:37:02');
INSERT INTO user_auth VALUES ('7', '14', '1', '14_1322567614822.jpg', null, '2011-11-29 19:54:00', '2011-11-29 19:54:00');

-- ----------------------------
-- Table structure for `user_credit`
-- ----------------------------
DROP TABLE IF EXISTS `user_credit`;
CREATE TABLE `user_credit` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `credit` int(11) NOT NULL default '0',
  `score` float(4,1) NOT NULL default '0.0',
  `earn_credit` int(11) NOT NULL default '0',
  `spend_credit` int(11) NOT NULL default '0',
  `star_grade` int(11) NOT NULL default '0',
  `rich_grade` int(11) NOT NULL default '0',
  `visits` int(11) default '0',
  `att_list` text,
  `fans_list` text,
  `fans_num` int(11) default '0',
  `score_num` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_credit_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_credit
-- ----------------------------
INSERT INTO user_credit VALUES ('1', '1', '10000', '9.3', '0', '0', '0', '0', '14', null, '38', '1', '22');
INSERT INTO user_credit VALUES ('2', '38', '8962000', '6.9', '2875', '60600', '38', '60', '191', '89,67,76,3,1,36,2,66', '67,89', '2', '216');
INSERT INTO user_credit VALUES ('3', '5', '10000', '7.0', '0', '0', '0', '0', '4', null, null, '0', '313');
INSERT INTO user_credit VALUES ('4', '76', '10000', '8.5', '0', '0', '0', '0', '4', null, '38', '1', '54');
INSERT INTO user_credit VALUES ('5', '2', '10000', '8.3', '0', '0', '0', '0', '5', null, '38', '1', '5');
INSERT INTO user_credit VALUES ('6', '3', '10000', '0.0', '0', '0', '0', '0', '2', null, '38', '1', null);
INSERT INTO user_credit VALUES ('7', '66', '10625', '0.0', '1375', '750', '23', '17', '41', null, '38', '1', null);
INSERT INTO user_credit VALUES ('8', '4', '10000', '0.0', '0', '0', '0', '0', '1', null, null, '0', null);
INSERT INTO user_credit VALUES ('9', '7', '10000', '0.0', '0', '0', '0', '0', '1', null, null, '0', null);
INSERT INTO user_credit VALUES ('10', '67', '10120', '7.0', '7125', '7005', '44', '44', '43', '38,36', '38', '1', '68');
INSERT INTO user_credit VALUES ('11', '36', '1877', '5.0', '1877', '0', '28', '0', '40', null, '38,67', '2', '2');
INSERT INTO user_credit VALUES ('12', '80', '0', '6.0', '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO user_credit VALUES ('13', '81', '0', '6.0', '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO user_credit VALUES ('14', '82', '0', '8.8', '0', '0', '0', '0', '1', null, null, '0', '2');
INSERT INTO user_credit VALUES ('15', '83', '0', '0.0', '0', '0', '0', '0', '1', null, null, '0', null);
INSERT INTO user_credit VALUES ('16', '84', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('17', '85', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('18', '86', '0', '4.0', '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO user_credit VALUES ('19', '87', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('20', '88', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('21', '89', '20925', '0.0', '20925', '0', '52', '0', '46', '38', '38', '1', null);
INSERT INTO user_credit VALUES ('22', '90', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('23', '91', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('24', '10', '0', '6.5', '0', '0', '0', '0', null, null, null, null, '2');
INSERT INTO user_credit VALUES ('25', '37', '0', '7.0', '0', '0', '0', '0', null, null, null, null, '0');
INSERT INTO user_credit VALUES ('26', '29', '0', '8.5', '0', '0', '0', '0', null, null, null, null, '1');
INSERT INTO user_credit VALUES ('27', '63', '0', '6.0', '0', '0', '0', '0', null, null, null, null, '0');
INSERT INTO user_credit VALUES ('28', '39', '0', '6.5', '0', '0', '0', '0', null, null, null, null, '1');
INSERT INTO user_credit VALUES ('29', '27', '0', '6.0', '0', '0', '0', '0', null, null, null, null, '0');
INSERT INTO user_credit VALUES ('30', '8', '0', '7.0', '0', '0', '0', '0', null, null, null, null, '0');
INSERT INTO user_credit VALUES ('31', '92', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('32', '93', '0', '0.0', '0', '0', '0', '0', '10', null, null, '0', null);
INSERT INTO user_credit VALUES ('33', '14', '0', '9.2', '0', '0', '0', '0', '9', null, null, '0', '5');
INSERT INTO user_credit VALUES ('34', '94', '0', '0.0', '0', '0', '0', '0', '20', null, null, '0', null);
INSERT INTO user_credit VALUES ('35', '95', '0', '9.7', '0', '0', '0', '0', '0', null, null, '0', '2');
INSERT INTO user_credit VALUES ('36', '96', '0', '9.6', '0', '0', '0', '0', '0', null, null, '0', '7');
INSERT INTO user_credit VALUES ('37', '68', '0', '0.0', '0', '0', '0', '0', '0', null, null, '0', null);
INSERT INTO user_credit VALUES ('38', '35', '0', '9.5', '0', '0', '0', '0', null, null, null, null, '0');

-- ----------------------------
-- Table structure for `user_credit_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_credit_log`;
CREATE TABLE `user_credit_log` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL default '0',
  `credit` int(11) NOT NULL default '0',
  `score` int(11) NOT NULL default '0',
  `state` int(11) NOT NULL default '0',
  `ref` varchar(20) default NULL,
  `add_time` datetime NOT NULL,
  `cash` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_credit_log
-- ----------------------------
INSERT INTO user_credit_log VALUES ('1', '38', '0', '5000', '0', '0', null, '2011-09-23 11:24:43', '50');
INSERT INTO user_credit_log VALUES ('2', '38', '20', '500', '0', '0', null, '2011-09-27 18:47:14', null);
INSERT INTO user_credit_log VALUES ('3', '67', '30', '250', '0', '0', null, '2011-09-27 18:47:14', null);
INSERT INTO user_credit_log VALUES ('4', '38', '20', '250', '0', '0', null, '2011-09-27 18:47:26', null);
INSERT INTO user_credit_log VALUES ('5', '67', '30', '125', '0', '0', null, '2011-09-27 18:47:26', null);
INSERT INTO user_credit_log VALUES ('6', '67', '20', '500', '0', '0', null, '2011-09-27 19:00:43', null);
INSERT INTO user_credit_log VALUES ('7', '38', '30', '250', '0', '0', null, '2011-09-27 19:00:43', null);
INSERT INTO user_credit_log VALUES ('8', '67', '20', '500', '0', '0', null, '2011-09-27 19:01:13', null);
INSERT INTO user_credit_log VALUES ('9', '38', '30', '250', '0', '0', null, '2011-09-27 19:01:13', null);
INSERT INTO user_credit_log VALUES ('10', '36', '0', '500', '0', '0', null, '2011-10-08 14:45:11', '5');
INSERT INTO user_credit_log VALUES ('11', '38', '20', '500', '0', '0', null, '2011-10-09 20:40:13', null);
INSERT INTO user_credit_log VALUES ('12', '67', '30', '250', '0', '0', null, '2011-10-09 20:40:13', null);
INSERT INTO user_credit_log VALUES ('13', '38', '20', '250', '0', '0', null, '2011-10-09 20:40:24', null);
INSERT INTO user_credit_log VALUES ('14', '67', '30', '125', '0', '0', null, '2011-10-09 20:40:24', null);
INSERT INTO user_credit_log VALUES ('15', '66', '20', '500', '0', '0', null, '2011-10-10 17:36:57', null);
INSERT INTO user_credit_log VALUES ('16', '67', '30', '250', '0', '0', null, '2011-10-10 17:36:57', null);
INSERT INTO user_credit_log VALUES ('17', '67', '0', '5000', '0', '0', null, '2011-10-12 17:28:42', '50');
INSERT INTO user_credit_log VALUES ('18', '38', '20', '500', '0', '0', null, '2011-10-13 11:36:42', null);
INSERT INTO user_credit_log VALUES ('19', '67', '30', '250', '0', '0', null, '2011-10-13 11:36:42', null);
INSERT INTO user_credit_log VALUES ('20', '38', '20', '250', '0', '0', null, '2011-10-13 11:37:05', null);
INSERT INTO user_credit_log VALUES ('21', '67', '30', '125', '0', '0', null, '2011-10-13 11:37:05', null);
INSERT INTO user_credit_log VALUES ('22', '67', '20', '500', '0', '0', null, '2011-10-13 11:37:51', null);
INSERT INTO user_credit_log VALUES ('23', '38', '30', '250', '0', '0', null, '2011-10-13 11:37:51', null);
INSERT INTO user_credit_log VALUES ('24', '38', '20', '500', '0', '0', null, '2011-10-13 12:08:00', null);
INSERT INTO user_credit_log VALUES ('25', '67', '30', '250', '0', '0', null, '2011-10-13 12:08:00', null);
INSERT INTO user_credit_log VALUES ('26', '38', '20', '250', '0', '0', null, '2011-10-13 12:08:10', null);
INSERT INTO user_credit_log VALUES ('27', '67', '30', '125', '0', '0', null, '2011-10-13 12:08:10', null);
INSERT INTO user_credit_log VALUES ('28', '38', '20', '500', '0', '0', null, '2011-10-13 12:21:37', null);
INSERT INTO user_credit_log VALUES ('29', '67', '30', '250', '0', '0', null, '2011-10-13 12:21:37', null);
INSERT INTO user_credit_log VALUES ('30', '38', '20', '250', '0', '0', null, '2011-10-13 12:22:47', null);
INSERT INTO user_credit_log VALUES ('31', '67', '30', '125', '0', '0', null, '2011-10-13 12:22:47', null);
INSERT INTO user_credit_log VALUES ('32', '38', '20', '250', '0', '0', null, '2011-10-13 12:23:29', null);
INSERT INTO user_credit_log VALUES ('33', '67', '30', '125', '0', '0', null, '2011-10-13 12:23:29', null);
INSERT INTO user_credit_log VALUES ('34', '67', '20', '250', '0', '0', null, '2011-10-13 12:24:26', null);
INSERT INTO user_credit_log VALUES ('35', '38', '30', '125', '0', '0', null, '2011-10-13 12:24:26', null);
INSERT INTO user_credit_log VALUES ('36', '38', '20', '5000', '0', '0', null, '2011-10-13 12:27:25', null);
INSERT INTO user_credit_log VALUES ('37', '67', '30', '2500', '0', '0', null, '2011-10-13 12:27:25', null);
INSERT INTO user_credit_log VALUES ('38', '67', '20', '250', '0', '0', null, '2011-10-13 12:28:35', null);
INSERT INTO user_credit_log VALUES ('39', '38', '30', '125', '0', '0', null, '2011-10-13 12:28:35', null);
INSERT INTO user_credit_log VALUES ('40', '67', '20', '500', '0', '0', null, '2011-10-13 12:29:08', null);
INSERT INTO user_credit_log VALUES ('41', '38', '30', '250', '0', '0', null, '2011-10-13 12:29:08', null);
INSERT INTO user_credit_log VALUES ('42', '67', '20', '250', '0', '0', null, '2011-10-13 12:34:56', null);
INSERT INTO user_credit_log VALUES ('43', '38', '30', '125', '0', '0', null, '2011-10-13 12:34:56', null);
INSERT INTO user_credit_log VALUES ('44', '67', '20', '250', '0', '0', null, '2011-10-13 12:35:05', null);
INSERT INTO user_credit_log VALUES ('45', '38', '30', '125', '0', '0', null, '2011-10-13 12:35:05', null);
INSERT INTO user_credit_log VALUES ('46', '67', '20', '250', '0', '0', null, '2011-10-13 12:35:10', null);
INSERT INTO user_credit_log VALUES ('47', '38', '30', '125', '0', '0', null, '2011-10-13 12:35:10', null);
INSERT INTO user_credit_log VALUES ('48', '67', '20', '250', '0', '0', null, '2011-10-13 12:35:14', null);
INSERT INTO user_credit_log VALUES ('49', '38', '30', '125', '0', '0', null, '2011-10-13 12:35:14', null);
INSERT INTO user_credit_log VALUES ('50', '67', '20', '250', '0', '0', null, '2011-10-13 12:35:18', null);
INSERT INTO user_credit_log VALUES ('51', '38', '30', '125', '0', '0', null, '2011-10-13 12:35:18', null);
INSERT INTO user_credit_log VALUES ('52', '67', '20', '250', '0', '0', null, '2011-10-13 12:35:21', null);
INSERT INTO user_credit_log VALUES ('53', '38', '30', '125', '0', '0', null, '2011-10-13 12:35:21', null);
INSERT INTO user_credit_log VALUES ('54', '67', '20', '250', '0', '0', null, '2011-10-13 12:36:20', null);
INSERT INTO user_credit_log VALUES ('55', '38', '30', '125', '0', '0', null, '2011-10-13 12:36:20', null);
INSERT INTO user_credit_log VALUES ('56', '66', '20', '250', '0', '0', null, '2011-10-13 15:02:05', null);
INSERT INTO user_credit_log VALUES ('57', '38', '30', '125', '0', '0', null, '2011-10-13 15:02:05', null);
INSERT INTO user_credit_log VALUES ('58', '38', '20', '500', '0', '0', null, '2011-10-13 15:02:26', null);
INSERT INTO user_credit_log VALUES ('59', '66', '30', '250', '0', '0', null, '2011-10-13 15:02:26', null);
INSERT INTO user_credit_log VALUES ('60', '38', '20', '500', '0', '0', null, '2011-10-13 15:02:57', null);
INSERT INTO user_credit_log VALUES ('61', '66', '30', '250', '0', '0', null, '2011-10-13 15:02:57', null);
INSERT INTO user_credit_log VALUES ('62', '67', '20', '250', '0', '0', null, '2011-10-13 15:04:01', null);
INSERT INTO user_credit_log VALUES ('63', '38', '30', '125', '0', '0', null, '2011-10-13 15:04:01', null);
INSERT INTO user_credit_log VALUES ('64', '38', '20', '500', '0', '0', null, '2011-10-13 15:19:30', null);
INSERT INTO user_credit_log VALUES ('65', '66', '30', '250', '0', '0', null, '2011-10-13 15:19:30', null);
INSERT INTO user_credit_log VALUES ('66', '38', '20', '250', '0', '0', null, '2011-10-13 15:19:35', null);
INSERT INTO user_credit_log VALUES ('67', '66', '30', '125', '0', '0', null, '2011-10-13 15:19:35', null);
INSERT INTO user_credit_log VALUES ('68', '38', '20', '500', '0', '0', null, '2011-10-13 15:19:40', null);
INSERT INTO user_credit_log VALUES ('69', '66', '30', '250', '0', '0', null, '2011-10-13 15:19:40', null);
INSERT INTO user_credit_log VALUES ('70', '67', '20', '250', '0', '0', null, '2011-10-14 11:01:51', null);
INSERT INTO user_credit_log VALUES ('71', '36', '30', '125', '0', '0', null, '2011-10-14 11:01:52', null);
INSERT INTO user_credit_log VALUES ('72', '67', '20', '5', '0', '0', null, '2011-10-14 11:01:58', null);
INSERT INTO user_credit_log VALUES ('73', '36', '30', '2', '0', '0', null, '2011-10-14 11:01:58', null);
INSERT INTO user_credit_log VALUES ('74', '38', '20', '500', '0', '0', null, '2011-10-14 11:27:22', null);
INSERT INTO user_credit_log VALUES ('75', '36', '30', '250', '0', '0', null, '2011-10-14 11:27:22', null);
INSERT INTO user_credit_log VALUES ('76', '38', '20', '500', '0', '0', null, '2011-10-14 11:29:01', null);
INSERT INTO user_credit_log VALUES ('77', '36', '30', '250', '0', '0', null, '2011-10-14 11:29:01', null);
INSERT INTO user_credit_log VALUES ('78', '67', '20', '500', '0', '0', null, '2011-10-14 12:06:11', null);
INSERT INTO user_credit_log VALUES ('79', '36', '30', '250', '0', '0', null, '2011-10-14 12:06:11', null);
INSERT INTO user_credit_log VALUES ('80', '38', '20', '500', '0', '0', null, '2011-10-14 17:07:12', null);
INSERT INTO user_credit_log VALUES ('81', '67', '30', '250', '0', '0', null, '2011-10-14 17:07:12', null);
INSERT INTO user_credit_log VALUES ('82', '38', '20', '250', '0', '0', null, '2011-10-14 17:07:57', null);
INSERT INTO user_credit_log VALUES ('83', '67', '30', '125', '0', '0', null, '2011-10-14 17:07:57', null);
INSERT INTO user_credit_log VALUES ('84', '38', '20', '500', '0', '0', null, '2011-10-14 17:14:29', null);
INSERT INTO user_credit_log VALUES ('85', '67', '30', '250', '0', '0', null, '2011-10-14 17:14:29', null);
INSERT INTO user_credit_log VALUES ('86', '38', '20', '500', '0', '0', null, '2011-10-14 17:14:37', null);
INSERT INTO user_credit_log VALUES ('87', '36', '30', '250', '0', '0', null, '2011-10-14 17:14:37', null);
INSERT INTO user_credit_log VALUES ('88', '38', '20', '250', '0', '0', null, '2011-10-14 17:16:34', null);
INSERT INTO user_credit_log VALUES ('89', '67', '30', '125', '0', '0', null, '2011-10-14 17:16:34', null);
INSERT INTO user_credit_log VALUES ('90', '38', '20', '250', '0', '0', null, '2011-10-14 17:19:35', null);
INSERT INTO user_credit_log VALUES ('91', '67', '30', '125', '0', '0', null, '2011-10-14 17:19:35', null);
INSERT INTO user_credit_log VALUES ('92', '38', '20', '250', '0', '0', null, '2011-10-14 17:20:16', null);
INSERT INTO user_credit_log VALUES ('93', '67', '30', '125', '0', '0', null, '2011-10-14 17:20:16', null);
INSERT INTO user_credit_log VALUES ('94', '38', '20', '250', '0', '0', null, '2011-10-14 17:20:38', null);
INSERT INTO user_credit_log VALUES ('95', '36', '30', '125', '0', '0', null, '2011-10-14 17:20:38', null);
INSERT INTO user_credit_log VALUES ('96', '38', '20', '250', '0', '0', null, '2011-10-14 17:22:24', null);
INSERT INTO user_credit_log VALUES ('97', '36', '30', '125', '0', '0', null, '2011-10-14 17:22:24', null);
INSERT INTO user_credit_log VALUES ('98', '38', '20', '500', '0', '0', null, '2011-10-14 17:25:22', null);
INSERT INTO user_credit_log VALUES ('99', '67', '30', '250', '0', '0', null, '2011-10-14 17:25:22', null);
INSERT INTO user_credit_log VALUES ('100', '38', '20', '500', '0', '0', null, '2011-10-14 17:43:33', null);
INSERT INTO user_credit_log VALUES ('101', '36', '30', '250', '0', '0', null, '2011-10-14 17:43:33', null);
INSERT INTO user_credit_log VALUES ('102', '38', '20', '500', '0', '0', null, '2011-10-14 17:44:10', null);
INSERT INTO user_credit_log VALUES ('103', '36', '30', '250', '0', '0', null, '2011-10-14 17:44:10', null);
INSERT INTO user_credit_log VALUES ('104', '38', '20', '500', '0', '0', null, '2011-10-20 12:44:01', null);
INSERT INTO user_credit_log VALUES ('105', '67', '30', '250', '0', '0', null, '2011-10-20 12:44:01', null);
INSERT INTO user_credit_log VALUES ('106', '38', '20', '500', '0', '0', null, '2011-10-21 17:11:27', null);
INSERT INTO user_credit_log VALUES ('107', '67', '30', '250', '0', '0', null, '2011-10-21 17:11:27', null);
INSERT INTO user_credit_log VALUES ('108', '38', '20', '500', '0', '0', null, '2011-10-21 17:11:36', null);
INSERT INTO user_credit_log VALUES ('109', '89', '30', '250', '0', '0', null, '2011-10-21 17:11:37', null);
INSERT INTO user_credit_log VALUES ('110', '38', '20', '250', '0', '0', null, '2011-10-21 17:11:42', null);
INSERT INTO user_credit_log VALUES ('111', '89', '30', '125', '0', '0', null, '2011-10-21 17:11:42', null);
INSERT INTO user_credit_log VALUES ('112', '38', '20', '250', '0', '0', null, '2011-10-21 17:25:16', null);
INSERT INTO user_credit_log VALUES ('113', '89', '30', '125', '0', '0', null, '2011-10-21 17:25:16', null);
INSERT INTO user_credit_log VALUES ('114', '67', '20', '500', '0', '0', null, '2011-10-21 17:25:51', null);
INSERT INTO user_credit_log VALUES ('115', '38', '30', '250', '0', '0', null, '2011-10-21 17:25:51', null);
INSERT INTO user_credit_log VALUES ('116', '67', '20', '250', '0', '0', null, '2011-10-21 17:57:56', null);
INSERT INTO user_credit_log VALUES ('117', '89', '30', '125', '0', '0', null, '2011-10-21 17:57:56', null);
INSERT INTO user_credit_log VALUES ('118', '67', '20', '500', '0', '0', null, '2011-10-21 17:58:07', null);
INSERT INTO user_credit_log VALUES ('119', '89', '30', '250', '0', '0', null, '2011-10-21 17:58:07', null);
INSERT INTO user_credit_log VALUES ('120', '67', '20', '250', '0', '0', null, '2011-10-21 18:29:50', null);
INSERT INTO user_credit_log VALUES ('121', '38', '30', '125', '0', '0', null, '2011-10-21 18:29:50', null);
INSERT INTO user_credit_log VALUES ('122', '38', '20', '500', '0', '0', null, '2011-10-21 18:44:49', null);
INSERT INTO user_credit_log VALUES ('123', '67', '30', '250', '0', '0', null, '2011-10-21 18:44:49', null);
INSERT INTO user_credit_log VALUES ('124', '67', '20', '250', '0', '0', null, '2011-10-21 18:45:38', null);
INSERT INTO user_credit_log VALUES ('125', '38', '30', '125', '0', '0', null, '2011-10-21 18:45:38', null);
INSERT INTO user_credit_log VALUES ('126', '38', '20', '500', '0', '0', null, '2011-10-24 16:19:29', null);
INSERT INTO user_credit_log VALUES ('127', '67', '30', '250', '0', '0', null, '2011-10-24 16:19:29', null);
INSERT INTO user_credit_log VALUES ('128', '38', '20', '250', '0', '0', null, '2011-10-24 16:19:43', null);
INSERT INTO user_credit_log VALUES ('129', '67', '30', '125', '0', '0', null, '2011-10-24 16:19:43', null);
INSERT INTO user_credit_log VALUES ('130', '38', '0', '5000', '0', '0', null, '2011-10-24 16:43:07', '50');
INSERT INTO user_credit_log VALUES ('131', '91', '0', '5000', '0', '0', null, '2011-11-04 15:38:48', '50');
INSERT INTO user_credit_log VALUES ('132', '91', '0', '5000', '0', '0', null, '2011-11-04 15:52:27', '50');
INSERT INTO user_credit_log VALUES ('133', '38', '0', '500', '0', '0', null, '2011-11-04 16:28:32', '5');
INSERT INTO user_credit_log VALUES ('134', '92', '88', '0', '0', '0', null, '2011-11-07 14:43:54', null);
INSERT INTO user_credit_log VALUES ('135', '92', '88', '0', '0', '0', null, '2011-11-07 14:46:33', null);
INSERT INTO user_credit_log VALUES ('136', '92', '88', '0', '0', '0', null, '2011-11-07 14:48:16', null);
INSERT INTO user_credit_log VALUES ('137', '92', '88', '0', '0', '0', null, '2011-11-07 14:56:36', null);
INSERT INTO user_credit_log VALUES ('138', '92', '88', '0', '0', '0', null, '2011-11-07 15:18:40', null);
INSERT INTO user_credit_log VALUES ('139', '92', '88', '0', '0', '0', null, '2011-11-07 15:18:41', null);
INSERT INTO user_credit_log VALUES ('140', '92', '88', '0', '0', '0', null, '2011-11-07 15:18:41', null);
INSERT INTO user_credit_log VALUES ('141', '92', '88', '0', '0', '0', null, '2011-11-07 15:18:46', null);
INSERT INTO user_credit_log VALUES ('142', '92', '88', '0', '0', '0', null, '2011-11-07 15:18:55', null);
INSERT INTO user_credit_log VALUES ('143', '92', '88', '0', '0', '0', null, '2011-11-07 15:19:30', null);
INSERT INTO user_credit_log VALUES ('144', '92', '88', '0', '0', '0', null, '2011-11-07 15:19:31', null);
INSERT INTO user_credit_log VALUES ('145', '92', '88', '0', '0', '0', null, '2011-11-07 15:19:31', null);
INSERT INTO user_credit_log VALUES ('146', '92', '88', '0', '0', '0', null, '2011-11-07 15:19:52', null);
INSERT INTO user_credit_log VALUES ('147', '92', '88', '0', '0', '0', null, '2011-11-07 15:19:52', null);
INSERT INTO user_credit_log VALUES ('148', '92', '88', '0', '0', '0', null, '2011-11-07 15:21:10', null);
INSERT INTO user_credit_log VALUES ('149', '92', '88', '0', '0', '0', null, '2011-11-07 15:21:11', null);
INSERT INTO user_credit_log VALUES ('150', '92', '88', '0', '0', '0', null, '2011-11-07 15:21:11', null);
INSERT INTO user_credit_log VALUES ('151', '92', '88', '0', '0', '0', null, '2011-11-07 15:23:30', null);
INSERT INTO user_credit_log VALUES ('152', '92', '88', '0', '0', '0', null, '2011-11-07 15:26:03', null);
INSERT INTO user_credit_log VALUES ('153', '92', '88', '0', '0', '0', null, '2011-11-07 15:32:12', null);
INSERT INTO user_credit_log VALUES ('154', '92', '88', '0', '0', '0', null, '2011-11-07 15:48:55', null);
INSERT INTO user_credit_log VALUES ('155', '92', '88', '0', '0', '0', null, '2011-11-07 15:49:00', null);
INSERT INTO user_credit_log VALUES ('156', '92', '88', '0', '0', '0', null, '2011-11-07 15:49:13', null);
INSERT INTO user_credit_log VALUES ('157', '92', '88', '0', '0', '0', null, '2011-11-07 15:49:14', null);
INSERT INTO user_credit_log VALUES ('158', '92', '88', '0', '0', '0', null, '2011-11-07 15:49:14', null);
INSERT INTO user_credit_log VALUES ('159', '92', '88', '0', '0', '0', null, '2011-11-07 15:49:25', null);
INSERT INTO user_credit_log VALUES ('160', '92', '88', '0', '0', '0', null, '2011-11-07 15:49:25', null);
INSERT INTO user_credit_log VALUES ('161', '92', '88', '0', '0', '0', null, '2011-11-07 15:51:48', null);
INSERT INTO user_credit_log VALUES ('162', '92', '88', '0', '0', '0', null, '2011-11-07 15:55:39', null);
INSERT INTO user_credit_log VALUES ('163', '92', '88', '0', '0', '0', null, '2011-11-07 16:06:25', null);
INSERT INTO user_credit_log VALUES ('164', '92', '88', '0', '0', '0', null, '2011-11-07 16:06:42', null);
INSERT INTO user_credit_log VALUES ('165', '92', '88', '0', '0', '0', null, '2011-11-07 16:08:35', null);
INSERT INTO user_credit_log VALUES ('166', '92', '88', '0', '0', '0', null, '2011-11-07 16:09:06', null);
INSERT INTO user_credit_log VALUES ('167', '92', '88', '0', '0', '0', null, '2011-11-07 16:21:18', null);
INSERT INTO user_credit_log VALUES ('168', '92', '88', '0', '0', '0', null, '2011-11-07 16:30:53', null);
INSERT INTO user_credit_log VALUES ('169', '92', '88', '0', '0', '0', null, '2011-11-07 16:32:45', null);
INSERT INTO user_credit_log VALUES ('170', '92', '88', '0', '0', '0', null, '2011-11-07 16:38:39', null);
INSERT INTO user_credit_log VALUES ('171', '91', '40', '0', '0', '0', null, '2011-11-07 16:41:57', null);
INSERT INTO user_credit_log VALUES ('172', '91', '40', '0', '0', '0', null, '2011-11-07 16:44:29', null);
INSERT INTO user_credit_log VALUES ('173', '91', '40', '0', '0', '0', null, '2011-11-07 17:02:52', null);
INSERT INTO user_credit_log VALUES ('174', '91', '40', '0', '0', '0', null, '2011-11-07 17:09:10', null);
INSERT INTO user_credit_log VALUES ('175', '91', '40', '0', '0', '0', null, '2011-11-07 17:11:59', null);
INSERT INTO user_credit_log VALUES ('176', '91', '40', '0', '0', '0', null, '2011-11-07 17:23:43', null);
INSERT INTO user_credit_log VALUES ('177', '91', '40', '0', '0', '0', null, '2011-11-07 17:25:08', null);
INSERT INTO user_credit_log VALUES ('178', '91', '40', '0', '0', '0', null, '2011-11-07 17:25:53', null);
INSERT INTO user_credit_log VALUES ('179', '91', '40', '0', '0', '0', null, '2011-11-07 17:28:11', null);
INSERT INTO user_credit_log VALUES ('180', '91', '40', '0', '0', '0', null, '2011-11-07 17:29:39', null);
INSERT INTO user_credit_log VALUES ('181', '91', '40', '0', '0', '0', null, '2011-11-07 17:30:18', null);
INSERT INTO user_credit_log VALUES ('182', '91', '40', '0', '0', '0', null, '2011-11-07 17:32:00', null);
INSERT INTO user_credit_log VALUES ('183', '91', '40', '0', '0', '0', null, '2011-11-07 17:57:27', null);
INSERT INTO user_credit_log VALUES ('184', '91', '40', '0', '0', '0', null, '2011-11-07 17:59:00', null);
INSERT INTO user_credit_log VALUES ('185', '91', '40', '0', '0', '0', null, '2011-11-07 18:07:24', null);
INSERT INTO user_credit_log VALUES ('186', '91', '40', '0', '0', '0', null, '2011-11-07 18:10:22', null);
INSERT INTO user_credit_log VALUES ('187', '91', '40', '0', '0', '0', null, '2011-11-07 18:13:35', null);
INSERT INTO user_credit_log VALUES ('188', '92', '88', '0', '0', '0', null, '2011-11-07 18:25:12', null);
INSERT INTO user_credit_log VALUES ('189', '91', '40', '0', '0', '0', null, '2011-11-07 18:25:15', null);
INSERT INTO user_credit_log VALUES ('190', '91', '40', '0', '0', '0', null, '2011-11-07 18:25:27', null);
INSERT INTO user_credit_log VALUES ('191', '91', '40', '0', '0', '0', null, '2011-11-07 18:26:07', null);
INSERT INTO user_credit_log VALUES ('192', '91', '40', '0', '0', '0', null, '2011-11-07 18:27:11', null);
INSERT INTO user_credit_log VALUES ('193', '91', '40', '0', '0', '0', null, '2011-11-07 18:27:20', null);
INSERT INTO user_credit_log VALUES ('194', '92', '88', '0', '0', '0', null, '2011-11-07 18:27:49', null);
INSERT INTO user_credit_log VALUES ('195', '92', '88', '0', '0', '0', null, '2011-11-07 18:28:38', null);
INSERT INTO user_credit_log VALUES ('196', '92', '88', '0', '0', '0', null, '2011-11-07 18:28:52', null);
INSERT INTO user_credit_log VALUES ('197', '92', '88', '0', '0', '0', null, '2011-11-07 18:29:16', null);
INSERT INTO user_credit_log VALUES ('198', '92', '88', '0', '0', '0', null, '2011-11-07 18:29:39', null);
INSERT INTO user_credit_log VALUES ('199', '91', '40', '0', '0', '0', null, '2011-11-07 18:33:05', null);
INSERT INTO user_credit_log VALUES ('200', '91', '40', '0', '0', '0', null, '2011-11-07 18:33:23', null);
INSERT INTO user_credit_log VALUES ('201', '92', '88', '0', '0', '0', null, '2011-11-07 18:37:31', null);
INSERT INTO user_credit_log VALUES ('202', '92', '88', '0', '0', '0', null, '2011-11-07 18:38:55', null);
INSERT INTO user_credit_log VALUES ('203', '92', '88', '0', '0', '0', null, '2011-11-07 18:38:57', null);
INSERT INTO user_credit_log VALUES ('204', '92', '88', '0', '0', '0', null, '2011-11-07 18:38:59', null);
INSERT INTO user_credit_log VALUES ('205', '92', '88', '0', '0', '0', null, '2011-11-07 18:46:52', null);
INSERT INTO user_credit_log VALUES ('206', '92', '88', '0', '0', '0', null, '2011-11-07 18:46:57', null);
INSERT INTO user_credit_log VALUES ('207', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:05', null);
INSERT INTO user_credit_log VALUES ('208', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:06', null);
INSERT INTO user_credit_log VALUES ('209', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:07', null);
INSERT INTO user_credit_log VALUES ('210', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:07', null);
INSERT INTO user_credit_log VALUES ('211', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:07', null);
INSERT INTO user_credit_log VALUES ('212', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:07', null);
INSERT INTO user_credit_log VALUES ('213', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:08', null);
INSERT INTO user_credit_log VALUES ('214', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:08', null);
INSERT INTO user_credit_log VALUES ('215', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:25', null);
INSERT INTO user_credit_log VALUES ('216', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:26', null);
INSERT INTO user_credit_log VALUES ('217', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:26', null);
INSERT INTO user_credit_log VALUES ('218', '92', '88', '0', '0', '0', null, '2011-11-07 18:48:53', null);
INSERT INTO user_credit_log VALUES ('219', '92', '88', '0', '0', '0', null, '2011-11-07 18:50:16', null);
INSERT INTO user_credit_log VALUES ('220', '92', '88', '0', '0', '0', null, '2011-11-07 19:06:56', null);
INSERT INTO user_credit_log VALUES ('221', '92', '88', '0', '0', '0', null, '2011-11-07 19:21:54', null);
INSERT INTO user_credit_log VALUES ('222', '38', '40', '2749', '0', '0', null, '2011-11-08 11:44:23', null);
INSERT INTO user_credit_log VALUES ('223', '38', '40', '1', '0', '0', null, '2011-11-08 11:47:01', null);
INSERT INTO user_credit_log VALUES ('224', '38', '40', '1', '0', '0', null, '2011-11-08 11:52:28', null);
INSERT INTO user_credit_log VALUES ('225', '38', '40', '2', '0', '0', null, '2011-11-08 11:55:44', null);
INSERT INTO user_credit_log VALUES ('226', '38', '40', '1', '0', '0', null, '2011-11-08 12:31:15', null);
INSERT INTO user_credit_log VALUES ('227', '38', '20', '250', '0', '0', null, '2011-11-14 18:08:12', null);
INSERT INTO user_credit_log VALUES ('228', '89', '30', '125', '0', '0', null, '2011-11-14 18:08:12', null);
INSERT INTO user_credit_log VALUES ('229', '38', '20', '500', '0', '0', null, '2011-11-14 18:08:29', null);
INSERT INTO user_credit_log VALUES ('230', '66', '30', '250', '0', '0', null, '2011-11-14 18:08:29', null);
INSERT INTO user_credit_log VALUES ('231', '38', '20', '600', '0', '0', null, '2011-11-14 19:13:28', null);
INSERT INTO user_credit_log VALUES ('232', '89', '30', '300', '0', '0', null, '2011-11-14 19:13:28', null);
INSERT INTO user_credit_log VALUES ('233', '38', '20', '50', '0', '0', null, '2011-11-14 19:13:43', null);
INSERT INTO user_credit_log VALUES ('234', '89', '30', '25', '0', '0', null, '2011-11-14 19:13:43', null);
INSERT INTO user_credit_log VALUES ('235', '38', '20', '500', '0', '0', null, '2011-11-14 19:13:56', null);
INSERT INTO user_credit_log VALUES ('236', '89', '30', '250', '0', '0', null, '2011-11-14 19:13:56', null);
INSERT INTO user_credit_log VALUES ('237', '38', '20', '400', '0', '0', null, '2011-11-14 19:14:28', null);
INSERT INTO user_credit_log VALUES ('238', '89', '30', '200', '0', '0', null, '2011-11-14 19:14:28', null);
INSERT INTO user_credit_log VALUES ('239', '38', '20', '300', '0', '0', null, '2011-11-14 19:14:36', null);
INSERT INTO user_credit_log VALUES ('240', '89', '30', '150', '0', '0', null, '2011-11-14 19:14:36', null);
INSERT INTO user_credit_log VALUES ('241', '38', '20', '4000', '0', '0', null, '2011-11-14 19:19:48', null);
INSERT INTO user_credit_log VALUES ('242', '89', '30', '2000', '0', '0', null, '2011-11-14 19:19:48', null);
INSERT INTO user_credit_log VALUES ('243', '38', '20', '4000', '0', '0', null, '2011-11-14 19:19:55', null);
INSERT INTO user_credit_log VALUES ('244', '89', '30', '2000', '0', '0', null, '2011-11-14 19:19:55', null);
INSERT INTO user_credit_log VALUES ('245', '38', '20', '1000', '0', '0', null, '2011-11-14 19:20:29', null);
INSERT INTO user_credit_log VALUES ('246', '89', '30', '500', '0', '0', null, '2011-11-14 19:20:29', null);
INSERT INTO user_credit_log VALUES ('247', '38', '20', '3000', '0', '0', null, '2011-11-14 19:20:36', null);
INSERT INTO user_credit_log VALUES ('248', '89', '30', '1500', '0', '0', null, '2011-11-14 19:20:36', null);
INSERT INTO user_credit_log VALUES ('249', '38', '20', '1500', '0', '0', null, '2011-11-14 19:20:42', null);
INSERT INTO user_credit_log VALUES ('250', '89', '30', '750', '0', '0', null, '2011-11-14 19:20:42', null);
INSERT INTO user_credit_log VALUES ('251', '38', '20', '2500', '0', '0', null, '2011-11-14 19:20:48', null);
INSERT INTO user_credit_log VALUES ('252', '89', '30', '1250', '0', '0', null, '2011-11-14 19:20:48', null);
INSERT INTO user_credit_log VALUES ('253', '38', '20', '1500', '0', '0', null, '2011-11-14 19:21:02', null);
INSERT INTO user_credit_log VALUES ('254', '89', '30', '750', '0', '0', null, '2011-11-14 19:21:02', null);
INSERT INTO user_credit_log VALUES ('255', '38', '20', '2000', '0', '0', null, '2011-11-14 19:21:19', null);
INSERT INTO user_credit_log VALUES ('256', '89', '30', '1000', '0', '0', null, '2011-11-14 19:21:19', null);
INSERT INTO user_credit_log VALUES ('257', '38', '20', '5000', '0', '0', null, '2011-11-14 19:21:25', null);
INSERT INTO user_credit_log VALUES ('258', '89', '30', '2500', '0', '0', null, '2011-11-14 19:21:25', null);
INSERT INTO user_credit_log VALUES ('259', '38', '20', '10000', '0', '0', null, '2011-11-14 19:22:01', null);
INSERT INTO user_credit_log VALUES ('260', '89', '30', '5000', '0', '0', null, '2011-11-14 19:22:01', null);
INSERT INTO user_credit_log VALUES ('261', '38', '20', '500', '0', '0', null, '2011-11-14 19:29:45', null);
INSERT INTO user_credit_log VALUES ('262', '89', '30', '250', '0', '0', null, '2011-11-14 19:29:45', null);
INSERT INTO user_credit_log VALUES ('263', '38', '20', '3000', '0', '0', null, '2011-11-14 19:29:52', null);
INSERT INTO user_credit_log VALUES ('264', '89', '30', '1500', '0', '0', null, '2011-11-14 19:29:52', null);
INSERT INTO user_credit_log VALUES ('265', '38', '0', '5000', '0', '0', null, '2011-11-21 11:30:39', '50');
INSERT INTO user_credit_log VALUES ('266', '36', '0', '20000', '0', '0', null, '2011-11-24 12:01:26', '200');

-- ----------------------------
-- Table structure for `user_friend`
-- ----------------------------
DROP TABLE IF EXISTS `user_friend`;
CREATE TABLE `user_friend` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `friend_name` varchar(20) default NULL,
  `state` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_friend
-- ----------------------------

-- ----------------------------
-- Table structure for `user_friend_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_friend_group`;
CREATE TABLE `user_friend_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_group_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_friend_group
-- ----------------------------

-- ----------------------------
-- Table structure for `user_game_area`
-- ----------------------------
DROP TABLE IF EXISTS `user_game_area`;
CREATE TABLE `user_game_area` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `user_game_name` varchar(30) NOT NULL,
  `user_game_level` int(11) NOT NULL default '0',
  `user_game_memo` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `user_game_area_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_game_area_fk1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `user_game_area_fk2` FOREIGN KEY (`area_id`) REFERENCES `game_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_game_area
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `user_age` int(11) default '0',
  `user_sex` int(11) default '0',
  `user_province` int(11) default '0',
  `user_city` int(11) default '0',
  `user_degree` varchar(20) default '0',
  `user_height` int(11) default '0',
  `user_weight` int(11) default '0',
  `user_answer` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_info_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO user_info VALUES ('1', '1', '30', '1', '1', '1', '7', '173', '3', 't40');
INSERT INTO user_info VALUES ('2', '20', '29', '1', '1', '1', '6', '173', '3', '');
INSERT INTO user_info VALUES ('3', '38', '23', '1', '2500', '2506', '0', '168', '0', 'ddd ');
INSERT INTO user_info VALUES ('4', '67', '17', '0', '200', '207', '0', '165', '0', '想知道吗？');
INSERT INTO user_info VALUES ('5', '68', '28', '1', '1', '1', '6', '172', '2', 'where');
INSERT INTO user_info VALUES ('7', '76', '1', '1', '1', '1', '2', '99', '1', '123');
INSERT INTO user_info VALUES ('14', '14', '28', '1', '1', '1', '8', '180', '3', '123');
INSERT INTO user_info VALUES ('15', '66', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('16', '7', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('17', '2', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('18', '36', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('19', '89', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('20', '91', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('21', '82', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('22', '19', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('23', '39', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('24', '34', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('25', '47', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('26', '9', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('27', '88', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('28', '63', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('29', '5', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('30', '84', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('31', '12', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('32', '35', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('33', '50', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('34', '69', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('35', '3', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('36', '79', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('37', '74', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('38', '87', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('39', '60', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('40', '54', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('41', '30', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('42', '75', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('43', '85', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('44', '23', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('45', '13', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('46', '32', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('47', '31', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('48', '53', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('49', '26', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('50', '24', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('51', '70', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('52', '25', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('53', '49', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('54', '65', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('55', '72', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('56', '10', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('57', '21', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('58', '71', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('59', '11', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('60', '83', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('61', '59', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('62', '16', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('63', '86', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('64', '8', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('65', '80', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('66', '37', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('67', '29', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('68', '81', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('69', '27', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('70', '92', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('71', '4', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('72', '22', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('73', '56', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('74', '78', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('75', '93', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('76', '94', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('77', '95', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO user_info VALUES ('78', '96', '0', '0', '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for `user_link`
-- ----------------------------
DROP TABLE IF EXISTS `user_link`;
CREATE TABLE `user_link` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `link_type` int(11) NOT NULL default '0',
  `link_field_1` varchar(100) default NULL,
  `link_field_2` varchar(100) default NULL,
  `link_field_3` varchar(100) default NULL,
  `link_field_4` varchar(100) default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_link_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_link
-- ----------------------------
INSERT INTO user_link VALUES ('1', '7', '0', '关注巨人', '2fb33c0486c6299cf208556a96c017d2', '692d985c97db9d0fb494e0b25439d945', '2081411633', '2011-04-27 11:18:06');
INSERT INTO user_link VALUES ('2', '1', '0', '关注巨人', '2fb33c0486c6299cf208556a96c017d2', '692d985c97db9d0fb494e0b25439d945', '2081411633', '2011-06-23 16:13:42');
INSERT INTO user_link VALUES ('3', '12', '0', '演出树', '307cc67bd8b83c34fcde89cf24fe694e', 'b08bc204ce1ce3516897b8515cc8bd38', '1912304521', '2011-04-12 15:25:09');
INSERT INTO user_link VALUES ('8', '14', '1', 'wangxin', 'IFHBKAUBLCFDQDGD', 'pop3.ztgame.com:995', 'SSL', '2011-04-14 12:18:42');
INSERT INTO user_link VALUES ('9', '2', '0', '关注巨人', '2fb33c0486c6299cf208556a96c017d2', '692d985c97db9d0fb494e0b25439d945', '2081411633', '2011-04-18 14:57:04');
INSERT INTO user_link VALUES ('12', '2', '1', '319962', 'GBLBJBFAJBPAOAMAQFSFUF', 'imap.163.com:143', 'NO', '2011-04-18 15:16:38');
INSERT INTO user_link VALUES ('14', '16', '1', 'wangyanyan', 'GBQAGAOAPAHAGBLDHFQFTFSCRFUFGEFE', 'pop3.ztgame.com:995', 'SSL', '2011-04-19 16:40:10');
INSERT INTO user_link VALUES ('20', '14', '2', 'wangxin', null, null, null, '2011-04-25 16:35:43');
INSERT INTO user_link VALUES ('21', '16', '2', 'wangyanyan', null, null, null, '2011-04-26 10:48:39');
INSERT INTO user_link VALUES ('36', '7', '2', 'wanghui2', null, null, null, '2011-04-27 09:17:50');
INSERT INTO user_link VALUES ('38', '7', '1', 'wanghui2', 'GBLBJBFAJBPAOAMAOFSFHB', 'pop3.ztgame.com:995', 'SSL', '2011-04-27 10:52:47');
INSERT INTO user_link VALUES ('40', '19', '2', 'wanghui2', null, null, null, '2011-04-27 11:38:10');
INSERT INTO user_link VALUES ('41', '19', '1', 'wanghui2', 'GBLBJBFAJBPAOAMAOFSFHB', 'pop3.ztgame.com:995', 'SSL', '2011-04-27 19:29:45');
INSERT INTO user_link VALUES ('42', '19', '0', '关注巨人', '2fb33c0486c6299cf208556a96c017d2', '692d985c97db9d0fb494e0b25439d945', '2081411633', '2011-04-28 15:42:05');
INSERT INTO user_link VALUES ('43', '1', '1', 'glassport', 'IFPFRFJFMFLF', 'pop.sina.com:110', 'NO', '2011-04-28 15:57:27');
INSERT INTO user_link VALUES ('44', '1', '2', 'wanghui2', null, null, null, '2011-04-28 16:05:28');
INSERT INTO user_link VALUES ('45', '20', '0', '演出树', '307cc67bd8b83c34fcde89cf24fe694e', 'b08bc204ce1ce3516897b8515cc8bd38', '1912304521', '2011-04-28 17:44:35');
INSERT INTO user_link VALUES ('46', '21', '0', '关注巨人', '2fb33c0486c6299cf208556a96c017d2', '692d985c97db9d0fb494e0b25439d945', '2081411633', '2011-04-28 17:58:35');
INSERT INTO user_link VALUES ('47', '20', '1', 'glassport', 'IFPFRFJFMFLF', 'pop.sina.com:110', 'NO', '2011-04-28 18:00:32');
INSERT INTO user_link VALUES ('48', '20', '2', 'wanghui2', null, null, null, '2011-04-28 18:00:48');
INSERT INTO user_link VALUES ('49', '24', '1', 'houxingang', 'GBQAOARAPATBQFPFJEPFRFTF', 'pop3.ztgame.com:995', 'SSL', '2011-05-04 14:50:11');
INSERT INTO user_link VALUES ('50', '24', '2', 'houxingang', null, null, null, '2011-05-04 14:50:11');
INSERT INTO user_link VALUES ('51', '31', '1', 'yaolijun', 'NBMBIAJAQAHANCQF', 'pop3.ztgame.com:995', 'SSL', '2011-05-25 11:05:51');
INSERT INTO user_link VALUES ('52', '31', '2', 'yaolijun', null, null, null, '2011-05-25 11:05:51');
INSERT INTO user_link VALUES ('53', '1', '3', 'i15043276', 'c1e83e8c68f04bc08dc098f513aadef4', 'da94004ca8ba6065f4ae813fb27d7113', '', '2011-06-23 16:12:27');
INSERT INTO user_link VALUES ('54', '4', '2', 'wanghui2', null, null, null, '2011-06-17 09:03:12');
INSERT INTO user_link VALUES ('55', '4', '1', 'wanghui2', 'GBLBJBFAJBPAOAMAOFSFHB', 'pop3.ztgame.com:995', 'SSL', '2011-06-20 17:42:00');
INSERT INTO user_link VALUES ('56', '4', '3', 'i15043276', 'c1e83e8c68f04bc08dc098f513aadef4', 'da94004ca8ba6065f4ae813fb27d7113', '', '2011-06-23 16:15:02');
INSERT INTO user_link VALUES ('57', '4', '0', '关注巨人', '2fb33c0486c6299cf208556a96c017d2', '692d985c97db9d0fb494e0b25439d945', '2081411633', '2011-06-23 16:15:17');
INSERT INTO user_link VALUES ('63', '1', '4', '3721806873', '41e4540dcb4e613dcb71c686fdc243ba', 'ecc8bdd1f3e3125fde6c0751579b15f8', '王慧微博', '2011-06-24 09:59:25');
INSERT INTO user_link VALUES ('64', '65', '1', 'lvshiling', 'FFIFKFJFLFUFNCKAOBMA', 'pop3.ztgame.com:995', 'SSL', '2011-08-02 11:20:29');
INSERT INTO user_link VALUES ('65', '65', '2', 'lvshiling', null, null, null, '2011-08-02 11:20:29');

-- ----------------------------
-- Table structure for `user_log_state`
-- ----------------------------
DROP TABLE IF EXISTS `user_log_state`;
CREATE TABLE `user_log_state` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `log_state` int(10) unsigned NOT NULL default '0',
  `log_hash_code` varchar(32) NOT NULL,
  `last_login_time` datetime default NULL,
  `online_time` int(11) unsigned default '0',
  `live_state` tinyint(4) default '0',
  `last_live_time` datetime default NULL,
  `cam_num` tinyint(4) default NULL,
  PRIMARY KEY  (`id`),
  KEY `log_hash_code` (`log_hash_code`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_log_state
-- ----------------------------
INSERT INTO user_log_state VALUES ('1', '38', '1', '132905f6811905f67f252d56db7', '2011-11-29 21:06:09', '457200', '1', '2011-11-29 21:15:15', '1');
INSERT INTO user_log_state VALUES ('2', '66', '1', '132944cec46944cec3752d56db7', '2011-11-01 21:36:45', '20700', '1', '2011-10-20 13:39:37', '1');
INSERT INTO user_log_state VALUES ('3', '76', '1', '13294537a9594537a95533d2493', '2011-09-23 11:28:11', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('4', '36', '1', '132a532307ca532306d52d50001', '2011-11-28 11:33:25', '18900', '1', '2011-11-24 14:37:28', '1');
INSERT INTO user_log_state VALUES ('5', '67', '1', '132aa3586beaa35869e52d536dc', '2011-11-28 19:49:57', '102600', '1', '2011-11-25 21:08:00', '1');
INSERT INTO user_log_state VALUES ('6', '80', '1', '1331159705a1159704a52d5124a', '2011-10-17 18:07:13', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('7', '83', '1', '133116a6eb1116a6ea152d54925', '2011-10-17 18:25:47', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('8', '84', '1', '133117ed578117ed56952d56db7', '2011-10-17 18:48:04', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('9', '85', '1', '133118bf9ca117ed56952d52493', '2011-10-17 19:02:25', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('10', '86', '1', '1331199527a1199527a52d5124a', '2011-10-17 19:17:00', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('11', '87', '1', '13314d9475214d9475252d56db7', '2011-10-18 10:25:43', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('12', '88', '1', '13314db6fcf14d9475252d56db8', '2011-10-18 10:28:05', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('13', '89', '1', '1331517746f1517745f52d52493', '2011-10-25 16:03:46', '11700', '1', '2011-10-21 14:19:31', '1');
INSERT INTO user_log_state VALUES ('14', '90', '1', '13326158fda26158fab52d5124a', '2011-10-21 19:19:40', '1800', '0', null, '1');
INSERT INTO user_log_state VALUES ('15', '91', '1', '1335e1bc5be5e1bc5ae53775b6e', '2011-11-07 18:25:02', '21600', '0', null, '1');
INSERT INTO user_log_state VALUES ('16', '68', '1', '133689e5aef689e5adf52d55b6e', '2011-11-29 19:31:26', '4500', '0', null, '1');
INSERT INTO user_log_state VALUES ('17', '92', '1', '1337bd1f61a7bd1f60a53775b6e', '2011-11-08 11:08:21', '20700', '0', null, '1');
INSERT INTO user_log_state VALUES ('18', '39', '1', '133cfc228c9cfc2289a52d55b6e', '2011-11-23 17:29:27', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('19', '93', '1', '133d3c5b1bad3baac8f52d536dd', '2011-11-24 12:11:48', '0', '1', '2011-11-24 12:21:45', '1');
INSERT INTO user_log_state VALUES ('20', '14', '1', '133d3c84584d3baac8f52d536de', '2011-11-29 19:53:07', '900', '1', '2011-11-24 12:21:13', '1');
INSERT INTO user_log_state VALUES ('21', '94', '1', '133d44c8ab9d4484c6b52d55b6e', '2011-11-25 21:01:27', '6300', '1', '2011-11-24 18:12:09', '1');
INSERT INTO user_log_state VALUES ('22', '95', '1', '133ea08d445ea08d41652d536dc', '2011-11-28 19:56:46', '0', '0', null, '1');
INSERT INTO user_log_state VALUES ('23', '96', '1', '133eeae6d7ceeae6d7c52d55b6e', '2011-11-29 17:36:08', '0', '0', null, '1');

-- ----------------------------
-- Table structure for `user_mail`
-- ----------------------------
DROP TABLE IF EXISTS `user_mail`;
CREATE TABLE `user_mail` (
  `id` int(11) NOT NULL auto_increment,
  `account_id` int(11) NOT NULL COMMENT 'user_link_id',
  `user_id` int(11) NOT NULL,
  `mail_title` varchar(200) default NULL,
  `send_time` datetime default NULL,
  `sid` varchar(32) default NULL,
  `add_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sid_2` (`sid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=526 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_mail
-- ----------------------------
INSERT INTO user_mail VALUES ('201', '27', '19', '巨人网络  宜山园区最后一批搬迁工作在即，温馨小贴士^_^', '2011-04-20 19:22:09', '668074E99A59F9648153B4824291CEB1', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('202', '27', '19', ' 网络维护通知', '2011-04-21 17:05:59', '0CE77B6F459E2BF3EF38FA23747A93F1', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('203', '27', '19', ' 关于直达班车停靠点的重要通知', '2011-04-21 17:41:48', 'B7FB801F3D9569FC2A0A3A4DD6C6AD38', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('204', '27', '19', '错过了与 消息机器人, 王慧 的对话', '2011-04-22 13:16:09', '48AE964E6D87FFE8C3DBDB96B39F6748', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('205', '27', '19', '2011年第15期（总第62期）《网游技术周报》', '2011-04-22 16:24:20', '4D366AEB39AADABFBD02594416BEEBEC', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('206', '27', '19', ' AMT系统停机维护通知', '2011-04-22 17:42:41', '9E8947E0D5DB27FDFBAB30DD49F34AF5', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('207', '27', '19', '错过了与 王燕燕, 王慧 的对话', '2011-04-25 13:02:20', 'F4DD04B1A5BD884907A0D8AEF50853A2', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('208', '27', '19', ' 巨人音乐达人秀之麦霸大赛联合摄影大赛【第三季：音乐双人秀】SONY、PHILIPS ＭＰ3奖品翻倍，最后一天报名哦~ 摄友们更有“精彩瞬间奖”现场颁发哦！', '2011-04-25 14:03:32', '92389F86973ED6D67088E7510EFF4269', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('209', '27', '19', '关于直达班车停靠点的通知', '2011-04-25 17:25:41', 'AA2BC5170F9696FD66B70582AE285A23', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('210', '27', '19', '[S0604 单点登陆系统 0008433]: 绑定域帐户，获取AMT等系统信息', '2011-04-25 18:24:56', '7A59472254E9B130FFC6F4C3977890B8', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('211', '27', '19', 'test', '2011-04-26 12:43:22', '16588EE148D298F58691AF5F73FC5AC7', '2011-04-26 14:26:21');
INSERT INTO user_mail VALUES ('212', '26', '7', '巨人网络  宜山园区最后一批搬迁工作在即，温馨小贴士^_^', '2011-04-20 19:22:09', '4683A41D6E7623ED4B99136063386D74', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('213', '26', '7', ' 网络维护通知', '2011-04-21 17:05:59', 'DA8BAC21D90926C6880282C62D97ED1F', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('214', '26', '7', ' 关于直达班车停靠点的重要通知', '2011-04-21 17:41:48', 'FEA2401E23C6BF6690786AC15BA912DB', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('215', '26', '7', '错过了与 消息机器人, 王慧 的对话', '2011-04-22 13:16:09', 'E9F919F864017EE5CB3671CA921C4FA4', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('216', '26', '7', '2011年第15期（总第62期）《网游技术周报》', '2011-04-22 16:24:20', 'EDFB72C36ADE09FA755B875273F5D674', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('217', '26', '7', ' AMT系统停机维护通知', '2011-04-22 17:42:41', '8EDB373D1E1116C268F269E266C27928', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('218', '26', '7', '错过了与 王燕燕, 王慧 的对话', '2011-04-25 13:02:20', 'F2DD98A541EA620A2276FA7FAAFB89B6', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('219', '26', '7', ' 巨人音乐达人秀之麦霸大赛联合摄影大赛【第三季：音乐双人秀】SONY、PHILIPS ＭＰ3奖品翻倍，最后一天报名哦~ 摄友们更有“精彩瞬间奖”现场颁发哦！', '2011-04-25 14:03:32', '2B4EADFF116B1C369EEC818DAB3E8163', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('220', '26', '7', '关于直达班车停靠点的通知', '2011-04-25 17:25:41', '8D7DB31CE319C68A2C6754DC78750A55', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('221', '26', '7', '[S0604 单点登陆系统 0008433]: 绑定域帐户，获取AMT等系统信息', '2011-04-25 18:24:56', 'DDE474F63A2DC241C6B1939FD1053903', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('222', '26', '7', 'test', '2011-04-26 12:43:22', 'D634EBF963E79BCC36740FA21BC3BB4C', '2011-04-26 16:05:54');
INSERT INTO user_mail VALUES ('223', '27', '19', '网站测试通知', '2011-04-26 16:16:16', 'A0E2C42D12390DC9261A3C57ABDC8C73', '2011-04-26 18:44:38');
INSERT INTO user_mail VALUES ('224', '32', '7', '银联便民支付网上平台--信用卡还款提示邮件！', '2011-04-17 01:13:58', '03EFFF1009850C17A761F3069BDAC8B2', '2011-04-27 09:15:41');
INSERT INTO user_mail VALUES ('225', '32', '7', '[深度技术论坛] Email 地址验证', '2011-04-17 22:39:29', 'D6C581BA004F8AE792FE6EDC668441F1', '2011-04-27 09:15:41');
INSERT INTO user_mail VALUES ('226', '32', '7', '04月19日是您设置的信用卡还款帐单提醒日，请注意缴费', '2011-04-19 09:00:57', '2E244B45CBF26EF9634CE2AE0C856898', '2011-04-27 09:15:41');
INSERT INTO user_mail VALUES ('227', '32', '7', '发现全球态度 网易汽车直击2011上海车展', '2011-04-19 09:29:04', '7A1E9B760938852D4468A043F1E7E986', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('228', '32', '7', '影票', '2011-04-20 23:25:09', '40F6F5FBD63598257C0800CE2EF452A3', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('229', '32', '7', '有车家 庭必看！您的孩 子随 时都可能成为您的安全气囊？！', '2011-04-21 22:32:46', '56CAE071EF0AE346FCAFBF8B11518400', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('230', '32', '7', 'My friends have given your e-mail.', '2011-04-22 18:12:16', '9EA0A8843B311A93FEC397A2E445288B', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('231', '32', '7', '最贴心最完美之希腊行 沉醉在圣托里尼的夕阳中', '2011-04-22 20:36:07', '6CF9FECB81DCA8958780B953C89343B3', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('232', '32', '7', '网易邮箱诚邀您体验极速2G超大附件', '2011-04-22 13:32:22', 'A80C6DF4E1999DF8289C010CAFFD0DF7', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('233', '32', '7', 'ukj', '2011-04-26 08:53:06', '7F0B9CBFD47F75639D1849FD18ACDBB3', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('234', '32', '7', 'glad to write you.', '2011-04-26 18:41:57', 'C21AED93B4E2C9241D42091C248ECDFC', '2011-04-27 09:15:42');
INSERT INTO user_mail VALUES ('235', '33', '7', '智联招聘_AD 智联招聘带你涨薪，有木有？', '2011-04-06 22:40:14', 'C4B88AA5F81FCE79B443846264BB90D5', '2011-04-27 09:15:59');
INSERT INTO user_mail VALUES ('236', '33', '7', '前程无忧网_AD 你被圈出来了，500强高薪职位面试名单！', '2011-04-08 10:53:14', '6663BB5E27751A7FD46A00D3FE534D6F', '2011-04-27 09:15:59');
INSERT INTO user_mail VALUES ('237', '33', '7', 'BMW中国_AD 报名参加2011 BMW 3行动 赢取维也纳、米兰、法兰克福三地 82名欧洲终极之旅', '2011-04-12 09:18:13', '949D6F8402BB8B4742F5D6B6D840572E', '2011-04-27 09:15:59');
INSERT INTO user_mail VALUES ('238', '33', '7', '欢迎您再次登录新浪免费邮箱 ', '2011-04-13 16:09:10', '03413A3FF7967FA40565A8696C96B800', '2011-04-27 09:15:59');
INSERT INTO user_mail VALUES ('239', '33', '7', '新浪微博_AD 欢迎加入新浪微博，一起分享新鲜事！', '2011-04-12 16:07:52', 'B4BEADE9175D2FD5BBB0A3B876580FDC', '2011-04-27 09:15:59');
INSERT INTO user_mail VALUES ('240', '37', '7', ' 网络维护通知', '2011-04-21 17:05:59', '924A14FFF7666B01BA9AC67D9EA41605', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('241', '37', '7', ' 关于直达班车停靠点的重要通知', '2011-04-21 17:41:48', '7FD09F7859EAB3E345DDE202A1E0E693', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('242', '37', '7', '错过了与 消息机器人, 王慧 的对话', '2011-04-22 13:16:09', 'FAE69F69504A215D12D7CD206BD45617', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('243', '37', '7', '2011年第15期（总第62期）《网游技术周报》', '2011-04-22 16:24:20', 'C0743F5873948A98E4F506BD6289BAE4', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('244', '37', '7', ' AMT系统停机维护通知', '2011-04-22 17:42:41', 'B47D65E45D0B246D8F109B7C948ADB47', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('245', '37', '7', '错过了与 王燕燕, 王慧 的对话', '2011-04-25 13:02:20', 'EEB579FE1B868F01D01A0FDD52DF31DA', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('246', '37', '7', ' 巨人音乐达人秀之麦霸大赛联合摄影大赛【第三季：音乐双人秀】SONY、PHILIPS ＭＰ3奖品翻倍，最后一天报名哦~ 摄友们更有“精彩瞬间奖”现场颁发哦！', '2011-04-25 14:03:32', '10C93CF7F9A3AB8CBBECD0226BD98D7D', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('247', '37', '7', '关于直达班车停靠点的通知', '2011-04-25 17:25:41', '3FE7B82F55FA9902262A6BE4EA8ECD5E', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('248', '37', '7', '[S0604 单点登陆系统 0008433]: 绑定域帐户，获取AMT等系统信息', '2011-04-25 18:24:56', 'A30433FD94A3C7811FB175305346FE88', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('249', '37', '7', 'test', '2011-04-26 12:43:22', '1279C1F3EE96BDB91D00419DC0250D1F', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('250', '37', '7', '网站测试通知', '2011-04-26 16:16:16', 'C13CC2C466EB655280CB06C960CD8C55', '2011-04-27 10:44:46');
INSERT INTO user_mail VALUES ('251', '38', '7', ' 网络维护通知', '2011-04-21 17:05:59', '77E0C3965779AE08FEF77DC782EBF4D4', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('252', '38', '7', ' 关于直达班车停靠点的重要通知', '2011-04-21 17:41:48', '160B86EA0A551EF6C862E786A2C6624C', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('253', '38', '7', '错过了与 消息机器人, 王慧 的对话', '2011-04-22 13:16:09', 'BB46298AEDDB454D00C030AF36803AE4', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('254', '38', '7', '2011年第15期（总第62期）《网游技术周报》', '2011-04-22 16:24:20', '5FC81DF473E15376427D310C9D49A778', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('255', '38', '7', ' AMT系统停机维护通知', '2011-04-22 17:42:41', 'B26871CF2EF40D670D1C5D3FEB37EBFC', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('256', '38', '7', '错过了与 王燕燕, 王慧 的对话', '2011-04-25 13:02:20', 'B72E5E249D1B797EA5184BF016237FE7', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('257', '38', '7', ' 巨人音乐达人秀之麦霸大赛联合摄影大赛【第三季：音乐双人秀】SONY、PHILIPS ＭＰ3奖品翻倍，最后一天报名哦~ 摄友们更有“精彩瞬间奖”现场颁发哦！', '2011-04-25 14:03:32', '25315D437F50F6DA58E7716F3A4119E3', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('258', '38', '7', '关于直达班车停靠点的通知', '2011-04-25 17:25:41', 'D07E7BDD472F48FEB400C8075E42EE12', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('259', '38', '7', '[S0604 单点登陆系统 0008433]: 绑定域帐户，获取AMT等系统信息', '2011-04-25 18:24:56', '6923FB2DEE796A475716C0886F839899', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('260', '38', '7', 'test', '2011-04-26 12:43:22', 'C8C6B9C984257E7F9B63FF44FE0459D2', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('261', '38', '7', '网站测试通知', '2011-04-26 16:16:16', '1F05732485757BE1C4EABEF10FB047B1', '2011-04-27 10:52:49');
INSERT INTO user_mail VALUES ('262', '39', '19', ' 关于直达班车停靠点的重要通知', '2011-04-21 17:41:48', 'E665BB3C0C9D3C3F9403328AE0F8F94E', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('263', '39', '19', '错过了与 消息机器人, 王慧 的对话', '2011-04-22 13:16:09', 'DB9455CE7F771019D9CF21540BB234BE', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('264', '39', '19', '2011年第15期（总第62期）《网游技术周报》', '2011-04-22 16:24:20', '610CD4B38DD46C007F643BAFC4FB4438', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('265', '39', '19', ' AMT系统停机维护通知', '2011-04-22 17:42:41', 'ED7BAFA6B26FF5C4E9A54A6AC13CA0CF', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('266', '39', '19', '错过了与 王燕燕, 王慧 的对话', '2011-04-25 13:02:20', '6C6322ECDDCF8773E90C9D3EF28EAF52', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('267', '39', '19', ' 巨人音乐达人秀之麦霸大赛联合摄影大赛【第三季：音乐双人秀】SONY、PHILIPS ＭＰ3奖品翻倍，最后一天报名哦~ 摄友们更有“精彩瞬间奖”现场颁发哦！', '2011-04-25 14:03:32', 'B9DE72FB6281519D7744BBE319ED07B4', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('268', '39', '19', '关于直达班车停靠点的通知', '2011-04-25 17:25:41', '2999A119EC218A47C9D930849CD23F23', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('269', '39', '19', '[S0604 单点登陆系统 0008433]: 绑定域帐户，获取AMT等系统信息', '2011-04-25 18:24:56', 'D1F7CCFD6B5B22D992DA5EE8C4A5E7D0', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('270', '39', '19', 'test', '2011-04-26 12:43:22', 'D6D7F580FC9BF493DFC7395D009D540A', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('271', '39', '19', '网站测试通知', '2011-04-26 16:16:16', '5E8A5F2E75EEB744C5C519DEF98E9924', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('272', '39', '19', '三清山旅游', '2011-04-27 11:00:49', 'FE669F22D325F79B43F30799B1BB0483', '2011-04-27 11:31:42');
INSERT INTO user_mail VALUES ('273', '41', '19', '银联便民支付网上平台--信用卡还款提示邮件！', '2011-04-17 01:13:58', 'E75DDAAED3F1BCB69FDDC2C314117502', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('274', '41', '19', '[深度技术论坛] Email 地址验证', '2011-04-17 22:39:29', '4167FBC090BF7FB31EF1B2D770907A4E', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('275', '41', '19', '04月19日是您设置的信用卡还款帐单提醒日，请注意缴费', '2011-04-19 09:00:57', 'E73377EFDA09F5D61856663A1ABA0DED', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('276', '41', '19', '发现全球态度 网易汽车直击2011上海车展', '2011-04-19 09:29:04', 'DFDCB2D5A6A491BB84A0632ACFED803A', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('277', '41', '19', '影票', '2011-04-20 23:25:09', 'E032E0A99FA7657FC3EEDF130F5988E0', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('278', '41', '19', '有车家 庭必看！您的孩 子随 时都可能成为您的安全气囊？！', '2011-04-21 22:32:46', '9867D15D35D95F8E2E22595B8BAEBC7E', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('279', '41', '19', 'My friends have given your e-mail.', '2011-04-22 18:12:16', 'FCD8C69E7AE9F7DADBAF4A6F03AE8E30', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('280', '41', '19', '最贴心最完美之希腊行 沉醉在圣托里尼的夕阳中', '2011-04-22 20:36:07', '0C48F3C0CEC0A73B6EF22853282439D4', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('281', '41', '19', '网易邮箱诚邀您体验极速2G超大附件', '2011-04-22 13:32:22', 'FDB116C6946FE5697697F00708C86873', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('282', '41', '19', 'ukj', '2011-04-26 08:53:06', '8AAA1D9B6F85786F148334392B6A917C', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('283', '41', '19', 'glad to write you.', '2011-04-26 18:41:57', '07936AC946224B7C97FE908277C645C3', '2011-04-27 14:23:20');
INSERT INTO user_mail VALUES ('284', '41', '19', '1111111', '2011-04-27 15:18:52', '0839B1351DDD2F5D1830EFCB6D5A9E82', '2011-04-27 16:08:13');
INSERT INTO user_mail VALUES ('285', '15', '1', '智联招聘_AD 智联招聘带你涨薪，有木有？', '2011-04-06 22:40:14', 'C61CF9EBA9EF462B93A09116A785D695', '2011-04-28 15:53:54');
INSERT INTO user_mail VALUES ('286', '15', '1', '前程无忧网_AD 你被圈出来了，500强高薪职位面试名单！', '2011-04-08 10:53:14', '352B9C35D550C2A11DB42229A6FF4418', '2011-04-28 15:53:54');
INSERT INTO user_mail VALUES ('287', '15', '1', 'BMW中国_AD 报名参加2011 BMW 3行动 赢取维也纳、米兰、法兰克福三地 82名欧洲终极之旅', '2011-04-12 09:18:13', '00A07ABD0E926807977134CC3C0DFF96', '2011-04-28 15:53:54');
INSERT INTO user_mail VALUES ('288', '15', '1', '欢迎您再次登录新浪免费邮箱 ', '2011-04-13 16:09:10', '74391F96248C663EAD6E82065931B22B', '2011-04-28 15:53:54');
INSERT INTO user_mail VALUES ('289', '15', '1', '新浪微博_AD 欢迎加入新浪微博，一起分享新鲜事！', '2011-04-12 16:07:52', 'F90B06C70B4958BAACE88D4A254686DD', '2011-04-28 15:53:54');
INSERT INTO user_mail VALUES ('290', '15', '1', '妯��杓垮�蹇�����婊�看濠���ｈ泛UFO��', '2011-04-28 00:09:19', '4AAC5421AB8A3CFA76CA90FF37A5DDAB', '2011-04-28 15:53:54');
INSERT INTO user_mail VALUES ('291', '43', '1', '智联招聘_AD 智联招聘带你涨薪，有木有？', '2011-04-06 22:40:14', '6E03E314BBE5FD0E35E764DAEF2FFDC2', '2011-04-28 15:57:29');
INSERT INTO user_mail VALUES ('292', '43', '1', '前程无忧网_AD 你被圈出来了，500强高薪职位面试名单！', '2011-04-08 10:53:14', '18E7D9E486E1488A02254459B8517757', '2011-04-28 15:57:29');
INSERT INTO user_mail VALUES ('293', '43', '1', 'BMW中国_AD 报名参加2011 BMW 3行动 赢取维也纳、米兰、法兰克福三地 82名欧洲终极之旅', '2011-04-12 09:18:13', '0CD379B0CAA56075B97E3B5160635EAB', '2011-04-28 15:57:29');
INSERT INTO user_mail VALUES ('294', '43', '1', '欢迎您再次登录新浪免费邮箱 ', '2011-04-13 16:09:10', '6DC298B264C748E859E66D769FDEB4C1', '2011-04-28 15:57:29');
INSERT INTO user_mail VALUES ('295', '43', '1', '新浪微博_AD 欢迎加入新浪微博，一起分享新鲜事！', '2011-04-12 16:07:52', '8CF565A3C372431FC7774550D54DF959', '2011-04-28 15:57:29');
INSERT INTO user_mail VALUES ('296', '43', '1', '妯��杓垮�蹇�����婊�看濠���ｈ泛UFO��', '2011-04-28 00:09:19', 'C4467D70C6738F8C71012B2ADE2E9ECE', '2011-04-28 15:57:29');
INSERT INTO user_mail VALUES ('297', '47', '20', '智联招聘_AD 智联招聘带你涨薪，有木有？', '2011-04-06 22:40:14', '5402CA7F7ACFF197698592D2659217E9', '2011-04-28 18:00:35');
INSERT INTO user_mail VALUES ('298', '47', '20', '前程无忧网_AD 你被圈出来了，500强高薪职位面试名单！', '2011-04-08 10:53:14', '59856EAE07675F1D71D345AA65A48EC1', '2011-04-28 18:00:35');
INSERT INTO user_mail VALUES ('299', '47', '20', 'BMW中国_AD 报名参加2011 BMW 3行动 赢取维也纳、米兰、法兰克福三地 82名欧洲终极之旅', '2011-04-12 09:18:13', '494190C6E4C083B5E81D8B8781CC9F07', '2011-04-28 18:00:35');
INSERT INTO user_mail VALUES ('300', '47', '20', '欢迎您再次登录新浪免费邮箱 ', '2011-04-13 16:09:10', 'D8598F8F25B697FE31256BA3B03577FC', '2011-04-28 18:00:35');
INSERT INTO user_mail VALUES ('301', '47', '20', '新浪微博_AD 欢迎加入新浪微博，一起分享新鲜事！', '2011-04-12 16:07:52', '3F67008E0AD0838090018ECBE3D09782', '2011-04-28 18:00:35');
INSERT INTO user_mail VALUES ('302', '47', '20', '妯��杓垮�蹇�����婊�看濠���ｈ泛UFO��', '2011-04-28 00:09:19', '654AA319676F3ED4CA45E44C8D57EF47', '2011-04-28 18:00:35');
INSERT INTO user_mail VALUES ('303', '41', '19', '[S0604 单点登陆系统 0008433]: 绑定域帐户，获取AMT等系统信息', '2011-04-28 16:36:24', '3774659010359EC1B2A19BDDF0979937', '2011-04-29 11:25:43');
INSERT INTO user_mail VALUES ('304', '41', '19', 'maixmo Tomcat 接口代码 ', '2011-04-28 18:38:06', '7AA9B820AF9B51DDD5E9B2A5FBBCA7DE', '2011-04-29 11:25:43');
INSERT INTO user_mail VALUES ('305', '41', '19', 'Dream to act like a xxxdirector? Attack a magic pilule!', '2011-04-29 17:12:22', 'FA61B487A4DF7CED87FF7C8AE8AE258E', '2011-05-03 15:33:39');
INSERT INTO user_mail VALUES ('306', '41', '19', '2011年第16期（总第63期）《网游技术周报》', '2011-04-29 17:48:55', 'DC95E373EE481C8B94E2A188ED39EF26', '2011-05-03 15:33:39');
INSERT INTO user_mail VALUES ('307', '41', '19', '网络故障紧急通知', '2011-04-30 12:07:51', '585703C8E649F4DC5FEFA1A9F5D75F79', '2011-05-03 15:33:39');
INSERT INTO user_mail VALUES ('308', '41', '19', '网络故障恢复通知', '2011-04-30 16:57:49', 'FCCC8123CF5F8AAE53BB518CE17A9A2D', '2011-05-03 15:33:39');
INSERT INTO user_mail VALUES ('309', '41', '19', '《绒绒大战》公司内测圆满成功 获奖名单今日出炉', '2011-05-03 15:26:40', '191D75AA01CC677FDB7BF27CF906170C', '2011-05-03 15:33:39');
INSERT INTO user_mail VALUES ('310', '47', '20', 'BMW中国_AD 报名参加2011 BMW 3行动 赢取维也纳、米兰、法兰克福三地 82名欧洲终极之旅', '2011-04-27 15:19:14', '3C24E8A28B8208C7EFE9F9EC9FABF776', '2011-05-03 15:45:32');
INSERT INTO user_mail VALUES ('311', '47', '20', '高朋_AD 100张4999机票 1分钱就送', '2011-04-28 15:10:13', 'AF92C01E673CA8CB0062FE34C1E0DAD1', '2011-05-03 15:45:32');
INSERT INTO user_mail VALUES ('312', '41', '19', '新浪微博开放平台开发者沙龙（上海站）活动召集', '2011-05-03 15:41:47', 'A167627AA8550D51F28669477CDEFD4F', '2011-05-03 15:52:03');
INSERT INTO user_mail VALUES ('313', '41', '19', '11111111111111111', '2011-05-03 15:52:04', 'BF8507398F1A6DC75926C698821A94D9', '2011-05-03 15:58:11');
INSERT INTO user_mail VALUES ('314', '49', '24', '运维事故报告单_20110501-2', '2011-05-01 20:29:41', 'AD2D078AC88CFD4EF7D353249772D934', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('315', '49', '24', '运维事故报告单_20110429', '2011-05-02 09:24:27', '61AECB301E29C39713377945D8E63900', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('316', '49', '24', '20110502服务端交接表', '2011-05-02 10:05:11', '7E9220C18A64E452C3A41013D263366A', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('317', '49', '24', '20110503值班交接', '2011-05-03 09:10:41', 'E27BFA50AC62A54C9D955FDDA43F22A6', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('318', '49', '24', '《绒绒大战》公司内测圆满成功 获奖名单今日出炉', '2011-05-03 15:26:40', '8368F3136A9764510F56E94D481EE100', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('319', '49', '24', '绒绒大战游戏区开区申请_20110503_1', '2011-05-03 19:03:26', '69B998668271AA9F23A22C45C24B0B5B', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('320', '49', '24', '安全扫描周报', '2011-05-03 19:29:42', 'C841F544F48153385D3C111F1DDAB167', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('321', '49', '24', '20110504值班交接', '2011-05-04 09:43:44', 'A2FF3AEB29C11AFE105D1775A54DD0C5', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('322', '49', '24', '名片更新', '2011-05-04 11:30:23', '3C37846AFE61ECBA128C5D35DBCE6FCC', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('323', '49', '24', '策划研究院周报（20110425-0501）', '2011-05-04 11:53:35', '678767E958925DF707A136C51FADC677', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('324', '49', '24', '15笼华为E6000刀片IP信息', '2011-05-04 14:11:07', '137AC7B08482D93D0C866C2A3FEEE7CD', '2011-05-04 14:50:13');
INSERT INTO user_mail VALUES ('325', '43', '1', 'BMW中国_AD 报名参加2011 BMW 3行动 赢取维也纳、米兰、法兰克福三地 82名欧洲终极之旅', '2011-04-27 15:19:14', '23008F50E3C6BC278806A838C4EDE656', '2011-05-06 10:25:47');
INSERT INTO user_mail VALUES ('326', '43', '1', '高朋_AD 100张4999机票 1分钱就送', '2011-04-28 15:10:13', '41A71CCC9E5DF11C15F160C82A3970C6', '2011-05-06 10:25:47');
INSERT INTO user_mail VALUES ('327', '43', '1', 'test', '2011-05-06 13:27:27', '5652E43FD28DC0EA9C9E869C54307A5D', '2011-05-06 13:28:19');
INSERT INTO user_mail VALUES ('328', '43', '1', 'test222', '2011-05-06 13:29:53', '31B1CBFB4DF1ECD143CD1159E746B40F', '2011-05-06 13:30:51');
INSERT INTO user_mail VALUES ('329', '41', '19', '微博开放平台注册确认邮件', '2011-05-05 16:03:42', '2D1169EBF4CB026B6FCCBBB963FA3FFD', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('330', '41', '19', '微博开放平台注册确认邮件', '2011-05-05 16:05:34', 'CFB09BAC320A284E41628406D72BA1F5', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('331', '41', '19', '微博开放平台注册确认邮件', '2011-05-05 16:06:14', '90CEC65947506990AB2CB3077E0093A9', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('332', '41', '19', 'test', '2011-05-05 16:08:26', 'A26CA724FF6088E7CB1BBD974309025A', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('333', '41', '19', '需王慧同志处理的相关开发需求汇总', '2011-05-05 18:27:54', '9D3A8A3211811A04C9FB45C2F15EC372', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('334', '41', '19', 'test', '2011-05-06 11:28:30', 'BAF891BAEE47D4480171E2C7C1A8E1A7', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('335', '41', '19', ' 网络割接通知', '2011-05-06 11:58:53', 'A0DC531F053436B07C33876533C8832B', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('336', '41', '19', '1111111', '2011-05-06 14:28:20', '1DD0A6C762CD62DEA219E1ACFFAB1C9E', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('337', '41', '19', 'Re: 激活码', '2011-05-06 15:19:47', '9861D2677377C3556B2B3C7BA43E7296', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('338', '41', '19', '2011年第17期（总第64期）《网游技术周报》', '2011-05-06 18:03:43', '21F20E9909EF9A992DA5A7BE8E9C9800', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('339', '41', '19', '巨人网络：祝所有妈妈们“母亲节快乐”！', '2011-05-06 18:28:25', 'FCB00FDD0CD63D3F203CF221282A547A', '2011-05-09 10:25:14');
INSERT INTO user_mail VALUES ('340', '41', '19', '内部福利！艾尔之光压测激活码免费包邮送礼！', '2011-05-09 17:07:59', 'EA2A904B8C18CD3AC05B79DD72222243', '2011-05-11 14:32:42');
INSERT INTO user_mail VALUES ('341', '41', '19', '看电影喽！！！', '2011-05-09 18:13:49', '15CDD1585E6BB04DBCCE628DBA5FD622', '2011-05-11 14:32:42');
INSERT INTO user_mail VALUES ('342', '41', '19', '错过了与 消息机器人, 王慧 的对话', '2011-05-10 12:33:07', '965F1CD669D9DC1B7CED702811BF9C9C', '2011-05-11 14:32:42');
INSERT INTO user_mail VALUES ('343', '41', '19', '三清山旅游5.20~5.22批次', '2011-05-10 13:16:16', 'EEC14F9A5AA99F2644D5D0097C84A4A2', '2011-05-11 14:32:42');
INSERT INTO user_mail VALUES ('344', '41', '19', '自动接受的与 孟初丹, 周敬武, 庞晓妹, 廖川, 王欣, 陈华, 顾佳敏, 王慧 的会议', '2011-05-10 14:22:18', '9BDFB4442E8D1E120758AAE8B403D682', '2011-05-11 14:32:42');
INSERT INTO user_mail VALUES ('345', '41', '19', '答复: 需王慧同志处理的相关开发需求汇总', '2011-05-11 01:22:03', 'DBEA4EF6F0F4D7ADA96CFA414FFE9114', '2011-05-11 14:32:42');
INSERT INTO user_mail VALUES ('346', '41', '19', '未送达: 访问统计', '2011-05-13 11:17:02', '8105E7440F1653EBB4CCE1FFB3ACA367', '2011-05-16 10:42:40');
INSERT INTO user_mail VALUES ('347', '41', '19', '网络维护通知', '2011-05-13 11:26:49', 'E2615E8AAF238048250BCC1008F1062F', '2011-05-16 10:42:41');
INSERT INTO user_mail VALUES ('348', '41', '19', '巨人自己的研发杂志《G Developer游戏开发者》问世喽，欢迎踊跃投稿！', '2011-05-13 11:35:57', '0F525B35F05850907CA3F827643F8736', '2011-05-16 10:42:41');
INSERT INTO user_mail VALUES ('349', '41', '19', '错过了与 王俊豪, 王慧 的对话', '2011-05-13 12:02:35', '265F5FD6AD90ECCF1DD2AD101CA62A34', '2011-05-16 10:42:41');
INSERT INTO user_mail VALUES ('350', '41', '19', '巨人网络：音乐达人秀之麦霸大赛联合摄影大赛【第三季：音乐双人秀】圆满落幕，精彩瞬间奉上！', '2011-05-13 17:33:08', '7017980B3275E73CECA52F82DA768F83', '2011-05-16 10:42:41');
INSERT INTO user_mail VALUES ('351', '41', '19', '2011年社保基数调整通知', '2011-05-13 17:58:51', 'F6C7B59EA69E4C10EEC0CFA212C561F6', '2011-05-16 10:42:41');
INSERT INTO user_mail VALUES ('352', '41', '19', '2011年第18期（总第65期）《网游技术周报》', '2011-05-13 18:23:07', '72D4CE8DBB19E06920CF4AC7667EC66E', '2011-05-16 10:42:41');
INSERT INTO user_mail VALUES ('353', '41', '19', 'Time for ideal satisfaction in bed.', '2011-05-14 17:06:04', 'CBFC2FEB07586FA702BE59281FC2F5A3', '2011-05-16 10:42:41');
INSERT INTO user_mail VALUES ('354', '41', '19', '2011第一季度“最讲师”新鲜出炉啦！', '2011-05-16 11:04:30', '2C6621CBB3611BAFFBEADFA146D793C3', '2011-05-16 11:13:53');
INSERT INTO user_mail VALUES ('355', '41', '19', '游戏产品项目人员清单--20110516', '2011-05-16 14:14:22', '0299C80C8B2FDF96932D589F1BC2C180', '2011-05-16 15:03:06');
INSERT INTO user_mail VALUES ('356', '41', '19', '5.20团', '2011-05-17 12:55:10', '57FA02AA8887D41FEED8A77F843BB2DD', '2011-05-17 13:35:00');
INSERT INTO user_mail VALUES ('357', '51', '31', '转发: 近期客维更新内容', '2011-04-28 12:08:50', '37354EFB9705C252288665664079FDA0', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('358', '51', '31', '转发: 充值中心 网银充值流程变更', '2011-05-06 17:42:15', '67C6B8C29CBD738DF49A4DC3A6AB5867', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('359', '51', '31', '表', '2011-05-09 10:12:45', '916728D5A2D62D028D29BA98C5B4AC27', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('360', '51', '31', '内部福利！艾尔之光压测激活码免费包邮送礼！', '2011-05-09 17:07:59', 'EAE2091B95D659A4FAE6134B65707230', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('361', '51', '31', '转发: 呼叫岗位手册', '2011-05-11 18:16:41', '779CFB34849AB05415AC911FBBA12864', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('362', '51', '31', '邮件', '2011-05-17 13:46:15', 'FE42782CFB743D9EB98F849B2A1F8972', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('363', '51', '31', '5大疑难问题收集表格', '2011-05-18 10:52:30', '934F51F6726CE4B4C411871F749AF418', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('364', '51', '31', '5月26日电影院看《玩大的》，报名从速', '2011-05-23 17:13:41', '1C720C1BEB7B914C2A54F5496376F7AD', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('365', '51', '31', '端午节放假通知', '2011-05-24 11:55:19', '4511B5B85D792B7A654B984A5A85212E', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('366', '51', '31', '抽查日报', '2011-05-25 08:26:07', '4752465C6B3A5FDAEA846EE665ED81FA', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('367', '51', '31', '转发: 5-25免费版全区版本更新', '2011-05-25 08:41:00', '1617138DE6BEA4F603A1917EF7057E7E', '2011-05-25 11:05:53');
INSERT INTO user_mail VALUES ('368', '43', '1', '智利矿工奇迹重见天日 33人已全部获救', '2011-05-14 14:26:18', '1B10C7342A85A928D75527A4DF53341F', '2011-05-25 11:20:33');
INSERT INTO user_mail VALUES ('369', '43', '1', '苹果10亿美元投资 研发视频下载技术', '2011-05-20 12:44:08', '7DBE1A76859587BE4F7A43EF4DE45A3C', '2011-05-25 11:20:33');
INSERT INTO user_mail VALUES ('370', '41', '19', '自动接受的与 孟初丹, 何勇辉, 刘国庆, 华舟, 史文俊, 吕李俊, 吴小平（运维中心）, 孙学安, 孙磊, 安红波, 崔旭东, 张一恒, 张强君, 张思杰, 张恒峰, 张敏杰, 张新旺, 张田, 张蕾, 徐琦�, 施剑辉, 景静, 李代军, 李俊, 李安波, 李志军, 杨华, 杨坚, 沈英智, 王亚军, 石钦, 胡志孟, 胡海霞, 胡远星, 许瑞锋, 许登, 谢晓飞, 赵瑜, 运维值班, 陈华', '2011-05-20 14:03:12', '4FDB0D81978398C5A6790484BF040D3E', '2011-05-25 20:01:08');
INSERT INTO user_mail VALUES ('371', '41', '19', '2011年第19期（总第66期）《网游技术周报》', '2011-05-20 17:50:37', '9AAEC062BD8738B64C1F76C8A15B59C4', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('372', '41', '19', ' 网络割接通知', '2011-05-23 11:08:39', '2FD1D21AF05ABB3FFED842DE64A10683', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('373', '41', '19', '5月26日电影院看《玩大的》，报名从速', '2011-05-23 17:13:41', '1D66765AB99231403090B7851FC742F2', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('374', '41', '19', '巨人网络羽毛球大赛【第四季】：烈焰超级邀请赛，邀您周三到松江现场观战！', '2011-05-24 11:02:45', 'B2A5C25E71774E332486F5AE9CDA3F31', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('375', '41', '19', ' 2011元旦庆典节目获奖名单', '2011-05-24 11:43:49', 'F62C65FB03D66DB936068BCFC1307D8E', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('376', '41', '19', '端午节放假通知', '2011-05-24 11:55:19', '65EB78B8F101C1DDD817267FA28CE686', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('377', '41', '19', '转发: 邀请大家一起参加“信息安全知识考核”', '2011-05-24 14:16:53', '72E0BF1F659B9E3BC4CAB6F7432BECDA', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('378', '41', '19', '第十期巨人讲坛将于明日（5.25）下午14：00举办，诚邀您参加', '2011-05-24 16:37:28', 'FA7B6CF5273A872B3C23213AFF28732E', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('379', '41', '19', '通知', '2011-05-25 10:54:13', 'F52EBE61F8166BC6DB6AD27F0B81B829', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('380', '41', '19', '失物招领', '2011-05-25 10:55:13', '757ABB9CB4603E1E9DF8779B3C8A62FF', '2011-05-25 20:01:09');
INSERT INTO user_mail VALUES ('381', '41', '19', '您的域密码即将过期，请尽快修改!', '2011-05-26 00:01:43', '3D1718829DA014C8DA39A1D474B6D0D1', '2011-05-26 00:16:18');
INSERT INTO user_mail VALUES ('382', '41', '19', '巨人网络携手徐汇人力资源保障部】珍爱之约 ---夏日浪漫寻缘派对', '2011-05-26 19:39:41', '6F63D8CD6E863AE81506C59263D49AA8', '2011-05-27 09:47:45');
INSERT INTO user_mail VALUES ('383', '41', '19', '错过了与 王俊豪, 王慧 的对话', '2011-05-27 14:05:55', '468B0944F6D64BF005C9D8458E187438', '2011-05-27 14:36:32');
INSERT INTO user_mail VALUES ('384', '41', '19', '2011年第20期（总第67期）《网游技术周报》', '2011-05-27 17:28:58', 'F24DF5D57C6AA0711D19F2542D20DC23', '2011-05-27 17:43:50');
INSERT INTO user_mail VALUES ('385', '43', '1', '远方的祝福 ', '2011-05-27 02:13:27', 'EF62E97E2EF514809476AF803C801506', '2011-05-30 11:17:52');
INSERT INTO user_mail VALUES ('386', '41', '19', 'OCS服务器维护通知', '2011-05-28 10:01:29', '437C2A4601D4EBBBF5CB58B809CA6160', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('387', '41', '19', '错过了与 姚利军, 王慧 的对话', '2011-05-28 15:09:40', '0801B81B4ED5801904FE92FC2661F284', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('388', '41', '19', '公司内部网络冗余测试通知', '2011-05-30 15:12:09', '4A81EBC551B5416D488EF18D87806022', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('389', '41', '19', '照片征集', '2011-05-30 18:13:56', '49B982EF46E4ADC4C314092B3699CFDC', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('390', '41', '19', ' 网络维护通知', '2011-05-31 12:16:52', '441E0EAF7C80A3B79F17C9785E5258E6', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('391', '41', '19', '巨人网络：童心飞扬，欢乐六一，祝各位大小盆友，儿童节快乐！', '2011-05-31 16:06:14', '299699D6D9958971E07ED97097F2CBB0', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('392', '41', '19', '2011年第21期（总第68期）《网游技术周报》', '2011-06-03 18:30:12', 'ED50608FE29D5D236E5A79DC080F3436', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('393', '41', '19', '森林：大自然为您效劳（forest：nature for your service）', '2011-06-03 18:47:09', '4AA2EED9763D6366A0D2BC575B23BE82', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('394', '41', '19', '【体检报告解读】', '2011-06-07 14:33:57', '07524DAE7C824D42102DE8D765C031B6', '2011-06-07 15:29:25');
INSERT INTO user_mail VALUES ('395', '41', '19', ' 第十一期巨人讲坛将于6月16日下午14：00举办，诚邀您参加', '2011-06-13 12:14:21', '40CD2523066CE36CBA6BD49E9FEF34DE', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('396', '41', '19', '《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0613', '2011-06-13 19:58:27', 'AC9ABA19DA8A310B3BF6EECE5F76E959', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('397', '41', '19', '只要0元！！！原价88888元的田丰经济系统设计心得豪华套餐1份！', '2011-06-14 10:35:11', 'DD1FF25CE991B2F35EEAE95A91BA700A', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('398', '41', '19', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0613', '2011-06-14 10:43:08', '32BA50DF535C8D56ECED146E91E887CB', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('399', '41', '19', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0613', '2011-06-14 10:58:55', 'EA6DF4F6E965A18E3F32058A544BD548', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('400', '41', '19', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0613', '2011-06-14 11:00:23', '293FF602A334269D17F851F0C90FE8D2', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('401', '41', '19', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0613', '2011-06-14 11:14:16', '84975E938B63B8EB254AFA9EBF7EB8F6', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('402', '41', '19', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0613', '2011-06-14 16:59:55', '64A004AEFF53378C51873EED2E9B2DD9', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('403', '41', '19', '《S0204 在线销售系统》网银充值优化 项目周会', '2011-06-14 17:09:39', 'B316934C588D2EFBDE9C504B3BF386E5', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('404', '41', '19', '第十一期巨人讲坛将于明日（6.16）下午14：00举办，诚邀您参加', '2011-06-15 14:39:11', '57F7E1FEA9888EC98A40F334FCC5D535', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('405', '41', '19', '在线销售系统网银充值优化 0615例会报告', '2011-06-15 15:07:46', '5AB6A828C1215AB27A46421BDB65B2EA', '2011-06-16 09:01:48');
INSERT INTO user_mail VALUES ('406', '43', '1', '腾讯360隐私战升级', '2011-06-17 05:47:22', '86D37444B44B46BB20D3A85EDC847872', '2011-06-17 09:03:18');
INSERT INTO user_mail VALUES ('407', '55', '4', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0613', '2011-06-14 16:59:55', 'FDB2728DC83774DEEC2EFB6E7914300C', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('408', '55', '4', '《S0204 在线销售系统》网银充值优化 项目周会', '2011-06-14 17:09:39', '7DC491B62E030B5CD5728C62CA3D1091', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('409', '55', '4', '第十一期巨人讲坛将于明日（6.16）下午14：00举办，诚邀您参加', '2011-06-15 14:39:11', '86542D278975ECDE92865647448ED847', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('410', '55', '4', '在线销售系统网银充值优化 0615例会报告', '2011-06-15 15:07:46', '1AC77A362D3F1EA33C996A0D173B3A60', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('411', '55', '4', '演员征集令一号！', '2011-06-17 10:35:33', 'DB88E37E888954121649114C222FB604', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('412', '55', '4', '错过了与 吴烨灵（服务台）, 王慧 的对话', '2011-06-17 13:16:42', 'D71DF918FCEB9E97773B482B14147871', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('413', '55', '4', '2011年第23期（总第70期）《网游技术周报》', '2011-06-17 17:44:47', '9A0C6AA41F19AB2FA45BBD9E38A89F76', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('414', '55', '4', '《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0617', '2011-06-17 19:34:27', '99FE7714D6E4E78F4ECD875D52E8CA3B', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('415', '55', '4', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0617', '2011-06-17 20:20:45', '9E0FF89E36EB57FE35C94FC2250582F2', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('416', '55', '4', '部门调整及人事任命通知（信息2011 007号）', '2011-06-20 14:55:02', '7C5DF9619426C7F240E269DB4B6841AD', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('417', '55', '4', '部门调整及人事任命通知（浩基2011 002号）', '2011-06-20 14:56:35', '45DEC1A0C2627518FCCE22EC5DD8F9B3', '2011-06-20 17:42:02');
INSERT INTO user_mail VALUES ('418', '55', '4', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0620', '2011-06-20 19:54:55', 'C5C9F0E5DF48F6987810087FDBFFB6C3', '2011-06-21 09:11:09');
INSERT INTO user_mail VALUES ('419', '55', '4', '巨人网络 员工独享：招商银行“一卡通金卡”第二次免费上门办理啦！', '2011-06-21 14:04:13', '92B8D7F874D6473E0DAD9ED9360015BC', '2011-06-22 12:05:17');
INSERT INTO user_mail VALUES ('420', '55', '4', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0620', '2011-06-21 18:13:19', '512B3C7947C03C38B668517FEC05D092', '2011-06-22 12:05:17');
INSERT INTO user_mail VALUES ('421', '55', '4', 'MAXIMO系统和AMT系统接口BUG', '2011-06-21 18:44:35', '9974A985892871B00D9608E0CAAC414D', '2011-06-22 12:05:17');
INSERT INTO user_mail VALUES ('422', '43', '1', '省钱创造价值，做一个节俭的人  只给尊贵的你(AD)', '2011-06-21 18:12:15', '8A03F1A23AEAADBBAC694F73E59925CC', '2011-06-22 12:29:30');
INSERT INTO user_mail VALUES ('423', '55', '4', '错过了与 郭俊生, 王慧 的对话', '2011-06-22 14:40:24', '03F41D8984FA2EEE5689C79C964CF3F4', '2011-06-23 16:18:28');
INSERT INTO user_mail VALUES ('424', '55', '4', '自动接受的与 孟初丹, 何勇辉, 侯心刚, 刘国庆, 刘斌琦, 刘新军, 华舟, 史文俊, 吕李俊, 吴小平（运维中心）, 周敬武, 孙学安, 孙磊, 安红波, 崔旭东, 庞晓妹, 廖川, 张一恒, 张强君, 张恒峰, 张敏杰, 张新旺, 张田, 徐大蔚, 施剑辉, 景静, 李俊, 李安波, 李瑞友, 杨华, 杨坚, 江忠旭, 沈英智, 熊峰, 王俊豪, 王斌, 王欣, 王萌萌, 石钦, 胡志孟,', '2011-06-22 14:42:59', 'C6372ECC905DB4697C3A0CF535307967', '2011-06-23 16:18:28');
INSERT INTO user_mail VALUES ('425', '41', '19', '答复: 《S0204 在线销售系统》网银充值优化项目方案图 以及 进度汇总0620', '2011-06-21 18:13:19', 'B38FEBF2D87B3F92F35F3702B5389C50', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('426', '41', '19', 'MAXIMO系统和AMT系统接口BUG', '2011-06-21 18:44:35', '33854DDC0F8D334D3ABD27F399FFE06C', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('427', '41', '19', '错过了与 郭俊生, 王慧 的对话', '2011-06-22 14:40:24', '908D5469190E870C08BB02CB1C64AF13', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('428', '41', '19', '自动接受的与 孟初丹, 何勇辉, 侯心刚, 刘国庆, 刘斌琦, 刘新军, 华舟, 史文俊, 吕李俊, 吴小平（运维中心）, 周敬武, 孙学安, 孙磊, 安红波, 崔旭东, 庞晓妹, 廖川, 张一恒, 张强君, 张恒峰, 张敏杰, 张新旺, 张田, 徐大蔚, 施剑辉, 景静, 李俊, 李安波, 李瑞友, 杨华, 杨坚, 江忠旭, 沈英智, 熊峰, 王俊豪, 王斌, 王欣, 王萌萌, 石钦, 胡志孟,', '2011-06-22 14:42:59', 'A291E67ED9FD5E189A06982B1F7C6EF9', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('429', '41', '19', '2011年第24期（总第71期）《网游技术周报》', '2011-06-24 18:18:22', 'E51B1C4D818C514D600852491B199643', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('430', '41', '19', '给全体员工的信【考勤/假期管理说明V1.2】', '2011-06-27 11:16:57', 'F719C8EC58B948F659D884A0848C5A0E', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('431', '41', '19', '转发: 给全体员工的信【考勤/假期管理说明V1.2】', '2011-06-27 12:01:32', '0ACC84B2344B9D4355F1B9EC2261310C', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('432', '41', '19', '', '2011-06-27 15:08:31', '9EE068F48791FAAABE4C5A26458C3A65', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('433', '41', '19', '给全体员工的信【考勤/假期管理说明V1.2】', '2011-06-27 15:52:28', '2DA5A78574227FDF87D4E1DE16F0FCCB', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('434', '41', '19', '错过了与 张敏敏, 王慧 的对话', '2011-06-29 11:45:01', '47306CB758A732A7E751D28385568729', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('435', '41', '19', '刷浦发信用卡订携程酒店机票，尽享夏日缤纷好礼！<AD>', '2011-06-29 13:52:42', '527DB60313B45D5CDC9E0AF6A4D58A04', '2011-07-01 12:10:44');
INSERT INTO user_mail VALUES ('436', '64', '58', '您的域密码即将过期，请尽快修改!', '2011-06-22 00:00:03', 'E6D9A2D2EF8C38D1B24733E271CE9D0F', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('437', '64', '58', '给全体员工的信【考勤/假期管理说明V1.2】', '2011-06-27 11:16:57', '04FEDAD4ECDE01A82FE7F9679AA6136A', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('438', '64', '58', '给全体员工的信【考勤/假期管理说明V1.2】', '2011-06-27 15:52:28', '1506463EEAF83444DE2FF5F70EB08791', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('439', '64', '58', ' AMT系统停机维护通知', '2011-07-01 17:25:53', '0D517BDE5FD5B91B7AD5F69B9F5C1669', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('440', '64', '58', '网络测试通知', '2011-07-04 18:55:03', '7CD7D3C915BF83E2F7BA70776943D7DA', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('441', '64', '58', '续: 给全体员工的信【考勤/假期管理说明V1.2】', '2011-07-07 17:07:35', 'CA7836A62DAF3B4DD5F9008C62A04CD2', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('442', '64', '58', '通知', '2011-07-08 12:02:50', '07BF274595CA4F6550302E1FAAE1D3EC', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('443', '64', '58', '好乐迪田林店优惠活动', '2011-07-08 12:10:57', '3B1FDD528FC7BCA87CB02B5846926007', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('444', '64', '58', ' AMT系统停机维护通知', '2011-07-08 16:43:04', '8425BE3560168F52DCFCBB284D022300', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('445', '64', '58', '宜山路外墙清洗注意事项', '2011-07-11 15:12:11', 'FFBCF04DC9E83AB4E7D2529BCA225BE1', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('446', '64', '58', '第十二期巨人讲坛将于7月14日（星期四）下午举办，诚邀您参加', '2011-07-11 18:04:34', '72E49F85D04D2DDDB65285F3269F34D4', '2011-07-13 13:00:36');
INSERT INTO user_mail VALUES ('457', '41', '19', '关于异常考勤上线说明的说明', '2011-07-13 15:49:14', '5BC502D7384E93E2EE4930719F424550', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('456', '41', '19', '第十二期巨人讲坛将于明日（7.14）下午举办，诚邀您参加', '2011-07-13 15:34:10', '759B3237F3796BC0869B523049881A7A', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('455', '41', '19', '第十二期巨人讲坛将于7月14日（星期四）下午举办，诚邀您参加', '2011-07-11 18:04:34', '8587745EEC8454F710D1B584B7AA945C', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('452', '41', '19', '答复: switchfile IP', '2011-07-11 12:29:21', '913C88BD0261BCACD45BBEEFED00FCDC', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('453', '41', '19', ' Gpass日志查询结果的补充', '2011-07-11 12:55:25', '51398A669DDE9FD735A26AA781D4EB90', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('454', '41', '19', '宜山路外墙清洗注意事项', '2011-07-11 15:12:11', '938BDA9315E8317E76D135AB97E9F62F', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('447', '43', '1', 'ÔÚÕâÌØ ±ðµÄÈÕ×Ó£¬Äã»¹ºÃÂð£¿', '2011-07-07 20:29:26', '79EBF2A8E68BE61261458C3B86886F47', '2011-07-13 19:33:50');
INSERT INTO user_mail VALUES ('448', '43', '1', 'fmn(代,开.发.票)(f3y5o', '2011-07-09 17:19:47', '86BE863BD366B3A378D28212BC13D0F6', '2011-07-13 19:33:50');
INSERT INTO user_mail VALUES ('449', '41', '19', '转发: 关于switchfile账号传到gpass的几个文件名（目录名）', '2011-07-11 10:39:57', '38098537B81DE8E477CDE7780AC5027E', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('450', '41', '19', '答复: 关于switchfile账号传到gpass的几个文件名（目录名）', '2011-07-11 11:20:12', 'D7555129EADE5E71B00920042FBA71CC', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('451', '41', '19', '转发: switchfile IP', '2011-07-11 11:51:20', '2E0697D6DB7E4241BAA7D84921324F55', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('458', '41', '19', '自动接受的与 孟初丹, 周敬武, 庞晓妹, 廖川, 陈华, 顾佳敏, 王慧 的会议', '2011-07-13 16:02:56', '5CBDD7CAD3D332FCF65F8B23145878DE', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('459', '41', '19', '讨论 巨人一点充充值 绑定银行卡送道具活动', '2011-07-13 18:49:54', '7F88A27D51B348F51CAE3BE262875E1E', '2011-07-15 15:01:59');
INSERT INTO user_mail VALUES ('460', '41', '19', 'qule加速器帮助文档', '2011-07-15 15:35:31', 'EC06CA0859F4D111AD6FE71DC91A9D42', '2011-07-15 15:56:52');
INSERT INTO user_mail VALUES ('461', '41', '19', '2011年第27期（总第74期）《网游技术周报》', '2011-07-15 18:22:31', '6091D28CF2A11A1B2482A48B0D24012D', '2011-07-18 11:29:06');
INSERT INTO user_mail VALUES ('462', '41', '19', '错过了与 卢万达, 王慧 的对话', '2011-07-18 14:30:39', '0B482399E22A22FC714B43F3AA72494F', '2011-07-18 16:26:12');
INSERT INTO user_mail VALUES ('463', '41', '19', '宜山路办公区电梯厅天花板加固，请大家注意安全', '2011-07-18 15:55:58', '8C3781402C062793ECF245980C7E9CEA', '2011-07-18 16:26:12');
INSERT INTO user_mail VALUES ('464', '41', '19', '更改官网下载链接', '2011-07-19 13:52:33', 'AF880BB78DA50D1C332749CA9FAF56CD', '2011-07-21 11:41:07');
INSERT INTO user_mail VALUES ('465', '41', '19', '错过了与 张强君, 王慧 的对话', '2011-07-20 11:35:51', 'D32781546C1C66DCA7FA3AC572368D0E', '2011-07-21 11:41:07');
INSERT INTO user_mail VALUES ('466', '41', '19', '自动接受的与 孟初丹, 周敬武, 庞晓妹, 廖川, 王欣, 陈华, 顾佳敏, 王慧 的会议', '2011-07-20 15:14:09', 'D3E9C58381A23BFAD090E13B0E897BF9', '2011-07-21 11:41:07');
INSERT INTO user_mail VALUES ('467', '41', '19', '巨人网络   2011年7月招行金卡发放、办理Ukey通知', '2011-07-20 17:54:47', '241524DFA02439E5C238300EB955B0AB', '2011-07-21 11:41:07');
INSERT INTO user_mail VALUES ('468', '41', '19', '引爆夏日风潮，酷爽好礼刷出来！<AD>', '2011-07-21 11:18:26', '9A1D7FAF7B3170E0C7AFB129B2745355', '2011-07-21 11:41:07');
INSERT INTO user_mail VALUES ('469', '41', '19', '错过了与 徐婷, 王慧 的对话', '2011-07-22 11:51:50', 'F33ED5BD6E7D936F479480C6A6937BD4', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('470', '41', '19', '', '2011-07-22 14:20:06', '93834B8B468C03BFE4E9D7DE4EC0A7CC', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('471', '41', '19', '巨人网络：“巨人网络男篮队”VS “上海腾讯队” 8月初争霸赛，今日热身赛开战，求关注！', '2011-07-22 16:49:17', '35FF98048C105678AA392C303B4B2072', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('472', '41', '19', '2011年第28期（总第75期）《网游技术周报》', '2011-07-22 18:26:13', '12391CF01649BD809B8F178146391423', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('473', '41', '19', '您的域密码即将过期，请尽快修改!', '2011-07-24 00:01:53', '50EFD9C530E93A7F3833B48717D31090', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('474', '41', '19', '您的域密码即将过期，请尽快修改!', '2011-07-25 00:01:49', 'BB2312D7FE0810DFBCC5F276B2DFCFBC', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('475', '41', '19', '部门调整及人事任命通知（信息2011 008号）', '2011-07-25 12:00:43', '93B65040E2B86FECD26F35EB19CF0B15', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('476', '41', '19', '部门调整及人事任命通知（巨人2011 003号）', '2011-07-25 12:02:32', '34D3AF9230EB7A43538EA9C562B919E6', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('477', '41', '19', '网络测试通知', '2011-07-25 12:17:23', '07DFA5BEC9EDBAF47885FABCDD16EEB1', '2011-07-25 18:23:40');
INSERT INTO user_mail VALUES ('478', '41', '19', '游戏列表', '2011-07-26 15:49:24', 'D44D626AA77052826BE853CB229420AC', '2011-07-28 10:28:07');
INSERT INTO user_mail VALUES ('479', '41', '19', '巨人网络首届足球友谊赛：激情盛夏，明日17：30首届足球比赛火爆开场，暴躁队VS顽皮队，欢迎观战！', '2011-07-26 17:31:51', '7879A6FF5E72828B948BD6C2DC1F6160', '2011-07-28 10:28:07');
INSERT INTO user_mail VALUES ('480', '41', '19', '自动接受的与 孟初丹, 万志远, 何勇辉, 刘国庆, 刘斌琦, 刘新军, 华舟, 卢万达, 史文俊, 吕世领, 吕李俊, 吴小平（运维中心）, 周敬武, 孙磊, 安红波, 崔旭东, 庞晓妹, 廖川, 张一恒, 张强君, 张敏杰, 张新旺, 张田, 徐大蔚, 徐琦�, 景静, 李代军, 李俊, 李安波, 李志军, 李瑞友, 杨华, 杨坚, 杨立丰, 樊苹, 沈英智, 熊峰, 王亚军, 王俊豪, 王斌', '2011-07-28 18:35:02', 'E40D1AF3940F1B014E688CCB2121C98B', '2011-07-29 07:58:55');
INSERT INTO user_mail VALUES ('481', '41', '19', '错过了与 胡远星, 王慧 的对话', '2011-07-28 19:29:50', '64B0BC24C235864CE1552E9F4AAE8C5F', '2011-07-29 07:58:55');
INSERT INTO user_mail VALUES ('482', '43', '1', '跳槽？还在挑？上智联招聘挑选', '2011-07-29 02:54:34', '9328DD6F7A71097BCD8FE5E791B1A1B3', '2011-07-29 11:38:19');
INSERT INTO user_mail VALUES ('483', '41', '19', '巨人网络员工优惠福利:下周一~周四，免费视力健康检测啦！', '2011-07-29 11:58:23', 'EC27D065187D55DD59A0E6242E5E4AEC', '2011-07-29 12:47:07');
INSERT INTO user_mail VALUES ('484', '41', '19', '2011年第29期（总第76期）《网游技术周报》', '2011-07-29 18:55:28', '09832C94B93B91B11ABC083486ED1EC1', '2011-08-01 11:11:49');
INSERT INTO user_mail VALUES ('485', '41', '19', '上海电信优惠购机活动', '2011-08-01 11:06:41', 'A4E7521C9D5CBC51FA92FE6F1594F57A', '2011-08-01 11:47:18');
INSERT INTO user_mail VALUES ('486', '41', '19', '自动接受的与 孟初丹, 何勇辉, 侯心刚, 刘国庆, 刘斌琦, 刘新军, 华舟, 史文俊, 吕世领, 吕李俊, 周敬武, 孙磊, 崔旭东, 庞晓妹, 廖川, 张一恒, 张强君, 张敏杰, 张新旺, 张田, 徐琦�, 施剑辉, 景静, 李代军, 李俊, 李安波, 李瑞友, 杨华, 杨坚, 杨立丰, 沈英智, 熊峰, 王亚军, 王俊豪, 王欣, 王萌萌, 石钦, 胡志孟, 胡海霞, 胡远星, 许登, ', '2011-08-01 13:43:43', '77ECB28F277CE7FE7FA4D8107998E5BE', '2011-08-01 14:46:26');
INSERT INTO user_mail VALUES ('487', '64', '65', '您的域密码即将过期，请尽快修改!', '2011-07-25 00:01:49', '5A8A475D450F28B2A18E2AEE09E6630D', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('488', '64', '65', '部门调整及人事任命通知（信息2011 008号）', '2011-07-25 12:00:43', '7410AFD595029B3D0F013140C6F9F890', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('489', '64', '65', '部门调整及人事任命通知（巨人2011 003号）', '2011-07-25 12:02:32', '26A593E515B17170EC5972CF8E0C6B1D', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('490', '64', '65', '网络测试通知', '2011-07-25 12:17:23', 'BD98509ACED860C98A8C99754F249D72', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('491', '64', '65', '您的域密码即将过期，请尽快修改!', '2011-07-26 00:01:41', '1421DE99D22D31B7D77DA50EAC9F12D1', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('492', '64', '65', '巨人网络首届足球友谊赛：激情盛夏，明日17：30首届足球比赛火爆开场，暴躁队VS顽皮队，欢迎观战！', '2011-07-26 17:31:51', '1CCC8734F1D6409C54430480234906D4', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('493', '64', '65', '您的域密码即将过期，请尽快修改!', '2011-07-27 00:01:47', '2DFE285852B492E175D715D5BCEF6A10', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('494', '64', '65', '您的域密码即将过期，请尽快修改!', '2011-07-28 00:01:52', '9E5292C517247FDA51B4C287AE1A6C16', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('495', '64', '65', '您的域密码即将过期，请尽快修改!', '2011-07-29 00:01:54', 'A8371DC7E75BFA241F5E39A53F5D0A4B', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('496', '64', '65', '巨人网络员工优惠福利:下周一~周四，免费视力健康检测啦！', '2011-07-29 11:58:23', '6DC41E4799AB77A969E6C5E1DBEFC488', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('497', '64', '65', '上海电信优惠购机活动', '2011-08-01 11:06:41', 'FBEE0EA73A78E9573336D595C786FACC', '2011-08-02 11:20:31');
INSERT INTO user_mail VALUES ('498', '41', '19', '停电通知', '2011-08-04 16:19:22', 'CF770647986477405D2EDEF368E17A91', '2011-08-05 11:11:07');
INSERT INTO user_mail VALUES ('499', '43', '1', '上世纪佳缘婚恋交友网  寻找你今生de爱人', '2011-08-04 16:44:46', '9F0B4BE378855028DC19561C6FC77CE8', '2011-08-05 12:11:29');
INSERT INTO user_mail VALUES ('500', '64', '65', '', '2011-08-03 18:31:42', '43DEA5103FAFF808D731892A6ECE0FA3', '2011-08-05 12:20:22');
INSERT INTO user_mail VALUES ('501', '64', '65', '停电通知', '2011-08-04 16:19:22', '15D2A75AE6B151A79B8E127F14139186', '2011-08-05 12:20:22');
INSERT INTO user_mail VALUES ('502', '41', '19', '【2011上半年绩效结果】AMT自助查询提示', '2011-08-05 13:35:19', '3F3DA0D5494E9C6E8E6C07BEA95D5567', '2011-08-05 13:44:49');
INSERT INTO user_mail VALUES ('503', '41', '19', '2011年第30期（总第77期）《网游技术周报》', '2011-08-05 18:42:19', 'A60388414EB567E6E8B9E1D43A23E50F', '2011-08-10 11:44:08');
INSERT INTO user_mail VALUES ('504', '41', '19', '错过了与 赵俊杰, 王慧 的对话', '2011-08-08 11:02:28', '212A662D8BF587F22AFBDBEAED8A35A8', '2011-08-10 11:44:08');
INSERT INTO user_mail VALUES ('505', '41', '19', '错过了与 卢万达, 王慧 的对话', '2011-08-09 15:37:37', '1B23276B770F58467DA17ED847C68A48', '2011-08-10 11:44:08');
INSERT INTO user_mail VALUES ('506', '41', '19', '自动接受的与 孟初丹, 何勇辉, 侯心刚, 刘国庆, 刘新军, 华舟, 史文俊, 吕世领, 吕李俊, 周敬武, 孙磊, 安红波, 崔旭东, 庞晓妹, 廖川, 张一恒, 张强君, 张恒峰, 张敏杰, 张新旺, 张璐, 张田, 徐琦�, 施剑辉, 景静, 李俊, 李安波, 李志军, 李瑞友, 杨华, 杨坚, 杨立丰, 林晓强, 樊苹, 江忠旭, 沈英智, 熊峰, 王亚军, 王欣, 王萌萌, 石钦, 胡', '2011-08-11 11:50:03', '01E08B0A937F4FF2424CDA06070B0595', '2011-08-11 14:54:13');
INSERT INTO user_mail VALUES ('507', '41', '19', '停电通知', '2011-08-11 13:51:32', 'AF83680DC39BA273B27D52AD7CDE9FFB', '2011-08-11 14:54:13');
INSERT INTO user_mail VALUES ('508', '43', '1', '【也买酒窖：首个红酒微博】高手论酒，同城聚会，也买酒来买单', '2011-08-05 21:39:00', 'D376BBD14A90D3E1E11CFFA015AD78CE', '2011-08-11 15:12:00');
INSERT INTO user_mail VALUES ('509', '41', '19', '打怪不给力、学锋来帮你――巨人讲坛第十四期课程主题征集', '2011-08-11 15:37:26', 'B9704FE0E0CC3EAB4ABFFEED0ADC38C7', '2011-08-11 17:10:53');
INSERT INTO user_mail VALUES ('510', '64', '65', '【2011上半年绩效结果】AMT自助查询提示', '2011-08-05 13:35:19', 'E7F15EF47C68568ECD1CCF20C175C462', '2011-08-11 17:14:31');
INSERT INTO user_mail VALUES ('511', '64', '65', '停电通知', '2011-08-11 13:51:32', 'D78A6C8B6AB1791EFD7AC4B56C92C92B', '2011-08-11 17:14:31');
INSERT INTO user_mail VALUES ('512', '64', '65', '打怪不给力、学锋来帮你――巨人讲坛第十四期课程主题征集', '2011-08-11 15:37:26', 'A35C4D1382CE888E4F167939B2646B90', '2011-08-11 17:14:31');
INSERT INTO user_mail VALUES ('513', '12', '2', '感谢注册杜拉拉团购网，请验证Email以获取更多服务', '2011-07-29 15:06:54', 'EC5AEF5B0B78B211D11475CE103411A0', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('514', '12', '2', '108团客服中心：订单846958104723己收到，正在处理中', '2011-07-30 10:47:23', '1FF05FA22AD0577025B9EBBA6498EE88', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('515', '12', '2', '108团:忘记密码', '2011-07-30 10:49:47', 'EF862BE88A99CBC59E53C376DA698BB0', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('516', '12', '2', 'Fw:妈妈必看！你所不知道的孩子食品黑幕！', '2011-08-02 11:31:48', 'DF888847C6DF07A7A113B744F0A1352D', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('517', '12', '2', '尊敬的王慧，您好！', '2011-08-03 16:11:07', '875A3B635ADD13F70F7B7EDFA495D8B6', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('518', '12', '2', '租售情报本周末看房：8号线世博后花园有新房源、宝山共康抢低总价次新房', '2011-08-04 15:00:42', '5F986EB041A32988ED050F438D117159', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('519', '12', '2', 'ZOL中关村在线-注册确认', '2011-08-04 17:25:04', '01A8CA050E18BC09FE29449850342C20', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('520', '12', '2', '网上支付交易通知', '2011-08-05 15:04:03', '6BD953C83CD49F4AD7120CB06E234496', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('521', '12', '2', '拉手用户注册确认邮件', '2011-08-06 11:21:41', 'A43981D27DC751F9D8A039E721738648', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('522', '12', '2', 'Free Cloud VPS Re-Born!', '2011-08-10 05:20:34', 'F6D5BD73F2B05D4115605227E0C764E7', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('523', '12', '2', '[爱物论坛] 用户审核结果通知', '2011-08-11 09:59:01', '942D63EEF03D301EB01B2C5EEA9D1B56', '2011-08-11 17:21:32');
INSERT INTO user_mail VALUES ('524', '41', '19', ' 巨人网络篮球赛【第三季】：“巨人网络队”VS “上海腾讯队”明日决战，欢迎各位巨人观战，助威！', '2011-08-11 18:10:26', '91520723286EF81B740FED403AB9EABC', '2011-08-12 10:45:48');
INSERT INTO user_mail VALUES ('525', '64', '65', ' 巨人网络篮球赛【第三季】：“巨人网络队”VS “上海腾讯队”明日决战，欢迎各位巨人观战，助威！', '2011-08-11 18:10:26', '665B18E3A4A4A564C9006FF68F6A617E', '2011-08-12 16:40:46');

-- ----------------------------
-- Table structure for `user_msg`
-- ----------------------------
DROP TABLE IF EXISTS `user_msg`;
CREATE TABLE `user_msg` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `content` varchar(200) default NULL,
  `add_time` datetime NOT NULL,
  `state` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_msg
-- ----------------------------
INSERT INTO user_msg VALUES ('1', '1', '1', null, '2011-07-26 20:03:56', '0');
INSERT INTO user_msg VALUES ('2', '1', '1', null, '2011-07-26 20:05:08', '0');
INSERT INTO user_msg VALUES ('3', '1', '1', null, '2011-07-27 09:06:07', '0');
INSERT INTO user_msg VALUES ('4', '1', '1', '121212', '2011-07-27 09:09:11', '0');
INSERT INTO user_msg VALUES ('5', '19', '19', '1111', '2011-07-28 12:31:23', '0');
INSERT INTO user_msg VALUES ('6', '19', '19', '21111', '2011-07-28 14:57:16', '0');
INSERT INTO user_msg VALUES ('7', '19', '19', '211111111', '2011-07-28 14:57:27', '0');
INSERT INTO user_msg VALUES ('8', '19', '19', '3333', '2011-07-28 14:57:30', '0');
INSERT INTO user_msg VALUES ('9', '19', '19', '44444', '2011-07-28 14:57:32', '0');
INSERT INTO user_msg VALUES ('10', '19', '19', '5555', '2011-07-28 14:57:35', '0');
INSERT INTO user_msg VALUES ('11', '19', '19', '12121', '2011-07-28 17:24:16', '0');
INSERT INTO user_msg VALUES ('12', '19', '19', '111', '2011-07-29 11:39:33', '0');
INSERT INTO user_msg VALUES ('13', '19', '19', '222222222', '2011-07-29 11:39:45', '0');
INSERT INTO user_msg VALUES ('14', '19', '19', '3333', '2011-07-29 11:40:04', '0');
INSERT INTO user_msg VALUES ('15', '1', '19', '2111', '2011-07-29 11:43:40', '0');
INSERT INTO user_msg VALUES ('16', '19', '1', '1212', '2011-08-01 16:11:49', '0');

-- ----------------------------
-- Table structure for `user_news`
-- ----------------------------
DROP TABLE IF EXISTS `user_news`;
CREATE TABLE `user_news` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `content` varchar(500) default NULL,
  `type` tinyint(4) default NULL,
  `update_time` datetime default NULL,
  `ref_id` int(11) default NULL,
  `ref_img` varchar(80) default NULL,
  `ref_uid` int(11) default NULL,
  `user_grade` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_user_news_1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_news
-- ----------------------------
INSERT INTO user_news VALUES ('1', '38', 'denny', '5', '2011-10-24 17:37:44', null, null, '89', null);
INSERT INTO user_news VALUES ('2', '89', '狼太郎', '5', '2011-10-25 15:45:57', null, null, '38', null);
INSERT INTO user_news VALUES ('3', '38', '上传了1张照片', '3', '2011-11-01 17:00:08', null, '38_1320138008314.jpg', null, null);
INSERT INTO user_news VALUES ('4', '38', '上传了1张照片', '3', '2011-11-01 17:06:01', null, '38_1320138361944.jpg', null, null);
INSERT INTO user_news VALUES ('5', '38', '上传了1张照片', '3', '2011-11-01 17:10:22', null, '38_1320138622806.jpg', null, null);
INSERT INTO user_news VALUES ('6', '38', '上传了1张照片', '3', '2011-11-01 17:10:28', null, '38_1320138628181.jpg', null, null);
INSERT INTO user_news VALUES ('7', '38', '上传了1张照片', '3', '2011-11-01 17:12:08', null, '38_1320138728393.jpg', null, null);
INSERT INTO user_news VALUES ('8', '38', '上传了1张照片', '3', '2011-11-01 17:12:08', null, '38_1320138728581.jpg', null, null);
INSERT INTO user_news VALUES ('9', '38', '上传了1张照片', '3', '2011-11-01 17:14:17', null, '38_1320138857531.jpg', null, null);
INSERT INTO user_news VALUES ('10', '38', '上传了1张照片', '3', '2011-11-01 17:19:49', null, '38_1320139189457.jpg', null, null);
INSERT INTO user_news VALUES ('11', '38', '上传了1张照片', '3', '2011-11-01 17:21:42', null, '38_1320139302149.jpg', null, null);
INSERT INTO user_news VALUES ('12', '38', '上传了1张照片', '3', '2011-11-01 17:23:26', null, '38_1320139406933.jpg', null, null);
INSERT INTO user_news VALUES ('13', '38', '上传了1张照片', '3', '2011-11-01 17:24:06', null, '38_1320139446246.jpg', null, null);
INSERT INTO user_news VALUES ('14', '38', '上传了1张照片', '3', '2011-11-01 18:01:17', null, '38_1320141677307.jpg', null, null);
INSERT INTO user_news VALUES ('15', '38', '上传了1张照片', '3', '2011-11-01 18:04:35', null, '38_1320141875232.jpg', null, null);
INSERT INTO user_news VALUES ('16', '38', '上传了1张照片', '3', '2011-11-01 18:05:18', null, '38_1320141918185.jpg', null, null);
INSERT INTO user_news VALUES ('17', '38', '上传了1张照片', '3', '2011-11-01 18:06:04', null, '38_1320141964623.jpg', null, null);
INSERT INTO user_news VALUES ('18', '38', '上传了1张照片', '3', '2011-11-01 18:06:28', null, '38_1320141988077.jpg', null, null);
INSERT INTO user_news VALUES ('19', '38', '上传了1张照片', '3', '2011-11-01 18:07:35', null, '38_1320142055374.jpg', null, null);
INSERT INTO user_news VALUES ('20', '38', '上传了1张照片', '3', '2011-11-01 18:07:52', null, '38_1320142072234.jpg', null, null);
INSERT INTO user_news VALUES ('21', '38', '上传了1张照片', '3', '2011-11-01 18:08:31', null, '38_1320142111797.jpg', null, null);
INSERT INTO user_news VALUES ('22', '38', '上传了1张照片', '3', '2011-11-01 18:08:48', null, '38_1320142128360.jpg', null, null);
INSERT INTO user_news VALUES ('23', '38', '上传了1张照片', '3', '2011-11-01 18:09:06', null, '38_1320142146751.jpg', null, null);
INSERT INTO user_news VALUES ('24', '38', '上传了1张照片', '3', '2011-11-01 18:09:49', null, '38_1320142189657.jpg', null, null);
INSERT INTO user_news VALUES ('25', '38', '上传了1张照片', '3', '2011-11-01 18:10:10', null, '38_1320142210580.jpg', null, null);
INSERT INTO user_news VALUES ('26', '38', '上传了1张照片', '3', '2011-11-01 18:10:22', null, '38_1320142222799.jpg', null, null);
INSERT INTO user_news VALUES ('27', '38', '上传了1张照片', '3', '2011-11-01 18:10:55', null, '38_1320142255674.jpg', null, null);
INSERT INTO user_news VALUES ('28', '67', '上传了1张照片', '3', '2011-11-01 18:18:45', null, '67_1320142725852.png', null, null);
INSERT INTO user_news VALUES ('29', '38', '上传了1张照片', '3', '2011-11-01 18:20:48', null, '38_1320142848322.jpg', null, null);
INSERT INTO user_news VALUES ('30', '38', '上传了1张照片', '3', '2011-11-01 18:21:04', null, '38_1320142864557.jpg', null, null);
INSERT INTO user_news VALUES ('31', '38', '上传了1张照片', '3', '2011-11-01 18:21:24', null, '38_1320142884948.jpg', null, null);
INSERT INTO user_news VALUES ('32', '38', '上传了1张照片', '3', '2011-11-01 18:22:20', null, '38_1320142940417.jpg', null, null);
INSERT INTO user_news VALUES ('33', '38', '上传了1张照片', '3', '2011-11-01 18:22:56', null, '38_1320142976527.jpg', null, null);
INSERT INTO user_news VALUES ('34', '67', '上传了1张照片', '3', '2011-11-01 18:29:40', null, '67_1320143380345.jpg', null, null);
INSERT INTO user_news VALUES ('35', '67', '上传了1张照片', '3', '2011-11-01 18:29:40', null, '67_1320143380501.png', null, null);
INSERT INTO user_news VALUES ('36', '38', '上传了1张照片', '3', '2011-11-01 18:30:49', null, '38_1320143449705.jpg', null, null);
INSERT INTO user_news VALUES ('37', '38', '上传了1张照片', '3', '2011-11-01 18:42:02', null, '38_1320144122340.jpg', null, null);
INSERT INTO user_news VALUES ('38', '38', '上传了1张照片', '3', '2011-11-01 18:42:02', null, '38_1320144122527.jpg', null, null);
INSERT INTO user_news VALUES ('39', '38', '上传了1张照片', '3', '2011-11-01 18:42:34', null, '38_1320144154815.jpg', null, null);
INSERT INTO user_news VALUES ('40', '38', '上传了1张照片', '3', '2011-11-01 18:42:53', null, '38_1320144173497.jpg', null, null);
INSERT INTO user_news VALUES ('41', '38', '上传了1张照片', '3', '2011-11-01 18:43:19', null, '38_1320144199521.jpg', null, null);
INSERT INTO user_news VALUES ('42', '38', '上传了1张照片', '3', '2011-11-01 18:43:38', null, '38_1320144218234.jpg', null, null);
INSERT INTO user_news VALUES ('43', '38', '上传了1张照片', '3', '2011-11-01 18:49:58', null, '38_1320144598330.jpg', null, null);
INSERT INTO user_news VALUES ('44', '38', '上传了1张照片', '3', '2011-11-01 18:49:58', null, '38_1320144598502.jpg', null, null);
INSERT INTO user_news VALUES ('45', '38', '上传了1张照片', '3', '2011-11-01 18:49:58', null, '38_1320144598642.jpg', null, null);
INSERT INTO user_news VALUES ('46', '38', '上传了1张照片', '3', '2011-11-01 18:51:14', null, '38_1320144674855.jpg', null, null);
INSERT INTO user_news VALUES ('47', '38', '上传了1张照片', '3', '2011-11-01 18:51:15', null, '38_1320144675027.jpg', null, null);
INSERT INTO user_news VALUES ('48', '38', '上传了1张照片', '3', '2011-11-01 18:52:48', null, '38_1320144768775.jpg', null, null);
INSERT INTO user_news VALUES ('49', '38', '上传了1张照片', '3', '2011-11-01 18:53:02', null, '38_1320144782196.jpg', null, null);
INSERT INTO user_news VALUES ('50', '38', '上传了1张照片', '3', '2011-11-01 18:53:02', null, '38_1320144782384.jpg', null, null);
INSERT INTO user_news VALUES ('51', '38', '上传了1张照片', '3', '2011-11-01 18:53:02', null, '38_1320144782540.jpg', null, null);
INSERT INTO user_news VALUES ('52', '38', '上传了1张照片', '3', '2011-11-01 18:53:47', null, '38_1320144827539.jpg', null, null);
INSERT INTO user_news VALUES ('53', '38', '上传了1张照片', '3', '2011-11-01 18:53:47', null, '38_1320144827711.jpg', null, null);
INSERT INTO user_news VALUES ('54', '38', '上传了1张照片', '3', '2011-11-01 18:56:28', null, '38_1320144988629.jpg', null, null);
INSERT INTO user_news VALUES ('55', '38', '上传了1张照片', '3', '2011-11-01 20:39:02', null, '38_1320151142195.jpg', null, null);
INSERT INTO user_news VALUES ('56', '38', '上传了1张照片', '3', '2011-11-01 20:40:48', null, '38_1320151248447.jpg', null, null);
INSERT INTO user_news VALUES ('57', '38', '上传了1张照片', '3', '2011-11-01 20:48:12', null, '38_1320151692734.jpg', null, null);
INSERT INTO user_news VALUES ('58', '38', '上传了1张照片', '3', '2011-11-01 20:48:13', null, '38_1320151692968.jpg', null, null);
INSERT INTO user_news VALUES ('59', '38', '上传了1张照片', '3', '2011-11-01 20:48:13', null, '38_1320151693109.gif', null, null);
INSERT INTO user_news VALUES ('60', '38', '上传了1张照片', '3', '2011-11-01 20:48:46', null, '38_1320151726922.jpg', null, null);
INSERT INTO user_news VALUES ('61', '38', '上传了1张照片', '3', '2011-11-01 21:06:40', null, '38_1320152800706.jpg', null, null);
INSERT INTO user_news VALUES ('62', '38', '上传了1张照片', '3', '2011-11-01 21:12:25', null, '38_1320153145340.jpg', null, null);
INSERT INTO user_news VALUES ('63', '38', '上传了1张照片', '3', '2011-11-01 21:15:25', null, '38_1320153325465.jpg', null, null);
INSERT INTO user_news VALUES ('64', '38', '上传了1张照片', '3', '2011-11-01 21:16:16', null, '38_1320153376074.jpg', null, null);
INSERT INTO user_news VALUES ('65', '38', '上传了1张照片', '3', '2011-11-01 21:18:29', null, '38_1320153509340.jpg', null, null);
INSERT INTO user_news VALUES ('66', '67', '上传了1张照片', '3', '2011-11-01 21:18:59', null, '67_1320153539200.png', null, null);
INSERT INTO user_news VALUES ('67', '67', '上传了1张照片', '3', '2011-11-01 21:19:24', null, '67_1320153564044.png', null, null);
INSERT INTO user_news VALUES ('68', '38', '上传了1张照片', '3', '2011-11-01 21:19:29', null, '38_1320153569544.jpg', null, null);
INSERT INTO user_news VALUES ('69', '38', '上传了1张照片', '3', '2011-11-01 21:19:29', null, '38_1320153569700.jpg', null, null);
INSERT INTO user_news VALUES ('70', '38', '上传了1张照片', '3', '2011-11-01 21:21:49', null, '38_1320153709717.jpg', null, null);
INSERT INTO user_news VALUES ('71', '67', '上传了1张照片', '3', '2011-11-01 21:34:08', null, '67_1320154448846.png', null, null);
INSERT INTO user_news VALUES ('72', '67', '上传了1张照片', '3', '2011-11-01 21:35:21', null, '67_1320154521409.png', null, null);
INSERT INTO user_news VALUES ('73', '38', '上传了1张照片', '3', '2011-11-01 21:35:50', null, '38_1320154550800.jpg', null, null);
INSERT INTO user_news VALUES ('74', '38', '上传了1张照片', '3', '2011-11-01 21:35:50', null, '38_1320154550956.jpg', null, null);
INSERT INTO user_news VALUES ('75', '66', '上传了1张照片', '3', '2011-11-01 21:37:06', null, '66_1320154626629.png', null, null);
INSERT INTO user_news VALUES ('76', '38', '上传了1张照片', '3', '2011-11-01 21:37:17', null, '38_1320154637910.jpg', null, null);
INSERT INTO user_news VALUES ('77', '38', '上传了1张照片', '3', '2011-11-01 21:37:18', null, '38_1320154638082.jpg', null, null);
INSERT INTO user_news VALUES ('78', '38', '上传了1张照片', '3', '2011-11-01 21:37:18', null, '38_1320154638285.jpg', null, null);
INSERT INTO user_news VALUES ('79', '66', '上传了1张照片', '3', '2011-11-01 21:39:17', null, '66_1320154757051.png', null, null);
INSERT INTO user_news VALUES ('80', '66', '上传了1张照片', '3', '2011-11-01 21:41:11', null, '66_1320154871380.png', null, null);
INSERT INTO user_news VALUES ('81', '38', '上传了1张照片', '3', '2011-11-01 21:44:07', null, '38_1320155047178.jpg', null, null);
INSERT INTO user_news VALUES ('82', '38', '上传了1张照片', '3', '2011-11-02 11:06:48', null, '38_1320203208435.jpg', null, null);
INSERT INTO user_news VALUES ('83', '38', '上传了1张照片', '3', '2011-11-02 11:14:15', null, '38_1320203655531.jpg', null, null);
INSERT INTO user_news VALUES ('84', '38', '上传了1张照片', '3', '2011-11-02 11:15:54', null, '38_1320203754094.jpg', null, null);
INSERT INTO user_news VALUES ('85', '38', '上传了1张照片', '3', '2011-11-02 11:26:41', null, '38_1320204401302.jpg', null, null);
INSERT INTO user_news VALUES ('86', '38', '上传了1张照片', '3', '2011-11-02 11:27:56', null, '38_1320204476537.jpg', null, null);
INSERT INTO user_news VALUES ('87', '38', '上传了1张照片', '3', '2011-11-02 11:36:18', null, '38_1320204978430.jpg', null, null);
INSERT INTO user_news VALUES ('88', '38', '上传了1张照片', '3', '2011-11-02 11:36:18', null, '38_1320204978649.jpg', null, null);
INSERT INTO user_news VALUES ('89', '38', '上传了1张照片', '3', '2011-11-02 11:36:18', null, '38_1320204978805.jpg', null, null);
INSERT INTO user_news VALUES ('90', '38', '上传了1张照片', '3', '2011-11-02 11:36:18', null, '38_1320204978930.jpg', null, null);
INSERT INTO user_news VALUES ('91', '38', '上传了1张照片', '3', '2011-11-02 11:36:19', null, '38_1320204979040.gif', null, null);
INSERT INTO user_news VALUES ('92', '38', '上传了1张照片', '3', '2011-11-02 11:36:19', null, '38_1320204979227.png', null, null);
INSERT INTO user_news VALUES ('93', '38', '上传了1张照片', '3', '2011-11-02 11:36:19', null, '38_1320204979384.png', null, null);
INSERT INTO user_news VALUES ('94', '38', '上传了1张照片', '3', '2011-11-02 11:37:15', null, '38_1320205035509.jpg', null, null);
INSERT INTO user_news VALUES ('95', '38', '上传了1张照片', '3', '2011-11-02 11:37:15', null, '38_1320205035696.jpg', null, null);
INSERT INTO user_news VALUES ('96', '38', '上传了1张照片', '3', '2011-11-02 11:37:15', null, '38_1320205035853.jpg', null, null);
INSERT INTO user_news VALUES ('97', '38', '上传了1张照片', '3', '2011-11-02 11:37:50', null, '38_1320205070369.jpg', null, null);
INSERT INTO user_news VALUES ('98', '38', '上传了1张照片', '3', '2011-11-02 11:38:59', null, '38_1320205139697.jpg', null, null);
INSERT INTO user_news VALUES ('99', '38', '上传了1张照片', '3', '2011-11-02 11:38:59', null, '38_1320205139900.jpg', null, null);
INSERT INTO user_news VALUES ('100', '36', '上传了1张照片', '3', '2011-11-03 16:46:47', null, '36_1320310007880.jpg', null, null);
INSERT INTO user_news VALUES ('101', '68', '上传了1张照片', '3', '2011-11-03 16:56:09', null, '68_1320310569805.jpg', null, null);
INSERT INTO user_news VALUES ('102', '38', '上传了1张照片', '3', '2011-11-03 17:32:47', null, '38_1320312767491.jpg', null, null);
INSERT INTO user_news VALUES ('103', '38', '上传了1张照片', '3', '2011-11-03 18:17:50', null, '38_1320315470540.jpg', null, null);
INSERT INTO user_news VALUES ('104', '38', '上传了1张照片', '3', '2011-11-03 18:18:31', null, '38_1320315511931.jpg', null, null);
INSERT INTO user_news VALUES ('105', '38', '上传了1张照片', '3', '2011-11-03 18:54:33', null, '38_1320317673898.jpg', null, null);
INSERT INTO user_news VALUES ('106', '38', '上传了1张照片', '3', '2011-11-03 20:59:31', null, '38_1320325171080.jpg', null, null);
INSERT INTO user_news VALUES ('107', '38', '上传了1张照片', '3', '2011-11-03 20:59:31', null, '38_1320325171408.jpg', null, null);
INSERT INTO user_news VALUES ('108', '38', '上传了1张照片', '3', '2011-11-03 21:04:24', null, '38_1320325464826.jpg', null, null);
INSERT INTO user_news VALUES ('109', '38', '上传了1张照片', '3', '2011-11-03 21:08:11', null, '38_1320325691386.jpg', null, null);
INSERT INTO user_news VALUES ('110', '38', '上传了1张照片', '3', '2011-11-03 21:11:06', null, '38_1320325865993.jpg', null, null);
INSERT INTO user_news VALUES ('111', '67', '上传了1张照片', '3', '2011-11-04 17:49:20', null, '67_1320400159914.jpg', null, null);
INSERT INTO user_news VALUES ('112', '38', '李飘飘', '5', '2011-11-07 10:36:48', null, null, '67', null);
INSERT INTO user_news VALUES ('113', '38', '123', '5', '2011-11-07 10:38:22', null, null, '76', null);
INSERT INTO user_news VALUES ('114', '38', 'tammy', '5', '2011-11-07 10:55:37', null, null, '3', null);
INSERT INTO user_news VALUES ('115', '38', '路过', '5', '2011-11-07 10:55:59', null, null, '1', null);
INSERT INTO user_news VALUES ('116', '38', 'sfd\r\nsdgsdaghsah', '1', '2011-11-07 12:40:38', null, null, null, null);
INSERT INTO user_news VALUES ('117', '38', '洒的规划杀害的啊\r\n阿斯噶厦大概和\r\n啊是德国哈市的', '1', '2011-11-07 12:42:37', null, null, null, null);
INSERT INTO user_news VALUES ('118', '38', '啊电话撒谎啊啥和', '1', '2011-11-07 12:44:55', null, null, null, null);
INSERT INTO user_news VALUES ('119', '38', '随时都会啊啊', '1', '2011-11-07 12:45:05', null, null, null, null);
INSERT INTO user_news VALUES ('120', '38', '上传了1张照片', '3', '2011-11-07 17:11:52', null, '38_1320657112058.jpg', null, null);
INSERT INTO user_news VALUES ('121', '38', '上传了1张照片', '3', '2011-11-07 17:13:51', null, '38_1320657231041.jpg', null, null);
INSERT INTO user_news VALUES ('122', '38', '上传了1张照片', '3', '2011-11-07 17:13:51', null, '38_1320657231323.jpg', null, null);
INSERT INTO user_news VALUES ('123', '38', '', '1', '2011-11-07 17:15:58', null, null, null, null);
INSERT INTO user_news VALUES ('124', '67', 'asdgsadhah', '1', '2011-11-07 17:53:32', null, null, null, null);
INSERT INTO user_news VALUES ('125', '67', 'asdgsadhah', '1', '2011-11-07 17:53:32', null, null, null, null);
INSERT INTO user_news VALUES ('126', '67', 'sdhsdhsdah', '1', '2011-11-07 17:53:36', null, null, null, null);
INSERT INTO user_news VALUES ('127', '67', 'sdhsdhsdah', '1', '2011-11-07 17:53:36', null, null, null, null);
INSERT INTO user_news VALUES ('128', '67', 'ahadhasdhadshahadh', '1', '2011-11-07 17:53:44', null, null, null, null);
INSERT INTO user_news VALUES ('129', '67', 'ahadhasdhadshahadh', '1', '2011-11-07 17:53:44', null, null, null, null);
INSERT INTO user_news VALUES ('130', '67', 'asdhahasdhdhds', '1', '2011-11-07 17:59:53', null, null, null, null);
INSERT INTO user_news VALUES ('131', '67', 'asdhahasdhdhds', '1', '2011-11-07 17:59:53', null, null, null, null);
INSERT INTO user_news VALUES ('132', '67', 'ahdhsadhashd', '1', '2011-11-07 18:01:29', null, null, null, null);
INSERT INTO user_news VALUES ('133', '67', 'ahdhsadhashd', '1', '2011-11-07 18:01:30', null, null, null, null);
INSERT INTO user_news VALUES ('134', '67', 'sadhadhasdhahhsdhasdhsdhasdh', '1', '2011-11-07 18:04:50', null, null, null, null);
INSERT INTO user_news VALUES ('135', '67', 'sadhadhasdhahhsdhasdhsdhasdh', '1', '2011-11-07 18:04:50', null, null, null, null);
INSERT INTO user_news VALUES ('136', '67', 'asdhadhsdah', '1', '2011-11-07 18:07:05', null, null, null, null);
INSERT INTO user_news VALUES ('137', '67', 'asdhadhsdah', '1', '2011-11-07 18:07:05', null, null, null, null);
INSERT INTO user_news VALUES ('138', '67', '', '1', '2011-11-07 18:07:17', null, null, null, null);
INSERT INTO user_news VALUES ('139', '67', 'adgasdgasdhsh', '1', '2011-11-07 18:18:28', null, null, null, null);
INSERT INTO user_news VALUES ('140', '67', '的傻瓜大河大湖啊', '1', '2011-11-07 18:18:33', null, null, null, null);
INSERT INTO user_news VALUES ('141', '67', '是大哈说的话个阿斯', '1', '2011-11-07 18:18:40', null, null, null, null);
INSERT INTO user_news VALUES ('142', '67', '说的哈撒多哈大厦', '1', '2011-11-07 18:18:48', null, null, null, null);
INSERT INTO user_news VALUES ('143', '67', '杀毒哈搜到哈市电话噶厦', '1', '2011-11-07 18:19:08', null, null, null, null);
INSERT INTO user_news VALUES ('144', '67', '啊使得嘎多哈', '1', '2011-11-07 18:20:14', null, null, null, null);
INSERT INTO user_news VALUES ('145', '67', '杀毒哈搜到哈市\r啊是大哈说的话a啊阿斯大声\r阿斯顿哈撒的和', '1', '2011-11-07 18:20:37', null, null, null, null);
INSERT INTO user_news VALUES ('146', '67', '啊的哈哈的', '1', '2011-11-07 18:36:48', null, null, null, null);
INSERT INTO user_news VALUES ('147', '67', 'ggasdgas\r\n嘎嘎阿斯\r\n阿斯顿哈德哈啊', '1', '2011-11-07 18:36:58', null, null, null, null);
INSERT INTO user_news VALUES ('148', '67', '是大会杀毒哈市', '1', '2011-11-07 18:37:13', null, null, null, null);
INSERT INTO user_news VALUES ('149', '38', '傻大杀毒后的和', '1', '2011-11-07 18:42:54', null, null, null, null);
INSERT INTO user_news VALUES ('150', '38', '说的哈撒多哈大厦啊', '1', '2011-11-07 18:43:29', null, null, null, null);
INSERT INTO user_news VALUES ('151', '38', 'asdhasdhasd ', '1', '2011-11-07 18:43:35', null, null, null, null);
INSERT INTO user_news VALUES ('152', '38', '啊盛大哈哈啊', '1', '2011-11-07 18:43:40', null, null, null, null);
INSERT INTO user_news VALUES ('153', '38', '啊是德国哈市的', '1', '2011-11-07 18:43:56', null, null, null, null);
INSERT INTO user_news VALUES ('154', '67', '地点', '1', '2011-11-07 18:45:19', null, null, null, null);
INSERT INTO user_news VALUES ('155', '67', '嘻嘻嘻', '1', '2011-11-07 18:45:23', null, null, null, null);
INSERT INTO user_news VALUES ('156', '67', '伤心和痛着啊。在趣乐的这几天。精神恍惚。', '1', '2011-11-07 18:46:13', null, null, null, null);
INSERT INTO user_news VALUES ('157', '67', '大幅度', '1', '2011-11-07 18:46:17', null, null, null, null);
INSERT INTO user_news VALUES ('158', '38', '加速大神', '5', '2011-11-07 18:46:22', null, null, '36', null);
INSERT INTO user_news VALUES ('159', '67', '私服 消息消息嘻嘻嘻', '1', '2011-11-07 18:46:22', null, null, null, null);
INSERT INTO user_news VALUES ('160', '67', null, '1', '2011-11-07 18:47:23', null, null, null, null);
INSERT INTO user_news VALUES ('161', '38', '上传了1张照片', '3', '2011-11-07 18:47:48', null, '38_1320662868782.jpg', null, null);
INSERT INTO user_news VALUES ('162', '67', '上传了1张照片', '3', '2011-11-07 18:47:51', null, '67_1320662871125.jpg', null, null);
INSERT INTO user_news VALUES ('163', '67', '上传了1张照片', '3', '2011-11-07 18:47:51', null, '67_1320662871391.jpg', null, null);
INSERT INTO user_news VALUES ('164', '38', '上传了1张照片', '3', '2011-11-08 13:59:31', null, '38_1320731971803.jpg', null, null);
INSERT INTO user_news VALUES ('165', '38', '上传了1张照片', '3', '2011-11-08 13:59:32', null, '38_1320731972210.jpg', null, null);
INSERT INTO user_news VALUES ('166', '38', '上传了1张照片', '3', '2011-11-08 17:45:29', null, '38_1320745529692.jpg', null, null);
INSERT INTO user_news VALUES ('167', '38', '上传了1张照片', '3', '2011-11-08 18:41:06', null, '38_1320748866738.jpg', null, null);
INSERT INTO user_news VALUES ('168', '38', '上传了1张照片', '3', '2011-11-09 17:30:29', null, '38_1320831029589.jpg', null, null);
INSERT INTO user_news VALUES ('169', '38', '上传了1张照片', '3', '2011-11-09 17:31:08', null, '38_1320831068823.jpg', null, null);
INSERT INTO user_news VALUES ('170', '38', '上传了1张照片', '3', '2011-11-09 17:33:14', null, '38_1320831194932.jpg', null, null);
INSERT INTO user_news VALUES ('171', '38', '上传了1张照片', '3', '2011-11-09 17:33:51', null, '38_1320831231416.jpg', null, null);
INSERT INTO user_news VALUES ('172', '38', '上传了1张照片', '3', '2011-11-09 17:37:42', null, '38_1320831462070.jpg', null, null);
INSERT INTO user_news VALUES ('173', '38', '上传了1张照片', '3', '2011-11-09 17:48:44', null, '38_1320832124577.jpg', null, null);
INSERT INTO user_news VALUES ('174', '38', '上传了1张照片', '3', '2011-11-09 17:49:34', null, '38_1320832174139.jpg', null, null);
INSERT INTO user_news VALUES ('175', '38', '上传了1张照片', '3', '2011-11-09 17:53:31', null, '38_1320832411761.jpg', null, null);
INSERT INTO user_news VALUES ('176', '38', '上传了1张照片', '3', '2011-11-11 17:23:16', null, '38_1321003396824.jpg', null, null);
INSERT INTO user_news VALUES ('177', '38', '上传了1张照片', '3', '2011-11-11 17:24:53', null, '38_1321003493198.jpg', null, null);
INSERT INTO user_news VALUES ('178', '38', '上传了1张照片', '3', '2011-11-11 17:25:10', null, '38_1321003510104.jpg', null, null);
INSERT INTO user_news VALUES ('179', '38', '上传了1张照片', '3', '2011-11-11 17:26:05', null, '38_1321003565041.jpg', null, null);
INSERT INTO user_news VALUES ('180', '38', '上传了1张照片', '3', '2011-11-11 17:26:22', null, '38_1321003582056.jpg', null, null);
INSERT INTO user_news VALUES ('181', '38', '上传了1张照片', '3', '2011-11-11 17:26:22', null, '38_1321003582306.jpg', null, null);
INSERT INTO user_news VALUES ('182', '38', '上传了1张照片', '3', '2011-11-11 17:26:22', null, '38_1321003582603.jpg', null, null);
INSERT INTO user_news VALUES ('183', '38', '上传了1张照片', '3', '2011-11-11 17:26:38', null, '38_1321003598400.jpg', null, null);
INSERT INTO user_news VALUES ('184', '38', '上传了1张照片', '3', '2011-11-11 18:02:31', null, '38_1321005750825.jpg', null, null);
INSERT INTO user_news VALUES ('185', '38', '上传了1张照片', '3', '2011-11-11 18:07:53', null, '38_1321006073634.jpg', null, null);
INSERT INTO user_news VALUES ('186', '38', 'wanghui2', '5', '2011-11-21 18:43:25', null, null, '2', null);
INSERT INTO user_news VALUES ('187', '38', 'sxd', '5', '2011-11-21 18:45:58', null, null, '66', null);
INSERT INTO user_news VALUES ('188', '38', '上传了1张照片', '3', '2011-11-21 18:56:01', null, '38_1321872961322.png', null, null);
INSERT INTO user_news VALUES ('189', '38', '上传了1张照片', '3', '2011-11-21 18:56:23', null, '38_1321872983181.jpg', null, null);
INSERT INTO user_news VALUES ('190', '38', '上传了1张照片', '3', '2011-11-21 18:57:16', null, '38_1321873036853.jpg', null, null);
INSERT INTO user_news VALUES ('191', '38', '上传了1张照片', '3', '2011-11-21 18:57:17', null, '38_1321873037228.jpg', null, null);
INSERT INTO user_news VALUES ('192', '38', '上传了1张照片', '3', '2011-11-21 18:57:17', null, '38_1321873037447.jpg', null, null);
INSERT INTO user_news VALUES ('193', '38', '上传了1张照片', '3', '2011-11-21 18:57:17', null, '38_1321873037790.jpg', null, null);
INSERT INTO user_news VALUES ('194', '38', '上传了1张照片', '3', '2011-11-21 18:57:18', null, '38_1321873038040.jpg', null, null);
INSERT INTO user_news VALUES ('195', '38', '上传了1张照片', '3', '2011-11-21 19:02:29', null, '38_1321873349744.jpg', null, null);
INSERT INTO user_news VALUES ('196', '67', '上传了1张照片', '3', '2011-11-21 19:06:35', null, '67_1321873595306.jpg', null, null);
INSERT INTO user_news VALUES ('197', '67', '上传了1张照片', '3', '2011-11-21 19:06:35', null, '67_1321873595572.jpg', null, null);
INSERT INTO user_news VALUES ('198', '67', '上传了1张照片', '3', '2011-11-21 19:06:35', null, '67_1321873595744.jpg', null, null);
INSERT INTO user_news VALUES ('199', '67', '上传了1张照片', '3', '2011-11-21 19:06:35', null, '67_1321873595947.jpg', null, null);
INSERT INTO user_news VALUES ('200', '67', '上传了1张照片', '3', '2011-11-21 19:06:36', null, '67_1321873596556.jpg', null, null);
INSERT INTO user_news VALUES ('201', '67', '上传了1张照片', '3', '2011-11-21 19:06:36', null, '67_1321873596744.jpg', null, null);
INSERT INTO user_news VALUES ('202', '38', '包你满意', '7', '2011-11-24 18:31:33', '8', null, null, null);
INSERT INTO user_news VALUES ('203', '67', '包你满意', '7', '2011-11-24 18:31:57', '9', null, null, null);
INSERT INTO user_news VALUES ('204', '67', '陪玩三天', '7', '2011-11-24 18:41:11', '10', null, null, null);
INSERT INTO user_news VALUES ('205', '67', '最新求保养', '7', '2011-11-24 18:42:41', '11', null, null, null);
INSERT INTO user_news VALUES ('206', '67', '陪玩', '7', '2011-11-24 18:45:20', '12', null, null, null);
INSERT INTO user_news VALUES ('207', '67', '125', '7', '2011-11-24 18:46:11', '13', null, null, null);
INSERT INTO user_news VALUES ('208', '67', '123', '7', '2011-11-24 18:48:01', '14', null, null, null);
INSERT INTO user_news VALUES ('209', '38', '123', '8', '2011-11-24 18:49:08', '14', null, null, null);
INSERT INTO user_news VALUES ('210', '38', '123', '7', '2011-11-24 18:49:27', '15', null, null, null);
INSERT INTO user_news VALUES ('211', '38', '124', '7', '2011-11-24 18:49:39', '16', null, null, null);
INSERT INTO user_news VALUES ('212', '38', '123', '9', '2011-11-24 18:51:51', '14', null, null, null);
INSERT INTO user_news VALUES ('213', '67', '124', '8', '2011-11-24 18:56:58', '16', null, null, null);
INSERT INTO user_news VALUES ('214', '67', '加速大神', '5', '2011-11-24 18:59:29', null, null, '36', null);
INSERT INTO user_news VALUES ('215', '67', '124', '9', '2011-11-25 16:35:52', '16', null, null, null);
INSERT INTO user_news VALUES ('216', '36', '125', '8', '2011-11-25 16:54:50', '13', null, null, null);
INSERT INTO user_news VALUES ('217', '94', '包养我吧', '8', '2011-11-25 17:15:10', '6', null, null, null);
INSERT INTO user_news VALUES ('218', '94', '包养我吧', '8', '2011-11-25 17:16:45', '6', null, null, null);
INSERT INTO user_news VALUES ('219', '94', '包养我吧', '9', '2011-11-25 17:18:53', '6', null, null, null);
INSERT INTO user_news VALUES ('220', '38', '5555', '7', '2011-11-28 18:59:00', '17', null, null, null);
INSERT INTO user_news VALUES ('221', '67', '5555', '8', '2011-11-28 18:59:20', '17', null, null, null);
INSERT INTO user_news VALUES ('222', '67', '5555', '9', '2011-11-28 18:59:41', '17', null, null, null);
INSERT INTO user_news VALUES ('223', '38', '上传了1张照片', '3', '2011-11-28 19:53:14', null, '38_1322481194623.jpg', null, null);
INSERT INTO user_news VALUES ('224', '38', '上传了1张照片', '3', '2011-11-28 19:53:14', null, '38_1322481194951.jpg', null, null);
INSERT INTO user_news VALUES ('225', '67', '上传了1张照片', '3', '2011-11-28 19:54:21', null, '67_1322481261201.jpg', null, null);
INSERT INTO user_news VALUES ('226', '67', '上传了1张照片', '3', '2011-11-28 19:54:36', null, '67_1322481276154.jpg', null, null);
INSERT INTO user_news VALUES ('227', '67', '上传了1张照片', '3', '2011-11-28 19:54:36', null, '67_1322481276357.jpg', null, null);
INSERT INTO user_news VALUES ('228', '95', '上传了1张照片', '3', '2011-11-28 19:57:01', null, '95_1322481421638.jpg', null, null);
INSERT INTO user_news VALUES ('229', '95', '上传了1张照片', '3', '2011-11-28 19:57:01', null, '95_1322481421841.jpg', null, null);
INSERT INTO user_news VALUES ('230', '96', '上传了1张照片', '3', '2011-11-29 17:36:32', null, '96_1322559391993.jpg', null, null);
INSERT INTO user_news VALUES ('231', '68', '可以利用空余时间陪玩兵王游戏', '7', '2011-11-29 18:18:19', '18', null, null, null);
INSERT INTO user_news VALUES ('232', '38', '可以利用空余时间陪玩兵王游戏', '8', '2011-11-29 19:25:15', '18', null, null, null);
INSERT INTO user_news VALUES ('233', '38', '上传了1张照片', '3', '2011-11-29 19:52:10', null, '38_1322567530634.jpg', null, null);
INSERT INTO user_news VALUES ('234', '14', '上传了1张照片', '3', '2011-11-29 19:53:34', null, '14_1322567614822.jpg', null, null);

-- ----------------------------
-- Table structure for `user_notice`
-- ----------------------------
DROP TABLE IF EXISTS `user_notice`;
CREATE TABLE `user_notice` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `notice_type` int(11) NOT NULL default '0',
  `ref_id` int(11) default NULL,
  `ref_title` varchar(100) default NULL,
  `is_read` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_notice_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_notice
-- ----------------------------
INSERT INTO user_notice VALUES ('3', '38', '1', null, '要注意和工作平衡好啊，游戏只是一个娱乐而已', '7');
INSERT INTO user_notice VALUES ('4', '16', '0', null, null, '0');
INSERT INTO user_notice VALUES ('5', '7', '1', '884', '要注意和工作平衡好啊，游戏只是一个娱乐而已', '0');
INSERT INTO user_notice VALUES ('6', '19', '0', null, null, '10');
INSERT INTO user_notice VALUES ('7', '19', '1', '916', '1', '0');
INSERT INTO user_notice VALUES ('8', '1', '0', null, null, '3');
INSERT INTO user_notice VALUES ('9', '20', '0', null, null, '0');
INSERT INTO user_notice VALUES ('10', '19', '1', '929', '1111', '0');
INSERT INTO user_notice VALUES ('11', '19', '1', '945', '111111111111111111111111111111', '0');
INSERT INTO user_notice VALUES ('12', '19', '1', '946', '测试订阅数量', '0');
INSERT INTO user_notice VALUES ('13', '24', '0', null, null, '1');
INSERT INTO user_notice VALUES ('14', '19', '1', '956', '111', '0');
INSERT INTO user_notice VALUES ('16', '19', '1', '958', '111', '0');
INSERT INTO user_notice VALUES ('17', '31', '0', null, null, '1');
INSERT INTO user_notice VALUES ('18', '4', '0', null, null, '0');
INSERT INTO user_notice VALUES ('19', '19', '1', '1212', '111111', '0');
INSERT INTO user_notice VALUES ('20', '65', '0', null, null, '4');

-- ----------------------------
-- Table structure for `user_picture`
-- ----------------------------
DROP TABLE IF EXISTS `user_picture`;
CREATE TABLE `user_picture` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `picture_path` varchar(50) default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_picture_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_picture
-- ----------------------------
INSERT INTO user_picture VALUES ('1', '38', '38_1320325171080.jpg', null);
INSERT INTO user_picture VALUES ('2', '38', '38_1320325171408.jpg', null);
INSERT INTO user_picture VALUES ('3', '38', '38_1320325464826.jpg', null);
INSERT INTO user_picture VALUES ('4', '38', '38_1320325691386.jpg', null);
INSERT INTO user_picture VALUES ('5', '38', '38_1320325865993.jpg', null);
INSERT INTO user_picture VALUES ('6', '67', '67_1320400159914.jpg', null);
INSERT INTO user_picture VALUES ('7', '38', '38_1320657112058.jpg', null);
INSERT INTO user_picture VALUES ('8', '38', '38_1320657231041.jpg', null);
INSERT INTO user_picture VALUES ('9', '38', '38_1320657231323.jpg', null);
INSERT INTO user_picture VALUES ('10', '38', '38_1320662868782.jpg', null);
INSERT INTO user_picture VALUES ('11', '67', '67_1320662871125.jpg', null);
INSERT INTO user_picture VALUES ('12', '67', '67_1320662871391.jpg', null);
INSERT INTO user_picture VALUES ('13', '38', '38_1320731971803.jpg', null);
INSERT INTO user_picture VALUES ('14', '38', '38_1320731972210.jpg', null);
INSERT INTO user_picture VALUES ('15', '38', '38_1320745529692.jpg', null);
INSERT INTO user_picture VALUES ('16', '38', '38_1320748866738.jpg', null);
INSERT INTO user_picture VALUES ('17', '38', '38_1320831029589.jpg', null);
INSERT INTO user_picture VALUES ('18', '38', '38_1320831068823.jpg', null);
INSERT INTO user_picture VALUES ('19', '38', '38_1320831194932.jpg', null);
INSERT INTO user_picture VALUES ('20', '38', '38_1320831231416.jpg', null);
INSERT INTO user_picture VALUES ('21', '38', '38_1320831462070.jpg', null);
INSERT INTO user_picture VALUES ('22', '38', '38_1320832124577.jpg', null);
INSERT INTO user_picture VALUES ('23', '38', '38_1320832174139.jpg', null);
INSERT INTO user_picture VALUES ('24', '38', '38_1320832411761.jpg', null);
INSERT INTO user_picture VALUES ('25', '38', '38_1321003396824.jpg', null);
INSERT INTO user_picture VALUES ('26', '38', '38_1321003493198.jpg', null);
INSERT INTO user_picture VALUES ('27', '38', '38_1321003510104.jpg', null);
INSERT INTO user_picture VALUES ('28', '38', '38_1321003565041.jpg', null);
INSERT INTO user_picture VALUES ('29', '38', '38_1321003582056.jpg', null);
INSERT INTO user_picture VALUES ('30', '38', '38_1321003582306.jpg', null);
INSERT INTO user_picture VALUES ('31', '38', '38_1321003582603.jpg', null);
INSERT INTO user_picture VALUES ('32', '38', '38_1321003598400.jpg', null);
INSERT INTO user_picture VALUES ('33', '38', '38_1321005750825.jpg', null);
INSERT INTO user_picture VALUES ('34', '38', '38_1321006073634.jpg', null);
INSERT INTO user_picture VALUES ('35', '38', '38_1321872961322.png', null);
INSERT INTO user_picture VALUES ('36', '38', '38_1321872983181.jpg', null);
INSERT INTO user_picture VALUES ('37', '38', '38_1321873036853.jpg', null);
INSERT INTO user_picture VALUES ('38', '38', '38_1321873037228.jpg', null);
INSERT INTO user_picture VALUES ('39', '38', '38_1321873037447.jpg', null);
INSERT INTO user_picture VALUES ('40', '38', '38_1321873037790.jpg', null);
INSERT INTO user_picture VALUES ('41', '38', '38_1321873038040.jpg', null);
INSERT INTO user_picture VALUES ('42', '38', '38_1321873349744.jpg', null);
INSERT INTO user_picture VALUES ('43', '67', '67_1321873595306.jpg', null);
INSERT INTO user_picture VALUES ('44', '67', '67_1321873595572.jpg', null);
INSERT INTO user_picture VALUES ('45', '67', '67_1321873595744.jpg', null);
INSERT INTO user_picture VALUES ('46', '67', '67_1321873595947.jpg', null);
INSERT INTO user_picture VALUES ('47', '67', '67_1321873596556.jpg', null);
INSERT INTO user_picture VALUES ('48', '67', '67_1321873596744.jpg', null);
INSERT INTO user_picture VALUES ('49', '38', '38_1322481194623.jpg', null);
INSERT INTO user_picture VALUES ('50', '38', '38_1322481194951.jpg', null);
INSERT INTO user_picture VALUES ('51', '67', '67_1322481261201.jpg', null);
INSERT INTO user_picture VALUES ('52', '67', '67_1322481276154.jpg', null);
INSERT INTO user_picture VALUES ('53', '67', '67_1322481276357.jpg', null);
INSERT INTO user_picture VALUES ('54', '95', '95_1322481421638.jpg', null);
INSERT INTO user_picture VALUES ('55', '95', '95_1322481421841.jpg', null);
INSERT INTO user_picture VALUES ('56', '96', '96_1322559391993.jpg', null);
INSERT INTO user_picture VALUES ('57', '38', '38_1322567530634.jpg', null);
INSERT INTO user_picture VALUES ('58', '14', '14_1322567614822.jpg', null);

-- ----------------------------
-- Table structure for `user_record_video`
-- ----------------------------
DROP TABLE IF EXISTS `user_record_video`;
CREATE TABLE `user_record_video` (
  `id` int(11) NOT NULL auto_increment,
  `file_name` varchar(200) character set utf8 default NULL,
  `user_id` int(11) default NULL,
  `add_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_record_video
-- ----------------------------

-- ----------------------------
-- Table structure for `user_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_score_log`;
CREATE TABLE `user_score_log` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `score` float(4,1) default NULL,
  `user_photo` varchar(80) default NULL,
  `scorer` int(11) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_score_log
-- ----------------------------
INSERT INTO user_score_log VALUES ('1', '38', '6.0', null, '38', '2011-11-04 16:00:46');
INSERT INTO user_score_log VALUES ('2', '10', '7.0', null, '38', '2011-11-04 16:03:20');
INSERT INTO user_score_log VALUES ('3', '10', '6.0', null, '38', '2011-11-04 16:04:23');
INSERT INTO user_score_log VALUES ('4', '5', '7.0', null, '38', '2011-11-04 17:06:10');
INSERT INTO user_score_log VALUES ('5', '38', '6.0', null, '38', '2011-11-04 17:11:47');
INSERT INTO user_score_log VALUES ('6', '38', '7.0', null, '38', '2011-11-04 17:15:02');
INSERT INTO user_score_log VALUES ('7', '80', '6.0', null, '38', '2011-11-04 17:18:05');
INSERT INTO user_score_log VALUES ('8', '38', '6.0', null, '38', '2011-11-04 17:27:13');
INSERT INTO user_score_log VALUES ('9', '67', '6.0', null, '38', '2011-11-04 17:28:12');
INSERT INTO user_score_log VALUES ('10', '38', '5.0', null, '38', '2011-11-04 17:31:56');
INSERT INTO user_score_log VALUES ('11', '37', '7.0', null, '38', '2011-11-04 17:32:05');
INSERT INTO user_score_log VALUES ('12', '29', '7.0', null, '38', '2011-11-04 17:32:13');
INSERT INTO user_score_log VALUES ('13', '36', '7.0', null, '38', '2011-11-04 17:32:21');
INSERT INTO user_score_log VALUES ('14', '38', '6.0', null, '38', '2011-11-04 17:36:52');
INSERT INTO user_score_log VALUES ('15', '38', '5.0', null, '38', '2011-11-04 17:36:58');
INSERT INTO user_score_log VALUES ('16', '38', '5.0', null, '38', '2011-11-04 17:37:19');
INSERT INTO user_score_log VALUES ('17', '38', '9.0', null, '38', '2011-11-04 17:37:24');
INSERT INTO user_score_log VALUES ('18', '81', '6.0', null, '38', '2011-11-04 17:41:35');
INSERT INTO user_score_log VALUES ('19', '38', '4.0', null, '38', '2011-11-04 17:44:20');
INSERT INTO user_score_log VALUES ('20', '38', '7.0', null, '38', '2011-11-04 17:44:22');
INSERT INTO user_score_log VALUES ('21', '63', '6.0', null, '38', '2011-11-04 17:47:08');
INSERT INTO user_score_log VALUES ('22', '67', '6.0', null, '67', '2011-11-04 17:49:49');
INSERT INTO user_score_log VALUES ('23', '67', '5.0', null, '67', '2011-11-04 17:50:15');
INSERT INTO user_score_log VALUES ('24', '39', '6.0', null, '67', '2011-11-04 17:50:26');
INSERT INTO user_score_log VALUES ('25', '38', '7.0', null, '38', '2011-11-04 17:53:55');
INSERT INTO user_score_log VALUES ('26', '67', '7.0', null, '38', '2011-11-04 17:53:58');
INSERT INTO user_score_log VALUES ('27', '67', '6.0', null, '38', '2011-11-04 17:54:00');
INSERT INTO user_score_log VALUES ('28', '38', '9.0', null, '38', '2011-11-04 17:54:04');
INSERT INTO user_score_log VALUES ('29', '38', '7.0', null, '38', '2011-11-04 17:54:07');
INSERT INTO user_score_log VALUES ('30', '27', '6.0', null, '38', '2011-11-04 17:55:11');
INSERT INTO user_score_log VALUES ('31', '67', '9.0', null, '67', '2011-11-04 17:55:27');
INSERT INTO user_score_log VALUES ('32', '67', '7.0', null, '38', '2011-11-04 17:56:23');
INSERT INTO user_score_log VALUES ('33', '86', '4.0', null, '67', '2011-11-04 17:57:59');
INSERT INTO user_score_log VALUES ('34', '67', '6.0', null, '67', '2011-11-04 17:58:43');
INSERT INTO user_score_log VALUES ('35', '67', '8.0', null, '67', '2011-11-04 17:58:50');
INSERT INTO user_score_log VALUES ('36', '38', '7.0', null, '67', '2011-11-04 17:59:01');
INSERT INTO user_score_log VALUES ('37', '67', '7.0', null, '67', '2011-11-04 17:59:07');
INSERT INTO user_score_log VALUES ('38', '38', '6.0', null, '67', '2011-11-04 17:59:10');
INSERT INTO user_score_log VALUES ('39', '38', '8.0', null, '67', '2011-11-04 17:59:13');
INSERT INTO user_score_log VALUES ('40', '8', '7.0', null, '67', '2011-11-04 17:59:21');
INSERT INTO user_score_log VALUES ('41', '67', '4.0', null, '67', '2011-11-04 17:59:41');
INSERT INTO user_score_log VALUES ('42', '67', '6.0', null, '67', '2011-11-04 17:59:44');
INSERT INTO user_score_log VALUES ('43', '67', '4.0', null, '67', '2011-11-04 17:59:48');
INSERT INTO user_score_log VALUES ('44', '67', '9.0', null, '67', '2011-11-04 17:59:50');
INSERT INTO user_score_log VALUES ('45', '38', '8.0', null, '67', '2011-11-04 17:59:56');
INSERT INTO user_score_log VALUES ('46', '67', '5.0', null, '67', '2011-11-04 18:00:01');
INSERT INTO user_score_log VALUES ('47', '38', '2.0', null, '67', '2011-11-04 18:00:04');
INSERT INTO user_score_log VALUES ('48', '67', '7.0', null, '67', '2011-11-04 18:00:07');
INSERT INTO user_score_log VALUES ('49', '38', '5.0', null, '67', '2011-11-04 18:00:09');
INSERT INTO user_score_log VALUES ('50', '38', '6.0', null, '67', '2011-11-04 18:00:13');
INSERT INTO user_score_log VALUES ('51', '38', '5.0', null, '67', '2011-11-04 18:00:16');
INSERT INTO user_score_log VALUES ('52', '67', '4.0', null, '67', '2011-11-04 18:00:22');
INSERT INTO user_score_log VALUES ('53', '67', '5.0', null, '67', '2011-11-04 18:00:24');
INSERT INTO user_score_log VALUES ('54', '67', '7.0', null, '67', '2011-11-04 18:00:35');
INSERT INTO user_score_log VALUES ('55', '67', '9.0', null, '67', '2011-11-04 18:00:38');
INSERT INTO user_score_log VALUES ('56', '67', '7.0', null, '67', '2011-11-04 18:00:40');
INSERT INTO user_score_log VALUES ('57', '38', '5.0', null, '67', '2011-11-04 18:00:43');
INSERT INTO user_score_log VALUES ('58', '67', '7.0', null, '67', '2011-11-04 18:00:46');
INSERT INTO user_score_log VALUES ('59', '38', '6.0', null, '67', '2011-11-04 18:00:48');
INSERT INTO user_score_log VALUES ('60', '67', '4.0', null, '67', '2011-11-04 18:00:51');
INSERT INTO user_score_log VALUES ('61', '38', '5.0', null, '67', '2011-11-04 18:00:53');
INSERT INTO user_score_log VALUES ('62', '38', '5.0', null, '67', '2011-11-04 18:00:56');
INSERT INTO user_score_log VALUES ('63', '67', '3.0', null, '67', '2011-11-04 18:00:59');
INSERT INTO user_score_log VALUES ('64', '67', '7.0', null, '67', '2011-11-04 18:01:01');
INSERT INTO user_score_log VALUES ('65', '67', '9.0', null, '67', '2011-11-04 18:01:04');
INSERT INTO user_score_log VALUES ('66', '38', '6.0', null, '38', '2011-11-04 18:03:45');
INSERT INTO user_score_log VALUES ('67', '38', '6.0', null, '38', '2011-11-04 18:03:54');
INSERT INTO user_score_log VALUES ('68', '67', '5.0', null, '38', '2011-11-04 18:04:27');
INSERT INTO user_score_log VALUES ('69', '38', '6.0', null, '38', '2011-11-04 18:05:23');
INSERT INTO user_score_log VALUES ('70', '39', '7.0', null, '38', '2011-11-04 18:05:47');
INSERT INTO user_score_log VALUES ('71', '38', '5.5', null, '38', '2011-11-04 18:06:18');
INSERT INTO user_score_log VALUES ('72', '38', '8.0', null, '38', '2011-11-04 18:06:21');
INSERT INTO user_score_log VALUES ('73', '38', '8.5', null, '38', '2011-11-04 18:06:23');
INSERT INTO user_score_log VALUES ('74', '67', '8.5', null, '38', '2011-11-04 18:06:28');
INSERT INTO user_score_log VALUES ('75', '67', '7.0', null, '38', '2011-11-04 18:06:33');
INSERT INTO user_score_log VALUES ('76', '67', '6.5', null, '38', '2011-11-04 18:06:35');
INSERT INTO user_score_log VALUES ('77', '38', '9.0', null, '38', '2011-11-04 18:06:49');
INSERT INTO user_score_log VALUES ('78', '38', '9.5', null, '38', '2011-11-04 18:08:41');
INSERT INTO user_score_log VALUES ('79', '38', '9.0', null, '38', '2011-11-04 18:09:07');
INSERT INTO user_score_log VALUES ('80', '67', '9.5', null, '38', '2011-11-04 18:09:10');
INSERT INTO user_score_log VALUES ('81', '38', '6.5', null, '38', '2011-11-04 19:22:13');
INSERT INTO user_score_log VALUES ('82', '38', '8.0', null, '38', '2011-11-04 19:22:18');
INSERT INTO user_score_log VALUES ('83', '38', '8.5', null, '38', '2011-11-04 19:22:47');
INSERT INTO user_score_log VALUES ('84', '38', '2.0', null, '67', '2011-11-04 19:33:57');
INSERT INTO user_score_log VALUES ('85', '38', '7.0', null, '67', '2011-11-04 19:34:01');
INSERT INTO user_score_log VALUES ('86', '67', '7.0', null, '67', '2011-11-04 19:34:05');
INSERT INTO user_score_log VALUES ('87', '38', '5.0', null, '67', '2011-11-04 19:34:08');
INSERT INTO user_score_log VALUES ('88', '38', '7.0', null, '67', '2011-11-04 19:34:12');
INSERT INTO user_score_log VALUES ('89', '67', '3.5', null, '67', '2011-11-04 19:34:15');
INSERT INTO user_score_log VALUES ('90', '67', '2.0', null, '67', '2011-11-04 19:34:18');
INSERT INTO user_score_log VALUES ('91', '38', '1.5', null, '67', '2011-11-04 19:34:21');
INSERT INTO user_score_log VALUES ('92', '38', '1.0', null, '67', '2011-11-04 19:34:26');
INSERT INTO user_score_log VALUES ('93', '67', '2.0', null, '67', '2011-11-04 19:34:29');
INSERT INTO user_score_log VALUES ('94', '38', '2.0', null, '67', '2011-11-04 19:34:32');
INSERT INTO user_score_log VALUES ('95', '38', '2.0', null, '67', '2011-11-04 19:34:35');
INSERT INTO user_score_log VALUES ('96', '67', '5.0', null, '67', '2011-11-04 19:34:38');
INSERT INTO user_score_log VALUES ('97', '38', '5.0', null, '67', '2011-11-04 19:34:41');
INSERT INTO user_score_log VALUES ('98', '67', '5.0', null, '67', '2011-11-04 19:34:49');
INSERT INTO user_score_log VALUES ('99', '38', '7.5', null, '38', '2011-11-07 10:26:07');
INSERT INTO user_score_log VALUES ('100', '67', '9.5', null, '38', '2011-11-07 10:26:12');
INSERT INTO user_score_log VALUES ('101', '2', '6.5', null, '38', '2011-11-07 15:55:34');
INSERT INTO user_score_log VALUES ('102', '38', '8.5', null, '38', '2011-11-07 15:55:38');
INSERT INTO user_score_log VALUES ('103', '38', '7.5', null, '38', '2011-11-07 15:56:52');
INSERT INTO user_score_log VALUES ('104', '67', '8.5', null, '38', '2011-11-07 15:56:55');
INSERT INTO user_score_log VALUES ('105', '82', '7.5', null, '38', '2011-11-07 17:24:13');
INSERT INTO user_score_log VALUES ('106', '38', '10.0', null, '67', '2011-11-07 18:50:06');
INSERT INTO user_score_log VALUES ('107', '67', '8.5', null, '38', '2011-11-07 18:50:34');
INSERT INTO user_score_log VALUES ('108', '38', '9.0', null, '38', '2011-11-07 19:03:31');
INSERT INTO user_score_log VALUES ('109', '36', '5.0', null, '36', '2011-11-07 19:36:45');
INSERT INTO user_score_log VALUES ('110', '67', '2.5', null, '36', '2011-11-07 19:37:03');
INSERT INTO user_score_log VALUES ('111', '38', '5.0', null, '36', '2011-11-07 19:37:07');
INSERT INTO user_score_log VALUES ('112', '67', '7.5', null, '36', '2011-11-07 19:37:10');
INSERT INTO user_score_log VALUES ('113', '67', '6.5', null, '36', '2011-11-07 19:37:15');
INSERT INTO user_score_log VALUES ('114', '38', '3.0', null, '36', '2011-11-07 19:37:55');
INSERT INTO user_score_log VALUES ('115', '38', '9.5', null, '36', '2011-11-07 19:37:59');
INSERT INTO user_score_log VALUES ('116', '38', '10.0', null, '36', '2011-11-07 19:38:02');
INSERT INTO user_score_log VALUES ('117', '36', '3.5', null, '36', '2011-11-07 19:38:34');
INSERT INTO user_score_log VALUES ('118', '67', '7.0', null, '36', '2011-11-07 19:38:38');
INSERT INTO user_score_log VALUES ('119', '38', '5.0', null, '36', '2011-11-07 19:39:20');
INSERT INTO user_score_log VALUES ('120', '67', '7.5', null, '36', '2011-11-07 19:39:23');
INSERT INTO user_score_log VALUES ('121', '38', '10.0', null, '36', '2011-11-07 19:39:33');
INSERT INTO user_score_log VALUES ('122', '67', '2.5', null, '36', '2011-11-07 19:39:51');
INSERT INTO user_score_log VALUES ('123', '67', '5.0', null, '36', '2011-11-07 19:39:54');
INSERT INTO user_score_log VALUES ('124', '67', '5.5', null, '36', '2011-11-07 19:39:57');
INSERT INTO user_score_log VALUES ('125', '38', '8.5', null, '36', '2011-11-07 19:40:10');
INSERT INTO user_score_log VALUES ('126', '38', '7.0', null, '36', '2011-11-07 19:40:28');
INSERT INTO user_score_log VALUES ('127', '67', '7.0', null, '38', '2011-11-07 19:40:30');
INSERT INTO user_score_log VALUES ('128', '67', '8.5', null, '38', '2011-11-07 19:40:33');
INSERT INTO user_score_log VALUES ('129', '67', '4.0', null, '36', '2011-11-07 19:40:43');
INSERT INTO user_score_log VALUES ('130', '38', '4.5', null, '36', '2011-11-07 19:40:48');
INSERT INTO user_score_log VALUES ('131', '38', '3.5', null, '36', '2011-11-07 19:40:53');
INSERT INTO user_score_log VALUES ('132', '67', '8.5', null, '38', '2011-11-09 18:39:35');
INSERT INTO user_score_log VALUES ('133', '82', '9.0', null, '38', '2011-11-09 18:40:49');
INSERT INTO user_score_log VALUES ('134', '67', '8.5', null, '38', '2011-11-09 18:40:52');
INSERT INTO user_score_log VALUES ('135', '67', '7.5', null, '38', '2011-11-09 18:40:56');
INSERT INTO user_score_log VALUES ('136', '38', '9.0', null, '38', '2011-11-11 18:07:30');
INSERT INTO user_score_log VALUES ('137', '67', '8.5', null, '38', '2011-11-11 18:07:33');
INSERT INTO user_score_log VALUES ('138', '2', '10.0', null, '38', '2011-11-23 17:48:05');
INSERT INTO user_score_log VALUES ('139', '67', '10.0', null, '38', '2011-11-23 17:48:20');
INSERT INTO user_score_log VALUES ('140', '10', '6.5', null, '38', '2011-11-23 19:00:57');
INSERT INTO user_score_log VALUES ('141', '38', '7.5', null, '38', '2011-11-23 19:01:00');
INSERT INTO user_score_log VALUES ('142', '67', '9.0', null, '38', '2011-11-23 19:01:05');
INSERT INTO user_score_log VALUES ('143', '38', '9.5', null, '38', '2011-11-23 19:01:08');
INSERT INTO user_score_log VALUES ('144', '38', '9.0', null, '38', '2011-11-23 19:01:11');
INSERT INTO user_score_log VALUES ('145', '67', '9.5', null, '38', '2011-11-23 19:01:14');
INSERT INTO user_score_log VALUES ('146', '38', '10.0', null, '38', '2011-11-23 19:01:17');
INSERT INTO user_score_log VALUES ('147', '67', '8.0', null, '38', '2011-11-23 19:01:21');
INSERT INTO user_score_log VALUES ('148', '67', '10.0', null, '38', '2011-11-23 19:01:25');
INSERT INTO user_score_log VALUES ('149', '38', '7.0', null, '36', '2011-11-24 17:37:12');
INSERT INTO user_score_log VALUES ('150', '38', '6.0', null, '36', '2011-11-24 17:37:18');
INSERT INTO user_score_log VALUES ('151', '38', '9.5', null, '67', '2011-11-24 18:54:22');
INSERT INTO user_score_log VALUES ('152', '38', '10.0', null, '67', '2011-11-24 18:54:25');
INSERT INTO user_score_log VALUES ('153', '67', '9.0', null, '67', '2011-11-24 18:54:28');
INSERT INTO user_score_log VALUES ('154', '67', '9.5', null, '67', '2011-11-24 18:54:44');
INSERT INTO user_score_log VALUES ('155', '67', '10.0', null, '67', '2011-11-24 18:54:53');
INSERT INTO user_score_log VALUES ('156', '29', '10.0', null, '67', '2011-11-24 18:57:36');
INSERT INTO user_score_log VALUES ('157', '38', '10.0', null, '67', '2011-11-24 18:57:40');
INSERT INTO user_score_log VALUES ('158', '67', '9.5', null, '67', '2011-11-24 18:57:43');
INSERT INTO user_score_log VALUES ('159', '67', '10.0', null, '67', '2011-11-24 19:02:52');
INSERT INTO user_score_log VALUES ('160', '38', '10.0', null, '67', '2011-11-25 21:13:43');
INSERT INTO user_score_log VALUES ('161', '82', '10.0', null, '38', '2011-11-28 12:37:04');
INSERT INTO user_score_log VALUES ('162', '38', '9.0', null, '38', '2011-11-28 12:38:27');
INSERT INTO user_score_log VALUES ('163', '67', '9.5', null, '38', '2011-11-28 12:38:32');
INSERT INTO user_score_log VALUES ('164', '38', '9.5', null, '38', '2011-11-28 12:38:34');
INSERT INTO user_score_log VALUES ('165', '38', '9.0', null, '38', '2011-11-29 19:32:49');
INSERT INTO user_score_log VALUES ('166', '67', '9.5', null, '38', '2011-11-29 19:32:52');
INSERT INTO user_score_log VALUES ('167', '38', '9.0', null, '38', '2011-11-29 19:33:07');
INSERT INTO user_score_log VALUES ('168', '67', '9.5', null, '38', '2011-11-29 19:33:09');
INSERT INTO user_score_log VALUES ('169', '96', '10.0', null, '38', '2011-11-29 19:33:12');
INSERT INTO user_score_log VALUES ('170', '96', '8.5', null, '38', '2011-11-29 19:33:15');
INSERT INTO user_score_log VALUES ('171', '96', '9.5', null, '38', '2011-11-29 19:33:17');
INSERT INTO user_score_log VALUES ('172', '38', '9.5', null, '38', '2011-11-29 19:33:22');
INSERT INTO user_score_log VALUES ('173', '14', '6.5', null, '14', '2011-11-29 19:54:45');
INSERT INTO user_score_log VALUES ('174', '95', '9.5', null, '38', '2011-11-29 20:08:18');
INSERT INTO user_score_log VALUES ('175', '96', '10.0', null, '38', '2011-11-29 20:08:20');
INSERT INTO user_score_log VALUES ('176', '14', '9.5', null, '38', '2011-11-29 20:08:24');
INSERT INTO user_score_log VALUES ('177', '14', '10.0', null, '38', '2011-11-29 20:08:27');
INSERT INTO user_score_log VALUES ('178', '95', '10.0', null, '38', '2011-11-29 20:08:29');
INSERT INTO user_score_log VALUES ('179', '96', '10.0', null, '38', '2011-11-29 20:08:31');
INSERT INTO user_score_log VALUES ('180', '14', '10.0', null, '38', '2011-11-29 20:08:35');
INSERT INTO user_score_log VALUES ('181', '96', '10.0', null, '38', '2011-11-29 20:08:36');
INSERT INTO user_score_log VALUES ('182', '14', '9.5', null, '38', '2011-11-29 20:08:39');
INSERT INTO user_score_log VALUES ('183', '67', '10.0', null, '38', '2011-11-29 20:08:41');
INSERT INTO user_score_log VALUES ('184', '96', '9.5', null, '38', '2011-11-29 20:08:51');
INSERT INTO user_score_log VALUES ('185', '38', '9.5', null, '38', '2011-11-29 20:09:31');
INSERT INTO user_score_log VALUES ('186', '95', '9.5', null, '38', '2011-11-29 20:09:35');
INSERT INTO user_score_log VALUES ('187', '96', '9.5', null, '38', '2011-11-29 20:09:38');
INSERT INTO user_score_log VALUES ('188', '14', '9.5', null, '38', '2011-11-29 20:09:57');
INSERT INTO user_score_log VALUES ('189', '35', '9.5', null, '38', '2011-11-29 20:10:46');

-- ----------------------------
-- Table structure for `user_stock`
-- ----------------------------
DROP TABLE IF EXISTS `user_stock`;
CREATE TABLE `user_stock` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `stock_list` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_stock_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_stock
-- ----------------------------

-- ----------------------------
-- Table structure for `user_tag`
-- ----------------------------
DROP TABLE IF EXISTS `user_tag`;
CREATE TABLE `user_tag` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `add_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `tag_id` (`tag_id`),
  KEY `ip_address` (`ip_address`),
  CONSTRAINT `user_tag_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_tag_fk1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `user_topic_sort`
-- ----------------------------
DROP TABLE IF EXISTS `user_topic_sort`;
CREATE TABLE `user_topic_sort` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `sort_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `sort_id` (`sort_id`),
  CONSTRAINT `user_topic_sort_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_topic_sort_fk1` FOREIGN KEY (`sort_id`) REFERENCES `topic_sort` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_topic_sort
-- ----------------------------
INSERT INTO user_topic_sort VALUES ('1', '7', '2');

-- ----------------------------
-- Table structure for `user_visit_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log` (
  `id` bigint(20) NOT NULL auto_increment,
  `owner` bigint(20) default NULL,
  `visits` int(11) default '0',
  `page` int(11) default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO user_visit_log VALUES ('1', '38', '5', '2', '2011-09-22');
INSERT INTO user_visit_log VALUES ('2', '1', '1', '2', '2011-09-22');
INSERT INTO user_visit_log VALUES ('3', '5', '1', '2', '2011-09-22');
INSERT INTO user_visit_log VALUES ('4', '38', '11', '2', '2011-09-23');
INSERT INTO user_visit_log VALUES ('5', '5', '1', '2', '2011-09-23');
INSERT INTO user_visit_log VALUES ('6', '2', '2', '2', '2011-09-23');
INSERT INTO user_visit_log VALUES ('7', '1', '4', '2', '2011-09-23');
INSERT INTO user_visit_log VALUES ('8', '3', '1', '2', '2011-09-23');
INSERT INTO user_visit_log VALUES ('9', '38', '14', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('10', '1', '2', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('11', '2', '1', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('12', '3', '1', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('13', '5', '1', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('14', '66', '3', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('15', '4', '1', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('16', '7', '1', '2', '2011-09-26');
INSERT INTO user_visit_log VALUES ('17', '66', '1', '2', '2011-09-27');
INSERT INTO user_visit_log VALUES ('18', '67', '4', '2', '2011-09-27');
INSERT INTO user_visit_log VALUES ('19', '1', '1', '2', '2011-09-27');
INSERT INTO user_visit_log VALUES ('20', '38', '5', '2', '2011-09-27');
INSERT INTO user_visit_log VALUES ('21', '76', '3', '2', '2011-09-27');
INSERT INTO user_visit_log VALUES ('22', '5', '1', '2', '2011-09-27');
INSERT INTO user_visit_log VALUES ('23', '38', '9', '2', '2011-09-28');
INSERT INTO user_visit_log VALUES ('24', '66', '1', '2', '2011-09-28');
INSERT INTO user_visit_log VALUES ('25', '38', '8', '2', '2011-09-29');
INSERT INTO user_visit_log VALUES ('26', '38', '8', '2', '2011-09-30');
INSERT INTO user_visit_log VALUES ('27', '67', '2', '2', '2011-09-30');
INSERT INTO user_visit_log VALUES ('28', '1', '1', '2', '2011-09-30');
INSERT INTO user_visit_log VALUES ('29', '66', '1', '2', '2011-10-08');
INSERT INTO user_visit_log VALUES ('30', '38', '3', '2', '2011-10-08');
INSERT INTO user_visit_log VALUES ('31', '36', '1', '2', '2011-10-08');
INSERT INTO user_visit_log VALUES ('32', '1', '1', '2', '2011-10-08');
INSERT INTO user_visit_log VALUES ('33', '38', '5', '2', '2011-10-09');
INSERT INTO user_visit_log VALUES ('34', '38', '6', '2', '2011-10-10');
INSERT INTO user_visit_log VALUES ('35', '36', '2', '2', '2011-10-10');
INSERT INTO user_visit_log VALUES ('36', '38', '5', '2', '2011-10-11');
INSERT INTO user_visit_log VALUES ('37', '38', '4', '2', '2011-10-12');
INSERT INTO user_visit_log VALUES ('38', '66', '1', '2', '2011-10-12');
INSERT INTO user_visit_log VALUES ('39', '67', '2', '2', '2011-10-13');
INSERT INTO user_visit_log VALUES ('40', '38', '3', '2', '2011-10-13');
INSERT INTO user_visit_log VALUES ('41', '76', '1', '2', '2011-10-13');
INSERT INTO user_visit_log VALUES ('42', '66', '1', '2', '2011-10-13');
INSERT INTO user_visit_log VALUES ('43', '38', '3', '2', '2011-10-14');
INSERT INTO user_visit_log VALUES ('44', '36', '5', '2', '2011-10-14');
INSERT INTO user_visit_log VALUES ('45', '66', '2', '2', '2011-10-14');
INSERT INTO user_visit_log VALUES ('46', '2', '1', '2', '2011-10-14');
INSERT INTO user_visit_log VALUES ('47', '66', '1', '2', '2011-10-17');
INSERT INTO user_visit_log VALUES ('48', '38', '2', '2', '2011-10-17');
INSERT INTO user_visit_log VALUES ('49', '36', '1', '2', '2011-10-17');
INSERT INTO user_visit_log VALUES ('50', '38', '4', '2', '2011-10-18');
INSERT INTO user_visit_log VALUES ('51', '83', '1', '2', '2011-10-18');
INSERT INTO user_visit_log VALUES ('52', '89', '8', '2', '2011-10-19');
INSERT INTO user_visit_log VALUES ('53', '66', '4', '2', '2011-10-19');
INSERT INTO user_visit_log VALUES ('54', '38', '5', '2', '2011-10-19');
INSERT INTO user_visit_log VALUES ('55', '66', '3', '2', '2011-10-20');
INSERT INTO user_visit_log VALUES ('56', '36', '3', '2', '2011-10-20');
INSERT INTO user_visit_log VALUES ('57', '38', '3', '2', '2011-10-20');
INSERT INTO user_visit_log VALUES ('58', '67', '1', '2', '2011-10-20');
INSERT INTO user_visit_log VALUES ('59', '38', '11', '2', '2011-10-21');
INSERT INTO user_visit_log VALUES ('60', '89', '11', '2', '2011-10-21');
INSERT INTO user_visit_log VALUES ('61', '67', '4', '2', '2011-10-21');
INSERT INTO user_visit_log VALUES ('62', '66', '11', '2', '2011-10-21');
INSERT INTO user_visit_log VALUES ('63', '1', '1', '2', '2011-10-21');
INSERT INTO user_visit_log VALUES ('64', '2', '1', '2', '2011-10-21');
INSERT INTO user_visit_log VALUES ('65', '38', '4', '2', '2011-10-24');
INSERT INTO user_visit_log VALUES ('66', '89', '2', '2', '2011-10-24');
INSERT INTO user_visit_log VALUES ('67', '36', '1', '2', '2011-10-24');
INSERT INTO user_visit_log VALUES ('68', '38', '3', '2', '2011-10-25');
INSERT INTO user_visit_log VALUES ('69', '66', '2', '2', '2011-10-25');
INSERT INTO user_visit_log VALUES ('70', '89', '3', '2', '2011-10-25');
INSERT INTO user_visit_log VALUES ('71', '36', '1', '2', '2011-10-25');
INSERT INTO user_visit_log VALUES ('72', '89', '1', '2', '2011-10-26');
INSERT INTO user_visit_log VALUES ('73', '66', '1', '2', '2011-10-27');
INSERT INTO user_visit_log VALUES ('74', '67', '1', '2', '2011-10-27');
INSERT INTO user_visit_log VALUES ('75', '38', '3', '2', '2011-10-28');
INSERT INTO user_visit_log VALUES ('76', '89', '5', '2', '2011-10-28');
INSERT INTO user_visit_log VALUES ('77', '66', '2', '2', '2011-10-28');
INSERT INTO user_visit_log VALUES ('78', '67', '2', '2', '2011-10-28');
INSERT INTO user_visit_log VALUES ('79', '38', '4', '2', '2011-11-01');
INSERT INTO user_visit_log VALUES ('80', '36', '2', '2', '2011-11-01');
INSERT INTO user_visit_log VALUES ('81', '89', '2', '2', '2011-11-01');
INSERT INTO user_visit_log VALUES ('82', '38', '1', '2', '2011-11-02');
INSERT INTO user_visit_log VALUES ('83', '66', '1', '2', '2011-11-02');
INSERT INTO user_visit_log VALUES ('84', '38', '2', '2', '2011-11-03');
INSERT INTO user_visit_log VALUES ('85', '38', '1', '2', '2011-11-04');
INSERT INTO user_visit_log VALUES ('86', '67', '1', '2', '2011-11-04');
INSERT INTO user_visit_log VALUES ('87', '38', '7', '2', '2011-11-07');
INSERT INTO user_visit_log VALUES ('88', '1', '2', '2', '2011-11-07');
INSERT INTO user_visit_log VALUES ('89', '89', '1', '2', '2011-11-07');
INSERT INTO user_visit_log VALUES ('90', '67', '4', '2', '2011-11-07');
INSERT INTO user_visit_log VALUES ('91', '66', '2', '2', '2011-11-07');
INSERT INTO user_visit_log VALUES ('92', '82', '1', '2', '2011-11-07');
INSERT INTO user_visit_log VALUES ('93', '36', '2', '2', '2011-11-07');
INSERT INTO user_visit_log VALUES ('94', '89', '1', '2', '2011-11-08');
INSERT INTO user_visit_log VALUES ('95', '36', '1', '2', '2011-11-09');
INSERT INTO user_visit_log VALUES ('96', '38', '2', '2', '2011-11-09');
INSERT INTO user_visit_log VALUES ('97', '89', '2', '2', '2011-11-11');
INSERT INTO user_visit_log VALUES ('98', '38', '1', '2', '2011-11-11');
INSERT INTO user_visit_log VALUES ('99', '89', '4', '2', '2011-11-14');
INSERT INTO user_visit_log VALUES ('100', '66', '2', '2', '2011-11-14');
INSERT INTO user_visit_log VALUES ('101', '38', '1', '2', '2011-11-14');
INSERT INTO user_visit_log VALUES ('102', '38', '9', '2', '2011-11-16');
INSERT INTO user_visit_log VALUES ('103', '67', '6', '2', '2011-11-16');
INSERT INTO user_visit_log VALUES ('104', '89', '2', '2', '2011-11-16');
INSERT INTO user_visit_log VALUES ('105', '38', '1', '2', '2011-11-17');
INSERT INTO user_visit_log VALUES ('106', '67', '1', '2', '2011-11-17');
INSERT INTO user_visit_log VALUES ('107', '38', '3', '2', '2011-11-21');
INSERT INTO user_visit_log VALUES ('108', '89', '2', '2', '2011-11-21');
INSERT INTO user_visit_log VALUES ('109', '66', '1', '2', '2011-11-21');
INSERT INTO user_visit_log VALUES ('110', '1', '1', '2', '2011-11-21');
INSERT INTO user_visit_log VALUES ('111', '67', '2', '2', '2011-11-21');
INSERT INTO user_visit_log VALUES ('112', '67', '2', '2', '2011-11-23');
INSERT INTO user_visit_log VALUES ('113', '66', '1', '2', '2011-11-23');
INSERT INTO user_visit_log VALUES ('114', '38', '4', '2', '2011-11-23');
INSERT INTO user_visit_log VALUES ('115', '89', '1', '2', '2011-11-23');
INSERT INTO user_visit_log VALUES ('116', '36', '1', '2', '2011-11-23');
INSERT INTO user_visit_log VALUES ('117', '38', '20', '2', '2011-11-24');
INSERT INTO user_visit_log VALUES ('118', '36', '13', '2', '2011-11-24');
INSERT INTO user_visit_log VALUES ('119', '93', '10', '2', '2011-11-24');
INSERT INTO user_visit_log VALUES ('120', '14', '8', '2', '2011-11-24');
INSERT INTO user_visit_log VALUES ('121', '67', '6', '2', '2011-11-24');
INSERT INTO user_visit_log VALUES ('122', '94', '20', '2', '2011-11-24');
INSERT INTO user_visit_log VALUES ('123', '67', '4', '2', '2011-11-25');
INSERT INTO user_visit_log VALUES ('124', '36', '1', '2', '2011-11-25');
INSERT INTO user_visit_log VALUES ('125', '38', '7', '2', '2011-11-25');
INSERT INTO user_visit_log VALUES ('126', '38', '2', '2', '2011-11-28');
INSERT INTO user_visit_log VALUES ('127', '36', '4', '2', '2011-11-28');
INSERT INTO user_visit_log VALUES ('128', '14', '1', '2', '2011-11-28');
INSERT INTO user_visit_log VALUES ('129', '67', '1', '2', '2011-11-28');
INSERT INTO user_visit_log VALUES ('130', '89', '1', '2', '2011-11-29');
INSERT INTO user_visit_log VALUES ('131', '36', '2', '2', '2011-11-29');
INSERT INTO user_visit_log VALUES ('132', '38', '3', '2', '2011-11-29');
