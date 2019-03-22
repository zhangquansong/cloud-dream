/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : db1

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-03-22 18:26:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `black_user`
-- ----------------------------
DROP TABLE IF EXISTS `black_user`;
CREATE TABLE `black_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `black_user_ip` varchar(20) DEFAULT NULL,
  `black_user_imei` varchar(20) DEFAULT NULL,
  `user_login_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_sex` int(1) DEFAULT '0',
  `user_id_card` varchar(18) DEFAULT NULL,
  `user_code` varchar(20) DEFAULT NULL,
  `user_type` int(2) DEFAULT '0',
  `user_address` varchar(150) DEFAULT NULL,
  `black_user_description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `black_user_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `black_user_status` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0',
  `black_user_version` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='黑名单表';

-- ----------------------------
-- Records of black_user
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `money` decimal(10,3) DEFAULT NULL,
  `init_money` decimal(10,3) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `use_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `over_time` datetime DEFAULT NULL,
  `type` int(2) DEFAULT '0',
  `status` int(2) DEFAULT '0',
  `is_always` int(2) DEFAULT '0',
  `product_id` bigint(20) DEFAULT NULL,
  `investors_id` bigint(20) DEFAULT NULL,
  `use_range` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rate` decimal(10,3) DEFAULT NULL,
  `at_least` decimal(10,3) DEFAULT NULL,
  `use_range_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expiry_day` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='卡劵表';

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('118', '3', '10000.000', null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `coupon` VALUES ('119', '3', null, null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `coupon` VALUES ('120', '3', null, null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `coupon` VALUES ('121', '14', '10000.000', null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `coupon` VALUES ('122', '14', null, null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `coupon` VALUES ('123', '14', null, null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `coupon` VALUES ('124', '14', null, null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `coupon` VALUES ('125', '14', null, null, null, null, null, null, null, '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `db1_only_test_table`
-- ----------------------------
DROP TABLE IF EXISTS `db1_only_test_table`;
CREATE TABLE `db1_only_test_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of db1_only_test_table
-- ----------------------------
INSERT INTO `db1_only_test_table` VALUES ('1', 'test');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('MiaolicaiScheduler', 'TASK_1', 'DEFAULT', '*/1 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('MiaolicaiScheduler', 'TASK_1', 'DEFAULT', null, 'com.clt.api.common.quartz.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720023636F6D2E636C742E6170692E7172747A2E656E746974792E5363686564756C654A6F62000000000000000102000B4C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000269647400104C6A6176612F6C616E672F4C6F6E673B4C0008697344656C6574657400134C6A6176612F6C616E672F496E74656765723B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E000C4C000A75706461746554696D6571007E000A4C000776657273696F6E71007E000C7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C00000000000000010200007870740008757365725461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001685AD244207874000D2A2F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000C757365725472616E7366657270740006E6B58BE8AF9571007E00177371007E00107708000001685AD24BF07871007E00177800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MiaolicaiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MiaolicaiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MiaolicaiScheduler', 'USER-20180727HN1547719545330', '1547719583089', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('MiaolicaiScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1547718506000', '-1', '5', 'WAITING', 'CRON', '1547718506000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720023636F6D2E636C742E6170692E7172747A2E656E746974792E5363686564756C654A6F62000000000000000102000B4C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000269647400104C6A6176612F6C616E672F4C6F6E673B4C0008697344656C6574657400134C6A6176612F6C616E672F496E74656765723B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E000C4C000A75706461746554696D6571007E000A4C000776657273696F6E71007E000C7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C00000000000000010200007870740008757365725461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001685AD244207874000D2A2F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000C757365725472616E7366657270740006E6B58BE8AF9571007E00177371007E00107708000001685AD24BF07871007E00177800);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bean_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0',
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `bean_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `error` varchar(255) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(2) DEFAULT '0',
  `version` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `system_config`
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'http://www.baidu.com');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_login_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_phone` varchar(11) DEFAULT NULL,
  `user_sex` int(1) DEFAULT '0',
  `user_id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_face` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_code` varchar(20) DEFAULT NULL,
  `user_type` int(2) DEFAULT '0',
  `user_password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_asset` decimal(10,3) DEFAULT '0.000',
  `user_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_longin_last_time` datetime DEFAULT NULL,
  `user_status` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0',
  `user_version` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101752259852767233 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1101752259852767232', 'mycat-test3', '测试人员1呀', '15007257863', '1', '330326199506051833', 'http://www.baidu.com', '1', '1', '123456789', '0.000', '浙江省杭州市西湖区西溪花园宁波苑72203', null, '0', null, null, '0', '0');

-- ----------------------------
-- Table structure for `zipkin_annotations`
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_annotations`;
CREATE TABLE `zipkin_annotations` (
  `trace_id_high` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64bit',
  `trace_id` bigint(20) NOT NULL COMMENT 'coincideswith zipkin_spans.trace_id',
  `span_id` bigint(20) NOT NULL COMMENT 'coincideswith zipkin_spans.id',
  `a_key` varchar(255) NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
  `a_value` blob COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
  `a_type` int(11) NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
  `a_timestamp` bigint(20) DEFAULT NULL COMMENT 'Used toimplement TTL; Annotation.timestamp or zipkin_spans.timestamp',
  `endpoint_ipv4` int(11) DEFAULT NULL COMMENT 'Null whenBinary/Annotation.endpoint is null',
  `endpoint_ipv6` binary(16) DEFAULT NULL COMMENT 'Null whenBinary/Annotation.endpoint is null, or no IPv6 address',
  `endpoint_port` smallint(6) DEFAULT NULL COMMENT 'Null whenBinary/Annotation.endpoint is null',
  `endpoint_service_name` varchar(255) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  UNIQUE KEY `trace_id_high` (`trace_id_high`,`trace_id`,`span_id`,`a_key`,`a_timestamp`) COMMENT 'Ignore insert on duplicate',
  KEY `trace_id_high_2` (`trace_id_high`,`trace_id`,`span_id`) COMMENT 'for joining with zipkin_spans',
  KEY `trace_id_high_3` (`trace_id_high`,`trace_id`) COMMENT 'for getTraces/ByIds',
  KEY `endpoint_service_name` (`endpoint_service_name`) COMMENT 'for getTraces and getServiceNames',
  KEY `a_type` (`a_type`) COMMENT 'for getTraces',
  KEY `a_key` (`a_key`) COMMENT 'for getTraces'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_annotations
-- ----------------------------
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'sr', null, '-1', '1553249913961132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'ss', null, '-1', '1553249913962243', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'ca', 0x01, '0', '1553249913961132', null, null, '-5985', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'error', 0x343034, '6', '1553249913961132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'http.method', 0x474554, '6', '1553249913961132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'http.path', 0x2F7A69706B696E2F6E61765F7A682E70726F70657274696573, '6', '1553249913961132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'http.status_code', 0x343034, '6', '1553249913961132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '3771090864474909221', '3771090864474909221', 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, '6', '1553249913961132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-8024352246615648084', 'cs', null, '-1', '1553249914142494', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-8024352246615648084', 'cr', null, '-1', '1553249914144012', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-8024352246615648084', 'sa', 0x01, '0', '1553249914142494', '2130706433', null, '3306', 'mysql');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-8024352246615648084', 'sql.query', 0x73656C6563742064697374696E637420607A69706B696E5F7370616E73602E6074726163655F6964602C20607A69706B696E5F7370616E73602E60706172656E745F6964602C20607A69706B696E5F7370616E73602E606964602C20607A69706B696E5F616E6E6F746174696F6E73602E60615F6B6579602C20607A69706B696E5F616E6E6F746174696F6E73602E60615F74797065602C20607A69706B696E5F616E6E6F746174696F6E73602E60656E64706F696E745F736572766963655F6E616D65602066726F6D20607A69706B696E5F7370616E7360206C656674206F75746572206A6F696E20607A69706B696E5F616E6E6F746174696F6E7360206F6E2028607A69706B696E5F7370616E73602E6074726163655F696460203D20607A69706B696E5F616E6E6F746174696F6E73602E6074726163655F69646020616E6420607A69706B696E5F7370616E73602E60696460203D20607A69706B696E5F616E6E6F746174696F6E73602E607370616E5F69646020616E6420607A69706B696E5F616E6E6F746174696F6E73602E60615F6B65796020696E20283F2C203F2C203F2C203F2C203F2C203F292920776865726520607A69706B696E5F7370616E73602E6074726163655F69646020696E202873656C6563742064697374696E637420607A69706B696E5F7370616E73602E6074726163655F6964602066726F6D20607A69706B696E5F7370616E736020776865726520607A69706B696E5F7370616E73602E6073746172745F747360206265747765656E203F20616E64203F292067726F757020627920607A69706B696E5F7370616E73602E6074726163655F6964602C20607A69706B696E5F7370616E73602E606964602C20607A69706B696E5F616E6E6F746174696F6E73602E60615F6B6579602C20607A69706B696E5F616E6E6F746174696F6E73602E60615F74797065602C20607A69706B696E5F616E6E6F746174696F6E73602E60656E64706F696E745F736572766963655F6E616D6560, '6', '1553249914142494', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-685398733671283482', 'sr', null, '-1', '1553249914141081', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-685398733671283482', 'ss', null, '-1', '1553249914146554', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-685398733671283482', 'ca', 0x01, '0', '1553249914141081', null, null, '-5985', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-685398733671283482', 'http.method', 0x474554, '6', '1553249914141081', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-685398733671283482', 'http.path', 0x2F7A69706B696E2F6170692F76322F646570656E64656E63696573, '6', '1553249914141081', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-685398733671283482', 'mvc.controller.class', 0x5A69706B696E51756572794170695632, '6', '1553249914141081', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-685398733671283482', '-685398733671283482', 'mvc.controller.method', 0x676574446570656E64656E63696573, '6', '1553249914141081', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6338525292296333917', '6338525292296333917', 'sr', null, '-1', '1553250027112200', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6338525292296333917', '6338525292296333917', 'ss', null, '-1', '1553250027119516', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6338525292296333917', '6338525292296333917', 'ca', 0x01, '0', '1553250027112200', null, null, '-5935', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '6338525292296333917', '6338525292296333917', 'http.method', 0x474554, '6', '1553250027112200', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6338525292296333917', '6338525292296333917', 'http.path', 0x2F7A69706B696E2F646570656E64656E63792F, '6', '1553250027112200', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6338525292296333917', '6338525292296333917', 'mvc.controller.class', 0x5A69706B696E55694175746F436F6E66696775726174696F6E, '6', '1553250027112200', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6338525292296333917', '6338525292296333917', 'mvc.controller.method', 0x7365727665496E646578, '6', '1553250027112200', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'sr', null, '-1', '1553250029121108', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'ss', null, '-1', '1553250029122255', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'ca', 0x01, '0', '1553250029121108', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'error', 0x343034, '6', '1553250029121108', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'http.method', 0x474554, '6', '1553250029121108', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'http.path', 0x2F7A69706B696E2F6E61765F7A682E70726F70657274696573, '6', '1553250029121108', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'http.status_code', 0x343034, '6', '1553250029121108', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, '6', '1553250029121108', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'sr', null, '-1', '1553250029320298', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'ss', null, '-1', '1553250029322300', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'ca', 0x01, '0', '1553250029320298', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'error', 0x343034, '6', '1553250029320298', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'http.method', 0x474554, '6', '1553250029320298', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'http.path', 0x2F7A69706B696E2F6E61765F7A682E70726F70657274696573, '6', '1553250029320298', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'http.status_code', 0x343034, '6', '1553250029320298', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, '6', '1553250029320298', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'sr', null, '-1', '1553250037294070', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'ss', null, '-1', '1553250037295127', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'ca', 0x01, '0', '1553250037294070', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'error', 0x343034, '6', '1553250037294070', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'http.method', 0x474554, '6', '1553250037294070', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'http.path', 0x2F7A69706B696E2F6E61765F7A682E70726F70657274696573, '6', '1553250037294070', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'http.status_code', 0x343034, '6', '1553250037294070', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8808582110485495656', '8808582110485495656', 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, '6', '1553250037294070', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'sr', null, '-1', '1553250037936068', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'ss', null, '-1', '1553250037937081', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'ca', 0x01, '0', '1553250037936068', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'error', 0x343034, '6', '1553250037936068', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'http.method', 0x474554, '6', '1553250037936068', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'http.path', 0x2F7A69706B696E2F6465705F7A682E70726F70657274696573, '6', '1553250037936068', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'http.status_code', 0x343034, '6', '1553250037936068', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6443030954055885225', '6443030954055885225', 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, '6', '1553250037936068', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-4385091580047998733', '4668494867871101617', 'cs', null, '-1', '1553250038330151', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-4385091580047998733', '4668494867871101617', 'cr', null, '-1', '1553250039142454', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-4385091580047998733', '4668494867871101617', 'sa', 0x01, '0', '1553250038330151', '2130706433', null, '3306', 'mysql');
INSERT INTO `zipkin_annotations` VALUES ('0', '-4385091580047998733', '4668494867871101617', 'sql.query', 0x696E736572742069676E6F726520696E746F20607A69706B696E5F616E6E6F746174696F6E736020286074726163655F6964602C20607370616E5F6964602C2060615F6B6579602C2060615F74797065602C2060615F74696D657374616D70602C2060615F76616C7565602C2060656E64706F696E745F736572766963655F6E616D65602C2060656E64706F696E745F6970763460292076616C7565732028363434333033303935343035353838353232352C20363434333033303935343035353838353232352C20276D76632E636F6E74726F6C6C65722E636C617373272C20362C20313535333235303033373933363036382C20582735323635373336663735373236333635343837343734373035323635373137353635373337343438363136653634366336353732272C2027636C6F75642D647265616D2D7A69706B696E2D736572766572272C2031363738303539333229, '6', '1553250038330151', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '-4385091580047998733', '-4385091580047998733', 'lc', '', '6', '1553250038326000', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'sr', null, '-1', '1553250043813061', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'ss', null, '-1', '1553250043814070', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'ca', 0x01, '0', '1553250043813061', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'error', 0x343034, '6', '1553250043813061', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'http.method', 0x474554, '6', '1553250043813061', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'http.path', 0x2F7A69706B696E2F6465705F7A682E70726F70657274696573, '6', '1553250043813061', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'http.status_code', 0x343034, '6', '1553250043813061', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '6605115248200784524', '6605115248200784524', 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, '6', '1553250043813061', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8925124319434014542', '8925124319434014542', 'sr', null, '-1', '1553250048215055', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8925124319434014542', '8925124319434014542', 'ss', null, '-1', '1553250048218744', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8925124319434014542', '8925124319434014542', 'ca', 0x01, '0', '1553250048215055', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '8925124319434014542', '8925124319434014542', 'http.method', 0x474554, '6', '1553250048215055', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8925124319434014542', '8925124319434014542', 'http.path', 0x2F7A69706B696E2F7472616365566965776572, '6', '1553250048215055', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8925124319434014542', '8925124319434014542', 'mvc.controller.class', 0x5A69706B696E55694175746F436F6E66696775726174696F6E, '6', '1553250048215055', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '8925124319434014542', '8925124319434014542', 'mvc.controller.method', 0x7365727665496E646578, '6', '1553250048215055', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'sr', null, '-1', '1553250052116099', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'ss', null, '-1', '1553250052117232', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'ca', 0x01, '0', '1553250052116099', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'error', 0x343034, '6', '1553250052116099', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'http.method', 0x474554, '6', '1553250052116099', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'http.path', 0x2F7A69706B696E2F6E61765F7A682E70726F70657274696573, '6', '1553250052116099', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'http.status_code', 0x343034, '6', '1553250052116099', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '4720391735358318599', '4720391735358318599', 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, '6', '1553250052116099', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '-3443398419233489841', 'cs', null, '-1', '1553250052149132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '-3443398419233489841', 'cr', null, '-1', '1553250052150262', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '-3443398419233489841', 'sa', 0x01, '0', '1553250052149132', '2130706433', null, '3306', 'mysql');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '-3443398419233489841', 'sql.query', 0x73656C6563742064697374696E637420607A69706B696E5F616E6E6F746174696F6E73602E60656E64706F696E745F736572766963655F6E616D65602066726F6D20607A69706B696E5F616E6E6F746174696F6E73602077686572652028607A69706B696E5F616E6E6F746174696F6E73602E60656E64706F696E745F736572766963655F6E616D6560206973206E6F74206E756C6C20616E6420607A69706B696E5F616E6E6F746174696F6E73602E60656E64706F696E745F736572766963655F6E616D6560203C3E203F29, '6', '1553250052149132', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '653855496952768006', 'sr', null, '-1', '1553250052148067', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '653855496952768006', 'ss', null, '-1', '1553250052151983', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '653855496952768006', 'ca', 0x01, '0', '1553250052148067', null, null, '-5982', '');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '653855496952768006', 'http.method', 0x474554, '6', '1553250052148067', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '653855496952768006', 'http.path', 0x2F7A69706B696E2F6170692F76322F7365727669636573, '6', '1553250052148067', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '653855496952768006', 'mvc.controller.class', 0x5A69706B696E51756572794170695632, '6', '1553250052148067', '167805932', null, null, 'cloud-dream-zipkin-server');
INSERT INTO `zipkin_annotations` VALUES ('0', '653855496952768006', '653855496952768006', 'mvc.controller.method', 0x676574536572766963654E616D6573, '6', '1553250052148067', '167805932', null, null, 'cloud-dream-zipkin-server');

