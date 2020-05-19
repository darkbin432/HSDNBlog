/*
Navicat MySQL Data Transfer

Source Server         : hello
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : hsdn

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2020-05-19 14:59:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博文编号',
  `content` varchar(8191) COLLATE utf8_bin NOT NULL COMMENT '博文内容',
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '发表该博文的用户ID',
  `time` datetime NOT NULL COMMENT '博文的发表时间',
  `title` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博文的标题',
  `type` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博文的类型',
  PRIMARY KEY (`blog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='博客表，记录博客的信息';

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'content_', 'test001', '2020-05-02 15:29:44', 'a blog', 'type1');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `blog_id` int(11) NOT NULL COMMENT '被评论的博客ID',
  `content` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `time` datetime NOT NULL COMMENT '评论发布时间',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户评论博客表，记录用户对博客的评论信息';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'test001', '1', 'content_', '2020-05-14 09:18:18');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_path` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博客资源文件路径',
  `uploader_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '博客资源文件上传者ID',
  PRIMARY KEY (`file_path`),
  KEY `uploader_id` (`uploader_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`uploader_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='博客资源文件表，记录博客资源文件的信息';

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('E:\\study', 'test002');

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `noticer` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '关注者的用户ID',
  `follower` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '被关注者的用户ID',
  PRIMARY KEY (`noticer`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`noticer`) REFERENCES `user` (`user_id`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户关注表，记录用户的关注信息';

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('test001', 'test002');

-- ----------------------------
-- Table structure for `letter`
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `content` varchar(8191) COLLATE utf8_bin NOT NULL COMMENT '私信内容',
  `recipient_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '收件人ID',
  `sender_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '发件人ID',
  `time` datetime NOT NULL COMMENT '私信发送时间',
  PRIMARY KEY (`letter_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `letter_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `letter_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='私信表，记录私信信息';

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('1', 'content_', 'test002', 'test001', '2020-05-05 09:18:32');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `content` varchar(8191) COLLATE utf8_bin NOT NULL COMMENT '公告内容',
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '发表该公告的管理员ID',
  `time` datetime NOT NULL COMMENT '公告发布时间',
  PRIMARY KEY (`notice_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公告表，记录公告的信息';

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'content_', 'admin001', '2020-05-08 11:38:24');

-- ----------------------------
-- Table structure for `praise`
-- ----------------------------
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `blog_id` int(11) NOT NULL COMMENT '博文编号',
  PRIMARY KEY (`user_id`,`blog_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `praise_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `praise_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='博客点赞表，记录博客的点赞信息';

-- ----------------------------
-- Records of praise
-- ----------------------------
INSERT INTO `praise` VALUES ('test001', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `password` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户的密码',
  `type` tinyint(1) NOT NULL COMMENT '用户类型 0普通用户 1管理员',
  `sex` int(11) NOT NULL DEFAULT '1' COMMENT '性别',
  `phone_number` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `nickname` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表，记录用户的信息';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin001', '202CB962AC59075B964B07152D234B70', '1', '1', '12345678977', 'Admin001', '0');
INSERT INTO `user` VALUES ('test001', '202CB962AC59075B964B07152D234B70', '0', '1', null, 'Test001', '0');
INSERT INTO `user` VALUES ('test002', '202CB962AC59075B964B07152D234B70', '0', '0', '13854589657', 'Test002', '0');

-- ----------------------------
-- Table structure for `user_download_file`
-- ----------------------------
DROP TABLE IF EXISTS `user_download_file`;
CREATE TABLE `user_download_file` (
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `file_path` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博客资源文件路径',
  PRIMARY KEY (`user_id`,`file_path`),
  KEY `file_path` (`file_path`),
  CONSTRAINT `user_download_file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_download_file_ibfk_2` FOREIGN KEY (`file_path`) REFERENCES `file` (`file_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户下载文件表，记录用户下载的文件';

-- ----------------------------
-- Records of user_download_file
-- ----------------------------
INSERT INTO `user_download_file` VALUES ('test001', 'E:\\study');

-- ----------------------------
-- Table structure for `user_view_notice`
-- ----------------------------
DROP TABLE IF EXISTS `user_view_notice`;
CREATE TABLE `user_view_notice` (
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `notice_id` int(11) NOT NULL COMMENT '公告ID',
  PRIMARY KEY (`user_id`,`notice_id`),
  KEY `notice_id` (`notice_id`),
  CONSTRAINT `user_view_notice_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_view_notice_ibfk_2` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户查看公告表，记录公告对应发送给的用户';

-- ----------------------------
-- Records of user_view_notice
-- ----------------------------
INSERT INTO `user_view_notice` VALUES ('test001', '1');
