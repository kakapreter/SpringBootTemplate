/*
Navicat MariaDB Data Transfer

Source Server         : 2023-08-23
Source Server Version : 100519
Source Host           : localhost:3306
Source Database       : nnshop

Target Server Type    : MariaDB
Target Server Version : 100519
File Encoding         : 65001

Date: 2023-10-21 08:34:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for award
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `point` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES ('2', '1', '50');

-- ----------------------------
-- Table structure for award_log
-- ----------------------------
DROP TABLE IF EXISTS `award_log`;
CREATE TABLE `award_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `award_id` bigint(20) DEFAULT NULL,
  `point` bigint(20) DEFAULT 0,
  `description` varchar(100) DEFAULT NULL,
  `grant_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of award_log
-- ----------------------------

-- ----------------------------
-- Table structure for nna_admin
-- ----------------------------
DROP TABLE IF EXISTS `nna_admin`;
CREATE TABLE `nna_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of nna_admin
-- ----------------------------
INSERT INTO `nna_admin` VALUES ('1', 'jack', '123456', null, null, null, null, null);

-- ----------------------------
-- Table structure for nna_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `nna_admin_role`;
CREATE TABLE `nna_admin_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `admin_id` bigint(20) unsigned DEFAULT NULL COMMENT '管理员id',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员角色关联';

-- ----------------------------
-- Records of nna_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for nna_login_log
-- ----------------------------
DROP TABLE IF EXISTS `nna_login_log`;
CREATE TABLE `nna_login_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `admin_id` bigint(20) unsigned DEFAULT NULL COMMENT '管理员id',
  `username` varchar(50) DEFAULT NULL COMMENT '管理员用户名（冗余）',
  `nickname` varchar(50) DEFAULT NULL COMMENT '管理员昵称（冗余）',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '浏览器内核',
  `gmt_login` datetime DEFAULT NULL COMMENT '登录时间',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员登录日志';

-- ----------------------------
-- Records of nna_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for nna_permission
-- ----------------------------
DROP TABLE IF EXISTS `nna_permission`;
CREATE TABLE `nna_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `sort` tinyint(3) unsigned DEFAULT 0 COMMENT '排序序号',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限';

-- ----------------------------
-- Records of nna_permission
-- ----------------------------

-- ----------------------------
-- Table structure for nna_role
-- ----------------------------
DROP TABLE IF EXISTS `nna_role`;
CREATE TABLE `nna_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `sort` tinyint(3) unsigned DEFAULT 0 COMMENT '排序序号',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色';

-- ----------------------------
-- Records of nna_role
-- ----------------------------

-- ----------------------------
-- Table structure for nna_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `nna_role_permission`;
CREATE TABLE `nna_role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint(20) unsigned DEFAULT NULL COMMENT '权限id',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限关联';

-- ----------------------------
-- Records of nna_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_album
-- ----------------------------
DROP TABLE IF EXISTS `nnp_album`;
CREATE TABLE `nnp_album` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `name` varchar(50) DEFAULT NULL COMMENT '相册名称',
  `description` varchar(255) DEFAULT NULL COMMENT '相册简介',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='相册';

-- ----------------------------
-- Records of nnp_album
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_attribute
-- ----------------------------
DROP TABLE IF EXISTS `nnp_attribute`;
CREATE TABLE `nnp_attribute` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `template_id` bigint(20) unsigned DEFAULT NULL COMMENT '所属属性模版id',
  `name` varchar(50) DEFAULT NULL COMMENT '属性名称',
  `description` varchar(255) DEFAULT NULL COMMENT '属性简介（某些属性名称可能相同，通过简介补充描述）',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '属性类型，1=销售属性，0=非销售属性',
  `input_type` tinyint(3) unsigned DEFAULT NULL COMMENT '输入类型，0=手动录入，1=单选，2=多选，3=单选（下拉列表），4=多选（下拉列表）',
  `value_list` varchar(255) DEFAULT NULL COMMENT '备选值列表',
  `unit` varchar(50) DEFAULT NULL COMMENT '计量单位',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `is_allow_customize` tinyint(3) unsigned DEFAULT NULL COMMENT '是否允许自定义，1=允许，0=禁止',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='属性';

-- ----------------------------
-- Records of nnp_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_attribute_template
-- ----------------------------
DROP TABLE IF EXISTS `nnp_attribute_template`;
CREATE TABLE `nnp_attribute_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词列表，各关键词使用英文的逗号分隔',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='类别';

-- ----------------------------
-- Records of nnp_attribute_template
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_category
-- ----------------------------
DROP TABLE IF EXISTS `nnp_category`;
CREATE TABLE `nnp_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父级类别id，如果无父级，则为0',
  `depth` tinyint(3) unsigned DEFAULT NULL COMMENT '深度，最顶级类别的深度为1，次级为2，以此类推',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词列表，各关键词使用英文的逗号分隔',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标图片的URL',
  `enable` tinyint(3) unsigned DEFAULT NULL COMMENT '是否启用，1=启用，0=未启用',
  `is_parent` tinyint(3) unsigned DEFAULT NULL COMMENT '是否为父级（是否包含子级），1=是父级，0=不是父级',
  `is_display` tinyint(3) unsigned DEFAULT NULL COMMENT '是否显示在导航栏中，1=启用，0=未启用',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='类别';

-- ----------------------------
-- Records of nnp_category
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_category_attribute_template
-- ----------------------------
DROP TABLE IF EXISTS `nnp_category_attribute_template`;
CREATE TABLE `nnp_category_attribute_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `category_id` bigint(20) unsigned DEFAULT NULL COMMENT '类别id',
  `attribute_template_id` bigint(20) unsigned DEFAULT NULL COMMENT '属性模版id',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='类别与属性模版关联';

-- ----------------------------
-- Records of nnp_category_attribute_template
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_picture
-- ----------------------------
DROP TABLE IF EXISTS `nnp_picture`;
CREATE TABLE `nnp_picture` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `album_id` bigint(20) unsigned DEFAULT NULL COMMENT '相册id',
  `url` varchar(255) DEFAULT NULL COMMENT '图片url',
  `description` varchar(255) DEFAULT NULL COMMENT '图片简介',
  `width` smallint(5) unsigned DEFAULT NULL COMMENT '图片宽度，单位：px',
  `height` smallint(5) unsigned DEFAULT NULL COMMENT '图片高度，单位：px',
  `is_cover` tinyint(3) unsigned DEFAULT NULL COMMENT '是否为封面图片，1=是，0=否',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='图片';

-- ----------------------------
-- Records of nnp_picture
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_product
-- ----------------------------
DROP TABLE IF EXISTS `nnp_product`;
CREATE TABLE `nnp_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `product_details` varchar(255) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `sales` int(10) DEFAULT NULL,
  `product_total` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of nnp_product
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_product_category
-- ----------------------------
DROP TABLE IF EXISTS `nnp_product_category`;
CREATE TABLE `nnp_product_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `Column_5` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of nnp_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_sku
-- ----------------------------
DROP TABLE IF EXISTS `nnp_sku`;
CREATE TABLE `nnp_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `spu_id` bigint(20) unsigned DEFAULT NULL COMMENT 'SPU id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `bar_code` varchar(255) DEFAULT NULL COMMENT '条型码',
  `attribute_template_id` bigint(20) unsigned DEFAULT NULL COMMENT '属性模版id',
  `specifications` varchar(2500) DEFAULT NULL COMMENT '全部属性，使用JSON格式表示（冗余）',
  `album_id` bigint(20) unsigned DEFAULT NULL COMMENT '相册id',
  `pictures` varchar(500) DEFAULT NULL COMMENT '组图URLs，使用JSON格式表示',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `stock` int(10) unsigned DEFAULT NULL COMMENT '当前库存',
  `stock_threshold` int(10) unsigned DEFAULT NULL COMMENT '库存预警阈值',
  `sales` int(10) unsigned DEFAULT NULL COMMENT '销量（冗余）',
  `comment_count` int(10) unsigned DEFAULT NULL COMMENT '买家评论数量总和（冗余）',
  `positive_comment_count` int(10) unsigned DEFAULT NULL COMMENT '买家好评数量总和（冗余）',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SKU（Stock Keeping Unit）';

-- ----------------------------
-- Records of nnp_sku
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_sku_specification
-- ----------------------------
DROP TABLE IF EXISTS `nnp_sku_specification`;
CREATE TABLE `nnp_sku_specification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `sku_id` bigint(20) unsigned DEFAULT NULL COMMENT 'SKU id',
  `attribute_id` bigint(20) unsigned DEFAULT NULL COMMENT '属性id',
  `attribute_name` varchar(50) DEFAULT NULL COMMENT '属性名称',
  `attribute_value` varchar(50) DEFAULT NULL COMMENT '属性值',
  `unit` varchar(10) DEFAULT NULL COMMENT '自动补充的计量单位',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SKU数据';

-- ----------------------------
-- Records of nnp_sku_specification
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_spu
-- ----------------------------
DROP TABLE IF EXISTS `nnp_spu`;
CREATE TABLE `nnp_spu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `name` varchar(50) DEFAULT NULL COMMENT 'SPU名称',
  `type_number` varchar(50) DEFAULT NULL COMMENT 'SPU编号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT 'SPU简介',
  `list_price` decimal(10,2) DEFAULT NULL COMMENT '价格（显示在列表中）',
  `stock` int(10) unsigned DEFAULT NULL COMMENT '当前库存（冗余）',
  `stock_threshold` int(10) unsigned DEFAULT NULL COMMENT '库存预警阈值（冗余）',
  `unit` varchar(50) DEFAULT NULL COMMENT '计件单位',
  `brand_id` bigint(20) unsigned DEFAULT NULL COMMENT '品牌id',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称（冗余）',
  `category_id` bigint(20) unsigned DEFAULT NULL COMMENT '类别id',
  `category_name` varchar(50) DEFAULT NULL COMMENT '类别名称（冗余）',
  `attribute_template_id` bigint(20) unsigned DEFAULT NULL COMMENT '属性模版id',
  `album_id` bigint(20) unsigned DEFAULT NULL COMMENT '相册id',
  `pictures` varchar(500) DEFAULT NULL COMMENT '组图URLs，使用JSON数组表示',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词列表，各关键词使用英文的逗号分隔',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签列表，各标签使用英文的逗号分隔，原则上最多3个',
  `sales` int(10) unsigned DEFAULT NULL COMMENT '销量（冗余）',
  `comment_count` int(10) unsigned DEFAULT NULL COMMENT '买家评论数量总和（冗余）',
  `positive_comment_count` int(10) unsigned DEFAULT NULL COMMENT '买家好评数量总和（冗余）',
  `sort` tinyint(3) unsigned DEFAULT NULL COMMENT '排序序号',
  `is_deleted` tinyint(3) unsigned DEFAULT NULL COMMENT '是否标记为删除，1=已删除，0=未删除',
  `is_published` tinyint(3) unsigned DEFAULT NULL COMMENT '是否上架（发布），1=已上架，0=未上架（下架）',
  `is_new_arrival` tinyint(3) unsigned DEFAULT NULL COMMENT '是否新品，1=新品，0=非新品',
  `is_recommend` tinyint(3) unsigned DEFAULT NULL COMMENT '是否推荐，1=推荐，0=不推荐',
  `is_checked` tinyint(3) unsigned DEFAULT NULL COMMENT '是否已审核，1=已审核，0=未审核',
  `check_user` varchar(50) DEFAULT NULL COMMENT '审核人（冗余）',
  `gmt_check` datetime DEFAULT NULL COMMENT '审核通过时间（冗余）',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SPU（Standard Product Unit）';

-- ----------------------------
-- Records of nnp_spu
-- ----------------------------

-- ----------------------------
-- Table structure for nnp_spu_detail
-- ----------------------------
DROP TABLE IF EXISTS `nnp_spu_detail`;
CREATE TABLE `nnp_spu_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `spu_id` bigint(20) unsigned DEFAULT NULL COMMENT 'SPU id',
  `detail` text DEFAULT NULL COMMENT 'SPU详情，应该使用HTML富文本，通常内容是若干张图片',
  `gmt_create` datetime DEFAULT NULL COMMENT '数据创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '数据最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='SPU详情';

-- ----------------------------
-- Records of nnp_spu_detail
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'jarry', '123456', 'admin');
INSERT INTO `user` VALUES ('2', 'jack', '123456', 'user');
INSERT INTO `user` VALUES ('3', 'lihua', '1345678', 'user');
INSERT INTO `user` VALUES ('4', 'tom', '123456', 'vip');
INSERT INTO `user` VALUES ('5', 'laoxing', '4332215', 'admin');
INSERT INTO `user` VALUES ('6', 'pingqing', '8222777', 'user');
INSERT INTO `user` VALUES ('7', 'xingxing', '122222', 'user');
INSERT INTO `user` VALUES ('8', 'xingming', '2222111', 'user');
INSERT INTO `user` VALUES ('9', 'wangyangming', '999999', 'user');
INSERT INTO `user` VALUES ('10', '张三', '800000', 'user');
INSERT INTO `user` VALUES ('11', '赵云', '112222', 'user');
