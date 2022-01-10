# Host: localhost  (Version: 5.5.5-10.1.37-MariaDB)
# Date: 2021-12-29 14:54:49
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "ys_admin"
#

DROP TABLE IF EXISTS `ys_admin`;
CREATE TABLE `ys_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) NOT NULL,
  `group_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '管理组ID',
  `ip` varchar(30) DEFAULT NULL,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `department` varchar(255) DEFAULT NULL COMMENT '公司部门',
  `work` varchar(255) DEFAULT NULL COMMENT '职位',
  `code` varchar(255) DEFAULT NULL COMMENT '长连接标识',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

#
# Data for table "ys_admin"
#

INSERT INTO `ys_admin` VALUES (1,NULL,'4b8a6c6d1652a3a613831b4c53b14972',9,NULL,0,NULL,0,1606548332,'admin',NULL,'超级管理员',NULL,'超级管理员',1,1606548557),(4,NULL,'4b8a6c6d1652a3a613831b4c53b14972',24,NULL,0,NULL,0,1608865074,'13512341234',NULL,'文员',NULL,'文员',1,1608865074),(5,NULL,'4b8a6c6d1652a3a613831b4c53b14972',25,NULL,0,NULL,0,1610412569,'18076175333',NULL,'调度员',NULL,'调度员',1,1610412569);

#
# Structure for table "ys_article"
#

