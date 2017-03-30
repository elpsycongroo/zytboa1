/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/3/25 14:24:07                           */
/*==============================================================*/


drop table if exists account;

drop table if exists department;

drop table if exists emp_role;

drop table if exists employee;

drop table if exists goods;

drop table if exists log;

drop table if exists order_goods_detail;

drop table if exists pre_order;

drop table if exists privilege;

drop table if exists role;

drop table if exists role_pri;

drop table if exists supplier;

drop table if exists supplier_goods;

/*==============================================================*/
/* Table: account                                               */
/*==============================================================*/
create table account
(
  account_id           varchar(40) not null,
  account_name         varchar(32),
  account_password     varchar(16),
  account_image        varchar(1024),
  account_sex          int,
  account_age          int,
  primary key (account_id)
);

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
  dept_id              varchar(40) not null,
  dept_name            varchar(12),
  primary key (dept_id)
);

/*==============================================================*/
/* Table: emp_role                                              */
/*==============================================================*/
create table emp_role
(
  emp_id               varchar(40) not null,
  role_id              varchar(40) not null,
  state                int comment 'ghsck 供货商查看
            ghstj 供货商添加
            ghssc 供货商删除
            spck 商品查看
            sptj 商品添加
            spsc 商品删除
            xzdhdd 新增订货订单
            scdhdd 删除订货订单
            jhmxcx 进货明细查询
            xzchqd 新增出货清单
            chmxcx 出货明细查询
            jhxgbb 进货相关报表
            chxgbb 出货相关报表
            lrbb 利润报表
            gzhbsp 工作汇报审批
            ryqxsz 人员权限设置
            xtrz 系统日志',
  primary key (emp_id, role_id)
);

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee
(
  emp_id               varchar(40) not null,
  dept_id              varchar(40) not null,
  account_id           varchar(40) not null,
  emp_name             varchar(20),
  emp_number           varchar(40),
  primary key (emp_id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
  goods_id             varchar(40) not null,
  pre_order_goods_id   varchar(40),
  goods_name           varchar(32),
  goods_type           varchar(12),
  goods_unit           varchar(4),
  goods_producer       varchar(40),
  primary key (goods_id)
);

/*==============================================================*/
/* Table: log                                                   */
/*==============================================================*/
create table log
(
  log_id               varchar(40) not null,
  log_type             varchar(128),
  log_emp              varchar(40),
  log_time             timestamp,
  primary key (log_id)
);

/*==============================================================*/
/* Table: order_goods_detail                                    */
/*==============================================================*/
create table order_goods_detail
(
  pre_order_goods_id   varchar(40) not null,
  pre_order_id         varchar(40) not null,
  pre_order_price      float(10,2),
  pre_order_sum        decimal(10,2),
  primary key (pre_order_goods_id)
);

/*==============================================================*/
/* Table: pre_order                                             */
/*==============================================================*/
create table pre_order
(
  pre_order_id         varchar(40) not null,
  pre_order_amount     float(10,2),
  pre_order_date       timestamp,
  primary key (pre_order_id)
);

/*==============================================================*/
/* Table: privilege                                             */
/*==============================================================*/
create table privilege
(
  pri_id               varchar(40) not null,
  pri_name             varchar(12),
  primary key (pri_id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
  role_id              varchar(40) not null,
  role_name            varchar(12),
  primary key (role_id)
);

/*==============================================================*/
/* Table: role_pri                                              */
/*==============================================================*/
create table role_pri
(
  role_id              varchar(40) not null,
  pri_id               varchar(40) not null,
  primary key (role_id, pri_id)
);

/*==============================================================*/
/* Table: supplier                                              */
/*==============================================================*/
create table supplier
(
  sup_id               varchar(40) not null,
  sup_name             varchar(24) not null,
  sup_linkman          varchar(12),
  sup_phone            varchar(20),
  sup_address          varchar(48),
  sup_remark           varchar(48),
  sup_type             varchar(2),
  primary key (sup_id)
);

/*==============================================================*/
/* Table: supplier_goods                                        */
/*==============================================================*/
create table supplier_goods
(
  sup_id               varchar(40) not null,
  goods_id             varchar(40) not null,
  primary key (sup_id, goods_id)
);
-- ----------------------------
-- Table structure for `table_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `table_mapping`;
CREATE TABLE `table_mapping` (
  `tm_id` int(11) NOT NULL auto_increment,
  `tm_table_id` varchar(25) COMMENT '表名',
  `tm_table_col` varchar(30) COMMENT '字段名',
  `tm_table_col_key` int(2) COMMENT '字段Mapping键',
  `tm_table_col_val` varchar(255) COMMENT '字段mapping值',
  PRIMARY KEY  (`tm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table emp_role add constraint FK_emp_role foreign key (emp_id)
references employee (emp_id) on delete restrict on update restrict;

alter table emp_role add constraint FK_emp_role2 foreign key (role_id)
references role (role_id) on delete restrict on update restrict;

alter table employee add constraint FK_account_emp foreign key (account_id)
references account (account_id) on delete restrict on update restrict;

alter table employee add constraint FK_dept_emp foreign key (dept_id)
references department (dept_id) on delete restrict on update restrict;

alter table goods add constraint FK_order_goods_goods foreign key (pre_order_goods_id)
references order_goods_detail (pre_order_goods_id) on delete restrict on update restrict;

alter table order_goods_detail add constraint FK_order_order_goods foreign key (pre_order_id)
references pre_order (pre_order_id) on delete restrict on update restrict;

alter table role_pri add constraint FK_属于 foreign key (role_id)
references role (role_id) on delete restrict on update restrict;

alter table role_pri add constraint FK_拥有 foreign key (pri_id)
references privilege (pri_id) on delete restrict on update restrict;

alter table supplier_goods add constraint FK_属于2 foreign key (sup_id)
references supplier (sup_id) on delete restrict on update restrict;

alter table supplier_goods add constraint FK_拥有2 foreign key (goods_id)
references goods (goods_id) on delete restrict on update restrict;

