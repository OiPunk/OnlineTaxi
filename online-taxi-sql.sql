

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_ads
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ads`;
CREATE TABLE `tbl_ads` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `down_load_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '视频/图片地址',
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `video_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '视频图片',
  `position_id` int(16) NOT NULL DEFAULT '0' COMMENT '广告位id',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `city` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '展示城市',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '广告名称',
  `platform` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '平台',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：视频；2：图片',
  `people_tag_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '人群模板id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '1启用0停用',
  `operator_user` int(10) DEFAULT NULL COMMENT '操作人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_ad_position`;
CREATE TABLE `tbl_ad_position` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `position_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '广告位名称',
  `position_desc` text COLLATE utf8_unicode_ci NOT NULL COMMENT '广告位描述',
  `position_type` tinyint(1) NOT NULL COMMENT '广告位类型（1：客户端；2：大屏端）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：暂停；1：开启）',
  `most_count` tinyint(3) NOT NULL DEFAULT '0' COMMENT '广告上限',
  `content_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容类型（1：视频；2：图片）',
  `operator_user` int(10) NOT NULL DEFAULT '0' COMMENT '操作者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_alipay_callback_info`;
CREATE TABLE `tbl_alipay_callback_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '通知时间',
  `notify_type` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '通知类型',
  `notify_id` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '通知校验ID',
  `app_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝分配给开发者的应用ID',
  `charset` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT 'CHARSET',
  `version` varchar(3) CHARACTER SET utf8 DEFAULT NULL COMMENT '接口版本',
  `sign_type` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '签名类型',
  `sign` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '签名',
  `trade_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝交易号',
  `out_trade_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户订单号',
  `out_biz_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户业务号',
  `buyer_id` varchar(16) CHARACTER SET utf8 DEFAULT NULL COMMENT '买家支付宝用户号',
  `buyer_logon_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '买家支付宝账号',
  `seller_id` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '卖家支付宝用户号',
  `seller_email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '卖家支付宝账号',
  `trade_status` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '交易状态',
  `total_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单金额',
  `receipt_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '实收金额',
  `invoice_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开票金额',
  `buyer_pay_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '付款金额',
  `point_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '集分宝金额',
  `refund_fee` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '总退款金额',
  `subject` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单标题',
  `body` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品描述',
  `gmt_create` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易创建时间',
  `gmt_payment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易付款时间',
  `gmt_refund` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易退款时间',
  `gmt_close` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易结束时间',
  `fund_bill_list` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付金额信息',
  `passback_params` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '回传参数',
  `voucher_detail_list` varchar(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '优惠券信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='支付宝回调信息表';

DROP TABLE IF EXISTS `tbl_app_version_update`;
CREATE TABLE `tbl_app_version_update` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `platform` smallint(6) NOT NULL DEFAULT '0' COMMENT '上线系统 平台 1: ios, 2: android',
  `notice_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '通知类型（1:强制 2:非强制）',
  `prompt` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '升级提示（不超过30个字）',
  `note` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `start_time` datetime NOT NULL COMMENT '生效开始时间	',
  `end_time` datetime NOT NULL COMMENT '生效结束时间',
  `download_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '安装包url',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator_id` int(11) NOT NULL COMMENT '创建人',
  `app_type` int(2) NOT NULL COMMENT '1:乘客端，2：司机端  3:车机端',
  `app_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'app版本号',
  `use_status` int(2) NOT NULL DEFAULT '1' COMMENT '启用停用状态，0：停用，1：启用',
  `version_code` int(11) NOT NULL DEFAULT '0' COMMENT '版本号code',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='乘客端,司机端，车机端app更新';


DROP TABLE IF EXISTS `tbl_base_info_company`;
CREATE TABLE `tbl_base_info_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(256) NOT NULL COMMENT '公司名称',
  `identifier` varchar(32) NOT NULL COMMENT '统一社会信用代码',
  `business_scope` varchar(256) NOT NULL COMMENT '经营范围',
  `contact_address` varchar(256) NOT NULL COMMENT '通信地址',
  `economic_type` varchar(128) NOT NULL COMMENT '经营业户经济类型',
  `reg_capital` varchar(128) NOT NULL COMMENT '注册资本',
  `legal_name` varchar(256) NOT NULL COMMENT '法人代表姓名',
  `legal_id` varchar(32) NOT NULL COMMENT '法人代表身份证号',
  `legal_phone` varchar(32) NOT NULL COMMENT '法人代表电话',
  `legal_photo` varchar(128) NOT NULL COMMENT '法人代表身份证扫描件文件编号',
  `state` int(1) NOT NULL COMMENT '状态0有效，1失效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网约车平台公司基本信息';

DROP TABLE IF EXISTS `tbl_base_info_company_pay`;
CREATE TABLE `tbl_base_info_company_pay` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(256) NOT NULL COMMENT '银行或非银行支付机构名称',
  `pay_id` varchar(32) NOT NULL COMMENT '非银行支付机构支付业务许可证编号',
  `pay_type` varchar(64) NOT NULL COMMENT '支付业务类型',
  `pay_scope` varchar(64) NOT NULL COMMENT '业务覆盖范围',
  `prepare_bank` varchar(64) NOT NULL COMMENT '备付金存管银行',
  `count_date` int(10) NOT NULL COMMENT '结算周期（天）',
  `state` int(1) NOT NULL COMMENT '状态0有效，1失效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网约车平台公司支付信息';

-- ----------------------------
-- Records of tbl_base_info_company_pay
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_base_info_company_permit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_base_info_company_permit`;
CREATE TABLE `tbl_base_info_company_permit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `certificate` varchar(64) NOT NULL COMMENT '网络预约出租汽车经营许可证号',
  `operation_area` varchar(128) NOT NULL COMMENT '经营区域',
  `owner_name` varchar(256) NOT NULL COMMENT '公司名称',
  `organization` varchar(256) NOT NULL COMMENT '发证机构名称',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '有效期起',
  `stop_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '有效期止',
  `certify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '初次发证日期',
  `state` varchar(8) NOT NULL COMMENT '证照状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网约车平台公司经营许可证';

-- ----------------------------
-- Records of tbl_base_info_company_permit
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_base_info_company_service
-- ----------------------------
DROP TABLE IF EXISTS `tbl_base_info_company_service`;
CREATE TABLE `tbl_base_info_company_service` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(128) NOT NULL COMMENT '服务机构名称',
  `service_no` varchar(64) NOT NULL COMMENT '服务机构代码',
  `detail_address` varchar(128) NOT NULL COMMENT '服务机构地址',
  `responsible_name` varchar(64) NOT NULL COMMENT '服务机构负责人姓名',
  `responsible_phone` varchar(32) NOT NULL COMMENT '负责人联系电话',
  `manager_name` varchar(64) NOT NULL COMMENT '服务机构管理人姓名',
  `manager_phone` varchar(32) NOT NULL COMMENT '管理人联系电话',
  `contact_phone` varchar(32) NOT NULL COMMENT '服务机构紧急联系电话',
  `mail_address` varchar(128) NOT NULL COMMENT '行政文书送达邮寄地址',
  `create_date` datetime DEFAULT NULL COMMENT '服务机构设立日期',
  `state` int(1) DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网约车平台公司服务机构';

-- ----------------------------
-- Records of tbl_base_info_company_service
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_call_records
-- ----------------------------
DROP TABLE IF EXISTS `tbl_call_records`;
CREATE TABLE `tbl_call_records` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `pool_key` varchar(64) DEFAULT NULL COMMENT '对应的号池Key',
  `sub_id` varchar(64) DEFAULT NULL COMMENT '通话对应的三元组的绑定关系ID',
  `call_id` varchar(64) DEFAULT NULL COMMENT '唯一标识一通通话记录的ID',
  `phone_no` varchar(64) DEFAULT NULL COMMENT 'AXB中的A号码',
  `secret_no` varchar(64) DEFAULT NULL COMMENT 'AXB中的X号码',
  `peer_no` varchar(64) DEFAULT NULL COMMENT 'AXB中的B号码或者N号码',
  `call_type` varchar(64) DEFAULT NULL COMMENT '呼叫类型\r\n0:主叫(phone_no打给peer_no)；1:被叫(peer_no打给phone_no)；2:短信发送；3:短信接收',
  `call_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '呼叫动作开始时间',
  `ring_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '对端手机振铃时间',
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '对端接听时间',
  `release_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '对端挂断时间，release_time - start_time 代表通话时长 如果结果为0,代表呼叫未接通',
  `release_dir` varchar(4) DEFAULT NULL COMMENT '通话释放方向',
  `release_cause` int(4) DEFAULT NULL COMMENT '释放原因\r\n1:未分配的号码\r\n2:无路由到指定的转接网\r\n3:无路由到目的地\r\n4:发送专用信息音\r\n16:正常的呼叫拆线\r\n17:用户忙\r\n18:用户未响应\r\n19:用户未应答\r\n20:用户缺席\r\n21:呼叫拒收\r\n22:号码改变\r\n27:目的地不可达\r\n28:无效的号码格式（地址不全）\r\n29:性能拒绝\r\n31:正常—未指定\r\n34: 无电路/通路可用\r\n42: 交换设备拥塞\r\n50:所请求的性能未预定\r\n53:CUG中限制去呼叫\r\n55: CUG中限制来呼叫\r\n57:承载能力无权\r\n58:承载能力目前不可用\r\n65:承载能力未实现\r\n69:所请求的性能未实现\r\n87:被叫用户不是CUG的成员\r\n88:不兼容的目的地\r\n90:不存在的CUG\r\n91:无效的转接网选择\r\n95:无效的消息，未指定\r\n97:消息类型不存在或未实现\r\n99:参数不存在或未实现\r\n102:定时器终了时恢复\r\n103:参数不存在或未实现—传递\r\n110:消息带有未被识别的参数—舍弃\r\n111:协议错误，未指定\r\n127:互通，未指定',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='通话记录表';

DROP TABLE IF EXISTS `tbl_car_base_info`;
CREATE TABLE `tbl_car_base_info` (
  `id` int(11) NOT NULL COMMENT '车辆id',
  `company_logo` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司标识',
  `car_label` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车辆厂牌',
  `car_base_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车辆类型',
  `car_owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车辆所有人',
  `plate_color` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车牌颜色',
  `engine_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发动机号电动机号',
  `car_brain_plate` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车脑品牌',
  `car_brain_number` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车脑编号',
  `vin_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vin码',
  `register_time` date DEFAULT NULL COMMENT '注册日期',
  `fuel_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '燃料类型',
  `engine_capacity` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发动机排量',
  `car_img_file_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车辆照片文件编号',
  `transport_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '运输证字号',
  `transport_issuing_authority` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车辆运输证发证机构',
  `business_area` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '经营区域',
  `transport_certificate_validity_start` date DEFAULT NULL COMMENT '车辆运输证有效期起',
  `transport_certificate_validity_end` date DEFAULT NULL COMMENT '车辆运输证有效期止',
  `first_register_time` date DEFAULT NULL COMMENT '车辆初次登记日期',
  `state_of_repair` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车辆检修状态',
  `next_annual_inspection_time` date DEFAULT NULL COMMENT '下次年检时间',
  `annual_audit_status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '年度审核状态',
  `invoice_printing_equipment_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发票打印设备序列号',
  `gps_brand` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '卫星定位装置品牌',
  `gps_model` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '型号',
  `gps_imei` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'imei',
  `gps_install_time` date DEFAULT NULL COMMENT '安装日期',
  `report_time` date DEFAULT NULL COMMENT '报备日期',
  `service_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '服务类型',
  `charge_type_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '运价类型编码',
  `car_invoice_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '车辆发票',
  `quality_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '合格证',
  `vehicle_license_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '行驶证',
  `registration_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '登记证书',
  `tax_payment_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '完税证明',
  `transport_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '汽车运输证',
  `other_img1` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '其他一',
  `other_img2` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '其他二',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_car_bind_change_record`;
CREATE TABLE `tbl_car_bind_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_info_id` int(10) unsigned NOT NULL COMMENT '车辆ID',
  `bind_tag` varchar(30) NOT NULL COMMENT '绑定类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `bind_value` varchar(500) NOT NULL COMMENT '绑定内容',
  `bind_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0绑定,1解绑',
  `operator_id` int(10) unsigned NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='车辆绑定信息变更表';

