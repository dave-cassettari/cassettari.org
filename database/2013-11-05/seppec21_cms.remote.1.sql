-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 05, 2013 at 07:23 PM
-- Server version: 5.0.96-community
-- PHP Version: 5.2.6

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `seppec21_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
CREATE TABLE IF NOT EXISTS `feed` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feed`
--

INSERT INTO `feed` (`id`, `name`, `description`) VALUES
(1, 'News', 'All the latest...');

-- --------------------------------------------------------

--
-- Table structure for table `feed_item`
--

DROP TABLE IF EXISTS `feed_item`;
CREATE TABLE IF NOT EXISTS `feed_item` (
  `feed_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`feed_id`,`date`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feed_item`
--

INSERT INTO `feed_item` (`feed_id`, `title`, `body`, `date`) VALUES
(1, 'Title1', 'some body', '2011-06-04 11:18:59'),
(1, 'Title 2', 'blah<br />blah<br />blah<br />blah<br />blah<br />blah<br />blah<br />blah<br />blah<br />blah<br />', '2011-06-05 11:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) default NULL,
  `name` varchar(32) NOT NULL,
  `title` varchar(256) NOT NULL,
  `template` int(11) default NULL,
  `target` varchar(64) default NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `parent_id`, `name`, `title`, `template`, `target`, `enabled`) VALUES
(1, NULL, '', 'Home', 1, '', 1),
(2, NULL, 'products', 'Products', NULL, '', 1),
(3, NULL, 'contact', 'Contact', NULL, '', 1),
(4, 2, 'aerial', 'Modern Aerial Photography', NULL, 'content_target', 1),
(5, 2, 'thermal', 'Thermal Mapping', NULL, 'content_target', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_content`
--

DROP TABLE IF EXISTS `page_content`;
CREATE TABLE IF NOT EXISTS `page_content` (
  `page_id` int(11) NOT NULL,
  `page_order` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY  (`page_id`,`page_order`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_content`
--

INSERT INTO `page_content` (`page_id`, `page_order`, `text`) VALUES
(1, 1, '<p>Home page intro.</p>\r\n\r\n<p><a class="ajax" href="products/aerial/">Ajax 1</a></p>\r\n<p><a class="ajax" href="products/thermal/">Ajax 1</a></p>\r\n\r\n<div id="content_target"></div>'),
(1, 3, 'Home page more links'),
(4, 1, 'Aerial photography content'),
(5, 1, 'Thermal content');

-- --------------------------------------------------------

--
-- Table structure for table `page_feed`
--

DROP TABLE IF EXISTS `page_feed`;
CREATE TABLE IF NOT EXISTS `page_feed` (
  `page_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `page_order` int(11) NOT NULL,
  `items` int(11) NOT NULL,
  PRIMARY KEY  (`page_id`,`feed_id`,`page_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_feed`
--

INSERT INTO `page_feed` (`page_id`, `feed_id`, `page_order`, `items`) VALUES
(1, 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `page_role`
--

DROP TABLE IF EXISTS `page_role`;
CREATE TABLE IF NOT EXISTS `page_role` (
  `page_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `since` datetime NOT NULL,
  PRIMARY KEY  (`page_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
CREATE TABLE IF NOT EXISTS `template` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `title`, `description`) VALUES
(1, 'default', 'Default Template', 'The default template');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `since` datetime NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
