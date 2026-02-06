

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_ads
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ads`;
CREATE TABLE `tbl_ads` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `down_load_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'video/image URL',
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'link URL',
  `video_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'video thumbnail image',
  `position_id` int(16) NOT NULL DEFAULT '0' COMMENT 'ad position ID',
  `start_time` datetime NOT NULL COMMENT 'start time',
  `end_time` datetime NOT NULL COMMENT 'end time',
  `city` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'display city',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'advertisement name',
  `platform` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'platform',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: video; 2: image',
  `people_tag_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'audience template ID',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '1: enabled, 0: disabled',
  `operator_user` int(10) DEFAULT NULL COMMENT 'operator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_ad_position`;
CREATE TABLE `tbl_ad_position` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ad position ID',
  `position_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ad position name',
  `position_desc` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ad position description',
  `position_type` tinyint(1) NOT NULL COMMENT 'ad position type (1: client; 2: large screen)',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'status (0: paused; 1: enabled)',
  `most_count` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'maximum number of ads',
  `content_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'content type (1: video; 2: image)',
  `operator_user` int(10) NOT NULL DEFAULT '0' COMMENT 'operator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_alipay_callback_info`;
CREATE TABLE `tbl_alipay_callback_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'notification time',
  `notify_type` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'notification type',
  `notify_id` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT 'notification verification ID',
  `app_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT 'app ID assigned by Alipay to developer',
  `charset` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT 'CHARSET',
  `version` varchar(3) CHARACTER SET utf8 DEFAULT NULL COMMENT 'API version',
  `sign_type` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT 'signature type',
  `sign` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT 'signature',
  `trade_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Alipay transaction number',
  `out_trade_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'merchant order number',
  `out_biz_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'merchant business number',
  `buyer_id` varchar(16) CHARACTER SET utf8 DEFAULT NULL COMMENT 'buyer Alipay user ID',
  `buyer_logon_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'buyer Alipay account',
  `seller_id` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT 'seller Alipay user ID',
  `seller_email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'seller Alipay account',
  `trade_status` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT 'transaction status',
  `total_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'order amount',
  `receipt_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'actual received amount',
  `invoice_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'invoice amount',
  `buyer_pay_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'payment amount',
  `point_amount` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'reward points amount',
  `refund_fee` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'total refund amount',
  `subject` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT 'order title',
  `body` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT 'product description',
  `gmt_create` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'transaction creation time',
  `gmt_payment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'transaction payment time',
  `gmt_refund` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'transaction refund time',
  `gmt_close` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'transaction end time',
  `fund_bill_list` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'payment amount details',
  `passback_params` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'passback parameters',
  `voucher_detail_list` varchar(4) CHARACTER SET utf8 DEFAULT NULL COMMENT 'coupon information',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Alipay callback information table';

DROP TABLE IF EXISTS `tbl_app_version_update`;
CREATE TABLE `tbl_app_version_update` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `platform` smallint(6) NOT NULL DEFAULT '0' COMMENT 'platform: 1 iOS, 2 Android',
  `notice_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'notification type (1: mandatory, 2: optional)',
  `prompt` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'upgrade prompt (max 30 characters)',
  `note` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'remarks',
  `start_time` datetime NOT NULL COMMENT 'effective start time',
  `end_time` datetime NOT NULL COMMENT 'effective end time',
  `download_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'installation package URL',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `operator_id` int(11) NOT NULL COMMENT 'creator',
  `app_type` int(2) NOT NULL COMMENT '1: passenger app, 2: driver app, 3: car device app',
  `app_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'app version number',
  `use_status` int(2) NOT NULL DEFAULT '1' COMMENT 'enable/disable status, 0: disabled, 1: enabled',
  `version_code` int(11) NOT NULL DEFAULT '0' COMMENT 'version code',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='passenger, driver, and car device app updates';


DROP TABLE IF EXISTS `tbl_base_info_company`;
CREATE TABLE `tbl_base_info_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(256) NOT NULL COMMENT 'company name',
  `identifier` varchar(32) NOT NULL COMMENT 'unified social credit code',
  `business_scope` varchar(256) NOT NULL COMMENT 'business scope',
  `contact_address` varchar(256) NOT NULL COMMENT 'mailing address',
  `economic_type` varchar(128) NOT NULL COMMENT 'business economic type',
  `reg_capital` varchar(128) NOT NULL COMMENT 'registered capital',
  `legal_name` varchar(256) NOT NULL COMMENT 'legal representative name',
  `legal_id` varchar(32) NOT NULL COMMENT 'legal representative ID number',
  `legal_phone` varchar(32) NOT NULL COMMENT 'legal representative phone',
  `legal_photo` varchar(128) NOT NULL COMMENT 'legal representative ID scan file number',
  `state` int(1) NOT NULL COMMENT 'status: 0 active, 1 inactive',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ride-hailing platform company basic information';

DROP TABLE IF EXISTS `tbl_base_info_company_pay`;
CREATE TABLE `tbl_base_info_company_pay` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(256) NOT NULL COMMENT 'bank or non-bank payment institution name',
  `pay_id` varchar(32) NOT NULL COMMENT 'non-bank payment institution license number',
  `pay_type` varchar(64) NOT NULL COMMENT 'payment business type',
  `pay_scope` varchar(64) NOT NULL COMMENT 'business coverage area',
  `prepare_bank` varchar(64) NOT NULL COMMENT 'reserve fund custodian bank',
  `count_date` int(10) NOT NULL COMMENT 'settlement cycle (days)',
  `state` int(1) NOT NULL COMMENT 'status: 0 active, 1 inactive',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ride-hailing platform company payment information';

-- ----------------------------
-- Records of tbl_base_info_company_pay
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_base_info_company_permit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_base_info_company_permit`;
CREATE TABLE `tbl_base_info_company_permit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `certificate` varchar(64) NOT NULL COMMENT 'online ride-hailing business license number',
  `operation_area` varchar(128) NOT NULL COMMENT 'operation area',
  `owner_name` varchar(256) NOT NULL COMMENT 'company name',
  `organization` varchar(256) NOT NULL COMMENT 'issuing authority name',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'validity start date',
  `stop_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'validity end date',
  `certify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'initial issuance date',
  `state` varchar(8) NOT NULL COMMENT 'license status',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ride-hailing platform company business license';

-- ----------------------------
-- Records of tbl_base_info_company_permit
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_base_info_company_service
-- ----------------------------
DROP TABLE IF EXISTS `tbl_base_info_company_service`;
CREATE TABLE `tbl_base_info_company_service` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(128) NOT NULL COMMENT 'service organization name',
  `service_no` varchar(64) NOT NULL COMMENT 'service organization code',
  `detail_address` varchar(128) NOT NULL COMMENT 'service organization address',
  `responsible_name` varchar(64) NOT NULL COMMENT 'service organization head name',
  `responsible_phone` varchar(32) NOT NULL COMMENT 'person in charge contact phone',
  `manager_name` varchar(64) NOT NULL COMMENT 'service organization manager name',
  `manager_phone` varchar(32) NOT NULL COMMENT 'manager contact phone',
  `contact_phone` varchar(32) NOT NULL COMMENT 'service organization emergency contact phone',
  `mail_address` varchar(128) NOT NULL COMMENT 'administrative document mailing address',
  `create_date` datetime DEFAULT NULL COMMENT 'service organization establishment date',
  `state` int(1) DEFAULT NULL COMMENT 'status',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ride-hailing platform company service organization';

-- ----------------------------
-- Records of tbl_base_info_company_service
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_call_records
-- ----------------------------
DROP TABLE IF EXISTS `tbl_call_records`;
CREATE TABLE `tbl_call_records` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `pool_key` varchar(64) DEFAULT NULL COMMENT 'corresponding number pool key',
  `sub_id` varchar(64) DEFAULT NULL COMMENT 'binding relationship ID of the call triplet',
  `call_id` varchar(64) DEFAULT NULL COMMENT 'unique ID identifying a call record',
  `phone_no` varchar(64) DEFAULT NULL COMMENT 'A number in AXB',
  `secret_no` varchar(64) DEFAULT NULL COMMENT 'X number in AXB',
  `peer_no` varchar(64) DEFAULT NULL COMMENT 'B or N number in AXB',
  `call_type` varchar(64) DEFAULT NULL COMMENT 'call type\r\n0: caller (phone_no calls peer_no); 1: callee (peer_no calls phone_no); 2: SMS sent; 3: SMS received',
  `call_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'call action start time',
  `ring_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'remote phone ringing time',
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'remote answer time',
  `release_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'remote hangup time; release_time - start_time represents call duration; if result is 0, the call was not connected',
  `release_dir` varchar(4) DEFAULT NULL COMMENT 'call release direction',
  `release_cause` int(4) DEFAULT NULL COMMENT 'release cause\r\n1: unassigned number\r\n2: no route to specified transit network\r\n3: no route to destination\r\n4: send special information tone\r\n16: normal call clearing\r\n17: user busy\r\n18: no user responding\r\n19: no answer from user\r\n20: subscriber absent\r\n21: call rejected\r\n22: number changed\r\n27: destination out of order\r\n28: invalid number format (address incomplete)\r\n29: facility rejected\r\n31: normal unspecified\r\n34: no circuit/channel available\r\n42: switching equipment congestion\r\n50: requested facility not subscribed\r\n53: outgoing calls barred within CUG\r\n55: incoming calls barred within CUG\r\n57: bearer capability not authorized\r\n58: bearer capability not presently available\r\n65: bearer capability not implemented\r\n69: requested facility not implemented\r\n87: user not member of CUG\r\n88: incompatible destination\r\n90: non-existent CUG\r\n91: invalid transit network selection\r\n95: invalid message unspecified\r\n97: message type non-existent or not implemented\r\n99: parameter non-existent or not implemented\r\n102: recovery on timer expiry\r\n103: parameter non-existent or not implemented - passed on\r\n110: message with unrecognized parameter - discarded\r\n111: protocol error unspecified\r\n127: interworking unspecified',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='call records table';

DROP TABLE IF EXISTS `tbl_car_base_info`;
CREATE TABLE `tbl_car_base_info` (
  `id` int(11) NOT NULL COMMENT 'vehicle ID',
  `company_logo` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'company identifier',
  `car_label` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle make',
  `car_base_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle type',
  `car_owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle owner',
  `plate_color` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'plate color',
  `engine_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'engine/motor number',
  `car_brain_plate` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'car computer brand',
  `car_brain_number` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'car computer number',
  `vin_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'VIN code',
  `register_time` date DEFAULT NULL COMMENT 'registration date',
  `fuel_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'fuel type',
  `engine_capacity` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'engine displacement',
  `car_img_file_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle photo file number',
  `transport_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'transport certificate number',
  `transport_issuing_authority` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle transport certificate issuing authority',
  `business_area` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'operation area',
  `transport_certificate_validity_start` date DEFAULT NULL COMMENT 'vehicle transport certificate validity start',
  `transport_certificate_validity_end` date DEFAULT NULL COMMENT 'vehicle transport certificate validity end',
  `first_register_time` date DEFAULT NULL COMMENT 'vehicle initial registration date',
  `state_of_repair` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle maintenance status',
  `next_annual_inspection_time` date DEFAULT NULL COMMENT 'next annual inspection time',
  `annual_audit_status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'annual audit status',
  `invoice_printing_equipment_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'invoice printing device serial number',
  `gps_brand` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'GPS device brand',
  `gps_model` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'model',
  `gps_imei` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'IMEI',
  `gps_install_time` date DEFAULT NULL COMMENT 'installation date',
  `report_time` date DEFAULT NULL COMMENT 'filing date',
  `service_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'service type',
  `charge_type_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'fare type code',
  `car_invoice_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle invoice',
  `quality_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'certificate of conformity',
  `vehicle_license_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle license',
  `registration_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'registration certificate',
  `tax_payment_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'tax payment certificate',
  `transport_certificate_img` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'vehicle transport certificate',
  `other_img1` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'other image 1',
  `other_img2` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'other image 2',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_car_bind_change_record`;