DROP TABLE IF EXISTS `ys_article`;
CREATE TABLE `ys_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0活动公告，1独立文章，3公告',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `summary` varchar(140) DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` varchar(255) DEFAULT '' COMMENT '文章标题图片',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1 显示 0 不显示',
  `author` varchar(50) DEFAULT NULL COMMENT '发布者用户名 ',
  `create_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=6553 COMMENT='CMS文章表';

#
# Data for table "ys_article"
#

INSERT INTO `ys_article` VALUES (34,0,'超30家物流企业春节安排、28家企业入围疫苗运输名单','','<p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">01.25~01.31，第253期物流行业事件速递：</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">这一周物流行业消息频出！现在，就跟小编一起看看都发生了哪些大事吧~~</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">顺丰市值超联邦快递，一个新时代的里程碑标志</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月28日获悉，顺丰当前的市值已连续多日超过联邦快递（FedEx）。此前，1月21日开盘，顺丰控股大涨超5%，一度拉升涨6.67%至100.26元/股，首度站上百元大关，市值超4500亿元，诞生了A股首支百元快递股。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">顺丰驿站双网战略曝光</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">近日，驿加易举办了首届城市合伙人线上推介会，其两张网战略也开始浮出水面，即一个是城市末端快递集中收发服务网络，一个是乡村物流共配服务网络。据罗戈网·物流沙龙了解，驿加易由丰巢团队负责。罗戈网认为，从顺丰及菜鸟的战略布局来看，“顺丰下单入口+丰巢+驿加易”与“菜鸟裹裹+菜鸟驿站+菜鸟乡村”形成对战局面。同时，顺丰也已上线丰巢柜到柜产品，以低至1分钱的寄件价格吸引客户，2021年不容小觑。其中，从驿加易的网络布局来看，其双网战略与菜鸟驿站&amp;溪鸟形成对战。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">顺丰控股控股股东明德控股质押1.69亿股，用于融资</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月26日，顺丰控股控股股东深圳明德控股发展有限公司向中信银行股份有限公司深圳分行、华泰证券（上海）资产管理有限公司、陆家嘴国际信托有限公司、中国银行股份有限公司深圳东门支行合计质押股份1.69亿股，用于融资。本次质押股份1.69亿股，占其所持公司股份的6.25%，占公司总股本比例的3.71%。质押期限为2021年1月25日至办理解除质押登记手续之日。（来源：挖贝网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">顺丰牵手成都铁路港，打造全国首个铁路跨境综合服务平台</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月28日，深圳顺丰国际实业有限公司、成都现代物流投资发展有限公司合资合作协议签约仪式举行，顺丰牵手成都国际铁路港，打造全国首个铁路跨境综合服务平台。据了解，顺丰铁路跨境综合服务平台项目计划总投资3亿元，依托成都国际铁路港和中欧班列（成都），结合顺丰境内外“天网+地网+信息网”的商流、物流、信息流优势资源，搭建顺丰全国首个以铁路港为依托的国际供应链服务平台、全国铁路集散运营服务平台、跨境电商综合服务平台、海外仓储综合服务平台，着眼构建基于“双循环”的新发展格局，助力“一带一路”建设及西部陆海新通道等重大战略实施，推动成都开放型经济高质量发展。（来源：顺丰）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">京东与寿光佳佳鲜合资成立供应链公司，注册资本2亿元</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">据罗戈网.物流沙龙了解，天眼查数据显示，1月28日，深圳市京地达供应链管理有限公司成立，注册资本2亿人民币。该公司法定代表人为马骏，经营范围包括供应链管理服务；普通货物仓储服务；国内贸易代理；农副产品销售；食用农产品批发；新鲜蔬菜批发；新鲜蔬菜零售；食品经营；城市配送运输服务；货物进出口；互联网信息服务等。天眼查股权穿透图显示，该公司由江苏京东邦能投资管理有限公司和寿光佳佳鲜供应链有限公司合资成立，认缴出资额分别为1.02亿元（持股51%）、0.98亿元（持股49%）。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">新宁物流再度换帅！原京东物流杨海峰、薛颖辞职，任职仅1个月</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">据罗戈网获悉，1月28日，新宁物流发布公告称董事会于近日收到公司董事长杨海峰先生、独立董事张海龙先生及财务总监薛颖女士提交的书面辞职报告，杨海峰先生因个人原因申请辞去公司董事长、董事职务；张海龙先生因个人原因申请辞去公司独立董事、审计委员会委员职务；薛颖女士因个人原因申请辞去公司财务总监职务。辞职后，杨海峰先生、张海龙先生和薛颖女士不再在公司及子公司担任任何职务。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">顺丰、京东物流、国药物流、九州通、中外运冷链等28家企业入围首批疫苗运输名单</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月27日，交通运输部公示第一批新冠病毒疫苗货物道路运输重点联系企业，安徽都京云康医药有限公司、北京德利得物流有限公司、北京华欣物流有限公司等28家道路运输企业入围，来自邮政快递业的北京京邦达贸易有限公司（京东物流）和顺丰医药供应链有限公司（顺丰医药）榜上有名。（来源：交通运输部）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">超30家物流企业春节服务安排出炉</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">随着春节的临近，众多快递、快运等物流企业相继公布春节假期安排通知。顺丰、京东物流、通达百、极兔等多家快递企业宣布“春节不打烊”，安能、顺心捷达、壹米滴答等快运企业则纷纷发布放假通知。那么，各家企业具体的春节服务安排是怎么的？请看下文~（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">海航集团宣布破产重整</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月29日，海航集团有限公司发布声明称，2021年1月29日，我集团收到海南省高级人民法院发出的《通知书》，主要内容为：相关债权人因我集团不能清偿到期债务，申请法院对我集团破产重整。我集团将依法配合法院进行司法审查，积极推进债务处置工作，支持法院依法保护债权人合法权益，确保企业生产经营顺利进行。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">韵达拟成德邦第二大股东</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">据罗戈网.物流沙龙了解，1月25日早间，德邦物流股份有限公司公告称，将本次非公开发行的发行对象由宁波梅山保税港区福杉投资有限公司（简称“福杉投资”）调整为福杉投资的母公司韵达控股股份有限公司。韵达股份持有福杉投资100%的股权。根据本次非公开发行安排，预计本次发行完成后，韵达股份将持有德邦股份6.5%的股权，持有德邦股份股权比例较大，成为德邦股份第二大股东。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">韵达预计每年为德邦增加2.7亿毛利润</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">据罗戈网.物流沙龙了解，1月26日，德邦股份发布公告《德邦物流股份有限公司与中信证券股份有限公司关于请做好德邦股份非公开申请发审委会议准备工作的函的回复》，其中表示，经双方测算，预计每年合计可为德邦股份带来约2.70亿规模的毛利润增加，占2019年度德邦股份所实现毛利润的比重约为10.49%，持续推动德邦股份降本增效，实现销售业绩的大幅提升。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">万纬天津东疆港冷链中心项目开工</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月25日，天津东疆港冷链中心项目于天津东疆商务中心举行“拿地即开工”仪式。自2020年12月30日土地成功确权后，万纬天津东疆港冷链中心项目即确定作为天津战区内部“一号工程”。在项目前期启动会后，战区总牵头组织投资、工程、成本、设计、冷链各端口，成立“专项工作组”，结合“拿地即开工”目标，梳理开工前置条件，倒排前期报建工作计划，全力高效推进项目进展。同时，战区与管委会进行了高密度的沟通协调，确保政府审批、土地、规建、环保等职能审批部门全力配合项目工作推进。（来演：万纬物流）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">滴滴货运将完成15亿美元融资，淡马锡、CPE、IDG资本领投</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月26日获悉，滴滴货运已经完成首轮15亿美元融资协议签署工作。领投方为淡马锡、CPE源峰（中信产业基金）、IDG资本等，其他参与方还包括中关村龙门基金、普洛斯旗下私募股权投资机构隐山资本、碧桂园创投、鼎珮集团(VMS Group)和云锋基金等，本轮融资计划于今年2月全部完成。这是滴滴货运于2020年6月上线以来的首轮融资，有知情人士称，投资方汇集了国际投资机构、市场化基金、产业基金和政府基金，本次参与投资的中关村龙门基金就来自于全国社保基金、北京市政府、海淀区政府等共同出资。（来源：36氪）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">滴滴自动驾驶获3亿A+轮融资！</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月28日，滴滴自动驾驶确认完成一笔3亿美元融资，由IDG资本领投，CPE、Paulson、中俄投资基金、国泰君安国际、建银国际等投资机构跟投。这是滴滴自动驾驶业务拆分后获得的第二笔融资。2020年5月，滴滴旗下自动驾驶公司获得软银愿景基金二期领投的超5亿美元融资。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">天地汇完成7亿元人民币D轮融资</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月25日获悉，国内的公路物流网络货运产业互联网平台公司天地汇宣布已完成7亿元人民币D轮融资，由联通资本、中信证券及盈实基金联合领投，包括多家上市公司、银行及启赋资本等在内的新老股东跟投。本轮融资资金将重点投入到公路甩挂全国网络的完善、科技创新及生态圈打造上，进一步为上下游会员企业赋能蓄力。与此同时公司股改工作已经开始启动。（来源：投资界）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">能链集团完成1亿美元战略融资，招银国际领投</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月29日，能链集团宣布完成1亿美元战略融资，由招银国际领投，洪泰基金旗下国调洪泰等跟投，愉悦资本、蔚来资本追加投资。（来源：DoNews）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">传苏宁易购“零售云”接近完成10亿元A轮融资</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">据罗戈网.物流沙龙了解，消息人士透露，苏宁易购旗下“零售云”业务板块A轮融资接近完成，融资总额或超10亿元人民币。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">中谷物流2020年预盈利10个亿</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月26日获悉，中谷物流发布2020年度业绩预告，该公司预计2020 年年度实现归属于上市公司股东的净利润为9.80亿元到10.50亿元，与上年同期相比，将增加1.22亿元到1.92亿元，同比增加14.27%到22.44%；预计归属于上市公司股东的扣除非经常性损益的净利润7.46亿元到8.16亿元，与上年同期相比，将增加1.03亿元到 1.73 亿元，同比 增加 15.97%到 26.85%。（来源：航运界）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">最新春运交通运输方案出炉</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">近期，境外新冠肺炎疫情持续扩散蔓延，我国多地接连发生局部聚集性疫情，防控形势严峻复杂。2021年春运即将开始，人员集中流动性增大，将加大疫情传播风险。为指导各地切实做好春运期间疫情防控和错峰控流相关工作，降低因春运造成的疫情传播风险，特制定本方案。（来源：交通运输部）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">UPS以8亿美元出售旗下货运公司UPS Freight</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">《华尔街日报》1月26日消息，联合包裹（UPS）宣布与加拿大卡车运输公司TFI Internationa已达成最终协议。UPS将以8亿美元的价格将货运公司UPS Freight出售给TFI International。此外，TFI International还与UPS签署了为期五年的协议，将在未来五年内继续利用UPS在美国的运输网络完成货运。据悉，目前这笔价值8亿美元的交易已获得两家公司董事会的批准。（来源：罗戈网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">Uber裁掉Postmates约15%员工，大量高管离职</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">近日，Uber对Postmates进行了大刀阔斧的改革，包括大幅度裁员。据《纽约时报》1月24日消息，Uber宣布将于近日解雇185名Postmates的员工，包括Postmates创始人兼首席执行官Bastian Lehmann在内大多数高管在内都将离职。《纽约时报》猜测，未来数月内劳务合同到期的员工恐怕也不会得到Uber方面的续约，同样Uber也不排除继续削减现有员工数量。（来源：环球网）</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">意大利邮政收购Sengi Express51%股份</span></span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; letter-spacing: 1px;\">1月26日消息，意大利邮政宣布，已与中国香港Cloud Seven控股有限公司签署协议，收购中国物流公司Sengi Express51%的股份，交易将于今年一季度末完成，但未提供财务细节。意大利邮政在声明中称，外国公司将首次成为意大利邮政集团的一部分，为集团的合并业绩做出贡献。Sengi Express将为中国电子商务公司的意大利销售提供物流服务。（来源：商务部网站）</span></p><p><br/></p>','',0,'1',1609379282),(35,0,'河南物流企业数量增加5万多家','','<p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">天眼查数据显示，2015年至2020年，5年间，河南省物流企业的数量增加了2.5万多家。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">随之而来的，是仓储物流得到了长足发展。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2013年时，河南省会郑州高标仓只有三四十万平方米，而到2020年底，这个数字增至200万+。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">机构预测，2023年中国智能仓储市场规模将达1975亿元。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2021年1月发布的《2020年12月中国通用仓储市场动态报告》显示，郑州仓储平均租金为23元/㎡·月，在全国32个城市中排第19。</p><p><img src=\"https://p1-tt.byteimg.com/origin/pgc-image/6c4227a5f6d0400bbc240e8bf9d26a43?from=pc\" img_width=\"1282\" img_height=\"962\" alt=\"5年，河南物流企业数量增加2.5万多家！郑州仓储业进入高速发展期\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">【故事】</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">杭州投资者来郑州找仓，要做社区团购</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如果说，2020年上半年最火的是直播带货，那么，下半年的主角就变成了社区团购。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">鉴于后者关系着老百姓的生活刚需，这波风潮蔓延到了当下。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2021年1月28日，在杭州做电商多年的陈先生联系到河南商报记者，称其准备回到老家河南郑州做社区团购。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“和杭州人相比，河南人更爱在家里做饭，对生鲜的需求更大。”陈先生说，河南是人口大省，消费潜力巨大，这是他把两地做了调研后决定回河南的主要原因。而他背后的投资者，也认可他的建议。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">而做社区团购，第一步要找的就是能做分拨中心的仓。</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">郑州1万至3万平方米的仓好找吗？做社区团购的话，把分拨中心建在哪个区比较合适？哪个区的仓性价比更高？</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当天，带着这些问题，陈先生走访、调研了中牟、经开区、航空港等多家仓储企业。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">河南省物流与采购联合会仓储服务专委会秘书长李宁称，2020年，郑州新增仓库458万平方米，而新增租户主要来源于两类，一是做社区团购的，二是做快运快递的。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">原来在郑州做社区团购的平台只有2家，2020年6月份之后，增至十几家，如滴滴投资的橙心优选、拼多多投资的多多买菜陆续入驻，每家平台的中心仓在1至3万平方米不等。</p><p><img src=\"https://p6-tt.byteimg.com/origin/pgc-image/c753fc0510674732a54c54196b379858?from=pc\" img_width=\"1282\" img_height=\"962\" alt=\"5年，河南物流企业数量增加2.5万多家！郑州仓储业进入高速发展期\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">【 对比】</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">中牟仓库最多，经开区仓库租金最高</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">郑州哪个区的仓库最多？</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">李宁称， 截至2020年12月31日，郑州仓库面积超1935万平方米，主要集中分布在中牟县、新郑市、航空港区、经开区。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">其中，中牟县仓库有429.9万平方米，体量最大；新郑市排第二，有仓库186.5万平方米；航空港区有仓库179.3万平方米，排第三；经开区排第四，有仓库149.7万平方米。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">另外，新密市有仓库128.4万平方米，荥阳市有仓库102.7万平方米。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">就租金而言，经开区仓库租金最高，达到23元/㎡·月。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">其次是航空港区，21元；高新区排第三，20元；管城区第四，19元；二七区第五，17元；中牟县最便宜，15元。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">经开区、航空港区仓库租金均价均高于郑州市的平均水平。主要原因在于经开区处于物流产业集聚区，距离郑州市中心近，各种配套齐全，运输成本较为便宜，更受客户青睐；航空港仓库主要集中在空港范围内，新建高标仓多，航空运输较为方便。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2021年1月19日，物联云仓发布的《中国通用仓储市场动态报告》显示，全国32个城市仓库平均租金为27.58元/㎡·月，环比下降0.39%。 其中，东部地区仓库平均租金（34.12 元/㎡·月），高于西部（24.40元/㎡·月）、中部（24.02元/㎡·月）、东北（22.06元/㎡·月）地区。 在这个报告里，郑州仓储平均租金为23元/㎡·月，在全国32个城市中排第19。</p><p><img src=\"https://p3-tt.byteimg.com/origin/pgc-image/f7ec518225fc468496376bd8cad91ce8?from=pc\" img_width=\"641\" img_height=\"481\" alt=\"5年，河南物流企业数量增加2.5万多家！郑州仓储业进入高速发展期\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">【剖析】</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">7年，郑州仓储从萌芽进入高速发展阶段</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">作为物联云仓郑州城市合伙人，王坤见证了郑州仓储市场的发展变迁。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在王坤看来，河南虽然是物流大省，但作为省会城市的郑州，高标仓的发展远远落后于物流，而且和周边同样是中部重要节点城市的武汉、成都相比，有一定差距。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2013至2014年，是郑州仓储业发展的萌芽期，此时郑州高标仓只有二三十万平方米。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">普洛斯在郑州经开区国际物流园区建成了一期七八万平方米的仓，同期，丰树物流园区建成了约5万平方米的仓，嘉里大通物流园建了四五万平方米的仓。因为所处位置是郑州物流公司聚集地，这些仓一建成即遭到哄抢，租金高达32元/㎡·月，远高于普通仓15元的价位。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">天眼查专业版数据显示，2015年起，河南物流进入高速发展期。截至2020年12月31日，河南省目前共有超过3.8万家企业名称或经营范围含“物流”，66%的相关企业成立于近5年。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年河南省共注册超过7500家物流相关企业，年注册量达到历史最高。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">仓储物流也随之水涨船高。</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2018年至2019年，郑州高标仓进入规模化发展阶段。此时，因为物流公司飞速增长，仓库供不应求，郑州高标仓缺口达四五十万平方米。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">物联云仓在线仓库数据显示，截至 2019 年 7 月，全国通用仓库空置率为 10.17%，郑州市通用仓库空置率为 5.42%，低于全国通用仓库空置率水平。其中，郑州经济开发区空置率为 9.73%；金水区通用仓库空置率仅为 1.45％。 此时，万科、百利等企业都想在郑州拿到仓储用地，但无地可拿。也是在这一阶段，顺丰丰泰、海尔等已拿到地的企业开始在郑州开始大规模建仓。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年至今，是郑州高标仓完成建设的集中投放期，截至目前，郑州高标仓达200多万平方米。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“渴了好几年，终于等到有一口水喝，可以缓一缓。”王坤如是形容郑州仓储市场的现状。 200多万平方米的体量，和周边的武汉、成都相比，只能算是“新兵”，但好在是，郑州正在迎头赶上。</p><p><img src=\"https://p3-tt.byteimg.com/origin/pgc-image/fa22f2c9cc054ae5b7320374c89a0115?from=pc\" img_width=\"1282\" img_height=\"962\" alt=\"5年，河南物流企业数量增加2.5万多家！郑州仓储业进入高速发展期\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">【预测】</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">2023年中国智能仓储市场规模将达1975亿元</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年之前，郑州市仓储主要需求方有电商企业、物流企业、服装制造业等。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年，突如其来的疫情，让社区团购兴起，快运也加快了发展速度，这两者都争相抢仓布局。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年12月交付的顺丰丰泰电商产业园，仓储面积8多万平方米。2021年1月28日，河南商报前往走访时，该公司负责人卢恩称，目前已基本全部租出去了，社区团购的占了三分之一，其他是物流和快运。如果想租，预计春节过后的四五月份，会有1万多平方米仓库到期，届时可以提前预约。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">位于航空港区的乐佳物流园有6万多平方米的仓库，该公司物业经理王金霞称，没有空仓，已全部出租，其中有4万平方米是租给了做社区团购的客户。</p><p><img src=\"https://p6-tt.byteimg.com/origin/pgc-image/189e15baf6a446ca8bd5dcb65bf621a1?from=pc\" img_width=\"641\" img_height=\"481\" alt=\"5年，河南物流企业数量增加2.5万多家！郑州仓储业进入高速发展期\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">艾媒咨询数据显示，2020年社区团购市场规模预计达到720亿元，同比增幅112%，2022年中国社区团购市场规模预计超过1020亿元。由此带来的直接影响，可以预见的是，仓储将更加紧俏。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">GGII发布的数据显示，2018年中国智能仓储市场规模797.69亿元，同比增长16.45%，2014-2018年智能仓储市场规模年均复合增长率18.81%。</p><p><img src=\"https://p3-tt.byteimg.com/origin/pgc-image/2cf03b9b0c5a4ef29cf46832829cd614?from=pc\" img_width=\"1282\" img_height=\"962\" alt=\"5年，河南物流企业数量增加2.5万多家！郑州仓储业进入高速发展期\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中国物流业的快速发展为仓储业的崛起提供了巨大的市场需求，加上制造业、商贸流通业外包需求的释放和政策的引导，智能仓储的战略地位将持续加强，未来智能仓储市场需求将进一步释放，GGII预测到2023年，中国智能仓储市场规模将达1975亿元。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">王坤认为，目前郑州的仓储主要围绕东南方向的中牟、新郑、航空港布局，但其实，郑州的西北方向对于仓储需求也很旺盛，如果政府有关部门能做好顶层设计，郑州仓储业在智能化、规模化方面还有更大的潜力可挖。</p><p><br/></p>','',0,'1',1612170243),(36,0,'交通运输稳步迈向更高质量，2020年交通运输行业进展和成效解读','','<p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700; margin: 0px; padding: 0px; border: 0px;\">中国宏观经济研究院综合运输研究所 汪鸣 刘昭然</span></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年是新中国交通发展史上极不平凡的一年，在服务抗击疫情的严峻挑战和巨大困难面前，交通运输行业以习近平新时代中国特色社会主义思想为指导，坚决贯彻中央“六稳”“六保”决策部署，统筹疫情防控和生产建设，高效组织防疫和生产生活物资供应，保障数万名援鄂医护人员快速到位，有组织服务复工复产。一大批交通重大工程项目开工投产，不仅确保年度建设投资规模逆势上扬，推动交通基础设施规模质量再上台阶，而且为经济由负转正作出了贡献。在保产业链供应链稳定和畅通经济循环中，交通运输行业加快创新组织方式，动态及时调整客运服务供给，打通海陆空国内外物资流通通道，实现多项运输指标飘红向好，体现了支撑服务疫情防控和经济社会运行的交通担当。交通运输在2020年的良好表现，为我国顺利完成“十三五”规划目标任务，更好承担国家使命、服务重大战略、全面扩大对外开放和支撑新型城镇化建设创造了条件，为实现全面建成小康社会提供了强大支撑，为社会主义现代化国家建设奠定了坚实基础。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">一、一大批重大交通工程项目加快推进</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年，按照统筹推进疫情防控和经济社会发展要求，对照“十三五”时期规划目标任务，一大批重大工程项目加快推进，川藏铁路雅安至林芝段正式开工建设，武汉至安庆6米水深航道整治工程主体完工，实施了一批国家高速、普通国道待贯通路段和拥挤路段扩容改造项目。基础设施网络化一体化水平持续提升，横贯东西、纵贯南北的综合运输大通道加快贯通，国家重大区域战略承载地的交通连通成网，革命老区、民族地区、边疆地区、贫困地区通达深度进一步提高，交通基础设施加快互联，各种运输方式更加融合协调，为区域城乡一体发展提供了高效网络基础。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">从发挥交通运输战略支撑引领作用看，“一带一路”交通基础设施加快互联、沿线地区加强互通，巴基斯坦拉合尔轨道交通橙线和匈塞铁路塞尔维亚贝泽、泽巴段左线开通运营。京津冀交通一体化加快实现，京雄城际铁路实现全线贯通，京津冀核心区1小时交通圈加快形成。长江经济带综合交通运输体系高质量发展稳步推进，长江沿线港口集疏运铁路建设取得实质性进展。粤港澳大湾区基础设施加密网络加快推进，广湛高铁、深中通道、白云机场三期扩建等稳步建设。长三角交通运输一体化迈向更高质量，盐通高铁试运行，南京长江五桥建成，沪苏通长江公铁大桥投入运营。黄河流域生态保护和高质量发展、海南全面深化改革开放交通重大项目和政策稳步实施，区域人员往来和货物流通显著便捷，助力提升区域竞争位势。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">二、交通固定资产投资规模迈上新台阶</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在克服年初受新型冠状肺炎病毒疫情爆发影响，一季度交通建设投资完成额出现大幅下降的巨大困难基础上，交通行业坚持抢抓项目进度、尽快复工复产，非但保持原年度计划目标任务不缩水不下降，还主动加压、千方百计扩大有效投资，努力发挥交通建设投资促增长的稳定器作用。相关部门和单位加快项目审批进度、简化审批程序，积极谋划重大工程项目，落实政府工作报告“增加国家铁路建设投资1000亿元”部署，提前下达中央预算内和车购税资金，各地积极利用好地方政府专项债券、抗疫特别国债等政策，创造了近年来交通投资总量和增速的“双高”记录，全年交通固定资产投资超过3.4万亿元，较上年增长约2000亿元。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">分方式看，全国铁路完成固定资产投资约7819亿元，较年初计划增加719亿元，其中，基本建设投资完成5550亿元以上，超过2019年水平。公路水路预计完成投资2.5万亿元以上，为年度投资增长作出了最主要贡献。民航完成投资约1050亿元，首次突破千亿元大关。交通投资的逆势上扬充分落实了逆周期宏观调控政策，扩大了内需、弥补了短板、畅通了循环、降低了成本，既发挥了应急之效，又创造了长久之功，有力支撑了深化供给侧结构性改革。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">三、综合交通网络总里程迈过新关口</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">截至2020年年底，全国综合交通网里程预计超过550万公里， “十三五”交通规划任务圆满完成，不断织密的综合交通网成为国民经济运行的重要骨架和血脉。其中，铁路新线投产4933公里，包括高速铁路2000公里以上。“十三五”期间铁路建设刷新历史成就，全国铁路营业里程由12.10万公里增加到14.63万公里，增长20.9%，高速铁路里程由1.98万公里增加到3.79万公里，翻了近一番，复线率由53.5%提高到59.5%，电气化率由61.8%提升到72.8%。“四纵四横”高铁网提前建成，“八纵八横”高铁网加密成型，成为我国综合交通领域“领跑世界”的中国名片。公路水路和民航支撑引领功能也不断增强，2020年全国新改（扩）建高速公路12713公里，全国高速公路里程突破15万公里。新改建农村公路26.9万公里，完成乡道及以上公路安全生命防护工程18.1万公里，改造危桥6580座，全国公路总里程预计超过510万公里。新增及改善高等级航道约600公里，高速公路里程、万吨级泊位数量等保持世界第一。新颁证民用运输机场4个，颁证运输机场数量增加到241个，民航机场覆盖92%的地级行政区。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">交通运输覆盖深度广度和质量等级大幅提升，有力保障了民生服务水平提高。截至2020年年底，我国高速铁路覆盖近95%的百万以上人口城市，动车组承担铁路客运量达65%。高速公路覆盖近100%的20万以上人口城市。民航机场覆盖92%的地级行政区，2020年航班正常率达88.52%，通用航空加快发展。百万以上人口城市公交站点500米覆盖率约100%。服务全面小康的最基本民生出行服务不断改进，“铁路网+无轨站”惠及600余个边远山区百姓出行，全国农村地区快递网点超过3万个，公共取送点超过6万个，乡镇快递网点覆盖率达98%，100%建制村通邮，多层次出行和多节点物流网络逐步形成。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">四、客运生产实现平稳过渡并较快复苏</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">受全球人员流动缓滞和区域封闭管控等措施影响，客运行业面临前所未有下行压力，但伴随国内经济复苏强劲和精准供给、防护政策深入落实，客运行业在二季度之后加快复苏，总体实现抗疫、防疫、发展平稳过渡。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">为支撑打赢疫情防控的武汉保卫战、湖北保卫战，客运行业迅速响应、全力驰援，严格实施离汉离鄂通道管控，全力保障4.2万余名援鄂医护人员快速到位。在疫情常态化防控阶段，客运行业因时因势因需动态调整、细化和完善防控措施，严格落实交通运输工具及场站防控要求，严格“外防输入”，实施做好行业从业人员、入境人员疫情防控，保障了首都等重点地区疫情防控，精准高效地应对局部地区散发性疫情。铁路企业以市场为导向，动态调整客运能力供给，精准实行“一日一图”，全面推行电子客票，旅客身份证可在全国2878个高铁和普铁车站“一证通行”，惠及99%以上铁路出行人群。同时，铁路企业保留并完善传统售取票方式，保证老年人和脱网人群的出行需要，满足了旅客多样化市场需求，国家铁路全年完成旅客发送量21.6亿人。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在武汉、湖北疫情形势得到有效控制后，客运行业呈现较好复苏态势。其中，11月份营业性客运量已恢复至上年同期的67.4%，其中铁路恢复至79.4%、公路恢复至63.1%、水路恢复至72.6%、民航恢复至83.7%，全国36个中心城市公共交通客运量已恢复至上年同期的83.4%。全年城市轨道交通实际开行列车2528万列次，完成客运量175.9亿人次，进站量达到109.1亿人次，其中，第四季度已恢复至上年同期的94.1%。网约车日均订单2100万，共享单车日均订单4570万，9~11月滴滴平台网约车订单规模较去年同期增长9.2%，定制客运和智慧出行一体化服务平台不断涌现，为保障城市生产生活正常运行发挥了重要作用。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">五、货运生产多个指标逆势实现正增长</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">新型冠状肺炎病毒疫情在全球范围大流行，我国是全球率先控制疫情的大国，唯一实现经济和货物贸易正增长的主要经济体，多项货运指标实现正增长，货运行业量质齐升。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">国内国际货运逆势上扬成为全球亮点。2020年，我国铁路、快递、港口生产、货运新业态和对外班列均实现较快增长，铁路、公路、水路、民航运输量和周转量等跻身世界前列。细分来看，国家铁路货物发送量35.8亿吨，同比增加1.41亿吨，增长4.1%，其中，集装箱4.58亿吨，同比增长37%；高铁快运4.4万吨，同比增长40%。全年邮政业业务总量和业务收入分别完成2.1万亿元和1.1万亿元，同比分别增长29.4%和14.1%。快递业务量和业务收入分别完成830亿件和8750亿元，同比分别增长30.8%和16.7%，快递业务量较“十二五”末翻了两番。港口货物吞吐量完成约145.7亿吨，同比增长4.4%。“互联网+货运物流”快速发展，网络货运日均运单量达13万单。中欧班列战略通道作用充分发挥，全年开行中欧班列1.24万列，发送113.5万标准箱，同比分别增长50%和56%，综合重箱率达98.4%。西部陆海新通道产业带动作用不断显现，全年开行西部陆海新通道班列3600列，发送19万标准箱，同比分别增长73%和80%。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在取得重要领域规模突破的同时，货运行业体现使命担当、向高质量发展再迈一步。新冠肺炎疫情在武汉爆发初期，在国际国内常规运输严重受阻情况下，相关部门和企业积极协调打通国际国内货运包机和通航运输通道，积极组织开行中欧班列、国际快船以及周边国家陆运等运输方式，推行高速公路免收通行费政策，构建防疫物资运输“绿色通道”，发挥了抗击疫情的中坚作用。同时，运输结构调整取得明显成效，大宗货物“公转铁”“公转水”取得成效，累计完成铁路货运增长量约7.8亿吨，水路货运增量5.7亿吨，沿海港口大宗货物公路运输量减少约3.7亿吨。多式联运工作持续推进，三批70个多式联运示范工程完成集装箱多式联运量480万标准箱，全国港口集装箱铁水联运量预计同比增长30%。铁路货运量占全社会货运量的比重从2016年的7.7%提高到2020年的9.9%。交通运输领域积极推进减税降费，可量化降低物流成本超过1300亿元。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2021年，疫情变化和外部环境仍存在诸多不确定性，交通运输行业总体呈现恢复性增长特点，但生产复苏形势仍然不稳定不平衡，需要深化交通行业供给侧结构性改革，为引领新发展阶段、构建新发展格局当好先行。一是抓好常态化疫情防控与交通生产建设，统筹做好运输环节的“人”“物”疫情防控，备战好春运这场运输与防疫的双重“大考”，全力做好防疫及生产生活物资和医疗人员运输任务。二是编制好“十四五”综合交通运输体系规划，谋划交通运输领域支撑构建新发展格局和构建统一开放有序市场的重点任务，编制出经得住历史考验的高质量五年规划。三是精准实施交通基础设施补短板，扎实推进川藏铁路等国家重点工程，为重大战略实施当好“先行官”。四是进一步深化交通运输改革，持续释放改革红利，不断提升交通运输发展软实力和行业治理能力。</p><p><br/></p>','',0,'1',1612170927),(37,0,'千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式','','<p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">大件运输是国内运输市场中比较小众的细分市场，外行人对其最直观的了解就是：超长、超宽、超高，动辄几百吨，超大件但凡上路都需要交警路政开道，霸占好几条车道时常态，甚至于为了顺利通过拆除收费站。那么国内外运输大件车都有哪些方式呢？</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">分别是单车牵引、单车牵引+多车顶推，单车牵引+顶推、多车牵引+多车顶推。</p><h1 class=\"pgc-h-arrow-right\" style=\"box-sizing: border-box; font-size: 1.5em; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; line-height: 1.33333; color: rgb(34, 34, 34); position: relative; font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 28px !important;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px;\">单车牵引</span></h1><p><img src=\"https://p6-tt.byteimg.com/origin/pgc-image/bd5ff7385b2e4eb5aa27e8e004d9c31e?from=pc\" img_width=\"600\" img_height=\"400\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">单车牵引一般采用的是大件运输牵引车和半挂车，主要运输几百吨、不可拆卸大件货物，可承载的货物重量是这几种大件运输中最低的，和普通货运方式相差无几，但是车型存在很大差异，挂车主要以多轴液压半挂车为主，而且挂车轮胎直径很小，整个挂车离地高度很低。</p><p><img src=\"https://p6-tt.byteimg.com/origin/dfic-imagehandler/ca958420-5e91-465a-b939-4166d45e8516?from=pc\" img_width=\"483\" img_height=\"334\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">视频中奔驰8X4牵引车和液压挂车的组合运输的货物重400吨、整个货物长度为74米。这样的单车运输操作难度比较低。</p><h1 class=\"pgc-h-arrow-right\" style=\"box-sizing: border-box; font-size: 1.5em; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; line-height: 1.33333; color: rgb(34, 34, 34); position: relative; font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 28px !important;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px;\">单车牵引+单车顶推</span></h1><p><img src=\"https://p1-tt.byteimg.com/origin/pgc-image/0d9fb39f204f45dfabfdc226d651cc30?from=pc\" img_width=\"600\" img_height=\"400\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p><img src=\"https://p3-tt.byteimg.com/origin/dfic-imagehandler/12f6e478-72ff-46fe-a3a7-48a33a0ae02c?from=pc\" img_width=\"488\" img_height=\"333\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当要运输的货物比较重，单车牵引无法完成时，就会选择两辆车共同运输，一辆在挂车前方主要做牵引用，另外一辆则在挂车后方推着挂车走，需要用顶推杆式三角架将挂车的车尾和牵引车的车头连接起来，这种方式叫做单车牵引+单车顶推。</p><h1 class=\"pgc-h-arrow-right\" style=\"box-sizing: border-box; font-size: 1.5em; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; line-height: 1.33333; color: rgb(34, 34, 34); position: relative; font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 28px !important;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px;\">单车牵引+多车顶推</span></h1><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这种方式和上一种相似，只不过如果两台车无法完成运输，也会选择这种方式。挂车前由一台车牵引，尾部由多台车顶推。</p><p><img src=\"https://p1-tt.byteimg.com/origin/dfic-imagehandler/9548329e-7825-44b5-883d-bc2c985d5ca9?from=pc\" img_width=\"488\" img_height=\"334\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">比如视频中的美国长头车MARK大件运输就采用的是这种方式，一辆6x4牵引车在前方牵引，后方有4台6x4牵引车推着挂车走。</p><h1 class=\"pgc-h-arrow-right\" style=\"box-sizing: border-box; font-size: 1.5em; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; line-height: 1.33333; color: rgb(34, 34, 34); position: relative; font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 28px !important;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px;\">多车牵引+多车顶推</span></h1><p><img src=\"https://p1-tt.byteimg.com/origin/pgc-image/93c804f0485e4e319ecee969b69e9e28?from=pc\" img_width=\"600\" img_height=\"400\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如果货物有上千吨甚至更多时，就需要多台车共同运输。多车牵引加多车顶推运输一般采用的是液压全挂车，可以将货物重量平均分布到每一条轮胎上。</p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">车头的多台牵引车通过铰链接的方式连接挂车的前端梁，车尾的牵引车也是通过铰链接的形式链接到挂车的后端粱上。</p><p><img src=\"https://p1-tt.byteimg.com/origin/pgc-image/b59cccdb27a8435e97f4bcbc77cf90f5?from=pc\" img_width=\"600\" img_height=\"450\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p><img src=\"https://p3-tt.byteimg.com/origin/pgc-image/d0476bf558d14e7394a6122bfec2f771?from=pc\" img_width=\"600\" img_height=\"253\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">多车运输时车头和车尾的几台车一般会有两种排列方式，一种是串联，排队行驶，一种是并联，两台甚至多台并排排队行驶，这种方式对于驾驶员之间的默契、路面和地形的要求非常高，需要同时发力、平均承担动力并且保持几乎相同的速度才能保证车辆正常运输。</p><p><img src=\"https://p6-tt.byteimg.com/origin/dfic-imagehandler/8e8f39f4-1ad1-47a0-aadf-5b5c53442c5d?from=pc\" img_width=\"562\" img_height=\"421\" alt=\"千吨货物也不在话下，前牵引后顶推，看大件运输的奇特方式\" inline=\"0\" class=\"syl-page-img\" style=\"box-sizing: border-box; border: 0px; margin: 0px auto; padding: 0px; cursor: zoom-in; max-width: 100%; display: block;\"/></p><p class=\"pgc-img-caption\" style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px;\"><br/></p><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">另外，为了提高车辆的附着力，避免轮胎在发力时打滑，大件运输车辆在运输时还会拉上相应的配重，配重的多少需要根据车货总重、牵引车数量以及发动机的功率来进行计算，因地制宜。</p><h1 class=\"pgc-h-arrow-right\" style=\"box-sizing: border-box; font-size: 1.5em; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; line-height: 1.33333; color: rgb(34, 34, 34); position: relative; font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 28px !important;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px;\">编后语</span></h1><p style=\"box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">视频中的大件运输车主要来自国外，短短2分钟视频为我们介绍了大件运输的不同方式，目前国内的大件运输市场发展也非常迅速，但也存在各种问题，并非大家眼中的“开张吃三年”的行当，之后的文章中我们也会采访大件运输的业内人士，为大家进一步揭秘国内的大件运输。</p><p><br/></p>','',0,'1',1612171008);

#
# Structure for table "ys_auth_group"
#

DROP TABLE IF EXISTS `ys_auth_group`;
CREATE TABLE `ys_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态0禁用1启用',
  `rules` text COMMENT '规则',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

