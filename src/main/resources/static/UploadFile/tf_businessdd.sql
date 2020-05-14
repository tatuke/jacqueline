/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50714
Source Host           : 192.168.55.211:3306
Source Database       : tf_business

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2020-03-24 11:50:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_borg_dimension_rel
-- ----------------------------
DROP TABLE IF EXISTS `bs_borg_dimension_rel`;
CREATE TABLE `bs_borg_dimension_rel` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `period_id` bigint(20) NOT NULL COMMENT '业务属期ID',
  `borg_id` bigint(20) NOT NULL COMMENT '客户机构ID',
  `dimension_id` bigint(20) NOT NULL COMMENT '统计维度ID',
  `top_dimension_id` bigint(20) NOT NULL COMMENT '统计维度ID的顶级ID',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bs_contract
-- ----------------------------
DROP TABLE IF EXISTS `bs_contract`;
CREATE TABLE `bs_contract` (
  `contract_id` bigint(20) NOT NULL COMMENT '合同id',
  `contract_code` varchar(20) NOT NULL COMMENT '合同编号',
  `contract_name` varchar(200) NOT NULL COMMENT '合同名称',
  `contract_type` varchar(200) NOT NULL COMMENT '合同类型',
  `amount` decimal(17,2) DEFAULT NULL COMMENT '合同金额',
  `operator` varchar(20) DEFAULT NULL COMMENT '经办人',
  `signing_date` date DEFAULT NULL COMMENT '签订日期',
  `payment_type` varchar(2) NOT NULL COMMENT '付款方式(1一次性;2分期收款)',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否启用(启用、停用)',
  `is_effective` tinyint(2) NOT NULL COMMENT '是否有效',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `org_id` bigint(20) NOT NULL COMMENT '机构ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`contract_id`),
  UNIQUE KEY `ui_contract_groupCode` (`contract_code`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统合同表';

-- ----------------------------
-- Table structure for bs_customer
-- ----------------------------
DROP TABLE IF EXISTS `bs_customer`;
CREATE TABLE `bs_customer` (
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID1',
  `customer_code` varchar(20) NOT NULL COMMENT '客户编码',
  `note` varchar(2000) DEFAULT NULL COMMENT '备注',
  `org_id` bigint(20) NOT NULL COMMENT '机构ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `is_effective` tinyint(2) NOT NULL COMMENT '是否有效（1：是；0：否）',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否启用（1：是；0：否）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `enterprise_name` varchar(200) NOT NULL COMMENT '客户名称',
  `tax_code` varchar(30) DEFAULT NULL COMMENT '纳税人识别号',
  `industry_type` bigint(20) DEFAULT NULL COMMENT '行业分类',
  `bank` varchar(500) DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账户',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `office_phone` varchar(20) DEFAULT NULL COMMENT '办公电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱地址',
  `address` varchar(300) DEFAULT NULL COMMENT '联系地址',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `ui_customer_group_code` (`customer_code`,`group_id`) USING BTREE,
  KEY `AK_ui_customer_group_code` (`customer_code`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-集团客户表';

-- ----------------------------
-- Table structure for bs_customer_dimension
-- ----------------------------
DROP TABLE IF EXISTS `bs_customer_dimension`;
CREATE TABLE `bs_customer_dimension` (
  `dimension_id` bigint(20) NOT NULL COMMENT '维度id',
  `dimension_name` varchar(100) NOT NULL COMMENT '维度名称',
  `parent_dimension_id` bigint(20) DEFAULT NULL COMMENT '上级维度',
  `layer` tinyint(2) NOT NULL COMMENT '层数',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否启用',
  `top_dimension_id` bigint(20) DEFAULT NULL COMMENT '顶级维度id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  PRIMARY KEY (`dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户维度';

-- ----------------------------
-- Table structure for bs_file
-- ----------------------------
DROP TABLE IF EXISTS `bs_file`;
CREATE TABLE `bs_file` (
  `f_id` bigint(20) NOT NULL COMMENT '文件ID',
  `f_name` varchar(200) NOT NULL COMMENT '文件名称',
  `f_upload_name` varchar(300) DEFAULT NULL COMMENT '存储的文件名称',
  `f_url` varchar(1000) NOT NULL COMMENT '文件存储的路径',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-附件管理表';

-- ----------------------------
-- Table structure for bs_org
-- ----------------------------
DROP TABLE IF EXISTS `bs_org`;
CREATE TABLE `bs_org` (
  `corg_id` bigint(20) NOT NULL COMMENT '客户机构ID',
  `corg_name` varchar(200) NOT NULL COMMENT '客户机构名称',
  `corg_code` varchar(30) DEFAULT NULL COMMENT '客户机构编码(纳税人识别码)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级客户机构',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `is_effective` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`corg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户机构表';

-- ----------------------------
-- Table structure for bs_proceeds
-- ----------------------------
DROP TABLE IF EXISTS `bs_proceeds`;
CREATE TABLE `bs_proceeds` (
  `proceeds_id` bigint(20) NOT NULL COMMENT '收款ID',
  `pt_id` bigint(20) NOT NULL COMMENT '项目ID',
  `plan` date DEFAULT NULL COMMENT '收款计划时间',
  `plan_amount` decimal(17,2) NOT NULL COMMENT '计划收款金额',
  `invoice_date` date DEFAULT NULL COMMENT '实际开票时间',
  `invoice_amount` decimal(17,2) DEFAULT NULL COMMENT '实际开票金额',
  `proceeds_date` date DEFAULT NULL COMMENT '实际收款时间',
  `proceeds_amount` decimal(17,2) DEFAULT NULL COMMENT '实际收款金额',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `note` varchar(2000) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`proceeds_id`),
  UNIQUE KEY `ui_proceeds_plan` (`pt_id`,`plan`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-收款表';

-- ----------------------------
-- Table structure for bs_sheet_file_rel
-- ----------------------------
DROP TABLE IF EXISTS `bs_sheet_file_rel`;
CREATE TABLE `bs_sheet_file_rel` (
  `id` bigint(20) NOT NULL,
  `period_id` bigint(20) NOT NULL COMMENT '业务属期ID',
  `borg_id` bigint(20) NOT NULL COMMENT '业务机构ID',
  `sheet_name` varchar(500) NOT NULL COMMENT 'sheet名称',
  `f_id` bigint(20) NOT NULL COMMENT '文件ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿SHEET与附件关系表表';

-- ----------------------------
-- Table structure for client_sheet_share
-- ----------------------------
DROP TABLE IF EXISTS `client_sheet_share`;
CREATE TABLE `client_sheet_share` (
  `sheet_share_id` bigint(20) NOT NULL COMMENT '底稿共享ID',
  `business_type` tinyint(2) NOT NULL COMMENT '业务类型（此处的类型取值于字典数据）',
  `tax_type` tinyint(2) NOT NULL COMMENT '业务种类（税种）',
  `project_name` varchar(300) NOT NULL COMMENT '项目名称',
  `project_manager` bigint(20) NOT NULL COMMENT '项目经理ID',
  `customer_name` varchar(300) NOT NULL COMMENT '客户名称',
  `borg_id` bigint(20) NOT NULL COMMENT '业务机构ID',
  `org_name` varchar(300) NOT NULL COMMENT '机构名称',
  `start_period` date NOT NULL COMMENT '属期期间起',
  `end_period` date NOT NULL COMMENT '属期期间止',
  `project_source` varchar(300) NOT NULL COMMENT '项目来源（税务师事务所名称）',
  `project_id` bigint(20) DEFAULT NULL COMMENT '项目ID',
  `suptask_id` bigint(20) DEFAULT NULL COMMENT '总任务ID',
  `is_effective` tinyint(2) DEFAULT NULL COMMENT '是否有效',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`sheet_share_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='底稿共享父表';

-- ----------------------------
-- Table structure for client_sheet_share_detail
-- ----------------------------
DROP TABLE IF EXISTS `client_sheet_share_detail`;
CREATE TABLE `client_sheet_share_detail` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `sheet_share_id` bigint(20) NOT NULL COMMENT '底稿共享ID',
  `entity_id` bigint(20) NOT NULL COMMENT '底稿实例ID',
  `is_effective` tinyint(2) DEFAULT NULL COMMENT '是否有效',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='底稿共享子表';

-- ----------------------------
-- Table structure for client_sheet_share_rel
-- ----------------------------
DROP TABLE IF EXISTS `client_sheet_share_rel`;
CREATE TABLE `client_sheet_share_rel` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `sheet_share_id` bigint(20) NOT NULL COMMENT '底稿共享ID',
  `client_id` bigint(20) NOT NULL COMMENT '客户成员ID',
  `is_effective` tinyint(2) DEFAULT NULL COMMENT '是否有效',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='底稿共享关系表';

-- ----------------------------
-- Table structure for client_user
-- ----------------------------
DROP TABLE IF EXISTS `client_user`;
CREATE TABLE `client_user` (
  `client_id` bigint(20) NOT NULL COMMENT 'id',
  `client_name` varchar(200) NOT NULL COMMENT '用户昵称',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `mobilephone` varchar(512) NOT NULL COMMENT '手机（密文）',
  `client_phone` varchar(12) DEFAULT NULL COMMENT '电话',
  `email` varchar(512) DEFAULT NULL COMMENT '邮箱',
  `ins_company` varchar(256) DEFAULT NULL COMMENT '所属公司',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `is_enabled` tinyint(2) unsigned zerofill NOT NULL COMMENT '是否启用（1：是；0：否）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户端-客户成员表';

-- ----------------------------
-- Table structure for client_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `client_user_rel`;
CREATE TABLE `client_user_rel` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `userinfo_id` bigint(20) NOT NULL COMMENT '用户ID（全局用户）',
  `client_id` bigint(20) NOT NULL COMMENT '客户成员ID',
  `is_effective` tinyint(2) NOT NULL COMMENT '是否有效（1：是、0：否）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户端-客户成员、用户关系表';

-- ----------------------------
-- Table structure for gl_bs_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `gl_bs_enterprise`;
CREATE TABLE `gl_bs_enterprise` (
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID',
  `tax_code` varchar(20) DEFAULT NULL COMMENT '纳税编码',
  `enterprise_name` varchar(200) NOT NULL COMMENT '企业名称',
  `industry_type` bigint(20) DEFAULT NULL COMMENT '所属行业',
  `vat_type` varchar(50) DEFAULT NULL COMMENT '增值税性质',
  `enterprise_type` varchar(50) DEFAULT NULL COMMENT '企业类型',
  `bank` varchar(1000) DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账户',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `office_phone` varchar(20) DEFAULT NULL COMMENT '办公电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱地址',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `source_type` varchar(50) NOT NULL COMMENT '来源类型',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`enterprise_id`) USING BTREE,
  UNIQUE KEY `ui_enterprise_name` (`enterprise_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-企业信息表';

-- ----------------------------
-- Table structure for gl_sheet_guide
-- ----------------------------
DROP TABLE IF EXISTS `gl_sheet_guide`;
CREATE TABLE `gl_sheet_guide` (
  `guide_id` bigint(20) NOT NULL COMMENT 'id',
  `sheet_type` tinyint(2) NOT NULL COMMENT '底稿类型',
  `sheet_id` bigint(20) NOT NULL COMMENT '底稿id',
  `sheet_name` varchar(50) NOT NULL COMMENT 'sheet名称',
  `guide_data` varchar(5000) DEFAULT NULL,
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  PRIMARY KEY (`guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-指引';

-- ----------------------------
-- Table structure for gl_sheet_model
-- ----------------------------
DROP TABLE IF EXISTS `gl_sheet_model`;
CREATE TABLE `gl_sheet_model` (
  `model_id` bigint(20) NOT NULL COMMENT 'ID',
  `model_name` varchar(50) NOT NULL COMMENT '底稿名称',
  `model_industry_type` tinyint(2) NOT NULL COMMENT '行业类型',
  `model_business_type` tinyint(2) NOT NULL COMMENT '业务类型',
  `model_version` tinyint(2) NOT NULL COMMENT '变更版本',
  `model_source` tinyint(2) NOT NULL COMMENT '来源',
  `model_data` longtext COMMENT '底稿数据',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `ins_org_id` varchar(256) DEFAULT NULL COMMENT '归属机构的组织id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-底稿模板';

-- ----------------------------
-- Table structure for gl_sheet_peektag
-- ----------------------------
DROP TABLE IF EXISTS `gl_sheet_peektag`;
CREATE TABLE `gl_sheet_peektag` (
  `peektag_id` bigint(20) NOT NULL COMMENT '标签id',
  `sheet_type` tinyint(2) NOT NULL COMMENT '底稿类型',
  `sheet_id` bigint(20) NOT NULL COMMENT '底稿id',
  `peektag_type` tinyint(2) NOT NULL COMMENT '取数类型',
  `period` varchar(10) NOT NULL COMMENT '属期',
  `ins_org_id` bigint(20) NOT NULL COMMENT '机构',
  `peektag_remark` varchar(255) DEFAULT NULL COMMENT '取数规则说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `extra_json` varchar(255) DEFAULT NULL COMMENT '拓展字段',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  PRIMARY KEY (`peektag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-取数标签';

-- ----------------------------
-- Table structure for gl_sheet_tag
-- ----------------------------
DROP TABLE IF EXISTS `gl_sheet_tag`;
CREATE TABLE `gl_sheet_tag` (
  `tag_id` bigint(20) NOT NULL COMMENT '标签id',
  `sheet_type` tinyint(2) NOT NULL COMMENT '底稿类型',
  `sheet_id` bigint(20) DEFAULT NULL COMMENT '底稿id',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `tag_type` tinyint(2) NOT NULL COMMENT '标签类型',
  `tag_remark` varchar(255) DEFAULT NULL COMMENT '标签说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `ins_org_id` varchar(256) NOT NULL COMMENT '归属机构的组织id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-底稿-标签';

-- ----------------------------
-- Table structure for gl_sheet_tag_define
-- ----------------------------
DROP TABLE IF EXISTS `gl_sheet_tag_define`;
CREATE TABLE `gl_sheet_tag_define` (
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签id',
  `tag_define_name` varchar(50) NOT NULL COMMENT '标签名称',
  `tag_define_remark` varchar(255) DEFAULT NULL COMMENT '标签说明',
  `tag_define_type` tinyint(2) NOT NULL COMMENT '标签类型',
  `business_type` tinyint(2) NOT NULL COMMENT '业务类型',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `source` tinyint(2) NOT NULL COMMENT '来源',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `ins_org_id` varchar(256) DEFAULT NULL COMMENT '归属机构的组织id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`tag_define_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-标签定义';

-- ----------------------------
-- Table structure for gl_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_dict`;
CREATE TABLE `gl_sys_dict` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典ID',
  `dict_code` varchar(50) NOT NULL COMMENT '字典编码',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_type` tinyint(2) NOT NULL COMMENT '字典类型 ',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `client_type` tinyint(2) NOT NULL COMMENT '产品类型',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-字典表';

-- ----------------------------
-- Table structure for gl_sys_dict_detial
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_dict_detial`;
CREATE TABLE `gl_sys_dict_detial` (
  `dict_detail_id` bigint(20) NOT NULL COMMENT '字典明细ID',
  `dict_code` varchar(50) NOT NULL COMMENT '字典编码',
  `dict_id` bigint(20) NOT NULL COMMENT '字典id',
  `dict_detail_name` varchar(100) NOT NULL COMMENT '参数名称',
  `dict_detail_value` varchar(100) DEFAULT NULL COMMENT '参数值',
  `dict_detail_number` bigint(3) DEFAULT NULL COMMENT '排列序号',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '事务所id',
  PRIMARY KEY (`dict_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gl_sys_regions
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_regions`;
CREATE TABLE `gl_sys_regions` (
  `district_id` varchar(32) NOT NULL COMMENT '行政区域ID',
  `district_code` varchar(20) NOT NULL COMMENT '行政区域CODE',
  `district_name` varchar(50) NOT NULL COMMENT '行政区域名称',
  `district_type` tinyint(2) NOT NULL COMMENT '行政区域类型',
  `parent_district_code` varchar(20) DEFAULT NULL COMMENT '上级区域CODE',
  `parent_district_id` varchar(32) DEFAULT NULL COMMENT '上级区域ID',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-行政区域表';

-- ----------------------------
-- Table structure for gl_sys_rel_role
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_rel_role`;
CREATE TABLE `gl_sys_rel_role` (
  `rel_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `include_role_id` bigint(20) NOT NULL COMMENT '被包含角色id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  PRIMARY KEY (`rel_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-系统-角色关系表(业务角色间的包含关系)';

-- ----------------------------
-- Table structure for gl_sys_rel_role_biz
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_rel_role_biz`;
CREATE TABLE `gl_sys_rel_role_biz` (
  `rel_id` bigint(20) NOT NULL COMMENT '角色与业务点关系序号',
  `biz_id` bigint(20) NOT NULL COMMENT '业务点id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `is_basic_role` tinyint(2) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-角色与业务点关联表';

-- ----------------------------
-- Table structure for gl_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_role`;
CREATE TABLE `gl_sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `role_name` varchar(50) NOT NULL COMMENT '角色中文',
  `role_remark` varchar(50) DEFAULT NULL COMMENT '角色描述',
  `role_type` varchar(2) NOT NULL COMMENT '角色类型',
  `is_grantable` tinyint(2) DEFAULT NULL COMMENT '是否允许进行授权',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否启用',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `org_id` varchar(256) DEFAULT NULL COMMENT '编辑角色的组织id',
  `biz_channel_code` varchar(64) DEFAULT NULL COMMENT '业务渠道(暂未用上)',
  `client_type` varchar(2) DEFAULT NULL COMMENT '产品类型',
  `role_status` tinyint(2) DEFAULT NULL COMMENT '角色状态(逻辑删除用)',
  `is_basic_role` tinyint(2) DEFAULT NULL COMMENT '是否基础角色',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统--角色表（业务角色）';

-- ----------------------------
-- Table structure for gl_sys_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_userinfo`;
CREATE TABLE `gl_sys_userinfo` (
  `userinfo_id` bigint(20) NOT NULL COMMENT '用户信息id',
  `mobilephone` varchar(100) NOT NULL COMMENT '手机号码',
  `producttype` tinyint(2) NOT NULL COMMENT '产品类型',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`userinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Table structure for gl_sys_userinfo_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `gl_sys_userinfo_user_rel`;
CREATE TABLE `gl_sys_userinfo_user_rel` (
  `rel_id` bigint(20) NOT NULL COMMENT '关系id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `userinfo_id` bigint(20) NOT NULL COMMENT '用户信息id',
  `rel_gruoup_id` bigint(20) NOT NULL COMMENT '授权集团',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户客户关系表';

-- ----------------------------
-- Table structure for gl_tax_group
-- ----------------------------
DROP TABLE IF EXISTS `gl_tax_group`;
CREATE TABLE `gl_tax_group` (
  `TAX_GROUP_ID` bigint(20) NOT NULL COMMENT '集团id',
  `TAX_GROUP_CODE` varchar(20) NOT NULL COMMENT '集团编号',
  `TAX_GROUP_NAME` varchar(50) NOT NULL COMMENT '集团名称',
  `TAX_GROUP_PWD` varchar(255) DEFAULT NULL COMMENT '集团用户默认密码（加密后）',
  `TAX_GROUP_CERTIFICATE` blob COMMENT '集团证书',
  `CERTIFY_PASSWD` varchar(512) DEFAULT NULL COMMENT '证书密码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER_ID` int(11) DEFAULT NULL COMMENT '创建人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_USER_ID` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`TAX_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='框架-系统-集团信息';

-- ----------------------------
-- Table structure for pt_borg
-- ----------------------------
DROP TABLE IF EXISTS `pt_borg`;
CREATE TABLE `pt_borg` (
  `borg_id` bigint(20) NOT NULL COMMENT '主键ID',
  `corg_id` bigint(20) NOT NULL COMMENT '客户机构ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级客户机构',
  `period_id` bigint(20) NOT NULL COMMENT '业务属期ID',
  `borg_state` tinyint(2) NOT NULL COMMENT '业务机构状态（业务字典）',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`borg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务机构表';

-- ----------------------------
-- Table structure for pt_editor
-- ----------------------------
DROP TABLE IF EXISTS `pt_editor`;
CREATE TABLE `pt_editor` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `editor_id` bigint(20) unsigned zerofill NOT NULL COMMENT '编辑人',
  `entity_id` bigint(20) DEFAULT NULL COMMENT '实例ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编辑人表';

-- ----------------------------
-- Table structure for pt_members
-- ----------------------------
DROP TABLE IF EXISTS `pt_members`;
CREATE TABLE `pt_members` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `borg_id` bigint(20) NOT NULL COMMENT '业务机构ID',
  `period_id` bigint(20) NOT NULL COMMENT '业务属期ID（业务ID）',
  `user_id` bigint(20) NOT NULL COMMENT '用户',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `members_type` tinyint(3) NOT NULL COMMENT '成员类型（字典枚举数据:1、项目组长;2、编辑人;3、一级复核人;4、二级复核人;5、三级复核人;100、项目负责人；101、项目经理）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目成员表';

-- ----------------------------
-- Table structure for pt_members_rel
-- ----------------------------
DROP TABLE IF EXISTS `pt_members_rel`;
CREATE TABLE `pt_members_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `role_type` tinyint(2) NOT NULL COMMENT '项目角色类型（字典枚举数据:1、项目负责人;2、项目经理;3、项目成员;）',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3401946397703148417 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目成员表';

-- ----------------------------
-- Table structure for pt_period
-- ----------------------------
DROP TABLE IF EXISTS `pt_period`;
CREATE TABLE `pt_period` (
  `period_id` bigint(20) NOT NULL COMMENT '业务属期ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `business_type` tinyint(2) NOT NULL COMMENT '业务类型（此处的类型取值于字典数据）',
  `tax_type` tinyint(2) NOT NULL COMMENT '业务种类（税种）',
  `start_period` date NOT NULL COMMENT '属期期间起',
  `end_period` date NOT NULL COMMENT '属期期间止',
  `period_state` tinyint(2) NOT NULL COMMENT '业务属期状态（字典表）',
  `project_head` bigint(20) NOT NULL COMMENT '项目负责人',
  `project_manager` bigint(20) NOT NULL COMMENT '项目经理',
  `org_id` bigint(20) NOT NULL COMMENT '组织机构ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `is_effective` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务属期表';

-- ----------------------------
-- Table structure for pt_project
-- ----------------------------
DROP TABLE IF EXISTS `pt_project`;
CREATE TABLE `pt_project` (
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `project_code` varchar(20) NOT NULL COMMENT '项目编号',
  `project_name` varchar(200) NOT NULL COMMENT '项目名称',
  `business_type` varchar(2) NOT NULL COMMENT '业务类型',
  `project_amount` decimal(17,2) DEFAULT NULL COMMENT '项目金额',
  `project_head` bigint(20) NOT NULL COMMENT '项目负责人',
  `project_manager` bigint(20) NOT NULL COMMENT '项目经理',
  `state_type` varchar(2) NOT NULL COMMENT '项目状态(1.草稿;2.立项;3.进行;4.结项;5.归档;6.作废)',
  `contract_id` bigint(20) DEFAULT NULL COMMENT '合同ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `org_id` bigint(20) NOT NULL COMMENT '机构ID',
  `is_enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用（1：是；0：否）',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `ui_project_group_code` (`project_code`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Table structure for pt_review_feedback
-- ----------------------------
DROP TABLE IF EXISTS `pt_review_feedback`;
CREATE TABLE `pt_review_feedback` (
  `feedback_id` bigint(20) NOT NULL COMMENT '反馈id',
  `review_type` tinyint(4) NOT NULL COMMENT '复核类型',
  `review_user_id` bigint(20) DEFAULT NULL COMMENT '复核人',
  `is_reviewed` tinyint(2) NOT NULL COMMENT '是否复核',
  `feedback_content` varchar(500) DEFAULT NULL COMMENT '复核内容',
  `sheet_name` varchar(100) NOT NULL COMMENT 'sheet名称',
  `entity_id` bigint(20) NOT NULL COMMENT '实例id',
  `org_id` bigint(20) DEFAULT NULL COMMENT '机构id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `ins_org_id` bigint(20) NOT NULL COMMENT '反馈用户所属机构',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='复核反馈表';

-- ----------------------------
-- Table structure for pt_task
-- ----------------------------
DROP TABLE IF EXISTS `pt_task`;
CREATE TABLE `pt_task` (
  `task_id` bigint(20) NOT NULL COMMENT '主键ID',
  `task_name` varchar(200) NOT NULL COMMENT '任务名称',
  `parent_task_id` bigint(20) DEFAULT NULL COMMENT '上级任务ID',
  `borg_id` bigint(20) NOT NULL COMMENT '业务机构ID',
  `period_id` bigint(20) NOT NULL COMMENT '业务属期ID（业务ID）',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Table structure for pt_task_sub
-- ----------------------------
DROP TABLE IF EXISTS `pt_task_sub`;
CREATE TABLE `pt_task_sub` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务表ID',
  `sheet_name` varchar(300) NOT NULL COMMENT 'sheet页名称',
  `is_added` tinyint(2) NOT NULL COMMENT '是否自定义(1是；0否）',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团ID）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务子表构表';

-- ----------------------------
-- Table structure for sheet_entity
-- ----------------------------
DROP TABLE IF EXISTS `sheet_entity`;
CREATE TABLE `sheet_entity` (
  `entity_id` bigint(20) NOT NULL COMMENT '实例id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `ins_org_id` bigint(20) NOT NULL COMMENT '总分机构id',
  `model_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `model_name` varchar(100) DEFAULT NULL COMMENT '底稿名称',
  `entity_data` longtext COMMENT '实例数据',
  `parent_entity_id` bigint(20) DEFAULT NULL COMMENT '上级实例id',
  `entity_version` tinyint(3) NOT NULL COMMENT '实例版本',
  `entity_status` tinyint(2) NOT NULL COMMENT '状态',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-底稿实体';

-- ----------------------------
-- Table structure for sheet_guide
-- ----------------------------
DROP TABLE IF EXISTS `sheet_guide`;
CREATE TABLE `sheet_guide` (
  `guide_id` bigint(20) NOT NULL COMMENT 'id',
  `sheet_type` tinyint(2) NOT NULL COMMENT '底稿类型',
  `sheet_id` bigint(20) NOT NULL COMMENT '底稿id',
  `sheet_name` varchar(50) NOT NULL COMMENT 'sheet名称',
  `guide_data` varchar(5000) DEFAULT NULL,
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  PRIMARY KEY (`guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-指引';

-- ----------------------------
-- Table structure for sheet_model
-- ----------------------------
DROP TABLE IF EXISTS `sheet_model`;
CREATE TABLE `sheet_model` (
  `model_id` bigint(20) NOT NULL COMMENT 'ID',
  `model_name` varchar(50) NOT NULL COMMENT '底稿名称',
  `model_industry_type` tinyint(2) NOT NULL COMMENT '行业类型',
  `model_business_type` tinyint(2) NOT NULL COMMENT '业务类型',
  `model_version` tinyint(2) NOT NULL COMMENT '变更版本',
  `model_source` tinyint(2) NOT NULL COMMENT '来源',
  `model_data` longtext COMMENT '底稿数据',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `ins_org_id` varchar(256) DEFAULT NULL COMMENT '归属机构的组织id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-底稿模板';

-- ----------------------------
-- Table structure for sheet_peektag
-- ----------------------------
DROP TABLE IF EXISTS `sheet_peektag`;
CREATE TABLE `sheet_peektag` (
  `peektag_id` bigint(20) NOT NULL COMMENT '标签id',
  `sheet_type` tinyint(2) NOT NULL COMMENT '底稿类型',
  `sheet_id` bigint(20) NOT NULL COMMENT '底稿id',
  `peektag_type` tinyint(2) NOT NULL COMMENT '取数类型',
  `period` varchar(10) NOT NULL COMMENT '属期',
  `ins_org_id` bigint(20) NOT NULL COMMENT '机构',
  `peektag_remark` varchar(255) DEFAULT NULL COMMENT '取数规则说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `extra_json` varchar(255) DEFAULT NULL COMMENT '拓展字段',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  PRIMARY KEY (`peektag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-取数标签';

-- ----------------------------
-- Table structure for sheet_tag
-- ----------------------------
DROP TABLE IF EXISTS `sheet_tag`;
CREATE TABLE `sheet_tag` (
  `tag_id` bigint(20) NOT NULL COMMENT '标签id',
  `sheet_type` tinyint(2) NOT NULL COMMENT '底稿类型',
  `sheet_id` bigint(20) DEFAULT NULL COMMENT '底稿id',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `tag_type` tinyint(2) NOT NULL COMMENT '标签类型',
  `tag_remark` varchar(255) DEFAULT NULL COMMENT '标签说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `ins_org_id` varchar(256) NOT NULL COMMENT '归属机构的组织id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `is_number` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-标签';

-- ----------------------------
-- Table structure for sheet_tag_define
-- ----------------------------
DROP TABLE IF EXISTS `sheet_tag_define`;
CREATE TABLE `sheet_tag_define` (
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签id',
  `tag_define_name` varchar(50) NOT NULL COMMENT '标签名称',
  `tag_define_remark` varchar(255) DEFAULT NULL COMMENT '标签说明',
  `tag_define_type` tinyint(2) NOT NULL COMMENT '标签类型',
  `business_type` tinyint(2) NOT NULL COMMENT '业务类型',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效（1：启用、0：停用）',
  `datasource` tinyint(2) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `ins_org_id` varchar(256) DEFAULT NULL COMMENT '归属机构的组织id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`tag_define_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-底稿-标签定义';

-- ----------------------------
-- Table structure for sheet_tag_example_0
-- ----------------------------
DROP TABLE IF EXISTS `sheet_tag_example_0`;
CREATE TABLE `sheet_tag_example_0` (
  `tag_example_id` bigint(20) NOT NULL COMMENT '实例标签id',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `tag_name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  `tag_remark` varchar(100) DEFAULT NULL COMMENT '标签说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `entity_id` bigint(20) NOT NULL COMMENT '实例id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `ins_org_id` bigint(20) NOT NULL COMMENT '机构id',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `tag_value` varchar(20) DEFAULT NULL COMMENT '值',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `is_number` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`tag_example_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-底稿-底稿实例标签';

-- ----------------------------
-- Table structure for sheet_tag_example_1
-- ----------------------------
DROP TABLE IF EXISTS `sheet_tag_example_1`;
CREATE TABLE `sheet_tag_example_1` (
  `tag_example_id` bigint(20) NOT NULL COMMENT '实例标签id',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `tag_name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  `tag_remark` varchar(100) DEFAULT NULL COMMENT '标签说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `entity_id` bigint(20) NOT NULL COMMENT '实例id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `ins_org_id` bigint(20) NOT NULL COMMENT '机构id',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `tag_value` varchar(20) DEFAULT NULL COMMENT '值',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `is_number` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`tag_example_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-底稿-底稿实例标签';

-- ----------------------------
-- Table structure for sheet_tag_example_2
-- ----------------------------
DROP TABLE IF EXISTS `sheet_tag_example_2`;
CREATE TABLE `sheet_tag_example_2` (
  `tag_example_id` bigint(20) NOT NULL COMMENT '实例标签id',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `tag_name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  `tag_remark` varchar(100) DEFAULT NULL COMMENT '标签说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `entity_id` bigint(20) NOT NULL COMMENT '实例id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `ins_org_id` bigint(20) NOT NULL COMMENT '机构id',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `tag_value` varchar(20) DEFAULT NULL COMMENT '值',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `is_number` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`tag_example_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-底稿-底稿实例标签';

-- ----------------------------
-- Table structure for sheet_tag_example_3
-- ----------------------------
DROP TABLE IF EXISTS `sheet_tag_example_3`;
CREATE TABLE `sheet_tag_example_3` (
  `tag_example_id` bigint(20) NOT NULL COMMENT '实例标签id',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `tag_name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  `tag_remark` varchar(100) DEFAULT NULL COMMENT '标签说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `entity_id` bigint(20) NOT NULL COMMENT '实例id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `ins_org_id` bigint(20) NOT NULL COMMENT '机构id',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `tag_value` varchar(20) DEFAULT NULL COMMENT '值',
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `is_number` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`tag_example_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-底稿-底稿实例标签';

-- ----------------------------
-- Table structure for sheet_tag_example_4
-- ----------------------------
DROP TABLE IF EXISTS `sheet_tag_example_4`;
CREATE TABLE `sheet_tag_example_4` (
  `tag_example_id` bigint(20) NOT NULL COMMENT '实例标签id',
  `tag_define_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `tag_name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  `tag_remark` varchar(100) DEFAULT NULL COMMENT '标签说明',
  `sheet_name` varchar(100) NOT NULL COMMENT 'Sheet名称',
  `entity_id` bigint(20) NOT NULL COMMENT '实例id',
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `ins_org_id` bigint(20) NOT NULL COMMENT '机构id',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否有效',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `tag_value` varchar(20) DEFAULT NULL,
  `sheet_row` tinyint(6) NOT NULL COMMENT '行',
  `sheet_col` tinyint(3) NOT NULL COMMENT '列',
  `is_number` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`tag_example_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础-底稿-底稿实例标签';

-- ----------------------------
-- Table structure for st_sheet_tagdefine
-- ----------------------------
DROP TABLE IF EXISTS `st_sheet_tagdefine`;
CREATE TABLE `st_sheet_tagdefine` (
  `st_id` bigint(20) NOT NULL COMMENT 'ID',
  `business_type` tinyint(2) NOT NULL COMMENT '业务类型',
  `number` tinyint(4) DEFAULT NULL COMMENT '序号',
  `customer_name` varchar(300) NOT NULL COMMENT '客户名称',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `tagdefine_id` bigint(20) NOT NULL COMMENT '标签定义id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计标签表';

-- ----------------------------
-- Table structure for st_statistics_child
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_child`;
CREATE TABLE `st_statistics_child` (
  `st_chilid_id` bigint(20) NOT NULL COMMENT 'ID',
  `st_parent_id` bigint(20) NOT NULL COMMENT '父表ID',
  `st_query_parms` varchar(500) NOT NULL COMMENT '查询参数',
  `st_statistics_type` tinyint(2) NOT NULL COMMENT '查询类型',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  PRIMARY KEY (`st_chilid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共享统计子表';

-- ----------------------------
-- Table structure for st_statistics_parent
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_parent`;
CREATE TABLE `st_statistics_parent` (
  `st_id` bigint(20) NOT NULL COMMENT 'ID',
  `business_type` tinyint(2) NOT NULL COMMENT '业务类型',
  `business_kind` tinyint(2) NOT NULL COMMENT '业务种类',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `start_period` varchar(15) NOT NULL COMMENT '业务属期始',
  `end_period` varchar(15) NOT NULL COMMENT '业务属期止',
  `project_manager_id` bigint(20) NOT NULL COMMENT '项目经理ID',
  `period_id` bigint(20) NOT NULL COMMENT '属期ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团id',
  `customer_name` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共享统计父表';

-- ----------------------------
-- Table structure for st_statistics_rel
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_rel`;
CREATE TABLE `st_statistics_rel` (
  `st_chilid_id` bigint(20) NOT NULL COMMENT 'ID',
  `st_parent_id` bigint(20) NOT NULL COMMENT '父表ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `st_statistics_type` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`st_chilid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `org_id` varchar(256) NOT NULL COMMENT '组织id',
  `org_name` varchar(50) DEFAULT NULL COMMENT '组织名称',
  `org_full_name` varchar(250) DEFAULT NULL COMMENT '组织全称，显示名（业务数据中的显示名）',
  `org_type` varchar(1) DEFAULT NULL COMMENT '组织、部门类型',
  `biz_channel_code` varchar(64) DEFAULT NULL COMMENT '业务渠道',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `org_code` varchar(256) DEFAULT NULL COMMENT '编码',
  `org_parent_id` varchar(256) DEFAULT NULL COMMENT '上级id',
  `org_address` varchar(256) DEFAULT NULL COMMENT '地址',
  `org_scale` varchar(256) DEFAULT NULL COMMENT '规模',
  `org_contact` varchar(50) DEFAULT NULL COMMENT '联系人',
  `org_phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(256) DEFAULT NULL COMMENT '邮箱 ',
  `is_enabled` tinyint(2) DEFAULT NULL COMMENT '是否有效（1：启用、0：停用）',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省份编码',
  `city_code` varchar(20) DEFAULT NULL COMMENT '城市编码',
  `district_code` varchar(20) DEFAULT NULL COMMENT '区编码',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `org_status` tinyint(2) NOT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-组织部门表';

-- ----------------------------
-- Table structure for sys_rate
-- ----------------------------
DROP TABLE IF EXISTS `sys_rate`;
CREATE TABLE `sys_rate` (
  `rate_id` bigint(20) NOT NULL COMMENT 'ID',
  `rate_level_name` varchar(50) NOT NULL COMMENT '级别名称',
  `rate_number` decimal(15,2) DEFAULT NULL COMMENT '标准费率',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标准费率表';

-- ----------------------------
-- Table structure for sys_rate_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_rate_user_rel`;
CREATE TABLE `sys_rate_user_rel` (
  `rel_id` bigint(20) NOT NULL COMMENT '关系id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `rate_id` bigint(20) NOT NULL COMMENT '费率id',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-标准费率用户关系表';

-- ----------------------------
-- Table structure for sys_rel_org_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_rel_org_role`;
CREATE TABLE `sys_rel_org_role` (
  `rel_id` bigint(20) NOT NULL COMMENT '组织角色关系id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `org_id` varchar(256) NOT NULL COMMENT '组织id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-组织角色关系表';

-- ----------------------------
-- Table structure for sys_rel_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_rel_role`;
CREATE TABLE `sys_rel_role` (
  `rel_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `include_role_id` bigint(20) NOT NULL COMMENT '被包含角色id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-全局角色关系表(业务角色间的包含关系)';

-- ----------------------------
-- Table structure for sys_rel_role_biz
-- ----------------------------
DROP TABLE IF EXISTS `sys_rel_role_biz`;
CREATE TABLE `sys_rel_role_biz` (
  `rel_id` bigint(20) NOT NULL COMMENT '角色与业务点关系序号',
  `biz_id` bigint(20) NOT NULL COMMENT '业务点id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `is_basic_role` tinyint(2) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-角色与业务点关联表';

-- ----------------------------
-- Table structure for sys_rel_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_rel_user_role`;
CREATE TABLE `sys_rel_user_role` (
  `rel_id` bigint(20) NOT NULL COMMENT '组织角色关系id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `isbasicrel` varchar(2) DEFAULT NULL COMMENT '集团关系：1；全局关系：2',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-用户角色关系表';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `role_name` varchar(50) NOT NULL COMMENT '角色中文',
  `role_remark` varchar(50) DEFAULT NULL COMMENT '角色描述',
  `role_type` varchar(2) NOT NULL COMMENT '角色类型',
  `is_grantable` tinyint(2) DEFAULT NULL COMMENT '是否允许进行授权',
  `is_enabled` tinyint(2) NOT NULL COMMENT '是否启用',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人员',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `org_id` varchar(256) DEFAULT NULL COMMENT '编辑角色的组织id',
  `biz_channel_code` varchar(64) DEFAULT NULL COMMENT '业务渠道(暂未用上)',
  `client_type` varchar(2) DEFAULT NULL COMMENT '产品类型',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `role_status` tinyint(2) DEFAULT NULL COMMENT '角色状态(逻辑删除用)',
  `is_basic_role` tinyint(2) DEFAULT NULL COMMENT '是否基础角色',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统--角色表（业务角色）';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(200) DEFAULT NULL COMMENT '用户昵称',
  `user_account` varchar(512) DEFAULT NULL COMMENT '账号（密文）',
  `user_passwd` varchar(512) DEFAULT NULL COMMENT '密码（密文）',
  `user_mask` varchar(512) DEFAULT NULL COMMENT '用户掩码',
  `is_enabled` tinyint(2) DEFAULT NULL COMMENT '是否有效（1：启用、0：停用）',
  `mobilephone` varchar(512) DEFAULT NULL COMMENT '手机（密文）',
  `email` varchar(512) DEFAULT NULL COMMENT '邮箱',
  `ins_org_id` varchar(256) NOT NULL COMMENT '归属机构的组织id',
  `user_code` varchar(256) DEFAULT NULL COMMENT '工号',
  `user_title` varchar(10) DEFAULT NULL COMMENT '职称',
  `user_level` bigint(20) DEFAULT NULL COMMENT '级别',
  `user_phone` varchar(12) DEFAULT NULL COMMENT '电话',
  `entry_time` datetime DEFAULT NULL COMMENT '入职时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '最后修改人',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间',
  `group_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `reg_channel_code` varchar(64) DEFAULT NULL COMMENT '用户注册渠道',
  `biz_channel_code` varchar(64) DEFAULT NULL COMMENT '用户业务来源渠道(光大？晋商？还是哪个其它银行，不到下级)',
  `uc_id` bigint(20) DEFAULT NULL COMMENT '用户中心的用户id',
  `client_type` varchar(2) DEFAULT NULL COMMENT '产品类型',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础-系统-用户表';
