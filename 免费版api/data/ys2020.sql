# Host: localhost  (Version: 5.5.5-10.1.37-MariaDB)
# Date: 2020-11-25 17:03:34
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "ys_admin"
#

DROP TABLE IF EXISTS `ys_admin`;
CREATE TABLE `ys_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '',
  `group_id` tinyint(4) NOT NULL COMMENT '管理组ID',
  `ip` varchar(30) DEFAULT NULL,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `department` varchar(255) DEFAULT NULL COMMENT '公司部门',
  `work` varchar(255) DEFAULT NULL COMMENT '职位',
  `code` varchar(255) DEFAULT NULL COMMENT '长连接标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

#
# Data for table "ys_admin"
#

INSERT INTO `ys_admin` VALUES (1,'admin','4b8a6c6d1652a3a613831b4c53b14972',1,NULL,0,NULL,0,1604560562,NULL,NULL,NULL,NULL);

#
# Structure for table "ys_article"
#

DROP TABLE IF EXISTS `ys_article`;
CREATE TABLE `ys_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `type` int(11) NOT NULL COMMENT '0活动公告，1独立文章，3公告',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `summary` varchar(140) DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` varchar(255) DEFAULT '' COMMENT '文章标题图片',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1 显示 0 不显示',
  `author` varchar(50) DEFAULT NULL COMMENT '发布者用户名 ',
  `create_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='CMS文章表';

#
# Data for table "ys_article"
#


#
# Structure for table "ys_auth_group"
#

DROP TABLE IF EXISTS `ys_auth_group`;
CREATE TABLE `ys_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态0禁用1启用',
  `rules` mediumtext NOT NULL COMMENT '规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

#
# Data for table "ys_auth_group"
#

/*!40000 ALTER TABLE `ys_auth_group` DISABLE KEYS */;
INSERT INTO `ys_auth_group` VALUES (1,'管理员',1,''),(2,'计划录入员',1,''),(3,'开单员',1,''),(4,'调度员',1,''),(5,'财务',1,''),(6,'油站管理员',1,''),(7,'维修员',1,''),(8,'库管',1,'');
/*!40000 ALTER TABLE `ys_auth_group` ENABLE KEYS */;

#
# Structure for table "ys_auth_group_rule"
#

DROP TABLE IF EXISTS `ys_auth_group_rule`;
CREATE TABLE `ys_auth_group_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` int(11) NOT NULL DEFAULT '0',
  `rule` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='规则分组表';

#
# Data for table "ys_auth_group_rule"
#

INSERT INTO `ys_auth_group_rule` VALUES (2,1,'1'),(3,1,'4');

#
# Structure for table "ys_auth_rule"
#

DROP TABLE IF EXISTS `ys_auth_rule`;
CREATE TABLE `ys_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `brief` varchar(80) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "ys_auth_rule"
#

/*!40000 ALTER TABLE `ys_auth_rule` DISABLE KEYS */;
INSERT INTO `ys_auth_rule` VALUES (1,'','规则',1,1,'','',0),(2,'/admin/auth/rule/add_rule','添加',1,1,'','',1),(4,'/admin/auth/group/get_group','获取所有权限分组',1,1,'','',1);
/*!40000 ALTER TABLE `ys_auth_rule` ENABLE KEYS */;

#
# Structure for table "ys_business"
#

DROP TABLE IF EXISTS `ys_business`;
CREATE TABLE `ys_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `name` varchar(15) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别（0女1男）',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `company_name` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `company_address` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态（0禁用1正常）',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家信息';

#
# Data for table "ys_business"
#


#
# Structure for table "ys_car"
#

DROP TABLE IF EXISTS `ys_car`;
CREATE TABLE `ys_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_num` varchar(255) DEFAULT NULL COMMENT '车牌号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '持有者',
  `lng` float NOT NULL DEFAULT '0',
  `lat` float NOT NULL DEFAULT '0',
  `tonnage` float NOT NULL DEFAULT '0' COMMENT '吨位',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型（0非公司车辆1公司车辆）',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0空闲1配送中2返回中）',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `oil` float NOT NULL DEFAULT '0' COMMENT '油量',
  `is_bind` int(11) NOT NULL DEFAULT '0' COMMENT '是否绑定',
  `equip_num` varchar(255) DEFAULT NULL COMMENT 'GPS设备编号',
  `position` varchar(255) DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL COMMENT '设备终端id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息';

#
# Data for table "ys_car"
#


#
# Structure for table "ys_car_fee"
#

DROP TABLE IF EXISTS `ys_car_fee`;
CREATE TABLE `ys_car_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT '0',
  `yy` float NOT NULL DEFAULT '0' COMMENT '运营费',
  `wh` float NOT NULL DEFAULT '0' COMMENT '维护费',
  `oil` float NOT NULL DEFAULT '0' COMMENT '油费',
  `parts` float NOT NULL DEFAULT '0' COMMENT '零配件费用',
  `other` float NOT NULL DEFAULT '0' COMMENT '其它费用',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆总费用';