CREATE TABLE `tbl_car_bind_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_info_id` int(10) unsigned NOT NULL COMMENT 'vehicle ID',
  `bind_tag` varchar(30) NOT NULL COMMENT 'binding type',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record time',
  `bind_value` varchar(500) NOT NULL COMMENT 'binding content',
  `bind_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0: bind, 1: unbind',
  `operator_id` int(10) unsigned NOT NULL COMMENT 'operator ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='vehicle binding information change records';

DROP TABLE IF EXISTS `tbl_car_brand`;
CREATE TABLE `tbl_car_brand` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT 'vehicle brand ID',
  `brand` varchar(16) NOT NULL DEFAULT '' COMMENT 'vehicle brand',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT 'vehicle model',
  `seats` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'standard seat count',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not deleted, 1: deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `tbl_car_dispatch_capacity_set`;
CREATE TABLE `tbl_car_dispatch_capacity_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `car_service_period` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'vehicle service period: 1 daytime, 2 nighttime',
  `spare_driver_count` int(10) NOT NULL DEFAULT '0' COMMENT 'number of idle drivers',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='vehicle dispatch capacity settings';


DROP TABLE IF EXISTS `tbl_car_dispatch_direct_route_order_radius_set`;
CREATE TABLE `tbl_car_dispatch_direct_route_order_radius_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT 'service type ID',
  `direct_route_order_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ride-along order type: 1 go-home order, 2 relay order, 3 special period reservation order',
  `direct_route_order_radius` int(10) NOT NULL DEFAULT '0' COMMENT 'ride-along order radius (km)',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='vehicle dispatch ride-along order radius settings';


DROP TABLE IF EXISTS `tbl_car_dispatch_distribute_interval_set`;
CREATE TABLE `tbl_car_dispatch_distribute_interval_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT 'service type ID',
  `car_service_before_interval` int(10) NOT NULL DEFAULT '0' COMMENT 'interval before car service (minutes)',
  `car_service_after_interval` int(10) NOT NULL DEFAULT '0' COMMENT 'interval after car service (minutes)',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='vehicle dispatch order assignment interval settings';


DROP TABLE IF EXISTS `tbl_car_dispatch_distribute_radius_set`;
CREATE TABLE `tbl_car_dispatch_distribute_radius_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT 'service type ID',
  `min_radius` int(10) NOT NULL DEFAULT '0' COMMENT 'minimum dispatch radius (km)',
  `min_radius_first_push_driver_count` int(10) NOT NULL DEFAULT '0' COMMENT 'number of drivers pushed at minimum dispatch radius',
  `max_radius` int(10) NOT NULL DEFAULT '0' COMMENT 'maximum dispatch radius (km)',
  `max_radius_first_push_driver_count` int(10) NOT NULL DEFAULT '0' COMMENT 'number of drivers pushed at maximum dispatch radius',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='vehicle dispatch order assignment radius settings';


DROP TABLE IF EXISTS `tbl_car_dispatch_distribute_set`;
CREATE TABLE `tbl_car_dispatch_distribute_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `is_force_distribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'enable forced dispatch: 0 disabled, 1 enabled',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='vehicle dispatch assignment settings';


DROP TABLE IF EXISTS `tbl_car_dispatch_special_period_set`;
CREATE TABLE `tbl_car_dispatch_special_period_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `service_type_id` int(10) NOT NULL,
  `time_period` varchar(255) NOT NULL DEFAULT '' COMMENT 'time period settings',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='vehicle dispatch special period settings';


DROP TABLE IF EXISTS `tbl_car_dispatch_time_threshold_set`;
CREATE TABLE `tbl_car_dispatch_time_threshold_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `service_type_id` int(10) NOT NULL DEFAULT '0' COMMENT 'service type ID',
  `time_threshold_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'time threshold type: 1 enable immediate ride dispatch logic, 2 enable forced dispatch for pending reservation orders',
  `time_threshold` int(10) NOT NULL DEFAULT '0' COMMENT 'time threshold (minutes)',
  `operator_id` int(10) DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='vehicle dispatch time threshold settings';


DROP TABLE IF EXISTS `tbl_car_driver_bind_record`;
CREATE TABLE `tbl_car_driver_bind_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_info_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'driver ID',
  `car_info_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'vehicle ID',
  `operator_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'system',
  `type` int(11) NOT NULL COMMENT '1: bind, 0: unbind',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bind_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'binding time',
  `unbind_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'unbinding time',
  `total_mile` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'vehicle total mileage',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tbl_car_info`;
CREATE TABLE `tbl_car_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'vehicle ID',
  `plate_number` varchar(16) NOT NULL DEFAULT '' COMMENT 'plate number',
  `operation_status` int(2) NOT NULL DEFAULT '0' COMMENT 'operation status: -1 deleted, 0 active, 1 inactive, 2 pending preparation',
  `publish_time` datetime DEFAULT NULL COMMENT 'publish time',
  `full_name` varchar(64) NOT NULL DEFAULT '' COMMENT 'vehicle full name',
  `color` varchar(30) NOT NULL DEFAULT '' COMMENT 'body color',
  `car_img` varchar(256) NOT NULL DEFAULT '' COMMENT 'car image',
  `city_code` varchar(32) NOT NULL DEFAULT '' COMMENT 'city',
  `car_type_id` int(16) unsigned NOT NULL DEFAULT '0' COMMENT 'vehicle type',
  `car_level_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'vehicle level',
  `regist_date` datetime DEFAULT NULL COMMENT 'registration date',
  `insurance_start_date` datetime DEFAULT NULL COMMENT 'insurance effective date',
  `insurance_end_date` datetime DEFAULT NULL COMMENT 'insurance expiration date',
  `annual_end_date` datetime DEFAULT NULL COMMENT 'annual inspection expiration date',
  `car_license_img` varchar(256) NOT NULL DEFAULT '' COMMENT 'vehicle license image URL',
  `is_free_order` int(2) DEFAULT '0' COMMENT 'enable ride-along orders: 0 disabled, 1 enabled',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT 'remarks',
  `use_status` int(2) NOT NULL DEFAULT '0' COMMENT 'enable/disable status, 0: disabled, 1: enabled',
  `large_screen_device_code` varchar(256) NOT NULL DEFAULT '' COMMENT 'large screen device code',
  `large_screen_device_brand` varchar(64) NOT NULL DEFAULT '' COMMENT 'large screen brand name',
  `car_screen_device_code` varchar(256) NOT NULL DEFAULT '' COMMENT 'car device/computer code',
  `car_screen_device_brand` varchar(64) NOT NULL DEFAULT '' COMMENT 'car device/computer brand name',
  `operator_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `total_mile` int(11) NOT NULL DEFAULT '0' COMMENT 'total mileage in km',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_car_level`;
CREATE TABLE `tbl_car_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) NOT NULL DEFAULT '' COMMENT 'vehicle level label',
  `icon` varchar(500) NOT NULL DEFAULT '' COMMENT 'car model icon',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `enable` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'status: 0 disabled, 1 enabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='vehicle level list';


DROP TABLE IF EXISTS `tbl_car_machine_info_record`;
CREATE TABLE `tbl_car_machine_info_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_device_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'device unique code',
  `mileage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'cumulative total mileage, km',
  `sub_mileage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'cumulative sub-mileage',
  `is_ns` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'south or north latitude: N or S',
  `latitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'latitude',
  `is_ew` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'east or west longitude: E or W',
  `longitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'longitude',
  `qf` int(2) NOT NULL DEFAULT '0' COMMENT 'quality factor',
  `satellite_num` int(8) NOT NULL DEFAULT '0' COMMENT 'available satellite count',
  `accuracy` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'accuracy in meters',
  `gps_accuracy_status` int(2) NOT NULL DEFAULT '0' COMMENT 'satellite signal strength',
  `elevation` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'elevation',
  `direction` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'direction',
  `surplus_distance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'remaining range',
  `parking_sw` int(2) NOT NULL DEFAULT '0' COMMENT 'parking brake switch',
  `key_pos` int(2) NOT NULL DEFAULT '0' COMMENT 'key position',
  `sw_gear` int(2) NOT NULL DEFAULT '0' COMMENT 'gear signal',
  `brk_sta` int(2) NOT NULL DEFAULT '0' COMMENT 'brake pedal position',
  `car_speed` int(10) NOT NULL DEFAULT '0' COMMENT 'instantaneous speed',
  `ev_soc` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'remaining battery level',
  `limt_speed` int(10) NOT NULL DEFAULT '0' COMMENT 'vehicle maximum speed',
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
  `driver_id` int(16) NOT NULL COMMENT 'driver ID',
  `car_screen_code` varchar(128) NOT NULL DEFAULT '' COMMENT 'car screen unique code',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'login time',
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'logout time',
  `login_status` int(2) NOT NULL COMMENT 'login status: 1 logged in, 2 logged out',
  `repair_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'repaired logout time',
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
  `brand` varchar(30) NOT NULL DEFAULT '' COMMENT 'brand',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT 'model',
  `seats` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'seat count',
  `city` varchar(30) NOT NULL DEFAULT '' COMMENT 'city',
  `type_desc` varchar(60) NOT NULL DEFAULT '',
  `img_url` varchar(500) NOT NULL DEFAULT '' COMMENT 'car model image URL',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0: disabled, 1: enabled',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'entry time',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `operator_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'operator',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `tbl_channel`;
