-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Домаћин: localhost
-- Време креирања: 14. May 2015. у 03:02
-- Верзија сервера: 5.5.43
-- верзија PHP-a: 5.4.39-0+deb7u2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База података: `c12w64smdb`
--

-- --------------------------------------------------------

--
-- Структура табеле `BansLogs`
--

CREATE TABLE IF NOT EXISTS `BansLogs` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(25) DEFAULT '0',
  `IP` varchar(16) DEFAULT '0',
  `Admin` varchar(25) DEFAULT '0',
  `Reason` varchar(65) DEFAULT '0',
  `Type` varchar(25) DEFAULT '0',
  `Date` timestamp NULL DEFAULT NULL,
  `Time` int(25) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban Logovi' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура табеле `EnterExit`
--

CREATE TABLE IF NOT EXISTS `EnterExit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterX` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `EnterY` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `EnterZ` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `ExitX` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `ExitY` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `ExitZ` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `Inter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Приказ података табеле `EnterExit`
--

INSERT INTO `EnterExit` (`ID`, `EnterX`, `EnterY`, `EnterZ`, `ExitX`, `ExitY`, `ExitZ`, `Inter`) VALUES
(1, 1540.27002, -1675.56006, 15.39590, 1571.54004, -1652.30005, 1091.68005, 0),
(5, 1512.79000, -1678.90900, 14.04700, 10.00000, 10.00000, 10.00000, 0);

-- --------------------------------------------------------

--
-- Структура табеле `Houses`
--

CREATE TABLE IF NOT EXISTS `Houses` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Owner` varchar(25) NOT NULL DEFAULT '0',
  `Price` int(15) NOT NULL DEFAULT '0',
  `ExteriorX` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `ExteriorY` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `ExteriorZ` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `InteriorX` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `InteriorY` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `InteriorZ` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `InteriorInt` int(5) NOT NULL DEFAULT '0',
  `Locked` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Приказ података табеле `Houses`
--

INSERT INTO `Houses` (`ID`, `Owner`, `Price`, `ExteriorX`, `ExteriorY`, `ExteriorZ`, `InteriorX`, `InteriorY`, `InteriorZ`, `InteriorInt`, `Locked`) VALUES
(1, '', 300, 317.88101, -120.16400, 2.36600, 0.00000, 0.00000, 0.00000, 0, 1),
(2, '', 400, 324.79099, -88.54100, 1.57800, 0.00000, 0.00000, 0.00000, 0, 1),
(3, '', 700, 340.78601, -88.10900, 1.44800, 0.00000, 0.00000, 0.00000, 0, 1);

-- --------------------------------------------------------

--
-- Структура табеле `KicksLogs`
--

CREATE TABLE IF NOT EXISTS `KicksLogs` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(25) DEFAULT '0',
  `IP` varchar(16) DEFAULT '0',
  `Admin` varchar(25) DEFAULT '0',
  `Reason` varchar(65) DEFAULT '0',
  `Date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Kick Logovi' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура табеле `ObjectMaterials`
--

CREATE TABLE IF NOT EXISTS `ObjectMaterials` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ObjectID` int(10) NOT NULL DEFAULT '0',
  `MaterialIndex` int(3) NOT NULL DEFAULT '0',
  `ModelID` int(10) NOT NULL DEFAULT '0',
  `TXDName` varchar(50) NOT NULL DEFAULT '0',
  `TextureName` varchar(50) NOT NULL DEFAULT '0',
  `MaterialColor` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Структура табеле `Objects`
--