DROP TABLE IF EXISTS `tbl_car_brand`;
CREATE TABLE `tbl_car_brand` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '车辆品牌ID',
  `brand` varchar(16) NOT NULL DEFAULT '' COMMENT '车辆品牌',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '车辆型号',
  `seats` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '标准座位数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：未删除，1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `tbl_car_dispatch_capacity_set`;
CREATE TABLE `tbl_car_dispatch_capacity_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `car_service_period` tinyint(1) NOT NULL DEFAULT '0' COMMENT '车辆服务时段 1白天2夜晚',
  `spare_driver_count` int(10) NOT NULL DEFAULT '0' COMMENT '空闲司机数量',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='车辆调度运力设置';


DROP TABLE IF EXISTS `tbl_car_dispatch_direct_route_order_radius_set`;
CREATE TABLE `tbl_car_dispatch_direct_route_order_radius_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务类型id',
  `direct_route_order_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '顺风单类型 1回家单 2接力单 3特殊时段预约单',
  `direct_route_order_radius` int(10) NOT NULL DEFAULT '0' COMMENT '顺风单半径（公里）',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1已删除',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='车辆调度顺风单半径设置';


DROP TABLE IF EXISTS `tbl_car_dispatch_distribute_interval_set`;
CREATE TABLE `tbl_car_dispatch_distribute_interval_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务类型id',
  `car_service_before_interval` int(10) NOT NULL DEFAULT '0' COMMENT '用车服务前间隔（分钟）',
  `car_service_after_interval` int(10) NOT NULL DEFAULT '0' COMMENT '用车服务后间隔（分钟）',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='车辆调度派单间隔设置';


DROP TABLE IF EXISTS `tbl_car_dispatch_distribute_radius_set`;
CREATE TABLE `tbl_car_dispatch_distribute_radius_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务类型id',
  `min_radius` int(10) NOT NULL DEFAULT '0' COMMENT '最小派单半径（公里）',
  `min_radius_first_push_driver_count` int(10) NOT NULL DEFAULT '0' COMMENT '最小派单半径首次推送司机数量',
  `max_radius` int(10) NOT NULL DEFAULT '0' COMMENT '最大派单半径（公里）',
  `max_radius_first_push_driver_count` int(10) NOT NULL DEFAULT '0' COMMENT '最大派单半径首次推送司机数量',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='车辆调度派单半径设置';


DROP TABLE IF EXISTS `tbl_car_dispatch_distribute_set`;
CREATE TABLE `tbl_car_dispatch_distribute_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `is_force_distribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启强派 0不开启 1开启',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='车辆调度派发设置';


DROP TABLE IF EXISTS `tbl_car_dispatch_special_period_set`;
CREATE TABLE `tbl_car_dispatch_special_period_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `service_type_id` int(10) NOT NULL,
  `time_period` varchar(255) NOT NULL DEFAULT '' COMMENT '时段设置',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1已删除',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='车辆调度特殊时段设置';


DROP TABLE IF EXISTS `tbl_car_dispatch_time_threshold_set`;
CREATE TABLE `tbl_car_dispatch_time_threshold_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务类型id',
  `time_threshold_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '时间阈值类型 1开启立即用车派单逻辑 2预约用车待派订单开启强派模式',
  `time_threshold` int(10) NOT NULL DEFAULT '0' COMMENT '时间阈值（分钟）',
  `operator_id` int(10) DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='车辆调度时间阈值设置';


DROP TABLE IF EXISTS `tbl_car_driver_bind_record`;
CREATE TABLE `tbl_car_driver_bind_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_info_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '司机ID',
  `car_info_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆ID',
  `operator_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'system',
  `type` int(11) NOT NULL COMMENT '1绑定0解绑',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bind_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '绑定时间',
  `unbind_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '解绑时间',
  `total_mile` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '车辆总里程',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tbl_car_info`;
CREATE TABLE `tbl_car_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '车辆id',
  `plate_number` varchar(16) NOT NULL DEFAULT '' COMMENT '车牌号',
  `operation_status` int(2) NOT NULL DEFAULT '0' COMMENT '运营状态：-1，删除 0，上架 1，下架 2，待整备',
  `publish_time` datetime DEFAULT NULL COMMENT '上架时间',
  `full_name` varchar(64) NOT NULL DEFAULT '' COMMENT '车辆全名',
  `color` varchar(30) NOT NULL DEFAULT '' COMMENT '车身颜色',
  `car_img` varchar(256) NOT NULL DEFAULT '' COMMENT '汽车图片',
  `city_code` varchar(32) NOT NULL DEFAULT '' COMMENT '城市',
  `car_type_id` int(16) unsigned NOT NULL DEFAULT '0' COMMENT '车辆类型',
  `car_level_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '车辆级别',
  `regist_date` datetime DEFAULT NULL COMMENT '上牌日期',
  `insurance_start_date` datetime DEFAULT NULL COMMENT '保险生效日期',
  `insurance_end_date` datetime DEFAULT NULL COMMENT '保险失效日期',
  `annual_end_date` datetime DEFAULT NULL COMMENT '年检到期日期',
  `car_license_img` varchar(256) NOT NULL DEFAULT '' COMMENT '行驶本图片地址',
  `is_free_order` int(2) DEFAULT '0' COMMENT '是否开启顺风单0：停用，1：启用',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `use_status` int(2) NOT NULL DEFAULT '0' COMMENT '启用停用状态，0：停用，1：启用',
  `large_screen_device_code` varchar(256) NOT NULL DEFAULT '' COMMENT '大屏编号',
  `large_screen_device_brand` varchar(64) NOT NULL DEFAULT '' COMMENT '大屏品牌名称',
  `car_screen_device_code` varchar(256) NOT NULL DEFAULT '' COMMENT '车机/脑设备号',
  `car_screen_device_brand` varchar(64) NOT NULL DEFAULT '' COMMENT '车机/脑品牌名称',
  `operator_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `total_mile` int(11) NOT NULL DEFAULT '0' COMMENT '行驶总里程单位：km',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_car_level`;
CREATE TABLE `tbl_car_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) NOT NULL DEFAULT '' COMMENT '车辆级别标签',
  `icon` varchar(500) NOT NULL DEFAULT '' COMMENT '车型图标',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `enable` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态:0未启用1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='车辆级别列表';


DROP TABLE IF EXISTS `tbl_car_machine_info_record`;
CREATE TABLE `tbl_car_machine_info_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_device_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '设备唯一号',
  `mileage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计总里程,km',
  `sub_mileage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计分里程',
  `is_ns` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '南纬或北纬  n或s',
  `latitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `is_ew` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '是否东经西经 e或w',
  `longitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '经度',
  `qf` int(2) NOT NULL DEFAULT '0' COMMENT '质量因子',
  `satellite_num` int(8) NOT NULL DEFAULT '0' COMMENT '可使用卫星数量',
  `accuracy` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '精度，米',
  `gps_accuracy_status` int(2) NOT NULL DEFAULT '0' COMMENT '卫星信号强度',
  `elevation` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '海拔',
  `direction` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '方向',
  `surplus_distance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '剩余续航里程',
  `parking_sw` int(2) NOT NULL DEFAULT '0' COMMENT '手刹开关',
  `key_pos` int(2) NOT NULL DEFAULT '0' COMMENT '钥匙位置',
  `sw_gear` int(2) NOT NULL DEFAULT '0' COMMENT '档位信号',
  `brk_sta` int(2) NOT NULL DEFAULT '0' COMMENT '制动踏板位置',
  `car_speed` int(10) NOT NULL DEFAULT '0' COMMENT '瞬时车速',
  `ev_soc` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '剩余电量',
  `limt_speed` int(10) NOT NULL DEFAULT '0' COMMENT '整车最大车速',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_car_machine_info_record
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_car_screen_driver
-- ----------------------------
DROP TABLE IF EXISTS `tbl_car_screen_driver`;
CREATE TABLE `tbl_car_screen_driver` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `driver_id` int(16) NOT NULL COMMENT '司机id',
  `car_screen_code` varchar(128) NOT NULL DEFAULT '' COMMENT '汽车屏幕唯一码',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '登出时间',
  `login_status` int(2) NOT NULL COMMENT '登录状态：1：登录，2：退出登录',
  `repair_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修复登出时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_car_screen_driver
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_car_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_car_type`;
CREATE TABLE `tbl_car_type` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(30) NOT NULL DEFAULT '' COMMENT '品牌',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '型号',
  `seats` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '座位数量',
  `city` varchar(30) NOT NULL DEFAULT '' COMMENT '城市',
  `type_desc` varchar(60) NOT NULL DEFAULT '',
  `img_url` varchar(500) NOT NULL DEFAULT '' COMMENT '车型图片地址',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0：未启用，1：已启用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `operator_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `tbl_channel`;
CREATE TABLE `tbl_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(64) NOT NULL COMMENT '渠道名称',
  `channel_status` int(2) NOT NULL DEFAULT '0' COMMENT '渠道开启暂停状态 1开启 0暂停',
  `operator_id` int(11) NOT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300005 DEFAULT CHARSET=utf8 COMMENT='渠道管理表';


