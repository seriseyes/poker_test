-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.8.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table poker_test.action_log
DROP TABLE IF EXISTS `action_log`;
CREATE TABLE IF NOT EXISTS `action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `action_date` datetime NOT NULL,
  `action_url` varchar(1000) NOT NULL,
  `action_method` varchar(50) NOT NULL,
  `action_data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.action_log: 0 rows
/*!40000 ALTER TABLE `action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_log` ENABLE KEYS */;

-- Dumping structure for table poker_test.api_access
DROP TABLE IF EXISTS `api_access`;
CREATE TABLE IF NOT EXISTS `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `all_access` tinyint(1) NOT NULL DEFAULT 0,
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.api_access: 0 rows
/*!40000 ALTER TABLE `api_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_access` ENABLE KEYS */;

-- Dumping structure for table poker_test.api_keys
DROP TABLE IF EXISTS `api_keys`;
CREATE TABLE IF NOT EXISTS `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.api_keys: 0 rows
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;

-- Dumping structure for table poker_test.api_limits
DROP TABLE IF EXISTS `api_limits`;
CREATE TABLE IF NOT EXISTS `api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.api_limits: 0 rows
/*!40000 ALTER TABLE `api_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_limits` ENABLE KEYS */;

-- Dumping structure for table poker_test.api_logs
DROP TABLE IF EXISTS `api_logs`;
CREATE TABLE IF NOT EXISTS `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text DEFAULT NULL,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.api_logs: 0 rows
/*!40000 ALTER TABLE `api_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_logs` ENABLE KEYS */;

