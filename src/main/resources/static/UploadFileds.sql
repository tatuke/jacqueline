DROP TABLE IF EXISTS `ds_assets_liability`;
CREATE TABLE `ds_assets_liability` (
  `assets_liability_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '����Դ����ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '���ݻ���ID',
  `data_period` date NOT NULL COMMENT '��������'��
  `assets` varchar(100) NOT NULL COMMENT '�ʲ�',
  `assets_row` bigint(5) DEFAULT NULL COMMENT '�ʲ��д�',
  `pend_balance` decimal(17,2) DEFAULT NULL COMMENT '�ʲ���ĩ���',
  `ybegin_balance` decimal(17,2) DEFAULT NULL COMMENT '�ʲ�������',
  `lao_equity` varchar(100) NOT NULL COMMENT '��ծ��������Ȩ��',
  `lao_equity_row` bigint(5) DEFAULT NULL COMMENT '��ծ��������Ȩ���д�',
  `lao_end_balance` decimal(17,2) DEFAULT NULL COMMENT '��ծ��������Ȩ����ĩ���',
  `lao_ybegin_balance` decimal(17,2) DEFAULT NULL COMMENT '��ծ��������Ȩ��������',
  PRIMARY KEY (`assets_liability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ʲ���ծ��';

DROP TABLE IF EXISTS `ds_assets_list`;
CREATE TABLE `ds_assets_list` (
  `assets_list_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '����Դ����ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '���ݻ���ID',
  `data_period` date NOT NULL COMMENT '��������',
  `assets_code` varchar(100) NOT NULL COMMENT '�ʲ����',
  `assets_type_1` varchar(50) DEFAULT NULL COMMENT '�ʲ�����1',
  `assets_type_2` varchar(50) DEFAULT NULL COMMENT '�ʲ�����2',
  `assets_type_3` varchar(50) DEFAULT NULL COMMENT '�ʲ�����3',
  `assets_name` varchar(100) DEFAULT NULL COMMENT '�ʲ�����',
  `model` varchar(50) DEFAULT NULL COMMENT '���/�ͺ�',
  `original_value` decimal(17,2) NOT NULL COMMENT 'ԭֵ',
  `resdual_rate` decimal(5,2) DEFAULT NULL COMMENT '��ֵ��',
  `resdual_value` decimal(17,2) NOT NULL COMMENT '��ֵ',
  `monthly_depre` decimal(17,2) NOT NULL COMMENT '���۾�/̯��',
  `year_depre` decimal(17,2) NOT NULL COMMENT '�����ۼ��۾�/̯��',
  `period_depre` decimal(17,2) NOT NULL COMMENT '��ĩ�ۼ��۾�/̯��',
  `monthly_impair` decimal(17,2) NOT NULL COMMENT '�¼�ֵ׼��',
  `year_impair` decimal(17,2) NOT NULL COMMENT '�����ۼƼ�ֵ׼��',
  `period_impair` decimal(17,2) NOT NULL COMMENT '��ĩ�ۼƼ�ֵ׼��',
  `period_netvalue` decimal(17,2) NOT NULL COMMENT '��ĩ��ֵ',
  `is_enabled` tinyint(2) DEFAULT NULL COMMENT '״̬(1�����ã�2��ͣ�ã�',
  `depre_method` varchar(10) DEFAULT NULL COMMENT '�۾�/̯������',
  `depre_limit` int(3) NOT NULL COMMENT '�۾�/̯������',
  `entry_depre` decimal(17,2) DEFAULT NULL COMMENT '����ʱ�ۼ��۾�',
  `service_life` int(3) DEFAULT NULL COMMENT 'ʹ������',
  `activation_date` datetime DEFAULT NULL COMMENT '��������',
  `account_date` datetime DEFAULT NULL COMMENT '��������',
  `subject_code` varchar(100) DEFAULT NULL COMMENT '��Ŀ����',
  `subject_name` varchar(150) DEFAULT NULL COMMENT '��Ŀ����',
  `location` varchar(100) DEFAULT NULL COMMENT '�ص�',
  `customer_group` varchar(20) DEFAULT NULL COMMENT 'ʹ�ò���',
  `increase_type` varchar(10) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`assets_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ʲ��嵥��';

DROP TABLE IF EXISTS `ds_datasource`;
CREATE TABLE `ds_datasource` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `client_id` bigint(20) NOT NULL COMMENT '�ͻ�ID',
  `org_id` bigint(20) NOT NULL COMMENT '�ͻ�����ID',
  `org_name` varchar(200) NOT NULL COMMENT '�ͻ���������',
  `start_period` date NOT NULL COMMENT '��ʼ����',
  `end_period` date NOT NULL COMMENT '��ֹ����',
  `source_type` tinyint(2) NOT NULL COMMENT '����Դ����',
  `source_category` varchar(255) NOT NULL COMMENT '����Դ���Ԥ����',
  `is_enabled` tinyint(2) NOT NULL COMMENT '״̬��1�����ã�2��ͣ�ã�',
  `create_user_id` bigint(20) NOT NULL COMMENT '������',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `modify_user_id` bigint(20) NOT NULL COMMENT '�޸���'��
  `modify_time` datetime NOT NULL COMMENT '�޸�ʱ��',
  `group_id` bigint(20) NOT NULL COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����Դ�����';

DROP TABLE IF EXISTS `ds_dorg`;
CREATE TABLE `ds_dorg` (
  `dorg_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_source_id` bigint(20) NOT NULL COMMENT '����Դ����ID',
  `dorg_name` varchar(100) NOT NULL COMMENT '���ݻ�������',
  `create_user_id` bigint(20) NOT NULL COMMENT '������',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `modify_user_id`bigint(20) NOT NULL COMMENT '�޸���',
  `modify_time` datetime NOT NULL COMMENT '�޸�ʱ��',
  PRIMARY KEY (`dorg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ݻ�����';

DROP TABLE IF EXISTS `ds_profit`;
CREATE TABLE `ds_profit` (
  `profit_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '����Դ����ID',
  `dorg_id` bigint(20) NOT NULL,
  `data_period` date NOT NULL,
  `project` varchar(100) NOT NULL,
  `row` bigint(5) DEFAULT NULL COMMENT '�д�',
  `period_amount` decimal(17,2) DEFAULT NULL COMMENT '���ڽ��',
  `yperiod_amount` decimal(17,2) DEFAULT NULL COMMENT '����ͬ�ڽ��',
  `current_amount` decimal(17,2) DEFAULT NULL COMMENT '�����ۼƽ��',
  `last_amount` decimal(17,2) DEFAULT NULL COMMENT '�����ۼƽ��',
  PRIMARY KEY (`profit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������';

DROP TABLE IF EXISTS `ds_subject_balance`;
CREATE TABLE `ds_subject_balance` (
  `subject_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '����Դ����ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '���ݻ���ID',
  `data_period` date NOT NULL COMMENT '��������',
  `accounting_period` date NOT NULL COMMENT '����ڼ�',
  `subject_code` varchar(100) NOT NULL COMMENT '��Ŀ�����ࣩ��',
  `subject_name` varchar(150) NOT NULL COMMENT '��Ŀ����',
  `currency` varchar(10) DEFAULT NULL COMMENT '�ұ�',
  `opeaning_amount` decimal(17,8) NOT NULL COMMENT '�ڳ�����',
  `begin_debit` decimal(17,2) NOT NULL COMMENT '�ڳ��跽���',
  `begin_creadit` decimal(17,2) NOT NULL COMMENT '�ڳ��������',
  `current_p_debits` decimal(17,8) DEFAULT NULL COMMENT '���ڽ跽����',
  `current_p_creadits` decimal(17,8) DEFAULT NULL COMMENT '���ڴ�������',
  `current_p_debit_amount` decimal(17,2) NOT NULL COMMENT '���ڽ跽������',
  `current_p_creadit_amount` decimal(17,2) NOT NULL COMMENT '���ڴ���������',
  `current_y_debits` decimal(17,8) DEFAULT NULL COMMENT '����跽����',
  `current_y-creadits` decimal(17,8) DEFAULT NULL COMMENT '�����������',
  `current_y_debit_amount` decimal(17,2) NOT NULL COMMENT '����跽������',
  `current_y_creadit_amount` decimal(17,2) NOT NULL COMMENT '�������������',
  `end_amount` decimal(17,8) NOT NULL COMMENT '��ĩ����',
  `end_debit_balance` decimal(17,2) DEFAULT NULL COMMENT '��ĩ�跽���',
  `end_creadit_balance` decimal(17,2) NOT NULL COMMENT '��ĩ�������',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ŀ����';

DROP TABLE IF EXISTS `ds_voucher_detail`;
CREATE TABLE `ds_voucher_detail` (
  `voucher_id` bigint(20) NOT NULL COMMENT 'ƾ֤��ϸ��ID',
  `data_define_id` bigint(20) NOT NULL COMMENT '����Դ����ID',
  `dorg_id` bigint(20) NOT NULL COMMENT '���ݻ���ID',
  `data_period` date NOT NULL COMMENT '��������',
  `data_borg` varchar(100) DEFAULT NULL COMMENT '���ݻ�������',
  `accounting_period` date DEFAULT NULL COMMENT '�������',
  `voucher_period` date NOT NULL COMMENT 'ƾ֤����',
  `voucher_code` bigint(20) NOT NULL COMMENT 'ƾ֤��',
  `summary` varchar(200) NOT NULL COMMENT 'ժҪ',
  `subject_code` bigint(20) DEFAULT NULL COMMENT '��Ŀ�����ࣩ��',
  `subject` varchar(150) NOT NULL COMMENT '��Ŀ',
  `debit_amount` decimal(17,2) NOT NULL COMMENT '�跽���',
  `creadit_amount` decimal(17,2) NOT NULL COMMENT '�������',
  `currency` varchar(10) DEFAULT NULL COMMENT '�ұ�',
  `original_money` decimal(17,2) DEFAULT NULL COMMENT 'ԭ�ҽ��',
  `exchange_rate` decimal(15,6) DEFAULT NULL COMMENT '����',
  `amount` decimal(17,8) DEFAULT NULL COMMENT '����',
  `unit` varchar(10) DEFAULT NULL COMMENT '��λ',
  `unit_price` decimal(17,2) DEFAULT NULL COMMENT '����',
  `backup1` varchar(100) DEFAULT NULL COMMENT '�����ֶ�1',
  `backup2` varchar(100) DEFAULT NULL COMMENT '�����ֶ�2',
  `backup3` varchar(100) DEFAULT NULL COMMENT '�����ֶ�3',
  `backup4` varchar(100) DEFAULT NULL COMMENT '�����ֶ�4',
  `backup5` varchar(100) DEFAULT NULL COMMENT '�����ֶ�5',
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ƾ֤��ϸ��';

DROP TABLE IF EXISTS `hist_excel_file`;
CREATE TABLE `hist_excel_file` (
  `excel_id` bigint(20) NOT NULL COMMENT 'ID',
  `data_source_id` bigint(20) NOT NULL COMMENT '����Դ����ID',
  `excel_file` bigint(20) NOT NULL COMMENT 'EXCEL�ļ�',
  `group` varchar(255) NOT NULL COMMENT '����',
  `create_user_id` bigint(20) NOT NULL COMMENT '������',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`excel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table ds_datasource add column `hui_name` varchar(200) NOT NULL COMMENT '�ͻ���������' after org_id;