CREATE TABLE `tbl_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(64) NOT NULL COMMENT 'channel name',
  `channel_status` int(2) NOT NULL DEFAULT '0' COMMENT 'channel status: 1 enabled, 0 paused',
  `operator_id` int(11) NOT NULL COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300005 DEFAULT CHARSET=utf8 COMMENT='channel management table';


DROP TABLE IF EXISTS `tbl_charge_rule`;
CREATE TABLE `tbl_charge_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_code` varchar(32) NOT NULL DEFAULT '' COMMENT 'city code',
  `service_type_id` int(10) NOT NULL COMMENT 'service type',
  `channel_id` int(10) NOT NULL COMMENT 'channel name',
  `car_level_id` int(10) NOT NULL COMMENT 'vehicle level',
  `lowest_price` double(10,2) NOT NULL COMMENT 'base price',
  `base_price` double(10,2) NOT NULL COMMENT 'starting price',
  `base_kilo` double(10,2) NOT NULL COMMENT 'kilometers included in base price',
  `base_minutes` double(10,2) NOT NULL COMMENT 'minutes included in base price',
  `per_kilo_price` double(10,2) NOT NULL COMMENT 'extra mileage unit price (per km)',
  `per_minute_price` double(10,2) NOT NULL COMMENT 'extra time unit price (per minute)',
  `beyond_start_kilo` double(10,2) NOT NULL COMMENT 'long-distance starting kilometers',
  `beyond_per_kilo_price` double(10,2) NOT NULL COMMENT 'long-distance unit price',
  `night_start` time DEFAULT NULL COMMENT 'night period start',
  `night_end` time DEFAULT NULL COMMENT 'night period end',
  `night_per_kilo_price` double(10,2) DEFAULT NULL COMMENT 'night extra mileage surcharge per km',
  `night_per_minute_price` double(10,2) DEFAULT NULL COMMENT 'night extra time surcharge per minute',
  `effective_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'effective time',
  `active_status` int(11) NOT NULL DEFAULT '0' COMMENT 'effective status: 0 expired, 1 active',
  `is_unuse` int(11) NOT NULL DEFAULT '0' COMMENT 'is unavailable: 0 available, 1 unavailable',
  `creator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'creator ID',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='billing rule table';


DROP TABLE IF EXISTS `tbl_charge_rule_detail`;
CREATE TABLE `tbl_charge_rule_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) NOT NULL,
  `start` int(2) NOT NULL COMMENT 'time period start',
  `end` int(2) NOT NULL COMMENT 'time period end',
  `per_kilo_price` double(10,2) NOT NULL COMMENT 'extra mileage unit price',
  `per_minute_price` double(10,2) NOT NULL COMMENT 'extra time unit price',
  `is_delete` int(10) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='billing rule time period table';


DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE `tbl_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(64) NOT NULL COMMENT 'city name',
  `city_code` varchar(32) NOT NULL COMMENT 'city code',
  `city_longitude_latitude` varchar(64) NOT NULL COMMENT 'city center latitude and longitude',
  `order_risk_top` int(4) NOT NULL COMMENT 'order risk upper limit',
  `city_status` int(2) NOT NULL DEFAULT '0' COMMENT 'is enabled: 0 disabled, 1 enabled',
  `operator_id` int(11) NOT NULL COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_code` (`city_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='city table';


DROP TABLE IF EXISTS `tbl_coupon`;
CREATE TABLE `tbl_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'coupon ID',
  `status` int(4) unsigned NOT NULL DEFAULT '1' COMMENT 'coupon status: 0 disabled, 1 enabled',
  `coupon_name` varchar(60) NOT NULL COMMENT 'coupon name',
  `coupon_desc` varchar(250) NOT NULL DEFAULT '' COMMENT 'coupon description',
  `coupon_type` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'discount type: 1 cash coupon, 3 special coupon - free delivery, 4 special coupon - free return, 2 discount coupon',
  `coupon_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'coupon type ID',
  `coupon_class_name` varchar(60) NOT NULL DEFAULT '' COMMENT 'coupon type name',
  `get_method` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1: actively distributed, 2: user acquired',
  `minimum_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'minimum order amount',
  `reduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'deduction amount, only for cash coupons',
  `maximum_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'maximum deduction amount',
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT 'discount ratio',
  `effective_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'validity type: 1 days, 2 time period',
  `effective_day` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'validity days',
  `enable_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'validity start time',
  `expire_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'validity end time',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_user` varchar(30) NOT NULL DEFAULT '' COMMENT 'created by user',
  `function_type` int(4) NOT NULL DEFAULT '1' COMMENT 'function type: 1 marketing campaign, 2 order compensation',
  `total_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'total quantity',
  `get_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'acquired count',
  `used_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'used count',
  `operator_id` int(10) unsigned DEFAULT '0' COMMENT 'operator ID',
  PRIMARY KEY (`id`),
  KEY `inx_fuction_type` (`function_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='coupon configuration table';

DROP TABLE IF EXISTS `tbl_coupon_activity`;
CREATE TABLE `tbl_coupon_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_no` varchar(30) NOT NULL DEFAULT '' COMMENT 'plan number',
  `activity_name` varchar(30) NOT NULL DEFAULT '' COMMENT 'plan name',
  `enable_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'activity start time',
  `expire_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'expiration time',
  `activity_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'discount form',
  `coupon_rule` varchar(250) NOT NULL DEFAULT '' COMMENT 'coupon claim rules',
  `activity_desc` varchar(250) NOT NULL DEFAULT '' COMMENT 'activity description',
  `get_times` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'coupon claim times',
  `send_times` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'send times',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'last modifier ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0: frozen, 1: normal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='marketing plan table';


DROP TABLE IF EXISTS `tbl_coupon_class`;
CREATE TABLE `tbl_coupon_class` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'discount type: 1 cash coupon, 2 discount coupon',
  `coupon_name` varchar(30) NOT NULL DEFAULT '' COMMENT 'coupon name',
  `reduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'deduction amount',
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT 'discount ratio (8, 7.5)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'last modifier ID',
  `is_pause` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'paused: 0 no, 1 yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='coupon type table';

DROP TABLE IF EXISTS `tbl_coupon_conditions`;
CREATE TABLE `tbl_coupon_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'coupon ID',
  `hour_set` varchar(80) NOT NULL DEFAULT '' COMMENT 'hour set',
  `week_set` varchar(15) NOT NULL DEFAULT '' COMMENT 'week set',
  `date_set` varchar(80) NOT NULL DEFAULT '' COMMENT 'date set',
  `city_set` varchar(1023) NOT NULL DEFAULT '' COMMENT 'city set',
  `car_set` varchar(60) NOT NULL DEFAULT '' COMMENT 'vehicle type set',
  `service_set` varchar(30) NOT NULL DEFAULT '' COMMENT 'service set',
  `level_set` varchar(30) NOT NULL DEFAULT '',
  `hour_raw` varchar(120) NOT NULL DEFAULT '' COMMENT 'time period raw data',
  `date_raw` varchar(120) NOT NULL DEFAULT '' COMMENT 'date raw data',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='coupon usage condition restrictions table';


DROP TABLE IF EXISTS `tbl_coupon_send_info`;
CREATE TABLE `tbl_coupon_send_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_num` int(11) NOT NULL COMMENT 'distribution quantity',
  `start_time` datetime NOT NULL COMMENT 'start time',
  `end_time` datetime NOT NULL COMMENT 'end time',
  `operator_user` varchar(64) NOT NULL COMMENT 'operating user',
  `get_num` int(11) NOT NULL COMMENT 'claimed quantity',
  `use_num` int(11) NOT NULL COMMENT 'used quantity',
  `coupon_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `img_url` varchar(128) NOT NULL,
  `message` varchar(256) NOT NULL,
  `send_list` varchar(5120) NOT NULL,
  `send_time` datetime NOT NULL,
  `send_status` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL COMMENT 'coupon description text',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tbl_coupon_task`;
CREATE TABLE `tbl_coupon_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'coupon ID',
  `coupon_name` varchar(30) NOT NULL DEFAULT '' COMMENT 'coupon name',
  `number` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'distribution quantity',
  `task_tag` varchar(30) NOT NULL DEFAULT '' COMMENT 'task tag for distinguishing different batches',
  `people_tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'audience template ID',
  `task_target` varchar(1280) NOT NULL DEFAULT '' COMMENT 'task target, max 100 phone numbers',
  `app_tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'app content template ID',
  `sms_tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'SMS content template ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'operator ID',
  `task_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'task status: 0 not started, 1 in progress, 2 completed',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_cancel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'is terminated: 0 no, 1 yes',
  `plan_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'planned send time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='coupon send task table';

DROP TABLE IF EXISTS `tbl_device_blacklist`;
CREATE TABLE `tbl_device_blacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_type` char(1) NOT NULL DEFAULT '' COMMENT '1 android 2 ios3 other',
  `device_code` varchar(64) NOT NULL DEFAULT '' COMMENT 'phone device serial code',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT 'last login time',
  `is_release` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '1: unbanned, 0: banned',
  `phones` mediumtext COMMENT 'phone numbers with outstanding debt',
  `memo` mediumtext NOT NULL COMMENT 'remarks',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='device blacklist';

DROP TABLE IF EXISTS `tbl_dictionary`;
CREATE TABLE `tbl_dictionary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dic_parentid` int(10) NOT NULL COMMENT 'parent ID',
  `dic_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'type',
  `dic_name` varchar(50) NOT NULL DEFAULT '',
  `dic_value` varchar(200) NOT NULL DEFAULT '' COMMENT 'value',
  `dic_desc` varchar(200) NOT NULL DEFAULT '' COMMENT 'description',
  `dic_order` int(5) unsigned NOT NULL COMMENT 'sort order',
  `dic_status` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `typeindex` (`dic_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='dictionary table';

-- ----------------------------
-- Records of tbl_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_driver_address
-- ----------------------------
DROP TABLE IF EXISTS `tbl_driver_address`;
CREATE TABLE `tbl_driver_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) unsigned NOT NULL COMMENT 'driver ID',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT 'detailed address',
  `address_longitude` varchar(32) NOT NULL DEFAULT '' COMMENT 'address longitude',
  `address_latitude` varchar(32) NOT NULL DEFAULT '' COMMENT 'address latitude',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'edit time',
  `tag` varchar(15) NOT NULL DEFAULT '' COMMENT 'tag',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'is default address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='driver ride-along address records table';

DROP TABLE IF EXISTS `tbl_driver_advice`;
CREATE TABLE `tbl_driver_advice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) NOT NULL DEFAULT '0' COMMENT 'driver ID',
  `advice_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'feedback type',
  `advice_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'feedback content',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'driver phone',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_driver_base_info`;
CREATE TABLE `tbl_driver_base_info` (
  `id` int(11) NOT NULL,
  `mobile_operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'mobile carrier',
  `company_logo` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'company identifier',
  `administrative_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'registration administrative area code',
  `birthday` date DEFAULT NULL COMMENT 'driver date of birth',
  `country` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'nationality',
  `national` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'driver ethnicity',
  `driving_licence_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'driving license number',
  `marital_status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'marital status',
  `foreign_language_ability` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'foreign language ability',
  `app_version` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'app version in use',
  `map_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'map type in use',
  `education_background` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'driver education level',
  `household_registration_authority` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'household registration authority name',
  `registered_permanent_residence_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'household registration address',
  `address` varchar(736) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'current residential address',
  `address_longitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'current address longitude',
  `address_latitude` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'current address latitude',
  `driver_img_file_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'driver photo file number',
  `driver_license` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'motor vehicle driver license',
  `driver_license_scan_copy_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'motor vehicle driver license scan file number',
  `driving_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'permitted vehicle type',
  `first_get_driver_license_date` datetime DEFAULT NULL COMMENT 'first driver license issuance date',
  `driver_license_validity_start` datetime DEFAULT NULL COMMENT 'driver license validity start',
  `driver_license_validity_end` datetime DEFAULT NULL COMMENT 'driver license validity end',
  `is_taxi_driver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'is cruising taxi driver',
  `network_reservation_taxi_driver_license_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'online ride-hailing driver license number',
  `network_reservation_taxi_driver_license_issuing_agencies` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'online ride-hailing driver license issuing authority',
  `certificate_issuing_date` datetime DEFAULT NULL COMMENT 'qualification certificate issuance date',
  `first_qualification_date` datetime DEFAULT NULL COMMENT 'first qualification certificate issuance date',
  `qualification_certificate_validity_start` datetime DEFAULT NULL COMMENT 'qualification certificate validity start',
  `qualification_certificate_validity_end` datetime DEFAULT NULL COMMENT 'qualification certificate validity end',
  `reported_date` datetime DEFAULT NULL COMMENT 'filing date',
  `is_full_time_driver` int(11) NOT NULL DEFAULT '0' COMMENT 'is full-time driver',
  `is_in_driver_blacklist` int(11) NOT NULL DEFAULT '0' COMMENT 'is in blacklist',
  `service_type` int(11) NOT NULL DEFAULT '0' COMMENT 'service type',
  `company` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'driver contract signing company',
  `contract_start_date` datetime DEFAULT NULL COMMENT 'contract start time',
  `contract_end_date` datetime DEFAULT NULL COMMENT 'contract end time',
  `emergency_contact` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'emergency contact',
  `emergency_contact_phone_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'emergency contact phone',
  `emergency_contact_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'emergency contact address',
  `training_courses` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'training course name',
  `training_courses_date` datetime DEFAULT NULL COMMENT 'training course date',
  `training_courses_start_date` datetime DEFAULT NULL COMMENT 'training start date',
  `training_courses_end_date` datetime DEFAULT NULL COMMENT 'training end date',
  `training_courses_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'training duration',
  `bank_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'bank name',
  `bank_card_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'bank card number',
  `note` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'remarks',
  `qualification_certificate_img` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'professional qualification certificate photo',
  `other_img1` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'other image 1',
  `other_img2` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'other image 2',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_driver_bind_change_record`;
CREATE TABLE `tbl_driver_bind_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_info_id` int(10) unsigned NOT NULL COMMENT 'driver ID',
  `bind_tag` varchar(30) NOT NULL COMMENT 'binding type',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'record time',
  `bind_value` varchar(500) NOT NULL COMMENT 'binding content',
  `bind_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0: bind, 1: unbind',
  `operator_id` int(10) unsigned NOT NULL COMMENT 'operator ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='driver binding information change records';

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
  `phone_number` varchar(32) NOT NULL DEFAULT '' COMMENT 'driver phone number',
  `driver_leader` int(11) unsigned DEFAULT '0' COMMENT 'driver supervisor',
  `driver_name` varchar(16) NOT NULL DEFAULT '' COMMENT 'driver name',
  `register_time` datetime DEFAULT NULL COMMENT 'registration time',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'balance',
  `gender` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'gender',
  `car_id` int(16) unsigned DEFAULT NULL COMMENT 'vehicle ID',
  `is_following` int(1) NOT NULL DEFAULT '0' COMMENT 'is ride-along order: 0 no, 1 yes',
  `work_status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'driver work status\r\n0: off duty,\r\n1: on duty, no orders,\r\n2: on duty, order accepted,\r\n3: order acceptance paused',
  `head_img` varchar(256) NOT NULL DEFAULT '' COMMENT 'driver avatar',
  `city_code` varchar(8) NOT NULL DEFAULT '' COMMENT 'city code',
  `bind_time` datetime DEFAULT NULL COMMENT 'binding time',
  `use_status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'enable/disable status, 0: disabled, 1: enabled',
  `cs_work_status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'car device work status\r\n0: car device not logged in\r\n1: car device logged in\r\n2: car device listening for orders\r\n3: car device paused listening\r\n4: car device off duty\r\n\r\n',
  `sign_status` int(2) NOT NULL DEFAULT '1' COMMENT '1: contracted, 0: terminated',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='driver information table';

DROP TABLE IF EXISTS `tbl_driver_licence_info`;
CREATE TABLE `tbl_driver_licence_info` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT COMMENT 'audit record ID',
  `driver_id` int(16) NOT NULL DEFAULT '0' COMMENT 'driver ID',
  `main_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT 'driving license main page photo URL',
  `vice_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT 'driving license secondary page photo URL',
  `all_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT 'driving license both pages photo URL',
  `group_driving_license` varchar(256) NOT NULL DEFAULT '' COMMENT 'hand-held driving license photo URL',
  `identity_card_id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID card number',
  `main_idcard_license` varchar(256) NOT NULL DEFAULT '' COMMENT 'ID card front photo',
  `vice_idcard_license` varchar(256) NOT NULL DEFAULT '' COMMENT 'ID card back photo URL',
  `group_idcard_license` varchar(256) NOT NULL DEFAULT '' COMMENT 'hand-held ID card photo',
  `plate_number` varchar(16) NOT NULL DEFAULT '' COMMENT 'plate number',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`),
  KEY `fk_reference_2` (`driver_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='driver license information';

DROP TABLE IF EXISTS `tbl_driver_message`;
CREATE TABLE `tbl_driver_message` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_id` int(16) unsigned NOT NULL DEFAULT '0',
  `driver_id` int(16) NOT NULL DEFAULT '0',
  `content` varchar(256) NOT NULL DEFAULT '',
  `is_delete` int(2) NOT NULL DEFAULT '0' COMMENT '1: deleted, 0: not deleted',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `if_success` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'is send successful',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT 'order ID',
  `message_type` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'message type',
  `message_channel` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '1: JPush notification, 2: SMS',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `tbl_driver_order_message_statistical`;
CREATE TABLE `tbl_driver_order_message_statistical` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) NOT NULL COMMENT 'driver ID',
  `driving_licence_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'motor vehicle driver license number',
  `cycle` varchar(255) NOT NULL COMMENT 'statistics cycle in YYYYMM format',
  `order_count` int(10) NOT NULL COMMENT 'completed order count',
  `traffic_violations_count` int(32) NOT NULL DEFAULT '0' COMMENT 'traffic violation count',
  `complained_count` int(32) NOT NULL DEFAULT '0' COMMENT 'complaint count',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='driver order and other information statistics';


DROP TABLE IF EXISTS `tbl_driver_punish`;
CREATE TABLE `tbl_driver_punish` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) NOT NULL COMMENT 'driver ID',
  `punish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'punishment time',
  `punish_reason` varchar(128) NOT NULL COMMENT 'punishment reason',
  `punish_result` varchar(128) NOT NULL COMMENT 'punishment result',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='driver punishment table';


DROP TABLE IF EXISTS `tbl_driver_rate`;
CREATE TABLE `tbl_driver_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `driver_id` int(10) NOT NULL COMMENT 'driver ID',
  `grade` int(2) NOT NULL DEFAULT '0' COMMENT 'grade',
  `test_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'assessment date',
  `test_department` varchar(255) NOT NULL DEFAULT '' COMMENT 'assessment organization',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='driver honor information table';


DROP TABLE IF EXISTS `tbl_driver_work_time`;
CREATE TABLE `tbl_driver_work_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) unsigned NOT NULL COMMENT 'driver ID',
  `work_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'work start time',
  `work_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'work end time',
  `work_duration` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'work duration this session',
  `work_day` date NOT NULL DEFAULT '0000-00-00' COMMENT 'work day',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='driver work time';