#
# Data for table "ys_car_fee"
#


#
# Structure for table "ys_car_fee_appli"
#

DROP TABLE IF EXISTS `ys_car_fee_appli`;
CREATE TABLE `ys_car_fee_appli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '费用类型(运营费用、维护费用、零配件费用、油费、其它)',
  `fee` float NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '说明',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态（0未审核1已审核）',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆费用申报表';

#
# Data for table "ys_car_fee_appli"
#


#
# Structure for table "ys_car_oil"
#

DROP TABLE IF EXISTS `ys_car_oil`;
CREATE TABLE `ys_car_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT '0' COMMENT '车辆',
  `before_oil` float NOT NULL DEFAULT '0' COMMENT '剩余油量',
  `num` float NOT NULL DEFAULT '0' COMMENT '加油数量',
  `after_oid` float NOT NULL DEFAULT '0' COMMENT '加油后剩余油量',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  `total` float NOT NULL DEFAULT '0' COMMENT '总计费用',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `order_num` varchar(255) DEFAULT NULL COMMENT '运单号',
  `did` int(11) NOT NULL DEFAULT '0' COMMENT '司机id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加油表';

#
# Data for table "ys_car_oil"
#


#
# Structure for table "ys_driver"
#

DROP TABLE IF EXISTS `ys_driver`;
CREATE TABLE `ys_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `headpic` int(11) NOT NULL DEFAULT '0' COMMENT '头像',
  `fleet` int(11) NOT NULL DEFAULT '0' COMMENT '车队',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态（0禁用1正常）',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `_id_card_z` int(11) NOT NULL DEFAULT '0' COMMENT '身份证正面',
  `id_card_back` int(11) NOT NULL DEFAULT '0' COMMENT '身份证反面',
  `xsz` int(11) NOT NULL DEFAULT '0' COMMENT '行驶证',
  `jz` int(11) NOT NULL DEFAULT '0' COMMENT '驾照',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '开户行',
  `bank_card` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `oil_card` varchar(255) DEFAULT NULL COMMENT '油卡卡号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='司机表';

#
# Data for table "ys_driver"
#


#
# Structure for table "ys_fleet"
#

DROP TABLE IF EXISTS `ys_fleet`;
CREATE TABLE `ys_fleet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车队';

#
# Data for table "ys_fleet"
#


#
# Structure for table "ys_imgs"
#

DROP TABLE IF EXISTS `ys_imgs`;
CREATE TABLE `ys_imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='图片库';

#
# Data for table "ys_imgs"
#

INSERT INTO `ys_imgs` VALUES (8,'/uploads/img/20200924/e4422db0bbf64e9a33d7dcd58ddc69d4.jpg',1600926867,1600926867),(9,'/uploads/code/5f6c36d238799.jpg',1600927442,1600927442),(10,'/uploads/code/5f6c36d8176d5.jpg',1600927448,1600927448),(11,'/uploads/code/5f6c36dd952b6.jpg',1600927453,1600927453),(12,'/uploads/code/5f6c36e55f7a8.jpg',1600927461,1600927461);

#
# Structure for table "ys_line_up"
#

DROP TABLE IF EXISTS `ys_line_up`;
CREATE TABLE `ys_line_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '排队状态',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆排队表';

#
# Data for table "ys_line_up"
#


#
# Structure for table "ys_logistics"
#

DROP TABLE IF EXISTS `ys_logistics`;
CREATE TABLE `ys_logistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `type` varchar(255) DEFAULT NULL COMMENT '类型（下单、装货、运输、取件、完成）',
  `content` text COMMENT '描述',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `driver_id` int(11) NOT NULL DEFAULT '0' COMMENT '司机id',
  `car_id` int(11) NOT NULL DEFAULT '0' COMMENT '货车id',
  `arrive` varchar(255) DEFAULT NULL COMMENT '到达地',
  `target` varchar(255) DEFAULT NULL COMMENT '目的地',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流表';

#
# Data for table "ys_logistics"
#


#
# Structure for table "ys_mobile"
#

DROP TABLE IF EXISTS `ys_mobile`;
CREATE TABLE `ys_mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(255) DEFAULT NULL COMMENT '0管理员1商家2司机3用户4工作人员',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电话集';

