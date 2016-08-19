-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2016 at 07:07 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stellardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentdata`
--

CREATE TABLE IF NOT EXISTS `commentdata` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `topicId` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `commentdata`
--

INSERT INTO `commentdata` (`commentId`, `topicId`, `content`, `rating`, `userId`) VALUES
(1, 1, 'Nepping 1, 2, 3~~~', 0, 2),
(2, 1, 'Is it working?', 0, 3),
(3, 2, 'Testing Testing', 0, 1),
(4, 2, '*sigh*', 0, 3),
(5, 3, 'Error Error', 0, 1),
(6, 3, 'LOL #LonelyHeart #Tsundere', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `followerdata`
--

CREATE TABLE IF NOT EXISTS `followerdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followerId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `followerdata`
--

INSERT INTO `followerdata` (`id`, `followerId`, `userId`) VALUES
(24, 4, 5),
(27, 13, 11),
(28, 4, 6),
(29, 4, 9),
(30, 4, 13),
(31, 4, 3),
(32, 4, 11);

-- --------------------------------------------------------

--
-- Table structure for table `followingdata`
--

CREATE TABLE IF NOT EXISTS `followingdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followingId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `followingdata`
--

INSERT INTO `followingdata` (`id`, `followingId`, `userId`) VALUES
(24, 5, 4),
(27, 11, 13),
(28, 6, 4),
(29, 9, 4),
(30, 13, 4),
(31, 3, 4),
(32, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifdata`
--