DROP TABLE IF EXISTS `tbl_charge_rule`;
CREATE TABLE `tbl_charge_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_code` varchar(32) NOT NULL DEFAULT '' COMMENT '城市编码',
  `service_type_id` int(10) NOT NULL COMMENT '服务类型',
  `channel_id` int(10) NOT NULL COMMENT '渠道名称',
  `car_level_id` int(10) NOT NULL COMMENT '车辆级别',
  `lowest_price` double(10,2) NOT NULL COMMENT '基础价',
  `base_price` double(10,2) NOT NULL COMMENT '起步价',
  `base_kilo` double(10,2) NOT NULL COMMENT '基础价格包含公里数',
  `base_minutes` double(10,2) NOT NULL COMMENT '基础价格包含时长数(分钟)',
  `per_kilo_price` double(10,2) NOT NULL COMMENT '超公里单价(每公里单价)',
  `per_minute_price` double(10,2) NOT NULL COMMENT '超时间单价(每分钟单价)',
  `beyond_start_kilo` double(10,2) NOT NULL COMMENT '远途起算公里',
  `beyond_per_kilo_price` double(10,2) NOT NULL COMMENT '远途单价',
  `night_start` time DEFAULT NULL COMMENT '夜间时间段开始',
  `night_end` time DEFAULT NULL COMMENT '夜间时间段结束',
  `night_per_kilo_price` double(10,2) DEFAULT NULL COMMENT '夜间超公里加收单价',
  `night_per_minute_price` double(10,2) DEFAULT NULL COMMENT '夜间超时间加收单价',
  `effective_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '生效时间',
  `active_status` int(11) NOT NULL DEFAULT '0' COMMENT '生效状态 0已失效 1未失效',
  `is_unuse` int(11) NOT NULL DEFAULT '0' COMMENT '是否不可用 0可用 1不可用',
  `creator_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='计费规则表';


DROP TABLE IF EXISTS `tbl_charge_rule_detail`;
CREATE TABLE `tbl_charge_rule_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) NOT NULL,
  `start` int(2) NOT NULL COMMENT '时间段开始',
  `end` int(2) NOT NULL COMMENT '时间段结束',
  `per_kilo_price` double(10,2) NOT NULL COMMENT '超公里单价',
  `per_minute_price` double(10,2) NOT NULL COMMENT '超时间单价',
  `is_delete` int(10) NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计费规则时间段表';


DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE `tbl_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(64) NOT NULL COMMENT '城市名称',
  `city_code` varchar(32) NOT NULL COMMENT '城市编码',
  `city_longitude_latitude` varchar(64) NOT NULL COMMENT '城市中心经纬度',
  `order_risk_top` int(4) NOT NULL COMMENT '下单风险上限值',
  `city_status` int(2) NOT NULL DEFAULT '0' COMMENT '是否开通 0未开通 1开通',
  `operator_id` int(11) NOT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_code` (`city_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='城市表';