#
# Data for table "ys_auth_group"
#

/*!40000 ALTER TABLE `ys_auth_group` DISABLE KEYS */;
INSERT INTO `ys_auth_group` VALUES (9,'管理员',1,'[1,2,3,4,5,6,7,8,9,10]',0,1606547849),(20,'修理部',1,'[1,2,3,4,5,6,7,8,9,10]',1606890933,1606890933),(23,'测试部门',1,'[1,2,3,4]',1608861990,1608861990),(24,'办公室',1,'[1,9,3,6]',1608865049,1608865049),(25,'调度中心',1,'[1,2,3]',1610412536,1610412536);
/*!40000 ALTER TABLE `ys_auth_group` ENABLE KEYS */;

#
# Structure for table "ys_auth_group_rule"
#

DROP TABLE IF EXISTS `ys_auth_group_rule`;
CREATE TABLE `ys_auth_group_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(11) DEFAULT '50' COMMENT '规则名',
  `rule` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='规则分组表';

#
# Data for table "ys_auth_group_rule"
#

INSERT INTO `ys_auth_group_rule` VALUES (1,'首页','[{\"route\":\"\\/admin\\/statistics\\/index_data\",\"value\":\"index_data\"}]'),(2,'调度管理','[{\"route\":\"\\/admin\\/plan\\/add_plan\",\"value\":\"add_plan\"},{\"route\":\"\\/admin\\/plan\\/del_plan\",\"value\":\"del_plan\"},{\"route\":\"\\/admin\\/plan\\/dd_car\",\"value\":\"dd_car\"},{\"route\":\"\\/admin\\/plan\\/add_bill\",\"value\":\"add_bill\"},{\"route\":\"\\/admin\\/plan\\/update_plan\",\"value\":\"update_plan\"},{\"route\":\"\\/admin\\/plan\\/update_wait_car\",\"value\":\"update_wait_car\"},{\"route\":\"\\/admin\\/plan\\/get_plan\",\"value\":\"get_plan\"}]'),(3,'车辆管理','[{\"route\":\"\\/admin\\/car\\/add_car\",\"value\":\"add_car\"},{\"route\":\"\\/admin\\/car\\/get_all_car\",\"value\":\"get_all_car\"},{\"route\":\"\\/admin\\/car\\/update_car\",\"value\":\"update_car\"},{\"route\":\"\\/admin\\/car\\/del_car\",\"value\":\"del_car\"},{\"route\":\"\\/admin\\/car\\/bind_equip\",\"value\":\"bind_equip\"},{\"route\":\"\\/admin\\/equip\\/get_type\",\"value\":\"get_type\"},{\"route\":\"\\/admin\\/equip\\/del_equip\",\"value\":\"del_equip\"},{\"route\":\"\\/admin\\/equip\\/up_equip\",\"value\":\"up_equip\"},{\"route\":\"\\/admin\\/equip\\/add_equip\",\"value\":\"add_equip\"}]'),(4,'车辆维修','[{\"route\":\"\\/admin\\/car_repaire\\/add_repaire\",\"value\":\"add_repaire\"},{\"route\":\"\\/admin\\/car_repaire\\/update_repaire\",\"value\":\"update_repaire\"},{\"route\":\"\\/admin\\/car_repaire\\/get_repaire\",\"value\":\"get_repaire\"},{\"route\":\"\\/admin\\/car_repaire\\/del_repaire\",\"value\":\"\\/admin\\/car\\/del_repaire\"}]'),(5,'油站管理','[{\"route\":\"\\/admin\\/oil\\/add_oil\",\"value\":\"add_oil\"},{\"route\":\"\\/admin\\/oil\\/get_oil\",\"value\":\"get_oil\"},{\"route\":\"\\/admin\\/oil\\/add_car_oil\",\"value\":\"add_car_oil\"},{\"route\":\"\\/admin\\/oil\\/update_car_oil\",\"value\":\"update_car_oil\"},{\"route\":\"\\/admin\\/oil\\/add_sale\",\"value\":\"add_sale\"},{\"route\":\"\\/admin\\/oil\\/get_sale\",\"value\":\"get_sale\"},{\"route\":\"\\/admin\\/oil\\/update_sale\",\"value\":\"update_sale\"},{\"route\":\"\\/admin\\/oil\\/del_sale\",\"value\":\"del_sale\"},{\"route\":\"\\/admin\\/oil\\/del_car_oil\",\"value\":\"del_car_oil\"},{\"route\":\"\\/admin\\/oil\\/get_car_oil\",\"value\":\"get_car_oil\"},{\"route\":\"\\/admin\\/oil\\/get_oil_appli\",\"value\":\"get_oil_appli\"}]'),(6,'库存管理','[{\"route\":\"\\/admin\\/parts\\/add_type\",\"value\":\"add_type\"},{\"route\":\"\\/admin\\/parts\\/enter_parts\",\"value\":\"enter_parts\"},{\"route\":\"\\/admin\\/parts\\/out_parts\",\"value\":\"out_parts\"},{\"route\":\"\\/admin\\/parts\\/del_parts\",\"value\":\"del_parts\"},{\"route\":\"\\/\\/admin\\/parts\\/del_parts_record\",\"value\":\"del_parts_record\"},{\"route\":\"\\/admin\\/parts\\/get_parts\",\"value\":\"get_parts\"},{\"route\":\"\\/admin\\/parts\\/get_parts_record\",\"value\":\"get_parts_record\"}]'),(7,'用户管理','[{\"route\":\"\\/admin\\/user\\/update_user\",\"value\":\"update_user\"},{\"route\":\"\\/admin\\/user\\/add_user\",\"value\":\"add_user\"},{\"route\":\"\\/admin\\/user\\/del_user\",\"value\":\"del_user\"},{\"route\":\"\\/admin\\/user\\/get_user\",\"value\":\"get_user\"},{\"route\":\"\\/admin\\/auth\\/group\\/get_group\",\"value\":\"get_group\"},{\"route\":\"\\/admin\\/auth\\/rule\\/get_rule\",\"value\":\"get_rule\"},{\"route\":\"\\/admin\\/auth\\/group\\/add_group\",\"value\":\"add_group\"},{\"route\":\"\\/admin\\/auth\\/group\\/update_group\",\"value\":\"update_group\"},{\"route\":\"\\/admin\\/auth\\/group\\/del_group\",\"value\":\"del_group\"}]'),(8,'财务统计',NULL),(9,'新闻/通知',NULL),(10,'系统设置',NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "ys_auth_rule"
#

/*!40000 ALTER TABLE `ys_auth_rule` DISABLE KEYS */;
INSERT INTO `ys_auth_rule` VALUES (3,NULL,'',1,1,'','',0),(5,NULL,'',1,1,'','',0);
/*!40000 ALTER TABLE `ys_auth_rule` ENABLE KEYS */;

#
# Structure for table "ys_banner"
#

DROP TABLE IF EXISTS `ys_banner`;
CREATE TABLE `ys_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='广告图';

#
# Data for table "ys_banner"
#

