-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: toucan_production
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_details`
--

DROP TABLE IF EXISTS `account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT 'Gladiator',
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_details`
--

LOCK TABLES `account_details` WRITE;
/*!40000 ALTER TABLE `account_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `gender` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `oauth_expires_at` datetime DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `privilege` varchar(255) DEFAULT 'user',
  `channel_key` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_accounts_on_email` (`email`),
  UNIQUE KEY `index_accounts_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Abel','Bezu','abel.bezu@yahoo.com',NULL,'CAAIqZCcApcmMBAAWs8R8qqZC7rIPvva5tte49jFsjnTuh94mLOwRaD6KvoBdjAvrjtGHcYnwX0tEUTSuYgcDZCCHXyP1jlpUNqHjd5cmHANe5eZCJpTZB2k3CZB7d9PaxVSZCCC72qqruIqALVqxaUGg351cPPrh37veIqgAwJKDOIT2Si599zP7YMliDqdhf1PDv7QskzG8xDNcI7dLahm','facebook',NULL,'2015-08-23 03:36:41','Abel','2015-06-24 19:35:10','2015-08-10 15:10:51',NULL,'user','GD4jV9sB2GKIoqPIvXLNcA','$2a$10$ktV1GFsR.ihLh19c.y70yOKRrkx0NnHFYT0euhHDw.D6IBDGto3J2',NULL,NULL,NULL,9,'2015-08-10 15:10:51','2015-08-10 14:57:21','18.85.55.5','18.85.55.5',NULL,'2015-06-24 19:35:09',NULL,NULL,10205692820617779),(2,'Some','Other','abelbezu@mit.edu',NULL,NULL,NULL,NULL,NULL,'SUser','2015-06-24 19:37:05','2015-08-25 21:39:40',NULL,'user','4m4Hq2bdJgr3M9fqa2jGLg','$2a$10$Kmpv9wzt5LP7CYyWkGH/puDebdhB7lccDSrqI3luinyZFrjHZCc5.',NULL,NULL,NULL,7,'2015-08-25 21:39:40','2015-08-19 13:38:27','18.111.15.246','73.54.184.122','5b1a1e11ed77b614158fa6c1040583015189a371e7cc8a86818f9d758a359a33','2015-08-04 20:39:51','2015-08-04 20:39:41',NULL,NULL),(3,'Abel','Tadesse','abelbezu2@yahoo.com',NULL,NULL,NULL,NULL,NULL,'Abel','2015-06-24 19:40:29','2015-06-24 19:40:29',NULL,'user','EHM4Cf3qUYl26yHfI3oNRA','$2a$10$TQC.3uuR1.z0iNSxwuGpaOxOSSpt7e.Utm..qRyByMAM2CoWrp8uS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'a26a8c574629d4751ab1e5444941c29351bcf56d721a48eeebb28abe56e5a248',NULL,'2015-06-24 19:40:29',NULL,NULL),(4,'Abel','Tadesse','abelbezu2@gmail.com',NULL,NULL,NULL,NULL,NULL,'Abel','2015-06-24 19:46:57','2015-08-25 21:45:07',NULL,'super','L7DMIhrtpQ6hI6wHxteoGA','$2a$10$jYgABE86Equ65T1AFctyj.8NtoQoUUprd3XKG9dnvI6UYvudPPTju',NULL,NULL,NULL,20,'2015-08-25 21:45:07','2015-08-21 15:43:54','18.111.15.246','73.54.184.122','45c9b900c762f4f34207a255f4715bcc3298a480b95ad4aef26e4dbfd41114ed','2015-06-24 19:47:07','2015-06-24 19:46:57',NULL,NULL),(5,'William','Powers','bill@williampowers.com',NULL,NULL,NULL,NULL,NULL,'William Powers','2015-06-24 19:58:01','2015-08-27 21:12:57',NULL,'tester','nMcl4INS7fW6P810zlSLfQ','$2a$10$OvM0mfW4Y9CZHiAXiwInYeCETwxc7fcSoKMDUwoZ89dscEPEblnPC',NULL,NULL,NULL,34,'2015-08-27 21:12:12','2015-08-27 20:37:46','73.186.128.131','73.186.128.131','7c896ddfdb963e45aad532fb603388056801935d3a44dec59b0d8d49703c4535','2015-06-24 19:58:19','2015-06-24 19:58:01',NULL,NULL),(6,'abcd','efgh','lavanya.prashanth@gmail.com',NULL,NULL,NULL,NULL,NULL,'ABCD','2015-06-26 19:44:46','2015-06-26 19:45:35',NULL,'user','UASrpxeiP5RkWp5QuoeL9w','$2a$10$rT/D.azzcr9W0tQPxp1fcuOYDFP7/xOm39PaIFF4Z.omij0snkG7S',NULL,NULL,NULL,1,'2015-06-26 19:45:35','2015-06-26 19:45:35','18.85.25.118','18.85.25.118','8c195f2b8580e64362aff7e9702c27878f9c4e5eae40b91ac568268447141d77','2015-06-26 19:45:10','2015-06-26 19:44:47',NULL,NULL),(7,'Steve','Simon','sevestimon@aol.com',NULL,NULL,NULL,NULL,NULL,'Steve Simon','2015-06-27 00:17:52','2015-06-27 01:42:28',NULL,'user','JsEQHDHpXYHPtRK5O8uGUg','$2a$10$P5z1z9rFeY1a5YjCxeLnWOssZKIfkBHHMeNmKt7MqNYKZXMm0fCIW',NULL,NULL,NULL,1,'2015-06-27 01:42:28','2015-06-27 01:42:28','76.24.161.10','76.24.161.10','d6d78531ab1c3ba22bf25a316063f65255556cb83330ac64eabecca1d0923530','2015-06-27 01:42:16','2015-06-27 00:17:52',NULL,NULL),(8,'Martin','Saveski','saveski.martin@gmail.com',NULL,NULL,NULL,NULL,NULL,'msaveski','2015-07-14 21:25:15','2015-07-15 19:05:52',NULL,'user','JRLlTQyiVFiSFCEJwU3HqA','$2a$10$5uTsJHN4dMrNYD31es8U1.WHmKl7Cu2zPGJyO1HLzbLz4Z0xOi8.a',NULL,NULL,NULL,2,'2015-07-15 19:05:52','2015-07-14 21:26:37','18.189.14.100','18.189.14.100','fc805d929df335d7115b31cfaba98f98b38df103c42c5721e716a21d7f54b47a','2015-07-14 21:25:59','2015-07-14 21:25:15',NULL,NULL),(9,'Martha','Sherrill','martha@marthasherrill.com',NULL,NULL,NULL,NULL,NULL,'SherrillMart','2015-08-18 23:58:12','2015-08-27 00:40:13',NULL,'user','a92e5gxH-q5lt3o5IwhGxQ','$2a$10$IeDWgiWRCZopZLyM5fo8z.ywzFPr3lOjyLoYCAOJXWgRuw.20eWBu',NULL,NULL,NULL,3,'2015-08-27 00:40:13','2015-08-19 13:54:35','73.186.128.131','73.186.128.131',NULL,NULL,NULL,NULL,NULL),(10,'Martin','Saveski','msaveski@mit.edu',NULL,NULL,NULL,NULL,NULL,'martin','2015-08-19 12:33:37','2015-08-19 12:33:37',NULL,'user','Zv_8uNBVWUh_crbTUMThaw','$2a$10$0.F/1SvY7g8pGtNlOXHOB.86aZll6O2ErafpEr6mZeOeerfZIliXG',NULL,NULL,NULL,1,'2015-08-19 12:33:37','2015-08-19 12:33:37','77.28.248.120','77.28.248.120',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `challenger_id` int(11) DEFAULT NULL,
  `challengee_id` int(11) DEFAULT NULL,
  `challengee_email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT 'accepted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (1,23,5,1,NULL,'2015-08-04 20:57:45','2015-08-04 20:57:45','accepted'),(2,24,4,1,NULL,'2015-08-10 15:08:04','2015-08-10 15:08:04','accepted'),(3,25,5,1,NULL,'2015-08-10 17:06:07','2015-08-10 17:06:07','accepted'),(4,26,4,1,NULL,'2015-08-14 14:16:01','2015-08-14 14:16:01','accepted'),(5,27,5,NULL,'martha@marthasherrill.com','2015-08-18 17:16:48','2015-08-18 17:16:48','accepted'),(6,28,5,8,NULL,'2015-08-18 17:19:50','2015-08-18 17:19:50','accepted'),(7,29,5,2,NULL,'2015-08-18 17:27:45','2015-08-18 17:27:45','accepted'),(8,30,5,1,NULL,'2015-08-25 21:36:12','2015-08-25 21:36:12','accepted'),(9,31,5,4,NULL,'2015-08-25 21:48:55','2015-08-25 21:48:55','accepted'),(10,32,5,NULL,'williampnpowers@gmail.com','2015-08-26 23:54:44','2015-08-26 23:54:44','accepted'),(11,33,5,9,NULL,'2015-08-26 23:57:49','2015-08-26 23:57:49','accepted'),(12,36,9,NULL,'Bill@williampowers.com','2015-08-27 01:07:06','2015-08-27 01:07:06','accepted'),(13,37,5,10,NULL,'2015-08-27 21:01:39','2015-08-27 21:01:39','accepted');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `reply_level` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `main_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_account_id` (`account_id`),
  KEY `index_comments_on_post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,3,0,'2015-07-14 18:01:41','2015-07-14 18:01:41',NULL),(2,5,4,0,'2015-07-14 18:48:21','2015-07-14 18:48:21',NULL),(3,5,12,0,'2015-07-14 18:55:02','2015-07-14 18:55:02',NULL),(4,8,27,0,'2015-07-15 19:07:25','2015-07-15 19:07:25',NULL),(5,8,29,0,'2015-07-15 19:10:12','2015-07-15 19:10:12',NULL),(6,1,31,0,'2015-08-04 21:47:58','2015-08-04 21:47:58',NULL),(7,5,30,0,'2015-08-10 17:00:01','2015-08-10 17:00:01',NULL),(8,5,30,0,'2015-08-10 17:00:10','2015-08-10 17:00:10',NULL),(9,5,37,0,'2015-08-10 17:28:41','2015-08-10 17:28:41',NULL),(10,5,45,0,'2015-08-13 19:16:58','2015-08-13 19:16:58',NULL),(11,10,65,0,'2015-08-28 11:27:53','2015-08-28 11:27:53',NULL),(12,10,65,0,'2015-08-28 11:28:28','2015-08-28 11:28:28',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_owner_id` int(11) DEFAULT NULL,
  `content_owner_type` varchar(255) DEFAULT NULL,
  `content_type` varchar(5) DEFAULT 'text',
  `content_body` text,
  `likes` int(11) DEFAULT '0',
  `dislikes` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contents_on_content_owner_id_and_content_owner_type` (`content_owner_id`,`content_owner_type`),
  KEY `index_contents_on_topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,1,'Post','text','Apples rules. Oh yeah.',0,0,'2015-06-24 20:03:05','2015-06-24 20:03:05',NULL,NULL,NULL),(2,2,'Post','text','I think linux computers are better',0,0,'2015-06-24 20:03:21','2015-06-24 20:03:21',NULL,NULL,NULL),(3,3,'Post','text','You are an MIT person. Not typical.',0,0,'2015-06-24 20:03:39','2015-06-24 20:03:39',NULL,NULL,NULL),(4,4,'Post','text','Yeah, sure but even for other people linux can be useful',0,0,'2015-06-24 20:03:59','2015-06-24 20:03:59',NULL,NULL,NULL),(5,5,'Post','text','No, it\'s too hard for us.',0,0,'2015-06-24 20:04:11','2015-06-24 20:04:11',NULL,NULL,NULL),(6,6,'Post','text','Sure? there are some user friendly versions',0,0,'2015-06-24 20:04:28','2015-06-24 20:04:28',NULL,NULL,NULL),(7,7,'Post','text','Well to be honest, I\'ve never tried it.',0,0,'2015-06-24 20:04:39','2015-06-24 20:04:39',NULL,NULL,NULL),(8,8,'Post','text','That is probably why you dont like it. I think you should try ubuntu',0,0,'2015-06-24 20:04:59','2015-06-24 20:04:59',NULL,NULL,NULL),(9,9,'Post','text','I\'ve heard of ubuntu. But I\'m also an MIT person. OK I think you make a good point: try it before you condemn it. WHITE FLAG!',0,0,'2015-06-24 20:05:35','2015-06-24 20:05:35',NULL,NULL,NULL),(10,10,'Post','text','Yeah!',0,0,'2015-06-24 20:05:48','2015-06-24 20:05:48',NULL,NULL,NULL),(11,11,'Post','text','I did not expect the SC to coincide with our discussion, but it did. In Justice Kennedy\'s last paragraph where he says that under the US Constitution, same-sex couples have the right not to be excluded from \"one of civilization\'s oldest institutions\" -- that is my basic take. Civilization has been evolving for thousands of years and it has produced institutions that have great social, cultural and moral value. Marriage tops the list, in my opinion. That we have reached the point where we can extend marriage to a class of people who have been excluded from it and want to make this huge commitment to each other -- to me that is civilization at once reaffirming its oldest principles and refreshing them for our time. Democracy moving forward.',0,0,'2015-06-27 02:04:16','2015-06-27 02:04:16',NULL,NULL,NULL),(12,12,'Post','text','While I would agree that an inclusive society is best.  Marriage is an institution that transcends government & takes it\'s roots in religion.  Many marriages are not rooted in religious beliefs & are state sanctioned arrangements many marriages are very religious in nature & ceremony.  A truly inclusive society allows room for the atheist, Christian, Taoist etc.  Because marriage has at it\'s root sprung from churches of all denominations to becomes problematic & discriminatory for the government to take this religious practice & water down it\'s traditional definition.  A much fairer arrangement isfor the state to recognize same sex unions as just that & apply the law equally to those unions.  Same sex unions can lobby churches for recogniti',0,0,'2015-06-27 02:23:04','2015-06-27 02:23:04',NULL,NULL,NULL),(13,13,'Post','text','Of course you\'re right that marriage figures in many (certainly all major) religious faiths. But at is core, this is not about that; it\'s about state-sanctioned marriage, which has its own history and frameworks. In our country church and state are separate. True, marriage is one institution in which you might say their authority overlaps. But that doesn\'t mean the state should allow any religious faith (or religion writ large) to define its take on the protections afforded by the Constitution. ',0,0,'2015-06-27 02:29:55','2015-06-27 02:29:55',NULL,NULL,NULL),(14,14,'Post','text','I propose nothing else than equality but under ANOTHER name which allows this institution that has been administerd by the churches for  1000\'s of years & recognized by states for 100\'s of years to exist , while granting the same state rights etc. to same sex couples. Words are supposed to have meaning & this new arrangement needs a new word. Swedes recognize unmarried couples as \"Sambo \" meaning together.  This way all groups are equally respected.  Some churches could & do recognize gay unions under this.  Catholics don\'t recognize abortion & yet government does\r\n',0,0,'2015-06-27 02:41:49','2015-06-27 02:41:49',NULL,NULL,NULL),(15,15,'Post','text','But why does it need a new word? People are people. Yes as always we have lots of men and women who are sexually attracted to each other and want to marry and reproduce. But most people (including religious ones) no longer believe that the reproduction afforded by male-female sex is the only purpose of marriage. Meanwhile, we\'ve ALWAYS had people who were attracted to their own sex. For 1000s of years they had to hide it and marriage wasn\'t even remotely an option. Today we changed that. Isn\'t that progress?',0,0,'2015-06-27 02:47:50','2015-06-27 02:47:50',NULL,NULL,NULL),(16,16,'Post','text','Because the word marriage has always referred to the union of a man & a woman!  & it took a Supreme court ruling to change the law. In roughly 35 of the 38 times it\'s been voted upon in the US people have voted it down.  The country is torn over this so a solution that recognizes & codifies what both sides say they want is in my opinion a no brainer.  Gay people say they want equality so give them it while respecting the other people that don\'t agree with their decision but recognize that America is supposed to be a free country for everyone.  Rachael Dolezal is white.  Should we change the definition of the word white for her?  Or let her live her life as she see\'s fit.',0,0,'2015-06-27 03:01:13','2015-06-27 03:01:13',NULL,NULL,NULL),(17,17,'Post','text','Well there\'s no law against a white person living as if she\'s black. It\'s completely bananas but it\'s not against the law (and shouldn\'t be). Meanwhile, on the marriage question, in a democracy we should define state-sanctioned marriage as most people define it. That has changed very quickly in recent decades, as this Gallup poll shows: http://www.gallup.com/poll/117328/marriage.aspx The majority now believes same-sex marriage should be recognized as marriage. And that majority wants to protect the right of a long-oppressed minority to enjoy the greatest social institution of them all. A very conservative institution! To me, that\'s America at its best.',0,0,'2015-06-27 03:09:50','2015-06-27 03:09:50',NULL,NULL,NULL),(18,18,'Post','text','Polls are inarticulate at best based on the wording of the questions.    No doubt peoples attitudes are changing i.e. Obama & Hillary but not all people.  Freedom means there is room in the public square for all.  The left these days is the most intolerant of all & are intent on tearing down all people & institutions that don\'t agree with them.  Witness the treatment of those who don\'t think global warming is happening let alone man made.  Once the measure is exceeded there are no limits.  Polygamy is next if the logic of the marriage arguments are followed.  Treat all people & unions equally & leave the definition of marriage alone.  Major change to accommodate 3% of the population seems absurd.',0,0,'2015-06-27 11:20:36','2015-06-27 11:20:36',NULL,NULL,NULL),(19,19,'Post','text','There is room in the public square for all to speak up and vote. However, there not room for every opinion of every person or constituency to win the day in Congress or the courts. Some positions win the vote on big issues and others lose. A system that didn\'t have winners and losers would be chaos. On your point about intolerance, I see Left and Right as equally, viciously intolerant. I never feel more hopeless about our future than when watching Bill Maher or Ann Coulter speak. Same exact sensation for both. Polygamy? I seriously doubt any significant % of Americans want that. Even Utah, the traditional capital of that practice, has rejected it, as have public figures descended from polygamists (e.g. Romney). ',0,0,'2015-06-28 22:09:07','2015-06-28 22:09:07',NULL,NULL,NULL),(20,20,'Post','text','I concur the public square should be open to all.  HOWEVER  the government should not be mediating every time someone has their feelings hurt (e.g. people who insist you cater a gay wedding) The idea that your rights end where my nose begins is being turned on it\'s head.  It\'s a mild form of tyranny. There is talk of denying churches their tax status if they refuse to marry same sex couples.  America is in danger of being so open minded that their brains fall out.  If this was wartime those on my side would be called conscientious objectors. The right to not be offended is not yet in the Constitution. Rights should be applied equally to all not just those who agree with what is PC.  While change is inevitable not all   change is better. : )',0,0,'2015-07-01 01:13:49','2015-07-01 01:13:49',NULL,NULL,NULL),(21,1,'Comment','text','test this atleast',0,0,'2015-07-14 18:01:41','2015-07-14 18:01:41',NULL,NULL,NULL),(22,2,'Comment','text','I really don\'t like the way you said that.',0,0,'2015-07-14 18:48:21','2015-07-14 18:48:21',NULL,NULL,NULL),(23,3,'Comment','text','Good point about \"a truly inclusive society\" -- Nicely said. ',0,0,'2015-07-14 18:55:02','2015-07-14 18:55:02',NULL,NULL,NULL),(24,21,'Post','text','So we know that causal inference is a good thing So we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo we know that causal inference is a good thingSo',0,0,'2015-07-15 16:29:53','2015-07-15 16:29:53',NULL,NULL,NULL),(25,22,'Post','text','this is your turn so say any thing you want',0,0,'2015-07-15 16:30:35','2015-07-15 16:30:35',NULL,NULL,NULL),(26,23,'Post','text','Bernie Sanders is channeling the views of millions of Americans. People are tired of living in a society structured to enrich the 1% and impoverish everyone else. He is a very articulate speaker and likeable. His rise is the polls is early evidence that he is truly a contender and could beat Hillary for the nomination. ',0,0,'2015-07-15 16:44:25','2015-07-15 16:44:25',NULL,NULL,NULL),(27,24,'Post','text','But he doesn\'t have or wont be able to raise enough money. And as I could understand, elections in this country are all about who has the most money.',0,0,'2015-07-15 16:46:26','2015-07-15 16:46:26',NULL,NULL,NULL),(28,25,'Post','text','Well, that\'s been true in recent years. But we also have evidence that a dark-horse candidate can come out of nowhere and pull in a lot of money relatively late in the game. This happened with another Vermonter several elections ago, Howard Dean. One day he was a nobody, months later he almost got the nomination! And donors came to help him, big donors.',0,0,'2015-07-15 16:48:02','2015-07-15 16:48:02',NULL,NULL,NULL),(29,26,'Post','text','But, isn\'t Bernie all about not being corrupt, meaning avoiding falling under the influence of big donors? Also, why would any big donor give money to any one who is likely to increase taxes on the rich?\r\n',0,0,'2015-07-15 16:50:00','2015-07-15 16:50:00',NULL,NULL,NULL),(30,27,'Post','text','I think it is a great ....\r\n',0,0,'2015-07-15 19:07:05','2015-07-15 19:07:05',NULL,NULL,NULL),(31,28,'Post','text','yeah me too ..',0,0,'2015-07-15 19:07:19','2015-07-15 19:07:19',NULL,NULL,NULL),(32,4,'Comment','text','ups I made a mistake',0,0,'2015-07-15 19:07:25','2015-07-15 19:07:25',NULL,NULL,NULL),(33,29,'Post','text','Ha, I thought you are against',0,0,'2015-07-15 19:07:47','2015-07-15 19:07:47',NULL,NULL,NULL),(34,5,'Comment','text','test',0,0,'2015-07-15 19:10:12','2015-07-15 19:10:12',NULL,NULL,NULL),(35,30,'Post','text','How could you think it\'s OK to kill a sweet lion?',0,0,'2015-08-04 21:10:29','2015-08-04 21:10:29',NULL,NULL,NULL),(36,31,'Post','text','I didn\'t say its okay, I just feel like the story got a disproportionate reaction .  Especially considering the fact that dozens of non violent, unarmed young black men and women get executed each year in this country.',0,0,'2015-08-04 21:45:42','2015-08-04 21:45:42',NULL,NULL,NULL),(37,6,'Comment','text','* disproportionate attention',0,0,'2015-08-04 21:47:58','2015-08-04 21:47:58',NULL,NULL,NULL),(38,32,'Post','text','late ',0,0,'2015-08-10 15:12:19','2015-08-10 15:12:19',NULL,NULL,NULL),(39,33,'Post','text','sense of time',0,0,'2015-08-10 15:12:27','2015-08-10 15:12:27',NULL,NULL,NULL),(40,34,'Post','text','test ',0,0,'2015-08-10 15:54:59','2015-08-10 15:54:59',NULL,NULL,NULL),(41,7,'Comment','text','Brilliant comment!',0,0,'2015-08-10 17:00:01','2015-08-10 17:00:01',NULL,NULL,NULL),(42,35,'Post','text','This is clear visual proof that the Sanders campaign is taking off. What other candidate could fill an arena this large? Hillary has been having trouble getting critical mass. Here\'s a headline from a Michigan news site, late July: \"Small crowd gathers outside of Hillary Clinton\'s pricey Grosse Pointe fundraiser\" Now when has that happened to Bernie?\r\n',0,0,'2015-08-10 17:13:00','2015-08-10 17:13:00',NULL,NULL,NULL),(43,36,'Post','text','That is a good point. Yet in the general election 28,000 isn\'t a number big enough to make a significant difference. Clinton is a far more recognized name compared to Bernie. ',0,0,'2015-08-10 17:15:40','2015-08-10 17:15:40',NULL,NULL,NULL),(44,37,'Post','text','Good point about the number. You must be a math person or something (I noticed you have an MIT email address -- cool!).  28,000 isn\'t enough to elect anyone to any big office, but it\'s pretty good for a self-described Socialist from Vermont. Here\'s another factoid to back up the photo. Four years ago at this point, Obama had 34 donors in the top gazillionaire class. Bernie now has 29 of those people, while Hillary only got 5. That, to me, is as remarkable as the pic.',0,0,'2015-08-10 17:19:08','2015-08-10 17:19:08',NULL,NULL,NULL),(45,38,'Post','text','Yeah, that might make a huge difference. Although as the election approaches and more and more donors start showing up in the arena, these numbers are most certainly going to change - since unfortunately when it comes to giving money, it\'s more appealing to invest on a pro establishment corporatist who is guaranteed to make policies on your favor.',0,0,'2015-08-10 17:27:13','2015-08-10 17:27:13',NULL,NULL,NULL),(46,9,'Comment','text','CORRECTION: 34,340 of Obama\'s 2012 donors have given money to a 2016 candidate. Of these, 9,101 have given to Hillary, while 24,582 have given to Bernie.',0,0,'2015-08-10 17:28:41','2015-08-10 17:28:41',NULL,NULL,NULL),(47,39,'Post','text','See my edit to my previous comment. I misremembered the donor numbers and have now given the correct ones.\r\n\r\nYou say it\'s \"more appealing\" to invest in a pro establisment corporatist. More appealing to who? To you?',0,0,'2015-08-10 17:31:12','2015-08-10 17:31:12',NULL,NULL,NULL),(48,40,'Post','text','To most people who have money. Of course people do spend money for a good cause. But they don\'t spend hundreds of millions or even billions (some link or evidence of citizens united spending here)  unless they expect some return.  ',0,0,'2015-08-10 17:34:26','2015-08-10 17:34:26',NULL,NULL,NULL),(49,41,'Post','text','But most people - most voters - don\'t have big money. The rich people define the marketing of the candidates, but they don\'t (and can\'t) cast votes for them. ',0,0,'2015-08-10 17:35:21','2015-08-10 17:35:21',NULL,NULL,NULL),(50,42,'Post','text','But studies show that, almost always, the candidate who wins the election is also the one who managed to raise the most money. Its an unfortunate, yet concrete, reality that elections are all about money.   ',0,0,'2015-08-10 17:40:02','2015-08-10 17:40:02',NULL,NULL,NULL),(51,43,'Post','text','Yes, money talks. Isn\'t it interesting that our current DEMOCRATIC president is the champion at raising BIG MONEY from RICH PEOPLE?',0,0,'2015-08-10 17:42:23','2015-08-10 17:42:23',NULL,NULL,NULL),(52,44,'Post','text','Yeah, it is, and if the citizens don\'t do something about it, your next president (who is also most likely going to be DEMOCRATIC) will be the same. ',0,0,'2015-08-10 17:44:16','2015-08-10 17:44:16',NULL,NULL,NULL),(53,45,'Post','text','Cecil the lion was an amazing animal. Nobody said it better than this USA Today writer. <br>',0,0,'2015-08-13 19:16:38','2015-08-13 19:16:38',NULL,NULL,NULL),(54,10,'Comment','text','Nice Cecil link.',0,0,'2015-08-13 19:16:58','2015-08-13 19:16:58',NULL,NULL,NULL),(55,46,'Post','text','Technology robs humans of jobs. It\'s as simple as that. <br>',0,0,'2015-08-20 01:14:29','2015-08-20 01:14:29',NULL,NULL,NULL),(56,47,'Post','text','I think there a lot of NASTY PEOPLE want to get involved in building robots that will bring them power over the rest of us. You know those people exist, right?',0,0,'2015-08-21 15:57:26','2015-08-21 15:57:26',NULL,NULL,NULL),(57,48,'Post','text','I think there a lot of NASTY PEOPLE want to get involved in building robots that will bring them power over the rest of us. You know those people exist, right?',0,0,'2015-08-21 15:57:26','2015-08-21 15:57:26',NULL,NULL,NULL),(58,49,'Post','text','I know they exist, but there are safeguards in place to prevent the NASTIES from doing criminal things. They\'re called laws. We have a legal system that robot makers are not in a position to circumvent or dismantle. <br>',0,0,'2015-08-21 16:00:07','2015-08-21 16:00:07',NULL,NULL,NULL),(59,50,'Post','text','Legal systems have been overthrown before.',0,0,'2015-08-21 16:01:28','2015-08-21 16:01:28',NULL,NULL,NULL),(60,51,'Post','text','Read this story: http://www.washingtonpost.com/news/the-fix/wp/2015/07/16/the-electorate-in-2014-was-as-diverse-as-2008-thats-remarkable/<br><br>',0,0,'2015-08-21 16:01:53','2015-08-21 16:01:53',NULL,NULL,NULL),(61,52,'Post','text','But read <a href=\"http://www.politico.com/story/2015/08/teflon-don-121587.html?hp=t1_r\" style=\"color: rgb(0, 119, 204); text-decoration: none;\">this</a>:',0,0,'2015-08-21 16:02:45','2015-08-21 16:02:45',NULL,NULL,NULL),(62,53,'Post','text','That is not a very good article. I\'m putting a better one in the evidence box.<br>',0,0,'2015-08-21 16:04:41','2015-08-21 16:04:41',NULL,NULL,NULL),(63,54,'Post','text','No, I think you\'re wrong there. Google has a huge influence on us. <br>',0,0,'2015-08-25 22:08:22','2015-08-25 22:08:22',NULL,NULL,NULL),(64,55,'Post','text','In what ways. Google is a search engine, we use it to search for stuff. People barely use google as a news source.',0,0,'2015-08-25 22:10:13','2015-08-25 22:10:13',NULL,NULL,NULL),(65,56,'Post','text','We use Google to educate ourselves on everything we care about. By educating ourselves we change WHAT we think about all of those topics, including topic. <br>',0,0,'2015-08-25 22:12:04','2015-08-25 22:12:04',NULL,NULL,NULL),(66,57,'Post','text','Yeah, that is true. But the way Google gives that \"education\" is not, at least in theory, in any way opinionated.&nbsp;',0,0,'2015-08-25 22:14:34','2015-08-25 22:14:34',NULL,NULL,NULL),(67,58,'Post','text','I wonder if I didn\'t paste it, what would happen?<br><p><br></p>',0,0,'2015-08-25 22:15:51','2015-08-25 22:15:51',NULL,NULL,NULL),(68,59,'Post','text','As a wise man once said (about two minutes ago), it must be because it is on firefox.',0,0,'2015-08-25 22:18:33','2015-08-25 22:18:33',NULL,NULL,NULL),(69,60,'Post','text','Or maybe not. It coudl be something unrelated to the browser!<br>',0,0,'2015-08-25 22:18:55','2015-08-25 22:18:55',NULL,NULL,NULL),(70,61,'Post','text','I cant paste on my box so it\'s definitely the browser. Not being able to paste on one browse, but not the other is not fair for some users. So If it works, it should work fine, if it doesnt it should fail. This thing seems to be working fine. I am now trying to exceed the word limit and see what is going to happen. I am now trying to exceed the word limit and see what is going to happen. I am now trying to exceed the word limit and see what is going to happen. I am now trying to eceed the word limit and see what is going to happen. I am now trying to eveed the wrorkd diomit and see thae is goint to happen. I dont carea baoutakwhat &nbsp;ai ma writingso I have to tpyp sdfadfs iodfasdjfsdafjoilkdjsfoaijewfklsjoidfjowej fjdaodf &nbsp;',0,0,'2015-08-25 22:23:05','2015-08-25 22:23:05',NULL,NULL,NULL),(71,62,'Post','text','You\'re not debating very well. You\'re not making any sense. I think you just lost!<br>',0,0,'2015-08-25 22:23:32','2015-08-25 22:23:32',NULL,NULL,NULL),(72,63,'Post','text','this is my last post',0,0,'2015-08-25 22:23:47','2015-08-25 22:23:47',NULL,NULL,NULL),(73,64,'Post','text','It\'s hard for me to imagine any 19th century novel being chosen for this honor over MOBY DICK. <br><br>And of all authors in contention, Henry James strikes me as a curious choice. Yes he has many passionate fans (including you) but there\'s no denying he speaks to a relatively small slice of literary readers. Right?<br>',0,0,'2015-08-27 19:43:59','2015-08-27 19:43:59',NULL,NULL,NULL),(74,65,'Post','text','Ironically enough Macedonia is very affected by the migrant crises lately. It is all over the news here and all of Europe. This is not something new for the EU, Spain and Italy have this problem all the time. It was just a chance for the Balkan politicians to get some extra money from the EU to handle the immigrants.&nbsp;<div><br></div><div>I think this migration crises are always \"good\", not only in EU but in the US as well. They keep reminding us that we are privileged and that there is still a very large part of the world that is under developed and where people are ready to die to have better future. These people deserve a better and EU needs to help.</div><div><br></div><div>Regarding the EU I think it can and should survive. More in the next reply :)</div>',0,0,'2015-08-28 11:27:28','2015-08-28 11:27:28',NULL,NULL,NULL),(75,11,'Comment','text','I hit the character limit, so I had to stop :)',0,0,'2015-08-28 11:27:53','2015-08-28 11:27:53',NULL,NULL,NULL),(76,12,'Comment','text','Also it would be nice, if there is a link to the original news story. I couldn\'t find a way to open it.',0,0,'2015-08-28 11:28:28','2015-08-28 11:28:28',NULL,NULL,NULL);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debate_participations`
--

DROP TABLE IF EXISTS `debate_participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debate_participations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `debate_id` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `side` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_debate_participations_on_account_id_and_debate_id` (`account_id`,`debate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debate_participations`
--

LOCK TABLES `debate_participations` WRITE;
/*!40000 ALTER TABLE `debate_participations` DISABLE KEYS */;
INSERT INTO `debate_participations` VALUES (1,4,2,'debater','left_side','2015-06-24 19:49:43','2015-06-24 19:49:43'),(2,4,3,'debater','right_side','2015-06-24 19:52:33','2015-06-24 19:52:33'),(3,4,4,'debater','right_side','2015-06-24 19:52:52','2015-06-24 19:52:52'),(4,5,6,'debater','left_side','2015-06-24 19:59:53','2015-06-24 19:59:53'),(5,5,7,'debater','left_side','2015-06-24 20:00:20','2015-06-24 20:00:20'),(6,4,6,'debater','right_side','2015-06-24 20:00:47','2015-06-24 20:00:47'),(7,1,4,'debater','left_side','2015-06-26 15:50:56','2015-06-26 15:50:56'),(8,1,8,'debater','left_side','2015-06-26 15:51:21','2015-06-26 15:51:21'),(9,1,11,'debater','left_side','2015-06-26 15:54:39','2015-06-26 15:54:39'),(10,5,25,'debater','left_side','2015-06-26 19:54:52','2015-06-26 19:54:52'),(11,5,26,'debater','left_side','2015-06-26 20:14:03','2015-06-26 20:14:03'),(12,4,27,'debater','left_side','2015-06-26 20:30:52','2015-06-26 20:30:52'),(13,4,25,'debater','right_side','2015-06-26 20:45:18','2015-06-26 20:45:18'),(14,5,28,'debater','left_side','2015-06-27 01:00:06','2015-06-27 01:00:06'),(15,7,29,'debater','right_side','2015-06-27 01:43:14','2015-06-27 01:43:14'),(16,7,30,'debater','right_side','2015-06-27 01:44:26','2015-06-27 01:44:26'),(17,5,31,'debater',NULL,'2015-06-27 01:49:45','2015-06-27 01:49:45'),(18,7,32,'debater','right_side','2015-06-27 01:50:25','2015-06-27 01:50:25'),(19,5,33,'debater','left_side','2015-06-27 01:50:40','2015-06-27 01:50:40'),(20,5,32,'debater','left_side','2015-06-27 01:50:51','2015-06-27 01:50:51'),(21,5,29,'debater','left_side','2015-06-28 21:49:12','2015-06-28 21:49:12'),(22,5,8,'debater','right_side','2015-06-29 21:25:01','2015-06-29 21:25:01'),(23,5,35,'debater','left_side','2015-07-14 18:50:47','2015-07-14 18:50:47'),(24,5,37,'debater','right_side','2015-07-14 18:53:10','2015-07-14 18:53:10'),(25,8,38,'debater','left_side','2015-07-14 21:27:21','2015-07-14 21:27:21'),(26,1,37,'debater','left_side','2015-07-14 22:00:03','2015-07-14 22:00:03'),(27,1,39,'debater',NULL,'2015-07-15 14:55:59','2015-07-15 14:55:59'),(28,4,40,'debater','right_side','2015-07-15 15:25:28','2015-07-15 15:25:28'),(29,4,35,'debater','right_side','2015-07-15 15:46:54','2015-07-15 15:46:54'),(30,4,41,'debater','left_side','2015-07-15 15:47:23','2015-07-15 15:47:23'),(31,1,41,'debater','right_side','2015-07-15 15:47:33','2015-07-15 15:47:33'),(32,1,42,'debater','left_side','2015-07-15 15:48:31','2015-07-15 15:48:31'),(33,4,42,'debater','right_side','2015-07-15 15:48:41','2015-07-15 15:48:41'),(34,4,44,'debater','left_side','2015-07-15 16:37:05','2015-07-15 16:37:05'),(35,1,44,'debater','right_side','2015-07-15 16:37:51','2015-07-15 16:37:51'),(36,5,46,'debater',NULL,'2015-07-15 16:40:46','2015-07-15 16:40:46'),(37,5,47,'debater','left_side','2015-07-15 16:41:26','2015-07-15 16:41:26'),(38,4,47,'debater','right_side','2015-07-15 16:42:33','2015-07-15 16:42:33'),(39,5,49,'debater','left_side','2015-07-15 19:03:47','2015-07-15 19:03:47'),(40,5,50,'debater','left_side','2015-07-15 19:04:03','2015-07-15 19:04:03'),(41,5,51,'debater','left_side','2015-07-15 19:06:40','2015-07-15 19:06:40'),(42,8,50,'debater','right_side','2015-07-15 19:06:48','2015-07-15 19:06:48'),(43,5,52,'debater','left_side','2015-08-04 20:57:45','2015-08-04 20:57:45'),(44,1,52,'debater','right_side','2015-08-04 21:01:28','2015-08-04 21:01:28'),(45,4,53,'debater','left_side','2015-08-10 15:08:04','2015-08-10 15:08:04'),(46,1,53,'debater','right_side','2015-08-10 15:11:25','2015-08-10 15:11:25'),(47,5,54,'debater','left_side','2015-08-10 17:06:07','2015-08-10 17:06:07'),(48,1,54,'debater','right_side','2015-08-10 17:07:46','2015-08-10 17:07:46'),(49,4,55,'debater','left_side','2015-08-14 14:16:01','2015-08-14 14:16:01'),(50,5,56,'debater','left_side','2015-08-18 17:16:48','2015-08-18 17:16:48'),(51,5,57,'debater','left_side','2015-08-18 17:19:50','2015-08-18 17:19:50'),(52,5,58,'debater','left_side','2015-08-18 17:27:45','2015-08-18 17:27:45'),(53,2,58,'debater','right_side','2015-08-19 01:50:18','2015-08-19 01:50:18'),(54,9,56,'debater','right_side','2015-08-21 15:55:04','2015-08-21 15:55:04'),(55,5,59,'debater','left_side','2015-08-25 21:36:12','2015-08-25 21:36:12'),(56,5,60,'debater','left_side','2015-08-25 21:48:55','2015-08-25 21:48:55'),(57,4,60,'debater','right_side','2015-08-25 21:50:21','2015-08-25 21:50:21'),(58,5,61,'debater','left_side','2015-08-26 23:54:44','2015-08-26 23:54:44'),(59,5,62,'debater','left_side','2015-08-26 23:57:49','2015-08-26 23:57:49'),(60,9,62,'debater','right_side','2015-08-27 00:43:22','2015-08-27 00:43:22'),(61,9,65,'debater','left_side','2015-08-27 01:07:06','2015-08-27 01:07:06'),(62,5,66,'debater','left_side','2015-08-27 21:01:39','2015-08-27 21:01:39'),(63,10,66,'debater','right_side','2015-08-28 11:12:21','2015-08-28 11:12:21');
/*!40000 ALTER TABLE `debate_participations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debate_rooms`
--

DROP TABLE IF EXISTS `debate_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debate_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `video_url` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debate_rooms`
--

LOCK TABLES `debate_rooms` WRITE;
/*!40000 ALTER TABLE `debate_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `debate_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debates`
--

DROP TABLE IF EXISTS `debates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `back_and_forth_limit` int(11) DEFAULT NULL,
  `character_limit` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `audience_number` int(11) DEFAULT '0',
  `left_side_number` int(11) DEFAULT '0',
  `right_side_number` int(11) DEFAULT '0',
  `neutral_number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_debates_on_topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debates`
--

LOCK TABLES `debates` WRITE;
/*!40000 ALTER TABLE `debates` DISABLE KEYS */;
INSERT INTO `debates` VALUES (6,2,NULL,NULL,NULL,'2015-06-24 19:59:53','2015-06-24 19:59:53',0,0,0,0),(9,3,NULL,NULL,NULL,'2015-06-26 15:52:33','2015-06-26 15:52:33',0,0,0,0),(32,17,NULL,NULL,NULL,'2015-06-27 01:50:25','2015-06-27 01:50:25',0,0,0,0),(36,19,NULL,NULL,NULL,'2015-07-14 18:52:51','2015-07-14 18:52:51',0,0,0,0),(37,19,NULL,NULL,NULL,'2015-07-14 18:53:10','2015-07-14 18:53:10',0,0,0,0),(40,2,NULL,NULL,NULL,'2015-07-15 15:25:28','2015-07-15 15:25:28',0,0,0,0),(43,20,NULL,NULL,NULL,'2015-07-15 16:36:35','2015-07-15 16:36:35',0,0,0,0),(44,20,NULL,NULL,NULL,'2015-07-15 16:37:05','2015-07-15 16:37:05',0,0,0,0),(47,21,NULL,NULL,NULL,'2015-07-15 16:41:26','2015-07-15 16:41:26',0,0,0,0),(48,22,NULL,NULL,NULL,'2015-07-15 19:02:32','2015-07-15 19:02:32',0,0,0,0),(49,22,NULL,NULL,NULL,'2015-07-15 19:03:47','2015-07-15 19:03:47',0,0,0,0),(50,22,NULL,NULL,NULL,'2015-07-15 19:04:03','2015-07-15 19:04:03',0,0,0,0),(51,22,NULL,NULL,NULL,'2015-07-15 19:06:40','2015-07-15 19:06:40',0,0,0,0),(52,23,NULL,NULL,NULL,'2015-08-04 20:57:45','2015-08-04 20:57:45',0,0,0,0),(53,24,NULL,NULL,NULL,'2015-08-10 15:08:04','2015-08-10 15:08:04',0,0,0,0),(54,25,NULL,NULL,NULL,'2015-08-10 17:06:07','2015-08-10 17:06:07',0,0,0,0),(55,26,NULL,NULL,NULL,'2015-08-14 14:16:01','2015-08-14 14:16:01',0,0,0,0),(56,27,NULL,NULL,NULL,'2015-08-18 17:16:48','2015-08-18 17:16:48',0,0,0,0),(57,28,NULL,NULL,NULL,'2015-08-18 17:19:50','2015-08-18 17:19:50',0,0,0,0),(58,29,NULL,NULL,NULL,'2015-08-18 17:27:45','2015-08-18 17:27:45',0,0,0,0),(59,30,NULL,NULL,NULL,'2015-08-25 21:36:12','2015-08-25 21:36:12',0,0,0,0),(60,31,NULL,NULL,NULL,'2015-08-25 21:48:55','2015-08-25 21:48:55',0,0,0,0),(61,32,NULL,NULL,NULL,'2015-08-26 23:54:44','2015-08-26 23:54:44',0,0,0,0),(62,33,NULL,NULL,NULL,'2015-08-26 23:57:49','2015-08-26 23:57:49',0,0,0,0),(65,36,NULL,NULL,NULL,'2015-08-27 01:07:06','2015-08-27 01:07:06',0,0,0,0),(66,37,NULL,NULL,NULL,'2015-08-27 21:01:39','2015-08-27 21:01:39',0,0,0,0);
/*!40000 ALTER TABLE `debates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidences`
--

DROP TABLE IF EXISTS `evidences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `og_topic` varchar(255) DEFAULT NULL,
  `og_description` text,
  `og_image_url` text,
  `og_type` varchar(255) DEFAULT NULL,
  `og_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidences`
--

LOCK TABLES `evidences` WRITE;
/*!40000 ALTER TABLE `evidences` DISABLE KEYS */;
INSERT INTO `evidences` VALUES (1,45,'Protests planned for Minn. dentist who killed Cecil the lion','A Minnesota dentist, who killed a beloved African lion named Cecil, continues to face the wrath of animal lovers.','http://www.gannett-cdn.com/-mm-/3fda4083ea856b65d765f593913dff603df84067/c=0-0-2497-1411&r=x633&c=1200x630/local/-/media/2015/07/29/USATODAY/USATODAY/635737649034461564-AFP-542939142.1.jpg','article','http://www.usatoday.com/story/news/nation-now/2015/07/29/minnesota-dentist-cecil--lion-poaching-africa-zimbabwe/30827549/','2015-08-13 19:16:38','2015-08-13 19:16:38'),(2,53,'Hopper\'s legacy the focus of yearlong celebration','Famed artist and Cape Cod resident, the late Edward Hopper\'s artwork will be celebrated all year.','http://www.capecodtimes.com/storyimage/CC/20150821/CCOLBARKER/150819343/AR/0/AR-150819343.jpg','article','http://www.capecodtimes.com/article/20150821/CCOLBARKER/150819343','2015-08-21 16:04:41','2015-08-21 16:04:41'),(3,56,'Scott Walker falls flat on his face','This is what happens when you try to trump the Donald.','https://img.washingtonpost.com/rw/2010-2019/WashingtonPost/2015/08/24/Editorial-Opinion/Images/APW1154524.jpg','article','https://www.washingtonpost.com/opinions/scott-walker-falls-flat-on-his-face/2015/08/24/5bb3b486-4a93-11e5-8ab4-c73967a143d3_story.html','2015-08-25 22:12:04','2015-08-25 22:12:04');
/*!40000 ALTER TABLE `evidences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_owner_id` int(11) DEFAULT NULL,
  `image_owner_type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `image_use` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_images_on_image_owner_id` (`image_owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'Account','http://graph.facebook.com/10205692820617779/picture',NULL,'profile_pic','2015-06-24 19:35:10','2015-06-24 19:35:10');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` int(11) DEFAULT NULL,
  `message` text,
  `checked` tinyint(1) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,5,6,0,'Abel is your opponent in: Apple Computer is a force for good.',1,'http://hungry.media.mit.edu:5544/topics/2','2015-06-24 20:00:47','2015-06-24 20:01:07'),(2,4,4,0,'Abel is your opponent in: Test topic',1,'http://hungry.media.mit.edu:5544/topics/1','2015-06-26 15:50:56','2015-06-26 19:49:44'),(3,5,25,0,'Abel is your opponent in: Same-sex marriage',1,'http://hungry.media.mit.edu:5544/topics/11','2015-06-26 20:45:18','2015-06-26 21:43:24'),(4,7,NULL,0,'William Powers has sent you an invitation to join him on the debate: Same-sex marriage',1,'http://hungry.media.mit.edu:5544/topics/17','2015-06-27 01:49:45','2015-06-27 02:03:57'),(5,7,32,0,'William Powers is your opponent in: Same-sex marriage',1,'http://hungry.media.mit.edu:5544/topics/17','2015-06-27 01:50:51','2015-06-27 02:03:57'),(6,7,29,0,'William Powers is your opponent in: Same-sex marriage',0,'http://hungry.media.mit.edu:5544/topics/11','2015-06-28 21:49:12','2015-06-28 21:49:12'),(7,1,8,0,'William Powers is your opponent in: Test topic',1,'http://hungry.media.mit.edu:5544/topics/1','2015-06-29 21:25:01','2015-06-30 15:18:30'),(8,1,NULL,0,'William Powers has sent you an invitation to join him on the debate: July is absolutely the best month of the year.',1,'http://hungry.media.mit.edu:5544/topics/19','2015-07-14 18:53:10','2015-07-14 21:24:35'),(9,5,37,0,'Abel is your opponent in: July is absolutely the best month of the year.',1,'http://hungry.media.mit.edu:5544/topics/19','2015-07-14 22:00:03','2015-07-15 16:00:45'),(10,2,NULL,0,'Abel has sent you an invitation to join him on the debate: Apple Computer is a force for good.',1,'http://hungry.media.mit.edu:5544/topics/2','2015-07-15 14:55:59','2015-08-10 15:09:33'),(11,5,35,0,'Abel is your opponent in: Lets have a debate about causal inference',1,'http://hungry.media.mit.edu:5544/topics/3','2015-07-15 15:46:54','2015-07-15 16:00:45'),(12,4,41,0,'Abel is your opponent in: Lets have a debate about causal inference',1,'http://hungry.media.mit.edu:5544/topics/3','2015-07-15 15:47:33','2015-07-15 16:51:06'),(13,1,42,0,'Abel is your opponent in: Lets have a debate about causal inference',1,'http://hungry.media.mit.edu:5544/topics/3','2015-07-15 15:48:41','2015-07-15 18:28:01'),(14,4,44,0,'Abel is your opponent in: Is Global Warming Real?',1,'http://hungry.media.mit.edu:5544/topics/20','2015-07-15 16:37:51','2015-07-15 16:51:06'),(15,1,NULL,0,'William Powers has sent you an invitation to join him on the debate: Bernie Sanders - does he have a chance?',1,'http://hungry.media.mit.edu:5544/topics/21','2015-07-15 16:40:46','2015-07-15 18:28:01'),(16,3,NULL,0,'William Powers has sent you an invitation to join him on the debate: Bernie Sanders - does he have a chance?',0,'http://hungry.media.mit.edu:5544/topics/21','2015-07-15 16:41:26','2015-07-15 16:41:26'),(17,5,47,0,'Abel is your opponent in: Bernie Sanders - does he have a chance?',1,'http://hungry.media.mit.edu:5544/topics/21','2015-07-15 16:42:33','2015-07-15 16:45:10'),(18,3,NULL,0,'William Powers has sent you an invitation to join him on the debate: Iran nuclear deal - any good?',0,'http://hungry.media.mit.edu:5544/topics/22','2015-07-15 19:04:03','2015-07-15 19:04:03'),(19,8,NULL,0,'William Powers has sent you an invitation to join him on the debate: Iran nuclear deal - any good?',1,'http://hungry.media.mit.edu:5544/topics/22','2015-07-15 19:06:40','2015-07-15 19:08:33'),(20,5,50,0,'msaveski is your opponent in: Iran nuclear deal - any good?',1,'http://hungry.media.mit.edu:5544/topics/22','2015-07-15 19:06:48','2015-08-04 20:55:52'),(21,4,1,0,'Abel has accepted your challenge in: Test Online',1,'http://hungry.media.mit.edu:5544/topics/24','2015-08-10 15:11:25','2015-08-10 15:12:42'),(22,5,1,0,'Abel has accepted your challenge in: Bernie Sanders crowd shot',1,'http://hungry.media.mit.edu:5544/topics/25','2015-08-10 17:07:46','2015-08-10 17:34:08'),(23,5,2,0,'SUser has accepted your challenge in: This article about technology\\\'s impact on jobs.',1,'http://hungry.media.mit.edu:5544/topics/29','2015-08-19 01:50:18','2015-08-19 12:41:22'),(24,5,9,0,'SherrillMart has accepted your challenge in: Should we be \"terrified\" of Google\\\'s humanoid robot?',1,'http://hungry.media.mit.edu:5544/topics/27','2015-08-21 15:55:04','2015-08-25 21:40:15'),(25,5,4,0,'Abel has accepted your challenge in: Could Google decide the 2016 Election?',1,'http://hungry.media.mit.edu:5544/topics/31','2015-08-25 21:50:21','2015-08-25 21:55:01'),(26,5,9,0,'SherrillMart has accepted your challenge in: Is The Portrait of a Lady the greatest American novel?',1,'http://hungry.media.mit.edu:5544/topics/33','2015-08-27 00:43:22','2015-08-27 19:41:37'),(27,5,10,0,'martin has accepted your challenge in: The EU looks increasingly like a failed experiment. Is the migrants crisis the last straw?',0,'http://hungry.media.mit.edu:5544/topics/37','2015-08-28 11:12:21','2015-08-28 11:12:21');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `debate_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_posts_on_debate_id` (`debate_id`),
  KEY `index_posts_on_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,5,6,'2015-06-24 20:03:05','2015-06-24 20:03:05'),(2,4,6,'2015-06-24 20:03:21','2015-06-24 20:03:21'),(3,5,6,'2015-06-24 20:03:39','2015-06-24 20:03:39'),(4,4,6,'2015-06-24 20:03:59','2015-06-24 20:03:59'),(5,5,6,'2015-06-24 20:04:11','2015-06-24 20:04:11'),(6,4,6,'2015-06-24 20:04:28','2015-06-24 20:04:28'),(7,5,6,'2015-06-24 20:04:39','2015-06-24 20:04:39'),(8,4,6,'2015-06-24 20:04:59','2015-06-24 20:04:59'),(9,5,6,'2015-06-24 20:05:35','2015-06-24 20:05:35'),(10,4,6,'2015-06-24 20:05:48','2015-06-24 20:05:48'),(11,5,32,'2015-06-27 02:04:16','2015-06-27 02:04:16'),(12,7,32,'2015-06-27 02:23:04','2015-06-27 02:23:04'),(13,5,32,'2015-06-27 02:29:55','2015-06-27 02:29:55'),(14,7,32,'2015-06-27 02:41:49','2015-06-27 02:41:49'),(15,5,32,'2015-06-27 02:47:50','2015-06-27 02:47:50'),(16,7,32,'2015-06-27 03:01:13','2015-06-27 03:01:13'),(17,5,32,'2015-06-27 03:09:50','2015-06-27 03:09:50'),(18,7,32,'2015-06-27 11:20:36','2015-06-27 11:20:36'),(19,5,32,'2015-06-28 22:09:07','2015-06-28 22:09:07'),(20,7,32,'2015-07-01 01:13:49','2015-07-01 01:13:49'),(21,4,42,'2015-07-15 16:29:53','2015-07-15 16:29:53'),(22,1,42,'2015-07-15 16:30:35','2015-07-15 16:30:35'),(23,5,47,'2015-07-15 16:44:25','2015-07-15 16:44:25'),(24,4,47,'2015-07-15 16:46:26','2015-07-15 16:46:26'),(25,5,47,'2015-07-15 16:48:02','2015-07-15 16:48:02'),(26,4,47,'2015-07-15 16:50:00','2015-07-15 16:50:00'),(27,8,50,'2015-07-15 19:07:05','2015-07-15 19:07:05'),(28,5,50,'2015-07-15 19:07:19','2015-07-15 19:07:19'),(29,8,50,'2015-07-15 19:07:47','2015-07-15 19:07:47'),(30,5,52,'2015-08-04 21:10:29','2015-08-04 21:10:29'),(31,1,52,'2015-08-04 21:45:42','2015-08-04 21:45:42'),(32,1,53,'2015-08-10 15:12:19','2015-08-10 15:12:19'),(33,4,53,'2015-08-10 15:12:27','2015-08-10 15:12:27'),(34,1,53,'2015-08-10 15:54:59','2015-08-10 15:54:59'),(35,5,54,'2015-08-10 17:13:00','2015-08-10 17:13:00'),(36,1,54,'2015-08-10 17:15:40','2015-08-10 17:15:40'),(37,5,54,'2015-08-10 17:19:08','2015-08-10 17:19:08'),(38,1,54,'2015-08-10 17:27:13','2015-08-10 17:27:13'),(39,5,54,'2015-08-10 17:31:12','2015-08-10 17:31:12'),(40,1,54,'2015-08-10 17:34:26','2015-08-10 17:34:26'),(41,5,54,'2015-08-10 17:35:21','2015-08-10 17:35:21'),(42,1,54,'2015-08-10 17:40:02','2015-08-10 17:40:02'),(43,5,54,'2015-08-10 17:42:23','2015-08-10 17:42:23'),(44,1,54,'2015-08-10 17:44:16','2015-08-10 17:44:16'),(45,5,52,'2015-08-13 19:16:38','2015-08-13 19:16:38'),(46,5,58,'2015-08-20 01:14:29','2015-08-20 01:14:29'),(47,9,56,'2015-08-21 15:57:26','2015-08-21 15:57:26'),(48,9,56,'2015-08-21 15:57:26','2015-08-21 15:57:26'),(49,5,56,'2015-08-21 16:00:07','2015-08-21 16:00:07'),(50,9,56,'2015-08-21 16:01:28','2015-08-21 16:01:28'),(51,5,56,'2015-08-21 16:01:53','2015-08-21 16:01:53'),(52,9,56,'2015-08-21 16:02:45','2015-08-21 16:02:45'),(53,5,56,'2015-08-21 16:04:41','2015-08-21 16:04:41'),(54,5,60,'2015-08-25 22:08:22','2015-08-25 22:08:22'),(55,4,60,'2015-08-25 22:10:13','2015-08-25 22:10:13'),(56,5,60,'2015-08-25 22:12:04','2015-08-25 22:12:04'),(57,4,60,'2015-08-25 22:14:34','2015-08-25 22:14:34'),(58,5,60,'2015-08-25 22:15:51','2015-08-25 22:15:51'),(59,4,60,'2015-08-25 22:18:33','2015-08-25 22:18:33'),(60,5,60,'2015-08-25 22:18:55','2015-08-25 22:18:55'),(61,4,60,'2015-08-25 22:23:05','2015-08-25 22:23:05'),(62,5,60,'2015-08-25 22:23:32','2015-08-25 22:23:32'),(63,4,60,'2015-08-25 22:23:47','2015-08-25 22:23:47'),(64,5,62,'2015-08-27 19:43:59','2015-08-27 19:43:59'),(65,10,66,'2015-08-28 11:27:28','2015-08-28 11:27:28');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) DEFAULT NULL,
  `followed_id` int(11) DEFAULT NULL,
  `followed_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_relationships_on_follower_id_and_followed_id` (`follower_id`,`followed_id`),
  KEY `index_relationships_on_follower_id` (`follower_id`),
  KEY `index_relationships_on_followed_id` (`followed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `issue` text,
  `page` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141124155758'),('20141130052607'),('20141201072106'),('20141201072129'),('20141201072220'),('20141201072256'),('20141201075706'),('20141201084949'),('20141203103606'),('20150115154143'),('20150130080039'),('20150130180554'),('20150203081222'),('20150527192033'),('20150528133438'),('20150602213216'),('20150603185216'),('20150617165439'),('20150620190433'),('20150623040354'),('20150629180732'),('20150629185531'),('20150716161726'),('20150724151929'),('20150727191508'),('20150804153839'),('20150806153945'),('20150809222918'),('20150813093251');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `og_topic` varchar(255) DEFAULT NULL,
  `og_description` text,
  `og_image_url` text,
  `og_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `og_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
INSERT INTO `stories` VALUES (1,23,'Zimbabwean hunter says he did nothing wrong in luring Cecil the lion to his death','\"I do not feel I have done anything wrong,\" Theo Bronkhorst declared. And neither, he said, did American dentist Walter Palmer.','http://www.washingtonpost.com/news/morning-mix/wp-content/uploads/sites/21/2015/08/theo.jpg','article','2015-08-04 20:57:45','2015-08-04 20:57:45','http://www.washingtonpost.com/news/morning-mix/wp/2015/08/04/zimbabwean-hunter-says-he-did-nothing-wrong-in-luring-cecil-the-lion-to-his-death/'),(2,24,'Rubio’s fantasy figure on bank closures due to Dodd-Frank','In the GOP debate, the Florida senator significantly overstates the possible impact of the 2010 law overhauling bank regulations.','http://img.washingtonpost.com/rf/image_908w/2010-2019/WashingtonPost/2015/08/08/National-Politics/Images/GOP_2016_Rubio-07673-5260.jpg','article','2015-08-10 15:08:04','2015-08-10 15:08:04','http://www.washingtonpost.com/blogs/fact-checker/wp/2015/08/10/rubios-fantasy-figure-on-bank-closures-due-to-dodd-frank/'),(3,25,'This Bernie Sanders crowd shot should make Hillary Clinton a little jittery','28,000 people!','http://www.washingtonpost.com/blogs/the-fix/files/2015/08/Sanders.jpeg','article','2015-08-10 17:06:07','2015-08-10 17:06:07','http://www.washingtonpost.com/news/the-fix/wp/2015/08/10/this-bernie-sanders-crowd-shot-should-make-hillary-clinton-a-little-jittery/'),(4,26,'',NULL,NULL,NULL,'2015-08-14 14:16:01','2015-08-14 14:16:01',''),(5,27,'Watch Google\'s terrifying humanoid robot running through a forest','It may have fared badly in the recent robo-olympics, but Google has revealed its humanoid robot has been set free in the woods to learn how to run through terrain.','http://i.dailymail.co.uk/i/pix/2015/08/17/20/2B7248D400000578-0-image-a-2_1439838781811.jpg','article','2015-08-18 17:16:48','2015-08-18 17:16:48','http://www.dailymail.co.uk/sciencetech/article-3201279/Watch-Google-s-terrifying-humanoid-robot-running-forest-firm-pledges-soon-agile-humans.html'),(6,28,'Amazon’s Jeff Bezos Replies to Criticism on Workplace Policies','Competition for tech talent is fierce. Which is why it’s illogical to think Amazon is designed to grind white-collar employees into dust, founder Jeff Bezos says in a company-wide memo in response to a cutting New York Times article over the weekend.','http://si.wsj.net/public/resources/images/BN-JN916_0724am_P_20150724115256.jpg','article','2015-08-18 17:19:50','2015-08-18 17:19:50','http://blogs.wsj.com/digits/2015/08/17/amazon-coms-bezos-replies-to-stinging-criticism-on-workplace-policies/'),(7,29,'Technology has created more jobs than it has destroyed, says 140 years of data','Study of census results in England and Wales since 1871 finds rise of machines has been a job creator rather than making working humans obsolete','//i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2015/7/28/1438114565536/a95c6a44-497d-4e7e-a6dc-f3f3005637db-2060x1236.jpeg?w=1200&q=85&auto=format&sharp=10&s=68e71b5e2a529673da898ec0c15bcdc0','article','2015-08-18 17:27:45','2015-08-18 17:27:45','http://www.theguardian.com/business/2015/aug/17/technology-created-more-jobs-than-destroyed-140-years-data-census'),(8,30,'Google could \'rig the 2016 election,\' researcher says','Google\'s influence on the 2016 election could tip the scales in favor of its own chosen candidate, says behavioral psychologist Robert Epstein.','http://i2.cdn.turner.com/money/dam/assets/150811103055-google-alphabet-gallery-620xa.jpg','article','2015-08-25 21:36:12','2015-08-25 21:36:12','http://money.cnn.com/2015/08/20/technology/google-2016-election/'),(9,31,'Google could \'rig the 2016 election,\' researcher says','Google\'s influence on the 2016 election could tip the scales in favor of its own chosen candidate, says behavioral psychologist Robert Epstein.','http://i2.cdn.turner.com/money/dam/assets/150811103055-google-alphabet-gallery-620xa.jpg','article','2015-08-25 21:48:55','2015-08-25 21:48:55','http://money.cnn.com/2015/08/20/technology/google-2016-election/'),(10,32,'Don McLean- American Pie (with Lyrics)','Click more info for description* Please comment, rate, and subscribe. Thank you! Lyrics are also below- A long, long time ago... I can still remember How tha...','https://i.ytimg.com/vi/uAsV5-Hv-7U/hqdefault.jpg','video','2015-08-26 23:54:44','2015-08-26 23:54:44','https://www.youtube.com/watch?v=uAsV5-Hv-7U'),(11,33,'Is Henry James’s ‘The Portrait of a Lady’ the Great American Novel?','Is Henry James\'s \'The Portrait of a Lady\' too European, or is it the great American novel? Michael Gorra weighs in.','http://cdn.thedailybeast.com/content/dailybeast/articles/2012/08/30/is-henry-james-s-the-portrait-of-a-lady-the-great-american-novel/jcr:content/image.img.2000.jpg/1346357826633.cached.jpg','article','2015-08-26 23:57:49','2015-08-26 23:57:49','http://www.thedailybeast.com/articles/2012/08/30/is-henry-james-s-the-portrait-of-a-lady-the-great-american-novel.html'),(12,36,'Killer’s ultimate selfie: Roanoke horror becoming the new norm','ESSAY | Shooting is the latest case where evil is leveraged by social media for maximum effect.','https://img.washingtonpost.com/rw/2010-2019/WashingtonPost/2015/08/26/Health-Environment-Science/Images/On_Air_Shooting-0a9ac-1435.jpg','article','2015-08-27 01:07:06','2015-08-27 01:07:06','http://www.washingtonpost.com/national/health-science/killers-ultimate-selfie-roanoke-horror-becoming-the-new-norm/2015/08/26/5fabd7c0-4c10-11e5-902f-39e9219e574b_story.html?postshare=7861440627860164'),(13,37,'Migrant crisis forcing divided Europe to look ahead','Leaders of the European Union declared this week that it has \"failed\" in the face of human agony on its frontiers. But the migrant crisis may now be forging a better way forward.The failure','http://s1.reutersmedia.net/resources/r/?m=02&d=20150827&t=2&i=1074998202&w=&fh=545px&fw=&ll=&pl=&sq=&r=LYNXNPEB7Q0WA','article','2015-08-27 21:01:39','2015-08-27 21:01:39','http://www.reuters.com/article/2015/08/27/us-europe-migrants-eu-insight-idUSKCN0QW26520150827');
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timers`
--

DROP TABLE IF EXISTS `timers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timed_id` int(11) DEFAULT NULL,
  `timed_type` varchar(255) DEFAULT NULL,
  `start_time` datetime NOT NULL DEFAULT '2015-06-24 18:59:22',
  `pos` datetime DEFAULT NULL,
  `end_time` datetime NOT NULL DEFAULT '2015-07-01 18:59:22',
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_timers_on_timed_id` (`timed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timers`
--

LOCK TABLES `timers` WRITE;
/*!40000 ALTER TABLE `timers` DISABLE KEYS */;
/*!40000 ALTER TABLE `timers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `topic_sentence` varchar(255) NOT NULL DEFAULT 'Debate Topic',
  `description` text,
  `left_side_topic` varchar(255) DEFAULT 'For',
  `right_side_topic` varchar(255) DEFAULT 'Against',
  `category` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `visibility` varchar(255) DEFAULT 'visible',
  PRIMARY KEY (`id`),
  KEY `index_topics_on_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (2,5,'Apple Computer is a force for good.','','For','Against',NULL,NULL,'2015-06-24 19:59:23','2015-08-10 15:05:14','hidden'),(3,1,'Lets have a debate about causal inference','','For','Against',NULL,NULL,'2015-06-26 15:52:33','2015-08-26 14:05:02','hidden'),(17,5,'Same-sex marriage','A conversation about same-sex marriage.','For same-sex marriage','Against same-sex marriage',NULL,NULL,'2015-06-26 19:54:17','2015-08-25 22:28:39','hidden'),(19,5,'July is absolutely the best month of the year.','','For','Against',NULL,NULL,'2015-07-14 18:52:51','2015-08-10 15:05:10','hidden'),(20,4,'Is Global Warming Real?','A debate about whether climate change is a fact.','It is real','It is not',NULL,NULL,'2015-07-15 16:36:35','2015-08-10 15:05:08','hidden'),(21,5,'Bernie Sanders - does he have a chance?','Some people think Sanders is a real contender, others not. ','For Bernie could win','Against Bernie is a joke, no chance at all',NULL,NULL,'2015-07-15 16:40:19','2015-08-10 15:05:05','hidden'),(22,5,'Iran nuclear deal - any good?','A debate about last weeks Iran ','For the deal','Against the deal',NULL,NULL,'2015-07-15 19:02:32','2015-08-10 15:05:04','hidden'),(23,5,'Cecil the Lion -- innocent victim?  \n\nhttp://www.washingtonpost.com/news/morning-mix/wp/2015/08/04/zimbabwean-hunter-says-he-did-nothing-wrong-in-luring-cecil-the-lion-to-his-death/ \n					','','I think Cecil was innocent!','I think its okay ',NULL,NULL,'2015-08-04 20:57:45','2015-08-04 21:01:28','visible'),(24,4,'Test Online','','test opinion','test other opinion ',NULL,NULL,'2015-08-10 15:08:04','2015-08-10 16:34:24','hidden'),(25,5,'Bernie Sanders crowd shot','','I think this story is right. Hillary should worry about the growing Sanders movement.',' I think Hillary is still favored by far more people than Bernie',NULL,NULL,'2015-08-10 17:06:07','2015-08-10 17:07:46','visible'),(26,4,'Test Topic','','test opinion','',NULL,NULL,'2015-08-14 14:16:01','2015-08-19 01:44:36','hidden'),(27,5,'Should we be \"terrified\" of Google\'s humanoid robot?','','I\'m not terrified at all. Robots are only as evil as we make them.',' I\'m scared. It\'s also about WHO\'S making and programming the robots, and how THEY define evil. ',NULL,NULL,'2015-08-18 17:16:48','2015-08-21 15:55:04','visible'),(28,5,'Is Amazon really a bad place to work?','','I suspect there\'s some truth in what the NYT says about working conditions at Amazon.','',NULL,NULL,'2015-08-18 17:19:50','2015-08-18 17:19:50','visible'),(29,5,'This article about technology\'s impact on jobs.','','I disagree. Today\'s technologies are NOT positive for human employement','Technology creates a lot of jobs.',NULL,NULL,'2015-08-18 17:27:45','2015-08-19 01:50:18','visible'),(30,5,'Could Google \"Rig\" the 2016 U.S. presidential election?','','I think it\'s possible. Google can influence how we think.','',NULL,NULL,'2015-08-25 21:36:12','2015-08-25 21:47:00','hidden'),(31,5,'Could Google decide the 2016 Election?','','Yes, I think Google can change how we think!','I dont believe that Google has that much power. ',NULL,NULL,'2015-08-25 21:48:55','2015-08-25 21:50:21','visible'),(32,5,'American Pie, the song','','This is a great pop song, period.','',NULL,NULL,'2015-08-26 23:54:44','2015-08-26 23:54:44','visible'),(33,5,'Is The Portrait of a Lady the greatest American novel?','','I think there are many novels greater than this one.','The Portrait of a Lady is a living breathing work of art, something that transcends labels like \"european\" or \"american.\"   ',NULL,NULL,'2015-08-26 23:57:49','2015-08-27 00:43:22','visible'),(36,9,'Killer Social Media','','I think rubbernecking a murder on social media is wrong','',NULL,NULL,'2015-08-27 01:07:06','2015-08-27 01:07:06','visible'),(37,5,'The EU looks increasingly like a failed experiment. Is the migrants crisis the last straw?','','Yes, I think the EU experiment has failed. Time to break up Europe again and start over.','It\'s not the best time for EU, but I think it can and it should survive.',NULL,NULL,'2015-08-27 21:01:39','2015-08-28 11:12:21','visible');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activities`
--

DROP TABLE IF EXISTS `user_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_status` varchar(255) DEFAULT 'expired',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_activities_on_account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activities`
--

LOCK TABLES `user_activities` WRITE;
/*!40000 ALTER TABLE `user_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-28  9:04:35