DROP TABLE IF EXISTS `tbl_dynamic_discount_city`;
CREATE TABLE `tbl_dynamic_discount_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `dynamic_discount_rule_id` int(10) NOT NULL DEFAULT '0' COMMENT 'dynamic discount association ID',
  `city_code` varchar(32) NOT NULL DEFAULT '' COMMENT 'city code',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='dynamic pricing city table';


DROP TABLE IF EXISTS `tbl_dynamic_discount_info`;
CREATE TABLE `tbl_dynamic_discount_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `dynamic_discount_rule_id` int(10) NOT NULL DEFAULT '0' COMMENT 'dynamic discount association ID',
  `km` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'mileage',
  `discount` double(3,2) NOT NULL DEFAULT '0.00' COMMENT 'discount',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='dynamic discount information table';


DROP TABLE IF EXISTS `tbl_dynamic_discount_rule`;
CREATE TABLE `tbl_dynamic_discount_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `service_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'service type',
  `car_level` varchar(255) NOT NULL DEFAULT '' COMMENT 'vehicle level',
  `time_set` varchar(255) NOT NULL DEFAULT '' COMMENT 'time period settings',
  `date_type` int(1) NOT NULL DEFAULT '0' COMMENT 'date type: 1 weekday, 2 special date',
  `week_set` varchar(255) NOT NULL DEFAULT '' COMMENT 'weekday settings',
  `special_date_set` varchar(255) NOT NULL DEFAULT '' COMMENT 'special date settings',
  `discount_max_price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'discount cap amount',
  `valid_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'effective start time',
  `valid_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'effective end time',
  `is_unuse` int(1) NOT NULL DEFAULT '0' COMMENT 'is unavailable: 0 available, 1 unavailable',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='dynamic discount rule table';


DROP TABLE IF EXISTS `tbl_evaluate_driver`;
CREATE TABLE `tbl_evaluate_driver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto-increment primary key',
  `grade` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'score',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT 'evaluation content',
  `order_id` int(10) unsigned NOT NULL COMMENT 'order ID',
  `passenger_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'passenger ID',
  `driver_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'driver ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='customer order evaluation table';

DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT '',
  `phone` varchar(64) NOT NULL,
  `terminal` char(255) NOT NULL DEFAULT '' COMMENT 'terminal\r\n1: passenger\r\n2: driver\r\n3: car device\r\n4: large screen',
  `category` char(255) NOT NULL DEFAULT '' COMMENT 'issue category',
  `content` varchar(255) DEFAULT NULL COMMENT 'feedback content',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='user feedback records table';

DROP TABLE IF EXISTS `tbl_fence_info`;
CREATE TABLE `tbl_fence_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(70) NOT NULL DEFAULT '' COMMENT 'Amap GID',
  `city_code` varchar(70) NOT NULL DEFAULT '' COMMENT 'city code',
  `fence_name` varchar(70) NOT NULL DEFAULT '' COMMENT 'fence name',
  `valid_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'effective start time',
  `valid_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'effective end time',
  `is_deny` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is disabled: 0 enabled, 1 disabled',
  ` is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='geofence management';