-- Dumping structure for table poker_test.article
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langcode` char(2) DEFAULT NULL,
  `mediatype_id` tinyint(3) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `articletype_id` int(10) unsigned NOT NULL,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `template` varchar(100) DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `referdate` datetime DEFAULT NULL,
  `refervalue` varchar(255) DEFAULT NULL,
  `payable` tinyint(1) NOT NULL,
  `allowcomment` tinyint(1) NOT NULL,
  `commentcount` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article: 3 rows
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `langcode`, `mediatype_id`, `category_id`, `articletype_id`, `meta_title`, `meta_keywords`, `meta_description`, `picture_id`, `title`, `subtitle`, `content`, `author_id`, `template`, `ordering`, `approved`, `featured`, `referdate`, `refervalue`, `payable`, `allowcomment`, `commentcount`, `createddate`, `modifieddate`, `ipaddress`, `user_id`) VALUES
	(1, 'en', 0, 2, 2, '', '', '', 0, 'Мэдээ', '', 'Hello', 0, '', 0, 1, 0, '0000-00-00 00:00:00', '', 0, 0, 0, '0000-00-00 00:00:00', '2019-11-15 09:30:35', '::1', 1),
	(2, 'en', 0, 1, 1, '', '', '', 0, 'Main - not', '', '<h1>Тусламж</h1>\r\n<pre>&nbsp;</pre>\r\n<p class="cont"><br />Манай NN Poker тоглоом нь Texas Hold\'Em стандартаар хийгдсэн болно.</p>\r\n<pre><br /><br /></pre>\r\n<h3 class="titl">1. Мөнгө байршуулах</h3>\r\n<pre>&nbsp;</pre>\r\n<hr />\r\n<pre>&nbsp;</pre>\r\n<p class="cont"><br />Та тоглоомын дансандаа мөнгө байршуулахын тулд "ХААН БАНК Э.Хатанбаатар 5018074422" дансанд<br />мөнгөө шилжүүлээд тоглоомдоо нэвтрэн орж доорх хүсэлтийг илгээнэ!</p>\r\n<pre>&nbsp;</pre>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Банк сонгох - мөнгө шилжүүлсэн банкаа сонгоно</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Дансны дугаар - мөнгө шилжүүлсэн дансны дугаараа бичнэ</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Дансны нэр - мөнгө шилжүүлсэн дансны нэрээ бичнэ</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Мөнгөн дүн - шилжүүлсэн мөнгөн дүнгээ бичнэ</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<pre>&nbsp;</pre>\r\n<p class="cont"><br />Дээрх талбарыг бүрэн гүйцэд бөглөөд ИЛГЭЭX товч дарж хүсэлтээ илгээсэн байх ёстой. Ингэснээр<br />бид таны илгээсэн хүсэлтийг шалгаад тоглоомын дансыг тань цэнэглэх болно.</p>\r\n<pre><br /><br /></pre>\r\n<h3 class="titl">2. Мөнгө татах</h3>\r\n<pre>&nbsp;</pre>\r\n<hr />\r\n<pre>&nbsp;</pre>\r\n<p class="cont"><br />Та тоглоомын данснаасаа өөрийн банкны дансанд мөнгө хүлээн авахын тулд доорх хүсэлтийг<br />илгээнэ!</p>\r\n<pre>&nbsp;</pre>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Банк сонгох - мөнгө хүлээн авах банкаа сонгоно</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Дансны дугаар - мөнгө хүлээн авах дансны дугаараа бичнэ</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Дансны нэр - мөнгө хүлээн авах дансны нэрээ бичнэ</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<ul>\r\n<li>Мөнгөн дүн - хүлээн авах мөнгөн дүнгээ бичнэ</li>\r\n</ul>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<pre>&nbsp;</pre>\r\n<p class="cont"><br />Дээрх талбарыг бүрэн гүйцэд бөглөөд ИЛГЭЭX товч дарж хүсэлтээ илгээсэн байх ёстой. Ингэснээр<br />бид таны илгээсэн хүсэлтийг шалгаад таны банкны дансанд мөнгө шилжүүлнэ.</p>', 0, '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, 0, 0, '0000-00-00 00:00:00', '2019-12-05 07:25:11', '::1', 2),
	(3, 'en', 0, 1, 1, '', '', '', 0, 'Main', '', '<pre>&lt;h1&gt;Тусламж&lt;/h1&gt;<br />&lt;p class="cont"&gt;<br />    Манай NN Poker тоглоом нь Texas Hold\'Em стандартаар хийгдсэн болно.<br />&lt;/p&gt;<br /><br />&lt;h3 class="titl"&gt;1. Мөнгө байршуулах&lt;/h3&gt;<br />&lt;hr&gt;<br />&lt;p class="cont"&gt;<br />    Та тоглоомын дансандаа мөнгө байршуулахын тулд "ХААН БАНК Э.Хатанбаатар 5018074422" дансанд<br />    мөнгөө шилжүүлээд тоглоомдоо нэвтрэн орж доорх хүсэлтийг илгээнэ!<br />&lt;/p&gt;<br />&lt;ul&gt;<br />    &lt;li&gt;Банк сонгох - мөнгө шилжүүлсэн банкаа сонгоно&lt;/li&gt;<br />    &lt;li&gt;Дансны дугаар - мөнгө шилжүүлсэн дансны дугаараа бичнэ&lt;/li&gt;<br />    &lt;li&gt;Дансны нэр - мөнгө шилжүүлсэн дансны нэрээ бичнэ&lt;/li&gt;<br />    &lt;li&gt;Мөнгөн дүн - шилжүүлсэн мөнгөн дүнгээ бичнэ&lt;/li&gt;<br />&lt;/ul&gt;<br />&lt;p class="cont"&gt;<br />    Дээрх талбарыг бүрэн гүйцэд бөглөөд ИЛГЭЭX товч дарж хүсэлтээ илгээсэн байх ёстой. Ингэснээр<br />    бид таны илгээсэн хүсэлтийг шалгаад тоглоомын дансыг тань цэнэглэх болно.<br />&lt;/p&gt;<br /><br />&lt;h3 class="titl"&gt;2. Мөнгө татах&lt;/h3&gt;<br />&lt;hr&gt;<br />&lt;p class="cont"&gt;<br />    Та тоглоомын данснаасаа өөрийн банкны дансанд мөнгө хүлээн авахын тулд доорх хүсэлтийг<br />    илгээнэ!<br />&lt;/p&gt;<br />&lt;ul&gt;<br />    &lt;li&gt;Банк сонгох - мөнгө хүлээн авах банкаа сонгоно&lt;/li&gt;<br />    &lt;li&gt;Дансны дугаар - мөнгө хүлээн авах дансны дугаараа бичнэ&lt;/li&gt;<br />    &lt;li&gt;Дансны нэр - мөнгө хүлээн авах дансны нэрээ бичнэ&lt;/li&gt;<br />    &lt;li&gt;Мөнгөн дүн - хүлээн авах мөнгөн дүнгээ бичнэ&lt;/li&gt;<br />&lt;/ul&gt;<br />&lt;p class="cont"&gt;<br />    Дээрх талбарыг бүрэн гүйцэд бөглөөд ИЛГЭЭX товч дарж хүсэлтээ илгээсэн байх ёстой. Ингэснээр<br />    бид таны илгээсэн хүсэлтийг шалгаад таны банкны дансанд мөнгө шилжүүлнэ.<br />&lt;/p&gt;</pre>', 0, '', 0, 1, 0, '0000-00-00 00:00:00', '', 0, 0, 0, '2019-12-05 07:06:41', '2019-12-05 07:06:41', '::1', 2);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- Dumping structure for table poker_test.articletype
DROP TABLE IF EXISTS `articletype`;
CREATE TABLE IF NOT EXISTS `articletype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langcode` char(2) DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.articletype: 2 rows
/*!40000 ALTER TABLE `articletype` DISABLE KEYS */;
INSERT INTO `articletype` (`id`, `langcode`, `category_id`, `parent_id`, `picture_id`, `title`, `subtitle`, `link`, `level`, `ordering`, `deleted`, `featured`) VALUES
	(1, NULL, 1, 0, 0, 'default', '', NULL, 0, 1, 0, 0),
	(2, NULL, 2, 0, 0, 'main', '', NULL, 0, 1, 0, 0);
/*!40000 ALTER TABLE `articletype` ENABLE KEYS */;

-- Dumping structure for table poker_test.articletype_attribute
DROP TABLE IF EXISTS `articletype_attribute`;
CREATE TABLE IF NOT EXISTS `articletype_attribute` (
  `articletype_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `articletype_id__attribute_id` (`articletype_id`,`attribute_id`),
  KEY `articletype_id` (`articletype_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.articletype_attribute: 0 rows
/*!40000 ALTER TABLE `articletype_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `articletype_attribute` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_added
DROP TABLE IF EXISTS `article_added`;
CREATE TABLE IF NOT EXISTS `article_added` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `customcode` varchar(50) DEFAULT NULL,
  `sharedurl` varchar(1000) DEFAULT NULL,
  `embedhtml` text DEFAULT NULL,
  `googlemap` text DEFAULT NULL,
  `addtitle` varchar(250) DEFAULT NULL,
  `addsubtitle` varchar(500) DEFAULT NULL,
  `addcontent` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_added: 3 rows
/*!40000 ALTER TABLE `article_added` DISABLE KEYS */;
INSERT INTO `article_added` (`id`, `article_id`, `customcode`, `sharedurl`, `embedhtml`, `googlemap`, `addtitle`, `addsubtitle`, `addcontent`) VALUES
	(1, 1, NULL, '', '', '', '', '', ''),
	(2, 2, NULL, '', '', '', '', '', ''),
	(3, 3, NULL, '', '', '', '', '', '');
/*!40000 ALTER TABLE `article_added` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_attribute
DROP TABLE IF EXISTS `article_attribute`;
CREATE TABLE IF NOT EXISTS `article_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `value` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id__attribute_id` (`article_id`,`attribute_id`),
  KEY `article_id` (`article_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_attribute: 0 rows
/*!40000 ALTER TABLE `article_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_attribute` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_category
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE IF NOT EXISTS `article_category` (
  `article_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_category: 0 rows
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_comment
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE IF NOT EXISTS `article_comment` (
  `article_id` int(10) unsigned NOT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `article_id__comment_id` (`article_id`,`comment_id`),
  KEY `article_id` (`article_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_comment: 0 rows
/*!40000 ALTER TABLE `article_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_comment` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_extend
DROP TABLE IF EXISTS `article_extend`;
CREATE TABLE IF NOT EXISTS `article_extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `hitcount` int(11) NOT NULL,
  `sharecount` int(11) NOT NULL,
  `sendcount` int(11) NOT NULL,
  `votecount` int(11) NOT NULL,
  `likecount` int(11) NOT NULL,
  `dislikecount` int(11) NOT NULL,
  `subscribecount` int(11) NOT NULL,
  `downloadcount` int(11) NOT NULL,
  `bookmarkcount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_extend: 0 rows
/*!40000 ALTER TABLE `article_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_extend` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_item
DROP TABLE IF EXISTS `article_item`;
CREATE TABLE IF NOT EXISTS `article_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_item: 0 rows
/*!40000 ALTER TABLE `article_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_item` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_like
DROP TABLE IF EXISTS `article_like`;
CREATE TABLE IF NOT EXISTS `article_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `onelike` tinyint(1) NOT NULL,
  `dislike` tinyint(1) NOT NULL,
  `createddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_like: 0 rows
/*!40000 ALTER TABLE `article_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_like` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_media
DROP TABLE IF EXISTS `article_media`;
CREATE TABLE IF NOT EXISTS `article_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `alt` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_media: 0 rows
/*!40000 ALTER TABLE `article_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_media` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_meta
DROP TABLE IF EXISTS `article_meta`;
CREATE TABLE IF NOT EXISTS `article_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_meta: 0 rows
/*!40000 ALTER TABLE `article_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_meta` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_notification
DROP TABLE IF EXISTS `article_notification`;
CREATE TABLE IF NOT EXISTS `article_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_notification: ~0 rows (approximately)
/*!40000 ALTER TABLE `article_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_notification` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_tag
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE IF NOT EXISTS `article_tag` (
  `article_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `article_id__tag_id` (`article_id`,`tag_id`) USING BTREE,
  KEY `tag_id` (`tag_id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_tag: 0 rows
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;

-- Dumping structure for table poker_test.article_vote
DROP TABLE IF EXISTS `article_vote`;
CREATE TABLE IF NOT EXISTS `article_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `votenumber` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.article_vote: 0 rows
/*!40000 ALTER TABLE `article_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_vote` ENABLE KEYS */;

-- Dumping structure for table poker_test.attribute
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE IF NOT EXISTS `attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attributetype_id` int(10) unsigned NOT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `filterable` tinyint(1) NOT NULL,
  `benumber` tinyint(1) NOT NULL,
  `bedate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attributetype_id` (`attributetype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.attribute: 0 rows
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;

-- Dumping structure for table poker_test.attributetype
DROP TABLE IF EXISTS `attributetype`;
CREATE TABLE IF NOT EXISTS `attributetype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.attributetype: 6 rows
/*!40000 ALTER TABLE `attributetype` DISABLE KEYS */;
INSERT INTO `attributetype` (`id`, `code`, `name`, `ordering`, `deleted`) VALUES
	(1, 'select', 'Жагсаалтаас нэгийг сонгоно', 1, 0),
	(2, 'radio', 'Нэгийг л сонгоно', 2, 0),
	(3, 'checkbox', 'Олныг сонгож болно', 3, 0),
	(4, 'text', 'Текст оруулна', 4, 0),
	(5, 'textarea', 'Агуулга оруулна', 5, 0),
	(6, 'hidden', 'Утга оруулна', 6, 0);
/*!40000 ALTER TABLE `attributetype` ENABLE KEYS */;

-- Dumping structure for table poker_test.attribute_item
DROP TABLE IF EXISTS `attribute_item`;
CREATE TABLE IF NOT EXISTS `attribute_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `value` varchar(250) NOT NULL,
  `text` varchar(500) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.attribute_item: 0 rows
/*!40000 ALTER TABLE `attribute_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_item` ENABLE KEYS */;

-- Dumping structure for table poker_test.author
DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authortype_id` int(10) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `about` text DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `link` varchar(500) NOT NULL,
  `address` varchar(250) NOT NULL,
  `customdata` mediumtext DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `mark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authortype_id` (`authortype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.author: 0 rows
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;

-- Dumping structure for table poker_test.authortype
DROP TABLE IF EXISTS `authortype`;
CREATE TABLE IF NOT EXISTS `authortype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.authortype: 14 rows
/*!40000 ALTER TABLE `authortype` DISABLE KEYS */;
INSERT INTO `authortype` (`id`, `code`, `name`, `ordering`, `deleted`) VALUES
	(1, 'other', 'Бусад', 1, 0),
	(2, 'people', 'Хувь хүмүүс', 2, 0),
	(3, 'company', 'Компани', 3, 0),
	(4, 'government', 'Төрийн байгууллага', 4, 0),
	(5, 'organization', 'Төрийн бус байгууллага', 5, 0),
	(6, 'artist', 'Уран бүтээлчид', 6, 0),
	(7, 'factory', 'Үйлдвэр', 7, 0),
	(8, 'service', 'Үйлчилгээ', 8, 0),
	(9, 'trade', 'Худалдаа арилжаа', 9, 0),
	(10, 'education', 'Боловсрол', 10, 0),
	(11, 'bank', 'Банк санхүү', 11, 0),
	(12, 'insurance', 'Даатгал', 12, 0),
	(13, 'employee', 'Албан хаагчид', 13, 0),
	(14, 'student', 'Оюунтан сурагчид', 14, 0);
/*!40000 ALTER TABLE `authortype` ENABLE KEYS */;

-- Dumping structure for table poker_test.banner
DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bannertype_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `contract` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `embedhtml` mediumtext DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `linktext` text DEFAULT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `clickcount` int(11) NOT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bannertype_id` (`bannertype_id`),
  KEY `media_id` (`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.banner: 0 rows
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

-- Dumping structure for table poker_test.bannertype
DROP TABLE IF EXISTS `bannertype`;
CREATE TABLE IF NOT EXISTS `bannertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `changes` tinyint(3) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.bannertype: 5 rows
/*!40000 ALTER TABLE `bannertype` DISABLE KEYS */;
INSERT INTO `bannertype` (`id`, `code`, `name`, `width`, `height`, `changes`, `price`) VALUES
	(1, 'site_top', 'Сайтын хамгийн дээд талын баннерууд', 0, 0, 0, 0.00),
	(2, 'side_top', 'Хажуугийн дээд талд байрлах баннерууд', 0, 0, 0, 0.00),
	(3, 'home_top', 'Нүүрний хуудасны дээд талд байрлах баннерууд', 0, 0, 0, 0.00),
	(4, 'home_middle', 'Нүүрний мэдээний дунд байрлах баннерууд', 0, 0, 0, 0.00),
	(5, 'content_middle', 'Мэдээний агуулгын дунд байрлах баннерууд', 0, 0, 0, 0.00);
/*!40000 ALTER TABLE `bannertype` ENABLE KEYS */;

-- Dumping structure for table poker_test.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langcode` char(2) DEFAULT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `control` varchar(50) DEFAULT NULL,
  `template` varchar(100) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sitemapped` tinyint(1) NOT NULL,
  `mark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.category: 2 rows
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `langcode`, `parent_id`, `meta_title`, `meta_keywords`, `meta_description`, `picture_id`, `title`, `subtitle`, `link`, `control`, `template`, `level`, `ordering`, `deleted`, `featured`, `sitemapped`, `mark`) VALUES
	(1, 'en', 0, 'help', 'help', 'help', 0, 'help', '', '', '', '', 0, 0, 0, 0, 0, ''),
	(2, 'en', 0, 'news', 'news', 'news', 0, 'news', '', '', '', '', 0, 0, 0, 0, 0, '');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table poker_test.category_attribute
DROP TABLE IF EXISTS `category_attribute`;
CREATE TABLE IF NOT EXISTS `category_attribute` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `category_id__attribute_id` (`category_id`,`attribute_id`),
  KEY `category_id` (`category_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.category_attribute: 0 rows
/*!40000 ALTER TABLE `category_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_attribute` ENABLE KEYS */;

-- Dumping structure for table poker_test.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- Dumping data for table poker_test.city: 22 rows
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `country_id`, `code`, `name`, `ordering`, `deleted`) VALUES
	(5, 1, NULL, 'Архангай', 0, 0),
	(6, 1, NULL, 'Баян-Өлгий', 0, 0),
	(7, 1, NULL, 'Баянхонгор', 0, 0),
	(8, 1, NULL, 'Булган', 0, 0),
	(9, 1, NULL, 'Говь-Алтай', 0, 0),
	(10, 1, NULL, 'Дорноговь', 0, 0),
	(11, 1, NULL, 'Дорнод', 0, 0),
	(12, 1, NULL, 'Дундговь', 0, 0),
	(13, 1, NULL, 'Завхан', 0, 0),
	(14, 1, NULL, 'Өвөрхангай', 0, 0),
	(15, 1, NULL, 'Өмнөговь', 0, 0),
	(16, 1, NULL, 'Сүхбаатар', 0, 0),
	(17, 1, NULL, 'Сэлэнгэ', 0, 0),
	(18, 1, NULL, 'Төв', 0, 0),
	(19, 1, NULL, 'Увс', 0, 0),
	(20, 1, NULL, 'Ховд', 0, 0),
	(21, 1, NULL, 'Хөвсгөл', 0, 0),
	(22, 1, NULL, 'Хэнтий', 0, 0),
	(23, 1, NULL, 'Дархан-Уул', 0, 0),
	(24, 1, NULL, 'Улаанбаатар', 0, 0),
	(25, 1, NULL, 'Орхон', 0, 0),
	(26, 1, NULL, 'Говьсүмбэр', 0, 0);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table poker_test.cms_sessions
DROP TABLE IF EXISTS `cms_sessions`;
CREATE TABLE IF NOT EXISTS `cms_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`),
  KEY `ip_address` (`ip_address`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- Dumping data for table poker_test.cms_sessions: 13 rows
/*!40000 ALTER TABLE `cms_sessions` DISABLE KEYS */;
INSERT INTO `cms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
	('tv1tmn3diobss7n3dlv61188n6u9h77k', '::1', 1574249280, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537343234383538313b636f6e6e6563745f626c6f636b65645f75726c7c733a32343a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f223b5f5f555345525f53455353494f4e5f5f7c733a313a2231223b),
	('8nl68uav7iiloj6jeqhrff1s4bshepjf', '::1', 1574250151, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537343235303135303b6572726f727c733a35323a22596f752068617665206265656e2064656e6965642061636365737320746f206170702f67616d6563617368696f2f706167652f31223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d636f6e6e6563745f626c6f636b65645f75726c7c733a34353a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f6170702f67616d6563617368696f2f706167652f31223b),
	('e53j6ulsfgv251j3199mkebh3b8pbkii', '::1', 1574251200, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537343235313230303b636f6e6e6563745f626c6f636b65645f75726c7c733a34363a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f6170702f67616d65726571756573742f656469742f31223b6572726f727c733a35333a22596f752068617665206265656e2064656e6965642061636365737320746f206170702f67616d65726571756573742f656469742f31223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
	('a6uk57ifc4esgmec6gs4s8ed4uk4pcon', '::1', 1574253341, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537343235333230333b636f6e6e6563745f626c6f636b65645f75726c7c733a32363a22687474703a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2231223b),
	('uv668hgqm426q9p0v56du2b9jet8ik93', '::1', 1575028924, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353032383330343b636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2231223b),
	('qbmo910nc1mfq7beoi2nidp96t1qjomu', '::1', 1575625232, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353632353233323b6572726f727c733a33343a22596f752068617665206265656e2064656e6965642061636365737320746f20617070223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b),
	('osjjf7qdc4tdrafhpg8drsnl52bjgp5t', '::1', 1575116693, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353131363638343b636f6e6e6563745f626c6f636b65645f75726c7c733a34363a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f6170702f67616d65726571756573742f706167652f31223b5f5f555345525f53455353494f4e5f5f7c733a313a2232223b),
	('dnpcmu9mj1pe4tdvtk7qgh4d2f4cu4q6', '::1', 1575451177, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353435313137363b636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2232223b),
	('a1vfq9lfnvog19b3liq3r5m2svg4memn', '::1', 1575481958, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353438313935373b636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2232223b),
	('c1l7kevfr20gnft71pfhkap9mkrtju3g', '::1', 1575541723, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353534303835333b636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2232223b),
	('qahf58fno4v66fd3fihi1osjmk3d1436', '::1', 1575627410, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353632373431303b636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2232223b),
	('kadc3ren23s500vh18m8ocuauc8jq52d', '::1', 1575798105, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353739373735303b636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2232223b),
	('fiugfgn9fcslpqr8qr1p72unm5no30k2', '::1', 1575765067, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313537353736343634313b636f6e6e6563745f626c6f636b65645f75726c7c733a32373a2268747470733a2f2f6c6f63616c686f73742f706f6b65722f617070223b5f5f555345525f53455353494f4e5f5f7c733a313a2232223b);
/*!40000 ALTER TABLE `cms_sessions` ENABLE KEYS */;

-- Dumping structure for table poker_test.comment
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `fixedmessage` varchar(500) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `createddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.comment: 0 rows
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table poker_test.contact
DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `message` text DEFAULT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `answer` text DEFAULT NULL,
  `responsed` tinyint(1) NOT NULL,
  `referint` int(11) NOT NULL,
  `referstr` varchar(50) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.contact: 0 rows
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table poker_test.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isocode` smallint(6) NOT NULL,
  `code2` char(2) DEFAULT NULL,
  `code3` char(3) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.country: 1 rows
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`id`, `isocode`, `code2`, `code3`, `name`, `ordering`, `deleted`) VALUES
	(1, 496, 'MN', 'MNG', 'Монгол', 0, 0);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumping structure for table poker_test.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `barcode` text DEFAULT NULL,
  `numcode` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `regnumber` varchar(50) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `regaddress` varchar(250) DEFAULT NULL,
  `workphone` varchar(50) DEFAULT NULL,
  `localphone` varchar(50) DEFAULT NULL,
  `mobilephone` varchar(250) DEFAULT NULL,
  `otherphone` varchar(250) DEFAULT NULL,
  `workemail` varchar(100) DEFAULT NULL,
  `privateemail` varchar(100) DEFAULT NULL,
  `workpos` varchar(250) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `wage` decimal(18,2) NOT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `carnumber` varchar(50) DEFAULT NULL,
  `flag` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `customerquality_id` int(10) unsigned NOT NULL,
  `respondent_id` int(10) unsigned NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.customer: 0 rows
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table poker_test.customerquality
DROP TABLE IF EXISTS `customerquality`;
CREATE TABLE IF NOT EXISTS `customerquality` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.customerquality: 6 rows
/*!40000 ALTER TABLE `customerquality` DISABLE KEYS */;
INSERT INTO `customerquality` (`id`, `code`, `name`, `ordering`, `deleted`) VALUES
	(1, '', 'Хамтрагч', 1, 0),
	(2, '', 'Харилцагч', 2, 0),
	(3, '', 'Нийлүүлэгч', 3, 0),
	(4, '', 'Худалдан авагч', 4, 0),
	(5, '', 'Онцлох', 5, 0),
	(6, '', 'Асуудалтай', 6, 0);
/*!40000 ALTER TABLE `customerquality` ENABLE KEYS */;

-- Dumping structure for table poker_test.district
DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.district: 350 rows
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`id`, `city_id`, `code`, `name`, `ordering`, `deleted`) VALUES
	(5, 5, NULL, 'Булган', 0, 0),
	(6, 5, NULL, 'Их Тамир', 0, 0),
	(7, 5, NULL, 'Өндөр-Улаан', 0, 0),
	(8, 5, NULL, 'Өлзийт', 0, 0),
	(9, 5, NULL, 'Өгий нуур', 0, 0),
	(10, 5, NULL, 'Түвшрүүлэх', 0, 0),
	(11, 5, NULL, 'Хангай', 0, 0),
	(12, 5, NULL, 'Хайрхан', 0, 0),
	(13, 5, NULL, 'Хотонт', 0, 0),
	(15, 5, NULL, 'Цэнхэр', 0, 0),
	(16, 5, NULL, 'Эрдэнэмандал', 0, 0),
	(17, 5, NULL, 'Цахир', 0, 0),
	(18, 5, NULL, 'Цэцэрлэг', 0, 0),
	(19, 6, NULL, 'Алтай', 0, 0),
	(20, 6, NULL, 'Алтанцөгц', 0, 0),
	(21, 6, NULL, 'Баяннуур', 0, 0),
	(22, 6, NULL, 'Булган', 0, 0),
	(23, 6, NULL, 'Буянт', 0, 0),
	(24, 6, NULL, 'Дэлүүн', 0, 0),
	(25, 6, NULL, 'Сагсай', 0, 0),
	(26, 6, NULL, 'Толбо', 0, 0),
	(27, 6, NULL, 'Улаан хус', 0, 0),
	(28, 6, NULL, 'Цагаан нуур', 0, 0),
	(29, 6, NULL, 'Өлгий', 0, 0),
	(30, 7, NULL, 'Баянговь', 0, 0),
	(31, 7, NULL, 'Баянлиг', 0, 0),
	(32, 7, NULL, 'Баян-Овоо', 0, 0),
	(33, 7, NULL, 'Баянцагаан', 0, 0),
	(34, 7, NULL, 'Богд', 0, 0),
	(35, 7, NULL, 'Баян-Өндөр', 0, 0),
	(36, 7, NULL, 'Бөмбөгөр', 0, 0),
	(37, 7, NULL, 'Галуут', 0, 0),
	(38, 7, NULL, 'Гурван булаг', 0, 0),
	(39, 7, NULL, 'Жаргалант', 0, 0),
	(40, 7, NULL, 'Жинст', 0, 0),
	(41, 7, NULL, 'Өлзийт', 0, 0),
	(42, 7, NULL, 'Хүрээмарал', 0, 0),
	(43, 7, NULL, 'Эрдэнэцогт', 0, 0),
	(44, 7, NULL, 'Шаргалжуут', 0, 0),
	(45, 7, NULL, 'Баянхонгор', 0, 0),
	(46, 8, NULL, 'Бугат', 0, 0),
	(47, 8, NULL, 'Бүрэгхангай', 0, 0),
	(48, 8, NULL, 'Гурванбулаг', 0, 0),
	(49, 8, NULL, 'Могод', 0, 0),
	(50, 8, NULL, 'Орхон', 0, 0),
	(51, 8, NULL, 'Сайхан', 0, 0),
	(52, 8, NULL, 'Тэшиг', 0, 0),
	(53, 8, NULL, 'Хангал', 0, 0),
	(54, 8, NULL, 'Хишиг-Өндөр', 0, 0),
	(55, 8, NULL, 'Баяннуур', 0, 0),
	(57, 8, NULL, 'Рашаант', 0, 0),
	(58, 8, NULL, 'Булган', 0, 0),
	(59, 9, NULL, 'Алтай', 0, 0),
	(60, 9, NULL, 'Баян-Уул', 0, 0),
	(61, 9, NULL, 'Бугат', 0, 0),
	(62, 9, NULL, 'Дарви', 0, 0),
	(63, 9, NULL, 'Дэлгэр', 0, 0),
	(64, 9, NULL, 'Тайшир', 0, 0),
	(65, 9, NULL, 'Тонхил', 0, 0),
	(66, 9, NULL, 'Халиун', 0, 0),
	(67, 9, NULL, 'Хөхморьт', 0, 0),
	(68, 9, NULL, 'Цогт', 0, 0),
	(69, 9, NULL, 'Цээл', 0, 0),
	(70, 9, NULL, 'Шарга', 0, 0),
	(71, 9, NULL, 'Эрдэнэ', 0, 0),
	(72, 9, NULL, 'Гуулин', 0, 0),
	(73, 10, NULL, 'Айраг', 0, 0),
	(74, 10, NULL, 'Алтанширээ', 0, 0),
	(75, 10, NULL, 'Дэлгэрэх', 0, 0),
	(76, 10, NULL, 'Иххэт', 0, 0),
	(77, 10, NULL, 'Мандах', 0, 0),
	(78, 10, NULL, 'Өргөн', 0, 0),
	(79, 10, NULL, 'Улаанбадрах', 0, 0),
	(80, 10, NULL, 'Хатанбулаг', 0, 0),
	(81, 10, NULL, 'Хөвсгөл', 0, 0),
	(82, 10, NULL, 'Эрдэнэ', 0, 0),
	(83, 10, NULL, 'Зүүнбаян', 0, 0),
	(84, 10, NULL, 'Сайншанд', 0, 0),
	(85, 11, NULL, 'Баяндун', 0, 0),
	(86, 11, NULL, 'Баян-Уул', 0, 0),
	(87, 11, NULL, 'Булган', 0, 0),
	(88, 11, NULL, 'Гурванзагал', 0, 0),
	(89, 11, NULL, 'Дашбалбар', 0, 0),
	(90, 11, NULL, 'Сэргэлэн', 0, 0),
	(91, 11, NULL, 'Халх гол', 0, 0),
	(92, 11, NULL, 'Хөлөнбуйр', 0, 0),
	(93, 11, NULL, 'Чулуун хороот', 0, 0),
	(94, 11, NULL, 'Чойбалсан', 0, 0),
	(95, 11, NULL, 'Хэрлэн', 0, 0),
	(96, 14, NULL, 'Бат-Өлзийт', 0, 0),
	(97, 14, NULL, 'Баянгол', 0, 0),
	(98, 14, NULL, 'Баян-Өндөр', 0, 0),
	(99, 14, NULL, 'Богд', 0, 0),
	(100, 14, NULL, 'Гучин-Ус', 0, 0),
	(101, 12, NULL, 'Адаацаг', 0, 0),
	(102, 14, NULL, 'Есөнзүйл', 0, 0),
	(103, 12, NULL, 'Говь-Угтаал', 0, 0),
	(104, 12, NULL, 'Гурвансайхан', 0, 0),
	(105, 12, NULL, 'Дэлгэрхангай', 0, 0),
	(106, 12, NULL, 'Дэлгэрцогт', 0, 0),
	(107, 12, NULL, 'Луус', 0, 0),
	(108, 12, NULL, 'Өлзийт', 0, 0),
	(109, 12, NULL, 'Өндөршил', 0, 0),
	(110, 12, NULL, 'Сайхан-Овоо', 0, 0),
	(111, 12, NULL, 'Хулд', 0, 0),
	(112, 12, NULL, 'Цагаандэлгэр', 0, 0),
	(113, 12, NULL, 'Эрдэнэдалай', 0, 0),
	(114, 13, NULL, 'Алдархаан', 0, 0),
	(115, 13, NULL, 'Баянтэс', 0, 0),
	(116, 13, NULL, 'Баянхайрхан', 0, 0),
	(117, 13, NULL, 'Булнай', 0, 0),
	(118, 13, NULL, 'Завханмандал', 0, 0),
	(119, 13, NULL, 'Идэр', 0, 0),
	(120, 13, NULL, 'Их-Уул', 0, 0),
	(121, 13, NULL, 'Отгон', 0, 0),
	(122, 13, NULL, 'Сантмаргац', 0, 0),
	(123, 13, NULL, 'Сонгино', 0, 0),
	(124, 13, NULL, 'Тэлмэн', 0, 0),
	(125, 13, NULL, 'Тэс', 0, 0),
	(126, 13, NULL, 'Ургамал', 0, 0),
	(127, 13, NULL, 'Цагаанчулуут', 0, 0),
	(128, 13, NULL, 'Цэцэн-Уул', 0, 0),
	(129, 13, NULL, 'Шилүүстэй', 0, 0),
	(130, 13, NULL, 'Яруу', 0, 0),
	(131, 13, NULL, 'Асгат', 0, 0),
	(133, 14, NULL, 'Нарийнтээл', 0, 0),
	(134, 14, NULL, 'Өлзийт', 0, 0),
	(135, 14, NULL, 'Сант', 0, 0),
	(136, 14, NULL, 'Төгрөг', 0, 0),
	(137, 14, NULL, 'Уянга', 0, 0),
	(138, 14, NULL, 'Хархорин', 0, 0),
	(139, 14, NULL, 'Хужирт', 0, 0),
	(140, 14, NULL, 'Баянтээг', 0, 0),
	(141, 14, NULL, 'Их-Уул', 0, 0),
	(142, 15, NULL, 'Даланзадгад', 0, 0),
	(143, 15, NULL, 'Баяндалай', 0, 0),
	(144, 15, NULL, 'Баяновоо', 0, 0),
	(145, 15, NULL, 'Гурвантэс', 0, 0),
	(146, 15, NULL, 'Мандал-Овоо', 0, 0),
	(147, 15, NULL, 'Манлай', 0, 0),
	(148, 15, NULL, 'Ноён', 0, 0),
	(149, 15, NULL, 'Сэврэй', 0, 0),
	(150, 15, NULL, 'Ханбогд', 0, 0),
	(151, 15, NULL, 'Хүрмэн', 0, 0),
	(152, 15, NULL, 'Цогт-Овоо', 0, 0),
	(153, 15, NULL, 'Цогтцэций', 0, 0),
	(154, 16, NULL, 'Баяндэлгэр', 0, 0),
	(155, 16, NULL, 'Дарьганга', 0, 0),
	(156, 16, NULL, 'Мөнххаан', 0, 0),
	(157, 16, NULL, 'Онгон', 0, 0),
	(158, 16, NULL, 'Сүхбаатар', 0, 0),
	(159, 16, NULL, 'Түмэнцогт', 0, 0),
	(160, 16, NULL, 'Уулбаян', 0, 0),
	(161, 16, NULL, 'Халзан', 0, 0),
	(162, 16, NULL, 'Эрдэнэцагаан', 0, 0),
	(163, 16, NULL, 'Баруун-Урт', 0, 0),
	(164, 17, NULL, 'Алтанбулаг', 0, 0),
	(165, 17, NULL, 'Баянгол', 0, 0),
	(166, 17, NULL, 'Ерөө', 0, 0),
	(167, 17, NULL, 'Зүүнбүрэн', 0, 0),
	(168, 17, NULL, 'Мандал', 0, 0),
	(169, 17, NULL, 'Орхон', 0, 0),
	(170, 17, NULL, 'Сайхан', 0, 0),
	(171, 17, NULL, 'Сант', 0, 0),
	(172, 17, NULL, 'Түшиг', 0, 0),
	(173, 17, NULL, 'Хүдэр', 0, 0),
	(174, 17, NULL, 'Жавхлант', 0, 0),
	(175, 17, NULL, 'Цагааннуур', 0, 0),
	(176, 17, NULL, 'Сүхбаатар', 0, 0),
	(177, 18, NULL, 'Алтанбулаг', 0, 0),
	(178, 18, NULL, 'Баян', 0, 0),
	(179, 18, NULL, 'Баян-Өнжүүл', 0, 0),
	(180, 18, NULL, 'Баяндэлгэр', 0, 0),
	(181, 18, NULL, 'Баянжаргалан', 0, 0),
	(182, 18, NULL, 'Баянцогт', 0, 0),
	(183, 18, NULL, 'Борнуур', 0, 0),
	(184, 18, NULL, 'Бүрэн', 0, 0),
	(185, 18, NULL, 'Жаргалант', 0, 0),
	(186, 18, NULL, 'Заамар', 0, 0),
	(187, 18, NULL, 'Лүн', 0, 0),
	(188, 18, NULL, 'Өндөрширээт', 0, 0),
	(189, 18, NULL, 'Сэргэлэн', 0, 0),
	(190, 18, NULL, 'Угтаал', 0, 0),
	(191, 18, NULL, 'Эрдэнэ', 0, 0),
	(192, 18, NULL, 'Баянчандмань', 0, 0),
	(193, 18, NULL, 'Сүмбэр', 0, 0),
	(194, 18, NULL, 'Цээл', 0, 0),
	(195, 18, NULL, 'Баянхангай', 0, 0),
	(196, 18, NULL, 'Архуст', 0, 0),
	(197, 18, NULL, 'Зуунмод', 0, 0),
	(198, 19, NULL, 'Баруунтуруун', 0, 0),
	(199, 19, NULL, 'Давст', 0, 0),
	(200, 19, NULL, 'Завхан', 0, 0),
	(201, 19, NULL, 'Зүүнхангай', 0, 0),
	(202, 19, NULL, 'Малчин', 0, 0),
	(203, 19, NULL, 'Наранбулаг', 0, 0),
	(204, 19, NULL, 'Өлгий', 0, 0),
	(205, 19, NULL, 'Өндөрхангай', 0, 0),
	(206, 19, NULL, 'Сагил', 0, 0),
	(207, 19, NULL, 'Тариалан', 0, 0),
	(208, 5, NULL, 'Батцэнгэл', 0, 0),
	(209, 5, NULL, 'Жаргалант', 0, 0),
	(210, 5, NULL, 'Тариат', 0, 0),
	(211, 5, NULL, 'Хашаат', 0, 0),
	(212, 5, NULL, 'Чулуут', 0, 0),
	(213, 5, NULL, 'Эрдэнэбулган', 0, 0),
	(214, 6, NULL, 'Бугат', 0, 0),
	(215, 6, NULL, 'Ногоон нуур', 0, 0),
	(216, 6, NULL, 'Цэнгэл', 0, 0),
	(217, 7, NULL, 'Баянбулаг', 0, 0),
	(218, 19, NULL, 'Ховд', 0, 0),
	(219, 19, NULL, 'Хяргас', 0, 0),
	(220, 19, NULL, 'Улаангом', 0, 0),
	(221, 20, NULL, 'Алтай', 0, 0),
	(222, 20, NULL, 'Булган', 0, 0),
	(223, 20, NULL, 'Буянт', 0, 0),
	(224, 20, NULL, 'Дуут', 0, 0),
	(225, 20, NULL, 'Зэрэг', 0, 0),
	(226, 20, NULL, 'Манхан', 0, 0),
	(227, 20, NULL, 'Мөст', 0, 0),
	(228, 20, NULL, 'Мөнххайрхан', 0, 0),
	(229, 20, NULL, 'Үенч', 0, 0),
	(230, 20, NULL, 'Цэцэг', 0, 0),
	(231, 20, NULL, 'Чандмань', 0, 0),
	(232, 20, NULL, 'Эрдэнэбүрэн', 0, 0),
	(233, 21, NULL, 'Алаг-Эрдэнэ', 0, 0),
	(234, 21, NULL, 'Арбулаг', 0, 0),
	(235, 21, NULL, 'Баянзүрх', 0, 0),
	(236, 21, NULL, 'Бүрэнтогтох', 0, 0),
	(237, 21, NULL, 'Галт', 0, 0),
	(238, 21, NULL, 'Жаргалант', 0, 0),
	(239, 21, NULL, 'Их-Уул', 0, 0),
	(240, 21, NULL, 'Ринчинлхүмбэ', 0, 0),
	(241, 21, NULL, 'Тариалан', 0, 0),
	(242, 21, NULL, 'Тосонцэнгэл', 0, 0),
	(243, 21, NULL, 'Түнэл', 0, 0),
	(244, 21, NULL, 'Улаан-Уул', 0, 0),
	(245, 21, NULL, 'Ханх', 0, 0),
	(246, 21, NULL, 'Цагаан-Үүр', 0, 0),
	(247, 21, NULL, 'Цэцэрлэг', 0, 0),
	(248, 21, NULL, 'Чандмана-Өндөр', 0, 0),
	(249, 21, NULL, 'Шинэ-Идэр', 0, 0),
	(250, 21, NULL, 'Цагаан нуур', 0, 0),
	(251, 21, NULL, 'Эрдэнэбулган', 0, 0),
	(252, 21, NULL, 'Мөрөн', 0, 0),
	(253, 22, NULL, 'Батширээт', 0, 0),
	(254, 22, NULL, 'Баян-Адрага', 0, 0),
	(255, 22, NULL, 'Баянмөнх', 0, 0),
	(256, 22, NULL, 'Баянхутагт', 0, 0),
	(257, 22, NULL, 'Биндэр', 0, 0),
	(258, 22, NULL, 'Галшир', 0, 0),
	(259, 22, NULL, 'Дархан', 0, 0),
	(260, 22, NULL, 'Дэлгэрхаан', 0, 0),
	(261, 22, NULL, 'Жаргалтхаан', 0, 0),
	(262, 22, NULL, 'Норовлин', 0, 0),
	(263, 22, NULL, 'Өмнөдэлгэр', 0, 0),
	(264, 22, NULL, 'Хэрлэн', 0, 0),
	(265, 22, NULL, 'Бэрх', 0, 0),
	(266, 22, NULL, 'Өлзийт', 0, 0),
	(267, 22, NULL, 'Бор-Өндөр', 0, 0),
	(268, 25, NULL, 'Жаргалант', 0, 0),
	(269, 23, NULL, 'Хонгор', 0, 0),
	(270, 23, NULL, 'Орхон', 0, 0),
	(271, 23, NULL, 'Шарын гол', 0, 0),
	(272, 24, NULL, 'Баянгол', 0, 0),
	(273, 24, NULL, 'Баянзүрх', 0, 0),
	(274, 24, NULL, 'Сонгинохайрхан', 0, 0),
	(275, 24, NULL, 'Хан-Уул', 0, 0),
	(276, 24, NULL, 'Чингэлтэй', 0, 0),
	(277, 24, NULL, 'Налайх', 0, 0),
	(278, 24, NULL, 'Багахангай', 0, 0),
	(279, 22, NULL, 'Чингис хаан', 0, 0),
	(280, 25, NULL, 'Орхон', 0, 0),
	(281, 26, NULL, 'Шивээговь', 0, 0),
	(282, 26, NULL, 'Чойр', 0, 0),
	(283, 7, NULL, 'Баацагаан', 0, 0),
	(284, 7, NULL, 'Бууцагаан', 0, 0),
	(285, 7, NULL, 'Заг', 0, 0),
	(286, 7, NULL, 'Шинэжинст', 0, 0),
	(287, 8, NULL, 'Баян-Агт', 0, 0),
	(288, 8, NULL, 'Дашинчилэн', 0, 0),
	(289, 8, NULL, 'Сэлэнгэ', 0, 0),
	(290, 8, NULL, 'Хутагт-Өндөр', 0, 0),
	(291, 8, NULL, 'Хялганат', 0, 0),
	(292, 9, NULL, 'Бигэр', 0, 0),
	(293, 9, NULL, 'Жаргалан', 0, 0),
	(294, 9, NULL, 'Төгрөг', 0, 0),
	(295, 9, NULL, 'Чандмана', 0, 0),
	(296, 9, NULL, 'Есөнбулаг', 0, 0),
	(297, 10, NULL, 'Даланжаргалан', 0, 0),
	(298, 10, NULL, 'Сайхандулаан', 0, 0),
	(299, 10, NULL, 'Замын-Үүд', 0, 0),
	(300, 11, NULL, 'Баянтүмэн', 0, 0),
	(301, 11, NULL, 'Матад', 0, 0),
	(302, 11, NULL, 'Цагаан-Овоо', 0, 0),
	(303, 14, NULL, 'Баруунбаян-Улаан', 0, 0),
	(304, 14, NULL, 'Бүрд', 0, 0),
	(305, 14, NULL, 'Зүүнбаян-Улаан', 0, 0),
	(306, 14, NULL, 'Тарагт', 0, 0),
	(307, 14, NULL, 'Хайрхандулаан', 0, 0),
	(308, 14, NULL, 'Арвайхээр', 0, 0),
	(309, 12, NULL, 'Баянжаргалан', 0, 0),
	(310, 12, NULL, 'Дэрэн', 0, 0),
	(311, 12, NULL, 'Сайнцагаан', 0, 0),
	(312, 12, NULL, 'Мандалговь', 0, 0),
	(313, 13, NULL, 'Дөрвөлжин', 0, 0),
	(314, 13, NULL, 'Нөмрөг', 0, 0),
	(315, 13, NULL, 'Түдэвтэй', 0, 0),
	(316, 13, NULL, 'Цагаанхайрхан', 0, 0),
	(317, 13, NULL, 'Эрдэнэхайрхан', 0, 0),
	(318, 15, NULL, 'Булган', 0, 0),
	(319, 15, NULL, 'Номгон', 0, 0),
	(320, 15, NULL, 'Ханхонгор', 0, 0),
	(321, 16, NULL, 'Асгат', 0, 0),
	(322, 16, NULL, 'Наран', 0, 0),
	(323, 16, NULL, 'Түвшинширээ', 0, 0),
	(324, 16, NULL, 'Бүрэнцогт', 0, 0),
	(325, 17, NULL, 'Баруунбүрэн', 0, 0),
	(326, 17, NULL, 'Орхонтуул', 0, 0),
	(327, 17, NULL, 'Шаамар', 0, 0),
	(328, 17, NULL, 'Хушаат', 0, 0),
	(329, 18, NULL, 'Батсүмбэр', 0, 0),
	(330, 18, NULL, 'Баянцагаан', 0, 0),
	(331, 18, NULL, 'Дэлгэрхаан', 0, 0),
	(332, 18, NULL, 'Мөнгөнморьт', 0, 0),
	(333, 18, NULL, 'Эрдэнэсант', 0, 0),
	(334, 18, NULL, 'Аргалант', 0, 0),
	(335, 19, NULL, 'Бөхмөрөн', 0, 0),
	(336, 19, NULL, 'Зүүнговь', 0, 0),
	(337, 19, NULL, 'Өмнөговь', 0, 0),
	(338, 19, NULL, 'Түргэн', 0, 0),
	(339, 19, NULL, 'Тэс', 0, 0),
	(340, 19, NULL, 'Цагаанхайрхан', 0, 0),
	(341, 20, NULL, 'Дарви', 0, 0),
	(342, 20, NULL, 'Мянгад', 0, 0),
	(343, 20, NULL, 'Ховд', 0, 0),
	(344, 20, NULL, 'Дөргөн', 0, 0),
	(345, 21, NULL, 'Рашаант', 0, 0),
	(346, 21, NULL, 'Төмөрбулаг', 0, 0),
	(347, 21, NULL, 'Цагаан-Уул', 0, 0),
	(348, 21, NULL, 'Хатгал', 0, 0),
	(349, 22, NULL, 'Батноров', 0, 0),
	(350, 22, NULL, 'Баян-Овоо', 0, 0),
	(351, 22, NULL, 'Дадал', 0, 0),
	(352, 22, NULL, 'Мөрөн', 0, 0),
	(353, 22, NULL, 'Цэнхэрмандал', 0, 0),
	(354, 23, NULL, 'Дархан', 0, 0),
	(355, 24, NULL, 'Сүхбаатар', 0, 0),
	(356, 24, NULL, 'Багануур', 0, 0),
	(357, 26, NULL, 'Баянтал', 0, 0);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;

-- Dumping structure for table poker_test.download
DROP TABLE IF EXISTS `download`;
CREATE TABLE IF NOT EXISTS `download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `downloads` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.download: 0 rows
/*!40000 ALTER TABLE `download` DISABLE KEYS */;
/*!40000 ALTER TABLE `download` ENABLE KEYS */;

-- Dumping structure for table poker_test.email
DROP TABLE IF EXISTS `email`;
CREATE TABLE IF NOT EXISTS `email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `host` varchar(50) NOT NULL,
  `port` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `usessl` tinyint(1) NOT NULL,
  `isoutput` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.email: 0 rows
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;

-- Dumping structure for table poker_test.email_queue
DROP TABLE IF EXISTS `email_queue`;
CREATE TABLE IF NOT EXISTS `email_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned NOT NULL,
  `fromemail` varchar(150) NOT NULL,
  `fromname` varchar(150) DEFAULT NULL,
  `toemail` varchar(150) NOT NULL,
  `toname` varchar(150) DEFAULT NULL,
  `cc` varchar(500) DEFAULT NULL,
  `bcc` varchar(500) DEFAULT NULL,
  `subject` varchar(250) NOT NULL,
  `body` text DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `senttries` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.email_queue: 0 rows
/*!40000 ALTER TABLE `email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_queue` ENABLE KEYS */;

-- Dumping structure for table poker_test.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sector_id` int(10) unsigned NOT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `barcode` text DEFAULT NULL,
  `numcode` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `regnumber` varchar(50) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `workphone` varchar(50) DEFAULT NULL,
  `localphone` varchar(50) DEFAULT NULL,
  `mobilephone` varchar(50) DEFAULT NULL,
  `workemail` varchar(100) DEFAULT NULL,
  `privateemail` varchar(100) DEFAULT NULL,
  `workpos` varchar(250) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `carnumber` varchar(50) DEFAULT NULL,
  `flag` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `respondent_id` int(10) unsigned NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.employee: 0 rows
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table poker_test.extendfield
DROP TABLE IF EXISTS `extendfield`;
CREATE TABLE IF NOT EXISTS `extendfield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity` varchar(50) NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `fieldvalue` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.extendfield: 0 rows
/*!40000 ALTER TABLE `extendfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `extendfield` ENABLE KEYS */;

-- Dumping structure for table poker_test.follow
DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `user_id` int(10) unsigned NOT NULL,
  `follow_user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `user_id__follow_user_id` (`user_id`,`follow_user_id`),
  KEY `user_id` (`user_id`),
  KEY `follow_user_id` (`follow_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.follow: 0 rows
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_action
DROP TABLE IF EXISTS `game_action`;
CREATE TABLE IF NOT EXISTS `game_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_action: 5 rows
/*!40000 ALTER TABLE `game_action` DISABLE KEYS */;
INSERT INTO `game_action` (`id`, `name`, `active`) VALUES
	(1, 'Fold', 1),
	(2, 'Check', 1),
	(3, 'Call', 1),
	(4, 'Raise', 1),
	(5, 'All-In', 1);
/*!40000 ALTER TABLE `game_action` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_amount
DROP TABLE IF EXISTS `game_amount`;
CREATE TABLE IF NOT EXISTS `game_amount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_amount: 17 rows
/*!40000 ALTER TABLE `game_amount` DISABLE KEYS */;
INSERT INTO `game_amount` (`id`, `user_id`, `amount`, `createddate`, `modifieddate`) VALUES
	(1, 3, 40526.02, '2019-07-20 19:01:41', '2019-12-09 21:49:17'),
	(2, 4, 234800.01, '2019-07-31 08:51:30', '2019-12-09 21:37:22'),
	(3, 5, 1161652.72, '2019-10-21 12:52:28', '2019-11-30 19:00:32'),
	(4, 6, 1193345.67, '2019-10-26 12:57:17', '2019-11-30 19:00:30'),
	(5, 7, 1093406.99, '2019-11-17 02:03:00', '2019-11-30 19:00:27'),
	(6, 8, 1111110.00, '2019-11-29 12:29:21', '2019-11-30 19:00:24'),
	(7, 9, 1001190.00, '2019-11-30 11:04:26', '2019-11-30 19:09:12'),
	(8, 10, 974219.00, '2019-11-30 11:05:10', '2019-11-30 19:09:17'),
	(9, 11, 1519380.00, '2019-11-30 11:11:38', '2019-11-30 19:11:57'),
	(10, 12, 0.00, '2023-02-15 08:17:22', '2023-02-15 08:17:22'),
	(11, 13, 0.00, '2023-02-15 08:23:57', '2023-02-15 08:23:57'),
	(12, 14, 0.00, '2023-02-15 08:24:14', '2023-02-15 08:24:14'),
	(13, 15, 0.00, '2023-02-15 08:24:41', '2023-02-15 08:24:41'),
	(14, 16, 0.00, '2023-02-15 08:25:02', '2023-02-15 08:25:02'),
	(15, 17, 0.00, '2023-02-15 08:25:40', '2023-02-15 08:25:40'),
	(16, 18, 0.00, '2023-02-15 08:25:55', '2023-02-15 08:25:55'),
	(17, 19, 10000.00, '2023-02-15 08:27:20', '2023-02-15 20:27:30');
/*!40000 ALTER TABLE `game_amount` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_bank
DROP TABLE IF EXISTS `game_bank`;
CREATE TABLE IF NOT EXISTS `game_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_bank: 5 rows
/*!40000 ALTER TABLE `game_bank` DISABLE KEYS */;
INSERT INTO `game_bank` (`id`, `name`, `active`) VALUES
	(1, 'Хаан банк', 1),
	(2, 'Голомт банк', 1),
	(3, 'Төрийн банк', 1),
	(4, 'Хас банк', 1),
	(5, 'Х/Хөгжлийн банк', 1);
/*!40000 ALTER TABLE `game_bank` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_cashio
DROP TABLE IF EXISTS `game_cashio`;
CREATE TABLE IF NOT EXISTS `game_cashio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `iotype_id` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `money` decimal(18,2) NOT NULL,
  `createddate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `iotype_id` (`iotype_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_cashio: 0 rows
/*!40000 ALTER TABLE `game_cashio` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_cashio` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_iotype
DROP TABLE IF EXISTS `game_iotype`;
CREATE TABLE IF NOT EXISTS `game_iotype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_iotype: 2 rows
/*!40000 ALTER TABLE `game_iotype` DISABLE KEYS */;
INSERT INTO `game_iotype` (`id`, `name`, `active`) VALUES
	(1, 'Income', 1),
	(2, 'Expense', 1);
/*!40000 ALTER TABLE `game_iotype` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_match
DROP TABLE IF EXISTS `game_match`;
CREATE TABLE IF NOT EXISTS `game_match` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `state_id` int(11) NOT NULL,
  `user_balance` decimal(10,2) NOT NULL,
  `small_blind` decimal(10,2) NOT NULL,
  `big_blind` decimal(10,2) NOT NULL,
  `seat_index` int(11) NOT NULL,
  `gip` varchar(30) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`),
  KEY `room_id` (`room_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_match: 21 rows
/*!40000 ALTER TABLE `game_match` DISABLE KEYS */;
INSERT INTO `game_match` (`id`, `guid`, `room_id`, `user_id`, `state_id`, `user_balance`, `small_blind`, `big_blind`, `seat_index`, `gip`, `createddate`, `modifieddate`) VALUES
	(1, 'ff6fbd53-5654-4e48-b4ff-0474a523b640', 2, 3, 1, 0.00, 100.00, 200.00, -1, '192.168.0.105', '2019-11-15 07:50:36', '2019-11-15 15:50:36'),
	(2, 'e824d301-c653-4982-9688-480615b7cb36', 1, 3, 1, 0.00, 100.00, 200.00, -1, '192.168.0.100', '2019-11-15 07:50:38', '2019-11-15 15:50:38'),
	(3, 'c3e92e10-686f-4268-bc1f-54dd43f1c43e', 1, 4, 1, 0.00, 100.00, 200.00, -1, '192.168.0.103', '2019-11-15 07:50:48', '2019-11-15 15:50:48'),
	(4, '2c93ec2e-2763-48b5-9c58-06f82c898ac2', 2, 4, 1, 0.00, 100.00, 200.00, -1, '192.168.0.103', '2019-11-15 07:51:47', '2019-11-15 15:51:47'),
	(5, 'c9ca5dae-d9c0-45ba-bb84-32f4bb183c56', 1, 7, 1, 0.00, 100.00, 200.00, -1, '192.168.0.105', '2019-11-20 10:26:31', '2019-11-20 18:26:31'),
	(6, '930af183-3703-48cd-92c4-2d95dc1436cf', 1, 5, 1, 0.00, 100.00, 200.00, -1, '192.168.0.106', '2019-11-20 10:43:31', '2019-11-20 18:43:31'),
	(7, 'e2172af2-541b-403d-b74e-086beab85f76', 4, 5, 1, 0.00, 100.00, 200.00, -1, '192.168.0.105', '2019-11-20 14:48:24', '2019-11-20 22:48:24'),
	(8, '0ac4cb1c-757d-4868-9f4f-6acb5441c4fb', 1, 6, 1, 0.00, 100.00, 200.00, -1, '192.168.0.102', '2019-11-22 17:19:01', '2019-11-23 01:19:01'),
	(9, '8f970fd4-ba16-499e-a6cd-49066f1096c0', 2, 5, 1, 0.00, 100.00, 200.00, -1, '192.168.0.100', '2019-11-22 17:19:10', '2019-11-23 01:19:10'),
	(10, 'cd4197c9-9506-4a8f-8f1c-0a2c39882cce', 2, 6, 1, 0.00, 100.00, 200.00, -1, '192.168.0.102', '2019-11-22 17:19:12', '2019-11-23 01:19:12'),
	(11, 'fcaa64c5-9e00-4adc-bff7-9afa14388d6b', 3, 4, 1, 0.00, 100.00, 200.00, -1, '192.168.0.103', '2019-11-23 08:31:37', '2019-11-23 16:31:37'),
	(12, 'a9652e4a-1b28-470c-90f5-0d4fda73e330', 3, 5, 1, 0.00, 100.00, 200.00, -1, '192.168.0.105', '2019-11-23 10:13:31', '2019-11-23 18:13:31'),
	(13, '1ca2a6c1-e1ad-4102-b8ab-0e56e1f8f495', 2, 7, 1, 0.00, 100.00, 200.00, -1, '192.168.0.105', '2019-11-25 11:54:51', '2019-11-25 19:54:51'),
	(14, 'ee477e8c-1eb0-4313-99e3-83d1e7f51fa2', 1, 9, 1, 0.00, 100.00, 200.00, -1, '192.168.0.104', '2019-11-30 11:15:23', '2019-11-30 19:15:23'),
	(15, '6fa7c0f1-4d46-4119-9e8f-d0cf7e09509f', 1, 11, 1, 0.00, 100.00, 200.00, -1, '192.168.0.104', '2019-11-30 11:23:46', '2019-11-30 19:23:46'),
	(16, 'efaf02cb-e34f-4f92-923d-017ab5eb2250', 1, 10, 1, 0.00, 100.00, 200.00, -1, '192.168.0.104', '2019-11-30 11:33:41', '2019-11-30 19:33:41'),
	(17, 'bed9706b-0a4d-4724-beef-17c001dc4bf4', 3, 10, 1, 0.00, 100.00, 200.00, -1, '192.168.0.104', '2019-11-30 11:45:15', '2019-11-30 19:45:15'),
	(18, 'a7681ede-e14e-4dc1-9879-ebd61b23f94f', 2, 9, 1, 0.00, 100.00, 200.00, -1, '192.168.0.104', '2019-11-30 11:58:24', '2019-11-30 19:58:24'),
	(19, '9528b5c8-3e63-4089-81fa-876df612b015', 2, 11, 1, 0.00, 100.00, 200.00, -1, '192.168.0.104', '2019-11-30 11:58:38', '2019-11-30 19:58:38'),
	(20, '3bcf7e83-bc19-4e32-80dd-5299ccdb871a', 2, 10, 1, 0.00, 100.00, 200.00, -1, '192.168.0.104', '2019-11-30 11:58:39', '2019-11-30 19:58:39'),
	(21, '46eecaf6-1bd3-4af3-b10a-1875a48fac09', 9, 4, 1, 0.00, 250.00, 500.00, -1, '192.168.0.103', '2019-12-05 06:47:48', '2019-12-05 14:47:48');
/*!40000 ALTER TABLE `game_match` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_option
DROP TABLE IF EXISTS `game_option`;
CREATE TABLE IF NOT EXISTS `game_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_option: 18 rows
/*!40000 ALTER TABLE `game_option` DISABLE KEYS */;
INSERT INTO `game_option` (`id`, `name`, `description`, `value`) VALUES
	(1, 'game_server_paused', 'Хэрэв сервер зогссон бол клиент апп унтраах ёстой', 'false'),
	(2, 'game_client_android_version', 'Хэрэв сервер програм сайжруулсан бол клиент аппийг унтрааж асаах ёстой', '1.0beta22'),
	(3, 'stuff_bank_name', 'Шилжүүлэг хийх банкны нэр', 'Хаан банк'),
	(4, 'stuff_bank_accnumber', 'Дансны дугаар', '5018074422'),
	(5, 'stuff_bank_accname', 'Дансны нэр', 'Хатанбаатар'),
	(6, 'stuff_contact_email', 'Хүсэлт ирэх и-мэйл', 'khatanbaatar987@gmail.com'),
	(7, 'gp_round_tax_income_user_id', 'Admin user', '2'),
	(8, 'gp_room_', '', ''),
	(18, 'gp_room_players_autofold_limit', 'Автоматаар хаях үйлдэл хийх хязгаар', '5'),
	(9, 'gp_round_tax_main_percent', 'Хожлын мөнгөнөөс авах үндсэн суутгалын хувь', '5'),
	(10, 'gp_round_tax_min_percent', 'Хожлын мөнгөнөөс авах хамгийн бага суутгалын хувь', '3'),
	(11, 'gp_round_tax_min_players', 'Хожлын мөнгөнөөс авах хамгийн бага суутгалд хамаарах тоглогчдийн тоо', '5'),
	(12, 'gp_client_expense_money_divider', 'Зарлага хийх мөнгөн дүнг өсгөх хуваарь', '10000'),
	(13, 'gp_client_income_money_min', 'Орлого хийх хамгийн бага мөнгөн дүн', '5000'),
	(14, 'gp_client_account_number_min', 'Банкны дансны дугаарыг шалгах', '99999999'),
	(15, 'gp_room_ping_pong_seconds', 'Room Ping Pong Seconds', '20'),
	(16, 'gp_room_observer_limit', 'Өрөөнд орох үзэгчдийн тоо', '10'),
	(17, 'gp_room_observer_view_limit', 'Өрөөнд орох үзэгчдийн харах тоо', '5');
/*!40000 ALTER TABLE `game_option` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_request
DROP TABLE IF EXISTS `game_request`;
CREATE TABLE IF NOT EXISTS `game_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `bank_id` int(10) unsigned NOT NULL,
  `iotype_id` int(10) unsigned NOT NULL,
  `accnumber` bigint(20) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `money` decimal(18,2) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  `is_cashio_ok` tinyint(1) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `bank_id` (`bank_id`),
  KEY `iotype_id` (`iotype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_request: 2 rows
/*!40000 ALTER TABLE `game_request` DISABLE KEYS */;
INSERT INTO `game_request` (`id`, `user_id`, `bank_id`, `iotype_id`, `accnumber`, `value`, `money`, `checked`, `is_cashio_ok`, `description`, `createddate`, `modifieddate`) VALUES
	(1, 19, 2, 1, 123456789, 'seris', 15000.00, 0, 0, 'Мөнгө байршуулах хүсэлт', '2023-02-15 18:02:58', '2023-02-15 20:32:24'),
	(2, 19, 2, 1, 123456789, 'seris', 5000.00, 0, 0, 'Мөнгө татан авах хүсэлт', '2023-02-15 18:11:48', '2023-02-15 20:32:25');
/*!40000 ALTER TABLE `game_request` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_room
DROP TABLE IF EXISTS `game_room`;
CREATE TABLE IF NOT EXISTS `game_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style` varchar(255) DEFAULT NULL,
  `roomtype_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `fillup` int(11) NOT NULL,
  `required_balance` decimal(10,2) NOT NULL,
  `small_blind` decimal(10,2) NOT NULL,
  `big_blind` decimal(10,2) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `roomtype_id` (`roomtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_room: 11 rows
/*!40000 ALTER TABLE `game_room` DISABLE KEYS */;
INSERT INTO `game_room` (`id`, `style`, `roomtype_id`, `name`, `capacity`, `fillup`, `required_balance`, `small_blind`, `big_blind`, `featured`, `active`) VALUES
	(1, '', 2, 'Room 1', 9, 0, 10000.00, 100.00, 200.00, 1, 1),
	(2, '', 2, 'Room 2', 9, 0, 10000.00, 100.00, 200.00, 0, 1),
	(3, '', 2, 'Room 3', 9, 0, 10000.00, 100.00, 200.00, 0, 1),
	(4, '', 2, 'Room 4', 9, 0, 10000.00, 100.00, 200.00, 0, 1),
	(5, '', 2, 'Room 5', 9, 0, 20000.00, 100.00, 200.00, 0, 1),
	(6, '', 2, 'Room 6', 9, 0, 20000.00, 100.00, 200.00, 0, 1),
	(7, '', 2, 'Room 7', 9, 0, 20000.00, 100.00, 200.00, 0, 1),
	(8, '', 2, 'Room 8', 9, 0, 50000.00, 250.00, 500.00, 0, 1),
	(9, '', 2, 'Room 9', 9, 0, 50000.00, 250.00, 500.00, 0, 1),
	(10, '', 2, 'Room 100k 1', 9, 0, 100000.00, 500.00, 1000.00, 0, 1),
	(11, '', 2, 'Room 100k 2', 9, 0, 100000.00, 500.00, 1000.00, 0, 1);
/*!40000 ALTER TABLE `game_room` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_roomtype
DROP TABLE IF EXISTS `game_roomtype`;
CREATE TABLE IF NOT EXISTS `game_roomtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `istournament` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_roomtype: 2 rows
/*!40000 ALTER TABLE `game_roomtype` DISABLE KEYS */;
INSERT INTO `game_roomtype` (`id`, `name`, `istournament`, `active`) VALUES
	(1, 'Tournament', 1, 0),
	(2, 'Sit \'n Go', 0, 1);
/*!40000 ALTER TABLE `game_roomtype` ENABLE KEYS */;

-- Dumping structure for table poker_test.game_state
DROP TABLE IF EXISTS `game_state`;
CREATE TABLE IF NOT EXISTS `game_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.game_state: 4 rows
/*!40000 ALTER TABLE `game_state` DISABLE KEYS */;
INSERT INTO `game_state` (`id`, `name`, `active`) VALUES
	(1, 'observer', 1),
	(2, 'waiting', 1),
	(3, 'playing', 1),
	(4, 'paused', 1);
/*!40000 ALTER TABLE `game_state` ENABLE KEYS */;

-- Dumping structure for table poker_test.hollyday
DROP TABLE IF EXISTS `hollyday`;
CREATE TABLE IF NOT EXISTS `hollyday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hdate` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.hollyday: 1 rows
/*!40000 ALTER TABLE `hollyday` DISABLE KEYS */;
INSERT INTO `hollyday` (`id`, `hdate`, `title`, `subtitle`, `ordering`, `deleted`) VALUES
	(1, '2017-07-11 00:00:00', 'naadam', 'Наадмын өдөр бүх нийтээр амардаг', 1, 0);
/*!40000 ALTER TABLE `hollyday` ENABLE KEYS */;

-- Dumping structure for table poker_test.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rtl` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.language: 2 rows
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`id`, `code`, `name`, `rtl`, `ordering`, `deleted`) VALUES
	(1, 'mn', 'Монгол', 0, 1, 0),
	(2, 'en', 'English', 0, 2, 0);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Dumping structure for table poker_test.login_limiter
DROP TABLE IF EXISTS `login_limiter`;
CREATE TABLE IF NOT EXISTS `login_limiter` (
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `flag` int(11) NOT NULL,
  UNIQUE KEY `user_id__ip_address` (`user_id`,`ip_address`),
  KEY `ip_address` (`ip_address`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.login_limiter: 0 rows
/*!40000 ALTER TABLE `login_limiter` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_limiter` ENABLE KEYS */;

-- Dumping structure for table poker_test.login_tracker
DROP TABLE IF EXISTS `login_tracker`;
CREATE TABLE IF NOT EXISTS `login_tracker` (
  `ip_address` varchar(45) NOT NULL,
  `first_time` int(10) unsigned NOT NULL,
  `failures` smallint(5) unsigned DEFAULT NULL,
  UNIQUE KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.login_tracker: 1 rows
/*!40000 ALTER TABLE `login_tracker` DISABLE KEYS */;
INSERT INTO `login_tracker` (`ip_address`, `first_time`, `failures`) VALUES
	('::1', 1563521822, 2);
/*!40000 ALTER TABLE `login_tracker` ENABLE KEYS */;

-- Dumping structure for table poker_test.media
DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typecode` varchar(10) NOT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  `thumburl` varchar(500) DEFAULT NULL,
  `path` varchar(250) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `mimetype` varchar(50) NOT NULL,
  `size` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `denied` tinyint(1) NOT NULL,
  `createddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `folder_id` (`folder_id`),
  KEY `filename` (`filename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.media: 1 rows
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` (`id`, `typecode`, `folder_id`, `thumburl`, `path`, `filename`, `extension`, `mimetype`, `size`, `width`, `height`, `duration`, `denied`, `createddate`, `ipaddress`, `user_id`) VALUES
	(1, 'photo', 1, 'media/photo/2015/614/jpg/876d6f11446557df1b443a7cb44dc9027d5f54a9/thumbs/Koala_6475501167_100x0.jpg', 'media/photo/2015/614/jpg/876d6f11446557df1b443a7cb44dc9027d5f54a9/', 'Koala_6475501167', 'jpg', 'image/jpeg', 780831, 800, 600, 0, 0, '2015-06-14 21:14:35', '::1', 1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Dumping structure for table poker_test.mediafolder
DROP TABLE IF EXISTS `mediafolder`;
CREATE TABLE IF NOT EXISTS `mediafolder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.mediafolder: 4 rows
/*!40000 ALTER TABLE `mediafolder` DISABLE KEYS */;
INSERT INTO `mediafolder` (`id`, `parent_id`, `name`, `type`, `ordering`, `createddate`, `protected`, `archived`) VALUES
	(1, 0, 'Favorites', 0, 0, '0000-00-00 00:00:00', 1, 0),
	(2, 0, 'Uploads', 0, 0, '0000-00-00 00:00:00', 1, 0),
	(3, 0, 'News', 0, 0, '2018-01-07 10:07:25', 0, 0),
	(4, 0, 'Banners', 0, 0, '2018-01-08 16:08:14', 0, 0);
/*!40000 ALTER TABLE `mediafolder` ENABLE KEYS */;

-- Dumping structure for table poker_test.mediatype
DROP TABLE IF EXISTS `mediatype`;
CREATE TABLE IF NOT EXISTS `mediatype` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.mediatype: 12 rows
/*!40000 ALTER TABLE `mediatype` DISABLE KEYS */;
INSERT INTO `mediatype` (`id`, `code`, `name`, `ordering`, `deleted`) VALUES
	(1, 'news', 'Мэдээ агуулга', 1, 0),
	(2, 'photo', 'Фото агуулга', 2, 0),
	(3, 'video', 'Видео агуулга', 3, 0),
	(4, 'music', 'Хөгжим агуулга', 4, 0),
	(5, 'file', 'Файл агуулга', 5, 0),
	(6, 'document', 'Баримт агуулга', 6, 0),
	(7, 'product', 'Бүтээгдэхүүн агуулга', 7, 0),
	(8, 'map', 'Зураглал агуулга', 8, 0),
	(9, 'object', 'Зүйл юмс агуулга', 9, 0),
	(10, 'advertise', 'Сурталчилгаа агуулга', 10, 0),
	(11, 'zar', 'Зар агуулга', 11, 0),
	(12, 'page', 'Веб Хуудас агуулга', 12, 0);
/*!40000 ALTER TABLE `mediatype` ENABLE KEYS */;

-- Dumping structure for table poker_test.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langcode` char(2) DEFAULT NULL,
  `menulocation_id` tinyint(3) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `href` varchar(500) DEFAULT NULL,
  `onclick` varchar(500) DEFAULT NULL,
  `attrid` varchar(50) DEFAULT NULL,
  `classname` varchar(50) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sitemapped` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menulocation_id` (`menulocation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.menu: 1 rows
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `langcode`, `menulocation_id`, `category_id`, `parent_id`, `picture_id`, `title`, `subtitle`, `href`, `onclick`, `attrid`, `classname`, `target`, `level`, `ordering`, `deleted`, `featured`, `sitemapped`) VALUES
	(1, 'mn', 1, 0, 0, 0, 'Нүүр хуудас', '', '', '', '', '', '', 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table poker_test.menulocation
DROP TABLE IF EXISTS `menulocation`;
CREATE TABLE IF NOT EXISTS `menulocation` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.menulocation: 10 rows
/*!40000 ALTER TABLE `menulocation` DISABLE KEYS */;
INSERT INTO `menulocation` (`id`, `code`, `name`, `ordering`, `deleted`) VALUES
	(1, 'top', 'Дээд холбоосууд', 1, 0),
	(2, 'main', 'Үндсэн цэс', 2, 0),
	(3, 'sub', 'Дэд цэс', 3, 0),
	(4, 'left', 'Зүүн талын цэс', 4, 0),
	(5, 'right', 'Баруун талын цэс', 5, 0),
	(6, 'content', 'Агуулгын цэс', 6, 0),
	(7, 'popup', 'Цонхны цэс', 7, 0),
	(8, 'header', 'Толгойн цэс', 8, 0),
	(9, 'footer', 'Хөлийн цэс', 9, 0),
	(10, 'bottom', 'Доод холбоосууд', 10, 0);
/*!40000 ALTER TABLE `menulocation` ENABLE KEYS */;

-- Dumping structure for table poker_test.mobile
DROP TABLE IF EXISTS `mobile`;
CREATE TABLE IF NOT EXISTS `mobile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `simline1` varchar(50) DEFAULT NULL,
  `simline2` varchar(50) DEFAULT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.mobile: 0 rows
/*!40000 ALTER TABLE `mobile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile` ENABLE KEYS */;

-- Dumping structure for table poker_test.poll
DROP TABLE IF EXISTS `poll`;
CREATE TABLE IF NOT EXISTS `poll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `votecount` int(11) NOT NULL,
  `selection` tinyint(4) NOT NULL,
  `deadline` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.poll: 0 rows
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;

-- Dumping structure for table poker_test.poll_item
DROP TABLE IF EXISTS `poll_item`;
CREATE TABLE IF NOT EXISTS `poll_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `votes` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- Dumping data for table poker_test.poll_item: 0 rows
/*!40000 ALTER TABLE `poll_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_item` ENABLE KEYS */;

-- Dumping structure for table poker_test.poll_tracker
DROP TABLE IF EXISTS `poll_tracker`;
CREATE TABLE IF NOT EXISTS `poll_tracker` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL,
  `pollitem_id` int(10) unsigned NOT NULL,
  `createddate` datetime NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- Dumping data for table poker_test.poll_tracker: 0 rows
/*!40000 ALTER TABLE `poll_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_tracker` ENABLE KEYS */;

-- Dumping structure for table poker_test.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.role: 10 rows
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `level`, `code`, `name`, `description`) VALUES
	(1, 1000000, 'root', 'Root', 'System'),
	(2, 100000, 'admin', 'Admin', 'Administrator'),
	(3, 10000, 'manager', 'Manager', 'Management'),
	(4, 1000, 'editor', 'Editor', 'Content writer'),
	(5, 100, 'viewer', 'Viewer', 'Readonly user'),
	(6, 10, 'user', 'User', 'Default user'),
	(7, 1, 'guest', 'Guest', 'Virtual user'),
	(8, -10, 'pending', 'Pending', ''),
	(9, -100, 'banned', 'Banned', ''),
	(10, -1000, 'deactivated', 'Deactivated', '');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table poker_test.role_permission
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `url` varchar(1000) NOT NULL,
  `rule` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.role_permission: 0 rows
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;

-- Dumping structure for table poker_test.sector
DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `mark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.sector: 1 rows
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` (`id`, `name`, `description`, `phone`, `ordering`, `deleted`, `mark`) VALUES
	(1, 'Төв салбар', '', '', 0, 0, 'main');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;

-- Dumping structure for table poker_test.setting
DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langcode` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.setting: 35 rows
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` (`id`, `langcode`, `name`, `value`) VALUES
	(1, NULL, 'cms_mode_for', 'app|site|api'),
	(2, NULL, 'cms_user_editor_is_publisher', 'true'),
	(3, NULL, 'cms_side_login_logo_url', ''),
	(4, NULL, 'cms_side_tree_show_articles', 'true'),
	(5, NULL, 'cms_side_tree_categories_label', 'Хэсгүүд'),
	(6, NULL, 'cms_side_tree_menus_label', 'Холбоос'),
	(7, NULL, 'cms_side_tree_menus_visible', 'true'),
	(8, NULL, 'cms_article_seotab_inactive', 'true'),
	(9, NULL, 'cms_article_moretab_inactive', 'false'),
	(10, NULL, 'cms_article_type_visible', 'false'),
	(11, NULL, 'cms_article_type_label', 'Төрөл'),
	(12, NULL, 'cms_article_mediatype_visible', 'true'),
	(13, NULL, 'cms_article_mediatype_label', 'Ангилал'),
	(14, NULL, 'cms_article_title_label', ''),
	(15, NULL, 'cms_article_subtitle_label', ''),
	(16, NULL, 'cms_article_author_visible', 'false'),
	(17, NULL, 'cms_article_author_label', 'Компани'),
	(18, NULL, 'cms_article_referdate_visible', 'false'),
	(19, NULL, 'cms_article_referdate_label', ''),
	(20, NULL, 'cms_article_referdate_description', ''),
	(21, NULL, 'cms_article_refervalue_visible', 'false'),
	(22, NULL, 'cms_article_refervalue_label', 'Үнэлгээ (тоо)'),
	(23, NULL, 'cms_article_refervalue_description', 'Зөвхөн 5 хүртэлх тоон утга бичнэ!'),
	(24, NULL, 'cms_article_refervalue_format_use', 'false'),
	(25, NULL, 'cms_article_refervalue_format', '0.0'),
	(26, NULL, 'cms_article_check_field_hidden', 'false'),
	(27, NULL, 'cms_article_allowcomment_visible', 'true'),
	(28, NULL, 'cms_article_payable_visible', 'false'),
	(29, NULL, 'site_meta_keywords', 'мэдээ,мэдээлэл'),
	(30, NULL, 'site_meta_title', 'Pocker Graph'),
	(31, NULL, 'site_meta_description', 'мэдээ,мэдээлэл'),
	(32, NULL, 'site_office_phone_number', '976 88086112'),
	(33, NULL, 'site_office_phone_fax', ''),
	(34, NULL, 'site_office_email_contact', 'hiimeloyun@gmail.mn'),
	(35, NULL, 'site_office_facebook_url', 'https://www.facebook.com/pages/1');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;

-- Dumping structure for table poker_test.sms
DROP TABLE IF EXISTS `sms`;
CREATE TABLE IF NOT EXISTS `sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) NOT NULL,
  `text` varchar(500) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `dt` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `mntext` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.sms: 0 rows
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;

-- Dumping structure for table poker_test.subscription
DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `section` varchar(250) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createddate` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.subscription: 0 rows
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;

-- Dumping structure for table poker_test.tag
DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intcode` int(11) NOT NULL,
  `langcode` char(2) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `original` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `mark` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.tag: 6 rows
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id`, `intcode`, `langcode`, `name`, `original`, `active`, `mark`) VALUES
	(1, -1, NULL, 'Noun', '', 1, 'noun'),
	(2, -1, NULL, 'Verb', '', 1, 'verb'),
	(3, -1, NULL, 'Adjective', '', 1, 'adjective'),
	(4, -1, NULL, 'Noun, Adjective', '', 1, 'noun, adjective'),
	(5, -1, NULL, 'Verb, Adjective', '', 1, 'verb, adjective'),
	(6, -1, NULL, 'Noun, Verb, Adjective', '', 1, 'noun, verb, adjective');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping structure for table poker_test.test
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.test: 0 rows
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- Dumping structure for table poker_test.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `gender` int(10) unsigned NOT NULL DEFAULT 1,
  `displayname` varchar(50) DEFAULT NULL,
  `customdata` mediumtext DEFAULT NULL,
  `picture_id` int(10) unsigned NOT NULL DEFAULT 0,
  `role_id` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `expirydate` datetime DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bankType` varchar(50) DEFAULT NULL,
  `bankId` varchar(50) DEFAULT NULL,
  `bankAccountName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table poker_test.user: 11 rows
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `phonenumber`, `username`, `password`, `salt`, `firstname`, `lastname`, `birthdate`, `gender`, `displayname`, `customdata`, `picture_id`, `role_id`, `deleted`, `expirydate`, `createddate`, `modifieddate`, `bankType`, `bankId`, `bankAccountName`) VALUES
	(1, 'hiimeloyun@gmail.com', NULL, 'root', 'b2a31e85051b73cbc92bc4c22e8fba90d965372f', '55906fe4d5a5bfc4', 'su', 'system', '2017-11-22 00:00:00', 1, NULL, NULL, 0, 1, 0, NULL, '2013-10-08 18:35:50', '2023-02-15 20:00:03', 'Х/Хөгжлийн банк', '123', 'haha'),
	(2, 'boroog@gmail.com', NULL, 'admin', 'd170704856604ec9dfb3bf7d21784841958a44c6', 'b8bc1f5b5efe23a5', 'admin', 'users', '1986-04-12 00:00:00', 1, NULL, NULL, 0, 2, 0, NULL, '2017-06-13 03:00:03', '2019-05-22 23:24:52', NULL, NULL, NULL),
	(3, 'boroo_tmp@yahoo.com', NULL, 'tmpt', 'eac25c4ce4985eb9af2f4de7973aa09d32fa23ae', '003ba765', 'test', 'users', '1986-04-12 00:00:00', 1, 'tmpuk', 'myAvatar (19).png', 0, 6, 0, '2050-05-04 00:00:00', '2019-05-05 07:05:44', '2019-11-29 17:52:22', NULL, NULL, NULL),
	(4, 'boroo_c@hotmail.com', NULL, 'borc', '51a2a91dc238fff17e5a01513072d5880e0c5078', '27869494', NULL, NULL, NULL, 1, 'boroo_', 'myAvatar (1).png', 0, 6, 0, NULL, '2019-07-31 08:51:29', '2019-11-29 17:52:09', NULL, NULL, NULL),
	(5, 'ellipticalmn@gmail.com', NULL, 'elliptical', '0811e6d195189729ae487eff5ad79d80ae97b7a7', 'b24c524c', NULL, NULL, NULL, 1, 'naidan', 'myAvatar (1).png', 0, 6, 0, NULL, '2019-10-21 12:52:28', '2019-11-29 17:52:34', NULL, NULL, NULL),
	(6, 'naku@gmail.com', NULL, 'naku', '70a6e9c7869ec0a039bdcfb97b9bcc16bcce4c53', 'b20bd430', NULL, NULL, NULL, 1, 'muun99 ', 'myAvatar (18).png', 0, 6, 0, NULL, '2019-10-26 12:57:17', '2019-11-29 17:51:54', NULL, NULL, NULL),
	(7, 'boroo_c@yahoo.com', NULL, 'bory', '8bff700aaaa5b52c4cd0246420776fd08303aba6', 'dca69ae7', NULL, NULL, NULL, 1, 'bory', NULL, 0, 6, 0, NULL, '2019-11-16 07:50:45', '2019-11-29 17:52:03', NULL, NULL, NULL),
	(8, 'bor@bbgg.com', NULL, 'bor', '885d33a44dd86230320840362a7cc9f3ef489abc', 'c5027331', NULL, NULL, NULL, 1, NULL, 'myAvatar (1).png', 0, 6, 0, NULL, '2019-11-29 12:29:21', '2019-11-29 20:29:21', NULL, NULL, NULL),
	(9, NULL, NULL, 'naidan1', '90f9c7afd228daa68be4131785bc2b32894839a6', 'd2edaf2a', NULL, NULL, NULL, 1, 'naidan03', NULL, 0, 6, 0, NULL, '2019-11-30 11:04:26', '2023-02-15 19:59:24', 'Хаан банк', '987654321', 'bayar'),
	(10, NULL, NULL, 'naidan2', '90f9c7afd228daa68be4131785bc2b32894839a6', 'd2edaf2a', NULL, NULL, NULL, 1, 'naidan03', NULL, 0, 6, 0, NULL, '2019-11-30 11:05:10', '2023-02-15 19:56:11', '1', '2', '3'),
	(19, NULL, NULL, 'seris', '$2b$10$PWRxNRMytzEJOA.Ns9dDUOXzyWXcYR0Zq6zWTo/cf6YJIKcHuGkl2', 'b0a90e82', NULL, NULL, NULL, 1, NULL, NULL, 0, 2, 0, NULL, '2023-02-15 08:27:20', '2023-02-15 19:57:52', 'Голомт банк', '123456789', 'serises');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table poker_test.user_bookmark
DROP TABLE IF EXISTS `user_bookmark`;
CREATE TABLE IF NOT EXISTS `user_bookmark` (
  `user_id` int(10) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `user_id__article_id` (`user_id`,`article_id`),
  KEY `user_id` (`user_id`),
  KEY `article_id` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.user_bookmark: 0 rows
/*!40000 ALTER TABLE `user_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_bookmark` ENABLE KEYS */;

-- Dumping structure for table poker_test.user_category
DROP TABLE IF EXISTS `user_category`;
CREATE TABLE IF NOT EXISTS `user_category` (
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `user_id__category_id` (`user_id`,`category_id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.user_category: 0 rows
/*!40000 ALTER TABLE `user_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_category` ENABLE KEYS */;

-- Dumping structure for table poker_test.user_extend
DROP TABLE IF EXISTS `user_extend`;
CREATE TABLE IF NOT EXISTS `user_extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL DEFAULT 0,
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `employee_id` int(10) unsigned NOT NULL DEFAULT 0,
  `followed` int(11) NOT NULL DEFAULT 0,
  `followers` int(11) NOT NULL DEFAULT 0,
  `bookmarks` int(11) NOT NULL DEFAULT 0,
  `products` int(11) NOT NULL DEFAULT 0,
  `zars` int(11) NOT NULL DEFAULT 0,
  `news` int(11) NOT NULL DEFAULT 0,
  `totals` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Dumping data for table poker_test.user_extend: 19 rows
/*!40000 ALTER TABLE `user_extend` DISABLE KEYS */;
INSERT INTO `user_extend` (`id`, `user_id`, `sector_id`, `customer_id`, `employee_id`, `followed`, `followers`, `bookmarks`, `products`, `zars`, `news`, `totals`) VALUES
	(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `user_extend` ENABLE KEYS */;

-- Dumping structure for table poker_test.user_log
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE IF NOT EXISTS `user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ipaddress` varchar(30) DEFAULT NULL,
  `activitydate` datetime DEFAULT NULL,
  `logindate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.user_log: 19 rows
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` (`id`, `user_id`, `ipaddress`, `activitydate`, `logindate`) VALUES
	(1, 1, '::1', '2019-11-29 12:01:14', '2019-11-29 09:49:48'),
	(2, 2, '::1', '2019-12-08 09:41:45', '2019-12-08 09:35:53'),
	(3, 3, '::1', '2019-05-05 08:50:24', '2019-06-29 05:19:45'),
	(4, 4, '192.168.1.3', '2019-07-05 06:09:26', '2019-07-05 06:09:26'),
	(5, 5, '192.168.1.6', '2019-07-31 08:51:30', '2019-07-31 08:51:30'),
	(6, 6, '192.168.0.100', '2019-10-21 12:52:28', '2019-10-21 12:52:28'),
	(7, 7, '192.168.0.105', '2019-11-12 08:29:52', '2019-11-12 08:29:52'),
	(8, 8, '192.168.0.103', '2019-11-29 12:29:21', '2019-11-29 12:29:21'),
	(9, 9, '192.168.0.104', '2019-11-30 11:04:26', '2019-11-30 11:04:26'),
	(10, 10, '192.168.0.104', '2019-11-30 11:05:10', '2019-11-30 11:05:10'),
	(11, 11, '192.168.0.104', '2019-11-30 11:11:38', '2019-11-30 11:11:38'),
	(12, 12, '127.0.0.1', '2023-02-15 08:17:22', '2023-02-15 08:17:22'),
	(13, 13, '127.0.0.1', '2023-02-15 08:23:57', '2023-02-15 08:23:57'),
	(14, 14, '127.0.0.1', '2023-02-15 08:24:14', '2023-02-15 08:24:14'),
	(15, 15, '127.0.0.1', '2023-02-15 08:24:41', '2023-02-15 08:24:41'),
	(16, 16, '127.0.0.1', '2023-02-15 08:25:02', '2023-02-15 08:25:02'),
	(17, 17, '127.0.0.1', '2023-02-15 08:25:40', '2023-02-15 08:25:40'),
	(18, 18, '127.0.0.1', '2023-02-15 08:25:55', '2023-02-15 08:25:55'),
	(19, 19, '127.0.0.1', '2023-02-15 08:27:20', '2023-02-15 08:27:20');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;

-- Dumping structure for table poker_test.user_meta
DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE IF NOT EXISTS `user_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.user_meta: 0 rows
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;

-- Dumping structure for table poker_test.user_mobile
DROP TABLE IF EXISTS `user_mobile`;
CREATE TABLE IF NOT EXISTS `user_mobile` (
  `user_id` int(10) unsigned NOT NULL,
  `mobile_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `user_id__mobile_id` (`user_id`,`mobile_id`),
  KEY `user_id` (`user_id`),
  KEY `mobile_id` (`mobile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.user_mobile: 0 rows
/*!40000 ALTER TABLE `user_mobile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mobile` ENABLE KEYS */;

-- Dumping structure for table poker_test.user_setting
DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `langcode` char(2) DEFAULT NULL,
  `avatar_id` int(10) unsigned NOT NULL DEFAULT 0,
  `coverphoto_id` int(10) unsigned NOT NULL DEFAULT 0,
  `slogan` varchar(150) DEFAULT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT 0,
  `county_id` int(10) unsigned NOT NULL DEFAULT 0,
  `city_id` int(10) unsigned NOT NULL DEFAULT 0,
  `district_id` int(10) unsigned NOT NULL DEFAULT 0,
  `address` varchar(250) DEFAULT NULL,
  `callnumbers` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.user_setting: 19 rows
/*!40000 ALTER TABLE `user_setting` DISABLE KEYS */;
INSERT INTO `user_setting` (`id`, `user_id`, `timezone`, `theme`, `langcode`, `avatar_id`, `coverphoto_id`, `slogan`, `author_id`, `county_id`, `city_id`, `district_id`, `address`, `callnumbers`) VALUES
	(1, 1, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, ''),
	(2, 2, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, ''),
	(3, 3, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(4, 4, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(5, 5, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(6, 6, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(7, 7, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(8, 8, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(9, 9, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(10, 10, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(11, 11, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(12, 12, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(13, 13, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(14, 14, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(15, 15, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(16, 16, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(17, 17, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(18, 18, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL),
	(19, 19, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `user_setting` ENABLE KEYS */;

-- Dumping structure for table poker_test.webpart
DROP TABLE IF EXISTS `webpart`;
CREATE TABLE IF NOT EXISTS `webpart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `picture_id` int(10) unsigned NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `section` varchar(250) DEFAULT NULL,
  `embedhtml` text DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table poker_test.webpart: 0 rows
/*!40000 ALTER TABLE `webpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `webpart` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