DROP TABLE IF EXISTS `tbl_coupon`;
CREATE TABLE `tbl_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `status` int(4) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券状态 0:禁用, 1:启用',
  `coupon_name` varchar(60) NOT NULL COMMENT '优惠券名称',
  `coupon_desc` varchar(250) NOT NULL DEFAULT '' COMMENT '优惠券描述',
  `coupon_type` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '优惠方式 1:现金券, 3:专项券-免费送车券, 4:专项券-免费还车券 2:折扣券',
  `coupon_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券类型ID',
  `coupon_class_name` varchar(60) NOT NULL DEFAULT '' COMMENT '优惠券类型名称',
  `get_method` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1,主动发放. 2,用户获取',
  `minimum_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单最低金额',
  `reduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '减免金额 仅现金券有此项',
  `maximum_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高抵扣金额',
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '折扣比例',
  `effective_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '有效期类型 1：天数 ，2：时间段',
  `effective_day` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '有效期天数',
  `enable_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '有效期开始时间',
  `expire_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_user` varchar(30) NOT NULL DEFAULT '' COMMENT '创建用户',
  `function_type` int(4) NOT NULL DEFAULT '1' COMMENT '功能类型 1:市场活动, 2:订单赔付',
  `total_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数量',
  `get_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已获取',
  `used_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已使用',
  `operator_id` int(10) unsigned DEFAULT '0' COMMENT '操作人ID',
  PRIMARY KEY (`id`),
  KEY `inx_fuction_type` (`function_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券配置表';

DROP TABLE IF EXISTS `tbl_coupon_activity`;
CREATE TABLE `tbl_coupon_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_no` varchar(30) NOT NULL DEFAULT '' COMMENT '方案编号',
  `activity_name` varchar(30) NOT NULL DEFAULT '' COMMENT '方案名称',
  `enable_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `expire_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  `activity_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '优惠形式',
  `coupon_rule` varchar(250) NOT NULL DEFAULT '' COMMENT '领券规则',
  `activity_desc` varchar(250) NOT NULL DEFAULT '' COMMENT '活动描述',
  `get_times` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '领券次数',
  `send_times` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发送次数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后变更人id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0冻结1正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营销方案表';


DROP TABLE IF EXISTS `tbl_coupon_class`;
CREATE TABLE `tbl_coupon_class` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优惠方式:1现金券,2折扣券',
  `coupon_name` varchar(30) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `reduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '折扣比例(8, 7.5)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后修改人id',
  `is_pause` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '暂停:0否1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='优惠券类型表';

DROP TABLE IF EXISTS `tbl_coupon_conditions`;
CREATE TABLE `tbl_coupon_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `hour_set` varchar(80) NOT NULL DEFAULT '' COMMENT '小时集合',
  `week_set` varchar(15) NOT NULL DEFAULT '' COMMENT '周集合',
  `date_set` varchar(80) NOT NULL DEFAULT '' COMMENT '日期集合',
  `city_set` varchar(1023) NOT NULL DEFAULT '' COMMENT '城市集合',
  `car_set` varchar(60) NOT NULL DEFAULT '' COMMENT '车辆类型集合',
  `service_set` varchar(30) NOT NULL DEFAULT '' COMMENT '服务集合',
  `level_set` varchar(30) NOT NULL DEFAULT '',
  `hour_raw` varchar(120) NOT NULL DEFAULT '' COMMENT '时段原始数据',
  `date_raw` varchar(120) NOT NULL DEFAULT '' COMMENT '日期原始数据',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='优惠券使用条件限制表';


DROP TABLE IF EXISTS `tbl_coupon_send_info`;
CREATE TABLE `tbl_coupon_send_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_num` int(11) NOT NULL COMMENT '发放数量',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `operator_user` varchar(64) NOT NULL COMMENT '操作用户',
  `get_num` int(11) NOT NULL COMMENT '领取数量',
  `use_num` int(11) NOT NULL COMMENT '使用数量',
  `coupon_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `img_url` varchar(128) NOT NULL,
  `message` varchar(256) NOT NULL,
  `send_list` varchar(5120) NOT NULL,
  `send_time` datetime NOT NULL,
  `send_status` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL COMMENT '优惠券文案',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tbl_coupon_task`;
CREATE TABLE `tbl_coupon_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `coupon_name` varchar(30) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `number` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '发放数量',
  `task_tag` varchar(30) NOT NULL DEFAULT '' COMMENT '任务标签,用于区分不同批次',
  `people_tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '人群模板ID',
  `task_target` varchar(1280) NOT NULL DEFAULT '' COMMENT '任务目标,最多100个手机号',
  `app_tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'app文案模板ID',
  `sms_tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '短信文案模板ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `task_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态:0未开始1进行中2完成',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_cancel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否终止:0否,1是',
  `plan_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '计划发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='优惠券发送任务表';

DROP TABLE IF EXISTS `tbl_device_blacklist`;
CREATE TABLE `tbl_device_blacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_type` char(1) NOT NULL DEFAULT '' COMMENT '1 android 2 ios3 other',
  `device_code` varchar(64) NOT NULL DEFAULT '' COMMENT '手机设备串码',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `is_release` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '1 解禁，0 未解禁',
  `phones` mediumtext COMMENT '欠款手机号',
  `memo` mediumtext NOT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='设备黑名单';

DROP TABLE IF EXISTS `tbl_dictionary`;
CREATE TABLE `tbl_dictionary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dic_parentid` int(10) NOT NULL COMMENT '父id',
  `dic_type` varchar(100) NOT NULL DEFAULT '' COMMENT '类型',
  `dic_name` varchar(50) NOT NULL DEFAULT '',
  `dic_value` varchar(200) NOT NULL DEFAULT '' COMMENT '值',
  `dic_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  `dic_order` int(5) unsigned NOT NULL COMMENT '排序',
  `dic_status` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `typeindex` (`dic_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of tbl_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_driver_address
-- ----------------------------
DROP TABLE IF EXISTS `tbl_driver_address`;
CREATE TABLE `tbl_driver_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) unsigned NOT NULL COMMENT '司机id',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '详细地址',
  `address_longitude` varchar(32) NOT NULL DEFAULT '' COMMENT '地址经度',
  `address_latitude` varchar(32) NOT NULL DEFAULT '' COMMENT '地址纬度',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '编辑时间',
  `tag` varchar(15) NOT NULL DEFAULT '' COMMENT '标签',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='司机顺风地址记录表';

DROP TABLE IF EXISTS `tbl_driver_advice`;
CREATE TABLE `tbl_driver_advice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) NOT NULL DEFAULT '0' COMMENT '司机id',
  `advice_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '反馈类型',
  `advice_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '反馈内容',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '司机电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_driver_base_info`;
CREATE TABLE `tbl_driver_base_info` (
  `id` int(11) NOT NULL,
  `mobile_operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机运营商',
  `company_logo` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '公司标识',
  `administrative_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '注册行政地区代码',
  `birthday` date DEFAULT NULL COMMENT '驾驶员出生日期',
  `country` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '国籍',
  `national` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '驾驶员民族',
  `driving_licence_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '驾驶证编号',
  `marital_status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '婚姻状况',
  `foreign_language_ability` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '外语能力',
  `app_version` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '使用APP版本号',
  `map_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '使用地图类型',
  `education_background` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '驾驶员学历',
  `household_registration_authority` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '户口   登记机关名称',
  `registered_permanent_residence_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '户口   住址',
  `address` varchar(736) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '现居地址',
  `address_longitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '现居地址经度',
  `address_latitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '现居地址纬度',
  `driver_img_file_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '驾驶员照片文件编号',
  `driver_license` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '机动车驾驶员证',
  `driver_license_scan_copy_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '机动车驾驶证扫描件文件编号',
  `driving_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '准驾车型',
  `first_get_driver_license_date` datetime DEFAULT NULL COMMENT '初次领取驾驶证日期',
  `driver_license_validity_start` datetime DEFAULT NULL COMMENT '驾驶证有效期起',
  `driver_license_validity_end` datetime DEFAULT NULL COMMENT '驾驶证有效期止',
  `is_taxi_driver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否巡游出租车驾驶员',
  `network_reservation_taxi_driver_license_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网络预约出租汽车驾驶员证号',
  `network_reservation_taxi_driver_license_issuing_agencies` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '网络预约出租汽车驾驶员证发证机构',
  `certificate_issuing_date` datetime DEFAULT NULL COMMENT '资格证发证日期',
  `first_qualification_date` datetime DEFAULT NULL COMMENT '初次领取资格证日期',
  `qualification_certificate_validity_start` datetime DEFAULT NULL COMMENT '资格证有效期起',
  `qualification_certificate_validity_end` datetime DEFAULT NULL COMMENT '资格证有效期止',
  `reported_date` datetime DEFAULT NULL COMMENT '报备日期',
  `is_full_time_driver` int(11) NOT NULL DEFAULT '0' COMMENT '是否专职驾驶员',
  `is_in_driver_blacklist` int(11) NOT NULL DEFAULT '0' COMMENT '是否在黑名单',
  `service_type` int(11) NOT NULL DEFAULT '0' COMMENT '服务类型',
  `company` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '驾驶员合同（或协议）签署公司',
  `contract_start_date` datetime DEFAULT NULL COMMENT '合同开始时间',
  `contract_end_date` datetime DEFAULT NULL COMMENT '合同结束时间',
  `emergency_contact` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急联系人',
  `emergency_contact_phone_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急联系人电话',
  `emergency_contact_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急联系人地址',
  `training_courses` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '培训课名称',
  `training_courses_date` datetime DEFAULT NULL COMMENT '培训课程日期',
  `training_courses_start_date` datetime DEFAULT NULL COMMENT '培训开始日期',
  `training_courses_end_date` datetime DEFAULT NULL COMMENT '培训结束日期',
  `training_courses_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '培训时长',
  `bank_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '开户行',
  `bank_card_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `note` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `qualification_certificate_img` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '从业资格证照片',
  `other_img1` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '其他一',
  `other_img2` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '其他二',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_driver_bind_change_record`;
CREATE TABLE `tbl_driver_bind_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_info_id` int(10) unsigned NOT NULL COMMENT '司机ID',
  `bind_tag` varchar(30) NOT NULL COMMENT '绑定类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `bind_value` varchar(500) NOT NULL COMMENT '绑定内容',
  `bind_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0绑定,1解绑',
  `operator_id` int(10) unsigned NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='司机绑定信息变更表';

DROP TABLE IF EXISTS `tbl_driver_income_detail`;
CREATE TABLE `tbl_driver_income_detail` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `driver_info_id` int(16) unsigned NOT NULL DEFAULT '0',
  `order_no` varchar(32) NOT NULL DEFAULT '',
  `order_money` decimal(8,2) NOT NULL DEFAULT '0.00',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `money` decimal(8,2) NOT NULL DEFAULT '0.00',
  `driver_ratio` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_driver_info`;
CREATE TABLE `tbl_driver_info` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(32) NOT NULL DEFAULT '' COMMENT '司机手机号',
  `driver_leader` int(11) unsigned DEFAULT '0' COMMENT '司机主管',
  `driver_name` varchar(16) NOT NULL DEFAULT '' COMMENT '司机姓名',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `gender` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `car_id` int(16) unsigned DEFAULT NULL COMMENT '车辆id',
  `is_following` int(1) NOT NULL DEFAULT '0' COMMENT '是否是顺风单0否 1是',
  `work_status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '司机工作状态\r\n0：非出车状态，\r\n1：出车，未接订单，\r\n2：出车，接到订单,\r\n3：暂停接单',
  `head_img` varchar(256) NOT NULL DEFAULT '' COMMENT '司机头像',
  `city_code` varchar(8) NOT NULL DEFAULT '' COMMENT '城市代码',
  `bind_time` datetime DEFAULT NULL COMMENT '绑定时间',
  `use_status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '启用停用状态，0：停用，1：启用',
  `cs_work_status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '车机工作状态\r\n0：车机未登录登录\r\n1：车机登录\r\n2：车机听单\r\n3：车机暂停听单\r\n4：车机收车\r\n\r\n',
  `sign_status` int(2) NOT NULL DEFAULT '1' COMMENT '1：已签约，0：已解约',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='司机信息表';

DROP TABLE IF EXISTS `tbl_driver_licence_info`;
CREATE TABLE `tbl_driver_licence_info` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '审核记录id',
  `driver_id` int(16) NOT NULL DEFAULT '0' COMMENT '司机id',
  `main_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT '驾照主页照片地址',
  `vice_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT '驾照副页照片地址',
  `all_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT '驾照正副页照片地址',
  `group_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT '手持驾照照片地址',
  `identity_card_id` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证',
  `main_idcard_license` varchar(256) NOT NULL DEFAULT '' COMMENT '身份证正面照',
  `vice_idcard_license` varchar(256) NOT NULL DEFAULT '' COMMENT '身份证副页照片地址',
  `group_idcard_license` varchar(256) NOT NULL DEFAULT '' COMMENT '手持身份证照片',
  `plate_number` varchar(16) NOT NULL DEFAULT '' COMMENT '车牌号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `fk_reference_2` (`driver_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='司机驾驶证信息';

DROP TABLE IF EXISTS `tbl_driver_message`;
CREATE TABLE `tbl_driver_message` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_id` int(16) unsigned NOT NULL DEFAULT '0',
  `driver_id` int(16) NOT NULL DEFAULT '0',
  `content` varchar(256) NOT NULL DEFAULT '',
  `is_delete` int(2) NOT NULL DEFAULT '0' COMMENT '1:删除，0：未删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `if_success` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否发送成功',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `message_type` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '消息类型',
  `message_channel` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '1：极光推送，2：短信',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `tbl_driver_order_message_statistical`;
CREATE TABLE `tbl_driver_order_message_statistical` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) NOT NULL COMMENT '司机Id',
  `driving_licence_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '机动车驾驶证编号',
  `cycle` varchar(255) NOT NULL COMMENT '统计周期 格式为YYYYMM',
  `order_count` int(10) NOT NULL COMMENT '完成订单数',
  `traffic_violations_count` int(32) NOT NULL DEFAULT '0' COMMENT '交通违章次数',
  `complained_count` int(32) NOT NULL DEFAULT '0' COMMENT '被投诉次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='司机订单及其它信息统计';


DROP TABLE IF EXISTS `tbl_driver_punish`;
CREATE TABLE `tbl_driver_punish` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) NOT NULL COMMENT '司机id',
  `punish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '处罚时间',
  `punish_reason` varchar(128) NOT NULL COMMENT '处罚原因',
  `punish_result` varchar(128) NOT NULL COMMENT '处罚结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='司机处罚表';


DROP TABLE IF EXISTS `tbl_driver_rate`;
CREATE TABLE `tbl_driver_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `driver_id` int(10) NOT NULL COMMENT '司机ID',
  `grade` int(2) NOT NULL DEFAULT '0' COMMENT '等级',
  `test_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '考核日期',
  `test_department` varchar(255) NOT NULL DEFAULT '' COMMENT '考核机构',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='驾驶员荣誉信息表';


DROP TABLE IF EXISTS `tbl_driver_work_time`;
CREATE TABLE `tbl_driver_work_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) unsigned NOT NULL COMMENT '司机id',
  `work_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '工作开始时间',
  `work_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '工作结束时间',
  `work_duration` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '此次工作时长',
  `work_day` date NOT NULL DEFAULT '0000-00-00' COMMENT '工作日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='司机工作时间';


