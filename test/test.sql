-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-16 04:08:34
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 NOT NULL,
  `did` varchar(20) CHARACTER SET utf8 NOT NULL,
  `sid` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `classes`
--

INSERT INTO `classes` (`cid`, `cname`, `did`, `sid`) VALUES
(1, 'WUIF1707-1', '前端', 'vue.js'),
(2, 'WUIF1707-2', '前端', 'Jquery'),
(3, 'WUIF1707-3', '前端', 'JS'),
(4, 'WUIF1707-4', '全栈', 'PHP'),
(5, 'WUIF1707-5', '全栈', 'JS'),
(6, 'WUIF1707-6', '全栈', 'swiper'),
(7, 'WUIF1706-1', 'UI设计', 'PS'),
(8, 'WUIF1706-2', 'UI设计', 'AI'),
(9, 'WUIF1705-1', '后端', 'PHP');

-- --------------------------------------------------------

--
-- 表的结构 `direction`
--

CREATE TABLE IF NOT EXISTS `direction` (
  `did` int(10) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `direction`
--

INSERT INTO `direction` (`did`, `dname`) VALUES
(1, 'UI设计'),
(2, '前端'),
(3, '后端'),
(4, '全栈');

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(10) NOT NULL,
  `upass` varchar(255) NOT NULL,
  `usex` varchar(10) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`uid`, `uname`, `upass`, `usex`) VALUES
(2, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', '');

-- --------------------------------------------------------

--
-- 表的结构 `managestudent`
--

CREATE TABLE IF NOT EXISTS `managestudent` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(10) NOT NULL,
  `upass` varchar(255) NOT NULL,
  `msex` varchar(10) NOT NULL,
  `mnum` varchar(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `did` varchar(20) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `managestudent`
--

INSERT INTO `managestudent` (`mid`, `uname`, `upass`, `msex`, `mnum`, `cid`, `sid`, `did`) VALUES
(1, '王鹏', '827ccb0eea8a706c4c34a16891f84e7b', '男', '20130710105', 'WUIF1707-1', 'vue.js', '前端'),
(2, '李欣琪', '827ccb0eea8a706c4c34a16891f84e7b', '女', '20130710106', 'WUIF1707-1', 'vue.js', '全栈'),
(3, '白鹏', '827ccb0eea8a706c4c34a16891f84e7b', '男', '20130710107', 'WUIF1707-1', 'vue.js', '前端'),
(4, '吴瑞霞', '827ccb0eea8a706c4c34a16891f84e7b', '男', '20130710115', 'WUIF1707-1', 'vue.js', '前端');

-- --------------------------------------------------------

--
-- 表的结构 `manageteacher`
--

CREATE TABLE IF NOT EXISTS `manageteacher` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(10) NOT NULL,
  `upass` varchar(255) NOT NULL,
  `tsex` varchar(10) NOT NULL,
  `tnum` varchar(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `did` varchar(20) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `manageteacher`
--

INSERT INTO `manageteacher` (`tid`, `uname`, `upass`, `tsex`, `tnum`, `cid`, `sid`, `did`) VALUES
(1, '李星', '827ccb0eea8a706c4c34a16891f84e7b', '男', '001', 'WUIF1707-1', 'vue.js', '全栈'),
(2, '岳飞飞', '827ccb0eea8a706c4c34a16891f84e7b', '女', '002', 'WUIF1707-3', 'PS', 'UI设计'),
(3, '岳英俊', '827ccb0eea8a706c4c34a16891f84e7b', '男', '003', 'WUIF1707-6', 'Jquery', '全栈'),
(4, '石晓蕾', '827ccb0eea8a706c4c34a16891f84e7b', '男', '004', 'WUIF1706-1', 'HTML', '前端');

-- --------------------------------------------------------

--
-- 表的结构 `paper`
--

CREATE TABLE IF NOT EXISTS `paper` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) NOT NULL,
  `cname` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `paper`
--

INSERT INTO `paper` (`pid`, `pname`, `cname`, `uname`) VALUES
(2, '测试1', 'WUIF1707-1', '李星'),
(6, '测试2', 'WUIF1707-1', '李星'),
(7, '测试3', 'WUIF1707-1', '李星'),
(8, '测试4', 'WUIF1707-1', '李星'),
(9, '测试5', 'WUIF1707-1', '李星'),
(10, '测试6', 'WUIF1707-1', '李星');

-- --------------------------------------------------------

--
-- 表的结构 `paperextra`
--

CREATE TABLE IF NOT EXISTS `paperextra` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `paperextra`
--

INSERT INTO `paperextra` (`aid`, `tid`, `pid`) VALUES
(3, 10, 2),
(4, 11, 2),
(5, 12, 2),
(6, 10, 6),
(7, 11, 6),
(8, 12, 6),
(9, 12, 7),
(10, 11, 7),
(11, 10, 7),
(12, 10, 8),
(13, 11, 8),
(14, 12, 8),
(15, 12, 9),
(16, 11, 9),
(17, 10, 9),
(18, 10, 10),
(19, 11, 10),
(20, 12, 10);

-- --------------------------------------------------------

--
-- 表的结构 `record`
--

CREATE TABLE IF NOT EXISTS `record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `tid` int(10) NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `record`
--

INSERT INTO `record` (`id`, `user`, `pid`, `tid`, `answer`) VALUES
(1, 1, 2, 10, 'B'),
(2, 1, 2, 11, 'A,B'),
(3, 1, 2, 12, '王鹏'),
(4, 1, 6, 10, 'C'),
(5, 1, 6, 11, 'A,B'),
(6, 1, 6, 12, '王鹏');

-- --------------------------------------------------------

--
-- 表的结构 `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `did` varchar(30) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `stage`
--

INSERT INTO `stage` (`sid`, `sname`, `did`) VALUES
(1, 'PS', 'UI设计'),
(2, 'AI', 'UI设计'),
(3, 'HTML', '前端'),
(4, 'CSS', '前端'),
(5, 'JS', '前端'),
(6, 'SASS', '前端'),
(7, 'Jquery', '前端'),
(8, 'node.js', '前端'),
(9, 'vue.js', '前端'),
(10, 'PHP', '后端'),
(11, 'swiper', '全栈'),
(12, 'Element', '全栈'),
(13, 'Iscroll', '全栈'),
(14, 'Bootstrap', '全栈');

-- --------------------------------------------------------

--
-- 表的结构 `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `stitle` varchar(255) NOT NULL,
  `sanswer` varchar(255) NOT NULL,
  `sexp` varchar(255) NOT NULL,
  `stype` varchar(255) NOT NULL,
  `sauthor` varchar(255) NOT NULL,
  `score` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `tests`
--

INSERT INTO `tests` (`sid`, `stitle`, `sanswer`, `sexp`, `stype`, `sauthor`, `score`, `sname`) VALUES
(10, '1-1=？_A:1|B:2|C:0|D:5', 'C', '略', '单选', '李星', '2', 'Jquery'),
(11, '下面哪些是字符串？_A:a|B:b|C:0|D:5', 'A,B', '略', '多选', '李星', '3', 'PS'),
(12, '我是谁', '王鹏', '略', '简答', '李星', '3', 'PS');

-- --------------------------------------------------------

--
-- 表的结构 `testtype`
--

CREATE TABLE IF NOT EXISTS `testtype` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `testtype`
--

INSERT INTO `testtype` (`tid`, `tname`) VALUES
(3, '单选'),
(4, '多选'),
(5, '判断'),
(6, '简答'),
(7, '萨达');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
