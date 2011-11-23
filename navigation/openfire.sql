/*
Navicat MySQL Data Transfer

Source Server         : 192.168.82.213@chuanyong
Source Server Version : 50027
Source Host           : 192.168.82.213:3306
Source Database       : openfire

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2011-11-23 17:48:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ofextcomponentconf`
-- ----------------------------
DROP TABLE IF EXISTS `ofextcomponentconf`;
CREATE TABLE `ofextcomponentconf` (
  `subdomain` varchar(255) NOT NULL,
  `wildcard` tinyint(4) NOT NULL,
  `secret` varchar(255) default NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY  (`subdomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofextcomponentconf
-- ----------------------------

-- ----------------------------
-- Table structure for `ofgroup`
-- ----------------------------
DROP TABLE IF EXISTS `ofgroup`;
CREATE TABLE `ofgroup` (
  `groupName` varchar(50) NOT NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofgroup
-- ----------------------------

-- ----------------------------
-- Table structure for `ofgroupprop`
-- ----------------------------
DROP TABLE IF EXISTS `ofgroupprop`;
CREATE TABLE `ofgroupprop` (
  `groupName` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY  (`groupName`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofgroupprop
-- ----------------------------

-- ----------------------------
-- Table structure for `ofgroupuser`
-- ----------------------------
DROP TABLE IF EXISTS `ofgroupuser`;
CREATE TABLE `ofgroupuser` (
  `groupName` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `administrator` tinyint(4) NOT NULL,
  PRIMARY KEY  (`groupName`,`username`,`administrator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofgroupuser
-- ----------------------------

-- ----------------------------
-- Table structure for `ofid`
-- ----------------------------
DROP TABLE IF EXISTS `ofid`;
CREATE TABLE `ofid` (
  `idType` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY  (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofid
-- ----------------------------
INSERT INTO ofid VALUES ('18', '1');
INSERT INTO ofid VALUES ('19', '22');
INSERT INTO ofid VALUES ('23', '29');
INSERT INTO ofid VALUES ('25', '43');
INSERT INTO ofid VALUES ('26', '2');

-- ----------------------------
-- Table structure for `ofmucaffiliation`
-- ----------------------------
DROP TABLE IF EXISTS `ofmucaffiliation`;
CREATE TABLE `ofmucaffiliation` (
  `roomID` bigint(20) NOT NULL,
  `jid` text NOT NULL,
  `affiliation` tinyint(4) NOT NULL,
  PRIMARY KEY  (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofmucaffiliation
-- ----------------------------
INSERT INTO ofmucaffiliation VALUES ('17', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('17', '38@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('17', '67@zt-2006399', '40');
INSERT INTO ofmucaffiliation VALUES ('18', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('18', '89@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('19', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('19', '66@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('19', '67@zt-2006399', '20');
INSERT INTO ofmucaffiliation VALUES ('20', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('20', '36@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('21', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('21', '67@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('22', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('23', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('23', '92@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('24', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('24', '3@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('25', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('25', '5@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('26', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('26', '82@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('27', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('27', '7@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('28', '1@zt-2006399', '10');
INSERT INTO ofmucaffiliation VALUES ('28', '2@zt-2006399', '10');

-- ----------------------------
-- Table structure for `ofmucconversationlog`
-- ----------------------------
DROP TABLE IF EXISTS `ofmucconversationlog`;
CREATE TABLE `ofmucconversationlog` (
  `roomID` bigint(20) NOT NULL,
  `sender` text NOT NULL,
  `nickname` varchar(255) default NULL,
  `logTime` char(15) NOT NULL,
  `subject` varchar(255) default NULL,
  `body` text,
  KEY `ofMucConversationLog_time_idx` (`logTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofmucconversationlog
-- ----------------------------

-- ----------------------------
-- Table structure for `ofmucmember`
-- ----------------------------
DROP TABLE IF EXISTS `ofmucmember`;
CREATE TABLE `ofmucmember` (
  `roomID` bigint(20) NOT NULL,
  `jid` text NOT NULL,
  `nickname` varchar(255) default NULL,
  `firstName` varchar(100) default NULL,
  `lastName` varchar(100) default NULL,
  `url` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `faqentry` varchar(100) default NULL,
  PRIMARY KEY  (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofmucmember
-- ----------------------------

-- ----------------------------
-- Table structure for `ofmucroom`
-- ----------------------------
DROP TABLE IF EXISTS `ofmucroom`;
CREATE TABLE `ofmucroom` (
  `serviceID` bigint(20) NOT NULL,
  `roomID` bigint(20) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `naturalName` varchar(255) NOT NULL,
  `description` varchar(255) default NULL,
  `lockedDate` char(15) NOT NULL,
  `emptyDate` char(15) default NULL,
  `canChangeSubject` tinyint(4) NOT NULL,
  `maxUsers` int(11) NOT NULL,
  `publicRoom` tinyint(4) NOT NULL,
  `moderated` tinyint(4) NOT NULL,
  `membersOnly` tinyint(4) NOT NULL,
  `canInvite` tinyint(4) NOT NULL,
  `roomPassword` varchar(50) default NULL,
  `canDiscoverJID` tinyint(4) NOT NULL,
  `logEnabled` tinyint(4) NOT NULL,
  `subject` varchar(100) default NULL,
  `rolesToBroadcast` tinyint(4) NOT NULL,
  `useReservedNick` tinyint(4) NOT NULL,
  `canChangeNick` tinyint(4) NOT NULL,
  `canRegister` tinyint(4) NOT NULL,
  PRIMARY KEY  (`serviceID`,`name`),
  KEY `ofMucRoom_roomid_idx` (`roomID`),
  KEY `ofMucRoom_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofmucroom
-- ----------------------------
INSERT INTO ofmucroom VALUES ('1', '17', '001319194868631', '001319194868662', '10001', '???', '10001', '000000000000000', '001321874628962', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '18', '001319194868802', '001319194868818', '10002', 'denny', '10002', '000000000000000', '001321873146556', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '19', '001319194869006', '001319194869021', '10003', 'sxd', '10003', '000000000000000', '001321431800113', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '20', '001319194869177', '001319194869193', '10004', '????', '10004', '000000000000000', '001321431800050', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '21', '001319194869349', '001319194869349', '10005', '???', '10005', '000000000000000', null, '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '22', '001319194869506', '001319194869521', '10006', '??', '10006', '000000000000000', '001321873107822', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '23', '001320632316455', '001320632316642', '10008', 'AAA', '10008', '000000000000000', '001320632316970', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '24', '001320634533395', '001320634533458', '10010', 'tammy', '10010', '000000000000000', '001320634533598', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '25', '001320657575678', '001320657575834', '10011', 'test', '10011', '000000000000000', '001320657576131', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '26', '001320657986516', '001320657986610', '10012', 'allanzue', '10012', '000000000000000', '001320658321715', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '27', '001320664773695', '001320664773773', '10013', '????', '10013', '000000000000000', '001320664773976', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');
INSERT INTO ofmucroom VALUES ('1', '28', '001321415327855', '001321415327948', '10014', 'wanghui2', '10014', '000000000000000', '001321415328120', '0', '30', '1', '0', '0', '0', null, '1', '0', '', '7', '0', '1', '1');

-- ----------------------------
-- Table structure for `ofmucroomprop`
-- ----------------------------
DROP TABLE IF EXISTS `ofmucroomprop`;
CREATE TABLE `ofmucroomprop` (
  `roomID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY  (`roomID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofmucroomprop
-- ----------------------------

-- ----------------------------
-- Table structure for `ofmucservice`
-- ----------------------------
DROP TABLE IF EXISTS `ofmucservice`;
CREATE TABLE `ofmucservice` (
  `serviceID` bigint(20) NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `description` varchar(255) default NULL,
  `isHidden` tinyint(4) NOT NULL,
  PRIMARY KEY  (`subdomain`),
  KEY `ofMucService_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofmucservice
-- ----------------------------
INSERT INTO ofmucservice VALUES ('1', 'conference', null, '0');

-- ----------------------------
-- Table structure for `ofmucserviceprop`
-- ----------------------------
DROP TABLE IF EXISTS `ofmucserviceprop`;
CREATE TABLE `ofmucserviceprop` (
  `serviceID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY  (`serviceID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofmucserviceprop
-- ----------------------------

-- ----------------------------
-- Table structure for `ofoffline`
-- ----------------------------
DROP TABLE IF EXISTS `ofoffline`;
CREATE TABLE `ofoffline` (
  `username` varchar(64) NOT NULL,
  `messageID` bigint(20) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `messageSize` int(11) NOT NULL,
  `stanza` text NOT NULL,
  PRIMARY KEY  (`username`,`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofoffline
-- ----------------------------
INSERT INTO ofoffline VALUES ('89', '17', '001321270246876', '112', '<message type=\"chat\" to=\"89@zt-2006399\" id=\"m_29\" from=\"38@zt-2006399/web\"><body>1????@asdhasdh</body></message>');
INSERT INTO ofoffline VALUES ('89', '18', '001321270253048', '112', '<message type=\"chat\" to=\"89@zt-2006399\" id=\"m_32\" from=\"38@zt-2006399/web\"><body>1????@sdhsdhah</body></message>');

-- ----------------------------
-- Table structure for `ofpresence`
-- ----------------------------
DROP TABLE IF EXISTS `ofpresence`;
CREATE TABLE `ofpresence` (
  `username` varchar(64) NOT NULL,
  `offlinePresence` text,
  `offlineDate` char(15) NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpresence
-- ----------------------------
INSERT INTO ofpresence VALUES ('13d8fc57', null, '001319193714131');
INSERT INTO ofpresence VALUES ('14a44625', null, '001315992774586');
INSERT INTO ofpresence VALUES ('14fa4d58', null, '001316766736864');
INSERT INTO ofpresence VALUES ('15b080cd', null, '001319793457620');
INSERT INTO ofpresence VALUES ('17c59011', null, '001316519167071');
INSERT INTO ofpresence VALUES ('17d080a6', null, '001318219095671');
INSERT INTO ofpresence VALUES ('17ff6991', null, '001315990100026');
INSERT INTO ofpresence VALUES ('19b7a5df', null, '001321435490081');
INSERT INTO ofpresence VALUES ('1aa0abe3', null, '001318043545582');
INSERT INTO ofpresence VALUES ('1abb9cf2', null, '001316073774263');
INSERT INTO ofpresence VALUES ('1acb10e3', null, '001318929933799');
INSERT INTO ofpresence VALUES ('1acb4a15', null, '001316430020279');
INSERT INTO ofpresence VALUES ('1acb5052', null, '001316752370487');
INSERT INTO ofpresence VALUES ('1adf76db', null, '001319794123729');
INSERT INTO ofpresence VALUES ('1b45e506', null, '001317190684485');
INSERT INTO ofpresence VALUES ('1bdaa17e', null, '001319013805199');
INSERT INTO ofpresence VALUES ('1c0e2063', null, '001316515267228');
INSERT INTO ofpresence VALUES ('1c6ce7ec', null, '001316573939966');
INSERT INTO ofpresence VALUES ('1c8b3f3a', null, '001316156920505');
INSERT INTO ofpresence VALUES ('1ceb5cce', null, '001316575878885');
INSERT INTO ofpresence VALUES ('1eb95395', null, '001321418335457');
INSERT INTO ofpresence VALUES ('1f56cf42', null, '001317006770390');
INSERT INTO ofpresence VALUES ('1f5a13e2', null, '001316090529265');
INSERT INTO ofpresence VALUES ('1fa949b0', null, '001316579937864');
INSERT INTO ofpresence VALUES ('1fc385e7', null, '001319794943307');
INSERT INTO ofpresence VALUES ('1fc8df0c', null, '001316074177979');
INSERT INTO ofpresence VALUES ('1fea94a6', null, '001316771722426');
INSERT INTO ofpresence VALUES ('1fecca2a', null, '001321437109714');
INSERT INTO ofpresence VALUES ('23b0200d', null, '001321438377476');
INSERT INTO ofpresence VALUES ('23dcb22c', null, '001319193907209');
INSERT INTO ofpresence VALUES ('23de1760', null, '001316172115466');
INSERT INTO ofpresence VALUES ('24d16c97', null, '001316749178193');
INSERT INTO ofpresence VALUES ('24ebebbb', null, '001321429843497');
INSERT INTO ofpresence VALUES ('25d4668d', null, '001316521702464');
INSERT INTO ofpresence VALUES ('26a009ec', null, '001317011668874');
INSERT INTO ofpresence VALUES ('26a25ef6', null, '001318474273035');
INSERT INTO ofpresence VALUES ('26fb9c1e', null, '001316751264057');
INSERT INTO ofpresence VALUES ('27a97621', null, '001318131079667');
INSERT INTO ofpresence VALUES ('27b1f366', null, '001321438191302');
INSERT INTO ofpresence VALUES ('27f1df75', null, '001319193181271');
INSERT INTO ofpresence VALUES ('28d202d', null, '001317023552423');
INSERT INTO ofpresence VALUES ('28de7e2', null, '001316073959887');
INSERT INTO ofpresence VALUES ('28fd3e8c', null, '001319193232006');
INSERT INTO ofpresence VALUES ('29efec22', null, '001321437379969');
INSERT INTO ofpresence VALUES ('2a01999a', null, '001317011363220');
INSERT INTO ofpresence VALUES ('2a165f6a', null, '001319800347472');
INSERT INTO ofpresence VALUES ('2a7b1106', null, '001319086050430');
INSERT INTO ofpresence VALUES ('2a97cf87', null, '001316574909723');
INSERT INTO ofpresence VALUES ('2aa06dc7', null, '001316514028212');
INSERT INTO ofpresence VALUES ('2b369393', null, '001320414378029');
INSERT INTO ofpresence VALUES ('2b4c8799', null, '001318316014830');
INSERT INTO ofpresence VALUES ('2b6450c2', null, '001316003246062');
INSERT INTO ofpresence VALUES ('2bcb08e0', null, '001316766724348');
INSERT INTO ofpresence VALUES ('2bcc524a', null, '001316521651885');
INSERT INTO ofpresence VALUES ('2c5a6683', null, '001319792159651');
INSERT INTO ofpresence VALUES ('2ca274e2', null, '001320830983199');
INSERT INTO ofpresence VALUES ('2d12ffb4', null, '001317012280042');
INSERT INTO ofpresence VALUES ('2d226df2', null, '001317208739807');
INSERT INTO ofpresence VALUES ('2df3a3ed', null, '001317010580756');
INSERT INTO ofpresence VALUES ('2df98099', null, '001317022873849');
INSERT INTO ofpresence VALUES ('2ed36508', null, '001321429836106');
INSERT INTO ofpresence VALUES ('2f013a40', null, '001317121528675');
INSERT INTO ofpresence VALUES ('2f90d27d', null, '001316512798142');
INSERT INTO ofpresence VALUES ('2fd78446', null, '001317010985988');
INSERT INTO ofpresence VALUES ('2fdc60af', null, '001316750877293');
INSERT INTO ofpresence VALUES ('30a501ef', null, '001316688669715');
INSERT INTO ofpresence VALUES ('31a76b6f', null, '001321440113552');
INSERT INTO ofpresence VALUES ('31afb3c0', null, '001317205957653');
INSERT INTO ofpresence VALUES ('31b4c87', null, '001316494686544');
INSERT INTO ofpresence VALUES ('31d8dff1', null, '001318830186619');
INSERT INTO ofpresence VALUES ('32dffeab', null, '001318578881776');
INSERT INTO ofpresence VALUES ('33a212bd', null, '001316572269596');
INSERT INTO ofpresence VALUES ('35da1fc5', null, '001318821232822');
INSERT INTO ofpresence VALUES ('36', null, '001318234986846');
INSERT INTO ofpresence VALUES ('36cf09f8', null, '001321418409706');
INSERT INTO ofpresence VALUES ('37a98551', null, '001317121522082');
INSERT INTO ofpresence VALUES ('37bdeb92', null, '001316770534168');
INSERT INTO ofpresence VALUES ('37ef07ce', null, '001319527901112');
INSERT INTO ofpresence VALUES ('38', null, '001321874628994');
INSERT INTO ofpresence VALUES ('38ad4b67', null, '001316156953145');
INSERT INTO ofpresence VALUES ('38cc1de5', null, '001318043429458');
INSERT INTO ofpresence VALUES ('38d8dea8', null, '001319013678590');
INSERT INTO ofpresence VALUES ('38|23', null, '001317181699621');
INSERT INTO ofpresence VALUES ('39', null, '001316607056681');
INSERT INTO ofpresence VALUES ('3a4be80f', null, '001320117012815');
INSERT INTO ofpresence VALUES ('3a9c863f', null, '001319182707006');
INSERT INTO ofpresence VALUES ('3bf427d9', null, '001318821372525');
INSERT INTO ofpresence VALUES ('3c3000e4', null, '001317373618185');
INSERT INTO ofpresence VALUES ('3c7339ba', null, '001319527874862');
INSERT INTO ofpresence VALUES ('3c7cae4c', null, '001316750923121');
INSERT INTO ofpresence VALUES ('3cdfe54a', null, '001316518958983');
INSERT INTO ofpresence VALUES ('3ce91e0e', null, '001320116824221');
INSERT INTO ofpresence VALUES ('3d8c695f', null, '001315968968458');
INSERT INTO ofpresence VALUES ('3db4d3e1', null, '001316092497488');
INSERT INTO ofpresence VALUES ('3f1f88a8', null, '001320117525690');
INSERT INTO ofpresence VALUES ('3fa155e9', null, '001316156892192');
INSERT INTO ofpresence VALUES ('47a6a52d', null, '001316144759915');
INSERT INTO ofpresence VALUES ('49d63b7e', null, '001316520039096');
INSERT INTO ofpresence VALUES ('4a29ffd6', null, '001317203598980');
INSERT INTO ofpresence VALUES ('4a9f11c5', null, '001317024253106');
INSERT INTO ofpresence VALUES ('4aa5b66c', null, '001316578017899');
INSERT INTO ofpresence VALUES ('4adfa936', null, '001316771644832');
INSERT INTO ofpresence VALUES ('4b8c22c3', null, '001319607885508');
INSERT INTO ofpresence VALUES ('4ba07b36', null, '001318315990768');
INSERT INTO ofpresence VALUES ('4ba54d48', null, '001316169171699');
INSERT INTO ofpresence VALUES ('4c05adfd', null, '001316072806347');
INSERT INTO ofpresence VALUES ('4c0cb736', null, '001316770842650');
INSERT INTO ofpresence VALUES ('4c1f49db', null, '001316750418515');
INSERT INTO ofpresence VALUES ('4c2e62ca', null, '001317012229339');
INSERT INTO ofpresence VALUES ('4c79ba89', null, '001316513128461');
INSERT INTO ofpresence VALUES ('4cbe0db6', null, '001316750928684');
INSERT INTO ofpresence VALUES ('4cd1901d', null, '001316519747264');
INSERT INTO ofpresence VALUES ('4d108d9a', null, '001319792311307');
INSERT INTO ofpresence VALUES ('4d22e61c', null, '001319792616511');
INSERT INTO ofpresence VALUES ('4d71d1d', null, '001316519630606');
INSERT INTO ofpresence VALUES ('4db9dd6d', null, '001320117100971');
INSERT INTO ofpresence VALUES ('4ee9af45', null, '001316512852671');
INSERT INTO ofpresence VALUES ('4f0d2b92', null, '001316750296953');
INSERT INTO ofpresence VALUES ('4f2f7fea', null, '001317210651904');
INSERT INTO ofpresence VALUES ('4f580927', null, '001318587406557');
INSERT INTO ofpresence VALUES ('4f5ec7a', null, '001316771436224');
INSERT INTO ofpresence VALUES ('4f62da5d', null, '001319195051459');
INSERT INTO ofpresence VALUES ('4f64983c', null, '001319187761834');
INSERT INTO ofpresence VALUES ('4ff39ac8', null, '001316592369238');
INSERT INTO ofpresence VALUES ('50b8462e', null, '001319193225927');
INSERT INTO ofpresence VALUES ('53b629af', null, '001316173443566');
INSERT INTO ofpresence VALUES ('53cc2734', null, '001320116809674');
INSERT INTO ofpresence VALUES ('54eeab02', null, '001316751310994');
INSERT INTO ofpresence VALUES ('56dafbef', null, '001316156171822');
INSERT INTO ofpresence VALUES ('56de57b4', null, '001316075619923');
INSERT INTO ofpresence VALUES ('57f79347', null, '001316514302209');
INSERT INTO ofpresence VALUES ('59c2017d', null, '001316174176202');
INSERT INTO ofpresence VALUES ('5a1e9c24', null, '001317011717671');
INSERT INTO ofpresence VALUES ('5a936cee', null, '001317010419820');
INSERT INTO ofpresence VALUES ('5a98848f', null, '001317006937873');
INSERT INTO ofpresence VALUES ('5a9d09dd', null, '001319187768302');
INSERT INTO ofpresence VALUES ('5b1128c7', null, '001317284650350');
INSERT INTO ofpresence VALUES ('5bcd62cc', null, '001318235176549');
INSERT INTO ofpresence VALUES ('5bd3186', null, '001316513179570');
INSERT INTO ofpresence VALUES ('5bd3db3f', null, '001316074215619');
INSERT INTO ofpresence VALUES ('5c2b3113', null, '001316572242628');
INSERT INTO ofpresence VALUES ('5c6bd087', null, '001317202738002');
INSERT INTO ofpresence VALUES ('5cb231b7', null, '001317010690240');
INSERT INTO ofpresence VALUES ('5cda77e6', null, '001319195874568');
INSERT INTO ofpresence VALUES ('5d19aac7', null, '001317357816765');
INSERT INTO ofpresence VALUES ('5d27097a', null, '001320118525549');
INSERT INTO ofpresence VALUES ('5d2d95c7', null, '001319446533885');
INSERT INTO ofpresence VALUES ('5d59d13f', null, '001316156327727');
INSERT INTO ofpresence VALUES ('5d6194f8', null, '001315973149584');
INSERT INTO ofpresence VALUES ('5da01615', null, '001317007026670');
INSERT INTO ofpresence VALUES ('5f1235e7', null, '001316519947048');
INSERT INTO ofpresence VALUES ('5f15ac4', null, '001316751231432');
INSERT INTO ofpresence VALUES ('5f93c4a5', null, '001316771106930');
INSERT INTO ofpresence VALUES ('5fb841e5', null, '001317010096978');
INSERT INTO ofpresence VALUES ('5ff59c', null, '001317271671292');
INSERT INTO ofpresence VALUES ('60fbe2fc', null, '001316166652226');
INSERT INTO ofpresence VALUES ('67d6635b', null, '001316143864952');
INSERT INTO ofpresence VALUES ('68', null, '001316430988191');
INSERT INTO ofpresence VALUES ('69b29d47', null, '001317265816517');
INSERT INTO ofpresence VALUES ('69c4a26', null, '001316750302000');
INSERT INTO ofpresence VALUES ('69d55fc6', null, '001320118465940');
INSERT INTO ofpresence VALUES ('70', null, '001314964327620');
INSERT INTO ofpresence VALUES ('71', null, '001317271232514');
INSERT INTO ofpresence VALUES ('71d23809', null, '001317210548139');
INSERT INTO ofpresence VALUES ('71f08efa', null, '001316513836532');
INSERT INTO ofpresence VALUES ('72', null, '001315971914135');
INSERT INTO ofpresence VALUES ('72a0cdce', null, '001315973524692');
INSERT INTO ofpresence VALUES ('73', null, '001314964234901');
INSERT INTO ofpresence VALUES ('74', null, '001315884536937');
INSERT INTO ofpresence VALUES ('74b3e3c5', null, '001316771493115');
INSERT INTO ofpresence VALUES ('74ec277a', null, '001316140363021');
INSERT INTO ofpresence VALUES ('76', null, '001316598856436');
INSERT INTO ofpresence VALUES ('77', null, '001316419829120');
INSERT INTO ofpresence VALUES ('77b0670d', null, '001316584154004');
INSERT INTO ofpresence VALUES ('77c91b1', null, '001319792256870');
INSERT INTO ofpresence VALUES ('78', null, '001316424240867');
INSERT INTO ofpresence VALUES ('78d819e', null, '001316750286719');
INSERT INTO ofpresence VALUES ('79bf91b4', null, '001316750257876');
INSERT INTO ofpresence VALUES ('7a70568f', null, '001317210062158');
INSERT INTO ofpresence VALUES ('7a7d2f4b', null, '001317010937285');
INSERT INTO ofpresence VALUES ('7b86dc72', null, '001321501490483');
INSERT INTO ofpresence VALUES ('7bbbfa4b', null, '001318561360291');
INSERT INTO ofpresence VALUES ('7bc60223', null, '001316173816188');
INSERT INTO ofpresence VALUES ('7bf3156f', null, '001321440099896');
INSERT INTO ofpresence VALUES ('7bf51132', null, '001316156120682');
INSERT INTO ofpresence VALUES ('7c5f0bee', null, '001316572249706');
INSERT INTO ofpresence VALUES ('7cd07ae0', null, '001317181598137');
INSERT INTO ofpresence VALUES ('7d079cb3', null, '001317031972660');
INSERT INTO ofpresence VALUES ('7d2994bd', null, '001319193834568');
INSERT INTO ofpresence VALUES ('7d2dc9ba', null, '001316092399996');
INSERT INTO ofpresence VALUES ('7d770725', null, '001317265735549');
INSERT INTO ofpresence VALUES ('7d8a7b2f', null, '001316751240963');
INSERT INTO ofpresence VALUES ('7dd90fa3', null, '001315973461411');
INSERT INTO ofpresence VALUES ('7dfc61bc', null, '001319444264526');
INSERT INTO ofpresence VALUES ('7e0dfd1b', null, '001316607179526');
INSERT INTO ofpresence VALUES ('7f2e076e', null, '001315990688441');
INSERT INTO ofpresence VALUES ('7f3655d0', null, '001320117609221');
INSERT INTO ofpresence VALUES ('7f4fca6c', null, '001316427997422');
INSERT INTO ofpresence VALUES ('7fe71a6c', null, '001316588591926');
INSERT INTO ofpresence VALUES ('80be47f2', null, '001319793031729');
INSERT INTO ofpresence VALUES ('83ca9de8', null, '001319446364791');
INSERT INTO ofpresence VALUES ('83da8a56', null, '001321431795878');
INSERT INTO ofpresence VALUES ('86f9e934', null, '001320116898252');
INSERT INTO ofpresence VALUES ('89', null, '001319537398940');
INSERT INTO ofpresence VALUES ('8a2020b3', null, '001316491914713');
INSERT INTO ofpresence VALUES ('8a32b947', null, '001316073697935');
INSERT INTO ofpresence VALUES ('8a546cac', null, '001316075208957');
INSERT INTO ofpresence VALUES ('8a612186', null, '001316766642677');
INSERT INTO ofpresence VALUES ('8a6b02a', null, '001317271691526');
INSERT INTO ofpresence VALUES ('8b44e073', null, '001316751194760');
INSERT INTO ofpresence VALUES ('8ba81a55', null, '001316174316607');
INSERT INTO ofpresence VALUES ('8ba9f744', null, '001316073664810');
INSERT INTO ofpresence VALUES ('8c0fbda', null, '001315991149747');
INSERT INTO ofpresence VALUES ('8c20d7c0', null, '001316514320912');
INSERT INTO ofpresence VALUES ('8d5dbe63', null, '001316520984664');
INSERT INTO ofpresence VALUES ('8dc59239', null, '001316500342986');
INSERT INTO ofpresence VALUES ('8dc6d88e', null, '001316175157633');
INSERT INTO ofpresence VALUES ('8ddf4844', null, '001320117031252');
INSERT INTO ofpresence VALUES ('8eab4b41', null, '001316513095321');
INSERT INTO ofpresence VALUES ('8eb12a48', null, '001317271730370');
INSERT INTO ofpresence VALUES ('8f711c55', null, '001316053814800');
INSERT INTO ofpresence VALUES ('8fa6ed40', null, '001316517888429');
INSERT INTO ofpresence VALUES ('8fc057c', null, '001319800327878');
INSERT INTO ofpresence VALUES ('8ff9808a', null, '001316174122343');
INSERT INTO ofpresence VALUES ('90', null, '001319197845662');
INSERT INTO ofpresence VALUES ('91a0b7ca', null, '001321431799409');
INSERT INTO ofpresence VALUES ('9a16b03f', null, '001316605396963');
INSERT INTO ofpresence VALUES ('9a28c122', null, '001316073867856');
INSERT INTO ofpresence VALUES ('9a2c9424', null, '001317207703626');
INSERT INTO ofpresence VALUES ('9a81bf4', null, '001318160141827');
INSERT INTO ofpresence VALUES ('9abfef80', null, '001316509679683');
INSERT INTO ofpresence VALUES ('9aea2f34', null, '001316572567348');
INSERT INTO ofpresence VALUES ('9bc573dc', null, '001317266182202');
INSERT INTO ofpresence VALUES ('9bc68b67', null, '001320118454783');
INSERT INTO ofpresence VALUES ('9c6ac0ab', null, '001319083026664');
INSERT INTO ofpresence VALUES ('9c87a90b', null, '001316075015974');
INSERT INTO ofpresence VALUES ('9c92a2c0', null, '001316752348284');
INSERT INTO ofpresence VALUES ('9c96b267', null, '001316751084058');
INSERT INTO ofpresence VALUES ('9ce195ef', null, '001321432057531');
INSERT INTO ofpresence VALUES ('9cf1c7e8', null, '001318233043330');
INSERT INTO ofpresence VALUES ('9d153108', null, '001317006034426');
INSERT INTO ofpresence VALUES ('9d16c27c', null, '001320116680252');
INSERT INTO ofpresence VALUES ('9d1c9055', null, '001317272125680');
INSERT INTO ofpresence VALUES ('9d5a2278', null, '001317011629781');
INSERT INTO ofpresence VALUES ('9dc114e1', null, '001316767596577');
INSERT INTO ofpresence VALUES ('9ea77f4e', null, '001318056673653');
INSERT INTO ofpresence VALUES ('9f1882b6', null, '001316173127818');
INSERT INTO ofpresence VALUES ('9f9d264', null, '001316605388822');

-- ----------------------------
-- Table structure for `ofprivacylist`
-- ----------------------------
DROP TABLE IF EXISTS `ofprivacylist`;
CREATE TABLE `ofprivacylist` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isDefault` tinyint(4) NOT NULL,
  `list` text NOT NULL,
  PRIMARY KEY  (`username`,`name`),
  KEY `ofPrivacyList_default_idx` (`username`,`isDefault`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofprivacylist
-- ----------------------------

-- ----------------------------
-- Table structure for `ofprivate`
-- ----------------------------
DROP TABLE IF EXISTS `ofprivate`;
CREATE TABLE `ofprivate` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `namespace` varchar(200) NOT NULL,
  `privateData` text NOT NULL,
  PRIMARY KEY  (`username`,`name`,`namespace`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofprivate
-- ----------------------------

-- ----------------------------
-- Table structure for `ofproperty`
-- ----------------------------
DROP TABLE IF EXISTS `ofproperty`;
CREATE TABLE `ofproperty` (
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofproperty
-- ----------------------------
INSERT INTO ofproperty VALUES ('admin.authorizedJIDs', '1@zt-2006399');
INSERT INTO ofproperty VALUES ('jdbcAuthProvider.passwordSQL', 'select password from user where id=?');
INSERT INTO ofproperty VALUES ('jdbcAuthProvider.passwordType', 'plain');
INSERT INTO ofproperty VALUES ('jdbcProvider.connectionString', 'jdbc:mysql://localhost:3306/navigation?user=root&password=root&useUnicode=true&characterEncoding=utf8');
INSERT INTO ofproperty VALUES ('jdbcProvider.driver', 'com.mysql.jdbc.Driver');
INSERT INTO ofproperty VALUES ('jdbcUserProvider.allUsersSQL', 'select id from user');
INSERT INTO ofproperty VALUES ('jdbcUserProvider.emailField', 'mail');
INSERT INTO ofproperty VALUES ('jdbcUserProvider.loadUserSQL', 'select name,mail from user where id=?');
INSERT INTO ofproperty VALUES ('jdbcUserProvider.nameField', 'name');
INSERT INTO ofproperty VALUES ('jdbcUserProvider.userCountSQL', 'select count(*) from user');
INSERT INTO ofproperty VALUES ('jdbcUserProvider.usernameField', 'name');
INSERT INTO ofproperty VALUES ('passwordKey', 'V9Pg2DPuS93gwH9');
INSERT INTO ofproperty VALUES ('provider.admin.className', 'org.jivesoftware.openfire.admin.DefaultAdminProvider');
INSERT INTO ofproperty VALUES ('provider.auth.className', 'org.jivesoftware.openfire.auth.JDBCAuthProvider');
INSERT INTO ofproperty VALUES ('provider.group.className', 'org.jivesoftware.openfire.group.DefaultGroupProvider');
INSERT INTO ofproperty VALUES ('provider.lockout.className', 'org.jivesoftware.openfire.lockout.DefaultLockOutProvider');
INSERT INTO ofproperty VALUES ('provider.securityAudit.className', 'org.jivesoftware.openfire.security.DefaultSecurityAuditProvider');
INSERT INTO ofproperty VALUES ('provider.user.className', 'org.jivesoftware.openfire.user.JDBCUserProvider');
INSERT INTO ofproperty VALUES ('provider.vcard.className', 'org.jivesoftware.openfire.vcard.DefaultVCardProvider');
INSERT INTO ofproperty VALUES ('route.all-resources', 'true');
INSERT INTO ofproperty VALUES ('update.lastCheck', '1322014161657');
INSERT INTO ofproperty VALUES ('xmpp.auth.anonymous', 'true');
INSERT INTO ofproperty VALUES ('xmpp.client.idle', '-1');
INSERT INTO ofproperty VALUES ('xmpp.client.idle.ping', 'true');
INSERT INTO ofproperty VALUES ('xmpp.domain', 'zt-2006399');
INSERT INTO ofproperty VALUES ('xmpp.session.conflict-limit', '-1');
INSERT INTO ofproperty VALUES ('xmpp.socket.ssl.active', 'true');

-- ----------------------------
-- Table structure for `ofpubsubaffiliation`
-- ----------------------------
DROP TABLE IF EXISTS `ofpubsubaffiliation`;
CREATE TABLE `ofpubsubaffiliation` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `affiliation` varchar(10) NOT NULL,
  PRIMARY KEY  (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpubsubaffiliation
-- ----------------------------
INSERT INTO ofpubsubaffiliation VALUES ('pubsub', '', 'zt-2006399', 'owner');

-- ----------------------------
-- Table structure for `ofpubsubdefaultconf`
-- ----------------------------
DROP TABLE IF EXISTS `ofpubsubdefaultconf`;
CREATE TABLE `ofpubsubdefaultconf` (
  `serviceID` varchar(100) NOT NULL,
  `leaf` tinyint(4) NOT NULL,
  `deliverPayloads` tinyint(4) NOT NULL,
  `maxPayloadSize` int(11) NOT NULL,
  `persistItems` tinyint(4) NOT NULL,
  `maxItems` int(11) NOT NULL,
  `notifyConfigChanges` tinyint(4) NOT NULL,
  `notifyDelete` tinyint(4) NOT NULL,
  `notifyRetract` tinyint(4) NOT NULL,
  `presenceBased` tinyint(4) NOT NULL,
  `sendItemSubscribe` tinyint(4) NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint(4) NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `language` varchar(255) default NULL,
  `replyPolicy` varchar(15) default NULL,
  `associationPolicy` varchar(15) NOT NULL,
  `maxLeafNodes` int(11) NOT NULL,
  PRIMARY KEY  (`serviceID`,`leaf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpubsubdefaultconf
-- ----------------------------
INSERT INTO ofpubsubdefaultconf VALUES ('pubsub', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', 'publishers', '1', 'open', 'English', null, 'all', '-1');
INSERT INTO ofpubsubdefaultconf VALUES ('pubsub', '1', '1', '5120', '0', '-1', '1', '1', '1', '0', '1', 'publishers', '1', 'open', 'English', null, 'all', '-1');

-- ----------------------------
-- Table structure for `ofpubsubitem`
-- ----------------------------
DROP TABLE IF EXISTS `ofpubsubitem`;
CREATE TABLE `ofpubsubitem` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `payload` mediumtext,
  PRIMARY KEY  (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpubsubitem
-- ----------------------------

-- ----------------------------
-- Table structure for `ofpubsubnode`
-- ----------------------------
DROP TABLE IF EXISTS `ofpubsubnode`;
CREATE TABLE `ofpubsubnode` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `leaf` tinyint(4) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `parent` varchar(100) default NULL,
  `deliverPayloads` tinyint(4) NOT NULL,
  `maxPayloadSize` int(11) default NULL,
  `persistItems` tinyint(4) default NULL,
  `maxItems` int(11) default NULL,
  `notifyConfigChanges` tinyint(4) NOT NULL,
  `notifyDelete` tinyint(4) NOT NULL,
  `notifyRetract` tinyint(4) NOT NULL,
  `presenceBased` tinyint(4) NOT NULL,
  `sendItemSubscribe` tinyint(4) NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint(4) NOT NULL,
  `configSubscription` tinyint(4) NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `payloadType` varchar(100) default NULL,
  `bodyXSLT` varchar(100) default NULL,
  `dataformXSLT` varchar(100) default NULL,
  `creator` varchar(255) NOT NULL,
  `description` varchar(255) default NULL,
  `language` varchar(255) default NULL,
  `name` varchar(50) default NULL,
  `replyPolicy` varchar(15) default NULL,
  `associationPolicy` varchar(15) default NULL,
  `maxLeafNodes` int(11) default NULL,
  PRIMARY KEY  (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpubsubnode
-- ----------------------------
INSERT INTO ofpubsubnode VALUES ('pubsub', '', '0', '001314934182050', '001314934182050', null, '0', '0', '0', '0', '1', '1', '1', '0', '0', 'publishers', '1', '0', 'open', '', '', '', 'zt-2006399', '', 'English', '', null, 'all', '-1');

-- ----------------------------
-- Table structure for `ofpubsubnodegroups`
-- ----------------------------
DROP TABLE IF EXISTS `ofpubsubnodegroups`;
CREATE TABLE `ofpubsubnodegroups` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `rosterGroup` varchar(100) NOT NULL,
  KEY `ofPubsubNodeGroups_idx` (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpubsubnodegroups
-- ----------------------------

-- ----------------------------
-- Table structure for `ofpubsubnodejids`
-- ----------------------------
DROP TABLE IF EXISTS `ofpubsubnodejids`;
CREATE TABLE `ofpubsubnodejids` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `associationType` varchar(20) NOT NULL,
  PRIMARY KEY  (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpubsubnodejids
-- ----------------------------

-- ----------------------------
-- Table structure for `ofpubsubsubscription`
-- ----------------------------
DROP TABLE IF EXISTS `ofpubsubsubscription`;
CREATE TABLE `ofpubsubsubscription` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `state` varchar(15) NOT NULL,
  `deliver` tinyint(4) NOT NULL,
  `digest` tinyint(4) NOT NULL,
  `digest_frequency` int(11) NOT NULL,
  `expire` char(15) default NULL,
  `includeBody` tinyint(4) NOT NULL,
  `showValues` varchar(30) default NULL,
  `subscriptionType` varchar(10) NOT NULL,
  `subscriptionDepth` tinyint(4) NOT NULL,
  `keyword` varchar(200) default NULL,
  PRIMARY KEY  (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofpubsubsubscription
-- ----------------------------
INSERT INTO ofpubsubsubscription VALUES ('pubsub', '', 'jjke14hQmL3gTflQ0YOzFnjImrf6Yl44CfY5KP9f', 'zt-2006399', 'zt-2006399', 'subscribed', '1', '0', '86400000', null, '0', ' ', 'nodes', '1', null);

-- ----------------------------
-- Table structure for `ofremoteserverconf`
-- ----------------------------
DROP TABLE IF EXISTS `ofremoteserverconf`;
CREATE TABLE `ofremoteserverconf` (
  `xmppDomain` varchar(255) NOT NULL,
  `remotePort` int(11) default NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY  (`xmppDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofremoteserverconf
-- ----------------------------

-- ----------------------------
-- Table structure for `ofroster`
-- ----------------------------
DROP TABLE IF EXISTS `ofroster`;
CREATE TABLE `ofroster` (
  `rosterID` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `jid` varchar(1024) NOT NULL,
  `sub` tinyint(4) NOT NULL,
  `ask` tinyint(4) NOT NULL,
  `recv` tinyint(4) NOT NULL,
  `nick` varchar(255) default NULL,
  PRIMARY KEY  (`rosterID`),
  KEY `ofRoster_unameid_idx` (`username`),
  KEY `ofRoster_jid_idx` (`jid`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofroster
-- ----------------------------

-- ----------------------------
-- Table structure for `ofrostergroups`
-- ----------------------------
DROP TABLE IF EXISTS `ofrostergroups`;
CREATE TABLE `ofrostergroups` (
  `rosterID` bigint(20) NOT NULL,
  `rank` tinyint(4) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY  (`rosterID`,`rank`),
  KEY `ofRosterGroup_rosterid_idx` (`rosterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofrostergroups
-- ----------------------------

-- ----------------------------
-- Table structure for `ofsaslauthorized`
-- ----------------------------
DROP TABLE IF EXISTS `ofsaslauthorized`;
CREATE TABLE `ofsaslauthorized` (
  `username` varchar(64) NOT NULL,
  `principal` text NOT NULL,
  PRIMARY KEY  (`username`,`principal`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofsaslauthorized
-- ----------------------------

-- ----------------------------
-- Table structure for `ofsecurityauditlog`
-- ----------------------------
DROP TABLE IF EXISTS `ofsecurityauditlog`;
CREATE TABLE `ofsecurityauditlog` (
  `msgID` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `entryStamp` bigint(20) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `node` varchar(255) NOT NULL,
  `details` text,
  PRIMARY KEY  (`msgID`),
  KEY `ofSecurityAuditLog_tstamp_idx` (`entryStamp`),
  KEY `ofSecurityAuditLog_uname_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofsecurityauditlog
-- ----------------------------
INSERT INTO ofsecurityauditlog VALUES ('1', 'admin', '1314934310131', 'set server property provider.auth.className', 'zt-2006399', 'provider.auth.className = org.jivesoftware.openfire.auth.JDBCAuthProvider');
INSERT INTO ofsecurityauditlog VALUES ('2', 'admin', '1314934333085', 'set server property provider.group.className', 'zt-2006399', 'provider.group.className = org.jivesoftware.openfire.group.JDBCGroupProvider');
INSERT INTO ofsecurityauditlog VALUES ('3', 'admin', '1314934378929', 'set server property provider.user.className', 'zt-2006399', 'provider.user.className = org.jivesoftware.openfire.user.JDBCUserProvider');
INSERT INTO ofsecurityauditlog VALUES ('4', 'admin', '1314934454337', 'set server property jdbcProvider.driver', 'zt-2006399', 'jdbcProvider.driver = com.mysql.jdbc.Driver');
INSERT INTO ofsecurityauditlog VALUES ('5', 'admin', '1314934576073', 'set server property jdbcProvider.connectionString', 'zt-2006399', 'jdbcProvider.connectionString = jdbc:mysql://localhost:3306/navigation?user=root&password=root');
INSERT INTO ofsecurityauditlog VALUES ('6', 'admin', '1314934746668', 'set server property jdbcAuthProvider.passwordSQL', 'zt-2006399', 'jdbcAuthProvider.passwordSQL = select password from user where id=?');
INSERT INTO ofsecurityauditlog VALUES ('7', 'admin', '1314934890418', 'set server property jdbcAuthProvider.passwordType', 'zt-2006399', 'jdbcAuthProvider.passwordType = plain');
INSERT INTO ofsecurityauditlog VALUES ('8', 'admin', '1314934951824', 'set server property jdbcAuthProvider.passwordType', 'zt-2006399', 'jdbcAuthProvider.passwordType = md5');
INSERT INTO ofsecurityauditlog VALUES ('9', 'admin', '1314934979996', 'set server property jdbcUserProvider.allUsersSQL', 'zt-2006399', 'jdbcUserProvider.allUsersSQL = select id from user');
INSERT INTO ofsecurityauditlog VALUES ('10', 'admin', '1314935030590', 'set server property jdbcUserProvider.emailField', 'zt-2006399', 'jdbcUserProvider.emailField = mail');
INSERT INTO ofsecurityauditlog VALUES ('11', 'admin', '1314935090871', 'set server property jdbcUserProvider.loadUserSQL', 'zt-2006399', 'jdbcUserProvider.loadUserSQL = select name,mail from user where id=?');
INSERT INTO ofsecurityauditlog VALUES ('12', 'admin', '1314935108434', 'set server property jdbcUserProvider.nameField', 'zt-2006399', 'jdbcUserProvider.nameField = name');
INSERT INTO ofsecurityauditlog VALUES ('13', 'admin', '1314935129355', 'set server property jdbcUserProvider.userCountSQL', 'zt-2006399', 'jdbcUserProvider.userCountSQL = select count(*) from user');
INSERT INTO ofsecurityauditlog VALUES ('14', 'admin', '1314935178965', 'set server property jdbcUserProvider.usernameField', 'zt-2006399', 'jdbcUserProvider.usernameField = name');
INSERT INTO ofsecurityauditlog VALUES ('15', '1', '1315535512641', 'set server property route.all-resources', 'zt-2006399', 'route.all-resources = true');
INSERT INTO ofsecurityauditlog VALUES ('16', '1', '1315535566890', 'set server property xmpp.client.idle', 'zt-2006399', 'xmpp.client.idle = -1');
INSERT INTO ofsecurityauditlog VALUES ('17', '1', '1315535584062', 'set server property xmpp.client.idle.ping', 'zt-2006399', 'xmpp.client.idle.ping = true');
INSERT INTO ofsecurityauditlog VALUES ('18', '1', '1315535646405', 'set server property xmpp.session.conflict-limit', 'zt-2006399', 'xmpp.session.conflict-limit = -1');
INSERT INTO ofsecurityauditlog VALUES ('19', '1', '1318846800885', 'destroyed MUC room 100001', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('20', '1', '1318847493150', 'set MUC affilation to admin for 83@zt-2006399 in 100002', 'zt-2006399', null);
INSERT INTO ofsecurityauditlog VALUES ('21', '1', '1318847622010', 'set MUC affilation to owner for 83@zt-2006399 in 100002', 'zt-2006399', null);
INSERT INTO ofsecurityauditlog VALUES ('22', '1', '1318848773791', 'created new MUC room 100', 'zt-2006399', 'subject = jj\nroomdesc = jj\nroomname = jj\nmaxusers = 30');
INSERT INTO ofsecurityauditlog VALUES ('23', '1', '1318848814135', 'destroyed MUC room 100003', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('24', '1', '1318848817306', 'destroyed MUC room 100', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('25', '1', '1318849415963', 'updated MUC room 100001', 'zt-2006399', 'subject = zt\nroomdesc = 100001\nroomname = 100001\nmaxusers = 30');
INSERT INTO ofsecurityauditlog VALUES ('26', '1', '1318905237340', 'destroyed MUC room 100004', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('27', '1', '1318905240324', 'destroyed MUC room 100003', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('28', '1', '1318905243121', 'destroyed MUC room 100001', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('29', '1', '1319177703173', 'set MUC affilation to admin for 89@zt-2006399 in 100001', 'zt-2006399', null);
INSERT INTO ofsecurityauditlog VALUES ('30', '1', '1319184197365', 'destroyed MUC room 10003', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('31', '1', '1319184200318', 'destroyed MUC room 10001', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('32', '1', '1319184202881', 'destroyed MUC room 100001', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('33', '1', '1319187522849', 'destroyed MUC room 10001', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('34', '1', '1319187525131', 'destroyed MUC room 10002', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('35', '1', '1319194791287', 'destroyed MUC room 10001', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('36', '1', '1319194793677', 'destroyed MUC room 10002', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('37', '1', '1319194795709', 'destroyed MUC room 10003', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('38', '1', '1319194797881', 'destroyed MUC room 10004', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('39', '1', '1319194799849', 'destroyed MUC room 10005', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('40', '1', '1319194802240', 'destroyed MUC room 10006', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('41', '1', '1319194804490', 'destroyed MUC room 10007', 'zt-2006399', 'reason = null\nalt jid = null');
INSERT INTO ofsecurityauditlog VALUES ('42', '1', '1319194806568', 'destroyed MUC room 10008', 'zt-2006399', 'reason = null\nalt jid = null');

-- ----------------------------
-- Table structure for `ofuser`
-- ----------------------------
DROP TABLE IF EXISTS `ofuser`;
CREATE TABLE `ofuser` (
  `username` varchar(64) NOT NULL,
  `plainPassword` varchar(32) default NULL,
  `encryptedPassword` varchar(255) default NULL,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  PRIMARY KEY  (`username`),
  KEY `ofUser_cDate_idx` (`creationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofuser
-- ----------------------------
INSERT INTO ofuser VALUES ('admin', 'admin', '', 'Administrator', 'admin@example.com', '0', '0');

-- ----------------------------
-- Table structure for `ofuserflag`
-- ----------------------------
DROP TABLE IF EXISTS `ofuserflag`;
CREATE TABLE `ofuserflag` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `startTime` char(15) default NULL,
  `endTime` char(15) default NULL,
  PRIMARY KEY  (`username`,`name`),
  KEY `ofUserFlag_sTime_idx` (`startTime`),
  KEY `ofUserFlag_eTime_idx` (`endTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofuserflag
-- ----------------------------

-- ----------------------------
-- Table structure for `ofuserprop`
-- ----------------------------
DROP TABLE IF EXISTS `ofuserprop`;
CREATE TABLE `ofuserprop` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY  (`username`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofuserprop
-- ----------------------------

-- ----------------------------
-- Table structure for `ofvcard`
-- ----------------------------
DROP TABLE IF EXISTS `ofvcard`;
CREATE TABLE `ofvcard` (
  `username` varchar(64) NOT NULL,
  `vcard` mediumtext NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofvcard
-- ----------------------------

-- ----------------------------
-- Table structure for `ofversion`
-- ----------------------------
DROP TABLE IF EXISTS `ofversion`;
CREATE TABLE `ofversion` (
  `name` varchar(50) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ofversion
-- ----------------------------
INSERT INTO ofversion VALUES ('openfire', '21');