DROP TABLE IF EXISTS `tbl_dynamic_discount_city`;
CREATE TABLE `tbl_dynamic_discount_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `dynamic_discount_rule_id` int(10) NOT NULL DEFAULT '0' COMMENT '动态折扣关联id',
  `city_code` varchar(32) NOT NULL DEFAULT '' COMMENT '城市编码',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0不删除 1删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='动态调价城市表';


DROP TABLE IF EXISTS `tbl_dynamic_discount_info`;
CREATE TABLE `tbl_dynamic_discount_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `dynamic_discount_rule_id` int(10) NOT NULL DEFAULT '0' COMMENT '动态折扣关联id',
  `km` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '里程',
  `discount` double(3,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0不删除 1删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='动态折扣信息表';


DROP TABLE IF EXISTS `tbl_dynamic_discount_rule`;
CREATE TABLE `tbl_dynamic_discount_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `service_type` varchar(255) NOT NULL DEFAULT '' COMMENT '服务类型',
  `car_level` varchar(255) NOT NULL DEFAULT '' COMMENT '车辆级别',
  `time_set` varchar(255) NOT NULL DEFAULT '' COMMENT '时段设置',
  `date_type` int(1) NOT NULL DEFAULT '0' COMMENT '日期类型 1星期 2特殊日期',
  `week_set` varchar(255) NOT NULL DEFAULT '' COMMENT '星期设置',
  `special_date_set` varchar(255) NOT NULL DEFAULT '' COMMENT '特殊日期设置',
  `discount_max_price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '折扣封顶金额',
  `valid_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效开始时间',
  `valid_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效结束时间',
  `is_unuse` int(1) NOT NULL DEFAULT '0' COMMENT '是否不可用 0可用 1不可用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='动态折扣规则表';


DROP TABLE IF EXISTS `tbl_evaluate_driver`;
CREATE TABLE `tbl_evaluate_driver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `grade` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '分数',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '评价内容',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `passenger_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '乘客ID',
  `driver_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '司机ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户的订单评价表';

DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT '',
  `phone` varchar(64) NOT NULL,
  `terminal` char(255) NOT NULL DEFAULT '' COMMENT '端\r\n1:乘客\r\n2,司机\r\n3,车机\r\n4,大屏',
  `category` char(255) NOT NULL DEFAULT '' COMMENT '问题类型',
  `content` varchar(255) DEFAULT NULL COMMENT '反馈内容 ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户反馈记录表';

DROP TABLE IF EXISTS `tbl_fence_info`;
CREATE TABLE `tbl_fence_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(70) NOT NULL DEFAULT '' COMMENT '高德ID',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT '城市编码',
  `fence_name` varchar(70) NOT NULL DEFAULT '' COMMENT '围栏名称',
  `valid_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效开始时间',
  `valid_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效结束时间',
  `is_deny` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 0未禁用 1已禁用',
  ` is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='围栏管理';


DROP TABLE IF EXISTS `tbl_flight_number`;
CREATE TABLE `tbl_flight_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(30) DEFAULT NULL COMMENT '航班号',
  `flight_date` date NOT NULL COMMENT '航班日期',
  `passenger_info_id` int(11) unsigned NOT NULL,
  `start_code` char(3) DEFAULT NULL COMMENT '起点code',
  `end_code` char(3) DEFAULT NULL COMMENT '终点code',
  `is_subscribe` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否订阅：1订阅，0取消订阅',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建记录日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户航班号';

DROP TABLE IF EXISTS `tbl_invoice_record`;
CREATE TABLE `tbl_invoice_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '发票ID',
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '乘客ID',
  `order_id_list` varchar(512) NOT NULL COMMENT '订单list，逗号分隔',
  `invoice_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '发票总价',
  `invoice_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1：待开票（申请开票）,\r\n2：待邮寄,\r\n3：已邮寄,\r\n4：已撤销,',
  `invoice_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发票类型：1：普票，2：专票',
  `invoice_body` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发票主体：1：个人，2：企业',
  `invoice_title` varchar(128) NOT NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_content` varchar(128) NOT NULL DEFAULT '' COMMENT '发票内容',
  `taxpayer_id` varchar(32) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `reg_address` varchar(256) NOT NULL DEFAULT '' COMMENT '注册地址',
  `reg_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '注册电话',
  `deposit_bank` varchar(218) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_account` varchar(32) NOT NULL DEFAULT '' COMMENT '银行账号',
  `receiver_name` varchar(32) NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `receiver_phone` varchar(16) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `receiver_address` varchar(256) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请开票时间',
  `express_company` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '快递公司',
  `express_num` varchar(32) NOT NULL DEFAULT '' COMMENT '快递号',
  `express_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '邮寄时间',
  `reject_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '驳回原因ID',
  `cancel_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '撤销原因',
  `email` varchar(128) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `invoice_number` varchar(32) NOT NULL DEFAULT '' COMMENT '发票号',
  `express_company_name` varchar(128) NOT NULL DEFAULT '' COMMENT '快递公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_large_screen_passenger`;
CREATE TABLE `tbl_large_screen_passenger` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '乘客id',
  `device_code` varchar(128) NOT NULL COMMENT '设备号',
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `login_status` int(2) DEFAULT NULL COMMENT '登录状态：1：登录，2：退出登录',
  `repair_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='乘客大屏登录状态';

-- ----------------------------
-- Records of tbl_large_screen_passenger
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_message_show
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_show`;
CREATE TABLE `tbl_message_show` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(512) NOT NULL COMMENT '消息体',
  `yid` varchar(32) NOT NULL DEFAULT '' COMMENT '乘客、司机id,大屏设备号',
  `accept_identity` tinyint(3) NOT NULL COMMENT '发送端（1：乘客；2：司机；4：大屏）',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `push_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推送类型 （1：营销通知，2：系统通知，3：订单通知，4：支付通知）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示（0：不显示，1：显示）',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读（0：未读，1：已读）',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单号',
  `sms_send_app_id` int(10) NOT NULL DEFAULT '0' COMMENT '推送任务id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1522 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '乘客id',
  `passenger_phone` varchar(64) NOT NULL COMMENT '乘客电话',
  `device_code` varchar(64) NOT NULL DEFAULT '' COMMENT '乘客设备号',
  `driver_id` int(10) unsigned DEFAULT NULL COMMENT '司机id',
  `driver_status` int(2) unsigned DEFAULT '0' COMMENT '司机状态   \r\n0：没有司机接单   \r\n1：司机接单  \r\n2.  去接乘客 \r\n3：司机到达上车点   \r\n4：开始行程   \r\n5：结束行程  \r\n6：发起收款  \r\n7：取消',
  `driver_phone` varchar(64) DEFAULT NULL COMMENT '司机电话',
  `car_id` int(10) unsigned DEFAULT NULL COMMENT '车辆id',
  `plate_number` varchar(16) DEFAULT NULL COMMENT '车牌号',
  `user_longitude` varchar(32) NOT NULL COMMENT '用户位置经度',
  `user_latitude` varchar(32) NOT NULL COMMENT '用户位置纬度',
  `start_longitude` varchar(32) NOT NULL COMMENT '乘客下单起点经度',
  `start_latitude` varchar(32) NOT NULL COMMENT '乘客下单起点纬度',
  `start_address` varchar(128) NOT NULL COMMENT '起点名称',
  `end_address` varchar(128) NOT NULL COMMENT '终点地址名称',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '乘客下单时间',
  `order_start_time` timestamp NULL DEFAULT NULL COMMENT '订单开始时间',
  `end_longitude` varchar(32) NOT NULL COMMENT '乘客下单终点经度',
  `end_latitude` varchar(32) NOT NULL COMMENT '乘客下单终点纬度',
  `driver_grab_time` timestamp NULL DEFAULT NULL COMMENT '司机抢单时间',
  `driver_start_time` timestamp NULL DEFAULT NULL COMMENT '司机去接乘客出发时间',
  `driver_arrived_time` timestamp NULL DEFAULT NULL COMMENT '司机到达时间',
  `pick_up_passenger_longitude` varchar(32) DEFAULT '' COMMENT '去接乘客经度',
  `pick_up_passenger_latitude` varchar(32) DEFAULT '' COMMENT '去接乘客纬度',
  `pick_up_passenger_address` varchar(300) DEFAULT '' COMMENT '去接乘客地点',
  `receive_passenger_time` timestamp NULL DEFAULT NULL COMMENT '接到乘客时间',
  `receive_passenger_longitude` varchar(32) NOT NULL DEFAULT '' COMMENT '接到乘客经度',
  `receive_passenger_latitude` varchar(32) NOT NULL DEFAULT '' COMMENT '接到乘客纬度',
  `passenger_getoff_time` timestamp NULL DEFAULT NULL COMMENT '乘客下车时间',
  `passenger_getoff_longitude` varchar(32) DEFAULT NULL COMMENT '乘客下车经度',
  `passenger_getoff_latitude` varchar(32) DEFAULT NULL COMMENT '乘客下车纬度',
  `other_name` varchar(16) DEFAULT NULL COMMENT '他人姓名 （乘车人）',
  `other_phone` varchar(64) DEFAULT NULL COMMENT '他人电话　(乘车人）',
  `order_type` int(2) unsigned DEFAULT NULL COMMENT '订单类型：1：自己叫车，2：他人叫车',
  `service_type` int(2) unsigned NOT NULL COMMENT '叫车订单类型，\r\n1：实时订单，\r\n2：预约订单，\r\n3：接机单，\r\n4：送机单，\r\n5：日租，\r\n6：半日租',
  `order_channel` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '订单渠道 \r\n1.自有订单\r\n2.高德\r\n3.飞猪',
  `status` int(2) NOT NULL COMMENT '订单状态 0: 订单预估 1：订单开始 2：司机接单 3：去接乘客 4：司机到达乘客起点 5：乘客上车，司机开始行程 6：到达目的地，行程结束，未支付 7：发起收款 8: 支付完成 9.乘客取消订单',
  `transaction_id` varchar(32) DEFAULT NULL COMMENT '商户交易id',
  `mapping_id` varchar(64) DEFAULT NULL COMMENT '订单状态 0: 订单预估 1：订单开始 2：司机接单 3：去接乘客 4：司机到达乘客起点 5：乘客上车，司机开始行程 6：到达目的地，行程结束，未支付 7：发起收款 8: 支付完成 9.订单取消',
  `mapping_number` varchar(32) DEFAULT NULL COMMENT '关联号码',
  `merchant_id` varchar(32) DEFAULT NULL COMMENT '商户id',
  `is_evaluate` int(2) NOT NULL DEFAULT '0' COMMENT '乘客是否评价，0：未评价，1：已评价',
  `invoice_type` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '发票状态：\r\n1：未开票，\r\n2：申请开票，\r\n3：开票中，\r\n4：已开票,\r\n5：退回,',
  `is_annotate` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '通知客服状态\r\n0，未通知  \r\n1,  已通知',
  `source` varchar(64) NOT NULL COMMENT '设备来源\r\n1: ios\r\n2:android\r\n3.other',
  `use_coupon` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用优惠券 \r\n0:未使用  1:使用',
  `cancel_order_type` int(2) unsigned DEFAULT NULL COMMENT '取消原因类型id',
  `pay_type` int(1) DEFAULT NULL COMMENT '1:余额\r\n2.微信\r\n3.支付宝',
  `is_paid` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否已支付 0：未支付  1：已支付',
  `is_cancel` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否取消  0：未取消   1：已取消',
  `is_adjust` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '调帐状态  0：未调帐  1:调账中 2.调账完毕',
  `is_dissent` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否疑义订单 0：否  1：是',
  `is_manual` int(1) NOT NULL DEFAULT '0' COMMENT '是否人工派单0 否 1 原来无司机, 人工派 2原来有司机，改派',
  `is_following` int(1) NOT NULL DEFAULT '0' COMMENT '是否是顺风单0否 1是',
  `is_fake_success` int(1) NOT NULL DEFAULT '0' COMMENT '是否是假成功单0 否 1是',
  `memo` varchar(500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备忘录',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `user_feature` int(2) DEFAULT '0' COMMENT '1：儿童用车\r\n2：女性用车',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1967 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单表';

DROP TABLE IF EXISTS `tbl_order_adjust_record`;
CREATE TABLE `tbl_order_adjust_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `doubt_id` int(10) unsigned DEFAULT NULL,
  `adjust_account_type` int(255) unsigned NOT NULL COMMENT '调账类型1,充值 2.扣款',
  `charge_number` varchar(32) DEFAULT NULL COMMENT '充值|扣款 单号',
  `old_cost` decimal(10,2) NOT NULL COMMENT '调账前金额',
  `new_cost` decimal(10,2) NOT NULL COMMENT '调账后金额',
  `reason_type` int(10) unsigned NOT NULL COMMENT '调账原因id',
  `reason_text` varchar(500) NOT NULL DEFAULT '' COMMENT '自定义调账原因',
  `solution` varchar(500) DEFAULT NULL COMMENT '处理方案',
  `operator` int(10) unsigned NOT NULL COMMENT '操作人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='订单调帐';


-- ----------------------------
-- Table structure for tbl_order_cancel_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_cancel_record`;
CREATE TABLE `tbl_order_cancel_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT '订单id',
  `is_charge` int(10) unsigned NOT NULL COMMENT '乘客是否有责0无责，1有责',
  `cancel_cost` double(10,0) NOT NULL COMMENT '取消费',
  `reason_type` int(10) unsigned NOT NULL COMMENT '取消原因类型 \r\n1\r\n2\r\n3\r\n4',
  `reason_text` varchar(128) NOT NULL COMMENT '其他原因',
  `operator` int(10) unsigned NOT NULL COMMENT '操作人',
  `operator_type` int(1) NOT NULL COMMENT '操作人类型1:客户自行取消 2:客服取消',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COMMENT='订单取消原因';

DROP TABLE IF EXISTS `tbl_order_change_record`;
CREATE TABLE `tbl_order_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  `driver_befor` int(11) DEFAULT NULL COMMENT '接单司机id',
  `driver_after` int(11) DEFAULT NULL COMMENT '派单司机id',
  `reason` varchar(64) DEFAULT NULL COMMENT '派单原因',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `operate_uesr` varchar(64) DEFAULT NULL COMMENT '操作用户',
  `other_reason` varchar(64) DEFAULT NULL COMMENT '其它原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_order_doubt`;
CREATE TABLE `tbl_order_doubt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `appeal_number` varchar(32) NOT NULL DEFAULT '' COMMENT '申诉单号',
  `adjust_type` int(10) unsigned DEFAULT NULL COMMENT '调账类型\r\n1充值\r\n2扣款\r\n3发优惠券',
  `adjust_content` varchar(200) NOT NULL DEFAULT '' COMMENT '调账内容 充值| 扣款 单号，优惠券',
  `reason_type` int(10) unsigned DEFAULT NULL COMMENT '疑义原因类型 \r\n 1=>''提前计费'',\r\n 2=>''司要绕路'',\r\n 3=>''不明费用'',\r\n 4=>''其他问题'',',
  `reason_text` varchar(300) DEFAULT '' COMMENT '自定义其他疑义原因',
  `old_cost` decimal(10,2) DEFAULT NULL COMMENT '调账前金额',
  `now_cost` decimal(10,2) DEFAULT NULL COMMENT '调账后金额',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '1待处理 \r\n2待审核 \r\n3已审核 \r\n4已完成 \r\n5已撤销 ',
  `handle_type` int(10) unsigned DEFAULT NULL COMMENT '处理类型\r\n1充值\r\n2扣款\r\n3发优惠券',
  `solution` varchar(200) NOT NULL DEFAULT '' COMMENT '处理方案',
  `operators` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人 （多人操作全记录)',
  `operate_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='调帐审核';

DROP TABLE IF EXISTS `tbl_order_gift_coupon_record`;
CREATE TABLE `tbl_order_gift_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `doubt_id` int(10) DEFAULT NULL COMMENT '疑义定单id //order_doubt表中的id',
  `passenger_info_id` int(10) DEFAULT NULL COMMENT '接收用户优惠券的passenger id',
  `coupon_id` int(10) unsigned NOT NULL COMMENT '优惠券类型id',
  `user_phone` varchar(64) NOT NULL COMMENT '用户电话',
  `coupon_name` varchar(200) DEFAULT NULL COMMENT '优惠券类型名',
  `user_coupon_id` int(10) DEFAULT NULL COMMENT '用户优惠券id',
  `coupon_amount` float(10,2) DEFAULT NULL COMMENT '优惠券金额',
  `coupon_expired_date` varchar(200) DEFAULT NULL COMMENT '优惠券有效期 文案',
  `operator_id` int(10) NOT NULL COMMENT '操作人Id',
  `operator_time` datetime NOT NULL COMMENT '操作时间',
  `solution` varchar(300) DEFAULT NULL COMMENT '处理方案',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_order_payment`;
CREATE TABLE `tbl_order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `pay_type` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型：1微信，2账户余额，4支付宝',
  `total_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `balance_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额支付金额',
  `wechat_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '微信支付金额',
  `alipay_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付宝金额',
  `user_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户获得优惠券id,此时不是优惠券id，是用户优惠券关联id',
  `coupon_reduce_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠券减免金额',
  `paid_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `remain_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '剩余支付的金额',
  `tail_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '尾款价格',
  `replenish_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '补扣价格',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单支付表';

DROP TABLE IF EXISTS `tbl_order_points`;
CREATE TABLE `tbl_order_points` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(16) DEFAULT NULL COMMENT '司机Id',
  `car_id` int(16) DEFAULT NULL COMMENT '车辆Id',
  `order_id` int(16) DEFAULT NULL COMMENT '订单id',
  `points` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_order_reassignment_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_reassignment_record`;
CREATE TABLE `tbl_order_reassignment_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '订单Id',
  `driver_id_before` int(10) unsigned NOT NULL COMMENT '原司机Id',
  `driver_name_before` varchar(100) NOT NULL DEFAULT '' COMMENT '原司机姓名',
  `driver_id_now` int(10) unsigned NOT NULL COMMENT '当前司机ID',
  `driver_name_now` varchar(100) NOT NULL DEFAULT '' COMMENT '当前司机name',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作者',
  `reason_type` int(64) NOT NULL COMMENT '改派原因',
  `reason_text` varchar(200) DEFAULT '' COMMENT '改派内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='订单改派';


-- ----------------------------
-- Table structure for tbl_order_rule_mirror
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_rule_mirror`;
CREATE TABLE `tbl_order_rule_mirror` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT '订单_id',
  `rule_id` int(10) NOT NULL COMMENT '计价规则id',
  `rule` text NOT NULL COMMENT '规则镜像的json',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1967 DEFAULT CHARSET=utf8 COMMENT='订单计费规则镜像表';

-- ----------------------------
-- Table structure for tbl_order_rule_price
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_rule_price`;
CREATE TABLE `tbl_order_rule_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT '订单id',
  `category` varchar(1) NOT NULL COMMENT '价格类型：0预估，1实际',
  `total_price` double(10,2) NOT NULL COMMENT '总价',
  `total_distance` double(10,2) NOT NULL COMMENT '总距离（公里）',
  `total_time` double(10,0) NOT NULL COMMENT '总时间（分钟）',
  `city_code` varchar(32) NOT NULL COMMENT '城市编码',
  `city_name` varchar(64) NOT NULL COMMENT '城市名称',
  `service_type_id` int(2) NOT NULL COMMENT '服务类型id',
  `service_type_name` varchar(64) NOT NULL COMMENT '服务类型名称',
  `channel_id` int(10) NOT NULL COMMENT '渠道id',
  `channel_name` varchar(64) NOT NULL COMMENT '渠道名称',
  `car_level_id` int(10) NOT NULL COMMENT '车辆级别id',
  `car_level_name` varchar(64) NOT NULL COMMENT '车辆级别名称',
  `base_price` double(10,2) NOT NULL COMMENT '基础价格',
  `base_kilo` double(10,2) NOT NULL COMMENT '基础价格包含公里数',
  `base_minute` double(10,2) NOT NULL COMMENT '基础价格包含时长数（分钟）',
  `lowest_price` double(10,2) NOT NULL COMMENT '最低消费',
  `night_start` time DEFAULT NULL COMMENT '夜间时间段开始',
  `night_end` time DEFAULT NULL COMMENT '夜间时间段结束',
  `night_per_kilo_price` double(10,2) DEFAULT NULL COMMENT '夜间超公里加收单价',
  `night_per_minute_price` double(10,2) DEFAULT NULL COMMENT '夜间超时间加收单价',
  `night_distance` double(10,2) NOT NULL COMMENT '夜间行驶总里程（公里）',
  `night_time` double(10,2) NOT NULL COMMENT '夜间行驶总时间（分钟）',
  `night_price` double(10,2) NOT NULL COMMENT '夜间服务费',
  `beyond_start_kilo` double(10,2) NOT NULL COMMENT '远途起算公里',
  `beyond_per_kilo_price` double(10,2) NOT NULL COMMENT '远途单价',
  `beyond_distance` double(8,2) NOT NULL COMMENT '远途距离，超出远途的公里数',
  `beyond_price` double(10,2) NOT NULL COMMENT '远途费',
  `per_kilo_price` double(10,2) NOT NULL COMMENT '超公里单价(每公里单价)',
  `path` double(10,2) NOT NULL COMMENT '(不包含起步)行驶总里程（公里）或分段计价合计里程（公里）',
  `path_price` double(10,2) NOT NULL COMMENT '(不包含起步)行驶总里程价格或分段计价合计价格',
  `per_minute_price` double(10,2) NOT NULL COMMENT '超时间单价(每分钟单价)或分段计价默认的每分钟单价',
  `duration` double(10,2) NOT NULL COMMENT '(不包含起步)行驶时长（分钟）或分段计价合计时长（分钟）',
  `duration_price` double(10,2) NOT NULL COMMENT '(不包含起步)行驶时长价格或分段计价合计时间价格',
  `rest_duration` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '其他时段时长合计',
  `rest_duration_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '其他时段时长费用合计',
  `rest_distance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '其他时段距离合计',
  `rest_distance_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '其他时段距离费用合计',
  `road_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '过路费',
  `parking_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '停车费',
  `other_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '其它费用',
  `dynamic_discount_rate` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '动态调价的折扣率(0-1 两小数)',
  `dynamic_discount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '动态调价的金额',
  `supplement_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费补足的费用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2196 DEFAULT CHARSET=utf8 COMMENT='计费明细表';

-- ----------------------------
-- Table structure for tbl_order_rule_price_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_rule_price_detail`;
CREATE TABLE `tbl_order_rule_price_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT '订单id',
  `category` varchar(1) NOT NULL COMMENT '价格类型：0预约，1实际',
  `start_hour` int(2) NOT NULL COMMENT '时间段-开始',
  `end_hour` int(2) NOT NULL COMMENT '时间段-结束',
  `per_kilo_price` double(10,2) NOT NULL COMMENT '超公里单价(每公里单价)',
  `per_minute_price` double(10,2) NOT NULL COMMENT '超时间单价(每分钟单价)',
  `duration` double(10,2) NOT NULL COMMENT '该时间段的时间统计',
  `time_price` double(10,2) NOT NULL COMMENT '该时间段的时间价格合计',
  `distance` double(10,2) NOT NULL COMMENT '该时间段的距离统计',
  `distance_price` double(10,2) NOT NULL COMMENT '该时间段的距离价格合计',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分段计时计费明细表';

-- ----------------------------
-- Records of tbl_order_rule_price_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_order_send_coupon_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_send_coupon_record`;
CREATE TABLE `tbl_order_send_coupon_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) NOT NULL COMMENT '订单id',
  `coupon_id` int(10) NOT NULL COMMENT '优惠券Id',
  `operator` int(10) NOT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order_send_coupon_record
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_order_use_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_use_coupon`;
CREATE TABLE `tbl_order_use_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `coupon_id` int(11) unsigned NOT NULL COMMENT '优惠券Id',
  `category` char(1) NOT NULL DEFAULT '0' COMMENT '0:预估 1，实际',
  `coupon_money` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `after_use_coupon_moeny` float(10,2) DEFAULT NULL COMMENT '使用优惠券后订单金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8 COMMENT='订单优惠券使用记录';