#
# Data for table "ys_mobile"
#


#
# Structure for table "ys_msglog"
#

DROP TABLE IF EXISTS `ys_msglog`;
CREATE TABLE `ys_msglog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '验证码',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证表';

#
# Data for table "ys_msglog"
#


#
# Structure for table "ys_nav"
#

DROP TABLE IF EXISTS `ys_nav`;
CREATE TABLE `ys_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '标识',
  `title` varchar(255) DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '子菜单',
  `groups` text COMMENT '组权限',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='功能权限表';

#
# Data for table "ys_nav"
#

INSERT INTO `ys_nav` VALUES (1,'car','车辆调度1',0,'',1604563582,1604563625);

#
# Structure for table "ys_nav_group"
#

DROP TABLE IF EXISTS `ys_nav_group`;
CREATE TABLE `ys_nav_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav` int(11) NOT NULL DEFAULT '0',
  `group` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组权限表';

#
# Data for table "ys_nav_group"
#


#
# Structure for table "ys_oil"
#

DROP TABLE IF EXISTS `ys_oil`;
CREATE TABLE `ys_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock` float NOT NULL DEFAULT '0' COMMENT '油库存',
  `use` float NOT NULL DEFAULT '0' COMMENT '使用量',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='油库存';

#
# Data for table "ys_oil"
#


#
# Structure for table "ys_oil_appli"
#

DROP TABLE IF EXISTS `ys_oil_appli`;
CREATE TABLE `ys_oil_appli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` float NOT NULL DEFAULT '0' COMMENT '数量',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  `total` float NOT NULL DEFAULT '0' COMMENT '总价',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='油类申购表';

#
# Data for table "ys_oil_appli"
#


#
# Structure for table "ys_park"
#

DROP TABLE IF EXISTS `ys_park`;
CREATE TABLE `ys_park` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `fee` float NOT NULL DEFAULT '0' COMMENT '停车费用/每小时元',
  `total` float NOT NULL DEFAULT '0' COMMENT '停车总次数',
  `now_car` int(11) NOT NULL DEFAULT '0' COMMENT '目前剩余车辆',
  `total_fee` float NOT NULL DEFAULT '0' COMMENT '总收入',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `qrcode` int(11) NOT NULL DEFAULT '0',
  `position` varchar(255) DEFAULT NULL COMMENT '位置',
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='停车场所';

#
# Data for table "ys_park"
#

INSERT INTO `ys_park` VALUES (9,'停车场1号',1,0,0,0,1600927442,1600927442,9,'兴义市汇金中心;114.25151515;88.21651565656',NULL),(10,'停车场2号',2,0,0,0,1600927448,1600927448,10,'兴义市汇金中心;114.25151515;88.21651565656',NULL),(11,'停车场3号',3,0,0,0,1600927453,1600927453,11,'兴义市汇金中心;114.25151515;88.21651565656',NULL),(12,'停车场4号',4,0,0,0,1600927461,1600927461,12,'兴义市汇金中心;114.25151515;88.21651565656',NULL);

#
# Structure for table "ys_park_fee"
#

DROP TABLE IF EXISTS `ys_park_fee`;
CREATE TABLE `ys_park_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_num` varchar(255) DEFAULT NULL COMMENT '车牌号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `park` int(11) NOT NULL DEFAULT '0' COMMENT '停车场所',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  `total` float NOT NULL DEFAULT '0' COMMENT '总价',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0未支付1已支付）',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车费用统计';

#
# Data for table "ys_park_fee"
#


#
# Structure for table "ys_parts"
#

DROP TABLE IF EXISTS `ys_parts`;
CREATE TABLE `ys_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `model` varchar(255) DEFAULT NULL COMMENT '型号',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  `use` int(11) NOT NULL DEFAULT '0' COMMENT '已使用量',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='零配件表';

#
# Data for table "ys_parts"
#

INSERT INTO `ys_parts` VALUES (2,'轮胎',115,'50*50',300,0,1601185505,1601185932),(3,'扳手',65,'50*50',30,0,1601185527,1601185936),(4,'车胎',65,'50*50',200,0,1601185549,1601185938);

#
# Structure for table "ys_parts_appli"
#

DROP TABLE IF EXISTS `ys_parts_appli`;
CREATE TABLE `ys_parts_appli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '购置数量',
  `price` float NOT NULL DEFAULT '0' COMMENT '购置单价',
  `total` float NOT NULL DEFAULT '0' COMMENT '购置总价',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0未审核1已审核',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='零配件申购表';

