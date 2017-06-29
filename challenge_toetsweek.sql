-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server versie:                10.1.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Versie:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Databasestructuur van challenge_toetsweek wordt geschreven
CREATE DATABASE IF NOT EXISTS `challenge_toetsweek` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `challenge_toetsweek`;

-- Structuur van  tabel challenge_toetsweek.migrations wordt geschreven
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.migrations: ~5 rows (ongeveer)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2015_10_31_162633_scaffoldinterfaces', 1),
	(4, '2017_06_26_103916_create_permission_tables', 1),
	(5, '2017_06_26_112528_timedays', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.password_resets wordt geschreven
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.password_resets: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.permissions wordt geschreven
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.permissions: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(2, 'Cut Hair', '2017-06-26 11:53:20', '2017-06-26 11:53:20');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.relations wordt geschreven
CREATE TABLE IF NOT EXISTS `relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scaffoldinterface_id` int(10) unsigned NOT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `having` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relations_scaffoldinterface_id_foreign` (`scaffoldinterface_id`),
  CONSTRAINT `relations_scaffoldinterface_id_foreign` FOREIGN KEY (`scaffoldinterface_id`) REFERENCES `scaffoldinterfaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.relations: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.roles wordt geschreven
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.roles: ~2 rows (ongeveer)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Hair Stylist', '2017-06-26 11:51:51', '2017-06-26 11:51:51'),
	(2, 'Customer', '2017-06-26 11:54:59', '2017-06-26 11:54:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.role_has_permissions wordt geschreven
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.role_has_permissions: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.scaffoldinterfaces wordt geschreven
CREATE TABLE IF NOT EXISTS `scaffoldinterfaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tablename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.scaffoldinterfaces: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `scaffoldinterfaces` DISABLE KEYS */;
INSERT INTO `scaffoldinterfaces` (`id`, `package`, `migration`, `model`, `controller`, `views`, `tablename`, `created_at`, `updated_at`) VALUES
	(1, 'Laravel', 'C:\\xampp\\htdocs\\Challenge_Toetsweek 2.0\\database/migrations/2017_06_26_112528_timedays.php', 'C:\\xampp\\htdocs\\Challenge_Toetsweek 2.0\\app/Timeday.php', 'C:\\xampp\\htdocs\\Challenge_Toetsweek 2.0\\app/Http/Controllers/TimedayController.php', 'C:\\xampp\\htdocs\\Challenge_Toetsweek 2.0\\resources/views/timeday', 'timedays', '2017-06-26 11:25:29', '2017-06-26 11:25:29');
/*!40000 ALTER TABLE `scaffoldinterfaces` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.timedays wordt geschreven
CREATE TABLE IF NOT EXISTS `timedays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_appointment` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.timedays: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `timedays` DISABLE KEYS */;
INSERT INTO `timedays` (`id`, `date_appointment`) VALUES
	(1, '2017-06-26 22:13:00');
/*!40000 ALTER TABLE `timedays` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.users wordt geschreven
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.users: ~2 rows (ongeveer)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Deona', 'deona.secreve@outlook.com', '$2y$10$.N75iTiLyf9rzeFXAy9N7OfGWQQOF9LwlbuNQB99nSyr71yX71GcK', '0EPD0VH36t7DT5iMQ1LVkHfTEPBiRA6q7Iutc1U2mnBpCGOg7l8LvUiYy0Un', '2017-06-26 11:27:12', '2017-06-26 11:53:41'),
	(2, 'Luke', 'luke@paradoxis.nl', '$2y$10$qS8d.3iT9fhlFFyVBveIzeuSESeOsTpRbyZmfDUNZkfp164xwjzRi', NULL, '2017-06-26 11:55:21', '2017-06-26 11:55:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.user_has_permissions wordt geschreven
CREATE TABLE IF NOT EXISTS `user_has_permissions` (
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `user_has_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `user_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_has_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.user_has_permissions: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `user_has_permissions` DISABLE KEYS */;
INSERT INTO `user_has_permissions` (`user_id`, `permission_id`) VALUES
	(1, 2);
/*!40000 ALTER TABLE `user_has_permissions` ENABLE KEYS */;

-- Structuur van  tabel challenge_toetsweek.user_has_roles wordt geschreven
CREATE TABLE IF NOT EXISTS `user_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `user_has_roles_user_id_foreign` (`user_id`),
  CONSTRAINT `user_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_has_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel challenge_toetsweek.user_has_roles: ~2 rows (ongeveer)
/*!40000 ALTER TABLE `user_has_roles` DISABLE KEYS */;
INSERT INTO `user_has_roles` (`role_id`, `user_id`) VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE `user_has_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
