DROP TABLE IF EXISTS `ds_assets_liability`;
CREATE TABLE `ds_assets_liability` (
  `assets_liability_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '数据源定义ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '数据机构ID',
  `data_period` date NOT NULL COMMENT '数据属期'，
  `assets` varchar(100) NOT NULL COMMENT '资产',
  `assets_row` bigint(5) DEFAULT NULL COMMENT '资产行次',
  `pend_balance` decimal(17,2) DEFAULT NULL COMMENT '资产期末金额',
  `ybegin_balance` decimal(17,2) DEFAULT NULL COMMENT '资产年初余额',
  `lao_equity` varchar(100) NOT NULL COMMENT '负债和所有者权益',
  `lao_equity_row` bigint(5) DEFAULT NULL COMMENT '负债和所有者权益行次',
  `lao_end_balance` decimal(17,2) DEFAULT NULL COMMENT '负债和所有者权益期末余额',
  `lao_ybegin_balance` decimal(17,2) DEFAULT NULL COMMENT '负债和所有者权益年初余额',
  PRIMARY KEY (`assets_liability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产负债表';

DROP TABLE IF EXISTS `ds_assets_list`;
CREATE TABLE `ds_assets_list` (
  `assets_list_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '数据源定义ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '数据机构ID',
  `data_period` date NOT NULL COMMENT '数据属期',
  `assets_code` varchar(100) NOT NULL COMMENT '资产编号',
  `assets_type_1` varchar(50) DEFAULT NULL COMMENT '资产类型1',
  `assets_type_2` varchar(50) DEFAULT NULL COMMENT '资产类型2',
  `assets_type_3` varchar(50) DEFAULT NULL COMMENT '资产类型3',
  `assets_name` varchar(100) DEFAULT NULL COMMENT '资产名称',
  `model` varchar(50) DEFAULT NULL COMMENT '规格/型号',
  `original_value` decimal(17,2) NOT NULL COMMENT '原值',
  `resdual_rate` decimal(5,2) DEFAULT NULL COMMENT '残值率',
  `resdual_value` decimal(17,2) NOT NULL COMMENT '残值',
  `monthly_depre` decimal(17,2) NOT NULL COMMENT '月折旧/摊销',
  `year_depre` decimal(17,2) NOT NULL COMMENT '本年累计折旧/摊销',
  `period_depre` decimal(17,2) NOT NULL COMMENT '期末累计折旧/摊销',
  `monthly_impair` decimal(17,2) NOT NULL COMMENT '月减值准备',
  `year_impair` decimal(17,2) NOT NULL COMMENT '本年累计减值准备',
  `period_impair` decimal(17,2) NOT NULL COMMENT '期末累计减值准备',
  `period_netvalue` decimal(17,2) NOT NULL COMMENT '期末净值',
  `is_enabled` tinyint(2) DEFAULT NULL COMMENT '状态(1：启用；2：停用）',
  `depre_method` varchar(10) DEFAULT NULL COMMENT '折旧/摊销方法',
  `depre_limit` int(3) NOT NULL COMMENT '折旧/摊销期限',
  `entry_depre` decimal(17,2) DEFAULT NULL COMMENT '入账时累计折旧',
  `service_life` int(3) DEFAULT NULL COMMENT '使用年限',
  `activation_date` datetime DEFAULT NULL COMMENT '启用日期',
  `account_date` datetime DEFAULT NULL COMMENT '核算日期',
  `subject_code` varchar(100) DEFAULT NULL COMMENT '科目代码',
  `subject_name` varchar(150) DEFAULT NULL COMMENT '科目名称',
  `location` varchar(100) DEFAULT NULL COMMENT '地点',
  `customer_group` varchar(20) DEFAULT NULL COMMENT '使用部门',
  `increase_type` varchar(10) DEFAULT NULL COMMENT '增加类型',
  PRIMARY KEY (`assets_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产清单表';

DROP TABLE IF EXISTS `ds_datasource`;
CREATE TABLE `ds_datasource` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `client_id` bigint(20) NOT NULL COMMENT '客户ID',
  `org_id` bigint(20) NOT NULL COMMENT '客户机构ID',
  `org_name` varchar(200) NOT NULL COMMENT '客户机构名称',
  `start_period` date NOT NULL COMMENT '起始日期',
  `end_period` date NOT NULL COMMENT '终止日期',
  `source_type` tinyint(2) NOT NULL COMMENT '数据源类型',
  `source_category` varchar(255) NOT NULL COMMENT '数据源类别（预留）',
  `is_enabled` tinyint(2) NOT NULL COMMENT '状态（1：启用；2：停用）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人'，
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `group_id` bigint(20) NOT NULL COMMENT '集团',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源定义表';

DROP TABLE IF EXISTS `ds_dorg`;
CREATE TABLE `ds_dorg` (
  `dorg_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_source_id` bigint(20) NOT NULL COMMENT '数据源定义ID',
  `dorg_name` varchar(100) NOT NULL COMMENT '数据机构名称',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id`bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`dorg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据机构表';

DROP TABLE IF EXISTS `ds_profit`;
CREATE TABLE `ds_profit` (
  `profit_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '数据源定义ID',
  `dorg_id` bigint(20) NOT NULL,
  `data_period` date NOT NULL,
  `project` varchar(100) NOT NULL,
  `row` bigint(5) DEFAULT NULL COMMENT '行次',
  `period_amount` decimal(17,2) DEFAULT NULL COMMENT '本期金额',
  `yperiod_amount` decimal(17,2) DEFAULT NULL COMMENT '上年同期金额',
  `current_amount` decimal(17,2) DEFAULT NULL COMMENT '本年累计金额',
  `last_amount` decimal(17,2) DEFAULT NULL COMMENT '上年累计金额',
  PRIMARY KEY (`profit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='利润表（损益表）';

DROP TABLE IF EXISTS `ds_subject_balance`;
CREATE TABLE `ds_subject_balance` (
  `subject_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '数据源定义ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '数据机构ID',
  `data_period` date NOT NULL COMMENT '数据属期',
  `accounting_period` date NOT NULL COMMENT '会计期间',
  `subject_code` varchar(100) NOT NULL COMMENT '科目代（编）码',
  `subject_name` varchar(150) NOT NULL COMMENT '科目名称',
  `currency` varchar(10) DEFAULT NULL COMMENT '币别',
  `opeaning_amount` decimal(17,8) NOT NULL COMMENT '期初数量',
  `begin_debit` decimal(17,2) NOT NULL COMMENT '期初借方金额',
  `begin_creadit` decimal(17,2) NOT NULL COMMENT '期初贷方金额',
  `current_p_debits` decimal(17,8) DEFAULT NULL COMMENT '本期借方数量',
  `current_p_creadits` decimal(17,8) DEFAULT NULL COMMENT '本期贷方数量',
  `current_p_debit_amount` decimal(17,2) NOT NULL COMMENT '本期借方发生额',
  `current_p_creadit_amount` decimal(17,2) NOT NULL COMMENT '本期贷方发生额',
  `current_y_debits` decimal(17,8) DEFAULT NULL COMMENT '本年借方数量',
  `current_y-creadits` decimal(17,8) DEFAULT NULL COMMENT '本年贷方数量',
  `current_y_debit_amount` decimal(17,2) NOT NULL COMMENT '本年借方发生额',
  `current_y_creadit_amount` decimal(17,2) NOT NULL COMMENT '本年贷方发生额',
  `end_amount` decimal(17,8) NOT NULL COMMENT '期末数量',
  `end_debit_balance` decimal(17,2) DEFAULT NULL COMMENT '期末借方余额',
  `end_creadit_balance` decimal(17,2) NOT NULL COMMENT '期末贷方余额',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目余额表';

DROP TABLE IF EXISTS `ds_voucher_detail`;
CREATE TABLE `ds_voucher_detail` (
  `voucher_id` bigint(20) NOT NULL COMMENT '凭证明细表ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '数据源定义ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '数据机构ID',
  `data_period` date NOT NULL COMMENT '数据属期',
  `data_borg` varchar(100) DEFAULT NULL COMMENT '数据机构主体',
  `accounting_period` date DEFAULT NULL COMMENT '会计周期',
  `voucher_period` date NOT NULL COMMENT '凭证周期',
  `voucher_code` bigint(20) NOT NULL COMMENT '凭证号',
  `summary` varchar(200) NOT NULL COMMENT '摘要',
  `subject_code` bigint(20) DEFAULT NULL COMMENT '科目代（编）码',
  `subject` varchar(150) NOT NULL COMMENT '科目',
  `debit_amount` decimal(17,2) NOT NULL COMMENT '借方金额',
  `creadit_amount` decimal(17,2) NOT NULL COMMENT '贷方金额',
  `currency` varchar(10) DEFAULT NULL COMMENT '币别',
  `original_money` decimal(17,2) DEFAULT NULL COMMENT '原币金额',
  `exchange_rate` decimal(15,6) DEFAULT NULL COMMENT '汇率',
  `amount` decimal(17,8) DEFAULT NULL COMMENT '数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `unit_price` decimal(17,2) DEFAULT NULL COMMENT '单价',
  `backup1` varchar(100) DEFAULT NULL COMMENT '备用字段1',
  `backup2` varchar(100) DEFAULT NULL COMMENT '备用字段2',
  `backup3` varchar(100) DEFAULT NULL COMMENT '备用字段3',
  `backup4` varchar(100) DEFAULT NULL COMMENT '备用字段4',
  `backup5` varchar(100) DEFAULT NULL COMMENT '备用字段5',
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='凭证明细表';

DROP TABLE IF EXISTS `hist_excel_file`;
CREATE TABLE `hist_excel_file` (
  `excel_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_source_id` bigint(20) NOT NULL COMMENT '数据源定义ID',
  `excel_file` bigint(20) NOT NULL COMMENT 'EXCEL文件',
  `group` varchar(255) NOT NULL COMMENT '集团',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`excel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table ds_datasource add column `hui_name` varchar(200) NOT NULL COMMENT '客户机构名称' after org_id;