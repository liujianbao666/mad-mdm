/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : bank

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-04-09 18:51:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `supplier_id` int(32) DEFAULT NULL COMMENT '供应商编码',
  `receive_id` int(32) DEFAULT NULL COMMENT '接收方',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `pk_company_supplier` (`supplier_id`) USING BTREE,
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='公司';

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '001', '街景店车', '3', null);
INSERT INTO `company` VALUES ('2', 'wf0001', '万方', '3', null);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `department_type` varchar(4) DEFAULT NULL COMMENT '类型见数据字典',
  `cost_centerid` int(32) DEFAULT NULL COMMENT '成本中心',
  `parent_id` int(4) DEFAULT NULL COMMENT '上级机构',
  `order_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '山东街景智能制造科技股份有限公司', null, null, null, null);
INSERT INTO `department` VALUES ('112127636', '数据中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112130544', '生产制造中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112187561', '组织中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112200555', '财务部', null, null, '112282603', null);
INSERT INTO `department` VALUES ('112210865', '品质管理部', null, null, '61411241', null);
INSERT INTO `department` VALUES ('112229662', '产品事业二部', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112239599', '开发三部', null, null, '112127636', null);
INSERT INTO `department` VALUES ('112239620', '自动化部', null, null, '112301587', null);
INSERT INTO `department` VALUES ('112250533', '新技术工艺部', null, null, '112301587', null);
INSERT INTO `department` VALUES ('112275568', '国内营销中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112282603', '财务中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112301587', '制造技术与自动化中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112380635', '产品事业三部', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112391650', '国际业务部', null, null, '81078106', null);
INSERT INTO `department` VALUES ('112394552', '产品事业一部', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112401525', '产品开发事业部', null, null, '112239620', null);
INSERT INTO `department` VALUES ('112412562', '系统软件开发部', null, null, '112127636', null);
INSERT INTO `department` VALUES ('112414672', '产品工艺部', null, null, '112130544', null);
INSERT INTO `department` VALUES ('112519206', '研发项目中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('112528229', '稽查部', null, null, '72255094', null);
INSERT INTO `department` VALUES ('113089163', '订单事业部', null, null, '61665018', null);
INSERT INTO `department` VALUES ('113568253', '个人销售组', null, null, '306414847', null);
INSERT INTO `department` VALUES ('113593239', '品牌策划部', null, null, '80999121', null);
INSERT INTO `department` VALUES ('113662254', '华中、华南', null, null, '81065083', null);
INSERT INTO `department` VALUES ('113776260', '西南、西北', null, null, '81065083', null);
INSERT INTO `department` VALUES ('113819305', '推广运营部', null, null, '80858087', null);
INSERT INTO `department` VALUES ('113842282', '华东', null, null, '81065083', null);
INSERT INTO `department` VALUES ('126396454', '代理商组', null, null, '81065083', null);
INSERT INTO `department` VALUES ('137489953', '涂装设计部', null, null, '112275568', null);
INSERT INTO `department` VALUES ('137489969', '后勤服务部', null, null, '112187561', null);
INSERT INTO `department` VALUES ('137570490', '设备部', null, null, '112130544', null);
INSERT INTO `department` VALUES ('137584488', '薪酬绩效部', null, null, '112187561', null);
INSERT INTO `department` VALUES ('137592399', '售后服务部', null, null, '112275568', null);
INSERT INTO `department` VALUES ('137592412', '学习发展部', null, null, '112187561', null);
INSERT INTO `department` VALUES ('137653409', '成品仓库', null, null, '137654344', null);
INSERT INTO `department` VALUES ('137654344', 'PMC管理中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('137656367', '物流组', null, null, '137654344', null);
INSERT INTO `department` VALUES ('137657317', '规划部', null, null, '112275568', null);
INSERT INTO `department` VALUES ('137664437', '供应链管理中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('137670297', '实施运维部', null, null, '112127636', null);
INSERT INTO `department` VALUES ('137679295', '原料仓库', null, null, '137654344', null);
INSERT INTO `department` VALUES ('137713237', '安环部', null, null, '112130544', null);
INSERT INTO `department` VALUES ('137718222', '组织配置部', null, null, '112187561', null);
INSERT INTO `department` VALUES ('137732151', '开发二部', null, null, '112127636', null);
INSERT INTO `department` VALUES ('137735115', '开发一部', null, null, '112127636', null);
INSERT INTO `department` VALUES ('137909937', '内务部', null, null, '81078106', null);
INSERT INTO `department` VALUES ('139682383', '订单一组', null, null, '113089163', null);
INSERT INTO `department` VALUES ('139768032', '订单二组', null, null, '113089163', null);
INSERT INTO `department` VALUES ('141302689', '数据中心测试ERP', null, null, '112127636', null);
INSERT INTO `department` VALUES ('168302963', '亮化事业部', null, null, '61665018', null);
INSERT INTO `department` VALUES ('272036513', '法务部', null, null, '112282603', null);
INSERT INTO `department` VALUES ('306414847', '东北、华北', null, null, '81065083', null);
INSERT INTO `department` VALUES ('61206448', '总经办', null, null, '61665018', null);
INSERT INTO `department` VALUES ('61411241', '质量管理中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('61632024', '艾加事业部', null, null, '1', null);
INSERT INTO `department` VALUES ('61665018', '街景事业部', null, null, '1', null);
INSERT INTO `department` VALUES ('61695169', '注塑', null, null, '61632024', null);
INSERT INTO `department` VALUES ('61695170', '包装', null, null, '61632024', null);
INSERT INTO `department` VALUES ('61695171', '销售', null, null, '61632024', null);
INSERT INTO `department` VALUES ('61695172', '成品库', null, null, '61632024', null);
INSERT INTO `department` VALUES ('62196952', '生产部', null, null, '112130544', null);
INSERT INTO `department` VALUES ('63119135', '弘业金驰', null, null, '1', null);
INSERT INTO `department` VALUES ('72013420', '焊接1班', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72013421', '底盘', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72013422', '总装2', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72013423', '入库检', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72013424', '焊接2班', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72013425', '彩绘车间', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72103384', '返修班组', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72143347', '总装3', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('72255094', '稽查审计中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('72467309', '包板1', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('74438232', '朗欧项目组', null, null, '72255094', null);
INSERT INTO `department` VALUES ('80858087', '市场推广部', null, null, '112275568', null);
INSERT INTO `department` VALUES ('80999121', '品牌设计部', null, null, '112275568', null);
INSERT INTO `department` VALUES ('81065083', '国内业务部', null, null, '112275568', null);
INSERT INTO `department` VALUES ('81078106', '国际营销中心', null, null, '61665018', null);
INSERT INTO `department` VALUES ('82586692', '总装1', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('85031050', '包板2', '4', null, '62196952', null);
INSERT INTO `department` VALUES ('85153050', '内勤支持组', null, null, '81065083', null);
INSERT INTO `department` VALUES ('90010345', '客户服务部', null, null, '80858087', null);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `user_id` varchar(32) NOT NULL,
  `staff_number` varchar(32) DEFAULT NULL COMMENT '工号',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `department_id` varchar(255) DEFAULT NULL COMMENT '部门编号',
  `job_id` varchar(64) DEFAULT NULL COMMENT '岗位编码',
  `status` varchar(1) DEFAULT '0' COMMENT '0,在职；1，离职；',
  `hiredDate` varchar(16) DEFAULT NULL COMMENT '入职日期',
  `leaderDepts` varchar(32) DEFAULT NULL COMMENT '主管部门',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('010109404120442003', '01-0172', '侯晓林', '61206448', '总经理司机', '0', null, null);
INSERT INTO `employee` VALUES ('0102442407844930', '01-0643', '李成', '137670297, 112127636', '数据中心总监', '0', null, null);
INSERT INTO `employee` VALUES ('010741640138895320', '01-0554', '魏勇田', '137657317', '副总监', '0', null, null);
INSERT INTO `employee` VALUES ('011058250421101444', '01-0332', '刘洪靖', '137679295', '仓库管理员', '0', null, null);
INSERT INTO `employee` VALUES ('011551054437623991', '01-0214', '陈京涛', '112200555', '会计', '0', null, null);
INSERT INTO `employee` VALUES ('011853622528293789', '01-0489', '潘清溪', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('015754661526457657', '01-0739', '梁学增', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('0169213131785834', '01-0607', '张磊', '113568253', '个人业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('016967476821596212', '01-0149', '周明刚', '113819305', '电商运营副经理', '0', null, null);
INSERT INTO `employee` VALUES ('016967644324154090', '01-0342', '张学杰', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('020067380421042954', '01-0074', '刘文龙', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('021050495619965262', '01-0341', '丁建升', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('022029082836393998', '01-0040', '郑召彦', '112414672', '技术工程师', '0', null, null);
INSERT INTO `employee` VALUES ('022143593036022043', '01-0027', '赵静伟', '137656367', '物流部副经理', '0', null, null);
INSERT INTO `employee` VALUES ('022457475323365123', '01-0634', '孙海宁', '137654344', '物控专员', '0', null, null);
INSERT INTO `employee` VALUES ('0231644913941018', '01-0505', '王帅', '137909937', '网络推广', '0', null, null);
INSERT INTO `employee` VALUES ('026565633026761918', null, '樊兆玺', '72013425', null, '0', null, null);
INSERT INTO `employee` VALUES ('0300645952761680', '01-0019', '孙辉', '137592399, 112275568', '国内营销中心总监', '0', null, null);
INSERT INTO `employee` VALUES ('030326692221343541', '01-0189', '卢文建', '112210865', '质检专员', '0', null, null);
INSERT INTO `employee` VALUES ('030834206626236975', '01-0064', '杨志达', '112229662', '方案设计师', '0', null, null);
INSERT INTO `employee` VALUES ('0321141726260825', '01-0520', '李晓蕾', '113593239', '策划', '0', null, null);
INSERT INTO `employee` VALUES ('032121423820996435', null, '冯清泉', '82586692', '', '0', null, null);
INSERT INTO `employee` VALUES ('032341225120973563', '01-0652', '刘建宝', '137732151', '软件开发工程师', '0', null, null);
INSERT INTO `employee` VALUES ('0330112924399279', '01-0166', '张立基', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('035948410124429474', '01-0689', '张纹君', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('036362176921427321', '01-0067', '刘顺军', '137664437', '供应链管理中心副总监', '0', null, null);
INSERT INTO `employee` VALUES ('040053612833296256', '01-0632', '范英明', '112394552', '高级工业设计师', '0', null, null);
INSERT INTO `employee` VALUES ('041144586319996746', '01-0752', '于佳鹏', '137679295', '仓库管理员', '0', null, null);
INSERT INTO `employee` VALUES ('041627354828244756', null, '潘江涛', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('042046012621028616', '01-0068', '刘文林', '112301587', '制造技术与自动化中心总监', '0', null, null);
INSERT INTO `employee` VALUES ('04233768858571', null, '李静', '63119135', '', '0', null, null);
INSERT INTO `employee` VALUES ('043648212828330040', '01-0674', '潘玉光', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('0439393915778981', null, '张帅', '168302963', '亮化事业部副总监', '0', null, null);
INSERT INTO `employee` VALUES ('044947525724180521', '01－0763', '徐军委', '112210865', '', '0', null, null);
INSERT INTO `employee` VALUES ('045218531724811317', null, '房中元', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('046237035226277838', '01-0714', '李楠楠', '113568253', '个人业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('046244650523973586', '01-0626', '庞发祥', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('050525576837695275', null, '闫振敏', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('052260595626365673', '01-0680', '曾繁斌', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('053956185826241858', '01-0001', '李文君', '112380635, 112394552, 61665018, 113089163, 112229662', '公司总经理', '0', null, null);
INSERT INTO `employee` VALUES ('054510526221421463', '01-0159', '刘长霞', '137664437', '采购专员', '0', null, null);
INSERT INTO `employee` VALUES ('055304046826150920', null, '李姝婷', '112229662', '', '0', null, null);
INSERT INTO `employee` VALUES ('060139693038269828', '01-0705', '韩淑斌', '137657317', '高级景观规划师', '0', null, null);
INSERT INTO `employee` VALUES ('063352300520153268', '01-0456', '于政帅', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('064234416437802898', '01-0062', '陈新建', '137679295', '仓库管理员', '0', null, null);
INSERT INTO `employee` VALUES ('0719250355937861', '01-0596', '王冰', '61411241', '质量管理中心副总监', '0', null, null);
INSERT INTO `employee` VALUES ('073257192520086238', '01-0021', '任伟波', '112394552', '产品事业一部副总经理', '0', null, null);
INSERT INTO `employee` VALUES ('073916413826058674', '01-0002', '李世强', '112282603', '公司副总经理', '0', null, null);
INSERT INTO `employee` VALUES ('0739165419998442', '', '窦成', '61632024', '', '0', null, null);
INSERT INTO `employee` VALUES ('073918216229615719', '01-0049', '田德明', '113662254', '（线上机构一组） 业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('0739182163953839', '01-0061', '王通', '306414847', '国内业务部副总监', '0', null, null);
INSERT INTO `employee` VALUES ('0739182165947871', '01-0069', '王磊', '113776260', '国内业务部副经理', '0', null, null);
INSERT INTO `employee` VALUES ('0739192628650910', '01-0077', '何卓', '113819305', '竞价推广经理', '0', null, null);
INSERT INTO `employee` VALUES ('07392159661150029', '01-0078', '赵欢', '90010345', '线上客服', '0', null, null);
INSERT INTO `employee` VALUES ('073927160340215909', '01-0098', '麻玉珍', '113568253', '个人业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('074842014529080540', '01-0014', '王保华', '137653409', '成品仓主管', '0', null, null);
INSERT INTO `employee` VALUES ('0763144203788026', '01-0011', '徐珊', '137489953, 80999121', '品牌设计部总监', '0', null, null);
INSERT INTO `employee` VALUES ('081648646533001381', '01-0629', '臧继超', '113568253', '个人业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('081962045829716685', null, '田永法', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('082623666020389065', '01-0089', '于芳明', '112210865', '质检专员', '0', null, null);
INSERT INTO `employee` VALUES ('0833325367658578', '01-0148', '付聪', '61206448', '总经办经理', '0', null, null);
INSERT INTO `employee` VALUES ('083430641224242632', '01-0071', '康玉强', '112391650', '外贸专员', '0', null, null);
INSERT INTO `employee` VALUES ('090622683926172840', '01-0120', '曹晓波', '139682383', '一组组长', '0', null, null);
INSERT INTO `employee` VALUES ('0913644055784659', '01-0748', '张琳', '112414672', null, '0', null, null);
INSERT INTO `employee` VALUES ('092434171320242675', '01-0117', '于潍莒', '72013423', '入库检', '0', null, null);
INSERT INTO `employee` VALUES ('092820486629723329', null, '申洪常', '137657317', '', '0', null, null);
INSERT INTO `employee` VALUES ('092828401926211420', '01-0441', '李志超', '112519206', '数据员', '0', null, null);
INSERT INTO `employee` VALUES ('095103531926196209', '01-0753', '李志刚', '112210865', '', '0', null, null);
INSERT INTO `employee` VALUES ('0958145936940380', '01-0563', '王宇', '112210865', '质检专员', '0', null, null);
INSERT INTO `employee` VALUES ('101140096026419500', '01-0410', '李秀霞', '137654344', '中心经理', '0', null, null);
INSERT INTO `employee` VALUES ('102107006725680876', '01-0765', '方俊国', '82586692', '', '0', null, null);
INSERT INTO `employee` VALUES ('102153675426309139', '01-0541', '李洪港', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('1044065256652434', '01-0020', '丁艳', '112200555', '财务中心经理', '0', null, null);
INSERT INTO `employee` VALUES ('110163304320923460', '01-0640', '刘国辉', '137735115', '软件开发工程师', '0', null, null);
INSERT INTO `employee` VALUES ('111926236524235215', '01-0431', '张敬涛', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('112044046521223728', '01-0104', '刘继伟', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('113834276227543417', '01-0649', '毕立鹏', '139768032', '布局设计师', '0', null, null);
INSERT INTO `employee` VALUES ('115053662926129323', null, '李国强', '63119135', '', '0', null, null);
INSERT INTO `employee` VALUES ('115559303026106902', '01－0803', '杨信良', '72013420', '', '0', null, null);
INSERT INTO `employee` VALUES ('123226246723407868', '01-0287', '宋永浩', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('124550251024252212', '0812', '张春香', '72143347', '', '0', null, null);
INSERT INTO `employee` VALUES ('124712223929309347', '01-0331', '王永成', '137657317', '场景设计助理', '0', null, null);
INSERT INTO `employee` VALUES ('124800153435672955', null, '赵正义', '72143347', '', '0', null, null);
INSERT INTO `employee` VALUES ('125635485926088868', null, '李凤强', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('1263186310854437', '01-0496', '杨萍', '113593239', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('12644012281035765', '01-0147', '罗扬', '113819305', 'SEO推广', '0', null, null);
INSERT INTO `employee` VALUES ('131127205237756350', '01-0662', '陈德才', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('1326530113691442', '01-0100', '卞璐', '137489969', '招聘主管', '0', null, null);
INSERT INTO `employee` VALUES ('133262546026663304', '01-0091', '李香琳', '137592399', '售后专员', '0', null, null);
INSERT INTO `employee` VALUES ('134303661826157715', '01-0387', '权少威', '112130544', '生产制造中心总监', '0', null, null);
INSERT INTO `employee` VALUES ('135650665821235631', '01-0754', '刘耀宗', '112519206', 'HRBP', '0', null, null);
INSERT INTO `employee` VALUES ('136619491837710709', '01-0619', '陶华萍', '112229662', '', '0', null, null);
INSERT INTO `employee` VALUES ('140860406123521103', '01-0637', '尹晓光', '112229662', '产品事业二部副总经理', '0', null, null);
INSERT INTO `employee` VALUES ('141034000726192418', null, '杜崇旭', '61695172', '', '0', null, null);
INSERT INTO `employee` VALUES ('141221240129139827', '01-0052', '王国帅', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('1425092803945114', '01-0065', '王清', '85153050', '国内业务部内勤经理', '0', null, null);
INSERT INTO `employee` VALUES ('150328542424093953', '01-0622', '庄敬轩', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('150955655723163465', '01-0313', '宋丽君', '306414847', '（个人业务组） 组长', '0', null, null);
INSERT INTO `employee` VALUES ('152322303524285886', '01-0259', '徐延坤', '137654344', '生产计划', '0', null, null);
INSERT INTO `employee` VALUES ('1528480009693747', '01-0664', '吕杨', '112187561', '公司副总经理', '0', null, null);
INSERT INTO `employee` VALUES ('154146420036727940', '01-0111', '郭艳雪', '112519206, 113089163', '研发项目中心副经理', '0', null, null);
INSERT INTO `employee` VALUES ('154146440723305169', '01-0125', '孙明圆', '112519206', '标准化工程师', '0', null, null);
INSERT INTO `employee` VALUES ('161701514224055572', '01-0330', '张俊乾', '137654344', 'PMC管理中心总监', '0', null, null);
INSERT INTO `employee` VALUES ('162316091826195725', '01-0630', '李忠伟', '113593239', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('1649010421026522', '01-0672', '刘文彩', '112187561', '组织中心经理', '0', null, null);
INSERT INTO `employee` VALUES ('165251034230958441', '01-0101', '窦志强', '137489953', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('166106104723003472', '01-0291', '姜海洋', '72103384', '返修', '0', null, null);
INSERT INTO `employee` VALUES ('166122063132498652', '01-0084', '胡廷青', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('166544305324110249', null, '庞景业', '72143347', '', '0', null, null);
INSERT INTO `employee` VALUES ('170125546423171520', '01-0343', '宋以强', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('170203111529117157', null, '王友梅', '72013423', null, '0', null, null);
INSERT INTO `employee` VALUES ('1703013965942990', '01-0617', '王方', '113568253', '个人业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('17033435061056014', '01-0421', '聂锐', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('170403393326873942', '0777', '梁迎娣', '72143347', '', '0', null, null);
INSERT INTO `employee` VALUES ('170511505921502420', '01-0759', '吴志林', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('170547116320937464', '01-0042', '刘婷婷', '112200555', '会计', '0', null, null);
INSERT INTO `employee` VALUES ('170652371220212462', '01-0238', '于津健', '72103384', '返修', '0', null, null);
INSERT INTO `employee` VALUES ('170949555029280974', null, '王桂清', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('171004653221614172', null, '唐发国', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('171033251629366485', '01-0041', '王玉平', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('171417384537999554', '01-0081', '陈维修', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('171505395526414957', '01-0231', '栾小飞', '137489953', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('171550296029069389', '01-0026', '王丽娟', '112528229', '稽查审计中心总监', '0', null, null);
INSERT INTO `employee` VALUES ('171843164226276015', '01-0760', '杨晓强', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('172211505526414359', null, '朱维亚', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('172658465923507024', null, '孙红熙', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('172731580538876828', '01-0102', '马洪会', '137664437', '采购主管', '0', null, null);
INSERT INTO `employee` VALUES ('172750211024568938', null, '张述强', '85031050', null, '0', null, null);
INSERT INTO `employee` VALUES ('173168185124239017', '01-0737', '张春明', '85031050', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('173242094626270389', '01-0683', '杨明军', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('173331106221081196', '01-0695', '刘永斌', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('173363212324153702', '01-0188', '张小兵', '62196952', '生产助理', '0', null, null);
INSERT INTO `employee` VALUES ('173448155021047852', null, '刘春龙', '72467309', null, '0', null, null);
INSERT INTO `employee` VALUES ('1735370129689990', '01-0141', '周亮', '80858087', '市场推广部总监', '0', null, null);
INSERT INTO `employee` VALUES ('173550405230706968', '01-0106', '程凡美', '137679295', '制单员', '0', null, null);
INSERT INTO `employee` VALUES ('173559596121437071', '01-0741', '吕宝德', '137670297', '硬件工程师', '0', null, null);
INSERT INTO `employee` VALUES ('173604342923191825', '01-0455', '孙垂强', '72103384, 62196952', '车间主任', '0', null, null);
INSERT INTO `employee` VALUES ('173621584438857605', '01-0375', '魏久涛', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('17363021191146981', '01-0144', '赵强', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('173651380836886715', null, '郭风东', '72013420', '', '0', null, null);
INSERT INTO `employee` VALUES ('173655682232441543', '01-0374', '聂法强', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('173702354229172651', '01-0353', '王守全', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('17371460581245941', '01-0034', '马信信', '137489953', '涂装设计部副经理', '0', null, null);
INSERT INTO `employee` VALUES ('173729356829651232', '01-0145', '王清慧', '62196952', '生产统计', '0', null, null);
INSERT INTO `employee` VALUES ('173732505836077309', null, '辛宏发', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('173812675337804612', '01-0308', '陈晓凯', '113819305', 'SEM竞价', '0', null, null);
INSERT INTO `employee` VALUES ('173826093135635559', '01-0047', '赵新波', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('17391668111036511', '01-0592', '罗敖', '137489953', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('174043345528883400', null, '牛家圣', '137656367', '', '0', null, null);
INSERT INTO `employee` VALUES ('174465690436107224', '01-0123', '辛建康', '139768032', '二组组长', '0', null, null);
INSERT INTO `employee` VALUES ('174718191020213939', '01-0422', '于浦之', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('175300623522998017', '01-0635', '娄树森', '139682383', '机械设计师', '0', null, null);
INSERT INTO `employee` VALUES ('175352266324478592', '01-0043', '张荣荣', '112200555', '会计主管', '0', null, null);
INSERT INTO `employee` VALUES ('175531095929314117', '01-0586', '王洪坤', '139682383', '结构设计师', '0', null, null);
INSERT INTO `employee` VALUES ('17566836261066172744', '01-0155', '郑洁', '112394552', '事业部总经理助理', '0', null, null);
INSERT INTO `employee` VALUES ('175704451826240666', '01-0007', '李文佳', '137664437', '中心经理', '0', null, null);
INSERT INTO `employee` VALUES ('175712504538770802', '01-0023', '高军燕', '112200555', '资金主管', '0', null, null);
INSERT INTO `employee` VALUES ('175920403533695247', '01-0173', '蔡玉林', '113662254', '（线上机构一组）业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('175928584524183836', '01-0057', '张延洲', '137489953', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('175929204324201005', '01-0072', '徐吉庆', '112394552', '结构设计师', '0', null, null);
INSERT INTO `employee` VALUES ('175932053821820977', '01-0181', '唐洪洋', '113662254', '国内业务部副经理', '0', null, null);
INSERT INTO `employee` VALUES ('17593462021145644', '01-0164', '赵威', '113776260', '（设备组）业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('175958260035272196', '01-0054', '谭志明', '72103384', '返修', '0', null, null);
INSERT INTO `employee` VALUES ('176006596929236966', '01-0193', '王振彪', '113568253', '个人业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('176010061422903100', '01-0167', '姜心跃', '113568253', '个人业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('176014640721261140', '01-0090', '历园媛', '90010345', '线上客服', '0', null, null);
INSERT INTO `employee` VALUES ('17601740691178190', '01-0140', '郭涛', '112210865', '中心副经理', '0', null, null);
INSERT INTO `employee` VALUES ('176167154723132106', '01-0143', '孙传科', '137670297', '实施运维主管', '0', null, null);
INSERT INTO `employee` VALUES ('176449603826201187', '01-0647', '李志斌', '61206448', '项目申报主管', '0', null, null);
INSERT INTO `employee` VALUES ('176667214123549714', '01-0694', '孙著杰', '137735115', '软件开发工程师', '0', null, null);
INSERT INTO `employee` VALUES ('176918675935283566', '01-0038', '谢振君', '137489969', '后勤专员', '0', null, null);
INSERT INTO `employee` VALUES ('176930391731364072', null, '窦金艳', '61695172', '', '0', null, null);
INSERT INTO `employee` VALUES ('180861400134365953', '01-0150', '袁微微', '85153050', '前台', '0', null, null);
INSERT INTO `employee` VALUES ('18090745141223954', '01-0138', '隋爽', '112528229', '稽查组长', '0', null, null);
INSERT INTO `employee` VALUES ('180911403921040989', '01-0198', '刘文韬', '137679295', '原料仓班长', '0', null, null);
INSERT INTO `employee` VALUES ('180911423836408757', '01-0205', '邓晓燕', '85153050', '销售内勤', '0', null, null);
INSERT INTO `employee` VALUES ('180912195039229105', '01-0213', '马风晓', '85153050', '销售内勤', '0', null, null);
INSERT INTO `employee` VALUES ('180916383021238268', '01-0058', '刘美玲', '137489969', '行政主管', '0', null, null);
INSERT INTO `employee` VALUES ('180916664820095421', '01-0045', '于小飞', '62196952', '车间主任', '0', null, null);
INSERT INTO `employee` VALUES ('1809301702679239', '01-0161', '刘江', '112380635', '产品事业三部副总监', '0', null, null);
INSERT INTO `employee` VALUES ('1809645131791141', '01-0154', '张超', '113842282', '国内业务部经理', '0', null, null);
INSERT INTO `employee` VALUES ('18113413031220537', null, '陈洁', '61695171', '', '0', null, null);
INSERT INTO `employee` VALUES ('182125572523351909', '01-0650', '宋春伟', '139682383', '机械设计师', '0', null, null);
INSERT INTO `employee` VALUES ('182415673220074158', '01-0269', '付兴磊', '72013423', '入库检', '0', null, null);
INSERT INTO `employee` VALUES ('182441534524088457', '01-0239', '张召仕', '112239620', '技术工程师', '0', null, null);
INSERT INTO `employee` VALUES ('182643696436021488', '01－0764', '赵镇财', '112210865', '', '0', null, null);
INSERT INTO `employee` VALUES ('182661081026312611', '01-0360', '栾其军', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('1830422224857217', '01-0250', '梁波', '113593239', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('183912223821651799', '01-0403', '唐在良', '113819305', '数据运营', '0', null, null);
INSERT INTO `employee` VALUES ('185022471232998053', '01-0165', '苑承芳', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('185853516123220771', '01-0527', '季娜娜', '137664437', '采购专员', '0', null, null);
INSERT INTO `employee` VALUES ('186046312620970252', '01-0051', '刘建亮', '72103384', '返修', '0', null, null);
INSERT INTO `employee` VALUES ('186046312920947797', '01-0056', '刘宝强', '72013423', '入库检', '0', null, null);
INSERT INTO `employee` VALUES ('18615538351222666', null, '雷怡', '112412562', '', '0', null, null);
INSERT INTO `employee` VALUES ('190039305721143001', '01-0327', '刘玉琪', '112210865', '质检专员', '0', null, null);
INSERT INTO `employee` VALUES ('190054133039043592', '01-0055', '高现章', '112414672', '工艺工程师', '0', null, null);
INSERT INTO `employee` VALUES ('190104680429334989', '01-0086', '王海龙', '72013425', '广告部', '0', null, null);
INSERT INTO `employee` VALUES ('191030073523799868', '01-0492', '崔泽超', '113842282', '（线下销售组）业务经理', '0', null, null);
INSERT INTO `employee` VALUES ('192313234326881346', '01-0022', '梁连生', '72103384', '返修', '0', null, null);
INSERT INTO `employee` VALUES ('193314092636407136', null, '郭宝新', '72467309', null, '0', null, null);
INSERT INTO `employee` VALUES ('193724630026160528', '01-0585', '朱建乙', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201109554524404500', null, '张立江', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('201513445835790547', '01-0105', '赵福才', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('20152520571225814', '01-0085', '韩伟', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('2015263224784763', '01-0241', '徐朋', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('2015263410974618342', '01-0050', '李成光', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('201526441919981406', '01-0246', '于会洪', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('201526606626240364', '01-0093', '李文久', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('201529010324203384', '01-0333', '张志鹏', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('201529013537828562', '01-0192', '陈梦杰', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('2015295554675810', '01-0115', '刘建', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('201529562832541743', '01-0163', '胡晓宁', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('201530443621333926', '01-0363', '华明琦', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('201543160624204874', '01-0131', '张成强', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201544453638131298', '01-0129', '韩小滨', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201544462329066686', '01-0384', '王义东', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201544606231012262', '01-0391', '程秀君', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('20154533261741324374', '01-0130', '杨清明', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('201547074322854709', '01-0113', '姚学征', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('201547336421183334', '01-0349', '刘福国', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201547621137769853', '01-0128', '陈成久', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201550182337987299', '01-0344', '鞠友亮', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201550461824398792', null, '彭焕成', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('201557066423112857', '01-0203', '孙东东', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('201557496123192544', '01-0371', '孙嘉辰', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('2015576555755803', '01-0076', '岳亮', '72013421', '动力组装', '0', null, null);
INSERT INTO `employee` VALUES ('201616202020218990', '01-0082', '于洋洋', '72013425', '广告部', '0', null, null);
INSERT INTO `employee` VALUES ('201643440238958579', '01-0046', '马相广', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('201645405631087418', '01-0340', '管兆江', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('20164712271148522', '01-0201', '赵政', '72013423', '入库检', '0', null, null);
INSERT INTO `employee` VALUES ('201812464737724427', '01-0053', '陈安本', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('201942410736329926', '01-0322', '郭兰玉', '137489969', '保洁', '0', null, null);
INSERT INTO `employee` VALUES ('201969641239389390', '01-0116', '魏金峰', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('202248342529361530', '01-0409', '牟雪梅', '112391650', '外贸专员', '0', null, null);
INSERT INTO `employee` VALUES ('202531466727446895', '01-0293', '沈安乐', '72013425', '广告部', '0', null, null);
INSERT INTO `employee` VALUES ('203761200719990807', '01-0417', '于佳蜜', '112200555', '出纳', '0', null, null);
INSERT INTO `employee` VALUES ('203935536024272718', '01-0418', '庞立军', '137679295', '仓库管理员', '0', null, null);
INSERT INTO `employee` VALUES ('203944424821084283', '01-0059', '刘江波', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('203950372236480539', '01-0094', '邹毅勇', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('2039550424755313', '01-0248', '宋炜', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('203956691823365517', '01-0083', '宋文革', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('203958092224209389', '01-0063', '张振东', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('204113620821189510', '01-0763', '刘祥琳', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('204250311435321838', '01-0112', '谢术涛', '112210865', '质检专员', '0', null, null);
INSERT INTO `employee` VALUES ('204315271629073745', null, '王丽欣', '113819305', '', '0', null, null);
INSERT INTO `employee` VALUES ('204508153526237416', '01-0561', '朱晓雪', '85153050', '销售内勤', '0', null, null);
INSERT INTO `employee` VALUES ('204930454519981319', '01-0300', '于伟永', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('205221343320962241', '01-0108', '刘学鹏', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('205912271127461719', '01-0434', '武聪军', '72013425', '广告部', '0', null, null);
INSERT INTO `employee` VALUES ('206103293026655801', '01-0436', '杨锁莲', '72013425', '广告部', '0', null, null);
INSERT INTO `employee` VALUES ('206636654236354087', '01-0437', '邱宏祥', '72013423', '入库检', '0', null, null);
INSERT INTO `employee` VALUES ('206759682730770742', '01-0439', '秦志勇', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('211309633526140894', '01-0685', '曹振兴', '137732151', '软件开发工程师', '0', null, null);
INSERT INTO `employee` VALUES ('2126325253778107', '01-0547', '张媛', '90010345', '客服主管', '0', null, null);
INSERT INTO `employee` VALUES ('212641531237868635', '01-0478', '雷大卫', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('21403208322143583291', '01-0716', '于强强', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('214235480427456746', '01-0486', '武继洋', '137735115', '开发主管', '0', null, null);
INSERT INTO `employee` VALUES ('215138544637637337', '801', '陈会鑫', '137679295', '', '0', null, null);
INSERT INTO `employee` VALUES ('215628191926542428', '01-0481', '李言美', '85153050', '销售内勤', '0', null, null);
INSERT INTO `employee` VALUES ('215767402026400808', '01-0482', '李福吉', '112229662', '结构设计师', '0', null, null);
INSERT INTO `employee` VALUES ('216720386337885141', '01-0736', '隋晟辉', '139682383', '机械设计师', '0', null, null);
INSERT INTO `employee` VALUES ('216907523126268016', '01-0488', '杨政慧', '90010345', '线上客服', '0', null, null);
INSERT INTO `employee` VALUES ('2204052130640014', null, '丁凯', '72013425', '', '0', null, null);
INSERT INTO `employee` VALUES ('220753141932482394', null, '耿灿顺', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('221243210224140056', '01-0499', '张复祥', '72467309', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('222534624026564023', null, '李记龙', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('223327413026155734', '01-0506', '林全慧', '137909937', '外贸内勤', '0', null, null);
INSERT INTO `employee` VALUES ('22393438491171450', null, '郭升', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('2241605552691307', '01-0508', '吴娟', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('224934122826201671', '01-0287', '李志杰', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('225051086426101388', '01-0516', '李冬雪', '113842282', '国内业务部副经理', '0', null, null);
INSERT INTO `employee` VALUES ('225341204224353110', '01-0519', '徐晓禹', '112239620', '数据员', '0', null, null);
INSERT INTO `employee` VALUES ('225808406838845508', '01-0522', '高小军', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('226245110826103282', '01-0524', '李凯阳', '112239620', '结构设计师', '0', null, null);
INSERT INTO `employee` VALUES ('230447041821499086', null, '卢福军', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('232200465526292270', '01-0542', '李欣欣', '112519206', '研发助理', '0', null, null);
INSERT INTO `employee` VALUES ('232662502926197591', '01-0543', '李常见', '112391650', '外贸专员', '0', null, null);
INSERT INTO `employee` VALUES ('233031321124314041', '01-0588', '弓燕军', '112239620', '自动化经理', '0', null, null);
INSERT INTO `employee` VALUES ('233133594821602706', '01-0545', '唐先磊', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('233736546626544091', '01-0611', '李训刚', '113593239', '摄影摄像', '0', null, null);
INSERT INTO `employee` VALUES ('2340250911840717', '0731', '李军升', '72013420', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('235624171321410800', '01-0671', '刘长海', '61411241, 72255094, 112519206', '公司副总经理', '0', null, null);
INSERT INTO `employee` VALUES ('240434360620274488', '01-0656', '付欣欣', '137489969', '行政主管', '0', null, null);
INSERT INTO `employee` VALUES ('241161102131300403', '01-0743', '类凯文', '137670297', '硬件工程师', '0', null, null);
INSERT INTO `employee` VALUES ('2420433629490219', '01-0185', '王臻臻', '90010345', '线上客服', '0', null, null);
INSERT INTO `employee` VALUES ('243118236633253608', '01-0558', '蒋东方', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('24313412511243823', '01-0557', '鞠鹏', '85031050', '包外板', '0', null, null);
INSERT INTO `employee` VALUES ('243612202824325935', null, '张焕暄', '112239620', '', '0', null, null);
INSERT INTO `employee` VALUES ('244410024729895136', '01-0565', '白存任', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('244733634127258548', null, '武春晓', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('244747605538118049', '01-0569', '陈起峰', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('244965341330705296', '01-0676', '秦国文', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('250059470326641703', '01-0589', '朱高明', '112210865', '质量工程师', '0', null, null);
INSERT INTO `employee` VALUES ('253243366737804647', '01-0687', '陈景亮', '112210865', '质检专员', '0', null, null);
INSERT INTO `employee` VALUES ('253246141321117976', '01-0698', '刘灵燕', '112391650', '外贸专员', '0', null, null);
INSERT INTO `employee` VALUES ('254138116929176352', '01-0603', '王寿兴', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('254812192529492477', '01-0605', '王莉媛', '112200555', '会计主管', '0', null, null);
INSERT INTO `employee` VALUES ('256368500924403045', '01-0608', '徐海彬', '85153050', '司机', '0', null, null);
INSERT INTO `employee` VALUES ('256625583539277618', '01-0703', '高金朋', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('2620115402857821', '01-0615', '李鑫', '139682383', '机械设计', '0', null, null);
INSERT INTO `employee` VALUES ('262201112626074406', '01-0746', '朱君仰', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('263957516924184496', '01-0641', '张开源', '113593239', '平面设计', '0', null, null);
INSERT INTO `employee` VALUES ('26624058011253521', null, '高恩', '72467309', null, '0', null, null);
INSERT INTO `employee` VALUES ('271253670924160790', '01－0474', '张孝芳', '137489969', '', '0', null, null);
INSERT INTO `employee` VALUES ('274223520526330453', null, '杨洪志', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('27453535431241747', '01-0727', '鞠阳', '139682383', '机械设计师', '0', null, null);
INSERT INTO `employee` VALUES ('276238163035686051', null, '贾玉华', '61695169', null, '0', null, null);
INSERT INTO `employee` VALUES ('280012395520621181', '01-0639', '于鹏飞', '137713237', '安环主管', '0', null, null);
INSERT INTO `employee` VALUES ('283920511226466944', null, '杨继伟', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('284331346324434575', '01-0690', '张美丽', '72013423', '入库检', '0', null, null);
INSERT INTO `employee` VALUES ('2847436468849401', null, '李率', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('284918482621719336', '01-0665', '周瑶瑶', '113593239', '文案策划', '0', null, null);
INSERT INTO `employee` VALUES ('2856054265841523', '01-0298', '杨军', '139768032', '布局设计师', '0', null, null);
INSERT INTO `employee` VALUES ('285855666534573065', null, '解世礼', '61695169', null, '0', null, null);
INSERT INTO `employee` VALUES ('286849292920951107', '01-0727', '刘宗波', '72013420', '焊接一班', '0', null, null);
INSERT INTO `employee` VALUES ('2932656766749895', '01-0701', '宫垒', '72467309', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('294339490724028547', '01-0691', '常明香', '137679295', '制单员', '0', null, null);
INSERT INTO `employee` VALUES ('2952356840762093', '01-0742', '崔宁', '137670297', '', '0', null, null);
INSERT INTO `employee` VALUES ('301209682824133177', '01-0708', '张复庆', '82586692', '包内板', '0', null, null);
INSERT INTO `employee` VALUES ('301560031124581305', '01-0745', '张述辉', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('301666011226067722', '01-0709', '李丕花', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('3017326244957317302', '01-0712', '孙建平', '82586692', '总装一', '0', null, null);
INSERT INTO `employee` VALUES ('3027253319685017', '01-0713', '刘英', '137654344', '物控专员', '0', null, null);
INSERT INTO `employee` VALUES ('303665676626056895', '01-0738', '李义刚', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('303917062439098934', null, '高秀霞', '61695169', null, '0', null, null);
INSERT INTO `employee` VALUES ('304453631627574886', '01-0715', '泮广林', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('304928462020174940', '01-0717', '何保庄', '72143347', '总装三', '0', null, null);
INSERT INTO `employee` VALUES ('304928650723358173', '01-0718', '宋春林', '72013424', '焊接二班', '0', null, null);
INSERT INTO `employee` VALUES ('3052471941946687', '01-0722', '王琪', '137570490', '设备主管', '0', null, null);
INSERT INTO `employee` VALUES ('3067186042782812', '01-0751', '徐彬', '112229662', '方案建模师', '0', null, null);
INSERT INTO `employee` VALUES ('306935326037658739', '01-0728', '陈向东', '139682383', '机械设计师', '0', null, null);
INSERT INTO `employee` VALUES ('310401085026261477', null, '李杰文', '82586692', '', '0', null, null);
INSERT INTO `employee` VALUES ('310741611720960140', '01-0761', '刘家豪', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('311014083223160132', '01-0733', '孙向东', '112414672', '工艺工程师', '0', null, null);
INSERT INTO `employee` VALUES ('312506003123288165', '01-0735', '孙振涛', '139768032', '机械设计师', '0', null, null);
INSERT INTO `employee` VALUES ('3142335131944958', null, '王浩', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('315543115522010787', null, '吴鹏飞', '137664437', null, '0', null, null);
INSERT INTO `employee` VALUES ('320119310720503270', null, '何秀云', '72013423', null, '0', null, null);
INSERT INTO `employee` VALUES ('335128206726213770', null, '朱新义', '61695169', null, '0', null, null);
INSERT INTO `employee` VALUES ('346366391123472714', null, '孙秀英', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('352268203626260336', null, '李新青', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('352334383521193719', null, '刘福美', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('352341620123265988', null, '孙志红', '61695170', '', '0', null, null);
INSERT INTO `employee` VALUES ('352347225929380992', null, '王玉霞', '61695170', '', '0', null, null);
INSERT INTO `employee` VALUES ('352347360129142193', null, '王国权', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('352352175129236639', null, '王成胤', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('352440683930498706', null, '石秀娟', '61695170', '', '0', null, null);
INSERT INTO `employee` VALUES ('35265414171284458', null, '黄微', '61695170', '', '0', null, null);
INSERT INTO `employee` VALUES ('35382245581046977', null, '肖林', '61695169', '', '0', null, null);
INSERT INTO `employee` VALUES ('406148441252632', '01-0747', '高峰', '61206448', '', '0', null, null);
INSERT INTO `employee` VALUES ('415723624024330764', null, '张爱国', '72013420', null, '0', null, null);
INSERT INTO `employee` VALUES ('5017205826213633', '01-0003', '李成元', '81078106', '国际营销中心总监', '0', null, null);
INSERT INTO `employee` VALUES ('554448024927498233', '01-0755', '江晓才', '72013425', '', '0', null, null);
INSERT INTO `employee` VALUES ('554525313426196005', '01-0756', '李建民', '72013425', '', '0', null, null);
INSERT INTO `employee` VALUES ('554534520329602760', '0786', '王金亮', '72013420', '', '0', null, null);
INSERT INTO `employee` VALUES ('563043512220122524', '01-0758', '于志超', '72013425', '', '0', null, null);
INSERT INTO `employee` VALUES ('5631282639674894', '01-0757', '刘学', '72013425', '', '0', null, null);
INSERT INTO `employee` VALUES ('576232165532455616', '800', '聂法阳', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('576400054336887572', null, '郭风兵', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('5764012228850148', null, '林涛', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('576423224324358896', null, '徐朋程', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('584354474826082624', null, '李健男', '85031050', null, '0', null, null);
INSERT INTO `employee` VALUES ('605549682226439780', null, '李纪一', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('605565590930795827', null, '石黎明', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('605617174222859630', null, '姚少帅', '82586692', '', '0', null, null);
INSERT INTO `employee` VALUES ('605630344526280682', null, '李桂霞', '72013423', '', '0', null, null);
INSERT INTO `employee` VALUES ('611051441926254302', '01-0762', '杨振毅', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('611149034724051099', '01-0764', '张传军', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('611158573435441948', '01-0766', '赵中兴', '85031050', '', '0', null, null);
INSERT INTO `employee` VALUES ('613037594826594074', null, '李金国', '82586692', '', '0', null, null);
INSERT INTO `employee` VALUES ('613950402421355897', null, '吴世军', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('614000216929209547', null, '王德志', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('6140152758653431', null, '于畅', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('614054633138868073', null, '高开云', '72467309', '', '0', null, null);
INSERT INTO `employee` VALUES ('620934336536470726', null, '郝晓东', '82586692', '', '0', null, null);
INSERT INTO `employee` VALUES ('69493439692023', '01-0651', '刘鹏', '137670297', '实施运维主管', '0', null, null);

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='设备';

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('1', '003', '电焊');
INSERT INTO `equipment` VALUES ('4', '0001', '车床');
INSERT INTO `equipment` VALUES ('5', '0002', '电脑1');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='岗位';

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', 'gw0001', '焊接工');
INSERT INTO `job` VALUES ('2', 'gw001', '开发');
INSERT INTO `job` VALUES ('3', 'gw0002', '管理');

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_type` varchar(2) NOT NULL COMMENT '操作类型(员工变更 10员工入职 11 员工变更12员工离职 部门变更 岗位变更)',
  `operate_time` varchar(32) NOT NULL COMMENT '变更时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `level` varchar(255) NOT NULL COMMENT '级别',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for order_class
