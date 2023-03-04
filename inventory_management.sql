-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for inventory_management
CREATE DATABASE IF NOT EXISTS `inventory_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `inventory_management`;

-- Dumping structure for table inventory_management.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table inventory_management.customers: ~3 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
	(1, 'Sufian Polash', '01656525', 'Nikunja', '2023-01-13 12:35:42', NULL),
	(2, 'Pranto', '013636252', 'Dhaka', '2023-01-14 12:08:16', NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table inventory_management.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `buying_price` double(8,2) NOT NULL,
  `selling_price` double(8,2) NOT NULL,
  `product_image` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `current_stock` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) NOT NULL DEFAULT '0',
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_products_user` (`created_by`),
  KEY `FK2_product_user_updated_by` (`updated_by`),
  CONSTRAINT `FK2_product_user_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_products_user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table inventory_management.products: ~3 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `product_name`, `product_code`, `buying_price`, `selling_price`, `product_image`, `status`, `current_stock`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
	(1, 'System Design Interview Part 1', 'system-design-interview-1', 350.00, 600.00, 'product/1673532117.png', 'active', 22, '2023-01-12 20:01:57', NULL, 1, 1),
	(2, 'Message by Mizanur Rahman Azhari', 'message-mezanur-rahman', 150.00, 300.00, 'product/1673532163.jpeg', 'active', 19, '2023-01-12 20:02:43', NULL, 1, NULL),
	(3, 'RoundCube', 'roundcube', 50.00, 120.00, 'product/1673532198.png', 'active', 5, '2023-01-12 20:03:18', NULL, 3, NULL),
	(4, 'Graog Algorithm by Shafayet', 'graph-algo', 250.00, 350.00, 'product/1673706547.png', 'active', 5, '2023-01-14 20:29:07', NULL, 3, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table inventory_management.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_unique_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `supplier_id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `total_purchase` double(8,2) NOT NULL DEFAULT '0.00',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_id` (`purchase_unique_number`) USING BTREE,
  KEY `FK_purchase_supplier_id` (`supplier_id`),
  KEY `FK_purchase_product_id` (`product_id`),
  CONSTRAINT `FK_purchase_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchase_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table inventory_management.purchases: ~7 rows (approximately)
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` (`id`, `purchase_unique_number`, `supplier_id`, `date`, `total_purchase`, `product_id`, `quantity`, `note`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'PUR1673536140', 3, '2023-01-20 00:00:00', 700.00, 1, 2, '', 'completed', '2023-01-12 21:09:00', '2023-01-13 00:00:00'),
	(2, 'PUR1673536207', 3, '2023-01-20 00:00:00', 700.00, 1, 2, '', 'completed', '2023-01-12 21:10:07', '2023-01-13 00:00:00'),
	(3, 'PUR1673538837', 3, '2023-01-20 00:00:00', 700.00, 1, 2, '', 'completed', '2023-01-12 21:53:57', '2023-01-13 00:00:00'),
	(5, 'PUR1673540506', 3, '2023-01-20 00:00:00', 700.00, 1, 2, '', 'completed', '2023-01-12 22:21:46', '2023-01-13 00:00:00'),
	(6, 'PUR1673545917', 3, '2023-01-20 00:00:00', 1750.00, 1, 5, 'I have no comment', 'completed', '2023-01-12 23:51:57', '2023-01-13 00:00:00'),
	(7, 'PUR1673619413', 3, '2023-01-14 00:00:00', 1050.00, 1, 3, 'No Comment', 'completed', '2023-01-13 20:16:53', '2023-01-13 00:00:00'),
	(8, 'PUR1673620048', 1, '2023-01-14 00:00:00', 3500.00, 1, 10, '', 'completed', '2023-01-13 20:27:28', NULL),
	(9, 'PUR1673706322', 3, '2023-01-17 00:00:00', 1250.00, 4, 5, '', 'completed', '2023-01-14 20:25:22', '2023-01-14 00:00:00');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;

-- Dumping structure for table inventory_management.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sales_unique_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `sales_date` timestamp NOT NULL,
  `subtotal` double(8,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) DEFAULT NULL,
  `total_payble_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_type` enum('cod','online') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_unique_number` (`sales_unique_number`),
  KEY `FK1_sales_customer_id` (`customer_id`),
  KEY `FK2_sales_product_id` (`product_id`),
  CONSTRAINT `FK1_sales_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK2_sales_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table inventory_management.sales: ~3 rows (approximately)
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` (`id`, `sales_unique_number`, `customer_id`, `product_id`, `quantity`, `note`, `sales_date`, `subtotal`, `discount`, `total_payble_amount`, `payment_type`, `transaction_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'SA1673625840', 1, 1, 5, '', '2023-01-12 00:00:00', 3000.00, 200.00, 2800.00, 'online', '253614', 'completed', '2023-01-13 22:04:00', NULL),
	(2, 'SA1673625933', 1, 2, 1, 'NO comment', '2023-01-17 00:00:00', 300.00, 0.00, 300.00, 'cod', '', 'completed', '2023-01-13 22:05:33', NULL),
	(3, 'SA1673676518', 1, 1, 3, '', '2023-01-16 00:00:00', 1800.00, 50.00, 1750.00, 'cod', '', 'completed', '2023-01-14 12:08:38', NULL),
	(4, 'SA1673706972', 1, 4, 1, '', '2023-01-16 00:00:00', 350.00, 0.00, 350.00, 'cod', '', 'pending', '2023-01-14 20:36:12', NULL),
	(5, 'SA1673708454', 1, 4, 3, '', '2023-01-18 00:00:00', 1050.00, 50.00, 1000.00, 'cod', '', 'pending', '2023-01-14 21:00:54', NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

-- Dumping structure for table inventory_management.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table inventory_management.suppliers: ~3 rows (approximately)
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
	(1, 'MD Mehedi Hasan Shuvo', '01917423680', 'Head Quarters\r\nHouse 1 & 3, Level 3, Road 21/C, Nikunja 2, Khilkhet, Dhaka 1229, Bangladesh\r\n\r\nPhone: +880 255 098 286/7\r\n\r\nFax: +880 255 098 133\r\nE-mail: info@asl.aero', '2023-01-07 19:52:08', NULL),
	(2, 'Akash Chowdhury', '01253625451', 'Feni Computer Institute', '2023-01-07 20:04:32', NULL),
	(3, 'Akash', '01738923827', 'Dhaka', '2023-01-12 20:03:43', NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

-- Dumping structure for table inventory_management.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table inventory_management.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `phone`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'MD. Mehedi Hasan Shuvo', '01738923827', 'mehedi@shop.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'active', '2022-07-09 10:04:55', NULL),
	(3, 'Akash', '01556235254', 'akash@shop.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'active', '2023-01-14 14:21:52', NULL),
	(4, 'MD Ashikur Rahman', '01852525253', 'ashik@shop.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'active', '2023-01-14 20:38:27', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
