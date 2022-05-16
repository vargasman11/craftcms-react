-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for Linux (aarch64)
--
-- Host: mariadb-10.5-3306.database.nitro    Database: craft_cms_sandbox
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-1:10.5.15+maria~focal

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eyfzekhsiqirazfiegcgddmattshgihmeqfz` (`ownerId`),
  CONSTRAINT `fk_ejjgpvcnevlcmqjcnblykhhrudzwmqplvphe` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eyfzekhsiqirazfiegcgddmattshgihmeqfz` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vqfsxeyvrcixtormnbrzysqmjkvkmtjujrxx` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_vbllcxyysdyjadcqhfjckapqajlotmxxhnyq` (`dateRead`),
  KEY `fk_savsnzemclmfwixffizroqaejquksnppwtbb` (`pluginId`),
  CONSTRAINT `fk_awkhjexelhoebnvjrxmrqxfuglzgmyjkneyh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_savsnzemclmfwixffizroqaejquksnppwtbb` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jhwgyuacnntvaptktialmrrlnucgcnltfhsi` (`sessionId`,`volumeId`),
  KEY `idx_ugavnchbivezspytqmgsgldaylenlxxlqlqj` (`volumeId`),
  CONSTRAINT `fk_nqtwbnroahxazpljrjglgregjawgqmggrfpc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_spqqhkszfjzglgdwbtoqqseyiyfcmzlwqfrv` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_auesdnmftheaimlrnvktjqwdchrvwrajzmdg` (`filename`,`folderId`),
  KEY `idx_sdafzwzhcqgyzkudubhtolueudfzavhovumm` (`folderId`),
  KEY `idx_evzfyncwbqnbnncdqhnnbgxmwwyhflmpijba` (`volumeId`),
  KEY `fk_dzfafjrmgwqubrzrxnjodtjzljpqsfqbahee` (`uploaderId`),
  CONSTRAINT `fk_dzfafjrmgwqubrzrxnjodtjzljpqsfqbahee` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lpsusjhdxttrnyiaqrfmhucglexixdgrzlmi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qhpkxekjuraybisvjyujvdeqybivuosyhpkz` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qzjnyivorphuvmjjijiddkffwmjnmddtmrmu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dukkhjddphavvlovzlfupzjsnpbomvxsfrtc` (`groupId`),
  KEY `fk_dapcmtwvbbrytdozbahqryxxbxmxtqmrodra` (`parentId`),
  CONSTRAINT `fk_dapcmtwvbbrytdozbahqryxxbxmxtqmrodra` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_eugttnxbwgrykpiqboipxtwecagghxxwmdwe` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_moakbkuhmkglkbvygghyoyeqrxsjdrzwxpme` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rptpnctxcpgobpxrtuufryhqjwxtqqwfjqkt` (`name`),
  KEY `idx_ajvsymzthisvjpuikzoazcmdcvzeiykdfqbr` (`handle`),
  KEY `idx_kwffsqpzgqrkxyemelrqdaqyppqsnbmcsmju` (`structureId`),
  KEY `idx_nyivpodrljjvawburamjvitmwzzwojksstjz` (`fieldLayoutId`),
  KEY `idx_zihnlpjmglsjlblawpfkgrmrkhilltfbdmee` (`dateDeleted`),
  CONSTRAINT `fk_mczlliipzmpvwrzleebchdknlxpaswwfbpal` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tkyzrqwrigiygiykejwtrciqxywiatshgkab` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_easiiamxfxgmpqapcobxustbgeilcoeccygp` (`groupId`,`siteId`),
  KEY `idx_ccrlastisksvgtoxhywfpovixfpqsmibsbhq` (`siteId`),
  CONSTRAINT `fk_hpsmjplktakqasevuhwhjlwczpxbxyawhiuz` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ihybkzlkoqocbsmreuihcvnocnwoupquidnw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_omqfdoloohbwgjkkbyrnbxnwimtgdiitgyee` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ywvvawzniyswipjlvlowfmbcxdbeqgxkmoys` (`siteId`),
  KEY `fk_irkwxxjjmlyfxzgaeqvnuowzapxxozwkfevt` (`userId`),
  CONSTRAINT `fk_irkwxxjjmlyfxzgaeqvnuowzapxxozwkfevt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tpuodwioubuhvdgiekvmoanwdpwlkwqpmige` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ywvvawzniyswipjlvlowfmbcxdbeqgxkmoys` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_veuyoxitsmmquwezricwrqjmfyakoxyzxzvj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_qygexmoixwkmjjmypvjambwqkntxlfbvvkdh` (`siteId`),
  KEY `fk_zbqedciizgtteehypnglvifnbhwmmazpcwrg` (`fieldId`),
  KEY `fk_zgmvgkwesaagwsnhfoievsomrcaiiquekgus` (`userId`),
  CONSTRAINT `fk_bzapelvheekqtckgbfaflkrhkioyddbzlzfv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qygexmoixwkmjjmypvjambwqkntxlfbvvkdh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zbqedciizgtteehypnglvifnbhwmmazpcwrg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zgmvgkwesaagwsnhfoievsomrcaiiquekgus` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_excerpt_cjqfztal` varchar(400) DEFAULT NULL,
  `field_footerText_yoxgseoh` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ojpjgujxvpsccjnevisrnblexecczzissync` (`elementId`,`siteId`),
  KEY `idx_qcldaxykcorctghgagpzfnisxitdzxxavyrd` (`siteId`),
  KEY `idx_mgdixvmoppjsqcqqoqjubdnujkjtdqrcnzrl` (`title`),
  CONSTRAINT `fk_mnayohvsuhrzxmdujghengpymipaxyvxrszw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rcgryftcrobyjzlvtxmtucgtsgagrwsizsdg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_dvhdxhnvzkbtstvdpnntjnyldtzrgmlttmxs` (`userId`),
  CONSTRAINT `fk_dvhdxhnvzkbtstvdpnntjnyldtzrgmlttmxs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qtsiqlmrpcgavctxvodbiylsfrrjcwsfjikb` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=931 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_rcnetvsmbbfvmzzzystzoajmtzmbzzjyuyoh` (`creatorId`,`provisional`),
  KEY `idx_mnangtniycjeouxoxekkdplyuatgepjstsmv` (`saved`),
  KEY `fk_csmoudttpcwbbylonjigjknydhmnlfbqezso` (`canonicalId`),
  CONSTRAINT `fk_csmoudttpcwbbylonjigjknydhmnlfbqezso` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ywpjltjfbdjtuyovxnrkneyhkmwtbfnzphnl` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cfpwwgmuykbmbogiwtcuqnfcijujtqhxstsy` (`dateDeleted`),
  KEY `idx_efejftbmdhcevkcaqltljslbmtwuuvjngjda` (`fieldLayoutId`),
  KEY `idx_lodzzviwxezfyuhkoneekbffoffyfsqbkbqh` (`type`),
  KEY `idx_dqcivbyoptwogfrtehdpnhieixbfooxwtmxh` (`enabled`),
  KEY `idx_rgxerhnoxmsnordcxkgopogkygtrilczhxfg` (`archived`,`dateCreated`),
  KEY `idx_vzbpzxdyhxhimzxkicyxhgvaspqcygjqyvkj` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_jliofpqcokzsflvoriykvetoqqfplayxxzoh` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_vrxvncpacwzldthbvncdvvihlyxkvelbllno` (`canonicalId`),
  KEY `fk_qkiisweuewrkgzbydwvmkwplagpboinzfzva` (`draftId`),
  KEY `fk_zbmatphdwebrwxttbfdazvmubscoopptuzzm` (`revisionId`),
  CONSTRAINT `fk_qkiisweuewrkgzbydwvmkwplagpboinzfzva` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vrxvncpacwzldthbvncdvvihlyxkvelbllno` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ykhqiatsxqwmqdkfvtpzycbszidvgpiqgvvx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zbmatphdwebrwxttbfdazvmubscoopptuzzm` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tzqptlzvautyiznhhivrgxuuhdzoxciahndg` (`elementId`,`siteId`),
  KEY `idx_vqesbbgqnagvlztwtfmdrqvavvkrihvqlgbx` (`siteId`),
  KEY `idx_cmwjxoapfjjkztkpmgmzuxsnzcbwyyuimgrg` (`slug`,`siteId`),
  KEY `idx_vzlfoytdqeeguovewuvussopjkjvakwcbvkt` (`enabled`),
  KEY `idx_rxcqdqujfcthhdzqdoytpceierbzhsbettzy` (`uri`,`siteId`),
  CONSTRAINT `fk_hahppusoymaleiyykiiiloeixryqpomhutos` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rctixwaxiztibaurnocciymowehugpvjmavu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eahnkgwfajnfpnmtuyajxdhqqgikgsvffgkr` (`postDate`),
  KEY `idx_ualkmlzxbvdlltqtcxxfdnpqajmeqvpouxhs` (`expiryDate`),
  KEY `idx_awglrfcsiuikgzvwgvluitpnqsimcfuxxwgv` (`authorId`),
  KEY `idx_voavvpejtmzkggbipksxtdolnzvwcbyulryn` (`sectionId`),
  KEY `idx_flawfxhkotdxxdyrgpcihqdqayrdzpzwqctp` (`typeId`),
  KEY `fk_fezfurwfsenjoqdcwqseovhmllqhqfyrrwjo` (`parentId`),
  CONSTRAINT `fk_dxbeoonlucoeqnszsgnlgwvgiovoddzhitew` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fezfurwfsenjoqdcwqseovhmllqhqfyrrwjo` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lhvpkkmzbhbhqlbysajljacqhxmlnopebtpf` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rshiyjqehclpjjkzfghjcmeajjwqfcfqsyff` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttrmqdoywzruwimfjtzmcnqnplnckdyskpgf` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_niramxufbbvwxmfgxjmahyfttbiakywwpnmd` (`name`,`sectionId`),
  KEY `idx_kstwupqpsaipfmohqtpsvctygujgqpqrhmix` (`handle`,`sectionId`),
  KEY `idx_gpukcilunhjtqiomliffkbmylwmxhalidoag` (`sectionId`),
  KEY `idx_puwrovbkaagljbncjnjwtstpzlhinnksojkk` (`fieldLayoutId`),
  KEY `idx_nvhrqxmohuairgmqcukczrucoeglrmqwmpku` (`dateDeleted`),
  CONSTRAINT `fk_cjeichmtfcsddhmnzprotvumlcswwnbywxcm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kvwmdzokocgmulxwfcooskhdwlexvpttxxof` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ipsyreswckhuvqywynpblgbzzzogpkmraadv` (`name`),
  KEY `idx_gzxqemuolnvharialrkpbjzkzxwkzocuapax` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tnxhsjdnbroizfhzdavzrvgtrxjsnspijokf` (`layoutId`,`fieldId`),
  KEY `idx_bfcfiefczgqhruzvtexdpvaadilzrnmrnsxm` (`sortOrder`),
  KEY `idx_klqvglwzszicqrbzgupsamiuseoczkkrgfjh` (`tabId`),
  KEY `idx_jtwqtwktjxplqsmjhpcgnpjgejljxfhvvwgq` (`fieldId`),
  CONSTRAINT `fk_jhgbisiulmatbouvosyacpmnljzhiolboida` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_viizcbdnrpegyibabtikbtbmbzmmqoiytpnx` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vxfdzlhvcboanankzkeoczqlqczdsvblvusi` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cijdtpyrlgqapbelccddjkvvmhjixdgaaxmv` (`dateDeleted`),
  KEY `idx_jlcnenbnymvelicekjtkmbtigqbwbxmjpqsg` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gltneofwjeubrjtknrbtgxuttgypxbofzxxu` (`sortOrder`),
  KEY `idx_xbfylsjrqaemibhqrrjvnywpivdxigeokzuy` (`layoutId`),
  CONSTRAINT `fk_qqmgmhuobaekvrztjptaxbbfnmrhxfyddbzq` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pohakqenlehlwimlrdbcpghveburmftzascj` (`handle`,`context`),
  KEY `idx_smawmoxmnibcfhiygoosfqelynfbnozccgso` (`groupId`),
  KEY `idx_mktawygiylvxsuweoqydlchentcaftvkoodh` (`context`),
  CONSTRAINT `fk_adchgxxrnokfinbmgmblzlnokvhvaqubflup` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cezbmieiaewuovltnszeogamrywhnlkhrgkc` (`name`),
  KEY `idx_exfigkefnawuauqvtmeslmqodjibdsnnjqqt` (`handle`),
  KEY `idx_vlwngwjmwmkzifopqiwrqkwtaykzovthihqi` (`fieldLayoutId`),
  KEY `idx_ohnnheuhcimnzeavlgopqgoznngczqkdcqcs` (`sortOrder`),
  CONSTRAINT `fk_caicbfnufwcvrhdcmgfzdelymfhxfcmaobeh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ufkuxbqmotdjoxtgwuvsrugkihpnsnlaxpvp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aflabxzopyxxsxjpqobgopnyxvzxzwrvqace` (`accessToken`),
  UNIQUE KEY `idx_ehxcbvcnqhsedrimajsmixiohxifmilaexvx` (`name`),
  KEY `fk_ssviedavmarxubejbiqwdqbdtcjniniglhoh` (`schemaId`),
  CONSTRAINT `fk_ssviedavmarxubejbiqwdqbdtcjniniglhoh` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vapsbsxjspiuonbzxajhrlzwnxazommmnlbw` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bdgmyijgfripfemvdhhonnoixsgpllxuavfp` (`name`),
  KEY `idx_jkewxwuvmtiucstwsohwrxfchmfzsfmpkegp` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_yksouaahbhygspogoziexegrblxfwpwldgwa` (`primaryOwnerId`),
  KEY `idx_yudutriaftasfgpozztmrlhfsqhflkvghgri` (`fieldId`),
  KEY `idx_kkfzxpdcjcwmhtomfwqzcxmlbfxqwoadmhmd` (`typeId`),
  CONSTRAINT `fk_fatkfrfgfbypdsupluwtojmjaeveumwcxoqk` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mdzqbvxxugueknrsbnzdwungymuahofiowra` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pahlsmdjiuofiaoqbnwwahbrxtlebxtogonp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qkfqmfztmthxfzhtjfpfyjnkbqlvvpooylyv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_rolatvtuyvayqgokewreikwdbpnagtrsbdlb` (`ownerId`),
  CONSTRAINT `fk_oyvgdunqfzvykrhrwycglfnjdjuomyyaufhn` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rolatvtuyvayqgokewreikwdbpnagtrsbdlb` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pwrdkndqzrryxwqhdksqkmayzzdvjegtxftj` (`name`,`fieldId`),
  KEY `idx_bgngcqqhpldgrxaisxygeybmkaknrhvlfvxd` (`handle`,`fieldId`),
  KEY `idx_mqzxrenzrcrzrzcpitctylovjvmsefjvgsbn` (`fieldId`),
  KEY `idx_ysytmpnfniwmjuzszbseygdcpfmwyarwuawa` (`fieldLayoutId`),
  CONSTRAINT `fk_krxxtheauivwdxivazzrwulnstujruwhbrpa` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tiakcuffhnrtqeuckctvxsqkrefcofnploec` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_postcontent`
