
-- -----------------------------
-- Table structure for `tp_admin`
-- -----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `logintime` int(10) DEFAULT NULL COMMENT '时间',
  `loginip` char(20) DEFAULT NULL COMMENT 'IP',
  `status` int(1) DEFAULT '0' COMMENT '状态（1 正常，0 锁定）',
  `nickname` char(100) DEFAULT NULL COMMENT '真实姓名',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- -----------------------------
-- Records of `tp_admin`
-- -----------------------------
INSERT INTO `tp_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1619774166', '172.18.0.1', '1', 'admin', '/static/admin/images/headpic.jpg', '1553846932', '1553846932');

-- -----------------------------
-- Table structure for `tp_admin_log`
-- -----------------------------
DROP TABLE IF EXISTS `tp_admin_log`;
CREATE TABLE `tp_admin_log` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) DEFAULT '' COMMENT '管理员',
  `url` varchar(1500) DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text COMMENT '内容',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';


-- -----------------------------
-- Table structure for `tp_auth_group`
-- -----------------------------
DROP TABLE IF EXISTS `tp_auth_group`;
CREATE TABLE `tp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text,
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_auth_group`
-- -----------------------------
INSERT INTO `tp_auth_group` VALUES ('1', '超级管理员', '1', '0,1,4,124,166,167,168,169,170,171,172,173,174,5,125,38,107,126,108,157,158,159,160,161,162,163,164,165,6,7,10,11,12,14,13,8,15,16,17,18,19,20,21,9,22,23,24,25,28,27,26,152,153,154,155,156,29,30,34,32,33,31,35,36,37,39,40,41,148,42,149,43,44,45,46,150,47,151,48,49,50,51,52,53,146,54,147,55,56,57,58,59,60,61,62,127,63,128,64,65,67,66,68,70,133,71,134,72,75,74,73,69,76,135,77,136,78,79,137,80,95,96,129,97,130,98,99,131,132,247,248,249,109,138,100,101,102,144,103,145,104,105,106,81,82,84,122,85,123,86,88,87,94,83,89,90,91,92,93,119,120,121,176,177,184,185,186,187,188,189,190,191,192,178,193,194,195,196,197,198,199,200,201,179,202,203,204,205,206,207,208,209,210,180,211,212,213,214,215,216,217,218,219,181,220,221,222,223,224,225,226,227,228,182,229,230,231,232,233,234,235,236,237,183,238,239,240,241,242,243,244,245,246,', '1537944508', '1561424164');
INSERT INTO `tp_auth_group` VALUES ('2', '测试组', '1', '0,1,4,166,167,169,5,107,157,158,160,6,152,153,154,155,29,30,34,32,33,31,35,36,39,40,41,42,44,45,46,47,48,49,51,52,53,54,60,61,62,63,64,67,68,70,71,74,73,69,76,77,137,80,95,96,97,131,132,247,109,138,100,101,102,103,105,81,82,84,85,88,94,83,89,91,120,121,176,177,184,186,178,193,195,179,202,204,180,211,213,181,220,222,182,229,231,183,238,240,', '1536304526', '1619770128');

-- -----------------------------
-- Table structure for `tp_auth_group_access`
-- -----------------------------
DROP TABLE IF EXISTS `tp_auth_group_access`;
CREATE TABLE `tp_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_auth_group_access`
-- -----------------------------
INSERT INTO `tp_auth_group_access` VALUES ('1', '1', '1553846932', '1553846932');

-- -----------------------------
-- Table structure for `tp_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `tp_auth_rule`;
CREATE TABLE `tp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `sort` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序',
  `auth_open` tinyint(2) DEFAULT '1',
  `icon` char(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_auth_rule`
