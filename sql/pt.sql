-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-12-26 12:28:05
-- 服务器版本： 10.1.37-MariaDB-0+deb9u1
-- PHP 版本： 7.3.9-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `tjupt`
--

-- --------------------------------------------------------

--
-- 表的结构 `adclicks`
--

CREATE TABLE `adclicks` (
  `adid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `adminpanel`
--

CREATE TABLE `adminpanel` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(256) NOT NULL DEFAULT '',
  `info` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `advertisements`
--

CREATE TABLE `advertisements` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('bbcodes','xhtml','text','image','flash') NOT NULL,
  `position` enum('header','footer','belownav','belowsearchbox','torrentdetail','comment','interoverforums','forumpost','popup') NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `parameters` text NOT NULL,
  `code` text NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `agent_allowed_exception`
--

CREATE TABLE `agent_allowed_exception` (
  `id` int(11) NOT NULL,
  `family_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `peer_id` varchar(20) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `comment` varchar(200) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `agent_allowed_family`
--

CREATE TABLE `agent_allowed_family` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `family` varchar(50) NOT NULL DEFAULT '',
  `start_name` varchar(100) NOT NULL DEFAULT '',
  `peer_id_pattern` varchar(200) NOT NULL,
  `peer_id_match_num` tinyint(3) UNSIGNED NOT NULL,
  `peer_id_matchtype` enum('dec','hex') NOT NULL DEFAULT 'dec',
  `peer_id_start` varchar(20) NOT NULL,
  `agent_pattern` varchar(200) NOT NULL,
  `agent_match_num` tinyint(3) UNSIGNED NOT NULL,
  `agent_matchtype` enum('dec','hex') NOT NULL DEFAULT 'dec',
  `agent_start` varchar(100) NOT NULL,
  `exception` enum('yes','no') NOT NULL DEFAULT 'no',
  `allowhttps` enum('yes','no') NOT NULL DEFAULT 'no',
  `comment` varchar(200) NOT NULL DEFAULT '',
  `hits` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `allowedemails`
--

CREATE TABLE `allowedemails` (
  `id` int(10) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `api_token`
--

CREATE TABLE `api_token` (
  `token` varchar(32) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `appname` varchar(20) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `app_luckydraw`
--

CREATE TABLE `app_luckydraw` (
  `id` int(11) UNSIGNED NOT NULL,
  `time_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ticket_price` decimal(20,1) NOT NULL DEFAULT '100.0',
  `ticket_tax_rate` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.20',
  `ticket_max_win_x` int(11) UNSIGNED NOT NULL DEFAULT '250',
  `ticket_win` decimal(20,1) NOT NULL DEFAULT '0.0',
  `user_class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `user_max` int(11) UNSIGNED NOT NULL DEFAULT '100',
  `winners_max` int(11) UNSIGNED NOT NULL DEFAULT '10',
  `ticket_total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `bonuspool` decimal(20,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `bonuspool_next` decimal(20,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `addby` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_luckydraw_players`
--

CREATE TABLE `app_luckydraw_players` (
  `Id` int(11) UNSIGNED NOT NULL,
  `luckydraw_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ticket_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ticket_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `win_or_lose` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_rename`
--

CREATE TABLE `app_rename` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `oldname` varchar(40) NOT NULL DEFAULT '',
  `newname` varchar(40) NOT NULL DEFAULT '',
  `timerename` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paybonus` decimal(20,0) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_tryluck`
--

CREATE TABLE `app_tryluck` (
  `Id` int(11) UNSIGNED NOT NULL,
  `trytime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `bonus_pay` decimal(20,1) NOT NULL DEFAULT '0.0',
  `bonus_gain` decimal(20,1) NOT NULL DEFAULT '0.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `width` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filename` varchar(256) NOT NULL DEFAULT '',
  `dlkey` char(32) NOT NULL,
  `filetype` varchar(50) NOT NULL DEFAULT '',
  `filesize` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `location` varchar(256) NOT NULL,
  `downloads` mediumint(8) NOT NULL DEFAULT '0',
  `isimage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `thumb` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `cache_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `forums` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `torrents` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `offers` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `messages` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `comments` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `requests` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `others` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `audiocodecs`
--

CREATE TABLE `audiocodecs` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(256) NOT NULL,
  `sort_index` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `autoseeding`
--

CREATE TABLE `autoseeding` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `torrentid` mediumint(8) UNSIGNED NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `completed` enum('yes','no') CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `remark` varchar(6) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `avps`
--

CREATE TABLE `avps` (
  `arg` varchar(20) NOT NULL DEFAULT '',
  `value_s` text NOT NULL,
  `value_i` int(11) NOT NULL DEFAULT '0',
  `value_u` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `banipv6`
--

CREATE TABLE `banipv6` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `addedby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `ip0` int(11) NOT NULL DEFAULT '0',
  `ip1` int(11) NOT NULL DEFAULT '0',
  `ip2` int(11) NOT NULL DEFAULT '0',
  `ip3` int(11) NOT NULL DEFAULT '0',
  `ip4` int(11) NOT NULL DEFAULT '0',
  `ip5` int(11) NOT NULL DEFAULT '0',
  `ip6` int(11) NOT NULL DEFAULT '0',
  `ip7` int(11) NOT NULL DEFAULT '0',
  `type` enum('ip','school','building') NOT NULL DEFAULT 'ip',
  `until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `bannedemails`
--

CREATE TABLE `bannedemails` (
  `id` int(10) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bannedkeywords`
--

CREATE TABLE `bannedkeywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `bannedtitle`
--

CREATE TABLE `bannedtitle` (
  `id` int(10) UNSIGNED NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `catid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment` varchar(255) DEFAULT NULL,
  `addedby` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `banned_file_type`
--

CREATE TABLE `banned_file_type` (
  `id` int(11) NOT NULL,
  `catid` smallint(6) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `class` enum('banned','notallowed') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bans`
--

CREATE TABLE `bans` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `addedby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `first` bigint(20) NOT NULL,
  `last` bigint(20) NOT NULL,
  `until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bitbucket`
--

CREATE TABLE `bitbucket` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `blackjack`
--

CREATE TABLE `blackjack` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  `status` enum('playing','waiting') NOT NULL DEFAULT 'playing',
  `cards` text NOT NULL,
  `date` int(11) DEFAULT '0',
  `gameover` enum('yes','no') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `blocks`
--

CREATE TABLE `blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `blockid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrentid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `pic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsimapping`
--

CREATE TABLE `carsimapping` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `tjuptid` mediumint(10) UNSIGNED NOT NULL,
  `username` varchar(40) CHARACTER SET utf8 NOT NULL,
  `institution` varchar(40) CHARACTER SET utf8 NOT NULL,
  `remarks` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `carsi_invite`
--

CREATE TABLE `carsi_invite` (
  `id` int(10) NOT NULL,
  `institution` varchar(40) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `invite_code` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `carsi_schools`
--

CREATE TABLE `carsi_schools` (
  `id` int(11) NOT NULL,
  `school` varchar(20) NOT NULL DEFAULT '',
  `idp` varchar(10) NOT NULL DEFAULT '',
  `allow_reg` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catanime`
--

CREATE TABLE `catanime` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catdocum`
--

CREATE TABLE `catdocum` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `categories`
--

CREATE TABLE `categories` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `mode` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catgame`
--

CREATE TABLE `catgame` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cathq`
--

CREATE TABLE `cathq` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `caticons`
--

CREATE TABLE `caticons` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `folder` varchar(256) NOT NULL,
  `cssfile` varchar(255) NOT NULL DEFAULT '',
  `multilang` enum('yes','no') NOT NULL DEFAULT 'no',
  `secondicon` enum('yes','no') NOT NULL DEFAULT 'no',
  `designer` varchar(50) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catmovie`
--

CREATE TABLE `catmovie` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catnewsreel`
--

CREATE TABLE `catnewsreel` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catothers`
--

CREATE TABLE `catothers` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `sort_index` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catplatform`
--

CREATE TABLE `catplatform` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catseries`
--

CREATE TABLE `catseries` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catsoftware`
--

CREATE TABLE `catsoftware` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `catsports`
--

CREATE TABLE `catsports` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cheaters`
--

CREATE TABLE `cheaters` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `torrentid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uploaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `downloaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `anctime` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `seeders` mediumint(5) UNSIGNED NOT NULL DEFAULT '0',
  `leechers` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `hit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dealtby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dealtwith` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(256) NOT NULL DEFAULT '',
  `ip` varchar(64) DEFAULT NULL,
  `port` mediumint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `chronicle`
--

CREATE TABLE `chronicle` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txt` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE `class` (
  `Id` int(11) NOT NULL,
  `名称` varchar(20) DEFAULT NULL,
  `peasant` varchar(20) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `power_user` varchar(20) DEFAULT NULL,
  `elite_user` varchar(20) DEFAULT NULL,
  `crazy_user` varchar(20) DEFAULT NULL,
  `insane_user` varchar(20) DEFAULT NULL,
  `veteran_user` varchar(20) DEFAULT NULL,
  `extreme_user` varchar(20) DEFAULT NULL,
  `ultimate_user` varchar(20) DEFAULT NULL,
  `nexus master` varchar(20) DEFAULT NULL,
  `vip` varchar(20) DEFAULT NULL,
  `retiree` varchar(20) DEFAULT NULL,
  `uploader` varchar(20) DEFAULT NULL,
  `moderator` varchar(20) DEFAULT NULL,
  `administrator` varchar(20) DEFAULT NULL,
  `sysop` varchar(20) DEFAULT NULL,
  `staff_leader` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `codecs`
--

CREATE TABLE `codecs` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `torrent` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text` text,
  `ori_text` text,
  `editedby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `editdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `offer` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `request` mediumint(8) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论置顶'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `connect`
--

CREATE TABLE `connect` (
  `Id` int(11) NOT NULL,
  `school` varchar(255) DEFAULT NULL,
  `speed` varchar(255) DEFAULT NULL,
  `quality` enum('极差','差','一般','好','极好') DEFAULT '一般'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `countries`
--

CREATE TABLE `countries` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `flagpic` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `districtanime`
--

CREATE TABLE `districtanime` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `districtmovie`
--

CREATE TABLE `districtmovie` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `districttvshows`
--

CREATE TABLE `districttvshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `donation`
--

CREATE TABLE `donation` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `message` varchar(500) NOT NULL DEFAULT '',
  `anonymous` enum('yes','no') NOT NULL DEFAULT 'no',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `qrid` int(15) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `success_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '-1',
  `used` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `douban`
--

CREATE TABLE `douban` (
  `rank` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `year` int(11) UNSIGNED DEFAULT NULL,
  `rating` double(2,1) UNSIGNED DEFAULT NULL,
  `votes` varchar(38) DEFAULT NULL,
  `english_title` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `downloadspeed`
--

CREATE TABLE `downloadspeed` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `faq`
--

CREATE TABLE `faq` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `link_id` smallint(5) UNSIGNED NOT NULL,
  `lang_id` smallint(5) UNSIGNED NOT NULL DEFAULT '6',
  `type` enum('categ','item') NOT NULL DEFAULT 'item',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `flag` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `categ` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrent` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `formatanime`
--

CREATE TABLE `formatanime` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `formatdocum`
--

CREATE TABLE `formatdocum` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `formatgame`
--

CREATE TABLE `formatgame` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `formathqaudio`
--

CREATE TABLE `formathqaudio` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `formatmovie`
--

CREATE TABLE `formatmovie` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `formatnewsreel`
--

CREATE TABLE `formatnewsreel` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `sort_index` smallint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `formatsoftware`
--

CREATE TABLE `formatsoftware` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `formatsports`
--

CREATE TABLE `formatsports` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `formattvseries`
--

CREATE TABLE `formattvseries` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `formattvshows`
--

CREATE TABLE `formattvshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `forummods`
--

CREATE TABLE `forummods` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `forumid` smallint(5) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `forums`
--

CREATE TABLE `forums` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT '',
  `minclassread` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `minclasswrite` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `postcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topiccount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `minclasscreate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `forid` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `friends`
--

CREATE TABLE `friends` (
  `id` int(12) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL,
  `friendid` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fun`
--

CREATE TABLE `fun` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `body` text,
  `title` varchar(256) NOT NULL DEFAULT '',
  `status` enum('normal','dull','notfunny','funny','veryfunny','banned') NOT NULL DEFAULT 'normal',
  `comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `funds`
--

CREATE TABLE `funds` (
  `id` int(10) UNSIGNED NOT NULL,
  `usd` decimal(8,2) NOT NULL DEFAULT '0.00',
  `cny` decimal(8,2) NOT NULL DEFAULT '0.00',
  `user` mediumint(8) UNSIGNED NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `memo` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `funvotes`
--

CREATE TABLE `funvotes` (
  `funid` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote` enum('fun','dull') NOT NULL DEFAULT 'fun'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gift`
--

CREATE TABLE `gift` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `givebonus`
--

CREATE TABLE `givebonus` (
  `id` int(10) UNSIGNED NOT NULL,
  `bonusfromuserid` mediumint(8) UNSIGNED NOT NULL,
  `bonustotorrentid` mediumint(8) UNSIGNED NOT NULL,
  `bonus` decimal(10,1) UNSIGNED NOT NULL,
  `type` int(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `hqtone`
--

CREATE TABLE `hqtone` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `imdb`
--

CREATE TABLE `imdb` (
  `rank` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `imdb_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `year` int(11) UNSIGNED DEFAULT NULL,
  `rating` double(2,1) UNSIGNED DEFAULT NULL,
  `votes` varchar(38) DEFAULT NULL,
  `torrent_id` int(11) DEFAULT NULL,
  `translate_title` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `invitebox`
--

CREATE TABLE `invitebox` (
  `Id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `school` varchar(30) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `disk` varchar(50) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `self_introduction` varchar(255) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `dealt_by` varchar(20) NOT NULL DEFAULT 'no',
  `ip` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `invites`
--

CREATE TABLE `invites` (
  `id` int(10) UNSIGNED NOT NULL,
  `inviter` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `invitee` varchar(80) NOT NULL DEFAULT '',
  `hash` char(32) NOT NULL,
  `time_invited` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(50) NOT NULL DEFAULT '未知',
  `ipcheck` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `invite_rule`
--

CREATE TABLE `invite_rule` (
  `id` int(11) NOT NULL,
  `email_domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ip_range` varchar(50) NOT NULL,
  `ip_version` tinyint(4) NOT NULL DEFAULT '6',
  `enable` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `iplog`
--

CREATE TABLE `iplog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(64) NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL,
  `access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duplicate` enum('yes','no') NOT NULL DEFAULT 'no',
  `subject_id` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ipv6school`
--

CREATE TABLE `ipv6school` (
  `id` tinyint(3) NOT NULL,
  `ipv6` varchar(13) NOT NULL,
  `school` varchar(17) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isp`
--

CREATE TABLE `isp` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jc_options`
--

CREATE TABLE `jc_options` (
  `Id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `option_name` varchar(40) NOT NULL DEFAULT '',
  `option_players` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `option_total` decimal(10,1) NOT NULL DEFAULT '0.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='竞猜选项';

-- --------------------------------------------------------

--
-- 表的结构 `jc_rank`
--

CREATE TABLE `jc_rank` (
  `Id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `win_times` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lose_times` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `yin_kui` decimal(10,1) NOT NULL DEFAULT '0.0',
  `total_times` int(11) UNSIGNED DEFAULT '0',
  `win_percent` decimal(10,2) UNSIGNED DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jc_record`
--

CREATE TABLE `jc_record` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `subject_id` int(10) NOT NULL DEFAULT '0',
  `option_id` int(10) NOT NULL DEFAULT '0',
  `user_total` decimal(10,1) DEFAULT NULL,
  `state` tinyint(3) DEFAULT '0',
  `yin_kui` decimal(10,1) DEFAULT '0.0',
  `last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jc_subjects`
--

CREATE TABLE `jc_subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `creater_id` int(11) UNSIGNED DEFAULT NULL,
  `creater_name` varchar(40) NOT NULL DEFAULT '',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT '',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `limit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total` decimal(10,1) NOT NULL DEFAULT '0.0',
  `players` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `options` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `win_options` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `remark` varchar(512) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(255) DEFAULT '' COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='竞猜';

-- --------------------------------------------------------

--
-- 表的结构 `jc_sub_users`
--

CREATE TABLE `jc_sub_users` (
  `user_id` int(10) NOT NULL,
  `deliver_count` int(10) NOT NULL DEFAULT '0',
  `limit_deliver` int(10) NOT NULL DEFAULT '5',
  `total_deliver` int(11) NOT NULL DEFAULT '0',
  `last_modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `keepseed`
--

CREATE TABLE `keepseed` (
  `id` int(11) NOT NULL,
  `torrentid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `langgame`
--

CREATE TABLE `langgame` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `langhq`
--

CREATE TABLE `langhq` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `langsoftware`
--

CREATE TABLE `langsoftware` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `langtvseries`
--

CREATE TABLE `langtvseries` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `langtvshows`
--

CREATE TABLE `langtvshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `language`
--

CREATE TABLE `language` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `lang_name` varchar(50) NOT NULL,
  `flagpic` varchar(256) NOT NULL DEFAULT '',
  `sub_lang` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `rule_lang` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `site_lang` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `site_lang_folder` varchar(256) NOT NULL DEFAULT '',
  `trans_state` enum('up-to-date','outdate','incomplete','need-new','unavailable') NOT NULL DEFAULT 'unavailable'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `links`
--

CREATE TABLE `links` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(256) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location_main` varchar(200) NOT NULL,
  `location_sub` varchar(200) NOT NULL,
  `flagpic` varchar(50) DEFAULT NULL,
  `start_ip` varchar(20) NOT NULL,
  `end_ip` varchar(20) NOT NULL,
  `theory_upspeed` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `practical_upspeed` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `theory_downspeed` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `practical_downspeed` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `hit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `privilege` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `loginattempts`
--

CREATE TABLE `loginattempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(64) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `attempts` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('login','recover') NOT NULL DEFAULT 'login'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `marked_topic`
--

CREATE TABLE `marked_topic` (
  `id` int(11) NOT NULL,
  `tid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `media`
--

CREATE TABLE `media` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `receiver` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `msg` text,
  `unread` enum('yes','no') NOT NULL DEFAULT 'yes',
  `location` smallint(6) NOT NULL DEFAULT '1',
  `saved` enum('no','yes') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `modpanel`
--

CREATE TABLE `modpanel` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(256) NOT NULL DEFAULT '',
  `info` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `needverify`
--

CREATE TABLE `needverify` (
  `id` int(11) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `result` int(11) NOT NULL DEFAULT '0',
  `verified_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE `news` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `body` text,
  `title` varchar(255) NOT NULL DEFAULT '',
  `notify` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `nontjuip`
--

CREATE TABLE `nontjuip` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `first` bigint(20) NOT NULL,
  `last` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `offers`
--

CREATE TABLE `offers` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(225) NOT NULL,
  `descr` text,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allowedtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `yeah` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `against` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `category` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `comments` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `allowed` enum('allowed','pending','denied','freeze') NOT NULL DEFAULT 'pending'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `offersinfo`
--

CREATE TABLE `offersinfo` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `offerid` mediumint(8) UNSIGNED NOT NULL,
  `category` smallint(5) UNSIGNED NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `issuedate` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `subsinfo` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `imdbnum` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `specificcat` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `substeam` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `animenum` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `resolution` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tvalias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tvseasoninfo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tvshowscontent` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tvshowsguest` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tvshowsremarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `platform` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `artist` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `hqname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `hqtone` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `offervotes`
--

CREATE TABLE `offervotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `offerid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `vote` enum('yeah','against') NOT NULL DEFAULT 'yeah'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `openapi_token`
--

CREATE TABLE `openapi_token` (
  `token` varchar(40) NOT NULL,
  `uid` int(11) NOT NULL,
  `last_activity` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `num` smallint(6) NOT NULL DEFAULT '1',
  `groups` tinyint(2) NOT NULL DEFAULT '2',
  `status` enum('sending','okay') NOT NULL DEFAULT 'sending'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `overforums`
--

CREATE TABLE `overforums` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT '',
  `minclassview` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `peers`
--

CREATE TABLE `peers` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrent` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `peer_id` binary(20) NOT NULL,
  `ipv4` varchar(15) DEFAULT NULL,
  `ipv6` varchar(64) DEFAULT NULL,
  `port` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `uploaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `downloaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `to_go` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `seeder` enum('yes','no') NOT NULL DEFAULT 'no',
  `started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prev_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `agent` varchar(60) NOT NULL DEFAULT '',
  `finishedat` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `downloadoffset` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `uploadoffset` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `passkey` char(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 表的结构 `platformsoftware`
--

CREATE TABLE `platformsoftware` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pmboxes`
--

CREATE TABLE `pmboxes` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL,
  `boxnumber` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `name` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pollanswers`
--

CREATE TABLE `pollanswers` (
  `id` int(10) UNSIGNED NOT NULL,
  `pollid` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL,
  `selection` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `polls`
--

CREATE TABLE `polls` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `question` varchar(255) NOT NULL DEFAULT '',
  `option0` varchar(40) NOT NULL DEFAULT '',
  `option1` varchar(40) NOT NULL DEFAULT '',
  `option2` varchar(40) NOT NULL DEFAULT '',
  `option3` varchar(40) NOT NULL DEFAULT '',
  `option4` varchar(40) NOT NULL DEFAULT '',
  `option5` varchar(40) NOT NULL DEFAULT '',
  `option6` varchar(40) NOT NULL DEFAULT '',
  `option7` varchar(40) NOT NULL DEFAULT '',
  `option8` varchar(40) NOT NULL DEFAULT '',
  `option9` varchar(40) NOT NULL DEFAULT '',
  `option10` varchar(40) NOT NULL DEFAULT '',
  `option11` varchar(40) NOT NULL DEFAULT '',
  `option12` varchar(40) NOT NULL DEFAULT '',
  `option13` varchar(40) NOT NULL DEFAULT '',
  `option14` varchar(40) NOT NULL DEFAULT '',
  `option15` varchar(40) NOT NULL DEFAULT '',
  `option16` varchar(40) NOT NULL DEFAULT '',
  `option17` varchar(40) NOT NULL DEFAULT '',
  `option18` varchar(40) NOT NULL DEFAULT '',
  `option19` varchar(40) NOT NULL DEFAULT '',
  `option20` varchar(40) NOT NULL DEFAULT '',
  `option21` varchar(40) NOT NULL DEFAULT '',
  `option22` varchar(40) NOT NULL DEFAULT '',
  `option23` varchar(40) NOT NULL DEFAULT '',
  `option24` varchar(40) NOT NULL DEFAULT '',
  `option25` varchar(40) NOT NULL DEFAULT '',
  `option26` varchar(40) NOT NULL DEFAULT '',
  `option27` varchar(40) NOT NULL DEFAULT '',
  `option28` varchar(40) NOT NULL DEFAULT '',
  `option29` varchar(40) NOT NULL DEFAULT '',
  `option30` varchar(40) NOT NULL DEFAULT '',
  `option31` varchar(40) NOT NULL DEFAULT '',
  `option32` varchar(40) NOT NULL DEFAULT '',
  `option33` varchar(40) NOT NULL DEFAULT '',
  `option34` varchar(40) NOT NULL DEFAULT '',
  `option35` varchar(40) NOT NULL DEFAULT '',
  `option36` varchar(40) NOT NULL DEFAULT '',
  `option37` varchar(40) NOT NULL DEFAULT '',
  `option38` varchar(40) NOT NULL DEFAULT '',
  `option39` varchar(40) NOT NULL DEFAULT '',
  `option40` varchar(40) NOT NULL DEFAULT '',
  `option41` varchar(40) NOT NULL DEFAULT '',
  `option42` varchar(40) NOT NULL DEFAULT '',
  `option43` varchar(40) NOT NULL DEFAULT '',
  `option44` varchar(40) NOT NULL DEFAULT '',
  `option45` varchar(40) NOT NULL DEFAULT '',
  `option46` varchar(40) NOT NULL DEFAULT '',
  `option47` varchar(40) NOT NULL DEFAULT '',
  `option48` varchar(40) NOT NULL DEFAULT '',
  `option49` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `poll_answers`
--

CREATE TABLE `poll_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `poll_options`
--

CREATE TABLE `poll_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `poll_questions`
--

CREATE TABLE `poll_questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deadline` datetime NOT NULL,
  `choice` int(11) NOT NULL DEFAULT '1',
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `body` text,
  `ori_body` text,
  `editedby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `editdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `processings`
--

CREATE TABLE `processings` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `prolinkclicks`
--

CREATE TABLE `prolinkclicks` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `propname`
--

CREATE TABLE `propname` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `type` enum('sale','position','amount','class','name','title','color') DEFAULT 'sale',
  `value` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `timelength` int(11) NOT NULL DEFAULT '0',
  `amountlimit` smallint(6) NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `props`
--

CREATE TABLE `props` (
  `id` int(11) NOT NULL,
  `propid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer1` varchar(255) DEFAULT NULL,
  `answer2` varchar(255) DEFAULT NULL,
  `answer4` varchar(255) DEFAULT NULL,
  `answer8` varchar(255) DEFAULT NULL,
  `answer` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `readposts`
--

CREATE TABLE `readposts` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `lastpostread` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `regimages`
--

CREATE TABLE `regimages` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `imagehash` varchar(32) NOT NULL DEFAULT '',
  `imagestring` varchar(8) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `reports`
--

CREATE TABLE `reports` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `addedby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reportid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('torrent','user','offer','request','post','comment','subtitle') NOT NULL DEFAULT 'torrent',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `dealtby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dealtwith` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `req`
--

CREATE TABLE `req` (
  `id` int(11) NOT NULL,
  `catid` int(11) NOT NULL DEFAULT '401',
  `name` varchar(255) DEFAULT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `introduce` text,
  `ori_introduce` text,
  `amount` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `ori_amount` int(11) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `finish` enum('yes','no','cancel') NOT NULL DEFAULT 'no',
  `finished_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `resetdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `resolutionanime`
--

CREATE TABLE `resolutionanime` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `resolutionsports`
--

CREATE TABLE `resolutionsports` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `resreq`
--

CREATE TABLE `resreq` (
  `id` int(11) NOT NULL,
  `reqid` int(11) NOT NULL DEFAULT '0',
  `torrentid` int(11) NOT NULL DEFAULT '0',
  `chosen` enum('yes','no') NOT NULL DEFAULT 'no',
  `submitted_by` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `rules`
--

CREATE TABLE `rules` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `lang_id` smallint(5) UNSIGNED NOT NULL DEFAULT '6',
  `title` varchar(255) NOT NULL,
  `text` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `schools`
--

CREATE TABLE `schools` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `searchbox`
--

CREATE TABLE `searchbox` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `showsubcat` tinyint(1) NOT NULL DEFAULT '0',
  `showsource` tinyint(1) NOT NULL DEFAULT '0',
  `showmedium` tinyint(1) NOT NULL DEFAULT '0',
  `showcodec` tinyint(1) NOT NULL DEFAULT '0',
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  `showprocessing` tinyint(1) NOT NULL DEFAULT '0',
  `showteam` tinyint(1) NOT NULL DEFAULT '0',
  `showaudiocodec` tinyint(1) NOT NULL DEFAULT '0',
  `catsperrow` smallint(5) UNSIGNED NOT NULL DEFAULT '7',
  `catpadding` smallint(5) UNSIGNED NOT NULL DEFAULT '25'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `secondicons`
--

CREATE TABLE `secondicons` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `source` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `medium` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `codec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `standard` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `processing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `team` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `audiocodec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `seedbox_torrents`
--

CREATE TABLE `seedbox_torrents` (
  `torid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `info_hash` binary(20) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `save_as` varchar(255) NOT NULL DEFAULT '',
  `descr` text,
  `small_descr` varchar(255) NOT NULL DEFAULT '',
  `ori_descr` text,
  `category` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `source` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `medium` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `codec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `standard` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `processing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `team` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `audiocodec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('single','multi') NOT NULL DEFAULT 'single',
  `numfiles` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `nfo` blob
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `self_invite`
--

CREATE TABLE `self_invite` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(80) NOT NULL DEFAULT '',
  `used_type` enum('none','invite','revive','addbonus') NOT NULL DEFAULT 'none',
  `code` char(32) NOT NULL,
  `invite_code` char(32) DEFAULT NULL,
  `bonus_uid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `used` tinyint(4) NOT NULL DEFAULT '0',
  `ip` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shoutbox`
--

CREATE TABLE `shoutbox` (
  `id` int(10) NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8 NOT NULL,
  `type` enum('sb','hb') CHARACTER SET utf8 NOT NULL DEFAULT 'sb',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `sitelog`
--

CREATE TABLE `sitelog` (
  `id` int(10) UNSIGNED NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txt` text NOT NULL,
  `security_level` enum('normal','mod') NOT NULL DEFAULT 'normal'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sitelog_stats`
--

CREATE TABLE `sitelog_stats` (
  `Id` int(11) NOT NULL,
  `statstime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `totaltorrentssize` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `totaluploaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `totaldownloaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `totalbonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `totalinvites` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `snatched`
--

CREATE TABLE `snatched` (
  `id` int(10) NOT NULL,
  `torrentid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `port` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `uploaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `downloaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `to_go` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `seedtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `leechtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `startdat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completedat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `finished` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sources`
--

CREATE TABLE `sources` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `staffmessages`
--

CREATE TABLE `staffmessages` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `sender` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `msg` text,
  `subject` varchar(128) NOT NULL DEFAULT '',
  `answeredby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `answered` tinyint(1) NOT NULL DEFAULT '0',
  `answer` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `standards`
--

CREATE TABLE `standards` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `statistics`
--

CREATE TABLE `statistics` (
  `date` int(11) NOT NULL,
  `registered` int(11) NOT NULL,
  `totalonlinetoday` int(11) NOT NULL,
  `registered_male` int(11) NOT NULL,
  `registered_female` int(11) NOT NULL,
  `torrents` int(11) NOT NULL,
  `dead` int(11) NOT NULL,
  `totaltorrentssize` double NOT NULL,
  `totalbonus` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `stylesheets`
--

CREATE TABLE `stylesheets` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `uri` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `addicode` text,
  `designer` varchar(50) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `subs`
--

CREATE TABLE `subs` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrent_id` mediumint(8) UNSIGNED NOT NULL,
  `lang_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `uppedby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `anonymous` enum('yes','no') NOT NULL DEFAULT 'no',
  `hits` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ext` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `subsinfo`
--

CREATE TABLE `subsinfo` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sort_index` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `suggest`
--

CREATE TABLE `suggest` (
  `id` int(10) UNSIGNED NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sysoppanel`
--

CREATE TABLE `sysoppanel` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(256) NOT NULL DEFAULT '',
  `info` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `temp_invite`
--

CREATE TABLE `temp_invite` (
  `id` int(11) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `expired` datetime NOT NULL,
  `invite_code` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `thanks`
--

CREATE TABLE `thanks` (
  `id` int(10) UNSIGNED NOT NULL,
  `torrentid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tju_autosalary`
--

CREATE TABLE `tju_autosalary` (
  `Id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `salary` decimal(10,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `salarytime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `topics`
--

CREATE TABLE `topics` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL,
  `locked` enum('yes','no') NOT NULL DEFAULT 'no',
  `forumid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `firstpost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sticky` enum('no','yes') NOT NULL DEFAULT 'no',
  `hlcolor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `torrents`
--

CREATE TABLE `torrents` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `info_hash` binary(20) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `save_as` varchar(255) NOT NULL DEFAULT '',
  `descr` text,
  `small_descr` varchar(255) NOT NULL DEFAULT '',
  `ori_descr` text,
  `category` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `source` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `medium` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `codec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `standard` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `processing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `team` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `audiocodec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` enum('single','multi') NOT NULL DEFAULT 'single',
  `numfiles` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `comments` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `times_completed` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `leechers` mediumint(8) NOT NULL DEFAULT '0',
  `seeders` mediumint(8) NOT NULL DEFAULT '0',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `visible` enum('yes','no') NOT NULL DEFAULT 'yes',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `owner` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `nfo` blob,
  `sp_state` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `promotion_time_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `promotion_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `anonymous` enum('yes','no') NOT NULL DEFAULT 'no',
  `url` int(10) UNSIGNED DEFAULT NULL,
  `pos_state` enum('normal','sticky','double_sticky','triple_sticky') NOT NULL DEFAULT 'normal',
  `pos_state_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cache_stamp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `picktype` enum('hot','classic','recommended','normal','0day','IMDB','study') NOT NULL DEFAULT 'normal',
  `picktime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sp_state_temp` enum('2up_free','2up','free','half_down','normal') NOT NULL DEFAULT 'normal',
  `last_reseed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_seed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sp_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `needkeepseed` enum('yes','no') NOT NULL DEFAULT 'no',
  `seedkeeper` int(11) NOT NULL DEFAULT '0',
  `pulling_out` int(11) DEFAULT '0',
  `imdb_rating` varchar(5) DEFAULT NULL,
  `sale_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bonus_sale` enum('2up_free','2x_half','2up','free','half_down','normal') NOT NULL DEFAULT 'normal',
  `exclusive` enum('yes','no') NOT NULL DEFAULT 'no',
  `tjuptrip` enum('yes','no') NOT NULL DEFAULT 'no',
  `connectable` varchar(11) DEFAULT '-/-/-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `torrentsinfo`
--

CREATE TABLE `torrentsinfo` (
  `torid` mediumint(8) UNSIGNED NOT NULL,
  `category` smallint(5) UNSIGNED NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `issuedate` varchar(255) DEFAULT NULL,
  `subsinfo` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(255) DEFAULT NULL,
  `imdbnum` varchar(255) DEFAULT NULL,
  `specificcat` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `substeam` varchar(255) DEFAULT NULL,
  `animenum` varchar(255) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `tvalias` varchar(255) DEFAULT NULL,
  `tvseasoninfo` varchar(255) DEFAULT NULL,
  `tvshowscontent` varchar(255) DEFAULT NULL,
  `tvshowsguest` varchar(255) DEFAULT NULL,
  `tvshowsremarks` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `platform` varchar(30) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `hqname` varchar(255) DEFAULT NULL,
  `hqtone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `torrents_state`
--

CREATE TABLE `torrents_state` (
  `global_sp_state` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uploaders`
--

CREATE TABLE `uploaders` (
  `id` int(11) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deleted_last` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `deleted_torrents` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `rate` varchar(3) NOT NULL DEFAULT 'F'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uploader_autosalary`
--

CREATE TABLE `uploader_autosalary` (
  `Id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `salary` decimal(10,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `salarytime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `uploadspeed`
--

CREATE TABLE `uploadspeed` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usercss`
--

CREATE TABLE `usercss` (
  `id` int(11) NOT NULL,
  `userid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `css` text NOT NULL,
  `time` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(40) NOT NULL DEFAULT '',
  `passhash` varchar(32) NOT NULL DEFAULT '',
  `secret` varbinary(20) NOT NULL,
  `email` varchar(80) NOT NULL DEFAULT '',
  `status` enum('pending','confirmed','needverify') NOT NULL DEFAULT 'pending',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_home` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_offer` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `forum_access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_staffmsg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_pm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_comment` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_post` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_browse` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_music` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_catchup` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `editsecret` varbinary(20) NOT NULL,
  `privacy` enum('strong','normal','low') NOT NULL DEFAULT 'normal',
  `stylesheet` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `caticon` tinyint(3) UNSIGNED NOT NULL DEFAULT '8',
  `fontsize` enum('small','medium','large') NOT NULL DEFAULT 'medium',
  `info` text,
  `acceptpms` enum('yes','friends','no') NOT NULL DEFAULT 'yes',
  `commentpm` enum('yes','no') NOT NULL DEFAULT 'yes',
  `acceptatpms` enum('yes','friends','no') NOT NULL DEFAULT 'yes',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `max_class_once` tinyint(3) NOT NULL DEFAULT '1',
  `avatar` varchar(256) NOT NULL DEFAULT '',
  `uploaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `downloaded` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `seedtime` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `leechtime` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  `country` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `notifs` varchar(500) DEFAULT NULL,
  `modcomment` text,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `avatars` enum('yes','no') NOT NULL DEFAULT 'yes',
  `donor` enum('yes','no') NOT NULL DEFAULT 'no',
  `donated` decimal(8,2) NOT NULL DEFAULT '0.00',
  `donated_cny` decimal(8,2) NOT NULL DEFAULT '0.00',
  `donoruntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `warned` enum('yes','no') NOT NULL DEFAULT 'no',
  `warneduntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `noad` enum('yes','no') NOT NULL DEFAULT 'no',
  `noaduntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `torrentsperpage` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `topicsperpage` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `postsperpage` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `clicktopic` enum('firstpage','lastpage') NOT NULL DEFAULT 'firstpage',
  `deletepms` enum('yes','no') NOT NULL DEFAULT 'yes',
  `savepms` enum('yes','no') NOT NULL DEFAULT 'no',
  `showhot` enum('yes','no') NOT NULL DEFAULT 'yes',
  `showclassic` enum('yes','no') NOT NULL DEFAULT 'yes',
  `support` enum('yes','no') NOT NULL DEFAULT 'no',
  `picker` enum('yes','no') NOT NULL DEFAULT 'no',
  `designer` enum('yes','no') NOT NULL DEFAULT 'no',
  `stafffor` varchar(255) NOT NULL,
  `supportfor` varchar(255) NOT NULL,
  `pickfor` varchar(255) NOT NULL,
  `designerfor` varchar(255) NOT NULL DEFAULT '',
  `supportlang` varchar(50) NOT NULL,
  `passkey` varchar(32) NOT NULL DEFAULT '',
  `promotion_link` varchar(32) DEFAULT NULL,
  `uploadpos` enum('yes','no') NOT NULL DEFAULT 'yes',
  `forumpost` enum('yes','no') NOT NULL DEFAULT 'yes',
  `forumbanuntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `downloadpos` enum('yes','no') NOT NULL DEFAULT 'yes',
  `clientselect` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `signatures` enum('yes','no') NOT NULL DEFAULT 'yes',
  `signature` varchar(800) NOT NULL DEFAULT '',
  `lang` smallint(5) UNSIGNED NOT NULL DEFAULT '6',
  `cheat` smallint(6) NOT NULL DEFAULT '0',
  `download` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `upload` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `invites` smallint(5) NOT NULL DEFAULT '0',
  `invited_by` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `gender` enum('Male','Female','N/A') NOT NULL DEFAULT 'N/A',
  `vip_added` enum('yes','no') NOT NULL DEFAULT 'no',
  `vip_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `seedbonus` decimal(10,1) NOT NULL DEFAULT '0.0',
  `charity` decimal(10,1) NOT NULL DEFAULT '0.0',
  `bonuscomment` text,
  `parked` enum('yes','no') NOT NULL DEFAULT 'no',
  `leechwarn` enum('yes','no') NOT NULL DEFAULT 'no',
  `leechwarnuntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastwarned` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeswarned` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `warnedby` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sbnum` smallint(5) UNSIGNED NOT NULL DEFAULT '70',
  `sbrefresh` smallint(5) UNSIGNED NOT NULL DEFAULT '120',
  `hidehb` enum('yes','no') DEFAULT 'no',
  `showimdb` enum('yes','no') DEFAULT 'yes',
  `showdescription` enum('yes','no') DEFAULT 'yes',
  `showcomment` enum('yes','no') DEFAULT 'yes',
  `showclienterror` enum('yes','no') NOT NULL DEFAULT 'no',
  `showdlnotice` tinyint(1) NOT NULL DEFAULT '1',
  `showtjuipnotice` enum('yes','no','never') NOT NULL DEFAULT 'no',
  `tooltip` enum('minorimdb','medianimdb','off') NOT NULL DEFAULT 'off',
  `shownfo` enum('yes','no') DEFAULT 'yes',
  `timetype` enum('timeadded','timealive') DEFAULT 'timealive',
  `appendsticky` enum('yes','no') DEFAULT 'yes',
  `appendnew` enum('yes','no') DEFAULT 'yes',
  `appendpromotion` enum('highlight','word','icon','off') DEFAULT 'word',
  `appendpicked` enum('yes','no') DEFAULT 'yes',
  `dlicon` enum('yes','no') DEFAULT 'yes',
  `bmicon` enum('yes','no') DEFAULT 'yes',
  `showsmalldescr` enum('yes','no') NOT NULL DEFAULT 'yes',
  `showcomnum` enum('yes','no') DEFAULT 'yes',
  `showlastcom` enum('yes','no') DEFAULT 'no',
  `showlastpost` enum('yes','no') NOT NULL DEFAULT 'no',
  `pmnum` tinyint(3) UNSIGNED NOT NULL DEFAULT '10',
  `school` smallint(5) UNSIGNED NOT NULL DEFAULT '35',
  `showfb` enum('yes','no') NOT NULL DEFAULT 'yes',
  `bjlosses` int(10) NOT NULL DEFAULT '0',
  `bjwins` int(10) NOT NULL DEFAULT '0',
  `answer` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `renamenum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `classtype` tinyint(2) DEFAULT '4',
  `width` enum('wide','narrow') NOT NULL DEFAULT 'wide',
  `jc_manager` enum('yes','no') NOT NULL DEFAULT 'no',
  `enablepublic4` enum('yes','no') NOT NULL DEFAULT 'no',
  `qq` bigint(15) UNSIGNED DEFAULT NULL,
  `page` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `adminpanel`
--
ALTER TABLE `adminpanel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `agent_allowed_exception`
--
ALTER TABLE `agent_allowed_exception`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `agent_allowed_family`
--
ALTER TABLE `agent_allowed_family`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `allowedemails`
--
ALTER TABLE `allowedemails`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `api_token`
--
ALTER TABLE `api_token`
  ADD PRIMARY KEY (`token`),
  ADD UNIQUE KEY `api_token_token_uindex` (`token`);

--
-- 表的索引 `app_luckydraw`
--
ALTER TABLE `app_luckydraw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_start` (`time_start`,`time_until`,`status`),
  ADD KEY `time_until` (`time_until`),
  ADD KEY `status` (`status`);

--
-- 表的索引 `app_luckydraw_players`
--
ALTER TABLE `app_luckydraw_players`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `luckydraw_id` (`luckydraw_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `win_or_lose` (`win_or_lose`);

--
-- 表的索引 `app_rename`
--
ALTER TABLE `app_rename`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `app_tryluck`
--
ALTER TABLE `app_tryluck`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`userid`,`id`),
  ADD KEY `dateline` (`added`,`isimage`,`downloads`);

--
-- 表的索引 `audiocodecs`
--
ALTER TABLE `audiocodecs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `autoseeding`
--
ALTER TABLE `autoseeding`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `avps`
--
ALTER TABLE `avps`
  ADD PRIMARY KEY (`arg`);

--
-- 表的索引 `banipv6`
--
ALTER TABLE `banipv6`
  ADD PRIMARY KEY (`ip0`,`ip1`,`ip2`,`ip3`),
  ADD KEY `until` (`until`),
  ADD KEY `id` (`id`);

--
-- 表的索引 `bannedemails`
--
ALTER TABLE `bannedemails`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bannedkeywords`
--
ALTER TABLE `bannedkeywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keywords` (`keywords`(4));

--
-- 表的索引 `bannedtitle`
--
ALTER TABLE `bannedtitle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keywords` (`keywords`(4));

--
-- 表的索引 `banned_file_type`
--
ALTER TABLE `banned_file_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `first_last` (`first`,`last`);

--
-- 表的索引 `bitbucket`
--
ALTER TABLE `bitbucket`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `blackjack`
--
ALTER TABLE `blackjack`
  ADD PRIMARY KEY (`userid`);

--
-- 表的索引 `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userfriend` (`userid`,`blockid`);

--
-- 表的索引 `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid_torrentid` (`userid`,`torrentid`);

--
-- 表的索引 `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `carsimapping`
--
ALTER TABLE `carsimapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tjuptid` (`tjuptid`,`username`,`institution`);

--
-- 表的索引 `carsi_invite`
--
ALTER TABLE `carsi_invite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution` (`institution`,`username`);

--
-- 表的索引 `carsi_schools`
--
ALTER TABLE `carsi_schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idp` (`idp`);

--
-- 表的索引 `catanime`
--
ALTER TABLE `catanime`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `catdocum`
--
ALTER TABLE `catdocum`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mode_sort` (`mode`,`sort_index`);

--
-- 表的索引 `catgame`
--
ALTER TABLE `catgame`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `cathq`
--
ALTER TABLE `cathq`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `caticons`
--
ALTER TABLE `caticons`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `catmovie`
--
ALTER TABLE `catmovie`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `catnewsreel`
--
ALTER TABLE `catnewsreel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `catothers`
--
ALTER TABLE `catothers`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `catplatform`
--
ALTER TABLE `catplatform`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `catseries`
--
ALTER TABLE `catseries`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `catsoftware`
--
ALTER TABLE `catsoftware`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `catsports`
--
ALTER TABLE `catsports`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `cheaters`
--
ALTER TABLE `cheaters`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `chronicle`
--
ALTER TABLE `chronicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added` (`added`);

--
-- 表的索引 `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `codecs`
--
ALTER TABLE `codecs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `torrent_id` (`torrent`,`id`),
  ADD KEY `offer_id` (`offer`,`id`),
  ADD KEY `text` (`text`(10)),
  ADD KEY `idx_tsid` (`torrent`,`is_sticky`,`id`);

--
-- 表的索引 `connect`
--
ALTER TABLE `connect`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `districtanime`
--
ALTER TABLE `districtanime`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `districtmovie`
--
ALTER TABLE `districtmovie`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `districttvshows`
--
ALTER TABLE `districttvshows`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `douban`
--
ALTER TABLE `douban`
  ADD PRIMARY KEY (`rank`);

--
-- 表的索引 `downloadspeed`
--
ALTER TABLE `downloadspeed`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torrent` (`torrent`);

--
-- 表的索引 `formatanime`
--
ALTER TABLE `formatanime`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `formatdocum`
--
ALTER TABLE `formatdocum`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `formatgame`
--
ALTER TABLE `formatgame`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `formathqaudio`
--
ALTER TABLE `formathqaudio`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `formatmovie`
--
ALTER TABLE `formatmovie`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `formatnewsreel`
--
ALTER TABLE `formatnewsreel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `formatsoftware`
--
ALTER TABLE `formatsoftware`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `formatsports`
--
ALTER TABLE `formatsports`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `formattvseries`
--
ALTER TABLE `formattvseries`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `formattvshows`
--
ALTER TABLE `formattvshows`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `forummods`
--
ALTER TABLE `forummods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forumid` (`forumid`);

--
-- 表的索引 `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userfriend` (`userid`,`friendid`);

--
-- 表的索引 `fun`
--
ALTER TABLE `fun`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `funvotes`
--
ALTER TABLE `funvotes`
  ADD PRIMARY KEY (`funid`,`userid`);

--
-- 表的索引 `gift`
--
ALTER TABLE `gift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `givebonus`
--
ALTER TABLE `givebonus`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `hqtone`
--
ALTER TABLE `hqtone`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `imdb`
--
ALTER TABLE `imdb`
  ADD PRIMARY KEY (`rank`);

--
-- 表的索引 `invitebox`
--
ALTER TABLE `invitebox`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `invite_rule`
--
ALTER TABLE `invite_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invite_rule_id_uindex` (`id`),
  ADD KEY `invite_rule_email_domain_index` (`email_domain`);

--
-- 表的索引 `iplog`
--
ALTER TABLE `iplog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `ip` (`ip`);

--
-- 表的索引 `isp`
--
ALTER TABLE `isp`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jc_options`
--
ALTER TABLE `jc_options`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `jc_rank`
--
ALTER TABLE `jc_rank`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `jc_record`
--
ALTER TABLE `jc_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jc_subjects`
--
ALTER TABLE `jc_subjects`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jc_sub_users`
--
ALTER TABLE `jc_sub_users`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `keepseed`
--
ALTER TABLE `keepseed`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `langgame`
--
ALTER TABLE `langgame`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `langhq`
--
ALTER TABLE `langhq`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `langsoftware`
--
ALTER TABLE `langsoftware`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `langtvseries`
--
ALTER TABLE `langtvseries`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `langtvshows`
--
ALTER TABLE `langtvshows`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `loginattempts`
--
ALTER TABLE `loginattempts`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `marked_topic`
--
ALTER TABLE `marked_topic`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receiver` (`receiver`),
  ADD KEY `sender` (`sender`),
  ADD KEY `msg` (`msg`(10));

--
-- 表的索引 `modpanel`
--
ALTER TABLE `modpanel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `needverify`
--
ALTER TABLE `needverify`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added` (`added`);

--
-- 表的索引 `nontjuip`
--
ALTER TABLE `nontjuip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `first_last` (`first`,`last`);

--
-- 表的索引 `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `offersinfo`
--
ALTER TABLE `offersinfo`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `offervotes`
--
ALTER TABLE `offervotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `openapi_token`
--
ALTER TABLE `openapi_token`
  ADD PRIMARY KEY (`token`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `overforums`
--
ALTER TABLE `overforums`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `peers`
--
ALTER TABLE `peers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `torrent` (`torrent`),
  ADD KEY `ipv4` (`ipv4`,`ipv6`,`port`);

--
-- 表的索引 `platformsoftware`
--
ALTER TABLE `platformsoftware`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `pmboxes`
--
ALTER TABLE `pmboxes`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pollanswers`
--
ALTER TABLE `pollanswers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollid` (`pollid`),
  ADD KEY `selection` (`selection`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `poll_answers`
--
ALTER TABLE `poll_answers`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `poll_questions`
--
ALTER TABLE `poll_questions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `topicid_id` (`topicid`,`id`),
  ADD KEY `added` (`added`);
ALTER TABLE `posts` ADD FULLTEXT KEY `body` (`body`);

--
-- 表的索引 `processings`
--
ALTER TABLE `processings`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `prolinkclicks`
--
ALTER TABLE `prolinkclicks`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `propname`
--
ALTER TABLE `propname`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `props`
--
ALTER TABLE `props`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `readposts`
--
ALTER TABLE `readposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topicid` (`topicid`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `regimages`
--
ALTER TABLE `regimages`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `req`
--
ALTER TABLE `req`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finish` (`finish`,`name`,`added`,`amount`,`introduce`(10)),
  ADD KEY `resetdate` (`resetdate`) USING BTREE;

--
-- 表的索引 `resolutionanime`
--
ALTER TABLE `resolutionanime`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `resolutionsports`
--
ALTER TABLE `resolutionsports`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `resreq`
--
ALTER TABLE `resreq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reqid` (`reqid`,`chosen`);

--
-- 表的索引 `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `searchbox`
--
ALTER TABLE `searchbox`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `secondicons`
--
ALTER TABLE `secondicons`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `seedbox_torrents`
--
ALTER TABLE `seedbox_torrents`
  ADD PRIMARY KEY (`torid`),
  ADD UNIQUE KEY `info_hash` (`info_hash`),
  ADD KEY `category_visible_banned` (`category`),
  ADD KEY `visible_pos_id` (`torid`),
  ADD KEY `visible_banned_pos_id` (`torid`);
ALTER TABLE `seedbox_torrents` ADD FULLTEXT KEY `name` (`name`);

--
-- 表的索引 `self_invite`
--
ALTER TABLE `self_invite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD KEY `code` (`code`),
  ADD KEY `id` (`id`);

--
-- 表的索引 `shoutbox`
--
ALTER TABLE `shoutbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`);

--
-- 表的索引 `sitelog`
--
ALTER TABLE `sitelog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added` (`added`);

--
-- 表的索引 `sitelog_stats`
--
ALTER TABLE `sitelog_stats`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `snatched`
--
ALTER TABLE `snatched`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torrentid_userid` (`torrentid`,`userid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `seedtime` (`seedtime`,`leechtime`);

--
-- 表的索引 `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `staffmessages`
--
ALTER TABLE `staffmessages`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `standards`
--
ALTER TABLE `standards`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`date`);

--
-- 表的索引 `stylesheets`
--
ALTER TABLE `stylesheets`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `subs`
--
ALTER TABLE `subs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torrentid_langid` (`torrent_id`,`lang_id`);

--
-- 表的索引 `subsinfo`
--
ALTER TABLE `subsinfo`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `suggest`
--
ALTER TABLE `suggest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keywords` (`keywords`(4)),
  ADD KEY `adddate` (`adddate`);

--
-- 表的索引 `sysoppanel`
--
ALTER TABLE `sysoppanel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `temp_invite`
--
ALTER TABLE `temp_invite`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `thanks`
--
ALTER TABLE `thanks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `torrentid_id` (`torrentid`,`id`),
  ADD KEY `torrentid_userid` (`torrentid`,`userid`);

--
-- 表的索引 `tju_autosalary`
--
ALTER TABLE `tju_autosalary`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `subject` (`subject`),
  ADD KEY `forumid_lastpost` (`forumid`,`lastpost`),
  ADD KEY `forumid_sticky_lastpost` (`forumid`,`sticky`,`lastpost`);

--
-- 表的索引 `torrents`
--
ALTER TABLE `torrents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `visible_pos_id` (`visible`,`pos_state`,`id`),
  ADD KEY `url` (`url`),
  ADD KEY `category_visible_banned` (`category`,`visible`,`banned`),
  ADD KEY `visible_banned_pos_id` (`visible`,`banned`,`pos_state`,`id`),
  ADD KEY `descr` (`descr`(10)),
  ADD KEY `pulling_out` (`pulling_out`),
  ADD KEY `info_hash` (`info_hash`) USING BTREE,
  ADD KEY `query_by_user` (`banned`,`owner`,`pulling_out`) USING BTREE,
  ADD KEY `query_by_user2` (`banned`,`pulling_out`) USING BTREE,
  ADD KEY `pos_state` (`pos_state`);
ALTER TABLE `torrents` ADD FULLTEXT KEY `name` (`name`);

--
-- 表的索引 `torrentsinfo`
--
ALTER TABLE `torrentsinfo`
  ADD PRIMARY KEY (`torid`);

--
-- 表的索引 `uploaders`
--
ALTER TABLE `uploaders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- 表的索引 `uploader_autosalary`
--
ALTER TABLE `uploader_autosalary`
  ADD PRIMARY KEY (`Id`);

--
-- 表的索引 `uploadspeed`
--
ALTER TABLE `uploadspeed`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `usercss`
--
ALTER TABLE `usercss`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `status_added` (`status`,`added`),
  ADD KEY `ip` (`ip`),
  ADD KEY `uploaded` (`uploaded`),
  ADD KEY `downloaded` (`downloaded`),
  ADD KEY `country` (`country`),
  ADD KEY `last_access` (`last_access`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `warned` (`warned`),
  ADD KEY `cheat` (`cheat`),
  ADD KEY `class` (`class`),
  ADD KEY `passkey` (`passkey`(8)),
  ADD KEY `title` (`title`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `adminpanel`
--
ALTER TABLE `adminpanel`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `agent_allowed_exception`
--
ALTER TABLE `agent_allowed_exception`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `agent_allowed_family`
--
ALTER TABLE `agent_allowed_family`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `allowedemails`
--
ALTER TABLE `allowedemails`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `app_luckydraw`
--
ALTER TABLE `app_luckydraw`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `app_luckydraw_players`
--
ALTER TABLE `app_luckydraw_players`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `app_rename`
--
ALTER TABLE `app_rename`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `app_tryluck`
--
ALTER TABLE `app_tryluck`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `audiocodecs`
--
ALTER TABLE `audiocodecs`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `autoseeding`
--
ALTER TABLE `autoseeding`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `banipv6`
--
ALTER TABLE `banipv6`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bannedemails`
--
ALTER TABLE `bannedemails`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bannedkeywords`
--
ALTER TABLE `bannedkeywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bannedtitle`
--
ALTER TABLE `bannedtitle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `banned_file_type`
--
ALTER TABLE `banned_file_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bans`
--
ALTER TABLE `bans`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bitbucket`
--
ALTER TABLE `bitbucket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `carsimapping`
--
ALTER TABLE `carsimapping`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `carsi_invite`
--
ALTER TABLE `carsi_invite`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `carsi_schools`
--
ALTER TABLE `carsi_schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `catanime`
--
ALTER TABLE `catanime`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `caticons`
--
ALTER TABLE `caticons`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `catnewsreel`
--
ALTER TABLE `catnewsreel`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `catothers`
--
ALTER TABLE `catothers`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cheaters`
--
ALTER TABLE `cheaters`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `chronicle`
--
ALTER TABLE `chronicle`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `class`
--
ALTER TABLE `class`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `codecs`
--
ALTER TABLE `codecs`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `connect`
--
ALTER TABLE `connect`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `countries`
--
ALTER TABLE `countries`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `donation`
--
ALTER TABLE `donation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `downloadspeed`
--
ALTER TABLE `downloadspeed`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `faq`
--
ALTER TABLE `faq`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formatgame`
--
ALTER TABLE `formatgame`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formathqaudio`
--
ALTER TABLE `formathqaudio`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formatmovie`
--
ALTER TABLE `formatmovie`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formatnewsreel`
--
ALTER TABLE `formatnewsreel`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formatsoftware`
--
ALTER TABLE `formatsoftware`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formatsports`
--
ALTER TABLE `formatsports`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formattvseries`
--
ALTER TABLE `formattvseries`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `formattvshows`
--
ALTER TABLE `formattvshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `forummods`
--
ALTER TABLE `forummods`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `forums`
--
ALTER TABLE `forums`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fun`
--
ALTER TABLE `fun`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `funds`
--
ALTER TABLE `funds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gift`
--
ALTER TABLE `gift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `givebonus`
--
ALTER TABLE `givebonus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `hqtone`
--
ALTER TABLE `hqtone`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `invitebox`
--
ALTER TABLE `invitebox`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `invites`
--
ALTER TABLE `invites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `invite_rule`
--
ALTER TABLE `invite_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `iplog`
--
ALTER TABLE `iplog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `isp`
--
ALTER TABLE `isp`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jc_options`
--
ALTER TABLE `jc_options`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jc_rank`
--
ALTER TABLE `jc_rank`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jc_record`
--
ALTER TABLE `jc_record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jc_subjects`
--
ALTER TABLE `jc_subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `keepseed`
--
ALTER TABLE `keepseed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `langgame`
--
ALTER TABLE `langgame`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `language`
--
ALTER TABLE `language`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `links`
--
ALTER TABLE `links`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `loginattempts`
--
ALTER TABLE `loginattempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `marked_topic`
--
ALTER TABLE `marked_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `media`
--
ALTER TABLE `media`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `modpanel`
--
ALTER TABLE `modpanel`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `needverify`
--
ALTER TABLE `needverify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `nontjuip`
--
ALTER TABLE `nontjuip`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `offers`
--
ALTER TABLE `offers`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `offersinfo`
--
ALTER TABLE `offersinfo`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `offervotes`
--
ALTER TABLE `offervotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `overforums`
--
ALTER TABLE `overforums`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `peers`
--
ALTER TABLE `peers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pmboxes`
--
ALTER TABLE `pmboxes`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pollanswers`
--
ALTER TABLE `pollanswers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `polls`
--
ALTER TABLE `polls`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `poll_answers`
--
ALTER TABLE `poll_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `poll_questions`
--
ALTER TABLE `poll_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `processings`
--
ALTER TABLE `processings`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `prolinkclicks`
--
ALTER TABLE `prolinkclicks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `propname`
--
ALTER TABLE `propname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `props`
--
ALTER TABLE `props`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `readposts`
--
ALTER TABLE `readposts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `regimages`
--
ALTER TABLE `regimages`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `reports`
--
ALTER TABLE `reports`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `req`
--
ALTER TABLE `req`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `resolutionanime`
--
ALTER TABLE `resolutionanime`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `resolutionsports`
--
ALTER TABLE `resolutionsports`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `resreq`
--
ALTER TABLE `resreq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rules`
--
ALTER TABLE `rules`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `schools`
--
ALTER TABLE `schools`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `searchbox`
--
ALTER TABLE `searchbox`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `secondicons`
--
ALTER TABLE `secondicons`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `self_invite`
--
ALTER TABLE `self_invite`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `shoutbox`
--
ALTER TABLE `shoutbox`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sitelog`
--
ALTER TABLE `sitelog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sitelog_stats`
--
ALTER TABLE `sitelog_stats`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `snatched`
--
ALTER TABLE `snatched`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sources`
--
ALTER TABLE `sources`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `staffmessages`
--
ALTER TABLE `staffmessages`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `standards`
--
ALTER TABLE `standards`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `stylesheets`
--
ALTER TABLE `stylesheets`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `subs`
--
ALTER TABLE `subs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `subsinfo`
--
ALTER TABLE `subsinfo`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `suggest`
--
ALTER TABLE `suggest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sysoppanel`
--
ALTER TABLE `sysoppanel`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `temp_invite`
--
ALTER TABLE `temp_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `thanks`
--
ALTER TABLE `thanks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tju_autosalary`
--
ALTER TABLE `tju_autosalary`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `topics`
--
ALTER TABLE `topics`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `torrents`
--
ALTER TABLE `torrents`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `uploaders`
--
ALTER TABLE `uploaders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `uploader_autosalary`
--
ALTER TABLE `uploader_autosalary`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `uploadspeed`
--
ALTER TABLE `uploadspeed`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `usercss`
--
ALTER TABLE `usercss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