DROP TABLE IF EXISTS `tbl_flight_number`;
CREATE TABLE `tbl_flight_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(30) DEFAULT NULL COMMENT 'flight number',
  `flight_date` date NOT NULL COMMENT 'flight date',
  `passenger_info_id` int(11) unsigned NOT NULL,
  `start_code` char(3) DEFAULT NULL COMMENT 'origin code',
  `end_code` char(3) DEFAULT NULL COMMENT 'destination code',
  `is_subscribe` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'is subscribed: 1 subscribed, 0 unsubscribed',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'record creation date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='user flight number';

DROP TABLE IF EXISTS `tbl_invoice_record`;
CREATE TABLE `tbl_invoice_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'invoice ID',
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'passenger ID',
  `order_id_list` varchar(512) NOT NULL COMMENT 'order list, comma separated',
  `invoice_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'invoice total price',
  `invoice_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1: pending invoicing (applied),\r\n2: pending mailing,\r\n3: mailed,\r\n4: revoked',
  `invoice_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'invoice type: 1 regular, 2 special',
  `invoice_body` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'invoice entity: 1 individual, 2 enterprise',
  `invoice_title` varchar(128) NOT NULL DEFAULT '' COMMENT 'invoice title',
  `invoice_content` varchar(128) NOT NULL DEFAULT '' COMMENT 'invoice content',
  `taxpayer_id` varchar(32) NOT NULL DEFAULT '' COMMENT 'taxpayer identification number',
  `reg_address` varchar(256) NOT NULL DEFAULT '' COMMENT 'registered address',
  `reg_phone` varchar(32) NOT NULL DEFAULT '' COMMENT 'registered phone',
  `deposit_bank` varchar(218) NOT NULL DEFAULT '' COMMENT 'bank of deposit',
  `bank_account` varchar(32) NOT NULL DEFAULT '' COMMENT 'bank account number',
  `receiver_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'recipient name',
  `receiver_phone` varchar(16) NOT NULL DEFAULT '' COMMENT 'recipient phone',
  `receiver_address` varchar(256) NOT NULL DEFAULT '' COMMENT 'recipient address',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'invoice application time',
  `express_company` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'express company',
  `express_num` varchar(32) NOT NULL DEFAULT '' COMMENT 'express tracking number',
  `express_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'mailing time',
  `reject_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'rejection reason ID',
  `cancel_desc` varchar(32) NOT NULL DEFAULT '' COMMENT 'cancellation reason',
  `email` varchar(128) NOT NULL DEFAULT '' COMMENT 'email address',
  `invoice_number` varchar(32) NOT NULL DEFAULT '' COMMENT 'invoice number',
  `express_company_name` varchar(128) NOT NULL DEFAULT '' COMMENT 'express company name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_large_screen_passenger`;
CREATE TABLE `tbl_large_screen_passenger` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'passenger ID',
  `device_code` varchar(128) NOT NULL COMMENT 'device code',
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `login_status` int(2) DEFAULT NULL COMMENT 'login status: 1 logged in, 2 logged out',
  `repair_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='passenger large screen login status';

-- ----------------------------
-- Records of tbl_large_screen_passenger
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_message_show
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_show`;
CREATE TABLE `tbl_message_show` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT 'title',
  `content` varchar(512) NOT NULL COMMENT 'message body',
  `yid` varchar(32) NOT NULL DEFAULT '' COMMENT 'passenger/driver ID or large screen device code',
  `accept_identity` tinyint(3) NOT NULL COMMENT 'sender terminal (1: passenger; 2: driver; 4: large screen)',
  `send_time` datetime NOT NULL COMMENT 'send time',
  `push_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'push type (1: marketing notification, 2: system notification, 3: order notification, 4: payment notification)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'is visible (0: hidden, 1: visible)',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is read (0: unread, 1: read)',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT 'order number',
  `sms_send_app_id` int(10) NOT NULL DEFAULT '0' COMMENT 'push task ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1522 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(32) NOT NULL DEFAULT '' COMMENT 'order number',
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'passenger ID',
  `passenger_phone` varchar(64) NOT NULL COMMENT 'passenger phone',
  `device_code` varchar(64) NOT NULL DEFAULT '' COMMENT 'passenger device code',
  `driver_id` int(10) unsigned DEFAULT NULL COMMENT 'driver ID',
  `driver_status` int(2) unsigned DEFAULT '0' COMMENT 'driver status\r\n0: no driver accepted\r\n1: driver accepted\r\n2: going to pick up passenger\r\n3: driver arrived at pickup point\r\n4: trip started\r\n5: trip ended\r\n6: payment initiated\r\n7: cancelled',
  `driver_phone` varchar(64) DEFAULT NULL COMMENT 'driver phone',
  `car_id` int(10) unsigned DEFAULT NULL COMMENT 'vehicle ID',
  `plate_number` varchar(16) DEFAULT NULL COMMENT 'plate number',
  `user_longitude` varchar(32) NOT NULL COMMENT 'user location longitude',
  `user_latitude` varchar(32) NOT NULL COMMENT 'user location latitude',
  `start_longitude` varchar(32) NOT NULL COMMENT 'passenger order origin longitude',
  `start_latitude` varchar(32) NOT NULL COMMENT 'passenger order origin latitude',
  `start_address` varchar(128) NOT NULL COMMENT 'origin name',
  `end_address` varchar(128) NOT NULL COMMENT 'destination address name',
  `start_time` timestamp NULL DEFAULT NULL COMMENT 'passenger order time',
  `order_start_time` timestamp NULL DEFAULT NULL COMMENT 'order start time',
  `end_longitude` varchar(32) NOT NULL COMMENT 'passenger order destination longitude',
  `end_latitude` varchar(32) NOT NULL COMMENT 'passenger order destination latitude',
  `driver_grab_time` timestamp NULL DEFAULT NULL COMMENT 'driver order grab time',
  `driver_start_time` timestamp NULL DEFAULT NULL COMMENT 'driver departure time to pick up passenger',
  `driver_arrived_time` timestamp NULL DEFAULT NULL COMMENT 'driver arrival time',
  `pick_up_passenger_longitude` varchar(32) DEFAULT '' COMMENT 'pickup longitude',
  `pick_up_passenger_latitude` varchar(32) DEFAULT '' COMMENT 'pickup latitude',
  `pick_up_passenger_address` varchar(300) DEFAULT '' COMMENT 'pickup location',
  `receive_passenger_time` timestamp NULL DEFAULT NULL COMMENT 'passenger pickup time',
  `receive_passenger_longitude` varchar(32) NOT NULL DEFAULT '' COMMENT 'passenger pickup longitude',
  `receive_passenger_latitude` varchar(32) NOT NULL DEFAULT '' COMMENT 'passenger pickup latitude',
  `passenger_getoff_time` timestamp NULL DEFAULT NULL COMMENT 'passenger drop-off time',
  `passenger_getoff_longitude` varchar(32) DEFAULT NULL COMMENT 'passenger drop-off longitude',
  `passenger_getoff_latitude` varchar(32) DEFAULT NULL COMMENT 'passenger drop-off latitude',
  `other_name` varchar(16) DEFAULT NULL COMMENT 'other person name (rider)',
  `other_phone` varchar(64) DEFAULT NULL COMMENT 'other person phone (rider)',
  `order_type` int(2) unsigned DEFAULT NULL COMMENT 'order type: 1 self-booking, 2 booking for others',
  `service_type` int(2) unsigned NOT NULL COMMENT 'ride order type:\r\n1: real-time order,\r\n2: reservation order,\r\n3: airport pickup,\r\n4: airport drop-off,\r\n5: full-day rental,\r\n6: half-day rental',
  `order_channel` int(2) unsigned NOT NULL DEFAULT '1' COMMENT 'order channel:\r\n1: own order\r\n2: Amap\r\n3: Fliggy',
  `status` int(2) NOT NULL COMMENT 'order status: 0 estimated, 1 started, 2 driver accepted, 3 going to pick up, 4 driver arrived at origin, 5 passenger boarded and trip started, 6 arrived at destination and trip ended unpaid, 7 payment initiated, 8 payment completed, 9 passenger cancelled',
  `transaction_id` varchar(32) DEFAULT NULL COMMENT 'merchant transaction ID',
  `mapping_id` varchar(64) DEFAULT NULL COMMENT 'order status: 0 estimated, 1 started, 2 driver accepted, 3 going to pick up, 4 driver arrived at origin, 5 passenger boarded and trip started, 6 arrived at destination and trip ended unpaid, 7 payment initiated, 8 payment completed, 9 order cancelled',
  `mapping_number` varchar(32) DEFAULT NULL COMMENT 'associated number',
  `merchant_id` varchar(32) DEFAULT NULL COMMENT 'merchant ID',
  `is_evaluate` int(2) NOT NULL DEFAULT '0' COMMENT 'passenger evaluated: 0 not evaluated, 1 evaluated',
  `invoice_type` int(2) unsigned NOT NULL DEFAULT '1' COMMENT 'invoice status:\r\n1: not invoiced,\r\n2: invoice applied,\r\n3: invoicing,\r\n4: invoiced,\r\n5: returned',
  `is_annotate` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'customer service notification status:\r\n0: not notified\r\n1: notified',
  `source` varchar(64) NOT NULL COMMENT 'device source:\r\n1: iOS\r\n2: Android\r\n3: other',
  `use_coupon` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'coupon used:\r\n0: not used, 1: used',
  `cancel_order_type` int(2) unsigned DEFAULT NULL COMMENT 'cancellation reason type ID',
  `pay_type` int(1) DEFAULT NULL COMMENT '1: balance\r\n2: WeChat\r\n3: Alipay',
  `is_paid` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'is paid: 0 unpaid, 1 paid',
  `is_cancel` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'is cancelled: 0 not cancelled, 1 cancelled',
  `is_adjust` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'adjustment status: 0 not adjusted, 1 adjusting, 2 adjusted',
  `is_dissent` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'is disputed order: 0 no, 1 yes',
  `is_manual` int(1) NOT NULL DEFAULT '0' COMMENT 'is manually dispatched: 0 no, 1 originally no driver - manually dispatched, 2 originally had driver - reassigned',
  `is_following` int(1) NOT NULL DEFAULT '0' COMMENT 'is ride-along order: 0 no, 1 yes',
  `is_fake_success` int(1) NOT NULL DEFAULT '0' COMMENT 'is false success order: 0 no, 1 yes',
  `memo` varchar(500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT 'memo',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `user_feature` int(2) DEFAULT '0' COMMENT '1: child ride\r\n2: female ride',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1967 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='order table';

DROP TABLE IF EXISTS `tbl_order_adjust_record`;
CREATE TABLE `tbl_order_adjust_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'order ID',
  `doubt_id` int(10) unsigned DEFAULT NULL,
  `adjust_account_type` int(255) unsigned NOT NULL COMMENT 'adjustment type: 1 recharge, 2 deduction',
  `charge_number` varchar(32) DEFAULT NULL COMMENT 'recharge/deduction order number',
  `old_cost` decimal(10,2) NOT NULL COMMENT 'amount before adjustment',
  `new_cost` decimal(10,2) NOT NULL COMMENT 'amount after adjustment',
  `reason_type` int(10) unsigned NOT NULL COMMENT 'adjustment reason ID',
  `reason_text` varchar(500) NOT NULL DEFAULT '' COMMENT 'custom adjustment reason',
  `solution` varchar(500) DEFAULT NULL COMMENT 'handling solution',
  `operator` int(10) unsigned NOT NULL COMMENT 'operator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='order account adjustment';


