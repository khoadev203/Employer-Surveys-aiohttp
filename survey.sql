/*
 Navicat Premium Data Transfer

 Source Server         : local_django
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 127.0.0.1:3306
 Source Schema         : survey

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 06/10/2021 15:31:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `setting` varchar(255) DEFAULT NULL,
  `val` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for affiliate_links
-- ----------------------------
DROP TABLE IF EXISTS `affiliate_links`;
CREATE TABLE `affiliate_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `tracking_key` varchar(5) DEFAULT NULL,
  `landing_page` varchar(20) DEFAULT NULL,
  `design` tinyint DEFAULT '1',
  `link_name` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliate_links_tracking_key_uindex` (`tracking_key`),
  UNIQUE KEY `affiliate_links_tracking_key_uindex_2` (`tracking_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of affiliate_links
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qid` int DEFAULT NULL,
  `answer_str` mediumtext,
  `answer_int` int DEFAULT NULL,
  `datetime_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `answer_json` text,
  `survey_uuid` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of answers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(64) NOT NULL,
  `cat_slug` varchar(128) NOT NULL,
  `weight` decimal(6,3) DEFAULT '0.000',
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, 'Employee Performance Index', 'performance', 0.000, 'Gather and analyze data on your team’s workforce performance levels.');
INSERT INTO `categories` VALUES (2, 'Peer Performance Index', 'peer-review', 0.000, 'Send your team peer reviewing touch points on how they rate each other’s performance.');
INSERT INTO `categories` VALUES (3, 'Managed Up Performance Index', 'managed-up', 0.000, 'Give tokenized (safe and anonymous) feedback on your direct supervisor(s) and their level of performance.');
INSERT INTO `categories` VALUES (4, 'Corporate Quality', 'cqi', 0.000, 'Give tokenized (safe and anonymous) feedback on your company’s corporate quality.');
COMMIT;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `org` int NOT NULL,
  `dept_slug` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of departments
-- ----------------------------
BEGIN;
INSERT INTO `departments` VALUES (1, 'Marketing', 2, 'marketing');
INSERT INTO `departments` VALUES (2, 'Front Desk', 2, 'front-desk');
INSERT INTO `departments` VALUES (3, 'Board', 2, 'board');
INSERT INTO `departments` VALUES (4, 'Room Service', 2, 'room-service');
INSERT INTO `departments` VALUES (19, 'Executive', 2, NULL);
INSERT INTO `departments` VALUES (20, 'management', 3, 'management');
INSERT INTO `departments` VALUES (21, 'management', 4, 'management');
COMMIT;

-- ----------------------------
-- Table structure for multichoice
-- ----------------------------
DROP TABLE IF EXISTS `multichoice`;
CREATE TABLE `multichoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qid` int NOT NULL,
  `possible_answers` int DEFAULT '1',
  `choice_1` varchar(512) NOT NULL,
  `choice_2` varchar(512) DEFAULT NULL,
  `choice_3` varchar(512) DEFAULT NULL,
  `choice_4` varchar(512) DEFAULT NULL,
  `choice_5` varchar(512) DEFAULT NULL,
  `choice_6` varchar(512) DEFAULT NULL,
  `choice_7` varchar(512) DEFAULT NULL,
  `choice_8` varchar(512) DEFAULT NULL,
  `choice_9` varchar(512) DEFAULT NULL,
  `choice_10` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of multichoice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `calling_path` varchar(255) NOT NULL,
  `title` varchar(128) NOT NULL,
  `msg` varchar(512) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'zondicons:notifications',
  `datetime_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `seen` tinyint(1) DEFAULT '0',
  `sent` tinyint(1) DEFAULT '0',
  `priority` int DEFAULT '0',
  `cron_id` int DEFAULT NULL,
  `qid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
BEGIN;
INSERT INTO `notifications` VALUES (401, 21, '/s/47', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/47', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (402, 29, '/s/48', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/48', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (403, 31, '/s/49', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/49', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (404, 32, '/s/50', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/50', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (405, 21, '/s/51', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/51', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (406, 29, '/s/52', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/52', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (407, 31, '/s/53', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/53', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (408, 32, '/s/54', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/54', 'zondicons:notifications', '2021-05-23 09:30:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (409, 21, '/s/55', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/55', 'zondicons:notifications', '2021-05-24 13:13:18', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (410, 21, '/s/56', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/56', 'zondicons:notifications', '2021-05-24 13:17:57', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (411, 32, '/s/57', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/57', 'zondicons:notifications', '2021-05-24 17:31:33', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (412, 32, '/s/58', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/58', 'zondicons:notifications', '2021-05-24 17:31:50', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (413, 32, '/s/59', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/59', 'zondicons:notifications', '2021-05-25 17:31:27', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (414, 32, '/s/60', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/60', 'zondicons:notifications', '2021-05-25 17:31:48', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (415, 29, '/s/61', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/61', 'zondicons:notifications', '2021-05-26 09:30:39', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (416, 32, '/s/62', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/62', 'zondicons:notifications', '2021-05-26 17:31:11', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (417, 32, '/s/63', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/63', 'zondicons:notifications', '2021-05-26 17:31:15', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (418, 31, '/s/64', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/64', 'zondicons:notifications', '2021-05-27 12:38:57', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (419, 29, '/s/65', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/65', 'zondicons:notifications', '2021-05-27 12:40:12', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (420, 29, '/s/66', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/66', 'zondicons:notifications', '2021-05-27 12:40:23', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (421, 21, '/s/67', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/67', 'zondicons:notifications', '2021-05-27 12:41:15', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (422, 21, '/s/68', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/68', 'zondicons:notifications', '2021-05-27 12:41:27', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (423, 29, '/s/69', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/69', 'zondicons:notifications', '2021-05-28 09:30:14', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (424, 21, '/s/70', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/70', 'zondicons:notifications', '2021-05-28 09:30:15', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (425, 29, '/s/71', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/71', 'zondicons:notifications', '2021-05-28 09:30:47', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (426, 21, '/s/72', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/72', 'zondicons:notifications', '2021-05-28 09:30:47', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (427, 29, '/s/73', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/73', 'zondicons:notifications', '2021-05-29 09:30:56', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (428, 29, '/s/74', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/74', 'zondicons:notifications', '2021-05-30 09:30:19', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (480, 21, '/s/75', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/75', 'zondicons:notifications', '2021-05-31 09:30:04', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (481, 31, '/s/76', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/76', 'zondicons:notifications', '2021-05-31 09:30:04', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (482, 68, '/s/77', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/77', 'zondicons:notifications', '2021-05-31 09:30:04', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (483, 68, '/i/KGAT5v', 'Hiyer Invite', 'Your employer has invited you to Hiyer.                                         Sign up http://127.0.0.1/i/KGAT5v', 'flat-color-icons:invite', '2021-05-31 14:31:43', 1, 0, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (484, 32, '/s/78', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/78', 'zondicons:notifications', '2021-05-31 17:31:41', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (485, 40, '/s/79', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/79', 'zondicons:notifications', '2021-05-31 17:31:41', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (486, 29, '/s/80', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/80', 'zondicons:notifications', '2021-06-01 09:30:53', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (487, 32, '/s/81', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/81', 'zondicons:notifications', '2021-06-01 17:31:30', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (488, 40, '/s/82', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/82', 'zondicons:notifications', '2021-06-01 17:31:31', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (489, 21, '/s/83', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/83', 'zondicons:notifications', '2021-06-02 09:30:43', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (490, 31, '/s/84', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/84', 'zondicons:notifications', '2021-06-02 09:30:43', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (491, 29, '/s/85', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/85', 'zondicons:notifications', '2021-06-02 09:30:44', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (492, 32, '/s/86', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/86', 'zondicons:notifications', '2021-06-02 17:31:21', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (493, 40, '/s/87', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/87', 'zondicons:notifications', '2021-06-02 17:31:21', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (494, 29, '/s/88', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/88', 'zondicons:notifications', '2021-06-04 09:30:21', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (495, 21, '/s/89', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/89', 'zondicons:notifications', '2021-06-04 09:30:21', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (496, 31, '/s/90', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/90', 'zondicons:notifications', '2021-06-04 09:30:21', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (497, 29, '/s/91', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/91', 'zondicons:notifications', '2021-06-05 09:30:20', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (498, 29, '/s/92', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/92', 'zondicons:notifications', '2021-06-06 09:30:22', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (499, 21, '/s/93', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/93', 'zondicons:notifications', '2021-06-07 09:30:23', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (500, 31, '/s/94', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/94', 'zondicons:notifications', '2021-06-07 09:30:23', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (501, 32, '/s/95', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/95', 'zondicons:notifications', '2021-06-07 17:31:03', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (502, 40, '/s/96', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/96', 'zondicons:notifications', '2021-06-07 17:31:03', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (503, 29, '/s/97', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/97', 'zondicons:notifications', '2021-06-08 09:30:17', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (504, 21, '/s/98', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/98', 'zondicons:notifications', '2021-06-09 09:30:15', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (505, 31, '/s/99', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/99', 'zondicons:notifications', '2021-06-09 09:30:15', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (506, 69, '/i/KjsVhZ', 'Hiyer Invite', 'Your employer has invited you to Hiyer. Sign up http://survey.surf/i/KjsVhZ', 'flat-color-icons:invite', '2021-06-09 21:02:27', 1, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (507, 32, '/s/100', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/100', 'zondicons:notifications', '2021-06-10 09:30:04', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (508, 40, '/s/101', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/101', 'zondicons:notifications', '2021-06-10 09:30:04', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (509, 29, '/s/102', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/102', 'zondicons:notifications', '2021-06-11 09:30:53', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (510, 21, '/s/103', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/103', 'zondicons:notifications', '2021-06-11 09:30:53', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (511, 31, '/s/104', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/104', 'zondicons:notifications', '2021-06-11 09:30:53', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (512, 69, '/s/105', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/105', 'zondicons:notifications', '2021-06-11 09:30:53', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (513, 29, '/s/106', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/106', 'zondicons:notifications', '2021-06-15 09:30:10', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (514, 32, '/s/107', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/107', 'zondicons:notifications', '2021-06-17 09:30:15', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (515, 40, '/s/108', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/108', 'zondicons:notifications', '2021-06-17 09:30:15', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (516, 29, '/s/109', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/109', 'zondicons:notifications', '2021-06-22 09:30:22', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (517, 32, '/s/110', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/110', 'zondicons:notifications', '2021-06-24 09:30:26', 0, 1, 0, NULL, NULL);
INSERT INTO `notifications` VALUES (518, 40, '/s/111', 'New Hiyer Survey', 'You have a new Hiyer survey: https://employer-survey-website-lfchc.ondigitalocean.app/s/111', 'zondicons:notifications', '2021-06-24 09:30:26', 0, 1, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for orgs
-- ----------------------------
DROP TABLE IF EXISTS `orgs`;
CREATE TABLE `orgs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_name` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `departments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orgs
-- ----------------------------
BEGIN;
INSERT INTO `orgs` VALUES (2, 'Advanced Idea Mechanic', 6, '[{`name`:`sales`,`slug`:`sales`},{`name`:`executive`,`slug`:`executive`},{`name`:`marketing`,`slug`:`marketing`},{`name`:`Sample`,`slug`:`Sample`},{`name`:`Hello`,`slug`:`Hello`},{`name`:`sample 1`,`slug`:`sample-1`},{`name`:`hel`,`slug`:`hel`}]');
INSERT INTO `orgs` VALUES (3, 'tts', 70, '[{`id`:20,`name`:`management`,`slug`:`management`,`text`:`Management`}]');
INSERT INTO `orgs` VALUES (4, 'MyOrg', 71, '[{\"id\":21,\"name\":\"management\",\"slug\":\"management\",\"text\":\"Management\"}]');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `perm_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (9, 6, 'customer');
INSERT INTO `permissions` VALUES (10, 6, 'user');
INSERT INTO `permissions` VALUES (11, 6, 'admin');
INSERT INTO `permissions` VALUES (12, 6, 'employer');
INSERT INTO `permissions` VALUES (13, 18, 'employee');
INSERT INTO `permissions` VALUES (14, 18, 'user');
INSERT INTO `permissions` VALUES (15, 18, 'employee');
INSERT INTO `permissions` VALUES (16, 18, 'user');
INSERT INTO `permissions` VALUES (17, 20, 'employee');
INSERT INTO `permissions` VALUES (18, 20, 'user');
INSERT INTO `permissions` VALUES (19, 21, 'employee');
INSERT INTO `permissions` VALUES (20, 21, 'user');
INSERT INTO `permissions` VALUES (21, 22, 'employee');
INSERT INTO `permissions` VALUES (22, 22, 'user');
INSERT INTO `permissions` VALUES (23, 23, 'employee');
INSERT INTO `permissions` VALUES (24, 23, 'user');
INSERT INTO `permissions` VALUES (25, 24, 'employee');
INSERT INTO `permissions` VALUES (26, 24, 'user');
INSERT INTO `permissions` VALUES (27, 24, 'employee');
INSERT INTO `permissions` VALUES (28, 24, 'user');
INSERT INTO `permissions` VALUES (29, 29, 'employee');
INSERT INTO `permissions` VALUES (30, 29, 'user');
INSERT INTO `permissions` VALUES (31, 70, 'employer');
INSERT INTO `permissions` VALUES (32, 70, 'user');
INSERT INTO `permissions` VALUES (33, 71, 'employer');
INSERT INTO `permissions` VALUES (34, 71, 'user');
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `icon_prefix` varchar(15) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `icon_color` varchar(7) NOT NULL,
  `dept1` varchar(50) DEFAULT 'all',
  `dept2` varchar(30) DEFAULT NULL,
  `dept3` varchar(30) DEFAULT NULL,
  `tag1` varchar(30) NOT NULL,
  `tag2` varchar(30) DEFAULT NULL,
  `tag3` varchar(30) DEFAULT NULL,
  `datetime_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `org` int NOT NULL,
  `choice1` varchar(255) DEFAULT NULL,
  `choice2` varchar(255) DEFAULT NULL,
  `choice3` varchar(255) DEFAULT NULL,
  `choice4` varchar(255) DEFAULT NULL,
  `choice5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for questions1
-- ----------------------------
DROP TABLE IF EXISTS `questions1`;
CREATE TABLE `questions1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `category` int unsigned NOT NULL DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'rating',
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questions1
-- ----------------------------
BEGIN;
INSERT INTO `questions1` VALUES (1, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 1);
INSERT INTO `questions1` VALUES (2, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 2);
INSERT INTO `questions1` VALUES (3, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 3);
INSERT INTO `questions1` VALUES (4, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 4);
INSERT INTO `questions1` VALUES (5, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 5);
INSERT INTO `questions1` VALUES (6, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 6);
INSERT INTO `questions1` VALUES (7, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 7);
INSERT INTO `questions1` VALUES (8, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 8);
INSERT INTO `questions1` VALUES (9, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 9);
INSERT INTO `questions1` VALUES (10, 'Lorem ipsum dolor sit amet consectetur adipisicing', 1, 'rating', 10);
INSERT INTO `questions1` VALUES (11, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 1);
INSERT INTO `questions1` VALUES (12, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 2);
INSERT INTO `questions1` VALUES (13, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 3);
INSERT INTO `questions1` VALUES (14, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 4);
INSERT INTO `questions1` VALUES (15, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 5);
INSERT INTO `questions1` VALUES (16, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 6);
INSERT INTO `questions1` VALUES (17, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 7);
INSERT INTO `questions1` VALUES (18, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 8);
INSERT INTO `questions1` VALUES (19, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 9);
INSERT INTO `questions1` VALUES (20, 'Lorem ipsum dolor sit amet consectetur adipisicing', 2, 'rating', 10);
INSERT INTO `questions1` VALUES (21, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 1);
INSERT INTO `questions1` VALUES (22, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 2);
INSERT INTO `questions1` VALUES (23, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 3);
INSERT INTO `questions1` VALUES (24, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 4);
INSERT INTO `questions1` VALUES (25, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 5);
INSERT INTO `questions1` VALUES (26, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 6);
INSERT INTO `questions1` VALUES (27, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 7);
INSERT INTO `questions1` VALUES (28, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 8);
INSERT INTO `questions1` VALUES (29, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 9);
INSERT INTO `questions1` VALUES (30, 'Lorem ipsum dolor sit amet consectetur adipisicing', 3, 'rating', 10);
INSERT INTO `questions1` VALUES (31, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 1);
INSERT INTO `questions1` VALUES (32, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 2);
INSERT INTO `questions1` VALUES (33, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 3);
INSERT INTO `questions1` VALUES (34, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 4);
INSERT INTO `questions1` VALUES (35, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 5);
INSERT INTO `questions1` VALUES (36, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 6);
INSERT INTO `questions1` VALUES (37, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 7);
INSERT INTO `questions1` VALUES (38, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 8);
INSERT INTO `questions1` VALUES (39, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 9);
INSERT INTO `questions1` VALUES (40, 'Lorem ipsum dolor sit amet consectetur adipisicing', 4, 'rating', 10);
COMMIT;

-- ----------------------------
-- Table structure for survey_invites
-- ----------------------------
DROP TABLE IF EXISTS `survey_invites`;
CREATE TABLE `survey_invites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cron_id` int NOT NULL,
  `survey_uuid` varchar(64) NOT NULL,
  `answered` tinyint(1) DEFAULT '0',
  `crons` mediumtext,
  `run` int DEFAULT '0',
  `qid` int DEFAULT NULL,
  `sent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of survey_invites
-- ----------------------------
BEGIN;
INSERT INTO `survey_invites` VALUES (271, 6, 4, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (272, 21, 4, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (273, 29, 4, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (299, 6, 3, '835382ba97d94e578be3e6b46fd66712', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (300, 21, 3, '835382ba97d94e578be3e6b46fd66712', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (301, 29, 3, '835382ba97d94e578be3e6b46fd66712', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (308, 6, 3, 'a42de7b4b851467e818454df6cb7e54b', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (309, 21, 3, 'a42de7b4b851467e818454df6cb7e54b', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (310, 29, 3, 'a42de7b4b851467e818454df6cb7e54b', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (317, 31, 3, 'a42de7b4b851467e818454df6cb7e54b', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (318, 32, 3, 'a42de7b4b851467e818454df6cb7e54b', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (319, 33, 3, 'a42de7b4b851467e818454df6cb7e54b', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (320, 31, 3, '835382ba97d94e578be3e6b46fd66712', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (321, 32, 3, '835382ba97d94e578be3e6b46fd66712', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (322, 33, 3, '835382ba97d94e578be3e6b46fd66712', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (323, 21, 3, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (324, 29, 3, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (325, 31, 3, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (326, 32, 3, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (327, 33, 3, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (328, 34, 3, 'a42de7b4b851467e818454df6cb7e54b', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (329, 34, 3, '835382ba97d94e578be3e6b46fd66712', 0, NULL, 0, NULL, 0);
INSERT INTO `survey_invites` VALUES (330, 34, 3, '40cee181bbbe4e29b8329b090db1d02f', 0, NULL, 0, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for survey_invites1
-- ----------------------------
DROP TABLE IF EXISTS `survey_invites1`;
CREATE TABLE `survey_invites1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `survey_id` int unsigned NOT NULL,
  `question_id` int unsigned NOT NULL,
  `answer` int DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answered_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of survey_invites1
-- ----------------------------
BEGIN;
INSERT INTO `survey_invites1` VALUES (57, 32, 41, 35, 2, '2021-05-24 23:31:33', '2021-05-14 18:48:46');
INSERT INTO `survey_invites1` VALUES (58, 32, 41, 31, 3, '2021-05-24 23:31:50', '2021-06-10 03:29:54');
INSERT INTO `survey_invites1` VALUES (59, 32, 41, 40, 5, '2021-05-25 23:31:27', '2021-05-12 18:48:36');
INSERT INTO `survey_invites1` VALUES (60, 32, 41, 33, 3, '2021-05-25 23:31:48', '2021-06-10 03:29:56');
INSERT INTO `survey_invites1` VALUES (61, 29, 42, 6, NULL, '2021-05-26 15:30:39', '2021-05-10 18:48:26');
INSERT INTO `survey_invites1` VALUES (62, 32, 41, 39, 4, '2021-05-26 23:31:11', '2021-05-27 18:48:19');
INSERT INTO `survey_invites1` VALUES (63, 32, 41, 32, 5, '2021-05-26 23:31:15', '2021-05-21 18:48:14');
INSERT INTO `survey_invites1` VALUES (64, 31, 42, 3, NULL, '2021-05-27 18:38:57', '2021-06-10 03:29:28');
INSERT INTO `survey_invites1` VALUES (65, 29, 46, 12, 6, '2021-05-27 18:40:12', '2021-05-25 18:48:04');
INSERT INTO `survey_invites1` VALUES (66, 29, 46, 13, NULL, '2021-05-27 18:40:23', '2021-06-10 03:07:29');
INSERT INTO `survey_invites1` VALUES (67, 21, 47, 21, 7, '2021-05-27 18:41:15', '2021-06-26 11:11:02');
INSERT INTO `survey_invites1` VALUES (68, 21, 47, 22, NULL, '2021-05-27 18:41:27', '2021-06-26 11:11:59');
INSERT INTO `survey_invites1` VALUES (69, 29, 46, 14, 8, '2021-05-28 15:30:14', '2021-06-10 03:07:31');
INSERT INTO `survey_invites1` VALUES (70, 21, 47, 29, NULL, '2021-05-28 15:30:15', '2021-06-08 03:26:49');
INSERT INTO `survey_invites1` VALUES (71, 29, 46, 20, 9, '2021-05-28 15:30:47', '2021-06-10 03:07:33');
INSERT INTO `survey_invites1` VALUES (72, 21, 47, 27, NULL, '2021-05-28 15:30:47', '2021-06-26 11:11:11');
INSERT INTO `survey_invites1` VALUES (73, 29, 46, 15, 8, '2021-05-29 15:30:56', '2021-06-10 03:07:36');
INSERT INTO `survey_invites1` VALUES (74, 29, 46, 19, 2, '2021-05-30 15:30:19', '2021-06-10 03:07:37');
INSERT INTO `survey_invites1` VALUES (75, 21, 47, 25, 3, '2021-05-31 15:30:04', '2021-06-08 03:26:53');
INSERT INTO `survey_invites1` VALUES (76, 31, 47, 25, 4, '2021-05-31 15:30:04', '2021-06-10 03:29:29');
INSERT INTO `survey_invites1` VALUES (77, 68, 47, 25, 5, '2021-05-31 15:30:04', NULL);
INSERT INTO `survey_invites1` VALUES (78, 32, 41, 34, 6, '2021-05-31 23:31:41', '2021-06-10 03:29:57');
INSERT INTO `survey_invites1` VALUES (79, 40, 41, 34, 7, '2021-05-31 23:31:41', '2021-06-08 03:26:33');
INSERT INTO `survey_invites1` VALUES (80, 29, 48, 17, 8, '2021-06-01 15:30:53', '2021-06-10 03:07:38');
INSERT INTO `survey_invites1` VALUES (81, 32, 41, 38, 9, '2021-06-01 23:31:30', '2021-06-10 03:30:00');
INSERT INTO `survey_invites1` VALUES (82, 40, 41, 38, NULL, '2021-06-01 23:31:31', '2021-06-08 03:26:32');
INSERT INTO `survey_invites1` VALUES (83, 21, 47, 28, 6, '2021-06-02 15:30:43', '2021-06-08 03:26:56');
INSERT INTO `survey_invites1` VALUES (84, 31, 47, 28, 4, '2021-06-02 15:30:43', '2021-06-10 03:29:31');
INSERT INTO `survey_invites1` VALUES (85, 29, 48, 18, NULL, '2021-06-02 15:30:44', '2021-06-10 03:08:16');
INSERT INTO `survey_invites1` VALUES (86, 32, 41, 36, 7, '2021-06-02 23:31:21', '2021-06-10 03:29:59');
INSERT INTO `survey_invites1` VALUES (87, 40, 41, 36, NULL, '2021-06-02 23:31:21', '2021-06-08 03:26:31');
INSERT INTO `survey_invites1` VALUES (88, 29, 46, 11, 8, '2021-06-04 15:30:21', '2021-06-10 03:08:17');
INSERT INTO `survey_invites1` VALUES (89, 21, 47, 26, NULL, '2021-06-04 15:30:21', '2021-06-08 03:26:55');
INSERT INTO `survey_invites1` VALUES (90, 31, 47, 26, NULL, '2021-06-04 15:30:21', '2021-06-10 03:29:38');
INSERT INTO `survey_invites1` VALUES (91, 29, 46, 18, 8, '2021-06-05 15:30:20', '2021-06-10 03:08:19');
INSERT INTO `survey_invites1` VALUES (92, 29, 46, 17, NULL, '2021-06-06 15:30:22', '2021-06-10 03:08:21');
INSERT INTO `survey_invites1` VALUES (93, 21, 47, 23, 9, '2021-06-07 15:30:23', '2021-06-08 03:26:58');
INSERT INTO `survey_invites1` VALUES (94, 31, 47, 23, 4, '2021-06-07 15:30:23', '2021-06-10 03:29:34');
INSERT INTO `survey_invites1` VALUES (95, 32, 41, 37, 3, '2021-06-07 23:31:03', '2021-06-24 02:03:58');
INSERT INTO `survey_invites1` VALUES (96, 40, 41, 37, 7, '2021-06-07 23:31:03', '2021-06-08 03:26:29');
INSERT INTO `survey_invites1` VALUES (97, 29, 48, 14, 5, '2021-06-08 15:30:17', '2021-06-10 03:09:02');
INSERT INTO `survey_invites1` VALUES (98, 21, 47, 30, 5, '2021-06-09 15:30:15', '2021-06-10 03:07:01');
INSERT INTO `survey_invites1` VALUES (99, 31, 47, 30, NULL, '2021-06-09 15:30:15', '2021-06-10 03:29:36');
INSERT INTO `survey_invites1` VALUES (100, 32, 49, 32, 5, '2021-06-10 15:30:04', '2021-06-24 02:04:05');
INSERT INTO `survey_invites1` VALUES (101, 40, 49, 32, 6, '2021-06-10 15:30:04', NULL);
INSERT INTO `survey_invites1` VALUES (102, 29, 46, 16, NULL, '2021-06-11 15:30:53', '2021-06-23 11:33:26');
INSERT INTO `survey_invites1` VALUES (103, 21, 47, 24, 7, '2021-06-11 15:30:53', '2021-06-23 11:34:12');
INSERT INTO `survey_invites1` VALUES (104, 31, 47, 24, NULL, '2021-06-11 15:30:53', '2021-06-24 02:03:21');
INSERT INTO `survey_invites1` VALUES (105, 69, 47, 24, 9, '2021-06-11 15:30:53', NULL);
INSERT INTO `survey_invites1` VALUES (106, 29, 48, 15, 8, '2021-06-15 15:30:10', '2021-06-23 11:33:31');
INSERT INTO `survey_invites1` VALUES (107, 32, 49, 37, 7, '2021-06-17 15:30:15', NULL);
INSERT INTO `survey_invites1` VALUES (108, 40, 49, 37, NULL, '2021-06-17 15:30:15', NULL);
INSERT INTO `survey_invites1` VALUES (109, 29, 48, 16, 5, '2021-06-22 15:30:22', '2021-06-23 11:33:33');
INSERT INTO `survey_invites1` VALUES (110, 32, 49, 33, 4, '2021-06-24 15:30:26', NULL);
INSERT INTO `survey_invites1` VALUES (111, 40, 49, 33, 3, '2021-06-24 15:30:26', NULL);
COMMIT;

-- ----------------------------
-- Table structure for survey_questions
-- ----------------------------
DROP TABLE IF EXISTS `survey_questions`;
CREATE TABLE `survey_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `org` int DEFAULT NULL,
  `cat` int DEFAULT NULL,
  `qid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of survey_questions
-- ----------------------------
BEGIN;
INSERT INTO `survey_questions` VALUES (1, 8, '{`name`: `question1`, `type`: `rating`}', 2, 1, 1);
INSERT INTO `survey_questions` VALUES (2, 8, '{`name`: `question2`, `type`: `rating`}', 2, 1, 2);
INSERT INTO `survey_questions` VALUES (3, 8, '{`name`: `question3`, `type`: `rating`}', 2, 1, 3);
INSERT INTO `survey_questions` VALUES (4, 8, '{`name`: `question4`, `type`: `rating`}', 2, 1, 4);
INSERT INTO `survey_questions` VALUES (5, 8, '{`name`: `question5`, `type`: `rating`}', 2, 1, 5);
INSERT INTO `survey_questions` VALUES (6, 9, '{\"type\": \"rating\", \"name\": \"question1\"}', 2, 2, 1);
INSERT INTO `survey_questions` VALUES (7, 10, '{\"type\": \"rating\", \"name\": \"question1\", \"cat\": \"1\"}', 2, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for surveys
-- ----------------------------
DROP TABLE IF EXISTS `surveys`;
CREATE TABLE `surveys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org` int DEFAULT NULL,
  `cat` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `survey_json` longtext NOT NULL,
  `survey_uuid` varchar(255) NOT NULL,
  `survey_title` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `surveys_survey_uuid_uindex` (`survey_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of surveys
-- ----------------------------
BEGIN;
INSERT INTO `surveys` VALUES (8, 2, 1, 6, '`{\'pages\': [{\'name\': \'page1\', \'elements\': [{\'type\': \'rating\', \'name\': \'question1\'}, {\'type\': \'rating\', \'name\': \'question2\'}, {\'type\': \'rating\', \'name\': \'question3\'}, {\'type\': \'rating\', \'name\': \'question4\'}, {\'type\': \'rating\', \'name\': \'question5\'}]}], \'cat\': \'1\'}`', 'bfc8a59746d94516a39bf0b63f6f210f', 'None');
INSERT INTO `surveys` VALUES (9, 2, 2, 6, '\"{\'pages\': [{\'name\': \'page1\', \'elements\': [{\'type\': \'rating\', \'name\': \'question1\'}]}], \'cat\': \'2\'}\"', '4f6b709300c340f1a8b9c82c8b837b15', 'None');
INSERT INTO `surveys` VALUES (10, 2, 1, 6, '\"{\'title\': \'dsa\', \'pages\': [{\'name\': \'page1\', \'elements\': [{\'type\': \'rating\', \'name\': \'question1\', \'cat\': \'1\'}]}], \'cat\': \'1\'}\"', 'e2d4397832ba4a6fb067ca548851a189', 'dsa');
COMMIT;

-- ----------------------------
-- Table structure for surveys1
-- ----------------------------
DROP TABLE IF EXISTS `surveys1`;
CREATE TABLE `surveys1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category` int NOT NULL,
  `department` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `weekly` varchar(255) NOT NULL,
  `send_at` time NOT NULL,
  `question_order` tinyint(1) NOT NULL,
  `question_no` int DEFAULT '0',
  `sent_count` int DEFAULT '0',
  `receive_count` int DEFAULT '0',
  `repeat` int DEFAULT NULL,
  `org_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of surveys1
-- ----------------------------
BEGIN;
INSERT INTO `surveys1` VALUES (41, 'CQI Test - Ben 7-7-2021', 4, 4, '2021-05-24', NULL, 'Sun, Sat, Fri', '17:31:00', 1, 10, 14, 12, 7, 2);
INSERT INTO `surveys1` VALUES (42, 'Performance test - Ben 7-7-2021', 1, 3, '2021-05-26', NULL, 'Thu, Mon, Fri', '09:30:00', 0, 10, 3, 0, 14, 3);
INSERT INTO `surveys1` VALUES (46, 'Peer survey = Ben Test 7-7-2021', 2, 2, '2021-05-27', NULL, 'Fri, Sat, Sun', '09:30:00', 1, 8, 10, 7, 7, 4);
INSERT INTO `surveys1` VALUES (47, 'Managed Up Survey Ben Test 7-7-2021', 3, 1, '2021-05-27', NULL, 'Mon, Wed, Fri', '09:30:00', 1, 8, 18, 11, 90, 2);
INSERT INTO `surveys1` VALUES (48, 'Ben Test 7-7-2021', 2, 2, '2021-05-28', NULL, 'Mon, Tue, Sun', '09:30:00', 1, 5, 5, 4, 7, 3);
INSERT INTO `surveys1` VALUES (49, 'CQI Ben 7-7-2021', 4, 4, '2021-06-07', NULL, 'Mon, Thu, Sun', '09:30:00', 1, 3, 6, 5, 7, 4);
INSERT INTO `surveys1` VALUES (50, 'LEadership only', 4, 3, '2021-06-23', NULL, 'Thu, Sun', '09:30:00', 1, 1, 0, 0, 7, 2);
INSERT INTO `surveys1` VALUES (52, 'LEadership only', 4, 3, '2021-06-23', NULL, 'Thu, Sun', '09:30:00', 1, 0, 0, 0, 7, 3);
INSERT INTO `surveys1` VALUES (53, 'April Survey - MUP', 3, 2, '2014-02-03', '2021-11-05', 'Mon, Tue, Wed, Fri', '10:30:00', 0, 0, 0, 0, 30, 4);
INSERT INTO `surveys1` VALUES (54, 'test', 4, 2, '2021-10-01', NULL, 'Mon, Thu, Fri', '09:30:00', 0, 0, 0, 0, 30, 3);
INSERT INTO `surveys1` VALUES (55, 'sadad', 1, 1, '2021-09-26', '2021-09-28', 'Mon, Tue', '09:30:00', 0, 0, 0, 0, 180, 4);
INSERT INTO `surveys1` VALUES (56, 'test2', 4, 1, '2021-09-28', NULL, 'Sat, Fri, Mon', '09:30:00', 1, 0, 0, 0, 90, 3);
INSERT INTO `surveys1` VALUES (57, 'test', 4, 1, '2021-09-28', NULL, 'Tue', '09:30:00', 1, 0, 0, 0, 7, 2);
INSERT INTO `surveys1` VALUES (58, 'testtt', 1, 1, '2021-10-01', NULL, 'Tue, Wed', '09:30:00', 1, 0, 0, 0, 7, 3);
INSERT INTO `surveys1` VALUES (59, 'here', 1, 1, '2021-10-01', NULL, 'Tue, Wed', '09:30:00', 1, 0, 0, 0, 7, 4);
INSERT INTO `surveys1` VALUES (60, 'ssss', 1, 1, '2021-10-01', NULL, 'Tue', '09:30:00', 1, 0, 0, 0, 7, 2);
INSERT INTO `surveys1` VALUES (61, 'ssa', 1, 1, '2021-10-01', NULL, 'Wed', '09:30:00', 1, 0, 0, 0, 7, 2);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password_hash` varchar(77) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `date_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new_user` tinyint(1) DEFAULT '1',
  `invite_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gravatar` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number_no` bigint DEFAULT NULL,
  `user_level` tinyint(1) DEFAULT NULL,
  `aff_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_user` int DEFAULT NULL,
  `admin_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_pwd_uuid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_id` int DEFAULT NULL,
  `dept` int DEFAULT NULL,
  `org` int DEFAULT NULL,
  `accepted_tos` tinyint(1) NOT NULL DEFAULT '0',
  `is_employer` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_aff_id_uindex` (`aff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (6, 'admin', '$argon2id$v=19$m=102400,t=2,p=8$cq71/l+rNYbwXst5z9l7rw$6sYgVFbIi8/oHYZxC/3nLA', 1, 0, '2021-02-04 00:52:49', '2021-09-30 22:12:09', 'nick@perceptively.com', 'Tom', 'Ashley', '+19542922122', 0, NULL, '762e7e2188246373e94e763ba1e9da7d', NULL, 9, 'Fuuv', NULL, NULL, '5487 SW 15th Ct. Fort Lauderdale FL', 'Advanced Idea Mechanics', NULL, 2, 1, 2, 0, 1);
INSERT INTO `users` VALUES (21, 'user1-Marketing', '$argon2id$v=19$m=102400,t=2,p=8$cq71/l+rNYbwXst5z9l7rw$6sYgVFbIi8/oHYZxC/3nLA', 0, 0, '2021-03-31 01:37:06', '2021-09-10 19:17:01', 'nick@perceptively.com', 'Nick', 'Vlacic', '+13479930999', 0, 'knZ5hO', '1c6109b0c163631a1ec0111f66b0c1ad', NULL, 1, '96eV', 6, NULL, NULL, 'Advanced Idea Mechanics', NULL, 2, 1, 2, 0, 0);
INSERT INTO `users` VALUES (29, 'user2-Front Desk', '$argon2id$v=19$m=102400,t=2,p=8$cq71/l+rNYbwXst5z9l7rw$6sYgVFbIi8/oHYZxC/3nLA', 0, 0, '2021-04-05 04:05:55', '2021-09-07 19:19:40', 'nick@perceptively.com', 'Bob', 'Bobberson', '+19545431351', 0, 'Fq3aaD', '3910257eeac3402e68ab7934ded0ced4', NULL, 1, 'Mz2Q', 6, NULL, NULL, 'Advanced Idea Mechanics', NULL, 2, 2, 2, 0, 0);
INSERT INTO `users` VALUES (32, 'user4-Room Service', '$argon2id$v=19$m=102400,t=2,p=8$cq71/l+rNYbwXst5z9l7rw$6sYgVFbIi8/oHYZxC/3nLA', 0, 0, '2021-04-10 20:55:08', '2021-09-07 19:18:42', 'nick@perceptively.com', 'Tom', 'Ashley', NULL, 0, 'MBjhGw', NULL, NULL, 1, NULL, 6, NULL, NULL, 'Advanced Idea Mechanics', NULL, 2, 4, 2, 0, 0);
INSERT INTO `users` VALUES (40, 'user5-Room Service', '$argon2id$v=19$m=102400,t=2,p=8$cq71/l+rNYbwXst5z9l7rw$6sYgVFbIi8/oHYZxC/3nLA', 0, 0, '2021-05-29 23:26:56', '2021-09-07 19:20:13', 'nick@perceptively.com', 'test', 'test', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Advanced Idea Mechanics', NULL, 2, 4, 2, 0, 0);
INSERT INTO `users` VALUES (69, 'user69', '$argon2id$v=19$m=102400,t=2,p=8$h/CeU4pxTmmtlZJSynlPiQ$8cQ8lKExyDixcOVrM8yUag', 0, 0, '2021-06-10 03:02:27', NULL, 'nick@perceptively.com', NULL, NULL, NULL, 1, 'KjsVhZ', NULL, NULL, 1, NULL, 6, NULL, NULL, 'Advanced Idea Mechanics', NULL, NULL, 1, 2, 0, 0);
INSERT INTO `users` VALUES (70, 'nemanja', '$argon2id$v=19$m=102400,t=2,p=8$QCgFAMD4f28tJYQwBuA8xw$IfO71y3qQ13I6ZBLAZUtKA', 0, 0, '2021-09-07 01:21:39', '2021-09-07 19:03:33', 'jovanovic.nemanja.1029@gmail.com', 'tts', 'tts', '123123123123', 1, NULL, '11f712505c144110223ecf7cc25ae17a', NULL, 2, '6jdr', NULL, NULL, NULL, 'tts', NULL, 3, NULL, 3, 0, 1);
INSERT INTO `users` VALUES (71, 'testusery', '$argon2id$v=19$m=102400,t=2,p=8$VKq1dg6hdG6tFWIMAUCotQ$/FoT7KYg10DJDTH4q9hJfA', 0, 0, '2021-10-01 01:24:11', '2021-10-01 01:24:24', 'testusery@example.com', 'Bob', 'Bobberson', '5555555555', 1, NULL, 'f4ec50fd40a3f9b2024a76f8d5b67b50', NULL, 2, 'mGpa', NULL, NULL, NULL, 'MyOrg', NULL, 4, NULL, 4, 0, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