INSERT INTO `ys_banner` VALUES (6,NULL,'/uploads/img/20210201/5027ff1c1cab1ee2775f5080b40555bd.jpg',1609294848,1612169551,1),(7,NULL,'/uploads/img/20210201/edb11fedbda5c61e3f641f9876dec532.jpg',1609294853,1612169563,1),(8,NULL,'/uploads/img/20210201/fb36eb1b2ec9d47db839d0ef6a86d999.jpg',1612169570,1612169570,1);

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
  `position` varchar(255) DEFAULT NULL COMMENT '定位',
  `tid` varchar(255) DEFAULT NULL COMMENT '终端id',
  `drive_name` varchar(255) DEFAULT NULL COMMENT '司机名字',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '开户行',
  `fleet` varchar(255) DEFAULT NULL COMMENT '所属车队',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `oil_card` varchar(255) DEFAULT NULL COMMENT '油卡卡号',
  `bank_num` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `model` varchar(255) DEFAULT NULL COMMENT '车型',
  `height` varchar(255) DEFAULT NULL COMMENT '栏高',
  `card_img` text COMMENT '证件照',
  `bank_user` varchar(255) DEFAULT NULL COMMENT '户名',
  `operator` int(11) DEFAULT NULL COMMENT '操作员',
  `jyje` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='车辆信息';

#
# Data for table "ys_car"
#

INSERT INTO `ys_car` VALUES (12,'45416546456',0,0,0,1,0,1606727246,1610605355,0,0,'','[105.331352,25.232589]',NULL,'王司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','王机司',NULL,0),(14,'贵EE1325',0,0,0,1,1,1606727246,1610419286,0,0,'','[110.422804,31.030918]',NULL,'小司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','小司机',NULL,0),(18,'贵CD6666',0,0,0,1,1,1606727246,1610351077,0,1,'A79811651','[104.333299,26.32781]',NULL,'杨司机','522315346985485126','建设银行','车队队','13312341238','3612541254879652412','3651254785469521459','200轴','高高栏','[{\"id\":\"113\",\"url\":\"\\/uploads\\/img\\/20201130\\/a196db2b24be5e2a801d6856326aa744.jpg\"},{\"id\":\"114\",\"url\":\"\\/uploads\\/img\\/20201130\\/12827685fe864008fd8aad8e7e8e99b5.jpg\"},{\"id\":\"115\",\"url\":\"\\/uploads\\/img\\/20201130\\/459bd914465990071f669b1827ea92b0.jpg\"}]','王',1,1100),(19,'贵F-886886',0,0,0,1,0,1606727246,1610605352,0,0,NULL,'[113.338775,32.710766]',NULL,'龙司机','522401199919991999','中国银行','兴义通','19815350806','1525253636','52666216516','大型车','2323','[{\"id\":\"118\",\"url\":\"\\/uploads\\/img\\/20201130\\/2d6370df486bfcc43478a20ddf5cad03.png\"}]','老王',1,5000),(21,'贵E-99666',0,0,0,1,1,1606727246,1609731494,0,0,'','[85.439275,42.85855]','','李司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','王机司',NULL,3000),(22,'贵E-99667',0,0,0,1,1,1606727246,1610419180,0,0,'','[123.816036,45.136659]','','公司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','小司机',NULL,5000),(23,'贵E-99668',0,0,0,1,1,1606727246,1610419864,0,1,'A79811651','[78.195339,43.965031]','','马司机','522315346985485126','建设银行','车队队','13312341238','3612541254879652412','3651254785469521459','200轴','高高栏','[{\"id\":\"113\",\"url\":\"\\/uploads\\/img\\/20201130\\/a196db2b24be5e2a801d6856326aa744.jpg\"},{\"id\":\"114\",\"url\":\"\\/uploads\\/img\\/20201130\\/12827685fe864008fd8aad8e7e8e99b5.jpg\"},{\"id\":\"115\",\"url\":\"\\/uploads\\/img\\/20201130\\/459bd914465990071f669b1827ea92b0.jpg\"}]','王',1,1000),(24,'贵E-99669',0,0,0,1,1,1606727246,1610586493,0,0,'','[71.196318,44.610928]','','潘司机','522401199919991999','中国银行','兴义通','13512341234','1525253636','52666216516','大型车','2323','[{\"id\":\"118\",\"url\":\"\\/uploads\\/img\\/20201130\\/2d6370df486bfcc43478a20ddf5cad03.png\"}]','老王',1,0),(26,'贵E-996601',0,0,0,1,1,1606727246,1608800047,0,0,'','[102.774128,24.448767]','','张司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','王机司',NULL,0),(27,'贵E-996602',0,0,0,1,1,1606727246,1610422331,0,0,'','[106.462786,27.339774]','','肖司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','小司机',NULL,3200),(28,'贵E-996603',0,0,0,1,1,1606727246,1608799808,0,1,'A79811651','[108.826838,28.418757]','','吴司机','522315346985485126','建设银行','车队队','13312341238','3612541254879652412','3651254785469521459','200轴','高高栏','[{\"id\":\"113\",\"url\":\"\\/uploads\\/img\\/20201130\\/a196db2b24be5e2a801d6856326aa744.jpg\"},{\"id\":\"114\",\"url\":\"\\/uploads\\/img\\/20201130\\/12827685fe864008fd8aad8e7e8e99b5.jpg\"},{\"id\":\"115\",\"url\":\"\\/uploads\\/img\\/20201130\\/459bd914465990071f669b1827ea92b0.jpg\"}]','王',1,0),(29,'贵E-996604',0,0,0,1,1,1606727246,1610422235,0,0,'','[109.328165,30.459836]','','卢王','522401199919991999','中国银行','兴义通','13512341234','1525253636','52666216516','大型车','2323','[{\"id\":\"118\",\"url\":\"\\/uploads\\/img\\/20201130\\/2d6370df486bfcc43478a20ddf5cad03.png\"}]','老王',1,0),(30,'贵E-996605',0,0,0,1,1,1606813197,1610419405,0,0,'','[102.48897,31.977689]','','路司机','111111','111111','1111111','111111111111','11111','1111111','111111','11111','[{\"url\":\"\\/uploads\\/img\\/20201201\\/d979a34a5d4c87ad0ee1ac4d991a9c0a.jpg\",\"id\":\"234\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/8f929eb6f675fc1b5496462dc5ea573d.jpg\",\"id\":\"235\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/c3cabf875c60e786638f5f57d6ca235a.jpg\",\"id\":\"236\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/0aee75f795043900d8d4f7e0e7a2d0e4.jpg\",\"id\":\"237\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/64a9c6d1341a99318951b7890ea0e589.jpg\",\"create_time\":\"2020-12-01\",\"update_time\":\"2020-12-01 17:00:51\",\"id\":\"240\"}]','1111',1,0),(31,'贵EE9966',0,0,0,1,1,2020,1612173288,0,0,'','[93.032759,36.683744]','','哭司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','王机司',NULL,8700),(32,'贵E-996607',0,0,0,1,1,1606727246,1610419191,0,0,'','[80.97793,33.200333]','','笑司机','522328165474136521','建设银行','贵阳车队','13512341234','6254784125496352148','6485463251254789651','4轴','高栏','[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}]','小司机',NULL,0),(33,'贵E-996608',0,0,0,1,1,1606727246,1608800237,0,1,'A79811651','[79.340571,14.473862]','','东司机','522315346985485126','建设银行','车队队','13312341238','3612541254879652412','3651254785469521459','200轴','高高栏','[{\"id\":\"113\",\"url\":\"\\/uploads\\/img\\/20201130\\/a196db2b24be5e2a801d6856326aa744.jpg\"},{\"id\":\"114\",\"url\":\"\\/uploads\\/img\\/20201130\\/12827685fe864008fd8aad8e7e8e99b5.jpg\"},{\"id\":\"115\",\"url\":\"\\/uploads\\/img\\/20201130\\/459bd914465990071f669b1827ea92b0.jpg\"}]','王',1,0),(34,'贵E-996609',0,0,0,1,1,1606727246,1610422301,0,0,'','[76.599374,18.791802]','','男司机','522401199919991999','中国银行','兴义通','13512341234','1525253636','52666216516','大型车','2323','[{\"id\":\"118\",\"url\":\"\\/uploads\\/img\\/20201130\\/2d6370df486bfcc43478a20ddf5cad03.png\"}]','老王',1,246),(35,'贵E-99fdf',0,0,0,1,1,1606813197,1610605223,0,0,'','[101.481718,28.137801]','','女司机','111111','111111','1111111','111111111111','11111','1111111','111111','11111','[{\"url\":\"\\/uploads\\/img\\/20201201\\/d979a34a5d4c87ad0ee1ac4d991a9c0a.jpg\",\"id\":\"234\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/8f929eb6f675fc1b5496462dc5ea573d.jpg\",\"id\":\"235\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/c3cabf875c60e786638f5f57d6ca235a.jpg\",\"id\":\"236\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/0aee75f795043900d8d4f7e0e7a2d0e4.jpg\",\"id\":\"237\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/64a9c6d1341a99318951b7890ea0e589.jpg\",\"create_time\":\"2020-12-01\",\"update_time\":\"2020-12-01 17:00:51\",\"id\":\"240\"}]','1111',1,0),(36,'贵E-9999999',0,0,0,1,0,1606886922,1610605357,0,0,NULL,'[113.016823,33.832179]',NULL,'老徐','522401199919991999','中国银行','兴义通11','18076175333','52563966622','52525252525252','1','1','[{\"id\":\"244\",\"url\":\"\\/uploads\\/img\\/20201202\\/e671ca2867339a078c7a3d54e76842fe.png\"},{\"id\":\"245\",\"url\":\"\\/uploads\\/img\\/20201202\\/d7bff970f389431529cc44c190f13c36.png\"},{\"id\":\"246\",\"url\":\"\\/uploads\\/img\\/20201202\\/558cc88bbd4eebfa21157a45d65c8ba7.png\"}]','徐',1,4833),(37,'1312312',0,0,0,1,1,2020,1610586474,0,0,NULL,'null',NULL,'2312','231','23','31','18788778419','12','321','12','3','[{\"id\":\"253\",\"url\":\"\\/uploads\\/img\\/20201204\\/67e36892ab95f119977d7e5874c37ebd.jpg\"},{\"id\":\"252\",\"url\":\"\\/uploads\\/img\\/20201204\\/4c0b89b84aa88bf6d0ba320177e00bb1.jpg\"},{\"id\":\"254\",\"url\":\"\\/uploads\\/img\\/20201204\\/750d5ec644f34b0470a85206441eb1ac.jpg\"}]','321',1,678),(38,'4444',0,0,0,1,1,1607060081,1609813811,0,0,NULL,NULL,NULL,'dqaweq','1231','2312','23','18788778419','312','231','31223','123','[{\"id\":\"255\",\"url\":\"\\/uploads\\/img\\/20201204\\/92449702606c1492f636945e81bb76ce.jpg\"},{\"id\":\"256\",\"url\":\"\\/uploads\\/img\\/20201204\\/92449702606c1492f636945e81bb76ce.jpg\"}]','31',1,123),(39,'贵EE8888',0,0,0,1,1,1607066288,1610422258,0,0,NULL,'null',NULL,'王司机','123456','123456','测试车队','13512341234','123456','123456','8轴','15M','[{\"url\":\"\\/uploads\\/img\\/20201204\\/5416ccd2041f46a8cb3ed3fe6faec160.jpg\",\"id\":\"258\"},{\"url\":\"\\/uploads\\/img\\/20201204\\/b99ba13a12867c21dd0576edc4d3f855.jpg\",\"id\":\"259\"},{\"url\":\"\\/uploads\\/img\\/20201204\\/339f47eea5e11651028a0ff78c6dff13.jpg\",\"id\":\"260\"},{\"url\":\"\\/uploads\\/img\\/20201208\\/33c2eb212c3c6edf88c1297fb40958db.jpg\",\"create_time\":\"2020-12-08\",\"update_time\":\"2020-12-08 13:49:27\",\"id\":\"271\"},{\"url\":\"\\/uploads\\/img\\/20201208\\/ac25729bc3db7c2ffb2b619564d14012.jpg\",\"create_time\":\"2020-12-08\",\"update_time\":\"2020-12-08 13:49:27\",\"id\":\"272\"}]','123456',1,8888),(47,'1',0,0,0,1,1,1607476220,1610345609,0,0,NULL,NULL,NULL,'1','1','1','1','18208641351','1','1','1','1','[{\"url\":\"\\/uploads\\/img\\/20201209\\/d09f0f41bdcd91dbe62d088cc8dc40de.jpg\",\"id\":\"304\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ae61fdc57ada8c014aafbbae5d2ab8a2.jpg\",\"id\":\"306\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/050012492efb36f145d10ce670a1dcfd.jpg\",\"id\":\"305\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/f4e88f57fb013ce585a0f54af2a6a750.jpg\",\"id\":\"307\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/05a3c8387d89eed7af627c2abc28dfdd.jpg\",\"id\":\"308\"}]','11',1,6666),(48,'2',0,0,0,1,1,1607476239,1610516923,0,0,NULL,NULL,NULL,'2','2','2','2','18208641351','2','2','2','2','[{\"url\":\"\\/uploads\\/img\\/20201209\\/f37a9ea307b5084575fdd79be86e69b9.jpg\",\"id\":\"309\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/69b9a706542123c3cb3ce6825bc698e5.jpg\",\"id\":\"310\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/b459f0d5b07433e16db89149feb0dd1a.jpg\",\"id\":\"311\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/c9a0204ed1bf5f748b9c5e8bb419786a.jpg\",\"id\":\"312\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/33787390283b61dd735078c57e3e340f.jpg\",\"id\":\"313\"}]','2',1,4000),(49,'3',0,0,0,1,1,1607476919,1610605202,0,0,NULL,NULL,NULL,'3','3','3','3','18208641351','3','3','3','3','[{\"url\":\"\\/uploads\\/img\\/20201209\\/0b2a6c8ff252a86e2fccc7e186abd16a.jpg\",\"id\":\"314\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/047fef5b3f550ef7c357488d1862d60f.jpg\",\"id\":\"317\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/b6d9186d901772becb222a66a44a588c.jpg\",\"id\":\"315\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ebfe52ec72f6819f64487544084c7dd2.jpg\",\"id\":\"316\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/e445523046a6acaaf38187c7f222140e.jpg\",\"id\":\"318\"}]','3',1,20),(50,'4',0,0,0,1,1,1607476939,1609728832,0,0,NULL,NULL,NULL,'4','4','4','4','18208641351','4','4','4','4','[{\"url\":\"\\/uploads\\/img\\/20201209\\/1badf527f42696e177a406c4d0d0db84.jpg\",\"id\":\"319\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/0c4ffc2f978e3c4ec9e984903d66b384.jpg\",\"id\":\"320\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/5c79bc0a912277dc275bf62aec788053.jpg\",\"id\":\"321\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/dac21745d0741196db79deb2a96dae78.jpg\",\"id\":\"322\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/297ad8af1d4aeb7d8b48865c0f42eb8e.jpg\",\"id\":\"323\"}]','44',1,0),(51,'12',0,0,0,1,0,1607481593,1608016665,0,0,NULL,NULL,NULL,'123',NULL,NULL,'123','3123',NULL,NULL,'3123','12','[]',NULL,1,0),(52,'998998',0,0,0,1,1,1607482718,1610605388,0,0,NULL,NULL,NULL,'王司机','522422199919991999','5151','神风扫荡队','18208641351','1515151515','1515','小型','15','[{\"id\":\"324\",\"url\":\"\\/uploads\\/img\\/20201209\\/e648caadbdcfcff1d0856ebb448c63e4.png\"}]','1515',1,5000),(53,'贵EE7654',0,0,0,1,1,1607482719,1612173316,0,0,NULL,'null',NULL,'王司机',NULL,NULL,'合单车','13512341234',NULL,NULL,'合单车','合单车','[]',NULL,1,5688),(55,'9',0,0,0,1,0,1607493899,1607996163,0,0,NULL,NULL,NULL,'9','9999','','9','99','','','9','9','[{\"url\":\"\\/uploads\\/img\\/20201209\\/21cfa9f23df8564b55b1f99937a5b10d.jpg\",\"id\":\"325\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ce8241b294bfea649406d3dff71f4b14.jpg\",\"id\":\"326\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/21cfa9f23df8564b55b1f99937a5b10d.jpg\",\"id\":\"325\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ce8241b294bfea649406d3dff71f4b14.jpg\",\"id\":\"326\"}]','',1,0),(56,'GH1512151',0,0,0,1,1,1608085170,1608886864,0,1,'',NULL,NULL,'徐徐',NULL,NULL,NULL,'18788778419',NULL,NULL,'15','15','[]',NULL,1,0),(58,'152151515',0,0,0,1,1,1608087489,1608886286,0,0,NULL,NULL,NULL,'斗先生',NULL,NULL,NULL,'18208641351',NULL,NULL,NULL,NULL,'[]',NULL,2,200),(61,'gjcs111',0,0,0,1,1,1608171139,1608885804,0,1,'8019217669','[113.016823,33.832179]',NULL,'轨迹测试老司机',NULL,NULL,NULL,'18076175333',NULL,NULL,NULL,NULL,'[]',NULL,1,0),(62,'yunshu',0,0,0,1,1,1608259073,1610415189,0,0,NULL,'null',NULL,'司机',NULL,NULL,'合单车1','18523636565',NULL,NULL,NULL,NULL,'[]',NULL,1,0);

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
  `content` mediumtext NOT NULL COMMENT '说明',
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
  `massege` text COMMENT '备注',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT '加油员',
  `syyk` float NOT NULL DEFAULT '0' COMMENT '剩余油卡',
  `syyl` float NOT NULL DEFAULT '0' COMMENT '剩余域',
  `syye` float NOT NULL DEFAULT '0' COMMENT '剩余余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='加油表';

