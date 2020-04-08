use tf_business;
DROP TABLE IF EXISTS `gl_product_dict`;
CREATE TABLE `gl_product_dict` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典ID',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_type` tinyint(2) NOT NULL COMMENT '字典类型',
  `dict_remark` varchar(200) DEFAULT NULL COMMENT '字典描述',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `is_enabled` tinyint(2) NOT NULL COMMENT '有效标识（1：是；0：否）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品字典表父表';

DROP TABLE IF EXISTS `gl_product_dict_detail`;
CREATE TABLE `gl_product_dict_detail` (
  `detail_id` bigint(20) NOT NULL COMMENT 'ID',
  `dict_id` bigint(20) NOT NULL COMMENT '父表ID',
  `detail_name` varchar(50) NOT NULL COMMENT '字典参数',
  `detail_value` varchar(200) DEFAULT NULL COMMENT '参数键值',
  `remark` varchar(200) DEFAULT NULL COMMENT '参数描述',
  `serial_num` bigint(3) NOT NULL COMMENT '排列序号',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品字典表子表';


DROP TABLE IF EXISTS `hist_sheet_example`;
CREATE TABLE `hist_sheet_example` (
  `hist_id` bigint(20) NOT NULL COMMENT 'ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `business_id` bigint(20) NOT NULL COMMENT '业务ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `entity_id` bigint(20) NOT NULL COMMENT '历史底稿实例ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`hist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史底稿实例表';


DROP TABLE IF EXISTS `sys_group_dict`;
CREATE TABLE `sys_group_dict` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典ID',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_type` tinyint(2) NOT NULL COMMENT '字典类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '字典描述',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `is_enabled` tinyint(2) NOT NULL COMMENT '有效标识（1：是；0：否）',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所(集团)',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团字典表父表';


DROP TABLE IF EXISTS `sys_group_dict_detail`;
CREATE TABLE `sys_group_dict_detail` (
  `detail_id` bigint(20) NOT NULL COMMENT 'ID',
  `dict_id` bigint(20) NOT NULL COMMENT '父表ID',
  `detail_name` varchar(50) NOT NULL COMMENT '字典参数',
  `detail_value` varchar(200) DEFAULT NULL COMMENT '参数键值',
  `remark` varchar(200) DEFAULT NULL COMMENT '参数描述',
  `serial_num` bigint(3) NOT NULL COMMENT '排列序号',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所(集团)',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团字典表子表';

use tf_business_test;
DROP TABLE IF EXISTS `gl_product_dict`;
CREATE TABLE `gl_product_dict` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典ID',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_type` tinyint(2) NOT NULL COMMENT '字典类型',
  `dict_remark` varchar(200) DEFAULT NULL COMMENT '字典描述',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `is_enabled` tinyint(2) NOT NULL COMMENT '有效标识（1：是；0：否）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品字典表父表';

DROP TABLE IF EXISTS `gl_product_dict_detail`;
CREATE TABLE `gl_product_dict_detail` (
  `detail_id` bigint(20) NOT NULL COMMENT 'ID',
  `dict_id` bigint(20) NOT NULL COMMENT '父表ID',
  `detail_name` varchar(50) NOT NULL COMMENT '字典参数',
  `detail_value` varchar(200) DEFAULT NULL COMMENT '参数键值',
  `remark` varchar(200) DEFAULT NULL COMMENT '参数描述',
  `serial_num` bigint(3) NOT NULL COMMENT '排列序号',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品字典表子表';


DROP TABLE IF EXISTS `hist_sheet_example`;
CREATE TABLE `hist_sheet_example` (
  `hist_id` bigint(20) NOT NULL COMMENT 'ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `business_id` bigint(20) NOT NULL COMMENT '业务ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `entity_id` bigint(20) NOT NULL COMMENT '历史底稿实例ID',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所（集团）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`hist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史底稿实例表';


DROP TABLE IF EXISTS `sys_group_dict`;
CREATE TABLE `sys_group_dict` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典ID',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_type` tinyint(2) NOT NULL COMMENT '字典类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '字典描述',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `is_enabled` tinyint(2) NOT NULL COMMENT '有效标识（1：是；0：否）',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所(集团)',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团字典表父表';


DROP TABLE IF EXISTS `sys_group_dict_detail`;
CREATE TABLE `sys_group_dict_detail` (
  `detail_id` bigint(20) NOT NULL COMMENT 'ID',
  `dict_id` bigint(20) NOT NULL COMMENT '父表ID',
  `detail_name` varchar(50) NOT NULL COMMENT '字典参数',
  `detail_value` varchar(200) DEFAULT NULL COMMENT '参数键值',
  `remark` varchar(200) DEFAULT NULL COMMENT '参数描述',
  `serial_num` bigint(3) NOT NULL COMMENT '排列序号',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `group_id` bigint(20) NOT NULL COMMENT '授权的事务所(集团)',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团字典表子表';

use tf_operations;
DROP TABLE IF EXISTS `gl_product_dict`;
CREATE TABLE `gl_product_dict` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典ID',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_type` tinyint(2) NOT NULL COMMENT '字典类型',
  `dict_remark` varchar(200) DEFAULT NULL COMMENT '字典描述',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `is_enabled` tinyint(2) NOT NULL COMMENT '有效标识（1：是；0：否）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品字典表父表';

DROP TABLE IF EXISTS `gl_product_dict_detail`;
CREATE TABLE `gl_product_dict_detail` (
  `detail_id` bigint(20) NOT NULL COMMENT 'ID',
  `dict_id` bigint(20) NOT NULL COMMENT '父表ID',
  `detail_name` varchar(50) NOT NULL COMMENT '字典参数',
  `detail_value` varchar(200) DEFAULT NULL COMMENT '参数键值',
  `remark` varchar(200) DEFAULT NULL COMMENT '参数描述',
  `serial_num` bigint(3) NOT NULL COMMENT '排列序号',
  `is_effective` tinyint(2) NOT NULL COMMENT '状态(1、启用 2、停用)',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) NOT NULL COMMENT '修改人',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品字典表子表';