-- ----------------------------
-- Table structure for tbl_order_cancel_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_cancel_record`;
CREATE TABLE `tbl_order_cancel_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT 'order ID',
  `is_charge` int(10) unsigned NOT NULL COMMENT 'passenger at fault: 0 not at fault, 1 at fault',
  `cancel_cost` double(10,0) NOT NULL COMMENT 'cancellation fee',
  `reason_type` int(10) unsigned NOT NULL COMMENT 'cancellation reason type:\r\n1\r\n2\r\n3\r\n4',
  `reason_text` varchar(128) NOT NULL COMMENT 'other reason',
  `operator` int(10) unsigned NOT NULL COMMENT 'operator',
  `operator_type` int(1) NOT NULL COMMENT 'operator type: 1 customer self-cancel, 2 service agent cancel',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COMMENT='order cancellation reason';

DROP TABLE IF EXISTS `tbl_order_change_record`;
CREATE TABLE `tbl_order_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL COMMENT 'order ID',
  `driver_befor` int(11) DEFAULT NULL COMMENT 'original driver ID',
  `driver_after` int(11) DEFAULT NULL COMMENT 'reassigned driver ID',
  `reason` varchar(64) DEFAULT NULL COMMENT 'dispatch reason',
  `create_time` datetime DEFAULT NULL COMMENT 'creation time',
  `operate_uesr` varchar(64) DEFAULT NULL COMMENT 'operating user',
  `other_reason` varchar(64) DEFAULT NULL COMMENT 'other reason',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_order_doubt`;
CREATE TABLE `tbl_order_doubt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT 'order ID',
  `appeal_number` varchar(32) NOT NULL DEFAULT '' COMMENT 'appeal number',
  `adjust_type` int(10) unsigned DEFAULT NULL COMMENT 'adjustment type:\r\n1: recharge\r\n2: deduction\r\n3: issue coupon',
  `adjust_content` varchar(200) NOT NULL DEFAULT '' COMMENT 'adjustment content: recharge/deduction number, coupon',
  `reason_type` int(10) unsigned DEFAULT NULL COMMENT 'dispute reason type:\r\n1: early billing,\r\n2: driver detour,\r\n3: unknown charges,\r\n4: other issues',
  `reason_text` varchar(300) DEFAULT '' COMMENT 'custom other dispute reason',
  `old_cost` decimal(10,2) DEFAULT NULL COMMENT 'amount before adjustment',
  `now_cost` decimal(10,2) DEFAULT NULL COMMENT 'amount after adjustment',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '1: pending,\r\n2: pending review,\r\n3: reviewed,\r\n4: completed,\r\n5: revoked',
  `handle_type` int(10) unsigned DEFAULT NULL COMMENT 'handling type:\r\n1: recharge\r\n2: deduction\r\n3: issue coupon',
  `solution` varchar(200) NOT NULL DEFAULT '' COMMENT 'handling solution',
  `operators` varchar(50) NOT NULL DEFAULT '' COMMENT 'operators (all operators recorded)',
  `operate_time` timestamp NULL DEFAULT NULL COMMENT 'operation time',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'submission time',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='account adjustment review';

DROP TABLE IF EXISTS `tbl_order_gift_coupon_record`;
CREATE TABLE `tbl_order_gift_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'order ID',
  `doubt_id` int(10) DEFAULT NULL COMMENT 'disputed order ID from order_doubt table',
  `passenger_info_id` int(10) DEFAULT NULL COMMENT 'passenger ID receiving the coupon',
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'coupon type ID',
  `user_phone` varchar(64) NOT NULL COMMENT 'user phone',
  `coupon_name` varchar(200) DEFAULT NULL COMMENT 'coupon type name',
  `user_coupon_id` int(10) DEFAULT NULL COMMENT 'user coupon ID',
  `coupon_amount` float(10,2) DEFAULT NULL COMMENT 'coupon amount',
  `coupon_expired_date` varchar(200) DEFAULT NULL COMMENT 'coupon validity description text',
  `operator_id` int(10) NOT NULL COMMENT 'operator ID',
  `operator_time` datetime NOT NULL COMMENT 'operation time',
  `solution` varchar(300) DEFAULT NULL COMMENT 'handling solution',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_order_payment`;
CREATE TABLE `tbl_order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT 'order ID',
  `pay_type` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'payment type: 1 WeChat, 2 account balance, 4 Alipay',
  `total_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'total amount',
  `balance_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'balance payment amount',
  `wechat_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'WeChat payment amount',
  `alipay_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Alipay payment amount',
  `user_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'user coupon ID, this is the user-coupon association ID, not the coupon ID itself',
  `coupon_reduce_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'coupon deduction amount',
  `paid_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'paid amount',
  `remain_price` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'remaining payment amount',
  `tail_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'final payment price',
  `replenish_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'supplementary deduction price',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'payment time',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='order payment table';

DROP TABLE IF EXISTS `tbl_order_points`;
CREATE TABLE `tbl_order_points` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(16) DEFAULT NULL COMMENT 'driver ID',
  `car_id` int(16) DEFAULT NULL COMMENT 'vehicle ID',
  `order_id` int(16) DEFAULT NULL COMMENT 'order ID',
  `points` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_order_reassignment_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_reassignment_record`;
CREATE TABLE `tbl_order_reassignment_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT 'order ID',
  `driver_id_before` int(10) unsigned NOT NULL COMMENT 'original driver ID',
  `driver_name_before` varchar(100) NOT NULL DEFAULT '' COMMENT 'original driver name',
  `driver_id_now` int(10) unsigned NOT NULL COMMENT 'current driver ID',
  `driver_name_now` varchar(100) NOT NULL DEFAULT '' COMMENT 'current driver name',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT 'operator',
  `reason_type` int(64) NOT NULL COMMENT 'reassignment reason',
  `reason_text` varchar(200) DEFAULT '' COMMENT 'reassignment content',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='order reassignment';


-- ----------------------------
-- Table structure for tbl_order_rule_mirror
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_rule_mirror`;
CREATE TABLE `tbl_order_rule_mirror` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT 'order ID',
  `rule_id` int(10) NOT NULL COMMENT 'pricing rule ID',
  `rule` text NOT NULL COMMENT 'rule snapshot JSON',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1967 DEFAULT CHARSET=utf8 COMMENT='order billing rule snapshot table';

-- ----------------------------
-- Table structure for tbl_order_rule_price
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_rule_price`;
CREATE TABLE `tbl_order_rule_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT 'order ID',
  `category` varchar(1) NOT NULL COMMENT 'price type: 0 estimated, 1 actual',
  `total_price` double(10,2) NOT NULL COMMENT 'total price',
  `total_distance` double(10,2) NOT NULL COMMENT 'total distance (km)',
  `total_time` double(10,0) NOT NULL COMMENT 'total time (minutes)',
  `city_code` varchar(32) NOT NULL COMMENT 'city code',
  `city_name` varchar(64) NOT NULL COMMENT 'city name',
  `service_type_id` int(2) NOT NULL COMMENT 'service type ID',
  `service_type_name` varchar(64) NOT NULL COMMENT 'service type name',
  `channel_id` int(10) NOT NULL COMMENT 'channel ID',
  `channel_name` varchar(64) NOT NULL COMMENT 'channel name',
  `car_level_id` int(10) NOT NULL COMMENT 'vehicle level ID',
  `car_level_name` varchar(64) NOT NULL COMMENT 'vehicle level name',
  `base_price` double(10,2) NOT NULL COMMENT 'base price',
  `base_kilo` double(10,2) NOT NULL COMMENT 'kilometers included in base price',
  `base_minute` double(10,2) NOT NULL COMMENT 'minutes included in base price',
  `lowest_price` double(10,2) NOT NULL COMMENT 'minimum charge',
  `night_start` time DEFAULT NULL COMMENT 'night period start time',
  `night_end` time DEFAULT NULL COMMENT 'night period end time',
  `night_per_kilo_price` double(10,2) DEFAULT NULL COMMENT 'night extra per-km surcharge',
  `night_per_minute_price` double(10,2) DEFAULT NULL COMMENT 'night extra per-minute surcharge',
  `night_distance` double(10,2) NOT NULL COMMENT 'total night driving distance (km)',
  `night_time` double(10,2) NOT NULL COMMENT 'total night driving time (minutes)',
  `night_price` double(10,2) NOT NULL COMMENT 'night service fee',
  `beyond_start_kilo` double(10,2) NOT NULL COMMENT 'long-distance starting kilometer',
  `beyond_per_kilo_price` double(10,2) NOT NULL COMMENT 'long-distance per-km price',
  `beyond_distance` double(8,2) NOT NULL COMMENT 'long-distance km exceeding threshold',
  `beyond_price` double(10,2) NOT NULL COMMENT 'long-distance fee',
  `per_kilo_price` double(10,2) NOT NULL COMMENT 'extra per-km price (price per km)',
  `path` double(10,2) NOT NULL COMMENT 'total trip distance (km, excluding base) or segmented pricing total distance (km)',
  `path_price` double(10,2) NOT NULL COMMENT 'total trip distance price (excluding base) or segmented pricing total price',
  `per_minute_price` double(10,2) NOT NULL COMMENT 'extra per-minute price or segmented pricing default per-minute price',
  `duration` double(10,2) NOT NULL COMMENT 'total trip duration (minutes, excluding base) or segmented pricing total duration (minutes)',
  `duration_price` double(10,2) NOT NULL COMMENT 'total trip duration price (excluding base) or segmented pricing total time price',
  `rest_duration` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'other period total duration',
  `rest_duration_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'other period total duration fee',
  `rest_distance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'other period total distance',
  `rest_distance_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'other period total distance fee',
  `road_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'toll fee',
  `parking_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'parking fee',
  `other_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'other fees',
  `dynamic_discount_rate` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'dynamic pricing discount rate (0-1, two decimals)',
  `dynamic_discount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'dynamic pricing discount amount',
  `supplement_price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'minimum charge supplement fee',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2196 DEFAULT CHARSET=utf8 COMMENT='billing detail table';

-- ----------------------------
-- Table structure for tbl_order_rule_price_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_rule_price_detail`;
CREATE TABLE `tbl_order_rule_price_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL COMMENT 'order ID',
  `category` varchar(1) NOT NULL COMMENT 'price type: 0 reserved, 1 actual',
  `start_hour` int(2) NOT NULL COMMENT 'time period start',
  `end_hour` int(2) NOT NULL COMMENT 'time period end',
  `per_kilo_price` double(10,2) NOT NULL COMMENT 'extra per-km price (price per km)',
  `per_minute_price` double(10,2) NOT NULL COMMENT 'extra per-minute price (price per minute)',
  `duration` double(10,2) NOT NULL COMMENT 'time statistics for this period',
  `time_price` double(10,2) NOT NULL COMMENT 'total time price for this period',
  `distance` double(10,2) NOT NULL COMMENT 'distance statistics for this period',
  `distance_price` double(10,2) NOT NULL COMMENT 'total distance price for this period',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='segmented time-based billing detail table';

