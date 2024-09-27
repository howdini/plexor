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
  `creation` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modified_by` varchar(140) NOT NULL,
  `owner` varchar(140) NOT NULL,
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

insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('ddas','2024-09-24 14:37:10.505099','2024-09-24 14:37:10.505099','Administrator','Administrator',0,0,'ddas','asdasdasd','e43596d6aa51918a74c7fb6c7b6c41dd4e20dc4620a0fb691e519cf6be73ca29',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('dsfad','2024-09-24 14:10:49.832520','2024-09-24 14:10:49.832520','Administrator','Administrator',0,0,'dsfad','sdfsdf','92f77f3c1ce544a6204dc8dc3c2648871283c4ce9baf1ff1acebfef7d92df58e',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Fianley','2024-09-24 14:27:33.604215','2024-09-24 14:27:33.604215','Administrator','Administrator',0,0,'Fianley','Fianley','e8a90c5f7e2289f57cffe71abd514866631cea28459584c89fbb2384b89754a5',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('HeAnother','2024-09-18 12:52:58.743914','2024-09-18 12:52:58.743914','Administrator','Administrator',0,0,'HeAnother','Another one','bc8f589c2ffababf7e156bea4ec3f563a5d7e332931b6a6bec1f8d975b83c5c8',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Posting One','2024-09-17 11:06:28.177990','2024-09-17 11:06:28.177990','Administrator','Administrator',0,0,'Posting One','Test post','e8a537d5b352294be2b06de416c9eb76424cccc76491e881e9d0a2663b6b1d3d',0);
insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Reeeeeev','2024-09-24 14:42:12.082020','2024-09-24 14:42:12.082020','Administrator','Administrator',0,0,'Reeeeeev','EEEEEEEEE','c77c6929a7a662a5229057395f30171f51a470c5fe2314e4017d004a3b5e60b4',0);

/*Table structure for table `plexPostingRulesAccounts` */

DROP TABLE IF EXISTS `plexPostingRulesAccounts`;

CREATE TABLE `plexPostingRulesAccounts` (
  `name` int(140) NOT NULL AUTO_INCREMENT,
  `creation` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modified_by` varchar(140) NOT NULL,
  `owner` varchar(140) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRulesAccounts` */

insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (126,'2024-09-18 14:54:50.000000','2024-09-18 14:54:50.000000','Administrator','Administrator',0,1,'HeAnother','Credit','Member Payments','026f5cbefb87695c706341130eb33487e581a8545aff1fd021ef73d737b0c200',0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (127,'2024-09-18 15:03:25.000000','2024-09-18 15:03:25.000000','Administrator','Administrator',0,1,'HeAnother','Debit','Loan Penalty','03731b2eb470e9275919cd9be27e9273d87655f08ac299c5943f3de6f4c27294',0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (128,'2024-09-24 14:42:18.000000','2024-09-24 14:42:18.000000','Administrator','Administrator',0,1,'Reeeeeev','Debit','Cashier Deposits','da7572f4763e3f393e5625467842829ca7aec37b8463504f5a4a581c13fe7862',0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (129,'2024-09-24 14:49:35.000000','2024-09-24 14:49:35.000000','Administrator','Administrator',0,1,'Reeeeeev','Credit','Loan Charges','b3e45d5a32e365b9769d3876586862000a78846928e0400a2f18cc49998417c1',0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (130,'2024-09-24 14:52:20.000000','2024-09-24 14:52:20.000000','Administrator','Administrator',0,1,'Reeeeeev','Debit','Loan Charges','224cc59f26f92cf9e84a87807b2bf5069b06e23f2212784141a444a6d7fe66f7',0);

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

/* Trigger structure for table `plexPostingRules` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `plexPostingRules_insert_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `plexPostingRules_insert_trigger` BEFORE INSERT ON `plexPostingRules` FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), NEW.modified_by, NEW.owner, 0, 0, "plexPostingRules", 0,NEW.name,
            "",
            CONCAT(NEW.title,NEW.description,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
             SHA2(CONVERT(CONCAT(
                "",
                CONCAT(NEW.title,NEW.description,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
                NEW.creation,NEW.modified,NEW.modified_by,NEW.owner)USING utf8), 256), 0 );
        END */$$


DELIMITER ;

/* Trigger structure for table `plexPostingRules` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `plexPostingRules_update_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `plexPostingRules_update_trigger` BEFORE UPDATE ON `plexPostingRules` FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), old.modified_by, old.owner, 0, 0, "plexPostingRules", 1,OLD.name,
            CONCAT(OLD.title,OLD.description,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
            CONCAT(NEW.title,NEW.description,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
             SHA2(CONVERT(CONCAT(
                CONCAT(OLD.title,OLD.description,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
                CONCAT(NEW.title,NEW.description,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
                creation,modified,modified_by,owner)USING utf8), 256), 0 );
          IF (NEW.sig != SHA2(CONVERT(CONCAT(NEW.title,NEW.description,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner)USING utf8), 256)) 
          THEN
                INSERT INTO sig_failures VALUES(NULL, NOW(), "plexPostingRules",  old.name,
                                            CONCAT(OLD.title,OLD.description,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
                                            CONCAT(NEW.title,NEW.description,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner) );
                                            SET NEW.sig_status=1;
          END IF;
        END */$$


DELIMITER ;

/* Trigger structure for table `plexPostingRules` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `plexPostingRules_delete_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `plexPostingRules_delete_trigger` BEFORE DELETE ON `plexPostingRules` FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), OLD.modified_by, OLD.owner, 0, 0, "plexPostingRules", 2,OLD.name,
            CONCAT(OLD.title,OLD.description,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
            "",
             SHA2(CONVERT(CONCAT(
                CONCAT(OLD.title,OLD.description,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
                "",
                OLD.creation,OLD.modified,OLD.modified_by,OLD.`owner`)USING utf8), 256), 0 );
        END */$$


DELIMITER ;

/* Trigger structure for table `plexPostingRulesAccounts` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `plexPostingRulesAccounts_insert_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `plexPostingRulesAccounts_insert_trigger` BEFORE INSERT ON `plexPostingRulesAccounts` FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), NEW.modified_by, NEW.owner, 0, 0, "plexPostingRulesAccounts", 0,NEW.name,
            "",
            CONCAT(NEW.postingRule,NEW.type,NEW.account,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
             SHA2(CONVERT(CONCAT(
                "",
                CONCAT(NEW.postingRule,NEW.type,NEW.account,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
                NEW.creation,NEW.modified,NEW.modified_by,NEW.owner)USING utf8), 256), 0 );
        END */$$


DELIMITER ;

/* Trigger structure for table `plexPostingRulesAccounts` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `plexPostingRulesAccounts_update_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `plexPostingRulesAccounts_update_trigger` BEFORE UPDATE ON `plexPostingRulesAccounts` FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), old.modified_by, old.owner, 0, 0, "plexPostingRulesAccounts", 1,OLD.name,
            CONCAT(OLD.postingRule,OLD.type,OLD.account,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
            CONCAT(NEW.postingRule,NEW.type,NEW.account,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
             SHA2(CONVERT(CONCAT(
                CONCAT(OLD.postingRule,OLD.type,OLD.account,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
                CONCAT(NEW.postingRule,NEW.type,NEW.account,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner),
                creation,modified,modified_by,owner)USING utf8), 256), 0 );
          IF (NEW.sig != SHA2(CONVERT(CONCAT(NEW.postingRule,NEW.type,NEW.account,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner)USING utf8), 256)) 
          THEN
                INSERT INTO sig_failures VALUES(NULL, NOW(), "plexPostingRulesAccounts",  old.name,
                                            CONCAT(OLD.postingRule,OLD.type,OLD.account,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
                                            CONCAT(NEW.postingRule,NEW.type,NEW.account,NEW.creation,NEW.modified,NEW.modified_by,NEW.owner) );
                                            SET NEW.sig_status=1;
          END IF;
        END */$$


DELIMITER ;

/* Trigger structure for table `plexPostingRulesAccounts` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `plexPostingRulesAccounts_delete_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `plexPostingRulesAccounts_delete_trigger` BEFORE DELETE ON `plexPostingRulesAccounts` FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), OLD.modified_by, OLD.owner, 0, 0, "plexPostingRulesAccounts", 2,OLD.name,
            CONCAT(OLD.postingRule,OLD.type,OLD.account,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
            "",
             SHA2(CONVERT(CONCAT(
                CONCAT(OLD.postingRule,OLD.type,OLD.account,OLD.creation,OLD.modified,OLD.modified_by,OLD.owner),
                "",
                OLD.creation,OLD.modified,OLD.modified_by,OLD.`owner`)USING utf8), 256), 0 );
        END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
