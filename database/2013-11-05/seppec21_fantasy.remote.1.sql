-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 05, 2013 at 07:22 PM
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
-- Database: `seppec21_fantasy`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `isbn` varchar(32) NOT NULL default '',
  `title` varchar(128) default NULL,
  `type` varchar(64) default NULL,
  `published` year(4) NOT NULL default '0000',
  PRIMARY KEY  (`isbn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`isbn`, `title`, `type`, `published`) VALUES
('9780131354289', 'Database Systems', 'Engineering', 2009),
('9780192861986', 'The Emperors New Mind', 'Science', 1999),
('9780596518844', 'SQL in a Nutshell', 'Engineering', 2008),
('9781558604561', NULL, NULL, 2002),
('9781851776344', 'Raphael', 'Art History', 2010);

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

DROP TABLE IF EXISTS `book_copy`;
CREATE TABLE IF NOT EXISTS `book_copy` (
  `bid` int(11) NOT NULL default '0',
  `isbn` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`bid`, `isbn`) VALUES
(1, '9780131354289'),
(2, '9780131354289'),
(3, '9780131354289'),
(4, '9780596518844'),
(5, '9781851776344'),
(6, '9781851776344'),
(7, '9781851776344'),
(8, '9781558604561'),
(9, '9780192861986');

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
CREATE TABLE IF NOT EXISTS `competition` (
  `id` int(11) NOT NULL default '0',
  `event_id` int(11) NOT NULL default '0',
  `description` varchar(128) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competition_competitor`
--

DROP TABLE IF EXISTS `competition_competitor`;
CREATE TABLE IF NOT EXISTS `competition_competitor` (
  `id` int(11) NOT NULL default '0',
  `competition_id` int(11) NOT NULL default '0',
  `competitor_id` int(11) NOT NULL default '0',
  `started` tinyint(1) NOT NULL default '0',
  `finished` tinyint(1) NOT NULL default '0',
  `position` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competition_competitor_point`
--

DROP TABLE IF EXISTS `competition_competitor_point`;
CREATE TABLE IF NOT EXISTS `competition_competitor_point` (
  `competition_competitor_id` int(11) NOT NULL default '0',
  `point_id` int(11) NOT NULL default '0',
  `quantity` int(11) NOT NULL default '0',
  PRIMARY KEY  (`competition_competitor_id`,`point_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competitor`
--

DROP TABLE IF EXISTS `competitor`;
CREATE TABLE IF NOT EXISTS `competitor` (
  `id` int(11) NOT NULL default '0',
  `name` text NOT NULL,
  `gender` tinyint(1) NOT NULL default '0',
  `price` double NOT NULL default '0',
  `points` int(11) NOT NULL default '0',
  `appearances` int(11) NOT NULL default '0',
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `competitor`
--

INSERT INTO `competitor` (`id`, `name`, `gender`, `price`, `points`, `appearances`) VALUES
(0, 'Dave Cassettari', 0, 1, 0, 0),
(1, 'Haran Rajkumar', 1, 4, 0, 0),
(1, 'Tom Beswetheric', 0, 8.5, 0, 0),
(2, 'Mark Buky', 0, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL default '0',
  `name` varchar(128) NOT NULL default '',
  `captain_id` int(11) default NULL,
  `user_team_min` int(11) default NULL,
  `user_team_max` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `captain_id`, `user_team_min`, `user_team_max`) VALUES
(0, 'Imperial College 1', NULL, 1, NULL),
(1, 'Imperial College 2', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL default '0',
  `sport_id` int(11) NOT NULL default '0',
  `name` varchar(128) NOT NULL default '',
  `mens` tinyint(1) NOT NULL default '0',
  `womans` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `sport_id`, `name`, `mens`, `womans`) VALUES
(0, 0, '100m', 1, 0),
(1, 0, '100m', 0, 1),
(2, 0, '400m', 1, 0),
(3, 0, '400m', 0, 1),
(4, 1, 'BMX', 1, 0),
(5, 1, 'BMX', 0, 1),
(6, 1, '10k Time Trial', 1, 0),
(7, 1, '10k Time Trial', 0, 1),
(8, 2, '50m Freestyle', 1, 0),
(9, 2, '50m Freestyle', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
  `bid` int(11) NOT NULL default '0',
  `cid` varchar(64) NOT NULL default '',
  `lent` date NOT NULL default '0000-00-00',
  `returned` date default NULL,
  PRIMARY KEY  (`bid`,`cid`,`lent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`bid`, `cid`, `lent`, `returned`) VALUES
(1, '12563478', '2010-08-01', '2010-08-08'),
(1, '12563478', '2010-09-01', '2010-09-28'),
(2, '54328765', '2010-09-09', '2010-09-12'),
(2, '87436521', '2010-08-04', '2010-09-08'),
(2, '87436521', '2010-09-20', NULL),
(4, '87436521', '2010-08-04', '2010-09-08'),
(5, '87436521', '2010-08-04', '2010-09-08'),
(6, '12563478', '2010-09-01', '2010-09-28'),
(8, '87436521', '2010-09-20', NULL),
(9, '34341212', '2010-09-02', '2010-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
CREATE TABLE IF NOT EXISTS `point` (
  `id` int(11) NOT NULL default '0',
  `description` varchar(128) NOT NULL default '0',
  `points` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `point`
--

INSERT INTO `point` (`id`, `description`, `points`) VALUES
(5, 'Personal Best', 4),
(4, 'Olympic Record', 15),
(3, 'World Record', 25),
(2, 'Bronze Medal', 6),
(1, 'Silver Medal', 10),
(0, 'Gold Medal', 20),
(6, 'DNF', -5);

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
CREATE TABLE IF NOT EXISTS `season` (
  `id` int(11) NOT NULL default '0',
  `year` year(4) NOT NULL default '0000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`id`, `year`) VALUES
(0, 2010);

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `id` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`id`, `name`) VALUES
(0, 'Athletics'),
(1, 'Cycling'),
(2, 'Swimming');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL default '0',
  `username` varchar(64) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `email` text NOT NULL,
  `competitor_id` int(11) default NULL,
  `cash` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `competitor_id`, `cash`) VALUES
(0, 'dave_cassettari', '5f4dcc3b5aa765d61d8327deb882cf99', 'davec1190@hotmail.com', 0, 50);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
