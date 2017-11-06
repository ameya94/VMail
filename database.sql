/*
SQLyog Community Edition- MySQL GUI v7.01 
MySQL - 5.0.27-community-nt : Database - voiceemail
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`voiceemail` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `voiceemail`;

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `Id` int(5) NOT NULL auto_increment,
  `FromEmail` varchar(255) default NULL,
  `ToEmail` varchar(255) default NULL,
  `subject` varchar(255) default NULL,
  `content` text,
  `DateTime` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `drafts` varchar(255) default NULL,
  `Trash` varchar(255) default NULL,
  `activity` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email` */

/*Table structure for table `usertable` */

DROP TABLE IF EXISTS `usertable`;

CREATE TABLE `usertable` (
  `fullname` varchar(500) default NULL,
  `address` varchar(500) default NULL,
  `email` varchar(500) default NULL,
  `password` varchar(500) default NULL,
  `gender` varchar(500) default NULL,
  `mobile` varchar(500) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usertable` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
