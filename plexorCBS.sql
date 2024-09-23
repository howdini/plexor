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
insert  into `notify_last_alert`(`id`,`user`,`last_msg_stamp`) values (20,'admin@plexor.com','2024-09-20 14:58:43');

/*Table structure for table `notify_messages` */

DROP TABLE IF EXISTS `notify_messages`;

CREATE TABLE `notify_messages` (
  `name` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `notify_messages` */

insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (1,'2024-09-17 06:40:08.000000','2024-09-17 06:40:08.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1709172024064008053991>View change  </a>',1,6,1,'cbc085826ca005df0730df9ec7b944f00e9ebc7e2c19a6d5a0e2c61dc2fd69b5',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (2,'2024-09-17 10:10:21.000000','2024-09-17 10:10:21.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1709172024101021898708>View change </a>',1,6,1,'2164fe5803387291a733c75be210f5bed1dbb969fd308808434bf3a0f733cf12',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (3,'2024-09-17 10:13:41.000000','2024-09-17 10:13:41.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1709172024101341157654>View change </a>',1,6,1,'a10459b9e193266ded3a3874727aca3db86ad22c8b2e4c3c90b552e94c6c1cac',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (4,'2024-09-17 11:06:28.000000','2024-09-17 11:06:28.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1709172024110628183904>View change </a>',1,6,1,'db6196faa3b57efe36c1dda1c8386c3bc0c93dc42ad6f27bd707e4e35d2a50e0',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (5,'2024-09-18 12:52:58.000000','2024-09-18 12:52:58.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1809182024125258797973>View change </a>',1,6,1,'f87a3e3f2eea2ff575fa9a7870525c88b124c48b99400ab14c0fc02fba6137a7',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (6,'2024-09-18 14:54:25.000000','2024-09-18 14:54:25.000000','Administrator','Administrator',0,0,'','admin@plexor.com','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1809182024145425481910>View change  </a>',1,6,1,'d4ecdafa50c96653075b79a88c82abed811d6357fea01a26c3bd90a215578bb2',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (7,'2024-09-18 14:54:50.000000','2024-09-18 14:54:50.000000','Administrator','Administrator',0,0,'','admin@plexor.com','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1809182024145450370760>View change  </a>',1,6,1,'32f743c33f00d01f03b3a79816be21c2b36f2b14e3dd2b50b015bf4c03a5ae64',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (8,'2024-09-18 15:03:25.000000','2024-09-18 15:03:25.000000','Administrator','Administrator',0,0,'','admin@plexor.com','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1809182024150325527577>View change  </a>',1,6,1,'e64d0524c65d30d7d1f3f29d834a0cc23b6160fe80b41e80edc05001fbaab52e',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (9,'2024-09-18 15:07:31.000000','2024-09-18 15:07:31.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1809182024150731226481>View change  </a>',1,6,0,'270b4585eead18a2a60a7017f4e815b60b545f30f9d371272bbfb2929d65268d',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (10,'2024-09-19 10:59:57.000000','2024-09-19 10:59:57.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1909192024105957527077>View change </a>',1,6,0,'223447a579419c607e78a79096a8d833f3f406d261f59d5ba715e191ad8a5a90',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (11,'2024-09-19 13:16:20.000000','2024-09-19 13:16:20.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1909192024131620091213>View change </a>',1,6,0,'70d384721a5e56164f8dfc4c8c9bb2e2b7c83c0a9418afac88e7ba1c9aa1c123',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (12,'2024-09-19 13:20:53.000000','2024-09-19 13:20:53.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1909192024132053068548>View change  </a>',1,6,0,'8d09d0eaadf21a31091a587c636e9efe1fcadd60964216d79a7d339c12a0a545',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (13,'2024-09-19 15:31:43.000000','2024-09-19 15:31:43.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1909192024153143402448>View change  </a>',1,6,0,'f4fda8860b10ef8073d409a8a072880c326e9a46662ad956a6efe353d8eab8de',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (14,'2024-09-19 15:39:50.000000','2024-09-19 15:39:50.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/1909192024153950586137>View change  </a>',1,6,0,'4fb1c18673fc609c1e2726892dabbf5f1f19d780c10b3a0809c9abde70491abe',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (15,'2024-09-20 10:12:44.000000','2024-09-20 10:12:44.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024101244099526>View change  </a>',1,6,0,'adeb9f8658db7f82a8ae8c89bb78015ca9fdc0afeb781db03bbc828cac33722a',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (16,'2024-09-20 10:12:55.000000','2024-09-20 10:12:55.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024101255182026>View change  </a>',1,6,0,'a2eed6901fb5fbe0c2db4d8260158da6be3d3b03c185c2d7ada7a6a7b433b96b',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (17,'2024-09-20 10:13:07.000000','2024-09-20 10:13:07.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024101307515632>View change  </a>',1,6,0,'07d02acedf275f8432d6d28df3814cbb8883004d54019645273cf13d27b1340a',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (18,'2024-09-20 10:13:25.000000','2024-09-20 10:13:25.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024101325110197>View change  </a>',1,6,0,'a68e18aabc5730390bcf4cc9537a76ea77eb5ebf8ad2578e95439eb1b128d8dc',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (19,'2024-09-20 12:24:13.000000','2024-09-20 12:24:13.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024122413671943>View change  </a>',1,6,0,'aa90aa2f7fd483f3303e9d1ff1689623760011aed9e0e2b9e7cfa10c0a0d758b',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (20,'2024-09-20 13:15:43.000000','2024-09-20 13:15:43.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024131543011571>View change  </a>',1,6,0,'c3809c13f978a4c2d1e1599ceb0ad99ce4d28bf0b2e43f5e4f9499829904e17a',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (21,'2024-09-20 13:22:31.000000','2024-09-20 13:22:31.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024132231526378>View change  </a>',1,6,0,'a0c669bcdc7b7e912107370f9e66eeb73a7fd83c43b1febe5e58b20acd3f5ae4',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (22,'2024-09-20 13:59:26.000000','2024-09-20 13:59:26.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024135926024062>View change  </a>',1,6,0,'093fb5fce7d1672a9d5b7360913eed27c626175ff605e00321ce1be80a91c978',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (23,'2024-09-20 14:00:07.000000','2024-09-20 14:00:07.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024140007881201>View change  </a>',1,6,0,'66523de6ae037b95eb197bc2399f5c9d2511a9124b8274f3a74765208fa5e771',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (24,'2024-09-20 14:12:07.000000','2024-09-20 14:12:07.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024141207316875>View change </a>',1,6,0,'31744e9589fbc927fcd97242a0959233cef5e1fdc58544ac17232541934dd79d',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (25,'2024-09-20 14:12:59.000000','2024-09-20 14:12:59.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024141259752059>View change </a>',1,6,0,'25a07a5bcbed72804e3ff8d8683011ab265036effcc615f1ebf5d8c065f216eb',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (26,'2024-09-20 14:30:40.000000','2024-09-20 14:30:40.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024143040460706>View change </a>',1,6,0,'9dad1422f6ffe28227c786cc6e643f45a5d0a7dedb9af373d2748c788883d9bc',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (27,'2024-09-20 14:33:06.000000','2024-09-20 14:33:06.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024143305913787>View change  </a>',1,6,0,'7b02244b7a6827a2dd780cb20672d05ff91522c0a3be5c0828d1b5797a8d9435',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (28,'2024-09-20 14:33:17.000000','2024-09-20 14:33:17.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024143317297274>View change  </a>',1,6,0,'a0505bc42420bef460885918fc237531427ffc25725dd4ce316ee46e41c3d276',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (29,'2024-09-20 14:33:26.000000','2024-09-20 14:33:26.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024143325993784>View change  </a>',1,6,0,'fdec4ad7b5cf09eeec2431c7a48fd9353d8b8ecea78075be6638f2d40ccb58e7',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (30,'2024-09-20 14:57:19.000000','2024-09-20 14:57:19.000000','Administrator','Administrator',0,0,'','admin@plexor.com','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024145719865295>View change </a>',1,6,1,'76d1a38115f21a793c3b246f59e3310ce0ceb6cd2c12760f20357a8f38599fa6',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (31,'2024-09-20 14:58:43.000000','2024-09-20 14:58:43.000000','Administrator','Administrator',0,0,'','admin@plexor.com','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024145843429827>View change </a>',1,6,1,'7a7051d350426e6072e0e01dc986f43925b65c5e95466f3e435d6a3fcab28ec4',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (32,'2024-09-20 15:06:40.000000','2024-09-20 15:06:40.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024150640871412>View change  </a>',1,6,0,'789f216fef383972ef9e632b9d9b9304463ac2e22916e0ea907c4caa88106108',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (33,'2024-09-20 15:06:53.000000','2024-09-20 15:06:53.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024150653770167>View change  </a>',1,6,0,'a6e8c9482a95ed6650dbc5d569cd10200bf249fb45f87076c54cddb7f7c1510b',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (34,'2024-09-20 15:07:08.000000','2024-09-20 15:07:08.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024150708327425>View change  </a>',1,6,0,'516ad73dfc69e08e7c6419fb4c7b5c296732eaa32e6626d75141de11462b45c3',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (35,'2024-09-20 15:07:21.000000','2024-09-20 15:07:21.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2009202024150721902557>View change  </a>',1,6,0,'a8306f8b56273f90b784d5416b2f0460f018aaed04bdc98c110d0dc17663b95b',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (36,'2024-09-21 14:30:26.000000','2024-09-21 14:30:26.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2109212024143026430406>View change  </a>',1,6,0,'be2b49ba65a34aaad760edc4751ddd7a2aea44775bf6cc57ff09414c6a400ac6',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (37,'2024-09-21 14:31:40.000000','2024-09-21 14:31:40.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2109212024143140871728>View change  </a>',1,6,0,'ff250915549854d0e86dc834d4a2c5b8e76db7a4c382950636066deaab927fa4',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (38,'2024-09-21 14:37:15.000000','2024-09-21 14:37:15.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2109212024143715379767>View change  </a>',1,6,0,'eecd005f7a4b3e78359f47fa4c5f77a90364b50751b4170cf9b5c150359f2ef0',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (39,'2024-09-21 14:37:59.000000','2024-09-21 14:37:59.000000','admin@plexor.com','admin@plexor.com',0,0,'','Administrator: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2109212024143759473114>View change  </a>',1,6,0,'754087cd857741fc62fd425b85f255a99a1118acc0bba5ad9330266e73da9d66',0);
insert  into `notify_messages`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`dest_group`,`dest_user`,`message`,`msg_type`,`error_level`,`read`,`sig`,`sig_status`) values (40,'2024-09-21 14:49:08.000000','2024-09-21 14:49:08.000000','Administrator','Administrator',0,0,'','admin@plexor.com: pending','A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/2109212024144908409702>View change  </a>',1,6,0,'3d0c04073cebee3b8f449d9dc49d8fda64e5039c9b6cbdbc24a5034bd8a54bde',0);

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
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Loan Charges','2024-08-02 00:56:36.872177','2024-08-02 00:56:36.872177','Administrator','Administrator',0,0,'Loan Charges','Debtors - BSL','Loan charges account','9e2acbfb2447467a41b2ac23f03959dc181631e65b97b722ccd43568242790b6',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Loan Penalty','2024-08-02 00:35:47.253038','2024-08-02 00:35:47.253038','Administrator','Administrator',0,0,'Loan Penalty','Cash - BSL','Account designed for loans','a01b09075ef5014ee10a46725cacbe651c1daa094e3c5eac57f5a9253a56493d',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Member Payments','2024-07-19 15:11:40.273312','2024-07-19 15:11:40.273312','Administrator','Administrator',0,0,'Member Payments','Accounts Payable - BSL','Money owed to clients','07c4f935bbbe8616db44d80d398f22512d4556cefb0d1341b7d6ec68aaa4de97',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Penalties','2024-08-05 09:14:48.367352','2024-08-05 09:14:48.367352','Administrator','Administrator',0,0,'Penalties','Freight and Forwarding Charges - BSL','Penalties','3f3ef4d2346fc56fd4f11156ad3937e1ca2a0301596e71936954f9cd91210f7e',0);
insert  into `plexAccountMapping`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`mapper_name`,`account`,`description`,`sig`,`sig_status`) values ('Refunds','2024-08-05 14:39:48.603220','2024-08-05 14:39:48.603220','Administrator','Administrator',0,0,'Refunds','Creditors - BSL','Refund','ec1e0b972a5eac40425cd650b6902beaeba7b62a649c1b4eff8a9bda3a3907db',0);

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

/*Table structure for table `plexMakerChecker` */

DROP TABLE IF EXISTS `plexMakerChecker`;

CREATE TABLE `plexMakerChecker` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `creator` varchar(140) DEFAULT NULL,
  `stamp` datetime(6) DEFAULT NULL,
  `document` varchar(200) DEFAULT NULL,
  `document_id` varchar(140) DEFAULT NULL,
  `trx_type` varchar(20) DEFAULT NULL,
  `child_trx_type` varchar(10) DEFAULT '-',
  `values` varchar(2500) DEFAULT NULL,
  `checkers` varchar(250) NOT NULL,
  `check_status` int(8) NOT NULL DEFAULT 0,
  `checker_comments` varchar(1500) DEFAULT NULL,
  `posted_status` int(11) DEFAULT 0,
  `posted_result` varchar(500) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `makercheckermodified` (`modified_by`),
  KEY `makercheckerowner` (`owner`),
  KEY `makercheckercreator` (`creator`),
  CONSTRAINT `makercheckercreator` FOREIGN KEY (`creator`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `makercheckermodified` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `makercheckerowner` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexMakerChecker` */

insert  into `plexMakerChecker`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2109212024143026430406','2024-09-21 14:30:26.000000','2024-09-21 14:30:26.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-21 14:30:26.000000','PostingRulesAccounts','102','UPDATE','DELETE','{\"parent\":{\"title\" :\"Posting One\", \"description\" :\"Test post\"}, \"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Debit\", \"account\" :\"Loan Penalty\"}}','{Administrator: pending,}',0,NULL,0,NULL,'Posting One','7102082a50fe28874ca58c0200261b166d16c41cbd39b5922d7a9bccaf0e7f0e',0);
insert  into `plexMakerChecker`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2109212024143140871728','2024-09-21 14:31:40.000000','2024-09-21 14:31:40.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-21 14:31:40.000000','PostingRulesAccounts','102','UPDATE','DELETE','{\"parent\":{\"title\" :\"Posting One\", \"description\" :\"Test post\"}, \"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Debit\", \"account\" :\"Loan Penalty\"}}','{Administrator: pending,}',0,NULL,0,NULL,'Posting One','70fafc5a7fdfc9df583e51c2b18556453c33b0a0d3b85d4ca213e9fc4009b727',0);
insert  into `plexMakerChecker`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2109212024143715379767','2024-09-21 14:37:15.000000','2024-09-21 14:37:15.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-21 14:37:15.000000','PostingRulesAccounts','101','UPDATE','DELETE','{\"parent\":{\"title\" :\"Posting One\", \"description\" :\"Test post\"}, \"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Debit\", \"account\" :\"Loan Charges\"}}','{Administrator: pending,}',0,NULL,0,NULL,'Posting One','99c4c2892136a8d9dbbf4cfeaadb8f65c5bf3831ac54ee45af3054ebb2db22b8',0);
insert  into `plexMakerChecker`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2109212024143759473114','2024-09-21 14:37:59.000000','2024-09-21 14:37:59.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-21 14:37:59.000000','PostingRulesAccounts','102','UPDATE','DELETE','{\"parent\":{\"title\" :\"Posting One\", \"description\" :\"Test post\"}, \"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Debit\", \"account\" :\"Loan Penalty\"}}','{Administrator: pending,}',0,NULL,0,NULL,'Posting One','2cc6a2049924de9c3495fb35f3cb08a4792eb917db5c84623f9ef465a70f8c82',0);
insert  into `plexMakerChecker`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2109212024144908409702','2024-09-21 14:49:08.000000','2024-09-21 14:49:08.000000','Administrator','Administrator',0,1,'Administrator','2024-09-21 14:49:08.000000','PostingRulesAccounts','101','UPDATE','DELETE','{\"parent\":{\"title\" :\"Posting One\", \"description\" :\"Test post\"}, \"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Debit\", \"account\" :\"Loan Charges\"}}','{admin@plexor.com: pending,}',0,NULL,0,NULL,'Posting One','ac4914771e5f26e99af1d592958dd60bbb7cb3b9dfd409fce1b52a27da5e2494',0);

/*Table structure for table `plexMakerCheckerLogs` */

DROP TABLE IF EXISTS `plexMakerCheckerLogs`;

CREATE TABLE `plexMakerCheckerLogs` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `creator` varchar(140) DEFAULT NULL,
  `stamp` datetime(6) DEFAULT NULL,
  `document` varchar(200) DEFAULT NULL,
  `document_id` varchar(140) DEFAULT NULL,
  `trx_type` varchar(20) DEFAULT NULL,
  `child_trx_type` varchar(10) DEFAULT '-',
  `values` varchar(2500) DEFAULT NULL,
  `checkers` varchar(250) NOT NULL,
  `check_status` int(8) NOT NULL DEFAULT 0,
  `checker_comments` varchar(1500) DEFAULT NULL,
  `posted_status` int(11) DEFAULT 0,
  `posted_result` varchar(500) DEFAULT NULL,
  `parent` varchar(140) DEFAULT NULL,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `makercheckermodified` (`modified_by`),
  KEY `makercheckerowner` (`owner`),
  KEY `makercheckercreator` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexMakerCheckerLogs` */

insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0309032024165739660436','2024-09-03 16:57:39.000000','2024-09-04 10:30:50.521531','admin@plexor.com','Administrator',0,0,'Administrator','2024-09-03 16:57:39.570179','PostingRules','Retro','INSERT','-','{title :\"Retro\",\n description :\"Retro\"}','{admin@plexor.com: approved}',2,'undefined\n\nadmin@plexor.com @4/9/2024 10:15:29\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:17:43\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:17:48\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:20:2\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:22:35\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:22:41\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:23:29\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:26:32\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:26:35\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:28:46\n  -  Approved this update.\n\nadmin@plexor.com @4/9/2024 10:30:50\n  -  Approved this update.',1,'ok',NULL,'90495005a039043e4657c43e347f3377bda8b475628d88113a2169434f476bfa',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0309032024171410099638','2024-09-03 17:14:10.000000','2024-09-03 17:14:10.000000','Administrator','Administrator',0,1,'Administrator','2024-09-03 17:14:10.000000','PostingRulesAccounts','92','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Debit\",\n account :\"Loan Penalty\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0309032024171521398567','2024-09-03 17:15:21.000000','2024-09-03 17:15:21.000000','Administrator','Administrator',0,1,'Administrator','2024-09-03 17:15:21.000000','PostingRulesAccounts','93','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Debit\",\n account :\"Refunds\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0309032024171746668214','2024-09-03 17:17:46.000000','2024-09-03 17:17:46.000000','Administrator','Administrator',0,1,'Administrator','2024-09-03 17:17:46.000000','PostingRulesAccounts','94','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Debit\",\n account :\"Refunds\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0309032024171755166053','2024-09-03 17:17:55.000000','2024-09-03 17:17:55.000000','Administrator','Administrator',0,1,'Administrator','2024-09-03 17:17:55.000000','PostingRulesAccounts','95','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Debit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024094630057686','2024-09-04 09:46:30.000000','2024-09-04 09:46:30.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 09:46:30.000000','PostingRulesAccounts','96','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Credit\",\n account :\"Cashier Deposits\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024094639912958','2024-09-04 09:46:39.000000','2024-09-04 09:46:39.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 09:46:39.000000','PostingRulesAccounts','97','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Credit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024095034948899','2024-09-04 09:50:34.000000','2024-09-04 09:50:34.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 09:50:34.000000','PostingRulesAccounts','100','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Credit\",\n account :\"Member Payments\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024100300271743','2024-09-04 10:03:00.000000','2024-09-04 10:03:00.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 10:03:00.000000','PostingRulesAccounts','102','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Debit\",\n account :\"Member Payments\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024101213030588','2024-09-04 10:12:13.000000','2024-09-04 10:12:13.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 10:12:13.000000','PostingRulesAccounts','103','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Debit\",\n account :\"Loan Penalty\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024101239761961','2024-09-04 10:12:39.000000','2024-09-04 10:12:39.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 10:12:39.000000','PostingRulesAccounts','105','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Credit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024101249171095','2024-09-04 10:12:49.000000','2024-09-04 10:12:49.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 10:12:49.000000','PostingRulesAccounts','106','UPDATE','INSERT','{\"child\":{postingRule :\"Retro\",\n type :\"Credit\",\n account :\"Penalties\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024104243485663','2024-09-04 10:42:43.000000','2024-09-04 10:42:43.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 10:42:43.000000','PostingRulesAccounts','93','UPDATE','DELETE','{\"parent\":{title :\"Retro\",\n description :\"Retro2\"}, \"child\":{postingRule :\"Retro\",\n type :\"Debit\",\n account :\"Refunds\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Retro','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024114118343741','2024-09-04 11:41:18.000000','2024-09-04 11:41:18.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 11:41:18.000000','PostingRulesAccounts','50','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Taken\"}, \"child\":{postingRule :\"Savings Deposits\",\n type :\"Credit\",\n account :\"Refunds\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024115807438538','2024-09-04 11:58:07.000000','2024-09-04 11:58:07.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 11:58:07.000000','PostingRulesAccounts','68','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Taken\"}, \"child\":{postingRule :\"Savings Deposits\",\n type :\"Debit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024160449407180','2024-09-04 16:04:49.000000','2024-09-04 16:04:49.000000','Administrator','Administrator',0,0,'Administrator','2024-09-04 16:04:49.392737','PostingRules','Good Check','INSERT','-','{title :\"Good Check\",\n description :\"Perfect Test\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok',NULL,'',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024160456341807','2024-09-04 16:04:56.000000','2024-09-04 16:04:56.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 16:04:56.000000','PostingRulesAccounts','111','UPDATE','INSERT','{\"child\":{postingRule :\"Good Check\",\n type :\"Debit\",\n account :\"Cashier Deposits\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Good Check','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024160501279098','2024-09-04 16:05:01.000000','2024-09-04 16:05:01.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 16:05:01.000000','PostingRulesAccounts','112','UPDATE','INSERT','{\"child\":{postingRule :\"Good Check\",\n type :\"Debit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Good Check','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024160505904592','2024-09-04 16:05:05.000000','2024-09-04 16:05:05.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 16:05:05.000000','PostingRulesAccounts','113','UPDATE','INSERT','{\"child\":{postingRule :\"Good Check\",\n type :\"Debit\",\n account :\"Member Payments\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Good Check','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('0409042024160512965329','2024-09-04 16:05:12.000000','2024-09-04 16:05:12.000000','Administrator','Administrator',0,1,'Administrator','2024-09-04 16:05:12.000000','PostingRulesAccounts','114','UPDATE','INSERT','{\"child\":{postingRule :\"Good Check\",\n type :\"Credit\",\n account :\"Member Payments\"}}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','Good Check','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1308132024121137680883','2024-08-07 11:43:24.982624','2024-08-13 12:11:37.646717','Administrator','Administrator',0,0,'Administrator','2024-08-07 11:43:24.982624','PostingRules','Bad Credit','UPDATE','-','{title :\"Bad Credit\",\n description :\"Bad Creditsasfsd\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok',NULL,'',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1308132024130748402388','2024-08-13 13:07:48.000000','2024-08-13 13:07:48.000000','Administrator','Administrator',0,1,'Administrator','2024-08-13 13:07:48.000000','PostingRulesAccounts','35','UPDATE','-','{postingRule :\"Bad Credit\",\n type :\"Debit\",\n account :\"Member Payments\"}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Bad Credit','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1608162024121044896228','2024-08-16 12:10:44.884885','2024-08-16 12:56:29.510943','admin@plexor.com','Administrator',0,0,'Administrator','2024-08-16 12:10:44.884885','PostingRules','newPosst','INSERT','-','{title :\"newPosst\",\n description :\"newPosst\"}','{admin@plexor.com: approved}',2,'undefined\n\nadmin@plexor.com @16/8/2024 12:16:34\n  -  Approved this update.\n\nadmin@plexor.com @16/8/2024 12:56:29\n  -  Approved this update.',1,'ok',NULL,'31c3949215ff2b27d85357ab2670ea673a5a269b2ade0bdaa869c5d262accebd',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1608162024121051777670','2024-08-16 12:10:51.000000','2024-08-16 12:10:51.000000','Administrator','Administrator',0,1,'Administrator','2024-08-16 12:10:51.000000','PostingRulesAccounts','41','UPDATE','-','{postingRule :\"newPosst\",\n type :\"Debit\",\n account :\"Cashier Deposits\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','newPosst','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1608162024121056403716','2024-08-16 12:10:56.000000','2024-08-16 12:10:56.000000','Administrator','Administrator',0,1,'Administrator','2024-08-16 12:10:56.000000','PostingRulesAccounts','42','UPDATE','-','{postingRule :\"newPosst\",\n type :\"Debit\",\n account :\"Loan Charges\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','newPosst','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1608162024121101193102','2024-08-16 12:11:01.000000','2024-08-16 12:11:01.000000','Administrator','Administrator',0,1,'Administrator','2024-08-16 12:11:01.000000','PostingRulesAccounts','43','UPDATE','-','{postingRule :\"newPosst\",\n type :\"Credit\",\n account :\"Loan Penalty\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','newPosst','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1608162024121108498046','2024-08-16 12:11:08.000000','2024-08-16 12:11:08.000000','Administrator','Administrator',0,1,'Administrator','2024-08-16 12:11:08.000000','PostingRulesAccounts','44','UPDATE','-','{postingRule :\"newPosst\",\n type :\"Credit\",\n account :\"Member Payments\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok','newPosst','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1608162024122154832590','2024-08-16 12:21:54.000000','2024-08-16 12:21:54.000000','Administrator','Administrator',0,1,'Administrator','2024-08-16 12:21:54.000000','PostingRulesAccounts','53','DELETE','-','{postingRule :\"newPosst\",\n type :\"Debit\",\n account :\"Loan Charges\"}','{admin@plexor.com: pending,}',0,NULL,1,'ok','newPosst','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1608162024122203946293','2024-08-16 12:22:03.000000','2024-08-16 12:22:03.000000','Administrator','Administrator',0,1,'Administrator','2024-08-16 12:22:03.000000','PostingRulesAccounts','55','DELETE','-','{postingRule :\"newPosst\",\n type :\"Credit\",\n account :\"Member Payments\"}','{admin@plexor.com: pending,}',0,NULL,1,'ok','newPosst','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1709172024110628183904','2024-09-17 11:06:28.000000','2024-09-17 11:06:28.000000','Administrator','Administrator',0,0,'Administrator','2024-09-17 11:06:28.177990','PostingRules','Posting One','INSERT','-','{title :\"Posting One\",\n description :\"Test post\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok',NULL,'',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1809182024125258797973','2024-09-18 12:52:58.743914','2024-09-18 12:52:58.743914','Administrator','Administrator',0,0,'Administrator','2024-09-18 12:52:58.743914','PostingRules','HeAnother','INSERT','-','{title :\"HeAnother\",\n description :\"Another one\"}','{admin@plexor.com: pending, }',0,NULL,1,'ok',NULL,'ac6c10441adb7502b68fbe9cb04fede5345681a6f91675b4bf62786187302398',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1809182024145450370760','2024-09-18 14:54:50.000000','2024-09-18 14:54:50.000000','Administrator','Administrator',0,1,'Administrator','2024-09-18 14:54:50.000000','PostingRulesAccounts','126','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\",\n type :\"Credit\",\n account :\"Member Payments\"}}','{admin@plexor.com: pending, }',0,NULL,1,'ok','HeAnother','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1809182024150325527577','2024-09-18 15:03:25.000000','2024-09-18 15:03:25.000000','Administrator','Administrator',0,1,'Administrator','2024-09-18 15:03:25.000000','PostingRulesAccounts','127','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\",\n type :\"Debit\",\n account :\"Loan Penalty\"}}','{admin@plexor.com: pending, }',0,NULL,1,'ok','HeAnother','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1809182024150731226481','2024-09-18 15:07:31.000000','2024-09-18 15:07:31.000000','Administrator','Administrator',0,1,'Administrator','2024-09-18 15:07:31.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\",\n type :\"Debit\",\n account :\"Cashier Deposits\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','HeAnother','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1909192024105957527077','2024-09-18 12:52:58.743914','2024-09-19 13:10:06.361772','admin@plexor.com','Administrator',0,0,'Administrator','2024-09-18 12:52:58.743914','PostingRules','HeAnother','UPDATE','-','{title :\"HeAnother\",\n description :\"Another ones\"}','{admin@plexor.com: approved}',2,'undefined\n\nadmin@plexor.com @19/9/2024 11:4:47\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:37:59\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:38:3\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:48:30\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:54:49\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:54:53\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:58:0\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:59:20\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 12:59:27\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 13:7:28\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 13:10:6\n  -  Approved this update.',1,'ok',NULL,'955dc3aaa6a56be62cb347408cfd6725b804ec52d963875f5154601920404d0e',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1909192024131620091213','2024-09-18 12:52:58.743914','2024-09-19 13:16:20.058367','Administrator','Administrator',0,0,'Administrator','2024-09-18 12:52:58.743914','PostingRules','HeAnother','UPDATE','-','{title :\"HeAnother\",\n description :\"Another ones bites\"}','{admin@plexor.com: pending, }',0,NULL,1,'ok',NULL,'ac6c10441adb7502b68fbe9cb04fede5345681a6f91675b4bf62786187302398',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1909192024132053068548','2024-09-19 13:20:53.000000','2024-09-19 13:20:53.000000','Administrator','Administrator',0,1,'Administrator','2024-09-19 13:20:53.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\",\n type :\"Credit\",\n account :\"Penalties\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','HeAnother','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1909192024153143402448','2024-09-19 15:31:43.000000','2024-09-19 15:34:02.613544','admin@plexor.com','Administrator',0,1,'Administrator','2024-09-19 15:31:43.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\",\n type :\"Credit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: approved}',2,'undefined\n\nadmin@plexor.com @19/9/2024 15:32:39\n  -  Approved this update.\n\nadmin@plexor.com @19/9/2024 15:34:2\n  -  Approved this update.',1,'ok','HeAnother','a0a10f0f1fc0b07b5fcd95bd3d6cfb84a0a39d6559dbb5a1f8667646b8725a04',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('1909192024153950586137','2024-09-19 15:39:50.000000','2024-09-20 14:07:55.510191','Administrator','Administrator',0,1,'Administrator','2024-09-19 15:39:50.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\",\n type :\"Debit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: pending}',2,'undefined\n\nAdministrator @20/9/2024 14:7:55\n  -  Approved this update.',1,'ok','HeAnother','a60edc0feb35cd62080c6d8d9227824dc2ce4562f2005f5c28a8320bc1e2ff07',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024122413671943','2024-09-20 12:24:13.000000','2024-09-20 12:24:13.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-20 12:24:13.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\", type :\"Debit\", account :\"Loan Charges\"}}','{Administrator: pending,}',0,NULL,1,'ok','HeAnother','31b4a2a037f0353d636ecdbf83f364b1ba836a55621c478a6419a78c529e3e22',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024131543011571','2024-09-20 13:15:43.000000','2024-09-20 13:15:43.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-20 13:15:43.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\", type :\"Debit\", account :\"Penalties\"}}','{Administrator: pending,}',0,NULL,1,'ok','HeAnother','74f76be657e6c564398be2e89e8eb3c59f5f7d9db7e6048dcf3bc66efea0057c',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024132231526378','2024-09-20 13:22:31.000000','2024-09-20 13:22:31.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-20 13:22:31.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"HeAnother\", \"type\" :\"Debit\", \"account\" :\"Member Payments\"}}','{Administrator: pending,}',0,NULL,1,'ok','HeAnother','eac5f0c2a294343cf5bf082778d05c724aa50195cbeaa6eb6f8c5e065011606c',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024135926024062','2024-09-20 13:59:26.000000','2024-09-20 13:59:26.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-20 13:59:26.000000','PostingRulesAccounts','92','UPDATE','DELETE','{\"parent\":{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites\"}, \"child\":{\"postingRule\" :\"HeAnother\", \"type\" :\"Credit\", \"account\" :\"Member Payments\"}}','{Administrator: pending,}',0,NULL,1,'ok','HeAnother','ca003df164c942c80536b6ea4f1235f67deab4e76253b228648314060c43b735',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024140007881201','2024-09-20 14:00:07.000000','2024-09-20 14:00:07.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-09-20 14:00:07.000000','PostingRulesAccounts','95','UPDATE','DELETE','{\"parent\":{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites\"}, \"child\":{\"postingRule\" :\"HeAnother\", \"type\" :\"Credit\", \"account\" :\"Penalties\"}}','{Administrator: pending,}',0,NULL,1,'ok','HeAnother','d522eb8dba7718cf1ff676d0e656fe48d4be97f99ff65751f6cc53e3fff386d5',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024141207316875','2024-09-18 12:52:58.743914','2024-09-20 14:12:07.282657','Administrator','Administrator',0,0,'Administrator','2024-09-18 12:52:58.743914','PostingRules','HeAnother','UPDATE','','{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites two\"}','{admin@plexor.com: pending, }',0,NULL,1,'ok','','5d0b9f6b84532c9b705f9981955fceccedbdb8ca3449c848a22d59e8838c54c1',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024141259752059','2024-09-18 12:52:58.743914','2024-09-20 14:12:59.679867','Administrator','Administrator',0,0,'Administrator','2024-09-18 12:52:58.743914','PostingRules','HeAnother','UPDATE','','{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites two\"}','{admin@plexor.com: pending, }',0,NULL,1,'ok','','5d0b9f6b84532c9b705f9981955fceccedbdb8ca3449c848a22d59e8838c54c1',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024143040460706','2024-09-18 12:52:58.743914','2024-09-20 14:30:40.407272','Administrator','Administrator',0,0,'Administrator','2024-09-18 12:52:58.743914','PostingRules','HeAnother','UPDATE','','{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites trhee\"}','{admin@plexor.com: pending, }',0,NULL,1,'ok','','ba15f48d75fbe00763912499de7862c16e081201454f66e1ed38f2a28e96ee9c',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024143305913787','2024-09-20 14:33:05.000000','2024-09-20 14:33:05.000000','Administrator','Administrator',0,1,'Administrator','2024-09-20 14:33:05.000000','PostingRulesAccounts','98','UPDATE','DELETE','{\"parent\":{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites trhee\"}, \"child\":{\"postingRule\" :\"HeAnother\", \"type\" :\"Debit\", \"account\" :\"Loan Charges\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','HeAnother','0a2d82a0acef70cda478fc1b07c950f0023b2eea6cae6d9169c573b74f5cc032',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024143317297274','2024-09-20 14:33:17.000000','2024-09-20 14:33:17.000000','Administrator','Administrator',0,1,'Administrator','2024-09-20 14:33:17.000000','PostingRulesAccounts','99','UPDATE','DELETE','{\"parent\":{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites trhee\"}, \"child\":{\"postingRule\" :\"HeAnother\", \"type\" :\"Debit\", \"account\" :\"Penalties\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','HeAnother','212067f8266adbfe3090f07292840bc25cc3d16b7cdeeaf781e73733d1cfa9f1',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024143325993784','2024-09-20 14:33:25.000000','2024-09-20 14:33:25.000000','Administrator','Administrator',0,1,'Administrator','2024-09-20 14:33:25.000000','PostingRulesAccounts','100','UPDATE','DELETE','{\"parent\":{\"title\" :\"HeAnother\", \"description\" :\"Another ones bites trhee\"}, \"child\":{\"postingRule\" :\"HeAnother\", \"type\" :\"Debit\", \"account\" :\"Member Payments\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','HeAnother','501971b8dfd895b5bba4ded18df074c9cd733120314beb48c3e28431a2eab971',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024145843429827','2024-09-20 14:58:43.000000','2024-09-20 14:58:43.000000','Administrator','Administrator',0,0,'Administrator','2024-09-20 14:58:43.000000','PostingRules','HeAnother','DELETE','','{\"children_tables\" : \"Posting Rules Accounts\", \"children_fields\" : \"postingRule\"}','{admin@plexor.com: pending, }',0,'',1,'ok','','d76a44080bc893507774bbbbe5a6a6516e108da0b760191e8a3d8f4b59c8c990',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024150640871412','2024-09-20 15:06:40.000000','2024-09-20 15:06:40.000000','Administrator','Administrator',0,1,'Administrator','2024-09-20 15:06:40.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Debit\", \"account\" :\"Loan Charges\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Posting One','e936e38c6a9b9cd8abadb077fc98e91cdfcfb0422c1ce3218ee5abc2a842aebe',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024150653770167','2024-09-20 15:06:53.000000','2024-09-20 15:06:53.000000','Administrator','Administrator',0,1,'Administrator','2024-09-20 15:06:53.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Debit\", \"account\" :\"Loan Penalty\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Posting One','847afda0ea902a24614b22baefbd236302685ea51627a064e4e46f007ed8d55c',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024150708327425','2024-09-20 15:07:08.000000','2024-09-20 15:07:08.000000','Administrator','Administrator',0,1,'Administrator','2024-09-20 15:07:08.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Credit\", \"account\" :\"Refunds\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Posting One','28560561775bcbf7d9b0e3b634ea2927d8d703bf0f37052a38ac641a8f565fde',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2009202024150721902557','2024-09-20 15:07:21.000000','2024-09-20 15:07:21.000000','Administrator','Administrator',0,1,'Administrator','2024-09-20 15:07:21.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{\"postingRule\" :\"Posting One\", \"type\" :\"Credit\", \"account\" :\"Penalties\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Posting One','564d95a064c319f894726193d09f819964b10bb4e850a41a169eaea1cb2faf1f',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2108212024100743110000','2024-08-21 10:07:43.000000','2024-08-21 10:54:38.329099','admin@plexor.com','admin@plexor.com',0,0,'admin@plexor.com','2024-08-21 10:07:43.084909','PostingRules','hward','INSERT','-','{title :\"hward\",\n description :\"howard uma\"}','{Administrator: pending}',2,'undefined\n\nadmin@plexor.com @21/8/2024 10:54:23\n  -  Approved this update.\n\nadmin@plexor.com @21/8/2024 10:54:38\n  -  Approved this update.',1,'ok',NULL,'9d250cc42fe73d899ee217975bd37314940cffc3801112d40c495097a875f715',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2108212024101158701751','2024-08-21 10:11:58.000000','2024-08-21 10:11:58.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-08-21 10:11:58.000000','PostingRulesAccounts','51','UPDATE','INSERT','{postingRule :\"hward\",\n type :\"Debit\",\n account :\"Cashier Deposits\"}','{Administrator: pending,\n}',0,NULL,1,'ok','hward','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2108212024101203911799','2024-08-21 10:12:03.000000','2024-08-21 10:12:03.000000','admin@plexor.com','admin@plexor.com',0,1,'admin@plexor.com','2024-08-21 10:12:03.000000','PostingRulesAccounts','52','UPDATE','INSERT','{postingRule :\"hward\",\n type :\"Debit\",\n account :\"Member Payments\"}','{Administrator: pending,\n}',0,NULL,1,'ok','hward','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2108212024101234181226','2024-08-21 10:12:34.000000','2024-08-21 10:25:29.250797','admin@plexor.com','admin@plexor.com',0,0,'admin@plexor.com','2024-08-15 16:25:52.814480','PostingRules','Test','DELETE','-','{\"children_tables\" : \"Posting Rules Accounts\", \"children_fields\" : \"postingRule\"}','{admin@plexor.com: approved}',2,'undefined\n\nadmin@plexor.com @21/8/2024 10:22:35\n  -  Approved this update.\n\nadmin@plexor.com @21/8/2024 10:25:29\n  -  Approved this update.',1,'ok',NULL,'8f30597f3e14f3849d25b52e3059628a4c7099b11304c5055c12e34de2d0d3b9',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2108212024103708727450','2024-08-21 10:37:08.000000','2024-08-21 10:37:08.000000','Administrator','Administrator',0,1,'Administrator','2024-08-21 10:37:08.000000','PostingRulesAccounts','46','UPDATE','DELETE','{postingRule :\"Savings Deposits\",\n type :\"Debit\",\n account :\"Penalties\"}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2408242024141951188241','2024-08-24 14:19:51.000000','2024-08-24 14:19:51.000000','Administrator','Administrator',0,1,'Administrator','2024-08-24 14:19:51.000000','PostingRulesAccounts','63','UPDATE','DELETE','{postingRule :\"hward\",\n type :\"Debit\",\n parent_field :\"postingRule\",\n child_field :\"account\",\n account :\"Member Payments\"}','{admin@plexor.com: pending,}',0,NULL,1,'ok','hward','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2408242024150821890396','2024-08-24 15:08:21.000000','2024-08-24 15:08:21.000000','Administrator','Administrator',0,1,'Administrator','2024-08-24 15:08:21.000000','PostingRulesAccounts','53','UPDATE','INSERT','{postingRule :\"hward\",\n type :\"Debit\",\n account :\"Loan Charges\"}','{admin@plexor.com: pending,}',0,NULL,1,'ok','hward','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2408242024150833354770','2024-08-24 15:08:33.000000','2024-08-24 15:08:33.000000','Administrator','Administrator',0,1,'Administrator','2024-08-24 15:08:33.000000','PostingRulesAccounts','54','UPDATE','INSERT','{postingRule :\"hward\",\n type :\"Debit\",\n account :\"Member Payments\"}','{admin@plexor.com: pending,}',0,NULL,1,'ok','hward','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2408242024154837472592','2024-08-24 15:48:37.000000','2024-08-24 15:48:37.000000','Administrator','Administrator',0,1,'Administrator','2024-08-24 15:48:37.000000','PostingRulesAccounts','65','UPDATE','DELETE','{}','{admin@plexor.com: pending,}',0,NULL,1,'ok','hward','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2708272024143323573383','2024-08-27 14:33:23.000000','2024-08-27 14:33:23.000000','Administrator','Administrator',0,1,'Administrator','2024-08-27 14:33:23.000000','PostingRulesAccounts','43','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Tsken\"}, \"child\":{parent_value :\"Savings Deposits\",\n type :\"Debit\",\n child_value :\"Loan Charges\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2708272024152839248278','2024-08-27 15:28:39.000000','2024-08-27 15:28:39.000000','Administrator','Administrator',0,1,'Administrator','2024-08-27 15:28:39.000000','PostingRulesAccounts','48','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Tsken\"}, \"child\":{parent_value :\"Savings Deposits\",\n type :\"Credit\",\n child_value :\"Loan Penalty\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2708272024163533308525','2024-08-27 16:35:33.000000','2024-08-27 16:35:33.000000','Administrator','Administrator',0,1,'Administrator','2024-08-27 16:35:33.000000','PostingRulesAccounts','49','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Tsken\"}, \"child\":{parent_value :\"Savings Deposits\",\n type :\"Credit\",\n child_value :\"Penalties\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2808282024085938661948','2024-08-28 08:59:38.000000','2024-08-28 08:59:38.000000','Administrator','Administrator',0,1,'Administrator','2024-08-28 08:59:38.000000','PostingRulesAccounts','51','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Tsken\"}, \"child\":{parent_value :\"Savings Deposits\",\n type :\"Credit\",\n child_value :\"Penalties\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2908292024094718189402','2024-08-29 09:47:18.000000','2024-08-29 11:42:57.772162','admin@plexor.com','Administrator',0,1,'Administrator','2024-08-29 09:47:18.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"Savings Deposits\",\n type :\"Credit\",\n account :\"Member Payments\"}}','{admin@plexor.com: approved}',2,'undefined\n\nadmin@plexor.com @29/8/2024 10:43:17\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 10:46:9\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:0:39\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:3:40\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:4:45\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:4:51\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:8:7\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:8:39\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:8:42\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:9:32\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:10:33\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:10:42\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:11:37\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:12:44\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:12:49\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:13:22\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:36:26\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:36:34\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:37:51\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:38:57\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:39:3\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:40:23\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 11:42:57\n  -  Approved this update.',1,'ok','Savings Deposits','5b33e26aa719e16a8f1e997e064d01d799e2fd6fd7d24bc27ac13a905fd6a4dc',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2908292024094727876865','2024-08-29 09:47:27.000000','2024-08-29 09:47:27.000000','Administrator','Administrator',0,1,'Administrator','2024-08-29 09:47:27.000000','PostingRulesAccounts','46','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Tsken\"}, \"child\":{postingRule :\"Savings Deposits\",\n type :\"Debit\",\n account :\"Penalties\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2908292024094917765729','2024-08-29 09:49:17.000000','2024-08-29 09:49:17.000000','Administrator','Administrator',0,1,'Administrator','2024-08-29 09:49:17.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"Savings Deposits\",\n type :\"Credit\",\n account :\"Penalties\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2908292024121543214675','2024-08-29 12:15:43.000000','2024-08-29 12:15:43.000000','Administrator','Administrator',0,1,'Administrator','2024-08-29 12:15:43.000000','PostingRulesAccounts','','UPDATE','INSERT','{\"child\":{postingRule :\"Savings Deposits\",\n type :\"Debit\",\n account :\"Loan Charges\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2908292024121555341292','2024-08-29 12:15:55.000000','2024-08-29 12:15:55.000000','Administrator','Administrator',0,1,'Administrator','2024-08-29 12:15:55.000000','PostingRulesAccounts','44','UPDATE','DELETE','{\"parent\":{title :\"Savings Deposits\",\n description :\"Savings Deposits Tsken\"}, \"child\":{postingRule :\"Savings Deposits\",\n type :\"Debit\",\n account :\"Refunds\"}}','{admin@plexor.com: pending,}',0,NULL,1,'ok','Savings Deposits','',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2908292024132528794416','2024-08-29 13:25:28.000000','2024-08-29 13:25:28.000000','Administrator','Administrator',0,0,'Administrator','2024-08-15 09:19:01.010987','PostingRules','Savings Deposits','UPDATE','-','{title :\"Savings Deposits\",\n description :\"Savings Deposits Taken\"}','{admin@plexor.com: pending,\n}',0,NULL,1,'ok',NULL,'',0);
insert  into `plexMakerCheckerLogs`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`creator`,`stamp`,`document`,`document_id`,`trx_type`,`child_trx_type`,`values`,`checkers`,`check_status`,`checker_comments`,`posted_status`,`posted_result`,`parent`,`sig`,`sig_status`) values ('2908292024134140659858','2024-08-29 13:41:40.000000','2024-08-29 13:54:28.635454','admin@plexor.com','Administrator',0,0,'Administrator','2024-08-15 09:19:01.010987','PostingRules','Savings Deposits','UPDATE','-','{title :\"Savings Deposits\",\n description :\"Savings Deposits Taken\"}','{admin@plexor.com: approved}',2,'undefined\n\nadmin@plexor.com @29/8/2024 13:42:5\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 13:43:16\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 13:43:45\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 13:44:19\n  -  Approved this update.\n\nadmin@plexor.com @29/8/2024 13:54:28\n  -  Approved this update.',1,'ok',NULL,'3a92ae7e513ed05ed8d2702907eaaf8ec9dea5b83ebdb3e1beb6c20e8cdf0f25',0);

/*Table structure for table `plexParentChild` */

DROP TABLE IF EXISTS `plexParentChild`;

CREATE TABLE `plexParentChild` (
  `name` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(50) NOT NULL,
  `child` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexParentChild` */

insert  into `plexParentChild`(`name`,`parent`,`child`) values (1,'PostingRules','PostingRulesAccounts');

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

/*Table structure for table `plexPermissions` */

DROP TABLE IF EXISTS `plexPermissions`;

CREATE TABLE `plexPermissions` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(40) DEFAULT NULL,
  `description` varchar(140) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  UNIQUE KEY `permissiontitle` (`title`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPermissions` */

insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Account Mapping - View',NULL,NULL,NULL,NULL,0,0,'Account Mapping - View',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Maker-Checker - Edit',NULL,NULL,NULL,NULL,0,0,'Maker-Checker - Edit',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Maker-Checker - View',NULL,NULL,NULL,NULL,0,0,'Maker-Checker - View',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Posting Rules - Add',NULL,NULL,NULL,NULL,0,0,'Posting Rules - Add',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Posting Rules - Approve',NULL,NULL,NULL,NULL,0,0,'Posting Rules - Approve',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Posting Rules - Delete',NULL,NULL,NULL,NULL,0,0,'Posting Rules - Delete',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Posting Rules - Edit',NULL,NULL,NULL,NULL,0,0,'Posting Rules - Edit',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Posting Rules - View',NULL,NULL,NULL,NULL,0,0,'Posting Rules - View',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Settings - Add',NULL,NULL,NULL,NULL,0,0,'Settings - Add',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Settings - Approve',NULL,NULL,NULL,NULL,0,0,'Settings - Approve',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Settings - Delete',NULL,NULL,NULL,NULL,0,0,'Settings - Delete',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Settings - Edit',NULL,NULL,NULL,NULL,0,0,'Settings - Edit',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Settings - View',NULL,NULL,NULL,NULL,0,0,'Settings - View',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('User Roles - Add',NULL,NULL,NULL,NULL,0,0,'User Roles - Add',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('User Roles - Approve',NULL,NULL,NULL,NULL,0,0,'User Roles - Approve',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('User Roles - Delete',NULL,NULL,NULL,NULL,0,0,'User Roles - Delete',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('User Roles - Edit',NULL,NULL,NULL,NULL,0,0,'User Roles - Edit',NULL,NULL,0);
insert  into `plexPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('User Roles - View',NULL,NULL,NULL,NULL,0,0,'User Roles - View',NULL,NULL,0);

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
  KEY `plexPostingRulesusers2` (`owner`),
  CONSTRAINT `plexPostingRulesusers` FOREIGN KEY (`modified_by`) REFERENCES `plexUser` (`name`),
  CONSTRAINT `plexPostingRulesusers2` FOREIGN KEY (`owner`) REFERENCES `plexUser` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRules` */

insert  into `plexPostingRules`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('Posting One','2024-09-17 11:06:28.177990','2024-09-17 11:06:28.177990','Administrator','Administrator',0,0,'Posting One','Test post','e8a537d5b352294be2b06de416c9eb76424cccc76491e881e9d0a2663b6b1d3d',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexPostingRulesAccounts` */

insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (101,'2024-09-20 15:06:40.000000','2024-09-20 15:06:40.000000','Administrator','Administrator',0,0,'Posting One','Debit','Loan Charges','39602b6d51d20863d1d2b42981226394fee9aca066058298a315c9b0b541d634',0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (102,'2024-09-20 15:06:53.000000','2024-09-20 15:06:53.000000','Administrator','Administrator',0,0,'Posting One','Debit','Loan Penalty','cf18dd2d865f234e847089eb71f9f9a31987d91f6d7b99a92375c0ad4b8d4a12',0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (103,'2024-09-20 15:07:08.000000','2024-09-20 15:07:08.000000','Administrator','Administrator',0,0,'Posting One','Credit','Refunds','98691fbfe674abf0db6d986ab067f8bbf08d2a99a74a219ec8f04eb7f0e93a44',0);
insert  into `plexPostingRulesAccounts`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`postingRule`,`type`,`account`,`sig`,`sig_status`) values (104,'2024-09-20 15:07:21.000000','2024-09-20 15:07:21.000000','Administrator','Administrator',0,0,'Posting One','Credit','Penalties','40140c57a79cd3c11956b47ac9b32f33bc1bac300eb46262f250cef2d5e47ca3',0);

/*Table structure for table `plexRoles` */

DROP TABLE IF EXISTS `plexRoles`;

CREATE TABLE `plexRoles` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(40) DEFAULT NULL,
  `description` varchar(140) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexRoles` */

insert  into `plexRoles`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`description`,`sig`,`sig_status`) values ('SuperUser',NULL,NULL,NULL,NULL,0,0,'SuperUser','System Administrator',NULL,0);

/*Table structure for table `plexRolesPermissions` */

DROP TABLE IF EXISTS `plexRolesPermissions`;

CREATE TABLE `plexRolesPermissions` (
  `name` int(11) NOT NULL AUTO_INCREMENT,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `role` varchar(40) DEFAULT NULL,
  `permission` varchar(140) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexRolesPermissions` */

insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (1,NULL,NULL,NULL,NULL,0,0,'SuperUser','Posting Rules - View',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (2,NULL,NULL,NULL,NULL,0,0,'SuperUser','Posting Rules - Add',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (3,NULL,NULL,NULL,NULL,0,0,'SuperUser','Posting Rules - Edit',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (4,NULL,NULL,NULL,NULL,0,0,'SuperUser','Posting Rules - Delete',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (5,NULL,NULL,NULL,NULL,0,0,'SuperUser','Posting Rules - Approve',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (6,NULL,NULL,NULL,NULL,0,0,'SuperUser','Account Mapping - View',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (7,NULL,NULL,NULL,NULL,0,0,'SuperUser','Maker-Checker - View',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (8,NULL,NULL,NULL,NULL,0,0,'SuperUser','Settings - View',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (9,NULL,NULL,NULL,NULL,0,0,'SuperUser','Settings - Edit',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (10,NULL,NULL,NULL,NULL,0,0,'SuperUser','Settings - Delete',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (11,NULL,NULL,NULL,NULL,0,0,'SuperUser','Settings - Approve',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (12,NULL,NULL,NULL,NULL,0,0,'SuperUser','User Roles - View',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (13,NULL,NULL,NULL,NULL,0,0,'SuperUser','User Roles - Edit',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (14,NULL,NULL,NULL,NULL,0,0,'SuperUser','User Roles - Add',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (15,NULL,NULL,NULL,NULL,0,0,'SuperUser','User Roles - Delete',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (16,NULL,NULL,NULL,NULL,0,0,'SuperUser','User Roles - Approve',NULL,0);
insert  into `plexRolesPermissions`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`role`,`permission`,`sig`,`sig_status`) values (17,NULL,NULL,NULL,NULL,0,0,'SuperUser','Maker-Checker - Edit',NULL,0);

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
  `type` varchar(50) DEFAULT NULL,
  `setting` varchar(140) DEFAULT NULL,
  `codename` varchar(30) DEFAULT NULL,
  `value` varchar(140) DEFAULT NULL,
  `value2` varchar(140) DEFAULT NULL,
  `value3` varchar(140) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `sig` char(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`),
  KEY `plexSettingusers` (`modified_by`),
  KEY `plexSettingusers2` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexSetting` */

insert  into `plexSetting`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`type`,`setting`,`codename`,`value`,`value2`,`value3`,`status`,`sig`,`sig_status`) values ('1',NULL,NULL,NULL,NULL,0,0,'GENERAL','Enable maker-checker','ENABLE_MKCHKR','yes','3',NULL,1,NULL,0);
insert  into `plexSetting`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`type`,`setting`,`codename`,`value`,`value2`,`value3`,`status`,`sig`,`sig_status`) values ('2',NULL,NULL,NULL,NULL,0,0,'MCHECKER','Maker-Checker - Edit','MAKERCHECKER_EDIT','yes','3',NULL,1,NULL,0);
insert  into `plexSetting`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`type`,`setting`,`codename`,`value`,`value2`,`value3`,`status`,`sig`,`sig_status`) values ('3',NULL,NULL,NULL,NULL,0,0,'MCHECKER','Posting Rules - Delete','POSTINGRULES_DELETE','yes','3',NULL,1,NULL,0);
insert  into `plexSetting`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`type`,`setting`,`codename`,`value`,`value2`,`value3`,`status`,`sig`,`sig_status`) values ('4',NULL,NULL,NULL,NULL,0,0,'MCHECKER','Posting Rules - Insert','POSTINGRULES_INSERT','yes','3',NULL,1,NULL,0);
insert  into `plexSetting`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`type`,`setting`,`codename`,`value`,`value2`,`value3`,`status`,`sig`,`sig_status`) values ('5',NULL,NULL,NULL,NULL,0,0,'MCHECKER','Posting Rules - Update','POSTINGRULES_UPDATE','yes','2',NULL,1,NULL,0);
insert  into `plexSetting`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`type`,`setting`,`codename`,`value`,`value2`,`value3`,`status`,`sig`,`sig_status`) values ('6',NULL,NULL,NULL,NULL,0,0,'MCHECKER','Posting Rules - Apprpvers Count','POSTINGRULES_APPROVERS_COUNT','yes','3',NULL,1,NULL,0);
insert  into `plexSetting`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`type`,`setting`,`codename`,`value`,`value2`,`value3`,`status`,`sig`,`sig_status`) values ('7',NULL,NULL,NULL,NULL,0,0,'MCHECKER','Posting Rules - Fixed Approvers','POSTINGRULES_FIXED_APPROVERS','yes','3',NULL,0,NULL,0);

/*Table structure for table `plexSettingType` */

DROP TABLE IF EXISTS `plexSettingType`;

CREATE TABLE `plexSettingType` (
  `name` varchar(140) NOT NULL,
  `creation` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `modified_by` varchar(140) DEFAULT NULL,
  `owner` varchar(140) DEFAULT NULL,
  `docstatus` int(1) NOT NULL DEFAULT 0,
  `idx` int(8) NOT NULL DEFAULT 0,
  `title` varchar(140) DEFAULT NULL,
  `general` varchar(140) DEFAULT '1',
  `security` varchar(140) DEFAULT '1',
  `savings` varchar(140) DEFAULT '1',
  `loans` varchar(140) DEFAULT '1',
  `maker_checker` varchar(140) DEFAULT '1',
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexSettingType` */

insert  into `plexSettingType`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`title`,`general`,`security`,`savings`,`loans`,`maker_checker`,`sig`,`sig_status`) values ('Default Settings','2024-07-29 05:48:13.126241','2024-07-29 13:37:07.524615','Administrator','Administrator',0,0,'Default Settings','None','None','None','None','None','d63265ccad088af3a2744cde3d814dd6994f7da8a29d5352c2aab8e847c2e119',0);

/*Table structure for table `plexTableMapping` */

DROP TABLE IF EXISTS `plexTableMapping`;

CREATE TABLE `plexTableMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctype_name` varchar(150) DEFAULT NULL,
  `doctype` varchar(150) DEFAULT NULL,
  `table_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexTableMapping` */

insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (1,'AccountMapping','Account Mapping','plexAccountMapping');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (2,'LoanProduct','Loan Product','plexLoanProduct');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (3,'SavingAccount','Saving Account','plexSavingAccount');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (4,'Branch','Branch','plexBranch');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (5,'Address','Address','plexAddress');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (6,'AccountMapping','Account Mapping','plexAccountMapping');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (8,'PostingRules','Posting Rules','plexPostingRules');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (9,'Employer','Employer','plexEmployer');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (10,'ClientCharge','Client Charge','plexClientCharge');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (11,'PostingJournals','Posting Journals','plexPostingJournals');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (12,'Currency','Currency','plexCurrency');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (13,'Payment','Payment','plexPayment');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (14,'GroupMember','Group Member','plexGroupMember');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (15,'MakerChecker','Maker-Checker','plexMakerChecker');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (16,'TrxQueue','TrxQueue','plexTrxQueue');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (18,'Loan','Loan','plexLoan');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (19,'Client','Client','plexClient');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (22,'Teller','Teller','plexTeller');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (23,'SavingCharge','Saving Charge','plexSavingCharge');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (24,'SettingType','Setting Type','plexSettingType');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (25,'MakerCheckerLogs','Maker-Checker-Logs','plexMakerCheckerLogs');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (26,'Settings','Settings','plexSetting');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (27,'LoanApplication','Loan Application','plexLoanApplication');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (28,'Country','Country','plexCountry');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (29,'LoanCharge','Loan Charge','plexLoanCharge');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (31,'Guarantor','Guarantor','plexGuarantor');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (33,'Document','Document','plexDocument');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (34,'LoanAccount','Loan Account','plexLoanAccount');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (35,'ClientType','Client Type','plexClientType');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (36,'User','User','plexUser');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (37,'PostingRulesAccounts','Posting Rules Accounts','plexPostingRulesAccounts');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (38,'notify_messages','notify_messages','notify_messages');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (39,'SavingProduct','Saving Product','plexSavingProduct');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (40,'LoanSchedule','Loan Schedule','plexLoanSchedule');
insert  into `plexTableMapping`(`id`,`doctype_name`,`doctype`,`table_name`) values (41,'UserRoles','User Roles','plexRoles');

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
  `role` varchar(140) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `sig_status` int(11) DEFAULT 0,
  PRIMARY KEY (`name`),
  UNIQUE KEY `user` (`user`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plexUser` */

insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`role`,`sig`,`sig_status`) values ('admin@plexor.com','2024-07-16 13:35:42.000000','2024-07-16 13:35:42.000000','admin@plexor.com','admin@plexor.com',1,1,'admin@plexor.com',1,'SuperUser','-',0);
insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`role`,`sig`,`sig_status`) values ('Administrator','2024-07-13 13:03:36.000000','2024-07-13 13:03:32.000000','Administrator','Administrator',0,0,'Administrator',1,'SuperUser',NULL,0);
insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`role`,`sig`,`sig_status`) values ('charles@gmail.com','2024-07-13 13:03:32.000000','2024-07-13 13:03:32.000000',NULL,NULL,0,0,'charles@gmail.com',1,'SuperUser',NULL,0);
insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`role`,`sig`,`sig_status`) values ('dena@gmail.com','2024-07-13 13:03:32.000000','2024-07-13 13:03:32.000000',NULL,NULL,0,0,'dena@gmail.com',1,'SuperUser',NULL,0);
insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`role`,`sig`,`sig_status`) values ('james@gmail.com','2024-07-13 13:03:32.000000','2024-07-13 13:03:32.000000',NULL,NULL,0,0,'james@gmail.com',1,'SuperUser',NULL,0);
insert  into `plexUser`(`name`,`creation`,`modified`,`modified_by`,`owner`,`docstatus`,`idx`,`user`,`status`,`role`,`sig`,`sig_status`) values ('tina@gmail.com','2024-07-13 13:03:32.000000','2024-07-13 13:03:32.000000',NULL,NULL,0,0,'tina@gmail.com',1,'SuperUser',NULL,0);

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