CREATE TABLE IF NOT EXISTS `Objects` (
  `ID` int(7) NOT NULL AUTO_INCREMENT,
  `ModelID` int(10) NOT NULL DEFAULT '0',
  `CordX` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `CordY` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `CordZ` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `RotationX` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `RotationY` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `RotationZ` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `WorldID` int(6) NOT NULL DEFAULT '0',
  `InteriorID` int(6) NOT NULL DEFAULT '0',
  `Stream` int(6) NOT NULL DEFAULT '200',
  `Draw` int(6) NOT NULL DEFAULT '0',
  `Map` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура табеле `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Level` int(11) NOT NULL DEFAULT '1',
  `AdminLevel` int(11) NOT NULL DEFAULT '0',
  `HelperLevel` int(11) NOT NULL DEFAULT '0',
  `Cash` int(24) NOT NULL DEFAULT '0',
  `Account` int(24) NOT NULL DEFAULT '0',
  `Registred` int(11) DEFAULT '0',
  `Tutorial` int(11) NOT NULL DEFAULT '0',
  `Sex` varchar(10) NOT NULL DEFAULT '0',
  `SpawnLoc` int(11) NOT NULL DEFAULT '1',
  `Age` int(24) NOT NULL DEFAULT '0',
  `PhoneNumber` int(24) NOT NULL DEFAULT '0',
  `PremiumAccount` int(11) NOT NULL DEFAULT '0',
  `Banned` int(11) NOT NULL,
  `Warns` int(11) NOT NULL,
  `Leader` int(11) NOT NULL DEFAULT '0',
  `Member` int(11) NOT NULL DEFAULT '0',
  `Rank` int(11) NOT NULL DEFAULT '0',
  `Skin` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(46) DEFAULT NULL,
  `LastLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pRPname` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  FULLTEXT KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Приказ података табеле `players`
--

INSERT INTO `players` (`ID`, `username`, `password`, `Email`, `Level`, `AdminLevel`, `HelperLevel`, `Cash`, `Account`, `Registred`, `Tutorial`, `Sex`, `SpawnLoc`, `Age`, `PhoneNumber`, `PremiumAccount`, `Banned`, `Warns`, `Leader`, `Member`, `Rank`, `Skin`, `IP`, `LastLogin`, `pRPname`) VALUES
(1, 'Moki_Ding', 'c732ddea73964a95475df190c1c1c872', 'moki.forum@gmail.com', 1, 7, 0, 150, 500, 1, 1, '1', 1, 19, 2328839, 0, 0, 0, 6, 6, 0, 265, '127.0.0.1', '2015-05-14 00:44:20', 0),
(19, 'Brko', '3d0c7c34d77c6826e4ad0a6a12649825', 'mica@hotmail.com', 1, 7, 0, 150, 500, 1, 1, '1', 1, 23, 10043643, 0, 0, 0, 0, 0, 0, 0, '31.223.140.208', '2015-05-08 12:53:19', 0),
(23, 'Brko_Ding', '3d0c7c34d77c6826e4ad0a6a12649825', 'mica@hotmail.com', 1, 7, 0, 150, 500, 1, 1, '1', 1, 23, 8114679, 0, 0, 0, 0, 0, 0, 0, '31.223.140.132', '2015-05-12 14:24:16', 0);

-- --------------------------------------------------------

--
-- Структура табеле `RemoveBuilding`
--

CREATE TABLE IF NOT EXISTS `RemoveBuilding` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ModelID` int(10) DEFAULT '0',
  `CordX` decimal(20,5) DEFAULT '0.00000',
  `CordY` decimal(20,5) DEFAULT '0.00000',
  `CordZ` decimal(20,5) DEFAULT '0.00000',
  `Radius` decimal(20,5) DEFAULT '0.00000',
  `Map` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='RemoveBuildingForPlayer' AUTO_INCREMENT=34 ;

--
-- Приказ података табеле `RemoveBuilding`
--

INSERT INTO `RemoveBuilding` (`ID`, `ModelID`, `CordX`, `CordY`, `CordZ`, `Radius`, `Map`) VALUES
(1, 4580, 1671.50700, -1343.33500, 87.53900, 0.25000, 'AutoSalon'),
(2, 4615, 1660.04600, -1340.72600, 15.63200, 0.25000, 'AutoSalon'),
(3, 729, 1631.76500, -1345.75000, 16.18700, 0.25000, 'AutoSalon'),
(4, 4747, 1671.50700, -1343.33500, 87.53900, 0.25000, 'AutoSalon'),
(5, 620, 1633.00000, -1358.45300, 15.79600, 0.25000, 'AutoSalon'),
(6, 1215, 1625.43700, -1330.12500, 16.97600, 0.25000, 'AutoSalon'),
(7, 620, 1633.29600, -1334.50700, 15.50700, 0.25000, 'AutoSalon'),
(8, 1215, 1653.00000, -1362.99200, 16.97600, 0.25000, 'AutoSalon'),
(9, 1215, 1639.75700, -1361.91400, 16.97600, 0.25000, 'AutoSalon'),
(10, 1215, 1651.95300, -1361.71800, 16.97600, 0.25000, 'AutoSalon'),
(11, 1215, 1639.73400, -1349.70300, 16.97600, 0.25000, 'AutoSalon'),
(12, 1215, 1639.73400, -1354.88200, 16.97600, 0.25000, 'AutoSalon'),
(13, 1215, 1651.95300, -1350.98400, 16.97600, 0.25000, 'AutoSalon'),
(14, 1215, 1639.73400, -1337.39800, 16.97600, 0.25000, 'AutoSalon'),
(15, 1215, 1639.73400, -1342.34300, 16.97600, 0.25000, 'AutoSalon'),
(16, 1215, 1639.76500, -1330.28100, 16.97600, 0.25000, 'AutoSalon'),
(17, 1215, 1651.95300, -1335.50700, 16.97600, 0.25000, 'AutoSalon'),
(18, 1215, 1653.09300, -1323.74200, 16.97600, 0.25000, 'AutoSalon'),
(19, 1215, 1651.95300, -1324.99200, 16.97600, 0.25000, 'AutoSalon'),
(20, 1215, 1689.93700, -1362.99200, 16.97600, 0.25000, 'AutoSalon'),
(21, 1215, 1679.21800, -1362.99200, 16.97600, 0.25000, 'AutoSalon'),
(22, 1215, 1663.71000, -1362.99200, 16.97600, 0.25000, 'AutoSalon'),
(23, 1215, 1691.09300, -1361.89000, 16.97600, 0.25000, 'AutoSalon'),
(24, 620, 1698.96800, -1360.45300, 15.50700, 0.25000, 'AutoSalon'),
(25, 4602, 1671.50700, -1343.33500, 87.53900, 0.25000, 'AutoSalon'),
(26, 1215, 1691.15600, -1351.10100, 16.97600, 0.25000, 'AutoSalon'),
(27, 4556, 1660.04600, -1340.72600, 15.63200, 0.25000, 'AutoSalon'),
(28, 1215, 1663.65600, -1323.71000, 16.97600, 0.25000, 'AutoSalon'),
(29, 1215, 1679.17100, -1323.76500, 16.97600, 0.25000, 'AutoSalon'),
(30, 1215, 1691.12500, -1335.73400, 16.97600, 0.25000, 'AutoSalon'),
(31, 620, 1698.96800, -1326.66400, 15.50700, 0.25000, 'AutoSalon'),
(32, 1215, 1691.14800, -1324.89000, 16.97600, 0.25000, 'AutoSalon'),
(33, 1215, 1689.93700, -1323.76500, 16.97600, 0.25000, 'AutoSalon');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