-- -----------------------------
INSERT INTO `tp_auth_rule` VALUES ('1', '0', 'System', '系统设置', '1', '1', '', '1', '1', 'fa fa-cogs', '1536819134', '1536819134');
INSERT INTO `tp_auth_rule` VALUES ('4', '1', 'System/system', '系统设置', '1', '1', '', '11', '1', 'fa fa-cog', '1536327129', '1547520976');
INSERT INTO `tp_auth_rule` VALUES ('6', '0', 'Auth', '权限管理', '1', '1', '', '2', '1', 'fa fa-group', '1536327468', '1547520856');
INSERT INTO `tp_auth_rule` VALUES ('7', '6', 'Auth/adminList', '管理员管理', '1', '1', '', '21', '1', 'fa fa-user', '1536327753', '1547523425');
INSERT INTO `tp_auth_rule` VALUES ('8', '6', 'Auth/adminGroup', '角色组管理', '1', '1', '', '22', '1', 'fa fa-group', '1536327787', '1547520881');
INSERT INTO `tp_auth_rule` VALUES ('9', '6', 'Auth/adminRule', '菜单规则', '1', '1', '', '23', '1', 'fa fa-bars', '1536327826', '1547520923');
INSERT INTO `tp_auth_rule` VALUES ('10', '7', 'Auth/adminAdd', '操作-添加', '1', '1', '', '211', '1', '', '1536327882', '1536327952');
INSERT INTO `tp_auth_rule` VALUES ('11', '7', 'Auth/adminEdit', '操作-修改', '1', '1', '', '212', '1', '', '1536327906', '1536327955');
INSERT INTO `tp_auth_rule` VALUES ('12', '7', 'Auth/adminDel', '操作-删除', '1', '1', '', '213', '1', '', '1536327924', '1536327959');
INSERT INTO `tp_auth_rule` VALUES ('13', '7', 'Auth/adminState', '操作-状态', '1', '1', '', '215', '1', '', '1536327944', '1536328025');
INSERT INTO `tp_auth_rule` VALUES ('14', '7', 'Auth/adminSelectDel', '操作-批量删除', '1', '1', '', '214', '1', '', '1536328014', '1536328028');
INSERT INTO `tp_auth_rule` VALUES ('15', '8', 'Auth/groupAdd', '操作-添加', '1', '1', '', '221', '1', '', '1536329901', '1536329910');
INSERT INTO `tp_auth_rule` VALUES ('16', '8', 'Auth/groupEdit', '操作-修改', '1', '1', '', '222', '1', '', '1536329944', '1536329944');
INSERT INTO `tp_auth_rule` VALUES ('17', '8', 'Auth/groupDel', ' 操作-删除', '1', '1', '', '223', '1', '', '1536329962', '1536329986');
INSERT INTO `tp_auth_rule` VALUES ('18', '8', 'Auth/groupSelectDel', '操作-批量删除', '1', '1', '', '224', '1', '', '1536330024', '1536330033');
INSERT INTO `tp_auth_rule` VALUES ('19', '8', 'Auth/groupState', '操作-状态', '1', '1', '', '225', '1', '', '1536330069', '1536330069');
INSERT INTO `tp_auth_rule` VALUES ('20', '8', 'Auth/groupAccess', '操作-权限', '1', '1', '', '226', '1', '', '1536330111', '1536330111');
INSERT INTO `tp_auth_rule` VALUES ('21', '8', 'Auth/groupRunaccess', '操作-保存权限', '1', '1', '', '227', '1', '', '1536330174', '1536330179');
INSERT INTO `tp_auth_rule` VALUES ('22', '9', 'Auth/ruleAdd', '操作-添加', '1', '1', '', '231', '1', '', '1536330209', '1536330455');
INSERT INTO `tp_auth_rule` VALUES ('23', '9', 'Auth/ruleEdit', '操作-修改', '1', '1', '', '232', '1', '', '1536330222', '1536330462');
INSERT INTO `tp_auth_rule` VALUES ('24', '9', 'Auth/ruleDel', '操作-删除', '1', '1', '', '233', '1', '', '1536330236', '1536330463');
INSERT INTO `tp_auth_rule` VALUES ('25', '9', 'Auth/ruleSelectDel', '操作-批量删除', '1', '1', '', '234', '1', '', '1536330261', '1536330465');
INSERT INTO `tp_auth_rule` VALUES ('26', '9', 'Auth/ruleState', '操作-菜单状态', '1', '1', '', '237', '1', '', '1536330275', '1536330933');
INSERT INTO `tp_auth_rule` VALUES ('27', '9', 'Auth/ruleOpen', ' 操作-是否验证', '1', '1', '', '236', '1', '', '1536330318', '1536330480');
INSERT INTO `tp_auth_rule` VALUES ('28', '9', 'Auth/ruleSort', '操作-排序', '1', '1', '', '235', '1', '', '1536330434', '1536330478');
INSERT INTO `tp_auth_rule` VALUES ('29', '0', 'Database', '数据库管理', '1', '1', '', '3', '1', 'fa fa-database', '1536635655', '1536636028');
INSERT INTO `tp_auth_rule` VALUES ('30', '29', 'Database/database', '数据库备份', '1', '1', '', '31', '1', 'fa fa-server', '1536635724', '1536635724');
INSERT INTO `tp_auth_rule` VALUES ('31', '29', 'Database/restore', '还原数据库', '1', '1', '', '32', '1', 'fa fa-recycle', '1536635740', '1536635740');
INSERT INTO `tp_auth_rule` VALUES ('32', '30', 'Database/repair', '操作-修复', '1', '1', '', '311', '1', '', '1536635767', '1536635767');
INSERT INTO `tp_auth_rule` VALUES ('33', '30', 'Database/optimize', '操作-优化', '1', '1', '', '312', '1', '', '1536635780', '1536635780');
INSERT INTO `tp_auth_rule` VALUES ('34', '30', 'Database/backup', '操作-备份', '1', '1', '', '50', '1', '', '1536635798', '1553763716');
INSERT INTO `tp_auth_rule` VALUES ('35', '31', 'Database/import', '操作-还原', '1', '1', '', '321', '1', '', '1536635831', '1536635831');
INSERT INTO `tp_auth_rule` VALUES ('36', '31', 'Database/downFile', '操作-下载', '1', '1', '', '322', '1', '', '1536635860', '1536635860');
INSERT INTO `tp_auth_rule` VALUES ('37', '31', 'Database/delSqlFiles', '操作-删除', '1', '1', '', '323', '1', '', '1536635871', '1536635871');
INSERT INTO `tp_auth_rule` VALUES ('38', '5', 'System/trySend', '操作-测试邮件发送', '1', '1', '', '122', '1', '', '1536653622', '1551863852');
INSERT INTO `tp_auth_rule` VALUES ('60', '0', 'Function', '网站功能', '1', '1', '', '6', '1', 'fa fa-gear', '1540965627', '1540966350');
INSERT INTO `tp_auth_rule` VALUES ('95', '60', 'Debris/index', '碎片管理', '1', '1', '', '64', '1', 'fa fa-gift', '1545728477', '1545728477');
INSERT INTO `tp_auth_rule` VALUES ('96', '95', 'Debris/add', '操作-添加', '1', '1', '', '641', '1', '', '1545728513', '1545728513');
INSERT INTO `tp_auth_rule` VALUES ('97', '95', 'Debris/edit', '  操作-修改', '1', '1', '', '643', '1', '', '1545728548', '1551930413');
INSERT INTO `tp_auth_rule` VALUES ('98', '95', 'Debris/del', '操作-删除', '1', '1', '', '645', '1', '', '1545728564', '1551930402');
INSERT INTO `tp_auth_rule` VALUES ('99', '95', 'Debris/selectDel', '操作-批量删除', '1', '1', '', '646', '1', '', '1545728706', '1551930405');
INSERT INTO `tp_auth_rule` VALUES ('129', '95', 'Debris/addPost', '操作-添加保存', '1', '1', '', '642', '1', '', '1551930385', '1551930385');
INSERT INTO `tp_auth_rule` VALUES ('130', '95', 'Debris/editPost', '操作-修改保存', '1', '1', '', '644', '1', '', '1551930435', '1551930435');
INSERT INTO `tp_auth_rule` VALUES ('131', '95', 'Debris/sort', '操作-排序', '1', '1', '', '647', '1', '', '1551930477', '1551930477');
INSERT INTO `tp_auth_rule` VALUES ('132', '95', 'Debris/state', '操作-状态', '1', '1', '', '648', '1', '', '1551930531', '1551930531');
INSERT INTO `tp_auth_rule` VALUES ('152', '6', 'AdminLog/index', '管理员日志', '1', '1', '', '24', '1', ' fa fa-book', '1553845141', '1553845141');
INSERT INTO `tp_auth_rule` VALUES ('153', '152', 'AdminLog/del', '操作-删除', '1', '1', '', '241', '1', '', '1553845181', '1553845181');
INSERT INTO `tp_auth_rule` VALUES ('154', '152', 'AdminLog/selectDel', '操作-批量删除', '1', '1', '', '242', '1', '', '1553845204', '1553845204');
INSERT INTO `tp_auth_rule` VALUES ('155', '152', 'AdminLog/edit', '操作-查看', '1', '1', '', '243', '1', '', '1553848110', '1553848110');
INSERT INTO `tp_auth_rule` VALUES ('156', '152', 'AdminLog/download', '操作-下载', '1', '1', '', '244', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('157', '1', 'SystemGroup/index', '系统设置分组', '1', '1', '', '14', '1', 'fa  fa-cubes', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('158', '157', 'SystemGroup/add', '操作-添加', '1', '1', '', '141', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('159', '157', 'SystemGroup/addPost', '操作-添加保存', '1', '1', '', '142', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('160', '157', 'SystemGroup/edit', '操作-修改', '1', '1', '', '143', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('161', '157', 'SystemGroup/editPost', '操作-修改保存', '1', '1', '', '144', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('162', '157', 'SystemGroup/del', '修改-删除', '1', '1', '', '145', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('163', '157', 'SystemGroup/selectDel', '修改-批量删除', '1', '1', '', '146', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('164', '157', 'SystemGroup/sort', '修改-排序', '1', '1', '', '147', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('165', '157', 'SystemGroup/state', '修改-状态', '1', '1', '', '147', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('166', '4', 'System/index', '操作-字段列表', '1', '1', '', '112', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('167', '4', 'System/add', '操作-字段添加', '1', '1', '', '113', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('168', '4', 'System/addPost', '操作-字段添加保存', '1', '1', '', '114', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('169', '4', 'System/edit', '操作-字段修改', '1', '1', '', '115', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('170', '4', 'System/editPost', '操作-字段修改保存', '1', '1', '', '116', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('171', '4', 'System/del', '操作-字段删除', '1', '1', '', '117', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('172', '4', 'System/selectDel', '操作-字段批量删除', '1', '1', '', '118', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('173', '4', 'System/sort', '操作-字段排序', '1', '1', '', '119', '1', '', '0', '0');
INSERT INTO `tp_auth_rule` VALUES ('174', '4', 'System/state', '操作-字段状态', '1', '1', '', '120', '1', '', '0', '0');

-- -----------------------------
-- Table structure for `tp_debris`
-- -----------------------------
DROP TABLE IF EXISTS `tp_debris`;
CREATE TABLE `tp_debris` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `name` varchar(255) DEFAULT NULL COMMENT '调用',
  `content` text COMMENT '内容',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` mediumint(8) DEFAULT '50' COMMENT '排序',
  `status` int(1) DEFAULT '0' COMMENT '状态（1 正常，0 锁定）',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='碎片表';

-- -----------------------------
-- Records of `tp_debris`
-- -----------------------------
INSERT INTO `tp_debris` VALUES ('1', '关于我们', 'AboutUs', '<p>SIYUCMS内容管理系统，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。<br />\nSIYUCMS内容管理系统，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。&nbsp;&nbsp;</p>\n\n<p>1</p>\n', '12', '', '3', '111', '1', '1545729604', '1619770238');

-- -----------------------------
-- Table structure for `tp_system`
-- -----------------------------
DROP TABLE IF EXISTS `tp_system`;
CREATE TABLE `tp_system` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `group_id` int(8) NOT NULL COMMENT '系统设置分组id',
  `field` varchar(255) NOT NULL COMMENT '字段名',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '别名',
  `required` tinyint(1) DEFAULT '0' COMMENT '是否必填',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示信息',
  `type` varchar(20) DEFAULT NULL COMMENT '字段类型',
  `setup` text COMMENT '配置信息',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '字段值',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- -----------------------------
-- Records of `tp_system`
-- -----------------------------
INSERT INTO `tp_system` VALUES ('1', '1', 'name', '网站名称', '0', '', 'text', 'array (\n  \'edittype\' => \'ckeditor\',\n)', '1', '1', '', '1557964941', '1619771648');
INSERT INTO `tp_system` VALUES ('2', '1', 'logo', ' 网站LOGO', '0', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', '2', '1', '', '1557968436', '1619771360');
INSERT INTO `tp_system` VALUES ('3', '1', 'icp', '备案号', '0', '', 'text', '', '3', '1', '', '1557968883', '1557986040');
INSERT INTO `tp_system` VALUES ('4', '1', 'copyright', '版权信息', '0', '', 'textarea', '', '4', '1', '', '1557968923', '1557986040');
INSERT INTO `tp_system` VALUES ('5', '1', 'address', '公司地址', '0', '', 'text', '', '6', '1', '', '1557968979', '1557986095');
INSERT INTO `tp_system` VALUES ('6', '1', 'contacts', '联系人', '0', '', 'text', '', '7', '1', '', '1557969011', '1557986096');
INSERT INTO `tp_system` VALUES ('7', '1', 'tel', '联系电话', '0', '', 'text', '', '8', '1', '', '1557969048', '1557986097');
INSERT INTO `tp_system` VALUES ('8', '1', 'mobile_phone', '手机号码', '0', '', 'text', '', '9', '1', '', '1557969066', '1557986098');
INSERT INTO `tp_system` VALUES ('9', '1', 'fax', '传真号码', '0', '', 'text', '', '10', '1', '', '1557969093', '1557986099');
INSERT INTO `tp_system` VALUES ('10', '1', 'email', '邮箱账号', '0', '', 'text', '', '11', '1', '', '1557969113', '1557986109');
INSERT INTO `tp_system` VALUES ('11', '1', 'qq', 'QQ', '0', '', 'text', '', '12', '1', '', '1557969147', '1619753578');
INSERT INTO `tp_system` VALUES ('12', '1', 'qrcode', '二维码', '0', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', '13', '1', '', '1557969170', '1557986111');
INSERT INTO `tp_system` VALUES ('13', '2', 'title', 'SEO标题', '0', '', 'text', '', '21', '1', '', '1557969266', '1557986147');
INSERT INTO `tp_system` VALUES ('14', '2', 'key', 'SEO关键字', '0', '', 'textarea', '', '22', '1', '', '1557969297', '1557986147');
INSERT INTO `tp_system` VALUES ('15', '2', 'des', 'SEO描述', '0', '', 'textarea', '', '23', '1', '', '1557969320', '1557986147');
INSERT INTO `tp_system` VALUES ('17', '3', 'code', '后台验证码', '0', '后台登录时是否需要验证码', 'radio', 'array (\n  \'options\' => \'开启|1\r\n关闭|0\',\n)', '32', '1', '1', '1557969468', '1619771731');
INSERT INTO `tp_system` VALUES ('22', '1', 'url', '网站地址', '0', '', 'text', '', '5', '1', '', '1557986088', '1557986120');

-- -----------------------------
-- Table structure for `tp_system_group`
-- -----------------------------
DROP TABLE IF EXISTS `tp_system_group`;
CREATE TABLE `tp_system_group` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `description` text COMMENT '备注',
  `sort` mediumint(8) DEFAULT '50' COMMENT '排序',
  `status` int(1) DEFAULT '0' COMMENT '状态（1 正常，0 锁定）',
  `create_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统设置分组表';

-- -----------------------------
-- Records of `tp_system_group`
-- -----------------------------
INSERT INTO `tp_system_group` VALUES ('1', '基础设置', '基础设置', '1', '1', '1557903491', '1557903491');
INSERT INTO `tp_system_group` VALUES ('2', 'SEO设置', 'SEO设置', '2', '1', '1557903521', '1557903521');
INSERT INTO `tp_system_group` VALUES ('3', '开关设置', '开关设置', '3', '1', '1557903537', '1557903537');
