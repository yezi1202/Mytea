-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: javaweb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_internal_idx` (`parent_id`),
  CONSTRAINT `fk_self_joing` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (46,'Trà sữa','Trà sữa',NULL,'2022-07-23 01:39:24',NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin liên hệ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (5,'Nhóm 10.Long Phạm Hoàng','hoanglongcf34no1@gmail.com','hello','2021-12-10 16:53:08',NULL,NULL,NULL,1),(6,'Nguyễn Thị Linh','phamlonga01km2@gmail.com','Hello','2021-12-19 08:32:15',NULL,NULL,NULL,1),(7,'Long Hoàng','phamlonga01km2@gmail.com','Nice xu`','2021-12-25 07:12:16',NULL,NULL,NULL,1),(8,'Long Hoàng Phạm','phamlonga01km2@gmail.com','hillo','2022-01-11 17:51:11',NULL,NULL,NULL,1),(9,'Long Hoàng','phamlonga01km2@gmail.com','hello','2022-01-11 19:53:56',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `short_description` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category_products_idx` (`category_id`),
  CONSTRAINT `fk_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (218,'Trà sữa chân châu đường đen',35000.00,'Trà sữa chân châu đường đen','<p>Trà sữa chân châu đường đen</p>','product/avatar/tra-sua-chan-chau-uong-en1658516067059.jp',46,NULL,'2022-07-23 01:54:27',NULL,NULL,1,'demo1658514695697',1),(219,'Trà sữa ngọc trai xanh',50000.00,'Trà sữa ngọc trai xanh','<p>Trà sữa ngọc trai xanh</p>','product/avatar/tra-sua-ngoc-trai-xanh1658516073379.jp',46,NULL,'2022-07-23 01:54:33',NULL,NULL,1,'dfdf1658514712310',1),(220,'Trà sữa đường đen',25000.00,'đường đen','<p><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">đường đen</font><br></p>','product/avatar/tra-sua-uong-en1658516100162.jp',46,NULL,'2022-07-23 01:55:00',NULL,NULL,1,'tra-sua-uong-en1658515953382',1),(221,'Trà sữa hoa đậu',25000.00,'Trà sữa hoa đậu','<p>Trà sữa hoa đậu<br></p>','product/avatar/tra-sua-hoa-au1658516138162.jp',46,'2022-07-23 01:55:38',NULL,NULL,NULL,1,'tra-sua-hoa-au1658516138436',1),(222,'Trà sữa cute',30000.00,'Trà sữa cute','<p>Trà sữa cute<br></p>','product/avatar/tra-sua-cute1658516203740.jp',46,'2022-07-23 01:56:44',NULL,NULL,NULL,1,'tra-sua-cute1658516204056',1);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (13,'ADMIN','ADMIN',NULL,NULL,NULL,NULL,1),(14,'USER','USER',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder`
--

DROP TABLE IF EXISTS `tbl_saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `customer_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `seo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `coment` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder`
--

LOCK TABLES `tbl_saleorder` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder` DISABLE KEYS */;
INSERT INTO `tbl_saleorder` VALUES (60,'1658515119874',15,NULL,'2022-07-23 01:38:40',NULL,NULL,NULL,1,'admin','haui',NULL,'11111111111',''),(61,'1658516222519',15,NULL,'2022-07-23 01:57:03',NULL,NULL,NULL,1,'admin','haui',NULL,'11111111111','');
/*!40000 ALTER TABLE `tbl_saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder_products`
--

DROP TABLE IF EXISTS `tbl_saleorder_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quality` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_saleorder_product_idx` (`saleorder_id`),
  KEY `fk_product_saleorder_idx` (`product_id`),
  CONSTRAINT `fk_product_saleorder` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`saleorder_id`) REFERENCES `tbl_saleorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder_products`
--

LOCK TABLES `tbl_saleorder_products` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder_products` DISABLE KEYS */;
INSERT INTO `tbl_saleorder_products` VALUES (95,60,219,30,NULL,'2022-07-23 01:38:48',NULL,NULL,0,NULL),(96,61,222,2,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tbl_saleorder_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subscribe`
--

DROP TABLE IF EXISTS `tbl_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_subscribe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='bảng chứa người dùng đăng kí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subscribe`
--