DROP TABLE IF EXISTS `tbl_organization_info`;
CREATE TABLE `tbl_organization_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '机构信息id',
  `organization_name` varchar(255) DEFAULT '' COMMENT '服务机构名称',
  `organization_code` varchar(255) DEFAULT '' COMMENT '服务机构代码',
  `administrative_division_code` varchar(255) DEFAULT '' COMMENT '行政区划分代码',
  `organization_address` varchar(255) DEFAULT '' COMMENT '服务机构地址',
  `duty_name` varchar(255) DEFAULT '' COMMENT '负责人姓名',
  `duty_phone` varchar(32) DEFAULT '' COMMENT '负责人手机号',
  `admin_name` varchar(10) DEFAULT '' COMMENT '管理员姓名',
  `admin_phone` varchar(32) DEFAULT '' COMMENT '管理员电话',
  `organization_head_phone` varchar(32) DEFAULT '' COMMENT '服务机构总联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_organization_info
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_passenger_address
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_address`;
CREATE TABLE `tbl_passenger_address` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '乘客id',
  `latitude` double(10,6) DEFAULT NULL COMMENT '地址纬度',
  `longitude` double(10,6) DEFAULT NULL COMMENT '地址经度',
  `address_name` varchar(64) DEFAULT '' COMMENT '详细地址',
  `type` int(2) DEFAULT NULL COMMENT '0:家，1：公司',
  `address_desc` varchar(2048) DEFAULT '' COMMENT '地址描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- ----------------------------