-- ----------------------------
DROP TABLE IF EXISTS `order_class`;
CREATE TABLE `order_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `time_interval_total` int(11) DEFAULT NULL COMMENT '总时段',
  `start_time` varchar(16) NOT NULL COMMENT '开始时间',
  `end_time` varchar(16) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='班次';

-- ----------------------------
-- Records of order_class
-- ----------------------------
INSERT INTO `order_class` VALUES ('1', '0001', 'A班', '6', '08:00', '14:00');
INSERT INTO `order_class` VALUES ('2', '0002', 'B班', '6', '14:00', '20:00');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` varchar(32) NOT NULL COMMENT '序号',
  `product_parent_id` varchar(32) DEFAULT NULL COMMENT '产品目录id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '名称',
  `product_code` varchar(50) DEFAULT NULL COMMENT '编码',
  `product_english_name` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `product_develop_code` varchar(50) DEFAULT NULL COMMENT '开发代码',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('01caa49226c44a76b931c218758ae64c', 'df252bf12a2c4dfaac73fb410717c07c', '格林-改动款1', 'D02-02', 'GREEN', '');
INSERT INTO `product` VALUES ('070d280d27f047a8b59e45af61c93eb3', '5cd9ca71e9dd4a77a9af1652bd0b1d79', '酷客精致版-改动款3', 'C03-04', 'KUCK', '');
INSERT INTO `product` VALUES ('08464983343a4579b155a9bd2c435b4e', 'f4ad38507b5241ed918cd40e9a0a77d5', '米可动力版-标准款', 'D09-01', 'MIKO', '');
INSERT INTO `product` VALUES ('098ce1a6d3cb495a9525dc1e890bce78', '11c4ed6771394ac88d469fc2a8f3f2f8', '酷客名爵版-改动款2', 'C20-03', 'KUCK', '');
INSERT INTO `product` VALUES ('103613cf515643bca9842b5d877ac096', 'a5c2a12daed54487b7a0a167c567907a', '罗马假日旗舰版-改动款2', 'W01-03', 'ROMAN', '');
INSERT INTO `product` VALUES ('12ae64e8f94741af8caa4395197f92eb', '49a296ad6e6d4e32aa9f818f7b567bb9', '芭比-改动款2', 'Q05-03', 'BARBIE', '');
INSERT INTO `product` VALUES ('1319a03d8c494868aece3bbe84e173bc', '11c4ed6771394ac88d469fc2a8f3f2f8', '酷客名爵版-标准款', 'C20-01', 'KUCK', '');
INSERT INTO `product` VALUES ('138ce2b02f504a56a34792d5edfc09fa', 'ffbbefa67182432fa43401068c8cfa9b', '时光巴士动力版-标准款', 'D07-01', 'TIME BUS', '');
INSERT INTO `product` VALUES ('1473cd6d1aa04ee9901a6c5074cddd66', '43b0ff1f16ad44c398a553a6b9d8dc6c', '尊客至尊版-标准款', 'C13-01', 'ZENK', '');
INSERT INTO `product` VALUES ('14b387c3f0e34128b3001a2e7788e3a3', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款10', 'C01-11', 'KUCK', '');
INSERT INTO `product` VALUES ('155fa1eb8e3d42649bcd5e4792a2d47e', '472c6992fb5e4fdfbdd88b9423113773', '时光巴士至尊版-标准款', 'W08-01', 'TIME BUS', '');
INSERT INTO `product` VALUES ('190b98d926dc4371838d5ccc32f0304b', '7d43e69231b149bdae362149f574daeb', '弗兰克-标准款', 'Q06-01', 'FRANK', '');
INSERT INTO `product` VALUES ('1c9dc7a8bf50480e840c9313873e1080', 'a9dc056a31024ef482f6524673293f25', '骑士-改动款2', 'W04-03', 'KNIGHT', '');
INSERT INTO `product` VALUES ('1cbbf40ae7234e229332b9752c411b47', '6b5ea17cb9a4401aac0e096700d6bd26', '豪客旗舰版-标准款', 'C14-01', 'HAWK', '');
INSERT INTO `product` VALUES ('1d98933b57a244748af000382750c34d', 'ce96cffe739549e39b3c48488c05ca4b', '柏林-动力版', 'D10-01', '', '');
INSERT INTO `product` VALUES ('220e2c3cb1b745a68224f97aa23ef9ed', '5f4a86624cea424c8227f975c01d323d', '罗马假日迷你版-标准款', 'W03-01', 'ROMAN', '');
INSERT INTO `product` VALUES ('22517d4382ba4f9babad8be194e0ed13', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款8', 'C02-09', 'KUCK', '');
INSERT INTO `product` VALUES ('232492c505a0493c8ec006b99a93b992', 'a7bf6bcdd74f4999b15d30520f3e0a8f', '尚客旗舰版-标准款', 'C07-01', 'SHANK', '');
INSERT INTO `product` VALUES ('255a25dfd68645b0aa73e0413a08c0f9', '3a60c2ef218648f8acc79a618265ad26', '摩西-改动款2', 'Q02-03', 'MOSHE', '');
INSERT INTO `product` VALUES ('27d1a030e7534f06b5daab87ec542a48', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-改动款7', 'W06-08', 'MODERN', '');
INSERT INTO `product` VALUES ('2b6c9736700f406f951acadaa3e1e436', '49a296ad6e6d4e32aa9f818f7b567bb9', '芭比-改动款1', 'Q05-02', 'BARBIE', '');
INSERT INTO `product` VALUES ('2d79ef7275b049afa3d0d6db7158f75d', '315c5e1acbc444639770b7dfa3898703', '柏丽-改动款6', 'D03-07', 'POLLY', '');
INSERT INTO `product` VALUES ('2e153ca70be54f26b15e73242738e4af', '177f278045d04ae598102a62ae96050d', '里斯本精致版', 'W09-02', 'LISBON', '');
INSERT INTO `product` VALUES ('2f915542fc4842d6b635294204a1c93d', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-改动款3', 'W06-04', 'MODERN', '');
INSERT INTO `product` VALUES ('35ff6593a5b84674880b847dc7604b5c', '315c5e1acbc444639770b7dfa3898703', '柏丽-改动款5', 'D03-06', 'POLLY', '');
INSERT INTO `product` VALUES ('3bb4415c7964467a85684074209a1ca4', '03e9180ddf954acc9665dabb884e25a4', '布兰卡-改动款2', 'Q01-03', 'BRANKA', '');
INSERT INTO `product` VALUES ('3d1767c9db4e434a9694ad2b633eb6dc', '5585ade982934010b30e70813a441d0a', '尊客时尚版-标准款', 'C23-01', 'ZENK', '');
INSERT INTO `product` VALUES ('3e1df9621a7e4e5baf3407770b30bee0', '5cd9ca71e9dd4a77a9af1652bd0b1d79', '酷客精致版-改动款4', 'C03-05', 'KUCK', '');
INSERT INTO `product` VALUES ('411cafaebe5e419ebabd04b4f1a5187b', '5cd9ca71e9dd4a77a9af1652bd0b1d79', '酷客精致版-标准款', 'C03-01', 'KUCK', '');
INSERT INTO `product` VALUES ('4145a03a8fac4bb38ea8b018e7c694a6', '7f093477295f4b6285ccd846fbc79195', '江南至尊版-标准款', 'C25-01', '', '');
INSERT INTO `product` VALUES ('4230608a25d1417bab8cc719f093c88e', 'c1bf7863e3534bf4b4bd69280b6b39e9', '安迪-改动款1', 'D05-02', 'ANDY', '');
INSERT INTO `product` VALUES ('4266e16920034d4abfb775e5008061cc', 'e12bdc0711c1446195d82afd1af19b65', '克勒-标准款', 'Q03-01', 'KELLE', '');
INSERT INTO `product` VALUES ('42700d5d6a224efeb32884256776cdc8', 'df252bf12a2c4dfaac73fb410717c07c', '格林-标准款', 'D02-01', 'GREEN', '');
INSERT INTO `product` VALUES ('46f93e3d7ef647a18d069d2ae0a35cc1', '315c5e1acbc444639770b7dfa3898703', '柏丽-改动款2', 'D03-03', 'POLLY', '');
INSERT INTO `product` VALUES ('4acae2fc456444609e977351e2da9809', '472c6992fb5e4fdfbdd88b9423113773', '时光巴士旗舰版-标准款', 'W07-01', 'TIME BUS', '');
INSERT INTO `product` VALUES ('4bc2a69bc1c24fe29b43a09b8c9dfbf1', '28ab200c461c47faaef16721b85a72d4', '百汇至尊版-标准款', 'C10-01', 'BUYWAY', '');
INSERT INTO `product` VALUES ('4c4a320a032b4fa7bf87a7954ad9c514', '82ee994d5a9f4e86b66d23767fcb086e', '爱丽丝-标准款', 'T02-01', 'ALICE', '');
INSERT INTO `product` VALUES ('4d86ba1e8da44e6dbadd8c259719f04d', '407176e88a65450c8e251e8e34cfd0ca', '柏林-标准款', 'U04-01', 'BERLIN', '');
INSERT INTO `product` VALUES ('524696216325414bae743cc5a870c35b', 'a7bf6bcdd74f4999b15d30520f3e0a8f', '尚客旗舰版-改动款1', 'C07-02', 'SHANK', '');
INSERT INTO `product` VALUES ('525e6f60436748a79853d9f2131ab47d', '16e3a48af4244977b67fd7d7a1d975c0', '品客名爵版-标准款', 'C24-01', 'PINK', '');
INSERT INTO `product` VALUES ('536350073fae4d1ea07ced5cc6ef951a', 'a5c2a12daed54487b7a0a167c567907a', '罗马假日旗舰版-改动款1', 'W01-02', 'ROMAN', '');
INSERT INTO `product` VALUES ('566bb34e69ed433085fa265f938e56ee', 'a9dc056a31024ef482f6524673293f25', '骑士-改动款1', 'W04-02', 'KNIGHT', '');
INSERT INTO `product` VALUES ('5ab94fdc790f42b59c2c9e6e2a067872', 'd6719f4a60094427a1e827e11ac34871', '巴顿-标准款', 'D01-01', 'BARTON', '');
INSERT INTO `product` VALUES ('5ae6cd228f854b6090289c065b9742ce', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款9', 'C01-10', 'KUCK', '');
INSERT INTO `product` VALUES ('5f2e0b7b6bd44c3eb9c48e3e5393cf6a', '2b31a787bbcc47888717ccbd3bce35a0', '酷客迷你版-标准款', 'C04-01', 'KUCK', '');
INSERT INTO `product` VALUES ('5f7156f17b1f485abe8e5e01bb3e6c42', '77eac14df45f49c7a510ae0a1d806faf', '尚客时尚版-改动款3', 'C05-04', 'SHANK', '');
INSERT INTO `product` VALUES ('64304aa74cf54878ae16acebc44b81dc', '46d9f42d52f54ba7b1298a6c042e1a27', '福克斯-标准款', 'F01-01', 'FOCUS', '');
INSERT INTO `product` VALUES ('64b1c1ec7da34cd1a9e8fcecf694c310', '77eac14df45f49c7a510ae0a1d806faf', '尚客时尚版-标准款', 'C05-01', 'SHANK', '');
INSERT INTO `product` VALUES ('65560990bf9c4f88a8b95104873be6f8', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-标准款', 'C02-01', 'KUCK', '');
INSERT INTO `product` VALUES ('661822c4f5ee4458bf5d31a4a10f3692', '59e06833bede4e479459e53319c58ee7', '派客精致版-标准款', 'L02-01', 'PARKER', '');
INSERT INTO `product` VALUES ('6620e6dd97bf472dbd7f1194522e2f13', '28ab200c461c47faaef16721b85a72d4', '百汇豪华版-改动款1', 'C10-02', 'BUYWAY', '');
INSERT INTO `product` VALUES ('664d4218e56a473a9ee9ab4d21ed9467', '2ba380712d8541e7b2cab25401aade14', '酷客灵动版-标准款', 'C21-01', 'KUCK', '');
INSERT INTO `product` VALUES ('687fba11d5d04ea78d396bcedd13cd20', 'fad8361d262449b39864ca037b58cab0', '马库斯-标准款', 'G02-01', 'MARCUS', '');
INSERT INTO `product` VALUES ('68b9c1abd45a4106aff04effb8b0d010', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-标准款', 'C01-01', 'KUCK', '');
INSERT INTO `product` VALUES ('6b27016087794a72910f3c80f655269f', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-改动款5', 'W06-06', 'MODERN', '');
INSERT INTO `product` VALUES ('6e21ef6cf2bf43f494aa66a3adcc160e', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-标准款', 'W06-01', 'MODERN', '');
INSERT INTO `product` VALUES ('6f1e4af65488414ab186d688c8dded04', '77eac14df45f49c7a510ae0a1d806faf', '尚客时尚版-改动款1', 'C05-02', 'SHANK', '');
INSERT INTO `product` VALUES ('7090a371a19444dd803a41bf26737ddb', 'd6719f4a60094427a1e827e11ac34871', '巴顿-改动款1', 'D01-02', 'BARTON', '');
INSERT INTO `product` VALUES ('7339fbfeafbb4aeead632ac6c97641b3', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款5', 'C01-06', 'KUCK', '');
INSERT INTO `product` VALUES ('74fd78b0f02342e79f050adb3b001b88', '78edabf651464af29c4f6ba4df719958', '布鲁斯-改动款1', 'Q04-02', 'BLUES', '');
INSERT INTO `product` VALUES ('75cfba96931347cf88d673ff868f7507', '03e9180ddf954acc9665dabb884e25a4', '布兰卡-改动款1', 'Q01-02', 'BRANKA', '');
INSERT INTO `product` VALUES ('7696e73e61b54287b1888a874f22ead1', 'f1372f37e89e4614ae733c830b8cba37', '豪客至尊版-标准款', 'C15-01', 'HAWK', '');
INSERT INTO `product` VALUES ('7d9462720d8840ffb983988c7b3e6332', '03e9180ddf954acc9665dabb884e25a4', '布兰卡-标准款', 'Q01-01', 'BRANKA', '');
INSERT INTO `product` VALUES ('8130d89834fa446892bdba7451a9ac7c', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款6', 'C01-07', 'KUCK', '');
INSERT INTO `product` VALUES ('822b841bee854f068974cecfe31ec48c', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款8', 'C01-09', 'KUCK', '');
INSERT INTO `product` VALUES ('82ef7c10a36644188eac45366b4569ba', 'e90cc2ccda474885a711a81082d88a68', '豪客展示版-标准款', 'C16-01', 'HAWK', '');
INSERT INTO `product` VALUES ('84a45afa7b6e415caeaeb51b03226da4', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款2', 'C02-03', 'KUCK', '');
INSERT INTO `product` VALUES ('86a49af6d5c64f989e922d06fdcd0dbb', '11c4ed6771394ac88d469fc2a8f3f2f8', '酷客名爵版-改动款1', 'C20-02', 'KUCK', '');
INSERT INTO `product` VALUES ('8785db48065e4bee8e7bbbda73c77f18', '49a296ad6e6d4e32aa9f818f7b567bb9', '芭比-标准款', 'Q05-01', 'BARBIE', '');
INSERT INTO `product` VALUES ('8a2a18a2188a4a2bb66f77ce99b84524', '315c5e1acbc444639770b7dfa3898703', '柏丽-改动款1', 'D03-02', 'POLLY', '');
INSERT INTO `product` VALUES ('8a399ce2cb32474588d0c3c53ce6e0c2', '78edabf651464af29c4f6ba4df719958', '布鲁斯-标准款', 'Q04-01', 'BLUES', '');
INSERT INTO `product` VALUES ('8c9b0d75dc8642e6adb2b6546e1c0a2d', '5e88b8b36b384786a5c8df98d6c88022', '柏拉图-标准款', 'G04-01', 'PLATO', '');
INSERT INTO `product` VALUES ('8eedeb78d907477587e943ea866419a2', 'a5c2a12daed54487b7a0a167c567907a', '罗马假日旗舰版-标准款', 'W01-01', 'ROMAN', '');
INSERT INTO `product` VALUES ('8f4b7622d5cf40d89d23b4e9d66aa3b0', '5ba1ffd011e2442ca4f5d504887308c6', '江南精致版-标准款', 'C27-01', '', '');
INSERT INTO `product` VALUES ('9214cd5cfb8549b48223bf8776ec41be', '14505aadcc0841078a46dc90390fe17c', '派客旗舰版-标准款', 'L01-01', 'PARKER', '');
INSERT INTO `product` VALUES ('93969a0dae63453db9bc0ad5f4dc33c4', 'b6c7f946621e47489a852935ab0fdd7b', '苏格-标准款', 'D04-01', 'SUEGE', '');
INSERT INTO `product` VALUES ('9f3bb3cac4c540f8b10262f6932590c5', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款7', 'C01-08', 'KUCK', '');
INSERT INTO `product` VALUES ('a1acf50b3c3f4ef7bf66faabca957309', '177f278045d04ae598102a62ae96050d', '里斯本旗舰版-标准款', 'W09-01', 'LISBON', '');
INSERT INTO `product` VALUES ('a1ad1b2bdc99479ea77f5b9513f2b63e', 'f03cfeefa9f742b886642286a1d4bf2f', '迪奥动力版-标准款', 'D08-01', 'DIOR', '');
INSERT INTO `product` VALUES ('a62caf22c70f405fa2ed2b3f9cf4d982', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-改动款2', 'W06-03', 'MODERN', '');
INSERT INTO `product` VALUES ('a6923973055440689d38d6245a4f0c9e', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-改动款6', 'W06-07', 'MODERN', '');
INSERT INTO `product` VALUES ('a6c97e96eb2f44a7ad1ff5f6ca39c160', '86b6bcfe0d2248f9926072695a3de4e1', '罗马假日精致版-标准款', 'W02-01', 'ROMAN', '');
INSERT INTO `product` VALUES ('a7939fda777341928449880bc41e262b', 'c1bf7863e3534bf4b4bd69280b6b39e9', '安迪-标准款', 'D05-01', 'ANDY', '');
INSERT INTO `product` VALUES ('a80b46d453e64ca5b1d48efee72a3e45', '11c4ed6771394ac88d469fc2a8f3f2f8', '酷客名爵版-改动款3', 'C20-04', 'KUCK', '');
INSERT INTO `product` VALUES ('aada8321a6a148dc9a00fbeb46624f75', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款1', 'C01-02', 'KUCK', '');
INSERT INTO `product` VALUES ('ac32d41a6f5c4b559e355b95c3e81a1e', '9411e04e6d1b489f8cf043a834d2c32e', '米可-标准款', 'U02-01', 'MIKO', '');
INSERT INTO `product` VALUES ('ae27c4eb31bd4ca699bc186bca44f7ab', '8050d8e1a84c49faa1f3a4a83c59cd53', '罗森-标准款', 'Q07-01', 'ROSEN', '');
INSERT INTO `product` VALUES ('b2a8e0c873ea42de8f08cf85d1407440', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款1', 'C02-02', 'KUCK', '');
INSERT INTO `product` VALUES ('b64a1c5419c44bb2af804fd1051a514e', '898fd39f7928480983922a948cf01ef1', '酷客豪华版-标准款', 'C22-01', 'KUCK', '');
INSERT INTO `product` VALUES ('ba303e635feb456487a25534a6b4130a', '2b31a787bbcc47888717ccbd3bce35a0', '酷客迷你版-改动款1', 'C04-02', 'KUCK', '');
INSERT INTO `product` VALUES ('ba4b28ddf6534dbd82c0787d99a7cf78', 'b0249f0246ad481aa3d23544c3bde5c7', '品客至尊版-标准款', 'C08-01', 'PINK', '');
INSERT INTO `product` VALUES ('bbd3851dd46947ca9dbd5b670f161a83', 'bc757a6e9cc44dc1972202dd9f902e68', '江南旗舰版-标准款', 'C26-01', '', '');
INSERT INTO `product` VALUES ('bec86e7d0eb046cba89e86c61568ff8a', '3a60c2ef218648f8acc79a618265ad26', '摩西-改动款1', 'Q02-02', 'MOSHE', '');
INSERT INTO `product` VALUES ('bed2b2fc23904db9b87e8f1308f445e1', '99aa933a3c36490dada79f2238493029', '星爵-标准款', 'W10-01', 'Star-Lord', '');
INSERT INTO `product` VALUES ('c0afd978c7034e55a3191b494c442134', '90f3990327ee458d970cd93e0af3474f', '斯塔克-标准款', 'G03-01', 'STARK', '');
INSERT INTO `product` VALUES ('c0f2d2d30f194eedaf20588d138b1968', '29f43685622e44599e0d4e819a21636e', '罗迪-标准款', 'T01-01', 'RODDY', '');
INSERT INTO `product` VALUES ('c5527c011f1248a28f56cf5b75f998bc', '77eac14df45f49c7a510ae0a1d806faf', '尚客时尚版-改动款2', 'C05-03', 'SHANK', '');
INSERT INTO `product` VALUES ('c7d2b9a39fec47c89c5b78c87ade966e', 'a0e2a83beb8f4739885658d4fd7a21bc', '江南迷你版-标准款', 'C28-01', '', '');
INSERT INTO `product` VALUES ('c7d4f6ecb2174e95b2bd43c3fdad3ade', 'af1337a55900483d908916b02f67a685', '品客精致版-标准款', 'C19-01', 'PINK', '');
INSERT INTO `product` VALUES ('c8cd2298c0e14db4bd0c904c792ed063', 'a9dc056a31024ef482f6524673293f25', '骑士-标准款', 'W04-01', 'KNIGHT', '');
INSERT INTO `product` VALUES ('c93964a00f35442fb82b1ea92dbab544', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款3', 'C02-04', 'KUCK', '');
INSERT INTO `product` VALUES ('ca4bc8474bf148deb821ceb736bdffcf', 'b6c7f946621e47489a852935ab0fdd7b', '苏格-改动款1', 'D04-02', '', '');
INSERT INTO `product` VALUES ('ca63c341bf79432aa6896affa5b9e774', '78de33fe0ec5468aa293bbd624c42bb1', '摩登巴士动力版-标准款', 'D06-01', 'MODERN', '');
INSERT INTO `product` VALUES ('cb5d6381ed804b7da62f7695ef341d32', '775f286577254ab48777f11a7c084773', '尚客豪华版-改动款1', 'C06-02', 'SHANK', '');
INSERT INTO `product` VALUES ('cbad996a4a504a72998ce9d51ac0a718', '7d43e69231b149bdae362149f574daeb', '弗兰克-改动款1', 'Q06-02', 'FRANK', '');
INSERT INTO `product` VALUES ('cca1888ca82f4fc6b9852e7206438763', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款2', 'C01-03', 'KUCK', '');
INSERT INTO `product` VALUES ('cea449d8ceac4be0add0e1a4e6d882e7', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款11', 'C01-12', 'KUCK', '');
INSERT INTO `product` VALUES ('d1fa49d134594f03b4802e36aaba7f4a', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款4', 'C02-05', 'KUCK', '');
INSERT INTO `product` VALUES ('d49bb6fdf8794e1a8561e8fb3e04076f', 'c44087a7decf448495e8f165e4c4f411', '米兰-标准款', 'C17-01', 'MILAN', '');
INSERT INTO `product` VALUES ('d50d10b57f10483e96f372762ef68935', '721c9ba452a4440c9aa9de96cbc7700f', '西雅图-标准款', 'F02-01', 'SEATTLE', '');
INSERT INTO `product` VALUES ('d748b64c48c04e92807ca2d881b9f13d', '315c5e1acbc444639770b7dfa3898703', '柏丽-改动款3', 'D03-04', 'POLLY', '');
INSERT INTO `product` VALUES ('d7b6f9e8a75f4adabcf26243bd9ff2da', '9eb26e345e934e9d9c3e6f202913425b', '雷克斯', 'Q08-01', 'RAKERS', '');
INSERT INTO `product` VALUES ('d8040ee3caa940c18b5a442ec1f30fe2', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-改动款4', 'W06-05', 'MODERN', '');
INSERT INTO `product` VALUES ('da83603c44b14bfe86f1a6a9be85e0f5', '86b6bcfe0d2248f9926072695a3de4e1', '罗马假日精致版-改动款1', 'W02-02', 'ROMAN', '');
INSERT INTO `product` VALUES ('dbb274bcdd684bf68197db863d7f312e', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款5', 'C02-06', 'KUCK', '');
INSERT INTO `product` VALUES ('dc0fad454c5a4b3f98f621e43238cc38', '4b69560757544495a7ec414f9f378fe0', '维多利亚-标准款', 'W11-01', 'Victoria', '');
INSERT INTO `product` VALUES ('dea323bde8374f6da25bdbbc6b413e9a', '2dcef9a1ae95456da9673b2b5e9a1a01', '尊客旗舰版-标准款', 'C12-01', 'ZENK', '');
INSERT INTO `product` VALUES ('e1d54d51848b43298e73e4167acae7d8', 'a5c2a12daed54487b7a0a167c567907a', '罗马假日旗舰版-改动款3', 'W01-04', 'ROMAN', '');
INSERT INTO `product` VALUES ('e2efae5e8555418d9511892309413ed0', 'b9a6c5aefbf84730af5a70a5e25f7dd4', '摩登巴士至尊版-改动款1', 'W06-02', 'MODERN', '');
INSERT INTO `product` VALUES ('e3d802250bee4f0f92102afd46a150ca', 'b51500d120d34b3fa8e6b8fdf46d1565', '奥斯卡-标准款', 'G01-01', 'OSCAR', '');
INSERT INTO `product` VALUES ('e6aff6b2d61c4f7e8340493dec6e1ff8', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款7', 'C02-08', 'KUCK', '');
INSERT INTO `product` VALUES ('e864e08db9a14cc3a5c0925a9d8c2354', '315c5e1acbc444639770b7dfa3898703', '柏丽-改动款4', 'D03-05', 'POLLY', '');
INSERT INTO `product` VALUES ('e8ce183721e2423ba5e4270b23a4a66c', '5cd9ca71e9dd4a77a9af1652bd0b1d79', '酷客精致版-改动款2', 'C03-03', 'KUCK', '');
INSERT INTO `product` VALUES ('ea06520168fe42e0a82c5a06a5744f8f', '3b0bd7d44efb401d93e2642546d28e1f', '品客旗舰版-标准款', 'C09-01', 'PINK', '');
INSERT INTO `product` VALUES ('eafbdfbec99a4c8eb9999b54d542a80d', '50bec3646dd840609878f7c54c4e1c49', '迪奥-改动款1', 'U01-02', 'DIOR', '');
INSERT INTO `product` VALUES ('eaff80eaaf7043c7881a891d2f564607', '315c5e1acbc444639770b7dfa3898703', '柏丽-标准款', 'D03-01', 'POLLY', '');
INSERT INTO `product` VALUES ('ecf2c59689504fbe9d6e932f1ba2a6da', '3a60c2ef218648f8acc79a618265ad26', '摩西-标准款', 'Q02-01', 'MOSHE', '');
INSERT INTO `product` VALUES ('edf86f3da85142d09174bcf370c05851', '543ab66f6247401d95147e8f65eec6f2', '百汇旗舰版-标准款', 'C11-01', 'BUYWAY', '');
INSERT INTO `product` VALUES ('f1e5b12c9442499e9e8e23b98c217143', '9ec39693c4ab4f58b323c2baadea5d64', '酷客旗舰版-改动款6', 'C02-07', 'KUCK', '');
INSERT INTO `product` VALUES ('f210fe2f3a0642cda1f24b03f06866e1', '775f286577254ab48777f11a7c084773', '尚客豪华版-标准款', 'C06-01', 'SHANK', '');
INSERT INTO `product` VALUES ('f35a7873b0794af59d16cd3d179ee223', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款3', 'C01-04', 'KUCK', '');
INSERT INTO `product` VALUES ('f5680ebc469a4624a180583257ed8994', '50bec3646dd840609878f7c54c4e1c49', '迪奥-标准版', 'U01-01', 'DIOR', '');
INSERT INTO `product` VALUES ('fc9bbe080b904075a232421b53a443d7', '5cd9ca71e9dd4a77a9af1652bd0b1d79', '酷客精致版-改动款1', 'C03-02', 'KUCK', '');
INSERT INTO `product` VALUES ('fda348c1ab0c49cfa6752583788f1d78', 'e8b51c3c4b95453a98c3dab83d7f85aa', '酷客至尊版-改动款4', 'C01-05', 'KUCK', '');
INSERT INTO `product` VALUES ('fe5559f0816149eaa995dc5304ff98dc', 'f03cfeefa9f742b886642286a1d4bf2f', '迪奥动力版-改动款1', 'D08-02', 'DIOR', '');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '默认', '293113853', '293113856', '负责人');
INSERT INTO `roles` VALUES ('2', '默认', '293113853', '293113857', '主管');
INSERT INTO `roles` VALUES ('3', '默认', '293113853', '293113854', '主管理员');
INSERT INTO `roles` VALUES ('4', '默认', '293113853', '293113855', '子管理员');
INSERT INTO `roles` VALUES ('5', '职务', '293113858', '293113859', '财务');
INSERT INTO `roles` VALUES ('6', '职务', '293113858', '293113860', '人事');
INSERT INTO `roles` VALUES ('7', '职务', '293113858', '293113861', '出纳');
INSERT INTO `roles` VALUES ('8', '职务', '293113858', '293113862', '销售');
INSERT INTO `roles` VALUES ('9', '职务', '293113858', '293113863', '客服');
INSERT INTO `roles` VALUES ('10', '职务', '293113858', '293113864', '质检');
INSERT INTO `roles` VALUES ('11', '职务', '293113858', '293113865', '研发');
INSERT INTO `roles` VALUES ('12', '职务', '293113858', '293113866', '行政');
INSERT INTO `roles` VALUES ('13', '职务', '293113858', '293113867', '设计');
INSERT INTO `roles` VALUES ('14', '职务', '293113858', '293113868', '产品');
INSERT INTO `roles` VALUES ('15', '职务', '293113858', '463113131', '采购');
INSERT INTO `roles` VALUES ('16', '职务', '293113858', '462142566', '销售内勤');
INSERT INTO `roles` VALUES ('17', '岗位', '293113869', '293113870', '普通员工');
INSERT INTO `roles` VALUES ('18', '岗位', '293113869', '293113871', '部门经理');
INSERT INTO `roles` VALUES ('19', '岗位', '293113869', '293113874', '部门总监');
INSERT INTO `roles` VALUES ('20', '岗位', '293113869', '293113875', '管理层');
INSERT INTO `roles` VALUES ('21', '岗位', '293113869', '293113876', '中心总监');
INSERT INTO `roles` VALUES ('22', '岗位', '293113869', '293113877', '总经理');
INSERT INTO `roles` VALUES ('23', '岗位', '293113869', '293904126', '财务经理');
INSERT INTO `roles` VALUES ('24', '岗位', '293113869', '294891117', '副总经理');
INSERT INTO `roles` VALUES ('25', '岗位', '293113869', '294978067', '业务主管');
INSERT INTO `roles` VALUES ('26', '岗位', '293113869', '478870462', '产品经理');
INSERT INTO `roles` VALUES ('27', '岗位', '293113869', '512609550', '部门副总监');
INSERT INTO `roles` VALUES ('28', '岗位', '293113869', '512606994', '部门副经理');
INSERT INTO `roles` VALUES ('29', '岗位', '293113869', '507960784', '中心副总监');
INSERT INTO `roles` VALUES ('30', '岗位', '293113869', '512716259', '中心经理');
INSERT INTO `roles` VALUES ('31', '岗位', '293113869', '512764028', '中心副经理');
INSERT INTO `roles` VALUES ('32', '岗位', '293113869', '508021931', '车间主任');
INSERT INTO `roles` VALUES ('33', '岗位', '293113869', '556936534', '硬件维护');
INSERT INTO `roles` VALUES ('34', '岗位', '293113869', '561940352', '项目监督组');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `supplier_type` varchar(8) DEFAULT NULL COMMENT '供应商类型见数据字典',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('3', 'fh001', '飞鹤建材', '01');
INSERT INTO `supplier` VALUES ('4', '0001', '配特斯', '03');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '上级类型Id',
  `code` varchar(64) DEFAULT NULL COMMENT '对照码',
  `value` varchar(8) DEFAULT NULL COMMENT '对照值',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='sys字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '', 'department_type', '', '部门类型');
INSERT INTO `sys_dict_type` VALUES ('2', '1', 'fscgc', '1', '工厂');
INSERT INTO `sys_dict_type` VALUES ('4', '1', 'sccj', '2', '车间');
INSERT INTO `sys_dict_type` VALUES ('5', '1', 'cx', '3', '产线');
INSERT INTO `sys_dict_type` VALUES ('6', '1', 'bz', '4', '班组');
INSERT INTO `sys_dict_type` VALUES ('7', '', 'supplier_type', null, '供应商类型');
INSERT INTO `sys_dict_type` VALUES ('8', '7', 'ljgys', '01', '零件提供商');
INSERT INTO `sys_dict_type` VALUES ('9', '7', 'pjgys', '02', '配件提供商');
INSERT INTO `sys_dict_type` VALUES ('10', '7', 'wxjjg', '03', '外协件加工');
INSERT INTO `sys_dict_type` VALUES ('11', '', 'resource_type', '', '资源类型');
INSERT INTO `sys_dict_type` VALUES ('12', '11', 'sb', '1', '设备');
INSERT INTO `sys_dict_type` VALUES ('13', '11', 'bm', '2', '部门');
INSERT INTO `sys_dict_type` VALUES ('14', '11', 'ry', '3', '人员');
INSERT INTO `sys_dict_type` VALUES ('15', '19', 'xfkh', '1', '消费客户');
INSERT INTO `sys_dict_type` VALUES ('16', '19', null, '2', 'B2B客户');
INSERT INTO `sys_dict_type` VALUES ('17', '19', null, '3', '渠道分销商');
INSERT INTO `sys_dict_type` VALUES ('18', '19', null, '4', '内部客户');
INSERT INTO `sys_dict_type` VALUES ('19', null, 'custom_type', null, '客户类型');
INSERT INTO `sys_dict_type` VALUES ('20', '1', 'gs', '0', '公司');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `account` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `team_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT 'teamId',
  `team_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '组织名称',
  `tel` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `last_login_time` varchar(25) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '最后登录ip',
  `online_flag` tinyint(1) DEFAULT NULL COMMENT '在线标志',
  `lock_flag` tinyint(1) DEFAULT NULL COMMENT '锁定标志',
  `wechat_nickname` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信昵称',
  `wechat_unionid` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信唯一识别号',
  `remark` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('3a2ec3db2d7147a8a011294f134615a7', '周', 'zhou2182', '$2a$10$Paut5lbtfBSK.9oMNr9AXOAkEX.D7CT3siOaJakhP90mzdI83CE/a', 'e48b5bff891046e6939254b4cd289fbb', '潍坊正瑞新能源科技有限公司', '13505362182', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('44139fa30bb446a28ed0a8058b946d4b', '张大永', 'zhang7778', '$2a$10$jI04.0Ld5FhSBW2UyDm2jeW2ZDqB2S.sGImDO5yh01mPRsA2dxEjS', '0dec4b6fc59944dc9bb0ee84e8f92d0a', '临朐鲁隆金属制品有限公司', '15095207778', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('4b7017d0bb3746f1aaefe133323c28cf', '于之河', 'yu3056', '$2a$10$0XbiWwQHnOZfkoLu7HLIfu.hgBa1c5C0o6xaiZVKgBAYQSBFhcHJm', '404e594141a34e9f99b166d2b406665b', '潍坊经济开发区瑞昊电气焊加工处', '15966123056', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('5066de3cba224cdf94aafe901e84ac53', '王刚', 'wang9360', '$2a$10$LTtkWRu64cr3LH6/J1r/duMEZZ7dIB3pTSh5t9wULg7mufPVvOXwe', 'edd45056909c4a1a92e63645f9a79be1', '山东妹彩装饰工程有限公司', '15853639360', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('58259e77beb549d097edee16859f991f', '测试人员', '1', '$2a$10$TBAvIvjnB8uYIkY6I8knI./ETq6B36EoYtiy4R8po2hsUpX.fM0dO', '0dec4b6fc59944dc9bb0ee84e8f92d0a', '临朐鲁隆金属制品有限公司', '15095207778', 'test@163.com', '2019-10-06 07:49:55', '122.4.203.213', '1', '0', null, null, '');
INSERT INTO `sys_users` VALUES ('7065496a5f404e74bf5169a2c5604871', '张建磊', 'zhang3777', '$2a$10$iqEq4HgiM0gwgataBRdETe/FN52bsKARRvKkhpqJcRjXrunf06wrW', '9f075847769449c6b875f5a6db223a32', '山东元坤机械科技有限公司', '15163663777', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('b043d9c2ab7a48ca8afb42901384165c', '魏德胜', 'wei1678', '$2a$10$pDxVRriG/yH3pshxjMKBouxLBXYKczt236jTesFcYfUnFUH0dEBJu', '81d61e6ce7ac489bbcd75284ee952f08', '潍坊世纪联恒汽车服务有限公司', '13011671678', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('b27182e53c514ee99a3d0ead52f8dad6', '张兆国', 'zhang2688', '$2a$10$pdhkynZS/odgZhtTdetqZu2XQUp6UrFzEoVG7SyY51sEkxBY.RzFy', 'a11a7fd0a2624f3b87acfd1388bcef0d', '奎文区梨园嘉达机械设备维修中心', '15269662688', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('baad5ecd36b841cd95530cd2963ad0aa', '11', '1111', '$2a$10$nAzsTyaJ.jRDcKKjYQn8IucDbholPcZKg1jrvPv.GR3GIHhP/BYMu', '', '', '', '', null, null, null, '0', null, null, '');
INSERT INTO `sys_users` VALUES ('cfd9d47525304e9ab766a1cca64f7e20', '郝胜元', 'hao9772', '$2a$10$R/unHG1OmHYQrGhQUQsk9.T4EGw2AYnlKLoVmNrI4k1vVcQ99giMS', '87fe6462a3cd4b07bd2da7168dd6f027', '潍坊斑斓装饰工程有限公司', '15265619772', '', '2019-07-03 16:46:17', '0:0:0:0:0:0:0:1', '1', null, null, null, '');
INSERT INTO `sys_users` VALUES ('d1471bbeb4ad4662ab89b31df9247269', '贾伟', 'jia8886', '$2a$10$GckLnAwLHDvGAfKeBTkf5uvSGC1YXaCZU9Cszn44EHh3r8tSMaC5C', '13c8d2ba7fba4c5cb57de51d9fe63f6d', '潍坊康捷汽车服务有限公司', '15762548886', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('e426d273c95941a6944b9267e2161373', '44435634', '34634', '$2a$10$CLTrH3ajSWqfRgsFEiUvbe.bIrGa1SVlj/ASP5meZJ/yogLb2TJ86', '', '', '', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('f2187e2f81d94d69b703d30428952c18', '高春生', 'gao5603', '$2a$10$8SHD2mGoSVFIY.JGZBjwo.gOum3fU1eTUk5vnganz3opQPeoSs3/O', 'aae54c7ac7c14e87873601b0bb9346d0', '潍城区于河百荣机械加工厂', '13176725603', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('fedbf793fac044deb425f82759cef43b', '姜玉杰', 'jiang1885', '$2a$10$Qfy7vr4Cx3LLAWmPafPikO1jiaJbi0UW0N7idkXjNm3ncQsXanbFe', 'e9545b0941d144c3af65be61d4ef203f', '潍坊益坤机械有限公司', '13869681885', '', null, null, null, null, null, null, '');
INSERT INTO `sys_users` VALUES ('rd', 'rd', 'rd', '$2a$10$/jWI7f4kv.gCjKfQGCluJujV/M5O3wt43zu0soLT08.lzMHlHwWz6', null, null, null, null, '2019-08-05 09:36:12', '122.4.203.213', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sys_users1
-- ----------------------------
DROP TABLE IF EXISTS `sys_users1`;
CREATE TABLE `sys_users1` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(250) DEFAULT NULL COMMENT '密码',
  `team_id` varchar(32) DEFAULT NULL COMMENT 'teamId',
  `team_name` varchar(50) DEFAULT NULL COMMENT '组织名称',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `last_login_time` varchar(25) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录ip',
  `online_flag` tinyint(1) DEFAULT NULL COMMENT '在线标志',
  `lock_flag` tinyint(1) DEFAULT NULL COMMENT '锁定标志',
  `wechat_nickname` varchar(50) DEFAULT NULL COMMENT '微信昵称',
  `wechat_unionid` varchar(50) DEFAULT NULL COMMENT '微信唯一识别号',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `remark1` decimal(32,1) DEFAULT NULL COMMENT '设计经验',
  `remark2` varchar(32) DEFAULT NULL COMMENT '年龄',
  `remark3` varchar(255) DEFAULT NULL COMMENT '设计作品',
  `remark4` varchar(255) DEFAULT NULL COMMENT '个人评价',
  `remark5` varchar(255) DEFAULT NULL COMMENT '角色判断',
  `remark6` varchar(255) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sys_users1
-- ----------------------------
INSERT INTO `sys_users1` VALUES ('505', '侯晓林', '172', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总经办', null, null, '172');
INSERT INTO `sys_users1` VALUES ('506', '李成', '643', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '643');
INSERT INTO `sys_users1` VALUES ('507', '魏勇田', '554', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '规划部', null, null, '554');
INSERT INTO `sys_users1` VALUES ('508', '刘洪靖', '332', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '332');
INSERT INTO `sys_users1` VALUES ('509', '陈京涛', '214', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务部', null, null, '214');
INSERT INTO `sys_users1` VALUES ('510', '潘清溪', '489', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '489');
INSERT INTO `sys_users1` VALUES ('511', '梁学增', '739', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '739');
INSERT INTO `sys_users1` VALUES ('512', '张磊', '607', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '个人销售组', null, null, '607');
INSERT INTO `sys_users1` VALUES ('513', '周明刚', '149', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '推广运营部', null, null, '149');
INSERT INTO `sys_users1` VALUES ('514', '张学杰', '342', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '342');
INSERT INTO `sys_users1` VALUES ('515', '刘文龙', '074', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '074');
INSERT INTO `sys_users1` VALUES ('516', '丁建升', '341', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '341');
INSERT INTO `sys_users1` VALUES ('517', '郑召彦', '040', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品工艺部', null, null, '040');
INSERT INTO `sys_users1` VALUES ('518', '赵静伟', '027', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '物流组', null, null, '027');
INSERT INTO `sys_users1` VALUES ('519', '孙海宁', '634', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'PMC管理中心', null, null, '634');
INSERT INTO `sys_users1` VALUES ('520', '王帅', '505', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内务部', null, null, '505');
INSERT INTO `sys_users1` VALUES ('521', '樊兆玺', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, null);
INSERT INTO `sys_users1` VALUES ('522', '孙辉', '019', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '019');
INSERT INTO `sys_users1` VALUES ('523', '卢文建', '189', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '189');
INSERT INTO `sys_users1` VALUES ('524', '杨志达', '064', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业二部', null, null, '064');
INSERT INTO `sys_users1` VALUES ('525', '李晓蕾', '520', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品牌策划部', null, null, '520');
INSERT INTO `sys_users1` VALUES ('526', '冯清泉', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, null);
INSERT INTO `sys_users1` VALUES ('527', '刘建宝', '652', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '开发二部', null, null, '652');
INSERT INTO `sys_users1` VALUES ('528', '张立基', '166', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '166');
INSERT INTO `sys_users1` VALUES ('529', '张纹君', '689', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '689');
INSERT INTO `sys_users1` VALUES ('530', '刘顺军', '067', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '供应链管理中心', null, null, '067');
INSERT INTO `sys_users1` VALUES ('531', '范英明', '632', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业一部', null, null, '632');
INSERT INTO `sys_users1` VALUES ('532', '于佳鹏', '752', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '752');
INSERT INTO `sys_users1` VALUES ('533', '潘江涛', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('534', '刘文林', '068', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '制造技术与自动化中心', null, null, '068');
INSERT INTO `sys_users1` VALUES ('535', '李静', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '弘业金驰', null, null, null);
INSERT INTO `sys_users1` VALUES ('536', '潘玉光', '674', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '674');
INSERT INTO `sys_users1` VALUES ('537', '张帅', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '亮化事业部', null, null, null);
INSERT INTO `sys_users1` VALUES ('538', '徐军委', '763', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '763');
INSERT INTO `sys_users1` VALUES ('539', '房中元', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('540', '李楠楠', '714', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '个人销售组', null, null, '714');
INSERT INTO `sys_users1` VALUES ('541', '庞发祥', '626', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '626');
INSERT INTO `sys_users1` VALUES ('542', '闫振敏', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('543', '曾繁斌', '680', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '680');
INSERT INTO `sys_users1` VALUES ('544', '李文君', '001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '001');
INSERT INTO `sys_users1` VALUES ('545', '刘长霞', '159', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '供应链管理中心', null, null, '159');
INSERT INTO `sys_users1` VALUES ('546', '李姝婷', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业二部', null, null, null);
INSERT INTO `sys_users1` VALUES ('547', '韩淑斌', '705', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '规划部', null, null, '705');
INSERT INTO `sys_users1` VALUES ('548', '于政帅', '456', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '456');
INSERT INTO `sys_users1` VALUES ('549', '陈新建', '062', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '062');
INSERT INTO `sys_users1` VALUES ('550', '王冰', '596', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '质量管理中心', null, null, '596');
INSERT INTO `sys_users1` VALUES ('551', '任伟波', '021', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业一部', null, null, '021');
INSERT INTO `sys_users1` VALUES ('552', '李世强', '002', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务中心', null, null, '002');
INSERT INTO `sys_users1` VALUES ('553', '窦成', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '艾加事业部', null, null, '');
INSERT INTO `sys_users1` VALUES ('554', '田德明', '049', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '华中、华南', null, null, '049');
INSERT INTO `sys_users1` VALUES ('555', '王通', '061', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '东北、华北', null, null, '061');
INSERT INTO `sys_users1` VALUES ('556', '王磊', '069', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '西南、西北', null, null, '069');
INSERT INTO `sys_users1` VALUES ('557', '何卓', '077', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '推广运营部', null, null, '077');
INSERT INTO `sys_users1` VALUES ('558', '赵欢', '078', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '客户服务部', null, null, '078');
INSERT INTO `sys_users1` VALUES ('559', '麻玉珍', '098', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '个人销售组', null, null, '098');
INSERT INTO `sys_users1` VALUES ('560', '王保华', '014', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '成品仓库', null, null, '014');
INSERT INTO `sys_users1` VALUES ('561', '徐珊', '011', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '011');
INSERT INTO `sys_users1` VALUES ('562', '臧继超', '629', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '个人销售组', null, null, '629');
INSERT INTO `sys_users1` VALUES ('563', '田永法', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('564', '于芳明', '089', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '089');
INSERT INTO `sys_users1` VALUES ('565', '付聪', '148', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总经办', null, null, '148');
INSERT INTO `sys_users1` VALUES ('566', '康玉强', '071', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '国际业务部', null, null, '071');
INSERT INTO `sys_users1` VALUES ('567', '曹晓波', '120', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '120');
INSERT INTO `sys_users1` VALUES ('568', '张琳', '748', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品工艺部', null, null, '748');
INSERT INTO `sys_users1` VALUES ('569', '于潍莒', '117', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, '117');
INSERT INTO `sys_users1` VALUES ('570', '申洪常', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '规划部', null, null, null);
INSERT INTO `sys_users1` VALUES ('571', '李志超', '441', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '研发项目中心', null, null, '441');
INSERT INTO `sys_users1` VALUES ('572', '李志刚', '753', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '753');
INSERT INTO `sys_users1` VALUES ('573', '王宇', '563', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '563');
INSERT INTO `sys_users1` VALUES ('574', '李秀霞', '410', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'PMC管理中心', null, null, '410');
INSERT INTO `sys_users1` VALUES ('575', '方俊国', '765', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '765');
INSERT INTO `sys_users1` VALUES ('576', '李洪港', '541', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '541');
INSERT INTO `sys_users1` VALUES ('577', '丁艳', '020', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务部', null, null, '020');
INSERT INTO `sys_users1` VALUES ('578', '刘国辉', '640', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '开发一部', null, null, '640');
INSERT INTO `sys_users1` VALUES ('579', '张敬涛', '431', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '431');
INSERT INTO `sys_users1` VALUES ('580', '刘继伟', '104', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '104');
INSERT INTO `sys_users1` VALUES ('581', '毕立鹏', '649', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单二组', null, null, '649');
INSERT INTO `sys_users1` VALUES ('582', '李国强', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '弘业金驰', null, null, null);
INSERT INTO `sys_users1` VALUES ('583', '杨信良', '803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '803');
INSERT INTO `sys_users1` VALUES ('584', '宋永浩', '287', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '287');
INSERT INTO `sys_users1` VALUES ('585', '张春香', '812', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '812');
INSERT INTO `sys_users1` VALUES ('586', '王永成', '331', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '规划部', null, null, '331');
INSERT INTO `sys_users1` VALUES ('587', '赵正义', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, null);
INSERT INTO `sys_users1` VALUES ('588', '李凤强', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('589', '杨萍', '496', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品牌策划部', null, null, '496');
INSERT INTO `sys_users1` VALUES ('590', '罗扬', '147', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '推广运营部', null, null, '147');
INSERT INTO `sys_users1` VALUES ('591', '陈德才', '662', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '662');
INSERT INTO `sys_users1` VALUES ('592', '卞璐', '100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '后勤服务部', null, null, '100');
INSERT INTO `sys_users1` VALUES ('593', '李香琳', '091', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '售后服务部', null, null, '091');
INSERT INTO `sys_users1` VALUES ('594', '权少威', '387', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '生产制造中心', null, null, '387');
INSERT INTO `sys_users1` VALUES ('595', '刘耀宗', '754', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '研发项目中心', null, null, '754');
INSERT INTO `sys_users1` VALUES ('596', '陶华萍', '619', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业二部', null, null, '619');
INSERT INTO `sys_users1` VALUES ('597', '尹晓光', '637', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业二部', null, null, '637');
INSERT INTO `sys_users1` VALUES ('598', '杜崇旭', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '成品库', null, null, null);
INSERT INTO `sys_users1` VALUES ('599', '王国帅', '052', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '052');
INSERT INTO `sys_users1` VALUES ('600', '王清', '065', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内勤支持组', null, null, '065');
INSERT INTO `sys_users1` VALUES ('601', '庄敬轩', '622', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '622');
INSERT INTO `sys_users1` VALUES ('602', '宋丽君', '313', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '东北、华北', null, null, '313');
INSERT INTO `sys_users1` VALUES ('603', '徐延坤', '259', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'PMC管理中心', null, null, '259');
INSERT INTO `sys_users1` VALUES ('604', '吕杨', '664', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '组织中心', null, null, '664');
INSERT INTO `sys_users1` VALUES ('605', '郭艳雪', '111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '111');
INSERT INTO `sys_users1` VALUES ('606', '孙明圆', '125', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '研发项目中心', null, null, '125');
INSERT INTO `sys_users1` VALUES ('607', '张俊乾', '330', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'PMC管理中心', null, null, '330');
INSERT INTO `sys_users1` VALUES ('608', '李忠伟', '630', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品牌策划部', null, null, '630');
INSERT INTO `sys_users1` VALUES ('609', '刘文彩', '672', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '组织中心', null, null, '672');
INSERT INTO `sys_users1` VALUES ('610', '窦志强', '101', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '涂装设计部', null, null, '101');
INSERT INTO `sys_users1` VALUES ('611', '姜海洋', '291', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '返修班组', null, null, '291');
INSERT INTO `sys_users1` VALUES ('612', '胡廷青', '084', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '084');
INSERT INTO `sys_users1` VALUES ('613', '庞景业', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, null);
INSERT INTO `sys_users1` VALUES ('614', '宋以强', '343', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '343');
INSERT INTO `sys_users1` VALUES ('615', '王友梅', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, null);
INSERT INTO `sys_users1` VALUES ('616', '王方', '617', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '个人销售组', null, null, '617');
INSERT INTO `sys_users1` VALUES ('617', '聂锐', '421', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '421');
INSERT INTO `sys_users1` VALUES ('618', '梁迎娣', '777', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '777');
INSERT INTO `sys_users1` VALUES ('619', '吴志林', '759', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '759');
INSERT INTO `sys_users1` VALUES ('620', '刘婷婷', '042', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务部', null, null, '042');
INSERT INTO `sys_users1` VALUES ('621', '于津健', '238', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '返修班组', null, null, '238');
INSERT INTO `sys_users1` VALUES ('622', '王桂清', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('623', '唐发国', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('624', '王玉平', '041', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '041');
INSERT INTO `sys_users1` VALUES ('625', '陈维修', '081', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '081');
INSERT INTO `sys_users1` VALUES ('626', '栾小飞', '231', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '涂装设计部', null, null, '231');
INSERT INTO `sys_users1` VALUES ('627', '王丽娟', '026', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '稽查部', null, null, '026');
INSERT INTO `sys_users1` VALUES ('628', '杨晓强', '760', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '760');
INSERT INTO `sys_users1` VALUES ('629', '朱维亚', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('630', '孙红熙', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, null);
INSERT INTO `sys_users1` VALUES ('631', '马洪会', '102', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '供应链管理中心', null, null, '102');
INSERT INTO `sys_users1` VALUES ('632', '张述强', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, null);
INSERT INTO `sys_users1` VALUES ('633', '张春明', '737', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '737');
INSERT INTO `sys_users1` VALUES ('634', '杨明军', '683', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '683');
INSERT INTO `sys_users1` VALUES ('635', '刘永斌', '695', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '695');
INSERT INTO `sys_users1` VALUES ('636', '张小兵', '188', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '生产部', null, null, '188');
INSERT INTO `sys_users1` VALUES ('637', '刘春龙', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('638', '周亮', '141', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '市场推广部', null, null, '141');
INSERT INTO `sys_users1` VALUES ('639', '程凡美', '106', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '106');
INSERT INTO `sys_users1` VALUES ('640', '吕宝德', '741', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '实施运维部', null, null, '741');
INSERT INTO `sys_users1` VALUES ('641', '孙垂强', '455', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '455');
INSERT INTO `sys_users1` VALUES ('642', '魏久涛', '375', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '375');
INSERT INTO `sys_users1` VALUES ('643', '赵强', '144', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '144');
INSERT INTO `sys_users1` VALUES ('644', '郭风东', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, null);
INSERT INTO `sys_users1` VALUES ('645', '聂法强', '374', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '374');
INSERT INTO `sys_users1` VALUES ('646', '王守全', '353', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '353');
INSERT INTO `sys_users1` VALUES ('647', '马信信', '034', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '涂装设计部', null, null, '034');
INSERT INTO `sys_users1` VALUES ('648', '王清慧', '145', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '生产部', null, null, '145');
INSERT INTO `sys_users1` VALUES ('649', '辛宏发', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('650', '陈晓凯', '308', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '推广运营部', null, null, '308');
INSERT INTO `sys_users1` VALUES ('651', '赵新波', '047', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '047');
INSERT INTO `sys_users1` VALUES ('652', '罗敖', '592', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '涂装设计部', null, null, '592');
INSERT INTO `sys_users1` VALUES ('653', '牛家圣', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '物流组', null, null, null);
INSERT INTO `sys_users1` VALUES ('654', '辛建康', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单二组', null, null, '123');
INSERT INTO `sys_users1` VALUES ('655', '于浦之', '422', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '422');
INSERT INTO `sys_users1` VALUES ('656', '娄树森', '635', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '635');
INSERT INTO `sys_users1` VALUES ('657', '张荣荣', '043', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务部', null, null, '043');
INSERT INTO `sys_users1` VALUES ('658', '王洪坤', '586', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '586');
INSERT INTO `sys_users1` VALUES ('659', '郑洁', '155', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业一部', null, null, '155');
INSERT INTO `sys_users1` VALUES ('660', '李文佳', '007', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '供应链管理中心', null, null, '007');
INSERT INTO `sys_users1` VALUES ('661', '高军燕', '023', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务部', null, null, '023');
INSERT INTO `sys_users1` VALUES ('662', '蔡玉林', '173', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '华中、华南', null, null, '173');
INSERT INTO `sys_users1` VALUES ('663', '张延洲', '057', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '涂装设计部', null, null, '057');
INSERT INTO `sys_users1` VALUES ('664', '徐吉庆', '072', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业一部', null, null, '072');
INSERT INTO `sys_users1` VALUES ('665', '唐洪洋', '181', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '华中、华南', null, null, '181');
INSERT INTO `sys_users1` VALUES ('666', '赵威', '164', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '西南、西北', null, null, '164');
INSERT INTO `sys_users1` VALUES ('667', '谭志明', '054', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '返修班组', null, null, '054');
INSERT INTO `sys_users1` VALUES ('668', '王振彪', '193', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '个人销售组', null, null, '193');
INSERT INTO `sys_users1` VALUES ('669', '姜心跃', '167', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '个人销售组', null, null, '167');
INSERT INTO `sys_users1` VALUES ('670', '历园媛', '090', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '客户服务部', null, null, '090');
INSERT INTO `sys_users1` VALUES ('671', '郭涛', '140', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '140');
INSERT INTO `sys_users1` VALUES ('672', '孙传科', '143', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '实施运维部', null, null, '143');
INSERT INTO `sys_users1` VALUES ('673', '李志斌', '647', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总经办', null, null, '647');
INSERT INTO `sys_users1` VALUES ('674', '孙著杰', '694', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '开发一部', null, null, '694');
INSERT INTO `sys_users1` VALUES ('675', '谢振君', '038', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '后勤服务部', null, null, '038');
INSERT INTO `sys_users1` VALUES ('676', '窦金艳', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '成品库', null, null, null);
INSERT INTO `sys_users1` VALUES ('677', '袁微微', '150', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内勤支持组', null, null, '150');
INSERT INTO `sys_users1` VALUES ('678', '隋爽', '138', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '稽查部', null, null, '138');
INSERT INTO `sys_users1` VALUES ('679', '刘文韬', '198', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '198');
INSERT INTO `sys_users1` VALUES ('680', '邓晓燕', '205', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内勤支持组', null, null, '205');
INSERT INTO `sys_users1` VALUES ('681', '马风晓', '213', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内勤支持组', null, null, '213');
INSERT INTO `sys_users1` VALUES ('682', '刘美玲', '058', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '后勤服务部', null, null, '058');
INSERT INTO `sys_users1` VALUES ('683', '于小飞', '045', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '生产部', null, null, '045');
INSERT INTO `sys_users1` VALUES ('684', '刘江', '161', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业三部', null, null, '161');
INSERT INTO `sys_users1` VALUES ('685', '张超', '154', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '华东', null, null, '154');
INSERT INTO `sys_users1` VALUES ('686', '陈洁', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '销售', null, null, null);
INSERT INTO `sys_users1` VALUES ('687', '宋春伟', '650', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '650');
INSERT INTO `sys_users1` VALUES ('688', '付兴磊', '269', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, '269');
INSERT INTO `sys_users1` VALUES ('689', '张召仕', '239', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '自动化部', null, null, '239');
INSERT INTO `sys_users1` VALUES ('690', '赵镇财', '764', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '764');
INSERT INTO `sys_users1` VALUES ('691', '栾其军', '360', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '360');
INSERT INTO `sys_users1` VALUES ('692', '梁波', '250', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品牌策划部', null, null, '250');
INSERT INTO `sys_users1` VALUES ('693', '唐在良', '403', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '推广运营部', null, null, '403');
INSERT INTO `sys_users1` VALUES ('694', '苑承芳', '165', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '165');
INSERT INTO `sys_users1` VALUES ('695', '季娜娜', '527', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '供应链管理中心', null, null, '527');
INSERT INTO `sys_users1` VALUES ('696', '刘建亮', '051', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '返修班组', null, null, '051');
INSERT INTO `sys_users1` VALUES ('697', '刘宝强', '056', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, '056');
INSERT INTO `sys_users1` VALUES ('698', '雷怡', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '系统软件开发部', null, null, null);
INSERT INTO `sys_users1` VALUES ('699', '刘玉琪', '327', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '327');
INSERT INTO `sys_users1` VALUES ('700', '高现章', '055', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品工艺部', null, null, '055');
INSERT INTO `sys_users1` VALUES ('701', '王海龙', '086', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '086');
INSERT INTO `sys_users1` VALUES ('702', '崔泽超', '492', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '华东', null, null, '492');
INSERT INTO `sys_users1` VALUES ('703', '梁连生', '022', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '返修班组', null, null, '022');
INSERT INTO `sys_users1` VALUES ('704', '郭宝新', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('705', '朱建乙', '585', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '585');
INSERT INTO `sys_users1` VALUES ('706', '张立江', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('707', '赵福才', '105', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '105');
INSERT INTO `sys_users1` VALUES ('708', '韩伟', '085', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '085');
INSERT INTO `sys_users1` VALUES ('709', '徐朋', '241', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '241');
INSERT INTO `sys_users1` VALUES ('710', '李成光', '050', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '050');
INSERT INTO `sys_users1` VALUES ('711', '于会洪', '246', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '246');
INSERT INTO `sys_users1` VALUES ('712', '李文久', '093', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '093');
INSERT INTO `sys_users1` VALUES ('713', '张志鹏', '333', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '333');
INSERT INTO `sys_users1` VALUES ('714', '陈梦杰', '192', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '192');
INSERT INTO `sys_users1` VALUES ('715', '刘建', '115', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '115');
INSERT INTO `sys_users1` VALUES ('716', '胡晓宁', '163', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '163');
INSERT INTO `sys_users1` VALUES ('717', '华明琦', '363', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '363');
INSERT INTO `sys_users1` VALUES ('718', '张成强', '131', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '131');
INSERT INTO `sys_users1` VALUES ('719', '韩小滨', '129', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '129');
INSERT INTO `sys_users1` VALUES ('720', '王义东', '384', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '384');
INSERT INTO `sys_users1` VALUES ('721', '程秀君', '391', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '391');
INSERT INTO `sys_users1` VALUES ('722', '杨清明', '130', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '130');
INSERT INTO `sys_users1` VALUES ('723', '姚学征', '113', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '113');
INSERT INTO `sys_users1` VALUES ('724', '刘福国', '349', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '349');
INSERT INTO `sys_users1` VALUES ('725', '陈成久', '128', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '128');
INSERT INTO `sys_users1` VALUES ('726', '鞠友亮', '344', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '344');
INSERT INTO `sys_users1` VALUES ('727', '彭焕成', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, null);
INSERT INTO `sys_users1` VALUES ('728', '孙东东', '203', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '203');
INSERT INTO `sys_users1` VALUES ('729', '孙嘉辰', '371', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '371');
INSERT INTO `sys_users1` VALUES ('730', '岳亮', '076', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '底盘', null, null, '076');
INSERT INTO `sys_users1` VALUES ('731', '于洋洋', '082', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '082');
INSERT INTO `sys_users1` VALUES ('732', '马相广', '046', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '046');
INSERT INTO `sys_users1` VALUES ('733', '管兆江', '340', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '340');
INSERT INTO `sys_users1` VALUES ('734', '赵政', '201', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, '201');
INSERT INTO `sys_users1` VALUES ('735', '陈安本', '053', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '053');
INSERT INTO `sys_users1` VALUES ('736', '郭兰玉', '322', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '后勤服务部', null, null, '322');
INSERT INTO `sys_users1` VALUES ('737', '魏金峰', '116', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '116');
INSERT INTO `sys_users1` VALUES ('738', '牟雪梅', '409', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '国际业务部', null, null, '409');
INSERT INTO `sys_users1` VALUES ('739', '沈安乐', '293', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '293');
INSERT INTO `sys_users1` VALUES ('740', '于佳蜜', '417', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务部', null, null, '417');
INSERT INTO `sys_users1` VALUES ('741', '庞立军', '418', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '418');
INSERT INTO `sys_users1` VALUES ('742', '刘江波', '059', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '059');
INSERT INTO `sys_users1` VALUES ('743', '邹毅勇', '094', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '094');
INSERT INTO `sys_users1` VALUES ('744', '宋炜', '248', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '248');
INSERT INTO `sys_users1` VALUES ('745', '宋文革', '083', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '083');
INSERT INTO `sys_users1` VALUES ('746', '张振东', '063', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '063');
INSERT INTO `sys_users1` VALUES ('747', '刘祥琳', '763', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '763');
INSERT INTO `sys_users1` VALUES ('748', '谢术涛', '112', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '112');
INSERT INTO `sys_users1` VALUES ('749', '王丽欣', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '推广运营部', null, null, null);
INSERT INTO `sys_users1` VALUES ('750', '朱晓雪', '561', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内勤支持组', null, null, '561');
INSERT INTO `sys_users1` VALUES ('751', '于伟永', '300', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '300');
INSERT INTO `sys_users1` VALUES ('752', '刘学鹏', '108', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '108');
INSERT INTO `sys_users1` VALUES ('753', '武聪军', '434', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '434');
INSERT INTO `sys_users1` VALUES ('754', '杨锁莲', '436', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '436');
INSERT INTO `sys_users1` VALUES ('755', '邱宏祥', '437', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, '437');
INSERT INTO `sys_users1` VALUES ('756', '秦志勇', '439', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '439');
INSERT INTO `sys_users1` VALUES ('757', '曹振兴', '685', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '开发二部', null, null, '685');
INSERT INTO `sys_users1` VALUES ('758', '张媛', '547', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '客户服务部', null, null, '547');
INSERT INTO `sys_users1` VALUES ('759', '雷大卫', '478', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '478');
INSERT INTO `sys_users1` VALUES ('760', '于强强', '716', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '716');
INSERT INTO `sys_users1` VALUES ('761', '武继洋', '486', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '开发一部', null, null, '486');
INSERT INTO `sys_users1` VALUES ('762', '陈会鑫', '801', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '801');
INSERT INTO `sys_users1` VALUES ('763', '李言美', '481', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内勤支持组', null, null, '481');
INSERT INTO `sys_users1` VALUES ('764', '李福吉', '482', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业二部', null, null, '482');
INSERT INTO `sys_users1` VALUES ('765', '隋晟辉', '736', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '736');
INSERT INTO `sys_users1` VALUES ('766', '杨政慧', '488', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '客户服务部', null, null, '488');
INSERT INTO `sys_users1` VALUES ('767', '丁凯', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, null);
INSERT INTO `sys_users1` VALUES ('768', '耿灿顺', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('769', '张复祥', '499', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '499');
INSERT INTO `sys_users1` VALUES ('770', '李记龙', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('771', '林全慧', '506', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内务部', null, null, '506');
INSERT INTO `sys_users1` VALUES ('772', '郭升', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('773', '吴娟', '508', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '508');
INSERT INTO `sys_users1` VALUES ('774', '李志杰', '287', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '287');
INSERT INTO `sys_users1` VALUES ('775', '李冬雪', '516', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '华东', null, null, '516');
INSERT INTO `sys_users1` VALUES ('776', '徐晓禹', '519', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '自动化部', null, null, '519');
INSERT INTO `sys_users1` VALUES ('777', '高小军', '522', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '522');
INSERT INTO `sys_users1` VALUES ('778', '李凯阳', '524', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '自动化部', null, null, '524');
INSERT INTO `sys_users1` VALUES ('779', '卢福军', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('780', '李欣欣', '542', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '研发项目中心', null, null, '542');
INSERT INTO `sys_users1` VALUES ('781', '李常见', '543', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '国际业务部', null, null, '543');
INSERT INTO `sys_users1` VALUES ('782', '弓燕军', '588', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '自动化部', null, null, '588');
INSERT INTO `sys_users1` VALUES ('783', '唐先磊', '545', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '545');
INSERT INTO `sys_users1` VALUES ('784', '李训刚', '611', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品牌策划部', null, null, '611');
INSERT INTO `sys_users1` VALUES ('785', '李军升', '731', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '731');
INSERT INTO `sys_users1` VALUES ('786', '刘长海', '671', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '671');
INSERT INTO `sys_users1` VALUES ('787', '付欣欣', '656', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '后勤服务部', null, null, '656');
INSERT INTO `sys_users1` VALUES ('788', '类凯文', '743', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '实施运维部', null, null, '743');
INSERT INTO `sys_users1` VALUES ('789', '王臻臻', '185', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '客户服务部', null, null, '185');
INSERT INTO `sys_users1` VALUES ('790', '蒋东方', '558', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '558');
INSERT INTO `sys_users1` VALUES ('791', '鞠鹏', '557', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '557');
INSERT INTO `sys_users1` VALUES ('792', '张焕暄', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '自动化部', null, null, null);
INSERT INTO `sys_users1` VALUES ('793', '白存任', '565', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '565');
INSERT INTO `sys_users1` VALUES ('794', '武春晓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('795', '陈起峰', '569', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '569');
INSERT INTO `sys_users1` VALUES ('796', '秦国文', '676', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '676');
INSERT INTO `sys_users1` VALUES ('797', '朱高明', '589', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '589');
INSERT INTO `sys_users1` VALUES ('798', '陈景亮', '687', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品质管理部', null, null, '687');
INSERT INTO `sys_users1` VALUES ('799', '刘灵燕', '698', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '国际业务部', null, null, '698');
INSERT INTO `sys_users1` VALUES ('800', '王寿兴', '603', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '603');
INSERT INTO `sys_users1` VALUES ('801', '王莉媛', '605', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '财务部', null, null, '605');
INSERT INTO `sys_users1` VALUES ('802', '徐海彬', '608', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '内勤支持组', null, null, '608');
INSERT INTO `sys_users1` VALUES ('803', '高金朋', '703', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '703');
INSERT INTO `sys_users1` VALUES ('804', '李鑫', '615', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '615');
INSERT INTO `sys_users1` VALUES ('805', '朱君仰', '746', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '746');
INSERT INTO `sys_users1` VALUES ('806', '张开源', '641', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品牌策划部', null, null, '641');
INSERT INTO `sys_users1` VALUES ('807', '高恩', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('808', '张孝芳', '474', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '后勤服务部', null, null, '474');
INSERT INTO `sys_users1` VALUES ('809', '杨洪志', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('810', '鞠阳', '727', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '727');
INSERT INTO `sys_users1` VALUES ('811', '贾玉华', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('812', '于鹏飞', '639', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '安环部', null, null, '639');
INSERT INTO `sys_users1` VALUES ('813', '杨继伟', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('814', '张美丽', '690', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, '690');
INSERT INTO `sys_users1` VALUES ('815', '李率', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('816', '周瑶瑶', '665', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '品牌策划部', null, null, '665');
INSERT INTO `sys_users1` VALUES ('817', '杨军', '298', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单二组', null, null, '298');
INSERT INTO `sys_users1` VALUES ('818', '解世礼', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('819', '刘宗波', '727', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '727');
INSERT INTO `sys_users1` VALUES ('820', '宫垒', '701', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, '701');
INSERT INTO `sys_users1` VALUES ('821', '常明香', '691', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '原料仓库', null, null, '691');
INSERT INTO `sys_users1` VALUES ('822', '崔宁', '742', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '实施运维部', null, null, '742');
INSERT INTO `sys_users1` VALUES ('823', '张复庆', '708', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '708');
INSERT INTO `sys_users1` VALUES ('824', '张述辉', '745', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '745');
INSERT INTO `sys_users1` VALUES ('825', '李丕花', '709', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '709');
INSERT INTO `sys_users1` VALUES ('826', '孙建平', '712', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, '712');
INSERT INTO `sys_users1` VALUES ('827', '刘英', '713', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'PMC管理中心', null, null, '713');
INSERT INTO `sys_users1` VALUES ('828', '李义刚', '738', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '738');
INSERT INTO `sys_users1` VALUES ('829', '高秀霞', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('830', '泮广林', '715', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '715');
INSERT INTO `sys_users1` VALUES ('831', '何保庄', '717', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装3', null, null, '717');
INSERT INTO `sys_users1` VALUES ('832', '宋春林', '718', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接2班', null, null, '718');
INSERT INTO `sys_users1` VALUES ('833', '王琪', '722', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '设备部', null, null, '722');
INSERT INTO `sys_users1` VALUES ('834', '徐彬', '751', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品事业二部', null, null, '751');
INSERT INTO `sys_users1` VALUES ('835', '陈向东', '728', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单一组', null, null, '728');
INSERT INTO `sys_users1` VALUES ('836', '李杰文', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, null);
INSERT INTO `sys_users1` VALUES ('837', '刘家豪', '761', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '761');
INSERT INTO `sys_users1` VALUES ('838', '孙向东', '733', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '产品工艺部', null, null, '733');
INSERT INTO `sys_users1` VALUES ('839', '孙振涛', '735', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '订单二组', null, null, '735');
INSERT INTO `sys_users1` VALUES ('840', '王浩', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, null);
INSERT INTO `sys_users1` VALUES ('841', '吴鹏飞', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '供应链管理中心', null, null, null);
INSERT INTO `sys_users1` VALUES ('842', '何秀云', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, null);
INSERT INTO `sys_users1` VALUES ('843', '朱新义', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('844', '孙秀英', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('845', '李新青', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('846', '刘福美', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('847', '孙志红', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包装', null, null, null);
INSERT INTO `sys_users1` VALUES ('848', '王玉霞', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包装', null, null, null);
INSERT INTO `sys_users1` VALUES ('849', '王国权', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('850', '王成胤', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('851', '石秀娟', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包装', null, null, null);
INSERT INTO `sys_users1` VALUES ('852', '黄微', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包装', null, null, null);
INSERT INTO `sys_users1` VALUES ('853', '肖林', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '注塑', null, null, null);
INSERT INTO `sys_users1` VALUES ('854', '高峰', '747', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总经办', null, null, '747');
INSERT INTO `sys_users1` VALUES ('855', '张爱国', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, null);
INSERT INTO `sys_users1` VALUES ('856', '李成元', '003', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '国际营销中心', null, null, '003');
INSERT INTO `sys_users1` VALUES ('857', '江晓才', '755', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '755');
INSERT INTO `sys_users1` VALUES ('858', '李建民', '756', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '756');
INSERT INTO `sys_users1` VALUES ('859', '王金亮', '786', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '焊接1班', null, null, '786');
INSERT INTO `sys_users1` VALUES ('860', '于志超', '758', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '758');
INSERT INTO `sys_users1` VALUES ('861', '刘学', '757', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '彩绘车间', null, null, '757');
INSERT INTO `sys_users1` VALUES ('862', '聂法阳', '800', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '800');
INSERT INTO `sys_users1` VALUES ('863', '郭风兵', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, null);
INSERT INTO `sys_users1` VALUES ('864', '林涛', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, null);
INSERT INTO `sys_users1` VALUES ('865', '徐朋程', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('866', '李健男', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, null);
INSERT INTO `sys_users1` VALUES ('867', '李纪一', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('868', '石黎明', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, null);
INSERT INTO `sys_users1` VALUES ('869', '姚少帅', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, null);
INSERT INTO `sys_users1` VALUES ('870', '李桂霞', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '入库检', null, null, null);
INSERT INTO `sys_users1` VALUES ('871', '杨振毅', '762', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '762');
INSERT INTO `sys_users1` VALUES ('872', '张传军', '764', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '764');
INSERT INTO `sys_users1` VALUES ('873', '赵中兴', '766', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板2', null, null, '766');
INSERT INTO `sys_users1` VALUES ('874', '李金国', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, null);
INSERT INTO `sys_users1` VALUES ('875', '吴世军', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('876', '王德志', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('877', '于畅', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('878', '高开云', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '包板1', null, null, null);
INSERT INTO `sys_users1` VALUES ('879', '郝晓东', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '总装1', null, null, null);
INSERT INTO `sys_users1` VALUES ('880', '刘鹏', '651', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '实施运维部', null, null, '651');

-- ----------------------------
-- Table structure for tablemanage
-- ----------------------------
DROP TABLE IF EXISTS `tablemanage`;
CREATE TABLE `tablemanage` (
  `main_table` varchar(32) DEFAULT NULL COMMENT '主表',
  `is_synchronized` tinyint(1) DEFAULT NULL COMMENT '是否同步',
  `side_table` varchar(32) DEFAULT NULL COMMENT '副表名称',
  `system` varchar(32) DEFAULT NULL COMMENT '归属系统0、ERP 1、MES 2、PLM 3、钉钉'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表各系统对应关系';

-- ----------------------------
-- Records of tablemanage
-- ----------------------------
INSERT INTO `tablemanage` VALUES ('company', '0', 'company_erp', '0');
