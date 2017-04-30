-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.0.22-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 vendor 的数据库结构
CREATE DATABASE IF NOT EXISTS `vendor` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vendor`;



CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(50) NOT NULL COMMENT '用户ID',
  `next_url` VARCHAR(50) NOT NULL,
  `account_name` varchar(50) NOT NULL COMMENT '用户账号',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `role_id` int(50) DEFAULT NULL COMMENT '角色ID()',
  `factory_id` int(50) DEFAULT NULL COMMENT '生产商ID()',
  `agency_id` int(50) DEFAULT NULL COMMENT '运营商ID()',
  `nick_name` varchar(10) DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `last_login_time` date DEFAULT NULL COMMENT '最后一次登录时间',
  `fix_phone` varchar(50) DEFAULT NULL COMMENT '传真电话',
  `mobile_phone` varchar(50) DEFAULT NULL COMMENT '移动电话（唯一）',
  `QQ` varchar(50) DEFAULT NULL COMMENT 'QQ号码',
  `postcode` int(10) DEFAULT NULL COMMENT '邮编',
  `idcard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `login_count` int(100) DEFAULT NULL COMMENT '登录次数',
  `post_adress` varchar(50) DEFAULT NULL COMMENT '用户地址',
  `creat_time` date DEFAULT NULL COMMENT '用户创建时间',
  `head_image` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `approved` tinyint(2) DEFAULT NULL COMMENT '是否通过验证？'
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表格4';


/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`user_id`,`next_url`, `account_name`, `password`, `real_name`, `role_id`, `factory_id`, `agency_id`, `nick_name`, `email`, `last_login_time`, `fix_phone`, `mobile_phone`, `QQ`, `postcode`, `idcard`, `login_count`, `post_adress`, `creat_time`, `head_image`, `approved`) VALUES
	(1, 'admin', '1', '网站管理员', 1, NULL, NULL, '王佳', '123@163.com', '2017-04-06', '1', '1', '123', 212200, '123456789123456789', 2, '婺城区', '2017-04-06', '/img/head1.png', 1),
	(2, 'shmq', '1', '生产商管理员', 6, NULL, NULL, '李佳', '345@163.com', '2017-04-06', '2', '2', '345', 236523, '123456789123456789', 1, '婺城区', '2017-04-06', '/img/head2.png', 1),
	(3, 'zbdl1', '1', '运营商管理员', 3, NULL, NULL, '张佳', '789@163.com', '2017-04-06', '3', '3', '456', 2546632, '123456789123456789', 1, '婺城区', '2017-04-06', '/img/head3.png', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