-- ----------------------------
-- Records of tbl_order_rule_price_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_order_send_coupon_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_send_coupon_record`;
CREATE TABLE `tbl_order_send_coupon_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) NOT NULL COMMENT 'order ID',
  `coupon_id` int(10) NOT NULL COMMENT 'coupon ID',
  `operator` int(10) NOT NULL COMMENT 'operator ID',
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
  `order_id` int(11) unsigned NOT NULL COMMENT 'order ID',
  `coupon_id` int(11) unsigned NOT NULL COMMENT 'coupon ID',
  `category` char(1) NOT NULL DEFAULT '0' COMMENT '0: estimated, 1: actual',
  `coupon_money` float(10,2) NOT NULL DEFAULT '0.00' COMMENT 'coupon amount',
  `after_use_coupon_moeny` float(10,2) DEFAULT NULL COMMENT 'order amount after coupon applied',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8 COMMENT='order coupon usage record';

DROP TABLE IF EXISTS `tbl_organization_info`;
CREATE TABLE `tbl_organization_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'organization info ID',
  `organization_name` varchar(255) DEFAULT '' COMMENT 'service organization name',
  `organization_code` varchar(255) DEFAULT '' COMMENT 'service organization code',
  `administrative_division_code` varchar(255) DEFAULT '' COMMENT 'administrative division code',
  `organization_address` varchar(255) DEFAULT '' COMMENT 'service organization address',
  `duty_name` varchar(255) DEFAULT '' COMMENT 'person in charge name',
  `duty_phone` varchar(32) DEFAULT '' COMMENT 'person in charge phone',
  `admin_name` varchar(10) DEFAULT '' COMMENT 'admin name',
  `admin_phone` varchar(32) DEFAULT '' COMMENT 'admin phone',
  `organization_head_phone` varchar(32) DEFAULT '' COMMENT 'service organization main phone',
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
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'passenger ID',
  `latitude` double(10,6) DEFAULT NULL COMMENT 'address latitude',
  `longitude` double(10,6) DEFAULT NULL COMMENT 'address longitude',
  `address_name` varchar(64) DEFAULT '' COMMENT 'detailed address',
  `type` int(2) DEFAULT NULL COMMENT '0: home, 1: company',
  `address_desc` varchar(2048) DEFAULT '' COMMENT 'address description',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- ----------------------------
-- Table structure for tbl_passenger_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_blacklist`;
CREATE TABLE `tbl_passenger_blacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(64) NOT NULL COMMENT 'phone number',
  `reason` char(1) NOT NULL DEFAULT '' COMMENT '1: individual user cancelled orders 3 times within 1 hour; 2: cancelled 10 dispatched orders within 24 hours',
  `category` char(1) NOT NULL DEFAULT '1' COMMENT '1: temporary blacklist, 2: permanent blacklist',
  `is_release` char(1) NOT NULL DEFAULT '0' COMMENT '1: unblocked, 0: not unblocked',
  `release_time` timestamp NULL DEFAULT NULL COMMENT 'unblock time',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='user blacklist';


-- ----------------------------
-- Table structure for tbl_passenger_consume_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_consume_record`;
CREATE TABLE `tbl_passenger_consume_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `event` char(1) NOT NULL COMMENT 'consumption event: 1. order deduction, 2. etc.',
  `monetary` decimal(10,2) NOT NULL COMMENT 'consumption amount',
  `transaction_number` varchar(32) NOT NULL DEFAULT '' COMMENT 'transaction number',
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
  `passenger_info_id` int(10) unsigned NOT NULL COMMENT 'passenger ID',
  `passenger_phone` char(11) NOT NULL DEFAULT '' COMMENT 'passenger phone',
  `type` int(10) unsigned NOT NULL COMMENT '1: pickup location, 2: dropoff location',
  `address` varchar(500) DEFAULT '' COMMENT 'detailed address',
  `city_code` varchar(32) DEFAULT NULL COMMENT 'city code',
  `city` varchar(32) DEFAULT NULL COMMENT 'city',
  `detail_name` varchar(100) DEFAULT NULL COMMENT 'address short name',
  `ad_code` varchar(32) DEFAULT NULL COMMENT 'address code',
  `longitude` varchar(32) NOT NULL DEFAULT '' COMMENT 'longitude',
  `latitude` varchar(32) NOT NULL DEFAULT '' COMMENT 'latitude',
  `address_poi` varchar(1000) DEFAULT NULL,
  `is_del` char(1) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_passenger_history_car_person`;
CREATE TABLE `tbl_passenger_history_car_person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(10) unsigned NOT NULL COMMENT 'booking person ID',
  `passenger_phone` varchar(32) NOT NULL COMMENT 'booking person phone',
  `use_car_person_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'rider name',
  `use_car_person_phone` varchar(64) DEFAULT NULL COMMENT 'rider phone',
  `is_del` char(1) NOT NULL DEFAULT '0' COMMENT 'is deleted: 0 not deleted, 1 deleted',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_passenger_info`;
CREATE TABLE `tbl_passenger_info` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT 'phone number',
  `educatioan` varchar(255) DEFAULT '' COMMENT 'education',
  `birthday` date DEFAULT NULL COMMENT 'birthday',
  `passenger_name` varchar(16) NOT NULL DEFAULT '' COMMENT 'passenger name',
  `register_time` datetime DEFAULT NULL COMMENT 'registration time',
  `balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'balance',
  `gender` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '0: female, 1: male',
  `head_img` varchar(256) NOT NULL DEFAULT '' COMMENT 'avatar',
  `passenger_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'user type, 1: individual user, 2: enterprise user',
  `user_level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'membership level',
  `register_type` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'registration channel: 1 Android, 2 iOS',
  `last_login_time` datetime DEFAULT NULL COMMENT 'last login time',
  `last_login_method` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'last login method: 1 verification code, 2 password',
  `last_login_screen_time` datetime DEFAULT NULL COMMENT 'last large screen login time',
  `last_login_screen_method` char(1) NOT NULL DEFAULT '' COMMENT 'last large screen login method',
  `last_order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'last order time',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
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
  `passenger_info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'user ID',
  `total_distance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'total mileage',
  `month_distance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'current month mileage',
  `total_charge` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'total recharge amount',
  `total_refund` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'total refund amount',
  `total_order_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'total order payment amount',
  `month_order_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'monthly order payment amount',
  `total_invoice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'total invoiced amount',
  `can_invoice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'total uninvoiced amount',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='passenger statistics table';

