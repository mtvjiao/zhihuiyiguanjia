-- -----------------------------
-- Think MySQL Data Transfer 
-- 
-- Host     : localhost
-- Port     : 3306
-- Database : houtai829
-- 
-- Part : #1
-- Date : 2016-12-23 17:28:50
-- -----------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `qw_area`
-- -----------------------------
DROP TABLE IF EXISTS `qw_area`;
CREATE TABLE `qw_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '楼号\\楼层名称',
  `content` text NOT NULL COMMENT '简介',
  `o` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_area`
-- -----------------------------
INSERT INTO `qw_area` VALUES ('1', '0', '一号楼', '', '0');
INSERT INTO `qw_area` VALUES ('2', '1', '一层', '', '0');
INSERT INTO `qw_area` VALUES ('3', '1', '二层', '', '1');
INSERT INTO `qw_area` VALUES ('4', '0', '二号楼', '', '1');
INSERT INTO `qw_area` VALUES ('5', '4', '一层', '', '0');

-- -----------------------------
-- Table structure for `qw_article`
-- -----------------------------
DROP TABLE IF EXISTS `qw_article`;
CREATE TABLE `qw_article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `seotitle` varchar(255) DEFAULT NULL COMMENT '报修人姓名',
  `keywords` varchar(255) NOT NULL COMMENT '报修人联系电话',
  `bumen` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `thumbnail` varchar(255) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `t` int(10) unsigned NOT NULL COMMENT '时间',
  `n` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `zt` int(5) NOT NULL DEFAULT '0' COMMENT '报修单状态0-报修  1-完成  2-已分配 3-维修中',
  `fbz` int(10) DEFAULT NULL COMMENT '维修单所分配的班长',
  `fwx` int(10) DEFAULT NULL COMMENT '维修单所分配的维修工',
  `chengdu` varchar(255) NOT NULL COMMENT '紧急程度',
  `xunjian` int(1) NOT NULL DEFAULT '0' COMMENT '=1是巡检不正常传过来的报修',
  `zhixingsbid` int(20) DEFAULT NULL COMMENT '关联执行设备id',
  `jlid` int(20) DEFAULT NULL COMMENT '关联巡检的id',
  `img0` varchar(200) DEFAULT NULL COMMENT '报修',
  `img1` varchar(200) DEFAULT NULL,
  `img2` varchar(200) DEFAULT NULL,
  `sound0` varchar(200) DEFAULT NULL,
  `sound1` varchar(200) DEFAULT NULL,
  `sound2` varchar(200) DEFAULT NULL,
  `shebeiid` int(200) DEFAULT '0' COMMENT '关联设备id',
  `simg0` varchar(200) DEFAULT NULL COMMENT '维修前',
  `simg1` varchar(200) DEFAULT NULL,
  `simg2` varchar(200) DEFAULT NULL,
  `ssound0` varchar(200) DEFAULT NULL,
  `ssound1` varchar(200) DEFAULT NULL,
  `beforebz` text,
  `ssound2` varchar(200) DEFAULT NULL,
  `fenpei` int(1) NOT NULL DEFAULT '0',
  `cimg0` varchar(200) DEFAULT NULL,
  `cimg1` varchar(200) DEFAULT NULL,
  `cimg2` varchar(200) DEFAULT NULL,
  `csound0` varchar(200) DEFAULT NULL,
  `csound1` varchar(200) DEFAULT NULL,
  `csound2` varchar(200) DEFAULT NULL,
  `afterbz` text,
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_article`
-- -----------------------------
INSERT INTO `qw_article` VALUES ('1', '37', '5', '', '', '', '断水', '', '1', '1467859835', '0', '1', '', '', '', '0', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('2', '37', '5', '', '138693331111', '39', '门坏了', '', '1', '1467882146', '0', '1', '', '', '', '0', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('3', '40', '5', '', '138693331111', '40', '灯坏了', '/Public/attached/201608/1470215970.jpg', '', '1478160499', '0', '1', '', '', '1', '0', '', '', '/Public/attached/201611/1478160326.jpg', '', '', '', '', '', '0', 'beforeupfile/1481609713000.jpg', '', '', '', '', '', '', '1', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('50', '37', '5', 'xunjian', '', '40', 'hihid', '', '', '1479799267', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('48', '38', '3', 'xunjian', '', '40', 'BANG BNAG BANG', '', '', '1479798360', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '', '0', 'afterupfile/1481159660000.jpg', '', '', '', '', '唐一菲由于复合肥', '', '1', '', '', '', '', '', '', '喝喝酒');
INSERT INTO `qw_article` VALUES ('49', '37', '5', 'xunjian', '', '40', '', '', '', '1479798712', '0', '0', '', '', '', '0', '', '', '', '', '', '', '', '', '0', 'beforeupfile/1481100400000.jpg', '', '', '', '', '更大的高高的', '', '1', 'afterupfile/1481874211000.jpg', '', '', '', 'afterupfile/1481521505156.amr', 'afterupfile/1481521511047.amr', '官方官方官方官方');
INSERT INTO `qw_article` VALUES ('58', '40', '2', '', '', '', '', '', '', '1481093883', '0', '0', '', '', '', '1', '1000', '493', '', '', '', 'upfile/1481093875640.amr', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('59', '40', '2', '', '', '', '', '', '', '1481182001', '0', '0', '', '', '', '1', '1008', '494', 'upfile/1481181572000.jpg', 'upfile/1481181580000.jpg', 'upfile/1481181586000.jpg', 'upfile/1481181622821.amr', 'upfile/1481181628814.amr', 'upfile/1481181633960.amr', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('60', '40', '2', '', '', '', '', '', '', '1481182214', '0', '0', '', '', '', '1', '1008', '495', 'upfile/1481181572000.jpg', 'upfile/1481181580000.jpg', 'upfile/1481181586000.jpg', 'upfile/1481181622821.amr', 'upfile/1481181628814.amr', 'upfile/1481181633960.amr', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('61', '40', '2', '', '', '', '', '', '', '1481182216', '0', '0', '', '', '', '1', '1008', '496', 'upfile/1481181572000.jpg', 'upfile/1481181580000.jpg', 'upfile/1481181586000.jpg', 'upfile/1481181622821.amr', 'upfile/1481181628814.amr', 'upfile/1481181633960.amr', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('62', '40', '2', '', '', '', '', '', '', '1481246999', '0', '0', '', '', '', '1', '1014', '497', 'upfile/1481246964000.jpg', '', '', 'upfile/1481246972376.amr', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('63', '40', '2', '', '', '', '', '', '', '1481247025', '0', '0', '', '', '', '1', '1014', '498', 'upfile/1481246964000.jpg', '', '', 'upfile/1481246972376.amr', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('64', '40', '2', '', '', '', '', '', '', '1481247659', '0', '0', '', '', '', '1', '1014', '499', 'upfile/1481247606000.jpg', 'upfile/1481247621000.jpg', 'upfile/1481247627000.jpg', 'upfile/1481247634586.amr', 'upfile/1481247639751.amr', 'upfile/1481247641868.amr', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('65', '40', '2', '', '', '', '', '', '', '1481251123', '0', '0', '', '', '', '1', '1018', '500', 'upfile/1481251086000.jpg', '', '', 'upfile/1481251114739.amr', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('66', '40', '2', '', '', '', '', '', '', '1481251397', '0', '0', '', '', '', '1', '1014', '501', 'upfile/1481251385000.jpg', '', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('67', '38', '5', '李娜', '', '41', 'V5咯咯', '', '', '1481253858', '0', '0', '', '', '', '2', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('68', '40', '2', '', '', '', '', '', '', '1481254089', '0', '0', '', '', '', '1', '1014', '503', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('73', '1', '5', 'xunjian', '', '40', '', '', '', '1482029323', '0', '0', '', '', '', '2', '', '', 'baoxiuupfile/1482029209000.jpg', 'baoxiuupfile/1482029224000.jpg', 'baoxiuupfile/1482029235000.jpg', 'baoxiuupfile/1482029217310.amr', 'baoxiuupfile/1482029307318.amr', 'baoxiuupfile/1482029311313.amr', '0', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('69', '38', '3', '张文', '', '39', '该语句话', '', '', '1481614662', '0', '0', '', '', '', '2', '', '', 'baoxiuupfile/1481614643000.jpg', '', '', 'baoxiuupfile/1481614654147.amr', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('70', '38', '3', '张文', '', '39', '的', '', '', '1481616263', '0', '0', '', '', '', '2', '', '', 'baoxiuupfile/1481616254000.jpg', '', '', '', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('71', '40', '2', '', '', '', '', '', '', '1481618646', '0', '0', '', '', '', '1', '1042', '516', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('72', '40', '2', '', '', '', '', '', '', '1481772603', '0', '0', '', '', '', '1', '1044', '519', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('74', '40', '2', '', '', '', '', '', '', '1482032831', '0', '0', '', '', '', '1', '1063', '521', 'upfile/1482032810000.jpg', 'upfile/1482032832000.jpg', '', 'upfile/1482032826540.amr', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('75', '40', '2', '', '', '', '', '', '', '1482037729', '0', '0', '', '', '', '1', '1062', '522', 'upfile/1482037699000.jpg', 'upfile/1482037709000.jpg', 'upfile/1482037714000.jpg', 'upfile/1482037721134.amr', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('76', '40', '2', '', '', '', '', '', '', '1482037772', '0', '0', '', '', '', '1', '1063', '523', 'upfile/1482037744000.jpg', 'upfile/1482037750000.jpg', 'upfile/1482037755000.jpg', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('77', '38', '3', '李娜', '', '41', '啊啊啊', '', '', '1482038464', '0', '0', '', '', '', '2', '', '', '', '', '', 'baoxiuupfile/1482038458003.amr', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('78', '40', '2', '', '', '', '', '', '', '1482038895', '0', '0', '', '', '', '1', '1062', '524', 'upfile/1482037879000.jpg', 'upfile/1482038886000.jpg', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('79', '40', '2', '', '', '', '', '', '', '1482046610', '0', '1', '', '', '', '1', '1069', '525', 'upfile/1482046580000.jpg', 'upfile/1482046588000.jpg', 'upfile/1482046594000.jpg', 'upfile/1482046601633.amr', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');
INSERT INTO `qw_article` VALUES ('80', '40', '2', '', '', '', '', '', '', '1482222812', '0', '0', '', '', '', '1', '1076', '527', 'upfile/1482222803000.jpg', '', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '');

-- -----------------------------
-- Table structure for `qw_articlefenpei`
-- -----------------------------
DROP TABLE IF EXISTS `qw_articlefenpei`;
CREATE TABLE `qw_articlefenpei` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `aid` int(20) NOT NULL COMMENT '对应报修单的id',
  `fenpeioid` int(20) NOT NULL COMMENT '小组id',
  `xuserid` int(20) NOT NULL COMMENT '分配操作人id  一般是组长',
  `userids` varchar(100) DEFAULT '0' COMMENT '分配组员id',
  `userid` int(20) NOT NULL DEFAULT '0',
  `xtime` int(20) NOT NULL,
  `time` int(20) NOT NULL,
  `utime` int(20) NOT NULL,
  `zt` int(1) NOT NULL DEFAULT '0' COMMENT '//同步主表zt',
  `successt` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_articlefenpei`
-- -----------------------------
INSERT INTO `qw_articlefenpei` VALUES ('12', '3', '39', '6', '4', '4', '0', '1481610295', '1480666271', '0', '1481615570');
INSERT INTO `qw_articlefenpei` VALUES ('28', '48', '39', '6', '3,4,6', '6', '0', '1481098729', '1480662132', '0', '1481160298');
INSERT INTO `qw_articlefenpei` VALUES ('29', '50', '41', '6', '1', '0', '0', '0', '1482030980', '0', '');
INSERT INTO `qw_articlefenpei` VALUES ('30', '49', '41', '6', '1', '6', '0', '0', '1482476589', '0', '');

-- -----------------------------
-- Table structure for `qw_attjl`
-- -----------------------------
DROP TABLE IF EXISTS `qw_attjl`;
CREATE TABLE `qw_attjl` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jlid` int(10) NOT NULL COMMENT '关联记录id',
  `projectid` int(10) NOT NULL COMMENT '关联项目id',
  `attributeid` int(10) NOT NULL COMMENT '关联属性id',
  `zt` int(2) NOT NULL COMMENT '状态',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `shebeiid` int(100) NOT NULL COMMENT '关联设备id',
  `prid` int(100) NOT NULL COMMENT '关联大类id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=391 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_attjl`
-- -----------------------------
INSERT INTO `qw_attjl` VALUES ('1', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('2', '1', '1', '3', '0', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('3', '1', '5', '4', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('4', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('5', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('6', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('7', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('8', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('9', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('10', '1', '1', '1', '1', '', '1', '0');
INSERT INTO `qw_attjl` VALUES ('11', '1', '1', '1', '1', '', '1', '12');
INSERT INTO `qw_attjl` VALUES ('12', '1', '1', '1', '1', '', '1', '13');
INSERT INTO `qw_attjl` VALUES ('13', '1', '1', '1', '1', '', '1', '15');
INSERT INTO `qw_attjl` VALUES ('14', '1', '1', '1', '1', '', '1', '16');
INSERT INTO `qw_attjl` VALUES ('15', '1', '1', '1', '1', '', '1', '19');
INSERT INTO `qw_attjl` VALUES ('17', '1', '1', '1', '1', '', '1', '18');
INSERT INTO `qw_attjl` VALUES ('18', '1', '1', '1', '1', '', '1', '26');
INSERT INTO `qw_attjl` VALUES ('19', '1', '1', '1', '1', '', '1', '27');
INSERT INTO `qw_attjl` VALUES ('20', '1', '1', '1', '1', '', '1', '29');
INSERT INTO `qw_attjl` VALUES ('21', '1', '1', '1', '1', '', '1', '32');
INSERT INTO `qw_attjl` VALUES ('22', '1', '1', '1', '1', '', '1', '35');
INSERT INTO `qw_attjl` VALUES ('23', '1', '1', '1', '1', '', '1', '36');
INSERT INTO `qw_attjl` VALUES ('24', '1', '1', '1', '1', '', '1', '48');
INSERT INTO `qw_attjl` VALUES ('26', '1', '1', '1', '1', '', '1', '54');
INSERT INTO `qw_attjl` VALUES ('27', '1', '1', '1', '1', '', '1', '58');
INSERT INTO `qw_attjl` VALUES ('28', '1', '1', '1', '1', '', '1', '57');
INSERT INTO `qw_attjl` VALUES ('29', '1', '1', '11', '1', '', '1', '60');
INSERT INTO `qw_attjl` VALUES ('30', '1', '1', '8', '1', '', '1', '61');
INSERT INTO `qw_attjl` VALUES ('31', '1', '1', '1', '1', '', '1', '64');
INSERT INTO `qw_attjl` VALUES ('32', '1', '1', '1', '1', '', '1', '67');
INSERT INTO `qw_attjl` VALUES ('33', '1', '1', '1', '1', '', '1', '70');
INSERT INTO `qw_attjl` VALUES ('34', '1', '1', '1', '0', '', '1', '73');
INSERT INTO `qw_attjl` VALUES ('35', '1', '1', '1', '0', '', '1', '72');
INSERT INTO `qw_attjl` VALUES ('36', '1', '1', '1', '0', '', '1', '75');
INSERT INTO `qw_attjl` VALUES ('37', '1', '1', '1', '0', '', '1', '76');
INSERT INTO `qw_attjl` VALUES ('38', '1', '1', '1', '1', '', '1', '77');
INSERT INTO `qw_attjl` VALUES ('39', '1', '1', '1', '1', '', '1', '79');
INSERT INTO `qw_attjl` VALUES ('40', '1', '1', '1', '1', '', '1', '80');
INSERT INTO `qw_attjl` VALUES ('41', '1', '1', '1', '1', '', '1', '83');
INSERT INTO `qw_attjl` VALUES ('42', '1', '1', '1', '1', '', '1', '82');
INSERT INTO `qw_attjl` VALUES ('43', '1', '1', '1', '1', '', '1', '86');
INSERT INTO `qw_attjl` VALUES ('44', '1', '1', '1', '1', '', '1', '89');
INSERT INTO `qw_attjl` VALUES ('45', '1', '1', '1', '1', '', '1', '92');
INSERT INTO `qw_attjl` VALUES ('46', '1', '1', '1', '1', '', '1', '95');
INSERT INTO `qw_attjl` VALUES ('47', '1', '1', '1', '1', '', '1', '98');
INSERT INTO `qw_attjl` VALUES ('48', '1', '1', '1', '1', '', '1', '101');
INSERT INTO `qw_attjl` VALUES ('49', '1', '1', '1', '1', '', '1', '104');
INSERT INTO `qw_attjl` VALUES ('50', '1', '1', '1', '1', '', '1', '107');
INSERT INTO `qw_attjl` VALUES ('51', '1', '1', '1', '1', '', '1', '110');
INSERT INTO `qw_attjl` VALUES ('52', '1', '1', '1', '1', '', '1', '113');
INSERT INTO `qw_attjl` VALUES ('53', '1', '1', '1', '1', '', '1', '116');
INSERT INTO `qw_attjl` VALUES ('54', '1', '1', '1', '1', '', '1', '119');
INSERT INTO `qw_attjl` VALUES ('55', '1', '1', '1', '1', '', '1', '122');
INSERT INTO `qw_attjl` VALUES ('56', '1', '1', '1', '1', '', '1', '125');
INSERT INTO `qw_attjl` VALUES ('57', '1', '1', '1', '1', '', '1', '128');
INSERT INTO `qw_attjl` VALUES ('58', '1', '1', '1', '1', '', '1', '131');
INSERT INTO `qw_attjl` VALUES ('59', '1', '1', '1', '1', '', '1', '134');
INSERT INTO `qw_attjl` VALUES ('60', '1', '1', '1', '1', '', '1', '137');
INSERT INTO `qw_attjl` VALUES ('61', '1', '1', '1', '1', '', '1', '140');
INSERT INTO `qw_attjl` VALUES ('62', '1', '1', '1', '1', '', '1', '143');
INSERT INTO `qw_attjl` VALUES ('63', '1', '1', '1', '1', '', '1', '142');
INSERT INTO `qw_attjl` VALUES ('64', '1', '1', '1', '1', '', '1', '146');
INSERT INTO `qw_attjl` VALUES ('65', '1', '13', '8', '1', '', '1', '152');
INSERT INTO `qw_attjl` VALUES ('66', '1', '13', '8', '1', '', '1', '155');
INSERT INTO `qw_attjl` VALUES ('67', '1', '13', '8', '1', '', '1', '158');
INSERT INTO `qw_attjl` VALUES ('68', '1', '1', '1', '1', '', '1', '157');
INSERT INTO `qw_attjl` VALUES ('69', '1', '1', '1', '1', '', '1', '157');
INSERT INTO `qw_attjl` VALUES ('70', '1', '13', '8', '1', '', '1', '161');
INSERT INTO `qw_attjl` VALUES ('78', '1', '13', '8', '1', '', '1', '164');
INSERT INTO `qw_attjl` VALUES ('79', '1', '1', '11', '1', '', '1', '163');
INSERT INTO `qw_attjl` VALUES ('80', '1', '1', '1', '1', '', '1', '163');
INSERT INTO `qw_attjl` VALUES ('81', '1', '1', '1', '1', '', '1', '163');
INSERT INTO `qw_attjl` VALUES ('82', '1', '1', '1', '1', '', '1', '163');
INSERT INTO `qw_attjl` VALUES ('83', '1', '1', '1', '1', '', '1', '163');
INSERT INTO `qw_attjl` VALUES ('84', '1', '1', '1', '1', '', '1', '163');
INSERT INTO `qw_attjl` VALUES ('85', '1', '5', '11', '1', '', '1', '166');
INSERT INTO `qw_attjl` VALUES ('86', '1', '1', '8', '1', '', '1', '167');
INSERT INTO `qw_attjl` VALUES ('87', '1', '13', '8', '1', '', '1', '170');
INSERT INTO `qw_attjl` VALUES ('88', '1', '2', '2', '1', '', '16', '171');
INSERT INTO `qw_attjl` VALUES ('89', '1', '2', '2', '1', '', '16', '172');
INSERT INTO `qw_attjl` VALUES ('90', '1', '2', '2', '1', '', '16', '173');
INSERT INTO `qw_attjl` VALUES ('91', '1', '17', '17', '1', '', '20', '174');
INSERT INTO `qw_attjl` VALUES ('92', '1', '1', '8', '1', '', '1', '175');
INSERT INTO `qw_attjl` VALUES ('93', '1', '1', '17', '1', '', '20', '176');
INSERT INTO `qw_attjl` VALUES ('94', '1', '1', '16', '1', '', '19', '177');
INSERT INTO `qw_attjl` VALUES ('95', '1', '2', '2', '1', '', '16', '178');
INSERT INTO `qw_attjl` VALUES ('96', '1', '18', '18', '1', '', '21', '179');
INSERT INTO `qw_attjl` VALUES ('97', '1', '2', '2', '1', '', '16', '180');
INSERT INTO `qw_attjl` VALUES ('98', '1', '2', '2', '1', '', '16', '181');
INSERT INTO `qw_attjl` VALUES ('99', '1', '2', '2', '1', '', '16', '182');
INSERT INTO `qw_attjl` VALUES ('100', '1', '2', '2', '1', '', '16', '183');
INSERT INTO `qw_attjl` VALUES ('101', '1', '2', '2', '1', '', '16', '184');
INSERT INTO `qw_attjl` VALUES ('102', '1', '9', '14', '1', '', '17', '185');
INSERT INTO `qw_attjl` VALUES ('103', '1', '1', '11', '1', '', '1', '169');
INSERT INTO `qw_attjl` VALUES ('104', '1', '9', '14', '1', '', '17', '186');
INSERT INTO `qw_attjl` VALUES ('105', '1', '9', '14', '1', '', '17', '187');
INSERT INTO `qw_attjl` VALUES ('106', '1', '2', '2', '1', '', '16', '188');
INSERT INTO `qw_attjl` VALUES ('107', '1', '3', '16', '0', '', '19', '189');
INSERT INTO `qw_attjl` VALUES ('108', '1', '3', '16', '1', '', '19', '190');
INSERT INTO `qw_attjl` VALUES ('109', '1', '13', '8', '1', '', '1', '193');
INSERT INTO `qw_attjl` VALUES ('110', '1', '18', '18', '1', '', '21', '194');
INSERT INTO `qw_attjl` VALUES ('111', '1', '1', '11', '1', '', '1', '192');
INSERT INTO `qw_attjl` VALUES ('112', '1', '5', '11', '1', '', '1', '196');
INSERT INTO `qw_attjl` VALUES ('113', '1', '2', '2', '0', '', '16', '198');
INSERT INTO `qw_attjl` VALUES ('114', '1', '2', '2', '0', '', '16', '199');
INSERT INTO `qw_attjl` VALUES ('115', '1', '2', '2', '0', '', '16', '200');
INSERT INTO `qw_attjl` VALUES ('116', '1', '2', '2', '0', '', '16', '201');
INSERT INTO `qw_attjl` VALUES ('117', '1', '2', '2', '0', '', '16', '202');
INSERT INTO `qw_attjl` VALUES ('118', '1', '2', '2', '0', '', '16', '203');
INSERT INTO `qw_attjl` VALUES ('119', '1', '2', '2', '0', '', '16', '204');
INSERT INTO `qw_attjl` VALUES ('120', '1', '2', '2', '0', '', '16', '205');
INSERT INTO `qw_attjl` VALUES ('121', '1', '2', '2', '0', '', '16', '206');
INSERT INTO `qw_attjl` VALUES ('122', '1', '2', '2', '0', '', '16', '207');
INSERT INTO `qw_attjl` VALUES ('123', '1', '2', '2', '1', '', '16', '208');
INSERT INTO `qw_attjl` VALUES ('124', '1', '2', '2', '0', '', '16', '209');
INSERT INTO `qw_attjl` VALUES ('125', '1', '2', '2', '0', '', '16', '210');
INSERT INTO `qw_attjl` VALUES ('126', '1', '2', '2', '0', '', '16', '211');
INSERT INTO `qw_attjl` VALUES ('127', '1', '2', '2', '0', '', '16', '212');
INSERT INTO `qw_attjl` VALUES ('128', '1', '2', '2', '0', '', '16', '213');
INSERT INTO `qw_attjl` VALUES ('129', '1', '2', '2', '0', '', '16', '214');
INSERT INTO `qw_attjl` VALUES ('130', '1', '2', '2', '0', '', '16', '215');
INSERT INTO `qw_attjl` VALUES ('131', '1', '2', '2', '0', '', '16', '216');
INSERT INTO `qw_attjl` VALUES ('132', '1', '2', '2', '0', '', '16', '217');
INSERT INTO `qw_attjl` VALUES ('133', '1', '2', '2', '0', '', '16', '218');
INSERT INTO `qw_attjl` VALUES ('134', '1', '2', '2', '0', '', '16', '219');
INSERT INTO `qw_attjl` VALUES ('135', '1', '2', '2', '0', '', '16', '220');
INSERT INTO `qw_attjl` VALUES ('136', '1', '2', '2', '0', '', '16', '221');
INSERT INTO `qw_attjl` VALUES ('137', '1', '1', '8', '1', '', '1', '197');
INSERT INTO `qw_attjl` VALUES ('138', '1', '5', '11', '1', '', '1', '223');
INSERT INTO `qw_attjl` VALUES ('139', '1', '1', '8', '1', '', '1', '224');
INSERT INTO `qw_attjl` VALUES ('140', '1', '5', '11', '1', '', '1', '226');
INSERT INTO `qw_attjl` VALUES ('141', '1', '2', '2', '1', '', '16', '228');
INSERT INTO `qw_attjl` VALUES ('142', '1', '10', '15', '0', '', '18', '229');
INSERT INTO `qw_attjl` VALUES ('143', '1', '10', '15', '0', '', '18', '230');
INSERT INTO `qw_attjl` VALUES ('144', '1', '1', '8', '0', '', '1', '227');
INSERT INTO `qw_attjl` VALUES ('145', '1', '13', '8', '0', '', '1', '233');
INSERT INTO `qw_attjl` VALUES ('146', '1', '2', '2', '0', '', '16', '234');
INSERT INTO `qw_attjl` VALUES ('147', '1', '2', '2', '1', '', '16', '235');
INSERT INTO `qw_attjl` VALUES ('148', '1', '2', '2', '1', '', '16', '236');
INSERT INTO `qw_attjl` VALUES ('149', '1', '2', '2', '1', '', '16', '237');
INSERT INTO `qw_attjl` VALUES ('150', '1', '10', '15', '1', '', '18', '238');
INSERT INTO `qw_attjl` VALUES ('151', '1', '2', '2', '1', '', '16', '239');
INSERT INTO `qw_attjl` VALUES ('152', '1', '10', '15', '1', '', '18', '240');
INSERT INTO `qw_attjl` VALUES ('153', '1', '1', '11', '1', '', '1', '232');
INSERT INTO `qw_attjl` VALUES ('154', '1', '5', '11', '1', '', '1', '242');
INSERT INTO `qw_attjl` VALUES ('155', '1', '1', '8', '1', '', '1', '243');
INSERT INTO `qw_attjl` VALUES ('156', '1', '13', '8', '1', '', '1', '246');
INSERT INTO `qw_attjl` VALUES ('157', '1', '13', '8', '1', '', '2', '249');
INSERT INTO `qw_attjl` VALUES ('158', '1', '13', '8', '1', '', '2', '252');
INSERT INTO `qw_attjl` VALUES ('159', '1', '13', '8', '1', '', '2', '255');
INSERT INTO `qw_attjl` VALUES ('160', '1', '13', '8', '1', '', '2', '258');
INSERT INTO `qw_attjl` VALUES ('161', '1', '13', '8', '1', '', '2', '261');
INSERT INTO `qw_attjl` VALUES ('162', '1', '13', '8', '1', '', '2', '264');
INSERT INTO `qw_attjl` VALUES ('163', '1', '2', '2', '0', '', '16', '265');
INSERT INTO `qw_attjl` VALUES ('164', '1', '2', '2', '1', '', '16', '266');
INSERT INTO `qw_attjl` VALUES ('165', '1', '10', '15', '1', '', '18', '267');
INSERT INTO `qw_attjl` VALUES ('166', '1', '10', '15', '1', '', '18', '268');
INSERT INTO `qw_attjl` VALUES ('167', '1', '10', '15', '1', '', '18', '269');
INSERT INTO `qw_attjl` VALUES ('168', '1', '10', '15', '1', '', '18', '270');
INSERT INTO `qw_attjl` VALUES ('169', '1', '10', '15', '1', '', '18', '271');
INSERT INTO `qw_attjl` VALUES ('170', '1', '10', '15', '1', '', '18', '272');
INSERT INTO `qw_attjl` VALUES ('171', '1', '10', '15', '1', '', '18', '273');
INSERT INTO `qw_attjl` VALUES ('172', '1', '10', '15', '1', '', '18', '274');
INSERT INTO `qw_attjl` VALUES ('173', '1', '13', '8', '1', '', '1', '277');
INSERT INTO `qw_attjl` VALUES ('174', '1', '2', '2', '0', '', '16', '278');
INSERT INTO `qw_attjl` VALUES ('175', '1', '10', '15', '0', '', '18', '279');
INSERT INTO `qw_attjl` VALUES ('176', '1', '10', '15', '1', '', '18', '280');
INSERT INTO `qw_attjl` VALUES ('177', '1', '1', '11', '0', '', '1', '276');
INSERT INTO `qw_attjl` VALUES ('178', '1', '13', '8', '1', '', '1', '283');
INSERT INTO `qw_attjl` VALUES ('179', '1', '1', '11', '0', '', '1', '282');
INSERT INTO `qw_attjl` VALUES ('180', '1', '5', '11', '0', '', '1', '285');
INSERT INTO `qw_attjl` VALUES ('181', '1', '1', '8', '1', '', '1', '286');
INSERT INTO `qw_attjl` VALUES ('182', '1', '13', '8', '1', '', '1', '289');
INSERT INTO `qw_attjl` VALUES ('183', '1', '13', '8', '1', '', '2', '292');
INSERT INTO `qw_attjl` VALUES ('184', '1', '13', '8', '1', '', '1', '295');
INSERT INTO `qw_attjl` VALUES ('185', '1', '1', '11', '0', '', '1', '294');
INSERT INTO `qw_attjl` VALUES ('186', '1', '13', '8', '1', '', '1', '298');
INSERT INTO `qw_attjl` VALUES ('187', '1', '1', '11', '1', '', '1', '297');
INSERT INTO `qw_attjl` VALUES ('188', '1', '5', '11', '1', '', '1', '300');
INSERT INTO `qw_attjl` VALUES ('189', '1', '1', '8', '1', '', '2', '301');
INSERT INTO `qw_attjl` VALUES ('190', '1', '5', '11', '0', '', '1', '303');
INSERT INTO `qw_attjl` VALUES ('191', '1', '1', '8', '1', '', '2', '304');
INSERT INTO `qw_attjl` VALUES ('192', '1', '3', '16', '0', '', '19', '305');
INSERT INTO `qw_attjl` VALUES ('193', '1', '3', '16', '1', '', '19', '306');
INSERT INTO `qw_attjl` VALUES ('194', '1', '10', '15', '0', '', '18', '307');
INSERT INTO `qw_attjl` VALUES ('195', '1', '10', '15', '1', '', '18', '308');
INSERT INTO `qw_attjl` VALUES ('196', '1', '5', '11', '0', '', '1', '310');
INSERT INTO `qw_attjl` VALUES ('197', '1', '1', '8', '1', '', '1', '311');
INSERT INTO `qw_attjl` VALUES ('198', '1', '2', '2', '1', '', '16', '312');
INSERT INTO `qw_attjl` VALUES ('199', '1', '2', '2', '1', '', '16', '313');
INSERT INTO `qw_attjl` VALUES ('200', '1', '13', '8', '1', '', '82', '316');
INSERT INTO `qw_attjl` VALUES ('201', '1', '2', '2', '1', '', '16', '317');
INSERT INTO `qw_attjl` VALUES ('202', '1', '2', '2', '1', '', '16', '318');
INSERT INTO `qw_attjl` VALUES ('203', '1', '10', '15', '0', '', '100', '319');
INSERT INTO `qw_attjl` VALUES ('204', '1', '3', '16', '1', '', '95', '320');
INSERT INTO `qw_attjl` VALUES ('205', '1', '5', '11', '1', '', '88', '322');
INSERT INTO `qw_attjl` VALUES ('206', '1', '3', '16', '1', '', '92', '324');
INSERT INTO `qw_attjl` VALUES ('207', '1', '5', '11', '0', '', '87', '326');
INSERT INTO `qw_attjl` VALUES ('208', '1', '10', '15', '0', '', '100', '328');
INSERT INTO `qw_attjl` VALUES ('209', '1', '9', '14', '1', '', '97', '329');
INSERT INTO `qw_attjl` VALUES ('210', '1', '10', '15', '1', '', '99', '330');
INSERT INTO `qw_attjl` VALUES ('211', '1', '2', '2', '1', '', '16', '331');
INSERT INTO `qw_attjl` VALUES ('212', '1', '2', '2', '1', '', '16', '331');
INSERT INTO `qw_attjl` VALUES ('213', '1', '2', '2', '1', '', '16', '331');
INSERT INTO `qw_attjl` VALUES ('214', '1', '20', '21', '0', '', '112', '334');
INSERT INTO `qw_attjl` VALUES ('215', '1', '11', '19', '0', '', '105', '335');
INSERT INTO `qw_attjl` VALUES ('216', '1', '11', '19', '1', '', '78', '336');
INSERT INTO `qw_attjl` VALUES ('217', '1', '11', '19', '1', '', '105', '337');
INSERT INTO `qw_attjl` VALUES ('218', '1', '11', '19', '1', '', '102', '338');
INSERT INTO `qw_attjl` VALUES ('219', '1', '11', '19', '0', '', '102', '339');
INSERT INTO `qw_attjl` VALUES ('220', '1', '11', '19', '1', '', '80', '340');
INSERT INTO `qw_attjl` VALUES ('221', '1', '13', '8', '1', '', '1', '343');
INSERT INTO `qw_attjl` VALUES ('222', '1', '3', '16', '1', '', '93', '344');
INSERT INTO `qw_attjl` VALUES ('223', '1', '10', '15', '1', '', '101', '345');
INSERT INTO `qw_attjl` VALUES ('224', '1', '19', '20', '1', '', '107', '346');
INSERT INTO `qw_attjl` VALUES ('225', '1', '1', '11', '0', '', '87', '342');
INSERT INTO `qw_attjl` VALUES ('226', '1', '19', '20', '0', '', '107', '347');
INSERT INTO `qw_attjl` VALUES ('227', '1', '3', '16', '0', '', '93', '348');
INSERT INTO `qw_attjl` VALUES ('228', '1', '10', '15', '0', '', '101', '349');
INSERT INTO `qw_attjl` VALUES ('229', '1', '13', '8', '0', '', '87', '352');
INSERT INTO `qw_attjl` VALUES ('230', '1', '1', '11', '0', '', '87', '351');
INSERT INTO `qw_attjl` VALUES ('231', '1', '13', '8', '1', '', '87', '355');
INSERT INTO `qw_attjl` VALUES ('232', '1', '1', '11', '1', '', '87', '354');
INSERT INTO `qw_attjl` VALUES ('233', '1', '19', '20', '1', '', '107', '356');
INSERT INTO `qw_attjl` VALUES ('234', '1', '3', '16', '1', '', '93', '357');
INSERT INTO `qw_attjl` VALUES ('235', '1', '10', '15', '1', '', '101', '358');
INSERT INTO `qw_attjl` VALUES ('236', '1', '13', '8', '1', '', '87', '361');
INSERT INTO `qw_attjl` VALUES ('237', '1', '19', '20', '1', '', '107', '362');
INSERT INTO `qw_attjl` VALUES ('238', '1', '1', '11', '0', '', '87', '360');
INSERT INTO `qw_attjl` VALUES ('239', '1', '3', '16', '0', '', '93', '363');
INSERT INTO `qw_attjl` VALUES ('240', '1', '5', '11', '0', '', '87', '365');
INSERT INTO `qw_attjl` VALUES ('241', '1', '1', '8', '0', '', '87', '366');
INSERT INTO `qw_attjl` VALUES ('242', '1', '13', '8', '1', '', '87', '369');
INSERT INTO `qw_attjl` VALUES ('243', '1', '1', '11', '1', '', '87', '368');
INSERT INTO `qw_attjl` VALUES ('244', '1', '20', '21', '0', '', '113', '370');
INSERT INTO `qw_attjl` VALUES ('245', '1', '20', '21', '1', '', '113', '371');
INSERT INTO `qw_attjl` VALUES ('246', '1', '20', '21', '1', '', '113', '372');
INSERT INTO `qw_attjl` VALUES ('247', '1', '21', '22', '1', '', '115', '373');
INSERT INTO `qw_attjl` VALUES ('248', '1', '11', '19', '1', '', '102', '374');
INSERT INTO `qw_attjl` VALUES ('249', '1', '13', '8', '1', '', '1', '377');
INSERT INTO `qw_attjl` VALUES ('250', '1', '20', '21', '1', '', '113', '378');
INSERT INTO `qw_attjl` VALUES ('251', '1', '20', '21', '1', '', '113', '379');
INSERT INTO `qw_attjl` VALUES ('252', '1', '20', '21', '1', '', '113', '380');
INSERT INTO `qw_attjl` VALUES ('253', '1', '20', '21', '1', '', '113', '381');
INSERT INTO `qw_attjl` VALUES ('254', '1', '10', '15', '0', '', '101', '382');
INSERT INTO `qw_attjl` VALUES ('255', '1', '3', '16', '1', '', '90', '383');
INSERT INTO `qw_attjl` VALUES ('256', '1', '17', '17', '1', '', '20', '384');
INSERT INTO `qw_attjl` VALUES ('257', '1', '0', '0', '1', '', '1', '385');
INSERT INTO `qw_attjl` VALUES ('258', '1', '1', '1', '1', '', '1', '386');
INSERT INTO `qw_attjl` VALUES ('259', '1', '1', '1', '1', '', '1', '387');
INSERT INTO `qw_attjl` VALUES ('260', '1', '1', '1', '0', '', '1', '388');
INSERT INTO `qw_attjl` VALUES ('261', '1', '1', '1', '1', '', '1', '389');
INSERT INTO `qw_attjl` VALUES ('262', '1', '1', '1', '1', '', '1', '390');
INSERT INTO `qw_attjl` VALUES ('263', '1', '1', '1', '0', '', '1', '391');
INSERT INTO `qw_attjl` VALUES ('264', '1', '1', '1', '1', '', '2', '392');
INSERT INTO `qw_attjl` VALUES ('265', '1', '1', '1', '1', '', '1', '393');
INSERT INTO `qw_attjl` VALUES ('266', '1', '1', '1', '1', '', '1', '394');
INSERT INTO `qw_attjl` VALUES ('267', '1', '1', '1', '0', '', '1', '395');
INSERT INTO `qw_attjl` VALUES ('268', '1', '1', '1', '1', '', '1', '396');
INSERT INTO `qw_attjl` VALUES ('269', '1', '1', '1', '0', '', '2', '397');
INSERT INTO `qw_attjl` VALUES ('270', '1', '1', '1', '1', '', '1', '398');
INSERT INTO `qw_attjl` VALUES ('271', '1', '1', '1', '1', '', '1', '399');
INSERT INTO `qw_attjl` VALUES ('272', '1', '1', '1', '1', '', '1', '400');
INSERT INTO `qw_attjl` VALUES ('273', '1', '1', '1', '0', '', '3', '401');
INSERT INTO `qw_attjl` VALUES ('274', '1', '1', '1', '1', '', '1', '402');
INSERT INTO `qw_attjl` VALUES ('275', '1', '1', '1', '0', '', '1', '403');
INSERT INTO `qw_attjl` VALUES ('276', '1', '1', '1', '1', '', '1', '404');
INSERT INTO `qw_attjl` VALUES ('277', '1', '1', '1', '0', '', '2', '405');
INSERT INTO `qw_attjl` VALUES ('278', '1', '1', '1', '1', '', '3', '406');
INSERT INTO `qw_attjl` VALUES ('279', '1', '1', '1', '1', '', '3', '407');
INSERT INTO `qw_attjl` VALUES ('280', '1', '1', '1', '1', '', '2', '408');
INSERT INTO `qw_attjl` VALUES ('281', '1', '1', '1', '0', '', '1', '409');
INSERT INTO `qw_attjl` VALUES ('282', '1', '1', '1', '0', '', '1', '410');
INSERT INTO `qw_attjl` VALUES ('283', '1', '1', '1', '1', '', '1', '411');
INSERT INTO `qw_attjl` VALUES ('284', '1', '1', '1', '1', '', '1', '417');
INSERT INTO `qw_attjl` VALUES ('285', '1', '1', '1', '1', '', '1', '419');
INSERT INTO `qw_attjl` VALUES ('286', '1', '1', '1', '1', '', '1', '421');
INSERT INTO `qw_attjl` VALUES ('287', '1', '1', '1', '1', '', '1', '422');
INSERT INTO `qw_attjl` VALUES ('288', '1', '1', '1', '1', '', '1', '426');
INSERT INTO `qw_attjl` VALUES ('289', '1', '1', '1', '1', '', '1', '427');
INSERT INTO `qw_attjl` VALUES ('290', '1', '1', '1', '1', '', '1', '428');
INSERT INTO `qw_attjl` VALUES ('291', '1', '1', '1', '0', '', '1', '429');
INSERT INTO `qw_attjl` VALUES ('292', '1', '1', '1', '1', '', '2', '430');
INSERT INTO `qw_attjl` VALUES ('293', '1', '1', '1', '1', '', '3', '431');
INSERT INTO `qw_attjl` VALUES ('294', '1', '1', '27', '1', '', '3', '432');
INSERT INTO `qw_attjl` VALUES ('295', '1', '1', '27', '1', '', '3', '433');
INSERT INTO `qw_attjl` VALUES ('296', '1', '1', '27', '1', '', '1', '434');
INSERT INTO `qw_attjl` VALUES ('297', '1', '1', '27', '0', '', '1', '435');
INSERT INTO `qw_attjl` VALUES ('298', '1', '1', '27', '1', '', '1', '436');
INSERT INTO `qw_attjl` VALUES ('299', '1', '1', '27', '1', '', '1', '437');
INSERT INTO `qw_attjl` VALUES ('300', '1', '1', '27', '1', '', '1', '438');
INSERT INTO `qw_attjl` VALUES ('301', '1', '1', '27', '1', '', '1', '439');
INSERT INTO `qw_attjl` VALUES ('302', '1', '1', '27', '1', '', '1', '440');
INSERT INTO `qw_attjl` VALUES ('303', '1', '1', '27', '1', '', '1', '441');
INSERT INTO `qw_attjl` VALUES ('304', '1', '1', '27', '1', '', '1', '442');
INSERT INTO `qw_attjl` VALUES ('305', '1', '1', '27', '1', '', '1', '443');
INSERT INTO `qw_attjl` VALUES ('306', '1', '1', '27', '1', '', '1', '444');
INSERT INTO `qw_attjl` VALUES ('307', '1', '1', '27', '1', '', '1', '445');
INSERT INTO `qw_attjl` VALUES ('308', '1', '1', '27', '1', '', '1', '446');
INSERT INTO `qw_attjl` VALUES ('309', '1', '1', '27', '1', '', '1', '447');
INSERT INTO `qw_attjl` VALUES ('310', '1', '1', '27', '0', '', '1', '448');
INSERT INTO `qw_attjl` VALUES ('311', '1', '1', '27', '0', '', '1', '449');
INSERT INTO `qw_attjl` VALUES ('312', '1', '1', '27', '0', '', '1', '450');
INSERT INTO `qw_attjl` VALUES ('313', '1', '1', '27', '0', '', '1', '451');
INSERT INTO `qw_attjl` VALUES ('314', '1', '1', '27', '0', '', '1', '452');
INSERT INTO `qw_attjl` VALUES ('315', '1', '1', '27', '0', '', '1', '453');
INSERT INTO `qw_attjl` VALUES ('316', '1', '1', '27', '0', '', '1', '454');
INSERT INTO `qw_attjl` VALUES ('317', '1', '1', '27', '0', '', '1', '455');
INSERT INTO `qw_attjl` VALUES ('318', '1', '1', '27', '0', '', '1', '456');
INSERT INTO `qw_attjl` VALUES ('319', '1', '1', '27', '0', '', '1', '457');
INSERT INTO `qw_attjl` VALUES ('320', '1', '1', '27', '0', '', '1', '458');
INSERT INTO `qw_attjl` VALUES ('321', '1', '1', '27', '0', '', '1', '459');
INSERT INTO `qw_attjl` VALUES ('322', '1', '1', '27', '0', '', '1', '460');
INSERT INTO `qw_attjl` VALUES ('323', '1', '1', '27', '0', '', '1', '461');
INSERT INTO `qw_attjl` VALUES ('324', '1', '1', '27', '0', '', '1', '462');
INSERT INTO `qw_attjl` VALUES ('325', '1', '1', '27', '0', '', '1', '463');
INSERT INTO `qw_attjl` VALUES ('326', '1', '1', '27', '0', '', '1', '464');
INSERT INTO `qw_attjl` VALUES ('327', '1', '1', '27', '0', '', '1', '465');
INSERT INTO `qw_attjl` VALUES ('328', '1', '1', '27', '0', '', '1', '466');
INSERT INTO `qw_attjl` VALUES ('329', '1', '1', '27', '0', '', '1', '467');
INSERT INTO `qw_attjl` VALUES ('330', '1', '1', '27', '0', '', '1', '468');
INSERT INTO `qw_attjl` VALUES ('331', '1', '1', '27', '0', '', '1', '469');
INSERT INTO `qw_attjl` VALUES ('332', '1', '1', '27', '0', '', '1', '470');
INSERT INTO `qw_attjl` VALUES ('333', '1', '1', '27', '1', '', '1', '471');
INSERT INTO `qw_attjl` VALUES ('334', '1', '1', '27', '1', '', '1', '472');
INSERT INTO `qw_attjl` VALUES ('335', '1', '1', '27', '1', '', '1', '473');
INSERT INTO `qw_attjl` VALUES ('336', '1', '1', '27', '1', '', '1', '474');
INSERT INTO `qw_attjl` VALUES ('337', '1', '1', '27', '0', '', '1', '475');
INSERT INTO `qw_attjl` VALUES ('338', '1', '1', '27', '0', '', '1', '476');
INSERT INTO `qw_attjl` VALUES ('339', '1', '1', '27', '0', '', '1', '477');
INSERT INTO `qw_attjl` VALUES ('340', '1', '1', '27', '0', '', '1', '478');
INSERT INTO `qw_attjl` VALUES ('341', '1', '1', '27', '0', '', '1', '479');
INSERT INTO `qw_attjl` VALUES ('342', '1', '1', '27', '0', '', '1', '480');
INSERT INTO `qw_attjl` VALUES ('343', '1', '1', '27', '0', '', '1', '481');
INSERT INTO `qw_attjl` VALUES ('344', '1', '1', '27', '0', '', '1', '482');
INSERT INTO `qw_attjl` VALUES ('345', '1', '1', '27', '0', '', '1', '483');
INSERT INTO `qw_attjl` VALUES ('346', '1', '1', '27', '1', '', '1', '484');
INSERT INTO `qw_attjl` VALUES ('347', '1', '1', '27', '0', '', '1', '485');
INSERT INTO `qw_attjl` VALUES ('348', '1', '1', '27', '1', '', '1', '486');
INSERT INTO `qw_attjl` VALUES ('349', '1', '1', '27', '1', '', '1', '487');
INSERT INTO `qw_attjl` VALUES ('350', '1', '1', '27', '1', '', '1', '488');
INSERT INTO `qw_attjl` VALUES ('351', '1', '1', '27', '1', '', '1', '489');
INSERT INTO `qw_attjl` VALUES ('352', '1', '1', '27', '1', '', '1', '490');
INSERT INTO `qw_attjl` VALUES ('353', '1', '1', '27', '1', '', '1', '491');
INSERT INTO `qw_attjl` VALUES ('354', '1', '1', '1', '1', '', '1', '492');
INSERT INTO `qw_attjl` VALUES ('355', '1', '1', '27', '1', '', '1', '493');
INSERT INTO `qw_attjl` VALUES ('356', '1', '1', '1', '1', '', '1', '494');
INSERT INTO `qw_attjl` VALUES ('357', '1', '1', '1', '1', '', '1', '495');
INSERT INTO `qw_attjl` VALUES ('358', '1', '1', '1', '1', '', '1', '496');
INSERT INTO `qw_attjl` VALUES ('359', '1', '1', '1', '1', '', '1', '497');
INSERT INTO `qw_attjl` VALUES ('360', '1', '1', '1', '1', '', '1', '498');
INSERT INTO `qw_attjl` VALUES ('361', '1', '1', '1', '1', '', '1', '499');
INSERT INTO `qw_attjl` VALUES ('362', '1', '1', '27', '1', '', '1', '500');
INSERT INTO `qw_attjl` VALUES ('363', '1', '1', '1', '1', '', '1', '501');
INSERT INTO `qw_attjl` VALUES ('364', '1', '1', '27', '0', '', '1', '502');
INSERT INTO `qw_attjl` VALUES ('365', '1', '1', '1', '1', '', '1', '503');
INSERT INTO `qw_attjl` VALUES ('366', '1', '1', '27', '0', '', '1', '504');
INSERT INTO `qw_attjl` VALUES ('367', '1', '1', '27', '0', '', '1', '505');
INSERT INTO `qw_attjl` VALUES ('368', '1', '1', '1', '0', '', '1', '506');
INSERT INTO `qw_attjl` VALUES ('369', '1', '1', '1', '0', '', '1', '507');
INSERT INTO `qw_attjl` VALUES ('370', '1', '1', '1', '0', '', '1', '508');
INSERT INTO `qw_attjl` VALUES ('371', '1', '1', '1', '0', '', '1', '509');
INSERT INTO `qw_attjl` VALUES ('372', '1', '1', '1', '0', '', '1', '510');
INSERT INTO `qw_attjl` VALUES ('373', '1', '1', '27', '0', '', '1', '511');
INSERT INTO `qw_attjl` VALUES ('374', '1', '1', '27', '0', '', '1', '512');
INSERT INTO `qw_attjl` VALUES ('375', '1', '1', '1', '0', '', '1', '513');
INSERT INTO `qw_attjl` VALUES ('376', '1', '1', '1', '0', '', '1', '514');
INSERT INTO `qw_attjl` VALUES ('377', '1', '1', '1', '0', '', '1', '515');
INSERT INTO `qw_attjl` VALUES ('378', '1', '1', '27', '1', '', '1', '516');
INSERT INTO `qw_attjl` VALUES ('379', '1', '1', '1', '0', '', '1', '517');
INSERT INTO `qw_attjl` VALUES ('380', '1', '1', '1', '0', '', '1', '518');
INSERT INTO `qw_attjl` VALUES ('381', '1', '1', '1', '1', '', '1', '519');
INSERT INTO `qw_attjl` VALUES ('382', '1', '1', '1', '0', '', '1', '520');
INSERT INTO `qw_attjl` VALUES ('383', '1', '1', '1', '1', '', '1', '521');
INSERT INTO `qw_attjl` VALUES ('384', '1', '1', '1', '1', '', '1', '522');
INSERT INTO `qw_attjl` VALUES ('385', '1', '1', '1', '1', '', '1', '523');
INSERT INTO `qw_attjl` VALUES ('386', '1', '1', '1', '1', '', '1', '524');
INSERT INTO `qw_attjl` VALUES ('387', '1', '1', '1', '1', '', '1', '525');
INSERT INTO `qw_attjl` VALUES ('388', '1', '1', '1', '0', '', '1', '526');
INSERT INTO `qw_attjl` VALUES ('389', '1', '1', '1', '1', '', '1', '527');
INSERT INTO `qw_attjl` VALUES ('390', '1', '1', '27', '0', '', '1', '528');

-- -----------------------------
-- Table structure for `qw_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `qw_attribute`;
CREATE TABLE `qw_attribute` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) NOT NULL COMMENT '关联大类id',
  `prid` int(10) NOT NULL COMMENT '关联项目id',
  `orderid` int(10) NOT NULL COMMENT '排序id',
  `name` varchar(200) NOT NULL COMMENT '属性名称',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `shebei` int(1) NOT NULL DEFAULT '0' COMMENT '关联设备id',
  `keshi` int(20) NOT NULL DEFAULT '36' COMMENT '关联科室id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_attribute`
-- -----------------------------
INSERT INTO `qw_attribute` VALUES ('1', '1', '1', '0', '1、测试 灭火器压力指针在绿区，铅封完好无损，保险销功能正常，软管无破损、瓶底底座完好。 2、消防箱锁具功能正常。', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('20', '1', '19', '0', '1、卷帘门外观整洁、卫生、无破损； 2、卷帘门升降正常、门轨门扇无变形、无卡阻力； 3、模块功能正常，电线接头紧固； 4、卷帘门下无杂物；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('21', '1', '20', '0', '1、外观清洁； 2、无松动；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('2', '1', '2', '0', '1、烟感头外观完好，指示灯为红色闪烁； 2、烟感头如常亮需确认报警时间、查明原因；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('7', '1', '12', '2', '规整、无破损', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('8', '1', '13', '0', '1、外观：整洁、卫生、不锈蚀、边框正常；消防栓操作标识正常； 2、消防栓无锈蚀、功能正常、栓头卡箍正常、水压正常； 3、水带规整无破损； 4、消防软管无破损、枪头无锈蚀、功能正常、有效期是否正常； 5、枪头完好、位置放置正确；', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('9', '1', '14', '0', '完好无损，位置放置正确', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('10', '1', '15', '0', '提示灯显示正常', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('11', '1', '5', '0', '1、灭火器压力指针在绿区，铅封完好无损，保险销功能正常，软管无破损、瓶底底座完好。 2、消防箱锁具功能正常。', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('12', '1', '6', '3', '压力指针在绿区，铅封完好无损，保险销功能正常，软管无破损、瓶体底座完好无损，无锈蚀，在有效期内，锁具功能正常', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('13', '1', '7', '3', '压力指针在绿区，铅封完好无损，保险销功能正常，软管无破损、瓶体底座完好无损，无锈蚀，在有效期内，锁具功能正常', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('14', '1', '9', '0', '1、消防广播功能正常； 2、无松动；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('15', '1', '10', '5', '1、层显工作指示灯为绿色闪烁； 2、显示盘上无报警信息； 3、如有报警信息需向监控中心确认报警时间及处置情况；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('16', '0', '3', '0', '1、手报外观完好； 2、开关处于警戒状态；', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('17', '1', '17', '7', '喷淋头外观完好无渗漏、无锈蚀；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('18', '1', '18', '9', '1、末端试水装置标识正常； 2、压力表指针应在4kg—5kg之间； 3、试水阀功能正常；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('19', '1', '11', '10', '1、外观完好； 2、指示灯处于常亮状态； 3、悬挂位置正常；', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('22', '1', '21', '0', '1、消防通道是否畅通。 2、消防通道是否有杂物', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('23', '1', '22', '0', '1、外观干净无锈蚀。 2、报警按钮功能正常。 3、旋转复位功能正常', '', '0', '36');
INSERT INTO `qw_attribute` VALUES ('24', '1', '13', '0', '1、外观：整洁、卫生、不锈蚀、边框正常；消防栓操作标识正常； 2、消防栓无锈蚀、功能正常、栓头卡箍正常、水压正常； 3、水带规整无破损； 4、消防软管无破损、枪头无锈蚀、功能正常、有效期是否正常； 5、枪头完好、位置放置正确；11', '', '1', '36');
INSERT INTO `qw_attribute` VALUES ('25', '1', '2', '0', '123', '', '0', '41');
INSERT INTO `qw_attribute` VALUES ('26', '1', '3', '0', '手报总务科属性测试', '', '0', '38');
INSERT INTO `qw_attribute` VALUES ('27', '1', '1', '0', '1、测试小组40灭火器压力指针在绿区，铅封完好无损，保险销功能正常，软管无破损、瓶底底座完好。 2、消防箱锁具功能正常。', '', '0', '40');

-- -----------------------------
-- Table structure for `qw_auth_group`
-- -----------------------------
DROP TABLE IF EXISTS `qw_auth_group`;
CREATE TABLE `qw_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '' COMMENT '对应权限id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_auth_group`
-- -----------------------------
INSERT INTO `qw_auth_group` VALUES ('1', '超级管理员', '1', '1,2,58,65,59,60,61,62,3,56,4,6,5,7,8,9,10,51,52,53,57,11,54,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,63,48,49,50,55');
INSERT INTO `qw_auth_group` VALUES ('2', '122操作员', '1', '1,13,14,15,16,17,18,19,20,21,24,25,26,27,29,30,31,32,33,34,36');
INSERT INTO `qw_auth_group` VALUES ('3', '班长', '1', '0');
INSERT INTO `qw_auth_group` VALUES ('6', '维修组', '1', '1,2');
INSERT INTO `qw_auth_group` VALUES ('8', '领导', '1', '13,14,15,16,24,25,29,31,32,33,34');
INSERT INTO `qw_auth_group` VALUES ('9', '巡检员', '1', '135,137,141,1,67,133,132,131,130,48,49,50,55');

-- -----------------------------
-- Table structure for `qw_auth_group_access`
-- -----------------------------
DROP TABLE IF EXISTS `qw_auth_group_access`;
CREATE TABLE `qw_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '对应用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_auth_group_access`
-- -----------------------------
INSERT INTO `qw_auth_group_access` VALUES ('1', '1');
INSERT INTO `qw_auth_group_access` VALUES ('2', '6');
INSERT INTO `qw_auth_group_access` VALUES ('3', '9');
INSERT INTO `qw_auth_group_access` VALUES ('4', '6');
INSERT INTO `qw_auth_group_access` VALUES ('5', '1');
INSERT INTO `qw_auth_group_access` VALUES ('6', '6');
INSERT INTO `qw_auth_group_access` VALUES ('7', '6');

-- -----------------------------
-- Table structure for `qw_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `qw_auth_rule`;
CREATE TABLE `qw_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) NOT NULL COMMENT '对应主键的子id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '地址',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '导航名称',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '方式',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标志',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '解释',
  `islink` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否外链',
  `o` int(11) NOT NULL COMMENT '排序',
  `tips` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_auth_rule`
-- -----------------------------
INSERT INTO `qw_auth_rule` VALUES ('1', '0', 'Index/index', '控制台', 'menu-icon fa fa-tachometer', '1', '1', '', '1', '1', '友情提示：经常查看操作日志，发现异常以便及时追查原因。');
INSERT INTO `qw_auth_rule` VALUES ('2', '0', '', '系统设置', 'menu-icon fa fa-cog', '1', '1', '', '1', '50', '');
INSERT INTO `qw_auth_rule` VALUES ('3', '2', 'Setting/setting', '网站设置', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '3', '这是网站设置的提示。');
INSERT INTO `qw_auth_rule` VALUES ('4', '2', 'Menu/index', '后台菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('5', '2', 'Menu/add', '新增菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('6', '4', 'Menu/edit', '编辑菜单', '', '1', '1', '', '0', '6', '');
INSERT INTO `qw_auth_rule` VALUES ('7', '2', 'Menu/update', '保存菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '7', '');
INSERT INTO `qw_auth_rule` VALUES ('8', '2', 'Menu/del', '删除菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '8', '');
INSERT INTO `qw_auth_rule` VALUES ('9', '2', 'Database/backup', '数据库备份', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '9', '');
INSERT INTO `qw_auth_rule` VALUES ('10', '9', 'Database/recovery', '数据库还原', '', '1', '1', '', '0', '10', '');
INSERT INTO `qw_auth_rule` VALUES ('11', '2', 'Update/update', '在线升级', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '11', '');
INSERT INTO `qw_auth_rule` VALUES ('12', '2', 'Update/devlog', '开发日志', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '12', '');
INSERT INTO `qw_auth_rule` VALUES ('13', '0', '', '系统平台', 'menu-icon fa fa-users', '1', '1', '', '1', '40', '');
INSERT INTO `qw_auth_rule` VALUES ('14', '13', 'Member/index', '用户管理', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '14', '');
INSERT INTO `qw_auth_rule` VALUES ('15', '13', 'Member/add', '新增用户', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '15', '');
INSERT INTO `qw_auth_rule` VALUES ('16', '13', 'Member/edit', '编辑用户', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '16', '');
INSERT INTO `qw_auth_rule` VALUES ('17', '13', 'Member/update', '保存用户', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '17', '');
INSERT INTO `qw_auth_rule` VALUES ('18', '13', 'Member/del', '删除用户', '', '1', '1', '', '0', '18', '');
INSERT INTO `qw_auth_rule` VALUES ('19', '13', 'Group/index', '用户组管理', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '19', '');
INSERT INTO `qw_auth_rule` VALUES ('20', '13', 'Group/add', '新增用户组', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '20', '');
INSERT INTO `qw_auth_rule` VALUES ('21', '13', 'Group/edit', '编辑用户组', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '21', '');
INSERT INTO `qw_auth_rule` VALUES ('22', '13', 'Group/update', '保存用户组', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '22', '');
INSERT INTO `qw_auth_rule` VALUES ('23', '13', 'Group/del', '删除用户组', '', '1', '1', '', '0', '23', '');
INSERT INTO `qw_auth_rule` VALUES ('24', '0', '', '维修系统', 'menu-icon fa fa-desktop', '1', '1', '', '1', '24', '');
INSERT INTO `qw_auth_rule` VALUES ('25', '24', 'Article/index', '报修单管理', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '25', '网站虽然重要，身体更重要，出去走走吧。');
INSERT INTO `qw_auth_rule` VALUES ('26', '24', 'Article/add', '新增报修单', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '26', '');
INSERT INTO `qw_auth_rule` VALUES ('27', '24', 'Article/edit', '编辑报修单', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '27', '');
INSERT INTO `qw_auth_rule` VALUES ('29', '24', 'Article/update', '保存报修单', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '29', '');
INSERT INTO `qw_auth_rule` VALUES ('30', '24', 'Article/del', '删除文章', '', '1', '1', '', '0', '30', '');
INSERT INTO `qw_auth_rule` VALUES ('32', '24', 'Category/add', '新增维修分类', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '32', '');
INSERT INTO `qw_auth_rule` VALUES ('33', '24', 'Category/edit', '编辑分类', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '33', '');
INSERT INTO `qw_auth_rule` VALUES ('34', '24', 'Category/update', '保存分类', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '34', '');
INSERT INTO `qw_auth_rule` VALUES ('36', '24', 'Category/del', '删除分类', '', '1', '1', '', '0', '36', '');
INSERT INTO `qw_auth_rule` VALUES ('37', '0', '', '其它功能', 'menu-icon fa fa-legal', '1', '1', '', '0', '37', '');
INSERT INTO `qw_auth_rule` VALUES ('38', '37', 'Link/index', '友情链接', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '38', '');
INSERT INTO `qw_auth_rule` VALUES ('39', '37', 'Link/add', '增加链接', '', '1', '1', '', '0', '39', '');
INSERT INTO `qw_auth_rule` VALUES ('40', '37', 'Link/edit', '编辑链接', '', '1', '1', '', '0', '40', '');
INSERT INTO `qw_auth_rule` VALUES ('41', '37', 'Link/update', '保存链接', '', '1', '1', '', '0', '41', '');
INSERT INTO `qw_auth_rule` VALUES ('42', '37', 'Link/del', '删除链接', '', '1', '1', '', '0', '42', '');
INSERT INTO `qw_auth_rule` VALUES ('43', '37', 'Flash/index', '焦点图', 'menu-icon fa fa-desktop', '1', '1', '', '0', '43', '');
INSERT INTO `qw_auth_rule` VALUES ('44', '37', 'Flash/add', '新增焦点图', '', '1', '1', '', '0', '44', '');
INSERT INTO `qw_auth_rule` VALUES ('45', '37', 'Flash/update', '保存焦点图', '', '1', '1', '', '0', '45', '');
INSERT INTO `qw_auth_rule` VALUES ('46', '37', 'Flash/edit', '编辑焦点图', '', '1', '1', '', '0', '46', '');
INSERT INTO `qw_auth_rule` VALUES ('47', '37', 'Flash/del', '删除焦点图', '', '1', '1', '', '0', '47', '');
INSERT INTO `qw_auth_rule` VALUES ('48', '0', 'Personal/index', '个人中心', 'menu-icon fa fa-user', '1', '1', '', '1', '39', '');
INSERT INTO `qw_auth_rule` VALUES ('49', '48', 'Personal/profile', '个人资料', 'menu-icon fa fa-user', '1', '1', '', '1', '49', '');
INSERT INTO `qw_auth_rule` VALUES ('50', '48', 'Logout/index', '退出', '', '1', '1', '', '1', '50', '');
INSERT INTO `qw_auth_rule` VALUES ('51', '9', 'Database/export', '备份', '', '1', '1', '', '0', '51', '');
INSERT INTO `qw_auth_rule` VALUES ('52', '9', 'Database/optimize', '数据优化', '', '1', '1', '', '0', '52', '');
INSERT INTO `qw_auth_rule` VALUES ('53', '9', 'Database/repair', '修复表', '', '1', '1', '', '0', '53', '');
INSERT INTO `qw_auth_rule` VALUES ('54', '11', 'Update/updating', '升级安装', '', '1', '1', '', '0', '54', '');
INSERT INTO `qw_auth_rule` VALUES ('55', '48', 'Personal/update', '资料保存', '', '1', '1', '', '0', '55', '');
INSERT INTO `qw_auth_rule` VALUES ('56', '3', 'Setting/update', '设置保存', '', '1', '1', '', '0', '56', '');
INSERT INTO `qw_auth_rule` VALUES ('57', '9', 'Database/del', '备份删除', '', '1', '1', '', '0', '57', '');
INSERT INTO `qw_auth_rule` VALUES ('58', '2', 'variable/index', '自定义变量', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('59', '58', 'variable/add', '新增变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('60', '58', 'variable/edit', '编辑变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('61', '58', 'variable/update', '保存变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('62', '58', 'variable/del', '删除变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('63', '37', 'Facebook/add', '用户反馈', '', '1', '1', '', '0', '63', '');
INSERT INTO `qw_auth_rule` VALUES ('66', '24', 'Categoryzt/index', '维修单状态管理', '', '1', '1', '', '1', '39', '');
INSERT INTO `qw_auth_rule` VALUES ('67', '0', '', '安全生产巡检系统', 'menu-icon fa fa-paw', '1', '1', '', '1', '10', '');
INSERT INTO `qw_auth_rule` VALUES ('68', '67', 'Patrol/Index', '巡检栏目列表', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('69', '67', 'Patrol/Add', '新增巡检栏目', '', '1', '1', '', '0', '0', '&lt;p&gt;\r\n	asdasd\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	vvvvvaaaaaaaa\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	ccccccccccc\r\n&lt;/p&gt;');
INSERT INTO `qw_auth_rule` VALUES ('70', '67', 'Project/Index', '巡检项目列表', '', '1', '1', '', '0', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('71', '67', 'Project/Add', '新增巡检项目', '', '1', '1', '', '0', '2', '');
INSERT INTO `qw_auth_rule` VALUES ('72', '67', 'Attribute/Index', '巡检项目属性', '', '1', '1', '', '0', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('73', '67', 'Attribute/Add', '新增巡检项目属性', '', '1', '1', '', '0', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('76', '13', 'Organization/Index', '组织架构管理', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('75', '67', 'Patrolzt/Index', '巡检状态分类', '', '1', '1', '', '1', '15', '');
INSERT INTO `qw_auth_rule` VALUES ('78', '24', 'Article/Tindex', '统计报表', '', '1', '1', '', '1', '40', '');
INSERT INTO `qw_auth_rule` VALUES ('79', '67', 'Shebei/Index', '巡检设备列表', '', '1', '1', '', '0', '7', '');
INSERT INTO `qw_auth_rule` VALUES ('80', '67', 'shebeis/index', '巡检设备分类列表', '', '1', '1', '', '1', '6', '');
INSERT INTO `qw_auth_rule` VALUES ('81', '67', 'Shebeishu/Index', '巡检设备属性列表', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('82', '0', '', '配件仓储系统', 'menu-icon fa fa-truck', '1', '1', '', '1', '25', '');
INSERT INTO `qw_auth_rule` VALUES ('83', '0', '', '保洁管理系统', 'menu-icon fa fa-flask', '1', '1', '', '1', '26', '');
INSERT INTO `qw_auth_rule` VALUES ('84', '0', '', '餐饮管理系统', 'menu-icon fa fa-cutlery', '1', '1', '', '1', '27', '');
INSERT INTO `qw_auth_rule` VALUES ('85', '0', '', '被服洗涤系统', 'menu-icon fa fa-pied-piper-alt', '1', '1', '', '1', '28', '');
INSERT INTO `qw_auth_rule` VALUES ('86', '0', '', '中央运送系统', 'menu-icon fa fa-truck', '1', '1', '', '1', '29', '');
INSERT INTO `qw_auth_rule` VALUES ('87', '0', '', '绩效考核系统', 'menu-icon fa fa-file', '1', '1', '', '1', '30', '');
INSERT INTO `qw_auth_rule` VALUES ('88', '82', '', '入库管理', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('89', '82', '', '库存管理', '', '1', '1', '', '1', '2', '');
INSERT INTO `qw_auth_rule` VALUES ('90', '82', '', '出库管理', '', '1', '1', '', '1', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('91', '82', '', '分析统计', '', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('92', '82', '', '系统管理', '', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('93', '83', '', '客户管理', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('94', '83', '', '服务人员管理', '', '1', '1', '', '1', '2', '');
INSERT INTO `qw_auth_rule` VALUES ('95', '83', '', '合同管理', '', '1', '1', '', '1', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('96', '83', '', '派工管理', '', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('99', '84', '', '营业管理', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('98', '83', '', '财务管理', '', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('100', '84', '', '会员管理', '', '1', '1', '', '1', '2', '');
INSERT INTO `qw_auth_rule` VALUES ('101', '84', '', '采购管理', '', '1', '1', '', '1', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('102', '84', '', '库存管理', '', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('103', '84', '', '数据管理', '', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('104', '84', '', '系统管理', '', '1', '1', '', '1', '6', '');
INSERT INTO `qw_auth_rule` VALUES ('105', '86', '', '人员管理', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('106', '86', '', '运送工具管理', '', '1', '1', '', '1', '2', '');
INSERT INTO `qw_auth_rule` VALUES ('107', '86', '', '客户管理', '', '1', '1', '', '1', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('108', '86', '', '统计分析', '', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('109', '86', '', '系统管理', '', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('110', '87', '', '机构管理', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('111', '87', '', '职位管理', '', '1', '1', '', '1', '2', '');
INSERT INTO `qw_auth_rule` VALUES ('112', '87', '', '人员管理', '', '1', '1', '', '1', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('113', '87', '', '考核管理', '', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('114', '87', '', '系统管理', '', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('115', '85', '', '分类管理', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('116', '85', '', '会员管理', '', '1', '1', '', '1', '2', '');
INSERT INTO `qw_auth_rule` VALUES ('117', '85', '', '衣物管理', '', '1', '1', '', '1', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('118', '85', '', '洗涤设备管理', '', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('119', '85', '', '数据中心', '', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('120', '85', '', '系统管理', '', '1', '1', '', '1', '6', '');
INSERT INTO `qw_auth_rule` VALUES ('121', '13', 'area/index', '区域设置', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('122', '67', 'xunjian/index', '巡检计划管理', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('129', '67', 'Xunjianzhouqi/index', '巡检周期管理', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('130', '67', 'Jhbaobiao/index', '巡检计划报表', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('131', '67', 'Jhbaobiao/view', '查看巡检计划', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('132', '67', 'Jhbaobiao/viewshebei', '查看巡检计划-设备巡检详情', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('133', '67', 'Jhbaobiao/chaxun', '巡检报表查询', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('134', '24', 'Article/cindex', '维修单管理', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('135', '0', '', '安全巡更系统', 'menu-icon fa fa-paw', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('136', '135', 'Xungen/index', '巡更计划管理', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('137', '135', 'Xgbaobiao/index', '巡更报表管理', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('138', '135', 'Xgproject/index', '巡更分类管理', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('139', '135', 'Xungen/indexs', '巡更设备报障', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('140', '135', 'Xgproject/didian', '巡检地点管理', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('141', '135', 'Xgbaobiao/view', '巡更计划详情', '', '1', '1', '', '0', '0', '');

-- -----------------------------
-- Table structure for `qw_category`
-- -----------------------------
DROP TABLE IF EXISTS `qw_category`;
CREATE TABLE `qw_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '0正常，1单页，2外链',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `seotitle` varchar(200) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `cattemplate` varchar(100) NOT NULL,
  `contemplate` varchar(100) NOT NULL,
  `o` int(11) NOT NULL COMMENT '排序',
  `xiaozu` int(11) DEFAULT NULL,
  `prid` int(11) DEFAULT NULL COMMENT '关联巡检大类id',
  `projectid` int(11) NOT NULL DEFAULT '0' COMMENT '关联二级分类id',
  PRIMARY KEY (`id`,`projectid`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_category`
-- -----------------------------
INSERT INTO `qw_category` VALUES ('36', '0', '0', '水电故障', '', '', '', '', '', '', '', '0', '40', '1', '10');
INSERT INTO `qw_category` VALUES ('37', '0', '36', ' 自来水', '', '', '', '', '', '', '', '0', '40', '1', '10');
INSERT INTO `qw_category` VALUES ('38', '0', '36', '喷淋故障', '', '', '', '', '', '', '', '0', '39', '1', '17');
INSERT INTO `qw_category` VALUES ('39', '0', '0', '消防设备故障', '', '', '', '', '', '', '', '0', '39', '0', '0');
INSERT INTO `qw_category` VALUES ('40', '0', '39', '消防箱故障', '', '', '', '', '', '', '', '0', '39', '1', '1');

-- -----------------------------
-- Table structure for `qw_categoryzt`
-- -----------------------------
DROP TABLE IF EXISTS `qw_categoryzt`;
CREATE TABLE `qw_categoryzt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_categoryzt`
-- -----------------------------
INSERT INTO `qw_categoryzt` VALUES ('37', '0', '未分配');
INSERT INTO `qw_categoryzt` VALUES ('40', '1', '未完成');
INSERT INTO `qw_categoryzt` VALUES ('39', '2', '已完成');

-- -----------------------------
-- Table structure for `qw_devlog`
-- -----------------------------
DROP TABLE IF EXISTS `qw_devlog`;
CREATE TABLE `qw_devlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `v` varchar(225) NOT NULL COMMENT '版本号',
  `y` int(4) NOT NULL COMMENT '年分',
  `t` int(10) NOT NULL COMMENT '发布日期',
  `log` text NOT NULL COMMENT '更新日志',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_devlog`
-- -----------------------------
INSERT INTO `qw_devlog` VALUES ('1', '1.0.0', '2016', '1440259200', 'QWADMIN第一个版本发布。');
INSERT INTO `qw_devlog` VALUES ('2', '1.0.1', '2016', '1440259200', '修改cookie过于简单的安全风险。');

-- -----------------------------
-- Table structure for `qw_flash`
-- -----------------------------
DROP TABLE IF EXISTS `qw_flash`;
CREATE TABLE `qw_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `o` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `qw_jihuas`
-- -----------------------------
DROP TABLE IF EXISTS `qw_jihuas`;
CREATE TABLE `qw_jihuas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jihuaming` varchar(255) NOT NULL,
  `xiaozu` int(11) NOT NULL DEFAULT '0' COMMENT '巡检小组id',
  `zhouqi` varchar(255) NOT NULL DEFAULT '' COMMENT '巡检周期id',
  `project` int(11) DEFAULT '1' COMMENT '项目id',
  `shebeiids` varchar(255) NOT NULL COMMENT '设备列表',
  `time` varchar(20) NOT NULL,
  `patrol` int(101) NOT NULL COMMENT '分类id',
  `cishu` int(10) NOT NULL DEFAULT '0',
  `zt` int(1) NOT NULL DEFAULT '0' COMMENT '最新状态',
  `zhixingid` int(20) NOT NULL COMMENT '对应计划执行表最新的id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_jihuas`
-- -----------------------------
INSERT INTO `qw_jihuas` VALUES ('3', '维修B队消防箱计划', '41', '43', '1', '1,3,6,8', '1475047762', '1', '104', '1', '354');
INSERT INTO `qw_jihuas` VALUES ('4', '巡检A队层显计划', '40', '43', '10', '1,8', '1475053263', '1', '103', '1', '355');
INSERT INTO `qw_jihuas` VALUES ('6', '维修B队层显计划', '41', '46', '10', '1', '1475055039', '1', '1', '1', '84');
INSERT INTO `qw_jihuas` VALUES ('7', '巡检A队计划', '40', '45', '1', '3', '1475055787', '1', '5', '1', '306');
INSERT INTO `qw_jihuas` VALUES ('8', '维修A队巡检计划', '39', '44', '1', '1', '1476062428', '1', '3', '1', '353');

-- -----------------------------
-- Table structure for `qw_jihuazhixing`
-- -----------------------------
DROP TABLE IF EXISTS `qw_jihuazhixing`;
CREATE TABLE `qw_jihuazhixing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jihuasid` int(10) DEFAULT NULL COMMENT '对应计划ID',
  `starttime` int(20) DEFAULT NULL COMMENT '执行时间',
  `stoptime` int(20) DEFAULT NULL COMMENT '计划结束时间',
  `success` int(1) DEFAULT NULL,
  `zt` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_jihuazhixing`
-- -----------------------------
INSERT INTO `qw_jihuazhixing` VALUES ('57', '1', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('58', '2', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('59', '1', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('60', '2', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('61', '1', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('62', '2', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('63', '1', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('64', '2', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('65', '1', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('66', '2', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('67', '1', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('68', '2', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('69', '3', '1475078400', '1475164799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('70', '1', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('71', '2', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('72', '3', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('73', '4', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('74', '1', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('75', '2', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('76', '3', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('77', '4', '1475164800', '1475251199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('78', '1', '1475251200', '1475337599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('79', '2', '1475251200', '1475337599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('80', '3', '1475251200', '1475337599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('81', '4', '1475251200', '1475337599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('82', '5', '1475251200', '1475337599', '0', '1');
INSERT INTO `qw_jihuazhixing` VALUES ('83', '7', '1475251200', '1475337599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('84', '6', '1475251200', '1475337599', '0', '1');
INSERT INTO `qw_jihuazhixing` VALUES ('85', '1', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('86', '2', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('87', '3', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('88', '4', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('89', '1', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('90', '2', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('91', '3', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('92', '4', '1475942400', '1476028799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('93', '1', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('94', '2', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('95', '3', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('96', '4', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('97', '1', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('98', '2', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('99', '3', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('100', '4', '1476028800', '1476115199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('101', '1', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('102', '2', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('103', '3', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('104', '4', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('105', '1', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('106', '2', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('107', '3', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('108', '4', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('109', '1', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('110', '2', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('111', '3', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('112', '4', '1476115200', '1476201599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('113', '1', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('114', '2', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('115', '3', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('116', '4', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('117', '1', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('118', '2', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('119', '3', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('120', '4', '1476201600', '1476287999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('121', '1', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('122', '2', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('123', '3', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('124', '4', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('125', '1', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('126', '2', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('127', '3', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('128', '4', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('129', '1', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('130', '2', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('131', '3', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('132', '4', '1476288000', '1476374399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('133', '1', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('134', '2', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('135', '3', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('136', '4', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('137', '1', '1476374400', '1476460799', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('138', '2', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('139', '3', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('140', '4', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('141', '1', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('142', '2', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('143', '3', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('144', '4', '1476374400', '1476460799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('145', '1', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('146', '2', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('147', '3', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('148', '4', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('149', '3', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('150', '2', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('151', '1', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('152', '4', '1476460800', '1476547199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('153', '1', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('154', '2', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('155', '3', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('156', '4', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('157', '1', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('158', '2', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('159', '3', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('160', '4', '1476547200', '1476633599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('161', '1', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('162', '2', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('163', '3', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('164', '4', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('165', '1', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('166', '2', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('167', '3', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('168', '4', '1476720000', '1476806399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('169', '1', '1476806400', '1476892799', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('170', '2', '1476806400', '1476892799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('171', '3', '1476806400', '1476892799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('172', '4', '1476806400', '1476892799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('173', '1', '1476806400', '1476892799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('174', '2', '1476806400', '1476892799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('175', '3', '1476806400', '1476892799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('176', '4', '1476806400', '1476892799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('177', '1', '1476892800', '1476979199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('178', '2', '1476892800', '1476979199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('179', '3', '1476892800', '1476979199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('180', '4', '1476892800', '1476979199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('181', '1', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('182', '2', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('183', '3', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('184', '4', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('185', '1', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('186', '2', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('187', '3', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('188', '4', '1476979200', '1477065599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('189', '1', '1477065600', '1477151999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('190', '2', '1477065600', '1477151999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('191', '3', '1477065600', '1477151999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('192', '4', '1477065600', '1477151999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('193', '1', '1477324800', '1477411199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('194', '2', '1477324800', '1477411199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('195', '3', '1477324800', '1477411199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('196', '4', '1477324800', '1477411199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('197', '1', '1477324800', '1477411199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('198', '2', '1477324800', '1477411199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('199', '3', '1477324800', '1477411199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('200', '4', '1477324800', '1477411199', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('201', '1', '1477411200', '1477497599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('202', '2', '1477411200', '1477497599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('203', '3', '1477411200', '1477497599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('204', '4', '1477411200', '1477497599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('205', '1', '1477497600', '1477583999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('206', '2', '1477497600', '1477583999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('207', '3', '1477497600', '1477583999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('208', '4', '1477497600', '1477583999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('209', '1', '1477584000', '1477670399', '0', '1');
INSERT INTO `qw_jihuazhixing` VALUES ('210', '2', '1477584000', '1477670399', '0', '1');
INSERT INTO `qw_jihuazhixing` VALUES ('211', '3', '1477584000', '1477670399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('212', '4', '1477584000', '1477670399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('213', '3', '1477584000', '1477670399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('214', '4', '1477584000', '1477670399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('215', '3', '1477670400', '1477756799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('216', '4', '1477670400', '1477756799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('217', '3', '1477670400', '1477756799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('218', '4', '1477670400', '1477756799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('219', '3', '1477756800', '1477843199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('220', '4', '1477756800', '1477843199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('221', '3', '1477929600', '1478015999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('222', '4', '1477929600', '1478015999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('223', '7', '1477929600', '1478015999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('224', '3', '1477929600', '1478015999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('225', '4', '1477929600', '1478015999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('226', '7', '1477929600', '1478015999', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('227', '3', '1478016000', '1478102399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('228', '4', '1478016000', '1478102399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('229', '3', '1478016000', '1478102399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('230', '4', '1478016000', '1478102399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('231', '3', '1478102400', '1478188799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('232', '4', '1478102400', '1478188799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('233', '3', '1478102400', '1478188799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('234', '4', '1478102400', '1478188799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('235', '3', '1478188800', '1478275199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('236', '4', '1478188800', '1478275199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('237', '3', '1478188800', '1478275199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('238', '4', '1478188800', '1478275199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('239', '3', '1478275200', '1478361599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('240', '4', '1478275200', '1478361599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('241', '3', '1478275200', '1478361599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('242', '4', '1478275200', '1478361599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('243', '3', '1478534400', '1478620799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('244', '4', '1478534400', '1478620799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('245', '3', '1478534400', '1478620799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('246', '4', '1478534400', '1478620799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('247', '3', '1478620800', '1478707199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('248', '4', '1478620800', '1478707199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('249', '3', '1478620800', '1478707199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('250', '4', '1478620800', '1478707199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('251', '3', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('252', '4', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('253', '3', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('254', '4', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('255', '3', '1478793600', '1478879999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('256', '4', '1478793600', '1478879999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('257', '3', '1478793600', '1478879999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('258', '4', '1478793600', '1478879999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('259', '3', '1478880000', '1478966399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('260', '4', '1478880000', '1478966399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('261', '3', '1478880000', '1478966399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('262', '4', '1478880000', '1478966399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('263', '3', '1479139200', '1479225599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('264', '4', '1479139200', '1479225599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('265', '3', '1479139200', '1479225599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('266', '4', '1479139200', '1479225599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('267', '3', '1479225600', '1479311999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('268', '4', '1479225600', '1479311999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('269', '3', '1479225600', '1479311999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('270', '4', '1479225600', '1479311999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('271', '3', '1479312000', '1479398399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('272', '4', '1479312000', '1479398399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('273', '3', '1479312000', '1479398399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('274', '4', '1479312000', '1479398399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('275', '3', '1479398400', '1479484799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('276', '4', '1479398400', '1479484799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('277', '3', '1479484800', '1479571199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('278', '4', '1479484800', '1479571199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('279', '3', '1479484800', '1479571199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('280', '4', '1479484800', '1479571199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('281', '3', '1479744000', '1479830399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('282', '4', '1479744000', '1479830399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('283', '3', '1479830400', '1479916799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('284', '4', '1479830400', '1479916799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('285', '3', '1479830400', '1479916799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('286', '4', '1479830400', '1479916799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('287', '3', '1479916800', '1480003199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('288', '4', '1479916800', '1480003199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('289', '3', '1479916800', '1480003199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('290', '4', '1479916800', '1480003199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('291', '3', '1480003200', '1480089599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('292', '4', '1480003200', '1480089599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('293', '3', '1480003200', '1480089599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('294', '4', '1480003200', '1480089599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('295', '3', '1480089600', '1480175999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('296', '4', '1480089600', '1480175999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('297', '3', '1480435200', '1480521599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('298', '4', '1480435200', '1480521599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('299', '3', '1480435200', '1480521599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('300', '4', '1480435200', '1480521599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('301', '3', '1480521600', '1480607999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('302', '4', '1480521600', '1480607999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('303', '7', '1480521600', '1480607999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('304', '3', '1480521600', '1480607999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('305', '4', '1480521600', '1480607999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('306', '7', '1480521600', '1480607999', '0', '1');
INSERT INTO `qw_jihuazhixing` VALUES ('307', '3', '1480608000', '1480694399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('308', '4', '1480608000', '1480694399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('309', '3', '1480608000', '1480694399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('310', '4', '1480608000', '1480694399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('311', '3', '1480694400', '1480780799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('312', '4', '1480694400', '1480780799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('313', '3', '1480694400', '1480780799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('314', '4', '1480694400', '1480780799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('315', '3', '1480867200', '1480953599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('316', '4', '1480867200', '1480953599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('317', '8', '1480867200', '1480953599', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('318', '3', '1480953600', '1481039999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('319', '4', '1480953600', '1481039999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('320', '3', '1480953600', '1481039999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('321', '4', '1480953600', '1481039999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('322', '3', '1481040000', '1481126399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('323', '4', '1481040000', '1481126399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('324', '3', '1481040000', '1481126399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('325', '4', '1481040000', '1481126399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('326', '3', '1481126400', '1481212799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('327', '4', '1481126400', '1481212799', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('328', '3', '1481126400', '1481212799', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('329', '4', '1481126400', '1481212799', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('330', '3', '1481212800', '1481299199', '1', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('331', '4', '1481212800', '1481299199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('332', '3', '1481212800', '1481299199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('333', '4', '1481212800', '1481299199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('334', '3', '1481299200', '1481385599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('335', '4', '1481299200', '1481385599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('336', '3', '1481558400', '1481644799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('337', '4', '1481558400', '1481644799', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('338', '3', '1481644800', '1481731199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('339', '4', '1481644800', '1481731199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('340', '3', '1481644800', '1481731199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('341', '4', '1481644800', '1481731199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('342', '3', '1481731200', '1481817599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('343', '4', '1481731200', '1481817599', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('344', '3', '1481817600', '1481903999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('345', '4', '1481817600', '1481903999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('346', '3', '1481904000', '1481990399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('347', '4', '1481904000', '1481990399', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('348', '3', '1482076800', '1482163199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('349', '4', '1482076800', '1482163199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('350', '8', '1482076800', '1482767999', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('351', '3', '1482076800', '1482163199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('352', '4', '1482076800', '1482163199', '0', '2');
INSERT INTO `qw_jihuazhixing` VALUES ('353', '8', '1482076800', '1482767999', '0', '1');
INSERT INTO `qw_jihuazhixing` VALUES ('354', '3', '1482163200', '1482249599', '0', '1');
INSERT INTO `qw_jihuazhixing` VALUES ('355', '4', '1482163200', '1482249599', '0', '1');

-- -----------------------------
-- Table structure for `qw_jl`
-- -----------------------------
DROP TABLE IF EXISTS `qw_jl`;
CREATE TABLE `qw_jl` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attid` int(10) NOT NULL COMMENT '对应属性id',
  `img0` varchar(255) DEFAULT NULL COMMENT '图片1',
  `sound0` varchar(255) DEFAULT NULL COMMENT '音频1',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片2',
  `img2` varchar(255) DEFAULT NULL COMMENT '图片3',
  `sound1` varchar(255) DEFAULT NULL COMMENT '音频2',
  `sound2` varchar(255) DEFAULT NULL COMMENT '音频3',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=391 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_jl`
-- -----------------------------
INSERT INTO `qw_jl` VALUES ('1', '1', 'upfile/20160809181550.jpg', 'upfile/20160809181557.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('2', '4', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('3', '5', 'upfile/20160809182033.jpg', 'upfile/20160809182043.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('4', '6', 'upfile/20160809182829.jpg', 'upfile/20160809182837.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('5', '7', 'upfile/20160809183154.jpg', 'upfile/20160809183208.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('6', '8', 'upfile/20160809184839.jpg', 'upfile/20160809184845.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('7', '9', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('8', '10', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('9', '11', 'upfile/1471231120948535022335.jpg', 'upfile/20160815111842.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('10', '12', 'upfile/14712312240041973559950.jpg', 'upfile/20160815112025.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('11', '13', '', 'upfile/20160815112343.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('12', '14', 'upfile/14712315190151462190278.jpg', 'upfile/20160815112520.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('13', '15', 'upfile/20160815152928.jpg', 'upfile/20160815152943.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('16', '17', 'upfile/20160815170136.jpg', 'upfile/20160815170145.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('17', '17', 'upfile/20160815170443.jpg', 'upfile/20160815170457.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('18', '18', 'upfile/1471312379747204679475.jpg', 'upfile/20160816095301.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('19', '19', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('20', '20', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('21', '21', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('22', '22', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('23', '23', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('24', '24', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('26', '26', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('27', '27', 'upfile/20160816101408.jpg', 'upfile/20160816101424.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('28', '28', 'upfile/20160816101631.jpg', 'upfile/20160816101716.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('29', '29', 'upfile/20160816102048.jpg', 'upfile/20160816102057.mp3', '', '', 'upfile/20160816102027.mp3', 'upfile/20160816102037.mp3');
INSERT INTO `qw_jl` VALUES ('30', '30', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('71', '71', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('31', '31', 'upfile/1471314383298204679475.jpg', 'upfile/20160816095301.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('32', '32', '', 'upfile/20160816103447.mp3', '', '', 'upfile/20160816095149.mp3', 'upfile/20160816095301.mp3');
INSERT INTO `qw_jl` VALUES ('33', '33', 'upfile/1471315196490204679475.jpg', 'upfile/20160816103958.mp3', '', '', 'upfile/20160816095149.mp3', 'upfile/20160816095301.mp3');
INSERT INTO `qw_jl` VALUES ('34', '34', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('35', '35', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('36', '36', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('37', '37', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('38', '38', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('39', '39', 'upfile/14713412185561973559950.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('40', '40', 'upfile/14713413439971973559950.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('41', '41', 'upfile/1471341523297204679475.jpg', '', 'upfile/1471341532606535022335.jpg', 'upfile/14713415425161973559950.jpg', '', '');
INSERT INTO `qw_jl` VALUES ('42', '42', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('43', '43', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('44', '44', 'upfile/1471342584249204679475.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('45', '45', 'upfile/1471342710616204679475.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('46', '46', 'upfile/1471342985354204679475.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('47', '47', 'upfile/1471343235486204679475.jpg', '', 'upfile/1471343242020535022335.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('48', '48', 'upfile/1471343486787204679475.jpg', '', 'upfile/1471343503292535022335.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('49', '49', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('50', '50', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('51', '51', 'upfile/1471396297878-680373180.jpg', '', 'upfile/1471396305011-1097727764.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('52', '52', 'upfile/14713963602101605568329.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('53', '53', 'upfile/1471397258575-1097727764.jpg', '', 'upfile/14713972635301164389115.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('54', '54', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('55', '55', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('56', '56', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('57', '57', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('58', '58', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('59', '59', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('60', '60', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('61', '61', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('62', '62', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('63', '63', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('64', '64', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('65', '65', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('66', '66', 'upfile/1471413751379-680373180.jpg', 'upfile/20160817140232.mp3', '', '', 'upfile/20160816095149.mp3', 'upfile/20160816095301.mp3');
INSERT INTO `qw_jl` VALUES ('78', '78', 'upfile/1471420599945-1097727764.jpg', '', 'upfile/14714206054811164389115.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('79', '79', 'upfile/1471420675157-1584522325.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('80', '79', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('81', '79', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('82', '79', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('83', '79', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('84', '79', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('85', '85', 'upfile/14714209605861605568329.jpg', '', 'upfile/1471420966407885636907.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('86', '86', 'upfile/14714210033231527493801.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('87', '87', 'upfile/14715083915401909318083.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('90', '90', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('88', '88', '', 'upfile/20160817173613.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('89', '89', 'upfile/1471426699951-536305730.jpg', 'upfile/20160817173830.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('91', '91', 'upfile/1471486894262-772329574.jpg', 'upfile/20160817150143.mp3', '', '', 'upfile/20160817150143.mp3', '');
INSERT INTO `qw_jl` VALUES ('92', '92', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('93', '93', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('94', '94', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('95', '95', 'upfile/14715071341341651603074.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('96', '96', '', 'upfile/20160818161351.mp3', '', '', 'upfile/20160818161431.mp3', '');
INSERT INTO `qw_jl` VALUES ('97', '97', 'upfile/1471508492531594174047.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('98', '98', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('99', '99', '', 'upfile/20160818162242.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('100', '100', 'upfile/1471508594159-234802610.jpg', 'upfile/20160818162330.mp3', 'upfile/14715086003911659992629.jpg', 'upfile/1471508607785-1219362153.jpg', 'upfile/20160818162338.mp3', 'upfile/20160818162345.mp3');
INSERT INTO `qw_jl` VALUES ('101', '101', 'upfile/1471510905972365790345.jpg', 'upfile/20160818170201.mp3', 'upfile/1471510912947-852528874.jpg', 'upfile/1471510919330-258744131.jpg', 'upfile/20160818170224.mp3', 'upfile/20160818170230.mp3');
INSERT INTO `qw_jl` VALUES ('102', '102', 'upfile/1471511038811-234802610.jpg', 'upfile/20160818170409.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('103', '103', '', 'upfile/20160818172023.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('104', '104', '', 'upfile/20160818175153.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('105', '105', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('106', '106', 'upfile/14716027164812064938943.jpg', 'upfile/20160819103201.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('107', '107', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('108', '108', 'upfile/1471585837346-1991973570.jpg', 'upfile/20160819135038.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('109', '109', 'upfile/14715923992081909972390.jpg', 'upfile/20160819154023.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('110', '110', 'upfile/14715966308321161216315.jpg', 'upfile/20160819164916.mp3', '', '', 'upfile/20160819164926.mp3', 'upfile/20160819164945.mp3');
INSERT INTO `qw_jl` VALUES ('111', '111', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('112', '112', 'upfile/14716697709162039225996.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('113', '113', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('114', '114', 'upfile/14761558099671914310020.jpg', 'upfile/20161011111700.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('115', '115', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('116', '116', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('117', '117', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('118', '118', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('119', '119', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('120', '120', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('121', '121', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('122', '122', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('123', '123', 'upfile/1471669983866-1819499931.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('124', '124', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('125', '125', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('126', '126', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('127', '127', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('128', '128', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('129', '129', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('130', '130', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('131', '131', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('132', '132', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('133', '133', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('134', '134', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('135', '135', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('136', '136', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('137', '137', 'upfile/1471672075248-1819499931.jpg', '', 'upfile/14716720859341110249619.jpg', 'upfile/1471672093839-1030944161.jpg', '', '');
INSERT INTO `qw_jl` VALUES ('138', '138', 'upfile/14716763250801659992629.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('139', '139', 'upfile/1471680806786-1149413477.jpg', 'upfile/20160820161328.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('140', '140', 'upfile/14716878367391659992629.jpg', 'upfile/20160820181051.mp3', 'upfile/1471687842741-1219362153.jpg', 'upfile/1471687849581365790345.jpg', 'upfile/20160820181056.mp3', '');
INSERT INTO `qw_jl` VALUES ('141', '141', 'upfile/14716882370721704141532.jpg', 'upfile/20160820181802.mp3', 'upfile/1471688245696-1112703886.jpg', 'upfile/14716882552901107889603.jpg', 'upfile/20160820181821.mp3', 'upfile/20160820181829.mp3');
INSERT INTO `qw_jl` VALUES ('142', '142', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('143', '143', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('144', '144', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('145', '145', 'upfile/1471749464106635081628.jpg', 'upfile/20160821111744.mp3', 'upfile/1471749477005-1444939737.jpg', 'upfile/1471749484283-1598366869.jpg', 'upfile/20160821111806.mp3', '');
INSERT INTO `qw_jl` VALUES ('146', '146', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('147', '147', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('148', '148', 'upfile/1471750695319-1915673809.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('149', '149', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('150', '150', '', 'upfile/20160821114810.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('151', '151', 'upfile/1471752099348-236895129.jpg', 'upfile/20160821120156.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('152', '152', 'upfile/1471753412982-333492294.jpg', 'upfile/20160821122334.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('153', '153', 'upfile/1471753464027214339926.jpg', 'upfile/20160821122425.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('154', '154', 'upfile/1471753762606-1915673809.jpg', 'upfile/20160821122924.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('155', '155', 'upfile/14717540962311669415769.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('156', '156', 'upfile/1471754919913-591000355.jpg', 'upfile/20160821124841.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('157', '157', 'upfile/1471755175968-1546709033.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('158', '158', 'upfile/1471755310392-1322130035.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('159', '159', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('160', '160', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('161', '161', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('162', '162', 'upfile/1471760331529-1123062030.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('163', '163', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('164', '164', 'upfile/14717569800091657948802.jpg', 'upfile/20160821132336.mp3', 'upfile/1471756990392-498851628.jpg', 'upfile/1471757005251-711764021.jpg', 'upfile/20160821132340.mp3', 'upfile/20160821132345.mp3');
INSERT INTO `qw_jl` VALUES ('165', '165', 'upfile/1471757239220-776561163.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('166', '166', 'upfile/1471759141695768013085.jpg', 'upfile/20160821135902.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('167', '167', '', 'upfile/20160821135948.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('168', '168', 'upfile/1471759248370864969798.jpg', 'upfile/20160821140128.mp3', 'upfile/14717592597631692289051.jpg', 'upfile/14717592676741275522225.jpg', 'upfile/20160821140133.mp3', 'upfile/20160821140138.mp3');
INSERT INTO `qw_jl` VALUES ('169', '169', 'upfile/1471759719952-1322130035.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('170', '170', '', 'upfile/20160821140918.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('171', '171', '', 'upfile/20160821141053.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('172', '172', 'upfile/14717602884381116065763.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('173', '173', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('174', '174', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('175', '175', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('176', '176', 'upfile/1471762087858-699500774.jpg', 'upfile/20160821144810.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('177', '177', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('178', '178', 'upfile/1471765478893-1330931479.jpg', 'upfile/20160821154443.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('179', '179', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('180', '180', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('181', '181', 'upfile/1471834446797-13714512.jpg', 'upfile/20160822105408.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('182', '182', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('183', '183', 'upfile/1471835193811-1532218833.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('184', '184', 'upfile/1471835258766-1584779333.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('185', '185', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('186', '186', 'upfile/1471837980346-271349611.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('187', '187', 'upfile/1471838119373-1920373127.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('188', '188', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('189', '189', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('190', '190', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('191', '191', 'upfile/1471916773342-1704991208.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('192', '192', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('193', '193', 'upfile/1471917099224-1526783691.jpg', 'upfile/20160823095142.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('194', '194', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('195', '195', 'upfile/1471917310727-1526783691.jpg', 'upfile/20160823095513.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('196', '196', '', 'upfile/20160823151713.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('197', '197', '', 'upfile/20160823152435.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('198', '198', '', 'upfile/20160823152534.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('199', '199', 'upfile/1471939065737-537317754.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('200', '200', 'upfile/14719390817521559443835.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('201', '201', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('202', '202', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('203', '203', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('204', '204', 'upfile/1471939782472-64203895.jpg', 'upfile/20160823160943.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('205', '205', 'upfile/1471939877362-1359835855.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('206', '206', 'upfile/14719398729592064460004.jpg', 'upfile/20160823161127.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('207', '207', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('208', '208', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('209', '209', '', 'upfile/20160823161352.mp3', '', '', 'upfile/20160823161356.mp3', '');
INSERT INTO `qw_jl` VALUES ('210', '210', '', 'upfile/20160823161544.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('211', '211', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('212', '211', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('213', '211', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('214', '214', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('215', '215', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('216', '216', 'upfile/1472001835318159911845.jpg', 'upfile/20160824092359.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('217', '217', 'upfile/1472001862314-537317754.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('218', '218', '', 'upfile/20160824092627.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('219', '219', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('220', '220', 'upfile/1472003358763943648643.jpg', '', 'upfile/1472003365909387277422.jpg', 'upfile/14720033722911329760787.jpg', '', '');
INSERT INTO `qw_jl` VALUES ('221', '221', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('222', '222', 'upfile/1472019238497-214275189.jpg', 'upfile/20160824141404.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('223', '223', 'upfile/1472019313266-2104223083.jpg', 'upfile/20160824141521.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('226', '226', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('227', '227', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('224', '224', 'upfile/1472019467190-1895878526.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('225', '225', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('228', '228', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('229', '229', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('230', '230', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('231', '231', 'upfile/1472020491648372458662.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('232', '232', 'upfile/1472020533508-1294396167.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('233', '233', 'upfile/1472020617552-1309093246.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('234', '234', 'upfile/1472020650802691044430.jpg', 'upfile/20160824143748.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('235', '235', 'upfile/1472020737786-464839193.jpg', 'upfile/20160824143904.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('236', '236', 'upfile/1472021110296-806936279.jpg', 'upfile/20160824144522.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('237', '237', 'upfile/1472021247274-429116148.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('238', '238', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('239', '239', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('240', '240', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('241', '241', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('242', '242', 'upfile/1472024333738758648100.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('243', '243', 'upfile/1472024364492-1087954799.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('244', '244', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('245', '245', 'upfile/1472026997897-1047796266.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('246', '246', 'upfile/1472028497797-723865052.jpg', 'upfile/20160824164818.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('247', '247', '', 'upfile/20160825094757.mp3', '', '', 'upfile/20160825094810.mp3', '');
INSERT INTO `qw_jl` VALUES ('248', '248', '', 'upfile/20160825094950.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('249', '249', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('250', '250', 'upfile/1472180431189405832145.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('251', '251', 'upfile/14721880675401737472750.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('252', '252', 'upfile/1472188087762-1659116497.jpg', 'upfile/20160826130817.mp3', 'upfile/1472188095510-411527588.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('253', '253', 'upfile/14721881511251737472750.jpg', 'upfile/20160826130929.mp3', 'upfile/1472188158773-1659116497.jpg', 'upfile/1472188167145-411527588.jpg', 'upfile/20160826130937.mp3', '');
INSERT INTO `qw_jl` VALUES ('254', '254', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('255', '255', '', 'upfile/20160826151057.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('256', '256', 'upfile/14761558099671914310020.jpg', 'upfile/20161011111700.mp3', '', '', 'upfile/20161011111703.mp3', '');
INSERT INTO `qw_jl` VALUES ('257', '257', 'upfile/20161013092711.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('258', '258', 'upfile/20161013094412.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('259', '259', 'upfile/1476323986581-445065500.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('260', '260', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('261', '261', '', 'upfile/20161013101609.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('262', '262', 'upfile/20161013111602.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('263', '263', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('264', '264', 'upfile/20161014112459.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('265', '265', 'upfile/20161014165419.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('266', '266', 'upfile/20161014165904.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('267', '267', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('268', '268', 'upfile/1476496231047847766015.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('269', '269', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('270', '270', 'upfile/14765169825051842817642.jpg', 'upfile/20161015153623.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('271', '271', 'upfile/1476670240819-346533940.jpg', 'upfile/20161017101026.mp3', 'upfile/14766702473792111473848.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('272', '272', 'upfile/1476676321262-2093325391.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('273', '273', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('274', '274', 'upfile/1476699110882-1689572220.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('275', '275', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('276', '276', 'upfile/14767574630381884413167.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('277', '277', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('278', '278', '', 'upfile/20161018104127.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('279', '279', 'upfile/1476758945267-127540644.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('280', '280', '', 'upfile/20161018105148.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('281', '281', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('282', '282', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('283', '283', 'upfile/20161028145837.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('284', '284', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('285', '285', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('286', '286', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('287', '287', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('288', '288', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('289', '289', 'upfile/1478138710598-951184954.jpg', 'upfile/20161103100534.mp3', 'upfile/14781387205001229440365.jpg', 'upfile/1478138730930-399645483.jpg', 'upfile/20161103100537.mp3', 'upfile/20161103100540.mp3');
INSERT INTO `qw_jl` VALUES ('290', '290', 'upfile/20161108100231.jpg', 'upfile/20161108100248.mp3', 'upfile/20161108100254.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('291', '291', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('292', '292', 'upfile/20161108100836.jpg', 'upfile/20161108100842.mp3', 'upfile/20161108100848.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('293', '293', 'upfile/20161108101002.jpg', 'upfile/20161108101031.mp3', 'upfile/20161108101009.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('294', '294', 'upfile/20161109153424.jpg', 'upfile/20161109153433.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('295', '295', 'upfile/20161109153716.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('296', '296', 'upfile/20161109153819.jpg', 'upfile/20161109153814.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('297', '297', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('298', '298', 'upfile/1478743195733-1383131100.jpg', 'upfile/20161110100006.mp3', 'upfile/1478743203666-2013435485.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('299', '299', 'upfile/20161110164011.jpg', 'upfile/20161110164021.mp3', '', '', 'upfile/20161110164032.mp3', '');
INSERT INTO `qw_jl` VALUES ('300', '300', 'upfile/20161111094317.jpg', 'upfile/20161111094328.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('301', '301', 'upfile/20161111094455.jpg', 'upfile/20161111094506.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('302', '302', 'upfile/14790411225652018811090.jpg', 'upfile/20161113204547.mp3', 'upfile/14790411318231844597378.jpg', '', 'upfile/20161113204554.mp3', '');
INSERT INTO `qw_jl` VALUES ('303', '303', 'upfile/1479041215696-1823741731.jpg', 'upfile/20161113204705.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('304', '304', 'upfile/20161114111055.jpg', 'upfile/20161114111046.mp3', '', '', 'upfile/20161114111051.mp3', '');
INSERT INTO `qw_jl` VALUES ('305', '305', 'upfile/20161114154138.jpg', 'upfile/20161114154221.mp3', 'upfile/20161114154146.jpg', 'upfile/20161114154202.jpg', 'upfile/20161114154225.mp3', 'upfile/20161114154229.mp3');
INSERT INTO `qw_jl` VALUES ('306', '306', 'upfile/20161114154335.jpg', 'upfile/20161114154353.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('307', '307', 'upfile/20161115101452.jpg', 'upfile/20161115101517.mp3', 'upfile/20161115101503.jpg', '', 'upfile/20161115101555.mp3', '');
INSERT INTO `qw_jl` VALUES ('308', '308', 'upfile/20161115140630.jpg', 'upfile/20161115140639.mp3', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('309', '309', 'upfile/1479274630036-514381690.jpg', 'upfile/20161116133743.mp3', 'upfile/20161116133712.jpg', 'upfile/20161116133724.jpg', 'upfile/20161116133749.mp3', 'upfile/20161116133754.mp3');
INSERT INTO `qw_jl` VALUES ('310', '310', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('311', '311', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('312', '312', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('313', '313', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('314', '314', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('315', '315', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('316', '316', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('317', '317', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('318', '318', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('319', '319', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('320', '320', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('321', '321', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('322', '322', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('342', '342', '', 'upfile/1479434926139.amr', '', '', 'upfile/1479434749977.amr', 'upfile/1479434845525.amr');
INSERT INTO `qw_jl` VALUES ('343', '343', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('344', '344', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('345', '345', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('346', '346', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('347', '347', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('348', '348', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('349', '349', 'upfile/1479437902000.jpg', 'upfile/1479437273082.amr', 'upfile/1479437277000.jpg', 'upfile/1479438371000.jpg', 'upfile/1479438376441.amr', 'upfile/1479438633987.amr');
INSERT INTO `qw_jl` VALUES ('350', '350', 'upfile/1479799340000.jpg', 'upfile/1479799414853.amr', 'upfile/1479799369000.jpg', 'upfile/1479799404000.jpg', 'upfile/1479799422128.amr', '');
INSERT INTO `qw_jl` VALUES ('351', '351', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('352', '352', '', 'upfile/1479804835927.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('353', '353', '', 'upfile/1480473545929.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('354', '354', '', 'upfile/1480473545929.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('355', '355', '', 'upfile/1481093875640.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('356', '356', 'upfile/1481181572000.jpg', 'upfile/1481181622821.amr', 'upfile/1481181580000.jpg', 'upfile/1481181586000.jpg', 'upfile/1481181628814.amr', 'upfile/1481181633960.amr');
INSERT INTO `qw_jl` VALUES ('357', '357', 'upfile/1481181572000.jpg', 'upfile/1481181622821.amr', 'upfile/1481181580000.jpg', 'upfile/1481181586000.jpg', 'upfile/1481181628814.amr', 'upfile/1481181633960.amr');
INSERT INTO `qw_jl` VALUES ('358', '358', 'upfile/1481181572000.jpg', 'upfile/1481181622821.amr', 'upfile/1481181580000.jpg', 'upfile/1481181586000.jpg', 'upfile/1481181628814.amr', 'upfile/1481181633960.amr');
INSERT INTO `qw_jl` VALUES ('359', '359', 'upfile/1481246964000.jpg', 'upfile/1481246972376.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('360', '360', 'upfile/1481246964000.jpg', 'upfile/1481246972376.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('361', '361', 'upfile/1481247606000.jpg', 'upfile/1481247634586.amr', 'upfile/1481247621000.jpg', 'upfile/1481247627000.jpg', 'upfile/1481247639751.amr', 'upfile/1481247641868.amr');
INSERT INTO `qw_jl` VALUES ('362', '362', 'upfile/1481251086000.jpg', 'upfile/1481251114739.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('363', '363', 'upfile/1481251385000.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('364', '364', 'upfile/1481251385000.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('365', '365', 'upfile/1481251385000.jpg', 'upfile/1481251385000.jpg', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('366', '366', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('367', '367', 'upfile/1481254506000.jpg', 'upfile/1481254514742.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('368', '368', '', 'upfile/1481267174054.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('369', '369', '', 'upfile/1481274483971.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('370', '370', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('371', '371', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('372', '372', '', 'upfile/1481275835200.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('373', '373', '', 'upfile/1481521128288.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('374', '374', 'upfile/1481595358000.jpg', 'upfile/1481595367898.amr', 'upfile/1481595385000.jpg', '', 'upfile/1481595377438.amr', '');
INSERT INTO `qw_jl` VALUES ('375', '375', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('376', '376', 'upfile/1481612679000.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('377', '377', 'upfile/1481617167000.jpg', 'upfile/1481617177956.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('378', '378', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('379', '379', 'upfile/1481767910000.jpg', 'upfile/1481767920522.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('380', '380', 'upfile/1481771566000.jpg', 'upfile/1481771577897.amr', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('381', '381', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('382', '382', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('383', '383', 'upfile/1482032810000.jpg', 'upfile/1482032826540.amr', 'upfile/1482032832000.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('384', '384', 'upfile/1482037699000.jpg', 'upfile/1482037721134.amr', 'upfile/1482037709000.jpg', 'upfile/1482037714000.jpg', '', '');
INSERT INTO `qw_jl` VALUES ('385', '385', 'upfile/1482037744000.jpg', '', 'upfile/1482037750000.jpg', 'upfile/1482037755000.jpg', '', '');
INSERT INTO `qw_jl` VALUES ('386', '386', 'upfile/1482037879000.jpg', '', 'upfile/1482038886000.jpg', '', '', '');
INSERT INTO `qw_jl` VALUES ('387', '387', 'upfile/1482046580000.jpg', 'upfile/1482046601633.amr', 'upfile/1482046588000.jpg', 'upfile/1482046594000.jpg', '', '');
INSERT INTO `qw_jl` VALUES ('388', '388', '', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('389', '389', 'upfile/1482222803000.jpg', '', '', '', '', '');
INSERT INTO `qw_jl` VALUES ('390', '390', '', '', '', '', '', '');

-- -----------------------------
-- Table structure for `qw_links`
-- -----------------------------
DROP TABLE IF EXISTS `qw_links`;
CREATE TABLE `qw_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '外链名',
  `url` varchar(255) NOT NULL COMMENT '地址',
  `logo` varchar(255) NOT NULL COMMENT 'logo图',
  `o` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `qw_log`
-- -----------------------------
DROP TABLE IF EXISTS `qw_log`;
CREATE TABLE `qw_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `t` int(10) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `log` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=896 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_log`
-- -----------------------------
INSERT INTO `qw_log` VALUES ('864', 'admin', '1479459613', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('847', 'xunjian', '1478826044', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('846', 'admin', '1478761783', '127.0.0.1', '编辑用户组，ID：9，组名：巡检员');
INSERT INTO `qw_log` VALUES ('829', 'admin', '1478485817', '127.0.0.1', '新增菜单，名称：巡更设备报障');
INSERT INTO `qw_log` VALUES ('845', 'admin', '1478761765', '127.0.0.1', '新增菜单，名称：巡更计划详情');
INSERT INTO `qw_log` VALUES ('844', 'admin', '1478760475', '127.0.0.1', '编辑用户组，ID：9，组名：巡检员');
INSERT INTO `qw_log` VALUES ('842', 'admin', '1478739461', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('843', 'xunjian', '1478760439', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('840', 'xunjian', '1478653928', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('841', 'admin', '1478677360', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('837', 'admin', '1478566706', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('838', 'xunjian', '1478574412', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('836', 'admin', '1478496752', '127.0.0.1', '新增分类，ID：20，名称：1号巡更点');
INSERT INTO `qw_log` VALUES ('835', 'admin', '1478491019', '127.0.0.1', '巡检分类修改，ID：19，名称：大厦巡更2');
INSERT INTO `qw_log` VALUES ('833', 'admin', '1478490386', '127.0.0.1', '新增分类，ID：18，名称：1号巡更点');
INSERT INTO `qw_log` VALUES ('834', 'admin', '1478490857', '127.0.0.1', '新增分类，ID：19，名称：大厦巡更');
INSERT INTO `qw_log` VALUES ('831', 'admin', '1478488645', '127.0.0.1', '新增菜单，名称：巡检地点管理');
INSERT INTO `qw_log` VALUES ('832', 'admin', '1478490285', '127.0.0.1', '新增分类，ID：24，名称：1号巡更点');
INSERT INTO `qw_log` VALUES ('830', 'admin', '1478488431', '127.0.0.1', '编辑菜单，ID：138');
INSERT INTO `qw_log` VALUES ('828', 'admin', '1478485352', '127.0.0.1', '编辑菜单，ID：138');
INSERT INTO `qw_log` VALUES ('827', 'admin', '1478484489', '127.0.0.1', '编辑菜单，ID：138');
INSERT INTO `qw_log` VALUES ('826', 'admin', '1478482354', '127.0.0.1', '新增菜单，名称：巡更栏目/设备管理');
INSERT INTO `qw_log` VALUES ('825', 'admin', '1478482289', '127.0.0.1', '新增菜单，名称：巡更报表管理');
INSERT INTO `qw_log` VALUES ('824', 'admin', '1478482230', '127.0.0.1', '新增菜单，名称：巡更计划管理');
INSERT INTO `qw_log` VALUES ('874', 'admin', '1481159422', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('875', 'admin', '1481245124', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('877', 'admin', '1481591620', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('789', 'admin', '1477530117', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('883', 'admin', '1481764511', '127.0.0.1', '删除菜单ID：74');
INSERT INTO `qw_log` VALUES ('880', 'admin', '1481678144', '127.0.0.1', '删除菜单ID：77');
INSERT INTO `qw_log` VALUES ('881', 'admin', '1481684066', '127.0.0.1', '巡检分类修改，ID：115，名称：消防通道0003');
INSERT INTO `qw_log` VALUES ('882', 'admin', '1481763740', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('879', 'admin', '1481677754', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('884', 'admin', '1481764535', '127.0.0.1', '编辑菜单，ID：70');
INSERT INTO `qw_log` VALUES ('885', 'xunjian', '1481772615', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('886', 'admin', '1481850248', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('876', 'admin', '1481506618', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('895', 'admin', '1482485040', '127.0.0.1', '备份完成！');
INSERT INTO `qw_log` VALUES ('894', 'admin', '1482454439', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('893', 'admin', '1482388934', '127.0.0.1', '修改个人资料');
INSERT INTO `qw_log` VALUES ('892', 'admin', '1482372002', '127.0.0.1', '新增会员，会员UID：7');
INSERT INTO `qw_log` VALUES ('891', 'admin', '1482371640', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('890', 'admin', '1482299645', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('878', 'xunjian', '1481591678', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('887', 'admin', '1482032235', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('888', 'admin', '1482112491', '127.0.0.1', '编辑用户组，ID：6，组名：维修组');
INSERT INTO `qw_log` VALUES ('889', 'admin', '1482197640', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('865', 'admin', '1479783507', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('822', 'admin', '1478480544', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('821', 'admin', '1478222955', '127.0.0.1', '新增菜单，名称：维修单管理');
INSERT INTO `qw_log` VALUES ('820', 'admin', '1478222697', '127.0.0.1', '编辑菜单，ID：25');
INSERT INTO `qw_log` VALUES ('818', 'admin', '1478160562', '127.0.0.1', '新增文章，AID：9');
INSERT INTO `qw_log` VALUES ('819', 'admin', '1478221243', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('817', 'admin', '1478160499', '127.0.0.1', '编辑文章，AID：3');
INSERT INTO `qw_log` VALUES ('816', 'admin', '1478160425', '127.0.0.1', '编辑文章，AID：3');
INSERT INTO `qw_log` VALUES ('814', 'admin', '1478160349', '127.0.0.1', '编辑文章，AID：3');
INSERT INTO `qw_log` VALUES ('815', 'admin', '1478160398', '127.0.0.1', '编辑文章，AID：3');
INSERT INTO `qw_log` VALUES ('813', 'admin', '1478136589', '127.0.0.1', '巡检分类修改，ID：113，名称：挡烟垂壁0002');
INSERT INTO `qw_log` VALUES ('812', 'admin', '1478136314', '127.0.0.1', '巡检分类修改，ID：2，名称：消防箱六回路0002');
INSERT INTO `qw_log` VALUES ('811', 'admin', '1478136181', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('810', 'admin', '1478075670', '127.0.0.1', '巡检分类修改，ID：114，名称：消防通道0001');
INSERT INTO `qw_log` VALUES ('808', 'admin', '1478067112', '127.0.0.1', '新增分类，ID：40，名称：消防箱故障');
INSERT INTO `qw_log` VALUES ('809', 'admin', '1478069048', '127.0.0.1', '文章分类修改，ID：40，名称：消防箱故障');
INSERT INTO `qw_log` VALUES ('807', 'admin', '1478067092', '127.0.0.1', '新增分类，ID：39，名称：消防设备故障');
INSERT INTO `qw_log` VALUES ('806', 'admin', '1478066397', '127.0.0.1', '新增分类，ID：38，名称：喷淋故障');
INSERT INTO `qw_log` VALUES ('805', 'admin', '1478055649', '127.0.0.1', '编辑菜单，ID：72');
INSERT INTO `qw_log` VALUES ('803', 'admin', '1477876607', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('802', 'xunjian', '1477633985', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('799', 'admin', '1477625376', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('798', 'admin', '1477616744', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('797', 'xunjian', '1477616413', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('796', 'admin', '1477616280', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('795', 'admin', '1477538697', '127.0.0.1', '编辑菜单，ID：133');
INSERT INTO `qw_log` VALUES ('794', 'xunjian', '1477538641', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('793', 'admin', '1477538599', '127.0.0.1', '编辑用户组，ID：9，组名：巡检员');
INSERT INTO `qw_log` VALUES ('792', 'admin', '1477538579', '127.0.0.1', '新增菜单，名称：巡检报表查询');
INSERT INTO `qw_log` VALUES ('791', 'admin', '1477531811', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('790', 'xunjian', '1477530964', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('801', 'xunjian', '1477632040', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('800', 'admin', '1477632016', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('804', 'admin', '1478050035', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('823', 'admin', '1478482158', '127.0.0.1', '新增菜单，名称：安全巡更系统');
INSERT INTO `qw_log` VALUES ('839', 'admin', '1478653779', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('848', 'admin', '1478833674', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('849', 'admin', '1479086014', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('863', 'xunjian', '1479439431', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('862', 'xunjian', '1479435993', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('861', 'admin', '1479435960', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('860', 'admin', '1479368760', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('859', 'admin', '1479265203', '127.0.0.1', '编辑菜单，ID：78');
INSERT INTO `qw_log` VALUES ('858', 'admin', '1479265164', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('857', 'admin', '1479258310', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('856', 'admin', '1479191048', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('855', 'admin', '1479190955', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('854', 'admin', '1479172595', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('853', 'admin', '1479091367', '127.0.0.1', '删除菜单ID：31');
INSERT INTO `qw_log` VALUES ('852', 'admin', '1479091322', '127.0.0.1', '文章分类修改，ID：38，名称：喷淋故障');
INSERT INTO `qw_log` VALUES ('851', 'admin', '1479091084', '127.0.0.1', '编辑菜单，ID：31');
INSERT INTO `qw_log` VALUES ('850', 'admin', '1479090998', '127.0.0.1', '编辑菜单，ID：31');
INSERT INTO `qw_log` VALUES ('867', 'admin', '1480381849', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('866', 'admin', '1479880487', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('872', 'admin', '1480987259', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('873', 'admin', '1481072632', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('871', 'admin', '1480987242', '127.0.0.1', '登录失败。');
INSERT INTO `qw_log` VALUES ('870', 'admin', '1480640054', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('868', 'admin', '1480468251', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('869', 'admin', '1480640042', '127.0.0.1', '登录失败。');

-- -----------------------------
-- Table structure for `qw_member`
-- -----------------------------
DROP TABLE IF EXISTS `qw_member`;
CREATE TABLE `qw_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(225) NOT NULL,
  `head` varchar(255) NOT NULL COMMENT '头像',
  `sex` tinyint(1) NOT NULL COMMENT '0保密1男，2女',
  `birthday` int(10) NOT NULL COMMENT '生日',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL,
  `t` int(10) unsigned NOT NULL COMMENT '注册时间',
  `identifier` varchar(32) NOT NULL,
  `token` varchar(32) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `o_id` varchar(255) NOT NULL,
  `guanli` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_member`
-- -----------------------------
INSERT INTO `qw_member` VALUES ('1', 'admin', 'head/advert.jpg', '1', '1420128000', '13800138000', '331349451', 'admin@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1442505600', '34dcb69d1ecec70b2e694a05751ffe09', '36cd1b53d3a194d29a8e5e95f40523bd', 'g7NQPATS9k', '41,40,39', '1,0,1');
INSERT INTO `qw_member` VALUES ('2', '张秀行', '', '2', '0', '', '', '', 'e6e21263ffa26fb6029bc242e6f22e40', '1470302707', 'ca4fcba9052f56e5331854134849e4a1', '664fb185982f511b320e7881a58fd749', 'n9esZehHtF', '41', '0');
INSERT INTO `qw_member` VALUES ('3', 'xunjian', '', '0', '0', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '1470302665', '53c6b50221a54cb87476a4034f179fd0', '850823b78e21477fcb9fac7c93948ef1', 'nQuy8DYzCk', '40,39', '1,0');
INSERT INTO `qw_member` VALUES ('4', '张文', '', '0', '0', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '1470302924', '602aa6f88e4af23fd4172ef32c6f7d36', '311f55ebfee3bab6ced4fa5f87625554', 'rBPCRep92T', '39', '0');
INSERT INTO `qw_member` VALUES ('5', 'admin1', '', '0', '0', '', '', '', '123456', '1471496857', 'dc9cda118de4c804b6ae3d31e56c76ce', '0eeb614d706962ea9dc74197a2ea7882', '6zaEh6Djn8', '', '');
INSERT INTO `qw_member` VALUES ('6', '李娜', '', '0', '0', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '1471579671', 'b07d618e01b032e9661e61fb927491e4', 'b5e934039ba376b225794dbd7671bd66', 'B63ZJ3cTqD', '41,40,39', '1,0,1');
INSERT INTO `qw_member` VALUES ('7', '元芳', '', '0', '0', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '1482372002', 'e4b91c93d8fc7279016e37eb4c477254', '36450a053efcbb058e1ae600ea3f6848', 'SpvG8pa9Pw', '41', '0');

-- -----------------------------
-- Table structure for `qw_organization`
-- -----------------------------
DROP TABLE IF EXISTS `qw_organization`;
CREATE TABLE `qw_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `content` text NOT NULL,
  `o` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_organization`
-- -----------------------------
INSERT INTO `qw_organization` VALUES ('36', '0', '中心医疗集团', '', '0');
INSERT INTO `qw_organization` VALUES ('39', '38', '维修A队', '', '0');
INSERT INTO `qw_organization` VALUES ('38', '36', '总务科', '', '0');
INSERT INTO `qw_organization` VALUES ('40', '38', '巡检A队', '', '0');
INSERT INTO `qw_organization` VALUES ('41', '38', '维修B队', '', '0');

-- -----------------------------
-- Table structure for `qw_patrol`
-- -----------------------------
DROP TABLE IF EXISTS `qw_patrol`;
CREATE TABLE `qw_patrol` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderid` int(10) NOT NULL DEFAULT '0' COMMENT '排序呢',
  `name` varchar(200) NOT NULL COMMENT '巡检栏目名称',
  `erweima` varchar(200) NOT NULL DEFAULT '0' COMMENT '二维码',
  `tiaoma` varchar(200) NOT NULL COMMENT '条形码',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `img` varchar(255) DEFAULT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_patrol`
-- -----------------------------
INSERT INTO `qw_patrol` VALUES ('1', '1', '消防设备', '001', '', '', '/Public/attached/201608/1470289397.jpg', '0');
INSERT INTO `qw_patrol` VALUES ('2', '2', '管道水', '', '', '', '/Public/attached/201608/1470289412.jpg', '0');
INSERT INTO `qw_patrol` VALUES ('3', '3', '报警系统', '', '', '', '/Public/attached/201608/1470214770.jpg', '0');
INSERT INTO `qw_patrol` VALUES ('4', '4', '标识系统', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('5', '5', '通道', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('6', '6', '防火门', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('7', '7', '气体系统', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('8', '8', '水箱', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('9', '9', '泵房', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('10', '11', '防火卷帘', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('11', '10', '排烟系统', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('12', '12', '广播', '', '', '', '', '0');
INSERT INTO `qw_patrol` VALUES ('13', '13', '正压风口', '', '', '', '', '0');

-- -----------------------------
-- Table structure for `qw_patroljl`
-- -----------------------------
DROP TABLE IF EXISTS `qw_patroljl`;
CREATE TABLE `qw_patroljl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `name` int(10) NOT NULL,
  `time` int(50) NOT NULL,
  `zt` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_patroljl`
-- -----------------------------
INSERT INTO `qw_patroljl` VALUES ('1', '1', '2', '1467788078', '1');
INSERT INTO `qw_patroljl` VALUES ('2', '2', '2', '1467788278', '0');

-- -----------------------------
-- Table structure for `qw_patrolzt`
-- -----------------------------
DROP TABLE IF EXISTS `qw_patrolzt`;
CREATE TABLE `qw_patrolzt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_patrolzt`
-- -----------------------------
INSERT INTO `qw_patrolzt` VALUES ('37', '0', '巡检中');
INSERT INTO `qw_patrolzt` VALUES ('40', '1', '完成巡检');
INSERT INTO `qw_patrolzt` VALUES ('41', '2', '未巡检');

-- -----------------------------
-- Table structure for `qw_project`
-- -----------------------------
DROP TABLE IF EXISTS `qw_project`;
CREATE TABLE `qw_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `orderid` int(10) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `bz` varchar(255) DEFAULT NULL,
  `parentid` int(100) NOT NULL DEFAULT '0',
  `bianhao` varchar(100) NOT NULL,
  `zhouqi` int(255) NOT NULL DEFAULT '604800',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_project`
-- -----------------------------
INSERT INTO `qw_project` VALUES ('1', '1', '0', '消防箱', '001', '0', '0', '2592000');
INSERT INTO `qw_project` VALUES ('2', '1', '1', '烟感', '002', '0', '0', '604800');
INSERT INTO `qw_project` VALUES ('3', '1', '4', '手报', '005', '0', '0', '604800');
INSERT INTO `qw_project` VALUES ('5', '0', '6', '消防箱下', '0003', '1', '0003', '604800');
INSERT INTO `qw_project` VALUES ('17', '1', '6', '喷淋', '006', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('9', '1', '2', '消防广播', '003', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('10', '1', '3', '层显', '004', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('11', '1', '8', '安全出口指示标示', '008', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('13', '0', '3', '消防箱上', '0002', '1', '0002', '604800');
INSERT INTO `qw_project` VALUES ('18', '1', '7', '末端试水', '007', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('19', '1', '0', '卷帘门', '009', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('20', '1', '0', '挡烟垂壁', '010', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('21', '1', '0', '消防通道', '011', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('22', '1', '1', '机械排烟阀', '012', '0', '', '604800');
INSERT INTO `qw_project` VALUES ('23', '3', '0', 'aa', '', '0', '', '0');
INSERT INTO `qw_project` VALUES ('24', '1', '1', '1号巡更点', '', '0', '', '0');

-- -----------------------------
-- Table structure for `qw_projectjl`
-- -----------------------------
DROP TABLE IF EXISTS `qw_projectjl`;
CREATE TABLE `qw_projectjl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `zhixingsbid` int(10) NOT NULL,
  `projectid` int(10) NOT NULL,
  `zt` int(2) NOT NULL,
  `time` int(100) NOT NULL,
  `shebeiid` int(100) NOT NULL,
  `name` int(100) NOT NULL,
  `danhao` varchar(100) NOT NULL,
  `ztid` int(1) NOT NULL DEFAULT '0' COMMENT '0=正常  ， 1=不正常',
  `parentid` int(100) DEFAULT '0',
  `shebeihao` varchar(10) DEFAULT NULL COMMENT '子设备号 可能N个',
  `keshi` int(10) NOT NULL DEFAULT '36' COMMENT '所属科室',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=529 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_projectjl`
-- -----------------------------
INSERT INTO `qw_projectjl` VALUES ('194', '1', '18', '1', '1471596667', '21', '3', '1471596667321', '1', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('370', '1', '20', '1', '1472026210', '113', '3', '14720262103113', '0', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('363', '1', '3', '1', '1472021489', '93', '3', '1472021489393', '0', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('198', '1', '2', '1', '1471664932', '16', '0', '1471664932016', '0', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('199', '335', '2', '1', '1471664943', '16', '0', '1471664943016', '0', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('384', '0', '17', '1', '1476155840', '20', '3', '1476155840320', '1', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('385', '0', '0', '1', '1476322057', '1', '3', '147632205731', '1', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('386', '0', '1', '1', '1476323075', '1', '3', '147632307531', '1', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('387', '0', '1', '1', '1476323996', '1', '3', '147632399631', '1', '0', '', '36');
INSERT INTO `qw_projectjl` VALUES ('388', '133', '1', '1', '1476324218', '1', '3', '147632421831', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('389', '415', '1', '1', '1476324982', '1', '3', '147632498231', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('390', '415', '1', '1', '1476328577', '1', '3', '147632857731', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('391', '441', '1', '1', '1476411047', '1', '3', '147641104731', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('392', '440', '1', '1', '1476415522', '2', '3', '147641552232', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('393', '454', '1', '1', '1476435276', '1', '3', '147643527631', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('394', '454', '1', '1', '1476435563', '1', '3', '147643556331', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('395', '467', '1', '1', '1476496074', '1', '3', '147649607431', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('396', '467', '1', '1', '1476496243', '1', '3', '147649624331', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('397', '466', '1', '1', '1476502834', '2', '3', '147650283432', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('398', '480', '1', '1', '1476516998', '1', '3', '147651699831', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('399', '493', '1', '1', '1476670283', '1', '3', '147667028331', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('400', '493', '1', '1', '1476676335', '1', '3', '147667633531', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('401', '504', '1', '1', '1476695539', '3', '3', '147669553933', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('402', '506', '1', '1', '1476699125', '1', '3', '147669912531', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('403', '506', '1', '1', '1476700109', '1', '3', '147670010931', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('404', '519', '1', '1', '1476757481', '1', '3', '147675748131', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('405', '518', '1', '1', '1476757725', '2', '3', '147675772532', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('406', '517', '1', '1', '1476758508', '3', '3', '147675850833', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('407', '520', '1', '1', '1476758963', '3', '3', '147675896333', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('408', '521', '1', '1', '1476759130', '2', '3', '147675913032', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('409', '523', '1', '1', '1476759406', '1', '3', '147675940631', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('410', '666', '1', '1', '1477637296', '1', '3', '147763729631', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('411', '666', '1', '1', '1477637936', '1', '3', '147763793631', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('432', '0', '1', '1', '1478676885', '3', '3', '147867688533', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('433', '697', '1', '1', '1478677047', '3', '3', '147867704733', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('434', '787', '1', '1', '1478677112', '1', '3', '147867711231', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('435', '787', '1', '1', '1478677166', '1', '3', '147867716631', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('436', '793', '1', '1', '1478743225', '1', '3', '147874322531', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('437', '799', '1', '1', '1478767251', '1', '3', '147876725131', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('438', '805', '1', '1', '1478828625', '1', '3', '147882862531', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('427', '722', '1', '1', '1478138748', '1', '3', '147813874831', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('428', '758', '1', '1', '1478570588', '1', '3', '147857058831', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('429', '758', '1', '1', '1478570624', '1', '3', '147857062431', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('430', '0', '1', '1', '1478570948', '2', '3', '147857094832', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('431', '759', '1', '1', '1478571042', '3', '3', '147857104233', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('439', '805', '1', '1', '1478828722', '1', '3', '147882872231', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('440', '811', '1', '1', '1479041177', '1', '3', '147904117731', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('441', '811', '1', '1', '1479041247', '1', '3', '147904124731', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('442', '817', '1', '1', '1479093083', '1', '3', '147909308331', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('443', '823', '1', '1', '1479109374', '1', '3', '147910937431', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('444', '823', '1', '1', '1479109463', '1', '3', '147910946331', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('445', '829', '1', '1', '1479176543', '1', '3', '147917654331', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('446', '829', '1', '1', '1479190025', '1', '3', '147919002531', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('447', '841', '1', '1', '1479274706', '1', '3', '147927470631', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('448', '847', '1', '1', '1479285693', '1', '3', '147928569331', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('449', '847', '1', '1', '1479285694', '1', '3', '147928569431', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('450', '847', '1', '1', '1479285696', '1', '3', '147928569631', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('451', '847', '1', '1', '1479285777', '1', '3', '147928577731', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('452', '847', '1', '1', '1479285778', '1', '3', '147928577831', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('453', '847', '1', '1', '1479285779', '1', '3', '147928577931', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('454', '847', '1', '1', '1479286699', '1', '3', '147928669931', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('455', '847', '1', '1', '1479286700', '1', '3', '147928670031', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('456', '847', '1', '1', '1479286702', '1', '3', '147928670231', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('457', '847', '1', '1', '1479287357', '1', '3', '147928735731', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('458', '853', '1', '1', '1479368648', '1', '3', '147936864831', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('459', '853', '1', '1', '1479368984', '1', '3', '147936898431', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('460', '853', '1', '1', '1479369101', '1', '3', '147936910131', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('461', '853', '1', '1', '1479369677', '1', '3', '147936967731', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('462', '853', '1', '1', '1479369757', '1', '3', '147936975731', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('463', '853', '1', '1', '1479370114', '1', '3', '147937011431', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('464', '853', '1', '1', '1479370150', '1', '3', '147937015031', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('465', '853', '1', '1', '1479370316', '1', '3', '147937031631', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('466', '853', '1', '1', '1479370335', '1', '3', '147937033531', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('467', '853', '1', '1', '1479370457', '1', '3', '147937045731', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('468', '853', '1', '1', '1479370500', '1', '3', '147937050031', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('469', '853', '1', '1', '1479370754', '1', '3', '147937075431', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('470', '853', '1', '1', '1479370797', '1', '3', '147937079731', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('471', '853', '1', '1', '1479430765', '1', '3', '147943076531', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('472', '853', '1', '1', '1479430767', '1', '3', '147943076731', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('473', '853', '1', '1', '1479430789', '1', '3', '147943078931', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('474', '853', '1', '1', '1479430792', '1', '3', '147943079231', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('475', '853', '1', '1', '1479431116', '1', '3', '147943111631', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('476', '859', '1', '1', '1479434915', '1', '3', '147943491531', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('477', '859', '1', '1', '1479434925', '1', '3', '147943492531', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('478', '859', '1', '1', '1479434934', '1', '3', '147943493431', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('479', '859', '1', '1', '1479434953', '1', '3', '147943495331', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('480', '859', '1', '1', '1479436679', '1', '3', '147943667931', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('481', '859', '1', '1', '1479437485', '1', '3', '147943748531', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('482', '859', '1', '1', '1479437527', '1', '3', '147943752731', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('483', '859', '1', '1', '1479437949', '1', '3', '147943794931', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('484', '859', '1', '1', '1479437969', '1', '3', '147943796931', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('485', '859', '1', '1', '1479438406', '1', '3', '147943840631', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('486', '859', '1', '1', '1479438663', '1', '3', '147943866331', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('487', '859', '1', '1', '1479438752', '1', '3', '147943875231', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('488', '877', '1', '1', '1479799447', '1', '3', '147979944731', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('489', '883', '1', '1', '1479804761', '1', '3', '147980476131', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('490', '883', '1', '1', '1479804842', '1', '3', '147980484231', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('491', '931', '1', '1', '1480473555', '1', '3', '148047355531', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('492', '927', '1', '1', '1480484535', '1', '6', '148048453561', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('493', '1000', '1', '1', '1481093883', '1', '3', '148109388331', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('494', '1008', '1', '1', '1481182001', '1', '6', '148118200161', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('495', '1008', '1', '1', '1481182214', '1', '6', '148118221461', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('496', '1008', '1', '1', '1481182216', '1', '6', '148118221661', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('497', '1014', '1', '1', '1481246999', '1', '6', '148124699961', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('498', '1014', '1', '1', '1481247025', '1', '6', '148124702561', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('499', '1014', '1', '1', '1481247659', '1', '6', '148124765961', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('500', '1018', '1', '1', '1481251123', '1', '3', '148125112331', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('501', '1014', '1', '1', '1481251397', '1', '6', '148125139761', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('502', '1018', '1', '1', '1481252875', '1', '3', '148125287531', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('503', '1014', '1', '1', '1481254089', '1', '6', '148125408961', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('504', '1018', '1', '1', '1481254272', '1', '6', '148125427261', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('505', '1018', '1', '1', '1481254522', '1', '6', '148125452261', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('506', '1014', '1', '1', '1481267199', '1', '6', '148126719961', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('507', '1020', '1', '1', '1481274495', '1', '6', '148127449561', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('508', '1020', '1', '1', '1481275639', '1', '6', '148127563961', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('509', '1020', '1', '1', '1481275641', '1', '6', '148127564161', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('510', '1020', '1', '1', '1481275845', '1', '6', '148127584561', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('511', '1024', '1', '1', '1481521131', '1', '3', '148152113131', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('512', '1030', '1', '1', '1481595449', '1', '3', '148159544931', '0', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('513', '971', '1', '1', '1481612643', '1', '4', '148161264341', '0', '0', '', '39');
INSERT INTO `qw_projectjl` VALUES ('514', '971', '1', '1', '1481612683', '1', '4', '148161268341', '0', '0', '', '39');
INSERT INTO `qw_projectjl` VALUES ('515', '1032', '1', '1', '1481617188', '1', '6', '148161718861', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('516', '1042', '1', '1', '1481618646', '1', '6', '148161864661', '1', '0', '', '40');
INSERT INTO `qw_projectjl` VALUES ('517', '1044', '1', '1', '1481767928', '1', '6', '148176792861', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('518', '1044', '1', '1', '1481771583', '1', '6', '148177158361', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('519', '1044', '1', '1', '1481772603', '1', '6', '148177260361', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('520', '1044', '1', '1', '1481773553', '1', '6', '148177355361', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('521', '1063', '1', '1', '1482032831', '1', '6', '148203283161', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('522', '1062', '1', '1', '1482037729', '1', '6', '148203772961', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('523', '1063', '1', '1', '1482037772', '1', '6', '148203777261', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('524', '1062', '1', '1', '1482038895', '1', '6', '148203889561', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('525', '1069', '1', '1', '1482046610', '1', '6', '148204661061', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('526', '1070', '1', '1', '1482047483', '1', '6', '148204748361', '0', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('527', '1076', '1', '1', '1482222812', '1', '6', '148222281261', '1', '0', '', '41');
INSERT INTO `qw_projectjl` VALUES ('528', '1080', '1', '1', '1482224096', '1', '6', '148222409661', '0', '0', '', '40');

-- -----------------------------
-- Table structure for `qw_setting`
-- -----------------------------
DROP TABLE IF EXISTS `qw_setting`;
CREATE TABLE `qw_setting` (
  `k` varchar(100) NOT NULL COMMENT '变量',
  `v` varchar(255) NOT NULL COMMENT '值',
  `type` tinyint(1) NOT NULL COMMENT '0系统，1自定义',
  `name` varchar(255) NOT NULL COMMENT '说明',
  PRIMARY KEY (`k`),
  KEY `k` (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_setting`
-- -----------------------------
INSERT INTO `qw_setting` VALUES ('sitename', '智慧医管家', '0', '');
INSERT INTO `qw_setting` VALUES ('title', '智慧医管家', '0', '');
INSERT INTO `qw_setting` VALUES ('keywords', '智慧医管家', '0', '');
INSERT INTO `qw_setting` VALUES ('description', '网站描述', '0', '');
INSERT INTO `qw_setting` VALUES ('footer', '智慧医管家', '0', '');
INSERT INTO `qw_setting` VALUES ('test', '测试', '1', '测试变量');

-- -----------------------------
-- Table structure for `qw_shebei`
-- -----------------------------
DROP TABLE IF EXISTS `qw_shebei`;
CREATE TABLE `qw_shebei` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `projectid` int(100) NOT NULL,
  `erweima` varchar(200) NOT NULL,
  `area` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `orderid` int(100) NOT NULL,
  `bz` varchar(255) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `zt` int(1) NOT NULL DEFAULT '0' COMMENT '0=未巡查  、 1= 正常 、 2= 不正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_shebei`
-- -----------------------------
INSERT INTO `qw_shebei` VALUES ('1', '1', '0001', '2', '消防箱六回路0001', '1', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('2', '1', '0002', '5', '消防箱六回路0002', '2', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('3', '1', '0003', '5', '消防箱六回路0003', '3', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('4', '1', '0004', '0', '消防箱六回路0004', '4', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('5', '1', '0005', '0', '消防箱六回路0005', '5', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('6', '1', '0006', '0', '消防箱六回路0006', '6', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('7', '1', '0007', '0', '消防箱六回路0007', '7', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('8', '1', '0008', '0', '消防箱六回路0008', '8', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('9', '1', '0009', '0', '消防箱六回路0009', '9', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('10', '1', '0010', '0', '消防箱七回路0010', '10', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('11', '1', '0011', '0', '消防箱七回路0011', '11', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('12', '1', '0012', '0', '消防箱七回路0012', '12', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('13', '1', '0013', '0', '消防箱七回路0013', '13', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('14', '1', '0014', '0', '消防箱七回路0014', '14', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('15', '1', '0015', '0', '消防箱七回路0015', '15', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('16', '2', '0001', '0', '烟感六回路1-77、122', '16', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('17', '9', '0001', '0', '消防广播六回路0001', '17', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('18', '10', '0001', '0', '层显六回路0001', '18', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('19', '3', '0001', '0', '手报六回路0001', '20', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('20', '17', '0001', '0', '喷淋十二防火分区', '21', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('21', '18', '0001', '0', '末端试水0001', '22', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('103', '11', '0005', '0', '安全出口指示标示0005', '5', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('82', '1', '0269', '0', '消防箱0269', '37', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('24', '1', '0016', '0', '消防箱七回路0016', '16', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('25', '1', '0017', '0', '消防箱七回路0017', '17', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('26', '1', '0018', '0', '消防箱七回路0018', '18', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('27', '1', '0019', '0', '消防箱七回路0019', '19', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('28', '1', '0020', '0', '消防箱八回路0020', '20', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('29', '1', '0021', '0', '消防箱八回路0021', '21', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('30', '1', '0022', '0', '消防箱八回路0022', '22', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('31', '1', '0023', '0', '消防箱八回路0023', '23', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('32', '1', '0024', '0', '消防箱八回路0024', '24', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('33', '1', '0025', '0', '消防箱八回路0025', '25', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('34', '1', '0026', '0', '消防箱八回路0026', '26', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('35', '1', '0027', '0', '消防箱八回路0027', '27', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('36', '1', '0028', '0', '消防箱八回路0028', '28', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('37', '1', '0029', '0', '消防箱八回路0029', '29', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('38', '1', '0030', '0', '消防箱八回路0030', '30', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('39', '1', '0031', '0', '消防箱八回路0031', '31', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('40', '1', '0032', '0', '消防箱八回路0032', '32', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('41', '1', '0033', '0', '消防箱八回路0033', '33', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('42', '1', '0034', '0', '消防箱八回路0034', '34', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('43', '1', '0035', '0', '消防箱八回路0035', '35', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('44', '1', '0036', '0', '消防箱八回路0036', '36', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('45', '2', '0002', '0', '烟感七回路0002', '3', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('46', '9', '0002', '0', '消防广播七回路0002', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('47', '9', '0003', '0', '消防广播八回路0003', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('48', '10', '0002', '0', '层显七回路0002', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('49', '10', '0003', '0', '层显八回路0003', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('50', '3', '0002', '0', '手报六回路0002', '0', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('51', '3', '0003', '0', '手报六回路0003', '0', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('52', '3', '0004', '0', '手报六回路0004', '0', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('53', '3', '0005', '0', '手报六回路0005', '0', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('54', '3', '0006', '0', '手报六回路0006', '0', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('55', '3', '0007', '0', '手报七回路0007', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('56', '3', '0008', '0', '手报七回路0008', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('57', '3', '0009', '0', '手报七回路0009', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('58', '3', '0010', '0', '手报七回路0010', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('59', '3', '0011', '0', '手报七回路0011', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('60', '3', '0012', '0', '手报七回路0012', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('61', '3', '0013', '0', '手报八回路0013', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('62', '3', '0014', '0', '手报八回路0014', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('63', '3', '0015', '0', '手报八回路0015', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('64', '3', '0016', '0', '手报八回路0016', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('65', '3', '0017', '0', '手报八回路0017', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('66', '3', '0018', '0', '手报八回路0018', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('67', '3', '0019', '0', '手报八回路0019', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('68', '3', '0020', '0', '手报八回路0020', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('69', '3', '0021', '0', '手报八回路0021', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('70', '3', '0022', '0', '手报八回路0022', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('71', '17', '0002', '0', '喷淋七回路0002', '0', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('72', '17', '0003', '0', '喷淋八回路0003', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('73', '18', '0002', '0', '末端试水0002', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('74', '18', '0003', '0', '末端试水0003', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('75', '18', '0004', '0', '末端试水0004', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('76', '18', '0005', '0', '末端试水0005', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('77', '18', '0006', '0', '末端试水0006', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('78', '11', '0001', '0', '安全出口指示标示0001', '22', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('79', '11', '0002', '0', '安全出口指示标示0002', '23', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('80', '11', '0003', '0', '安全出口指示标示0003', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('81', '2', '0003', '0', '烟感八回路1-80、173', '0', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('83', '1', '0271', '0', '消防箱0271', '38', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('84', '1', '0272', '0', '消防箱0272', '39', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('85', '1', '0294', '0', '消防箱0294', '40', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('86', '1', '0300', '0', '消防箱0300', '41', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('87', '1', '0346', '0', '消防箱0346', '42', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('88', '1', '0347', '0', '消防箱0347', '43', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('89', '1', '0348', '0', '消防箱0348', '44', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('90', '3', '0101', '0', '手报八回路0101', '21', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('91', '3', '0102', '0', '手报八回路0102', '22', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('92', '3', '0103', '0', '手报八回路0103', '23', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('93', '3', '0104', '0', '手报八回路0104', '24', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('94', '3', '0105', '0', '手报八回路0105', '25', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('95', '3', '0110', '0', '手报八回路0110', '26', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('96', '9', '0120', '0', '消防广播六回路0120', '11', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('97', '9', '0135', '0', '消防广播七回路0135', '12', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('98', '9', '0165', '0', '消防广播八回路0165', '13', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('99', '10', '0121', '0', '层显六回路0121', '11', '六回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('100', '10', '0136', '0', '层显七回路0136', '12', '七回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('101', '10', '0110', '0', '层显八回路0110', '13', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('102', '11', '0004', '0', '安全出口指示标示0004', '11', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('104', '11', '0006', '0', '安全出口指示标示0006', '14', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('105', '11', '0007', '0', '安全出口指示标示0007', '16', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('106', '19', '0001', '0', '卷帘门0001', '11', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('107', '19', '0002', '0', '卷帘门0002', '12', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('108', '19', '0003', '0', '卷帘门0003', '13', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('109', '19', '0004', '0', '卷帘门0004', '14', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('110', '19', '0005', '0', '卷帘门0005', '15', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('111', '19', '0006', '0', '卷帘门0006', '16', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('112', '20', '0001', '0', '挡烟垂壁0001', '21', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('113', '20', '0002', '5', '挡烟垂壁0002', '22', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('117', '19', '0007', '0', '卷帘门0007', '17', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('116', '1', '0302', '0', '消防箱0302', '47', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('119', '22', '0002', '0', '机械排烟阀八回路0002', '2', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('118', '22', '0001', '0', '机械排烟阀八回路0001', '1', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('114', '21', '0001', '3', '消防通道0001', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('115', '21', '0003', '5', '消防通道0003', '0', '', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('120', '22', '0003', '0', '机械排烟阀八回路0003', '3', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('121', '22', '0004', '0', '机械排烟阀八回路0004', '4', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('122', '22', '0005', '0', '机械排烟阀八回路0005', '5', '八回路', '', '', '0');
INSERT INTO `qw_shebei` VALUES ('123', '22', '0006', '0', '机械排烟阀八回路0006', '6', '八回路', '', '', '0');

-- -----------------------------
-- Table structure for `qw_success`
-- -----------------------------
DROP TABLE IF EXISTS `qw_success`;
CREATE TABLE `qw_success` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '所关联的文章ID',
  `img1` varchar(255) NOT NULL COMMENT '维修前图片',
  `img2` varchar(255) NOT NULL COMMENT '维修后图片',
  `img3` varchar(255) NOT NULL COMMENT '部门验收单',
  `wuzi` varchar(255) NOT NULL COMMENT '摘要',
  `successn` text NOT NULL COMMENT '内容',
  `successt` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `qw_xgjihuas`
-- -----------------------------
DROP TABLE IF EXISTS `qw_xgjihuas`;
CREATE TABLE `qw_xgjihuas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jihuaming` varchar(255) NOT NULL,
  `xiaozu` int(11) NOT NULL DEFAULT '0' COMMENT '巡检小组id',
  `zhouqi` varchar(255) NOT NULL DEFAULT '' COMMENT '巡检周期id',
  `project` int(11) DEFAULT '1' COMMENT '项目id',
  `shebeiids` varchar(255) NOT NULL COMMENT '设备列表',
  `time` varchar(20) NOT NULL,
  `patrol` int(101) NOT NULL COMMENT '分类id',
  `cishu` int(10) NOT NULL DEFAULT '0',
  `zt` int(1) NOT NULL DEFAULT '0' COMMENT '最新状态',
  `zhixingid` int(20) NOT NULL COMMENT '对应计划执行表最新的id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_xgjihuas`
-- -----------------------------
INSERT INTO `qw_xgjihuas` VALUES ('10', '巡更A队上午巡更计划', '39', '43', '1', '', '1478587674', '1', '7', '1', '254');

-- -----------------------------
-- Table structure for `qw_xgjihuazhixing`
-- -----------------------------
DROP TABLE IF EXISTS `qw_xgjihuazhixing`;
CREATE TABLE `qw_xgjihuazhixing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jihuasid` int(10) DEFAULT NULL COMMENT '对应计划ID',
  `starttime` int(20) DEFAULT NULL COMMENT '执行时间',
  `stoptime` int(20) DEFAULT NULL COMMENT '计划结束时间',
  `success` int(1) DEFAULT NULL,
  `zt` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_xgjihuazhixing`
-- -----------------------------
INSERT INTO `qw_xgjihuazhixing` VALUES ('245', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('246', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('247', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('248', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('249', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('250', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('251', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('252', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('253', '10', '1478707200', '1478793599', '0', '2');
INSERT INTO `qw_xgjihuazhixing` VALUES ('254', '10', '1478707200', '1478793599', '0', '1');

-- -----------------------------
-- Table structure for `qw_xgproject`
-- -----------------------------
DROP TABLE IF EXISTS `qw_xgproject`;
CREATE TABLE `qw_xgproject` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderid` int(10) NOT NULL DEFAULT '0' COMMENT '排序呢',
  `name` varchar(200) NOT NULL COMMENT '巡检栏目名称',
  `erweima` varchar(200) NOT NULL DEFAULT '0' COMMENT '二维码',
  `tiaoma` varchar(200) NOT NULL COMMENT '条形码',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `img` varchar(255) DEFAULT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  `jingdu` varchar(50) DEFAULT NULL,
  `weidu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_xgproject`
-- -----------------------------
INSERT INTO `qw_xgproject` VALUES ('1', '1', '楼宇巡更', '001', '', '', '/Public/attached/201608/1470289397.jpg', '0', '', '');
INSERT INTO `qw_xgproject` VALUES ('19', '2', '大厦巡更2', '', '', '', '', '0', '', '');

-- -----------------------------
-- Table structure for `qw_xgshebei`
-- -----------------------------
DROP TABLE IF EXISTS `qw_xgshebei`;
CREATE TABLE `qw_xgshebei` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `projectid` int(100) NOT NULL,
  `erweima` varchar(200) NOT NULL,
  `area` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `orderid` int(100) NOT NULL,
  `bz` varchar(255) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `zt` int(1) NOT NULL DEFAULT '0' COMMENT '0=未巡查  、 1= 正常 、 2= 不正常',
  `jingdu` varchar(50) DEFAULT NULL,
  `weidu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_xgshebei`
-- -----------------------------
INSERT INTO `qw_xgshebei` VALUES ('1', '19', '001', '0', '1号巡更点', '1', '', '', '', '0', '', '');
INSERT INTO `qw_xgshebei` VALUES ('2', '1', '', '0', '2号巡更点', '2', '', '', '', '0', '120.383547', '36.145502');
INSERT INTO `qw_xgshebei` VALUES ('3', '1', '', '0', '3号巡更点', '3', '', '', '', '0', '120.383448', '36.145837');

-- -----------------------------
-- Table structure for `qw_xgzhixingshebei`
-- -----------------------------
DROP TABLE IF EXISTS `qw_xgzhixingshebei`;
CREATE TABLE `qw_xgzhixingshebei` (
  `sid` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zhixingid` int(20) NOT NULL COMMENT '对应执行表相应id',
  `jlid` int(20) NOT NULL,
  `shebeiid` int(20) NOT NULL COMMENT '对应设备id',
  `time` int(30) NOT NULL COMMENT '巡检完成时间',
  `success` int(1) NOT NULL COMMENT '巡检状态 0=未完成  1=完成',
  `zt` int(1) NOT NULL COMMENT '计划状态 1= 执行中  2=已执行',
  `type` int(1) NOT NULL DEFAULT '2' COMMENT ' 0 正常  1 不正常 2---还未巡检的显示表示',
  `user` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=758 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_xgzhixingshebei`
-- -----------------------------
INSERT INTO `qw_xgzhixingshebei` VALUES ('752', '252', '0', '2', '0', '0', '2', '2', '0');
INSERT INTO `qw_xgzhixingshebei` VALUES ('753', '252', '0', '3', '0', '0', '2', '2', '0');
INSERT INTO `qw_xgzhixingshebei` VALUES ('754', '253', '0', '2', '0', '0', '2', '2', '0');
INSERT INTO `qw_xgzhixingshebei` VALUES ('755', '253', '0', '3', '0', '0', '2', '2', '0');
INSERT INTO `qw_xgzhixingshebei` VALUES ('756', '254', '0', '2', '0', '1', '1', '2', '3');
INSERT INTO `qw_xgzhixingshebei` VALUES ('757', '254', '0', '3', '0', '0', '1', '2', '0');

-- -----------------------------
-- Table structure for `qw_xunjianzhouqi`
-- -----------------------------
DROP TABLE IF EXISTS `qw_xunjianzhouqi`;
CREATE TABLE `qw_xunjianzhouqi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `o` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_xunjianzhouqi`
-- -----------------------------
INSERT INTO `qw_xunjianzhouqi` VALUES ('44', '0', '周', '3');
INSERT INTO `qw_xunjianzhouqi` VALUES ('43', '0', '日', '2');
INSERT INTO `qw_xunjianzhouqi` VALUES ('45', '0', '月', '4');
INSERT INTO `qw_xunjianzhouqi` VALUES ('46', '0', '季', '5');
INSERT INTO `qw_xunjianzhouqi` VALUES ('48', '0', '年', '8');

-- -----------------------------
-- Table structure for `qw_zhixingshebei`
-- -----------------------------
DROP TABLE IF EXISTS `qw_zhixingshebei`;
CREATE TABLE `qw_zhixingshebei` (
  `sid` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zhixingid` int(20) NOT NULL COMMENT '对应执行表相应id',
  `jlid` int(20) NOT NULL,
  `shebeiid` int(20) NOT NULL COMMENT '对应设备id',
  `time` int(30) NOT NULL COMMENT '巡检完成时间',
  `success` int(1) NOT NULL COMMENT '巡检状态 0=未完成  1=完成',
  `zt` int(1) NOT NULL COMMENT '计划状态 1= 执行中  2=已执行',
  `type` int(1) NOT NULL DEFAULT '2' COMMENT ' 0 正常  1 不正常 2---还未巡检的显示表示',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `qw_zhixingshebei`
-- -----------------------------
INSERT INTO `qw_zhixingshebei` VALUES ('445', '146', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('446', '147', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('447', '147', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('448', '147', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('449', '147', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('450', '148', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('451', '148', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('452', '149', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('453', '149', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('454', '149', '0', '1', '1476435563', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('455', '150', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('456', '150', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('457', '150', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('458', '150', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('459', '151', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('460', '151', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('461', '151', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('462', '151', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('463', '152', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('426', '141', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('427', '141', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('428', '141', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('429', '142', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('430', '142', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('431', '142', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('432', '142', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('433', '143', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('434', '143', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('435', '143', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('436', '143', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('437', '144', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('438', '144', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('439', '145', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('440', '145', '0', '2', '1476415522', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('441', '145', '0', '1', '1475055787', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('442', '146', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('443', '146', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('444', '146', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('193', '68', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('194', '68', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('195', '68', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('196', '68', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('197', '69', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('198', '69', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('199', '69', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('200', '69', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('201', '70', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('202', '70', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('203', '70', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('204', '71', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('205', '71', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('206', '71', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('207', '71', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('208', '72', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('209', '72', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('210', '72', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('211', '72', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('212', '73', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('213', '73', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('214', '74', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('215', '74', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('216', '74', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('217', '75', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('218', '75', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('219', '75', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('220', '75', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('221', '76', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('222', '76', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('223', '76', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('224', '76', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('225', '77', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('226', '77', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('227', '78', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('228', '78', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('229', '78', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('230', '79', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('231', '79', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('232', '79', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('233', '79', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('234', '80', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('235', '80', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('236', '80', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('237', '80', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('238', '81', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('239', '81', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('240', '82', '0', '18', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('241', '82', '0', '22', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('242', '83', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('243', '84', '0', '1818', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('244', '85', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('245', '85', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('246', '85', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('247', '86', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('248', '86', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('249', '86', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('250', '86', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('251', '87', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('252', '87', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('253', '87', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('254', '87', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('255', '88', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('256', '88', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('257', '89', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('258', '89', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('259', '89', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('260', '90', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('261', '90', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('262', '90', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('263', '90', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('264', '91', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('265', '91', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('266', '91', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('267', '91', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('268', '92', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('269', '92', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('270', '93', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('271', '93', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('272', '93', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('273', '94', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('274', '94', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('275', '94', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('276', '94', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('277', '95', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('278', '95', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('279', '95', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('280', '95', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('281', '96', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('282', '96', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('283', '97', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('284', '97', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('285', '97', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('286', '98', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('287', '98', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('288', '98', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('289', '98', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('290', '99', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('291', '99', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('292', '99', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('293', '99', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('294', '100', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('295', '100', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('296', '101', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('297', '101', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('298', '101', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('299', '102', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('300', '102', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('301', '102', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('302', '102', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('303', '103', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('304', '103', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('305', '103', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('306', '103', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('307', '104', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('308', '104', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('309', '105', '199', '3', '0', '1', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('310', '105', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('311', '105', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('312', '106', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('313', '106', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('314', '106', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('315', '106', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('316', '107', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('317', '107', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('318', '107', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('319', '107', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('320', '108', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('321', '108', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('322', '109', '199', '3', '0', '1', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('323', '109', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('324', '109', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('325', '110', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('326', '110', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('327', '110', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('328', '110', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('329', '111', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('330', '111', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('331', '111', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('332', '111', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('333', '112', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('334', '112', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('335', '113', '119', '3', '0', '1', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('336', '113', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('337', '113', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('338', '114', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('339', '114', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('340', '114', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('341', '114', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('342', '115', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('343', '115', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('344', '115', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('345', '115', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('346', '116', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('347', '116', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('348', '117', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('349', '117', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('350', '117', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('351', '118', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('352', '118', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('353', '118', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('354', '118', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('355', '119', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('356', '119', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('357', '119', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('358', '119', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('359', '120', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('360', '120', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('361', '121', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('362', '121', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('363', '121', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('364', '122', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('365', '122', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('366', '122', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('367', '122', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('368', '123', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('369', '123', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('370', '123', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('371', '123', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('372', '124', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('373', '124', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('374', '125', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('375', '125', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('376', '125', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('377', '126', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('378', '126', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('379', '126', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('380', '126', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('381', '127', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('382', '127', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('383', '127', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('384', '127', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('385', '128', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('386', '128', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('387', '129', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('388', '129', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('389', '129', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('390', '130', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('391', '130', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('392', '130', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('393', '130', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('394', '131', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('395', '131', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('396', '131', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('397', '131', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('398', '132', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('399', '132', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('400', '133', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('401', '133', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('402', '133', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('403', '134', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('404', '134', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('405', '134', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('406', '134', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('407', '135', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('408', '135', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('409', '135', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('410', '135', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('411', '136', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('412', '136', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('413', '137', '0', '3', '0', '1', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('414', '137', '0', '2', '0', '1', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('415', '137', '0', '1', '1475055787', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('416', '138', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('417', '138', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('418', '138', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('419', '138', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('420', '139', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('421', '139', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('422', '139', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('423', '139', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('424', '140', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('425', '140', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('464', '152', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('465', '153', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('466', '153', '0', '2', '1476502834', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('467', '153', '0', '1', '1476496243', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('468', '154', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('469', '154', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('470', '154', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('471', '154', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('472', '155', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('473', '155', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('474', '155', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('475', '155', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('476', '156', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('477', '156', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('478', '157', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('479', '157', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('480', '157', '0', '1', '1476516998', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('481', '158', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('482', '158', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('483', '158', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('484', '158', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('485', '159', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('486', '159', '0', '3', '1476516998', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('487', '159', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('488', '159', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('489', '160', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('490', '160', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('491', '161', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('492', '161', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('493', '161', '0', '1', '1476676335', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('494', '162', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('495', '162', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('496', '162', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('497', '162', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('498', '163', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('499', '163', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('500', '163', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('501', '163', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('502', '164', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('503', '164', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('504', '165', '0', '3', '1476695539', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('505', '165', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('506', '165', '0', '1', '1476700109', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('507', '166', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('508', '166', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('509', '166', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('510', '166', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('511', '167', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('512', '167', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('513', '167', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('514', '167', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('515', '168', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('516', '168', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('517', '169', '0', '3', '1476758508', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('518', '169', '0', '2', '1476757725', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('519', '169', '0', '1', '1476757481', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('520', '170', '0', '3', '1476758963', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('521', '170', '0', '2', '1476759130', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('522', '170', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('523', '170', '0', '1', '1476759406', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('524', '171', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('525', '171', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('526', '171', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('527', '171', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('528', '172', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('529', '172', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('530', '173', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('531', '173', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('532', '173', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('533', '174', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('534', '174', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('535', '174', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('536', '174', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('537', '175', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('538', '175', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('539', '175', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('540', '175', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('541', '176', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('542', '176', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('543', '177', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('544', '177', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('545', '177', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('546', '178', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('547', '178', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('548', '178', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('549', '178', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('550', '179', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('551', '179', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('552', '179', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('553', '179', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('554', '180', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('555', '180', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('556', '181', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('557', '181', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('558', '181', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('559', '182', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('560', '182', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('561', '182', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('562', '182', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('563', '183', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('564', '183', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('565', '183', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('566', '183', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('567', '184', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('568', '184', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('569', '185', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('570', '185', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('571', '185', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('572', '186', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('573', '186', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('574', '186', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('575', '186', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('576', '187', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('577', '187', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('578', '187', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('579', '187', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('580', '188', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('581', '188', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('582', '189', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('583', '189', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('584', '189', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('585', '190', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('586', '190', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('587', '190', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('588', '190', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('589', '191', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('590', '191', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('591', '191', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('592', '191', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('593', '192', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('594', '192', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('595', '193', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('596', '193', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('597', '193', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('598', '194', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('599', '194', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('600', '194', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('601', '194', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('602', '195', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('603', '195', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('604', '195', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('605', '195', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('606', '196', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('607', '196', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('608', '197', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('609', '197', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('610', '197', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('611', '198', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('612', '198', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('613', '198', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('614', '198', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('615', '199', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('616', '199', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('617', '199', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('618', '199', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('619', '200', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('620', '200', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('621', '201', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('622', '201', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('623', '201', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('624', '202', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('625', '202', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('626', '202', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('627', '202', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('628', '203', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('629', '203', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('630', '203', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('631', '203', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('632', '204', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('633', '204', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('634', '205', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('635', '205', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('636', '205', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('637', '206', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('638', '206', '0', '2', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('639', '206', '0', '5', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('640', '206', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('641', '207', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('642', '207', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('643', '207', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('644', '207', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('645', '208', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('646', '208', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('647', '209', '0', '3', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('648', '209', '0', '2', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('649', '209', '0', '1', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('650', '210', '0', '3', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('651', '210', '0', '2', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('652', '210', '0', '5', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('653', '210', '0', '1', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('654', '211', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('655', '211', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('656', '211', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('657', '211', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('658', '212', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('659', '212', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('660', '213', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('661', '213', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('662', '213', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('663', '213', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('664', '214', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('665', '214', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('666', '215', '0', '1', '1477637936', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('667', '215', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('668', '215', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('669', '215', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('670', '216', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('671', '216', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('672', '217', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('673', '217', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('674', '217', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('675', '217', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('676', '218', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('677', '218', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('678', '219', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('679', '219', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('680', '219', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('681', '219', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('682', '220', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('683', '220', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('684', '221', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('685', '221', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('686', '221', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('687', '221', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('688', '222', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('689', '222', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('690', '223', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('691', '224', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('692', '224', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('693', '224', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('694', '224', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('695', '225', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('696', '225', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('697', '226', '0', '3', '1478677047', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('698', '227', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('699', '227', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('700', '227', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('701', '227', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('702', '228', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('703', '228', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('704', '229', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('705', '229', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('706', '229', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('707', '229', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('708', '230', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('709', '230', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('710', '231', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('711', '231', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('712', '231', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('713', '231', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('714', '232', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('715', '232', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('716', '233', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('717', '233', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('718', '233', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('719', '233', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('720', '234', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('721', '234', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('722', '235', '0', '1', '1478138748', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('723', '235', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('724', '235', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('725', '235', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('726', '236', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('727', '236', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('728', '237', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('729', '237', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('730', '237', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('731', '237', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('732', '238', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('733', '238', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('734', '239', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('735', '239', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('736', '239', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('737', '239', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('738', '240', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('739', '240', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('740', '241', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('741', '241', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('742', '241', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('743', '241', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('744', '242', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('745', '242', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('746', '243', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('747', '243', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('748', '243', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('749', '243', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('750', '244', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('751', '244', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('752', '245', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('753', '245', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('754', '245', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('755', '245', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('756', '246', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('757', '246', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('758', '247', '0', '1', '1478570624', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('759', '247', '0', '3', '1478571042', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('760', '247', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('761', '247', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('762', '248', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('763', '248', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('764', '249', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('765', '249', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('766', '249', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('767', '249', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('768', '250', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('769', '250', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('770', '251', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('771', '251', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('772', '251', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('773', '251', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('774', '252', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('775', '252', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('776', '248', '0', '0', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('777', '249', '0', '0', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('778', '249', '0', '0', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('779', '250', '0', '0', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('780', '250', '0', '0', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('781', '251', '0', '0', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('782', '251', '0', '0', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('783', '253', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('784', '253', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('785', '253', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('786', '253', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('787', '254', '0', '1', '1478677166', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('788', '254', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('789', '255', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('790', '255', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('791', '255', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('792', '255', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('793', '256', '0', '1', '1478743225', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('794', '256', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('795', '257', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('796', '257', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('797', '257', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('798', '257', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('799', '258', '0', '1', '1478767251', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('800', '258', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('801', '259', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('802', '259', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('803', '259', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('804', '259', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('805', '260', '0', '1', '1478828722', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('806', '260', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('807', '261', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('808', '261', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('809', '261', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('810', '261', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('811', '262', '0', '1', '1479041247', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('812', '262', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('813', '263', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('814', '263', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('815', '263', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('816', '263', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('817', '264', '0', '1', '1479093083', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('818', '264', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('819', '265', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('820', '265', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('821', '265', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('822', '265', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('823', '266', '0', '1', '1479109463', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('824', '266', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('825', '267', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('826', '267', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('827', '267', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('828', '267', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('829', '268', '0', '1', '1479190025', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('830', '268', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('831', '269', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('832', '269', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('833', '269', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('834', '269', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('835', '270', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('836', '270', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('837', '271', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('838', '271', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('839', '271', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('840', '271', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('841', '272', '0', '1', '1479274706', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('842', '272', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('843', '273', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('844', '273', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('845', '273', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('846', '273', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('847', '274', '0', '1', '1479287356', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('848', '274', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('849', '275', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('850', '275', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('851', '275', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('852', '275', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('853', '276', '0', '1', '1479431116', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('854', '276', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('855', '277', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('856', '277', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('857', '277', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('858', '277', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('859', '278', '0', '1', '1479438752', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('860', '278', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('861', '279', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('862', '279', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('863', '279', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('864', '279', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('865', '280', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('866', '280', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('867', '281', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('868', '281', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('869', '281', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('870', '281', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('871', '282', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('872', '282', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('873', '283', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('874', '283', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('875', '283', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('876', '283', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('877', '284', '0', '1', '1479799447', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('878', '284', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('879', '285', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('880', '285', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('881', '285', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('882', '285', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('883', '286', '0', '1', '1479804842', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('884', '286', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('885', '287', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('886', '287', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('887', '287', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('888', '287', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('889', '288', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('890', '288', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('891', '289', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('892', '289', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('893', '289', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('894', '289', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('895', '290', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('896', '290', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('897', '291', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('898', '291', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('899', '291', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('900', '291', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('901', '292', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('902', '292', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('903', '293', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('904', '293', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('905', '293', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('906', '293', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('907', '294', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('908', '294', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('909', '295', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('910', '295', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('911', '295', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('912', '295', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('913', '296', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('914', '296', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('915', '297', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('916', '297', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('917', '297', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('918', '297', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('919', '298', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('920', '298', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('921', '299', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('922', '299', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('923', '299', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('924', '299', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('925', '300', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('926', '300', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('927', '301', '0', '1', '1480484535', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('928', '301', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('929', '301', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('930', '301', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('931', '302', '0', '1', '1480473555', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('932', '302', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('933', '303', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('934', '304', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('935', '304', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('936', '304', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('937', '304', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('938', '305', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('939', '305', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('940', '306', '0', '3', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('941', '307', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('942', '307', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('943', '307', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('944', '307', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('945', '308', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('946', '308', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('947', '309', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('948', '309', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('949', '309', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('950', '309', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('951', '310', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('952', '310', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('953', '311', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('954', '311', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('955', '311', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('956', '311', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('957', '312', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('958', '312', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('959', '313', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('960', '313', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('961', '313', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('962', '313', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('963', '314', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('964', '314', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('965', '315', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('966', '315', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('967', '315', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('968', '315', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('969', '316', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('970', '316', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('971', '317', '0', '1', '1481612683', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('972', '318', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('973', '318', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('974', '318', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('975', '318', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('976', '319', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('977', '319', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('978', '320', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('979', '320', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('980', '320', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('981', '320', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('982', '321', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('983', '321', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('984', '322', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('985', '322', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('986', '322', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('987', '322', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('988', '323', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('989', '323', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('990', '324', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('991', '324', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('992', '324', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('993', '324', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('994', '325', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('995', '325', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('996', '326', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('997', '326', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('998', '326', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('999', '326', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1000', '327', '0', '1', '1481093883', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('1001', '327', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1002', '328', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1003', '328', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1004', '328', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1005', '328', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1006', '329', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1007', '329', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1008', '330', '0', '1', '1481182216', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('1009', '330', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1010', '330', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1011', '330', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1012', '331', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1013', '331', '0', '18', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1014', '332', '0', '1', '1481267199', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1015', '332', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1016', '332', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1017', '332', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1018', '333', '0', '1', '1481254522', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1019', '333', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1020', '334', '0', '1', '1481275845', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1021', '334', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1022', '334', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1023', '334', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1024', '335', '0', '1', '1481521131', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1025', '335', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1026', '336', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1027', '336', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1028', '336', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1029', '336', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1030', '337', '0', '1', '1481595449', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1031', '337', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1032', '338', '0', '1', '1481617188', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1033', '338', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1034', '338', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1035', '338', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1036', '339', '0', '1', '0', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1037', '339', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1038', '340', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1039', '340', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1040', '340', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1041', '340', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1042', '341', '0', '1', '1481618646', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('1043', '341', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1044', '342', '0', '1', '1481773553', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1045', '342', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1046', '342', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1047', '342', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1048', '343', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1049', '343', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1050', '344', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1051', '344', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1052', '344', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1053', '344', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1054', '345', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1055', '345', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1056', '346', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1057', '346', '0', '3', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1058', '346', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1059', '346', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1060', '347', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1061', '347', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1062', '348', '0', '1', '1482038895', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('1063', '348', '0', '3', '1482037772', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('1064', '348', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1065', '348', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1066', '349', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1067', '349', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1068', '350', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1069', '351', '0', '1', '1482046610', '1', '2', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('1070', '351', '0', '3', '1482047482', '1', '2', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1071', '351', '0', '6', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1072', '351', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1073', '352', '0', '1', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1074', '352', '0', '8', '0', '0', '2', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1075', '353', '0', '1', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1076', '354', '0', '1', '1482222812', '1', '1', '1');
INSERT INTO `qw_zhixingshebei` VALUES ('1077', '354', '0', '3', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1078', '354', '0', '6', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1079', '354', '0', '8', '0', '0', '1', '2');
INSERT INTO `qw_zhixingshebei` VALUES ('1080', '355', '0', '1', '1482224096', '1', '1', '0');
INSERT INTO `qw_zhixingshebei` VALUES ('1081', '355', '0', '8', '0', '0', '1', '2');