CREATE TABLE IF NOT EXISTS `notifdata` (
  `notifId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `viewerId` int(11) NOT NULL,
  `topicId` int(11) DEFAULT NULL,
  `commentId` int(11) DEFAULT NULL,
  `isRating` tinyint(1) NOT NULL,
  `isViewed` tinyint(1) NOT NULL,
  PRIMARY KEY (`notifId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `notifdata`
--

INSERT INTO `notifdata` (`notifId`, `userId`, `viewerId`, `topicId`, `commentId`, `isRating`, `isViewed`) VALUES
(1, 1, 4, 1, NULL, 0, 0),
(2, 1, 4, 1, NULL, 1, 0),
(3, 1, 1, NULL, NULL, 0, 0),
(4, 1, 1, NULL, NULL, 1, 0),
(5, 1, 1, NULL, NULL, 0, 0),
(6, 4, 2, 1, NULL, 0, 0),
(8, 4, 2, 1, NULL, 0, 0),
(9, 4, 2, 2, NULL, 0, 0),
(10, 4, 2, 1, NULL, 0, 0),
(11, 4, 1, 1, NULL, 0, 0),
(12, 4, 1, 1, NULL, 0, 0),
(13, 4, 11, 1, NULL, 0, 0),
(14, 4, 10, 4, NULL, 0, 0),
(15, 4, 7, 5, NULL, 0, 0),
(16, 4, 5, 2, NULL, 0, 0),
(17, 4, 9, 7, NULL, 0, 0),
(18, 4, 3, 7, NULL, 0, 0),
(19, 4, 11, 3, NULL, 0, 0),
(20, 4, 11, 3, NULL, 0, 0),
(21, 4, 11, 3, NULL, 0, 0),
(22, 4, 2, 2, NULL, 0, 0),
(23, 4, 3, 9, NULL, 0, 0),
(24, 4, 7, 2, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `topicdata`
--

CREATE TABLE IF NOT EXISTS `topicdata` (
  `topicId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `content` varchar(200) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`topicId`),
  UNIQUE KEY `topicId` (`topicId`),
  UNIQUE KEY `topicId_2` (`topicId`),
  UNIQUE KEY `topicId_3` (`topicId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `topicdata`
--

INSERT INTO `topicdata` (`topicId`, `title`, `rating`, `content`, `userId`, `date`) VALUES
(1, 'Testing', 2, 'Testing 1, 2, 3.', 4, '2016-08-09 07:29:21'),
(2, 'Nepu', 0, 'Nepu Nepu Nepu Nepu Nepu Nepu Nepu!!!', 4, '2016-08-09 07:29:21'),
(3, 'I''m the best.', 3, 'I only do everything! #TopCPU', 2, '2016-08-09 07:29:21'),
(4, 'asd', 3, 'as', 4, '2016-08-09 07:29:21'),
(10, 'asd', NULL, 'a', 4, '2016-08-09 07:29:21'),
(11, 'asdasd', NULL, 'asdas', 4, '2016-08-09 07:29:21'),
(12, 'LOLOLOL', NULL, 'crei', 4, '2016-08-09 07:29:21'),
(13, 'asd', NULL, 'asd', 4, '2016-08-09 07:29:21'),
(14, 'asd', NULL, 'a', 4, '2016-08-09 07:29:21'),
(15, 'a', NULL, '', 4, '2016-08-09 07:29:21'),
(16, '', NULL, '', 4, '2016-08-09 07:29:21'),
(17, 's', NULL, 'd', 4, '2016-08-09 07:29:21'),
(18, '', NULL, 'asdasd', 4, '2016-08-09 07:29:21'),
(19, '', NULL, 'asdasd', 4, '2016-08-09 07:29:21'),
(20, '', NULL, 'asdasd', 4, '2016-08-09 07:29:21'),
(21, '', NULL, 'asd', 4, '2016-08-09 07:29:21'),
(22, 'asd', NULL, 'asd', 4, '2016-08-09 07:29:21'),
(23, 'nekjnk', NULL, '', 4, '2016-08-09 07:29:21'),
(24, '', NULL, '', 4, '2016-08-09 07:29:21'),
(25, '', 4, '', 4, '2016-08-09 07:29:21'),
(26, 'What.', 4, 'Nepu Nepu', 4, '2016-08-09 07:29:21'),
(27, 'ok', NULL, 'lol', 4, '2016-08-09 07:29:43'),
(28, 'ass', 4, 'adsa', 4, '2016-08-09 08:25:15'),
(29, 'asd', NULL, 'asd', 4, '2016-08-09 10:38:14'),
(30, '', NULL, '', 4, '2016-08-09 10:38:15'),
(31, '', NULL, '', 4, '2016-08-09 10:38:17'),
(32, '', NULL, '', 4, '2016-08-09 10:38:17'),
(33, '', NULL, '', 4, '2016-08-09 12:23:08'),
(34, '', NULL, '', 4, '2016-08-09 12:46:16'),
(35, 'A Long Post.', NULL, 'Naaaaaaaaa - Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na Na.', 4, '2016-08-09 14:09:04'),
(36, '', NULL, '', 4, '2016-08-10 02:53:50'),
(37, 'Lol.', NULL, 'No Classes.', 4, '2016-08-10 02:53:58'),
(38, 'Lol.', 5, 'No Classes 2.', 4, '2016-08-10 02:54:26'),
(39, 'A long title. A long title. A lo', 4, '', 4, '2016-08-10 02:59:20'),
(40, 'Roller Coaster Keith.', NULL, 'There was this one time, me and my buddy Keith were running up this roller coaster, and there were zombies. Oh wait, it was with you guys.', 10, '2016-08-10 03:06:55'),
(41, 'Burning rooftop.', 2, 'One time, me and mah buddy Keith were stranded on the rooftop of a burning building and we had to fight through like, 5 floors of zombies.\r\noh wait that was you guys.\r\nJUST WAIT UNTIL I TELL KEITH.', 11, '2016-08-10 03:13:55'),
(42, '', 5, '', 11, '2016-08-10 03:24:51'),
(43, 'Post', 3, 'Update dammit.', 3, '2016-08-10 05:01:27'),
(44, 'Update.', 3, 'Notify dammit.', 2, '2016-08-10 05:02:32'),
(45, 'Notifyyyyyyy!', 2, 'NAU.', 2, '2016-08-10 05:03:29'),
(46, 'Post1.', 4, 'First post.', 1, '2016-08-10 07:14:20'),
(47, 'Post2.', 2, 'Second Post.', 1, '2016-08-10 07:14:31'),
(48, '', 3, '', 4, '2016-08-10 17:05:04'),
(49, 'Hasdhjkhfkashd', 4, 'Potpstopopasdopasodpasd', 13, '2016-08-11 01:37:43'),
(50, 'huhh', 5, 'alskdlas', 13, '2016-08-11 01:39:15'),
(51, 'LOL', NULL, 'plsworksjdkasdhjkahsdjkahsjdhasjkd plsplspls', 6, '2016-08-11 01:44:43'),
(52, 'qweqweqwe', NULL, 'qweqweqwe', 4, '2016-08-11 01:45:17'),
(53, 'SER', 3, 'WHY', 4, '2016-08-11 01:50:28'),
(54, 'SER', NULL, 'WHY', 4, '2016-08-11 01:51:06'),
(55, 'SER', NULL, 'NO', 4, '2016-08-11 01:51:10'),
(56, 'SER', 3, 'PLS', 4, '2016-08-11 01:51:17'),
(57, 'LOLOL', 4, 'asdasdasdsd', 4, '2016-08-11 01:52:52'),
(58, 'qewqweqwevqwewqevqwe', NULL, 'dzffa', 4, '2016-08-11 01:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE IF NOT EXISTS `userdata` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` char(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `description` text,
  `profPic` varchar(2083) DEFAULT NULL,
  `averageStars` float NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`userId`, `username`, `password`, `email`, `birthday`, `firstName`, `lastName`, `description`, `profPic`, `averageStars`) VALUES
(1, 'testEntry', 'project1234', 'project@stellar.com', NULL, 'test', 'project', '', 'user-default.png', 0),
(2, 'nepunepu', 'pudding1234', 'pudding123@yahoo.com', NULL, 'Neptune', 'Purple', 'I <3 Pudding!', 'user-default.png', 0),
(3, 'tsundere', 'cosplay1234', 'noire@yahoo.com', NULL, 'Noire', 'Black', 'I only do everything.', 'user-default.png', 0),
(4, 'Defuse', 'asdf1234', 'default@user.com', NULL, 'Default', 'User', 'sad face', 'pic.jpg', 5),
(5, 'Newuser', 'asdf1234', 'new_user@gmail.com', NULL, 'New', 'User', '', 'user-default.png', 0),
(6, 'Candy', 'asdf1234', 'candy_espulgar@dlsu.edu.ph', NULL, 'Candy', 'Espulgar', 'Pon Pon Pon.', 'user-default.png', 0),
(7, 'Kiersten', 'asdf1234', 'kiersten_ramos@dlsu.edu.ph', NULL, 'Kiersten', 'Ramos', 'Oh baby baby, baby.', 'user-default.png', 0),
(8, 'Jarl', 'asdf1234', 'jarl_obedoza@dlsu.edu.ph', NULL, 'Jarl', 'Obedoza', 'ZA WARUDO.', 'user-default.png', 0),
(9, 'Pseudo Pumpkin', 'pseudo1234', 'pseudo.pumpkin@gmail.com', NULL, 'Pseudo', 'Pumpkin', 'Pumpkins R Us.', 'user-default.png', 0),
(10, 'Skellington', 'asdf1234', 'pumpkin.king@halloweentown.com', NULL, 'Jack', 'Skellington', 'The Nightmare before Christmas.', 'user-default.png', 0),
(11, 'ThatGuyEllis', 'asdf1234', 'ellis@l4d.com', NULL, 'Ellis', 'L4D', 'Sharing stories about my friend Keith.', 'user-default.png', 0),
(12, 'What', 'asdf1234', 'yeah@wut.com', NULL, 'What', 'Oh', '', 'user-default.png', 0),
(13, 'yessir', 'asdf1234', 'lol@yeah.com', NULL, 'MyName', 'Yeah', 'Hi. lolyeah', 'user-default.png', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