#
# Data for table "ys_parts_appli"
#

INSERT INTO `ys_parts_appli` VALUES (4,2,50,300,15000,0,1601185932,1601185932),(5,3,50,300,15000,0,1601185936,1601185936),(6,4,50,300,15000,0,1601185938,1601185938);

#
# Structure for table "ys_plan"
#

DROP TABLE IF EXISTS `ys_plan`;
CREATE TABLE `ys_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '货物名称',
  `username` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `weight` float NOT NULL DEFAULT '0' COMMENT '重量/吨',
  `xh` varchar(255) DEFAULT NULL COMMENT '货物型号（自填）',
  `start` varchar(255) DEFAULT NULL COMMENT '运输起点',
  `end` varchar(255) DEFAULT NULL COMMENT '运输终点',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '交易状态0下单1装车2运输中3待确认4交易完成',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `trial` int(11) NOT NULL DEFAULT '0' COMMENT '财务审核状态（0未打款1已打款）',
  `start_jw` text COMMENT '运输起点经纬度',
  `end_jw` text COMMENT '运输终点经纬度',
  `sign_img` text COMMENT '签收图片',
  `is_sign` int(11) NOT NULL DEFAULT '0' COMMENT '是否签收',
  `car_id` int(11) NOT NULL DEFAULT '0',
  `courier_num` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `did` int(11) NOT NULL DEFAULT '0',
  `way` int(11) NOT NULL DEFAULT '0' COMMENT '运输方式',
  `trid` varchar(255) NOT NULL DEFAULT '' COMMENT '运输轨迹',
  `bid` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计划表';

#
# Data for table "ys_plan"
#


#
# Structure for table "ys_split_order"
#

DROP TABLE IF EXISTS `ys_split_order`;
CREATE TABLE `ys_split_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `car_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `manager` int(11) NOT NULL DEFAULT '0' COMMENT '调度员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拆单运输表';

#
# Data for table "ys_split_order"
#


#
# Structure for table "ys_sys_config"
#

DROP TABLE IF EXISTS `ys_sys_config`;
CREATE TABLE `ys_sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT '',
  `desc` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1基础2微信3支付宝4短信5物流6上传配置',
  `switch` int(11) NOT NULL DEFAULT '0' COMMENT '0填写框1开关2单选3多选',
  `other` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

#
# Data for table "ys_sys_config"
#

INSERT INTO `ys_sys_config` VALUES (71,'yzm_tmp_id','SMS_167525825','阿里云模板ID',4,0,'',1598500009,1598500009),(72,'yzm_sign','黔域','阿里云短信签名',4,0,'',1598500009,1598500009),(73,'yzm_keyid','LTAIaCg1QR6RRJ1d','阿里云短信KeyId',4,0,'',1598500009,1598500009),(74,'yzm_secret','l39UNFe9dzYa8EJ53GsoMs6fszhDe7','阿里云短信秘钥',4,0,'',1598500009,1598500009),(75,'is_yzm','0','是否开启验证码',4,0,NULL,1598500009,1598500009),(76,'map_web_key','502e6c481db78f3b67554a56f0e3006a','高德地图key',4,0,NULL,1598500009,1598500009),(77,'api_url','http:://47.94.100.148/','api接口地址',4,0,NULL,1598500009,1598500009),(78,'yzm_msg_sign','','消息通知短信签名',4,0,NULL,1598500009,1598500009),(79,'yzm_driver_sign','','司机短信通知模板id',4,0,NULL,1598500009,1598500009),(80,'yzm_admin_sign','','管理员短信提示',4,0,NULL,1598500009,1598500009),(81,'Notice','','公告通知',4,0,NULL,1598500009,1598500009);

#
# Structure for table "ys_worker"
#

DROP TABLE IF EXISTS `ys_worker`;
CREATE TABLE `ys_worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(30) DEFAULT NULL COMMENT '身份证',
  `work` int(11) NOT NULL DEFAULT '0' COMMENT '工作类型（0调度员1油站管理员2会计3会计单填写员）',
  `department` varchar(255) DEFAULT NULL COMMENT '公司部门',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `workname` varchar(255) DEFAULT NULL COMMENT '工作名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门管理员';

#
# Data for table "ys_worker"
#