-- ----------------------------
-- Records of tbl_passenger_statics
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_passenger_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tbl_passenger_wallet`;
CREATE TABLE `tbl_passenger_wallet` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(16) DEFAULT NULL COMMENT 'passenger ID',
  `capital` double(10,2) DEFAULT NULL COMMENT 'principal amount',
  `give_fee` double(10,2) DEFAULT NULL COMMENT 'bonus amount',
  `freeze_capital` double(10,2) DEFAULT NULL COMMENT 'frozen principal',
  `freeze_give_fee` double(10,2) DEFAULT NULL COMMENT 'frozen bonus',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_userid` (`passenger_info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='passenger wallet';

DROP TABLE IF EXISTS `tbl_passenger_wallet_1106`;
CREATE TABLE `tbl_passenger_wallet_1106` (
  `id` int(16) NOT NULL DEFAULT '0',
  `passenger_info_id` int(16) DEFAULT NULL COMMENT 'passenger ID',
  `capital` double(10,2) DEFAULT NULL COMMENT 'principal amount',
  `give_fee` double(10,2) DEFAULT NULL COMMENT 'bonus amount',
  `freeze_capital` double(10,2) DEFAULT NULL COMMENT 'frozen principal',
  `freeze_give_fee` double(10,2) DEFAULT NULL COMMENT 'frozen bonus',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_passenger_wallet_freeze_record`;
CREATE TABLE `tbl_passenger_wallet_freeze_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(16) NOT NULL COMMENT 'passenger ID',
  `freeze_capital` double(10,2) DEFAULT NULL COMMENT 'frozen principal',
  `freeze_give_fee` double(10,2) DEFAULT NULL COMMENT 'frozen bonus',
  `order_id` int(16) NOT NULL COMMENT 'order ID',
  `freeze_status` int(2) DEFAULT NULL COMMENT '0: unfrozen, 1: frozen',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='wallet freeze/unfreeze record';

DROP TABLE IF EXISTS `tbl_passenger_wallet_record`;
CREATE TABLE `tbl_passenger_wallet_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passenger_info_id` int(16) NOT NULL COMMENT 'user ID',
  `transaction_id` varchar(32) DEFAULT '' COMMENT 'third-party payment ID',
  `pay_time` datetime NOT NULL COMMENT 'payment time',
  `pay_capital` double(10,2) NOT NULL COMMENT 'principal amount',
  `pay_give_fee` double(10,2) NOT NULL COMMENT 'bonus amount',
  `refund_capital` double(10,2) DEFAULT '0.00' COMMENT 'refund principal',
  `refund_give_fee` double(10,2) DEFAULT '0.00' COMMENT 'refund bonus',
  `recharge_discount` double(10,2) NOT NULL COMMENT 'recharge discount',
  `pay_type` tinyint(2) NOT NULL COMMENT '1: WeChat, 2: account balance, 3: platform account, 4: Alipay',
  `pay_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1: paid, 0: unpaid',
  `trade_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'transaction type: 1 recharge, 2 consumption, 3 refund, 4 order freeze, 5 order supplementary deduction, 6 final payment, 7 unfreeze',
  `trade_reason` varchar(100) NOT NULL DEFAULT '' COMMENT 'transaction reason',
  `description` varchar(200) NOT NULL COMMENT 'description',
  `create_user` varchar(20) DEFAULT NULL COMMENT 'created by user',
  `order_id` int(10) DEFAULT NULL COMMENT 'order ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_userid` (`passenger_info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='recharge transaction record';

DROP TABLE IF EXISTS `tbl_people_tag`;
CREATE TABLE `tbl_people_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(60) NOT NULL DEFAULT '' COMMENT 'audience tag name',
  `tag_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'target category (1: passenger, 2: driver)',
  `tag_conditions` varchar(2000) NOT NULL DEFAULT '' COMMENT 'filter conditions',
  `tag_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'tag audience count (approximate)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `operator_id` int(10) NOT NULL DEFAULT '0' COMMENT 'updater ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='audience tag';

DROP TABLE IF EXISTS `tbl_phone_message`;
CREATE TABLE `tbl_phone_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT 'phone number',
  `sms_content` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT 'message body',
  `send_time` datetime NOT NULL COMMENT 'send time',
  `push_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'push type (1: marketing, 2: notification)',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'send status (0: failed, 1: success)',
  `operator` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'operator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_push_account`;
CREATE TABLE `tbl_push_account` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(32) NOT NULL DEFAULT '' COMMENT 'device source: iOS, Android',
  `jpush_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'push notification device ID',
  `yid` varchar(64) NOT NULL COMMENT 'system user ID: driver/passenger use yid, large screen/car device use unique code',
  `audience` int(2) NOT NULL DEFAULT '1' COMMENT 'audience type: 1: alias, 2: registration ID',
  `identity_status` int(2) unsigned NOT NULL COMMENT 'identity flag: 1: passenger, 2: driver, 3: car device, 4: large screen',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='JPush ID device table';

DROP TABLE IF EXISTS `tbl_push_app_message`;
CREATE TABLE `tbl_push_app_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'passenger/driver ID or large screen device number',
  `accept_identity` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'receiver (1: passenger, 2: driver, 4: large screen)',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'title',
  `content` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'message content',
  `send_time` datetime NOT NULL COMMENT 'send time',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'display status (0: hidden, 1: displayed)',
  `push_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'push type (1: marketing, 2: system, 3: order, 4: payment notification)',
  `sms_send_app_id` int(10) NOT NULL DEFAULT '0' COMMENT 'push task ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2284 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_push_loop_message`;
CREATE TABLE `tbl_push_loop_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accept_identity` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '1: passenger, 2: driver, 3: car device, 4: large screen',
  `accept_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'receiver ID',
  `message_type` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'message type, see enum definition',
  `message_body` varchar(1024) NOT NULL DEFAULT '' COMMENT 'message body',
  `read_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0: unread, 1: read',
  `send_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'sender ID',
  `send_identity` int(2) NOT NULL COMMENT 'sender identity category',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'message expiration time',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'message creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `expire_time` (`expire_time`),
  KEY `accept_id` (`accept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='message system list';

DROP TABLE IF EXISTS `tbl_push_message_record`;
CREATE TABLE `tbl_push_message_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'system type',
  `jpush_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'device token for receiving notifications',
  `message_type` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'message type',
  `message_body` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'message content',
  `send_result` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'send result: 1 success, 0 failed',
  `send_id` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'sender ID',
  `send_identity` int(2) NOT NULL COMMENT 'sender identity category',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3044 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='push notification record';


-- ----------------------------
-- Table structure for tbl_recharge_price
-- ----------------------------
DROP TABLE IF EXISTS `tbl_recharge_price`;
CREATE TABLE `tbl_recharge_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'paymentID',
  `amount` double(10,2) DEFAULT NULL COMMENT 'recharge amount',
  `reward` double(10,2) DEFAULT NULL COMMENT 'bonus reward amount',
  `desc` varchar(200) DEFAULT NULL COMMENT 'amount description',
  `is_deleted` bit(1) DEFAULT NULL COMMENT 'is deleted: 1 deleted, 0 not deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='recharge amount rules';

DROP TABLE IF EXISTS `tbl_secret_voice_records`;
CREATE TABLE `tbl_secret_voice_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_id` varchar(64) NOT NULL,
  `subs_id` varchar(64) NOT NULL COMMENT 'corresponding triplet binding relationship ID',
  `call_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'call time',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT 'file downloaded: 0 not downloaded, 1 downloaded',
  `oss_download_url` varchar(512) DEFAULT NULL COMMENT 'file download URL',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COMMENT='call recording upload record table';


-- ----------------------------
-- Table structure for tbl_service
-- ----------------------------
DROP TABLE IF EXISTS `tbl_service`;
CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(32) NOT NULL COMMENT 'city code',
  `service_type_id` int(11) NOT NULL COMMENT 'service type ID',
  `together_order_number` int(4) NOT NULL DEFAULT '0' COMMENT 'max concurrent orders allowed',
  `service_status` int(2) NOT NULL COMMENT 'service status: 0 paused, 1 enabled',
  `operator_id` int(11) NOT NULL COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_service_type`;
CREATE TABLE `tbl_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_name` varchar(64) NOT NULL COMMENT 'service type name',
  `service_type_status` int(2) NOT NULL COMMENT 'service type status: 1 enabled, 0 paused',
  `is_use` char(1) NOT NULL DEFAULT '0' COMMENT 'usage status: 1 in use, 0 not in use',
  `operator_id` int(11) NOT NULL COMMENT 'operator ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='service type table';

DROP TABLE IF EXISTS `tbl_sms`;
CREATE TABLE `tbl_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger_phone_number` varchar(16) NOT NULL DEFAULT '' COMMENT 'passenger phone number',
  `sms_content` varchar(512) NOT NULL DEFAULT '' COMMENT 'SMS content',
  `send_time` datetime NOT NULL COMMENT 'send time',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT 'operator',
  `send_flag` tinyint(1) NOT NULL COMMENT 'send status: 0 failed, 1 success',
  `send_number` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'number of send failures',
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
  `template_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'template name',
  `template_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'template type (1: marketing, 2: notification)',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'template content',
  `operator_user` int(10) DEFAULT NULL COMMENT 'operator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'message title name',
  `show_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'display target (1: passenger, 2: driver)',
  `sms_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'message type (1: marketing, 2: notification)',
  `people_tag_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'audience tag ID',
  `sms_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'message image',
  `app_template_id` int(11) NOT NULL DEFAULT '0' COMMENT 'message copy template ID',
  `sms_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'link URL',
  `start_time` datetime NOT NULL COMMENT 'effective time',
  `send_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'push status (0: not pushed, 1: pushed)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'enabled status',
  `operator_user` int(10) DEFAULT NULL COMMENT 'operator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_tima` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
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
  `sms_template_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'copy template template_id',
  `sms_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'message type (1: marketing, 2: notification)',
  `send_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'send type (1: single, 2: batch)',
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'single send phone number',
  `phone_file` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'batch send file name',
  `send_people` int(10) NOT NULL DEFAULT '0' COMMENT '1: passenger, 2: driver',
  `operator_user` int(10) DEFAULT NULL COMMENT 'operator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tbl_sms_template`;
CREATE TABLE `tbl_sms_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(16) NOT NULL DEFAULT '' COMMENT 'SMS template ID',
  `template_name` varchar(128) DEFAULT NULL,
  `content` varchar(512) NOT NULL DEFAULT '' COMMENT 'template content',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `template_type` tinyint(1) NOT NULL DEFAULT '3' COMMENT 'template type (1: marketing, 2: notification, 3: order)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TEMPLATE_ID` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tbl_sys_config`;
CREATE TABLE `tbl_sys_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(30) NOT NULL COMMENT 'configuration key',
  `conf_val` varchar(2000) NOT NULL COMMENT 'configuration value',
  `conf_name` varchar(30) NOT NULL COMMENT 'configuration name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='system configuration miscellaneous';

DROP TABLE IF EXISTS `tbl_sys_user`;
CREATE TABLE `tbl_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `salt` varchar(15) NOT NULL DEFAULT '' COMMENT 'password salt',
  `phone` varchar(32) NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'last login time',
  `modify_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'last modifier ID',
  `last_update_password_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_tv_apps`;
CREATE TABLE `tbl_tv_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(16) NOT NULL COMMENT 'application name',
  `version_code` int(11) NOT NULL COMMENT 'version code',
  `start_time` datetime NOT NULL COMMENT 'update start time',
  `down_load_url` varchar(255) NOT NULL COMMENT 'app package download URL',
  `package_name` varchar(32) NOT NULL COMMENT 'package name',
  `ico_url` varchar(255) NOT NULL COMMENT 'app icon URL',
  `use_status` int(2) NOT NULL COMMENT 'app status: 1 enabled, 0 disabled',
  `position` int(3) NOT NULL COMMENT 'app position',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT 'is deleted: 1 yes, 0 no',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `operator_id` int(11) NOT NULL COMMENT 'creator ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_tv_version_update`;
CREATE TABLE `tbl_tv_version_update` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'TV platform version name',
  `tv_version_code` int(4) NOT NULL DEFAULT '0' COMMENT 'tvVersionCode',
  `tv_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'version number',
  `notice_type` smallint(6) NOT NULL COMMENT 'notification type (1: mandatory, 2: optional)',
  `prompt` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'upgrade prompt (max 30 characters)',
  `note` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'remarks',
  `start_time` datetime NOT NULL COMMENT 'effective start time',
  `end_time` datetime NOT NULL COMMENT 'effective end time',
  `download_url` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'installation package URL',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT 'creator ID',
  `use_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'enable/disable status: 0 disabled, 1 enabled',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tbl_user_coupon`;
CREATE TABLE `tbl_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'claim record ID',
  `passenger_id` int(11) NOT NULL DEFAULT '0' COMMENT 'passenger ID',
  `phone_number` varchar(20) NOT NULL DEFAULT '' COMMENT 'phone number',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT 'associated order number',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'coupon ID',
  `coupon_name` varchar(30) DEFAULT '',
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'coupon type: 1 cash coupon, 2 special-free delivery, 3 special-free return, 4 discount coupon',
  `get_method` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1: actively distributed, 2: user claimed',
  `enable_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'coupon effective time',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'claim time',
  `expire_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'expiration time',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'usage time',
  `use_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'usage time',
  `is_use` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'status: 0 unused, 1 used',
  `minimum_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'minimum spending amount',
  `reduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'reduction amount (cash coupon: deductible amount, discount coupon: max deductible amount)',
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT 'discount rate e.g. 8, 7.5',
  `function_type` int(4) NOT NULL DEFAULT '0' COMMENT 'function type: 1 marketing campaign, 2 order compensation',
  `indemnity_record_id` int(10) NOT NULL DEFAULT '0' COMMENT 'compensation record ID',
  `activity_tag` varchar(30) NOT NULL DEFAULT '' COMMENT 'campaign tag',
  `activity_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'campaign ID',
  PRIMARY KEY (`id`),
  KEY `INX_PHONE` (`phone_number`),
  KEY `INX_COUPON` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1252 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='user coupon table';

DROP TABLE IF EXISTS `tbl_weixinpay_callback_info`;
CREATE TABLE `tbl_weixinpay_callback_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(32) DEFAULT NULL COMMENT 'WeChat order number',
  `out_trade_no` varchar(32) DEFAULT NULL COMMENT 'merchant order number',
  `total_fee` int(11) DEFAULT NULL,
  `body` varchar(200) DEFAULT NULL,
  `result_code` varchar(16) DEFAULT NULL COMMENT 'business result',
  `err_code` varchar(45) DEFAULT NULL COMMENT 'error code',
  `openid` varchar(128) DEFAULT NULL COMMENT 'user identifier',
  `trade_type` varchar(45) DEFAULT NULL COMMENT 'transaction type',
  `bank_type` varchar(16) DEFAULT NULL COMMENT 'payment bank',
  `time_end` datetime DEFAULT NULL COMMENT 'payment completion time',
  `attach` varchar(128) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT 'order type: 1 recharge, 3 order, 4 deposit payment, 6 violation fee payment',
  `status` int(11) DEFAULT '1' COMMENT 'order status: 1 unpaid, 2 paid',
  `mch_id` varchar(32) DEFAULT NULL COMMENT 'merchant ID',
  `source` varchar(32) DEFAULT NULL COMMENT 'source: iOS, Android',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `INX_OUT_NO` (`out_trade_no`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='WeChat payment info table';

