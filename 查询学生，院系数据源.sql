-- phpMyAdmin SQL Dump
-- version 4.1.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-10-31 13:29:55
-- 服务器版本： 5.5.24
-- PHP Version: 5.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `php32`
--

-- --------------------------------------------------------

--
-- 表的结构 `学生表`
--

CREATE TABLE IF NOT EXISTS `学生表` (
  `学生ID` int(11) NOT NULL AUTO_INCREMENT,
  `学生` varchar(10) DEFAULT NULL,
  `性别` enum('男','女') DEFAULT NULL,
  `籍贯` varchar(10) DEFAULT NULL,
  `院系ID` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`学生ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `学生表`
--

INSERT INTO `学生表` (`学生ID`, `学生`, `性别`, `籍贯`, `院系ID`) VALUES
(1, '罗弟华', '男', '江西', 1),
(2, '韩顺平', '男', '四川', 2),
(3, '吴英雷', '男', '黑龙江', 1),
(4, '王玉虹', '女', '河北', 3),
(5, '赵玉川', '男', '河北', 3),
(6, '刘招英', '女', '江西', 1);

-- --------------------------------------------------------

--
-- 表的结构 `院系`
--

CREATE TABLE IF NOT EXISTS `院系` (
  `院系ID` int(11) NOT NULL AUTO_INCREMENT,
  `院系名称` varchar(10) DEFAULT NULL,
  `系办地址` varchar(20) DEFAULT NULL,
  `系办电话` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`院系ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `院系`
--

INSERT INTO `院系` (`院系ID`, `院系名称`, `系办地址`, `系办电话`) VALUES
(1, '计算机系', '行政楼302', '010-66886688'),
(2, '数学系', '科研楼108', '010-80808800'),
(3, '物理系', '行政楼305', '010-68688787');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
