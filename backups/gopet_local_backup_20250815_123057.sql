-- MySQL dump 10.13  Distrib 9.4.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: petstaff_local
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL DEFAULT '1',
  `longitude` double NOT NULL DEFAULT '1',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `addressable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressable_id` bigint unsigned NOT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_addressable_type_addressable_id_index` (`addressable_type`,`addressable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'123 Main St','','544512','London','Central Square','United Kingdom',1,1,0,'App\\Models\\Branch',1,NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL,NULL,NULL),(2,'123 Main St','','544512','London','Central Square','United Kingdom',1,1,0,'App\\Models\\Branch',2,NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL,NULL,NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `tags` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `blog_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boarder_daycare_perdayamount`
--

DROP TABLE IF EXISTS `boarder_daycare_perdayamount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boarder_daycare_perdayamount` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `amount` double DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boarder_daycare_perdayamount`
--

LOCK TABLES `boarder_daycare_perdayamount` WRITE;
/*!40000 ALTER TABLE `boarder_daycare_perdayamount` DISABLE KEYS */;
/*!40000 ALTER TABLE `boarder_daycare_perdayamount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_boarding_mapping`
--

DROP TABLE IF EXISTS `booking_boarding_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_boarding_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `dropoff_date_time` datetime NOT NULL,
  `dropoff_address` longtext COLLATE utf8mb4_unicode_ci,
  `pickup_date_time` datetime NOT NULL,
  `pickup_address` longtext COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `additional_facility` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_boarding_mapping`
--

LOCK TABLES `booking_boarding_mapping` WRITE;
/*!40000 ALTER TABLE `booking_boarding_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_boarding_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_daycare_mapping`
--

DROP TABLE IF EXISTS `booking_daycare_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_daycare_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `date` datetime NOT NULL,
  `dropoff_time` time NOT NULL,
  `pickup_time` time NOT NULL,
  `food` longtext COLLATE utf8mb4_unicode_ci,
  `activity` longtext COLLATE utf8mb4_unicode_ci,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_daycare_mapping`
--

LOCK TABLES `booking_daycare_mapping` WRITE;
/*!40000 ALTER TABLE `booking_daycare_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_daycare_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_grooming_mapping`
--

DROP TABLE IF EXISTS `booking_grooming_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_grooming_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `booking_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `duration` int NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_grooming_mapping`
--

LOCK TABLES `booking_grooming_mapping` WRITE;
/*!40000 ALTER TABLE `booking_grooming_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_grooming_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_request_mapping`
--

DROP TABLE IF EXISTS `booking_request_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_request_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `walker_id` bigint unsigned NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_request_mapping`
--

LOCK TABLES `booking_request_mapping` WRITE;
/*!40000 ALTER TABLE `booking_request_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_request_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_services`
--

DROP TABLE IF EXISTS `booking_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sequance` int NOT NULL DEFAULT '0',
  `start_date_time` datetime NOT NULL,
  `booking_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `service_price` double NOT NULL DEFAULT '0',
  `duration_min` int NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_services`
--

LOCK TABLES `booking_services` WRITE;
/*!40000 ALTER TABLE `booking_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_training_mapping`
--

DROP TABLE IF EXISTS `booking_training_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_training_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `date_time` datetime NOT NULL,
  `training_id` bigint unsigned NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_training_mapping`
--

LOCK TABLES `booking_training_mapping` WRITE;
/*!40000 ALTER TABLE `booking_training_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_training_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_transactions`
--

DROP TABLE IF EXISTS `booking_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `external_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_percentage` double NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL DEFAULT '0',
  `tip_amount` double NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `tax_percentage` longtext COLLATE utf8mb4_unicode_ci,
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `request_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_transactions`
--

LOCK TABLES `booking_transactions` WRITE;
/*!40000 ALTER TABLE `booking_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_veterinary_mapping`
--

DROP TABLE IF EXISTS `booking_veterinary_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_veterinary_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `booking_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `duration` int NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `start_video_link` longtext COLLATE utf8mb4_unicode_ci,
  `join_video_link` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_veterinary_mapping`
--

LOCK TABLES `booking_veterinary_mapping` WRITE;
/*!40000 ALTER TABLE `booking_veterinary_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_veterinary_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_walking_mapping`
--

DROP TABLE IF EXISTS `booking_walking_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_walking_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `date_time` datetime NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_walking_mapping`
--

LOCK TABLES `booking_walking_mapping` WRITE;
/*!40000 ALTER TABLE `booking_walking_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_walking_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `start_date_time` datetime NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `system_service_id` bigint unsigned NOT NULL,
  `pet_id` bigint unsigned NOT NULL,
  `booking_extra_info` longtext COLLATE utf8mb4_unicode_ci,
  `booking_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double NOT NULL DEFAULT '0',
  `service_amount` double NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_branch_id_foreign` (`branch_id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_pet_id_foreign` (`pet_id`),
  CONSTRAINT `bookings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_employee`
--

DROP TABLE IF EXISTS `branch_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_employee` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `is_primary` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_employee`
--

LOCK TABLES `branch_employee` WRITE;
/*!40000 ALTER TABLE `branch_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_galleries`
--

DROP TABLE IF EXISTS `branch_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `full_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_galleries`
--

LOCK TABLES `branch_galleries` WRITE;
/*!40000 ALTER TABLE `branch_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` bigint unsigned DEFAULT NULL,
  `branch_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'both',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `contact_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'pet-care-center','Pet Care Center',NULL,'[\"cash\",\"debit_card\",\"credit_card\",\"upi\"]',NULL,'unisex',1,NULL,NULL,NULL,'info@petcare.com','2012345678','2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(2,'pet-care-center','Pet Care Center',NULL,'[\"cash\",\"debit_card\",\"credit_card\",\"upi\"]',NULL,'unisex',1,NULL,NULL,NULL,'info@petcare.com','2012345678','2025-08-15 08:16:08','2025-08-15 08:16:08',NULL);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breeds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pettype_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `breeds_pettype_id_foreign` (`pettype_id`),
  CONSTRAINT `breeds_pettype_id_foreign` FOREIGN KEY (`pettype_id`) REFERENCES `pets_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeds`
--

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bussinesshours`
--

DROP TABLE IF EXISTS `bussinesshours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bussinesshours` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_holiday` tinyint DEFAULT NULL,
  `breaks` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bussinesshours`
--

LOCK TABLES `bussinesshours` WRITE;
/*!40000 ALTER TABLE `bussinesshours` DISABLE KEYS */;
INSERT INTO `bussinesshours` VALUES (1,1,'monday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(2,1,'tuesday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(3,1,'wednesday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(4,1,'thursday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(5,1,'friday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(6,1,'saturday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(7,1,'sunday','09:00:00','18:00:00',NULL,1,'[]',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(8,2,'monday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL),(9,2,'tuesday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL),(10,2,'wednesday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL),(11,2,'thursday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL),(12,2,'friday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL),(13,2,'saturday','09:00:00','18:00:00',NULL,0,'[]',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL),(14,2,'sunday','09:00:00','18:00:00',NULL,1,'[]',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL);
/*!40000 ALTER TABLE `bussinesshours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `guest_user_id` bigint DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `product_variation_id` int DEFAULT NULL,
  `qty` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission_earnings`
--

DROP TABLE IF EXISTS `commission_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commission_earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `commissionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commissionable_id` bigint unsigned NOT NULL,
  `commission_amount` double DEFAULT NULL,
  `commission_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commission_earnings_commissionable_type_commissionable_id_index` (`commissionable_type`,`commissionable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission_earnings`
--

LOCK TABLES `commission_earnings` WRITE;
/*!40000 ALTER TABLE `commission_earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `commission_earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_value` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commissions`
--

LOCK TABLES `commissions` WRITE;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constants`
--

DROP TABLE IF EXISTS `constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int NOT NULL DEFAULT '0',
  `sub_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constants`
--

LOCK TABLES `constants` WRITE;
/*!40000 ALTER TABLE `constants` DISABLE KEYS */;
/*!40000 ALTER TABLE `constants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `currency_position` enum('left','right','left_with_space','right_with_space') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `no_of_decimal` int unsigned NOT NULL,
  `thousand_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_groups`
--

DROP TABLE IF EXISTS `custom_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_groups`
--

LOCK TABLES `custom_field_groups` WRITE;
/*!40000 ALTER TABLE `custom_field_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_group_id` int DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint NOT NULL DEFAULT '0',
  `values` text COLLATE utf8mb4_unicode_ci,
  `is_export` int DEFAULT '0',
  `visible` enum('true','false') COLLATE utf8mb4_unicode_ci DEFAULT 'false',
  `is_view` int DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_data`
--

DROP TABLE IF EXISTS `custom_fields_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_data`
--

LOCK TABLES `custom_fields_data` WRITE;
/*!40000 ALTER TABLE `custom_fields_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `durations`
--

DROP TABLE IF EXISTS `durations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `durations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `durations`
--

LOCK TABLES `durations` WRITE;
/*!40000 ALTER TABLE `durations` DISABLE KEYS */;
/*!40000 ALTER TABLE `durations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earnings`
--

DROP TABLE IF EXISTS `earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '1- Active , 0- InActive',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earnings`
--

LOCK TABLES `earnings` WRITE;
/*!40000 ALTER TABLE `earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_commissions`
--

DROP TABLE IF EXISTS `employee_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `commission_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_commissions`
--

LOCK TABLES `employee_commissions` WRITE;
/*!40000 ALTER TABLE `employee_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_earnings`
--

DROP TABLE IF EXISTS `employee_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `total_amount` double DEFAULT NULL,
  `commission_amount` double DEFAULT NULL,
  `tip_amount` double DEFAULT NULL,
  `payment_date` datetime NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_earnings`
--

LOCK TABLES `employee_earnings` WRITE;
/*!40000 ALTER TABLE `employee_earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_rating`
--

DROP TABLE IF EXISTS `employee_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_rating` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `review_msg` longtext COLLATE utf8mb4_unicode_ci,
  `rating` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_rating`
--

LOCK TABLES `employee_rating` WRITE;
/*!40000 ALTER TABLE `employee_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `is_banned` tinyint NOT NULL DEFAULT '0',
  `is_manager` tinyint NOT NULL DEFAULT '0',
  `show_in_calender` tinyint NOT NULL DEFAULT '0',
  `last_notification_seen` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `location` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_user_id_foreign` (`user_id`),
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `is_like` tinyint NOT NULL DEFAULT '0',
  `dislike_like` tinyint NOT NULL DEFAULT '0',
  `likeable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likeable_id` bigint unsigned NOT NULL,
  `is_view` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `country` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `city` int NOT NULL DEFAULT '0',
  `pincode` int NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistic_zone_city`
--

DROP TABLE IF EXISTS `logistic_zone_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistic_zone_city` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logistic_id` int NOT NULL,
  `logistic_zone_id` int NOT NULL,
  `city_id` int NOT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistic_zone_city`
--

LOCK TABLES `logistic_zone_city` WRITE;
/*!40000 ALTER TABLE `logistic_zone_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistic_zone_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistic_zones`
--

DROP TABLE IF EXISTS `logistic_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistic_zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logistic_id` int NOT NULL,
  `country_id` int NOT NULL,
  `state_id` int NOT NULL,
  `standard_delivery_charge` double NOT NULL DEFAULT '0',
  `express_delivery_charge` double NOT NULL DEFAULT '0',
  `standard_delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 - 3 days',
  `express_delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 day',
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistic_zones`
--

LOCK TABLES `logistic_zones` WRITE;
/*!40000 ALTER TABLE `logistic_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistic_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'App\\Models\\Branch',1,'67f8d701-baa9-4df7-bd36-ea5c6d6f6a0c','feature_image','1','fVAoJ7AQRDbcxWtcTyBbRVTQyLZPFnmspYUGdBkE.png','image/png','public','public',444294,'[]','[]','{\"thumb\": true, \"thumb300\": true}','[]',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(2,'App\\Models\\Branch',2,'b5609a47-4b7e-477f-be7d-da21a8478ec4','feature_image','1','XjYH1CnGYN2a2R49Gz9XAN5S7hPfjmuHFGGacNSa.png','image/png','public','public',444294,'[]','[]','{\"thumb\": true, \"thumb300\": true}','[]',1,'2025-08-15 08:16:08','2025-08-15 08:16:08');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2023_01_01_000000_create_permission_tables',1),(3,'2023_01_01_000010_create_users_table',1),(4,'2023_01_01_000012_create_user_providers_table',1),(5,'2023_01_01_000020_create_password_resets_table',1),(6,'2023_01_01_000040_create_settings_table',1),(7,'2023_01_01_000041_create_notifications_table',1),(8,'2023_01_01_000042_create_constants_table',1),(9,'2023_01_01_000100_create_services_table',1),(10,'2023_01_01_000200_create_media_table',1),(11,'2023_01_01_000400_create_activity_log_table',1),(12,'2023_01_01_000400_create_failed_jobs_table',1),(13,'2023_01_27_141241_create_branches_table',1),(14,'2023_01_27_154203_create_categories_table',1),(15,'2023_01_27_171841_create_service_branches_table',1),(16,'2023_01_27_172003_create_service_employees_table',1),(17,'2023_01_27_190720_create_addresses_table',1),(18,'2023_02_06_131711_create_booking_services_table',1),(19,'2023_04_11_120721_create_notificationtemplates_table',1),(20,'2023_04_11_140938_NotificationTemplateContentMapping',1),(21,'2023_04_25_173207_create_service_galleries_table',1),(22,'2023_04_27_113639_create_planlimitation_table',1),(23,'2023_04_27_134249_create_service_packages_table',1),(24,'2023_05_02_101915_create_package_service_mappings_table',1),(25,'2023_05_02_111101_create_plan_table',1),(26,'2023_05_02_111622_create_planlimitation_mapping_table',1),(27,'2023_05_04_115011_create_branch_galleries_table',1),(28,'2023_05_06_160755_create_subscriptions_table',1),(29,'2023_05_06_160843_create_subscriptions_transactions_table',1),(30,'2023_05_13_013137_create_categories_table',1),(31,'2023_05_14_154353_create_custom_fields_table',1),(32,'2023_05_15_031816_create_taxes_table',1),(33,'2023_05_15_101240_create_custom_fields_data_table',1),(34,'2023_05_15_101530_create_custom_field_groups_table',1),(35,'2023_05_16_111402_create_currencies_table',1),(36,'2023_05_17_045032_create_earnings_table',1),(37,'2023_05_17_110503_create_commissions_table',1),(38,'2023_05_17_121344_create_employees_table',1),(39,'2023_05_20_125942_create_holidays_table',1),(40,'2023_05_20_181643_create_branch_employee_table',1),(41,'2023_05_22_150550_create_commission_earnings_table',1),(42,'2023_05_22_150850_create_employee_commissions_table',1),(43,'2023_05_22_155610_create_booking_transactions_table',1),(44,'2023_05_22_162458_create_employee_earnings_table',1),(45,'2023_05_25_055808_create_bussinesshours_table',1),(46,'2023_06_08_171027_create_tip_earnings_table',1),(47,'2023_06_09_014626_create_sliders_table',1),(48,'2023_06_09_161914_create_employee_rating_table',1),(49,'2023_06_17_062215_create_pages_table',1),(50,'2023_06_17_075047_create_webhook_calls_table',1),(51,'2023_06_17_121725_create_jobs_table',1),(52,'2023_06_21_170019_create_user_profiles_table',1),(53,'2023_06_24_050019_create_modules_table',1),(54,'2023_07_05_103209_create_pets_type_table',1),(55,'2023_07_09_131341_create_booking_daycare_mapping_table',1),(56,'2023_07_09_131400_create_booking_boarding_mapping_table',1),(57,'2023_07_09_131409_create_booking_grooming_mapping_table',1),(58,'2023_07_09_131418_create_booking_walking_mapping_table',1),(59,'2023_07_09_131427_create_booking_training_mapping_table',1),(60,'2023_07_09_131512_create_booking_veterinary_mapping_table',1),(61,'2023_07_10_075719_create_blogs_table',1),(62,'2023_07_10_075726_create_events_table',1),(63,'2023_07_10_091201_create_system_services_table',1),(64,'2023_07_11_051437_create_breeds_table',1),(65,'2023_07_11_070855_create_durations_table',1),(66,'2023_07_11_121512_create_service_duration_table',1),(67,'2023_07_11_121523_create_service_training_table',1),(68,'2023_07_11_121535_create_service_facility_table',1),(69,'2023_07_21_085300_create_pets_table',1),(70,'2023_07_21_085435_create_bookings_table',1),(71,'2023_07_27_044323_create_pet_notes_table',1),(72,'2023_07_29_013849_create_products_table',1),(73,'2023_07_31_074834_create_logistics_table',1),(74,'2023_07_31_084414_create_tags_table',1),(75,'2023_07_31_130358_create_product_categories_table',1),(76,'2023_08_01_044536_create_brands_table',1),(77,'2023_08_02_072724_create_units_table',1),(78,'2023_08_03_035816_create_product_tax_table',1),(79,'2023_08_03_101600_create_variations_table',1),(80,'2023_08_09_084338_create_variation_values_table',1),(81,'2023_08_16_123412_create_product_variation_stocks_table',1),(82,'2023_08_16_123433_create_product_variations_table',1),(83,'2023_08_16_123521_create_product_category_mappings_table',1),(84,'2023_08_16_123557_create_product_tax_mappings_table',1),(85,'2023_08_16_123923_create_product_variation_combinations_table',1),(86,'2023_08_16_124106_create_product_tags_table',1),(87,'2023_08_16_125659_create_product_variations_values_table',1),(88,'2023_08_16_125812_create_logistic_zones_table',1),(89,'2023_08_18_103053_create_locations_table',1),(90,'2023_08_23_100143_create_product_galleries_table',1),(91,'2023_08_24_104758_create_carts_table',1),(92,'2023_08_26_064700_create_wishlist_table',1),(93,'2023_08_26_100400_alter_name_addresses',1),(94,'2023_08_28_073810_create_product_review_table',1),(95,'2023_08_29_054555_create_cities_table',1),(96,'2023_08_29_054601_create_states_table',1),(97,'2023_08_29_054608_create_countries_table',1),(98,'2023_08_29_063628_create_likes_table',1),(99,'2023_08_29_095027_create_review_galleries_table',1),(100,'2023_08_29_131200_alter_tax_table',1),(101,'2023_08_31_114732_create_order_groups_table',1),(102,'2023_08_31_114734_create_orders_table',1),(103,'2023_08_31_114740_create_order_items_table',1),(104,'2023_08_31_114747_create_order_updates_table',1),(105,'2023_09_01_115536_create_logistic_zone_city_table',1),(106,'2023_09_06_131856_create_stock_logs_table',1),(107,'2023_09_13_060334_create_product_category_brands_table',1),(108,'2023_10_18_052743_alter_users_table',1),(109,'2023_12_19_104347_create_booking_request_mapping_table',1),(110,'2023_12_26_063946_alter_votes_to_pet_notes',1),(111,'2024_01_23_041438_alter_enable_store',1),(112,'2024_02_13_071258_alter_type_to_commissions',1),(113,'2024_02_14_055950_create_order_vendor_mapping_table',1),(114,'2024_03_21_050115_alter_order_items',1),(115,'2024_03_29_084654_alter_product_reviews',1),(116,'2024_06_04_060537_alter_product_category_brands_table',1),(117,'2024_06_11_084726_alter_variations_table',1),(118,'2024_06_24_054554_boarder_daycare_amount',1),(119,'2024_06_26_065609_alter_service_facility_table',1),(120,'2024_06_26_065808_alter_service_duration_table',1),(121,'2024_06_26_104944_create_service_training_duration_mapping_table',1),(122,'2024_06_26_121621_alter_service_training_table',1),(123,'2024_09_10_122008_create_sessions_table',1),(124,'2025_08_13_194810_add_blog_image_to_blogs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `more_permission` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_template_content_mapping`
--

DROP TABLE IF EXISTS `notification_template_content_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_template_content_mapping` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template_id` bigint unsigned DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_detail` longtext COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_template_content_mapping`
--

LOCK TABLES `notification_template_content_mapping` WRITE;
/*!40000 ALTER TABLE `notification_template_content_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_template_content_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` longtext COLLATE utf8mb4_unicode_ci,
  `bcc` longtext COLLATE utf8mb4_unicode_ci,
  `cc` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `channels` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_groups`
--

DROP TABLE IF EXISTS `order_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `guest_user_id` int DEFAULT NULL,
  `order_code` bigint NOT NULL,
  `shipping_address_id` int DEFAULT NULL,
  `billing_address_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_amount` double NOT NULL DEFAULT '0',
  `total_tax_amount` double NOT NULL DEFAULT '0',
  `total_coupon_discount_amount` double NOT NULL DEFAULT '0',
  `total_shipping_cost` double NOT NULL DEFAULT '0',
  `grand_total_amount` double NOT NULL DEFAULT '0',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8mb4_unicode_ci,
  `is_manual_payment` tinyint(1) NOT NULL DEFAULT '0',
  `manual_payment_details` longtext COLLATE utf8mb4_unicode_ci,
  `pos_order_address` text COLLATE utf8mb4_unicode_ci,
  `additional_discount_value` double NOT NULL DEFAULT '0',
  `additional_discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'flat',
  `total_discount_amount` double NOT NULL DEFAULT '0',
  `total_tips_amount` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_groups`
--

LOCK TABLES `order_groups` WRITE;
/*!40000 ALTER TABLE `order_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_variation_id` int NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `location_id` int DEFAULT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `total_tax` double NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `reward_points` bigint NOT NULL DEFAULT '0',
  `is_refunded` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint unsigned NOT NULL DEFAULT '1',
  `total_shipping_cost` double NOT NULL DEFAULT '0',
  `delivery_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'order_placed',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivered_date` datetime DEFAULT NULL,
  `discount_value` double NOT NULL DEFAULT '0',
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_updates`
--

DROP TABLE IF EXISTS `order_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_updates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_updates`
--

LOCK TABLES `order_updates` WRITE;
/*!40000 ALTER TABLE `order_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_vendor_mapping`
--

DROP TABLE IF EXISTS `order_vendor_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_vendor_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `vendor_id` bigint unsigned NOT NULL DEFAULT '1',
  `product_total_amount` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_vendor_mapping`
--

LOCK TABLES `order_vendor_mapping` WRITE;
/*!40000 ALTER TABLE `order_vendor_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_vendor_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_group_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `guest_user_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `delivery_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'order_placed',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `applied_coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount_amount` double NOT NULL DEFAULT '0',
  `admin_earning_percentage` double NOT NULL DEFAULT '0' COMMENT 'how much in percentage seller will pay to admin for each sell',
  `total_admin_earnings` double NOT NULL DEFAULT '0',
  `logistic_id` int DEFAULT NULL,
  `logistic_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_or_delivery` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `pickup_hub_id` int DEFAULT NULL,
  `shipping_cost` double NOT NULL DEFAULT '0',
  `tips_amount` double NOT NULL DEFAULT '0',
  `reward_points` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_service_mappings`
--

DROP TABLE IF EXISTS `package_service_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_service_mappings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned DEFAULT NULL,
  `service_package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_service_mappings_service_id_foreign` (`service_id`),
  KEY `package_service_mappings_service_package_id_foreign` (`service_package_id`),
  CONSTRAINT `package_service_mappings_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `package_service_mappings_service_package_id_foreign` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_service_mappings`
--

LOCK TABLES `package_service_mappings` WRITE;
/*!40000 ALTER TABLE `package_service_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_service_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_fixed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'edit_settings','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(2,'view_logs','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(3,'view_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(4,'add_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(5,'edit_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(6,'delete_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(7,'view_boarding','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(8,'add_boarding','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(9,'edit_boarding','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(10,'delete_boarding','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(11,'view_boarding_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(12,'add_boarding_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(13,'edit_boarding_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(14,'delete_boarding_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(15,'view_boarder','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(16,'add_boarder','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(17,'edit_boarder','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(18,'delete_boarder','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(19,'view_facility','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(20,'add_facility','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(21,'edit_facility','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(22,'delete_facility','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(23,'view_veterinary','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(24,'add_veterinary','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(25,'edit_veterinary','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(26,'delete_veterinary','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(27,'view_veterinary_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(28,'add_veterinary_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(29,'edit_veterinary_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(30,'delete_veterinary_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(31,'view_veterinarian','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(32,'add_veterinarian','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(33,'edit_veterinarian','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(34,'delete_veterinarian','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(35,'view_veterinary_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(36,'add_veterinary_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(37,'edit_veterinary_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(38,'delete_veterinary_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(39,'view_veterinary_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(40,'add_veterinary_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(41,'edit_veterinary_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(42,'delete_veterinary_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(43,'view_grooming','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(44,'add_grooming','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(45,'edit_grooming','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(46,'delete_grooming','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(47,'view_grooming_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(48,'add_grooming_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(49,'edit_grooming_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(50,'delete_grooming_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(51,'view_groomer','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(52,'add_groomer','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(53,'edit_groomer','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(54,'delete_groomer','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(55,'view_grooming_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(56,'add_grooming_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(57,'edit_grooming_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(58,'delete_grooming_category','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(59,'view_grooming_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(60,'add_grooming_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(61,'edit_grooming_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(62,'delete_grooming_service','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(63,'view_traning','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(64,'add_traning','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(65,'edit_traning','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(66,'delete_traning','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(67,'view_training_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(68,'add_training_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(69,'edit_training_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(70,'delete_training_booking','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(71,'view_trainer','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(72,'add_trainer','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(73,'edit_trainer','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(74,'delete_trainer','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(75,'view_training_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(76,'add_training_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(77,'edit_training_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(78,'delete_training_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(79,'view_traning_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(80,'add_traning_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(81,'edit_traning_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(82,'delete_traning_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(83,'view_walking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(84,'add_walking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(85,'edit_walking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(86,'delete_walking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(87,'view_walking_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(88,'add_walking_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(89,'edit_walking_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(90,'delete_walking_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(91,'view_booking_request','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(92,'add_booking_request','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(93,'edit_booking_request','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(94,'delete_booking_request','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(95,'view_walker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(96,'add_walker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(97,'edit_walker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(98,'delete_walker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(99,'view_walking_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(100,'add_walking_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(101,'edit_walking_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(102,'delete_walking_duration','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(103,'view_daycare','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(104,'add_daycare','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(105,'edit_daycare','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(106,'delete_daycare','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(107,'view_daycare_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(108,'add_daycare_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(109,'edit_daycare_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(110,'delete_daycare_booking','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(111,'view_care_taker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(112,'add_care_taker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(113,'edit_care_taker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(114,'delete_care_taker','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(115,'view_pet_sitter','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(116,'add_pet_sitter','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(117,'edit_pet_sitter','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(118,'delete_pet_sitter','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(119,'view_pet_store','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(120,'add_pet_store','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(121,'edit_pet_store','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(122,'delete_pet_store','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(123,'view_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(124,'add_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(125,'edit_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(126,'delete_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(127,'add_assign_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(128,'view_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(129,'add_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(130,'edit_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(131,'delete_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(132,'view_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(133,'add_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(134,'edit_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(135,'delete_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(136,'view_employees','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(137,'add_employees','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(138,'edit_employees','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(139,'delete_employees','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(140,'view_pending_employees','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(141,'edit_employee_password','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(142,'view_employee_earning','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(143,'add_employee_earning','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(144,'edit_employee_earning','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(145,'delete_employee_earning','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(146,'view_employee_payout','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(147,'add_employee_payout','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(148,'edit_employee_payout','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(149,'delete_employee_payout','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(150,'view_owners','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(151,'add_owners','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(152,'edit_owners','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(153,'delete_owners','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(154,'view_owner\'s_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(155,'add_owner\'s_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(156,'edit_owner\'s_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(157,'delete_owner\'s_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(158,'edit_user_password','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(159,'view_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(160,'add_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(161,'edit_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(162,'delete_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(163,'view_order_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(164,'add_order_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(165,'edit_order_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(166,'delete_order_review','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(167,'view_tax','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(168,'add_tax','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(169,'edit_tax','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(170,'delete_tax','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(171,'view_events','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(172,'add_events','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(173,'edit_events','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(174,'delete_events','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(175,'view_blogs','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(176,'add_blogs','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(177,'edit_blogs','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(178,'delete_blogs','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(179,'view_syetem_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(180,'add_syetem_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(181,'edit_syetem_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(182,'delete_syetem_service','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(183,'view_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(184,'add_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(185,'edit_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(186,'delete_pet','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(187,'view_pet_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(188,'add_pet_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(189,'edit_pet_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(190,'delete_pet_type','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(191,'view_breed','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(192,'add_breed','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(193,'edit_breed','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(194,'delete_breed','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(195,'view_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(196,'add_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(197,'edit_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(198,'delete_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(199,'view_daily_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(200,'add_daily_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(201,'edit_daily_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(202,'delete_daily_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(203,'view_overall_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(204,'add_overall_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(205,'edit_overall_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(206,'delete_overall_bookings','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(207,'view_order_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(208,'add_order_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(209,'edit_order_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(210,'delete_order_reports','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(211,'view_page','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(212,'add_page','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(213,'edit_page','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(214,'delete_page','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(215,'view_setting','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(216,'add_setting','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(217,'edit_setting','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(218,'delete_setting','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(219,'view_notification','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(220,'add_notification','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(221,'edit_notification','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(222,'delete_notification','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(223,'view_notification_template','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(224,'add_notification_template','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(225,'edit_notification_template','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(226,'delete_notification_template','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(227,'view_app_banner','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(228,'add_app_banner','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(229,'edit_app_banner','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(230,'delete_app_banner','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(231,'view_constant','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(232,'add_constant','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(233,'edit_constant','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(234,'delete_constant','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(235,'view_permission','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(236,'add_permission','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(237,'edit_permission','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(238,'delete_permission','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(239,'view_modules','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(240,'add_modules','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(241,'edit_modules','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(242,'delete_modules','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(243,'view_product','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(244,'add_product','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(245,'edit_product','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(246,'delete_product','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(247,'view_product_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(248,'add_product_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(249,'edit_product_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(250,'delete_product_category','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(251,'view_product_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(252,'add_product_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(253,'edit_product_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(254,'delete_product_subcategory','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(255,'view_brand','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(256,'add_brand','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(257,'edit_brand','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(258,'delete_brand','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(259,'view_unit','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(260,'add_unit','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(261,'edit_unit','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(262,'delete_unit','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(263,'view_tag','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(264,'add_tag','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(265,'edit_tag','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(266,'delete_tag','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(267,'view_product_variation','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(268,'add_product_variation','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(269,'edit_product_variation','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(270,'delete_product_variation','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(271,'view_order','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(272,'add_order','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(273,'edit_order','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(274,'delete_order','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(275,'view_supply','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(276,'add_supply','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(277,'edit_supply','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(278,'delete_supply','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(279,'view_logistics','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(280,'add_logistics','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(281,'edit_logistics','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(282,'delete_logistics','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(283,'view_shipping_zones','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(284,'add_shipping_zones','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(285,'edit_shipping_zones','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(286,'delete_shipping_zones','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(287,'view_location','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(288,'add_location','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(289,'edit_location','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(290,'delete_location','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(291,'view_city','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(292,'add_city','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(293,'edit_city','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(294,'delete_city','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(295,'view_state','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(296,'add_state','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(297,'edit_state','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(298,'delete_state','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(299,'view_country','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(300,'add_country','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(301,'edit_country','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24'),(302,'delete_country','web',1,'2025-08-15 08:12:24','2025-08-15 08:12:24');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` longtext COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_notes`
--

DROP TABLE IF EXISTS `pet_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pet_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_private` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pet_notes_pet_id_foreign` (`pet_id`),
  CONSTRAINT `pet_notes_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_notes`
--

LOCK TABLES `pet_notes` WRITE;
/*!40000 ALTER TABLE `pet_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pettype_id` bigint unsigned NOT NULL,
  `breed_id` bigint unsigned DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `additional_info` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pets_user_id_foreign` (`user_id`),
  KEY `pets_pettype_id_foreign` (`pettype_id`),
  KEY `pets_breed_id_foreign` (`breed_id`),
  CONSTRAINT `pets_breed_id_foreign` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pets_pettype_id_foreign` FOREIGN KEY (`pettype_id`) REFERENCES `pets_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets_type`
--

DROP TABLE IF EXISTS `pets_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets_type`
--

LOCK TABLES `pets_type` WRITE;
/*!40000 ALTER TABLE `pets_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `pets_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '1',
  `amount` int DEFAULT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `trial_period` int NOT NULL DEFAULT '0',
  `planlimitation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planlimitation`
--

DROP TABLE IF EXISTS `planlimitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planlimitation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planlimitation`
--

LOCK TABLES `planlimitation` WRITE;
/*!40000 ALTER TABLE `planlimitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `planlimitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planlimitation_mapping`
--

DROP TABLE IF EXISTS `planlimitation_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planlimitation_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int DEFAULT NULL,
  `planlimitation_id` int DEFAULT NULL,
  `limit` int DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planlimitation_mapping`
--

LOCK TABLES `planlimitation_mapping` WRITE;
/*!40000 ALTER TABLE `planlimitation_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `planlimitation_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `sorting_order_level` int NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_top` tinyint NOT NULL DEFAULT '0',
  `total_sale_count` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_brands`
--

DROP TABLE IF EXISTS `product_category_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_brands`
--

LOCK TABLES `product_category_brands` WRITE;
/*!40000 ALTER TABLE `product_category_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_mappings`
--

DROP TABLE IF EXISTS `product_category_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_mappings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_mappings`
--

LOCK TABLES `product_category_mappings` WRITE;
/*!40000 ALTER TABLE `product_category_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_galleries`
--

DROP TABLE IF EXISTS `product_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `full_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_galleries`
--

LOCK TABLES `product_galleries` WRITE;
/*!40000 ALTER TABLE `product_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `product_variation_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_msg` text COLLATE utf8mb4_unicode_ci,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` bigint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tax`
--

DROP TABLE IF EXISTS `product_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tax` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tax`
--

LOCK TABLES `product_tax` WRITE;
/*!40000 ALTER TABLE `product_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tax_mappings`
--

DROP TABLE IF EXISTS `product_tax_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tax_mappings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `tax_id` int NOT NULL,
  `tax_value` double NOT NULL DEFAULT '0',
  `tax_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount' COMMENT 'flat / percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tax_mappings`
--

LOCK TABLES `product_tax_mappings` WRITE;
/*!40000 ALTER TABLE `product_tax_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tax_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variation_combinations`
--

DROP TABLE IF EXISTS `product_variation_combinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variation_combinations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `product_variation_id` int NOT NULL,
  `variation_id` int NOT NULL,
  `variation_value_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variation_combinations`
--

LOCK TABLES `product_variation_combinations` WRITE;
/*!40000 ALTER TABLE `product_variation_combinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variation_combinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variation_stocks`
--

DROP TABLE IF EXISTS `product_variation_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variation_stocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_variation_id` int NOT NULL,
  `location_id` int DEFAULT NULL COMMENT 'warehouse/location',
  `stock_qty` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variation_stocks`
--

LOCK TABLES `product_variation_stocks` WRITE;
/*!40000 ALTER TABLE `product_variation_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variation_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `variation_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations_values`
--

DROP TABLE IF EXISTS `product_variations_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variations_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `variation_value_id` int NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations_values`
--

LOCK TABLES `product_variations_values` WRITE;
/*!40000 ALTER TABLE `product_variations_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variations_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `brand_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `product_tags` longtext COLLATE utf8mb4_unicode_ci,
  `min_price` double NOT NULL DEFAULT '0',
  `max_price` double NOT NULL DEFAULT '0',
  `discount_value` double NOT NULL DEFAULT '0',
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_start_date` int DEFAULT NULL,
  `discount_end_date` int DEFAULT NULL,
  `sell_target` int DEFAULT NULL,
  `stock_qty` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `min_purchase_qty` int NOT NULL DEFAULT '1',
  `max_purchase_qty` int NOT NULL DEFAULT '1',
  `has_variation` tinyint NOT NULL DEFAULT '1',
  `has_warranty` tinyint NOT NULL DEFAULT '1',
  `total_sale_count` double NOT NULL DEFAULT '0',
  `standard_delivery_hours` int NOT NULL DEFAULT '24',
  `express_delivery_hours` int NOT NULL DEFAULT '24',
  `size_guide` text COLLATE utf8mb4_unicode_ci,
  `reward_points` bigint NOT NULL DEFAULT '0',
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_galleries`
--

DROP TABLE IF EXISTS `review_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `full_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_galleries`
--

LOCK TABLES `review_galleries` WRITE;
/*!40000 ALTER TABLE `review_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,1),(254,1),(255,1),(256,1),(257,1),(258,1),(259,1),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,1),(272,1),(273,1),(274,1),(275,1),(276,1),(277,1),(278,1),(279,1),(280,1),(281,1),(282,1),(283,1),(284,1),(285,1),(286,1),(287,1),(288,1),(289,1),(290,1),(291,1),(292,1),(293,1),(294,1),(295,1),(296,1),(297,1),(298,1),(299,1),(300,1),(301,1),(302,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2),(97,2),(98,2),(99,2),(100,2),(101,2),(102,2),(103,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2),(120,2),(121,2),(122,2),(123,2),(124,2),(125,2),(126,2),(127,2),(128,2),(129,2),(130,2),(131,2),(132,2),(133,2),(134,2),(135,2),(136,2),(137,2),(138,2),(139,2),(140,2),(141,2),(142,2),(143,2),(144,2),(145,2),(146,2),(147,2),(148,2),(149,2),(150,2),(151,2),(152,2),(153,2),(154,2),(155,2),(156,2),(157,2),(158,2),(159,2),(160,2),(161,2),(162,2),(163,2),(164,2),(165,2),(166,2),(167,2),(168,2),(169,2),(170,2),(171,2),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(178,2),(179,2),(180,2),(181,2),(182,2),(183,2),(184,2),(185,2),(186,2),(187,2),(188,2),(189,2),(190,2),(191,2),(192,2),(193,2),(194,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2),(210,2),(211,2),(212,2),(213,2),(214,2),(215,2),(216,2),(217,2),(218,2),(219,2),(220,2),(221,2),(222,2),(223,2),(224,2),(225,2),(226,2),(227,2),(228,2),(229,2),(230,2),(231,2),(232,2),(233,2),(234,2),(238,2),(239,2),(240,2),(241,2),(242,2),(243,2),(244,2),(245,2),(246,2),(247,2),(248,2),(249,2),(250,2),(252,2),(253,2),(254,2),(255,2),(256,2),(257,2),(258,2),(259,2),(260,2),(261,2),(262,2),(263,2),(264,2),(265,2),(266,2),(267,2),(268,2),(269,2),(270,2),(271,2),(272,2),(273,2),(274,2),(275,2),(276,2),(277,2),(278,2),(279,2),(280,2),(281,2),(282,2),(283,2),(284,2),(285,2),(286,2),(287,2),(288,2),(289,2),(290,2),(291,2),(292,2),(293,2),(294,2),(295,2),(296,2),(297,2),(298,2),(299,2),(300,2),(301,2),(302,2),(23,3),(27,3),(39,3),(123,3),(124,3),(125,3),(126,3),(128,3),(132,3),(150,3),(154,3),(159,3),(43,4),(47,4),(59,4),(123,4),(124,4),(125,4),(126,4),(128,4),(132,4),(150,4),(154,4),(159,4),(83,5),(87,5),(91,5),(99,5),(100,5),(101,5),(102,5),(123,5),(150,5),(154,5),(159,5),(7,6),(11,6),(19,6),(20,6),(21,6),(22,6),(123,6),(150,6),(154,6),(159,6),(63,7),(67,7),(75,7),(76,7),(77,7),(78,7),(123,7),(150,7),(154,7),(159,7),(103,8),(107,8),(150,8),(154,8),(159,8),(3,9),(163,11),(243,11),(244,11),(245,11),(246,11),(248,11),(249,11),(250,11),(252,11),(253,11),(254,11),(255,11),(256,11),(257,11),(258,11),(259,11),(260,11),(261,11),(262,11),(263,11),(264,11),(265,11),(266,11),(267,11),(268,11),(269,11),(270,11),(271,11),(272,11),(273,11),(274,11),(276,11),(277,11),(278,11),(280,11),(281,11),(282,11),(284,11),(285,11),(286,11);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_fixed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(2,'demo_admin','Demo Admin','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(3,'vet','Veterinarian','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(4,'groomer','Groomer','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(5,'walker','Walker','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(6,'boarder','Boarder','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(7,'trainer','Trainer','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(8,'day_taker','Day Care Taker','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(9,'user','Customer','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(10,'pet_sitter','Pet Sitter','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23'),(11,'pet_store','Pet Store','web',1,'2025-08-15 08:12:23','2025-08-15 08:12:23');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_branches`
--

DROP TABLE IF EXISTS `service_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `service_price` double NOT NULL DEFAULT '0',
  `duration_min` double NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_branches`
--

LOCK TABLES `service_branches` WRITE;
/*!40000 ALTER TABLE `service_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_categories`
--

DROP TABLE IF EXISTS `service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_categories`
--

LOCK TABLES `service_categories` WRITE;
/*!40000 ALTER TABLE `service_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_duration`
--

DROP TABLE IF EXISTS `service_duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_duration` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '15',
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_duration`
--

LOCK TABLES `service_duration` WRITE;
/*!40000 ALTER TABLE `service_duration` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_employees`
--

DROP TABLE IF EXISTS `service_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_employees`
--

LOCK TABLES `service_employees` WRITE;
/*!40000 ALTER TABLE `service_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_facility`
--

DROP TABLE IF EXISTS `service_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_facility` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_facility`
--

LOCK TABLES `service_facility` WRITE;
/*!40000 ALTER TABLE `service_facility` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_galleries`
--

DROP TABLE IF EXISTS `service_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `full_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_galleries`
--

LOCK TABLES `service_galleries` WRITE;
/*!40000 ALTER TABLE `service_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_packages`
--

DROP TABLE IF EXISTS `service_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `subcategory_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT '0.00',
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint DEFAULT '0',
  `package_type` text COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_packages`
--

LOCK TABLES `service_packages` WRITE;
/*!40000 ALTER TABLE `service_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_training`
--

DROP TABLE IF EXISTS `service_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_training` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_training`
--

LOCK TABLES `service_training` WRITE;
/*!40000 ALTER TABLE `service_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_training_duration_mapping`
--

DROP TABLE IF EXISTS `service_training_duration_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_training_duration_mapping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '15',
  `amount` double DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_training_duration_mapping`
--

LOCK TABLES `service_training_duration_mapping` WRITE;
/*!40000 ALTER TABLE `service_training_duration_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_training_duration_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `duration_min` double(8,2) NOT NULL DEFAULT '15.00',
  `default_price` double(8,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint unsigned NOT NULL,
  `sub_category_id` bigint unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'slot_duration','00:15','text',NULL,NULL,NULL,'2025-08-15 08:12:23','2025-08-15 08:12:23',NULL),(2,'slot_duration','00:15','text',NULL,NULL,NULL,'2025-08-15 08:16:08','2025-08-15 08:16:08',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'category',
  `link_id` int DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_logs`
--

DROP TABLE IF EXISTS `stock_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('inward','outward') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inward',
  `quantity` int NOT NULL DEFAULT '0',
  `location_id` bigint unsigned NOT NULL DEFAULT '1',
  `product_id` bigint unsigned NOT NULL,
  `product_variation_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_logs`
--

LOCK TABLES `stock_logs` WRITE;
/*!40000 ALTER TABLE `stock_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `plan_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions_transactions`
--

DROP TABLE IF EXISTS `subscriptions_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscriptions_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_transactions_details` text COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions_transactions`
--

LOCK TABLES `subscriptions_transactions` WRITE;
/*!40000 ALTER TABLE `subscriptions_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_services`
--

DROP TABLE IF EXISTS `system_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `feature_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_services`
--

LOCK TABLES `system_services` WRITE;
/*!40000 ALTER TABLE `system_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'percent' COMMENT 'fixed , percent',
  `value` double DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '1- Active , 0- InActive',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `module_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_earnings`
--

DROP TABLE IF EXISTS `tip_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip_earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `tippable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tippable_id` bigint unsigned NOT NULL,
  `tip_amount` double DEFAULT NULL,
  `tip_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tip_earnings_tippable_type_tippable_id_index` (`tippable_type`,`tippable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_earnings`
--

LOCK TABLES `tip_earnings` WRITE;
/*!40000 ALTER TABLE `tip_earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tip_earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `about_self` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expert` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dribbble_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_providers`
--

DROP TABLE IF EXISTS `user_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_providers_user_id_foreign` (`user_id`),
  CONSTRAINT `user_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_providers`
--

LOCK TABLES `user_providers` WRITE;
/*!40000 ALTER TABLE `user_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `is_manager` tinyint NOT NULL DEFAULT '0',
  `show_in_calender` tinyint NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` tinyint unsigned NOT NULL DEFAULT '0',
  `is_subscribe` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `last_notification_seen` timestamp NULL DEFAULT NULL,
  `user_setting` longtext COLLATE utf8mb4_unicode_ci,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_store` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super','Admin','admin@teste.com','44-5289568745',NULL,NULL,NULL,'male','1990-01-01',0,0,'2025-08-15 08:19:18','$2y$10$dsd7/a6Got6VThGR53VCxe4zFSWiR/o2RKq9F/X/iEZ/X/UGFBCDi',NULL,0,0,1,NULL,NULL,NULL,'admin',NULL,'2025-08-15 08:19:18','2025-08-15 08:19:18',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_values`
--

DROP TABLE IF EXISTS `variation_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variation_id` int NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_values`
--

LOCK TABLES `variation_values` WRITE;
/*!40000 ALTER TABLE `variation_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `is_fixed` tinyint NOT NULL DEFAULT '0',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_calls`
--

DROP TABLE IF EXISTS `webhook_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_calls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` json DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `exception` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_calls`
--

LOCK TABLES `webhook_calls` WRITE;
/*!40000 ALTER TABLE `webhook_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `guest_user_id` bigint DEFAULT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-15 12:30:57