--

DROP TABLE IF EXISTS `matrixcontent_postcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_postcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_text_text_yyxkmiih` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_typebgvurdhhhycavdxwucnymkgboxxlbals` (`elementId`,`siteId`),
  KEY `fk_rtfridotoyxwkvbxmtdtktuzgfxrpawknqwu` (`siteId`),
  CONSTRAINT `fk_iyqpjhzhpgsmckaqfbigvzsiqznkypdpqiii` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rtfridotoyxwkvbxmtdtktuzgfxrpawknqwu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhvxlsdwstynyalycqvfptqxwgykezaqalhk` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wylaizyhvutwnybpuuhyctkfzzrlpkvlekqp` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pupplsqrrtzqwzgeiyhuslvogzcrmprxmxvm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_scqnnbdkjqajpsiydepcwoophddrvbtnhybu` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ijikzcrgyzptpoocrfxxywnogewujfzmtqru` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_phvdtomqwgcgwrfivjppeibswmpvmlehogwh` (`sourceId`),
  KEY `idx_etyjnnylnjbbllkxrllkwmaystsmlikvpgej` (`targetId`),
  KEY `idx_thyykhlfihaoshgaipgzpzbyjrxgrgbgpphq` (`sourceSiteId`),
  CONSTRAINT `fk_ipmwlxjlmjvuqcnlxaoxdmgapyckcydiuwan` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_koggsvcupuoshcmteifojpbioiqdfqkjacfc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nsacvtrcmopbyeoxowxbqfmforejjaabatnx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qtsjzmuourjytnlgktgiqmlyafpglvwqstfp` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zlrmtcrlbxtbchdmtpopxefjxdhsrviqqqwm` (`canonicalId`,`num`),
  KEY `fk_ouzxhdmayizobpkfuywsuredclubpzcdnyhc` (`creatorId`),
  CONSTRAINT `fk_ouzxhdmayizobpkfuywsuredclubpzcdnyhc` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yndxkcgfybglafcnhrpowpoiuvcopddqusjd` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_zpiamocwmwkzjxugnhteneuybsiokdbpkkpm` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lxyqcayqyqjsmilfljeoixtogukcvkqigjvk` (`handle`),
  KEY `idx_wwfnqhcbkavzppdrpyywljzcaoyqajjvnxqg` (`name`),
  KEY `idx_urpajvdwuwjzapisvnseqjjnqlbhwitgfiev` (`structureId`),
  KEY `idx_whszfnrsbhwjopgaojxphmtvzadnusbywbhc` (`dateDeleted`),
  CONSTRAINT `fk_ewzrkimngfezfwpskpkzznxpmqflazkgusnw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gpgqtaueajnrdcswhccijcujqomzenjsswos` (`sectionId`,`siteId`),
  KEY `idx_lafonyjutvgztojvvobsofhwspxefaantwwm` (`siteId`),
  CONSTRAINT `fk_eyjvfalwrdcucktvqvhdvqxvgjsjquftzcev` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzmeurtjgwgjsaxleonjskouffbxhcvdijhq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fxgflbukdkfnmluuxbhkoqfyyesnbnikqvpb` (`uid`),
  KEY `idx_oetwckgancgurthbdmvwdkcefoevfrcufzeo` (`token`),
  KEY `idx_ypgeffcbikwfdphmdmhfviyuhxazfxbpwikv` (`dateUpdated`),
  KEY `idx_rmykkqbrksecrucbvbrknjxwvccylqfgettp` (`userId`),
  CONSTRAINT `fk_vjkpdgyfkjzljwmibwilqxmnlgrtsgscrzxc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xqqrmtxutjbjjwqcikhfdmysxjyfbalvjyja` (`userId`,`message`),
  CONSTRAINT `fk_vnsqqougyjpoyekldlrhvcennhmhrdcwxlly` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lvrnjjrjnpcbldwoggerfmtewiosombxydif` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hxcmbjyagwrczzppixxcaswlyzrfwlxterix` (`dateDeleted`),
  KEY `idx_itwquzuecoiajmqappoduytixzglamvjkzze` (`handle`),
  KEY `idx_uzsztxjiguximnacascpmqfkmjqernoxleqb` (`sortOrder`),
  KEY `fk_vhjwcehlzbhqloclywlcaasutgdeqgysdzkg` (`groupId`),
  CONSTRAINT `fk_vhjwcehlzbhqloclywlcaasutgdeqgysdzkg` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pceycfmcggbfgwuaslcujhuidjukmxpyuiaq` (`structureId`,`elementId`),
  KEY `idx_lnjhescttkoflcucvbjpfdewuefoeytbydwe` (`root`),
  KEY `idx_gxxqyputszcxgghhkbpogggzqiheodxmpwsj` (`lft`),
  KEY `idx_qoggcrqelmrzdsnotbfspnfdkrjwxutwxjhx` (`rgt`),
  KEY `idx_eohteeqexxvrgqhnfsqjsahacxecrbrgtxiy` (`level`),
  KEY `idx_ohynqyouqybpooathqattuwpiledlqwgjgue` (`elementId`),
  CONSTRAINT `fk_dineytuuejxcuystuqwmybljwxhfdjuzdrgj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vxtahgepwlyyqtzpvlepkjtpjrmbslkknbhc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_roegwlxfbvsbtsqqpojymdnjdvqiiorkliky` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fbbxlgzzzrsoabqrxhyeywmbikuuqltkvkyl` (`key`,`language`),
  KEY `idx_uwfeuifklpgkkbbfhpvuvbfcuwvhcfzqrxyd` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tkftybhmcrmzrzpyjtekqdeuuwwcxeojfyyc` (`name`),
  KEY `idx_hzjifbmzjcvyzuyqqzroqapptnwkxxjxleeg` (`handle`),
  KEY `idx_efvxbbaqhyafqvwzgotqnxpjswqhdhpjzorc` (`dateDeleted`),
  KEY `fk_xpypdykcajbkxcussoqxvdnubzowywdvfcgp` (`fieldLayoutId`),
  CONSTRAINT `fk_xpypdykcajbkxcussoqxvdnubzowywdvfcgp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cxidgiuxanqowwiogoiuygizdjeuiqimafbl` (`groupId`),
  CONSTRAINT `fk_fsvicupsagmjmsdepphmbrnpthyqdhydawys` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbxejdpybkavfhoeksvagfklryetybobkozz` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_clpbvuupdgylxjxkdedtzckigttkefxfdkru` (`token`),
  KEY `idx_volpzqxxmyuvtrocbwziibumexndggdrdtsa` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ontmlppgbuqlktijzzmofdlutdclzgvyovtq` (`handle`),
  KEY `idx_ashowihyxrmidfmgbkamqoupjqzlsvoqpwml` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ykvcviosourgsrntowzamlxufmjuuarberii` (`groupId`,`userId`),
  KEY `idx_kksgcshdltacqsovlcdmbohjeegwlmnfxxgj` (`userId`),
  CONSTRAINT `fk_lkgpcvenwdblgspoldkigkcdvzjfbofdrual` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nwqhhajjcroxbtmjnvjcytcafwykbnhzbwpg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cmhxdryfdifkutckjpdrisyuddsgfynpkesu` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sqnxtztxhcizethgxlsokvhllwpzprvukcbw` (`permissionId`,`groupId`),
  KEY `idx_ytgvcjlkevdmqhnpmqitodthhrxzpxatodyj` (`groupId`),
  CONSTRAINT `fk_bfxrzgrvnjbdaphlvcdtkghxxbblcbopuwfy` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mqjxxlalkxmcwkiprzevuazvrmittfshrvsv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xuobmxxxtbwwkxfzmhwvejioknkrtukyzrzy` (`permissionId`,`userId`),
  KEY `idx_nimiehlieawojwmhubsabkrzjzyzdoiboead` (`userId`),
  CONSTRAINT `fk_mdcxkucttexlexznqoemumysehuaaecenfti` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qtnhhkeqnnorocromqwfyequngpdfclzonjw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_jdgkabieutfodhonbrmmhgjzhaapbxkbltaw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gkjgbpgyzuyftctbplbfhjryrrmlwgccoobf` (`active`),
  KEY `idx_ntgxlceqxikwuoopnvouwdxunpzlaviyztls` (`locked`),
  KEY `idx_mfliyeipsknejztphhcepxqluealhdqycqxo` (`pending`),
  KEY `idx_ywcosimlikonelkolodwgprcafxjchvlozjo` (`suspended`),
  KEY `idx_cymhnplsednhgxqynrjkpdeqafliqygpglzv` (`verificationCode`),
  KEY `idx_aovruwrkhxejpjxtgsdcdvlohnoycafhavdl` (`email`),
  KEY `idx_cgzjncbzsqzqumdqngrpergbodheridovjey` (`username`),
  KEY `fk_cdvxfrusafhlxnuqqyaanfqrbdofjhbvtrnd` (`photoId`),
  CONSTRAINT `fk_cdvxfrusafhlxnuqqyaanfqrbdofjhbvtrnd` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hmfpsoydrhmekpgqxvlnykxrjpvjlemhzbcs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_whfamwfdcrduylkxxrqzmeqkpiltsjcouirb` (`name`,`parentId`,`volumeId`),
  KEY `idx_weoaciihsjgglfaqfbmaqryjrdrmhpdvpcew` (`parentId`),
  KEY `idx_bqmclnxglgvcaoqjdvoeafpcmfgtvjultimy` (`volumeId`),
  CONSTRAINT `fk_nqrryvnaqvyetzlfqyrvnqchbhwdgyeddhlg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_roxazuagczjirpllznygvrgaamtcsktflrqi` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yfvbhkgjtzxovzumtrhwmolhyvghfqzpyxfq` (`name`),
  KEY `idx_derbosgwvlvdutteuvzoqgrvhpqvkhbmsboc` (`handle`),
  KEY `idx_dssxrmuzckhgrnbpcpiffapwpzpvbvehodwn` (`fieldLayoutId`),
  KEY `idx_jgmhlmvinvdqavkdsvmujttiebhenpeutujp` (`dateDeleted`),
  CONSTRAINT `fk_gyddgzhxfzuidujrpzblzgjwtttmenfkwmyd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ectidpdifkpgsjgkvpxgxikdvqvkchlaphjq` (`userId`),
  CONSTRAINT `fk_vubdgakosigpolhtulbilxuwgetluaopmips` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'craft_cms_sandbox'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16 13:31:55
-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for Linux (aarch64)
--
-- Host: mariadb-10.5-3306.database.nitro    Database: craft_cms_sandbox
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-1:10.5.15+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (8,1,1,1,'pexels-pixabay-262508.jpg','image',NULL,2968,1971,515241,NULL,NULL,NULL,'2022-05-16 01:15:09','2022-05-16 01:15:10','2022-05-16 01:15:10'),(9,1,1,1,'pexels-miguel-á-padriñán-1591056.jpg','image',NULL,6016,4000,2052618,NULL,NULL,NULL,'2022-05-16 01:15:56','2022-05-16 01:15:57','2022-05-16 01:15:57'),(19,1,1,1,'pexels-magda-ehlers-1337380.jpg','image',NULL,5256,3504,546905,NULL,NULL,NULL,'2022-05-16 01:28:49','2022-05-16 01:28:50','2022-05-16 01:28:50');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (5,1,'postDate','2022-05-16 01:16:51',0,1),(5,1,'slug','2022-05-16 01:14:28',0,1),(5,1,'title','2022-05-16 01:14:28',0,1),(5,1,'uri','2022-05-16 01:14:28',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2022-05-16 01:43:36',0,1),(5,1,1,'2022-05-16 01:17:24',0,1),(5,1,4,'2022-05-16 01:17:24',0,1),(5,1,5,'2022-05-16 01:16:47',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-05-15 23:31:13','2022-05-15 23:31:13','79f3d28a-2f2b-4384-8e9c-59d553666554',NULL,NULL),(2,2,1,'Home','2022-05-16 00:21:46','2022-05-16 01:43:36','0e097478-ae54-4673-a988-adc1d1298dcc',NULL,NULL),(3,3,1,'Home','2022-05-16 00:21:46','2022-05-16 00:21:46','ee700fd5-89a9-474a-98b1-70b2f8cfc041',NULL,NULL),(4,4,1,'Home','2022-05-16 01:12:25','2022-05-16 01:12:25','d0a2bb6c-1d50-447c-8f2c-0bd95b8b3143',NULL,NULL),(5,5,1,'Blog Entry 1','2022-05-16 01:14:12','2022-05-16 01:17:24','3dcf9e41-e114-491d-8976-59e300cb9038','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet fugiat in maxime.',NULL),(6,8,1,'Pexels pixabay 262508','2022-05-16 01:15:09','2022-05-16 02:48:17','a8aa9497-9258-467f-b721-165bd00d0f1e',NULL,NULL),(7,9,1,'Pexels miguel á padriñán 1591056','2022-05-16 01:15:55','2022-05-16 02:48:17','1611dbae-ae96-46ba-acc0-8fe7321c357f',NULL,NULL),(8,10,1,'Blog Entry 1','2022-05-16 01:16:52','2022-05-16 01:16:52','cd336933-a886-455c-9ae4-d4aba8d2bc6f','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet fugiat in maxime.',NULL),(10,16,1,'Blog Entry 1','2022-05-16 01:17:24','2022-05-16 01:17:24','c70fedb7-eacf-4ae0-bc23-5940142f11c8','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet fugiat in maxime.',NULL),(11,18,1,NULL,'2022-05-16 01:22:35','2022-05-16 01:43:18','0c684a80-aadf-4504-947a-195003a08283',NULL,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, reiciendis.'),(12,19,1,'Pexels magda ehlers 1337380','2022-05-16 01:28:49','2022-05-16 02:48:16','38e28958-6d32-471e-9d35-fd93e47531eb',NULL,NULL),(14,25,1,'Home','2022-05-16 01:43:36','2022-05-16 01:43:36','b5558080-c287-4772-a2ea-42d70dfed2a1',NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `deprecationerrors` VALUES (1,'enableGraphQlCaching','/app/config/general.php','2022-05-16 13:31:52','/app/config/general.php',NULL,'The `enableGraphQlCaching` config setting has been renamed to `enableGraphqlCaching`.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/config/GeneralConfig.php\",\"line\":1692,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"enableGraphQlCaching\\\", \\\"The `enableGraphQlCaching` config setting has been renamed to `e...\\\", \\\"/app/config/general.php\\\"\"},{\"objectClass\":\"craft\\\\config\\\\GeneralConfig\",\"file\":\"/app/vendor/yiisoft/yii2/BaseYii.php\",\"line\":558,\"class\":\"craft\\\\config\\\\GeneralConfig\",\"method\":\"__set\",\"args\":\"\\\"enableGraphQlCaching\\\", true\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/BaseObject.php\",\"line\":107,\"class\":\"yii\\\\BaseYii\",\"method\":\"configure\",\"args\":\"craft\\\\config\\\\GeneralConfig, [\\\"defaultWeekStartDay\\\" => 1, \\\"omitScriptNameInUrls\\\" => true, \\\"devMode\\\" => true, \\\"allowAdminChanges\\\" => true, ...]\"},{\"objectClass\":\"craft\\\\config\\\\GeneralConfig\",\"file\":\"/app/vendor/craftcms/cms/src/services/Config.php\",\"line\":147,\"class\":\"yii\\\\base\\\\BaseObject\",\"method\":\"__construct\",\"args\":\"[\\\"defaultWeekStartDay\\\" => 1, \\\"omitScriptNameInUrls\\\" => true, \\\"devMode\\\" => true, \\\"allowAdminChanges\\\" => true, ...]\"},{\"objectClass\":\"craft\\\\services\\\\Config\",\"file\":\"/app/vendor/craftcms/cms/src/services/Config.php\",\"line\":92,\"class\":\"craft\\\\services\\\\Config\",\"method\":\"_createConfigObj\",\"args\":\"\\\"general\\\"\"},{\"objectClass\":\"craft\\\\services\\\\Config\",\"file\":\"/app/vendor/craftcms/cms/src/services/Config.php\",\"line\":209,\"class\":\"craft\\\\services\\\\Config\",\"method\":\"getConfigSettings\",\"args\":\"\\\"general\\\"\"},{\"objectClass\":\"craft\\\\services\\\\Config\",\"file\":\"/app/vendor/craftcms/cms/src/helpers/App.php\",\"line\":1005,\"class\":\"craft\\\\services\\\\Config\",\"method\":\"getGeneral\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/config/app.web.php\",\"line\":11,\"class\":\"craft\\\\helpers\\\\App\",\"method\":\"webRequestConfig\",\"args\":null},{\"objectClass\":null,\"file\":null,\"line\":null,\"class\":null,\"method\":\"{closure}\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/di/Container.php\",\"line\":633,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"Closure, []\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/app/vendor/yiisoft/yii2/BaseYii.php\",\"line\":349,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"invoke\",\"args\":\"Closure, []\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/di/ServiceLocator.php\",\"line\":137,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"Closure\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":766,\"class\":\"yii\\\\di\\\\ServiceLocator\",\"method\":\"get\",\"args\":\"\\\"request\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":346,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"get\",\"args\":\"\\\"request\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":160,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"get\",\"args\":\"\\\"request\\\"\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/base/ApplicationTrait.php\",\"line\":1444,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"getRequest\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":97,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"_preInit\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/BaseObject.php\",\"line\":109,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"init\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":204,\"class\":\"yii\\\\base\\\\BaseObject\",\"method\":\"__construct\",\"args\":\"[\\\"env\\\" => \\\"dev\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"addresses\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Addresses\\\"], \\\"announcements\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Announcements\\\"], \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], ...], \\\"id\\\" => \\\"CraftCMS--3c2be9b8-e35c-4781-9605-9f8db1f0dc87\\\", \\\"name\\\" => \\\"Craft CMS\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":null,\"line\":null,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"__construct\",\"args\":\"[\\\"env\\\" => \\\"dev\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"addresses\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Addresses\\\"], \\\"announcements\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Announcements\\\"], \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], ...], \\\"id\\\" => \\\"CraftCMS--3c2be9b8-e35c-4781-9605-9f8db1f0dc87\\\", \\\"name\\\" => \\\"Craft CMS\\\", ...]\"},{\"objectClass\":\"ReflectionClass\",\"file\":\"/app/vendor/yiisoft/yii2/di/Container.php\",\"line\":419,\"class\":\"ReflectionClass\",\"method\":\"newInstanceArgs\",\"args\":\"[[\\\"vendorPath\\\" => \\\"/app/vendor\\\", \\\"env\\\" => \\\"dev\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"addresses\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Addresses\\\"], \\\"announcements\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Announcements\\\"], \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], ...], \\\"id\\\" => \\\"CraftCMS--3c2be9b8-e35c-4781-9605-9f8db1f0dc87\\\", ...]]\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/app/vendor/yiisoft/yii2/di/Container.php\",\"line\":170,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"build\",\"args\":\"\\\"craft\\\\web\\\\Application\\\", [], [\\\"vendorPath\\\" => \\\"/app/vendor\\\", \\\"env\\\" => \\\"dev\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"addresses\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Addresses\\\"], \\\"announcements\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Announcements\\\"], \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], ...], \\\"id\\\" => \\\"CraftCMS--3c2be9b8-e35c-4781-9605-9f8db1f0dc87\\\", ...]\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/app/vendor/yiisoft/yii2/BaseYii.php\",\"line\":365,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"get\",\"args\":\"\\\"craft\\\\web\\\\Application\\\", [], [\\\"vendorPath\\\" => \\\"/app/vendor\\\", \\\"env\\\" => \\\"dev\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"addresses\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Addresses\\\"], \\\"announcements\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Announcements\\\"], \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], ...], \\\"id\\\" => \\\"CraftCMS--3c2be9b8-e35c-4781-9605-9f8db1f0dc87\\\", ...]\"},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/Craft.php\",\"line\":53,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"[\\\"vendorPath\\\" => \\\"/app/vendor\\\", \\\"env\\\" => \\\"dev\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"addresses\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Addresses\\\"], \\\"announcements\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Announcements\\\"], \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], ...], \\\"id\\\" => \\\"CraftCMS--3c2be9b8-e35c-4781-9605-9f8db1f0dc87\\\", ...], []\"},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/bootstrap/bootstrap.php\",\"line\":239,\"class\":\"Craft\",\"method\":\"createObject\",\"args\":\"[\\\"vendorPath\\\" => \\\"/app/vendor\\\", \\\"env\\\" => \\\"dev\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"addresses\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Addresses\\\"], \\\"announcements\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Announcements\\\"], \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], ...], \\\"id\\\" => \\\"CraftCMS--3c2be9b8-e35c-4781-9605-9f8db1f0dc87\\\", ...]\"},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/bootstrap/web.php\",\"line\":40,\"class\":null,\"method\":\"require\",\"args\":\"\\\"/app/vendor/craftcms/cms/bootstrap/bootstrap.php\\\"\"},{\"objectClass\":null,\"file\":\"/app/web/index.php\",\"line\":11,\"class\":null,\"method\":\"require\",\"args\":\"\\\"/app/vendor/craftcms/cms/bootstrap/web.php\\\"\"}]','2022-05-15 23:31:14','2022-05-16 13:31:52','05a9e3df-efc4-4661-8a90-5aec4b1ec192');
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-05-15 23:31:13','2022-05-15 23:31:13',NULL,NULL,'9f41ac08-a6dd-4e58-9e00-4bb023ae7caf'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2022-05-16 00:21:46','2022-05-16 01:43:36',NULL,NULL,'2b890b7e-ce1b-44f8-9216-f59bc24810b3'),(3,2,NULL,1,2,'craft\\elements\\Entry',1,0,'2022-05-16 00:21:46','2022-05-16 00:21:46',NULL,NULL,'2efa1765-f38d-4f33-a00a-b66e81436fef'),(4,2,NULL,2,2,'craft\\elements\\Entry',1,0,'2022-05-16 01:12:25','2022-05-16 01:12:25',NULL,NULL,'65f44f85-3e90-40b2-b57a-b6aee44df5a5'),(5,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-05-16 01:14:12','2022-05-16 01:17:24',NULL,NULL,'0b804f7f-8c07-424e-a77a-c321acb96036'),(6,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:14:18','2022-05-16 01:14:18',NULL,'2022-05-16 01:14:21','dff40fb7-fe97-4c61-be8d-9175c9ee384e'),(7,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:14:21','2022-05-16 01:14:21',NULL,NULL,'a2140e7a-c9e7-42bb-ba39-d35c63d34518'),(8,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-05-16 01:15:09','2022-05-16 02:48:17',NULL,NULL,'cd3ac4b8-3675-4eda-8069-14e71db5e8d3'),(9,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-05-16 01:15:55','2022-05-16 02:48:17',NULL,NULL,'21deebf5-bbc7-4027-9945-b003885e3e7a'),(10,5,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-05-16 01:16:51','2022-05-16 01:16:52',NULL,NULL,'83589eba-4815-4517-ac13-f2b05e7c06ea'),(11,7,NULL,4,4,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:14:21','2022-05-16 01:16:52',NULL,NULL,'cf643cf4-f61c-4706-9c81-46e919640b6d'),(13,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:17:12','2022-05-16 01:17:12',NULL,'2022-05-16 01:17:22','a18a5d62-9ed1-4f01-9a20-2d3a00e86108'),(15,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:17:24','2022-05-16 01:17:24',NULL,NULL,'8f1874ac-7f70-4b10-883d-bafbedb98eeb'),(16,5,NULL,5,1,'craft\\elements\\Entry',1,0,'2022-05-16 01:17:24','2022-05-16 01:17:24',NULL,NULL,'f33cb93e-71eb-4ad0-a826-7c91922d1c13'),(17,15,NULL,6,5,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:17:24','2022-05-16 01:17:24',NULL,NULL,'aa4d4bd5-00ff-4e95-844b-de51a233412b'),(18,NULL,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2022-05-16 01:22:35','2022-05-16 01:43:18',NULL,NULL,'ee023d65-5e01-49fa-8fcc-f7f40588bd82'),(19,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-05-16 01:28:49','2022-05-16 02:48:16',NULL,NULL,'5bf22835-2462-415e-a34b-833a583669bb'),(21,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:43:31','2022-05-16 01:43:31',NULL,'2022-05-16 01:43:35','ae009eb1-00f5-41ff-97dd-ad9dc3dc065a'),(22,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:43:35','2022-05-16 01:43:35',NULL,'2022-05-16 01:43:36','97e208f9-a501-447c-916b-9a5c8a3792a4'),(24,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:43:36','2022-05-16 01:43:36',NULL,NULL,'f02e2c10-9d81-45f5-ba2e-ae0fa97b5c54'),(25,2,NULL,7,2,'craft\\elements\\Entry',1,0,'2022-05-16 01:43:36','2022-05-16 01:43:36',NULL,NULL,'1f6cebef-12e8-4cfc-8e4f-9b8b6f1ee2f3'),(26,24,NULL,8,4,'craft\\elements\\MatrixBlock',1,0,'2022-05-16 01:43:36','2022-05-16 01:43:36',NULL,NULL,'8f66e3db-fcb3-4d5c-bebc-30a391983d39');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-05-15 23:31:13','2022-05-15 23:31:13','9d445118-ca01-4b22-b39e-3ce9de8193d4'),(2,2,1,'home','__home__',1,'2022-05-16 00:21:46','2022-05-16 00:21:46','b5a4e47c-eeb9-419c-aa56-c51ec55a173f'),(3,3,1,'home','__home__',1,'2022-05-16 00:21:46','2022-05-16 00:21:46','b05e5bba-ff75-4e8f-a644-aa9c721a4c9d'),(4,4,1,'home','__home__',1,'2022-05-16 01:12:25','2022-05-16 01:12:25','14fe9782-681b-49b4-82ed-8fb4a50dd929'),(5,5,1,'blog-entry-1','blog/blog-entry-1',1,'2022-05-16 01:14:12','2022-05-16 01:14:28','9bb4691f-7330-455d-9d7e-ebbfe74f286d'),(6,6,1,NULL,NULL,1,'2022-05-16 01:14:18','2022-05-16 01:14:18','30296546-28c4-4f6d-b1fd-f1803e2d8a37'),(7,7,1,NULL,NULL,1,'2022-05-16 01:14:21','2022-05-16 01:14:21','11cb1cfe-ce1c-4fed-915e-6fe225383fb7'),(8,8,1,NULL,NULL,1,'2022-05-16 01:15:09','2022-05-16 01:15:09','d5a66228-947e-410c-bf14-dc26aa752ca2'),(9,9,1,NULL,NULL,1,'2022-05-16 01:15:55','2022-05-16 01:15:55','8a55a28a-d9a0-47fa-b2cd-08725819053b'),(10,10,1,'blog-entry-1','blog/blog-entry-1',1,'2022-05-16 01:16:52','2022-05-16 01:16:52','814f7271-d6fc-4625-88ec-f6eb472d92e9'),(11,11,1,NULL,NULL,1,'2022-05-16 01:16:52','2022-05-16 01:16:52','bf74a156-6de9-471d-8a2d-b731af376f0a'),(13,13,1,NULL,NULL,1,'2022-05-16 01:17:12','2022-05-16 01:17:12','bf56ccce-2417-4d32-9f81-0fe25f14bd6d'),(15,15,1,NULL,NULL,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','d433e6c1-f145-414d-bd14-917e043c9dc8'),(16,16,1,'blog-entry-1','blog/blog-entry-1',1,'2022-05-16 01:17:24','2022-05-16 01:17:24','06abd8cd-114f-48cd-8662-621182b9dc6d'),(17,17,1,NULL,NULL,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','e606c4b5-a862-4cf3-9025-8246c8cdd3d0'),(18,18,1,NULL,NULL,1,'2022-05-16 01:22:35','2022-05-16 01:22:35','047ac7d9-b438-46cc-b3c7-102f6e3b521a'),(19,19,1,NULL,NULL,1,'2022-05-16 01:28:49','2022-05-16 01:28:49','38626b05-862e-46b9-90e6-82998f271df8'),(21,21,1,NULL,NULL,1,'2022-05-16 01:43:31','2022-05-16 01:43:31','c41d25ef-ed51-496c-9528-1e2d7f458e19'),(22,22,1,NULL,NULL,1,'2022-05-16 01:43:35','2022-05-16 01:43:35','7c0d06c5-0e59-46c2-a62e-63c0c817da0b'),(24,24,1,NULL,NULL,1,'2022-05-16 01:43:36','2022-05-16 01:43:36','c95e249d-dad3-4f13-a609-a781c7fbf860'),(25,25,1,'home','__home__',1,'2022-05-16 01:43:36','2022-05-16 01:43:36','c098af7a-bac7-491b-bd1c-bf503e99a0ad'),(26,26,1,NULL,NULL,1,'2022-05-16 01:43:36','2022-05-16 01:43:36','d996e0ad-483f-4758-9dce-9d1bfe0a38f0');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,2,NULL,2,NULL,'2022-05-16 00:21:00',NULL,NULL,'2022-05-16 00:21:46','2022-05-16 00:21:46'),(3,2,NULL,2,NULL,'2022-05-16 00:21:00',NULL,NULL,'2022-05-16 00:21:46','2022-05-16 00:21:46'),(4,2,NULL,2,NULL,'2022-05-16 00:21:00',NULL,NULL,'2022-05-16 01:12:25','2022-05-16 01:12:25'),(5,1,NULL,1,1,'2022-05-16 01:16:00',NULL,NULL,'2022-05-16 01:14:12','2022-05-16 01:16:51'),(10,1,NULL,1,1,'2022-05-16 01:16:00',NULL,NULL,'2022-05-16 01:16:52','2022-05-16 01:16:52'),(16,1,NULL,1,1,'2022-05-16 01:16:00',NULL,NULL,'2022-05-16 01:17:24','2022-05-16 01:17:24'),(25,2,NULL,2,NULL,'2022-05-16 00:21:00',NULL,NULL,'2022-05-16 01:43:36','2022-05-16 01:43:36');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2022-05-16 00:21:09','2022-05-16 00:21:09',NULL,'7afc6286-ebf5-4d5d-8291-8926ee6d134e'),(2,2,2,'Home','home',0,'site',NULL,'{section.name|raw}',1,'2022-05-16 00:21:46','2022-05-16 00:21:46',NULL,'2b794e9e-4f2e-481f-918e-78906088a7c6');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-05-15 23:31:13','2022-05-15 23:31:13',NULL,'b2e2ffa0-5642-476f-aec5-e8bcbcc6ea97'),(2,'Blog','2022-05-16 01:04:51','2022-05-16 01:04:51',NULL,'2b9ffc15-026d-4d89-956e-4e9dcd6306bf'),(3,'Site Settings','2022-05-16 01:20:41','2022-05-16 01:20:41',NULL,'cd95e348-5a1f-4620-a695-6fbfbb01bc86');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,4,4,2,0,0,'2022-05-16 01:02:09','2022-05-16 01:02:09','eebfbde5-85c6-433d-91ec-a27ed9391ec0'),(2,5,5,3,1,0,'2022-05-16 01:02:09','2022-05-16 01:02:09','d1605b19-452a-4de4-8876-f15331f0732d'),(3,1,6,5,0,1,'2022-05-16 01:09:05','2022-05-16 01:09:05','0f8ec9ee-a5ff-483a-a08d-291b4dd8b773'),(4,1,6,4,0,2,'2022-05-16 01:09:05','2022-05-16 01:09:05','67e9e5b3-f25f-44ba-a909-e62fa62ecfe3'),(5,1,6,1,0,3,'2022-05-16 01:09:05','2022-05-16 01:09:05','4d3e3de9-4676-4441-b766-8ab0968e96e8'),(6,2,7,1,0,1,'2022-05-16 01:12:25','2022-05-16 01:12:25','1ddefed0-61d4-48a5-9b37-5a748d0e37e4'),(7,6,8,6,0,0,'2022-05-16 01:22:35','2022-05-16 01:22:35','a1404635-e2c3-4c99-a932-8ac2a7a4d849'),(8,6,8,7,0,1,'2022-05-16 01:22:35','2022-05-16 01:22:35','f45f6b93-dea9-485c-800b-137df1858371');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-05-16 00:21:09','2022-05-16 00:21:09',NULL,'03a3e1eb-f649-4101-9e8d-d569675d07fc'),(2,'craft\\elements\\Entry','2022-05-16 00:21:46','2022-05-16 00:21:46',NULL,'04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4'),(3,'craft\\elements\\Asset','2022-05-16 00:23:33','2022-05-16 00:23:33',NULL,'a270854b-cba5-43e6-a95d-ff47ac4b3d16'),(4,'craft\\elements\\MatrixBlock','2022-05-16 01:02:09','2022-05-16 01:02:09',NULL,'7b95d007-3d98-480e-b221-db3e681c5863'),(5,'craft\\elements\\MatrixBlock','2022-05-16 01:02:09','2022-05-16 01:02:09',NULL,'96f7190f-2b7e-4b0f-bd97-57a5d191889e'),(6,'craft\\elements\\GlobalSet','2022-05-16 01:22:35','2022-05-16 01:22:35',NULL,'ec928d83-6f47-4da4-b4ed-2eae294c4565');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (3,3,'Content','[]','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"fb0c1f09-3fa6-4c04-a434-0b48919be0ce\"}]',1,'2022-05-16 00:23:33','2022-05-16 00:23:33','f9ab92e3-6cb4-4b10-96b6-de55e3b67652'),(4,4,'Content','[]','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"664b26c7-851c-49f7-a1aa-b310d2059644\",\"fieldUid\":\"9b4059d2-408d-4dbb-a185-44b18fef8713\"}]',1,'2022-05-16 01:02:09','2022-05-16 01:02:09','41fbe585-cb79-4c99-bc83-1a5ca1c7f44e'),(5,5,'Content','[]','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"2d2863e3-dad4-40aa-8fde-890e0430d13b\",\"fieldUid\":\"c067f3fe-88e5-4cee-b1da-e018351cc189\"}]',1,'2022-05-16 01:02:09','2022-05-16 01:02:09','5198649c-cb51-4c16-a5dc-a6be7473289d'),(6,1,'Content','[]','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"304a90dd-b08a-4ccf-9fe5-e20f6db20bd6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"7b2feddb-199c-471f-b271-9676203022f1\",\"fieldUid\":\"69bde3b8-f6e5-4222-bab8-3ea6b61813f4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6ecc6a36-0f3f-4335-b7a8-938b410fd37b\",\"fieldUid\":\"6b7d0378-db61-4649-b32e-a27ecb158986\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0c0ef57d-d639-49a2-a119-01cac91d8430\",\"fieldUid\":\"4565f56d-6b28-4561-835c-e0d85a2bf0b8\"}]',1,'2022-05-16 01:09:05','2022-05-16 01:09:05','bf81c874-0b3b-45d2-be7d-efe03b992da5'),(7,2,'Content','[]','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"b10c7898-aa0c-4a98-b5b8-646073f625a6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8bc5390f-dc83-49ab-8f5d-ed33ab0fe4f9\",\"fieldUid\":\"4565f56d-6b28-4561-835c-e0d85a2bf0b8\"}]',1,'2022-05-16 01:12:25','2022-05-16 01:12:25','ed4d0cb0-eaf5-42b4-8496-b69465f66751'),(8,6,'Site Settings','[]','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b4bf4c22-b0e9-4e48-b0c8-ec47ca0ac36d\",\"fieldUid\":\"0519a9c6-dd2a-4b8e-afca-97053358a8a7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"26854bf4-cbbf-4d97-b365-5c5843a3d984\",\"fieldUid\":\"02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e\"}]',1,'2022-05-16 01:22:35','2022-05-16 01:22:35','fe50ddab-4e7f-4877-85ed-18f0f893e92a');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Post Content','postContent','global',NULL,'The content of this post or page.',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_postcontent}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2022-05-16 01:02:09','2022-05-16 01:02:09','4565f56d-6b28-4561-835c-e0d85a2bf0b8'),(2,NULL,'Text','text','matrixBlockType:d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754','yyxkmiih',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":null,\"removeEmptyTags\":false,\"removeInlineStyles\":true,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-05-16 01:02:09','2022-05-16 01:02:09','9b4059d2-408d-4dbb-a185-44b18fef8713'),(3,NULL,'Image','image','matrixBlockType:a0e60c90-00c4-4b64-8366-e58407f245b9',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-05-16 01:02:09','2022-05-16 01:02:09','c067f3fe-88e5-4cee-b1da-e018351cc189'),(4,2,'Feature Image','featureImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-05-16 01:06:53','2022-05-16 01:06:53','6b7d0378-db61-4649-b32e-a27ecb158986'),(5,2,'Excerpt','excerpt','global','cjqfztal',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":100,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-05-16 01:08:17','2022-05-16 01:08:17','69bde3b8-f6e5-4222-bab8-3ea6b61813f4'),(6,3,'Footer Text','footerText','global','yoxgseoh',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-05-16 01:21:05','2022-05-16 01:21:05','0519a9c6-dd2a-4b8e-afca-97053358a8a7'),(7,3,'Logo','logo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-05-16 01:21:35','2022-05-16 01:21:35','02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (18,'Site Settings','siteSettings',6,1,'2022-05-16 01:22:35','2022-05-16 01:22:35','ee023d65-5e01-49fa-8fcc-f7f40588bd82');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531:read\",\"elements.drafts:read\",\"elements.revisions:read\",\"elements.inactive:read\",\"usergroups.everyone:read\"]',1,'2022-05-15 23:31:13','2022-05-15 23:31:13','4e03db68-5e3f-4bf8-819e-a5b60401d697');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2022-05-15 23:31:13','2022-05-15 23:31:13','389de130-d7a3-4214-837c-5536414f7270');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.0.2','4.0.0.9',0,'byvwtwqfyotk','3@zgzqbpdoqh','2022-05-15 23:31:13','2022-05-16 02:47:35','7a27750f-df23-4074-bdae-5690d220a5a0');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (6,5,1,1,0,'2022-05-16 01:14:18','2022-05-16 01:14:18'),(7,5,1,1,NULL,'2022-05-16 01:14:21','2022-05-16 01:14:21'),(11,10,1,1,NULL,'2022-05-16 01:16:52','2022-05-16 01:16:52'),(15,5,1,2,NULL,'2022-05-16 01:17:24','2022-05-16 01:17:24'),(17,16,1,2,NULL,'2022-05-16 01:17:24','2022-05-16 01:17:24'),(24,2,1,1,NULL,'2022-05-16 01:43:36','2022-05-16 01:43:36'),(26,25,1,1,NULL,'2022-05-16 01:43:36','2022-05-16 01:43:36');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks_owners` VALUES (6,5,1),(7,5,1),(11,10,1),(11,16,1),(15,5,2),(17,16,2),(24,2,1),(26,25,1);
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,1,4,'Text','text',1,'2022-05-16 01:02:09','2022-05-16 01:02:09','d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754'),(2,1,5,'Image','image',2,'2022-05-16 01:02:09','2022-05-16 01:02:09','a0e60c90-00c4-4b64-8366-e58407f245b9');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_postcontent`
--