#
# Data for table "ys_car_oil"
#

INSERT INTO `ys_car_oil` VALUES (1,62,0,787.4,0,6.35,5000,0,1612173232,1612173232,'车辆加油',1,0,9812.6,0),(2,14,0,29,0,6.89,200,0,1612173263,1612173263,'加油',1,0,9783.6,0),(3,31,0,38,0,7.89,300,0,1612173288,1612173288,'车辆加油',1,0,9745.6,8700),(4,53,0,52.8,0,5.68,300,0,1612173316,1612173316,'车辆加油',1,0,9692.8,5688);

#
# Structure for table "ys_car_repair"
#

DROP TABLE IF EXISTS `ys_car_repair`;
CREATE TABLE `ys_car_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json` text COMMENT '数据',
  `kd_user` int(11) NOT NULL DEFAULT '0' COMMENT '开单员',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='维修开单';

#
# Data for table "ys_car_repair"
#

INSERT INTO `ys_car_repair` VALUES (1,'{\"lpj_total\":0,\"gsf_total\":123,\"in_time\":\"2021-01-15\",\"out_time\":\"2021-01-17\",\"car_num\":\"12312312\",\"dirver\":\"123123\",\"tel\":\"123\",\"question_des\":\"1231231\",\"msg\":\"3123123\",\"goods\":[{\"lpj\":\"\",\"sku\":\"\",\"num\":\"3123123\",\"uni_price\":\"\",\"uni_total\":0,\"wx\":\"123\",\"gs_money\":\"123\"}],\"total_money\":123,\"kd_user\":null}',1,1610682550,1610682550),(2,'{\"lpj_total\":0,\"gsf_total\":3213,\"in_time\":\"2021-01-14\",\"out_time\":\"2021-01-12\",\"car_num\":\"sdas\",\"dirver\":\"dsds\",\"tel\":\"sddddd\",\"question_des\":\"sdsssssssssss\",\"msg\":\"dqqqdwqweqwe\",\"goods\":[{\"lpj\":\"\",\"sku\":\"\",\"num\":\"123\",\"uni_price\":\"\",\"uni_total\":0,\"wx\":\"2312\",\"gs_money\":\"3213\"}],\"total_money\":3213,\"kd_user\":null}',1,1610682585,1610682585),(3,'{\"lpj_total\":0,\"gsf_total\":123,\"in_time\":\"2021-01-15\",\"out_time\":\"2021-01-24\",\"car_num\":\"hrthrtjhr\",\"dirver\":\"fdzgDG\",\"tel\":\"132415646\",\"question_des\":\"sadsfdfdgf\",\"msg\":\"jghjghh\",\"goods\":[{\"lpj\":\"\",\"sku\":\"\",\"num\":\"123\",\"uni_price\":\"\",\"uni_total\":0,\"wx\":\"123\",\"gs_money\":\"123\"}],\"total_money\":123,\"kd_user\":null}',1,1610682632,1610682632),(4,'{\"lpj_total\":0,\"gsf_total\":11111,\"car_num\":\"111111111111111\",\"dirver\":\"11111111111\",\"tel\":\"111111111\",\"question_des\":\"1111111111111\",\"msg\":\"1111111111111111\",\"goods\":[{\"lpj\":\"\",\"sku\":\"\",\"num\":\"111111\",\"uni_price\":\"\",\"uni_total\":0,\"wx\":\"111\",\"gs_money\":\"11111\"}],\"total_money\":11111,\"kd_user\":null}',1,1610682649,1610682649),(5,'{\"lpj_total\":0,\"gsf_total\":2222222,\"in_time\":\"2021-01-16\",\"out_time\":\"2021-01-22\",\"car_num\":\"2222222222\",\"dirver\":\"22222222\",\"tel\":\"222222222\",\"question_des\":\"222222\",\"msg\":\"22222222\",\"goods\":[{\"lpj\":\"\",\"sku\":\"\",\"num\":\"2222222\",\"uni_price\":\"\",\"uni_total\":0,\"wx\":\"2222\",\"gs_money\":\"2222222\"}],\"total_money\":2222222,\"kd_user\":null}',1,1610682673,1610682673);

#
# Structure for table "ys_cw"
#

DROP TABLE IF EXISTS `ys_cw`;
CREATE TABLE `ys_cw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_num` int(11) NOT NULL DEFAULT '0' COMMENT '今日装车数',
  `weight` float NOT NULL DEFAULT '0' COMMENT '装运总吨数',
  `yun_fee` float NOT NULL DEFAULT '0' COMMENT '运费合计',
  `xx_fee` float NOT NULL DEFAULT '0' COMMENT '收取信息费用',
  `car_fee` float NOT NULL DEFAULT '0' COMMENT '车辆加油金额合计',
  `oil` float NOT NULL DEFAULT '0' COMMENT '车辆加油量',
  `oil_fee` float NOT NULL DEFAULT '0' COMMENT '车辆加油金额合计',
  `sale_oil` float NOT NULL DEFAULT '0' COMMENT '销售油合计',
  `oil_stock` float NOT NULL DEFAULT '0' COMMENT '油库存量',
  `oil_stock_fee` float NOT NULL DEFAULT '0' COMMENT '油库费用',
  `repair_fee` float NOT NULL DEFAULT '0' COMMENT '修理费合计',
  `gs_fee` float NOT NULL DEFAULT '0' COMMENT '工时费合计',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务统计';

#
# Data for table "ys_cw"
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
# Structure for table "ys_equip"
#

DROP TABLE IF EXISTS `ys_equip`;
CREATE TABLE `ys_equip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `num` varchar(255) DEFAULT NULL COMMENT '设备编号',
  `bind_car` int(11) NOT NULL DEFAULT '0' COMMENT '绑定车辆',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) DEFAULT NULL COMMENT '操作员',
  `tid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='设备表';

#
# Data for table "ys_equip"
#

INSERT INTO `ys_equip` VALUES (3,NULL,'A79811651',18,1605510705,1606729735,1,0),(4,NULL,'B1445',0,1606466900,1606719777,9,0),(6,NULL,'123',0,1606720286,1606729710,1,0),(7,NULL,'11123546',0,1607317654,1607317654,1,0),(11,NULL,'8019217669',61,1608170101,1608171153,1,324645211);

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
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8 COMMENT='图片库';

#
# Data for table "ys_imgs"
#

INSERT INTO `ys_imgs` VALUES (354,'/uploads/img/20201230/70cddb0652217d9737dd381716a136c3.jpg',1609294847,1609294847),(355,'/uploads/img/20201230/f42ec1a7ab042cd3ca52ddee3a39862b.jpg',1609294852,1609294852),(356,'/uploads/img/20210111/857561034411bd11d6a5c4761b64ee21.jpg',1610350951,1610350951),(357,'/uploads/img/20210201/5027ff1c1cab1ee2775f5080b40555bd.jpg',1612169548,1612169548),(358,'/uploads/img/20210201/edb11fedbda5c61e3f641f9876dec532.jpg',1612169562,1612169562),(359,'/uploads/img/20210201/fb36eb1b2ec9d47db839d0ef6a86d999.jpg',1612169568,1612169568);

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
  `type` varchar(255) DEFAULT NULL COMMENT '类型（下单、发货、运输、取件、完成）',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能权限表';

#
# Data for table "ys_nav"
#


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
# Structure for table "ys_notice"
#

DROP TABLE IF EXISTS `ys_notice`;
CREATE TABLE `ys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT '操作者',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

#
# Data for table "ys_notice"
#

INSERT INTO `ys_notice` VALUES (7,NULL,'今年春节平台承运物流商休假正在陆续公布中，根据小编目前收集到的消息，物流商放假基本只有3-5天的空档，卖家出单发货仍然可以正常进行。',0,1,1609294825,1612169615),(8,NULL,'受疫情对全球的影响，部分国家和地区的专线出现时效延迟或临时关闭服务的情况。为保障您的货物信息准确，平台将严密关注疫情对物流的影响，根据具体情况迅速调整并第一时间通知商家伙伴，大家携手共渡难关。',0,1,1609294832,1612169694);

#
# Structure for table "ys_oil"
#

DROP TABLE IF EXISTS `ys_oil`;
CREATE TABLE `ys_oil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock` float NOT NULL DEFAULT '0' COMMENT '油库存/吨',
  `use` float NOT NULL DEFAULT '0' COMMENT '使用量',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  `total_price` float NOT NULL DEFAULT '0' COMMENT '总价',
  `content` varchar(255) DEFAULT NULL COMMENT '备注',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型0进库1出库',
  `trans` float NOT NULL DEFAULT '0' COMMENT '转换为升',
  `recive` varchar(255) DEFAULT NULL COMMENT '接收方',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT '操作员',
  `trans_car` varchar(255) DEFAULT NULL COMMENT '运输车辆',
  `car_name` varchar(255) DEFAULT NULL COMMENT '司机名称',
  `mobile` varchar(255) DEFAULT NULL COMMENT '司机联系电话',
  `num` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='油库存';

#
# Data for table "ys_oil"
#

INSERT INTO `ys_oil` VALUES (1,5000,0,1612172907,1612172907,0,0,'油量入库',0,0,NULL,1,'京A6666','王司机','13512341234',5000),(2,7000,0,1612172951,1612172951,0,0,'入库',0,0,NULL,1,'川C3364','李司机','13612341234',2000),(3,9692.8,0,1612173009,1612173316,0,0,'入库',0,0,NULL,1,'渝A8888','张司机','13812341234',3600);

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
  `car_num` varchar(255) DEFAULT NULL COMMENT '运输车辆',
  `car_name` varchar(255) DEFAULT NULL COMMENT '司机姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '司机电话',
  `density` float NOT NULL DEFAULT '0' COMMENT '密度',
  `massege` varchar(255) DEFAULT NULL COMMENT '备注',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT '操作员',
  `syyk` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='油类申购表';

#
# Data for table "ys_oil_appli"
#

INSERT INTO `ys_oil_appli` VALUES (1,5000,0,0,0,1612172907,1612172907,'京A6666','王司机','13512341234',3.6,'油量入库',1,0),(2,2000,0,0,0,1612172951,1612172951,'川C3364','李司机','13612341234',6.24,'入库',1,0),(3,3600,0,0,0,1612173009,1612173009,'渝A8888','张司机','13812341234',6.15,'入库',1,0);

#
# Structure for table "ys_oil_sale"
#

DROP TABLE IF EXISTS `ys_oil_sale`;
CREATE TABLE `ys_oil_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `num` float NOT NULL DEFAULT '0' COMMENT '数量',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  `total` float NOT NULL DEFAULT '0' COMMENT '合计金额',
  `massege` text COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT '销售员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='销售表';

#
# Data for table "ys_oil_sale"
#

INSERT INTO `ys_oil_sale` VALUES (1,'北极某某公司',2000,6.25,12500,'售油',1612229240,1612229240,1),(2,'陕西某矿',5000,6.55,32750,'出售',1612229282,1612229282,1),(3,'江苏某厂',3750,7.03,26362.5,'出售',1612229320,1612229320,1);

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
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车场所';

#
# Data for table "ys_park"
#


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
  `department` int(11) NOT NULL DEFAULT '0' COMMENT '部门0办公室1维修部',
  `num` varchar(255) DEFAULT NULL COMMENT '编号',
  `massege` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='零配件表';

#
# Data for table "ys_parts"
#


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='零配件申购表';

#
# Data for table "ys_parts_appli"
#


#
# Structure for table "ys_parts_record"
#

DROP TABLE IF EXISTS `ys_parts_record`;
CREATE TABLE `ys_parts_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '物品名称',
  `use_car` varchar(255) DEFAULT NULL COMMENT '使用车辆',
  `type` varchar(255) DEFAULT NULL COMMENT '记录类型',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `content` varchar(255) DEFAULT NULL COMMENT '备注',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT '操作员',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `user` varchar(255) DEFAULT NULL COMMENT '领用人',
  `department` int(11) NOT NULL DEFAULT '0' COMMENT '部门',
  `msg` varchar(255) DEFAULT NULL COMMENT '备注',
  `model` varchar(255) DEFAULT NULL COMMENT '规格',
  `price` float NOT NULL DEFAULT '0' COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出入库记录';

#
# Data for table "ys_parts_record"
#


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
  `start` varchar(255) DEFAULT NULL COMMENT '运输起点',
  `end` varchar(255) DEFAULT NULL COMMENT '运输终点',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '交易状态0待派车1待装运（已调度未开单） 2运输中 3已完成',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `trial` int(11) NOT NULL DEFAULT '0' COMMENT '财务审核状态（0未打款1已打款）',
  `start_jw` text COMMENT '运输起点经纬度',
  `end_jw` text COMMENT '运输终点经纬度',
  `sign_img` text COMMENT '签收图片',
  `is_sign` int(11) NOT NULL DEFAULT '0' COMMENT '是否签收',
  `car_id` int(11) NOT NULL DEFAULT '0',
  `courier_num` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `way` int(11) NOT NULL DEFAULT '0' COMMENT '运输方式',
  `trid` varchar(255) DEFAULT NULL COMMENT '运输轨迹',
  `record_user` int(11) DEFAULT '0' COMMENT '计划录入员',
  `dd_user` varchar(255) DEFAULT NULL COMMENT '调度员',
  `fh_user` varchar(255) DEFAULT NULL COMMENT '发货人',
  `fh_mobile` varchar(255) DEFAULT NULL,
  `sh_address` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '件数',
  `volume` float NOT NULL DEFAULT '0' COMMENT '体积',
  `trans_price` float NOT NULL DEFAULT '0' COMMENT '运输价(元/吨)',
  `total_price` float NOT NULL DEFAULT '0' COMMENT '运费合计',
  `json` text COMMENT '订单数据',
  `dd_json` text COMMENT '车辆调度数据',
  `bill_user` int(11) NOT NULL DEFAULT '0' COMMENT '开单人',
  `car_num` int(11) NOT NULL DEFAULT '0' COMMENT '计划车数',
  `massege` text COMMENT '备注',
  `sign_car` text COMMENT '签收车牌',
  `type` int(11) NOT NULL DEFAULT '1',
  `is_pay` int(11) NOT NULL DEFAULT '0' COMMENT '是否打款',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '打款时间',
  `pay_user` int(11) NOT NULL DEFAULT '0' COMMENT '打款人',
  `tid` int(11) NOT NULL DEFAULT '0',
  `main_id` int(11) NOT NULL DEFAULT '0' COMMENT '主单id',
  `dd_time` int(11) NOT NULL DEFAULT '0' COMMENT '调度时间',
  `sign_time` int(11) NOT NULL DEFAULT '0',
  `kd_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COMMENT='计划表';