-- Table structure for tbl_passenger_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_blacklist`;
CREATE TABLE `tbl_passenger_blacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(64) NOT NULL COMMENT '电话号码',
  `reason` char(1) NOT NULL DEFAULT '' COMMENT '1 个人用户1小时内连续取消订单3次\r\n2 24小时内取消10次派车成功单',
  `category` char(1) NOT NULL DEFAULT '1' COMMENT '1 临时黑名单 2 永久黑名单',
  `is_release` char(1) NOT NULL DEFAULT '0' COMMENT '1 解禁，0 未解禁',
  `release_time` timestamp NULL DEFAULT NULL COMMENT '解禁时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户黑名单';


-- ----------------------------
-- Table structure for tbl_passenger_consume_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_consume_record`;
CREATE TABLE `tbl_passenger_consume_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `event` char(1) NOT NULL COMMENT '消费事件\r\n1.订单扣款\r\n2......',
  `monetary` decimal(10,2) NOT NULL COMMENT '消费金额',
  `transaction_number` varchar(32) NOT NULL DEFAULT '' COMMENT '交易单号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_passenger_consume_record
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_passenger_history_address
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_history_address`;
CREATE TABLE `tbl_passenger_history_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL COMMENT '乘客id',
  `passenger_phone` char(11) NOT NULL DEFAULT '' COMMENT '乘客电话',
  `type` int(10) unsigned NOT NULL COMMENT '1上车地点\r\n2下车地点',
  `address` varchar(500) DEFAULT '' COMMENT '详细地址',
  `city_code` varchar(32) DEFAULT NULL COMMENT '城市码',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `detail_name` varchar(100) DEFAULT NULL COMMENT '地址短名',
  `ad_code` varchar(32) DEFAULT NULL COMMENT '地址码',
  `longitude` varchar(32) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(32) NOT NULL DEFAULT '' COMMENT '纬度',
  `address_poi` varchar(1000) DEFAULT NULL,
  `is_del` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除0未删除 1删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_passenger_history_car_person`;
CREATE TABLE `tbl_passenger_history_car_person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL COMMENT '订车人id',
  `passenger_phone` varchar(32) NOT NULL COMMENT '订车人用户phone',
  `use_car_person_name` varchar(100) NOT NULL DEFAULT '' COMMENT '用车人姓名',
  `use_car_person_phone` varchar(64) DEFAULT NULL COMMENT '用车人电话',
  `is_del` char(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0 未删除 1删除 ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_passenger_info`;
CREATE TABLE `tbl_passenger_info` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT '电话',
  `educatioan` varchar(255) DEFAULT '' COMMENT '学历',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `passenger_name` varchar(16) NOT NULL DEFAULT '' COMMENT '乘客名称',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `gender` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '0：女，1：男',
  `head_img` varchar(256) NOT NULL DEFAULT '' COMMENT '头像',
  `passenger_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型，1：个人用户，2：企业用户',
  `user_level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '会员等级',
  `register_type` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '注册渠道 1 安卓 2 ios',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `last_login_method` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上次登陆方式:1,验证码,2密码',
  `last_login_screen_time` datetime DEFAULT NULL COMMENT '上次登录大屏时间',
  `last_login_screen_method` char(1) NOT NULL DEFAULT '' COMMENT '上次登录大屏方式',
  `last_order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次下单时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_passenger_message`;
CREATE TABLE `tbl_passenger_message` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(256) NOT NULL DEFAULT '',
  `if_success` tinyint(2) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_passenger_message
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_passenger_register_source
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_register_source`;
CREATE TABLE `tbl_passenger_register_source` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(16) DEFAULT NULL,
  `register_source` varchar(32) DEFAULT NULL,
  `market_channel` varchar(64) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_passenger_statics`;
CREATE TABLE `tbl_passenger_statics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `total_distance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总里程',
  `month_distance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当月里程',
  `total_charge` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值总金额',
  `total_refund` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款总额',
  `total_order_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单支付总额',
  `month_order_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '月订单支付总额',
  `total_invoice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已开票总金额',
  `can_invoice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '未开票总金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='乘客统计信息表';

-- ----------------------------
-- Records of tbl_passenger_statics
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_passenger_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_wallet`;
CREATE TABLE `tbl_passenger_wallet` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(16) DEFAULT NULL COMMENT '乘客Id',
  `capital` double(10,2) DEFAULT NULL COMMENT '本金',
  `give_fee` double(10,2) DEFAULT NULL COMMENT '赠费',
  `freeze_capital` double(10,2) DEFAULT NULL COMMENT '冻结本金',
  `freeze_give_fee` double(10,2) DEFAULT NULL COMMENT '冻结赠费',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_userid` (`passenger_info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='乘客钱包';

DROP TABLE IF EXISTS `tbl_passenger_wallet_1106`;
CREATE TABLE `tbl_passenger_wallet_1106` (
  `id` int(16) NOT NULL DEFAULT '0',
  `passenger_info_id` int(16) DEFAULT NULL COMMENT '乘客Id',
  `capital` double(10,2) DEFAULT NULL COMMENT '本金',
  `give_fee` double(10,2) DEFAULT NULL COMMENT '赠费',
  `freeze_capital` double(10,2) DEFAULT NULL COMMENT '冻结本金',
  `freeze_give_fee` double(10,2) DEFAULT NULL COMMENT '冻结赠费',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_passenger_wallet_freeze_record`;
CREATE TABLE `tbl_passenger_wallet_freeze_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(16) NOT NULL COMMENT '乘客Id',
  `freeze_capital` double(10,2) DEFAULT NULL COMMENT '冻结本金',
  `freeze_give_fee` double(10,2) DEFAULT NULL COMMENT '冻结赠费',
  `order_id` int(16) NOT NULL COMMENT '订单Id',
  `freeze_status` int(2) DEFAULT NULL COMMENT '0:解冻，1：冻结',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='钱包冻结/解冻记录';

DROP TABLE IF EXISTS `tbl_passenger_wallet_record`;
CREATE TABLE `tbl_passenger_wallet_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(16) NOT NULL COMMENT '用户ID',
  `transaction_id` varchar(32) DEFAULT '' COMMENT '第三方支付ID',
  `pay_time` datetime NOT NULL COMMENT '支付时间',
  `pay_capital` double(10,2) NOT NULL COMMENT '本金',
  `pay_give_fee` double(10,2) NOT NULL COMMENT '赠费',
  `refund_capital` double(10,2) DEFAULT '0.00' COMMENT '退款本金',
  `refund_give_fee` double(10,2) DEFAULT '0.00' COMMENT '退款赠费',
  `recharge_discount` double(10,2) NOT NULL COMMENT '充值折扣',
  `pay_type` tinyint(2) NOT NULL COMMENT '1：微信 ，2：账户余额，3：平台账户，4：支付宝',
  `pay_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1：已支付 ，0：未支付',
  `trade_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '交易类型：\r\n1充值\r\n2消费\r\n3退款\r\n4订单冻结\r\n5订单补扣\r\n6尾款支付\r\n7解冻',
  `trade_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '交易原因',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `order_id` int(10) DEFAULT NULL COMMENT '订单Id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_userid` (`passenger_info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='充值交易记录';

DROP TABLE IF EXISTS `tbl_people_tag`;
CREATE TABLE `tbl_people_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(60) NOT NULL DEFAULT '' COMMENT '人群标签名称',
  `tag_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '目标类别 (1,passenger, 2,driver)',
  `tag_conditions` varchar(2000) NOT NULL DEFAULT '' COMMENT '筛选条件',
  `tag_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签人数(约数)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '更新人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='人群标签';

DROP TABLE IF EXISTS `tbl_phone_message`;
CREATE TABLE `tbl_phone_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '电话',
  `sms_content` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '消息体',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `push_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推送类型 （1：营销,2:通知）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送状态（0：失败；1：成功）',
  `operator` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_push_account`;
CREATE TABLE `tbl_push_account` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(32) NOT NULL DEFAULT '' COMMENT '设备来源 iOS,Android',
  `jpush_id` varchar(64) NOT NULL DEFAULT '' COMMENT '消息推送设备id',
  `yid` varchar(64) NOT NULL COMMENT '系统用户号，司机、乘客用yid，大屏唯一码、车机用唯一码',
  `audience` int(2) NOT NULL DEFAULT '1' COMMENT '听众类型：1：别名，2：注册Id',
  `identity_status` int(2) unsigned NOT NULL COMMENT '身份标记 1:乘客，2：司机，3：车机，4：大屏',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='极光id手机表';

DROP TABLE IF EXISTS `tbl_push_app_message`;
CREATE TABLE `tbl_push_app_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '乘客、司机id,大屏设备号',
  `accept_identity` tinyint(1) NOT NULL DEFAULT '0' COMMENT '接收端（1：乘客；2：司机；4：大屏）',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示（0：不显示，1：显示）',
  `push_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '推送类型  （1：营销通知，2：系统通知，3：订单通知，4：支付通知）',
  `sms_send_app_id` int(10) NOT NULL DEFAULT '0' COMMENT '推送任务id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2284 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_push_loop_message`;
CREATE TABLE `tbl_push_loop_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accept_identity` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '1:乘客，2：司机，3：车机，4：大屏',
  `accept_id` varchar(128) NOT NULL DEFAULT '' COMMENT '接受方id',
  `message_type` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '消息类型，看枚举定义',
  `message_body` varchar(1024) NOT NULL DEFAULT '' COMMENT '消息体',
  `read_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0:未读，1：已读',
  `send_id` varchar(128) NOT NULL DEFAULT '' COMMENT '发送方id',
  `send_identity` int(2) NOT NULL COMMENT '发送者身份类别',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息失效时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `expire_time` (`expire_time`),
  KEY `accept_id` (`accept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息系统列表';

DROP TABLE IF EXISTS `tbl_push_message_record`;
CREATE TABLE `tbl_push_message_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '系统类型',
  `jpush_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '接收通知的设备token',
  `message_type` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '消息类型',
  `message_body` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `send_result` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '发送结果1：成功，0：失败',
  `send_id` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '发送方id',
  `send_identity` int(2) NOT NULL COMMENT '发送者身份类别',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3044 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='消息推送记录';


-- ----------------------------
-- Table structure for tbl_recharge_price
-- ----------------------------
DROP TABLE IF EXISTS `tbl_recharge_price`;
CREATE TABLE `tbl_recharge_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'paymentID',
  `amount` double(10,2) DEFAULT NULL COMMENT '充值金额',
  `reward` double(10,2) DEFAULT NULL COMMENT '赠送金额',
  `desc` varchar(200) DEFAULT NULL COMMENT '金额描述信息',
  `is_deleted` bit(1) DEFAULT NULL COMMENT '是否被删除 1 ：已删除 0 ：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='充值金额规则';

DROP TABLE IF EXISTS `tbl_secret_voice_records`;
CREATE TABLE `tbl_secret_voice_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_id` varchar(64) NOT NULL,
  `subs_id` varchar(64) NOT NULL COMMENT '对应的三元组的绑定关系ID',
  `call_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '呼叫时间',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '是否下载文件0：未下载  1：已下载',
  `oss_download_url` varchar(512) DEFAULT NULL COMMENT '文件下载地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COMMENT='通话记录上传记录表\r\n';


-- ----------------------------
-- Table structure for tbl_service
-- ----------------------------
DROP TABLE IF EXISTS `tbl_service`;
CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(32) NOT NULL COMMENT '城市编码',
  `service_type_id` int(11) NOT NULL COMMENT '服务类型id',
  `together_order_number` int(4) NOT NULL DEFAULT '0' COMMENT '同时可下单数量',
  `service_status` int(2) NOT NULL COMMENT '服务开启状态 0暂停 1开启',
  `operator_id` int(11) NOT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_service_type`;
CREATE TABLE `tbl_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_name` varchar(64) NOT NULL COMMENT '服务类型名称',
  `service_type_status` int(2) NOT NULL COMMENT '服务类型状态 1开启 0暂停',
  `is_use` char(1) NOT NULL DEFAULT '0' COMMENT '使用状态  1使用 0未使用',
  `operator_id` int(11) NOT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='服务类型表';

DROP TABLE IF EXISTS `tbl_sms`;
CREATE TABLE `tbl_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger_phone_number` varchar(16) NOT NULL DEFAULT '' COMMENT '乘客手机号',
  `sms_content` varchar(512) NOT NULL DEFAULT '' COMMENT '短信内容',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人',
  `send_flag` tinyint(1) NOT NULL COMMENT '发送状态 0:失败  1: 成功',
  `send_number` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送失败次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1554 DEFAULT CHARSET=utf8mb4;


-- ----------------------------
-- Table structure for tbl_sms_app_template
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sms_app_template`;
CREATE TABLE `tbl_sms_app_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '模板类型（1：营销；2：通知）',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '模板内容',
  `operator_user` int(10) DEFAULT NULL COMMENT '操作者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_sms_app_template
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sms_send_app
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sms_send_app`;
CREATE TABLE `tbl_sms_send_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '消息标题名称',
  `show_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '展示端（1：乘客；2：司机）',
  `sms_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '消息类型（1：营销；2：通知）',
  `people_tag_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '人群id',
  `sms_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '消息图片',
  `app_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '消息文案id',
  `sms_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `start_time` datetime NOT NULL COMMENT '生效时间',
  `send_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推送状态（0：未推送；1：已推送）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用状态',
  `operator_user` int(10) DEFAULT NULL COMMENT '操作者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tima` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_sms_send_app
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sms_send_phone
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sms_send_phone`;
CREATE TABLE `tbl_sms_send_phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sms_template_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '文案模板template_id',
  `sms_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型（1：营销；2：通知）',
  `send_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送类型（1：单人发送；2：批量发送）',
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '单人发送手机号',
  `phone_file` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '批量发送文件名',
  `send_people` int(10) NOT NULL DEFAULT '0' COMMENT '1:乘客；2：司机',
  `operator_user` int(10) DEFAULT NULL COMMENT '操作者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_sms_template`;
CREATE TABLE `tbl_sms_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(16) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `template_name` varchar(128) DEFAULT NULL,
  `content` varchar(512) NOT NULL DEFAULT '' COMMENT '模板内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `template_type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '模板类型（1：营销；2：通知；3：订单）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TEMPLATE_ID` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tbl_sys_config`;
CREATE TABLE `tbl_sys_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(30) NOT NULL COMMENT '配置项',
  `conf_val` varchar(2000) NOT NULL COMMENT '配置值',
  `conf_name` varchar(30) NOT NULL COMMENT '配置名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置杂项';

DROP TABLE IF EXISTS `tbl_sys_user`;
CREATE TABLE `tbl_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `salt` varchar(15) NOT NULL DEFAULT '' COMMENT '密码的盐',
  `phone` varchar(32) NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `modify_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人ID',
  `last_update_password_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_tv_apps`;
CREATE TABLE `tbl_tv_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(16) NOT NULL COMMENT '应用名称',
  `version_code` int(11) NOT NULL COMMENT '版本号',
  `start_time` datetime NOT NULL COMMENT '开始更新时间',
  `down_load_url` varchar(255) NOT NULL COMMENT '应用包下载链接',
  `package_name` varchar(32) NOT NULL COMMENT '包名',
  `ico_url` varchar(255) NOT NULL COMMENT '应用图标',
  `use_status` int(2) NOT NULL COMMENT '应用状态 1启用 0停用',
  `position` int(3) NOT NULL COMMENT '应用位置',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除 1是 0否',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `operator_id` int(11) NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_tv_version_update`;
CREATE TABLE `tbl_tv_version_update` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'TV平台版本名称',
  `tv_version_code` int(4) NOT NULL DEFAULT '0' COMMENT 'tvVersionCode',
  `tv_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `notice_type` smallint(6) NOT NULL COMMENT '通知类型（1:强制 2:非强制）',
  `prompt` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '升级提示（不超过30个字）',
  `note` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `start_time` datetime NOT NULL COMMENT '生效开始时间	',
  `end_time` datetime NOT NULL COMMENT '生效结束时间',
  `download_url` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '安装包URL',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `use_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '启用停用状态，0：停用，1：启用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_user_coupon`;
CREATE TABLE `tbl_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '领取记录ID',
  `passenger_id` int(11) NOT NULL DEFAULT '0' COMMENT '乘客ID',
  `phone_number` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '关联订单号',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `coupon_name` varchar(30) DEFAULT '',
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券类型 1:现金券, 2:专项券-免费送车券, 3:专项券-免费还车券 4:折扣券',
  `get_method` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '	1,主动发放. 2,用户获取',
  `enable_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券起效时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获取时间',
  `expire_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '使用时间',
  `use_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
  `is_use` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0:未使用, 1:已使用',
  `minimum_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费金额',
  `reduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '减免金额(现金券：能抵扣的金额,折扣券：最高能抵扣的金额)',
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '折扣8,7.5',
  `function_type` int(4) NOT NULL DEFAULT '0' COMMENT '功能类型 1:市场活动, 2:订单赔付',
  `indemnity_record_id` int(10) NOT NULL DEFAULT '0' COMMENT '赔付记录ID',
  `activity_tag` varchar(30) NOT NULL DEFAULT '' COMMENT '活动标签',
  `activity_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动ID',
  PRIMARY KEY (`id`),
  KEY `INX_PHONE` (`phone_number`),
  KEY `INX_COUPON` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1252 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户优惠券表';

DROP TABLE IF EXISTS `tbl_weixinpay_callback_info`;
CREATE TABLE `tbl_weixinpay_callback_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(32) DEFAULT NULL COMMENT '微信订单号',
  `out_trade_no` varchar(32) DEFAULT NULL COMMENT '商户订单号',
  `total_fee` int(11) DEFAULT NULL,
  `body` varchar(200) DEFAULT NULL,
  `result_code` varchar(16) DEFAULT NULL COMMENT '业务结果',
  `err_code` varchar(45) DEFAULT NULL COMMENT '错误代码',
  `openid` varchar(128) DEFAULT NULL COMMENT '用户标识',
  `trade_type` varchar(45) DEFAULT NULL COMMENT '交易类型',
  `bank_type` varchar(16) DEFAULT NULL COMMENT '付款银行',
  `time_end` datetime DEFAULT NULL COMMENT '支付完成时间',
  `attach` varchar(128) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型 1："充值" ， 3："订单"， 4："缴纳押金"  6："违章缴费"',
  `status` int(11) DEFAULT '1' COMMENT '订单状态 1：未支付 ，2：已支付',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '商户ID',
  `source` varchar(32) DEFAULT NULL COMMENT '来源iOS，Android',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `INX_OUT_NO` (`out_trade_no`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信支付信息表';

