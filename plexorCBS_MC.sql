/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.6.18-MariaDB-0ubuntu0.22.04.1 : Database - plexorCBS_MC
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`plexorCBS_MC` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `plexorCBS_MC`;

/*Table structure for table `plexAccountMapping` */

DROP TABLE IF EXISTS `plexAccountMapping`;

CREATE TABLE `plexAccountMapping` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `mapper_name` varchar(30) DEFAULT NULL,
  `account` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexAccountMapping` */

/*Table structure for table `plexAddress` */

DROP TABLE IF EXISTS `plexAddress`;

CREATE TABLE `plexAddress` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `short_name` varchar(140) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `address_line_1` varchar(100) DEFAULT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `address_line_3` varchar(100) DEFAULT NULL,
  `town_village` varchar(100) DEFAULT NULL,
  `county_district` varchar(100) DEFAULT NULL,
  `country` varchar(140) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `geolocation` longtext DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexAddressusers` (`modified_by`),
  KEY `plexAddressusers2` (`owner`),
  CONSTRAINT `plexAddressusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexAddressusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexAddress` */

/*Table structure for table `plexBranch` */

DROP TABLE IF EXISTS `plexBranch`;

CREATE TABLE `plexBranch` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `external_id` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 200,
  `fullname` varchar(160) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_address` varchar(150) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `address` varchar(140) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `branch_address` (`address`),
  KEY `plexBranchusers` (`modified_by`),
  KEY `plexBranchusers2` (`owner`),
  CONSTRAINT `branch_address` FOREIGN KEY (`address`) REFERENCES `plexAddress` (`name`),
  CONSTRAINT `plexBranchusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexBranchusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexBranch` */

/*Table structure for table `plexPostingRules` */

DROP TABLE IF EXISTS `plexPostingRules`;

CREATE TABLE `plexPostingRules` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexPostingRulesusers` (`modified_by`),
  KEY `plexPostingRulesusers2` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRules` */

insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('awawawaw','2024-07-31 02:39:41.616082','2024-07-31 02:39:41.616082','Administrator','Administrator',0,0,'awawawaw','wwww','d1ac4e6b5ae01a6c60c9e7e51bb7861ec9cf0b9ed5089ae81acfa1db796942bb',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('bbbbbbb','2024-07-31 02:12:20.367995','2024-07-31 02:12:20.367995','Administrator','Administrator',0,0,'bbbbbbb','dddd','d1072a126ec94157150ef0b3db5b981ec0ec0b9a12d217c9c8073dde9d0fc7ac',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('jjkjjj','2024-07-31 12:06:57.781075','2024-07-31 12:06:57.781075','Administrator','Administrator',0,0,'jjkjjj','jjjjjj','d57f115f238861ca96aec1c379619b596decf048eb1829420f1c95faae6c6c13',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('ooooo','2024-07-31 12:13:51.492430','2024-07-31 12:13:51.492430','Administrator','Administrator',0,0,'ooooo','pppppp','65c2d0d4d826a342bdaace315c2b8a89cabfdae6a9c1adebffb322257e3aa2b1',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('rrrrrrr','2024-07-31 12:16:45.274052','2024-07-31 12:16:45.274052','Administrator','Administrator',0,0,'rrrrrrr','eeeeee','9199db52dd4a10690ddc2cb0507545af7b1028d5ebc8ae452c12fc5a2a89cd33',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('rrrrrrrr','2024-07-31 12:08:12.409041','2024-07-31 12:08:12.409041','Administrator','Administrator',0,0,'rrrrrrrr','tttttttttttt','cef58400be45463100f0f71f86cbc2fb8cbe421fa8247c1450ab4f4ab607a790',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('rwer','2024-07-31 03:27:49.880663','2024-07-31 03:27:49.880663','Administrator','Administrator',0,0,'rwer','erwer','e7e2b55562805ce341d2db51376970aba985123db1d139fd5710a3d2f516007a',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Test1','2024-07-30 14:07:21.068880','2024-07-30 14:07:21.068880','Administrator','Administrator',0,0,'Test1','Test2','9ee82963f0458887e9bcca5a500c9604ca30ffb8ca77261c4cb5fb0302612698',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('tytytyty','2024-07-31 12:15:24.334100','2024-07-31 12:15:24.334100','Administrator','Administrator',0,0,'tytytyty','tytytytyt','fab514bebcd3ef716295e63abba2d533a1eae17e4ae10598c0ae038c7dc2777d',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('wwwwwwww','2024-07-31 12:10:55.119735','2024-07-31 12:10:55.119735','Administrator','Administrator',0,0,'wwwwwwww','wwwwwwwwww','9b05911ec383fee035c7243cf107ac3f0f70748880b2466bce7995be5d517339',0);

/*Table structure for table `plexPostingRulesAccounts` */

DROP TABLE IF EXISTS `plexPostingRulesAccounts`;

CREATE TABLE `plexPostingRulesAccounts` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `postingRule` varchar(140) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `account` varchar(140) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `postingRules` (`postingRule`),
  KEY `postingRulesAcc` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRulesAccounts` */

insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values ('awawawaw_Credit_MemberPayments',NULL,NULL,NULL,NULL,0,0,'awawawaw','Credit','Member Payments',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values ('awawawaw_Debit_CashierDeposits',NULL,NULL,NULL,NULL,0,0,'awawawaw','Debit','Cashier Deposits',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values ('awawawaw_Debit_MemberPayments',NULL,NULL,NULL,NULL,0,0,'awawawaw','Debit','Member Payments',NULL,0);

/*Table structure for table `plexUser` */

DROP TABLE IF EXISTS `plexUser`;

CREATE TABLE `plexUser` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) NOT NULL,
  `status` int(11) DEFAULT 0,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  UNIQUE KEY `user` (`user`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexUser` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
