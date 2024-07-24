/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.6.18-MariaDB-0ubuntu0.22.04.1 : Database - plexorCBS
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`plexorCBS` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `plexorCBS`;

/*Table structure for table `audit_trailLogs` */

DROP TABLE IF EXISTS `audit_trailLogs`;

CREATE TABLE `audit_trailLogs` (
  `name` int(8) NOT NULL AUTO_INCREMENT,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `table` varchar(200) DEFAULT NULL,
  `type` int(8) NOT NULL DEFAULT 0,
  `rec_id` varchar(200) DEFAULT NULL,
  `before_data` varchar(2500) DEFAULT NULL,
  `after_data` varchar(2500) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `auditusers` (`modified_by`),
  KEY `auditusers2` (`owner`),
  CONSTRAINT `auditusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `auditusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `audit_trailLogs` */

insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (3,'2024-07-10 12:16:06.000000','2024-07-10 12:16:06.000000','Administrator','Administrator',0,0,'notify_messages',0,NULL,'','System Manager|admin@example.com|The new 100466796 finest test. THis is an attempt to create a long enough message to change this forever.|1|3|1|2024-07-10 12:16:06.000000|2024-07-10 12:16:06.000000|Administrator|Administrator','750e32c66afb272e6727304ac890119114bd1836170bca10c990af814937fb9d',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (4,'2024-07-10 12:16:35.000000','2024-07-10 12:16:35.000000','Administrator','Administrator',0,0,'notify_messages',1,NULL,'System Manager|admin@example.com|The new finest test|1|1|0|2024-07-06 12:56:56.000000|2024-07-06 12:56:56.000000|Administrator|Administrator','System Manager|admin@example.com|The new finest testff|1|1|0|2024-07-06 12:56:56.000000|2024-07-06 12:56:56.000000|Administrator|Administrator','282dd80e079bda298a93e48376dba2b210e1ebfcc7546537c3a7a9d74e15d849',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (5,'2024-07-10 12:17:10.000000','2024-07-10 12:17:10.000000','Administrator','Administrator',0,0,'notify_messages',2,NULL,'','System Manager|admin@example.com|The new finest test|1|1|0|2024-07-06 12:55:42.000000|2024-07-06 12:55:42.000000|Administrator|Administrator','da198139a6c655c8b6f219c46fc3e2247634c1d32d47b0edef9509c55c7967a3',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (6,'2024-07-10 13:22:51.000000','2024-07-10 13:22:51.000000','Administrator','Administrator',0,0,'notify_messages',0,NULL,'','System Manager|admin@example.com|The new 168488847 finest test. THis is an attempt to create a long enough message to change this forever.|3|5|0|2024-07-10 13:22:51.000000|2024-07-10 13:22:51.000000|Administrator|Administrator','d2355ef03fb5ab85bce668b0c146f6c6ce193247c1bd48866ff209e0bdd91532',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (7,'2024-07-10 13:22:59.000000','2024-07-10 13:22:59.000000','Administrator','Administrator',0,0,'notify_messages',1,NULL,'System Manager|admin@example.com|The new finest test|1|1|0|2024-07-06 13:23:05.000000|2024-07-06 13:23:05.000000|Administrator|Administrator','System Manager|admin@example.com|The new finest testvv|1|1|0|2024-07-06 13:23:05.000000|2024-07-06 13:23:05.000000|Administrator|Administrator','7284d5a3a1eedcdc55eb394772d9142525aaafad88aa8fbb9cb3a5f3f68562fc',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (8,'2024-07-10 13:23:03.000000','2024-07-10 13:23:03.000000','Administrator','Administrator',0,0,'notify_messages',2,NULL,'','System Manager|admin@example.com|The new finest testvv|1|1|0|2024-07-06 13:23:05.000000|2024-07-06 13:23:05.000000|Administrator|Administrator','41af25c209a5beab2fdefebdada342943e14fa03856a56198b627d0a5eca2fd6',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (9,'2024-07-10 13:51:26.000000','2024-07-10 13:51:26.000000','Administrator','Administrator',0,0,'notify_messages',0,'0.6815302890553421','','System Manager|admin@example.com|The new 107635276 finest test. THis is an attempt to create a long enough message to change this forever.|1|3|0|2024-07-10 13:51:26.000000|2024-07-10 13:51:26.000000|Administrator|Administrator','44f9e8d5df178a4cb1dccd35e76475a5fba9295fe6b5e24cdae9442d9004a095',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (10,'2024-07-10 13:51:39.000000','2024-07-10 13:51:39.000000','Administrator','Administrator',0,0,'notify_messages',1,'0.10727468981153769','System Manager|admin@example.com|The new finest test|3|4|0|2024-07-06 15:25:44.000000|2024-07-06 15:25:44.000000|Administrator|Administrator','System Manager|admin@example.com|The new finest testvbg|3|4|0|2024-07-06 15:25:44.000000|2024-07-06 15:25:44.000000|Administrator|Administrator','332995f27a4ca850a59042c878814259a695dd6225e7156b4f58c5508ae30430',0);
insert  into `audit_trailLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`table`,`type`,`rec_id`,`before_data`,`after_data`,`sig`,`sig_status`) values (11,'2024-07-10 13:51:42.000000','2024-07-10 13:51:42.000000','Administrator','Administrator',0,0,'notify_messages',2,'0.09682011799590673','System Manager|admin@example.com|The new finest test|1|4|0|2024-07-06 15:27:10.000000|2024-07-06 15:27:10.000000|Administrator|Administrator','','ae3eb374d6a6c22546a884fc366834806a47c74c733effa0ea29b3daaf5e4e41',0);

/*Table structure for table `notify_last_alert` */

DROP TABLE IF EXISTS `notify_last_alert`;

CREATE TABLE `notify_last_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `last_msg_stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `notify_last_alert` */

insert  into `notify_last_alert`(`id`,`user`,`last_msg_stamp`) values (19,'admin@example.com','2024-07-10 13:51:26');
insert  into `notify_last_alert`(`id`,`user`,`last_msg_stamp`) values (20,'admin@plexor.com','2024-07-10 13:51:26');

/*Table structure for table `notify_messages` */

DROP TABLE IF EXISTS `notify_messages`;

CREATE TABLE `notify_messages` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `dest_group` varchar(500) DEFAULT NULL,
  `dest_user` varchar(50) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `msg_type` int(11) DEFAULT 3,
  `error_level` int(11) DEFAULT 1,
  `read` int(11) DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `notify_messagesusers` (`modified_by`),
  KEY `notify_messagesusers2` (`owner`),
  CONSTRAINT `notify_messagesusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `notify_messagesusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `notify_messages` */

insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.0008129244677842823','2024-07-06 15:28:01.000000','2024-07-06 15:28:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.008498897783922868','2024-07-06 13:28:22.000000','2024-07-06 13:28:22.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.012438348506054235','2024-07-08 14:02:24.000000','2024-07-08 14:02:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 15102602 finest test',1,3,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.01658242756182554','2024-07-06 16:01:16.000000','2024-07-06 16:01:16.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 481418511 finest test',3,5,1,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.022875837071683107','2024-07-06 15:48:07.000000','2024-07-06 15:48:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 395407515 finest test',3,1,1,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.027831268522731278','2024-07-06 15:43:17.000000','2024-07-06 15:43:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest testd',2,2,1,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.028102356035357674','2024-07-06 15:48:21.000000','2024-07-06 15:48:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 314877832 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.03529916986385283','2024-07-06 12:55:09.000000','2024-07-06 12:55:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The erew hkhkjh finest test',1,1,0,'12312312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.03549601886001976','2024-07-06 13:33:23.000000','2024-07-06 13:33:23.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest testccc',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.04570142183983831','2024-07-06 12:56:56.000000','2024-07-06 12:56:56.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest testff',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.04872536663778626','2024-07-06 12:54:57.000000','2024-07-06 12:54:57.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The erew finest test22',1,1,0,'12312312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.06236126465942828','2024-07-06 15:53:06.000000','2024-07-06 15:53:06.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 120386259 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.06498151464851715','2024-07-06 19:58:06.000000','2024-07-06 19:58:06.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 126028147 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.06532921275620275','2024-07-06 15:47:49.000000','2024-07-06 15:47:49.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 123357941 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.07090710948305867','2024-07-06 19:58:18.000000','2024-07-06 19:58:18.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 404605401 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.08797517054525686','2024-07-06 19:58:15.000000','2024-07-06 19:58:15.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 109880356 finest test',3,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.08993980483146366','2024-07-06 15:28:02.000000','2024-07-06 15:28:02.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.0951243835455965','2024-07-06 15:27:14.000000','2024-07-06 15:27:14.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.09613357027632517','2024-07-06 15:27:14.000000','2024-07-06 15:27:14.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.10511478791489712','2024-07-06 15:27:09.000000','2024-07-06 15:27:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.10727468981153769','2024-07-06 15:25:44.000000','2024-07-06 15:25:44.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest testvbg',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.11179678245614914','2024-07-06 13:29:12.000000','2024-07-06 13:29:12.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.12232886452444723','2024-07-06 15:27:14.000000','2024-07-06 15:27:14.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.12628144037563488','2024-07-06 15:48:01.000000','2024-07-06 15:48:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 143986580 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.12868521095131077','2024-07-06 15:27:37.000000','2024-07-06 15:27:37.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.13113602914953235','2024-07-06 15:48:21.000000','2024-07-06 15:48:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 188947087 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.13275941101159847','2024-07-06 19:57:47.000000','2024-07-06 19:57:47.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 463600026 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.13754779951418544','2024-07-06 13:03:39.000000','2024-07-06 13:03:39.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.13880619140230696','2024-07-06 15:45:19.000000','2024-07-06 15:45:19.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 351271862 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.1562195868754942','2024-07-06 19:47:05.000000','2024-07-06 19:47:05.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 5560979 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.1627416547040843','2024-07-06 13:32:47.000000','2024-07-06 13:32:47.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.16373118307788967','2024-07-06 15:27:38.000000','2024-07-06 15:27:38.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.1655521236039252','2024-07-06 15:28:02.000000','2024-07-06 15:28:02.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.16763470244373632','2024-07-06 15:28:01.000000','2024-07-06 15:28:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.1869253313047116','2024-07-06 16:00:48.000000','2024-07-06 16:00:48.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 461695687 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.18967228493622718','2024-07-06 15:27:51.000000','2024-07-06 15:27:51.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',3,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.19070436264453863','2024-07-06 15:27:37.000000','2024-07-06 15:27:37.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.19173683709626724','2024-07-06 19:54:50.000000','2024-07-06 19:54:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 24299616 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.19710016548363507','2024-07-06 15:45:31.000000','2024-07-06 15:45:31.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 457816149 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.19910421986049434','2024-07-06 15:48:08.000000','2024-07-06 15:48:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 379413562 finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2033712707491324','2024-07-06 15:46:05.000000','2024-07-06 15:46:05.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 265341928 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2084237646389974','2024-07-06 15:45:14.000000','2024-07-06 15:45:14.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 319317483 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.21060694028679927','2024-07-06 12:53:40.000000','2024-07-06 12:53:40.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The finest test',1,1,0,'12312312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.21100703367125898','2024-07-06 13:33:10.000000','2024-07-06 13:33:10.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.21768364703066986','2024-07-06 15:48:22.000000','2024-07-06 15:48:22.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 233839375 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.22053263077561988','2024-07-06 16:01:01.000000','2024-07-06 16:01:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 284813521 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.22079170702099027','2024-07-06 19:46:52.000000','2024-07-06 19:46:52.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 348144989 finest test',3,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.22497076469005156','2024-07-06 16:00:15.000000','2024-07-06 16:00:15.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 346002068 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.22625587808550882','2024-07-06 13:30:17.000000','2024-07-06 13:30:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.23214855718626506','2024-07-06 13:28:06.000000','2024-07-06 13:28:06.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.23740997280684298','2024-07-06 15:43:37.000000','2024-07-06 15:43:37.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.24056855611556074','2024-07-06 15:54:12.000000','2024-07-06 15:54:12.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 32635004 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.24200237285532278','2024-07-06 15:25:54.000000','2024-07-06 15:25:54.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.24494872916950725','2024-07-06 15:59:50.000000','2024-07-06 15:59:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 287862006 finest test',1,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2449694408522634','2024-07-06 15:48:21.000000','2024-07-06 15:48:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 92476265 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.24990329728452795','2024-07-06 16:01:17.000000','2024-07-06 16:01:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 412842888 finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2505886603617935','2024-07-06 19:55:24.000000','2024-07-06 19:55:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 84170779 finest test',1,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.25520774373338345','2024-07-08 14:02:24.000000','2024-07-08 14:02:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 76501492 finest test',3,3,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2564357922006732','2024-07-06 19:54:19.000000','2024-07-06 19:54:19.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 60255994 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.257238494471869','2024-07-08 14:03:08.000000','2024-07-08 14:03:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 77718654 finest test',1,3,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.260890892949785','2024-07-08 14:03:08.000000','2024-07-08 14:03:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 469020845 finest test',3,4,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.26482658019738886','2024-07-06 15:53:40.000000','2024-07-06 15:53:40.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 64404257 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2861541735810732','2024-07-06 19:55:24.000000','2024-07-06 19:55:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 101556284 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.28660001539308577','2024-07-06 19:57:35.000000','2024-07-06 19:57:35.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 300254524 finest test',1,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2868798312608896','2024-07-06 15:26:50.000000','2024-07-06 15:26:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.2887486678443371','2024-07-08 14:03:08.000000','2024-07-08 14:03:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 416321033 finest test',2,5,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.29055191789805135','2024-07-06 15:27:49.000000','2024-07-06 15:27:49.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.29130194456437786','2024-07-06 16:00:25.000000','2024-07-06 16:00:25.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 398737935 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.30515077738571056','2024-07-08 14:03:09.000000','2024-07-08 14:03:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 420133148 finest test',2,5,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.30848556692570966','2024-07-06 16:01:16.000000','2024-07-06 16:01:16.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 256785841 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3137141757772436','2024-07-06 13:29:09.000000','2024-07-06 13:29:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.316347708288904','2024-07-06 13:30:16.000000','2024-07-06 13:30:16.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.32012052025657195','2024-07-06 13:32:09.000000','2024-07-06 13:32:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3218847516196638','2024-07-06 19:57:50.000000','2024-07-06 19:57:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 194196623 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3231267065956506','2024-07-06 15:54:15.000000','2024-07-06 15:54:15.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 66698828 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3302576610168979','2024-07-06 16:01:17.000000','2024-07-06 16:01:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 267618398 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3358559257684796','2024-07-06 15:27:50.000000','2024-07-06 15:27:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.33984639340997336','2024-07-06 13:32:56.000000','2024-07-06 13:32:56.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.34053044611637523','2024-07-06 13:21:34.000000','2024-07-06 13:21:34.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.34195091048437254','2024-07-06 15:27:51.000000','2024-07-06 15:27:51.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3460488480944641','2024-07-06 13:28:37.000000','2024-07-06 13:28:37.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.34641533842907785','2024-07-06 15:59:35.000000','2024-07-06 15:59:35.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 234266408 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.36626028210507733','2024-07-06 15:48:21.000000','2024-07-06 15:48:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 348427790 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3750777089736217','2024-07-06 16:01:16.000000','2024-07-06 16:01:16.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 37176914 finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.38036284538019716','2024-07-06 13:30:17.000000','2024-07-06 13:30:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.3851095897938214','2024-07-06 16:00:55.000000','2024-07-06 16:00:55.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 196678304 finest test',3,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4025078726955763','2024-07-06 15:48:22.000000','2024-07-06 15:48:22.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 414648434 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.40268606543791113','2024-07-08 14:03:07.000000','2024-07-08 14:03:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 235600579 finest test',1,2,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.40486415978974116','2024-07-06 15:47:49.000000','2024-07-06 15:47:49.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 344164092 finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4095191838308416','2024-07-06 19:57:28.000000','2024-07-06 19:57:28.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 259551923 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4182925973257912','2024-07-06 16:01:17.000000','2024-07-06 16:01:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 402171543 finest test',3,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.41877434721102413','2024-07-06 15:45:00.000000','2024-07-06 15:45:00.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 389929745 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.42184412704952445','2024-07-06 15:47:40.000000','2024-07-06 15:47:40.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 323519909 finest test',3,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4271834329023803','2024-07-06 15:45:19.000000','2024-07-06 15:45:19.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 220490674 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.42787675878766623','2024-07-06 16:00:14.000000','2024-07-06 16:00:14.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 83476397 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.42926305013640137','2024-07-06 16:01:16.000000','2024-07-06 16:01:16.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 66217178 finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.44104823231794704','2024-07-06 15:53:33.000000','2024-07-06 15:53:33.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 224284428 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4411473147954301','2024-07-06 15:27:13.000000','2024-07-06 15:27:13.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.44168037869192694','2024-07-06 15:53:34.000000','2024-07-06 15:53:34.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 188177457 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4424349679075507','2024-07-06 19:47:02.000000','2024-07-06 19:47:02.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 270299614 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.44465172145948906','2024-07-06 15:26:55.000000','2024-07-06 15:26:55.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',3,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4468135316360868','2024-07-06 15:54:10.000000','2024-07-06 15:54:10.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 267001373 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4475453639845786','2024-07-06 15:45:05.000000','2024-07-06 15:45:05.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 305922837 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4517325856273366','2024-07-06 13:30:17.000000','2024-07-06 13:30:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.4535971651352916','2024-07-06 19:55:24.000000','2024-07-06 19:55:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 216966139 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.46377480166384466','2024-07-06 15:26:01.000000','2024-07-06 15:26:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.48261111740266077','2024-07-06 15:27:50.000000','2024-07-06 15:27:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.48559137572123795','2024-07-06 13:29:09.000000','2024-07-06 13:29:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.49159389128125636','2024-07-06 15:27:50.000000','2024-07-06 15:27:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5048588314138901','2024-07-06 15:53:33.000000','2024-07-06 15:53:33.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 382959802 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5238772859087933','2024-07-06 19:54:28.000000','2024-07-06 19:54:28.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 102602727 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5271658585659842','2024-07-06 15:59:59.000000','2024-07-06 15:59:59.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 330368402 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5342800407989696','2024-07-06 16:00:25.000000','2024-07-06 16:00:25.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 73289929 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5370163130918669','2024-07-06 19:55:16.000000','2024-07-06 19:55:16.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 335229813 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5388985895914012','2024-07-06 15:28:02.000000','2024-07-06 15:28:02.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5455810339614572','2024-07-06 15:44:57.000000','2024-07-06 15:44:57.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 233826957 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5463911532856441','2024-07-06 15:27:38.000000','2024-07-06 15:27:38.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5466165007526209','2024-07-06 13:30:17.000000','2024-07-06 13:30:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5503118639349117','2024-07-06 12:52:22.000000','2024-07-06 12:52:22.000000','Administrator','Administrator',1,1,'Plexor User','Administrator','The finest test',1,1,0,'12312312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5506347627850573','2024-07-06 13:10:24.000000','2024-07-06 13:10:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5510942503354459','2024-07-06 15:27:37.000000','2024-07-06 15:27:37.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5594160860026405','2024-07-06 16:01:01.000000','2024-07-06 16:01:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 62831807 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5620522196982543','2024-07-06 19:41:59.000000','2024-07-06 19:41:59.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 236379104 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5620982782562247','2024-07-06 19:46:42.000000','2024-07-06 19:46:42.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 61867880 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5674979673395846','2024-07-06 19:41:51.000000','2024-07-06 19:41:51.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 36931144 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5679216641633973','2024-07-06 15:26:07.000000','2024-07-06 15:26:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5752960793443919','2024-07-06 19:46:57.000000','2024-07-06 19:46:57.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 428484081 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5804460128587168','2024-07-06 15:45:19.000000','2024-07-06 15:45:19.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 390311184 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.5873457440988586','2024-07-06 15:45:11.000000','2024-07-06 15:45:11.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 347227590 finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.591993998356158','2024-07-06 13:31:51.000000','2024-07-06 13:31:51.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6028125682871905','2024-07-06 15:53:40.000000','2024-07-06 15:53:40.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 25127564 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6113235695393044','2024-07-06 15:26:38.000000','2024-07-06 15:26:38.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6117163967450302','2024-07-08 14:03:08.000000','2024-07-08 14:03:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 80229729 finest test',3,2,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6130409292998173','2024-07-06 15:27:38.000000','2024-07-06 15:27:38.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6145023811743617','2024-07-06 15:53:27.000000','2024-07-06 15:53:27.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 389464235 finest test',1,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6176234666422228','2024-07-06 15:48:07.000000','2024-07-06 15:48:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 461868749 finest test',3,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6178414156826598','2024-07-06 13:29:39.000000','2024-07-06 13:29:39.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6192131783992175','2024-07-06 19:46:51.000000','2024-07-06 19:46:51.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 289941372 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6206500880612527','2024-07-06 16:00:14.000000','2024-07-06 16:00:14.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 169409873 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6261000378300436','2024-07-06 13:30:17.000000','2024-07-06 13:30:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.627071120428919','2024-07-06 15:47:41.000000','2024-07-06 15:47:41.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 206856428 finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6305762479366513','2024-07-06 15:53:41.000000','2024-07-06 15:53:41.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 302563286 finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6337441547156722','2024-07-06 15:53:22.000000','2024-07-06 15:53:22.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 97061136 finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6449240656987988','2024-07-06 15:28:02.000000','2024-07-06 15:28:02.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6472058684073443','2024-07-06 15:59:44.000000','2024-07-06 15:59:44.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 450776658 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6481991518737741','2024-07-06 15:27:13.000000','2024-07-06 15:27:13.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6518944032973558','2024-07-06 19:54:35.000000','2024-07-06 19:54:35.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 206404035 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6529655350865475','2024-07-06 19:57:52.000000','2024-07-06 19:57:52.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 57843402 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6551292898646829','2024-07-06 15:47:39.000000','2024-07-06 15:47:39.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 219265139 finest test',1,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6564115617949623','2024-07-06 19:46:45.000000','2024-07-06 19:46:45.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 204959871 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6565686805700591','2024-07-06 19:58:09.000000','2024-07-06 19:58:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 285647868 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6603962170522625','2024-07-10 12:16:06.000000','2024-07-10 12:16:06.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 100466796 finest test. THis is an attempt to create a long enough message to change this forever.',1,3,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6626045058133122','2024-07-06 16:00:25.000000','2024-07-06 16:00:25.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 340676667 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6668188103165653','2024-07-08 15:09:08.000000','2024-07-08 15:09:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 414066557 finest test. THis is an attempt to create a long enough message to change this forever.',1,2,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6701437846479414','2024-07-06 15:47:49.000000','2024-07-06 15:47:49.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 69972728 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6815302890553421','2024-07-10 13:51:26.000000','2024-07-10 13:51:26.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 107635276 finest test. THis is an attempt to create a long enough message to change this forever.',1,3,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6991223038166038','2024-07-06 15:45:20.000000','2024-07-06 15:45:20.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 307048271 finest test',3,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.6991551292120992','2024-07-08 15:09:08.000000','2024-07-08 15:09:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 80594166 finest test. THis is an attempt to create a long enough message to change this forever.',2,1,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.700947490242261','2024-07-08 15:09:07.000000','2024-07-08 15:09:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 224347162 finest test. THis is an attempt to create a long enough message to change this forever.',1,2,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7047475778541971','2024-07-06 13:28:47.000000','2024-07-06 13:28:47.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7061194839944314','2024-07-08 15:09:07.000000','2024-07-08 15:09:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 466923233 finest test. THis is an attempt to create a long enough message to change this forever.',2,5,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7361092313529078','2024-07-06 12:54:05.000000','2024-07-06 12:54:05.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The erew finest test',1,1,0,'12312312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7411121686372087','2024-07-06 15:45:19.000000','2024-07-06 15:45:19.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 495011623 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7459470357242478','2024-07-08 15:09:07.000000','2024-07-08 15:09:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 319726867 finest test. THis is an attempt to create a long enough message to change this forever.',3,5,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7460939192642401','2024-07-06 19:54:11.000000','2024-07-06 19:54:11.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 13150704 finest test',3,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7538167617784969','2024-07-06 13:29:40.000000','2024-07-06 13:29:40.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7575463901809849','2024-07-06 15:53:09.000000','2024-07-06 15:53:09.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 351501149 finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7582551639138303','2024-07-06 15:53:41.000000','2024-07-06 15:53:41.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 103554823 finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7723085002715778','2024-07-06 12:53:21.000000','2024-07-06 12:53:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The finest test',1,1,0,'12312312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.783516839876321','2024-07-06 15:43:24.000000','2024-07-06 15:43:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7855814674734897','2024-07-06 19:58:04.000000','2024-07-06 19:58:04.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 215333461 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.7871574161454639','2024-07-06 15:53:15.000000','2024-07-06 15:53:15.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 313611225 finest test',3,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8052826531280602','2024-07-06 16:01:17.000000','2024-07-06 16:01:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 381467958 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8090018227780255','2024-07-08 14:02:24.000000','2024-07-08 14:02:24.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 449658586 finest test',1,4,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8165840234761909','2024-07-06 19:42:17.000000','2024-07-06 19:42:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 86613911 finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.824620636948031','2024-07-06 13:32:25.000000','2024-07-06 13:32:25.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8263838708646445','2024-07-06 15:26:58.000000','2024-07-06 15:26:58.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8312217125959896','2024-07-06 15:43:10.000000','2024-07-06 15:43:10.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',3,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8350597944437151','2024-07-06 13:30:16.000000','2024-07-06 13:30:16.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8379754897560696','2024-07-06 15:27:50.000000','2024-07-06 15:27:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8440169047974208','2024-07-08 14:02:25.000000','2024-07-08 14:02:25.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 72682525 finest test',1,3,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8442258637810367','2024-07-06 16:00:15.000000','2024-07-06 16:00:15.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 57948465 finest test',1,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8496889284343355','2024-07-06 15:45:19.000000','2024-07-06 15:45:19.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 423719220 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8689927867324956','2024-07-06 15:53:41.000000','2024-07-06 15:53:41.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 391270426 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8765142977950297','2024-07-08 14:03:08.000000','2024-07-08 14:03:08.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 209557809 finest test',2,1,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8853768928771624','2024-07-06 15:44:38.000000','2024-07-06 15:44:38.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 2 finest test',1,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8923231772075623','2024-07-06 16:00:15.000000','2024-07-06 16:00:15.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 456513446 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.8945216749743761','2024-07-06 19:57:54.000000','2024-07-06 19:57:54.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 110364021 finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9075117641198558','2024-07-06 15:27:13.000000','2024-07-06 15:27:13.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9094906821004028','2024-07-08 14:03:07.000000','2024-07-08 14:03:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 116879618 finest test',2,3,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9118150862975186','2024-07-06 15:26:27.000000','2024-07-06 15:26:27.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9143540206498969','2024-07-06 15:45:18.000000','2024-07-06 15:45:18.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 400465667 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.91555959257815','2024-07-06 13:29:40.000000','2024-07-06 13:29:40.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9160280375890695','2024-07-06 15:47:49.000000','2024-07-06 15:47:49.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 246645863 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9186179199429396','2024-07-06 19:54:29.000000','2024-07-06 19:54:29.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 312003560 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9281382718385554','2024-07-08 14:02:21.000000','2024-07-08 14:02:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 180356776 finest test',1,1,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9299045381414747','2024-07-06 15:43:32.000000','2024-07-06 15:43:32.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9307341956819726','2024-07-06 19:58:01.000000','2024-07-06 19:58:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 169547567 finest test',3,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9319784724451401','2024-07-06 15:59:49.000000','2024-07-06 15:59:49.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 140818564 finest test',2,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9333232398455248','2024-07-06 15:48:20.000000','2024-07-06 15:48:20.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 341924175 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9395627704817455','2024-07-06 19:58:11.000000','2024-07-06 19:58:11.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 268942722 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9411098099696541','2024-07-06 15:28:01.000000','2024-07-06 15:28:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.941675397513132','2024-07-08 15:09:07.000000','2024-07-08 15:09:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 80786803 finest test. THis is an attempt to create a long enough message to change this forever.',3,3,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9418211150372597','2024-07-06 15:46:21.000000','2024-07-06 15:46:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 251659590 finest test',2,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9449562485748495','2024-07-06 15:27:13.000000','2024-07-06 15:27:13.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9465319290259219','2024-07-06 16:01:17.000000','2024-07-06 16:01:17.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 241523153 finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9476990000789044','2024-07-06 15:48:20.000000','2024-07-06 15:48:20.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 307797139 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9516454850804484','2024-07-06 16:01:01.000000','2024-07-06 16:01:01.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 63311231 finest test',3,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.953471267552554','2024-07-06 15:27:37.000000','2024-07-06 15:27:37.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9557486036380274','2024-07-08 14:03:07.000000','2024-07-08 14:03:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 109125750 finest test',1,3,1,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9600480328873248','2024-07-06 15:45:43.000000','2024-07-06 15:45:43.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 308244951 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9622964784151842','2024-07-06 19:55:04.000000','2024-07-06 19:55:04.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 116045175 finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9689205242031445','2024-07-10 13:22:51.000000','2024-07-10 13:22:51.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 168488847 finest test. THis is an attempt to create a long enough message to change this forever.',3,5,0,'12310982312312',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9691260056282636','2024-07-06 15:27:50.000000','2024-07-06 15:27:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9699307828861575','2024-07-06 15:27:50.000000','2024-07-06 15:27:50.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',1,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9720332910977614','2024-07-06 15:48:21.000000','2024-07-06 15:48:21.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 280449118 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9764581732232666','2024-07-06 15:45:32.000000','2024-07-06 15:45:32.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 160033088 finest test',2,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9770504468838223','2024-07-06 16:00:07.000000','2024-07-06 16:00:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 499543186 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.986799541848525','2024-07-06 15:27:13.000000','2024-07-06 15:27:13.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new finest test',2,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9878577878585624','2024-07-06 15:53:47.000000','2024-07-06 15:53:47.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 198133825 finest test',1,5,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9886082699416282','2024-07-06 15:53:40.000000','2024-07-06 15:53:40.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 376384061 finest test',3,4,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9919142769574321','2024-07-06 15:48:07.000000','2024-07-06 15:48:07.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 392976030 finest test',3,3,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9924632245604538','2024-07-06 15:46:14.000000','2024-07-06 15:46:14.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 44444175 finest test',2,1,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('0.9966702107309087','2024-07-06 16:00:41.000000','2024-07-06 16:00:41.000000','Administrator','Administrator',1,1,'Plexor User','admin@example.com','The new 415616623 finest test',1,2,0,'12310982312312',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('1321','2024-07-04 12:35:58.000000','2024-07-04 14:56:15.800590','Administrator','Administrator',0,0,'Plexor User','howarduma@gmail.com','Testiting using emaila',3,1,0,'03058d4d5cb8e143ad86558b12263a843962a2eebf22b710bdc273758e29ed81',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('14','2024-07-04 13:12:06.652261','2024-07-04 14:56:40.716828','Administrator','Administrator',0,0,'Plexor User','howarduma@gmail.com','sdafsd',1,1,0,'3685653696a082e73f730a5cafd7a9041706ef3f1148004b41ff2d433d20bb1a',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('35','2024-07-04 14:11:50.785647','2024-07-04 14:17:51.963320','Administrator','Administrator',0,0,'Plexor User','howarduma@gmail.com','A serious test s',1,1,0,'0dafe91fb5085b6f833c38c9cf7dfcc67a333cde63cb16b984b66ab100a04942',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('36','2024-07-04 15:29:56.979429','2024-07-04 15:30:20.423644','Administrator','Administrator',0,0,'Plexor User','None','Show me you work',2,3,0,'349ad990015e1b62a346ce215e5ce5f20c294872c63510acd430d2c12cfc2368',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('37','2024-07-04 15:38:05.000000','2024-07-04 15:38:05.947208','Administrator','Administrator',0,0,'Plexor User','admin@example.com','fasdfasdf asdfsdfa dfasd',2,2,0,'0aae98e14e48272f277e23d30cd2a6cf32500636fabe793475c3556246cbaf7c',1);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values ('38','2024-07-04 15:40:30.503534','2024-07-04 15:40:30.503534','Administrator','Administrator',0,0,'Plexor User','None','Could it be',2,1,0,'0b53a52befaa1bb4b05dbcab3ff826fec5fe670a8e0f4cdafa6e907ecedcc5e0',0);

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

insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Cashier Deposits','2024-07-19 15:10:36.193717','2024-07-19 15:10:36.193717','Administrator','Administrator',0,0,'Cashier Deposits','Cash - BSLD','Cashier deposit container','fb933124e1062a2e10ecf2c3aa7c95bc0b3754de6f738b4c2e908f8ef0a678ef',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Member Payments','2024-07-19 15:11:40.273312','2024-07-19 15:11:40.273312','Administrator','Administrator',0,0,'Member Payments','Accounts Payable - BSL','Money owed to clients','07c4f935bbbe8616db44d80d398f22512d4556cefb0d1341b7d6ec68aaa4de97',0);

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

insert  into `plexAddress`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`short_name`,`street`,`address_line_1`,`address_line_2`,`address_line_3`,`town_village`,`county_district`,`country`,`postal_code`,`geolocation`,`sig`,`sig_status`) values ('Plexor Headquarters','2024-07-17 16:24:37.206242','2024-07-18 16:47:09.639000','Administrator','Administrator',0,0,'Plexor Headquarters','Menelik','40489','GPO','Nairobi','Nairobi','Nairobi','Kenya','00100','{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Point\",\"coordinates\":[72.842274,19.070839]}}]}','b6643636606c0eb4c2cb28b8e4d431b31e0ea98bc1c12eb64461e3d058e2224a',0);
insert  into `plexAddress`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`short_name`,`street`,`address_line_1`,`address_line_2`,`address_line_3`,`town_village`,`county_district`,`country`,`postal_code`,`geolocation`,`sig`,`sig_status`) values ('Plexor Holidays','2024-07-20 13:48:22.391302','2024-07-20 13:48:22.391302','Administrator','Administrator',0,0,'Plexor Holidays','Nakuru','4849','Kampala Road','001100','Nakuru','Nakuru','Kenya','None','None','485b25a3e0045a4c0f0f040c8194ce840df2a853edd1e62d8da4d5e155f85504',0);

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

insert  into `plexBranch`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`external_id`,`status`,`fullname`,`mobile_no`,`email_address`,`open_date`,`address`,`sig`,`sig_status`) values ('Hurlingham','2024-07-18 01:20:51.516369','2024-07-18 01:20:51.516369','Administrator','Administrator',0,0,'342423234',1,'Hurlingham','0702612333','howard@wqw.com','2024-07-19','Plexor Headquarters','d568b6063a77c3073ac5a5c1fe5b83dcb7e340a1f68590b57da996ee1881a870',0);
insert  into `plexBranch`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`external_id`,`status`,`fullname`,`mobile_no`,`email_address`,`open_date`,`address`,`sig`,`sig_status`) values ('Ngong Branch','2024-07-17 20:28:18.924005','2024-07-17 20:28:18.924005','Administrator','Administrator',0,0,'0987654322345',1,'Ngong Branch','0702333445','mobile@cosmin.com','2024-07-17','Plexor Headquarters','93f05a0cfd243894ce74ced98db9b13909c6e050d8728839137b53a4d4397055',0);
insert  into `plexBranch`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`external_id`,`status`,`fullname`,`mobile_no`,`email_address`,`open_date`,`address`,`sig`,`sig_status`) values ('Plexor Headquarters','2024-07-17 20:23:54.000000','2024-07-17 20:23:59.000000','admin@plexor.com','admin@plexor.com',0,0,'3123123123',200,'Plexor Headquarters','0702613575','afdsadf@sdf.com','2024-07-17','Plexor Headquarters',NULL,0);

/*Table structure for table `plexClient` */

DROP TABLE IF EXISTS `plexClient`;

CREATE TABLE `plexClient` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `external_id` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 200,
  `branch` varchar(140) NOT NULL,
  `staff_id` varchar(140) NOT NULL,
  `is_staff` int(1) NOT NULL DEFAULT 0,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `fullname` varchar(160) DEFAULT NULL,
  `display_name` varchar(160) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `image` text DEFAULT NULL,
  `client_type` varchar(140) DEFAULT NULL,
  `email_address` varchar(150) DEFAULT NULL,
  `address` varchar(140) DEFAULT NULL,
  `username` varchar(140) DEFAULT NULL,
  `password` varchar(140) DEFAULT NULL,
  `pass_enabled` int(11) DEFAULT NULL,
  `pass_update` datetime DEFAULT NULL,
  `pin` text DEFAULT NULL,
  `pin_enabled` int(11) DEFAULT NULL,
  `pin_updated` datetime DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `employer` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexClientBranch` (`branch`),
  KEY `plexClientAddress` (`address`),
  KEY `plexClientusers` (`modified_by`),
  KEY `plexClientusers2` (`owner`),
  KEY `plexClientType` (`email_address`),
  KEY `plexClientEmployer` (`employer`),
  CONSTRAINT `plexClientAddress` FOREIGN KEY (`address`) REFERENCES `plexAddress` (`name`),
  CONSTRAINT `plexClientBranch` FOREIGN KEY (`branch`) REFERENCES `plexBranch` (`name`),
  CONSTRAINT `plexClientEmployer` FOREIGN KEY (`employer`) REFERENCES `plexEmployer` (`name`),
  CONSTRAINT `plexClientType` FOREIGN KEY (`email_address`) REFERENCES `plexClientType` (`name`),
  CONSTRAINT `plexClientusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexClientusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexClient` */

/*Table structure for table `plexClientCharge` */

DROP TABLE IF EXISTS `plexClientCharge`;

CREATE TABLE `plexClientCharge` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `code` varchar(3) NOT NULL,
  `client_id` varchar(140) NOT NULL,
  `charge_id` varchar(140) NOT NULL,
  `is_penalty` bit(1) NOT NULL,
  `charge_time_enum` smallint(6) NOT NULL,
  `charge_due_date` date DEFAULT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL,
  `is_paid_derived` bit(1) DEFAULT NULL,
  `waived` bit(1) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `inactivated_on_date` date DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexClientChargeusers` (`modified_by`),
  KEY `plexClientChargeusers2` (`owner`),
  KEY `plexClientChargeClient` (`client_id`),
  CONSTRAINT `plexClientChargeClient` FOREIGN KEY (`client_id`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexClientChargeusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexClientChargeusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexClientCharge` */

/*Table structure for table `plexClientType` */

DROP TABLE IF EXISTS `plexClientType`;

CREATE TABLE `plexClientType` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `desc` varchar(20) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexClientTypeusers` (`modified_by`),
  KEY `plexClientTypeusers2` (`owner`),
  CONSTRAINT `plexClientTypeusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexClientTypeusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexClientType` */

insert  into `plexClientType`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`desc`,`sig`,`sig_status`) values ('1',NULL,NULL,NULL,NULL,0,0,'Individual',NULL,0);
insert  into `plexClientType`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`desc`,`sig`,`sig_status`) values ('2',NULL,NULL,NULL,NULL,0,0,'Group',NULL,0);
insert  into `plexClientType`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`desc`,`sig`,`sig_status`) values ('3',NULL,NULL,NULL,NULL,0,0,'Organization',NULL,0);

/*Table structure for table `plexClient_XXXX_LoanTrail` */

DROP TABLE IF EXISTS `plexClient_XXXX_LoanTrail`;

CREATE TABLE `plexClient_XXXX_LoanTrail` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `loan` varchar(140) DEFAULT NULL,
  `branch` varchar(140) DEFAULT NULL,
  `payment_detail_id` varchar(140) DEFAULT NULL,
  `is_reversed` bit(1) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `transaction_type_enum` smallint(6) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `principal_portion_derived` decimal(19,6) DEFAULT NULL,
  `interest_portion_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_portion_derived` decimal(19,6) DEFAULT NULL,
  `overpayment_portion_derived` decimal(19,6) DEFAULT NULL,
  `unrecognized_income_portion` decimal(19,6) DEFAULT NULL,
  `outstanding_loan_balance_derived` decimal(19,6) DEFAULT NULL,
  `submitted_on_date` date NOT NULL,
  `manually_adjusted_or_reversed` bit(1) DEFAULT b'0',
  `created_date` datetime(6) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `last_modified_by` bigint(20) NOT NULL,
  `created_on_utc` datetime(6) DEFAULT NULL,
  `last_modified_on_utc` datetime(6) DEFAULT NULL,
  `charge_refund_charge_type` varchar(1) DEFAULT NULL,
  `reversal_external_id` varchar(100) DEFAULT NULL,
  `reversed_on_date` date DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexClient_XXXX_LoanTrailusers` (`modified_by`),
  KEY `plexClient_XXXX_LoanTrailusers2` (`owner`),
  KEY `plexClient_XXXX_LoanTrailLoan` (`loan`),
  KEY `plexClient_XXXX_LoanTrailBranch` (`branch`),
  KEY `plexClient_XXXX_LoanTrailPayment` (`payment_detail_id`),
  CONSTRAINT `plexClient_XXXX_LoanTrailBranch` FOREIGN KEY (`branch`) REFERENCES `plexBranch` (`name`),
  CONSTRAINT `plexClient_XXXX_LoanTrailLoan` FOREIGN KEY (`loan`) REFERENCES `plexLoan` (`name`),
  CONSTRAINT `plexClient_XXXX_LoanTrailPayment` FOREIGN KEY (`payment_detail_id`) REFERENCES `plexPayment` (`name`),
  CONSTRAINT `plexClient_XXXX_LoanTrailusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexClient_XXXX_LoanTrailusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexClient_XXXX_LoanTrail` */

/*Table structure for table `plexClient_XXXX_SavingTrail` */

DROP TABLE IF EXISTS `plexClient_XXXX_SavingTrail`;

CREATE TABLE `plexClient_XXXX_SavingTrail` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `savings` varchar(140) NOT NULL,
  `branch` varchar(140) NOT NULL,
  `payment_detail_id` varchar(140) DEFAULT NULL,
  `transaction_type_enum` smallint(6) NOT NULL,
  `is_reversed` bit(1) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `overdraft_amount_derived` decimal(19,6) DEFAULT NULL,
  `balance_end_date_derived` date DEFAULT NULL,
  `balance_number_of_days_derived` int(11) DEFAULT NULL,
  `running_balance_derived` decimal(19,6) DEFAULT NULL,
  `cumulative_balance_derived` decimal(19,6) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `is_manual` bit(1) DEFAULT b'0',
  `release_id_of_hold_amount` bigint(20) DEFAULT NULL,
  `is_loan_disbursement` bit(1) DEFAULT NULL,
  `ref_no` varchar(128) DEFAULT NULL,
  `original_transaction_id` bigint(20) DEFAULT NULL,
  `is_reversal` bit(1) NOT NULL DEFAULT b'0',
  `reason_for_block` varchar(256) DEFAULT NULL,
  `is_lien_transaction` bit(1) NOT NULL DEFAULT b'0',
  `submitted_on_date` date NOT NULL,
  `last_modified_by` bigint(20) NOT NULL,
  `created_on_utc` datetime(6) NOT NULL,
  `last_modified_on_utc` datetime(6) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexClient_XXXX_SavingTrailusers` (`modified_by`),
  KEY `plexClient_XXXX_SavingTrailusers2` (`owner`),
  KEY `plexClient_XXXX_SavingTrailBranch` (`branch`),
  KEY `plexClient_XXXX_SavingTrailPayment` (`payment_detail_id`),
  KEY `plexClient_XXXX_SavingTrailSavings` (`savings`),
  CONSTRAINT `plexClient_XXXX_SavingTrailBranch` FOREIGN KEY (`branch`) REFERENCES `plexBranch` (`name`),
  CONSTRAINT `plexClient_XXXX_SavingTrailPayment` FOREIGN KEY (`payment_detail_id`) REFERENCES `plexPayment` (`name`),
  CONSTRAINT `plexClient_XXXX_SavingTrailSavings` FOREIGN KEY (`savings`) REFERENCES `plexSavingAccount` (`name`),
  CONSTRAINT `plexClient_XXXX_SavingTrailusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexClient_XXXX_SavingTrailusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexClient_XXXX_SavingTrail` */

/*Table structure for table `plexCountry` */

DROP TABLE IF EXISTS `plexCountry`;

CREATE TABLE `plexCountry` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `country_name` varchar(140) DEFAULT NULL,
  `date_format` varchar(140) DEFAULT NULL,
  `time_format` varchar(140) DEFAULT 'HH:mm:ss',
  `time_zones` text DEFAULT NULL,
  `code` varchar(140) DEFAULT NULL,
  `_user_tags` text DEFAULT NULL,
  `_comments` text DEFAULT NULL,
  `_assign` text DEFAULT NULL,
  `_liked_by` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `country_name` (`country_name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `plexCountry` */

insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Afghanistan','2024-06-27 01:28:30.606172','2024-06-27 01:28:30.606172','Administrator','Administrator',0,0,'Afghanistan','dd-mm-yyyy','HH:mm:ss','Asia/Kabul','af',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Åland Islands','2024-06-27 01:28:30.619310','2024-06-27 01:28:30.619310','Administrator','Administrator',0,0,'Åland Islands','dd-mm-yyyy','HH:mm:ss','','ax',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Albania','2024-06-27 01:28:30.606303','2024-06-27 01:28:30.606303','Administrator','Administrator',0,0,'Albania','dd-mm-yyyy','HH:mm:ss','Europe/Tirane','al',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Algeria','2024-06-27 01:28:30.606379','2024-06-27 01:28:30.606379','Administrator','Administrator',0,0,'Algeria','dd-mm-yyyy','HH:mm:ss','Africa/Algiers','dz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('American Samoa','2024-06-27 01:28:30.606439','2024-06-27 01:28:30.606439','Administrator','Administrator',0,0,'American Samoa','dd-mm-yyyy','HH:mm:ss','','as',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Andorra','2024-06-27 01:28:30.606497','2024-06-27 01:28:30.606497','Administrator','Administrator',0,0,'Andorra','dd-mm-yyyy','HH:mm:ss','Europe/Andorra','ad',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Angola','2024-06-27 01:28:30.606557','2024-06-27 01:28:30.606557','Administrator','Administrator',0,0,'Angola','dd-mm-yyyy','HH:mm:ss','Africa/Luanda','ao',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Anguilla','2024-06-27 01:28:30.606613','2024-06-27 01:28:30.606613','Administrator','Administrator',0,0,'Anguilla','dd-mm-yyyy','HH:mm:ss','America/Anguilla','ai',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Antarctica','2024-06-27 01:28:30.606667','2024-06-27 01:28:30.606667','Administrator','Administrator',0,0,'Antarctica','dd-mm-yyyy','HH:mm:ss','Antarctica/Casey\nAntarctica/Davis\nAntarctica/DumontDUrville\nAntarctica/Macquarie\nAntarctica/Mawson\nAntarctica/McMurdo\nAntarctica/Palmer\nAntarctica/Rothera\nAntarctica/Syowa\nAntarctica/Vostok','aq',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Antigua and Barbuda','2024-06-27 01:28:30.606759','2024-06-27 01:28:30.606759','Administrator','Administrator',0,0,'Antigua and Barbuda','dd-mm-yyyy','HH:mm:ss','America/Antigua','ag',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Argentina','2024-06-27 01:28:30.606822','2024-06-27 01:28:30.606822','Administrator','Administrator',0,0,'Argentina','dd-mm-yyyy','HH:mm:ss','America/Argentina/Buenos_Aires\nAmerica/Argentina/Catamarca\nAmerica/Argentina/Cordoba\nAmerica/Argentina/Jujuy\nAmerica/Argentina/La_Rioja\nAmerica/Argentina/Mendoza\nAmerica/Argentina/Rio_Gallegos\nAmerica/Argentina/Salta\nAmerica/Argentina/San_Juan\nAmerica/Argentina/San_Luis\nAmerica/Argentina/Tucuman\nAmerica/Argentina/Ushuaia','ar',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Armenia','2024-06-27 01:28:30.606879','2024-06-27 01:28:30.606879','Administrator','Administrator',0,0,'Armenia','dd-mm-yyyy','HH:mm:ss','Asia/Yerevan','am',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Aruba','2024-06-27 01:28:30.606934','2024-06-27 01:28:30.606934','Administrator','Administrator',0,0,'Aruba','dd-mm-yyyy','HH:mm:ss','America/Aruba','aw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Australia','2024-06-27 01:28:30.606986','2024-06-27 01:28:30.606986','Administrator','Administrator',0,0,'Australia','dd-mm-yyyy','HH:mm:ss','Australia/Adelaide\nAustralia/Brisbane\nAustralia/Broken_Hill\nAustralia/Currie\nAustralia/Darwin\nAustralia/Eucla\nAustralia/Hobart\nAustralia/Lindeman\nAustralia/Lord_Howe\nAustralia/Melbourne\nAustralia/Perth\nAustralia/Sydney','au',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Austria','2024-06-27 01:28:30.607039','2024-06-27 01:28:30.607039','Administrator','Administrator',0,0,'Austria','dd-mm-yyyy','HH:mm:ss','Europe/Vienna','at',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Azerbaijan','2024-06-27 01:28:30.607105','2024-06-27 01:28:30.607105','Administrator','Administrator',0,0,'Azerbaijan','dd-mm-yyyy','HH:mm:ss','Asia/Baku','az',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bahamas','2024-06-27 01:28:30.607228','2024-06-27 01:28:30.607228','Administrator','Administrator',0,0,'Bahamas','dd-mm-yyyy','HH:mm:ss','America/Nassau','bs',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bahrain','2024-06-27 01:28:30.607321','2024-06-27 01:28:30.607321','Administrator','Administrator',0,0,'Bahrain','dd-mm-yyyy','HH:mm:ss','Asia/Bahrain','bh',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bangladesh','2024-06-27 01:28:30.607390','2024-06-27 01:28:30.607390','Administrator','Administrator',0,0,'Bangladesh','dd-mm-yyyy','HH:mm:ss','Asia/Dhaka','bd',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Barbados','2024-06-27 01:28:30.607443','2024-06-27 01:28:30.607443','Administrator','Administrator',0,0,'Barbados','dd-mm-yyyy','HH:mm:ss','America/Barbados','bb',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Belarus','2024-06-27 01:28:30.607495','2024-06-27 01:28:30.607495','Administrator','Administrator',0,0,'Belarus','dd-mm-yyyy','HH:mm:ss','Europe/Minsk','by',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Belgium','2024-06-27 01:28:30.607546','2024-06-27 01:28:30.607546','Administrator','Administrator',0,0,'Belgium','dd-mm-yyyy','HH:mm:ss','Europe/Brussels','be',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Belize','2024-06-27 01:28:30.607597','2024-06-27 01:28:30.607597','Administrator','Administrator',0,0,'Belize','mm-dd-yyyy','HH:mm:ss','America/Belize','bz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Benin','2024-06-27 01:28:30.607648','2024-06-27 01:28:30.607648','Administrator','Administrator',0,0,'Benin','dd-mm-yyyy','HH:mm:ss','Africa/Porto-Novo','bj',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bermuda','2024-06-27 01:28:30.607699','2024-06-27 01:28:30.607699','Administrator','Administrator',0,0,'Bermuda','dd-mm-yyyy','HH:mm:ss','Atlantic/Bermuda','bm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bhutan','2024-06-27 01:28:30.607749','2024-06-27 01:28:30.607749','Administrator','Administrator',0,0,'Bhutan','dd-mm-yyyy','HH:mm:ss','Asia/Thimphu','bt',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bolivia, Plurinational State of','2024-06-27 01:28:30.607799','2024-06-27 01:28:30.607799','Administrator','Administrator',0,0,'Bolivia, Plurinational State of','dd-mm-yyyy','HH:mm:ss','','bo',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bonaire, Sint Eustatius and Saba','2024-06-27 01:28:30.607849','2024-06-27 01:28:30.607849','Administrator','Administrator',0,0,'Bonaire, Sint Eustatius and Saba','dd-mm-yyyy','HH:mm:ss','','bq',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bosnia and Herzegovina','2024-06-27 01:28:30.607899','2024-06-27 01:28:30.607899','Administrator','Administrator',0,0,'Bosnia and Herzegovina','dd-mm-yyyy','HH:mm:ss','Europe/Sarajevo','ba',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Botswana','2024-06-27 01:28:30.607949','2024-06-27 01:28:30.607949','Administrator','Administrator',0,0,'Botswana','dd-mm-yyyy','HH:mm:ss','Africa/Gaborone','bw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bouvet Island','2024-06-27 01:28:30.607998','2024-06-27 01:28:30.607998','Administrator','Administrator',0,0,'Bouvet Island','dd-mm-yyyy','HH:mm:ss','','bv',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Brazil','2024-06-27 01:28:30.608048','2024-06-27 01:28:30.608048','Administrator','Administrator',0,0,'Brazil','dd/mm/yyyy','HH:mm:ss','America/Araguaina\nAmerica/Bahia\nAmerica/Belem\nAmerica/Boa_Vista\nAmerica/Campo_Grande\nAmerica/Cuiaba\nAmerica/Eirunepe\nAmerica/Fortaleza\nAmerica/Maceio\nAmerica/Manaus\nAmerica/Noronha\nAmerica/Porto_Velho\nAmerica/Recife\nAmerica/Rio_Branco\nAmerica/Santarem\nAmerica/Sao_Paulo','br',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('British Indian Ocean Territory','2024-06-27 01:28:30.608098','2024-06-27 01:28:30.608098','Administrator','Administrator',0,0,'British Indian Ocean Territory','dd-mm-yyyy','HH:mm:ss','Indian/Chagos','io',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Brunei Darussalam','2024-06-27 01:28:30.608148','2024-06-27 01:28:30.608148','Administrator','Administrator',0,0,'Brunei Darussalam','dd-mm-yyyy','HH:mm:ss','Asia/Brunei','bn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Bulgaria','2024-06-27 01:28:30.608197','2024-06-27 01:28:30.608197','Administrator','Administrator',0,0,'Bulgaria','dd-mm-yyyy','HH:mm:ss','Europe/Sofia','bg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Burkina Faso','2024-06-27 01:28:30.608248','2024-06-27 01:28:30.608248','Administrator','Administrator',0,0,'Burkina Faso','dd-mm-yyyy','HH:mm:ss','Africa/Ouagadougou','bf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Burundi','2024-06-27 01:28:30.608298','2024-06-27 01:28:30.608298','Administrator','Administrator',0,0,'Burundi','dd-mm-yyyy','HH:mm:ss','Africa/Bujumbura','bi',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cambodia','2024-06-27 01:28:30.608348','2024-06-27 01:28:30.608348','Administrator','Administrator',0,0,'Cambodia','dd-mm-yyyy','HH:mm:ss','Asia/Phnom_Penh','kh',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cameroon','2024-06-27 01:28:30.608398','2024-06-27 01:28:30.608398','Administrator','Administrator',0,0,'Cameroon','dd-mm-yyyy','HH:mm:ss','Africa/Douala','cm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Canada','2024-06-27 01:28:30.608448','2024-06-27 01:28:30.608448','Administrator','Administrator',0,0,'Canada','yyyy-mm-dd','HH:mm:ss','America/Atikokan\nAmerica/Blanc-Sablon\nAmerica/Cambridge_Bay\nAmerica/Creston\nAmerica/Dawson\nAmerica/Dawson_Creek\nAmerica/Edmonton\nAmerica/Glace_Bay\nAmerica/Goose_Bay\nAmerica/Halifax\nAmerica/Inuvik\nAmerica/Iqaluit\nAmerica/Moncton\nAmerica/Montreal\nAmerica/Nipigon\nAmerica/Pangnirtung\nAmerica/Rainy_River\nAmerica/Rankin_Inlet\nAmerica/Regina\nAmerica/Resolute\nAmerica/St_Johns\nAmerica/Swift_Current\nAmerica/Thunder_Bay\nAmerica/Toronto\nAmerica/Vancouver\nAmerica/Whitehorse\nAmerica/Winnipeg\nAmerica/Yellowknife','ca',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cape Verde','2024-06-27 01:28:30.608497','2024-06-27 01:28:30.608497','Administrator','Administrator',0,0,'Cape Verde','dd-mm-yyyy','HH:mm:ss','Atlantic/Cape_Verde','cv',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cayman Islands','2024-06-27 01:28:30.608547','2024-06-27 01:28:30.608547','Administrator','Administrator',0,0,'Cayman Islands','dd-mm-yyyy','HH:mm:ss','America/Cayman','ky',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Central African Republic','2024-06-27 01:28:30.608596','2024-06-27 01:28:30.608596','Administrator','Administrator',0,0,'Central African Republic','dd-mm-yyyy','HH:mm:ss','Africa/Bangui','cf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Chad','2024-06-27 01:28:30.608646','2024-06-27 01:28:30.608646','Administrator','Administrator',0,0,'Chad','dd-mm-yyyy','HH:mm:ss','Africa/Ndjamena','td',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Chile','2024-06-27 01:28:30.608695','2024-06-27 01:28:30.608695','Administrator','Administrator',0,0,'Chile','dd-mm-yyyy','HH:mm:ss','America/Santiago\nPacific/Easter','cl',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('China','2024-06-27 01:28:30.608781','2024-06-27 01:28:30.608781','Administrator','Administrator',0,0,'China','yyyy-mm-dd','HH:mm:ss','Asia/Chongqing\nAsia/Harbin\nAsia/Kashgar\nAsia/Shanghai\nAsia/Urumqi','cn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Christmas Island','2024-06-27 01:28:30.608846','2024-06-27 01:28:30.608846','Administrator','Administrator',0,0,'Christmas Island','dd-mm-yyyy','HH:mm:ss','Indian/Christmas','cx',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cocos (Keeling) Islands','2024-06-27 01:28:30.608900','2024-06-27 01:28:30.608900','Administrator','Administrator',0,0,'Cocos (Keeling) Islands','dd-mm-yyyy','HH:mm:ss','Indian/Cocos','cc',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Colombia','2024-06-27 01:28:30.608952','2024-06-27 01:28:30.608952','Administrator','Administrator',0,0,'Colombia','dd-mm-yyyy','HH:mm:ss','America/Bogota','co',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Comoros','2024-06-27 01:28:30.609003','2024-06-27 01:28:30.609003','Administrator','Administrator',0,0,'Comoros','dd-mm-yyyy','HH:mm:ss','Indian/Comoro','km',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Congo','2024-06-27 01:28:30.609054','2024-06-27 01:28:30.609054','Administrator','Administrator',0,0,'Congo','dd-mm-yyyy','HH:mm:ss','','cg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Congo, The Democratic Republic of the','2024-06-27 01:28:30.609105','2024-06-27 01:28:30.609105','Administrator','Administrator',0,0,'Congo, The Democratic Republic of the','dd-mm-yyyy','HH:mm:ss','','cd',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cook Islands','2024-06-27 01:28:30.609155','2024-06-27 01:28:30.609155','Administrator','Administrator',0,0,'Cook Islands','dd-mm-yyyy','HH:mm:ss','Pacific/Rarotonga','ck',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Costa Rica','2024-06-27 01:28:30.609206','2024-06-27 01:28:30.609206','Administrator','Administrator',0,0,'Costa Rica','dd-mm-yyyy','HH:mm:ss','America/Costa_Rica','cr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Croatia','2024-06-27 01:28:30.609256','2024-06-27 01:28:30.609256','Administrator','Administrator',0,0,'Croatia','dd-mm-yyyy','HH:mm:ss','Europe/Zagreb','hr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cuba','2024-06-27 01:28:30.609305','2024-06-27 01:28:30.609305','Administrator','Administrator',0,0,'Cuba','dd-mm-yyyy','HH:mm:ss','America/Havana','cu',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Curaçao','2024-06-27 01:28:30.609355','2024-06-27 01:28:30.609355','Administrator','Administrator',0,0,'Curaçao','dd-mm-yyyy','HH:mm:ss','','cw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Cyprus','2024-06-27 01:28:30.609405','2024-06-27 01:28:30.609405','Administrator','Administrator',0,0,'Cyprus','dd-mm-yyyy','HH:mm:ss','Asia/Nicosia','cy',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Czech Republic','2024-06-27 01:28:30.609454','2024-06-27 01:28:30.609454','Administrator','Administrator',0,0,'Czech Republic','dd-mm-yyyy','HH:mm:ss','Europe/Prague','cz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Denmark','2024-06-27 01:28:30.609504','2024-06-27 01:28:30.609504','Administrator','Administrator',0,0,'Denmark','dd-mm-yyyy','HH:mm:ss','Europe/Copenhagen','dk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Djibouti','2024-06-27 01:28:30.609553','2024-06-27 01:28:30.609553','Administrator','Administrator',0,0,'Djibouti','dd-mm-yyyy','HH:mm:ss','Africa/Djibouti','dj',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Dominica','2024-06-27 01:28:30.609603','2024-06-27 01:28:30.609603','Administrator','Administrator',0,0,'Dominica','dd-mm-yyyy','HH:mm:ss','America/Dominica','dm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Dominican Republic','2024-06-27 01:28:30.609654','2024-06-27 01:28:30.609654','Administrator','Administrator',0,0,'Dominican Republic','dd-mm-yyyy','HH:mm:ss','America/Santo_Domingo','do',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Ecuador','2024-06-27 01:28:30.609704','2024-06-27 01:28:30.609704','Administrator','Administrator',0,0,'Ecuador','dd-mm-yyyy','HH:mm:ss','America/Guayaquil\nPacific/Galapagos','ec',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Egypt','2024-06-27 01:28:30.609753','2024-06-27 01:28:30.609753','Administrator','Administrator',0,0,'Egypt','dd-mm-yyyy','HH:mm:ss','Africa/Cairo','eg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('El Salvador','2024-06-27 01:28:30.609811','2024-06-27 01:28:30.609811','Administrator','Administrator',0,0,'El Salvador','dd-mm-yyyy','HH:mm:ss','America/El_Salvador','sv',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Equatorial Guinea','2024-06-27 01:28:30.609864','2024-06-27 01:28:30.609864','Administrator','Administrator',0,0,'Equatorial Guinea','dd-mm-yyyy','HH:mm:ss','Africa/Malabo','gq',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Eritrea','2024-06-27 01:28:30.609915','2024-06-27 01:28:30.609915','Administrator','Administrator',0,0,'Eritrea','dd-mm-yyyy','HH:mm:ss','Africa/Asmara','er',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Estonia','2024-06-27 01:28:30.609966','2024-06-27 01:28:30.609966','Administrator','Administrator',0,0,'Estonia','dd-mm-yyyy','HH:mm:ss','Europe/Tallinn','ee',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Ethiopia','2024-06-27 01:28:30.610016','2024-06-27 01:28:30.610016','Administrator','Administrator',0,0,'Ethiopia','dd-mm-yyyy','HH:mm:ss','Africa/Addis_Ababa','et',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Falkland Islands (Malvinas)','2024-06-27 01:28:30.610066','2024-06-27 01:28:30.610066','Administrator','Administrator',0,0,'Falkland Islands (Malvinas)','dd-mm-yyyy','HH:mm:ss','','fk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Faroe Islands','2024-06-27 01:28:30.610116','2024-06-27 01:28:30.610116','Administrator','Administrator',0,0,'Faroe Islands','dd-mm-yyyy','HH:mm:ss','Atlantic/Faroe','fo',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Fiji','2024-06-27 01:28:30.610165','2024-06-27 01:28:30.610165','Administrator','Administrator',0,0,'Fiji','dd-mm-yyyy','HH:mm:ss','Pacific/Fiji','fj',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Finland','2024-06-27 01:28:30.610215','2024-06-27 01:28:30.610215','Administrator','Administrator',0,0,'Finland','dd-mm-yyyy','HH:mm:ss','Europe/Helsinki','fi',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('France','2024-06-27 01:28:30.610265','2024-06-27 01:28:30.610265','Administrator','Administrator',0,0,'France','dd/mm/yyyy','HH:mm:ss','Europe/Paris','fr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('French Guiana','2024-06-27 01:28:30.610316','2024-06-27 01:28:30.610316','Administrator','Administrator',0,0,'French Guiana','dd-mm-yyyy','HH:mm:ss','America/Cayenne','gf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('French Polynesia','2024-06-27 01:28:30.610366','2024-06-27 01:28:30.610366','Administrator','Administrator',0,0,'French Polynesia','dd-mm-yyyy','HH:mm:ss','Pacific/Gambier\nPacific/Marquesas\nPacific/Tahiti','pf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('French Southern Territories','2024-06-27 01:28:30.610416','2024-06-27 01:28:30.610416','Administrator','Administrator',0,0,'French Southern Territories','dd-mm-yyyy','HH:mm:ss','','tf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Gabon','2024-06-27 01:28:30.610465','2024-06-27 01:28:30.610465','Administrator','Administrator',0,0,'Gabon','dd-mm-yyyy','HH:mm:ss','Africa/Libreville','ga',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Gambia','2024-06-27 01:28:30.610516','2024-06-27 01:28:30.610516','Administrator','Administrator',0,0,'Gambia','dd-mm-yyyy','HH:mm:ss','Africa/Banjul','gm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Georgia','2024-06-27 01:28:30.610566','2024-06-27 01:28:30.610566','Administrator','Administrator',0,0,'Georgia','dd-mm-yyyy','HH:mm:ss','Asia/Tbilisi','ge',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Germany','2024-06-27 01:28:30.610616','2024-06-27 01:28:30.610616','Administrator','Administrator',0,0,'Germany','dd.mm.yyyy','HH:mm','Europe/Berlin','de',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Ghana','2024-06-27 01:28:30.610665','2024-06-27 01:28:30.610665','Administrator','Administrator',0,0,'Ghana','dd-mm-yyyy','HH:mm:ss','Africa/Accra','gh',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Gibraltar','2024-06-27 01:28:30.610715','2024-06-27 01:28:30.610715','Administrator','Administrator',0,0,'Gibraltar','dd-mm-yyyy','HH:mm:ss','Europe/Gibraltar','gi',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Greece','2024-06-27 01:28:30.610788','2024-06-27 01:28:30.610788','Administrator','Administrator',0,0,'Greece','dd-mm-yyyy','HH:mm:ss','Europe/Athens','gr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Greenland','2024-06-27 01:28:30.610850','2024-06-27 01:28:30.610850','Administrator','Administrator',0,0,'Greenland','dd-mm-yyyy','HH:mm:ss','America/Danmarkshavn\nAmerica/Godthab\nAmerica/Scoresbysund\nAmerica/Thule','gl',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Grenada','2024-06-27 01:28:30.610902','2024-06-27 01:28:30.610902','Administrator','Administrator',0,0,'Grenada','dd-mm-yyyy','HH:mm:ss','America/Grenada','gd',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Guadeloupe','2024-06-27 01:28:30.610952','2024-06-27 01:28:30.610952','Administrator','Administrator',0,0,'Guadeloupe','dd-mm-yyyy','HH:mm:ss','America/Guadeloupe','gp',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Guam','2024-06-27 01:28:30.611003','2024-06-27 01:28:30.611003','Administrator','Administrator',0,0,'Guam','dd-mm-yyyy','HH:mm:ss','Pacific/Guam','gu',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Guatemala','2024-06-27 01:28:30.611052','2024-06-27 01:28:30.611052','Administrator','Administrator',0,0,'Guatemala','dd-mm-yyyy','HH:mm:ss','America/Guatemala','gt',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Guernsey','2024-06-27 01:28:30.611103','2024-06-27 01:28:30.611103','Administrator','Administrator',0,0,'Guernsey','dd-mm-yyyy','HH:mm:ss','Europe/London','gg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Guinea','2024-06-27 01:28:30.611152','2024-06-27 01:28:30.611152','Administrator','Administrator',0,0,'Guinea','dd-mm-yyyy','HH:mm:ss','Africa/Conakry','gn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Guinea-Bissau','2024-06-27 01:28:30.611202','2024-06-27 01:28:30.611202','Administrator','Administrator',0,0,'Guinea-Bissau','dd-mm-yyyy','HH:mm:ss','Africa/Bissau','gw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Guyana','2024-06-27 01:28:30.611252','2024-06-27 01:28:30.611252','Administrator','Administrator',0,0,'Guyana','dd-mm-yyyy','HH:mm:ss','America/Guyana','gy',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Haiti','2024-06-27 01:28:30.611327','2024-06-27 01:28:30.611327','Administrator','Administrator',0,0,'Haiti','dd-mm-yyyy','HH:mm:ss','America/Guatemala\nAmerica/Port-au-Prince','ht',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Heard Island and McDonald Islands','2024-06-27 01:28:30.611390','2024-06-27 01:28:30.611390','Administrator','Administrator',0,0,'Heard Island and McDonald Islands','dd-mm-yyyy','HH:mm:ss','','hm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Holy See (Vatican City State)','2024-06-27 01:28:30.611440','2024-06-27 01:28:30.611440','Administrator','Administrator',0,0,'Holy See (Vatican City State)','dd-mm-yyyy','HH:mm:ss','','va',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Honduras','2024-06-27 01:28:30.611491','2024-06-27 01:28:30.611491','Administrator','Administrator',0,0,'Honduras','dd-mm-yyyy','HH:mm:ss','America/Tegucigalpa','hn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Hong Kong','2024-06-27 01:28:30.611541','2024-06-27 01:28:30.611541','Administrator','Administrator',0,0,'Hong Kong','dd-mm-yyyy','HH:mm:ss','Asia/Hong_Kong','hk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Hungary','2024-06-27 01:28:30.611590','2024-06-27 01:28:30.611590','Administrator','Administrator',0,0,'Hungary','yyyy-mm-dd','HH:mm:ss','Europe/Budapest','hu',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Iceland','2024-06-27 01:28:30.611640','2024-06-27 01:28:30.611640','Administrator','Administrator',0,0,'Iceland','dd-mm-yyyy','HH:mm:ss','Atlantic/Reykjavik','is',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('India','2024-06-27 01:28:30.611690','2024-06-27 01:28:30.611690','Administrator','Administrator',0,0,'India','dd-mm-yyyy','HH:mm:ss','Asia/Kolkata','in',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Indonesia','2024-06-27 01:28:30.611740','2024-06-27 01:28:30.611740','Administrator','Administrator',0,0,'Indonesia','dd-mm-yyyy','HH:mm:ss','Asia/Jakarta\nAsia/Jayapura\nAsia/Makassar\nAsia/Pontianak','id',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Iran','2024-06-27 01:28:30.611789','2024-06-27 01:28:30.611789','Administrator','Administrator',0,0,'Iran','dd-mm-yyyy','HH:mm:ss','Asia/Tehran','ir',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Iraq','2024-06-27 01:28:30.611839','2024-06-27 01:28:30.611839','Administrator','Administrator',0,0,'Iraq','dd-mm-yyyy','HH:mm:ss','Asia/Baghdad','iq',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Ireland','2024-06-27 01:28:30.611888','2024-06-27 01:28:30.611888','Administrator','Administrator',0,0,'Ireland','dd-mm-yyyy','HH:mm:ss','Europe/Dublin','ie',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Isle of Man','2024-06-27 01:28:30.611938','2024-06-27 01:28:30.611938','Administrator','Administrator',0,0,'Isle of Man','dd-mm-yyyy','HH:mm:ss','Europe/London','im',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Israel','2024-06-27 01:28:30.611987','2024-06-27 01:28:30.611987','Administrator','Administrator',0,0,'Israel','dd-mm-yyyy','HH:mm:ss','Asia/Jerusalem','il',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Italy','2024-06-27 01:28:30.612037','2024-06-27 01:28:30.612037','Administrator','Administrator',0,0,'Italy','dd/mm/yyyy','HH:mm:ss','Europe/Rome','it',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Ivory Coast','2024-06-27 01:28:30.612086','2024-06-27 01:28:30.612086','Administrator','Administrator',0,0,'Ivory Coast','dd-mm-yyyy','HH:mm:ss','','ci',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Jamaica','2024-06-27 01:28:30.612135','2024-06-27 01:28:30.612135','Administrator','Administrator',0,0,'Jamaica','dd-mm-yyyy','HH:mm:ss','America/Jamaica','jm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Japan','2024-06-27 01:28:30.612184','2024-06-27 01:28:30.612184','Administrator','Administrator',0,0,'Japan','dd-mm-yyyy','HH:mm:ss','Asia/Tokyo','jp',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Jersey','2024-06-27 01:28:30.612234','2024-06-27 01:28:30.612234','Administrator','Administrator',0,0,'Jersey','dd-mm-yyyy','HH:mm:ss','Europe/London','je',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Jordan','2024-06-27 01:28:30.612283','2024-06-27 01:28:30.612283','Administrator','Administrator',0,0,'Jordan','dd-mm-yyyy','HH:mm:ss','Asia/Amman','jo',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Kazakhstan','2024-06-27 01:28:30.612332','2024-06-27 01:28:30.612332','Administrator','Administrator',0,0,'Kazakhstan','dd-mm-yyyy','HH:mm:ss','Asia/Almaty\nAsia/Aqtau\nAsia/Aqtobe\nAsia/Oral\nAsia/Qyzylorda','kz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Kenya','2024-06-27 01:28:30.612386','2024-06-27 01:28:30.612386','Administrator','Administrator',0,0,'Kenya','dd-mm-yyyy','HH:mm:ss','Africa/Nairobi','ke',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Kiribati','2024-06-27 01:28:30.612437','2024-06-27 01:28:30.612437','Administrator','Administrator',0,0,'Kiribati','dd-mm-yyyy','HH:mm:ss','Pacific/Enderbury\nPacific/Kiritimati\nPacific/Tarawa','ki',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Korea, Democratic Peoples Republic of','2024-06-27 01:28:30.612487','2024-06-27 01:28:30.612487','Administrator','Administrator',0,0,'Korea, Democratic Peoples Republic of','dd-mm-yyyy','HH:mm:ss','','kp',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Korea, Republic of','2024-06-27 01:28:30.612536','2024-06-27 01:28:30.612536','Administrator','Administrator',0,0,'Korea, Republic of','dd-mm-yyyy','HH:mm:ss','','kr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Kuwait','2024-06-27 01:28:30.612585','2024-06-27 01:28:30.612585','Administrator','Administrator',0,0,'Kuwait','dd-mm-yyyy','HH:mm:ss','Asia/Kuwait','kw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Kyrgyzstan','2024-06-27 01:28:30.612634','2024-06-27 01:28:30.612634','Administrator','Administrator',0,0,'Kyrgyzstan','dd-mm-yyyy','HH:mm:ss','Asia/Bishkek','kg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Lao Peoples Democratic Republic','2024-06-27 01:28:30.612684','2024-06-27 01:28:30.612684','Administrator','Administrator',0,0,'Lao Peoples Democratic Republic','dd-mm-yyyy','HH:mm:ss','Asia/Vientiane','la',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Latvia','2024-06-27 01:28:30.612733','2024-06-27 01:28:30.612733','Administrator','Administrator',0,0,'Latvia','dd-mm-yyyy','HH:mm:ss','Europe/Riga','lv',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Lebanon','2024-06-27 01:28:30.612789','2024-06-27 01:28:30.612789','Administrator','Administrator',0,0,'Lebanon','dd-mm-yyyy','HH:mm:ss','Asia/Beirut','lb',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Lesotho','2024-06-27 01:28:30.612883','2024-06-27 01:28:30.612883','Administrator','Administrator',0,0,'Lesotho','dd-mm-yyyy','HH:mm:ss','Africa/Maseru','ls',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Liberia','2024-06-27 01:28:30.612951','2024-06-27 01:28:30.612951','Administrator','Administrator',0,0,'Liberia','dd-mm-yyyy','HH:mm:ss','Africa/Monrovia','lr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Libya','2024-06-27 01:28:30.613002','2024-06-27 01:28:30.613002','Administrator','Administrator',0,0,'Libya','dd-mm-yyyy','HH:mm:ss','Africa/Tripoli','ly',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Liechtenstein','2024-06-27 01:28:30.613053','2024-06-27 01:28:30.613053','Administrator','Administrator',0,0,'Liechtenstein','dd-mm-yyyy','HH:mm:ss','Europe/Vaduz','li',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Lithuania','2024-06-27 01:28:30.613104','2024-06-27 01:28:30.613104','Administrator','Administrator',0,0,'Lithuania','yyyy-mm-dd','HH:mm:ss','Europe/Vilnius','lt',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Luxembourg','2024-06-27 01:28:30.613154','2024-06-27 01:28:30.613154','Administrator','Administrator',0,0,'Luxembourg','dd-mm-yyyy','HH:mm:ss','Europe/Luxembourg','lu',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Macao','2024-06-27 01:28:30.613204','2024-06-27 01:28:30.613204','Administrator','Administrator',0,0,'Macao','dd-mm-yyyy','HH:mm:ss','','mo',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Macedonia','2024-06-27 01:28:30.613254','2024-06-27 01:28:30.613254','Administrator','Administrator',0,0,'Macedonia','dd-mm-yyyy','HH:mm:ss','','mk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Madagascar','2024-06-27 01:28:30.613305','2024-06-27 01:28:30.613305','Administrator','Administrator',0,0,'Madagascar','dd-mm-yyyy','HH:mm:ss','Indian/Antananarivo','mg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Malawi','2024-06-27 01:28:30.613356','2024-06-27 01:28:30.613356','Administrator','Administrator',0,0,'Malawi','dd-mm-yyyy','HH:mm:ss','Africa/Blantyre','mw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Malaysia','2024-06-27 01:28:30.613406','2024-06-27 01:28:30.613406','Administrator','Administrator',0,0,'Malaysia','dd-mm-yyyy','HH:mm:ss','Asia/Kuala_Lumpur\nAsia/Kuching','my',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Maldives','2024-06-27 01:28:30.613456','2024-06-27 01:28:30.613456','Administrator','Administrator',0,0,'Maldives','dd-mm-yyyy','HH:mm:ss','Indian/Maldives','mv',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Mali','2024-06-27 01:28:30.613506','2024-06-27 01:28:30.613506','Administrator','Administrator',0,0,'Mali','dd-mm-yyyy','HH:mm:ss','Africa/Bamako','ml',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Malta','2024-06-27 01:28:30.613556','2024-06-27 01:28:30.613556','Administrator','Administrator',0,0,'Malta','dd/mm/yyyy','HH:mm:ss','Europe/Malta','mt',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Marshall Islands','2024-06-27 01:28:30.613606','2024-06-27 01:28:30.613606','Administrator','Administrator',0,0,'Marshall Islands','dd-mm-yyyy','HH:mm:ss','Pacific/Kwajalein\nPacific/Majuro','mh',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Martinique','2024-06-27 01:28:30.613656','2024-06-27 01:28:30.613656','Administrator','Administrator',0,0,'Martinique','dd-mm-yyyy','HH:mm:ss','America/Martinique','mq',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Mauritania','2024-06-27 01:28:30.613705','2024-06-27 01:28:30.613705','Administrator','Administrator',0,0,'Mauritania','dd-mm-yyyy','HH:mm:ss','Africa/Nouakchott','mr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Mauritius','2024-06-27 01:28:30.613755','2024-06-27 01:28:30.613755','Administrator','Administrator',0,0,'Mauritius','dd-mm-yyyy','HH:mm:ss','Indian/Mauritius','mu',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Mayotte','2024-06-27 01:28:30.613805','2024-06-27 01:28:30.613805','Administrator','Administrator',0,0,'Mayotte','dd-mm-yyyy','HH:mm:ss','Indian/Mayotte','yt',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Mexico','2024-06-27 01:28:30.613854','2024-06-27 01:28:30.613854','Administrator','Administrator',0,0,'Mexico','dd-mm-yyyy','HH:mm:ss','America/Bahia_Banderas\nAmerica/Cancun\nAmerica/Chihuahua\nAmerica/Hermosillo\nAmerica/Matamoros\nAmerica/Mazatlan\nAmerica/Merida\nAmerica/Mexico_City\nAmerica/Monterrey\nAmerica/Ojinaga\nAmerica/Santa_Isabel\nAmerica/Tijuana','mx',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Micronesia, Federated States of','2024-06-27 01:28:30.613903','2024-06-27 01:28:30.613903','Administrator','Administrator',0,0,'Micronesia, Federated States of','dd-mm-yyyy','HH:mm:ss','','fm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Moldova, Republic of','2024-06-27 01:28:30.613952','2024-06-27 01:28:30.613952','Administrator','Administrator',0,0,'Moldova, Republic of','dd-mm-yyyy','HH:mm:ss','','md',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Monaco','2024-06-27 01:28:30.614002','2024-06-27 01:28:30.614002','Administrator','Administrator',0,0,'Monaco','dd-mm-yyyy','HH:mm:ss','Europe/Monaco','mc',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Mongolia','2024-06-27 01:28:30.614051','2024-06-27 01:28:30.614051','Administrator','Administrator',0,0,'Mongolia','yyyy-mm-dd','HH:mm:ss','Asia/Choibalsan\nAsia/Hovd\nAsia/Ulaanbaatar','mn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Montenegro','2024-06-27 01:28:30.614100','2024-06-27 01:28:30.614100','Administrator','Administrator',0,0,'Montenegro','dd-mm-yyyy','HH:mm:ss','Europe/Belgrade','me',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Montserrat','2024-06-27 01:28:30.614149','2024-06-27 01:28:30.614149','Administrator','Administrator',0,0,'Montserrat','dd-mm-yyyy','HH:mm:ss','America/Montserrat','ms',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Morocco','2024-06-27 01:28:30.614198','2024-06-27 01:28:30.614198','Administrator','Administrator',0,0,'Morocco','dd-mm-yyyy','HH:mm:ss','Africa/Casablanca','ma',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Mozambique','2024-06-27 01:28:30.614247','2024-06-27 01:28:30.614247','Administrator','Administrator',0,0,'Mozambique','dd-mm-yyyy','HH:mm:ss','Africa/Maputo','mz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Myanmar','2024-06-27 01:28:30.614296','2024-06-27 01:28:30.614296','Administrator','Administrator',0,0,'Myanmar','dd-mm-yyyy','HH:mm:ss','Asia/Rangoon','mm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Namibia','2024-06-27 01:28:30.614345','2024-06-27 01:28:30.614345','Administrator','Administrator',0,0,'Namibia','dd-mm-yyyy','HH:mm:ss','Africa/Windhoek','na',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Nauru','2024-06-27 01:28:30.614394','2024-06-27 01:28:30.614394','Administrator','Administrator',0,0,'Nauru','dd-mm-yyyy','HH:mm:ss','Pacific/Nauru','nr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Nepal','2024-06-27 01:28:30.614443','2024-06-27 01:28:30.614443','Administrator','Administrator',0,0,'Nepal','dd-mm-yyyy','HH:mm:ss','Asia/Kathmandu','np',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Netherlands','2024-06-27 01:28:30.614492','2024-06-27 01:28:30.614492','Administrator','Administrator',0,0,'Netherlands','dd-mm-yyyy','HH:mm:ss','Europe/Amsterdam','nl',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('New Caledonia','2024-06-27 01:28:30.614541','2024-06-27 01:28:30.614541','Administrator','Administrator',0,0,'New Caledonia','dd-mm-yyyy','HH:mm:ss','Pacific/Noumea','nc',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('New Zealand','2024-06-27 01:28:30.614590','2024-06-27 01:28:30.614590','Administrator','Administrator',0,0,'New Zealand','dd-mm-yyyy','HH:mm:ss','Pacific/Auckland\nPacific/Chatham','nz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Nicaragua','2024-06-27 01:28:30.614639','2024-06-27 01:28:30.614639','Administrator','Administrator',0,0,'Nicaragua','dd-mm-yyyy','HH:mm:ss','America/Managua','ni',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Niger','2024-06-27 01:28:30.614688','2024-06-27 01:28:30.614688','Administrator','Administrator',0,0,'Niger','dd-mm-yyyy','HH:mm:ss','Africa/Niamey','ne',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Nigeria','2024-06-27 01:28:30.614737','2024-06-27 01:28:30.614737','Administrator','Administrator',0,0,'Nigeria','dd-mm-yyyy','HH:mm:ss','Africa/Lagos','ng',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Niue','2024-06-27 01:28:30.614786','2024-06-27 01:28:30.614786','Administrator','Administrator',0,0,'Niue','dd-mm-yyyy','HH:mm:ss','Pacific/Niue','nu',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Norfolk Island','2024-06-27 01:28:30.614860','2024-06-27 01:28:30.614860','Administrator','Administrator',0,0,'Norfolk Island','dd-mm-yyyy','HH:mm:ss','Pacific/Norfolk','nf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Northern Mariana Islands','2024-06-27 01:28:30.614917','2024-06-27 01:28:30.614917','Administrator','Administrator',0,0,'Northern Mariana Islands','dd-mm-yyyy','HH:mm:ss','Pacific/Saipan','mp',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Norway','2024-06-27 01:28:30.614967','2024-06-27 01:28:30.614967','Administrator','Administrator',0,0,'Norway','dd-mm-yyyy','HH:mm:ss','Europe/Oslo','no',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Oman','2024-06-27 01:28:30.615023','2024-06-27 01:28:30.615023','Administrator','Administrator',0,0,'Oman','dd-mm-yyyy','HH:mm:ss','Asia/Muscat','om',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Pakistan','2024-06-27 01:28:30.615074','2024-06-27 01:28:30.615074','Administrator','Administrator',0,0,'Pakistan','dd-mm-yyyy','HH:mm:ss','Asia/Karachi','pk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Palau','2024-06-27 01:28:30.615125','2024-06-27 01:28:30.615125','Administrator','Administrator',0,0,'Palau','mm-dd-yyyy','HH:mm:ss','Pacific/Palau','pw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Palestinian Territory, Occupied','2024-06-27 01:28:30.615174','2024-06-27 01:28:30.615174','Administrator','Administrator',0,0,'Palestinian Territory, Occupied','dd-mm-yyyy','HH:mm:ss','Asia/Hebron\nAsia/Jerusalem','ps',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Panama','2024-06-27 01:28:30.615224','2024-06-27 01:28:30.615224','Administrator','Administrator',0,0,'Panama','dd-mm-yyyy','HH:mm:ss','America/Panama','pa',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Papua New Guinea','2024-06-27 01:28:30.615273','2024-06-27 01:28:30.615273','Administrator','Administrator',0,0,'Papua New Guinea','dd-mm-yyyy','HH:mm:ss','Pacific/Port_Moresby','pg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Paraguay','2024-06-27 01:28:30.615361','2024-06-27 01:28:30.615361','Administrator','Administrator',0,0,'Paraguay','dd-mm-yyyy','HH:mm:ss','America/Asuncion','py',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Peru','2024-06-27 01:28:30.615413','2024-06-27 01:28:30.615413','Administrator','Administrator',0,0,'Peru','dd-mm-yyyy','HH:mm:ss','America/Lima','pe',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Philippines','2024-06-27 01:28:30.615464','2024-06-27 01:28:30.615464','Administrator','Administrator',0,0,'Philippines','mm-dd-yyyy','HH:mm:ss','Asia/Manila','ph',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Pitcairn','2024-06-27 01:28:30.615514','2024-06-27 01:28:30.615514','Administrator','Administrator',0,0,'Pitcairn','dd-mm-yyyy','HH:mm:ss','Pacific/Pitcairn','pn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Poland','2024-06-27 01:28:30.615564','2024-06-27 01:28:30.615564','Administrator','Administrator',0,0,'Poland','dd-mm-yyyy','HH:mm:ss','Europe/Warsaw','pl',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Portugal','2024-06-27 01:28:30.615613','2024-06-27 01:28:30.615613','Administrator','Administrator',0,0,'Portugal','dd-mm-yyyy','HH:mm:ss','Atlantic/Azores\nAtlantic/Madeira\nEurope/Lisbon','pt',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Puerto Rico','2024-06-27 01:28:30.615663','2024-06-27 01:28:30.615663','Administrator','Administrator',0,0,'Puerto Rico','dd-mm-yyyy','HH:mm:ss','America/Puerto_Rico','pr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Qatar','2024-06-27 01:28:30.615713','2024-06-27 01:28:30.615713','Administrator','Administrator',0,0,'Qatar','dd-mm-yyyy','HH:mm:ss','Asia/Qatar','qa',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Réunion','2024-06-27 01:28:30.615911','2024-06-27 01:28:30.615911','Administrator','Administrator',0,0,'Réunion','dd-mm-yyyy','HH:mm:ss','','re',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Romania','2024-06-27 01:28:30.615762','2024-06-27 01:28:30.615762','Administrator','Administrator',0,0,'Romania','dd-mm-yyyy','HH:mm:ss','Europe/Bucharest','ro',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Russian Federation','2024-06-27 01:28:30.615811','2024-06-27 01:28:30.615811','Administrator','Administrator',0,0,'Russian Federation','dd-mm-yyyy','HH:mm:ss','','ru',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Rwanda','2024-06-27 01:28:30.615861','2024-06-27 01:28:30.615861','Administrator','Administrator',0,0,'Rwanda','dd-mm-yyyy','HH:mm:ss','Africa/Kigali','rw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saint Barthélemy','2024-06-27 01:28:30.615961','2024-06-27 01:28:30.615961','Administrator','Administrator',0,0,'Saint Barthélemy','dd-mm-yyyy','HH:mm:ss','','bl',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saint Helena, Ascension and Tristan da Cunha','2024-06-27 01:28:30.616011','2024-06-27 01:28:30.616011','Administrator','Administrator',0,0,'Saint Helena, Ascension and Tristan da Cunha','dd-mm-yyyy','HH:mm:ss','','sh',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saint Kitts and Nevis','2024-06-27 01:28:30.616060','2024-06-27 01:28:30.616060','Administrator','Administrator',0,0,'Saint Kitts and Nevis','dd-mm-yyyy','HH:mm:ss','America/St_Kitts','kn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saint Lucia','2024-06-27 01:28:30.616109','2024-06-27 01:28:30.616109','Administrator','Administrator',0,0,'Saint Lucia','dd-mm-yyyy','HH:mm:ss','America/St_Lucia','lc',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saint Martin (French part)','2024-06-27 01:28:30.616159','2024-06-27 01:28:30.616159','Administrator','Administrator',0,0,'Saint Martin (French part)','dd-mm-yyyy','HH:mm:ss','','mf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saint Pierre and Miquelon','2024-06-27 01:28:30.616208','2024-06-27 01:28:30.616208','Administrator','Administrator',0,0,'Saint Pierre and Miquelon','dd-mm-yyyy','HH:mm:ss','','pm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saint Vincent and the Grenadines','2024-06-27 01:28:30.616258','2024-06-27 01:28:30.616258','Administrator','Administrator',0,0,'Saint Vincent and the Grenadines','dd-mm-yyyy','HH:mm:ss','America/St_Vincent','vc',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Samoa','2024-06-27 01:28:30.616307','2024-06-27 01:28:30.616307','Administrator','Administrator',0,0,'Samoa','dd-mm-yyyy','HH:mm:ss','Pacific/Apia','ws',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('San Marino','2024-06-27 01:28:30.616357','2024-06-27 01:28:30.616357','Administrator','Administrator',0,0,'San Marino','dd-mm-yyyy','HH:mm:ss','Europe/Rome','sm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Sao Tome and Principe','2024-06-27 01:28:30.616406','2024-06-27 01:28:30.616406','Administrator','Administrator',0,0,'Sao Tome and Principe','dd-mm-yyyy','HH:mm:ss','','st',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Saudi Arabia','2024-06-27 01:28:30.616455','2024-06-27 01:28:30.616455','Administrator','Administrator',0,0,'Saudi Arabia','dd-mm-yyyy','HH:mm:ss','Asia/Riyadh','sa',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Senegal','2024-06-27 01:28:30.616505','2024-06-27 01:28:30.616505','Administrator','Administrator',0,0,'Senegal','dd-mm-yyyy','HH:mm:ss','Africa/Dakar','sn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Serbia','2024-06-27 01:28:30.616554','2024-06-27 01:28:30.616554','Administrator','Administrator',0,0,'Serbia','dd-mm-yyyy','HH:mm:ss','Europe/Belgrade','rs',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Seychelles','2024-06-27 01:28:30.616604','2024-06-27 01:28:30.616604','Administrator','Administrator',0,0,'Seychelles','dd-mm-yyyy','HH:mm:ss','Indian/Mahe','sc',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Sierra Leone','2024-06-27 01:28:30.616653','2024-06-27 01:28:30.616653','Administrator','Administrator',0,0,'Sierra Leone','dd-mm-yyyy','HH:mm:ss','Africa/Freetown','sl',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Singapore','2024-06-27 01:28:30.616703','2024-06-27 01:28:30.616703','Administrator','Administrator',0,0,'Singapore','dd-mm-yyyy','HH:mm:ss','Asia/Singapore','sg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Sint Maarten (Dutch part)','2024-06-27 01:28:30.616753','2024-06-27 01:28:30.616753','Administrator','Administrator',0,0,'Sint Maarten (Dutch part)','dd-mm-yyyy','HH:mm:ss','','sx',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Slovakia','2024-06-27 01:28:30.616803','2024-06-27 01:28:30.616803','Administrator','Administrator',0,0,'Slovakia','dd-mm-yyyy','HH:mm:ss','Europe/Bratislava','sk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Slovenia','2024-06-27 01:28:30.616870','2024-06-27 01:28:30.616870','Administrator','Administrator',0,0,'Slovenia','dd-mm-yyyy','HH:mm:ss','Europe/Belgrade','si',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Solomon Islands','2024-06-27 01:28:30.616934','2024-06-27 01:28:30.616934','Administrator','Administrator',0,0,'Solomon Islands','dd-mm-yyyy','HH:mm:ss','Pacific/Guadalcanal','sb',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Somalia','2024-06-27 01:28:30.616986','2024-06-27 01:28:30.616986','Administrator','Administrator',0,0,'Somalia','dd-mm-yyyy','HH:mm:ss','Africa/Mogadishu','so',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('South Africa','2024-06-27 01:28:30.617037','2024-06-27 01:28:30.617037','Administrator','Administrator',0,0,'South Africa','yyyy-mm-dd','HH:mm:ss','Africa/Johannesburg','za',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('South Georgia and the South Sandwich Islands','2024-06-27 01:28:30.617087','2024-06-27 01:28:30.617087','Administrator','Administrator',0,0,'South Georgia and the South Sandwich Islands','dd-mm-yyyy','HH:mm:ss','','gs',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('South Sudan','2024-06-27 01:28:30.617136','2024-06-27 01:28:30.617136','Administrator','Administrator',0,0,'South Sudan','dd-mm-yyyy','HH:mm:ss','Africa/Juba','ss',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Spain','2024-06-27 01:28:30.617186','2024-06-27 01:28:30.617186','Administrator','Administrator',0,0,'Spain','dd-mm-yyyy','HH:mm:ss','Africa/Ceuta\nAtlantic/Canary\nEurope/Madrid','es',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Sri Lanka','2024-06-27 01:28:30.617236','2024-06-27 01:28:30.617236','Administrator','Administrator',0,0,'Sri Lanka','dd-mm-yyyy','HH:mm:ss','Asia/Colombo','lk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Sudan','2024-06-27 01:28:30.617285','2024-06-27 01:28:30.617285','Administrator','Administrator',0,0,'Sudan','dd-mm-yyyy','HH:mm:ss','Africa/Khartoum','sd',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Suriname','2024-06-27 01:28:30.617335','2024-06-27 01:28:30.617335','Administrator','Administrator',0,0,'Suriname','dd-mm-yyyy','HH:mm:ss','America/Paramaribo','sr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Svalbard and Jan Mayen','2024-06-27 01:28:30.617384','2024-06-27 01:28:30.617384','Administrator','Administrator',0,0,'Svalbard and Jan Mayen','dd-mm-yyyy','HH:mm:ss','','sj',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Swaziland','2024-06-27 01:28:30.617434','2024-06-27 01:28:30.617434','Administrator','Administrator',0,0,'Swaziland','dd-mm-yyyy','HH:mm:ss','Africa/Mbabane','sz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Sweden','2024-06-27 01:28:30.617483','2024-06-27 01:28:30.617483','Administrator','Administrator',0,0,'Sweden','dd-mm-yyyy','HH:mm:ss','Europe/Stockholm','se',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Switzerland','2024-06-27 01:28:30.617533','2024-06-27 01:28:30.617533','Administrator','Administrator',0,0,'Switzerland','dd-mm-yyyy','HH:mm:ss','Europe/Zurich','ch',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Syria','2024-06-27 01:28:30.617583','2024-06-27 01:28:30.617583','Administrator','Administrator',0,0,'Syria','dd-mm-yyyy','HH:mm:ss','','sy',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Taiwan','2024-06-27 01:28:30.617638','2024-06-27 01:28:30.617638','Administrator','Administrator',0,0,'Taiwan','yyyy-mm-dd','HH:mm:ss','','tw',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Tajikistan','2024-06-27 01:28:30.617689','2024-06-27 01:28:30.617689','Administrator','Administrator',0,0,'Tajikistan','dd-mm-yyyy','HH:mm:ss','Asia/Dushanbe','tj',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Tanzania','2024-06-27 01:28:30.617740','2024-06-27 01:28:30.617740','Administrator','Administrator',0,0,'Tanzania','dd-mm-yyyy','HH:mm:ss','Africa/Dar_es_Salaam','tz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Thailand','2024-06-27 01:28:30.617789','2024-06-27 01:28:30.617789','Administrator','Administrator',0,0,'Thailand','dd-mm-yyyy','HH:mm:ss','Asia/Bangkok','th',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Timor-Leste','2024-06-27 01:28:30.617839','2024-06-27 01:28:30.617839','Administrator','Administrator',0,0,'Timor-Leste','dd-mm-yyyy','HH:mm:ss','','tl',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Togo','2024-06-27 01:28:30.617888','2024-06-27 01:28:30.617888','Administrator','Administrator',0,0,'Togo','dd-mm-yyyy','HH:mm:ss','Africa/Lome','tg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Tokelau','2024-06-27 01:28:30.617938','2024-06-27 01:28:30.617938','Administrator','Administrator',0,0,'Tokelau','dd-mm-yyyy','HH:mm:ss','Pacific/Fakaofo','tk',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Tonga','2024-06-27 01:28:30.617987','2024-06-27 01:28:30.617987','Administrator','Administrator',0,0,'Tonga','dd-mm-yyyy','HH:mm:ss','Pacific/Tongatapu','to',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Trinidad and Tobago','2024-06-27 01:28:30.618037','2024-06-27 01:28:30.618037','Administrator','Administrator',0,0,'Trinidad and Tobago','dd-mm-yyyy','HH:mm:ss','America/Port_of_Spain','tt',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Tunisia','2024-06-27 01:28:30.618087','2024-06-27 01:28:30.618087','Administrator','Administrator',0,0,'Tunisia','dd-mm-yyyy','HH:mm:ss','Africa/Tunis','tn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Turkey','2024-06-27 01:28:30.618136','2024-06-27 01:28:30.618136','Administrator','Administrator',0,0,'Turkey','dd-mm-yyyy','HH:mm:ss','Europe/Istanbul','tr',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Turkmenistan','2024-06-27 01:28:30.618186','2024-06-27 01:28:30.618186','Administrator','Administrator',0,0,'Turkmenistan','dd-mm-yyyy','HH:mm:ss','Asia/Ashgabat','tm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Turks and Caicos Islands','2024-06-27 01:28:30.618234','2024-06-27 01:28:30.618234','Administrator','Administrator',0,0,'Turks and Caicos Islands','dd-mm-yyyy','HH:mm:ss','','tc',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Tuvalu','2024-06-27 01:28:30.618283','2024-06-27 01:28:30.618283','Administrator','Administrator',0,0,'Tuvalu','dd-mm-yyyy','HH:mm:ss','Pacific/Funafuti','tv',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Uganda','2024-06-27 01:28:30.618333','2024-06-27 01:28:30.618333','Administrator','Administrator',0,0,'Uganda','dd-mm-yyyy','HH:mm:ss','Africa/Kampala','ug',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Ukraine','2024-06-27 01:28:30.618382','2024-06-27 01:28:30.618382','Administrator','Administrator',0,0,'Ukraine','dd-mm-yyyy','HH:mm:ss','Europe/Kiev\nEurope/Simferopol\nEurope/Uzhgorod\nEurope/Zaporozhye','ua',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('United Arab Emirates','2024-06-27 01:28:30.618432','2024-06-27 01:28:30.618432','Administrator','Administrator',0,0,'United Arab Emirates','dd-mm-yyyy','HH:mm:ss','Asia/Dubai','ae',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('United Kingdom','2024-06-27 01:28:30.618481','2024-06-27 01:28:30.618481','Administrator','Administrator',0,0,'United Kingdom','dd-mm-yyyy','HH:mm:ss','Europe/London','gb',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('United States','2024-06-27 01:28:30.618530','2024-06-27 01:28:30.618530','Administrator','Administrator',0,0,'United States','mm-dd-yyyy','HH:mm:ss','America/Adak\nAmerica/Anchorage\nAmerica/Boise\nAmerica/Chicago\nAmerica/Denver\nAmerica/Detroit\nAmerica/Indiana/Indianapolis\nAmerica/Indiana/Knox\nAmerica/Indiana/Marengo\nAmerica/Indiana/Petersburg\nAmerica/Indiana/Tell_City\nAmerica/Indiana/Vevay\nAmerica/Indiana/Vincennes\nAmerica/Indiana/Winamac\nAmerica/Juneau\nAmerica/Kentucky/Louisville\nAmerica/Kentucky/Monticello\nAmerica/Los_Angeles\nAmerica/Menominee\nAmerica/Metlakatla\nAmerica/New_York\nAmerica/Nome\nAmerica/North_Dakota/Beulah\nAmerica/North_Dakota/Center\nAmerica/North_Dakota/New_Salem\nAmerica/Phoenix\nAmerica/Denver\nAmerica/Sitka\nAmerica/Yakutat\nPacific/Honolulu','us',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('United States Minor Outlying Islands','2024-06-27 01:28:30.618579','2024-06-27 01:28:30.618579','Administrator','Administrator',0,0,'United States Minor Outlying Islands','dd-mm-yyyy','HH:mm:ss','','um',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Uruguay','2024-06-27 01:28:30.618628','2024-06-27 01:28:30.618628','Administrator','Administrator',0,0,'Uruguay','dd-mm-yyyy','HH:mm:ss','America/Montevideo','uy',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Uzbekistan','2024-06-27 01:28:30.618677','2024-06-27 01:28:30.618677','Administrator','Administrator',0,0,'Uzbekistan','dd-mm-yyyy','HH:mm:ss','Asia/Samarkand\nAsia/Tashkent','uz',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Vanuatu','2024-06-27 01:28:30.618726','2024-06-27 01:28:30.618726','Administrator','Administrator',0,0,'Vanuatu','dd-mm-yyyy','HH:mm:ss','Pacific/Efate','vu',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Venezuela, Bolivarian Republic of','2024-06-27 01:28:30.618775','2024-06-27 01:28:30.618775','Administrator','Administrator',0,0,'Venezuela, Bolivarian Republic of','dd-mm-yyyy','HH:mm:ss','','ve',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Vietnam','2024-06-27 01:28:30.618824','2024-06-27 01:28:30.618824','Administrator','Administrator',0,0,'Vietnam','dd-mm-yyyy','HH:mm:ss','','vn',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Virgin Islands, British','2024-06-27 01:28:30.618880','2024-06-27 01:28:30.618880','Administrator','Administrator',0,0,'Virgin Islands, British','dd-mm-yyyy','HH:mm:ss','','vg',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Virgin Islands, U.S.','2024-06-27 01:28:30.618957','2024-06-27 01:28:30.618957','Administrator','Administrator',0,0,'Virgin Islands, U.S.','dd-mm-yyyy','HH:mm:ss','','vi',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Wallis and Futuna','2024-06-27 01:28:30.619023','2024-06-27 01:28:30.619023','Administrator','Administrator',0,0,'Wallis and Futuna','dd-mm-yyyy','HH:mm:ss','','wf',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Western Sahara','2024-06-27 01:28:30.619089','2024-06-27 01:28:30.619089','Administrator','Administrator',0,0,'Western Sahara','dd-mm-yyyy','HH:mm:ss','Africa/El_Aaiun','eh',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Yemen','2024-06-27 01:28:30.619139','2024-06-27 01:28:30.619139','Administrator','Administrator',0,0,'Yemen','dd-mm-yyyy','HH:mm:ss','Asia/Aden','ye',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Zambia','2024-06-27 01:28:30.619189','2024-06-27 01:28:30.619189','Administrator','Administrator',0,0,'Zambia','dd-mm-yyyy','HH:mm:ss','Africa/Lusaka','zm',NULL,NULL,NULL,NULL);
insert  into `plexCountry`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`country_name`,`date_format`,`time_format`,`time_zones`,`code`,`_user_tags`,`_comments`,`_assign`,`_liked_by`) values ('Zimbabwe','2024-06-27 01:28:30.619238','2024-06-27 01:28:30.619238','Administrator','Administrator',0,0,'Zimbabwe','dd-mm-yyyy','HH:mm:ss','Africa/Harare','zw',NULL,NULL,NULL,NULL);

/*Table structure for table `plexCurrency` */

DROP TABLE IF EXISTS `plexCurrency`;

CREATE TABLE `plexCurrency` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `code` varchar(3) NOT NULL,
  `decimal_places` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `display_symbol` varchar(10) DEFAULT NULL,
  `cur_name` varchar(50) NOT NULL,
  `internationalized_name_code` varchar(50) NOT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexCurrencyusers` (`modified_by`),
  KEY `plexCurrencyusers2` (`owner`),
  CONSTRAINT `plexCurrencyusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexCurrencyusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexCurrency` */

insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('AED','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'AED',2,NULL,NULL,'UAE Dirham','currency.AED','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('AFN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'AFN',2,NULL,NULL,'Afghanistan Afghani','currency.AFN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ALL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ALL',2,NULL,NULL,'Albanian Lek','currency.ALL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('AMD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'AMD',2,NULL,NULL,'Armenian Dram','currency.AMD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ANG','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ANG',2,NULL,NULL,'Netherlands Antillian Guilder','currency.ANG','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('AOA','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'AOA',2,NULL,NULL,'Angolan Kwanza','currency.AOA','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ARS','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ARS',2,NULL,'$','Argentine Peso','currency.ARS','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('AUD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'AUD',2,NULL,'A$','Australian Dollar','currency.AUD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('AWG','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'AWG',2,NULL,NULL,'Aruban Guilder','currency.AWG','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('AZM','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'AZM',2,NULL,NULL,'Azerbaijanian Manat','currency.AZM','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BAM','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BAM',2,NULL,NULL,'Bosnia and Herzegovina Convertible Marks','currency.BAM','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BBD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BBD',2,NULL,NULL,'Barbados Dollar','currency.BBD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BDT','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BDT',2,NULL,NULL,'Bangladesh Taka','currency.BDT','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BGN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BGN',2,NULL,NULL,'Bulgarian Lev','currency.BGN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BHD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BHD',3,NULL,NULL,'Bahraini Dinar','currency.BHD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BIF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BIF',0,NULL,NULL,'Burundi Franc','currency.BIF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BMD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BMD',2,NULL,NULL,'Bermudian Dollar','currency.BMD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BND','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BND',2,NULL,'B$','Brunei Dollar','currency.BND','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BOB','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BOB',2,NULL,'Bs.','Bolivian Boliviano','currency.BOB','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BRL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BRL',2,NULL,'R$','Brazilian Real','currency.BRL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BSD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BSD',2,NULL,NULL,'Bahamian Dollar','currency.BSD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BTN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BTN',2,NULL,NULL,'Bhutan Ngultrum','currency.BTN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BWP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BWP',2,NULL,NULL,'Botswana Pula','currency.BWP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BYR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BYR',0,NULL,NULL,'Belarussian Ruble','currency.BYR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('BZD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'BZD',2,NULL,'BZ$','Belize Dollar','currency.BZD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CAD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CAD',2,NULL,NULL,'Canadian Dollar','currency.CAD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CDF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CDF',2,NULL,NULL,'Franc Congolais','currency.CDF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CHF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CHF',2,NULL,NULL,'Swiss Franc','currency.CHF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CLP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CLP',0,NULL,'$','Chilean Peso','currency.CLP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CNY','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CNY',2,NULL,NULL,'Chinese Yuan Renminbi','currency.CNY','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('COP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'COP',2,NULL,'$','Colombian Peso','currency.COP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CRC','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CRC',2,NULL,'₡','Costa Rican Colon','currency.CRC','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CSD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CSD',2,NULL,NULL,'Serbian Dinar','currency.CSD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CUP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CUP',2,NULL,'$MN','Cuban Peso','currency.CUP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CVE','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CVE',2,NULL,NULL,'Cape Verde Escudo','currency.CVE','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CYP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CYP',2,NULL,NULL,'Cyprus Pound','currency.CYP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('CZK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'CZK',2,NULL,NULL,'Czech Koruna','currency.CZK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('DJF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'DJF',0,NULL,NULL,'Djibouti Franc','currency.DJF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('DKK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'DKK',2,NULL,NULL,'Danish Krone','currency.DKK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('DOP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'DOP',2,NULL,'RD$','Dominican Peso','currency.DOP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('DZD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'DZD',2,NULL,NULL,'Algerian Dinar','currency.DZD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('EEK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'EEK',2,NULL,NULL,'Estonian Kroon','currency.EEK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('EGP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'EGP',2,NULL,NULL,'Egyptian Pound','currency.EGP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ERN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ERN',2,NULL,NULL,'Eritrea Nafka','currency.ERN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ETB','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ETB',2,NULL,NULL,'Ethiopian Birr','currency.ETB','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('EUR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'EUR',2,NULL,'€','Euro','currency.EUR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('FJD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'FJD',2,NULL,NULL,'Fiji Dollar','currency.FJD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('FKP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'FKP',2,NULL,NULL,'Falkland Islands Pound','currency.FKP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GBP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GBP',2,NULL,NULL,'Pound Sterling','currency.GBP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GEL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GEL',2,NULL,NULL,'Georgian Lari','currency.GEL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GHC','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GHC',2,NULL,'GHc','Ghana Cedi','currency.GHC','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GIP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GIP',2,NULL,NULL,'Gibraltar Pound','currency.GIP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GMD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GMD',2,NULL,NULL,'Gambian Dalasi','currency.GMD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GNF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GNF',0,NULL,NULL,'Guinea Franc','currency.GNF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GTQ','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GTQ',2,NULL,'Q','Guatemala Quetzal','currency.GTQ','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('GYD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'GYD',2,NULL,NULL,'Guyana Dollar','currency.GYD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('HKD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'HKD',2,NULL,NULL,'Hong Kong Dollar','currency.HKD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('HNL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'HNL',2,NULL,'L','Honduras Lempira','currency.HNL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('HRK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'HRK',2,NULL,NULL,'Croatian Kuna','currency.HRK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('HTG','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'HTG',2,NULL,'G','Haiti Gourde','currency.HTG','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('HUF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'HUF',2,NULL,NULL,'Hungarian Forint','currency.HUF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('IDR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'IDR',2,NULL,NULL,'Indonesian Rupiah','currency.IDR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ILS','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ILS',2,NULL,NULL,'New Israeli Shekel','currency.ILS','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('INR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'INR',2,NULL,'₹','Indian Rupee','currency.INR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('IQD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'IQD',3,NULL,NULL,'Iraqi Dinar','currency.IQD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('IRR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'IRR',2,NULL,NULL,'Iranian Rial','currency.IRR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ISK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ISK',0,NULL,NULL,'Iceland Krona','currency.ISK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('JMD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'JMD',2,NULL,NULL,'Jamaican Dollar','currency.JMD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('JOD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'JOD',3,NULL,NULL,'Jordanian Dinar','currency.JOD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('JPY','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'JPY',0,NULL,NULL,'Japanese Yen','currency.JPY','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KES','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KES',2,NULL,'KSh','Kenyan Shilling','currency.KES','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KGS','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KGS',2,NULL,NULL,'Kyrgyzstan Som','currency.KGS','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KHR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KHR',2,NULL,NULL,'Cambodia Riel','currency.KHR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KMF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KMF',0,NULL,NULL,'Comoro Franc','currency.KMF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KPW','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KPW',2,NULL,NULL,'North Korean Won','currency.KPW','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KRW','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KRW',0,NULL,NULL,'Korean Won','currency.KRW','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KWD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KWD',3,NULL,NULL,'Kuwaiti Dinar','currency.KWD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KYD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KYD',2,NULL,NULL,'Cayman Islands Dollar','currency.KYD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('KZT','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'KZT',2,NULL,NULL,'Kazakhstan Tenge','currency.KZT','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LAK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LAK',2,NULL,NULL,'Lao Kip','currency.LAK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LBP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LBP',2,NULL,'L£','Lebanese Pound','currency.LBP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LKR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LKR',2,NULL,NULL,'Sri Lanka Rupee','currency.LKR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LRD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LRD',2,NULL,NULL,'Liberian Dollar','currency.LRD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LSL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LSL',2,NULL,NULL,'Lesotho Loti','currency.LSL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LTL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LTL',2,NULL,NULL,'Lithuanian Litas','currency.LTL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LVL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LVL',2,NULL,NULL,'Latvian Lats','currency.LVL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('LYD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'LYD',3,NULL,NULL,'Libyan Dinar','currency.LYD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MAD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MAD',2,NULL,NULL,'Moroccan Dirham','currency.MAD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MDL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MDL',2,NULL,NULL,'Moldovan Leu','currency.MDL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MGA','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MGA',2,NULL,NULL,'Malagasy Ariary','currency.MGA','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MKD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MKD',2,NULL,NULL,'Macedonian Denar','currency.MKD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MMK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MMK',2,NULL,'K','Myanmar Kyat','currency.MMK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MNT','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MNT',2,NULL,NULL,'Mongolian Tugrik','currency.MNT','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MOP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MOP',2,NULL,NULL,'Macau Pataca','currency.MOP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MRO','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MRO',2,NULL,NULL,'Mauritania Ouguiya','currency.MRO','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MTL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MTL',2,NULL,NULL,'Maltese Lira','currency.MTL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MUR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MUR',2,NULL,NULL,'Mauritius Rupee','currency.MUR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MVR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MVR',2,NULL,NULL,'Maldives Rufiyaa','currency.MVR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MWK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MWK',2,NULL,NULL,'Malawi Kwacha','currency.MWK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MXN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MXN',2,NULL,'$','Mexican Peso','currency.MXN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MYR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MYR',2,NULL,NULL,'Malaysian Ringgit','currency.MYR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('MZM','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'MZM',2,NULL,NULL,'Mozambique Metical','currency.MZM','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('NAD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'NAD',2,NULL,NULL,'Namibia Dollar','currency.NAD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('NGN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'NGN',2,NULL,NULL,'Nigerian Naira','currency.NGN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('NIO','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'NIO',2,NULL,'C$','Nicaragua Cordoba Oro','currency.NIO','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('NOK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'NOK',2,NULL,NULL,'Norwegian Krone','currency.NOK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('NPR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'NPR',2,NULL,NULL,'Nepalese Rupee','currency.NPR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('NZD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'NZD',2,NULL,NULL,'New Zealand Dollar','currency.NZD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('OMR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'OMR',3,NULL,NULL,'Rial Omani','currency.OMR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('PAB','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'PAB',2,NULL,'B/.','Panama Balboa','currency.PAB','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('PEN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'PEN',2,NULL,'S/.','Peruvian Nuevo Sol','currency.PEN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('PGK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'PGK',2,NULL,NULL,'Papua New Guinea Kina','currency.PGK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('PHP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'PHP',2,NULL,NULL,'Philippine Peso','currency.PHP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('PKR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'PKR',2,NULL,NULL,'Pakistan Rupee','currency.PKR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('PLN','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'PLN',2,NULL,NULL,'Polish Zloty','currency.PLN','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('PYG','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'PYG',0,NULL,'₲','Paraguayan Guarani','currency.PYG','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('QAR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'QAR',2,NULL,NULL,'Qatari Rial','currency.QAR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('RON','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'RON',2,NULL,NULL,'Romanian Leu','currency.RON','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('RUB','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'RUB',2,NULL,NULL,'Russian Ruble','currency.RUB','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('RWF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'RWF',0,NULL,NULL,'Rwanda Franc','currency.RWF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SAR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SAR',2,NULL,NULL,'Saudi Riyal','currency.SAR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SBD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SBD',2,NULL,NULL,'Solomon Islands Dollar','currency.SBD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SCR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SCR',2,NULL,NULL,'Seychelles Rupee','currency.SCR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SDD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SDD',2,NULL,NULL,'Sudanese Dinar','currency.SDD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SEK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SEK',2,NULL,NULL,'Swedish Krona','currency.SEK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SGD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SGD',2,NULL,NULL,'Singapore Dollar','currency.SGD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SHP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SHP',2,NULL,NULL,'St Helena Pound','currency.SHP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SIT','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SIT',2,NULL,NULL,'Slovenian Tolar','currency.SIT','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SKK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SKK',2,NULL,NULL,'Slovak Koruna','currency.SKK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SLL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SLL',2,NULL,NULL,'Sierra Leone Leone','currency.SLL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SOS','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SOS',2,NULL,NULL,'Somali Shilling','currency.SOS','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SRD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SRD',2,NULL,NULL,'Surinam Dollar','currency.SRD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SSP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SSP',2,NULL,'SS£','South Sudanese Pound','currency.SSP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('STD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'STD',2,NULL,NULL,'Sao Tome and Principe Dobra','currency.STD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SVC','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SVC',2,NULL,NULL,'El Salvador Colon','currency.SVC','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SYP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SYP',2,NULL,NULL,'Syrian Pound','currency.SYP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('SZL','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'SZL',2,NULL,NULL,'Eswatini Lilangeni','currency.SZL','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('THB','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'THB',2,NULL,NULL,'Thai Baht','currency.THB','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TJS','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TJS',2,NULL,NULL,'Tajik Somoni','currency.TJS','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TMM','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TMM',2,NULL,NULL,'Turkmenistan Manat','currency.TMM','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TND','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TND',3,NULL,'DT','Tunisian Dinar','currency.TND','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TOP','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TOP',2,NULL,NULL,'Tonga Pa\'anga','currency.TOP','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TRY','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TRY',2,NULL,NULL,'Turkish Lira','currency.TRY','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TTD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TTD',2,NULL,NULL,'Trinidad and Tobago Dollar','currency.TTD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TWD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TWD',2,NULL,NULL,'New Taiwan Dollar','currency.TWD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('TZS','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'TZS',2,NULL,NULL,'Tanzanian Shilling','currency.TZS','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('UAH','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'UAH',2,NULL,NULL,'Ukraine Hryvnia','currency.UAH','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('UGX','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'UGX',2,NULL,'USh','Uganda Shilling','currency.UGX','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('USD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'USD',2,NULL,'$','US Dollar','currency.USD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('UYU','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'UYU',2,NULL,'$U','Peso Uruguayo','currency.UYU','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('UZS','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'UZS',2,NULL,NULL,'Uzbekistan Sum','currency.UZS','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('VEB','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'VEB',2,NULL,'Bs.F.','Venezuelan Bolivar','currency.VEB','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('VND','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'VND',2,NULL,NULL,'Vietnamese Dong','currency.VND','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('VUV','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'VUV',0,NULL,NULL,'Vanuatu Vatu','currency.VUV','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('WST','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'WST',2,NULL,NULL,'Samoa Tala','currency.WST','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('XAF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'XAF',0,NULL,NULL,'CFA Franc BEAC','currency.XAF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('XCD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'XCD',2,NULL,NULL,'East Caribbean Dollar','currency.XCD','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('XDR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'XDR',5,NULL,NULL,'SDR (Special Drawing Rights)','currency.XDR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('XOF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'XOF',0,NULL,'CFA','CFA Franc BCEAO','currency.XOF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('XPF','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'XPF',0,NULL,NULL,'CFP Franc','currency.XPF','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('YER','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'YER',2,NULL,NULL,'Yemeni Rial','currency.YER','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ZAR','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ZAR',2,NULL,'R','South African Rand','currency.ZAR','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ZMK','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ZMK',2,NULL,NULL,'Zambian Kwacha','currency.ZMK','',0);
insert  into `plexCurrency`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`code`,`decimal_places`,`currency_multiplesof`,`display_symbol`,`cur_name`,`internationalized_name_code`,`sig`,`sig_status`) values ('ZWD','2024-07-11 17:04:39.000000','2024-07-11 17:04:39.000000','Administrator','Administrator',0,0,'ZWD',2,NULL,NULL,'Zimbabwe Dollar','currency.ZWD','',0);

/*Table structure for table `plexDocument` */

DROP TABLE IF EXISTS `plexDocument`;

CREATE TABLE `plexDocument` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `parent_entity_type` varchar(50) NOT NULL,
  `parent_entity_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `size` int(11) DEFAULT 0,
  `type` varchar(500) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `location` varchar(500) NOT NULL DEFAULT '0',
  `storage_type_enum` smallint(6) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexDocumentusers` (`modified_by`),
  KEY `plexDocumentusers2` (`owner`),
  CONSTRAINT `plexDocumentusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexDocumentusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexDocument` */

/*Table structure for table `plexEmployer` */

DROP TABLE IF EXISTS `plexEmployer`;

CREATE TABLE `plexEmployer` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexEmployerAddress` (`address`),
  CONSTRAINT `plexEployerAddress` FOREIGN KEY (`address`) REFERENCES `plexAddress` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexEmployer` */

/*Table structure for table `plexGroupMember` */

DROP TABLE IF EXISTS `plexGroupMember`;

CREATE TABLE `plexGroupMember` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `group` varchar(140) DEFAULT NULL,
  `member` varchar(140) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexGroupMemberusers` (`modified_by`),
  KEY `plexGroupMemberusers2` (`owner`),
  KEY `plexGroupMemberGroup` (`group`),
  KEY `plexGroupMember` (`member`),
  CONSTRAINT `plexGroupMember` FOREIGN KEY (`member`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexGroupMemberGroup` FOREIGN KEY (`group`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexGroupMemberusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexGroupMemberusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexGroupMember` */

/*Table structure for table `plexGuarantor` */

DROP TABLE IF EXISTS `plexGuarantor`;

CREATE TABLE `plexGuarantor` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `loan` varchar(140) DEFAULT NULL,
  `guarantor` varchar(140) DEFAULT NULL,
  `release_date` varchar(140) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexGuarantorusers` (`modified_by`),
  KEY `plexGuarantorusers2` (`owner`),
  KEY `plexGuarantorLoan` (`loan`),
  KEY `plexGuarantor` (`guarantor`),
  CONSTRAINT `plexGuarantor` FOREIGN KEY (`guarantor`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexGuarantorLoan` FOREIGN KEY (`loan`) REFERENCES `plexLoan` (`name`),
  CONSTRAINT `plexGuarantorusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexGuarantorusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexGuarantor` */

/*Table structure for table `plexLoan` */

DROP TABLE IF EXISTS `plexLoan`;

CREATE TABLE `plexLoan` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `account_no` varchar(140) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `client_id` varchar(140) DEFAULT NULL,
  `isGroup` int(10) DEFAULT NULL,
  `product_id` varchar(140) DEFAULT NULL,
  `loan_account` varchar(140) DEFAULT NULL,
  `fund_id` bigint(20) DEFAULT NULL,
  `loan_officer_id` varchar(140) DEFAULT NULL,
  `loanpurpose_cv_id` int(11) DEFAULT NULL,
  `loan_status_id` smallint(6) NOT NULL,
  `loan_type_enum` smallint(6) NOT NULL,
  `currency_code` varchar(140) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `principal_amount_proposed` decimal(19,6) NOT NULL,
  `principal_amount` decimal(19,6) NOT NULL,
  `approved_principal` decimal(19,6) NOT NULL,
  `net_disbursal_amount` decimal(19,6) NOT NULL,
  `arrearstolerance_amount` decimal(19,6) DEFAULT NULL,
  `is_floating_interest_rate` bit(1) DEFAULT b'0',
  `interest_rate_differential` decimal(19,6) DEFAULT 0.000000,
  `nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `interest_period_frequency_enum` smallint(6) DEFAULT NULL,
  `annual_nominal_interest_rate` decimal(19,6) DEFAULT NULL,
  `interest_method_enum` smallint(6) NOT NULL,
  `interest_calculated_in_period_enum` smallint(6) NOT NULL DEFAULT 1,
  `allow_partial_period_interest_calcualtion` bit(1) NOT NULL DEFAULT b'0',
  `term_frequency` smallint(6) NOT NULL DEFAULT 0,
  `term_period_frequency_enum` smallint(6) NOT NULL DEFAULT 2,
  `repay_every` smallint(6) NOT NULL,
  `repayment_period_frequency_enum` smallint(6) NOT NULL,
  `number_of_repayments` smallint(6) NOT NULL,
  `grace_on_principal_periods` smallint(6) DEFAULT NULL,
  `recurring_moratorium_principal_periods` smallint(6) DEFAULT NULL,
  `grace_on_interest_periods` smallint(6) DEFAULT NULL,
  `grace_interest_free_periods` smallint(6) DEFAULT NULL,
  `amortization_method_enum` smallint(6) NOT NULL,
  `submittedon_date` date DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` bigint(20) DEFAULT NULL,
  `expected_disbursedon_date` date DEFAULT NULL,
  `expected_firstrepaymenton_date` date DEFAULT NULL,
  `interest_calculated_from_date` date DEFAULT NULL,
  `disbursedon_date` date DEFAULT NULL,
  `disbursedon_userid` bigint(20) DEFAULT NULL,
  `expected_maturedon_date` date DEFAULT NULL,
  `maturedon_date` date DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` bigint(20) DEFAULT NULL,
  `total_charges_due_at_disbursement_derived` decimal(19,6) DEFAULT NULL,
  `principal_disbursed_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `principal_repaid_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `principal_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `principal_outstanding_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `interest_charged_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `interest_repaid_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `interest_waived_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `interest_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `interest_outstanding_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `fee_charges_charged_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `fee_charges_repaid_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `fee_charges_waived_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `fee_charges_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `fee_charges_outstanding_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `penalty_charges_charged_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `penalty_charges_repaid_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `penalty_charges_waived_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `penalty_charges_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `penalty_charges_outstanding_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_expected_repayment_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_repayment_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_expected_costofloan_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_costofloan_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_waived_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_writtenoff_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_outstanding_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `total_overpaid_derived` decimal(19,6) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` bigint(20) DEFAULT NULL,
  `rescheduledon_date` date DEFAULT NULL,
  `rescheduledon_userid` bigint(20) DEFAULT NULL,
  `withdrawnon_date` date DEFAULT NULL,
  `withdrawnon_userid` bigint(20) DEFAULT NULL,
  `writtenoffon_date` date DEFAULT NULL,
  `loan_transaction_strategy_id` bigint(20) DEFAULT NULL,
  `sync_disbursement_with_meeting` bit(1) DEFAULT NULL,
  `loan_counter` smallint(6) DEFAULT NULL,
  `loan_product_counter` smallint(6) DEFAULT NULL,
  `fixed_emi_amount` decimal(19,6) DEFAULT NULL,
  `max_outstanding_loan_balance` decimal(19,6) DEFAULT NULL,
  `grace_on_arrears_ageing` smallint(6) DEFAULT NULL,
  `is_npa` bit(1) NOT NULL DEFAULT b'0',
  `total_recovered_derived` decimal(19,6) DEFAULT NULL,
  `accrued_till` date DEFAULT NULL,
  `interest_recalcualated_on` date DEFAULT NULL,
  `days_in_month_enum` smallint(6) NOT NULL DEFAULT 1,
  `days_in_year_enum` smallint(6) NOT NULL DEFAULT 1,
  `interest_recalculation_enabled` bit(1) NOT NULL DEFAULT b'0',
  `guarantee_amount_derived` decimal(19,6) DEFAULT NULL,
  `create_standing_instruction_at_disbursement` bit(1) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `writeoff_reason_cv_id` int(11) DEFAULT NULL,
  `loan_sub_status_id` smallint(6) DEFAULT NULL,
  `is_topup` bit(1) NOT NULL DEFAULT b'0',
  `is_equal_amortization` bit(1) NOT NULL DEFAULT b'0',
  `fixed_principal_percentage_per_installment` decimal(5,2) DEFAULT NULL,
  `created_on_utc` datetime(6) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `last_modified_by` bigint(20) NOT NULL,
  `last_modified_on_utc` datetime(6) DEFAULT NULL,
  `principal_adjustments_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `is_fraud` bit(1) NOT NULL DEFAULT b'0',
  `loan_transaction_strategy_code` varchar(100) NOT NULL DEFAULT '-',
  `loan_transaction_strategy_name` varchar(100) NOT NULL DEFAULT '-',
  `last_closed_business_date` date DEFAULT NULL,
  `overpaidon_date` date DEFAULT NULL,
  `is_charged_off` bit(1) NOT NULL DEFAULT b'0',
  `charged_off_on_date` date DEFAULT NULL,
  `charge_off_reason_cv_id` bigint(20) DEFAULT NULL,
  `charged_off_by_userid` bigint(20) DEFAULT NULL,
  `enable_down_payment` bit(1) NOT NULL DEFAULT b'0',
  `disbursed_amount_percentage_for_down_payment` decimal(9,6) DEFAULT NULL,
  `enable_installment_level_delinquency` bit(1) NOT NULL DEFAULT b'0',
  `enable_auto_repayment_for_down_payment` bit(1) NOT NULL DEFAULT b'0',
  `disable_schedule_extension_for_down_payment` bit(1) NOT NULL DEFAULT b'0',
  `loan_schedule_type` varchar(20) NOT NULL DEFAULT 'CUMULATIVE',
  `loan_schedule_processing_type` varchar(20) NOT NULL DEFAULT 'HORIZONTAL',
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexLoanusers` (`modified_by`),
  KEY `plexLoanusers2` (`owner`),
  KEY `plexLoanAcc` (`account_no`),
  KEY `plexLoanClient` (`client_id`),
  KEY `plexLoanProd` (`product_id`),
  KEY `plexLoanOfficer` (`loan_officer_id`),
  CONSTRAINT `plexLoanAcc` FOREIGN KEY (`account_no`) REFERENCES `plexLoanAccount` (`name`),
  CONSTRAINT `plexLoanClient` FOREIGN KEY (`client_id`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexLoanOfficer` FOREIGN KEY (`loan_officer_id`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexLoanProd` FOREIGN KEY (`product_id`) REFERENCES `plexLoanProduct` (`name`),
  CONSTRAINT `plexLoanusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexLoanusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexLoan` */

/*Table structure for table `plexLoanAccount` */

DROP TABLE IF EXISTS `plexLoanAccount`;

CREATE TABLE `plexLoanAccount` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `client` varchar(140) DEFAULT NULL,
  `loan_product` varchar(140) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexLoanAccountusers` (`modified_by`),
  KEY `plexLoanAccountusers2` (`owner`),
  KEY `plexLoanAccountClient` (`client`),
  KEY `plexLoanAccountProduct` (`loan_product`),
  CONSTRAINT `plexLoanAccountOwner` FOREIGN KEY (`client`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexLoanAccountProduct` FOREIGN KEY (`loan_product`) REFERENCES `plexLoanProduct` (`name`),
  CONSTRAINT `plexLoanAccountusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexLoanAccountusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexLoanAccount` */

/*Table structure for table `plexLoanApplication` */

DROP TABLE IF EXISTS `plexLoanApplication`;

CREATE TABLE `plexLoanApplication` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `client` varchar(140) DEFAULT NULL,
  `loan_product` varchar(140) DEFAULT NULL,
  `loan_account` varchar(140) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexLoanApplicationusers` (`modified_by`),
  KEY `plexLoanApplicationusers2` (`owner`),
  KEY `plexLoanApplicationClient` (`client`),
  KEY `plexLoanApplicationProduct` (`loan_product`),
  KEY `plexLoanApplicationAcc` (`loan_account`),
  CONSTRAINT `plexLoanApplicationAcc` FOREIGN KEY (`loan_account`) REFERENCES `plexLoanAccount` (`name`),
  CONSTRAINT `plexLoanApplicationClient` FOREIGN KEY (`client`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexLoanApplicationProduct` FOREIGN KEY (`loan_product`) REFERENCES `plexLoanProduct` (`name`),
  CONSTRAINT `plexLoanApplicationusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexLoanApplicationusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexLoanApplication` */

/*Table structure for table `plexLoanCharge` */

DROP TABLE IF EXISTS `plexLoanCharge`;

CREATE TABLE `plexLoanCharge` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `currency_code` varchar(140) DEFAULT NULL,
  `charge_applies_to_enum` varchar(140) DEFAULT NULL,
  `charge_time_enum` varchar(140) DEFAULT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `charge_payment_mode_enum` smallint(6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `fee_on_day` smallint(6) DEFAULT NULL,
  `fee_interval` smallint(6) DEFAULT NULL,
  `fee_on_month` smallint(6) DEFAULT NULL,
  `is_penalty` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `fee_frequency` smallint(6) DEFAULT NULL,
  `is_free_withdrawal` bit(1) NOT NULL DEFAULT b'0',
  `free_withdrawal_charge_frequency` int(11) DEFAULT 0,
  `restart_frequency` int(11) DEFAULT 0,
  `restart_frequency_enum` int(11) DEFAULT 0,
  `is_payment_type` bit(1) DEFAULT b'0',
  `payment_type_id` int(11) DEFAULT NULL,
  `income_or_liability_account_id` bigint(20) DEFAULT NULL,
  `tax_group_id` bigint(20) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexChargeLoanusers` (`modified_by`),
  KEY `plexChargeLoanusers2` (`owner`),
  KEY `plexChargeLoanCurr` (`currency_code`),
  CONSTRAINT `plexChargeLoanCurr` FOREIGN KEY (`currency_code`) REFERENCES `plexCurrency` (`name`),
  CONSTRAINT `plexChargeLoanusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexChargeLoanusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexLoanCharge` */

/*Table structure for table `plexLoanProduct` */

DROP TABLE IF EXISTS `plexLoanProduct`;

CREATE TABLE `plexLoanProduct` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `short_name` varchar(4) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `min_principal_amount` decimal(19,6) DEFAULT NULL,
  `max_principal_amount` decimal(19,6) DEFAULT NULL,
  `arrearstolerance_amount` decimal(19,6) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fund_id` bigint(20) DEFAULT NULL,
  `is_linked_to_floating_interest_rates` bit(1) NOT NULL DEFAULT b'0',
  `allow_variabe_installments` bit(1) NOT NULL DEFAULT b'0',
  `nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `min_nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `max_nominal_interest_rate_per_period` decimal(19,6) DEFAULT NULL,
  `interest_period_frequency_enum` smallint(6) DEFAULT NULL,
  `annual_nominal_interest_rate` decimal(19,6) DEFAULT NULL,
  `interest_method_enum` smallint(6) NOT NULL,
  `interest_calculated_in_period_enum` smallint(6) NOT NULL DEFAULT 1,
  `allow_partial_period_interest_calcualtion` bit(1) NOT NULL DEFAULT b'0',
  `repay_every` smallint(6) NOT NULL,
  `repayment_period_frequency_enum` smallint(6) NOT NULL,
  `number_of_repayments` smallint(6) NOT NULL,
  `min_number_of_repayments` smallint(6) DEFAULT NULL,
  `max_number_of_repayments` smallint(6) DEFAULT NULL,
  `grace_on_principal_periods` smallint(6) DEFAULT NULL,
  `recurring_moratorium_principal_periods` smallint(6) DEFAULT NULL,
  `grace_on_interest_periods` smallint(6) DEFAULT NULL,
  `grace_interest_free_periods` smallint(6) DEFAULT NULL,
  `amortization_method_enum` smallint(6) NOT NULL,
  `accounting_type` smallint(6) NOT NULL,
  `loan_transaction_strategy_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `include_in_borrower_cycle` bit(1) NOT NULL DEFAULT b'0',
  `use_borrower_cycle` bit(1) NOT NULL DEFAULT b'0',
  `start_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `allow_multiple_disbursals` bit(1) NOT NULL DEFAULT b'0',
  `max_disbursals` int(11) DEFAULT NULL,
  `max_outstanding_loan_balance` decimal(19,6) DEFAULT NULL,
  `grace_on_arrears_ageing` smallint(6) DEFAULT NULL,
  `overdue_days_for_npa` smallint(6) DEFAULT NULL,
  `days_in_month_enum` smallint(6) NOT NULL DEFAULT 1,
  `days_in_year_enum` smallint(6) NOT NULL DEFAULT 1,
  `interest_recalculation_enabled` bit(1) NOT NULL DEFAULT b'0',
  `min_days_between_disbursal_and_first_repayment` int(11) DEFAULT NULL,
  `hold_guarantee_funds` bit(1) NOT NULL DEFAULT b'0',
  `principal_threshold_for_last_installment` decimal(5,2) NOT NULL DEFAULT 50.00,
  `account_moves_out_of_npa_only_on_arrears_completion` bit(1) NOT NULL DEFAULT b'0',
  `can_define_fixed_emi_amount` bit(1) NOT NULL DEFAULT b'0',
  `instalment_amount_in_multiples_of` decimal(19,6) DEFAULT NULL,
  `can_use_for_topup` bit(1) NOT NULL DEFAULT b'0',
  `sync_expected_with_disbursement_date` bit(1) DEFAULT b'0',
  `is_equal_amortization` bit(1) NOT NULL DEFAULT b'0',
  `fixed_principal_percentage_per_installment` decimal(5,2) DEFAULT NULL,
  `disallow_expected_disbursements` bit(1) NOT NULL DEFAULT b'0',
  `allow_approved_disbursed_amounts_over_applied` bit(1) NOT NULL DEFAULT b'0',
  `over_applied_calculation_type` varchar(10) DEFAULT NULL,
  `over_applied_number` int(11) DEFAULT NULL,
  `delinquency_bucket_id` bigint(20) DEFAULT NULL,
  `loan_transaction_strategy_code` varchar(100) NOT NULL DEFAULT '-',
  `loan_transaction_strategy_name` varchar(100) NOT NULL DEFAULT '-',
  `due_days_for_repayment_event` int(11) DEFAULT NULL,
  `overdue_days_for_repayment_event` int(11) DEFAULT NULL,
  `enable_down_payment` bit(1) NOT NULL DEFAULT b'0',
  `disbursed_amount_percentage_for_down_payment` decimal(9,6) DEFAULT NULL,
  `enable_installment_level_delinquency` bit(1) NOT NULL DEFAULT b'0',
  `enable_auto_repayment_for_down_payment` bit(1) NOT NULL DEFAULT b'0',
  `repayment_start_date_type_enum` smallint(6) NOT NULL DEFAULT 1,
  `disable_schedule_extension_for_down_payment` bit(1) NOT NULL DEFAULT b'0',
  `loan_schedule_type` varchar(20) NOT NULL DEFAULT 'CUMULATIVE',
  `loan_schedule_processing_type` varchar(20) NOT NULL DEFAULT 'HORIZONTAL',
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexLoanProductusers` (`modified_by`),
  KEY `plexLoanProductusers2` (`owner`),
  CONSTRAINT `plexLoanProductusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexLoanProductusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexLoanProduct` */

/*Table structure for table `plexLoanSchedule` */

DROP TABLE IF EXISTS `plexLoanSchedule`;

CREATE TABLE `plexLoanSchedule` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `loan_id` varchar(140) NOT NULL,
  `fromdate` date DEFAULT NULL,
  `duedate` date NOT NULL,
  `installment` smallint(6) NOT NULL,
  `principal_amount` decimal(19,6) DEFAULT NULL,
  `principal_completed_derived` decimal(19,6) DEFAULT NULL,
  `principal_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `interest_amount` decimal(19,6) DEFAULT NULL,
  `interest_completed_derived` decimal(19,6) DEFAULT NULL,
  `interest_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `interest_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_interest_derived` decimal(19,6) DEFAULT NULL,
  `reschedule_interest_portion` decimal(19,6) DEFAULT NULL,
  `fee_charges_amount` decimal(19,6) DEFAULT NULL,
  `fee_charges_completed_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `fee_charges_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_fee_charges_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_amount` decimal(19,6) DEFAULT NULL,
  `penalty_charges_completed_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `penalty_charges_waived_derived` decimal(19,6) DEFAULT NULL,
  `accrual_penalty_charges_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_in_advance_derived` decimal(19,6) DEFAULT NULL,
  `total_paid_late_derived` decimal(19,6) DEFAULT NULL,
  `completed_derived` bit(1) NOT NULL,
  `obligations_met_on_date` date DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `lastmodified_date` datetime(6) DEFAULT NULL,
  `last_modified_by` bigint(20) NOT NULL,
  `recalculated_interest_component` bit(1) NOT NULL DEFAULT b'0',
  `created_on_utc` datetime(6) DEFAULT NULL,
  `last_modified_on_utc` datetime(6) DEFAULT NULL,
  `is_additional` bit(1) NOT NULL DEFAULT b'0',
  `credits_amount` decimal(19,6) DEFAULT NULL,
  `is_down_payment` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexLoanScheduleusers` (`modified_by`),
  KEY `plexLoanScheduleusers2` (`owner`),
  KEY `plexLoanScheduleLoan` (`loan_id`),
  CONSTRAINT `plexLoanScheduleLoan` FOREIGN KEY (`loan_id`) REFERENCES `plexLoan` (`name`),
  CONSTRAINT `plexLoanScheduleusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexLoanScheduleusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexLoanSchedule` */

/*Table structure for table `plexPayment` */

DROP TABLE IF EXISTS `plexPayment`;

CREATE TABLE `plexPayment` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `payment_type_id` int(11) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `check_number` varchar(100) DEFAULT NULL,
  `receipt_number` varchar(100) DEFAULT NULL,
  `bank_number` varchar(100) DEFAULT NULL,
  `routing_code` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPayment` */

/*Table structure for table `plexPostingJournals` */

DROP TABLE IF EXISTS `plexPostingJournals`;

CREATE TABLE `plexPostingJournals` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `rule` varchar(140) DEFAULT NULL,
  `credit` double(11,6) DEFAULT NULL,
  `debit` double(11,6) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexPostingJournalsusers` (`modified_by`),
  KEY `plexPostingJournalsusers2` (`owner`),
  KEY `plexPostingJournalRule` (`rule`),
  CONSTRAINT `plexPostingJournalRule` FOREIGN KEY (`rule`) REFERENCES `plexPostingRules` (`name`),
  CONSTRAINT `plexPostingJournalsusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexPostingJournalsusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingJournals` */

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
  KEY `plexPostingRulesusers2` (`owner`),
  CONSTRAINT `plexPostingRulesusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexPostingRulesusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRules` */

insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Cash Deposit','2024-07-24 13:15:08.235020','2024-07-24 18:12:29.565320','Administrator','Administrator',0,0,'Cash Deposit','Cash deposit received by teller','2065e91b1e5a2b8a02ab3175d9a908e10036dd43b72737952e0fb3e4ffd7bc21',0);

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
  `accoount` varchar(140) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `postingRules` (`postingRule`),
  KEY `postingRulesAcc` (`accoount`),
  CONSTRAINT `postingRules` FOREIGN KEY (`postingRule`) REFERENCES `plexPostingRules` (`name`),
  CONSTRAINT `postingRulesAcc` FOREIGN KEY (`accoount`) REFERENCES `plexAccountMapping` (`name`),
  CONSTRAINT `postingRulesAccountsAccount` FOREIGN KEY (`accoount`) REFERENCES `plexAccountMapping` (`name`),
  CONSTRAINT `postingRulesAccountsRule` FOREIGN KEY (`postingRule`) REFERENCES `plexPostingRules` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRulesAccounts` */

/*Table structure for table `plexSavingAccount` */

DROP TABLE IF EXISTS `plexSavingAccount`;

CREATE TABLE `plexSavingAccount` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `account_no` varchar(20) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  `client_id` varchar(140) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `gsim_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(140) DEFAULT NULL,
  `field_officer_id` varchar(140) DEFAULT NULL,
  `status_enum` smallint(6) NOT NULL DEFAULT 300,
  `sub_status_enum` smallint(6) NOT NULL DEFAULT 0,
  `account_type_enum` smallint(6) NOT NULL DEFAULT 1,
  `deposit_type_enum` smallint(6) NOT NULL DEFAULT 100,
  `submittedon_date` date NOT NULL,
  `submittedon_userid` varchar(140) DEFAULT NULL,
  `approvedon_date` date DEFAULT NULL,
  `approvedon_userid` varchar(140) DEFAULT NULL,
  `rejectedon_date` date DEFAULT NULL,
  `rejectedon_userid` varchar(140) DEFAULT NULL,
  `withdrawnon_date` date DEFAULT NULL,
  `withdrawnon_userid` varchar(140) DEFAULT NULL,
  `activatedon_date` date DEFAULT NULL,
  `activatedon_userid` varchar(140) DEFAULT NULL,
  `closedon_date` date DEFAULT NULL,
  `closedon_userid` varchar(140) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `nominal_annual_interest_rate` decimal(19,6) NOT NULL,
  `interest_compounding_period_enum` smallint(6) NOT NULL,
  `interest_posting_period_enum` smallint(6) NOT NULL DEFAULT 4,
  `interest_calculation_type_enum` smallint(6) NOT NULL,
  `interest_calculation_days_in_year_type_enum` smallint(6) NOT NULL,
  `min_required_opening_balance` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(6) DEFAULT NULL,
  `withdrawal_fee_for_transfer` bit(1) DEFAULT b'1',
  `allow_overdraft` bit(1) NOT NULL DEFAULT b'0',
  `overdraft_limit` decimal(19,6) DEFAULT NULL,
  `nominal_annual_interest_rate_overdraft` decimal(19,6) DEFAULT 0.000000,
  `min_overdraft_for_interest_calculation` decimal(19,6) DEFAULT 0.000000,
  `lockedin_until_date_derived` date DEFAULT NULL,
  `total_deposits_derived` decimal(19,6) DEFAULT NULL,
  `total_withdrawals_derived` decimal(19,6) DEFAULT NULL,
  `total_withdrawal_fees_derived` decimal(19,6) DEFAULT NULL,
  `total_fees_charge_derived` decimal(19,6) DEFAULT NULL,
  `total_penalty_charge_derived` decimal(19,6) DEFAULT NULL,
  `total_annual_fees_derived` decimal(19,6) DEFAULT NULL,
  `total_interest_earned_derived` decimal(19,6) DEFAULT NULL,
  `total_interest_posted_derived` decimal(19,6) DEFAULT NULL,
  `total_overdraft_interest_derived` decimal(19,6) DEFAULT 0.000000,
  `total_withhold_tax_derived` decimal(19,6) DEFAULT NULL,
  `account_balance_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `min_required_balance` decimal(19,6) DEFAULT NULL,
  `enforce_min_required_balance` bit(1) NOT NULL DEFAULT b'0',
  `min_balance_for_interest_calculation` decimal(19,6) DEFAULT NULL,
  `start_interest_calculation_date` date DEFAULT NULL,
  `on_hold_funds_derived` decimal(19,6) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `withhold_tax` bit(1) NOT NULL DEFAULT b'0',
  `tax_group_id` bigint(20) DEFAULT NULL,
  `last_interest_calculation_date` date DEFAULT NULL,
  `total_savings_amount_on_hold` decimal(19,6) DEFAULT NULL,
  `interest_posted_till_date` date DEFAULT NULL,
  `reason_for_block` varchar(256) DEFAULT NULL,
  `max_allowed_lien_limit` decimal(19,6) DEFAULT NULL,
  `is_lien_allowed` bit(1) NOT NULL DEFAULT b'0',
  `created_by` bigint(20) NOT NULL,
  `last_modified_by` bigint(20) NOT NULL,
  `created_on_utc` datetime(6) NOT NULL,
  `last_modified_on_utc` datetime(6) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexSavingAccountusers` (`modified_by`),
  KEY `plexSavingAccountusers2` (`owner`),
  KEY `plexSavingAccountClient` (`client_id`),
  KEY `plexSavingAccountProd` (`product_id`),
  KEY `plexSavingAccountFieldOff` (`field_officer_id`),
  KEY `plexSavingAccountApprover` (`approvedon_userid`),
  KEY `plexSavingAccountSubmitter` (`submittedon_userid`),
  KEY `plexSavingAccountRejector` (`rejectedon_userid`),
  KEY `plexSavingAccountCloser` (`closedon_userid`),
  KEY `plexSavingAccountCurr` (`currency_code`),
  KEY `plexSavingAccountWithdawer` (`withdrawnon_userid`),
  CONSTRAINT `plexSavingAccountApprover` FOREIGN KEY (`approvedon_userid`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountClient` FOREIGN KEY (`client_id`) REFERENCES `plexClient` (`name`),
  CONSTRAINT `plexSavingAccountCloser` FOREIGN KEY (`closedon_userid`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountCurr` FOREIGN KEY (`currency_code`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountFieldOff` FOREIGN KEY (`field_officer_id`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountProd` FOREIGN KEY (`product_id`) REFERENCES `plexSavingProduct` (`name`),
  CONSTRAINT `plexSavingAccountRejector` FOREIGN KEY (`rejectedon_userid`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountSubmitter` FOREIGN KEY (`submittedon_userid`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountWithdawer` FOREIGN KEY (`withdrawnon_userid`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingAccountusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexSavingAccount` */

/*Table structure for table `plexSavingCharge` */

DROP TABLE IF EXISTS `plexSavingCharge`;

CREATE TABLE `plexSavingCharge` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `currency_code` varchar(140) DEFAULT NULL,
  `charge_applies_to_enum` varchar(140) DEFAULT NULL,
  `charge_time_enum` varchar(140) DEFAULT NULL,
  `charge_calculation_enum` smallint(6) NOT NULL,
  `charge_payment_mode_enum` smallint(6) DEFAULT NULL,
  `amount` decimal(19,6) NOT NULL,
  `fee_on_day` smallint(6) DEFAULT NULL,
  `fee_interval` smallint(6) DEFAULT NULL,
  `fee_on_month` smallint(6) DEFAULT NULL,
  `is_penalty` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `min_cap` decimal(19,6) DEFAULT NULL,
  `max_cap` decimal(19,6) DEFAULT NULL,
  `fee_frequency` smallint(6) DEFAULT NULL,
  `is_free_withdrawal` bit(1) NOT NULL DEFAULT b'0',
  `free_withdrawal_charge_frequency` int(11) DEFAULT 0,
  `restart_frequency` int(11) DEFAULT 0,
  `restart_frequency_enum` int(11) DEFAULT 0,
  `is_payment_type` bit(1) DEFAULT b'0',
  `payment_type_id` int(11) DEFAULT NULL,
  `income_or_liability_account_id` bigint(20) DEFAULT NULL,
  `tax_group_id` bigint(20) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `savings_account_id` bigint(20) NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `charge_due_date` date DEFAULT NULL,
  `free_withdrawal_count` int(11) DEFAULT 0,
  `charge_reset_date` date DEFAULT NULL,
  `calculation_percentage` decimal(19,6) DEFAULT NULL,
  `calculation_on_amount` decimal(19,6) DEFAULT NULL,
  `amount_paid_derived` decimal(19,6) DEFAULT NULL,
  `amount_waived_derived` decimal(19,6) DEFAULT NULL,
  `amount_writtenoff_derived` decimal(19,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `is_paid_derived` bit(1) NOT NULL DEFAULT b'0',
  `waived` bit(1) NOT NULL DEFAULT b'0',
  `inactivated_on_date` date DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `last_modified_by` bigint(20) NOT NULL,
  `created_on_utc` datetime(6) NOT NULL,
  `last_modified_on_utc` datetime(6) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexChargeusers` (`modified_by`),
  KEY `plexChargeusers2` (`owner`),
  CONSTRAINT `plexChargeusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexChargeusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexSavingCharge` */

/*Table structure for table `plexSavingProduct` */

DROP TABLE IF EXISTS `plexSavingProduct`;

CREATE TABLE `plexSavingProduct` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `title` varchar(100) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `deposit_type_enum` smallint(6) NOT NULL DEFAULT 100,
  `currency_code` varchar(3) NOT NULL,
  `currency_digits` smallint(6) NOT NULL,
  `currency_multiplesof` smallint(6) DEFAULT NULL,
  `nominal_annual_interest_rate` decimal(19,6) NOT NULL,
  `interest_compounding_period_enum` smallint(6) NOT NULL,
  `interest_posting_period_enum` smallint(6) NOT NULL DEFAULT 4,
  `interest_calculation_type_enum` smallint(6) NOT NULL,
  `interest_calculation_days_in_year_type_enum` smallint(6) NOT NULL,
  `min_required_opening_balance` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency` decimal(19,6) DEFAULT NULL,
  `lockin_period_frequency_enum` smallint(6) DEFAULT NULL,
  `accounting_type` smallint(6) NOT NULL,
  `withdrawal_fee_amount` decimal(19,6) DEFAULT NULL,
  `withdrawal_fee_type_enum` smallint(6) DEFAULT NULL,
  `withdrawal_fee_for_transfer` bit(1) DEFAULT b'1',
  `allow_overdraft` bit(1) NOT NULL DEFAULT b'0',
  `overdraft_limit` decimal(19,6) DEFAULT NULL,
  `nominal_annual_interest_rate_overdraft` decimal(19,6) DEFAULT 0.000000,
  `min_overdraft_for_interest_calculation` decimal(19,6) DEFAULT 0.000000,
  `min_required_balance` decimal(19,6) DEFAULT NULL,
  `enforce_min_required_balance` bit(1) NOT NULL DEFAULT b'0',
  `min_balance_for_interest_calculation` decimal(19,6) DEFAULT NULL,
  `withhold_tax` bit(1) NOT NULL DEFAULT b'0',
  `tax_group_id` bigint(20) DEFAULT NULL,
  `is_dormancy_tracking_active` bit(1) DEFAULT NULL,
  `days_to_inactive` int(11) DEFAULT NULL,
  `days_to_dormancy` int(11) DEFAULT NULL,
  `days_to_escheat` int(11) DEFAULT NULL,
  `max_allowed_lien_limit` decimal(19,6) DEFAULT NULL,
  `is_lien_allowed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexSavingProductusers` (`modified_by`),
  KEY `plexSavingProductusers2` (`owner`),
  CONSTRAINT `plexSavingProductusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSavingProductusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexSavingProduct` */

/*Table structure for table `plexSetting` */

DROP TABLE IF EXISTS `plexSetting`;

CREATE TABLE `plexSetting` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  `setting` varchar(140) DEFAULT NULL,
  `value` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexSettingusers` (`modified_by`),
  KEY `plexSettingusers2` (`owner`),
  CONSTRAINT `plexSettingusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexSettingusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexSetting` */

/*Table structure for table `plexTeller` */

DROP TABLE IF EXISTS `plexTeller`;

CREATE TABLE `plexTeller` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `user` varchar(140) DEFAULT NULL,
  `branch` varchar(140) DEFAULT NULL,
  `debit_account` varchar(140) DEFAULT NULL,
  `credit_account` varchar(140) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexTellerusers` (`modified_by`),
  KEY `plexTellerusers2` (`owner`),
  KEY `plexTellerBranch` (`branch`),
  KEY `plexTellerUser` (`user`),
  KEY `plexTellerAccDebit` (`debit_account`),
  KEY `plexTellerAccCredit` (`credit_account`),
  CONSTRAINT `plexTellerAccCredit` FOREIGN KEY (`credit_account`) REFERENCES `plexAccountMapping` (`name`),
  CONSTRAINT `plexTellerAccDebit` FOREIGN KEY (`debit_account`) REFERENCES `plexAccountMapping` (`name`),
  CONSTRAINT `plexTellerBranch` FOREIGN KEY (`branch`) REFERENCES `plexBranch` (`name`),
  CONSTRAINT `plexTellerUser` FOREIGN KEY (`User`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexTellerusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexTellerusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexTeller` */

insert  into `plexTeller`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`branch`,`debit_account`,`credit_account`,`description`,`valid_from`,`valid_to`,`state`,`sig`,`sig_status`) values ('admin@plexor.com','2024-07-20 16:05:17.030008','2024-07-20 16:05:17.030008','Administrator','Administrator',0,0,'admin@plexor.com','Ngong Branch','Cashier Deposits','Member Payments','None','2024-07-20','2024-07-27','Enabled','e79b84caa770d689817bbcf099b386adb09a653cd195bb390e754c802ebda78e',0);
insert  into `plexTeller`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`branch`,`debit_account`,`credit_account`,`description`,`valid_from`,`valid_to`,`state`,`sig`,`sig_status`) values ('Administrator','2024-07-20 16:00:56.585606','2024-07-20 16:00:56.585606','Administrator','Administrator',0,0,'Administrator','Ngong Branch','Cashier Deposits','Member Payments','na','2024-07-30','2024-07-24','Enabled','009b94311d07152d794e59b0d551160acd02a0da414b69c04e17482d3a4ccb29',0);

/*Table structure for table `plexTrxQueue` */

DROP TABLE IF EXISTS `plexTrxQueue`;

CREATE TABLE `plexTrxQueue` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexTrxQueueusers` (`modified_by`),
  KEY `plexTrxQueueusers2` (`owner`),
  CONSTRAINT `plexTrxQueueusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexTrxQueueusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexTrxQueue` */

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

insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`sig`,`sig_status`) values ('admin@plexor.com','2024-07-16 13:35:42.000000','2024-07-16 13:35:42.000000','admin@plexor.com','admin@plexor.com',1,1,'admin@plexor.com',1,'-',0);
insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`sig`,`sig_status`) values ('Administrator','2024-07-13 13:03:36.000000','2024-07-13 13:03:32.000000','Administrator','Administrator',0,0,'Administrator',1,NULL,0);

/*Table structure for table `sig_failures` */

DROP TABLE IF EXISTS `sig_failures`;

CREATE TABLE `sig_failures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stamp` datetime DEFAULT NULL,
  `table` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `before_data` varchar(500) DEFAULT NULL,
  `after_data` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `sig_failures` */

insert  into `sig_failures`(`id`,`stamp`,`table`,`name`,`before_data`,`after_data`) values (219,'2024-07-10 12:16:35','notify_messages','0.04570142183983831','System Manager|admin@example.com|The new finest test|1|1|0|2024-07-06 12:56:56.000000|2024-07-06 12:56:56.000000|Administrator|Administrator','System Manager|admin@example.com|The new finest testff|1|1|0|2024-07-06 12:56:56.000000|2024-07-06 12:56:56.000000|Administrator|Administrator');
insert  into `sig_failures`(`id`,`stamp`,`table`,`name`,`before_data`,`after_data`) values (220,'2024-07-10 13:22:59','notify_messages','0.05074797296034915','System Manager|admin@example.com|The new finest test|1|1|0|2024-07-06 13:23:05.000000|2024-07-06 13:23:05.000000|Administrator|Administrator','System Manager|admin@example.com|The new finest testvv|1|1|0|2024-07-06 13:23:05.000000|2024-07-06 13:23:05.000000|Administrator|Administrator');
insert  into `sig_failures`(`id`,`stamp`,`table`,`name`,`before_data`,`after_data`) values (221,'2024-07-10 13:51:39','notify_messages','0.10727468981153769','System Manager|admin@example.com|The new finest test|3|4|0|2024-07-06 15:25:44.000000|2024-07-06 15:25:44.000000|Administrator|Administrator','System Manager|admin@example.com|The new finest testvbg|3|4|0|2024-07-06 15:25:44.000000|2024-07-06 15:25:44.000000|Administrator|Administrator');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