-- ----------------------------
-- Table structure for `zipkin_dependencies`
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_dependencies`;
CREATE TABLE `zipkin_dependencies` (
  `day` date NOT NULL,
  `parent` varchar(255) NOT NULL,
  `child` varchar(255) NOT NULL,
  `call_count` bigint(20) DEFAULT NULL,
  UNIQUE KEY `day` (`day`,`parent`,`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_dependencies
-- ----------------------------

-- ----------------------------
-- Table structure for `zipkin_spans`
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_spans`;
CREATE TABLE `zipkin_spans` (
  `trace_id_high` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64bit',
  `trace_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `debug` bit(1) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL COMMENT 'Span.timestamp():epoch micros used for endTs query and to implement TTL',
  `duration` bigint(20) DEFAULT NULL COMMENT 'Span.duration():micros used for minDuration and maxDuration query',
  UNIQUE KEY `trace_id_high` (`trace_id_high`,`trace_id`,`id`) COMMENT 'ignore insert on duplicate',
  KEY `trace_id_high_2` (`trace_id_high`,`trace_id`,`id`) COMMENT 'for joining with zipkin_annotations',
  KEY `trace_id_high_3` (`trace_id_high`,`trace_id`) COMMENT 'for getTracesByIds',
  KEY `name` (`name`) COMMENT 'for getTraces and getSpanNames',
  KEY `start_ts` (`start_ts`) COMMENT 'for getTraces ordering and range'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_spans