#
# Data for table "ys_plan"
#

INSERT INTO `ys_plan` VALUES (220,'202012244021',NULL,NULL,NULL,50,'兴义','安龙',2,1608800895,1608801636,0,NULL,NULL,NULL,0,31,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,26199,'{\"send_name\":\"12\",\"send_tel\":\"31\",\"send_address\":\"231\",\"received_name\":\"123\",\"received_address\":\"1231\",\"received_tel\":\"1321\",\"dj_msg\":\"12312312\",\"goods\":[{\"name\":\"12\",\"num\":\"3123\",\"weight\":\"213\",\"unit_price\":\"123\",\"yf\":26199}],\"create_time\":\"2020-12-24 17:15:53\"}','{\"jy_money\":\"3200\",\"yk_money\":\"\",\"type\":0,\"num\":1,\"plan_type\":1,\"yz_num\":\"50\",\"car\":\"31\",\"car_info\":{\"id\":31,\"car_num\":\"\\u8d35EE9966\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"1970-01-01\",\"update_time\":\"2020-12-24 16:40:00\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[93.032759,36.683744],\"tid\":\"\",\"drive_name\":\"\\u54ed\\u53f8\\u673a\",\"id_card\":\"522328165474136521\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8d35\\u9633\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"6254784125496352148\",\"bank_num\":\"6485463251254789651\",\"model\":\"4\\u8f74\",\"height\":\"\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}],\"bank_user\":\"\\u738b\\u673a\\u53f8\",\"operator\":null,\"jyje\":9000},\"weight\":50,\"dd_time\":\"2020-12-24 17:12:36\",\"msg_money\":\"5000\"}',1,1,'大苏打',NULL,1,0,0,0,0,0,0,0,1608798851),(221,NULL,NULL,NULL,NULL,122,'12','3123',0,1608885373,1608885385,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,'123123',NULL,2,0,0,0,0,0,0,0,0),(222,'202012252766',NULL,NULL,NULL,1,'12','3123',1,1608885385,1610415189,0,NULL,NULL,'null',0,62,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,'null','{\"jy_money\":\"312\",\"yk_money\":\"\",\"type\":1,\"num\":1,\"plan_type\":2,\"car\":62,\"msg_money\":\"123\",\"msg\":\"312\",\"car_info\":{\"id\":62,\"car_num\":\"yunshu\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-12-18\",\"update_time\":\"2021-01-12 09:33:09\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"\\u53f8\\u673a\",\"id_card\":null,\"bank_name\":null,\"fleet\":\"\\u5408\\u5355\\u8f661\",\"mobile\":\"18523636565\",\"oil_card\":null,\"bank_num\":null,\"model\":null,\"height\":null,\"card_img\":[],\"bank_user\":null,\"operator\":1,\"jyje\":0},\"weight\":122,\"dd_time\":\"2020-12-25 16:12:24\"}',0,0,'123123',NULL,2,0,0,0,0,221,0,0,0),(223,NULL,NULL,NULL,NULL,297,'342','4324',0,1608885760,1608886962,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,'432',NULL,2,0,0,0,0,0,0,0,0),(224,'202012251706',NULL,NULL,NULL,12,'342','4324',2,1608885779,1608885804,0,NULL,NULL,NULL,0,61,NULL,0,'340',1,'1',NULL,NULL,NULL,0,0,0,9672,'{\"send_name\":\"12\",\"send_tel\":\"31\",\"send_address\":\"23123\",\"received_name\":\"21\",\"received_tel\":\"312\",\"received_address\":\"3123\",\"dj_msg\":\"123321\",\"goods\":[{\"name\":\"123\",\"num\":\"12\",\"weight\":\"312\",\"unit_price\":\"31\",\"yf\":9672}],\"create_time\":\"2020-12-25 16:43:24\"}','{\"jy_money\":0,\"yk_money\":0,\"type\":1,\"plan_type\":2,\"num\":\"12\",\"car\":61,\"msg_money\":\"123\",\"car_info\":{\"id\":61,\"car_num\":\"gjcs111\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-17\",\"update_time\":\"2020-12-17 11:10:01\",\"oil\":0,\"is_bind\":1,\"equip_num\":\"8019217669\",\"position\":[113.016823,33.832179],\"tid\":null,\"drive_name\":\"\\u8f68\\u8ff9\\u6d4b\\u8bd5\\u8001\\u53f8\\u673a\",\"id_card\":null,\"bank_name\":null,\"fleet\":null,\"mobile\":\"18076175333\",\"oil_card\":null,\"bank_num\":null,\"model\":null,\"height\":null,\"card_img\":[],\"bank_user\":null,\"operator\":1,\"jyje\":0,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"}},\"weight\":420,\"dd_time\":\"2020-12-25 16:12:58\"}',1,0,'432',NULL,2,0,0,0,324645211,223,1608885778,0,0),(225,'202012257714',NULL,NULL,NULL,1,'时间测试','时间测试2',3,1608886043,1608886286,0,NULL,NULL,NULL,0,58,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,1,'{\"send_name\":\"1\",\"received_name\":\"1\",\"send_tel\":\"1\",\"received_tel\":\"1\",\"send_address\":\"1\",\"received_address\":\"1\",\"goods\":[{\"name\":\"1\",\"num\":\"1\",\"weight\":\"1\",\"unit_price\":\"1\",\"yf\":1}],\"create_time\":\"2020-12-25 16:51:26\"}','{\"jy_money\":\"100\",\"yk_money\":0,\"type\":0,\"plan_type\":1,\"yz_num\":\"100\",\"car\":58,\"msg_money\":\"100\",\"car_info\":{\"id\":58,\"car_num\":\"152151515\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-16\",\"update_time\":\"2020-12-16 15:54:59\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"\\u6597\\u5148\\u751f\",\"id_card\":null,\"bank_name\":null,\"fleet\":null,\"mobile\":\"18208641351\",\"oil_card\":null,\"bank_num\":null,\"model\":null,\"height\":null,\"card_img\":[],\"bank_user\":null,\"operator\":2,\"jyje\":0,\"yk_money\":0,\"operators\":null},\"weight\":1,\"dd_time\":\"2020-12-25 16:12:23\"}',1,1,'1',NULL,1,0,0,0,0,0,1608886103,1608886286,1608886286),(226,'202012257716',NULL,NULL,NULL,1,'测试1234','测试123456789',2,1608886825,1608886864,0,NULL,NULL,NULL,0,56,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,1,'{\"send_name\":\"11\",\"received_name\":\"11\",\"send_tel\":\"11\",\"received_tel\":\"11\",\"send_address\":\"11\",\"received_address\":\"11\",\"goods\":[{\"name\":\"1\",\"num\":\"1\",\"weight\":\"1\",\"unit_price\":\"1\",\"yf\":1}],\"create_time\":\"2020-12-25 17:01:04\"}','{\"jy_money\":\"\",\"yk_money\":\"11\",\"type\":0,\"num\":1,\"plan_type\":1,\"yz_num\":\"11\",\"car\":56,\"msg_money\":\"1111\",\"msg\":\"11\",\"car_info\":{\"id\":56,\"car_num\":\"GH1512151\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-16\",\"update_time\":\"2020-12-23 14:14:49\",\"oil\":0,\"is_bind\":1,\"equip_num\":\"\",\"position\":null,\"tid\":null,\"drive_name\":\"\\u5f90\\u5f90\",\"id_card\":null,\"bank_name\":null,\"fleet\":null,\"mobile\":\"18788778419\",\"oil_card\":null,\"bank_num\":null,\"model\":\"15\",\"height\":\"15\",\"card_img\":[],\"bank_user\":null,\"operator\":1,\"jyje\":0,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"}},\"weight\":1,\"dd_time\":\"2020-12-25 17:12:45\"}',1,1,'1',NULL,1,0,0,0,0,0,1608886845,0,1608886864),(227,'202012256329',NULL,NULL,NULL,123,'342','4324',2,1608886962,1610422244,0,NULL,NULL,'null',0,53,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,62,'{\"send_name\":\"12\",\"send_tel\":\"31\",\"send_address\":\"321\",\"received_address\":\"31\",\"received_tel\":\"23\",\"received_name\":\"312\",\"dj_msg\":\"123\",\"goods\":[{\"name\":\"23\",\"num\":\"1\",\"weight\":\"2\",\"unit_price\":\"31\",\"yf\":62}],\"create_time\":\"2020-12-25 17:03:18\"}','{\"jy_money\":0,\"yk_money\":0,\"type\":1,\"plan_type\":2,\"num\":\"123\",\"car_info\":{\"id\":53,\"car_num\":\"\\u8d35EE7654\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-12-09\",\"update_time\":\"2021-01-12 11:30:43\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"\\u738b\\u53f8\\u673a\",\"id_card\":null,\"bank_name\":null,\"fleet\":\"\\u5408\\u5355\\u8f66\",\"mobile\":\"13512341234\",\"oil_card\":null,\"bank_num\":null,\"model\":\"\\u5408\\u5355\\u8f66\",\"height\":\"\\u5408\\u5355\\u8f66\",\"card_img\":[],\"bank_user\":null,\"operator\":1,\"jyje\":5988},\"weight\":297,\"car\":53,\"dd_time\":\"2020-12-25 17:12:41\"}',1,0,'432',NULL,2,0,0,0,0,223,1970,0,1970),(228,NULL,NULL,NULL,NULL,152,'123','456',0,1609295880,1609309396,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,526,'嘻嘻嘻',NULL,1,0,0,0,0,0,0,0,0),(239,'202012309266',NULL,NULL,NULL,5,'003','003',1,1609309043,1609314006,0,NULL,NULL,NULL,0,50,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":50,\"msg\":\"0001\",\"msg_money\":\"20\",\"type\":0,\"yk_money\":\"30\",\"jy_money\":0,\"plan_type\":1,\"car_info\":{\"id\":50,\"car_num\":\"4\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-09\",\"update_time\":\"2020-12-30 15:34:33\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"4\",\"id_card\":\"4\",\"bank_name\":\"4\",\"fleet\":\"4\",\"mobile\":\"18208641351\",\"oil_card\":\"4\",\"bank_num\":\"4\",\"model\":\"4\",\"height\":\"4\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201209\\/1badf527f42696e177a406c4d0d0db84.jpg\",\"id\":\"319\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/0c4ffc2f978e3c4ec9e984903d66b384.jpg\",\"id\":\"320\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/5c79bc0a912277dc275bf62aec788053.jpg\",\"id\":\"321\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/dac21745d0741196db79deb2a96dae78.jpg\",\"id\":\"322\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/297ad8af1d4aeb7d8b48865c0f42eb8e.jpg\",\"id\":\"323\"}],\"bank_user\":\"44\",\"operator\":1,\"jyje\":0,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"},\"value\":50,\"label\":\"4\"},\"yz_num\":\"\",\"dd_time\":\"2020-12-30 15:12:06\"}',0,1,'005',NULL,1,0,0,0,0,0,1609314006,0,0),(240,'202012301833',NULL,NULL,NULL,0,'0001','0001',1,1609313701,1609313701,0,NULL,NULL,NULL,0,47,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":47,\"msg\":\"001\",\"msg_money\":\"10\",\"type\":1,\"yk_money\":\"20\",\"jy_money\":0,\"plan_type\":1,\"car_info\":{\"id\":47,\"car_num\":\"1\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-09\",\"update_time\":\"2020-12-30 15:34:07\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"1\",\"id_card\":\"1\",\"bank_name\":\"1\",\"fleet\":\"1\",\"mobile\":\"18208641351\",\"oil_card\":\"1\",\"bank_num\":\"1\",\"model\":\"1\",\"height\":\"1\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201209\\/d09f0f41bdcd91dbe62d088cc8dc40de.jpg\",\"id\":\"304\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ae61fdc57ada8c014aafbbae5d2ab8a2.jpg\",\"id\":\"306\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/050012492efb36f145d10ce670a1dcfd.jpg\",\"id\":\"305\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/f4e88f57fb013ce585a0f54af2a6a750.jpg\",\"id\":\"307\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/05a3c8387d89eed7af627c2abc28dfdd.jpg\",\"id\":\"308\"}],\"bank_user\":\"11\",\"operator\":1,\"jyje\":6666,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"},\"value\":47,\"label\":\"1\"},\"yz_num\":\"\",\"num\":1,\"dd_time\":\"2020-12-30 15:12:01\"}',0,1,'按车数',NULL,1,0,0,0,0,236,1609313701,0,0),(241,'202012303371',NULL,NULL,NULL,3,'0002','0002',1,1609313786,1609313786,0,NULL,NULL,NULL,0,48,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":48,\"msg\":\"\\u62c6\\u91cd\\u91cf\",\"msg_money\":\"10\",\"type\":1,\"yk_money\":\"20\",\"jy_money\":0,\"plan_type\":2,\"car_info\":{\"id\":48,\"car_num\":\"2\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-09\",\"update_time\":\"2020-12-30 15:34:17\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"2\",\"id_card\":\"2\",\"bank_name\":\"2\",\"fleet\":\"2\",\"mobile\":\"18208641351\",\"oil_card\":\"2\",\"bank_num\":\"2\",\"model\":\"2\",\"height\":\"2\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201209\\/f37a9ea307b5084575fdd79be86e69b9.jpg\",\"id\":\"309\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/69b9a706542123c3cb3ce6825bc698e5.jpg\",\"id\":\"310\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/b459f0d5b07433e16db89149feb0dd1a.jpg\",\"id\":\"311\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/c9a0204ed1bf5f748b9c5e8bb419786a.jpg\",\"id\":\"312\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/33787390283b61dd735078c57e3e340f.jpg\",\"id\":\"313\"}],\"bank_user\":\"2\",\"operator\":1,\"jyje\":0,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"},\"value\":48,\"label\":\"2\"},\"yz_num\":\"\",\"num\":\"3\",\"weight\":1,\"dd_time\":\"2020-12-30 15:12:25\"}',0,0,'按重量',NULL,2,0,0,0,0,237,1609313785,0,0),(242,'202012308437',NULL,NULL,NULL,20,'0001','0001',2,1609313892,1609813950,0,NULL,NULL,NULL,0,49,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,490176,'{\"received_tel\":\"18788778419\",\"received_address\":\"123\",\"received_name\":\"123\",\"send_name\":\"12\",\"send_tel\":\"312\",\"send_address\":\"312\",\"goods\":[{\"name\":\"312\",\"num\":\"31\",\"weight\":\"23\",\"unit_price\":\"21312\",\"yf\":490176}],\"create_time\":\"2021-01-05 10:32:29\"}','{\"car\":49,\"msg\":\"\\u6d4b\\u8bd5\\u62c6\\u8f66\\u6570\",\"msg_money\":\"10\",\"type\":1,\"yk_money\":0,\"jy_money\":\"20\",\"plan_type\":1,\"car_info\":{\"id\":49,\"car_num\":\"3\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-09\",\"update_time\":\"2020-12-30 15:34:25\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"3\",\"id_card\":\"3\",\"bank_name\":\"3\",\"fleet\":\"3\",\"mobile\":\"18208641351\",\"oil_card\":\"3\",\"bank_num\":\"3\",\"model\":\"3\",\"height\":\"3\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201209\\/0b2a6c8ff252a86e2fccc7e186abd16a.jpg\",\"id\":\"314\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/047fef5b3f550ef7c357488d1862d60f.jpg\",\"id\":\"317\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/b6d9186d901772becb222a66a44a588c.jpg\",\"id\":\"315\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ebfe52ec72f6819f64487544084c7dd2.jpg\",\"id\":\"316\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/e445523046a6acaaf38187c7f222140e.jpg\",\"id\":\"318\"}],\"bank_user\":\"3\",\"operator\":1,\"jyje\":0,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"},\"value\":49,\"label\":\"3\"},\"yz_num\":\"20\",\"num\":\"3\",\"dd_time\":\"2020-12-30 15:12:12\"}',1,1,'按车数',NULL,1,0,0,0,0,236,1609313892,0,1609813949),(243,NULL,NULL,NULL,NULL,300,'手机测试单起始地','手机测试单目的地',0,1609376751,1609394586,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,13,'手机测试单',NULL,1,0,0,0,0,0,0,0,0),(244,'202012319181',NULL,NULL,NULL,20,'手机测试单起始地','手机测试单目的地',1,1609378552,1610422258,0,NULL,NULL,'null',0,39,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,'null','{\"car\":39,\"msg\":\"\",\"msg_money\":0,\"type\":1,\"yk_money\":0,\"jy_money\":0,\"plan_type\":1,\"car_info\":{\"id\":39,\"car_num\":\"\\u8d35EE8888\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-12-04\",\"update_time\":\"2021-01-12 11:30:58\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"\\u738b\\u53f8\\u673a\",\"id_card\":\"123456\",\"bank_name\":\"123456\",\"fleet\":\"\\u6d4b\\u8bd5\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"123456\",\"bank_num\":\"123456\",\"model\":\"8\\u8f74\",\"height\":\"15M\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201204\\/5416ccd2041f46a8cb3ed3fe6faec160.jpg\",\"id\":\"258\"},{\"url\":\"\\/uploads\\/img\\/20201204\\/b99ba13a12867c21dd0576edc4d3f855.jpg\",\"id\":\"259\"},{\"url\":\"\\/uploads\\/img\\/20201204\\/339f47eea5e11651028a0ff78c6dff13.jpg\",\"id\":\"260\"},{\"url\":\"\\/uploads\\/img\\/20201208\\/33c2eb212c3c6edf88c1297fb40958db.jpg\",\"create_time\":\"2020-12-08\",\"update_time\":\"2020-12-08 13:49:27\",\"id\":\"271\"},{\"url\":\"\\/uploads\\/img\\/20201208\\/ac25729bc3db7c2ffb2b619564d14012.jpg\",\"create_time\":\"2020-12-08\",\"update_time\":\"2020-12-08 13:49:27\",\"id\":\"272\"}],\"bank_user\":\"123456\",\"operator\":1,\"jyje\":8888},\"yz_num\":\"20\",\"num\":1,\"dd_time\":\"2020-12-31 09:12:52\"}',0,1,'手机测试单',NULL,1,0,0,0,0,243,1970,0,0),(245,'202012317736',NULL,NULL,NULL,20,'手机测试单起始地','手机测试单目的地',1,1609394586,1610419286,0,NULL,NULL,NULL,0,14,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":14,\"msg\":\"\",\"msg_money\":0,\"type\":1,\"yk_money\":0,\"jy_money\":0,\"plan_type\":1,\"car_info\":{\"id\":14,\"car_num\":\"\\u8d35EE1325\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-11-30\",\"update_time\":\"2020-12-31 14:03:06\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[110.422804,31.030918],\"tid\":null,\"drive_name\":\"\\u5c0f\\u53f8\\u673a\",\"id_card\":\"522328165474136521\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8d35\\u9633\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"6254784125496352148\",\"bank_num\":\"6485463251254789651\",\"model\":\"4\\u8f74\",\"height\":\"\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}],\"bank_user\":\"\\u5c0f\\u53f8\\u673a\",\"operator\":null,\"jyje\":0},\"yz_num\":\"30\",\"num\":1,\"dd_time\":\"2021-01-12 10:01:25\"}',0,1,'手机测试单',NULL,1,0,0,0,0,243,1609394586,0,0),(247,NULL,NULL,NULL,NULL,130,'0002','0002',0,1609727372,1609728832,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,'0002',NULL,2,0,0,0,0,0,0,0,0),(248,'202101044117',NULL,NULL,NULL,50,'0001','0001',2,1609727420,1609731494,0,NULL,NULL,NULL,0,21,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":21,\"msg\":\"0001\\u62c6\\u8f66\",\"msg_money\":\"60\",\"type\":1,\"yk_money\":\"60\",\"jy_money\":0,\"plan_type\":1,\"car_info\":{\"id\":21,\"car_num\":\"\\u8d35E-99666\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-11-30\",\"update_time\":\"2020-12-22 17:30:53\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[85.439275,42.85855],\"tid\":\"\",\"drive_name\":\"\\u674e\\u53f8\\u673a\",\"id_card\":\"522328165474136521\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8d35\\u9633\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"6254784125496352148\",\"bank_num\":\"6485463251254789651\",\"model\":\"4\\u8f74\",\"height\":\"\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}],\"bank_user\":\"\\u738b\\u673a\\u53f8\",\"operator\":null,\"jyje\":3000},\"yz_num\":\"40\",\"num\":\"2\",\"dd_time\":\"2021-01-04 11:01:14\"}',0,1,'0001',NULL,1,0,0,0,0,246,1609727420,0,0),(249,'202101048037',NULL,NULL,NULL,70,'0002','0002',2,1609728832,1609813811,0,NULL,NULL,NULL,0,38,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,974376,'{\"send_name\":\"12\",\"send_tel\":\"31\",\"send_address\":\"2312\",\"received_name\":\"312\",\"received_tel\":\"18788778419\",\"received_address\":\"123123\",\"dj_msg\":\"1312312\",\"goods\":[{\"name\":\"123\",\"num\":\"2\",\"weight\":\"312\",\"unit_price\":\"3123\",\"yf\":974376}],\"create_time\":\"2021-01-05 10:30:10\"}','{\"car\":38,\"msg\":\"0002\",\"msg_money\":0,\"type\":1,\"yk_money\":0,\"jy_money\":0,\"plan_type\":2,\"car_info\":{\"id\":38,\"car_num\":\"4444\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-04\",\"update_time\":\"2020-12-23 14:17:00\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"dqaweq\",\"id_card\":\"1231\",\"bank_name\":\"2312\",\"fleet\":\"23\",\"mobile\":\"18788778419\",\"oil_card\":\"312\",\"bank_num\":\"231\",\"model\":\"31223\",\"height\":\"123\",\"card_img\":[{\"id\":\"255\",\"url\":\"\\/uploads\\/img\\/20201204\\/92449702606c1492f636945e81bb76ce.jpg\"},{\"id\":\"256\",\"url\":\"\\/uploads\\/img\\/20201204\\/92449702606c1492f636945e81bb76ce.jpg\"}],\"bank_user\":\"31\",\"operator\":1,\"jyje\":123},\"yz_num\":\"333\",\"num\":\"70\",\"weight\":130,\"dd_time\":\"2021-01-04 11:01:15\"}',1,0,'0002',NULL,2,0,0,0,0,247,1609728832,0,1609813810),(250,'202101112189',NULL,NULL,NULL,100,'01','01',1,1610343789,1610344866,0,NULL,NULL,NULL,0,47,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":47,\"msg\":\"0000001\",\"msg_money\":\"20\",\"type\":0,\"yk_money\":\"20\",\"jy_money\":0,\"plan_type\":2,\"car_info\":{\"id\":47,\"car_num\":\"1\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-09\",\"update_time\":\"2021-01-04 10:30:20\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"1\",\"id_card\":\"1\",\"bank_name\":\"1\",\"fleet\":\"1\",\"mobile\":\"18208641351\",\"oil_card\":\"1\",\"bank_num\":\"1\",\"model\":\"1\",\"height\":\"1\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201209\\/d09f0f41bdcd91dbe62d088cc8dc40de.jpg\",\"id\":\"304\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ae61fdc57ada8c014aafbbae5d2ab8a2.jpg\",\"id\":\"306\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/050012492efb36f145d10ce670a1dcfd.jpg\",\"id\":\"305\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/f4e88f57fb013ce585a0f54af2a6a750.jpg\",\"id\":\"307\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/05a3c8387d89eed7af627c2abc28dfdd.jpg\",\"id\":\"308\"}],\"bank_user\":\"11\",\"operator\":1,\"jyje\":6666,\"yk_money\":\"20\",\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"},\"value\":47,\"label\":\"1\"},\"yz_num\":\"20\",\"dd_time\":\"2021-01-11 14:01:05\"}',0,0,'整单运输',NULL,2,0,0,0,0,0,1610344865,0,0),(251,NULL,NULL,NULL,NULL,200,'02','02',0,1610345330,1610605359,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,295,'02',NULL,1,0,0,0,0,0,0,0,0),(252,'202101117209',NULL,NULL,NULL,110,'02','02',1,1610345609,1610345609,0,NULL,NULL,NULL,0,47,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":47,\"msg\":\"02\",\"msg_money\":\"20\",\"type\":1,\"yk_money\":\"20\",\"jy_money\":0,\"plan_type\":1,\"car_info\":{\"id\":47,\"car_num\":\"1\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-09\",\"update_time\":\"2021-01-11 14:01:05\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"1\",\"id_card\":\"1\",\"bank_name\":\"1\",\"fleet\":\"1\",\"mobile\":\"18208641351\",\"oil_card\":\"1\",\"bank_num\":\"1\",\"model\":\"1\",\"height\":\"1\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201209\\/d09f0f41bdcd91dbe62d088cc8dc40de.jpg\",\"id\":\"304\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/ae61fdc57ada8c014aafbbae5d2ab8a2.jpg\",\"id\":\"306\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/050012492efb36f145d10ce670a1dcfd.jpg\",\"id\":\"305\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/f4e88f57fb013ce585a0f54af2a6a750.jpg\",\"id\":\"307\"},{\"url\":\"\\/uploads\\/img\\/20201209\\/05a3c8387d89eed7af627c2abc28dfdd.jpg\",\"id\":\"308\"}],\"bank_user\":\"11\",\"operator\":1,\"jyje\":6666,\"yk_money\":\"20\",\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"},\"value\":47,\"label\":\"1\"},\"yz_num\":\"110\",\"num\":1,\"dd_time\":\"2021-01-11 14:01:29\"}',0,1,'02',NULL,1,0,0,0,0,251,1610345609,0,0),(256,'202101118866',NULL,NULL,NULL,33,'02','02',3,1610350841,1610350953,0,NULL,NULL,'[\"\\/uploads\\/img\\/20210111\\/857561034411bd11d6a5c4761b64ee21.jpg\"]',1,22,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,396,'{\"send_name\":\"123\",\"send_tel\":\"123\",\"send_address\":\"123\",\"received_name\":\"123\",\"received_address\":\"123\",\"received_tel\":\"18788778419\",\"goods\":[{\"name\":\"123\",\"num\":\"123\",\"weight\":\"132\",\"unit_price\":\"3\",\"yf\":396}],\"dj_msg\":\"02,03,04\",\"create_time\":\"2021-01-11 15:41:13\"}','{\"jy_money\":\"5000\",\"yk_money\":\"\",\"type\":1,\"num\":1,\"msg\":\"02,03\",\"plan_type\":1,\"yz_num\":\"33\",\"car\":22,\"msg_money\":\"3000\",\"car_info\":{\"id\":22,\"car_num\":\"\\u8d35E-99667\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-11-30\",\"update_time\":\"2020-12-24 16:02:43\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[123.816036,45.136659],\"tid\":\"\",\"drive_name\":\"\\u516c\\u53f8\\u673a\",\"id_card\":\"522328165474136521\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8d35\\u9633\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"6254784125496352148\",\"bank_num\":\"6485463251254789651\",\"model\":\"4\\u8f74\",\"height\":\"\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}],\"bank_user\":\"\\u5c0f\\u53f8\\u673a\",\"operator\":null,\"jyje\":0,\"yk_money\":0,\"operators\":null},\"weight\":199,\"dd_time\":\"2021-01-11 15:01:41\"}',1,1,'02','贵E-99667',1,0,0,0,0,251,1610350841,1610350953,1610350873),(257,NULL,NULL,NULL,NULL,545,'测试1','测试2',0,1610351042,1610605352,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,'测试123',NULL,2,0,0,0,0,0,0,0,0),(258,'202101118359',NULL,NULL,NULL,55,'测试1','测试2',1,1610351077,1610351077,0,NULL,NULL,NULL,0,18,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"jy_money\":\"500\",\"yk_money\":0,\"type\":1,\"plan_type\":2,\"msg\":\"\\u6d4b\\u8bd5\\uff0c\\u6d4b\\u8bd52\",\"num\":\"55\",\"car\":18,\"msg_money\":\"1000\",\"car_info\":{\"id\":18,\"car_num\":\"\\u8d35CD6666\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-11-30\",\"update_time\":\"2020-12-23 14:11:28\",\"oil\":0,\"is_bind\":1,\"equip_num\":\"A79811651\",\"position\":[104.333299,26.32781],\"tid\":null,\"drive_name\":\"\\u6768\\u53f8\\u673a\",\"id_card\":\"522315346985485126\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8f66\\u961f\\u961f\",\"mobile\":\"13312341238\",\"oil_card\":\"3612541254879652412\",\"bank_num\":\"3651254785469521459\",\"model\":\"200\\u8f74\",\"height\":\"\\u9ad8\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"113\",\"url\":\"\\/uploads\\/img\\/20201130\\/a196db2b24be5e2a801d6856326aa744.jpg\"},{\"id\":\"114\",\"url\":\"\\/uploads\\/img\\/20201130\\/12827685fe864008fd8aad8e7e8e99b5.jpg\"},{\"id\":\"115\",\"url\":\"\\/uploads\\/img\\/20201130\\/459bd914465990071f669b1827ea92b0.jpg\"}],\"bank_user\":\"\\u738b\",\"operator\":1,\"jyje\":1100,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"}},\"weight\":445,\"dd_time\":\"2021-01-11 15:01:37\"}',0,0,'测试',NULL,2,0,0,0,0,257,1610351077,0,0),(260,'202101124712',NULL,NULL,NULL,60,'测试1','测试2',1,1610418341,1610419180,0,NULL,NULL,NULL,0,22,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"jy_money\":\"1323\",\"yk_money\":\"\",\"type\":1,\"num\":\"60\",\"msg\":\"\\u6d4b\\u8bd51\\uff0c\\u6d4b\\u8bd52\",\"plan_type\":2,\"car\":22,\"uni_price\":\"36\",\"msg_money\":\"45645\",\"car_info\":{\"id\":22,\"car_num\":\"\\u8d35E-99667\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-11-30\",\"update_time\":\"2021-01-12 10:25:41\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[123.816036,45.136659],\"tid\":\"\",\"drive_name\":\"\\u516c\\u53f8\\u673a\",\"id_card\":\"522328165474136521\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8d35\\u9633\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"6254784125496352148\",\"bank_num\":\"6485463251254789651\",\"model\":\"4\\u8f74\",\"height\":\"\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}],\"bank_user\":\"\\u5c0f\\u53f8\\u673a\",\"operator\":null,\"jyje\":5000},\"weight\":340,\"dd_time\":\"2021-01-12 10:01:39\",\"yz_num\":0}',0,0,'测试',NULL,2,0,0,0,0,257,1610418341,0,0),(261,'202101128629',NULL,NULL,NULL,66,'02','02',1,1610418407,1610419191,0,NULL,NULL,NULL,0,32,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"jy_money\":\"0432\",\"yk_money\":0,\"type\":1,\"plan_type\":1,\"msg\":\"02\\uff0c03\",\"yz_num\":\"70\",\"car\":32,\"uni_price\":\"123\",\"msg_money\":\"3333\",\"car_info\":{\"id\":32,\"car_num\":\"\\u8d35E-996607\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-11-30\",\"update_time\":\"2021-01-12 10:30:22\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[80.97793,33.200333],\"tid\":\"\",\"drive_name\":\"\\u7b11\\u53f8\\u673a\",\"id_card\":\"522328165474136521\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8d35\\u9633\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"6254784125496352148\",\"bank_num\":\"6485463251254789651\",\"model\":\"4\\u8f74\",\"height\":\"\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}],\"bank_user\":\"\\u5c0f\\u53f8\\u673a\",\"operator\":null,\"jyje\":0},\"num\":1,\"weight\":199,\"dd_time\":\"2021-01-12 10:01:51\"}',0,1,'02',NULL,1,0,0,0,0,251,1610418407,0,0),(262,'202101122642',NULL,NULL,NULL,50,'02','02',1,1610419864,1610419864,0,NULL,NULL,NULL,0,23,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"jy_money\":0,\"yk_money\":0,\"type\":1,\"plan_type\":1,\"msg\":\"02\",\"yz_num\":\"50\",\"car\":23,\"uni_price\":\"123\",\"msg_money\":\"123\",\"car_info\":{\"id\":23,\"car_num\":\"\\u8d35E-99668\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-11-30\",\"update_time\":\"2021-01-12 10:30:22\",\"oil\":0,\"is_bind\":1,\"equip_num\":\"A79811651\",\"position\":[78.195339,43.965031],\"tid\":\"\",\"drive_name\":\"\\u9a6c\\u53f8\\u673a\",\"id_card\":\"522315346985485126\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8f66\\u961f\\u961f\",\"mobile\":\"13312341238\",\"oil_card\":\"3612541254879652412\",\"bank_num\":\"3651254785469521459\",\"model\":\"200\\u8f74\",\"height\":\"\\u9ad8\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"113\",\"url\":\"\\/uploads\\/img\\/20201130\\/a196db2b24be5e2a801d6856326aa744.jpg\"},{\"id\":\"114\",\"url\":\"\\/uploads\\/img\\/20201130\\/12827685fe864008fd8aad8e7e8e99b5.jpg\"},{\"id\":\"115\",\"url\":\"\\/uploads\\/img\\/20201130\\/459bd914465990071f669b1827ea92b0.jpg\"}],\"bank_user\":\"\\u738b\",\"operator\":1,\"jyje\":1000,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"}},\"num\":1,\"weight\":199,\"dd_time\":\"2021-01-12 10:01:04\"}',0,1,'02',NULL,1,0,0,0,0,251,1610419864,0,0),(263,NULL,NULL,NULL,NULL,668,'1212','121212',0,1610421020,1610605388,0,NULL,NULL,NULL,0,0,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,'1212',NULL,2,0,0,0,0,0,0,0,0),(264,'202101122300',NULL,NULL,NULL,100,'1212','121212',1,1610421320,1610422301,0,NULL,NULL,'null',0,34,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,'null','{\"jy_money\":0,\"yk_money\":\"2000\",\"type\":1,\"plan_type\":2,\"num\":\"100\",\"car\":34,\"msg_money\":\"1000\",\"msg\":\"100\",\"car_info\":{\"id\":34,\"car_num\":\"\\u8d35E-996609\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-11-30\",\"update_time\":\"2021-01-12 11:31:41\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[76.599374,18.791802],\"tid\":\"\",\"drive_name\":\"\\u7537\\u53f8\\u673a\",\"id_card\":\"522401199919991999\",\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"fleet\":\"\\u5174\\u4e49\\u901a\",\"mobile\":\"13512341234\",\"oil_card\":\"1525253636\",\"bank_num\":\"52666216516\",\"model\":\"\\u5927\\u578b\\u8f66\",\"height\":\"2323\",\"card_img\":[{\"id\":\"118\",\"url\":\"\\/uploads\\/img\\/20201130\\/2d6370df486bfcc43478a20ddf5cad03.png\"}],\"bank_user\":\"\\u8001\\u738b\",\"operator\":1,\"jyje\":246},\"weight\":900,\"dd_time\":\"2021-01-12 11:01:29\",\"yz_num\":0}',0,0,'1212',NULL,2,0,0,0,0,263,1970,0,0),(265,'202101127954',NULL,NULL,NULL,200,'1212','121212',1,1610421433,1610422235,0,NULL,NULL,'null',0,29,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,'null','{\"jy_money\":\"\",\"yk_money\":\"\",\"type\":1,\"num\":\"100\",\"msg\":\"1212\\uff0c333\",\"plan_type\":2,\"car\":29,\"uni_price\":\"1233\",\"msg_money\":\"123\",\"car_info\":{\"id\":29,\"car_num\":\"\\u8d35E-996604\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-11-30\",\"update_time\":\"2021-01-12 11:30:35\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[109.328165,30.459836],\"tid\":\"\",\"drive_name\":\"\\u5362\\u738b\",\"id_card\":\"522401199919991999\",\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"fleet\":\"\\u5174\\u4e49\\u901a\",\"mobile\":\"13512341234\",\"oil_card\":\"1525253636\",\"bank_num\":\"52666216516\",\"model\":\"\\u5927\\u578b\\u8f66\",\"height\":\"2323\",\"card_img\":[{\"id\":\"118\",\"url\":\"\\/uploads\\/img\\/20201130\\/2d6370df486bfcc43478a20ddf5cad03.png\"}],\"bank_user\":\"\\u8001\\u738b\",\"operator\":1,\"jyje\":0},\"weight\":700,\"dd_time\":\"2021-01-12 11:01:45\",\"yz_num\":0}',0,0,'1212',NULL,2,0,0,0,0,263,2021,0,0),(266,'202101121150',NULL,NULL,NULL,3000,'02','02',1,1610422220,1610422331,0,NULL,NULL,NULL,0,27,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"jy_money\":0,\"yk_money\":\"300\",\"type\":1,\"plan_type\":1,\"msg\":\"02\",\"yz_num\":\"20\",\"car\":27,\"uni_price\":\"300\",\"msg_money\":\"300\",\"car_info\":{\"id\":27,\"car_num\":\"\\u8d35E-996602\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-11-30\",\"update_time\":\"2021-01-12 11:30:20\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[106.462786,27.339774],\"tid\":\"\",\"drive_name\":\"\\u8096\\u53f8\\u673a\",\"id_card\":\"522328165474136521\",\"bank_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\",\"fleet\":\"\\u8d35\\u9633\\u8f66\\u961f\",\"mobile\":\"13512341234\",\"oil_card\":\"6254784125496352148\",\"bank_num\":\"6485463251254789651\",\"model\":\"4\\u8f74\",\"height\":\"\\u9ad8\\u680f\",\"card_img\":[{\"id\":\"20\",\"url\":\"\\/uploads\\/img\\/20201126\\/7d0008af838b2e16e90182deff9746fa.jpg\"},{\"id\":\"22\",\"url\":\"\\/uploads\\/img\\/20201126\\/8e3b02f9dad9d45937bb54827375bbcf.jpg\"},{\"id\":\"39\",\"url\":\"\\/uploads\\/img\\/20201126\\/0101e2122790e8c00dacf57a2b41ca8b.jpg\"}],\"bank_user\":\"\\u5c0f\\u53f8\\u673a\",\"operator\":null,\"jyje\":3200},\"num\":0,\"weight\":199,\"dd_time\":\"2021-01-12 11:01:11\"}',0,1,'02',NULL,1,0,0,0,0,251,1610422220,0,0),(267,'202101121822',NULL,NULL,NULL,360,'1212','121212',1,1610422376,1610586493,0,NULL,NULL,NULL,0,24,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"jy_money\":\"321\",\"yk_money\":\"\",\"type\":1,\"num\":\"65\",\"msg\":\"1212\",\"plan_type\":2,\"car\":24,\"uni_price\":\"12313\",\"msg_money\":\"123\",\"car_info\":{\"id\":24,\"car_num\":\"\\u8d35E-99669\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"2020-11-30\",\"update_time\":\"2021-01-13 14:29:15\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[71.196318,44.610928],\"tid\":\"\",\"drive_name\":\"\\u6f58\\u53f8\\u673a\",\"id_card\":\"522401199919991999\",\"bank_name\":\"\\u4e2d\\u56fd\\u94f6\\u884c\",\"fleet\":\"\\u5174\\u4e49\\u901a\",\"mobile\":\"13512341234\",\"oil_card\":\"1525253636\",\"bank_num\":\"52666216516\",\"model\":\"\\u5927\\u578b\\u8f66\",\"height\":\"2323\",\"card_img\":[{\"id\":\"118\",\"url\":\"\\/uploads\\/img\\/20201130\\/2d6370df486bfcc43478a20ddf5cad03.png\"}],\"bank_user\":\"\\u8001\\u738b\",\"operator\":1,\"jyje\":0},\"weight\":440,\"dd_time\":\"2021-01-14 09:01:12\",\"yz_num\":0}',0,0,'1212',NULL,2,0,0,0,0,263,1610422376,0,0),(268,'202101138304',NULL,NULL,NULL,45,'1212','121212',1,1610509399,1610586474,0,NULL,NULL,NULL,0,37,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":37,\"msg\":\"\\u6d4b\\u8bd5333\",\"msg_money\":\"5000\",\"type\":1,\"yk_money\":\"\",\"jy_money\":\"3000\",\"plan_type\":2,\"car_info\":{\"id\":37,\"car_num\":\"1312312\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":1,\"create_time\":\"1970-01-01\",\"update_time\":\"2021-01-14 09:06:11\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"2312\",\"id_card\":\"231\",\"bank_name\":\"23\",\"fleet\":\"31\",\"mobile\":\"18788778419\",\"oil_card\":\"12\",\"bank_num\":\"321\",\"model\":\"12\",\"height\":\"3\",\"card_img\":[{\"id\":\"253\",\"url\":\"\\/uploads\\/img\\/20201204\\/67e36892ab95f119977d7e5874c37ebd.jpg\"},{\"id\":\"252\",\"url\":\"\\/uploads\\/img\\/20201204\\/4c0b89b84aa88bf6d0ba320177e00bb1.jpg\"},{\"id\":\"254\",\"url\":\"\\/uploads\\/img\\/20201204\\/750d5ec644f34b0470a85206441eb1ac.jpg\"}],\"bank_user\":\"321\",\"operator\":1,\"jyje\":678},\"yz_num\":0,\"num\":\"15\",\"weight\":690,\"dd_time\":\"2021-01-14 09:01:53\",\"uni_price\":\"13\"}',0,0,'1212',NULL,2,0,0,0,0,263,1610509399,0,0),(270,'202101146129',NULL,NULL,NULL,123,'1212','121212',1,1610592241,1610605223,0,NULL,NULL,NULL,0,35,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"car\":35,\"msg\":\"\",\"msg_money\":\"\",\"type\":1,\"yk_money\":\"\",\"jy_money\":\"\",\"plan_type\":2,\"car_info\":{\"id\":35,\"car_num\":\"\\u8d35E-99fdf\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-01\",\"update_time\":\"2020-12-18 09:29:39\",\"oil\":0,\"is_bind\":0,\"equip_num\":\"\",\"position\":[101.481718,28.137801],\"tid\":\"\",\"drive_name\":\"\\u5973\\u53f8\\u673a\",\"id_card\":\"111111\",\"bank_name\":\"111111\",\"fleet\":\"1111111\",\"mobile\":\"111111111111\",\"oil_card\":\"11111\",\"bank_num\":\"1111111\",\"model\":\"111111\",\"height\":\"11111\",\"card_img\":[{\"url\":\"\\/uploads\\/img\\/20201201\\/d979a34a5d4c87ad0ee1ac4d991a9c0a.jpg\",\"id\":\"234\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/8f929eb6f675fc1b5496462dc5ea573d.jpg\",\"id\":\"235\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/c3cabf875c60e786638f5f57d6ca235a.jpg\",\"id\":\"236\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/0aee75f795043900d8d4f7e0e7a2d0e4.jpg\",\"id\":\"237\"},{\"url\":\"\\/uploads\\/img\\/20201201\\/64a9c6d1341a99318951b7890ea0e589.jpg\",\"create_time\":\"2020-12-01\",\"update_time\":\"2020-12-01 17:00:51\",\"id\":\"240\"}],\"bank_user\":\"1111\",\"operator\":1,\"jyje\":0},\"yz_num\":0,\"uni_price\":\"\",\"num\":\"123\",\"weight\":569,\"dd_time\":\"2021-01-14 14:01:23\"}',0,0,'1212',NULL,2,0,0,0,0,263,1610592241,0,0),(271,'202101145902',NULL,NULL,NULL,1,'1212','121212',1,1610605388,1610605388,0,NULL,NULL,NULL,0,52,NULL,0,'0',1,'1',NULL,NULL,NULL,0,0,0,0,NULL,'{\"jy_money\":\"\",\"yk_money\":\"\",\"type\":1,\"num\":1,\"msg\":\"1212\",\"plan_type\":2,\"car\":52,\"car_info\":{\"id\":52,\"car_num\":\"998998\",\"lng\":0,\"lat\":0,\"tonnage\":0,\"type\":1,\"state\":0,\"create_time\":\"2020-12-09\",\"update_time\":\"2021-01-14 14:22:39\",\"oil\":0,\"is_bind\":0,\"equip_num\":null,\"position\":null,\"tid\":null,\"drive_name\":\"\\u738b\\u53f8\\u673a\",\"id_card\":\"522422199919991999\",\"bank_name\":\"5151\",\"fleet\":\"\\u795e\\u98ce\\u626b\\u8361\\u961f\",\"mobile\":\"18208641351\",\"oil_card\":\"1515151515\",\"bank_num\":\"1515\",\"model\":\"\\u5c0f\\u578b\",\"height\":\"15\",\"card_img\":[{\"id\":\"324\",\"url\":\"\\/uploads\\/img\\/20201209\\/e648caadbdcfcff1d0856ebb448c63e4.png\"}],\"bank_user\":\"1515\",\"operator\":1,\"jyje\":5000,\"yk_money\":0,\"operators\":{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\"}},\"weight\":668,\"dd_time\":\"2021-01-14 14:01:08\"}',0,0,'1212',NULL,2,0,0,0,0,263,1610605388,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

