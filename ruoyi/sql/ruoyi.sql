/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-01-06 12:52:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-17 11:54:04');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-17 14:11:49');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-17 16:10:04');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-18 10:28:56');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-18 11:22:23');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-18 14:44:54');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-18 14:45:35');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-18 14:47:12');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-18 14:52:25');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-18 15:44:24');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-18 16:56:48');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-18 16:57:09');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-18 16:57:13');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-18 16:57:26');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-18 16:57:52');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-19 09:36:38');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-19 14:20:32');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-19 14:21:08');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-12-19 16:48:55');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-19 16:49:02');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-19 17:00:40');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-19 17:01:00');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-19 17:36:14');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-19 18:19:54');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-20 09:26:13');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 09:41:52');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-20 09:42:23');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:21:31');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:25:57');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-20 11:30:29');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:30:33');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:36:03');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-20 11:37:00');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-20 11:37:05');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:37:08');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-20 11:44:10');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 11:44:14');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 12:30:28');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 13:58:56');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 17:16:49');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 17:20:53');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-20 17:25:01');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-20 17:25:07');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 09:16:20');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 09:16:31');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 09:39:17');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 09:41:52');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 10:29:54');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 10:56:31');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 11:33:57');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '192.168.25.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-23 11:46:31');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-23 11:46:49');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 11:46:54');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 13:52:13');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 15:31:04');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-23 15:38:30');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 15:38:36');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 17:01:30');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-23 17:28:38');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 17:28:43');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 17:32:22');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-23 19:23:42');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-24 09:22:48');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-24 09:41:40');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-24 09:48:50');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-24 10:13:27');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-24 10:15:19');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-24 14:01:58');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-25 09:41:06');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-25 12:27:32');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-25 13:05:07');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-25 13:46:45');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-25 17:41:44');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-26 09:29:22');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-26 12:15:32');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-26 14:00:22');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-26 15:44:07');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-26 17:08:45');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-27 10:37:55');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-27 11:31:12');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-27 17:20:42');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-30 09:31:10');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 09:31:16');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 10:38:04');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 11:08:47');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 11:13:12');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-30 12:25:12');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 12:25:19');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 14:13:34');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-30 14:18:29');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-30 14:18:34');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 14:18:40');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-30 14:22:03');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 14:22:10');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-30 14:29:05');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2019-12-30 14:29:10');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 14:29:18');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 15:21:26');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 15:54:58');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-30 17:31:35');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-30 17:31:42');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-31 09:32:42');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-31 10:29:13');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-31 13:42:44');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-31 14:18:54');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-31 15:41:15');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-31 16:53:33');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-31 17:25:55');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2020-01-02 10:09:21');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-02 10:09:25');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-02 15:18:55');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-02 16:33:41');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-02 17:54:36');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-03 15:54:14');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-03 16:54:01');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-06 09:53:00');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '192.168.25.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-06 10:40:09');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '1', 'M', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '1', 'M', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '1', 'M', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', null, '0', 'M', '0', '', 'guide', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('99', '简历档案信息管理', '1', '0', 'userinfo', 'system/userinfo/index', '1', 'C', '0', 'system:userinfo:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-20 11:57:26', '简历档案信息管理菜单');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '1', 'C', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '1', 'C', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '1', 'C', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '1', 'C', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '1', 'C', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '1', 'C', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '1', 'C', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '1', 'C', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', 'system/log/index', '1', 'M', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '1', 'C', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '1', 'C', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '1', 'C', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '1', 'C', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', 'build', 'tool/build/index', '1', 'C', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', 'gen', 'tool/gen/index', '1', 'C', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '1', 'C', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('116', '查看人员档案信息', '99', '1', 'watch', 'userinfo/watch/index', '1', 'C', '0', 'userinfo:watch:list', 'watchuser', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '查看人员档案信息');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '1', 'C', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '1', 'C', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('991', '档案信息查询', '99', '1', '', '', '1', 'F', '0', 'system:userinfo:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('992', '档案信息新增', '99', '2', '', '', '1', 'F', '0', 'system:userinfo:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('993', '档案信息修改', '99', '3', '', '', '1', 'F', '0', 'system:userinfo:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('994', '档案信息删除', '99', '4', '', '', '1', 'F', '0', 'system:userinfo:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('995', '档案信息导出', '99', '5', '', '', '1', 'F', '0', 'system:userinfo:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('996', '档案信息导入', '99', '6', '', '', '1', 'F', '0', 'system:userinfo:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '1', 'F', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '1', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '1', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '1', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '1', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '1', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '1', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '1', 'F', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '1', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '1', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '1', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '1', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '1', 'F', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '1', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '1', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '1', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '1', 'F', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '1', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '1', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '1', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '1', 'F', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '1', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '1', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '1', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '1', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '1', 'F', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '1', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '1', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '1', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '1', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '1', 'F', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '1', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '1', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '1', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '1', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '1', 'F', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '1', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '1', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '1', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '1', 'F', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '1', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '1', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '1', 'F', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '1', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '1', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '1', 'F', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '1', 'F', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '1', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '1', 'F', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '1', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '1', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '1', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '1', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '1', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '114', '1', '#', '', '1', 'F', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '114', '2', '#', '', '1', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '114', '3', '#', '', '1', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '114', '2', '#', '', '1', 'F', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '114', '4', '#', '', '1', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '114', '5', '#', '', '1', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"3649b33c-d4f6-4712-ba1b-d0253d1dc1f4_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-17 11:54:34');
INSERT INTO `sys_oper_log` VALUES ('101', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 12:01:23');
INSERT INTO `sys_oper_log` VALUES ('102', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 12:05:48');
INSERT INTO `sys_oper_log` VALUES ('103', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 12:22:05');
INSERT INTO `sys_oper_log` VALUES ('104', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 12:24:16');
INSERT INTO `sys_oper_log` VALUES ('105', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 12:37:59');
INSERT INTO `sys_oper_log` VALUES ('106', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 14:11:58');
INSERT INTO `sys_oper_log` VALUES ('107', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', 'Cannot get a STRING value from a NUMERIC cell', '2019-12-17 14:44:44');
INSERT INTO `sys_oper_log` VALUES ('108', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 14:53:00');
INSERT INTO `sys_oper_log` VALUES ('109', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '导入用户数据不能为空！', '2019-12-17 16:10:13');
INSERT INTO `sys_oper_log` VALUES ('110', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '导入用户数据不能为空！', '2019-12-17 16:11:28');
INSERT INTO `sys_oper_log` VALUES ('111', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '导入用户数据不能为空！', '2019-12-17 16:19:50');
INSERT INTO `sys_oper_log` VALUES ('112', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"admin11\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"admin11\"<br/>2、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"ry111\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"ry111\"', '2019-12-17 16:35:21');
INSERT INTO `sys_oper_log` VALUES ('113', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"admin11\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"admin11\"<br/>2、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"ry111\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"ry111\"', '2019-12-17 16:50:43');
INSERT INTO `sys_oper_log` VALUES ('114', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"admin11\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"admin11\"<br/>2、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"ry111\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"ry111\"', '2019-12-17 16:51:36');
INSERT INTO `sys_oper_log` VALUES ('115', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"admin11\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"admin11\"<br/>2、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"ry111\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"ry111\"', '2019-12-17 16:52:30');
INSERT INTO `sys_oper_log` VALUES ('116', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"admin11\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"admin11\"<br/>2、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"ry111\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"ry111\"', '2019-12-17 17:05:44');
INSERT INTO `sys_oper_log` VALUES ('117', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"admin11\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"admin11\"<br/>2、账号 若依 导入失败：nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"ry111\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"ry111\"', '2019-12-17 17:09:33');
INSERT INTO `sys_oper_log` VALUES ('118', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '导入用户数据不能为空！', '2019-12-17 17:19:06');
INSERT INTO `sys_oper_log` VALUES ('119', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:24:25');
INSERT INTO `sys_oper_log` VALUES ('120', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:45:18');
INSERT INTO `sys_oper_log` VALUES ('121', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:49:26');
INSERT INTO `sys_oper_log` VALUES ('122', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:51:38');
INSERT INTO `sys_oper_log` VALUES ('123', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('124', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:54:42');
INSERT INTO `sys_oper_log` VALUES ('125', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:55:28');
INSERT INTO `sys_oper_log` VALUES ('126', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:56:12');
INSERT INTO `sys_oper_log` VALUES ('127', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 17:57:02');
INSERT INTO `sys_oper_log` VALUES ('128', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 18:07:07');
INSERT INTO `sys_oper_log` VALUES ('129', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 18:15:03');
INSERT INTO `sys_oper_log` VALUES ('130', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 18:16:12');
INSERT INTO `sys_oper_log` VALUES ('131', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '', '2019-12-17 18:18:12');
INSERT INTO `sys_oper_log` VALUES ('132', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '导入用户数据不能为空！', '2019-12-17 18:27:22');
INSERT INTO `sys_oper_log` VALUES ('133', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '导入用户数据不能为空！', '2019-12-17 18:34:22');
INSERT INTO `sys_oper_log` VALUES ('134', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '导入用户数据不能为空！', '2019-12-17 18:47:52');
INSERT INTO `sys_oper_log` VALUES ('135', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 ry111 导入失败：\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2019-12-18 10:29:07');
INSERT INTO `sys_oper_log` VALUES ('136', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 ry111 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'\r\n### The error may involve com.ruoyi.project.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,             ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'\n; Duplicate entry \'2\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'', '2019-12-18 10:36:25');
INSERT INTO `sys_oper_log` VALUES ('137', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 ry111 导入成功\",\"code\":200}', '0', null, '2019-12-18 10:39:48');
INSERT INTO `sys_oper_log` VALUES ('138', '用户管理', '3', 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/4', '192.168.25.1', '内网IP', '{userIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-18 10:40:03');
INSERT INTO `sys_oper_log` VALUES ('139', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 ry111 已存在', '2019-12-18 10:40:22');
INSERT INTO `sys_oper_log` VALUES ('140', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 ruoy111 导入成功\",\"code\":200}', '0', null, '2019-12-18 10:41:28');
INSERT INTO `sys_oper_log` VALUES ('141', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 ruoy111 已存在', '2019-12-18 10:42:16');
INSERT INTO `sys_oper_log` VALUES ('142', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 test8 导入成功\",\"code\":200}', '0', null, '2019-12-18 10:47:11');
INSERT INTO `sys_oper_log` VALUES ('143', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"9f008fe1-6317-4f7d-b3b2-4cd400e13ba8_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-18 10:50:12');
INSERT INTO `sys_oper_log` VALUES ('144', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test9 导入成功<br/>2、账号 test10 导入成功\",\"code\":200}', '0', null, '2019-12-18 10:52:05');
INSERT INTO `sys_oper_log` VALUES ('145', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test9 已存在<br/>2、账号 test10 已存在', '2019-12-18 11:23:46');
INSERT INTO `sys_oper_log` VALUES ('146', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test11 导入成功<br/>2、账号 test12 导入成功\",\"code\":200}', '0', null, '2019-12-18 11:26:15');
INSERT INTO `sys_oper_log` VALUES ('147', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test11 已存在<br/>2、账号 test12 已存在', '2019-12-18 11:32:27');
INSERT INTO `sys_oper_log` VALUES ('148', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test13 导入成功<br/>2、账号 test14 导入成功\",\"code\":200}', '0', null, '2019-12-18 11:42:52');
INSERT INTO `sys_oper_log` VALUES ('149', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test13 已存在<br/>2、账号 test14 已存在', '2019-12-18 11:55:29');
INSERT INTO `sys_oper_log` VALUES ('150', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test15 导入成功<br/>2、账号 test16 导入成功\",\"code\":200}', '0', null, '2019-12-18 12:02:41');
INSERT INTO `sys_oper_log` VALUES ('151', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test15 更新成功<br/>2、账号 test16 更新成功\",\"code\":200}', '0', null, '2019-12-18 12:04:11');
INSERT INTO `sys_oper_log` VALUES ('152', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test15 已存在<br/>2、账号 test16 已存在', '2019-12-18 12:04:29');
INSERT INTO `sys_oper_log` VALUES ('153', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test17 导入成功<br/>2、账号 test18 导入成功\",\"code\":200}', '0', null, '2019-12-18 12:05:13');
INSERT INTO `sys_oper_log` VALUES ('154', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test17 更新成功<br/>2、账号 test18 更新成功\",\"code\":200}', '0', null, '2019-12-18 12:06:56');
INSERT INTO `sys_oper_log` VALUES ('155', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test17 更新成功<br/>2、账号 test18 更新成功\",\"code\":200}', '0', null, '2019-12-18 12:09:50');
INSERT INTO `sys_oper_log` VALUES ('156', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test17 已存在<br/>2、账号 test18 已存在', '2019-12-18 17:12:00');
INSERT INTO `sys_oper_log` VALUES ('157', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test17 更新成功<br/>2、账号 test18 更新成功\",\"code\":200}', '0', null, '2019-12-18 17:12:20');
INSERT INTO `sys_oper_log` VALUES ('158', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test17 更新成功<br/>2、账号 test18 更新成功\",\"code\":200}', '0', null, '2019-12-18 17:31:18');
INSERT INTO `sys_oper_log` VALUES ('159', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test17 更新成功<br/>2、账号 test18 更新成功\",\"code\":200}', '0', null, '2019-12-19 09:41:14');
INSERT INTO `sys_oper_log` VALUES ('160', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test19 导入成功<br/>2、账号 test20 导入成功\",\"code\":200}', '0', null, '2019-12-19 09:42:30');
INSERT INTO `sys_oper_log` VALUES ('161', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test19 更新成功<br/>2、账号 test20 更新成功\",\"code\":200}', '0', null, '2019-12-19 09:42:43');
INSERT INTO `sys_oper_log` VALUES ('162', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test19 更新成功<br/>2、账号 test20 更新成功\",\"code\":200}', '0', null, '2019-12-19 10:05:26');
INSERT INTO `sys_oper_log` VALUES ('163', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test19 更新成功<br/>2、账号 test20 更新成功\",\"code\":200}', '0', null, '2019-12-19 10:07:13');
INSERT INTO `sys_oper_log` VALUES ('164', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test19 更新成功<br/>2、账号 test20 更新成功\",\"code\":200}', '0', null, '2019-12-19 10:09:41');
INSERT INTO `sys_oper_log` VALUES ('165', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test19 已存在<br/>2、账号 test20 已存在', '2019-12-19 16:49:26');
INSERT INTO `sys_oper_log` VALUES ('166', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test19 更新成功<br/>2、账号 test20 更新成功\",\"code\":200}', '0', null, '2019-12-19 16:49:38');
INSERT INTO `sys_oper_log` VALUES ('167', '用户管理', '3', 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/12', '192.168.25.1', '内网IP', '{userIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-19 16:52:44');
INSERT INTO `sys_oper_log` VALUES ('168', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test19 已存在<br/>2、账号 test20 已存在', '2019-12-19 16:55:08');
INSERT INTO `sys_oper_log` VALUES ('169', '用户管理', '2', 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/user/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-19 17:01:57');
INSERT INTO `sys_oper_log` VALUES ('170', '用户管理', '2', 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/user/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-19 17:02:00');
INSERT INTO `sys_oper_log` VALUES ('171', '用户管理', '2', 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/user/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-19 17:02:02');
INSERT INTO `sys_oper_log` VALUES ('172', '用户管理', '2', 'com.ruoyi.project.system.controller.SysUserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/user/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-19 17:02:07');
INSERT INTO `sys_oper_log` VALUES ('173', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test19 更新成功<br/>2、账号 test20 更新成功\",\"code\":200}', '0', null, '2019-12-19 17:41:07');
INSERT INTO `sys_oper_log` VALUES ('174', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test21 导入成功<br/>2、账号 test22 导入成功\",\"code\":200}', '0', null, '2019-12-19 17:42:32');
INSERT INTO `sys_oper_log` VALUES ('175', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test21 更新成功<br/>2、账号 test22 更新成功\",\"code\":200}', '0', null, '2019-12-19 17:43:52');
INSERT INTO `sys_oper_log` VALUES ('176', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test21 已存在<br/>2、账号 test22 已存在', '2019-12-19 18:25:43');
INSERT INTO `sys_oper_log` VALUES ('177', '用户管理', '6', 'com.ruoyi.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test21 更新成功<br/>2、账号 test22 更新成功\",\"code\":200}', '0', null, '2019-12-19 18:25:59');
INSERT INTO `sys_oper_log` VALUES ('178', '用户头像', '2', 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '192.168.25.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/19/06ebfe6bd37d2f21e76f4743f727c47b.jpeg\",\"code\":200}', '0', null, '2019-12-19 18:27:27');
INSERT INTO `sys_oper_log` VALUES ('179', '菜单管理', '2', 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '192.168.25.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"0\",\"menuName\":\"简历档案信息管理\",\"params\":{},\"parentId\":1,\"path\":\"userinfo\",\"component\":\"system/userinfo/index\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":99,\"menuType\":\"C\",\"perms\":\"system:userinfo:list\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 11:57:26');
INSERT INTO `sys_oper_log` VALUES ('180', '用户管理', '3', 'com.ruoyi.project.system.controller.UserController.remove()', 'DELETE', '1', 'admin', null, '/system/userinfo/6', '192.168.25.1', '内网IP', '{userIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 12:01:53');
INSERT INTO `sys_oper_log` VALUES ('181', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test21 导入失败：\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'u.user_name\' in \'where clause\'\r\n### The error may exist in file [D:\\ruoyi-vue\\ruoyi\\target\\classes\\mybatis\\system\\userinfoMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.selectUserByUserName-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select user_id,U_Borth, user_name, nick_name, email, avatar, phonenumber, password, sex, status, del_flag, login_ip, login_date, create_by, create_time, remark         from user         where u.user_name = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'u.user_name\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'u.user_name\' in \'where clause\'<br/>2、账号 test22 导入失败：\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'u.user_name\' in \'where clause\'\r\n### The error may exist in file [D:\\ruoyi-vue\\ruoyi\\target\\classes\\mybatis\\system\\userinfoMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.selectUserByUserName-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select user_id,U_Borth, user_name, nick_name, email, avatar, phonenumber, password, sex, status, del_flag, login_ip, login_date, create_by, create_time, remark         from user         where u.user_name = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'u.user_name\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'u.user_name\' in \'where clause\'', '2019-12-20 12:02:03');
INSERT INTO `sys_oper_log` VALUES ('182', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test21 已存在<br/>2、账号 test22 已存在', '2019-12-20 12:30:37');
INSERT INTO `sys_oper_log` VALUES ('183', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test21 更新成功<br/>2、账号 test22 更新成功\",\"code\":200}', '0', null, '2019-12-20 12:30:51');
INSERT INTO `sys_oper_log` VALUES ('184', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"316a43b8-61fe-4140-a50b-92dbaef0c871_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-20 12:30:55');
INSERT INTO `sys_oper_log` VALUES ('185', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 16:02:41');
INSERT INTO `sys_oper_log` VALUES ('186', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 16:02:43');
INSERT INTO `sys_oper_log` VALUES ('187', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"\",\"email\":\"ry@qq.com\",\"borth\":\"1996-02-15\",\"nickName\":\"若依\",\"sex\":\"女\",\"avatar\":\"\",\"params\":{},\"userName\":\"test10\",\"userId\":10,\"createBy\":\"admin\",\"createTime\":1576637525000,\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 11', '2019-12-20 16:12:04');
INSERT INTO `sys_oper_log` VALUES ('188', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"3f221227-8984-451d-a861-aa731d9bc6fa_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-20 16:52:42');
INSERT INTO `sys_oper_log` VALUES ('189', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test23 导入成功<br/>2、账号 test24 导入成功\",\"code\":200}', '0', null, '2019-12-20 16:53:25');
INSERT INTO `sys_oper_log` VALUES ('190', '用户管理', '3', 'com.ruoyi.project.system.controller.UserController.remove()', 'DELETE', '1', 'admin', null, '/system/userinfo/24', '192.168.25.1', '内网IP', '{userIds=24}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 16:57:02');
INSERT INTO `sys_oper_log` VALUES ('191', '用户管理', '3', 'com.ruoyi.project.system.controller.UserController.remove()', 'DELETE', '1', 'admin', null, '/system/userinfo/23', '192.168.25.1', '内网IP', '{userIds=23}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 16:57:05');
INSERT INTO `sys_oper_log` VALUES ('192', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":11,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 18:15:53');
INSERT INTO `sys_oper_log` VALUES ('193', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":11,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 18:17:31');
INSERT INTO `sys_oper_log` VALUES ('194', '用户管理', '3', 'com.ruoyi.project.system.controller.UserController.remove()', 'DELETE', '1', 'admin', null, '/system/userinfo/16', '192.168.25.1', '内网IP', '{userIds=16}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-20 18:28:08');
INSERT INTO `sys_oper_log` VALUES ('195', '用户头像', '2', 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '192.168.25.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/23/b8fd630ed0fa862aa4c98914291f0f0b.jpeg\",\"code\":200}', '0', null, '2019-12-23 14:04:27');
INSERT INTO `sys_oper_log` VALUES ('196', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test23 更新成功<br/>2、账号 test24 更新成功\",\"code\":200}', '0', null, '2019-12-24 10:58:21');
INSERT INTO `sys_oper_log` VALUES ('197', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"ruoyi\",\"sex\":\"女\",\"avatar\":\"/static/img/311.55161163.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-25 11:15:20');
INSERT INTO `sys_oper_log` VALUES ('198', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"ruoyi\",\"sex\":\"女\",\"avatar\":\"311.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-25 11:22:15');
INSERT INTO `sys_oper_log` VALUES ('199', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"ruoyi\",\"sex\":\"女\",\"avatar\":\"311.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-25 11:23:01');
INSERT INTO `sys_oper_log` VALUES ('200', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"ruoyi\",\"sex\":\"女\",\"avatar\":\"311.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-25 11:23:20');
INSERT INTO `sys_oper_log` VALUES ('201', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"ruoyi\",\"sex\":\"女\",\"avatar\":\"3333.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-25 11:25:55');
INSERT INTO `sys_oper_log` VALUES ('202', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"ruoyi\",\"sex\":\"女\",\"avatar\":\"3333.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-25 11:26:50');
INSERT INTO `sys_oper_log` VALUES ('203', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"ruoyi\",\"sex\":\"女\",\"avatar\":\"3333.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-25 11:43:45');
INSERT INTO `sys_oper_log` VALUES ('204', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"borth\":\"1995-01-03\",\"nickName\":\"若依ruoyi、\",\"sex\":\"女\",\"avatar\":\"3333.jpg\",\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 12', '2019-12-25 11:45:21');
INSERT INTO `sys_oper_log` VALUES ('205', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"4e58d2bc-50db-487c-bd3f-6a37a762bd3c_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-25 17:00:09');
INSERT INTO `sys_oper_log` VALUES ('206', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":false,\"remark\":\"11111111\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"若依\",\"sex\":\"女\",\"avatar\":\"3333.jpg\",\"params\":{},\"userName\":\"test9\",\"userId\":9,\"createBy\":\"admin\",\"createTime\":1576637525000,\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 9', '2019-12-25 17:27:49');
INSERT INTO `sys_oper_log` VALUES ('207', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"borth\":\"1995-01-03\",\"nickName\":\"若依ruoyi、\",\"sex\":\"女\",\"avatar\":\"3333.jpg\",\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 12', '2019-12-25 17:36:32');
INSERT INTO `sys_oper_log` VALUES ('208', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15666666666\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"\",\"email\":\"ry@qq.com\",\"borth\":\"1996-02-15\",\"nickName\":\"若依\",\"sex\":\"女\",\"avatar\":\"3333.jpg\",\"params\":{},\"userName\":\"test8\",\"userId\":8,\"createBy\":\"admin\",\"createTime\":1576637231000,\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 12', '2019-12-25 17:41:56');
INSERT INTO `sys_oper_log` VALUES ('209', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"13566522624\",\"admin\":false,\"remark\":\"32131331311332131332\",\"delFlag\":\"0\",\"password\":\"\",\"loginIp\":\"\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"nickName\":\"卡牌\",\"sex\":\"女\",\"avatar\":\"tomato.jpg\",\"params\":{},\"userName\":\"test11\",\"userId\":11,\"createBy\":\"admin\",\"createTime\":1576639575000,\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 9', '2019-12-25 17:45:14');
INSERT INTO `sys_oper_log` VALUES ('210', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"13566522624\",\"admin\":false,\"remark\":\"32131331311332131332\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"ry@964097196.com\",\"borth\":\"1996-02-15\",\"nickName\":\"卡牌\",\"sex\":\"女\",\"avatar\":\"tomato.jpg\",\"params\":{},\"userName\":\"test11\",\"userId\":11,\"createBy\":\"admin\",\"createTime\":1576639575000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-25 17:46:30');
INSERT INTO `sys_oper_log` VALUES ('211', '用户头像', '2', 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '192.168.25.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/27/5c960bf92ad0d990eac4981335b9816d.jpeg\",\"code\":200}', '0', null, '2019-12-27 11:34:38');
INSERT INTO `sys_oper_log` VALUES ('212', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"title\":\"软件开发\",\"password\":\"\",\"hukou\":\"陕西延安\",\"school\":\"河北科技大学\",\"direcion\":\"java语言\",\"loginIp\":\"127.0.0.1\",\"cetPet\":\"CET4\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"address\":\"陕西延安志丹县\",\"mayor\":\"计算机科学与技术\",\"nickName\":\"ruoyi\",\"custom\":\"陕西\",\"sex\":\"女\",\"avatar\":\"311.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"professor\":\"系统开发工程师\",\"createTime\":1521171180000,\"grade\":\"本科\",\"healthstatus\":\"良好\",\"position\":\"软件开发工程师\",\"time\":1562051454000,\"raward\":\"计算机二级证书\",\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-27 17:21:32');
INSERT INTO `sys_oper_log` VALUES ('213', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"1542aa5a-69c6-4242-8b81-170715564355_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-30 09:51:14');
INSERT INTO `sys_oper_log` VALUES ('214', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"8dceca88-7c56-43b7-9bc9-b651dd045b59_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-30 10:38:22');
INSERT INTO `sys_oper_log` VALUES ('215', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"9c8551dd-8104-4e14-a0df-9034c503f2bb_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-30 14:23:25');
INSERT INTO `sys_oper_log` VALUES ('216', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"291444b3-196a-4e39-b338-bce1edcc2064_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-30 15:21:42');
INSERT INTO `sys_oper_log` VALUES ('217', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"71d7fc93-2d38-4150-98e7-bc2c8493befe_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-30 15:24:39');
INSERT INTO `sys_oper_log` VALUES ('218', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 8 条数据格式不正确，错误如下：<br/>1、账号 a 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'<br/>2、账号 b 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'<br/>3、账号 test85 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'<br/>4、账号 tes44 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'<br/>5、账号 test102 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'<br/>6、账号 test115 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'<br/>7、账号 test132 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'<br/>8、账号 tes 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.project.system.domain.User\'', '2019-12-30 15:55:08');
INSERT INTO `sys_oper_log` VALUES ('219', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 8 条数据格式不正确，错误如下：<br/>1、账号 a 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user(    user_id,         user_name,     nation,     email,     avatar,     phonenumber,     sex,     password,     status,     create_by,         U_Grade,     U_Borth,         U_Mayor,     U_Position,         U_Hukou,     U_Healthstatus,     U_Direcion,     U_Address,     U_Raward,     U_CetPet,         U_Professor,     U_Title,        create_time   )values(        ?,     ?,         ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,         ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,        sysdate()   )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1<br/>2、账号 b 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user(    user_id,         user_name,     nation,     email,     avatar,     phonenumber,     sex,     password,     status,     create_by,             U_Borth,                                                            create_time   )values(            ?,                                                             ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,        sysdate()   )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1<br/>3、账号 test85 导入失败：\r\n### Error updating database.  Cause: java.', '2019-12-30 15:58:02');
INSERT INTO `sys_oper_log` VALUES ('220', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 8 条数据格式不正确，错误如下：<br/>1、账号 a 导入失败：\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'U_Professor\' at row 1\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user(    user_id,         user_name,     nation,     email,     avatar,     phonenumber,     sex,     password,     status,     create_by,         U_Grade,     U_Borth,         U_Mayor,     U_Position,         U_Hukou,     U_Healthstatus,     U_Direcion,     U_Address,     U_Raward,     U_CetPet,         U_Professor,     U_Title,        create_time   )values(    ?,         ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,          ?,     ?,         ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,         ?,     ?,        sysdate()   )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'U_Professor\' at row 1\n; Data truncation: Data too long for column \'U_Professor\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'U_Professor\' at row 1<br/>2、账号 b 导入失败：\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'U_Professor\' at row 1\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user(    user_id,         user_name,     nation,     email,     avatar,     phonenumber,     sex,     password,     status,     create_by,         U_Grade,     U_Borth,         U_Mayor,     U_Position,         U_Hukou,     U_Healthstatus,     U_Direcion,     U_Address,     U_Raward,     U_CetPet,         U_Professor,     U_Title,        create_time   )values(    ?,         ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,', '2019-12-30 16:24:41');
INSERT INTO `sys_oper_log` VALUES ('221', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 a 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'23\' for key \'PRIMARY\'\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user(    user_id,         user_name,     nation,     email,     avatar,     phonenumber,     sex,     password,     status,     create_by,         U_Grade,     U_Borth,         U_Mayor,     U_Position,         U_Hukou,     U_Healthstatus,     U_Direcion,     U_Address,     U_Raward,     U_CetPet,         U_Professor,     U_Title,        create_time   )values(    ?,         ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,         ?,     ?,         ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,         ?,     ?,        sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'23\' for key \'PRIMARY\'\n; Duplicate entry \'23\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'23\' for key \'PRIMARY\'<br/>2、账号 b 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'24\' for key \'PRIMARY\'\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user(    user_id,         user_name,     nation,     email,     avatar,     phonenumber,     sex,     password,     status,     create_by,         U_Grade,     U_Borth,         U_Mayor,     U_Position,         U_Hukou,     U_Healthstatus,     U_Direcion,     U_Address,     U_Raward,     U_CetPet,         U_Professor,     U_Title,        create_time   )values(    ?,         ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,         ?,     ?,         ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,         ?,     ?,        sysdate()   ', '2019-12-30 16:37:03');
INSERT INTO `sys_oper_log` VALUES ('222', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 6 条数据格式不正确，错误如下：<br/>1、账号 test85 已存在<br/>2、账号 tes44 已存在<br/>3、账号 test102 已存在<br/>4、账号 test115 已存在<br/>5、账号 test132 已存在<br/>6、账号 tes 已存在', '2019-12-30 16:40:41');
INSERT INTO `sys_oper_log` VALUES ('223', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'true', 'null', '1', '很抱歉，导入失败！共 8 条数据格式不正确，错误如下：<br/>1、账号 a 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'<br/>2、账号 b 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'<br/>3、账号 test85 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'<br/>4、账号 tes44 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'<br/>5、账号 test102 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'<br/>6、账号 test115 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'<br/>7、账号 test132 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'<br/>8、账号 tes 导入失败：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'loginIp\' in \'class com.ruoyi.project.system.domain.User\'', '2019-12-30 16:40:58');
INSERT INTO `sys_oper_log` VALUES ('224', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 8 条，数据如下：<br/>1、账号 a 更新成功<br/>2、账号 b 更新成功<br/>3、账号 test85 更新成功<br/>4、账号 tes44 更新成功<br/>5、账号 test102 更新成功<br/>6、账号 test115 更新成功<br/>7、账号 test132 更新成功<br/>8、账号 tes 更新成功\",\"code\":200}', '0', null, '2019-12-30 16:42:41');
INSERT INTO `sys_oper_log` VALUES ('225', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1521171180000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"白鹏\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2019-12-30 16:45:18');
INSERT INTO `sys_oper_log` VALUES ('226', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1521171180000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"白鹏\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2019-12-30 16:45:31');
INSERT INTO `sys_oper_log` VALUES ('227', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1521171180000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"白鹏\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 16:50:42');
INSERT INTO `sys_oper_log` VALUES ('228', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"sssss\",\"title\":\"java\",\"hukou\":\"山西太原\",\"school\":\"河北科技大学\",\"postIds\":[],\"direcion\":\"推特\",\"email\":\"18131079714@qq.com\",\"borth\":\"2019-12-18\",\"address\":\"太原\",\"mayor\":\"计算机\",\"custom\":\"山西\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"aa\",\"professor\":\"java\",\"roleIds\":[],\"grade\":\"本科\",\"healthstatus\":\"良好\",\"position\":\"计算机\",\"time\":1576454400000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"新增用户\'aa\'失败，手机号码已存在\",\"code\":500}', '0', null, '2019-12-30 16:54:33');
INSERT INTO `sys_oper_log` VALUES ('229', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079711\",\"admin\":false,\"remark\":\"sssss\",\"title\":\"java\",\"hukou\":\"山西太原\",\"school\":\"河北科技大学\",\"postIds\":[],\"direcion\":\"推特\",\"email\":\"18131079714@qq.com\",\"borth\":\"2019-12-18\",\"address\":\"太原\",\"mayor\":\"计算机\",\"custom\":\"山西\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"aa\",\"createBy\":\"admin\",\"professor\":\"java\",\"roleIds\":[],\"grade\":\"本科\",\"healthstatus\":\"良好\",\"position\":\"计算机\",\"time\":1576454400000,\"raward\":\"计算机编程\",\"status\":\"0\"}', 'null', '1', '', '2019-12-30 16:54:42');
INSERT INTO `sys_oper_log` VALUES ('230', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079711\",\"admin\":false,\"remark\":\"sssss\",\"title\":\"java\",\"hukou\":\"山西太原\",\"school\":\"河北科技大学\",\"postIds\":[],\"direcion\":\"推特\",\"email\":\"18131079714@qq.com\",\"borth\":\"2019-12-18\",\"address\":\"太原\",\"mayor\":\"计算机\",\"custom\":\"山西\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"aa\",\"createBy\":\"admin\",\"professor\":\"java\",\"roleIds\":[],\"grade\":\"本科\",\"healthstatus\":\"良好\",\"position\":\"计算机\",\"time\":1576454400000,\"raward\":\"计算机编程\",\"status\":\"0\"}', 'null', '1', '', '2019-12-30 16:54:49');
INSERT INTO `sys_oper_log` VALUES ('231', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079711\",\"admin\":false,\"remark\":\"sssss\",\"title\":\"java\",\"hukou\":\"山西太原\",\"school\":\"河北科技大学\",\"postIds\":[],\"direcion\":\"推特\",\"email\":\"18131079714@qq.com\",\"borth\":\"2019-12-18\",\"address\":\"太原\",\"mayor\":\"计算机\",\"custom\":\"山西\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"aa\",\"createBy\":\"admin\",\"professor\":\"java\",\"roleIds\":[],\"grade\":\"本科\",\"healthstatus\":\"良好\",\"position\":\"计算机\",\"time\":1576454400000,\"raward\":\"计算机编程\",\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2019-12-30 16:55:59');
INSERT INTO `sys_oper_log` VALUES ('232', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079711\",\"admin\":false,\"remark\":\"sssss\",\"title\":\"java\",\"hukou\":\"山西太原\",\"school\":\"河北科技大学\",\"postIds\":[],\"direcion\":\"推特\",\"email\":\"18131079714@qq.com\",\"borth\":\"2019-12-18\",\"address\":\"太原\",\"mayor\":\"计算机\",\"custom\":\"山西\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"aa\",\"userId\":33,\"createBy\":\"admin\",\"professor\":\"java\",\"roleIds\":[],\"grade\":\"本科\",\"healthstatus\":\"良好\",\"position\":\"计算机\",\"time\":1576454400000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 16:58:50');
INSERT INTO `sys_oper_log` VALUES ('233', '用户管理', '3', 'com.ruoyi.project.system.controller.UserController.remove()', 'DELETE', '1', 'admin', null, '/system/userinfo/31', '192.168.25.1', '内网IP', '{userIds=31}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 16:59:42');
INSERT INTO `sys_oper_log` VALUES ('234', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"delFlag\":\"0\",\"title\":\"软件开发\",\"password\":\"\",\"hukou\":\"陕西延安\",\"school\":\"河北科技大学\",\"direcion\":\"java语言\",\"cetPet\":\"CET4\",\"email\":\"ry@163.com\",\"borth\":\"1996-02-15\",\"address\":\"陕西延安志丹县\",\"mayor\":\"计算机科学与技术\",\"custom\":\"陕西\",\"sex\":\"女\",\"updateTime\":1521171180000,\"avatar\":\"311.jpg\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"professor\":\"系统开发工程师\",\"createTime\":1521171180000,\"grade\":\"本科\",\"healthstatus\":\"良好\",\"position\":\"软件开发工程师\",\"time\":1562051454000,\"raward\":\"计算机二级证书\",\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2019-12-30 17:02:36');
INSERT INTO `sys_oper_log` VALUES ('235', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577695842000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"卡牌\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:04:51');
INSERT INTO `sys_oper_log` VALUES ('236', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577696691000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:05:21');
INSERT INTO `sys_oper_log` VALUES ('237', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079715\",\"admin\":false,\"remark\":\"asasasasas\",\"title\":\"计算机\",\"hukou\":\"山西太原\",\"school\":\"太原理工大学\",\"postIds\":[],\"direcion\":\"java\",\"email\":\"964097196@qq.com\",\"borth\":\"2019-12-17\",\"address\":\"北京\",\"mayor\":\"计算机\",\"custom\":\"山西\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"abc\",\"professor\":\"计算机\",\"roleIds\":[],\"grade\":\"专科\",\"healthstatus\":\"健康\",\"position\":\"计算机\",\"time\":1575331200000,\"raward\":\"cet6\",\"status\":\"0\"}', '{\"msg\":\"新增用户\'abc\'失败，邮箱账号已存在\",\"code\":500}', '0', null, '2019-12-30 17:27:43');
INSERT INTO `sys_oper_log` VALUES ('238', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079715\",\"admin\":false,\"remark\":\"asasasasas\",\"title\":\"计算机\",\"hukou\":\"山西太原\",\"school\":\"太原理工大学\",\"postIds\":[],\"direcion\":\"java\",\"email\":\"964097196@qq.com\",\"borth\":\"2019-12-17\",\"address\":\"北京\",\"mayor\":\"计算机\",\"custom\":\"山西\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"abcsss\",\"professor\":\"计算机\",\"roleIds\":[],\"grade\":\"专科\",\"healthstatus\":\"健康\",\"position\":\"计算机\",\"time\":1575331200000,\"raward\":\"cet6\",\"status\":\"0\"}', '{\"msg\":\"新增用户\'abcsss\'失败，邮箱账号已存在\",\"code\":500}', '0', null, '2019-12-30 17:27:51');
INSERT INTO `sys_oper_log` VALUES ('239', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"admin\":false,\"postIds\":[],\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"ssdkjkk\",\"createBy\":\"admin\",\"roleIds\":[],\"grade\":\"专科\",\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nation\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.mapper.UserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user(        dept_id,     user_name,             avatar,                 status,     create_by,         U_Grade,                                                                create_time   )values(        ?,     ?,             ?,                 ?,     ?,         ?,                                                                sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'nation\' doesn\'t have a default value\n; Field \'nation\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nation\' doesn\'t have a default value', '2019-12-30 17:28:30');
INSERT INTO `sys_oper_log` VALUES ('240', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"ssss\",\"title\":\"s\",\"hukou\":\"s\",\"school\":\"s\",\"postIds\":[],\"direcion\":\"s\",\"email\":\"964097196@qq.com\",\"borth\":\"2019-12-10\",\"address\":\"s\",\"mayor\":\"s\",\"custom\":\"ssdds\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"ssdkjkk\",\"professor\":\"s\",\"roleIds\":[],\"grade\":\"专科\",\"healthstatus\":\"s\",\"position\":\"s\",\"time\":1576627200000,\"raward\":\"s\",\"status\":\"0\"}', '{\"msg\":\"新增用户\'ssdkjkk\'失败，手机号码已存在\",\"code\":500}', '0', null, '2019-12-30 17:29:15');
INSERT INTO `sys_oper_log` VALUES ('241', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"ssss\",\"title\":\"s\",\"hukou\":\"s\",\"school\":\"s\",\"postIds\":[],\"direcion\":\"s\",\"email\":\"964097196@qq.com\",\"borth\":\"2019-12-10\",\"address\":\"s\",\"mayor\":\"s\",\"custom\":\"ssdds\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"ssdkjkk11111111\",\"professor\":\"s\",\"roleIds\":[],\"grade\":\"专科\",\"healthstatus\":\"s\",\"position\":\"s\",\"time\":1576627200000,\"raward\":\"s\",\"status\":\"0\"}', '{\"msg\":\"新增用户\'ssdkjkk11111111\'失败，手机号码已存在\",\"code\":500}', '0', null, '2019-12-30 17:29:22');
INSERT INTO `sys_oper_log` VALUES ('242', '用户管理', '1', 'com.ruoyi.project.system.controller.UserController.add()', 'POST', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079716\",\"admin\":false,\"remark\":\"ssss\",\"title\":\"s\",\"hukou\":\"s\",\"school\":\"s\",\"postIds\":[],\"direcion\":\"s\",\"email\":\"964097126@qq.com\",\"borth\":\"2019-12-10\",\"address\":\"s\",\"mayor\":\"s\",\"custom\":\"ssdds\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"ssdkjkk11111111\",\"userId\":34,\"createBy\":\"admin\",\"professor\":\"s\",\"roleIds\":[],\"grade\":\"专科\",\"healthstatus\":\"s\",\"position\":\"s\",\"time\":1576627200000,\"raward\":\"s\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:29:35');
INSERT INTO `sys_oper_log` VALUES ('243', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577696721000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:30:13');
INSERT INTO `sys_oper_log` VALUES ('244', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 8 条，数据如下：<br/>1、账号 a 更新成功<br/>2、账号 b 更新成功<br/>3、账号 test85 更新成功<br/>4、账号 tes44 更新成功<br/>5、账号 test102 更新成功<br/>6、账号 test115 更新成功<br/>7、账号 test132 更新成功<br/>8、账号 tes 更新成功\",\"code\":200}', '0', null, '2019-12-30 17:30:33');
INSERT INTO `sys_oper_log` VALUES ('245', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"78cc651b-8379-426d-94b5-5ad015751a3e_用户数据.xlsx\",\"code\":200}', '0', null, '2019-12-30 17:30:41');
INSERT INTO `sys_oper_log` VALUES ('246', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577698213000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:32:07');
INSERT INTO `sys_oper_log` VALUES ('247', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"推特\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577698327000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:47:48');
INSERT INTO `sys_oper_log` VALUES ('248', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"aaaaaaaa\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577699268000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:48:18');
INSERT INTO `sys_oper_log` VALUES ('249', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"aaaaaaaa\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577699298000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"cetpet\":\"cet6\",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:54:54');
INSERT INTO `sys_oper_log` VALUES ('250', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"aaaaaaaa\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577699694000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"本科 \",\"cetpet\":\"cet4\",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-30 17:55:13');
INSERT INTO `sys_oper_log` VALUES ('251', '用户管理', '6', 'com.ruoyi.project.system.controller.UserController.importData()', 'POST', '1', 'admin', null, '/system/userinfo/importData', '192.168.25.1', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 8 条数据格式不正确，错误如下：<br/>1、账号 a 已存在<br/>2、账号 b 已存在<br/>3、账号 test85 导入失败：nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2<br/>4、账号 tes44 导入失败：nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2<br/>5、账号 test102 已存在<br/>6、账号 test115 已存在<br/>7、账号 test132 已存在<br/>8、账号 tes 已存在', '2019-12-30 18:01:09');
INSERT INTO `sys_oper_log` VALUES ('252', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"aaaaaaaa\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577699713000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"2\",\"cetpet\":\"cet4\",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-31 10:34:16');
INSERT INTO `sys_oper_log` VALUES ('253', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-31 10:46:48');
INSERT INTO `sys_oper_log` VALUES ('254', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2019-12-31 10:46:52');
INSERT INTO `sys_oper_log` VALUES ('255', '用户头像', '2', 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '192.168.25.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/31/fed92d54bb4044ca2ec0812b2dd1df33.jpeg\",\"code\":200}', '0', null, '2019-12-31 10:47:51');
INSERT INTO `sys_oper_log` VALUES ('256', '用户头像', '2', 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '192.168.25.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/31/8d7ebb2663bd08e2494bd10055bce6c8.jpeg\",\"code\":200}', '0', null, '2019-12-31 11:25:46');
INSERT INTO `sys_oper_log` VALUES ('257', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"b6bd9ef6-2d01-4613-94b3-5ce781d1cbe8_用户数据.xlsx\",\"code\":200}', '0', null, '2020-01-02 16:37:58');
INSERT INTO `sys_oper_log` VALUES ('258', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":2,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-01-02 18:05:14');
INSERT INTO `sys_oper_log` VALUES ('259', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/userinfo/changeStatus', '192.168.25.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-01-02 18:05:22');
INSERT INTO `sys_oper_log` VALUES ('260', '用户管理', '5', 'com.ruoyi.project.system.controller.UserController.export()', 'GET', '1', 'admin', null, '/system/userinfo/export', '192.168.25.1', '内网IP', '{}', '{\"msg\":\"8eac4c3a-d76f-4d64-85f3-030f01bd90c1_用户数据.xlsx\",\"code\":200}', '0', null, '2020-01-03 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('261', '用户管理', '3', 'com.ruoyi.project.system.controller.UserController.remove()', 'DELETE', '1', 'admin', null, '/system/userinfo/33', '192.168.25.1', '内网IP', '{userIds=33}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-01-03 18:34:31');
INSERT INTO `sys_oper_log` VALUES ('262', '用户管理', '2', 'com.ruoyi.project.system.controller.UserController.edit()', 'PUT', '1', 'admin', null, '/system/userinfo', '192.168.25.1', '内网IP', '{\"nation\":\"汉族\",\"phonenumber\":\"18131079714\",\"admin\":false,\"remark\":\"测试员\",\"delFlag\":\"0\",\"title\":\"java初级\",\"password\":\"\",\"hukou\":\"陕西榆林\",\"school\":\"河北工程大学\",\"updateBy\":\"admin\",\"direcion\":\"aaaaaaaa\",\"email\":\"964097196@qq.com\",\"borth\":\"1995-01-11\",\"address\":\"北京\",\"mayor\":\"机械自动化\",\"custom\":\"陕西\",\"sex\":\"0\",\"updateTime\":1577959522000,\"avatar\":\"123.jpg\",\"params\":{},\"userName\":\"test7\",\"userId\":2,\"createBy\":\"admin\",\"professor\":\"java开发\",\"createTime\":1521171180000,\"grade\":\"1\",\"cetpet\":\"cet4\",\"healthstatus\":\"良好\",\"position\":\"计算机工程师\",\"time\":1576540800000,\"raward\":\"计算机编程\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-01-06 10:01:35');
INSERT INTO `sys_oper_log` VALUES ('263', '用户头像', '2', 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '192.168.25.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2020/01/06/2269d77cbc4a7c632da5ded55552336f.jpeg\",\"code\":200}', '0', null, '2020-01-06 10:40:15');
INSERT INTO `sys_oper_log` VALUES ('264', '用户头像', '2', 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '192.168.25.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2020/01/06/8caac8474f8304b4522314b8e7bbf417.jpeg\",\"code\":200}', '0', null, '2020-01-06 10:40:38');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2020/01/06/8caac8474f8304b4522314b8e7bbf417.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `t_base_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_base_userinfo`;
CREATE TABLE `t_base_userinfo` (
  `U_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `U_Name` varchar(50) DEFAULT NULL COMMENT '人员名',
  `U_Sex` char(10) DEFAULT NULL COMMENT '人员性别',
  `U_Nation` varchar(10) DEFAULT NULL COMMENT '人员民族',
  `U_Borth` varchar(50) DEFAULT NULL COMMENT '人员生日',
  `U_Grade` varchar(10) DEFAULT NULL COMMENT '人员学历',
  `U_School` varchar(50) DEFAULT NULL COMMENT '人员毕业院校',
  `U_Mayor` varchar(10) DEFAULT NULL COMMENT '人员所属专业',
  `U_Position` varchar(50) DEFAULT NULL COMMENT '人员所属职称',
  `U_Customs` varchar(50) DEFAULT NULL COMMENT '人员籍惯',
  `U_Hukou` varchar(50) DEFAULT NULL COMMENT '人员户籍',
  `U_Healthstatus` varchar(50) DEFAULT NULL COMMENT '健康状况',
  `U_Direcion` varchar(50) DEFAULT NULL COMMENT '人员所熟悉擅长',
  `U_TelMobile` decimal(18,0) DEFAULT NULL COMMENT '人员联系电话',
  `U_Email` varchar(50) DEFAULT NULL COMMENT '人员电子邮箱',
  `U_Address` text COMMENT '人员通信地址',
  `U_Raward` text COMMENT '人员获奖',
  `U_CetPet` varchar(50) DEFAULT NULL COMMENT '人员英语水平',
  `U_Time` datetime DEFAULT NULL COMMENT '人员参工日期',
  `U_Remak` text COMMENT '人员备注',
  `U_Photo` varchar(50) DEFAULT NULL COMMENT '人员照片',
  `U_Createtime` timestamp NULL DEFAULT NULL COMMENT '人员创建日期',
  `U_Updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '人员修改日期',
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `U_User_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `U_Dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `U_User_name` varchar(30) NOT NULL COMMENT '用户账号',
  `U_Nation` varchar(30) NOT NULL COMMENT '人员民族',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `U_Email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `U_Phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `U_Sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `U_Avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `U_Password` varchar(100) DEFAULT '' COMMENT '密码',
  `U_Status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `U_Del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `U_Create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `U_Create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `U_Update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `U_Update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `U_Remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `U_Borth` varchar(50) DEFAULT NULL,
  `U_Grade` varchar(10) DEFAULT NULL,
  `U_School` varchar(50) DEFAULT NULL,
  `U_Mayor` varchar(10) DEFAULT NULL,
  `U_Position` varchar(50) DEFAULT NULL,
  `U_Customs` varchar(50) DEFAULT NULL,
  `U_Hukou` varchar(50) DEFAULT NULL,
  `U_Healthstatus` varchar(50) DEFAULT NULL,
  `U_Direcion` varchar(50) DEFAULT NULL,
  `U_Address` text,
  `U_Raward` text,
  `U_CetPet` varchar(50) DEFAULT NULL,
  `U_Time` datetime DEFAULT NULL,
  `U_Professor` varchar(10) DEFAULT NULL,
  `U_Title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`U_User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '103', 'admin', '汉族', '00', 'ry@163.com', '15888888888', '女', '311.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员', '1996-02-15', '本科', '河北科技大学', '计算机科学与技术', '软件开发工程师', '陕西', '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', '2019-07-02 15:10:54', '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('2', '105', 'test7', '汉族', '00', '964097196@qq.com', '18131079714', '0', '123.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2020-01-06 10:01:35', '测试员', '1995-01-11', '1', '河北工程大学', '机械自动化', '计算机工程师', '陕西', '陕西榆林', '良好', 'aaaaaaaa', '北京', '计算机编程', 'cet4', '2019-12-17 08:00:00', 'java开发', 'java初级');
INSERT INTO `user` VALUES ('4', null, 'ry111', '汉族', '00', 'ry@qq.com', '15666666666', '女', '3333.jpg', '$2a$10$PnR5E3neUUq3fJD0zFAm1.nAfiK41ZRzRFGhYrFMlZILFXWnl78kq', '0', '2', '', null, 'admin', '2019-12-18 10:39:48', '', null, null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('6', null, 'ruoy111', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$r8AkbalkSQcBfJpTgOFy8uzbHbK8NIbPy0Ld9uCkVaAblXu/9JQdC', '0', '2', '', null, 'admin', '2019-12-18 10:41:28', '', null, null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('8', null, 'test8', '汉族', '00', 'ry@qq.com', '15666666667', '女', '3333.jpg', '$2a$10$nBsFUlRIjr1qpfcgUlyW1eiVPj4Rc2efjg4QmiwJBiMqpGuMUvcPu', '0', '0', '', null, 'admin', '2019-12-18 10:47:11', '', null, null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('9', null, 'test9', '汉族', '00', 'ry@163.com', '15888888888', '女', '', '$2a$10$SOhOhW1RLTWCPTvHKucLpuSyBx/J/0tJ4XQWUfsmesnVEH01dp7k.', '0', '0', '', null, 'admin', '2019-12-18 10:52:05', '', null, null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('10', null, 'test10', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$BNSzfZbjk5TiSjRR0hhUC.WDxZiis3LXNMperjrDZ92AnreuO3fxO', '0', '0', '', null, 'admin', '2019-12-18 10:52:05', 'admin', '2019-12-31 10:46:52', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('11', null, 'test11', '汉族', '00', 'ry@964097196.com', '13566522624', '女', 'tomato.jpg', '$2a$10$cpP9nsGeEgBz1a3.jL2UTuu.LaYl4rDX8ihALNyj46xhtXqAlT6ge', '0', '0', '', null, 'admin', '2019-12-18 11:26:15', 'admin', '2019-12-25 17:46:30', '32131331311332131332', '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('12', null, 'test12', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$VujntzMZmPf0hUi7dDxwIO1WwVg1kXlLj9jzOCT7RDl0J9AnRegvW', '0', '2', '', null, 'admin', '2019-12-18 11:26:15', '', null, null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('13', null, 'test13', '汉族', '00', 'ry@163.com', '15888888888', '女', '', '$2a$10$mvtVSzNYbHMAyXqDP0XNTO2dTpxJ2ClkVin7h4N3TBrE0wFPyza.e', '0', '0', '', null, 'admin', '2019-12-18 11:42:52', '', null, null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('14', null, 'test14', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$AwXmnRqqxKdIunCn/GZhAeurNpNL7ZuSAc2Kr/otloZDakuzm6mci', '0', '0', '', null, 'admin', '2019-12-18 11:42:52', '', null, null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('15', null, 'test15', '汉族', '00', 'ry@163.com', '15888888888', '女', '', '$2a$10$zvuViU..wJXFJU76v3To7.YaYulvdtl07lRNh1ne944FGul85Gq.y', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-18 12:02:41', 'admin', '2019-12-18 12:04:11', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('16', null, 'test16', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$XMDLfZ6qDPnoqksuXGrmjeuchzY6Ob77CRU4/cg6cqBT38KwewBl2', '0', '2', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-18 12:02:41', 'admin', '2019-12-18 12:04:11', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('17', null, 'test17', '汉族', '00', 'ry@163.com', '15888888888', '女', '', '$2a$10$YHa2SEUSvxCFQ6InU4xvOuiROoNWUotJhez1fWhNYUb00ADRDSWlW', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-18 12:05:13', 'admin', '2019-12-19 09:41:14', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('18', null, 'test18', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$wt5B1KPMg5EVJtZcER84heo4hnE8qV/unNoqldUVpley5.T5Hdf7O', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-18 12:05:13', 'admin', '2019-12-19 09:41:14', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('19', null, 'test19', '汉族', '00', 'ry@163.com', '15888888888', '女', '', '$2a$10$mP0VLULqajLQQE7j7Ucy9.J/5hAlmpZXvY8.Nb9MZR4AIpKT/j/V.', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-19 09:42:30', 'admin', '2019-12-19 17:41:07', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('20', null, 'test20', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$2r2KYB3Lg/fnam83cnpz0.x5q/Yi9WRCN.L2QyVbyx.sMl/PprhrK', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-19 09:42:30', 'admin', '2019-12-19 17:41:07', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('21', null, 'test21', '汉族', '00', 'ry@163.com', '15888888888', '女', '', '$2a$10$szr4G50Gn7kdBgVOFxGsT.8ux.cdNsK1haUexeUssTxGZu1JWkjXW', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-19 17:42:32', 'admin', '2019-12-20 12:30:50', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('22', null, 'test22', '汉族', '00', 'ry@qq.com', '15666666666', '女', '', '$2a$10$pUfBDldd.mGaGzxzzNrlc.cABs6DtFzrZRkHUbrlSrVZ4kbmtLD7y', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-19 17:42:32', 'admin', '2019-12-20 12:30:51', null, '1996-02-15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('23', null, 'test23', '汉族', '00', 'ry@163.com', '15888888888', '0', '', '$2a$10$M5THT0mZO6es.C/T5Y56ZOdj7gTM2RsTVR7.BsOOBjggODpzZbKEm', '0', '2', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-20 16:53:25', 'admin', '2019-12-24 10:58:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('24', null, 'test24', '汉族', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$nxD9MlmuhiovpC7E0X7CCOYoWEWDkP4RmoiNazd/gAbuNrKDRv4Cu', '0', '2', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2019-12-20 16:53:25', 'admin', '2019-12-24 10:58:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('25', null, 'test85', '汉族', '00', 'ry@qq.com', '15666666667', '1', '3333.jpg', '$2a$10$xX5efWfkCwe51dj2WZCR4.vYHSwBmDVyUoD0DJW2f4ZdSXb4CfJhC', '0', '0', '', null, 'admin', '2019-12-30 16:37:02', '', null, null, '1996-02-15', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('26', null, 'tes44', '汉族', '00', 'ry@163.com', '15888888888', '1', 'tomato.jpg', '$2a$10$Fuq5M7uRwUYJHc1apLuiMeVK6N0i2kzcnVDhHgK7ByHSDQTNmEvJu', '0', '0', '', null, 'admin', '2019-12-30 16:37:02', '', null, null, '1996-02-15', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('27', null, 'test102', '汉族', '00', 'ry@qq.com', '15666666666', '1', 'tomato.jpg', '$2a$10$109ldM8m9vZJ7IwButfNxeltpmhOIMLzlHZGQ6Y9EbxYwFRq8fhU2', '0', '0', '', null, 'admin', '2019-12-30 16:37:02', '', null, null, '1996-02-15', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('28', null, 'test115', '汉族', '00', 'ry@964097196.com', '13566522624', '1', 'tomato.jpg', '$2a$10$n.ccAskwxAqicSFnJlgA2OmKrzxJwRFIrzRplyVhUWTOyNQ3CEHIS', '0', '0', '', null, 'admin', '2019-12-30 16:37:02', '', null, null, '1996-02-15', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('29', null, 'test132', '汉族', '00', 'ry@163.com', '15888888888', '1', 'tomato.jpg', '$2a$10$CHsd4kNi5lAQWfeJlZpBCusFPhKp7jihS.FkyCd7jnlWesNuPep/e', '0', '0', '', null, 'admin', '2019-12-30 16:37:02', '', null, null, '1996-02-15', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('30', null, 'tes', '汉族', '00', 'ry@qq.com', '15666666666', '1', 'tomato.jpg', '$2a$10$rqM/oKUjZyDY9L5v0z9eTObnHVpLH/zLqim7W6nrhPnx00zinv3za', '0', '0', '', null, 'admin', '2019-12-30 16:37:03', '', null, null, '1996-02-15', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('31', null, 'a', '汉族', '00', 'ry@163.com', '15888888888', '1', '311.jpg', '$2a$10$Tg26zKxxlZwi1heNG87T3ODFgrvet3J.moHcSPXc53fzb9oaTCe5.', '0', '2', '', null, 'admin', '2019-12-30 16:40:41', 'admin', '2019-12-30 17:30:33', null, '1996-02-15', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('32', null, 'b', '汉族', '00', 'ry@qq.com', '15666666666', '1', 'profile.jpg', '$2a$10$a64jrYQ//9bnDJQos2T8WesPnahoK1dh9GCOGrezYfWn82BNTb2HC', '0', '0', '', null, 'admin', '2019-12-30 16:40:41', 'admin', '2019-12-30 17:30:33', null, '1995-01-03', '河北科技大学', null, '计算机科学与技术', '陕西', null, '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', null, '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('33', '100', 'test85', '汉族', '00', 'ry@qq.com', '15666666667', '1', '3333.jpg', '', '0', '2', '', null, 'admin', '2019-12-30 16:58:50', 'admin', '2019-12-30 17:30:33', 'sssss', '1996-02-15', '河北科技大学', '河北科技大学', '计算机科学与技术', '陕西', '山西', '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', '2019-12-16 08:00:00', '系统开发工程师', '软件开发');
INSERT INTO `user` VALUES ('34', '100', 'tes44', '汉族', '00', 'ry@163.com', '15888888888', '1', 'tomato.jpg', '', '0', '0', '', null, 'admin', '2019-12-30 17:29:35', 'admin', '2019-12-30 17:30:33', 'ssss', '1996-02-15', '河北科技大学', 's', '计算机科学与技术', '陕西', 'ssdds', '陕西延安', '良好', 'java语言', '陕西延安志丹县', '计算机二级证书', 'CET4', '2019-12-18 08:00:00', '系统开发工程师', '软件开发');