-- ----------------------------
INSERT INTO `zipkin_spans` VALUES ('0', '-5739409895596920193', '-5739409895596920193', 'get /zipkin/**', null, null, '1553250029320298', '2002');
INSERT INTO `zipkin_spans` VALUES ('0', '-4385091580047998733', '-4385091580047998733', 'async', null, null, '1553250038326000', '817573');
INSERT INTO `zipkin_spans` VALUES ('0', '-4385091580047998733', '4668494867871101617', 'insert', '8080514877082132851', null, '1553250038330151', '812303');
INSERT INTO `zipkin_spans` VALUES ('0', '-3474607709458721997', '-3474607709458721997', 'get /zipkin/**', null, null, '1553250029121108', '1147');
INSERT INTO `zipkin_spans` VALUES ('0', '-685398733671283482', '-8024352246615648084', 'select', '-685398733671283482', null, '1553249914142494', '1518');
INSERT INTO `zipkin_spans` VALUES ('0', '-685398733671283482', '-685398733671283482', 'get /api/v2/dependencies', null, null, '1553249914141081', '5473');
INSERT INTO `zipkin_spans` VALUES ('0', '653855496952768006', '-3443398419233489841', 'select', '653855496952768006', null, '1553250052149132', '1130');
INSERT INTO `zipkin_spans` VALUES ('0', '653855496952768006', '653855496952768006', 'get /api/v2/services', null, null, '1553250052148067', '3916');
INSERT INTO `zipkin_spans` VALUES ('0', '3771090864474909221', '3771090864474909221', 'get /zipkin/**', null, null, '1553249913961132', '1111');
INSERT INTO `zipkin_spans` VALUES ('0', '4720391735358318599', '4720391735358318599', 'get /zipkin/**', null, null, '1553250052116099', '1133');
INSERT INTO `zipkin_spans` VALUES ('0', '6338525292296333917', '6338525292296333917', 'get /zipkin/index.html', null, null, '1553250027112200', '7316');
INSERT INTO `zipkin_spans` VALUES ('0', '6443030954055885225', '6443030954055885225', 'get /zipkin/**', null, null, '1553250037936068', '1013');
INSERT INTO `zipkin_spans` VALUES ('0', '6605115248200784524', '6605115248200784524', 'get /zipkin/**', null, null, '1553250043813061', '1009');
INSERT INTO `zipkin_spans` VALUES ('0', '8808582110485495656', '8808582110485495656', 'get /zipkin/**', null, null, '1553250037294070', '1057');
INSERT INTO `zipkin_spans` VALUES ('0', '8925124319434014542', '8925124319434014542', 'get /zipkin/index.html', null, null, '1553250048215055', '3689');