#
# Data for table "ys_sys_config"
#

INSERT INTO `ys_sys_config` VALUES (71,'yzm_tmp_id','SMS_167525825','阿里云模板ID',4,0,'',1598500009,1598500009),(72,'yzm_sign','永顺物流','阿里云短信签名',4,0,'',1598500009,1598500009),(73,'yzm_keyid','','阿里云短信KeyId',4,0,'',1598500009,1598500009),(74,'yzm_secret','','阿里云短信秘钥',4,0,'',1598500009,1598500009),(75,'is_yzm','0','是否开启验证码',4,0,NULL,1598500009,1598500009),(76,'map_web_key','','高德地图key',4,0,NULL,1598500009,1598500009),(77,'api_url','','api接口地址',4,0,NULL,1585877083,1589794997),(78,'yzm_driver','','阿里云通知司机模板',4,0,NULL,1585877083,1585877083),(79,'yzm_reciver','','阿里云通知收货人模板',4,0,NULL,1585877083,1585877083);

#
# Structure for table "ys_worker"
#

DROP TABLE IF EXISTS `ys_worker`;
CREATE TABLE `ys_worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(30) DEFAULT NULL COMMENT '身份证',
  `work` int(11) NOT NULL DEFAULT '0' COMMENT '工作类型（0调度员1油站管理员2会计）',
  `department` varchar(255) DEFAULT NULL COMMENT '公司部门',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `workname` varchar(255) DEFAULT NULL COMMENT '工作名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门管理员';

#
# Data for table "ys_worker"
#