LOCK TABLES `matrixcontent_postcontent` WRITE;
/*!40000 ALTER TABLE `matrixcontent_postcontent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_postcontent` VALUES (1,6,1,'2022-05-16 01:14:18','2022-05-16 01:14:18','c7f91305-151d-4397-bef5-caf22815214d',NULL),(2,7,1,'2022-05-16 01:14:21','2022-05-16 01:14:21','449f4200-3cdd-4dd1-943c-3be7bf6ebee5','<pre>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad aliquam consectetur consequatur debitis distinctio ducimus error, exercitationem facere itaque laboriosam modi neque obcaecati odit omnis optio perferendis perspiciatis qui quo quos recusandae reprehenderit voluptas? Accusantium beatae blanditiis deserunt illo impedit nam necessitatibus, quae. Alias aliquid asperiores aspernatur assumenda atque culpa, dignissimos, doloribus earum esse facilis hic, magnam neque quae quam quis quisquam repellendus. Blanditiis cumque eaque, eum non temporibus tenetur. Ad adipisci alias architecto, atque blanditiis consequuntur doloremque excepturi expedita magni, nisi nostrum pariatur perferendis quod repellat repellendus vel veritatis? Blanditiis culpa, earum excepturi explicabo harum iusto maiores, molestiae nulla obcaecati optio tempora temporibus ullam voluptas! Animi aut cupiditate dignissimos dolore dolorem error est eveniet ex expedita explicabo, fugiat in molestiae nisi nobis officiis quas, sapiente voluptatem. Explicabo, fuga!</pre>'),(3,11,1,'2022-05-16 01:16:52','2022-05-16 01:16:52','178231d5-dddb-4637-8c07-8ea82011c4dd','<pre>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad aliquam consectetur consequatur debitis distinctio ducimus error, exercitationem facere itaque laboriosam modi neque obcaecati odit omnis optio perferendis perspiciatis qui quo quos recusandae reprehenderit voluptas? Accusantium beatae blanditiis deserunt illo impedit nam necessitatibus, quae. Alias aliquid asperiores aspernatur assumenda atque culpa, dignissimos, doloribus earum esse facilis hic, magnam neque quae quam quis quisquam repellendus. Blanditiis cumque eaque, eum non temporibus tenetur. Ad adipisci alias architecto, atque blanditiis consequuntur doloremque excepturi expedita magni, nisi nostrum pariatur perferendis quod repellat repellendus vel veritatis? Blanditiis culpa, earum excepturi explicabo harum iusto maiores, molestiae nulla obcaecati optio tempora temporibus ullam voluptas! Animi aut cupiditate dignissimos dolore dolorem error est eveniet ex expedita explicabo, fugiat in molestiae nisi nobis officiis quas, sapiente voluptatem. Explicabo, fuga!</pre>'),(4,13,1,'2022-05-16 01:17:12','2022-05-16 01:17:12','3ca4806e-84e7-4232-81e3-bfe1c1d3d81c',NULL),(6,15,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','38ac145f-4683-4fbb-98b4-716b60f3d500',NULL),(7,17,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','87684c6f-1011-4134-a2c5-720dc468cfe1',NULL),(8,21,1,'2022-05-16 01:43:31','2022-05-16 01:43:31','57a029c0-7540-48f5-8c18-dafb51b3354d',NULL),(9,22,1,'2022-05-16 01:43:35','2022-05-16 01:43:35','c880a6ff-56c5-4745-beb5-d3f6f8107431','<p>Juice workd</p>'),(11,24,1,'2022-05-16 01:43:36','2022-05-16 01:43:36','66c3345a-08d7-4dcf-990a-c21afc796d13','<p>Juice workd</p>'),(12,26,1,'2022-05-16 01:43:36','2022-05-16 01:43:36','e9bc9632-f68f-4881-9829-54e625e0f068','<p>Juice workd</p>');
/*!40000 ALTER TABLE `matrixcontent_postcontent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','964d7b24-da84-4c4f-89fa-2978baa77688'),(2,'craft','m210121_145800_asset_indexing_changes','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','3217b2b3-a302-4a52-ab99-73926b75da3c'),(3,'craft','m210624_222934_drop_deprecated_tables','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','8e6f3c9e-1cfb-4bd1-b1d1-c71a7a363558'),(4,'craft','m210724_180756_rename_source_cols','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','6b561490-aa41-4805-964e-85e74fe8ff59'),(5,'craft','m210809_124211_remove_superfluous_uids','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','829d0555-7af2-432f-8478-887611277ab3'),(6,'craft','m210817_014201_universal_users','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','154a0efa-7e62-430a-88dd-96712ba1461d'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','9f3ed7c1-6876-49a6-b5c2-5f5333fe5ed0'),(8,'craft','m211115_135500_image_transformers','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','32662f50-c9f6-420c-83ea-dcb231496ae3'),(9,'craft','m211201_131000_filesystems','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','b5e5893e-86dc-47a3-8e32-b0bafb5da1a5'),(10,'craft','m220103_043103_tab_conditions','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','f046ba64-fc15-404b-88c1-9009988aea4d'),(11,'craft','m220104_003433_asset_alt_text','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','b8826699-707a-4e12-b8ed-2258eb4fed14'),(12,'craft','m220123_213619_update_permissions','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','07df6e0a-4824-4aea-afdb-369024aae26d'),(13,'craft','m220126_003432_addresses','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','c108db1b-94fa-461e-b18a-155cd25f073b'),(14,'craft','m220209_095604_add_indexes','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','31c3b24f-114c-488a-b41b-8f2071301cd3'),(15,'craft','m220213_015220_matrixblocks_owners_table','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','49f34e3e-dafe-4244-a5f9-d73a6e2b6dd1'),(16,'craft','m220214_000000_truncate_sessions','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','12dd1c27-53db-43b7-84c1-55f0822dcc05'),(17,'craft','m220222_122159_full_names','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','e66e33fa-0911-4b7c-a38a-e09ce0e6989b'),(18,'craft','m220223_180559_nullable_address_owner','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','d7d2c177-4ede-42e4-a2b7-39a71bbc3d4b'),(19,'craft','m220225_165000_transform_filesystems','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','d45a6472-91f0-4497-8453-a52550604df0'),(20,'craft','m220309_152006_rename_field_layout_elements','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','a7c7f4e6-02aa-4841-a5e6-a3c394ced990'),(21,'craft','m220314_211928_field_layout_element_uids','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','63e86f03-eee0-4ad4-913d-24fc5defbab7'),(22,'craft','m220316_123800_transform_fs_subpath','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','cd8ff40d-9123-4937-8e67-93fbba3e1055'),(23,'craft','m220317_174250_release_all_jobs','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','414df928-b7fe-4d26-9f7a-46775888e5d9'),(24,'craft','m220330_150000_add_site_gql_schema_components','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','f4230d54-c227-462f-b5a3-94c0a74a18ca'),(25,'craft','m220413_024536_site_enabled_string','2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-15 23:31:14','7689b88a-c2f6-4195-a252-401db30e43bc'),(26,'plugin:redactor','m180430_204710_remove_old_plugins','2022-05-16 00:18:42','2022-05-16 00:18:42','2022-05-16 00:18:42','cec3a184-f512-47b0-bdfc-595ab3288278'),(27,'plugin:redactor','Install','2022-05-16 00:18:42','2022-05-16 00:18:42','2022-05-16 00:18:42','840639c7-743a-4dea-9264-f322a7b056d1'),(28,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-05-16 00:18:42','2022-05-16 00:18:42','2022-05-16 00:18:42','45a65764-3bf2-4b6a-a480-62bf8e2cc3e4');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'redactor','3.0.0','2.3.0','unknown',NULL,'2022-05-16 00:18:42','2022-05-16 00:18:42','2022-05-16 02:43:50','9a187726-6835-4c9e-914f-418ccf4ec8e2'),(2,'element-api','3.0.0','1.0.0','unknown',NULL,'2022-05-16 00:20:15','2022-05-16 00:20:15','2022-05-16 02:43:50','4d4a65e4-09ab-4013-8aca-02a2b20f716b');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1652669255'),('email.fromEmail','\"jvargas@conversionia.com\"'),('email.fromName','\"craftcms_test.com\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.autocapitalize','true'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.autocomplete','false'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.autocorrect','true'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.class','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.disabled','false'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.id','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.instructions','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.label','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.max','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.min','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.name','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.orientation','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.placeholder','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.readonly','false'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.requirable','false'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.size','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.step','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.tip','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.title','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.uid','\"b10c7898-aa0c-4a98-b5b8-646073f625a6\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.warning','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.0.width','100'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.fieldUid','\"4565f56d-6b28-4561-835c-e0d85a2bf0b8\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.instructions','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.label','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.required','false'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.tip','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.uid','\"8bc5390f-dc83-49ab-8f5d-ed33ab0fe4f9\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.warning','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.elements.1.width','100'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.name','\"Content\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.fieldLayouts.04722bd5-c6bf-4c37-a9f5-792e5d5e4fa4.tabs.0.uid','\"ed4d0cb0-eaf5-42b4-8496-b69465f66751\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.handle','\"home\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.hasTitleField','false'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.name','\"Home\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.section','\"bec7a733-0a59-4dca-95a8-f0a377c32300\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.sortOrder','1'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.titleFormat','\"{section.name|raw}\"'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.titleTranslationKeyFormat','null'),('entryTypes.2b794e9e-4f2e-481f-918e-78906088a7c6.titleTranslationMethod','\"site\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.autocomplete','false'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.autocorrect','true'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.class','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.disabled','false'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.id','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.instructions','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.label','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.max','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.min','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.name','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.orientation','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.placeholder','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.readonly','false'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.requirable','false'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.size','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.step','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.tip','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.title','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.uid','\"304a90dd-b08a-4ccf-9fe5-e20f6db20bd6\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.warning','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.0.width','100'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.fieldUid','\"69bde3b8-f6e5-4222-bab8-3ea6b61813f4\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.instructions','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.label','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.required','false'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.tip','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.uid','\"7b2feddb-199c-471f-b271-9676203022f1\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.warning','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.1.width','100'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.fieldUid','\"6b7d0378-db61-4649-b32e-a27ecb158986\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.instructions','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.label','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.required','false'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.tip','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.uid','\"6ecc6a36-0f3f-4335-b7a8-938b410fd37b\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.warning','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.2.width','100'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.fieldUid','\"4565f56d-6b28-4561-835c-e0d85a2bf0b8\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.instructions','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.label','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.required','false'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.tip','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.uid','\"0c0ef57d-d639-49a2-a119-01cac91d8430\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.warning','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.elements.3.width','100'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.name','\"Content\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.fieldLayouts.03a3e1eb-f649-4101-9e8d-d569675d07fc.tabs.0.uid','\"bf81c874-0b3b-45d2-be7d-efe03b992da5\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.handle','\"default\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.hasTitleField','true'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.name','\"Default\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.section','\"7907913f-5c32-49b3-973d-c4fae76d77a9\"'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.sortOrder','1'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.titleFormat','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.titleTranslationKeyFormat','null'),('entryTypes.7afc6286-ebf5-4d5d-8291-8926ee6d134e.titleTranslationMethod','\"site\"'),('fieldGroups.2b9ffc15-026d-4d89-956e-4e9dcd6306bf.name','\"Blog\"'),('fieldGroups.b2e2ffa0-5642-476f-aec5-e8bcbcc6ea97.name','\"Common\"'),('fieldGroups.cd95e348-5a1f-4620-a695-6fbfbb01bc86.name','\"Site Settings\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.columnSuffix','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.contentColumnType','\"string\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.fieldGroup','\"cd95e348-5a1f-4620-a695-6fbfbb01bc86\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.handle','\"logo\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.instructions','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.name','\"Logo\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.searchable','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.allowedKinds','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.allowSelfRelations','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.allowSubfolders','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.allowUploads','true'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.defaultUploadLocationSource','\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.defaultUploadLocationSubpath','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.localizeRelations','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.maxRelations','1'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.minRelations','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.previewMode','\"full\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.restrictedDefaultUploadSubpath','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.restrictedLocationSource','\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.restrictedLocationSubpath','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.restrictFiles','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.restrictLocation','true'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.selectionLabel','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.showSiteMenu','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.showUnpermittedFiles','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.showUnpermittedVolumes','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.source','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.sources','\"*\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.targetSiteId','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.validateRelatedElements','false'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.settings.viewMode','\"list\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.translationKeyFormat','null'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.translationMethod','\"site\"'),('fields.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e.type','\"craft\\\\fields\\\\Assets\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.columnSuffix','\"yoxgseoh\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.contentColumnType','\"text\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.fieldGroup','\"cd95e348-5a1f-4620-a695-6fbfbb01bc86\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.handle','\"footerText\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.instructions','null'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.name','\"Footer Text\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.searchable','false'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.byteLimit','null'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.charLimit','null'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.code','false'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.columnType','null'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.initialRows','4'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.multiline','false'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.placeholder','null'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.settings.uiMode','\"normal\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.translationKeyFormat','null'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.translationMethod','\"none\"'),('fields.0519a9c6-dd2a-4b8e-afca-97053358a8a7.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.columnSuffix','null'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.contentColumnType','\"string\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.fieldGroup','\"b2e2ffa0-5642-476f-aec5-e8bcbcc6ea97\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.handle','\"postContent\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.instructions','\"The content of this post or page.\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.name','\"Post Content\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.searchable','false'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.settings.contentTable','\"{{%matrixcontent_postcontent}}\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.settings.maxBlocks','null'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.settings.minBlocks','null'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.settings.propagationKeyFormat','null'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.settings.propagationMethod','\"all\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.translationKeyFormat','null'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.translationMethod','\"site\"'),('fields.4565f56d-6b28-4561-835c-e0d85a2bf0b8.type','\"craft\\\\fields\\\\Matrix\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.columnSuffix','\"cjqfztal\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.contentColumnType','\"string(400)\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.fieldGroup','\"2b9ffc15-026d-4d89-956e-4e9dcd6306bf\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.handle','\"excerpt\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.instructions','null'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.name','\"Excerpt\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.searchable','false'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.byteLimit','null'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.charLimit','100'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.code','false'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.columnType','null'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.initialRows','4'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.multiline','false'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.placeholder','null'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.settings.uiMode','\"normal\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.translationKeyFormat','null'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.translationMethod','\"none\"'),('fields.69bde3b8-f6e5-4222-bab8-3ea6b61813f4.type','\"craft\\\\fields\\\\PlainText\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.columnSuffix','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.contentColumnType','\"string\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.fieldGroup','\"2b9ffc15-026d-4d89-956e-4e9dcd6306bf\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.handle','\"featureImage\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.instructions','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.name','\"Feature Image\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.searchable','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.allowedKinds','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.allowSelfRelations','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.allowSubfolders','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.allowUploads','true'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.defaultUploadLocationSource','\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.defaultUploadLocationSubpath','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.localizeRelations','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.maxRelations','1'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.minRelations','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.previewMode','\"full\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.restrictedDefaultUploadSubpath','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.restrictedLocationSource','\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.restrictedLocationSubpath','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.restrictFiles','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.restrictLocation','true'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.selectionLabel','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.showSiteMenu','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.showUnpermittedFiles','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.showUnpermittedVolumes','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.source','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.sources','\"*\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.targetSiteId','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.validateRelatedElements','false'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.settings.viewMode','\"list\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.translationKeyFormat','null'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.translationMethod','\"site\"'),('fields.6b7d0378-db61-4649-b32e-a27ecb158986.type','\"craft\\\\fields\\\\Assets\"'),('fs.local.hasUrls','true'),('fs.local.name','\"local\"'),('fs.local.settings.path','\"@webroot/assets/images\"'),('fs.local.type','\"craft\\\\fs\\\\Local\"'),('fs.local.url','\"@web/assets/images\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.fieldUid','\"0519a9c6-dd2a-4b8e-afca-97053358a8a7\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.instructions','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.label','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.required','false'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.tip','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.uid','\"b4bf4c22-b0e9-4e48-b0c8-ec47ca0ac36d\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.warning','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.0.width','100'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.fieldUid','\"02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.instructions','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.label','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.required','false'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.tip','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.uid','\"26854bf4-cbbf-4d97-b365-5c5843a3d984\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.warning','null'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.elements.1.width','100'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.name','\"Site Settings\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.fieldLayouts.ec928d83-6f47-4da4-b4ed-2eae294c4565.tabs.0.uid','\"fe50ddab-4e7f-4877-85ed-18f0f893e92a\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.handle','\"siteSettings\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.name','\"Site Settings\"'),('globalSets.ee023d65-5e01-49fa-8fcc-f7f40588bd82.sortOrder','1'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.4e03db68-5e3f-4bf8-819e-a5b60401d697.isPublic','true'),('graphql.schemas.4e03db68-5e3f-4bf8-819e-a5b60401d697.name','\"Public Schema\"'),('graphql.schemas.4e03db68-5e3f-4bf8-819e-a5b60401d697.scope.0','\"sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531:read\"'),('graphql.schemas.4e03db68-5e3f-4bf8-819e-a5b60401d697.scope.1','\"elements.drafts:read\"'),('graphql.schemas.4e03db68-5e3f-4bf8-819e-a5b60401d697.scope.2','\"elements.revisions:read\"'),('graphql.schemas.4e03db68-5e3f-4bf8-819e-a5b60401d697.scope.3','\"elements.inactive:read\"'),('graphql.schemas.4e03db68-5e3f-4bf8-819e-a5b60401d697.scope.4','\"usergroups.everyone:read\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.field','\"4565f56d-6b28-4561-835c-e0d85a2bf0b8\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.fieldUid','\"c067f3fe-88e5-4cee-b1da-e018351cc189\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.label','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.required','true'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.tip','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.uid','\"2d2863e3-dad4-40aa-8fde-890e0430d13b\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.warning','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.elements.0.width','100'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.name','\"Content\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fieldLayouts.96f7190f-2b7e-4b0f-bd97-57a5d191889e.tabs.0.uid','\"5198649c-cb51-4c16-a5dc-a6be7473289d\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.columnSuffix','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.contentColumnType','\"string\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.fieldGroup','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.handle','\"image\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.instructions','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.name','\"Image\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.searchable','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.allowedKinds','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.allowSelfRelations','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.allowSubfolders','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.allowUploads','true'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.defaultUploadLocationSource','\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.defaultUploadLocationSubpath','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.localizeRelations','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.maxRelations','1'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.minRelations','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.previewMode','\"full\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.restrictedDefaultUploadSubpath','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.restrictedLocationSource','\"volume:f0a396c8-7f69-4346-a638-3174ea63f290\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.restrictedLocationSubpath','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.restrictFiles','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.restrictLocation','true'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.selectionCondition.__assoc__.1.1','\"global\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.selectionCondition.__assoc__.2.0','\"class\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.selectionLabel','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.showSiteMenu','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.showUnpermittedFiles','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.source','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.sources','\"*\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.targetSiteId','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.validateRelatedElements','false'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.settings.viewMode','\"list\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.translationKeyFormat','null'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.translationMethod','\"site\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.fields.c067f3fe-88e5-4cee-b1da-e018351cc189.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.handle','\"image\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.name','\"Image\"'),('matrixBlockTypes.a0e60c90-00c4-4b64-8366-e58407f245b9.sortOrder','2'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.field','\"4565f56d-6b28-4561-835c-e0d85a2bf0b8\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.fieldUid','\"9b4059d2-408d-4dbb-a185-44b18fef8713\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.label','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.required','false'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.tip','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.uid','\"664b26c7-851c-49f7-a1aa-b310d2059644\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.warning','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.elements.0.width','100'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.name','\"Content\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fieldLayouts.7b95d007-3d98-480e-b221-db3e681c5863.tabs.0.uid','\"41fbe585-cb79-4c99-bc83-1a5ca1c7f44e\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.columnSuffix','\"yyxkmiih\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.contentColumnType','\"text\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.fieldGroup','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.handle','\"text\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.instructions','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.name','\"Text\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.searchable','false'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.availableTransforms','\"*\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.availableVolumes','\"*\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.columnType','\"text\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.defaultTransform','\"\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.manualConfig','\"\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.purifierConfig','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.purifyHtml','true'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.redactorConfig','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.removeEmptyTags','false'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.removeInlineStyles','true'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.removeNbsp','false'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.showHtmlButtonForNonAdmins','false'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.showUnpermittedFiles','false'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.translationKeyFormat','null'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.translationMethod','\"none\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.fields.9b4059d2-408d-4dbb-a185-44b18fef8713.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.handle','\"text\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.name','\"Text\"'),('matrixBlockTypes.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754.sortOrder','1'),('meta.__names__.02a7470e-3b8f-4fdd-8efc-4cc3d118bc3e','\"Logo\"'),('meta.__names__.0519a9c6-dd2a-4b8e-afca-97053358a8a7','\"Footer Text\"'),('meta.__names__.2b794e9e-4f2e-481f-918e-78906088a7c6','\"Home\"'),('meta.__names__.2b9ffc15-026d-4d89-956e-4e9dcd6306bf','\"Blog\"'),('meta.__names__.4565f56d-6b28-4561-835c-e0d85a2bf0b8','\"Post Content\"'),('meta.__names__.4e03db68-5e3f-4bf8-819e-a5b60401d697','\"Public Schema\"'),('meta.__names__.55d5b6d6-3047-4968-bb1d-d8b31ba06531','\"craftcms_test.com\"'),('meta.__names__.69bde3b8-f6e5-4222-bab8-3ea6b61813f4','\"Excerpt\"'),('meta.__names__.6b7d0378-db61-4649-b32e-a27ecb158986','\"Feature Image\"'),('meta.__names__.7907913f-5c32-49b3-973d-c4fae76d77a9','\"blog\"'),('meta.__names__.7afc6286-ebf5-4d5d-8291-8926ee6d134e','\"Default\"'),('meta.__names__.9b4059d2-408d-4dbb-a185-44b18fef8713','\"Text\"'),('meta.__names__.a0e60c90-00c4-4b64-8366-e58407f245b9','\"Image\"'),('meta.__names__.aeb7dc98-e1a1-475b-a845-5a2938289033','\"craftcms_test.com\"'),('meta.__names__.b2e2ffa0-5642-476f-aec5-e8bcbcc6ea97','\"Common\"'),('meta.__names__.bec7a733-0a59-4dca-95a8-f0a377c32300','\"Home\"'),('meta.__names__.c067f3fe-88e5-4cee-b1da-e018351cc189','\"Image\"'),('meta.__names__.cd95e348-5a1f-4620-a695-6fbfbb01bc86','\"Site Settings\"'),('meta.__names__.d4ac699b-06ca-4ef6-b9d0-7e8fd6b67754','\"Text\"'),('meta.__names__.ee023d65-5e01-49fa-8fcc-f7f40588bd82','\"Site Settings\"'),('meta.__names__.f0a396c8-7f69-4346-a638-3174ea63f290','\"Images\"'),('plugins.element-api.edition','\"standard\"'),('plugins.element-api.enabled','true'),('plugins.element-api.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.defaultPlacement','\"end\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.enableVersioning','true'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.handle','\"blog\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.name','\"blog\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.propagationMethod','\"all\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.enabledByDefault','true'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.hasUrls','true'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.template','\"index\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.uriFormat','\"blog/{slug}\"'),('sections.7907913f-5c32-49b3-973d-c4fae76d77a9.type','\"channel\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.defaultPlacement','\"end\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.enableVersioning','true'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.handle','\"home\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.name','\"Home\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.propagationMethod','\"all\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.enabledByDefault','true'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.hasUrls','true'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.template','\"Index\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.siteSettings.55d5b6d6-3047-4968-bb1d-d8b31ba06531.uriFormat','\"__home__\"'),('sections.bec7a733-0a59-4dca-95a8-f0a377c32300.type','\"single\"'),('siteGroups.aeb7dc98-e1a1-475b-a845-5a2938289033.name','\"craftcms_test.com\"'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.baseUrl','null'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.enabled','true'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.handle','\"default\"'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.hasUrls','false'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.language','\"en-US\"'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.name','\"craftcms_test.com\"'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.primary','true'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.siteGroup','\"aeb7dc98-e1a1-475b-a845-5a2938289033\"'),('sites.55d5b6d6-3047-4968-bb1d-d8b31ba06531.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"craftcms_test.com\"'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.autocapitalize','true'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.autocomplete','false'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.autocorrect','true'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.class','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.disabled','false'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.id','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.instructions','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.label','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.max','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.min','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.name','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.orientation','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.placeholder','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.readonly','false'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.requirable','false'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.size','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.step','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.tip','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.title','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.uid','\"fb0c1f09-3fa6-4c04-a434-0b48919be0ce\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.warning','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.elements.0.width','100'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.name','\"Content\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fieldLayouts.a270854b-cba5-43e6-a95d-ff47ac4b3d16.tabs.0.uid','\"f9ab92e3-6cb4-4b10-96b6-de55e3b67652\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.fs','\"local\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.handle','\"images\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.name','\"Images\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.sortOrder','1'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.titleTranslationKeyFormat','null'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.titleTranslationMethod','\"site\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.transformFs','\"\"'),('volumes.f0a396c8-7f69-4346-a638-3174ea63f290.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (3,4,5,NULL,9,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','ea02215b-48b7-4db7-96af-9aa65dcc1bb0'),(4,3,15,NULL,8,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','65ddc020-3ce3-490c-8eb2-e6717580f0e1'),(5,4,16,NULL,9,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','41895f0d-5e9e-4ca5-bdc7-dc7f981a7b48'),(6,3,17,NULL,8,1,'2022-05-16 01:17:24','2022-05-16 01:17:24','bfa85c14-d7e8-41ca-a23d-9e946f5d5b92'),(7,7,18,NULL,19,1,'2022-05-16 01:29:01','2022-05-16 01:29:01','b426cd59-ccdd-4205-a4d5-1d3491ac8c8f');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,5,1,1,''),(4,7,1,1,NULL),(5,5,1,2,'Applied “Draft 1”'),(6,15,1,1,NULL),(7,2,1,3,'Applied “Draft 1”'),(8,24,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'fullname',0,1,''),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'email',0,1,' jvargas conversionia com '),(1,'slug',0,1,''),(2,'title',0,1,' home '),(2,'slug',0,1,' home '),(5,'slug',0,1,' blog entry 1 '),(5,'title',0,1,' blog entry 1 '),(7,'slug',0,1,''),(8,'kind',0,1,' image '),(8,'extension',0,1,' jpg '),(8,'filename',0,1,' pexels pixabay 262508 jpg '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'extension',0,1,' jpg '),(9,'filename',0,1,' pexels miguel á padriñán 1591056 jpg '),(15,'slug',0,1,''),(18,'slug',0,1,''),(19,'kind',0,1,' image '),(19,'extension',0,1,' jpg '),(19,'filename',0,1,' pexels magda ehlers 1337380 jpg '),(24,'slug',0,1,''),(19,'slug',0,1,''),(19,'title',0,1,' pexels magda ehlers 1337380 '),(9,'title',0,1,' pexels miguel á padriñán 1591056 '),(8,'slug',0,1,''),(8,'title',0,1,' pexels pixabay 262508 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'blog','blog','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-05-16 00:21:09','2022-05-16 00:21:09',NULL,'7907913f-5c32-49b3-973d-c4fae76d77a9'),(2,NULL,'Home','home','single',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-05-16 00:21:46','2022-05-16 00:21:46',NULL,'bec7a733-0a59-4dca-95a8-f0a377c32300');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'blog/{slug}','index',1,'2022-05-16 00:21:09','2022-05-16 00:21:09','d0ef7524-e6e6-4bd2-9db5-2cf3f4f841ba'),(2,2,1,1,'__home__','Index',1,'2022-05-16 00:21:46','2022-05-16 00:21:46','4297b5ae-57d7-4832-8b41-656b4284e8e5');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'craftcms_test.com','2022-05-15 23:31:13','2022-05-15 23:31:13',NULL,'aeb7dc98-e1a1-475b-a845-5a2938289033');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','craftcms_test.com','default','en-US',0,NULL,1,'2022-05-15 23:31:13','2022-05-16 02:42:08',NULL,'55d5b6d6-3047-4968-bb1d-d8b31ba06531');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'jvargas@conversionia.com','$2y$13$oU6byqulPRYZK4huk.pmSuiB3JXGtDXTWCsEbRWlVN0y.sVyU92u2','2022-05-16 13:22:14',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-05-15 23:31:14','2022-05-15 23:31:14','2022-05-16 13:22:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2022-05-16 00:23:33','2022-05-16 00:23:33','6cc1bcad-c01c-4a1e-86ca-cf9cbb849263'),(2,NULL,NULL,'Temporary filesystem',NULL,'2022-05-16 01:15:04','2022-05-16 01:15:04','220e68b1-1146-4946-b404-635006aea2df'),(3,2,NULL,'user_1','user_1/','2022-05-16 01:15:04','2022-05-16 01:15:04','20e98511-b852-45b3-b7c8-95844af73f93');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,3,'Images','images','local','','','site',NULL,1,'2022-05-16 00:23:33','2022-05-16 00:23:33',NULL,'f0a396c8-7f69-4346-a638-3174ea63f290');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-05-15 23:31:32','2022-05-15 23:31:32','dadea6f9-530a-448a-a5d4-0fa7c696b77b'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-05-15 23:31:32','2022-05-15 23:31:32','0d246218-1afe-4b67-b1df-2020fa3856d5'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-05-15 23:31:32','2022-05-15 23:31:32','605a80c8-ba8b-4b85-aa2f-b100f121ff92'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-05-15 23:31:32','2022-05-15 23:31:32','4255964e-d550-476b-9e11-89bbfdb0601e');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'craft_cms_sandbox'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16 13:31:55