LOCK TABLES `tbl_subscribe` WRITE;
/*!40000 ALTER TABLE `tbl_subscribe` DISABLE KEYS */;
INSERT INTO `tbl_subscribe` VALUES (1,'edmloveanime34@gmail.com','2021-12-23 11:05:27',NULL,NULL,NULL,1),(2,'longvu66771508@gmail.com','2021-12-23 11:09:26',NULL,NULL,NULL,1),(3,'vudung1482001@gmail.com','2021-12-23 11:10:20',NULL,NULL,NULL,1),(4,'vdl@gmail.com','2021-12-23 11:12:19',NULL,NULL,NULL,1),(5,'vdl@gmail.com','2021-12-23 11:15:11',NULL,NULL,NULL,1),(6,'nguyenvanhoang12i06@gmail.com','2021-12-23 16:42:49',NULL,NULL,NULL,1),(7,'nguyenthiquyenkmhd1975@gmail.com','2021-12-25 08:13:04',NULL,NULL,NULL,1),(8,'edmloveanime34@gmail.com','2022-01-06 15:15:38',NULL,NULL,NULL,1),(9,'edmloveanime34@gmail.com','2022-01-06 15:15:48',NULL,NULL,NULL,1),(10,'helloword@gmail.com','2022-01-06 15:33:01',NULL,NULL,NULL,1),(11,'longliaprono11231231@gmail.com','2022-01-06 15:51:23',NULL,NULL,NULL,1),(12,'hihi@gmail.com','2022-01-06 15:52:57',NULL,NULL,NULL,1),(13,'nguoitrongmuonnghe@gmail.com','2022-01-06 17:30:31',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `avata` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (15,'admin','$2a$04$LwbHKU/Pu/omkUxTLhw6te0YKvui9mcou.DlRyZ5G190OqdUVVOuW','admin','avatar/1651179014849u-1333542207-2692336539-fm-253-fmt-auto-app-138-f-jpeg.webp','11111111111','hoanglongcf34no1@gmail.com','haui',NULL,'2022-04-29 18:22:20',NULL,NULL,1),(54,'xiaoyezi','$2a$04$GJzsM1IxvXIzRQ3gpOxVAOTDlZ5UpMzKJsUYnE6yH3dFr9hHjBbm6','小叶子','avatar/1651179031366u-1485408753-795853627-fm-253-fmt-auto-app-138-f-jpeg.webp','1323232','yexiaoye12@gmail.com','hanoi',NULL,'2022-04-29 04:00:29',NULL,NULL,1),(55,'ahua','$2a$04$vQJRip1VQFgmYol3UcAAIO4vV.qA3iuOLf1ehoVHxn/d4sNHJYD8a','小涵','avatar/1651179121931tai-xuong.jfif','1234567890','036283621@gamil.bom','小麋鹿',NULL,'2022-04-29 03:52:11',NULL,NULL,1),(56,'kky','$2a$04$H4MwEu47uvcuWezWVknA9OG1Ed7/5iErP6R5Qekxk45ge.36p/uBy','陆轩','avatar/1651179189323u-2103832901-2388204058-fm-253-fmt-auto-app-138-f-jpeg.webp','23232323','sdndsjfd@gmail.com','可考虑',NULL,'2022-04-29 03:57:16',NULL,NULL,1),(57,'xiaohailu','$2a$04$ZnCRMCxUHW3TiFfAsYIQxu7ZH3n1mOT/8sBPRCMdkHBnwaqRUxMLO','紫萱','avatar/1651179260228u-1594771381-1239231395-fm-253-fmt-auto-app-138-f-jpeg.webp','2132323','adsad@gmail.com','海路票',NULL,'2022-04-29 03:54:42',NULL,NULL,1),(58,'xiaomilu','$2a$04$uQMKgu4B3hdvXhjpViobOuJrw7BAmuIR6VJ9IggAVX5Ge7OfWge6u','樱紫露','avatar/1651179417420u-1015704382-3003639661-fm-253-fmt-auto-app-138-f-jpeg.webp','2324354343432','ziye@gmail.com','开兹鲁','2022-04-29 03:56:57',NULL,NULL,NULL,1),(59,'xiaoying','$2a$04$Tad9HhDKb/EY0kVPffSd8.Bmn5t1fUUZbTtwp.eCCLBvXUpKjIt.y','小樱学姐','avatar/1651179498147u-4126472116-1552485291-fm-253-fmt-auto-app-138-f-jpeg.webp','23243434','xiaoying@gmail.com','上海','2022-04-29 03:58:18',NULL,NULL,NULL,1),(60,'taoerjie','$2a$04$HFYajOlDYk1JUTfjTH/m5uFmEZQM.vsI4xlFRa/cmZsYcYQWrLGhu','小桃学姐','avatar/1651179569304u-3649159670-1754187002-fm-253-fmt-auto-app-138-f-jpeg.webp','24343','xiaotao@gmail.com','广东','2022-04-29 03:59:29',NULL,NULL,NULL,1),(61,'haiyinglv','$2a$04$l2ZOP9MhZMpF.7owr7Fjf.UM8MK0LjYVQfpSzvLZJ.QN3caDDhcha','海英铝','avatar/1651179750181u-1527111582-2728408646-fm-253-fmt-auto-app-138-f-jpeg.webp','23232','haiyinglv@gmai.com','马蒂斯','2022-04-29 04:02:30',NULL,NULL,NULL,1),(62,'xiaolijie','$2a$04$hf5CFFrl/y7JlSgGFFmvaeHP/8.HidmYmZlYrOgQ862d6GEOog8KK','萧莉姐','avatar/1651179825104u-3456098700-1187238642-fm-253-fmt-auto-app-138-f-jpeg.webp','3232312','xiaolijie@gmail.com','韩国','2022-04-29 04:03:45',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_roles`
--

DROP TABLE IF EXISTS `tbl_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='bảng trung gian thể hiện quan hệ n-n của users và roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_roles`
--

LOCK TABLES `tbl_users_roles` WRITE;
/*!40000 ALTER TABLE `tbl_users_roles` DISABLE KEYS */;
INSERT INTO `tbl_users_roles` VALUES (15,13),(54,14),(55,14),(56,14),(57,14),(58,14),(59,14),(60,14),(61,14),(62,14);
/*!40000 ALTER TABLE `tbl_users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-23  1:58:44
