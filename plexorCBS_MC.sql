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

insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Deductions','2024-08-05 13:41:25.629716','2024-08-05 13:41:25.629716','Administrator','Administrator',0,0,'Deductions','Exchange Gain/Loss - BSLD','Deductions','a4a8080cf64df409cc7a54921bb87577c0b8c49e2905875af24f95fffb8840ad',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Penalties','2024-08-05 09:14:48.367352','2024-08-05 09:14:48.367352','Administrator','Administrator',0,0,'Penalties','Freight and Forwarding Charges - BSL','Penalties','3f3ef4d2346fc56fd4f11156ad3937e1ca2a0301596e71936954f9cd91210f7e',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Refunds','2024-08-05 14:39:48.603220','2024-08-05 14:39:48.603220','Administrator','Administrator',0,0,'Refunds','Creditors - BSL','Refund','ec1e0b972a5eac40425cd650b6902beaeba7b62a649c1b4eff8a9bda3a3907db',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Rewards','2024-08-05 13:34:53.357109','2024-08-05 13:34:53.357109','Administrator','Administrator',0,0,'Rewards','Bank Accounts - BSL','Rewards','de9406cd9a7efa765ab4596325c3f7d1e49aa09c3cf3bbac8750daa3244e4783',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Salary Processing Charges','2024-08-02 01:19:42.230572','2024-08-03 00:48:54.620980','Administrator','Administrator',0,0,'Salary Processing Charges','Loans and Advances (Assets) - BSL','Salary Processing Charges and all','d9b7569c8b68ed15ef6605aab42da7daced6a24e4861338b3f08f3955edb8c3f',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Saving Account','2024-08-02 01:11:43.089421','2024-08-02 01:11:43.089421','Administrator','Administrator',0,0,'Saving Account','Current Assets - BSL','Saving Account','00afe18f1f2374b0b48a35844f4e6a2935ac2df27b1f518a55a1154e85a0b359',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('WriteOffs','2024-08-05 13:47:53.359775','2024-08-05 13:47:53.359775','Administrator','Administrator',0,0,'WriteOffs','Write Off - BSL','WriteOffs','880360f3edf468bc1b121ccaa6cb03f4e1f68d7696407ade8d0ae27beb7eeab8',0);

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

insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Fromadmin2','2024-08-16 13:42:19.445507','2024-08-16 13:42:19.445507','admin@plexor.com','admin@plexor.com',0,0,'Fromadmin2','Fromadmin2','56f38050095ba794fa744300483b450a1b17bc85d1aa8b6bfd04e917142b6e92',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('newPosst','2024-08-16 12:10:44.884885','2024-08-16 12:10:44.884885','Administrator','Administrator',0,0,'newPosst','newPosst','26e5b214b4bc83f404396797b7735e3580d34d34fe9de664167086e4f19328d5',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Test 2','2024-08-15 16:29:26.237541','2024-08-15 16:29:26.237541','admin@plexor.com','admin@plexor.com',0,0,'Test 2','test 2','b0c19a85e02e8936f88d09f46c4edc8a582b53c828a9da4f6cecbea12aa66dc1',0);

/*Table structure for table `plexPostingRulesAccounts` */

DROP TABLE IF EXISTS `plexPostingRulesAccounts`;

CREATE TABLE `plexPostingRulesAccounts` (
  `name` int(140) NOT NULL AUTO_INCREMENT,
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
  KEY `postingRulesAcc` (`account`),
  KEY `postingRules` (`postingRule`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRulesAccounts` */

insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (39,NULL,NULL,NULL,NULL,0,0,'Test 2','Debit','Cashier Deposits',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (40,NULL,NULL,NULL,NULL,0,0,'Test 2','Debit','Loan Charges',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (41,NULL,NULL,NULL,NULL,0,0,'newPosst','Debit','Cashier Deposits',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (42,NULL,NULL,NULL,NULL,0,0,'newPosst','Debit','Loan Charges',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (43,NULL,NULL,NULL,NULL,0,0,'newPosst','Credit','Loan Penalty',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (44,NULL,NULL,NULL,NULL,0,0,'newPosst','Credit','Member Payments',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (45,NULL,NULL,NULL,NULL,0,0,'Fromadmin2','Debit','Cashier Deposits',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (46,NULL,NULL,NULL,NULL,0,0,'Fromadmin2','Debit','Loan Charges',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (47,NULL,NULL,NULL,NULL,0,0,'Fromadmin2','Credit','Loan Penalty',NULL,0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (48,NULL,NULL,NULL,NULL,0,0,'Fromadmin2','Credit','Member Payments',NULL,0);

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
