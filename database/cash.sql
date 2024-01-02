-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 11:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cash`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `contact`, `address`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr Admin', 'admin@test.com', 'admin', '01751473384', 'Dhaka, Uttara', NULL, '64db34bbd40551692087483.png', '$2y$10$ttArcUVDiEZf1cz7K4DJO.k01pcV.wOqbta/MWzkKW98HWS24c6Dq', NULL, NULL, '2023-09-20 07:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE IF NOT EXISTS `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT 0,
  `agent_id` int(10) DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `is_read` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `agent_id`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(3, 0, NULL, 'SMS Error: unexpected response from API', 1, '#', '2023-11-05 06:02:41', '2023-12-06 17:16:45'),
(4, 0, NULL, 'unexpected response from API', 1, '#', '2023-11-05 06:02:41', '2023-12-06 17:16:45'),
(5, 1, NULL, 'New member registered', 1, '#', '2023-11-09 12:39:56', '2023-12-06 17:16:45'),
(28, 12, 0, 'Deposit request from demou', 0, '/admin/deposit/pending', '2023-12-10 19:56:42', '2023-12-10 19:56:42'),
(29, 0, 4, 'Deposit successful via Stripe Storefront - USD', 0, '/admin/deposit/done', '2023-12-11 20:11:18', '2023-12-11 20:11:18'),
(30, 0, 5, 'New agent member registered', 0, '/admin/user/index', '2023-12-11 20:24:32', '2023-12-11 20:24:32'),
(31, 0, 6, 'New agent member registered', 0, '/admin/user/index', '2023-12-11 20:42:52', '2023-12-11 20:42:52'),
(65, 12, 14, 'demoucash in fromfakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-15 01:03:19', '2023-12-15 01:03:19'),
(66, 12, 14, 'demou cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-15 01:13:17', '2023-12-15 01:13:17'),
(67, 11, 14, 'demouser7 cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-15 01:28:50', '2023-12-15 01:28:50'),
(68, 12, 14, 'demou cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-15 13:12:58', '2023-12-15 13:12:58'),
(69, 5, 14, 'demouser5 cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-15 13:27:26', '2023-12-15 13:27:26'),
(70, 12, 14, 'demou cash Out from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-15 13:32:01', '2023-12-15 13:32:01'),
(71, 12, 0, 'Deposit successful via Stripe Storefront - USD', 0, '/admin/deposit/done', '2023-12-15 19:04:58', '2023-12-15 19:04:58'),
(72, 4, 12, 'demouser4 send money from demou', 0, '/agent/CashInCashOut', '2023-12-15 19:10:25', '2023-12-15 19:10:25'),
(73, 3, 12, 'demouser3 send money from demou', 0, '/agent/CashInCashOut', '2023-12-16 16:49:38', '2023-12-16 16:49:38'),
(74, 0, 14, 'Deposit request from fakeagenttwo', 1, '#', '2023-12-17 23:11:59', '2023-12-19 02:28:47'),
(75, 12, 14, 'demou cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-17 23:31:33', '2023-12-17 23:31:33'),
(76, 10, 14, 'demouser6 cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-18 02:34:02', '2023-12-18 02:34:02'),
(77, 11, 14, 'demouser7 cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-18 02:36:30', '2023-12-18 02:36:30'),
(78, 11, 14, 'demouser7 cash in from fakeagenttwo', 0, '/agent/CashInCashOut', '2023-12-18 02:40:34', '2023-12-18 02:40:34'),
(79, 11, 14, 'demouser7 cash in from fakeagenttwo', 1, '/agent/CashInCashOut', '2023-12-18 02:43:11', '2023-12-19 02:28:41'),
(80, 0, 14, 'Deposit successful via Stripe Storefront - USD', 1, '/admin/deposit/done', '2023-12-18 23:32:19', '2023-12-18 23:35:55'),
(81, 0, 14, 'Deposit request from fakeagenttwo', 1, '#', '2023-12-18 23:51:39', '2023-12-18 23:55:06'),
(82, 0, 14, 'New withdraw request from fakeagenttwo', 1, '/agent/login', '2023-12-19 00:04:00', '2023-12-19 02:28:37'),
(83, 12, 0, 'New withdraw request from demou', 0, '/admin/withdraw/pending', '2023-12-19 21:53:26', '2023-12-19 21:53:26'),
(84, 12, 14, 'demou cash In from fakeagenttwo', 0, '#', '2023-12-19 21:54:39', '2023-12-19 21:54:39'),
(85, 12, 14, 'demou cash Out from fakeagenttwo', 0, '#', '2023-12-20 00:36:14', '2023-12-20 00:36:14'),
(86, 12, 14, 'demou cash Out from fakeagenttwo', 0, '#', '2023-12-20 00:39:20', '2023-12-20 00:39:20'),
(87, 12, 0, 'Deposit successful via Stripe Storefront - USD', 0, '/admin/deposit/done', '2023-12-20 02:34:58', '2023-12-20 02:34:58'),
(88, 12, 0, 'demou send money to demouser2', 0, '#', '2023-12-20 22:53:07', '2023-12-20 22:53:07'),
(89, 12, 0, 'demou send money to demouser', 0, '#', '2023-12-21 01:27:54', '2023-12-21 01:27:54'),
(90, 5, 14, 'demouser5 cash In from fakeagenttwo', 0, '#', '2023-12-21 04:03:14', '2023-12-21 04:03:14'),
(91, 12, 0, 'demou send money to demouser4', 0, '#', '2023-12-21 23:39:37', '2023-12-21 23:39:37'),
(92, NULL, NULL, 'demou cash Out from fakeagenttwo', 0, '#', '2023-12-21 23:42:44', '2023-12-21 23:42:44'),
(93, 4, 14, 'demouser4 cash In from fakeagenttwo', 0, '#', '2023-12-21 23:44:27', '2023-12-21 23:44:27'),
(94, 5, 14, 'demouser5 cash In from fakeagenttwo', 0, '#', '2023-12-21 23:45:34', '2023-12-21 23:45:34'),
(95, NULL, NULL, 'demou cash Out from fakeagenttwo', 0, '#', '2023-12-22 01:17:00', '2023-12-22 01:17:00'),
(96, 12, 14, 'demou cash In from fakeagenttwo', 0, '#', '2023-12-22 01:21:48', '2023-12-22 01:21:48'),
(97, NULL, NULL, 'demou cash Out from demoagenttwo', 0, '#', '2023-12-22 01:25:42', '2023-12-22 01:25:42'),
(98, NULL, NULL, 'demou cash Out from fakeagenttwo', 0, '#', '2023-12-22 01:30:31', '2023-12-22 01:30:31'),
(99, 12, 0, 'demou send money to demouser7', 0, '#', '2023-12-22 01:35:39', '2023-12-22 01:35:39'),
(100, 12, 0, 'demou send money to demouser7', 0, '#', '2023-12-22 01:36:56', '2023-12-22 01:36:56'),
(101, 12, 14, 'demou cash In from fakeagenttwo', 0, '#', '2023-12-22 01:39:42', '2023-12-22 01:39:42'),
(102, 12, 14, 'demou cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-23 21:30:28', '2023-12-23 21:30:28'),
(103, 12, 14, 'demou cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-23 21:35:12', '2023-12-23 21:35:12'),
(104, 12, 14, 'demou cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-23 21:37:54', '2023-12-23 21:37:54'),
(105, 0, 14, 'Cash In Commission', 1, '/admin/commission/index', '2023-12-23 21:37:54', '2023-12-24 00:47:02'),
(106, 12, 14, 'demou cash In from fakeagenttwo', 1, '/admin/cash/in/index', '2023-12-23 21:39:26', '2023-12-24 00:46:57'),
(107, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-23 21:39:26', '2023-12-23 21:39:26'),
(108, 12, 14, 'demou cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-23 22:35:19', '2023-12-23 22:35:19'),
(109, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-23 22:35:19', '2023-12-23 22:35:19'),
(110, 12, 14, 'demou cash In from fakeagenttwo', 1, '/admin/cash/in/index', '2023-12-23 23:29:32', '2023-12-24 00:46:50'),
(111, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-23 23:29:32', '2023-12-23 23:29:32'),
(112, NULL, NULL, 'demou cash Out from fakeagenttwo', 0, '/admin/cash/out/index', '2023-12-23 23:48:48', '2023-12-23 23:48:48'),
(113, NULL, NULL, 'demou cash Out from fakeagenttwo', 1, '/admin/cash/out/index', '2023-12-23 23:49:41', '2023-12-24 00:46:46'),
(114, 0, 14, 'Cash Out Commission', 0, '/admin/commission/index', '2023-12-23 23:49:41', '2023-12-23 23:49:41'),
(115, NULL, NULL, 'demou cash Out from fakeagenttwo', 1, '/admin/cash/out/index', '2023-12-23 23:50:30', '2023-12-24 00:23:03'),
(116, 0, 14, 'Cash Out Commission', 0, '/admin/commission/index', '2023-12-23 23:50:30', '2023-12-23 23:50:30'),
(117, 12, 0, 'demou send money to demouser2', 1, '/admin/send/money/index', '2023-12-24 00:14:46', '2023-12-24 00:22:57'),
(118, 2, 0, 'demouser2 send money to demou', 0, '/admin/send/money/index', '2023-12-24 01:22:17', '2023-12-24 01:22:17'),
(119, 2, 0, 'demouser2 send money to demou', 0, '/admin/send/money/index', '2023-12-24 01:32:22', '2023-12-24 01:32:22'),
(120, 12, 0, 'demou send money to demouser2', 0, '/admin/send/money/index', '2023-12-24 01:36:08', '2023-12-24 01:36:08'),
(121, 11, 3, 'demouser7 cash In from demoa', 0, '/admin/cash/in/index', '2023-12-24 02:54:01', '2023-12-24 02:54:01'),
(122, 0, 3, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-24 02:54:01', '2023-12-24 02:54:01'),
(123, NULL, NULL, 'abc cash Out from fakeagenttwo', 0, '/admin/cash/out/index', '2023-12-24 19:09:57', '2023-12-24 19:09:57'),
(124, 0, 14, 'Cash Out Commission', 0, '/admin/commission/index', '2023-12-24 19:09:57', '2023-12-24 19:09:57'),
(125, 12, 0, 'abc send money to demouser7', 0, '/admin/send/money/index', '2023-12-25 22:55:43', '2023-12-25 22:55:43'),
(126, 12, 0, 'abc send money to demouser7', 0, '/admin/send/money/index', '2023-12-25 22:56:24', '2023-12-25 22:56:24'),
(127, NULL, NULL, 'abc cash Out from fakeagenttwo', 0, '/admin/cash/out/index', '2023-12-25 23:00:15', '2023-12-25 23:00:15'),
(128, 0, 14, 'Cash Out Commission', 0, '/admin/commission/index', '2023-12-25 23:00:15', '2023-12-25 23:00:15'),
(129, 12, 0, 'Deposit successful via Stripe Storefront - USD', 0, '/admin/deposit/done', '2023-12-25 23:39:54', '2023-12-25 23:39:54'),
(130, 12, 0, 'Deposit request from abc', 0, '#', '2023-12-25 23:58:21', '2023-12-25 23:58:21'),
(131, 12, 0, 'New withdraw request from abc', 0, '/admin/withdraw/pending', '2023-12-26 00:07:36', '2023-12-26 00:07:36'),
(132, 0, 15, 'New agent member registered', 0, '/admin/user/index', '2023-12-26 02:59:05', '2023-12-26 02:59:05'),
(133, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-26 20:06:31', '2023-12-26 20:06:31'),
(134, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-26 20:06:31', '2023-12-26 20:06:31'),
(135, 0, 14, 'New withdraw request from fakeagenttwo', 0, '/agent/login', '2023-12-26 20:31:39', '2023-12-26 20:31:39'),
(136, 12, 14, 'abc cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-29 07:46:14', '2023-12-29 07:46:14'),
(137, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-29 07:46:14', '2023-12-29 07:46:14'),
(138, 12, 14, 'abc cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-29 07:46:50', '2023-12-29 07:46:50'),
(139, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-29 07:46:50', '2023-12-29 07:46:50'),
(140, 0, 14, 'Deposit successful via Stripe Storefront - USD', 0, '/admin/deposit/done', '2023-12-29 07:53:21', '2023-12-29 07:53:21'),
(141, 0, 14, 'Deposit request from fakeagenttwo', 0, '#', '2023-12-29 08:10:54', '2023-12-29 08:10:54'),
(142, 0, 14, 'New withdraw request from fakeagenttwo', 0, '/agent/login', '2023-12-29 08:11:26', '2023-12-29 08:11:26'),
(143, 15, 0, 'New member registered', 0, '/admin/user/index', '2023-12-29 08:31:36', '2023-12-29 08:31:36'),
(144, 16, 0, 'New member registered', 0, '/admin/user/index', '2023-12-29 10:09:40', '2023-12-29 10:09:40'),
(145, 0, 16, 'New agent member registered', 0, '/admin/user/index', '2023-12-29 10:10:48', '2023-12-29 10:10:48'),
(146, NULL, 14, 'demouser cash Out from fakeagenttwo', 0, '/admin/cash/out/index', '2023-12-30 15:22:41', '2023-12-30 15:22:41'),
(147, 0, 14, 'Cash Out Commission', 0, '/admin/commission/index', '2023-12-30 15:22:41', '2023-12-30 15:22:41'),
(148, NULL, NULL, 'abc cash Out from demoagentfour', 0, '/admin/cash/out/index', '2023-12-30 17:01:52', '2023-12-30 17:01:52'),
(149, 0, 12, 'Cash Out Commission', 0, '/admin/commission/index', '2023-12-30 17:01:52', '2023-12-30 17:01:52'),
(150, 17, 0, 'New member registered', 0, '/admin/user/index', '2023-12-31 20:21:49', '2023-12-31 20:21:49'),
(151, 18, 0, 'New member registered', 0, '/admin/user/index', '2023-12-31 20:23:53', '2023-12-31 20:23:53'),
(152, 19, 0, 'New member registered', 0, '/admin/user/index', '2023-12-31 20:26:34', '2023-12-31 20:26:34'),
(153, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 20:54:41', '2023-12-31 20:54:41'),
(154, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 20:55:10', '2023-12-31 20:55:10'),
(155, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-31 20:55:10', '2023-12-31 20:55:10'),
(156, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 20:56:10', '2023-12-31 20:56:10'),
(157, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 20:57:37', '2023-12-31 20:57:37'),
(158, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 20:58:53', '2023-12-31 20:58:53'),
(159, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 20:59:37', '2023-12-31 20:59:37'),
(160, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-31 20:59:37', '2023-12-31 20:59:37'),
(161, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:00:07', '2023-12-31 21:00:07'),
(162, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2023-12-31 21:00:07', '2023-12-31 21:00:07'),
(163, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:00:50', '2023-12-31 21:00:50'),
(164, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:01:21', '2023-12-31 21:01:21'),
(165, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:01:58', '2023-12-31 21:01:58'),
(166, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:05:18', '2023-12-31 21:05:18'),
(167, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:06:07', '2023-12-31 21:06:07'),
(168, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:09:57', '2023-12-31 21:09:57'),
(169, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:13:39', '2023-12-31 21:13:39'),
(170, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:15:09', '2023-12-31 21:15:09'),
(171, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:15:36', '2023-12-31 21:15:36'),
(172, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:16:01', '2023-12-31 21:16:01'),
(173, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:17:00', '2023-12-31 21:17:00'),
(174, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:17:57', '2023-12-31 21:17:57'),
(175, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:18:08', '2023-12-31 21:18:08'),
(176, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:22:07', '2023-12-31 21:22:07'),
(177, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2023-12-31 21:23:46', '2023-12-31 21:23:46'),
(178, 10, 14, 'demouser6 cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 14:39:44', '2024-01-01 14:39:44'),
(179, 10, 14, 'demouser6 cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 15:56:21', '2024-01-01 15:56:21'),
(180, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 15:56:21', '2024-01-01 15:56:21'),
(181, 0, 14, 'Deposit successful via Stripe Storefront - USD', 0, '/admin/deposit/done', '2024-01-01 16:00:53', '2024-01-01 16:00:53'),
(182, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 16:01:29', '2024-01-01 16:01:29'),
(183, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 16:01:29', '2024-01-01 16:01:29'),
(184, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 16:33:00', '2024-01-01 16:33:00'),
(185, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 16:33:00', '2024-01-01 16:33:00'),
(186, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 16:35:37', '2024-01-01 16:35:37'),
(187, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 16:35:37', '2024-01-01 16:35:37'),
(188, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 16:37:18', '2024-01-01 16:37:18'),
(189, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 16:38:11', '2024-01-01 16:38:11'),
(190, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 16:38:11', '2024-01-01 16:38:11'),
(191, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 16:39:35', '2024-01-01 16:39:35'),
(192, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 16:40:41', '2024-01-01 16:40:41'),
(193, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 16:40:41', '2024-01-01 16:40:41'),
(194, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:05:34', '2024-01-01 18:05:34'),
(195, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:05:34', '2024-01-01 18:05:34'),
(196, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:06:56', '2024-01-01 18:06:56'),
(197, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:06:56', '2024-01-01 18:06:56'),
(198, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:09:48', '2024-01-01 18:09:48'),
(199, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:09:48', '2024-01-01 18:09:48'),
(200, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:10:23', '2024-01-01 18:10:23'),
(201, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:10:23', '2024-01-01 18:10:23'),
(202, 17, 14, 'demosajib cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:13:20', '2024-01-01 18:13:20'),
(203, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:13:21', '2024-01-01 18:13:21'),
(204, 17, 14, 'demosajib cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:17:26', '2024-01-01 18:17:26'),
(205, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:17:26', '2024-01-01 18:17:26'),
(206, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:21:02', '2024-01-01 18:21:02'),
(207, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:21:02', '2024-01-01 18:21:02'),
(208, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:21:49', '2024-01-01 18:21:49'),
(209, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:21:49', '2024-01-01 18:21:49'),
(210, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:25:20', '2024-01-01 18:25:20'),
(211, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:25:20', '2024-01-01 18:25:20'),
(212, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:39:28', '2024-01-01 18:39:28'),
(213, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:39:28', '2024-01-01 18:39:28'),
(214, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:42:55', '2024-01-01 18:42:55'),
(215, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:42:55', '2024-01-01 18:42:55'),
(216, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:43:34', '2024-01-01 18:43:34'),
(217, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:43:35', '2024-01-01 18:43:35'),
(218, 1, 14, 'demouser cash In from fakeagenttwo', 0, '/admin/cash/in/index', '2024-01-01 18:44:12', '2024-01-01 18:44:12'),
(219, 0, 14, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 18:44:12', '2024-01-01 18:44:12'),
(220, 0, 17, 'New agent member registered', 0, '/admin/user/index', '2024-01-01 19:00:16', '2024-01-01 19:00:16'),
(221, 0, 18, 'New agent member registered', 0, '/admin/user/index', '2024-01-01 19:07:03', '2024-01-01 19:07:03'),
(222, 0, 19, 'New agent member registered', 0, '/admin/user/index', '2024-01-01 19:50:38', '2024-01-01 19:50:38'),
(223, 0, 20, 'New agent member registered', 0, '/admin/user/index', '2024-01-01 20:06:07', '2024-01-01 20:06:07'),
(224, 0, 21, 'New agent member registered', 0, '/admin/user/index', '2024-01-01 20:17:21', '2024-01-01 20:17:21'),
(225, 20, 0, 'New member registered', 0, '/admin/user/index', '2024-01-01 04:26:32', '2024-01-01 04:26:32'),
(226, 0, 22, 'New agent member registered', 0, '/admin/user/index', '2024-01-01 04:30:54', '2024-01-01 04:30:54'),
(227, 0, 22, 'Deposit successful via Stripe Storefront - USD', 0, '/admin/deposit/done', '2024-01-01 05:18:19', '2024-01-01 05:18:19'),
(228, 0, 22, 'New withdraw request from demoagentten', 0, '/agent/login', '2024-01-01 05:24:39', '2024-01-01 05:24:39'),
(229, 1, 22, 'demouser cash In from demoagentten', 0, '/admin/cash/in/index', '2024-01-01 05:56:03', '2024-01-01 05:56:03'),
(230, 0, 22, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 05:56:03', '2024-01-01 05:56:03'),
(231, 1, 22, 'demouser cash In from demoagentten', 0, '/admin/cash/in/index', '2024-01-01 05:58:09', '2024-01-01 05:58:09'),
(232, 0, 22, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 05:58:09', '2024-01-01 05:58:09'),
(233, 1, 22, 'demouser cash In from demoagentten', 0, '/admin/cash/in/index', '2024-01-01 05:59:02', '2024-01-01 05:59:02'),
(234, 0, 22, 'Cash In Commission', 0, '/admin/commission/index', '2024-01-01 05:59:02', '2024-01-01 05:59:02'),
(235, 21, 0, 'New member registered', 0, '/admin/user/index', '2024-01-02 16:36:55', '2024-01-02 16:36:55'),
(236, 0, 23, 'New agent member registered', 0, '/admin/user/index', '2024-01-02 16:55:19', '2024-01-02 16:55:19'),
(237, 1, 0, 'demouser send money to demouser2', 1, '/admin/send/money/index', '2024-01-02 17:07:56', '2024-01-02 17:09:07'),
(238, 1, 0, 'demouser send money to demousertwenty', 0, '/admin/send/money/index', '2024-01-02 18:06:01', '2024-01-02 18:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_password_resets`
--

INSERT INTO `admin_password_resets` (`id`, `email`, `code`, `status`, `created_at`) VALUES
(14, 'admin@test.com', '782343', 1, '2023-10-10 06:26:31'),
(15, 'admin@test.com', '326901', 1, '2023-11-11 08:37:37'),
(16, 'admin@test.com', '272340', 1, '2023-11-11 08:38:17'),
(17, 'admin@test.com', '636482', 1, '2023-11-12 10:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE IF NOT EXISTS `agents` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `country_name` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) DEFAULT 0,
  `balance` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT 1,
  `kyc_data` text DEFAULT NULL,
  `kc` tinyint(1) NOT NULL DEFAULT 0,
  `ec` tinyint(1) NOT NULL DEFAULT 0,
  `sc` tinyint(1) DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL,
  `ver_code_send_at` datetime DEFAULT NULL,
  `ts` tinyint(1) NOT NULL DEFAULT 0,
  `tc` tinyint(1) NOT NULL DEFAULT 0,
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `image`, `firstname`, `lastname`, `username`, `email`, `country_code`, `country_name`, `mobile`, `ref_by`, `balance`, `password`, `address`, `status`, `kyc_data`, `kc`, `ec`, `sc`, `ver_code`, `ver_code_send_at`, `ts`, `tc`, `tsc`, `ban_reason`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, NULL, 'demo', 'a', 'demoa', 'demoa@gmail.com', 'BD', 'Bangladesh', '8801765765767', 0, 87.0000, '$2y$10$5IOG8V3cA7zqTyhW5hUI1OAvjft5bM9Pzr0w4Oh2vv6t4kCQbzO1.', NULL, 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"demoa\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"12345678\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/23\\/6586d79229af41703335826.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"445456345456\"}]', 1, 1, 1, '832020', '2023-12-23 18:49:18', 0, 1, NULL, NULL, NULL, '2023-12-09 23:38:28', '2023-12-24 02:54:01'),
(4, NULL, 'Demo', 'Agent', 'demoagent', 'demoagent@demo.com', 'BD', 'Bangladesh', '8809212345678', 0, 11.0000, '$2y$10$swQ2S8UWkWbbTFnok80Y7uzwkFr2YQsqQTG6BE91rr9bkoa12hWQO', '{\"city\":\"Dhaka\",\"state\":\"Dhaka\",\"zip\":\"1219\",\"country\":\"Bangladesh\"}', 1, NULL, 0, 1, 0, '914594', '2023-12-17 12:39:19', 0, 1, NULL, NULL, NULL, '2023-12-10 00:52:20', '2023-12-17 20:39:48'),
(9, NULL, 'DemoAgent', 'DemoAgent', 'demoagenttwo', 'demoagenttwo@gmail.com', 'AF', 'Afghanistan', '93880176382768764', 0, 400.0000, '$2y$10$9dKspYvi4GF03Uq0qXEgru9rFIm47TAd62bd2OEUwZGasQ2zztJ/S', '{\"city\":\"Dhaka\",\"state\":\"Dhaka\",\"zip\":\"1219\",\"country\":\"Afghanistan\"}', 1, NULL, 1, 1, 1, '232909', '2023-12-11 13:15:43', 0, 1, NULL, NULL, NULL, '2023-12-11 21:00:35', '2024-01-01 20:21:33'),
(11, NULL, 'DemoAgentthree', 'DemoAgent', 'demoagentthree', 'demoagentthree@gmail.com', 'BD', 'Bangladesh', '88093939393938808808809346565646456', 0, 78.0000, '$2y$10$MDBwEvkxdTAaseE6RTIlCerv6NS3mQ01JZbYOuP54igAFdBCNpmqu', '{\"city\":\"Dhaka\",\"state\":\"khilgaon\",\"zip\":\"1219\",\"country\":\"Bangladesh\"}', 1, NULL, 1, 1, 1, '624453', '2023-12-12 15:48:56', 1, 0, 'WYU656JYGDANJGNN', NULL, NULL, '2023-12-11 22:27:47', '2023-12-24 02:47:06'),
(12, NULL, 'demoagentfour', 'Agent', 'demoagentfour', 'demoagentfour@gmail.com', 'AF', 'Afghanistan', '93880177474747474', 0, 400.0000, '$2y$10$Vf2ShVxxlc90HYr3i/KOduac3rTuwALOBKgwBQ1TSTVXOtGQHkgk.', '{\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Afghanistan\"}', 1, NULL, 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, '2023-12-12 21:30:55', '2023-12-30 17:01:52'),
(13, NULL, 'fake', 'agent', 'fakeagent', 'fake@gmail.com', 'BD', 'Bangladesh', '88056489797897', 0, 500.0000, '$2y$10$2h.Ip9BdPqiPUt9zHGqF2uWtSyLN17kLZ/qhZ9itBNXNBajTppDsy', NULL, 0, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"Fake Agent\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"123456789\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/65795ff328d121702453235.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"123456789\"}]', 1, 1, 1, NULL, NULL, 1, 1, 'RTWAJQVKAQ2V5BDD', 'late', NULL, '2023-12-13 20:55:03', '2023-12-13 22:04:32'),
(14, '65899ae546bc71703516901.png', 'fakeagent', 'two', 'fakeagenttwo', 'fakeagenttwo@gmail.com', 'BD', 'Bangladesh', '8807861187564', 0, 10.0000, '$2y$10$z2ueJzn/eWRJrseNobCJP.hxWoD86WQLAY5GF9Ho23HgT.wqQEKfy', '{\"state\":null,\"zip\":null,\"city\":null}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"Fake agent two\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"dfgddsfg\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/18\\/65801cf0342a11702894832.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"Demo driving license\"}]', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-13 23:07:53', '2024-01-01 18:44:12'),
(15, NULL, 'Shahnewaj', 'Shajib', 'shahnewaj', 'sajib@gmail.com', 'BD', 'Bangladesh', '880875765765', 0, 0.0000, '$2y$10$yf67HRex./1hqQWdx0OJre0uw/eplq9HdJ1n.x30wFJ/1qIlV38jC', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-26 02:59:05', '2023-12-26 02:59:05'),
(16, NULL, 'Md Nazrul', 'Islam', 'nazrulislam', 'nazrul@gmail.com', 'AF', 'Afghanistan', '9335612345678', 0, 0.0000, '$2y$10$GLeY2hYS08G/9EvDOrRb.uvNNnhwDNWDvpOOMddNGkHot/IXVAU/a', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-29 10:10:48', '2024-01-02 16:53:23'),
(18, NULL, 'demoagent', 'shahnewaj', 'demoagentsajib', 'sajibsust99@gmail.com', 'BD', 'Bangladesh', '8801779435375', 0, 0.0000, '$2y$10$uHO9Cntd.hGbIuKZXBTJJeCeIxqRoNEK9l6vapoDsTHBrmCNHjrHW', NULL, 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"shahnewaj sajib\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"12345678\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2024\\/01\\/01\\/65929f4146ad41704107841.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"12345678\"}]', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2024-01-01 19:07:03', '2024-01-01 19:43:51'),
(20, NULL, 'demoagent', 'sajib', 'demoagentsajin', 'demoagentsajib@gmail.com', 'BD', 'Bangladesh', '8808801779435375', 0, 0.0000, '$2y$10$zO8woyc6xQS4wqzFxehXy.eQtCtjW6Ja49O73jgbwKmyEP.877rma', NULL, 1, NULL, 0, 0, 0, '139722', '2024-01-01 12:14:36', 0, 1, NULL, NULL, NULL, '2024-01-01 20:06:07', '2024-01-01 20:14:36'),
(22, '6593a791741b81704175505.jpg', 'demoagent', 'ten', 'demoagentten', 'demoagent@gmail.com', 'BD', 'Bangladesh', '8806546545665', 0, 800.0000, '$2y$10$6YwUnUl0i4mMdVE7QZdxp./FU1suiq4.2Hjw1oD.bys9OLkj3Geoq', '{\"state\":null,\"zip\":null,\"city\":null}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"demoagentten\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"6546565465465\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2024\\/01\\/01\\/65929ddb7a4271704107483.jpg\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"354654654654654\"}]', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2024-01-01 04:30:54', '2024-01-02 14:05:05'),
(23, NULL, 'demoagent', 'thirty', 'demoagentthirty', 'demoagentthirty@gmail.com', 'BD', 'Bangladesh', '88017794353656765', 0, 0.0000, '$2y$10$i3QzmqATF7g9VsHyUw06dO0ZDDvWYycxjlTJ9cTts29xNxhashe3q', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2024-01-02 16:55:19', '2024-01-02 16:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `agent_password_resets`
--

CREATE TABLE IF NOT EXISTS `agent_password_resets` (
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent_password_resets`
--

INSERT INTO `agent_password_resets` (`email`, `code`, `created_at`) VALUES
('demoagentten@gmail.com', '818622', '2024-01-01 20:52:34'),
('nazrul@gmail.com', '544830', '2024-01-02 16:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `cash_ins`
--

CREATE TABLE IF NOT EXISTS `cash_ins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `agent_id` int(10) NOT NULL DEFAULT 0,
  `user_amount` int(10) DEFAULT NULL,
  `agent_amount` int(10) DEFAULT NULL,
  `charge` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cash_ins`
--

INSERT INTO `cash_ins` (`id`, `user_id`, `agent_id`, `user_amount`, `agent_amount`, `charge`, `created_at`, `updated_at`) VALUES
(3, 12, 14, 83, 100, 17, '2023-12-23 21:37:54', '2023-12-31 15:56:07'),
(6, 12, 14, 7, 20, 13, '2023-12-23 23:29:32', '2023-12-23 23:29:32'),
(7, 11, 3, 0, 13, 13, '2023-12-24 02:54:01', '2023-12-24 02:54:01'),
(8, 1, 14, 2, 15, 13, '2023-12-26 20:06:31', '2023-12-31 15:56:14'),
(9, 12, 14, 0, 13, 13, '2023-12-29 07:46:14', '2023-12-31 15:56:17'),
(10, 12, 14, 7, 20, 13, '2023-12-29 07:46:50', '2023-12-31 15:56:39'),
(11, 1, 14, 7, 20, 13, '2023-12-31 20:54:41', '2023-12-31 20:54:41'),
(12, 1, 14, 7, 20, 13, '2023-12-31 20:55:10', '2023-12-31 20:55:10'),
(13, 1, 14, 7, 20, 13, '2023-12-31 20:56:10', '2023-12-31 20:56:10'),
(14, 1, 14, 7, 20, 13, '2023-12-31 20:57:37', '2023-12-31 20:57:37'),
(15, 1, 14, 7, 20, 13, '2023-12-31 20:58:53', '2023-12-31 20:58:53'),
(16, 1, 14, 7, 20, 13, '2023-12-31 20:59:37', '2023-12-31 20:59:37'),
(17, 1, 14, 4, 17, 13, '2023-12-31 21:00:07', '2023-12-31 21:00:07'),
(18, 1, 14, 0, 13, 13, '2023-12-31 21:00:50', '2023-12-31 21:00:50'),
(19, 1, 14, 0, 13, 13, '2023-12-31 21:01:21', '2023-12-31 21:01:21'),
(20, 1, 14, 0, 13, 13, '2023-12-31 21:01:58', '2023-12-31 21:01:58'),
(21, 1, 14, 7, 20, 13, '2023-12-31 21:05:18', '2023-12-31 21:05:18'),
(22, 1, 14, 7, 20, 13, '2023-12-31 21:06:07', '2023-12-31 21:06:07'),
(23, 1, 14, 7, 20, 13, '2023-12-31 21:09:57', '2023-12-31 21:09:57'),
(24, 1, 14, 7, 20, 13, '2023-12-31 21:13:39', '2023-12-31 21:13:39'),
(25, 1, 14, 7, 20, 13, '2023-12-31 21:15:09', '2023-12-31 21:15:09'),
(26, 1, 14, 7, 20, 13, '2023-12-31 21:15:36', '2023-12-31 21:15:36'),
(27, 1, 14, 7, 20, 13, '2023-12-31 21:16:01', '2023-12-31 21:16:01'),
(28, 1, 14, 7, 20, 13, '2023-12-31 21:17:00', '2023-12-31 21:17:00'),
(29, 1, 14, 7, 20, 13, '2023-12-31 21:17:57', '2023-12-31 21:17:57'),
(30, 1, 14, 7, 20, 13, '2023-12-31 21:18:08', '2023-12-31 21:18:08'),
(31, 1, 14, 7, 20, 13, '2023-12-31 21:22:07', '2023-12-31 21:22:07'),
(32, 1, 14, 7, 20, 13, '2023-12-31 21:23:46', '2023-12-31 21:23:46'),
(33, 10, 14, 7, 20, 13, '2024-01-01 14:39:44', '2024-01-01 14:39:44'),
(34, 10, 14, 7, 20, 13, '2024-01-01 15:56:21', '2024-01-01 15:56:21'),
(35, 1, 14, 36, 50, 15, '2024-01-01 16:01:29', '2024-01-01 16:01:29'),
(36, 1, 14, 7, 20, 13, '2024-01-01 16:33:00', '2024-01-01 16:33:00'),
(37, 1, 14, 7, 20, 13, '2024-01-01 16:35:37', '2024-01-01 16:35:37'),
(38, 1, 14, 7, 20, 13, '2024-01-01 16:37:18', '2024-01-01 16:37:18'),
(39, 1, 14, 7, 20, 13, '2024-01-01 16:38:11', '2024-01-01 16:38:11'),
(40, 1, 14, 2, 15, 13, '2024-01-01 16:39:35', '2024-01-01 16:39:35'),
(41, 1, 14, 2, 15, 13, '2024-01-01 16:40:41', '2024-01-01 16:40:41'),
(42, 1, 14, 5, 18, 13, '2024-01-01 18:05:34', '2024-01-01 18:05:34'),
(43, 1, 14, 7, 20, 13, '2024-01-01 18:06:56', '2024-01-01 18:06:56'),
(44, 1, 14, 2, 15, 13, '2024-01-01 18:09:48', '2024-01-01 18:09:48'),
(45, 1, 14, 2, 15, 13, '2024-01-01 18:10:23', '2024-01-01 18:10:23'),
(46, 17, 14, 82, 99, 17, '2024-01-01 18:13:21', '2024-01-01 18:13:21'),
(47, 17, 14, 83, 100, 17, '2024-01-01 18:17:26', '2024-01-01 18:17:26'),
(48, 1, 14, 83, 100, 17, '2024-01-01 18:21:02', '2024-01-01 18:21:02'),
(49, 1, 14, 83, 100, 17, '2024-01-01 18:21:49', '2024-01-01 18:21:49'),
(50, 1, 14, 83, 100, 17, '2024-01-01 18:25:20', '2024-01-01 18:25:20'),
(51, 1, 14, 36, 50, 15, '2024-01-01 18:39:28', '2024-01-01 18:39:28'),
(52, 1, 14, 7, 20, 13, '2024-01-01 18:42:55', '2024-01-01 18:42:55'),
(53, 1, 14, 7, 20, 13, '2024-01-01 18:43:35', '2024-01-01 18:43:35'),
(54, 1, 14, 83, 100, 17, '2024-01-01 18:44:12', '2024-01-01 18:44:12'),
(55, 1, 22, 7, 20, 13, '2024-01-01 05:56:03', '2024-01-01 05:56:03'),
(56, 1, 22, 83, 100, 17, '2024-01-01 05:58:09', '2024-01-01 05:58:09'),
(57, 1, 22, 83, 100, 17, '2024-01-01 05:59:02', '2024-01-01 05:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `cash_outs`
--

CREATE TABLE IF NOT EXISTS `cash_outs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `agent_id` int(10) NOT NULL DEFAULT 0,
  `user_amount` int(10) DEFAULT NULL,
  `agent_amount` int(10) DEFAULT NULL,
  `charge` int(10) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cash_outs`
--

INSERT INTO `cash_outs` (`id`, `user_id`, `agent_id`, `user_amount`, `agent_amount`, `charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 12, 14, 117, 100, 17, 1, '2023-12-23 23:48:48', '2023-12-31 16:56:14'),
(2, 12, 14, 117, 100, 17, 0, '2023-12-23 23:49:41', '2023-12-23 23:49:41'),
(3, 12, 14, 117, 100, 17, 1, '2023-12-23 23:50:30', '2024-01-01 06:05:34'),
(4, 12, 14, 29, 16, 13, 1, '2023-12-24 19:09:57', '2023-12-31 17:17:08'),
(5, 12, 14, 33, 20, 13, 1, '2023-12-25 23:00:15', '2024-01-02 14:08:51'),
(6, 1, 14, 117, 100, 17, 1, '2023-12-30 15:22:41', '2023-12-31 16:56:20'),
(7, 12, 12, 54, 40, 14, 0, '2023-12-30 17:01:52', '2023-12-30 17:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE IF NOT EXISTS `charges` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cash_out_charge_fixed` decimal(28,8) DEFAULT NULL,
  `cash_in_charge_fixed` decimal(28,8) DEFAULT NULL,
  `cash_out_commission` decimal(28,8) DEFAULT NULL,
  `send_money_charge_fixed` decimal(28,8) DEFAULT NULL,
  `cash_out_charge_percentage` decimal(28,8) DEFAULT NULL,
  `cash_in_charge_percentage` decimal(28,8) DEFAULT NULL,
  `send_money_charge_percentage` decimal(28,8) DEFAULT NULL,
  `cash_in_commission` decimal(28,8) DEFAULT NULL,
  `cash_out_max` decimal(28,8) DEFAULT NULL,
  `cash_out_min` decimal(28,8) DEFAULT NULL,
  `cash_in_min` decimal(28,8) DEFAULT NULL,
  `cash_in_max` decimal(28,8) DEFAULT NULL,
  `send_money_min` decimal(28,8) DEFAULT NULL,
  `send_money_max` decimal(28,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `cash_out_charge_fixed`, `cash_in_charge_fixed`, `cash_out_commission`, `send_money_charge_fixed`, `cash_out_charge_percentage`, `cash_in_charge_percentage`, `send_money_charge_percentage`, `cash_in_commission`, `cash_out_max`, `cash_out_min`, `cash_in_min`, `cash_in_max`, `send_money_min`, `send_money_max`, `created_at`, `updated_at`) VALUES
(5, 12.00000000, 12.00000000, 2.00000000, 5.00000000, 5.00000000, 5.00000000, 5.00000000, 2.00000000, 10000.00000000, 13.00000000, 13.00000000, 10000.00000000, 10.00000000, 10000.00000000, NULL, '2023-12-24 03:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE IF NOT EXISTS `commissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL DEFAULT 0,
  `commission` decimal(28,8) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `agent_id`, `commission`, `type`, `created_at`, `updated_at`) VALUES
(1, 14, 2.00000000, 'CashIn', '2023-12-23 21:37:54', '2023-12-23 21:37:54'),
(2, 14, 0.00000000, 'CashIn', '2023-12-23 21:39:26', '2023-12-23 21:39:26'),
(3, 14, 0.00000000, 'CashIn', '2023-12-23 22:35:19', '2023-12-23 22:35:19'),
(4, 14, 0.00000000, 'CashIn', '2023-12-23 23:29:32', '2023-12-23 23:29:32'),
(5, 14, 2.00000000, 'CashOut', '2023-12-23 23:49:41', '2023-12-23 23:49:41'),
(6, 14, 2.00000000, 'CashOut', '2023-12-23 23:50:30', '2023-12-23 23:50:30'),
(7, 3, 0.00000000, 'CashIn', '2023-12-24 02:54:01', '2023-12-24 02:54:01'),
(8, 14, 0.00000000, 'CashOut', '2023-12-24 19:09:57', '2023-12-24 19:09:57'),
(9, 14, 0.00000000, 'CashOut', '2023-12-25 23:00:15', '2023-12-25 23:00:15'),
(10, 14, 0.00000000, 'CashIn', '2023-12-26 20:06:31', '2023-12-26 20:06:31'),
(11, 14, 0.00000000, 'CashIn', '2023-12-29 07:46:14', '2023-12-29 07:46:14'),
(12, 14, 0.00000000, 'CashIn', '2023-12-29 07:46:50', '2023-12-29 07:46:50'),
(13, 14, 2.00000000, 'CashOut', '2023-12-30 15:22:41', '2023-12-30 15:22:41'),
(14, 12, 1.00000000, 'CashOut', '2023-12-30 17:01:52', '2023-12-30 17:01:52'),
(15, 14, 0.00000000, 'CashIn', '2023-12-31 20:55:10', '2023-12-31 20:55:10'),
(16, 14, 0.00000000, 'CashIn', '2023-12-31 20:59:37', '2023-12-31 20:59:37'),
(17, 14, 0.00000000, 'CashIn', '2023-12-31 21:00:07', '2023-12-31 21:00:07'),
(18, 14, 0.36000000, 'Cash In', '2024-01-01 18:05:34', '2024-01-01 18:05:34'),
(19, 14, 0.40000000, 'Cash In', '2024-01-01 18:06:56', '2024-01-01 18:06:56'),
(20, 14, 0.30000000, 'Cash In', '2024-01-01 18:09:48', '2024-01-01 18:09:48'),
(21, 14, 0.30000000, 'Cash In', '2024-01-01 18:10:23', '2024-01-01 18:10:23'),
(22, 14, 1.98000000, 'Cash In', '2024-01-01 18:13:21', '2024-01-01 18:13:21'),
(23, 14, 2.00000000, 'Cash In', '2024-01-01 18:17:26', '2024-01-01 18:17:26'),
(24, 14, 2.00000000, 'Cash In', '2024-01-01 18:21:02', '2024-01-01 18:21:02'),
(25, 14, 2.00000000, 'Cash In', '2024-01-01 18:21:49', '2024-01-01 18:21:49'),
(26, 14, 2.00000000, 'Cash In', '2024-01-01 18:25:20', '2024-01-01 18:25:20'),
(27, 14, 1.00000000, 'Cash In', '2024-01-01 18:39:28', '2024-01-01 18:39:28'),
(28, 14, 0.40000000, 'Cash In', '2024-01-01 18:42:55', '2024-01-01 18:42:55'),
(29, 14, 0.40000000, 'Cash In', '2024-01-01 18:43:35', '2024-01-01 18:43:35'),
(30, 14, 2.00000000, 'Cash In', '2024-01-01 18:44:12', '2024-01-01 18:44:12'),
(31, 22, 0.40000000, 'Cash In', '2024-01-01 05:56:03', '2024-01-01 05:56:03'),
(32, 22, 2.00000000, 'Cash In', '2024-01-01 05:58:09', '2024-01-01 05:58:09'),
(33, 22, 2.00000000, 'Cash In', '2024-01-01 05:59:02', '2024-01-01 05:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE IF NOT EXISTS `commission_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `to_id` int(10) NOT NULL DEFAULT 0,
  `from_id` int(10) NOT NULL DEFAULT 0,
  `level` int(10) DEFAULT NULL,
  `post_balance` int(10) DEFAULT NULL,
  `commission_amount` int(10) DEFAULT NULL,
  `trx_amo` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `percent` decimal(5,2) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commission_logs`
--

INSERT INTO `commission_logs` (`id`, `to_id`, `from_id`, `level`, `post_balance`, `commission_amount`, `trx_amo`, `title`, `type`, `percent`, `trx`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 1, 44, 10, 100, 'Level 1 referral commission from demouser2', 'cashin', 10.00, 'RNFP31UQCHSP', '2024-01-01 18:21:49', NULL),
(2, 3, 3, 2, 111, 8, 100, 'Level 2 referral commission from demouser3', 'cashin', 8.00, '8FJ1W7KTABUU', '2024-01-01 18:21:49', NULL),
(3, 4, 4, 3, 195, 6, 100, 'Level 3 referral commission from demouser4', 'cashin', 6.00, 'B733VNHT4B8Y', '2024-01-01 18:21:49', NULL),
(4, 5, 5, 4, 89, 3, 100, 'Level 4 referral commission from demouser5', 'cashin', 3.00, '569N7Z873UCT', '2024-01-01 18:21:49', NULL),
(5, 2, 1, 1, 54, 10, 100, 'Level 1 referral commission from demouser2', 'cashin', 10.00, 'OQ7KJYGYEKST', '2024-01-01 18:25:20', NULL),
(6, 3, 2, 2, 119, 8, 100, 'Level 2 referral commission from demouser3', 'cashin', 8.00, '8ZS6JHXMANB6', '2024-01-01 18:25:20', NULL),
(7, 4, 3, 3, 201, 6, 100, 'Level 3 referral commission from demouser4', 'cashin', 6.00, 'H9Z72BAEOQOR', '2024-01-01 18:25:20', NULL),
(8, 5, 4, 4, 92, 3, 100, 'Level 4 referral commission from demouser5', 'cashin', 3.00, '9A6MBJTVT8TY', '2024-01-01 18:25:20', NULL),
(9, 2, 1, 1, 64, 10, 100, 'Level 1 referral commission from demouser2', 'cashin', 10.00, 'T1D2UOVJPE39', '2024-01-01 18:44:12', NULL),
(10, 3, 2, 2, 127, 8, 100, 'Level 2 referral commission from demouser3', 'cashin', 8.00, 'Y7YUG3F5TV59', '2024-01-01 18:44:12', NULL),
(11, 4, 3, 3, 207, 6, 100, 'Level 3 referral commission from demouser4', 'cashin', 6.00, 'PSVSTRYGFGRT', '2024-01-01 18:44:12', NULL),
(12, 5, 4, 4, 95, 3, 100, 'Level 4 referral commission from demouser5', 'cashin', 3.00, 'P7DWHPH9DROJ', '2024-01-01 18:44:12', NULL),
(13, 2, 1, 1, 74, 10, 100, 'Level 1 referral commission from demouser2', 'cashin', 10.00, 'EG3BTDP7RD8S', '2024-01-01 05:58:09', NULL),
(14, 3, 2, 2, 135, 8, 100, 'Level 2 referral commission from demouser3', 'cashin', 8.00, 'F3F7EWGGHHMR', '2024-01-01 05:58:09', NULL),
(15, 4, 3, 3, 213, 6, 100, 'Level 3 referral commission from demouser4', 'cashin', 6.00, 'PSF1ZM8U9197', '2024-01-01 05:58:09', NULL),
(16, 5, 4, 4, 98, 3, 100, 'Level 4 referral commission from demouser5', 'cashin', 3.00, '73M85SCF17JF', '2024-01-01 05:58:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dsafasdf', 'demo@demo.com', 'sadfsadf', 'sdfsdfsdf', 0, '2023-12-06 10:13:47', '2023-12-06 10:13:47'),
(3, 'Sherrinford Willum', 'demouser@gmail.com', 'Demo Contact Test', 'Demo Contact Mesage', 1, '2023-12-06 11:27:32', '2023-12-06 11:55:42'),
(4, 'demo u', 'demo@gmail.com', 'test', 'test message', 0, '2023-12-27 04:34:35', '2023-12-27 04:34:35'),
(5, 'Nogod', 'DemoAgentthree@gmail.com', 'testtwo', 'testtwo', 1, '2023-12-28 17:34:10', '2023-12-28 17:34:48'),
(6, 'Shahnewaj Sajib', 'sajibsust99@gmail.com', 'E-com', 'test', 0, '2023-12-28 13:38:24', '2023-12-28 13:38:24');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE IF NOT EXISTS `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `payment_try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `agent_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `payment_try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(27, 0, 111, 10.00000000, 'USD', 1.10000000, 1.00000000, 11.10000000, NULL, '0', '', 'JPRP82MFX6SN', 0, 1, 0, NULL, '2023-11-19 12:03:44', '2023-11-19 12:09:54'),
(28, 0, 1000, 10.00000000, 'USD', 1.50000000, 1.00000000, 11.50000000, '[{\"name\":\"Trx Number\",\"type\":\"text\",\"value\":\"123456\"},{\"name\":\"Gender\",\"type\":\"select\",\"value\":\"Mail\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/11\\/19\\/655a053275c441700398386.png\"}]', '0', '', '6396Z4JQCFQ4', 0, 1, 0, 'De bari mathai kop, Litudar joy hok', '2023-11-19 12:23:37', '2023-11-29 12:11:04'),
(29, 0, 111, 215.00000000, 'USD', 3.15000000, 1.00000000, 218.15000000, NULL, '0', '', 'VU57YWFMVYOM', 0, 1, 0, NULL, '2023-12-04 18:58:47', '2023-12-04 18:59:10'),
(30, 0, 1000, 120.00000000, 'USD', 7.00000000, 1.00000000, 127.00000000, '[{\"name\":\"Trx Number\",\"type\":\"text\",\"value\":\"23345566\"},{\"name\":\"Gender\",\"type\":\"select\",\"value\":\"Mail\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/10\\/65755193c41ed1702187411.png\"}]', '0', '', '1ZJJK6GQQJO9', 0, 2, 0, NULL, '2023-12-10 19:49:56', '2023-12-10 19:50:11'),
(31, 0, 1000, 11.00000000, 'USD', 1.55000000, 1.00000000, 12.55000000, NULL, '0', '', '2HK7XCK23RMA', 0, 0, 0, NULL, '2023-12-10 19:55:56', '2023-12-10 19:55:56'),
(77, 14, 111, 1000.00000000, 'USD', 11.00000000, 1.00000000, 1011.00000000, NULL, '0', '', 'A8JR16T9X872', 0, 1, 0, NULL, '2023-12-13 23:26:34', '2023-12-13 23:27:03'),
(78, 14, 1002, 500.00000000, 'USD', 6.00000000, 1.00000000, 506.00000000, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"Fake Agent\"},{\"name\":\"email\",\"type\":\"text\",\"value\":\"fake@gmail.com\"},{\"name\":\"Trx Number\",\"type\":\"text\",\"value\":\"65467987987987987\"}]', '0', '', 'WMSG6MKOYOPY', 0, 2, 0, NULL, '2023-12-13 23:28:36', '2023-12-13 23:28:54'),
(79, 14, 111, 100.00000000, 'USD', 2.00000000, 1.00000000, 102.00000000, NULL, '0', '', '8NBS3S1G2ERM', 0, 1, 0, NULL, '2023-12-14 01:28:35', '2023-12-14 01:29:07'),
(80, 14, 1002, 50.00000000, 'USD', 1.50000000, 1.00000000, 51.50000000, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"demoagentthree\"},{\"name\":\"email\",\"type\":\"text\",\"value\":\"demoagent@d.c\"},{\"name\":\"Trx Number\",\"type\":\"text\",\"value\":\"65467987987987987\"}]', '0', '', 'QU75KF81USRY', 0, 2, 0, NULL, '2023-12-14 01:41:24', '2023-12-14 01:41:38'),
(81, 14, 1001, 20.00000000, 'USD', 1.20000000, 1.00000000, 21.20000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"demofive\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"ghfdghdhgd\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/65799911841bb1702467857.png\"}]', '0', '', 'N8EDWO3BNXKU', 0, 2, 0, NULL, '2023-12-14 01:44:06', '2023-12-14 01:44:17'),
(82, 14, 1001, 11.00000000, 'USD', 1.11000000, 1.00000000, 12.11000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"demofive\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"785872\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/65799c641f8381702468708.png\"}]', '0', '', '1NMA876OZKP8', 0, 2, 0, NULL, '2023-12-14 01:51:46', '2023-12-14 01:58:28'),
(83, 14, 1001, 100.00000000, 'USD', 2.00000000, 1.00000000, 102.00000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"demofive\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"654654665465\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/65799dcf08cf21702469071.png\"}]', '0', '', 'HSOPY5NENMGA', 0, 2, 0, NULL, '2023-12-14 02:04:19', '2023-12-14 02:04:31'),
(84, 14, 111, 100.00000000, 'USD', 2.00000000, 1.00000000, 102.00000000, NULL, '0', '', '6GJYHO3KBJMY', 0, 1, 0, NULL, '2023-12-14 02:26:06', '2023-12-14 02:26:27'),
(85, 14, 1001, 50.00000000, 'USD', 1.50000000, 1.00000000, 51.50000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"23112\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"2121\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/6579a317615561702470423.png\"}]', '0', '', '4URXJOEYB746', 0, 1, 0, NULL, '2023-12-14 02:26:50', '2023-12-14 02:27:46'),
(86, 14, 1001, 18.00000000, 'USD', 1.18000000, 1.00000000, 19.18000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"sajib\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"sajib\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/14\\/657aa3255eeaa1702535973.png\"}]', '0', '', 'J54M3ZRJHQYZ', 0, 1, 0, NULL, '2023-12-14 20:39:16', '2023-12-14 20:40:11'),
(87, 0, 111, 500.00000000, 'USD', 6.00000000, 1.00000000, 506.00000000, NULL, '0', '', '2P7GBU9FJWUV', 0, 1, 0, NULL, '2023-12-15 19:04:28', '2023-12-15 19:04:58'),
(88, 14, 109, 11.00000000, 'CAD', 1.11000000, 1.37000000, 16.59070000, NULL, '0', '', 'UOHVJGK8YEPK', 0, 0, 0, NULL, '2023-12-17 23:10:01', '2023-12-17 23:10:01'),
(89, 14, 1001, 11.00000000, 'USD', 1.11000000, 1.00000000, 12.11000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"erwtywerytw\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"eywtywy\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/17\\/657ebb5f1aac81702804319.png\"}]', '0', '', 'DR1JTM1CGQ6N', 0, 1, 0, NULL, '2023-12-17 23:10:59', '2023-12-17 23:21:55'),
(90, 14, 109, 10.00000000, 'CAD', 1.10000000, 1.37000000, 15.20700000, NULL, '0', '', 'O1Y9XYRPCZDT', 0, 0, 0, NULL, '2023-12-18 21:45:17', '2023-12-18 21:45:17'),
(91, 14, 111, 90.00000000, 'USD', 1.90000000, 1.00000000, 91.90000000, NULL, '0', '', '522OR21S391Y', 0, 1, 0, NULL, '2023-12-18 23:31:12', '2023-12-18 23:32:19'),
(92, 14, 1000, 500.00000000, 'USD', 26.00000000, 1.00000000, 526.00000000, '[{\"name\":\"Trx Number\",\"type\":\"text\",\"value\":\"test for the manual gateway\"},{\"name\":\"Gender\",\"type\":\"select\",\"value\":\"Mail\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/18\\/6580162b70dff1702893099.png\"}]', '0', '', 'HS6KD8ATVETM', 0, 1, 0, NULL, '2023-12-18 23:51:11', '2023-12-19 00:00:59'),
(93, 0, 111, 500.00000000, 'USD', 6.00000000, 1.00000000, 506.00000000, NULL, '0', '', 'AA9WFT8PSDVF', 0, 1, 0, NULL, '2023-12-20 02:34:15', '2023-12-20 02:34:58'),
(94, 0, 111, 100.00000000, 'USD', 2.00000000, 1.00000000, 102.00000000, NULL, '0', '', 'N3GOYC7DQKOR', 0, 1, 0, NULL, '2023-12-25 23:17:02', '2023-12-25 23:39:54'),
(95, 0, 1002, 11.00000000, 'USD', 1.11000000, 1.00000000, 12.11000000, NULL, '0', '', 'BP34U6HCXK4T', 0, 0, 0, NULL, '2023-12-25 23:45:51', '2023-12-25 23:45:51'),
(96, 0, 1001, 11.00000000, 'USD', 1.11000000, 1.00000000, 12.11000000, NULL, '0', '', '97E26QUQCAB5', 0, 0, 0, NULL, '2023-12-25 23:46:41', '2023-12-25 23:46:41'),
(97, 0, 111, 15.00000000, 'USD', 1.15000000, 1.00000000, 16.15000000, NULL, '0', '', '73U3FY9SOPMZ', 0, 0, 0, NULL, '2023-12-25 23:47:54', '2023-12-25 23:47:54'),
(98, 0, 1001, 15.00000000, 'USD', 1.15000000, 1.00000000, 16.15000000, NULL, '0', '', 'E3DN83SNBCZ1', 0, 0, 0, NULL, '2023-12-25 23:49:41', '2023-12-25 23:49:41'),
(99, 0, 1001, 15.00000000, 'USD', 1.15000000, 1.00000000, 16.15000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"demo\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"demotwo\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/25\\/6589523d091d21703498301.png\"}]', '0', '', 'OYJRF8A9UR6Y', 0, 2, 0, NULL, '2023-12-25 23:57:42', '2023-12-25 23:58:21'),
(100, 14, 111, 50.00000000, 'USD', 1.50000000, 1.00000000, 51.50000000, NULL, '0', '', 'VSOPEYBVNAGK', 0, 1, 0, NULL, '2023-12-29 07:52:39', '2023-12-29 07:53:20'),
(101, 14, 109, 11.00000000, 'CAD', 1.11000000, 1.37000000, 16.59070000, NULL, '0', '', '1OX9VPF7MJZP', 0, 0, 0, NULL, '2023-12-29 07:54:02', '2023-12-29 07:54:02'),
(102, 14, 111, 11.00000000, 'USD', 1.11000000, 1.00000000, 12.11000000, NULL, '0', '', '4RZZAN4RDJMW', 0, 0, 0, NULL, '2023-12-29 07:58:10', '2023-12-29 07:58:10'),
(103, 14, 111, 15.00000000, 'USD', 1.15000000, 1.00000000, 16.15000000, NULL, '0', '', '3DW8ZQVOSJUG', 0, 0, 0, NULL, '2023-12-29 08:03:19', '2023-12-29 08:03:19'),
(104, 14, 109, 15.00000000, 'CAD', 1.15000000, 1.37000000, 22.12550000, NULL, '0', '', 'XAGT5F48B1CH', 0, 0, 0, NULL, '2023-12-29 08:03:30', '2023-12-29 08:03:30'),
(105, 14, 110, 15.00000000, 'INR', 1.15000000, 1.00000000, 16.15000000, NULL, '0', 'order_NICQXVYoJzSVqX', 'OD562FQYGNPK', 0, 0, 0, NULL, '2023-12-29 08:07:11', '2023-12-29 08:07:13'),
(106, 14, 1001, 15.00000000, 'USD', 1.15000000, 1.00000000, 16.15000000, '[{\"name\":\"Demo\",\"type\":\"text\",\"value\":\"demo\"},{\"name\":\"Demo two\",\"type\":\"textarea\",\"value\":\"demo\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/29\\/658ed36def6fb1703859053.png\"}]', '0', '', '4DQQMSOZ53C4', 0, 2, 0, NULL, '2023-12-29 08:07:43', '2023-12-29 08:10:54'),
(107, 14, 110, 20.00000000, 'INR', 1.20000000, 1.00000000, 21.20000000, NULL, '0', 'order_NICyGiNtWQHMVZ', 'P8N6VAJHA4VB', 0, 0, 0, NULL, '2023-12-29 08:39:08', '2023-12-29 08:39:09'),
(108, 14, 111, 100.00000000, 'USD', 2.00000000, 1.00000000, 102.00000000, NULL, '0', '', 'O9WP7VKDY4WK', 0, 0, 0, NULL, '2023-12-30 15:15:51', '2023-12-30 15:15:51'),
(109, 0, 109, 15.00000000, 'CAD', 1.15000000, 1.37000000, 22.12550000, NULL, '0', '', 'FKZUBFAO9EYB', 0, 0, 0, NULL, '2023-12-30 17:23:24', '2023-12-30 17:23:24'),
(110, 0, 111, 15.00000000, 'USD', 1.15000000, 1.00000000, 16.15000000, NULL, '0', '', 'DSP7QBP6CH5E', 0, 0, 0, NULL, '2023-12-30 17:26:58', '2023-12-30 17:26:58'),
(111, 0, 110, 15.00000000, 'INR', 1.15000000, 1.00000000, 16.15000000, NULL, '0', 'order_NIVWCsV71gURxQ', 'X8O21ZZ4361W', 0, 0, 0, NULL, '2023-12-30 17:27:13', '2023-12-30 17:28:23'),
(112, 14, 111, 500.00000000, 'USD', 6.00000000, 1.00000000, 506.00000000, NULL, '0', '', 'H8YV3N51RWSS', 0, 1, 0, NULL, '2024-01-01 16:00:24', '2024-01-01 16:00:53'),
(113, 22, 111, 500.00000000, 'USD', 6.00000000, 1.00000000, 506.00000000, NULL, '0', '', 'VGDVHQ9XC3CQ', 0, 1, 0, NULL, '2024-01-01 05:17:49', '2024-01-01 05:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'manual_deposit', '{\"trx_number\":{\"name\":\"Trx Number\",\"label\":\"trx_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Mail\",\"Female\",\"Custom\"],\"type\":\"select\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2023-09-29 00:40:47', '2023-10-09 06:53:58'),
(2, 'manual_deposit', '{\"demo\":{\"name\":\"Demo\",\"label\":\"demo\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"demo_two\":{\"name\":\"Demo two\",\"label\":\"demo_two\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2023-10-08 08:30:23', '2023-11-21 06:09:58'),
(3, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"voter_id\":{\"name\":\"Voter Id\",\"label\":\"voter_id\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png,pdf\",\"options\":[],\"type\":\"file\"},\"driving_license_no\":{\"name\":\"Driving License No\",\"label\":\"driving_license_no\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-10-09 06:58:42', '2023-12-10 00:59:29'),
(4, 'manual_deposit', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"email\":{\"name\":\"email\",\"label\":\"email\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"trx_number\":{\"name\":\"Trx Number\",\"label\":\"trx_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-11-21 07:07:31', '2023-11-21 09:10:49'),
(5, 'manual_deposit', '{\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2023-11-21 09:12:25', '2023-11-21 09:13:31'),
(6, 'withdraw_method', '{\"full_name\":{\"name\":\"Full name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"father_name\":{\"name\":\"Father Name\",\"label\":\"father_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"mother_name\":{\"name\":\"Mother Name\",\"label\":\"mother_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2023-11-21 11:15:53', '2023-11-21 11:17:05'),
(7, 'withdraw_method', '{\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2023-11-21 17:08:05', '2023-11-23 06:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE IF NOT EXISTS `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=>Active, 2=>Inactive',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `guideline` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `guideline`, `created_at`, `updated_at`) VALUES
(1, 0, 507, 'BTCPay', 'BTCPay', 0, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"HsqFVTXSeUFJu7caoYZc3CTnP8g5LErVdHhEXPVTheHf\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"4436bd706f99efae69305e7c4eff4780de1335ce\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/testnet.demo.btcpayserver.org\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"SUCdqPn9CDkY7RmJHfpQVHP2Lf2\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, '2023-09-28 12:02:39'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 0, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2023-12-06 11:24:28'),
(3, 0, 106, 'Payeer', 'Payeer', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2022-08-28 10:11:14'),
(4, 0, 107, 'PayStack', 'Paystack', 0, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(6, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(7, 0, 503, 'CoinPayments', 'Coinpayments', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"---------------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"---------------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2023-04-08 03:17:18'),
(8, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2023-09-30 13:52:56'),
(9, 0, 113, 'Paypal Express', 'PaypalSdk', 0, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(10, 0, 114, 'Stripe Checkout', 'StripeV3', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(11, 0, 119, 'Mercado Pago', 'MercadoPago', 0, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-09-14 07:41:14'),
(12, 0, 120, 'Authorize.net', 'Authorize', 0, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"59e4P9DBcZv\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"47x47TJyLw2E7DbR\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-08-28 09:33:06'),
(13, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 05:08:04'),
(14, 0, 122, '2Checkout', 'TwoCheckout', 0, '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"253248016872\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"eQM)ID@&vG84u!O*g[p+\"}}', '{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}', 1, '{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"ipn.TwoCheckout\"}}', NULL, NULL, '2023-04-29 09:21:58'),
(15, 0, 123, 'Checkout', 'Checkout', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"------\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2023-10-05 07:10:52'),
(16, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, NULL),
(17, 1, 1000, 'Demo Gateway', 'demo_gateway', 1, '[]', '[]', 0, NULL, '<p>Demo Instruction will be applied for those users who wants to use this payment method.</p>', '2023-09-29 00:40:47', '2023-11-21 05:50:53'),
(18, 2, 1001, 'Demo Gateway Two', 'demo_gateway_two', 1, '[]', '[]', 0, NULL, '<p>Demo massive instructions</p>', '2023-10-08 08:30:23', '2023-11-21 09:11:16'),
(19, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, NULL),
(20, 4, 1002, 'Demo Gateway Three', 'demo_gateway_three', 1, '[]', '[]', 0, NULL, '<p>I am just testing man. There is nothing to get worried. I am trying make code more shorter. Hope this will work.</p>', '2023-11-21 07:07:31', '2023-11-21 07:07:49'),
(21, 5, 1003, 'Demo Gateway Four', 'demo_gateway_four', 1, '[]', '[]', 0, NULL, '<p>Final check of code short making</p>', '2023-11-21 09:12:25', '2023-11-21 11:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE IF NOT EXISTS `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(10) UNSIGNED DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(1, 'Demo Gateway', 'USD', '', 1000, 'demo_gateway', 1.00000000, 900.00000000, 5.00, 1.00000000, 1.00000000, NULL, '2023-09-29 00:40:47', '2023-12-04 09:48:50'),
(8, 'Mercado Pago - USD', 'USD', '$', 119, 'MercadoPago', 1.00000000, 1000.00000000, 1.00, 1.00000000, 2.00000000, '{\"access_token\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}', '2023-10-05 07:34:13', '2023-10-05 07:34:13'),
(9, 'Demo Gateway Two', 'USD', '', 1001, 'demo_gateway_two', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, NULL, '2023-10-08 08:30:23', '2023-11-21 09:11:16'),
(10, 'Authorize.net - USD', 'USD', '$', 120, 'Authorize', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"login_id\":\"59e4P9DBcZv\",\"transaction_key\":\"47x47TJyLw2E7DbR\"}', '2023-11-15 11:44:53', '2023-11-15 11:44:53'),
(11, 'Checkout - USD', 'USD', '$', 123, 'Checkout', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"secret_key\":\"------\",\"public_key\":\"------\",\"processing_channel_id\":\"------\"}', '2023-11-16 10:31:55', '2023-11-16 10:31:55'),
(12, 'Coinbase Commerce - USD', 'USD', '$', 506, 'CoinbaseCommerce', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"api_key\":\"c47cd7df-d8e8-424b-a20a\",\"secret\":\"55871878-2c32-4f64-ab66\"}', '2023-11-16 10:32:33', '2023-11-16 10:32:33'),
(14, 'CoinPayments - BTC', 'BTC', 'BTC', 503, 'Coinpayments', 1.00000000, 1000.00000000, 1.00, 1.00000000, 0.00002700, '{\"public_key\":\"---------------------\",\"private_key\":\"---------------------\",\"merchant_id\":\"---------------------\"}', '2023-11-16 10:43:47', '2023-11-16 10:43:47'),
(15, 'Flutterwave - CAD', 'CAD', 'CAD', 109, 'Flutterwave', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.37000000, '{\"public_key\":\"----------------\",\"secret_key\":\"-----------------------\",\"encryption_key\":\"------------------\"}', '2023-11-16 10:44:38', '2023-11-16 10:44:38'),
(16, 'Now payments checkout - AVA', 'AVA', 'AVA', 509, 'NowPaymentsCheckout', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.89000000, '{\"api_key\":\"---------------\",\"secret_key\":\"-----------\"}', '2023-11-16 11:14:33', '2023-11-16 11:14:33'),
(17, 'Paypal Express - USD', 'USD', '$', 113, 'PaypalSdk', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"clientId\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\",\"clientSecret\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}', '2023-11-16 11:15:13', '2023-11-16 11:15:13'),
(21, 'Perfect Money - USD', 'USD', '$', 102, 'PerfectMoney', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"passphrase\":\"hR26aw02Q1eEeUPSIfuwNypXX\",\"wallet_id\":\"U30603391\"}', '2023-11-16 12:21:05', '2023-11-16 12:21:05'),
(23, 'RazorPay - INR', 'INR', '$', 110, 'Razorpay', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"key_id\":\"rzp_test_kiOtejPbRZU90E\",\"key_secret\":\"osRDebzEqbsE1kbyQJ4y0re7\"}', '2023-11-16 12:21:46', '2023-11-16 12:21:46'),
(25, 'BTCPay - BTC', 'BTC', 'BTC', 507, 'BTCPay', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"store_id\":\"HsqFVTXSeUFJu7caoYZc3CTnP8g5LErVdHhEXPVTheHf\",\"api_key\":\"4436bd706f99efae69305e7c4eff4780de1335ce\",\"server_name\":\"https:\\/\\/testnet.demo.btcpayserver.org\",\"secret_code\":\"SUCdqPn9CDkY7RmJHfpQVHP2Lf2\"}', '2023-11-16 12:25:24', '2023-11-16 12:25:24'),
(26, 'Payeer - USD', 'USD', '$', 106, 'Payeer', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"merchant_id\":\"866989763\",\"secret_key\":\"7575\"}', '2023-11-16 12:38:24', '2023-11-16 12:38:24'),
(27, 'PayStack - USD', 'USD', '$', 107, 'Paystack', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"public_key\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\",\"secret_key\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}', '2023-11-16 12:39:31', '2023-11-16 12:39:31'),
(28, 'Stripe Checkout - USD', 'USD', '$', 114, 'StripeV3', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\",\"end_point\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}', '2023-11-16 12:40:22', '2023-11-16 12:40:22'),
(29, '2Checkout - USD', 'USD', '$', 122, 'TwoCheckout', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"merchant_code\":\"253248016872\",\"secret_key\":\"eQM)ID@&vG84u!O*g[p+\"}', '2023-11-16 12:41:19', '2023-11-16 12:41:19'),
(31, 'Stripe Storefront - USD', 'USD', '$', 111, 'StripeJs', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}', '2023-11-19 12:01:07', '2023-11-19 12:01:07'),
(32, 'Demo Gateway Three', 'USD', '', 1002, 'demo_gateway_three', 1.00000000, 1000.00000000, 1.00, 1.00000000, 1.00000000, NULL, '2023-11-21 07:07:31', '2023-11-21 09:10:49'),
(33, 'Demo Gateway Four', 'BTC', '', 1003, 'demo_gateway_four', 1.00000000, 100.00000000, 0.00, 0.00000000, 100.00000000, NULL, '2023-11-21 09:12:25', '2023-11-21 09:13:31');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, NULL, '2023-09-17 11:48:33'),
(4, 'Bangla', 'bn', 1, '2023-08-21 12:50:55', '2023-09-17 11:46:54'),
(5, 'Hindi', 'hn', 1, '2023-08-22 08:46:06', '2023-11-29 16:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_26_091103_create_admins_table', 1),
(6, '2023_07_26_100423_create_admin_password_resets_table', 2),
(7, '2023_08_05_103533_create_settings_table', 3),
(10, '2023_08_15_194830_create_site_data_table', 4),
(11, '2023_08_20_140452_create_languages_table', 5),
(12, '2023_09_25_165355_create_plugins_table', 6),
(13, '2023_09_27_053636_create_gateways_table', 7),
(14, '2023_09_27_170521_create_gateway_currencies_table', 8),
(15, '2023_09_29_062351_create_forms_table', 9),
(16, '2023_10_08_164420_create_notification_templates_table', 10),
(17, '2023_10_08_164602_create_admin_notifications_table', 11),
(18, '2023_10_08_164629_create_notification_logs_table', 12),
(19, '2023_10_09_135811_create_subscribers_table', 13),
(20, '2023_11_16_193930_create_deposits_table', 14),
(21, '2023_11_17_181741_create_transactions_table', 15),
(22, '2023_11_20_150839_create_withdraw_methods_table', 16),
(23, '2023_11_20_150907_create_withdrawals_table', 16),
(24, '2023_12_06_154325_create_contacts_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE IF NOT EXISTS `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<p>Your deposit of&nbsp;{{amount}} {{site_currency}}&nbsp;is via&nbsp; {{method_name}}&nbsp;has been completed Successfully.<br>&nbsp;</p><p><br>&nbsp;</p><p>Details of your Deposit :<br>&nbsp;</p><p>Amount : {{amount}} {{site_currency}}</p><p>Charge:&nbsp;{{charge}} {{site_currency}}</p><p>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</p><p>Received : {{method_amount}} {{method_currency}}<br>&nbsp;</p><p>Paid via :&nbsp; {{method_name}}</p><p>Transaction Number : {{trx}}</p><p><br>&nbsp;</p><p>Your current Balance is&nbsp;{{post_balance}} {{site_currency}}</p>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2023-10-08 15:17:44'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', NULL, NULL, '[]', 1, 1, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', NULL, NULL, '[]', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `code`, `created_at`) VALUES
('d@d.com', '778031', '2024-01-01 19:38:16'),
('demouser@gmail.com', '889120', '2024-01-02 16:02:48'),
('demouserten@gmail.com', '881109', '2024-01-02 15:51:22'),
('sajib@gmail.com', '527844', '2024-01-01 19:37:22'),
('sajibsust99@gmail.com', '147137', '2024-01-01 19:43:10');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE IF NOT EXISTS `plugins` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image` varchar(40) NOT NULL,
  `script` text NOT NULL,
  `shortcode` text NOT NULL COMMENT 'object',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `act`, `name`, `image`, `script`, `shortcode`, `status`, `created_at`, `updated_at`) VALUES
(1, 'google-analytics', 'Google Analytics', 'analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{app_key}}\");\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 0, NULL, '2023-12-03 16:47:11'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'captcha.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 0, NULL, '2023-12-25 00:43:20'),
(3, 'facebook-messenger', 'Facebook Messenger', 'messenger.png', '<div id=\"fb-root\"></div>\n<div id=\"fb-customer-chat\" class=\"fb-customerchat\"></div>\n\n<script>\n    var chatbox = document.getElementById(\'fb-customer-chat\');\n    chatbox.setAttribute(\"page_id\", {{page_id}});\n    chatbox.setAttribute(\"attribution\", \"biz_inbox\");\n</script>\n\n<!-- Your SDK code -->\n<script>\n    window.fbAsyncInit = function() {\n    FB.init({\n        xfbml            : true,\n        version          : \'v17.0\'\n    });\n    };\n\n    (function(d, s, id) {\n    var js, fjs = d.getElementsByTagName(s)[0];\n    if (d.getElementById(id)) return;\n    js = d.createElement(s); js.id = id;\n    js.src = \'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js\';\n    fjs.parentNode.insertBefore(js, fjs);\n    }(document, \'script\', \'facebook-jssdk\'));\n</script>', '{\"page_id\":{\"title\":\"Page Id\",\"value\":\"123-123456\"}}', 0, NULL, '2023-12-03 16:46:50'),
(4, 'tawk-chat', 'Tawk.to', 'tawk.png', '<script>\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n                        (function(){\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n                        s1.async=true;\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\n                        s1.charset=\"UTF-8\";\n                        s1.setAttribute(\"crossorigin\",\"*\");\n                        s0.parentNode.insertBefore(s1,s0);\n                        })();\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 0, NULL, '2023-11-09 10:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE IF NOT EXISTS `referrals` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  `percent` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `type`, `level`, `percent`, `created_at`, `updated_at`) VALUES
(25, 'cashin', 1, 10.00, '2024-01-02 17:34:59', '2024-01-02 17:34:59'),
(26, 'cashin', 2, 8.00, '2024-01-02 17:34:59', '2024-01-02 17:34:59'),
(27, 'cashin', 3, 6.00, '2024-01-02 17:34:59', '2024-01-02 17:34:59'),
(28, 'cashin', 4, 4.00, '2024-01-02 17:34:59', '2024-01-02 17:34:59'),
(29, 'cashin', 5, 3.00, '2024-01-02 17:34:59', '2024-01-02 17:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `send_money`
--

CREATE TABLE IF NOT EXISTS `send_money` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(10) NOT NULL DEFAULT 0,
  `sender_id` int(10) NOT NULL DEFAULT 0,
  `receiver_amount` int(10) DEFAULT NULL,
  `sender_amount` int(10) DEFAULT NULL,
  `charge` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `send_money`
--

INSERT INTO `send_money` (`id`, `receiver_id`, `sender_id`, `receiver_amount`, `sender_amount`, `charge`, `created_at`, `updated_at`) VALUES
(1, 2, 12, 50, 58, 8, '2023-12-24 00:14:46', '2023-12-24 00:14:46'),
(2, 12, 2, 100, 110, 10, '2023-12-24 01:22:17', '2023-12-24 01:22:17'),
(3, 12, 2, 20, 26, 6, '2023-12-24 01:32:22', '2023-12-24 01:32:22'),
(4, 2, 12, 10, 16, 6, '2023-12-24 01:36:08', '2023-12-24 01:36:08'),
(5, 11, 12, 13, 19, 6, '2023-12-25 22:55:43', '2023-12-25 22:55:43'),
(6, 11, 12, 15, 21, 6, '2023-12-25 22:56:24', '2023-12-25 22:56:24'),
(7, 2, 1, 100, 110, 10, '2024-01-02 17:07:56', '2024-01-02 17:07:56'),
(8, 21, 1, 100, 110, 10, '2024-01-02 18:06:01', '2024-01-02 18:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_name` varchar(40) DEFAULT NULL,
  `site_cur` varchar(40) DEFAULT NULL COMMENT 'site currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'site currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_body` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `mail_config` text DEFAULT NULL,
  `sms_config` text DEFAULT NULL,
  `universal_shortcodes` text DEFAULT NULL,
  `first_color` varchar(40) DEFAULT NULL,
  `second_color` varchar(40) DEFAULT NULL,
  `signup` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'user registration',
  `enforce_ssl` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'enforce ssl',
  `agree_policy` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'accept terms and policy',
  `strong_pass` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'enforce strong password',
  `kc` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'kyc confirmation',
  `ec` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'email confirmation',
  `ea` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'email alert',
  `sc` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'sms confirmation',
  `sa` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'sms alert',
  `site_maintenance` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `language` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `active_theme` varchar(40) NOT NULL DEFAULT 'primary',
  `cashin_commission` tinyint(1) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_cur`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `mail_config`, `sms_config`, `universal_shortcodes`, `first_color`, `second_color`, `signup`, `enforce_ssl`, `agree_policy`, `strong_pass`, `kc`, `ec`, `ea`, `sc`, `sa`, `site_maintenance`, `language`, `active_theme`, `cashin_commission`, `created_at`, `updated_at`) VALUES
(1, 'Phinix Admin', 'USD', '$', 'info@softphinix.com', '<p><strong>Hello {{fullname}} ({{username}})</strong></p><p><strong>---------------------------------------</strong></p><p><strong>{{message}}</strong></p><p><strong>---------------------------------------</strong></p><p><strong>{{site_name}}</strong>&nbsp;. All Rights Reserved.</p>', 'hi {{fullname}} ({{username}}), {{message}}', 'PhinixAdmin', '{\"name\":\"php\"}', '{\"name\":\"custom\",\"nexmo\":{\"api_key\":\"------\",\"api_secret\":\"------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"-----------------------\",\"from\":\"----------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\",\"Demo Api\"],\"value\":[\"test_api\",\"Demo Api\"]},\"body\":{\"name\":[\"from_number\",\"Demo bodyt Api\"],\"value\":[\"565754\",\"Demo body API\"]}}}', '{\r\n    \"site_name\":\"Name of your site\",\r\n    \"site_currency\":\"Currency of your site\",\r\n    \"currency_symbol\":\"Symbol of currency\"\r\n}', '1b6be6', '8d0fe9', 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 'primary', 1, NULL, '2024-01-02 17:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `site_data`
--

CREATE TABLE IF NOT EXISTS `site_data` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_key` varchar(40) DEFAULT NULL,
  `data_info` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_data`
--

INSERT INTO `site_data` (`id`, `data_key`, `data_info`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"gfhgh\",\"hgfh\",\"ghgh\",\"ghyth\",\"hgjdghj\",\"hgjghj\"],\"social_title\":\"fghfh svsdfvds\",\"description\":\"fghdfhfg dsfsdf\",\"social_description\":\"dhdhdgh sdaf sdafsd\",\"image\":\"651104947ba2b1695614100.jpg\"}', '2023-08-15 14:11:35', '2023-09-25 09:42:33'),
(2, 'feature.content', '{\"heading\":\"asdasdsad\",\"subheading\":\"asdasdasd\"}', '2023-09-23 13:12:01', '2023-09-23 13:18:41'),
(8, 'cookie.data', '{\"short_details\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience\",\"details\":\"<p><strong>We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience<\\/strong><\\/p>\",\"status\":1}', NULL, '2023-11-06 11:04:44'),
(9, 'maintenance.data', '{\"heading\":\"Under Maintenance\",\"details\":\"<h3><strong>What information do we collect?<\\/strong><\\/h3><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p>\"}', NULL, '2023-11-06 15:14:38'),
(10, 'feature.element', '{\"has_image\":\"1\",\"trx_type\":\"deposit\",\"title\":\"Abcdefgh\",\"description\":\"dfdf\",\"feature_icon\":\"<i class=\\\"fab fa-accessible-icon\\\"><\\/i>\",\"demo_icon\":\"<i class=\\\"fab fa-acquisitions-incorporated\\\"><\\/i>\",\"abc\":\"<p>dfdfdfdf<\\/p>\",\"background_image\":\"6512c792671e21695729554.jpg\",\"feature_image\":\"6512c4fd42a711695728893.jpg\"}', '2023-09-26 11:48:13', '2023-11-16 14:31:50'),
(11, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h3><strong>What information do we collect?<\\/strong><\\/h3><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><h3><strong>How do we protect your information?<\\/strong><\\/h3><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><h3><strong>Do we disclose any information to outside parties?<\\/strong><\\/h3><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><h3><strong>Children\'s Online Privacy Protection Act Compliance<\\/strong><\\/h3><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><h3><strong>Changes to our Privacy Policy<\\/strong><\\/h3><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><h3><strong>How long we retain your information?<\\/strong><\\/h3><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><h3><strong>What we don\\u2019t do with your data<\\/strong><\\/h3><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p>\"}', '2023-11-09 10:17:26', '2023-11-09 10:17:26'),
(12, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<p>We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><ul><li>Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li>Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li>Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li>Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, & installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li>Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li>We Don\'t support any child porn or such material.<\\/li><li>No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li>No harassing material that may cause people to retaliate against you.<\\/li><li>No phishing pages.<\\/li><li>You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li>If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li>Malicious Botnets are strictly forbidden.<\\/li><li>Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li>Malicious hacking materials, trojans, viruses, & malicious bots running or for download are forbidden.<\\/li><li>Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li>Php\\/CGI proxies are strictly forbidden.<\\/li><li>CGI-IRC is strictly forbidden.<\\/li><li>No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li>NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><h3><strong>Terms & Conditions for Users<\\/strong><\\/h3><p>Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><h3><strong>Support<\\/strong><\\/h3><p>Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p>On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul><li>Hang tight for additional update discharge.<\\/li><li>Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><h3><strong>Ownership<\\/strong><\\/h3><p>You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><h3><strong>Warranty<\\/strong><\\/h3><p>We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><h3><strong>Unauthorized\\/Illegal Usage<\\/strong><\\/h3><p>You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><h3><strong>Fiverr, Seoclerks Sellers Or Affiliates<\\/strong><\\/h3><p>We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><h3><strong>Payment\\/Refund Policy<\\/strong><\\/h3><p>No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><h3><strong>Free Balance \\/ Coupon Policy<\\/strong><\\/h3><p>We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p>\"}', '2023-11-09 10:17:51', '2023-11-09 10:17:51'),
(13, 'banner.element', '{\"has_image\":\"1\",\"title\":\"Creative & Innovative\",\"heading\":\"Creative & Innovative Digital Solution\",\"button_one_text\":\"Free Quote\",\"button_one_url\":\"https:\\/\\/www.google.com\\/\",\"button_two_text\":\"Contact Us\",\"button_two_url\":\"https:\\/\\/www.google.com\\/\",\"background_image\":\"658a9a1667c1b1703582230.jpg\"}', '2023-12-26 23:17:10', '2023-12-26 23:17:10'),
(14, 'banner.element', '{\"has_image\":\"1\",\"title\":\"Creative & Innovative Two\",\"heading\":\"Creative & Innovative Digital Solution Two\",\"button_one_text\":\"Free Quote Two\",\"button_one_url\":\"https:\\/\\/www.google.com\\/\",\"button_two_text\":\"Contact Us Two\",\"button_two_url\":\"https:\\/\\/www.facebook.com\\/\",\"background_image\":\"658a9a5618a291703582294.jpg\"}', '2023-12-26 23:18:14', '2023-12-26 23:46:20'),
(15, 'counter.element', '{\"icon\":\"<i class=\\\"fab fa-accessible-icon\\\"><\\/i>\",\"title\":\"Happy Clients\",\"digit\":\"6549\"}', '2023-12-26 23:54:50', '2023-12-26 23:54:50'),
(16, 'counter.element', '{\"icon\":\"<i class=\\\"fab fa-algolia\\\"><\\/i>\",\"title\":\"Projects Done\",\"digit\":\"12345\"}', '2023-12-26 23:55:17', '2023-12-26 23:55:17'),
(17, 'counter.element', '{\"icon\":\"<i class=\\\"fab fa-alipay\\\"><\\/i>\",\"title\":\"Win Awards\",\"digit\":\"98745\"}', '2023-12-26 23:55:32', '2023-12-26 23:55:32'),
(19, 'service.content', '{\"heading\":\"Custom IT Solutions for Your Successful Business\",\"subheading\":\"OUR SERVICES\",\"contact_heading\":\"Call Us\",\"contact_details\":\"Clita ipsum magna kasd rebum at ipsum amet dolor justo dolor est magna stet eirmod\",\"contact_number\":\"01779435375\"}', '2023-12-27 02:24:57', '2023-12-28 09:50:16'),
(25, 'pricing.content', '{\"heading\":\"We are Offering Competitive Prices for Our Clients\",\"subheading\":\"PRICING PLANS\"}', '2023-12-27 02:57:51', '2023-12-27 02:57:51'),
(26, 'pricing.element', '{\"title\":\"Basic Plan\",\"sub_title\":\"FOR SMALL SIZE BUSINESS\",\"price\":\"50\",\"duration\":\"Month\",\"service_one\":\"HTML\",\"service_two\":\"CSS\",\"service_three\":\"PHP\",\"service_one_icon\":\"<i class=\\\"fab fa-affiliatetheme\\\"><\\/i>\",\"service_two_icon\":\"<i class=\\\"fab fa-acquisitions-incorporated\\\"><\\/i>\",\"service_three_icon\":\"<i class=\\\"fab fa-affiliatetheme\\\"><\\/i>\",\"button\":\"Submit\"}', '2023-12-27 03:01:24', '2023-12-27 03:01:24'),
(27, 'pricing.element', '{\"title\":\"Standard Plan\",\"sub_title\":\"FOR MEDIUM SIZE BUSINESS\",\"price\":\"100\",\"duration\":\"Month\",\"service_one\":\"HTML\",\"service_two\":\"CSS\",\"service_three\":\"PHP\",\"service_one_icon\":\"<i class=\\\"fas fa-adjust\\\"><\\/i>\",\"service_two_icon\":\"<i class=\\\"fab fa-adversal\\\"><\\/i>\",\"service_three_icon\":\"<i class=\\\"fas fa-address-book\\\"><\\/i>\",\"button\":\"Submit\"}', '2023-12-27 03:02:42', '2023-12-27 03:02:42'),
(28, 'pricing.element', '{\"title\":\"Advanced Plan\",\"sub_title\":\"FOR LARGE SIZE BUSINESS\",\"price\":\"200\",\"duration\":\"Month\",\"service_one\":\"HTML\",\"service_two\":\"CSS\",\"service_three\":\"PHP\",\"service_one_icon\":\"<i class=\\\"fas fa-angle-double-down\\\"><\\/i>\",\"service_two_icon\":\"<i class=\\\"fas fa-angle-double-left\\\"><\\/i>\",\"service_three_icon\":\"<i class=\\\"fas fa-angle-double-right\\\"><\\/i>\",\"button\":\"Submit\"}', '2023-12-27 03:03:45', '2023-12-27 03:03:45'),
(29, 'contact_us.content', '{\"title\":\"Need A Free Quote? Please Feel Free to Contact Us\",\"short_title\":\"REQUEST A QUOTE\",\"reply\":\"Reply within 24 hours\",\"support\":\"24 hrs telephone support\",\"short_details\":\"Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.\",\"contact_number\":\"+8801779435375\",\"contact_icon\":\"<i class=\\\"far fa-check-square\\\"><\\/i>\"}', '2023-12-27 04:08:53', '2023-12-27 04:08:53'),
(74, 'service.element', '{\"heading_icon\":\"<i class=\\\"fab fa-accessible-icon\\\"><\\/i>\",\"clickable_icon\":\"<i class=\\\"fas fa-bolt\\\"><\\/i>\",\"title\":\"Web Development\",\"details\":\"Amet justo dolor lorem kasd amet magna sea stet eos vero lorem ipsum dolore sed\"}', '2023-12-28 19:18:59', '2023-12-28 19:18:59'),
(75, 'service.element', '{\"heading_icon\":\"<i class=\\\"fab fa-accusoft\\\"><\\/i>\",\"clickable_icon\":\"<i class=\\\"fas fa-audio-description\\\"><\\/i>\",\"title\":\"Web Design\",\"details\":\"Magna sea eos sit dolor, ipsum amet lorem diam dolor eos et diam dolor\"}', '2023-12-28 19:19:28', '2023-12-28 19:19:28'),
(76, 'service.element', '{\"heading_icon\":\"<i class=\\\"fas fa-ad\\\"><\\/i>\",\"clickable_icon\":\"<i class=\\\"fas fa-adjust\\\"><\\/i>\",\"title\":\"Professional Staff\",\"details\":\"Magna sea eos sit dolor, ipsum amet lorem diam dolor eos et diam dolor\"}', '2023-12-28 19:19:57', '2023-12-28 19:19:57'),
(77, 'service.element', '{\"heading_icon\":\"<i class=\\\"fab fa-500px\\\"><\\/i>\",\"clickable_icon\":\"<i class=\\\"fas fa-bell\\\"><\\/i>\",\"title\":\"24\\/7 Support\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}', '2023-12-28 19:20:29', '2023-12-28 19:20:29'),
(78, 'service.element', '{\"heading_icon\":\"<i class=\\\"far fa-address-book\\\"><\\/i>\",\"clickable_icon\":\"<i class=\\\"fab fa-apple\\\"><\\/i>\",\"title\":\"Award Winning\",\"details\":\"Magna sea eos sit dolor, ipsum amet lorem diam dolor eos et diam dolor\"}', '2023-12-28 19:21:10', '2023-12-28 19:21:10'),
(85, 'contact_page.content', '{\"title\":\"If You Have Any Query, Feel Free To Contact Us\",\"sub_title\":\"Contact Us\",\"phone\":\"+8801779435375\",\"email\":\"sajibsust99@gmail.com\",\"address\":\"338\\/13, C, Khilgaon, Dhaka-1219\",\"map\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3651.9072508533604!2d90.41686622595755!3d23.75068663876426!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b864d4ec0215%3A0xa8e56d7dc5eaaf7a!2sAnsar%20%26%20VDP%20Head%20Quarter%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1703790129663!5m2!1sen!2sbd\"}', '2023-12-28 13:05:40', '2023-12-28 13:05:40'),
(88, 'header.content', '{\"address\":\"338\\/13, C, Khilgaon, Dhaka-1219\",\"phone\":\"+8801779435375\",\"email\":\"sajibsust99@gmail.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/feed\",\"youtube\":\"https:\\/\\/www.youtube.com\"}', '2023-12-28 14:13:22', '2023-12-28 14:13:22'),
(89, 'footer.content', '{\"short_text\":\"Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum\",\"address\":\"338\\/13, C, Khilgaon, Dhaka-1219\",\"phone\":\"+8801779435375\",\"email\":\"sajibsust99@gmail.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"facebook\":\"https:\\/\\/www.facebook.com\",\"instagram\":\"https:\\/\\/www.instagram.com\",\"linkedin\":\"https:\\/\\/www.linkedin.com\\/feed\"}', '2023-12-28 14:17:43', '2023-12-28 14:17:43'),
(91, 'about.content', '{\"has_image\":\"1\",\"heading\":\"ABOUT US\",\"subheading\":\"The Best IT Solution With 10 Years of Experience\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy\",\"icon\":\"<i class=\\\"fas fa-arrow-right\\\"><\\/i>\",\"mobile\":\"01779435375\",\"image\":\"658efdc6429641703869894.jpg\"}', '2023-12-29 11:11:04', '2023-12-29 11:18:14'),
(92, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Award Winning\"}', '2023-12-29 11:12:28', '2023-12-29 11:12:28'),
(93, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Web Development\"}', '2023-12-29 11:13:02', '2023-12-29 11:13:02'),
(94, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Web Design\"}', '2023-12-29 11:13:29', '2023-12-29 11:13:29'),
(95, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Professional Staff\"}', '2023-12-29 11:14:00', '2023-12-29 11:14:00'),
(96, 'choose.content', '{\"has_image\":\"1\",\"heading\":\"We Are Here to Grow Your Business Exponentially\",\"sub_heading\":\"Why Choose Us\",\"image\":\"658eff86b5b0a1703870342.jpg\"}', '2023-12-29 11:19:02', '2023-12-29 11:19:02'),
(97, 'choose.element', '{\"icon\":\"<i class=\\\"fab fa-accessible-icon\\\"><\\/i>\",\"title\":\"Best In Industry\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\"}', '2023-12-29 11:19:53', '2023-12-29 11:19:53'),
(98, 'choose.element', '{\"icon\":\"<i class=\\\"fab fa-accusoft\\\"><\\/i>\",\"title\":\"Award Winning\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\"}', '2023-12-29 11:20:18', '2023-12-29 11:20:18'),
(99, 'choose.element', '{\"icon\":\"<i class=\\\"far fa-address-book\\\"><\\/i>\",\"title\":\"Professional Staff\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\"}', '2023-12-29 11:20:38', '2023-12-29 11:20:38'),
(100, 'choose.element', '{\"icon\":\"<i class=\\\"fas fa-address-card\\\"><\\/i>\",\"title\":\"24\\/7 Support\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\"}', '2023-12-29 11:21:00', '2023-12-29 11:21:00'),
(101, 'testimonial.content', '{\"heading\":\"What Our Clients Say About Our Digital Services\",\"sub_heading\":\"Testimonial\"}', '2023-12-29 11:22:34', '2023-12-29 11:22:34'),
(102, 'testimonial.element', '{\"has_image\":\"1\",\"client_name\":\"Sharmin Sultana\",\"profession\":\"Web Development\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\",\"image\":\"658f008f0cb5a1703870607.jpg\"}', '2023-12-29 11:23:27', '2023-12-29 11:23:27'),
(103, 'testimonial.element', '{\"has_image\":\"1\",\"client_name\":\"Mousi Sultana\",\"profession\":\"Web Design\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\",\"image\":\"658f00b7077701703870647.jpg\"}', '2023-12-29 11:24:07', '2023-12-29 11:24:07'),
(104, 'testimonial.element', '{\"has_image\":\"1\",\"client_name\":\"Abdul Malek\",\"profession\":\"Phython Dev\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\",\"image\":\"658f00db9011d1703870683.jpg\"}', '2023-12-29 11:24:43', '2023-12-29 11:24:43'),
(105, 'testimonial.element', '{\"has_image\":\"1\",\"client_name\":\"Anil Mondol\",\"profession\":\"Laravel Dev\",\"details\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum\",\"image\":\"658f010e8f0a71703870734.jpg\"}', '2023-12-29 11:25:34', '2023-12-29 11:25:34'),
(106, 'team.content', '{\"heading\":\"Professional Stuffs Ready to Help Your Business\",\"subheading\":\"Team Members\"}', '2023-12-29 11:26:13', '2023-12-29 11:26:13'),
(107, 'team.element', '{\"member_name\":\"Abdul Malek\",\"Designation\":\"Web Design\",\"fb\":\"https:\\/\\/www.facebook.com\",\"tw\":\"https:\\/\\/twitter.com\",\"ins\":\"https:\\/\\/www.instagram.com\",\"ln\":\"https:\\/\\/www.linkedin.com\\/feed\",\"has_image\":\"1\",\"image\":\"658f014cb585d1703870796.jpg\"}', '2023-12-29 11:26:36', '2023-12-29 11:26:36'),
(108, 'team.element', '{\"member_name\":\"Tuba Khatun\",\"Designation\":\"Web Design\",\"fb\":\"https:\\/\\/www.facebook.com\",\"tw\":\"https:\\/\\/twitter.com\",\"ins\":\"https:\\/\\/www.instagram.com\",\"ln\":\"https:\\/\\/www.linkedin.com\\/feed\",\"has_image\":\"1\",\"image\":\"658fb539be78b1703916857.jpg\"}', '2023-12-29 11:27:23', '2023-12-30 14:14:18'),
(109, 'team.element', '{\"member_name\":\"Jon Doe\",\"Designation\":\"Web Development\",\"fb\":\"https:\\/\\/www.facebook.com\",\"tw\":\"https:\\/\\/twitter.com\",\"ins\":\"https:\\/\\/www.instagram.com\",\"ln\":\"https:\\/\\/www.linkedin.com\\/feed\",\"has_image\":\"1\",\"image\":\"658f01a8d62fd1703870888.jpg\"}', '2023-12-29 11:28:08', '2023-12-29 11:28:08'),
(110, 'blog.content', '{\"heading\":\"Read The Latest Articles from Our Blog Post\",\"subheading\":\"Latest Blog\"}', '2023-12-29 11:29:27', '2023-12-29 11:29:27'),
(111, 'blog.element', '{\"has_image\":\"1\",\"title\":\"How to build a website\",\"short_text\":\"Dolor et eos labore stet justo sed est sed sed sed dolor stet amet\",\"profession\":\"Manager\",\"name\":\"Adam Smith\",\"description\":\"It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).\",\"image\":\"658f0228e71391703871016.jpg\"}', '2023-12-29 11:30:16', '2023-12-29 11:30:17'),
(112, 'blog.element', '{\"has_image\":\"1\",\"title\":\"Award Winning\",\"short_text\":\"Dolor et eos labore stet justo sed est sed sed sed dolor stet amet\",\"profession\":\"Laravel Dev\",\"name\":\"Adam Smith\",\"description\":\"It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).\",\"image\":\"658f02495e88c1703871049.jpg\"}', '2023-12-29 11:30:49', '2023-12-29 11:32:17'),
(113, 'blog.element', '{\"has_image\":\"1\",\"title\":\"Professional Staff\",\"short_text\":\"Dolor et eos labore stet justo sed est sed sed sed dolor stet amet\",\"profession\":\"Phython Dev\",\"name\":\"Bristy Akther\",\"description\":\"It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).\",\"image\":\"658f0262f0e601703871074.jpg\"}', '2023-12-29 11:31:14', '2023-12-29 11:31:15'),
(114, 'blog.element', '{\"has_image\":\"1\",\"title\":\"We do not code like human\",\"short_text\":\"Dolor et eos labore stet justo sed est sed sed sed dolor stet amet\",\"profession\":\"Web Development\",\"name\":\"Jony will\",\"description\":\"It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the \\r\\nreadable content of a page when looking at its layout. The point of \\r\\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \\r\\nletters, as opposed to using \'Content here, content here\', making it \\r\\nlook like readable English. Many desktop publishing packages and web \\r\\npage editors now use Lorem Ipsum as their default model text, and a \\r\\nsearch for \'lorem ipsum\' will uncover many web sites still in their \\r\\ninfancy. Various versions have evolved over the years, sometimes by \\r\\naccident, sometimes on purpose (injected humour and the like).\",\"image\":\"658f027d650eb1703871101.jpg\"}', '2023-12-29 11:31:41', '2023-12-30 14:50:58'),
(115, 'vendor.element', '{\"has_image\":\"1\",\"image\":\"658f02e75a5521703871207.jpg\"}', '2023-12-29 11:33:27', '2023-12-29 11:33:27'),
(116, 'vendor.element', '{\"has_image\":\"1\",\"image\":\"658f02ecedeca1703871212.jpg\"}', '2023-12-29 11:33:32', '2023-12-29 11:33:32'),
(117, 'vendor.element', '{\"has_image\":\"1\",\"image\":\"658f02f29c3d81703871218.jpg\"}', '2023-12-29 11:33:38', '2023-12-29 11:33:38'),
(118, 'vendor.element', '{\"has_image\":\"1\",\"image\":\"658f02f8586d61703871224.jpg\"}', '2023-12-29 11:33:44', '2023-12-29 11:33:44'),
(119, 'vendor.element', '{\"has_image\":\"1\",\"image\":\"658f02fdd6fea1703871229.jpg\"}', '2023-12-29 11:33:49', '2023-12-29 11:33:49'),
(120, 'vendor.element', '{\"has_image\":\"1\",\"image\":\"658f0303e71031703871235.jpg\"}', '2023-12-29 11:33:55', '2023-12-29 11:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(3, 'test@test.com', '2023-12-06 11:04:26', '2023-12-06 11:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `agent_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(1, 0, 14, 500.00000000, 0.00000000, 500.00000000, '-', 'ZENXPHAHH2NP', 'kjbhuj', 'balance_subtract', '2023-12-19 00:28:17', '2023-12-19 00:28:17'),
(2, 0, 14, 200.00000000, 0.00000000, 700.00000000, '+', 'JSH2KRXO1TAJ', 'mjhvujyhv', 'balance_add', '2023-12-19 00:28:41', '2023-12-19 00:28:41'),
(3, 12, 0, 300.00000000, 3.00000000, 98.30000000, '-', '1ASUJF2F233P', '297.00 USD Withdraw Via Demo One', 'withdraw', '2023-12-19 21:53:26', '2023-12-19 21:53:26'),
(4, 0, 14, 100.00000000, 0.00000000, 502.00000000, '-', 'F3FUGP9CTV7A', 'From Agent Panel User Cash In', 'Cash In', '2023-12-19 21:54:39', '2023-12-19 21:54:39'),
(5, 0, 14, 2.00000000, 0.00000000, 604.00000000, '+', 'GTGSHRC4TZ4O', 'User Cash In Agent Commission', 'cash_in', '2023-12-19 21:54:39', '2023-12-19 21:54:39'),
(6, 12, 0, 100.00000000, 12.00000000, 188.00000000, '+', '91PPWD4DNXPJ', 'User Cash In from Agent', 'cash_in', '2023-12-19 21:54:39', '2023-12-19 21:54:39'),
(7, 0, 14, 100.00000000, 0.00000000, 702.00000000, '+', '5M22ZOPWF8EU', 'From Agent Panel Cash Out', 'cash_out', '2023-12-20 00:36:14', '2023-12-20 00:36:14'),
(8, 12, 0, 2.00000000, 0.00000000, 2.00000000, '+', 'Q9EYB38H382U', 'Agent commission from user', 'cash_out', '2023-12-20 00:36:14', '2023-12-20 00:36:14'),
(9, 0, 0, 100.00000000, 17.00000000, -12.00000000, '-', '318MPMPCZ2M3', 'User Cash Out from Agent', 'cash_out', '2023-12-20 00:36:14', '2023-12-20 00:36:14'),
(10, 0, 14, 100.00000000, 0.00000000, 804.00000000, '+', 'GGZWWZHPXRO2', 'From Agent Panel Cash Out', 'cash_out', '2023-12-20 00:39:20', '2023-12-20 00:39:20'),
(11, 12, 0, 2.00000000, 0.00000000, 2.00000000, '+', 'PDUJYE3NGRDN', 'Agent commission from user', 'cash_out', '2023-12-20 00:39:20', '2023-12-20 00:39:20'),
(12, 0, 0, 100.00000000, 17.00000000, -100.00000000, '-', '9XS435Y19H2D', 'User Cash Out from Agent', 'cash_out', '2023-12-20 00:39:20', '2023-12-20 00:39:20'),
(13, 12, 0, 500.00000000, 6.00000000, 500.00000000, '+', 'AA9WFT8PSDVF', 'Deposit Via Stripe Storefront - USD', 'deposit', '2023-12-20 02:34:58', '2023-12-20 02:34:58'),
(14, 12, 0, 100.00000000, 0.00000000, 300.00000000, '-', 'X3CV2X7QMRBE', 'User Send Money to another user', 'send_money', '2023-12-20 22:53:07', '2023-12-20 22:53:07'),
(15, 2, 0, 100.00000000, 0.00000000, 200.00000000, '+', 'O51MTDKCFC6H', 'User receive money from another user', 'send_money', '2023-12-20 22:53:07', '2023-12-20 22:53:07'),
(16, 12, 0, 100.00000000, 10.00000000, 290.00000000, '-', 'QMGXT3F743WJ', 'Send money to 880123456789', 'send_money', '2023-12-21 01:27:54', '2023-12-21 01:27:54'),
(17, 1, 0, 100.00000000, 0.00000000, 210.00000000, '+', 'F4BZ5H8JO2XD', 'Received money from 8801779435375', 'send_money', '2023-12-21 01:27:54', '2023-12-21 01:27:54'),
(18, 0, 14, 100.00000000, 0.00000000, 604.00000000, '-', 'GYA9Z47HVAXA', 'Cash in for demouser5', 'cash_in', '2023-12-21 04:03:14', '2023-12-21 04:03:14'),
(19, 5, 0, 100.00000000, 17.00000000, 83.00000000, '+', 'CJAH37BUA564', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-21 04:03:14', '2023-12-21 04:03:14'),
(20, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'KKTEHNTGMX9Y', 'Commission for cash in', 'cash_in_commission', '2023-12-21 04:03:14', '2023-12-21 04:03:14'),
(21, 12, 0, 100.00000000, 10.00000000, 180.00000000, '-', 'NA3S4F1F8KOW', 'Send money to 96512345678', 'send_money', '2023-12-21 23:39:37', '2023-12-21 23:39:37'),
(22, 4, 0, 100.00000000, 0.00000000, 100.00000000, '+', '85V2ZPAHU39O', 'Received money from 8801779435375', 'send_money', '2023-12-21 23:39:37', '2023-12-21 23:39:37'),
(23, 0, 14, 100.00000000, 0.00000000, 704.00000000, '-', 'GG636E3W6FGS', 'Cash out for demoufromfakeagenttwo', 'cash_out', '2023-12-21 23:42:44', '2023-12-21 23:42:44'),
(24, 12, 0, 100.00000000, 17.00000000, 63.00000000, '+', 'QRMPM3XKK1UZ', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-21 23:42:44', '2023-12-21 23:42:44'),
(25, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'XHNZA8FK7VRM', 'Commission for cash in', 'cash_in_commission', '2023-12-21 23:42:44', '2023-12-21 23:42:44'),
(26, 0, 14, 100.00000000, 0.00000000, 604.00000000, '-', 'MAAKP99FJZQZ', 'Cash in for demouser4', 'cash_in', '2023-12-21 23:44:27', '2023-12-21 23:44:27'),
(27, 4, 0, 100.00000000, 17.00000000, 183.00000000, '+', 'JQHGF5EQOYTH', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-21 23:44:27', '2023-12-21 23:44:27'),
(28, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'KY29NO2S27NY', 'Commission for cash in', 'cash_in_commission', '2023-12-21 23:44:27', '2023-12-21 23:44:27'),
(29, 0, 14, 100.00000000, 0.00000000, 504.00000000, '-', 'D5V6N8WC4137', 'Cash in for demouser5', 'cash_in', '2023-12-21 23:45:34', '2023-12-21 23:45:34'),
(30, 5, 0, 100.00000000, 17.00000000, 83.00000000, '+', '4WRASSNSPWV1', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-21 23:45:34', '2023-12-21 23:45:34'),
(31, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'WGRM85SZBHB3', 'Commission for cash in', 'cash_in_commission', '2023-12-21 23:45:34', '2023-12-21 23:45:34'),
(32, 0, 14, 100.00000000, 0.00000000, 604.00000000, '-', 'W9QZVNTA6X2A', 'Cash out for demoufromfakeagenttwo', 'cash_out', '2023-12-22 01:17:00', '2023-12-22 01:17:00'),
(33, 12, 0, 100.00000000, 17.00000000, -54.00000000, '+', 'MQJ7S3Q2ESNF', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-22 01:17:00', '2023-12-22 01:17:00'),
(34, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '5HX1NFWPZA1G', 'Commission for cash in', 'cash_in_commission', '2023-12-22 01:17:00', '2023-12-22 01:17:00'),
(35, 0, 14, 150.00000000, 0.00000000, 454.00000000, '-', '9FTWW11HNE33', 'Cash in for demou', 'cash_in', '2023-12-22 01:21:48', '2023-12-22 01:21:48'),
(36, 12, 0, 150.00000000, 19.50000000, 230.50000000, '+', 'WE8P4G1ZWZ4G', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-22 01:21:48', '2023-12-22 01:21:48'),
(37, 0, 14, 3.00000000, 0.00000000, 0.00000000, '+', 'TBPF87M7D5HU', 'Commission for cash in', 'cash_in_commission', '2023-12-22 01:21:48', '2023-12-22 01:21:48'),
(38, 0, 9, 300.00000000, 0.00000000, 300.00000000, '-', 'C5JQC5BHE5QM', 'Cash out for demoufromdemoagenttwo', 'cash_out', '2023-12-22 01:25:42', '2023-12-22 01:25:42'),
(39, 12, 0, 300.00000000, 27.00000000, -96.50000000, '+', '82D4T161M4RU', 'Cash in from demoagenttwo', 'cash_in', '2023-12-22 01:25:42', '2023-12-22 01:25:42'),
(40, 0, 9, 6.00000000, 0.00000000, 0.00000000, '+', 'WQUKAH1T6B2C', 'Commission for cash in', 'cash_in_commission', '2023-12-22 01:25:42', '2023-12-22 01:25:42'),
(41, 0, 12, 200.00000000, 0.00000000, 200.00000000, '-', 'EFFPP1KGVFNM', 'Cash out for demoufromdemoagentfour', 'cash_out', '2023-12-22 01:26:45', '2023-12-22 01:26:45'),
(42, 0, 12, 50.00000000, 0.00000000, 250.00000000, '-', '2UPDY2XCTG7A', 'Cash out for demoufromdemoagentfour', 'cash_out', '2023-12-22 01:28:18', '2023-12-22 01:28:18'),
(43, 0, 12, 110.00000000, 0.00000000, 360.00000000, '-', '17QA7RXMEKCS', 'Cash out for demoufromdemoagentfour', 'cash_out', '2023-12-22 01:30:03', '2023-12-22 01:30:03'),
(44, 0, 14, 50.00000000, 0.00000000, 504.00000000, '-', '5DT162H1ZWNB', 'Cash out for demoufromfakeagenttwo', 'cash_out', '2023-12-22 01:30:31', '2023-12-22 01:30:31'),
(45, 12, 0, 50.00000000, 14.50000000, 35.50000000, '+', '4BOTAKDCHQAD', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-22 01:30:31', '2023-12-22 01:30:31'),
(46, 0, 14, 1.00000000, 0.00000000, 0.00000000, '+', 'S77Z8TW1SPME', 'Commission for cash in', 'cash_in_commission', '2023-12-22 01:30:31', '2023-12-22 01:30:31'),
(47, 12, 0, 12.00000000, 5.60000000, 17.90000000, '-', '3X3C5WBYJMCT', 'Send money to 2712345678', 'send_money', '2023-12-22 01:35:39', '2023-12-22 01:35:39'),
(48, 11, 0, 12.00000000, 0.00000000, 100.00000000, '+', 'VQ3BRRXE34CH', 'Received money from 8801779435375', 'send_money', '2023-12-22 01:35:39', '2023-12-22 01:35:39'),
(49, 12, 0, 10.00000000, 5.50000000, 24.50000000, '-', 'CJOOH1XUB5CP', 'Send money to 2712345678', 'send_money', '2023-12-22 01:36:56', '2023-12-22 01:36:56'),
(50, 11, 0, 10.00000000, 0.00000000, 110.00000000, '+', 'ZVESNSSX5PCK', 'Received money from 8801779435375', 'send_money', '2023-12-22 01:36:56', '2023-12-22 01:36:56'),
(51, 0, 14, 100.00000000, 0.00000000, 400.00000000, '-', 'BWROAEN8DPWH', 'Cash in for demou', 'cash_in', '2023-12-22 01:39:42', '2023-12-22 01:39:42'),
(52, 12, 0, 100.00000000, 17.00000000, 107.50000000, '+', 'XG4D62AXQNE6', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-22 01:39:42', '2023-12-22 01:39:42'),
(53, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '9ATA31219GP7', 'Commission for cash in', 'cash_in_commission', '2023-12-22 01:39:42', '2023-12-22 01:39:42'),
(54, 0, 14, 100.00000000, 0.00000000, 300.00000000, '-', '3JKSKKYRD221', 'Cash in for demou', 'cash_in', '2023-12-23 21:30:28', '2023-12-23 21:30:28'),
(55, 12, 0, 100.00000000, 17.00000000, 190.50000000, '+', 'M6EP8WX2CNK4', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-23 21:30:28', '2023-12-23 21:30:28'),
(56, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '2VD691VZ3YD5', 'Commission for cash in', 'cash_in_commission', '2023-12-23 21:30:28', '2023-12-23 21:30:28'),
(57, 0, 14, 100.00000000, 0.00000000, 200.00000000, '-', 'VCB12V6UHURC', 'Cash in for demou', 'cash_in', '2023-12-23 21:35:12', '2023-12-23 21:35:12'),
(58, 12, 0, 100.00000000, 17.00000000, 273.50000000, '+', 'EBQM4HA1XKJX', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-23 21:35:12', '2023-12-23 21:35:12'),
(59, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'FGRQ2KOBTQWB', 'Commission for cash in', 'cash_in_commission', '2023-12-23 21:35:12', '2023-12-23 21:35:12'),
(60, 0, 14, 100.00000000, 0.00000000, 100.00000000, '-', 'M2Y8M3P6BJS4', 'Cash in for demou', 'cash_in', '2023-12-23 21:37:54', '2023-12-23 21:37:54'),
(61, 12, 0, 100.00000000, 17.00000000, 356.50000000, '+', 'EEXG14WRMAGO', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-23 21:37:54', '2023-12-23 21:37:54'),
(62, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '49SYJ4SMRVEB', 'Commission for cash in', 'cash_in_commission', '2023-12-23 21:37:54', '2023-12-23 21:37:54'),
(63, 0, 14, 10.00000000, 0.00000000, 90.00000000, '-', 'QPF947P7AXCV', 'Cash in for demou', 'cash_in', '2023-12-23 21:39:26', '2023-12-23 21:39:26'),
(64, 12, 0, 10.00000000, 12.50000000, 354.00000000, '+', 'YJNRVXD323DO', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-23 21:39:26', '2023-12-23 21:39:26'),
(65, 0, 14, 0.20000000, 0.00000000, 0.00000000, '+', '2V73EVF88NJH', 'Commission for cash in', 'cash_in_commission', '2023-12-23 21:39:26', '2023-12-23 21:39:26'),
(66, 0, 14, 80.00000000, 0.00000000, 10.00000000, '-', 'D73PT4OEKTBK', 'Cash in for demou', 'cash_in', '2023-12-23 21:52:34', '2023-12-23 21:52:34'),
(67, 0, 14, 13.00000000, 0.00000000, 87.00000000, '-', '3GWP2TVGUNQR', 'Cash in for demou', 'cash_in', '2023-12-23 22:35:19', '2023-12-23 22:35:19'),
(68, 12, 0, 13.00000000, 12.65000000, 50.35000000, '+', 'TZOOAYBMRNOC', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-23 22:35:19', '2023-12-23 22:35:19'),
(69, 0, 14, 0.26000000, 0.00000000, 0.00000000, '+', 'YCGO539FTZDP', 'Commission for cash in', 'cash_in_commission', '2023-12-23 22:35:19', '2023-12-23 22:35:19'),
(70, 0, 14, 20.00000000, 0.00000000, 67.00000000, '-', 'COV64FMG6N7D', 'Cash in for demou', 'cash_in', '2023-12-23 23:29:32', '2023-12-23 23:29:32'),
(71, 12, 0, 20.00000000, 13.00000000, 57.35000000, '+', 'UE2XFKXDJP4K', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-23 23:29:32', '2023-12-23 23:29:32'),
(72, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'GVX9BN5QEC14', 'Commission for cash in', 'cash_in_commission', '2023-12-23 23:29:32', '2023-12-23 23:29:32'),
(73, 0, 9, 100.00000000, 0.00000000, 400.00000000, '+', '6P1HTOGO2EA8', 'Cash out for demoufromdemoagenttwo', 'cash_out', '2023-12-23 23:45:38', '2023-12-23 23:45:38'),
(74, 0, 14, 100.00000000, 0.00000000, 167.00000000, '+', 'J3FNQKF87PG4', 'Cash out for demoufromfakeagenttwo', 'cash_out', '2023-12-23 23:48:48', '2023-12-23 23:48:48'),
(75, 12, 0, 100.00000000, 17.00000000, 383.00000000, '-', 'M8ORA9VPC5YS', 'Cash out from fakeagenttwo', 'cash_in', '2023-12-23 23:48:48', '2023-12-23 23:48:48'),
(76, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'ZVJHRPGFCCP7', 'Commission for cash out', 'cash_in_commission', '2023-12-23 23:48:48', '2023-12-23 23:48:48'),
(77, 0, 14, 100.00000000, 0.00000000, 267.00000000, '+', 'O5E5ZYSKQ2NY', 'Cash out for demoufromfakeagenttwo', 'cash_out', '2023-12-23 23:49:41', '2023-12-23 23:49:41'),
(78, 12, 0, 100.00000000, 17.00000000, 266.00000000, '-', 'ENP76DET3WR9', 'Cash out from fakeagenttwo', 'cash_in', '2023-12-23 23:49:41', '2023-12-23 23:49:41'),
(79, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'CY21SK7HZKXO', 'Commission for cash out', 'cash_in_commission', '2023-12-23 23:49:41', '2023-12-23 23:49:41'),
(80, 0, 14, 100.00000000, 0.00000000, 367.00000000, '+', 'PF9SKSMX38JJ', 'Cash out for demoufromfakeagenttwo', 'cash_out', '2023-12-23 23:50:30', '2023-12-23 23:50:30'),
(81, 12, 0, 100.00000000, 17.00000000, 149.00000000, '-', 'FKBA6G34H3A7', 'Cash out from fakeagenttwo', 'cash_in', '2023-12-23 23:50:30', '2023-12-23 23:50:30'),
(82, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '2P6JW9ZEDNZ2', 'Commission for cash out', 'cash_in_commission', '2023-12-23 23:50:30', '2023-12-23 23:50:30'),
(83, 12, 0, 50.00000000, 7.50000000, 91.50000000, '-', 'NWE2QQC48OXZ', 'Send money to 93123456789', 'send_money', '2023-12-24 00:14:46', '2023-12-24 00:14:46'),
(84, 2, 0, 50.00000000, 0.00000000, 150.00000000, '+', 'QMPQRQOMCPPC', 'Received money from 8801779435375', 'send_money', '2023-12-24 00:14:46', '2023-12-24 00:14:46'),
(85, 2, 0, 100.00000000, 10.00000000, 40.00000000, '-', 'D2BWEWWP7MP2', 'Send money to 8801779435375', 'send_money', '2023-12-24 01:22:17', '2023-12-24 01:22:17'),
(86, 12, 0, 100.00000000, 0.00000000, 191.50000000, '+', 'ZVCKG76PHPCD', 'Received money from 93123456789', 'send_money', '2023-12-24 01:22:17', '2023-12-24 01:22:17'),
(87, 2, 0, 20.00000000, 6.00000000, 14.00000000, '-', '74NHBNFB89FM', 'Send money to 8801779435375', 'send_money', '2023-12-24 01:32:22', '2023-12-24 01:32:22'),
(88, 12, 0, 20.00000000, 0.00000000, 211.50000000, '+', '4R81H8T2U6Q5', 'Received money from 93123456789', 'send_money', '2023-12-24 01:32:22', '2023-12-24 01:32:22'),
(89, 12, 0, 10.00000000, 5.50000000, 196.00000000, '-', 'AZTOP8PVREK7', 'Send money to 93123456789', 'send_money', '2023-12-24 01:36:08', '2023-12-24 01:36:08'),
(90, 2, 0, 10.00000000, 0.00000000, 24.00000000, '+', 'M24MWJSX5HY7', 'Received money from 8801779435375', 'send_money', '2023-12-24 01:36:08', '2023-12-24 01:36:08'),
(91, 0, 3, 13.00000000, 0.00000000, 87.00000000, '-', 'P5ZC4R73T9UR', 'Cash in for demouser7', 'cash_in', '2023-12-24 02:54:01', '2023-12-24 02:54:01'),
(92, 11, 0, 13.00000000, 12.65000000, 110.35000000, '+', 'OJZE9UANWBN4', 'Cash in from demoa', 'cash_in', '2023-12-24 02:54:01', '2023-12-24 02:54:01'),
(93, 0, 3, 0.26000000, 0.00000000, 0.00000000, '+', 'R2NEFHEKPS5X', 'Commission for cash in', 'cash_in_commission', '2023-12-24 02:54:01', '2023-12-24 02:54:01'),
(94, 0, 14, 16.00000000, 0.00000000, 383.00000000, '+', 'JS9J3AP6T6VC', 'Cash out for abcfromfakeagenttwo', 'cash_out', '2023-12-24 19:09:57', '2023-12-24 19:09:57'),
(95, 12, 0, 16.00000000, 12.80000000, 167.20000000, '-', 'G2CT9G92AHTR', 'Cash out from fakeagenttwo', 'cash_in', '2023-12-24 19:09:57', '2023-12-24 19:09:57'),
(96, 0, 14, 0.32000000, 0.00000000, 0.00000000, '+', 'TZV1PQUK8EQD', 'Commission for cash out', 'cash_in_commission', '2023-12-24 19:09:57', '2023-12-24 19:09:57'),
(97, 12, 0, 13.00000000, 5.65000000, 148.55000000, '-', 'X4MVHQUABJXN', 'Send money to 2712345678', 'send_money', '2023-12-25 22:55:43', '2023-12-25 22:55:43'),
(98, 11, 0, 13.00000000, 0.00000000, 123.35000000, '+', '5STH2KD6YHJ3', 'Received money from 8801779435375', 'send_money', '2023-12-25 22:55:43', '2023-12-25 22:55:43'),
(99, 12, 0, 15.00000000, 5.75000000, 127.80000000, '-', '856G58DBP7QK', 'Send money to 2712345678', 'send_money', '2023-12-25 22:56:24', '2023-12-25 22:56:24'),
(100, 11, 0, 15.00000000, 0.00000000, 138.35000000, '+', '11351O3O1PCR', 'Received money from 8801779435375', 'send_money', '2023-12-25 22:56:24', '2023-12-25 22:56:24'),
(101, 0, 14, 20.00000000, 0.00000000, 403.00000000, '+', 'YKU71NPU47GU', 'Cash out for abcfromfakeagenttwo', 'cash_out', '2023-12-25 23:00:15', '2023-12-25 23:00:15'),
(102, 12, 0, 20.00000000, 13.00000000, 94.80000000, '-', 'AP2GGSUFYK7M', 'Cash out from fakeagenttwo', 'cash_in', '2023-12-25 23:00:15', '2023-12-25 23:00:15'),
(103, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '9N9XU7NOG171', 'Commission for cash out', 'cash_in_commission', '2023-12-25 23:00:15', '2023-12-25 23:00:15'),
(104, 12, 0, 100.00000000, 2.00000000, 194.80000000, '+', 'N3GOYC7DQKOR', 'Deposit Via Stripe Storefront - USD', 'deposit', '2023-12-25 23:39:54', '2023-12-25 23:39:54'),
(105, 12, 0, 15.00000000, 0.15000000, 179.80000000, '-', 'ZYWZJAZ5XQKE', '14.85 USD Withdraw Via Demo One', 'withdraw', '2023-12-26 00:07:36', '2023-12-26 00:07:36'),
(106, 0, 14, 15.00000000, 0.00000000, 388.00000000, '-', 'YHHP6RNEA78O', 'Cash in for demouser', 'cash_in', '2023-12-26 20:06:31', '2023-12-26 20:06:31'),
(107, 1, 0, 15.00000000, 12.75000000, 212.25000000, '+', 'TGP5BMREV4TP', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-26 20:06:31', '2023-12-26 20:06:31'),
(108, 0, 14, 0.30000000, 0.00000000, 0.00000000, '+', 'HKXQQWMZX4CJ', 'Commission for cash in', 'cash_in_commission', '2023-12-26 20:06:31', '2023-12-26 20:06:31'),
(109, 0, 14, 10.00000000, 0.10000000, 378.00000000, '-', '4VNYFENKHH7T', '9.90 USD Withdraw Via Demo One', 'withdraw', '2023-12-26 20:31:39', '2023-12-26 20:31:39'),
(110, 0, 14, 13.00000000, 0.00000000, 365.00000000, '-', 'F9JW914BCYSC', 'Cash in for abc', 'cash_in', '2023-12-29 07:46:14', '2023-12-29 07:46:14'),
(111, 12, 0, 13.00000000, 12.65000000, 180.15000000, '+', '5Y8OHNSS3GEZ', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-29 07:46:14', '2023-12-29 07:46:14'),
(112, 0, 14, 0.26000000, 0.00000000, 0.00000000, '+', '7QMKE4BR2F4G', 'Commission for cash in', 'cash_in_commission', '2023-12-29 07:46:14', '2023-12-29 07:46:14'),
(113, 0, 14, 20.00000000, 0.00000000, 345.00000000, '-', 'GEODZBTW4XW5', 'Cash in for abc', 'cash_in', '2023-12-29 07:46:50', '2023-12-29 07:46:50'),
(114, 12, 0, 20.00000000, 13.00000000, 187.15000000, '+', 'VJO9W7SAETOD', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-29 07:46:50', '2023-12-29 07:46:50'),
(115, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'P289S3AWK6ZX', 'Commission for cash in', 'cash_in_commission', '2023-12-29 07:46:50', '2023-12-29 07:46:50'),
(116, 0, 14, 50.00000000, 1.50000000, 395.00000000, '+', 'VSOPEYBVNAGK', 'Deposit Via Stripe Storefront - USD', 'deposit', '2023-12-29 07:53:20', '2023-12-29 07:53:20'),
(117, 0, 14, 15.00000000, 0.15000000, 380.00000000, '-', 'DJ87356EKWXP', '14.85 USD Withdraw Via Demo One', 'withdraw', '2023-12-29 08:11:26', '2023-12-29 08:11:26'),
(118, 0, 14, 100.00000000, 0.00000000, 480.00000000, '+', 'OAYEAVUKDTST', 'Cash out for demouserfromfakeagenttwo', 'cash_out', '2023-12-30 15:22:41', '2023-12-30 15:22:41'),
(119, 1, 0, 100.00000000, 17.00000000, 95.25000000, '-', 'NJXBFT1GA9OU', 'Cash out from fakeagenttwo', 'cash_in', '2023-12-30 15:22:41', '2023-12-30 15:22:41'),
(120, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '4YW4UO7VEZ6B', 'Commission for cash out', 'cash_in_commission', '2023-12-30 15:22:41', '2023-12-30 15:22:41'),
(121, 0, 12, 40.00000000, 0.00000000, 400.00000000, '+', '1A9PRMA3PE76', 'Cash out for abcfromdemoagentfour', 'cash_out', '2023-12-30 17:01:52', '2023-12-30 17:01:52'),
(122, 12, 0, 40.00000000, 14.00000000, 133.15000000, '-', '9FU9HO4VDVVK', 'Cash out from demoagentfour', 'cash_in', '2023-12-30 17:01:52', '2023-12-30 17:01:52'),
(123, 0, 12, 0.80000000, 0.00000000, 0.00000000, '+', 'OU2NNJDJ1CPE', 'Commission for cash out', 'cash_in_commission', '2023-12-30 17:01:52', '2023-12-30 17:01:52'),
(124, 0, 14, 20.00000000, 0.00000000, 460.00000000, '-', 'ANTOE279ENT4', 'Cash in for demouser', 'cash_in', '2023-12-31 20:54:41', '2023-12-31 20:54:41'),
(125, 1, 0, 20.00000000, 13.00000000, 102.25000000, '+', 'EJC7RJ1UVJWD', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 20:54:41', '2023-12-31 20:54:41'),
(126, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'G7XH72N6FGMP', 'Commission for cash in', 'cash_in_commission', '2023-12-31 20:54:41', '2023-12-31 20:54:41'),
(127, 0, 14, 20.00000000, 0.00000000, 440.00000000, '-', '2J3NBQATT3R9', 'Cash in for demouser', 'cash_in', '2023-12-31 20:55:10', '2023-12-31 20:55:10'),
(128, 1, 0, 20.00000000, 13.00000000, 109.25000000, '+', '4RQCWJQQPRYS', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 20:55:10', '2023-12-31 20:55:10'),
(129, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'KUUDRU1XUW3Z', 'Commission for cash in', 'cash_in_commission', '2023-12-31 20:55:10', '2023-12-31 20:55:10'),
(130, 0, 14, 20.00000000, 0.00000000, 420.00000000, '-', '71KSQJWTM1RA', 'Cash in for demouser', 'cash_in', '2023-12-31 20:56:10', '2023-12-31 20:56:10'),
(131, 1, 0, 20.00000000, 13.00000000, 116.25000000, '+', 'RGTF8NQX1O1Y', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 20:56:10', '2023-12-31 20:56:10'),
(132, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'O7GDC3WNN7QC', 'Commission for cash in', 'cash_in_commission', '2023-12-31 20:56:10', '2023-12-31 20:56:10'),
(133, 0, 14, 20.00000000, 0.00000000, 400.00000000, '-', 'HWS8JSX4PUD7', 'Cash in for demouser', 'cash_in', '2023-12-31 20:57:37', '2023-12-31 20:57:37'),
(134, 1, 0, 20.00000000, 13.00000000, 123.25000000, '+', 'VT7AD61F413S', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 20:57:37', '2023-12-31 20:57:37'),
(135, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'AUMYOZGHM4TP', 'Commission for cash in', 'cash_in_commission', '2023-12-31 20:57:37', '2023-12-31 20:57:37'),
(136, 0, 14, 20.00000000, 0.00000000, 380.00000000, '-', 'ZAUDUC6QJXE8', 'Cash in for demouser', 'cash_in', '2023-12-31 20:58:53', '2023-12-31 20:58:53'),
(137, 1, 0, 20.00000000, 13.00000000, 130.25000000, '+', 'GJGXAPQ5DZ54', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 20:58:53', '2023-12-31 20:58:53'),
(138, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '42YXXVTE9GQA', 'Commission for cash in', 'cash_in_commission', '2023-12-31 20:58:53', '2023-12-31 20:58:53'),
(139, 0, 14, 20.00000000, 0.00000000, 360.00000000, '-', 'WJXETOHCWGZO', 'Cash in for demouser', 'cash_in', '2023-12-31 20:59:37', '2023-12-31 20:59:37'),
(140, 1, 0, 20.00000000, 13.00000000, 137.25000000, '+', 'WBG9DCJC62Z5', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 20:59:37', '2023-12-31 20:59:37'),
(141, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '83O1WMVAQDVR', 'Commission for cash in', 'cash_in_commission', '2023-12-31 20:59:37', '2023-12-31 20:59:37'),
(142, 0, 14, 17.00000000, 0.00000000, 343.00000000, '-', 'A3N49ZW3B2SJ', 'Cash in for demouser', 'cash_in', '2023-12-31 21:00:07', '2023-12-31 21:00:07'),
(143, 1, 0, 17.00000000, 12.85000000, 141.40000000, '+', 'GEO68KC8E16E', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:00:07', '2023-12-31 21:00:07'),
(144, 0, 14, 0.34000000, 0.00000000, 0.00000000, '+', 'RWNRWDB9FFUG', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:00:07', '2023-12-31 21:00:07'),
(145, 0, 14, 13.00000000, 0.00000000, 330.00000000, '-', 'AB7A5MPU3Y9Y', 'Cash in for demouser', 'cash_in', '2023-12-31 21:00:50', '2023-12-31 21:00:50'),
(146, 1, 0, 13.00000000, 12.65000000, 141.75000000, '+', 'WPSWY82JQNEA', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:00:50', '2023-12-31 21:00:50'),
(147, 0, 14, 0.26000000, 0.00000000, 0.00000000, '+', 'GMZ4PGTNPCQ2', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:00:50', '2023-12-31 21:00:50'),
(148, 0, 14, 13.00000000, 0.00000000, 317.00000000, '-', '5NNES9U1EPMV', 'Cash in for demouser', 'cash_in', '2023-12-31 21:01:21', '2023-12-31 21:01:21'),
(149, 1, 0, 13.00000000, 12.65000000, 142.10000000, '+', '3S3R1BKE9KWO', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:01:21', '2023-12-31 21:01:21'),
(150, 0, 14, 0.26000000, 0.00000000, 0.00000000, '+', 'D64KQDW4OCDU', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:01:21', '2023-12-31 21:01:21'),
(151, 0, 14, 13.00000000, 0.00000000, 304.00000000, '-', '9NOHUEOJ3WSU', 'Cash in for demouser', 'cash_in', '2023-12-31 21:01:58', '2023-12-31 21:01:58'),
(152, 1, 0, 13.00000000, 12.65000000, 142.45000000, '+', 'AHU3DM63EXKZ', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:01:58', '2023-12-31 21:01:58'),
(153, 0, 14, 0.26000000, 0.00000000, 0.00000000, '+', 'W7A6HWW7KAYJ', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:01:58', '2023-12-31 21:01:58'),
(154, 0, 14, 20.00000000, 0.00000000, 284.00000000, '-', 'BXRGMOZYTTFG', 'Cash in for demouser', 'cash_in', '2023-12-31 21:05:18', '2023-12-31 21:05:18'),
(155, 1, 0, 20.00000000, 13.00000000, 149.45000000, '+', '2867NNNN21GF', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:05:18', '2023-12-31 21:05:18'),
(156, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '8SQ6K8CN8CG3', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:05:18', '2023-12-31 21:05:18'),
(157, 0, 14, 20.00000000, 0.00000000, 264.00000000, '-', 'PR229KH9WCYJ', 'Cash in for demouser', 'cash_in', '2023-12-31 21:06:07', '2023-12-31 21:06:07'),
(158, 1, 0, 20.00000000, 13.00000000, 156.45000000, '+', '57QVSFW4XF6G', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:06:07', '2023-12-31 21:06:07'),
(159, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '4EY5JRBZOUR1', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:06:07', '2023-12-31 21:06:07'),
(160, 0, 14, 20.00000000, 0.00000000, 244.00000000, '-', 'FO75MAKJTTMM', 'Cash in for demouser', 'cash_in', '2023-12-31 21:09:57', '2023-12-31 21:09:57'),
(161, 1, 0, 20.00000000, 13.00000000, 163.45000000, '+', 'MUEOR2GE5ADZ', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:09:57', '2023-12-31 21:09:57'),
(162, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'WRXT4XCHCPT6', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:09:57', '2023-12-31 21:09:57'),
(163, 0, 14, 20.00000000, 0.00000000, 224.00000000, '-', '27ST234S3J4D', 'Cash in for demouser', 'cash_in', '2023-12-31 21:13:39', '2023-12-31 21:13:39'),
(164, 1, 0, 20.00000000, 13.00000000, 170.45000000, '+', 'QASJK3VY56JA', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:13:39', '2023-12-31 21:13:39'),
(165, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '7NKQ8864XNG9', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:13:39', '2023-12-31 21:13:39'),
(166, 0, 14, 20.00000000, 0.00000000, 204.00000000, '-', 'JF7GEJS4CU8H', 'Cash in for demouser', 'cash_in', '2023-12-31 21:15:09', '2023-12-31 21:15:09'),
(167, 1, 0, 20.00000000, 13.00000000, 177.45000000, '+', '37RUWNF49XJP', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:15:09', '2023-12-31 21:15:09'),
(168, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'XEB5FKJUGKSD', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:15:09', '2023-12-31 21:15:09'),
(169, 0, 14, 20.00000000, 0.00000000, 184.00000000, '-', 'OT22KBMXX6F8', 'Cash in for demouser', 'cash_in', '2023-12-31 21:15:36', '2023-12-31 21:15:36'),
(170, 1, 0, 20.00000000, 13.00000000, 184.45000000, '+', 'UGWWP8Q541D2', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:15:36', '2023-12-31 21:15:36'),
(171, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'REUZDDHMBWTR', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:15:36', '2023-12-31 21:15:36'),
(172, 0, 14, 20.00000000, 0.00000000, 164.00000000, '-', 'FP9BW7M4MRFX', 'Cash in for demouser', 'cash_in', '2023-12-31 21:16:01', '2023-12-31 21:16:01'),
(173, 1, 0, 20.00000000, 13.00000000, 191.45000000, '+', 'GRZDP4V14DGC', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:16:01', '2023-12-31 21:16:01'),
(174, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'MMXK19OPWTSF', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:16:01', '2023-12-31 21:16:01'),
(175, 0, 14, 20.00000000, 0.00000000, 144.00000000, '-', 'VDREAUXQOFNK', 'Cash in for demouser', 'cash_in', '2023-12-31 21:17:00', '2023-12-31 21:17:00'),
(176, 1, 0, 20.00000000, 13.00000000, 198.45000000, '+', 'PSFPHNOWGMSM', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:17:00', '2023-12-31 21:17:00'),
(177, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'QCCJ2X2R938G', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:17:00', '2023-12-31 21:17:00'),
(178, 0, 14, 20.00000000, 0.00000000, 124.00000000, '-', 'S1JECMW1XW5J', 'Cash in for demouser', 'cash_in', '2023-12-31 21:17:57', '2023-12-31 21:17:57'),
(179, 1, 0, 20.00000000, 13.00000000, 205.45000000, '+', 'SRE751NJ2T6X', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:17:57', '2023-12-31 21:17:57'),
(180, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'BCTJ9J5W8DZ2', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:17:57', '2023-12-31 21:17:57'),
(181, 0, 14, 20.00000000, 0.00000000, 104.00000000, '-', 'M1KMFASH1DMA', 'Cash in for demouser', 'cash_in', '2023-12-31 21:18:08', '2023-12-31 21:18:08'),
(182, 1, 0, 20.00000000, 13.00000000, 212.45000000, '+', '8CVGU47GZRF3', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:18:08', '2023-12-31 21:18:08'),
(183, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'N1MZGJZWZ789', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:18:08', '2023-12-31 21:18:08'),
(184, 0, 14, 20.00000000, 0.00000000, 84.00000000, '-', 'TMZYCZ51SG3M', 'Cash in for demouser', 'cash_in', '2023-12-31 21:22:07', '2023-12-31 21:22:07'),
(185, 1, 0, 20.00000000, 13.00000000, 219.45000000, '+', 'DT4H8V1RDA2R', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:22:07', '2023-12-31 21:22:07'),
(186, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '47OPMOZ9CK4X', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:22:07', '2023-12-31 21:22:07'),
(187, 0, 14, 20.00000000, 0.00000000, 64.00000000, '-', 'JY5EPJJF9GCY', 'Cash in for demouser', 'cash_in', '2023-12-31 21:23:46', '2023-12-31 21:23:46'),
(188, 1, 0, 20.00000000, 13.00000000, 226.45000000, '+', 'F1KTBZEEOK7E', 'Cash in from fakeagenttwo', 'cash_in', '2023-12-31 21:23:46', '2023-12-31 21:23:46'),
(189, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'G22AT314RR11', 'Commission for cash in', 'cash_in_commission', '2023-12-31 21:23:46', '2023-12-31 21:23:46'),
(190, 0, 14, 20.00000000, 0.00000000, 44.00000000, '-', 'X87C3TEEXV1P', 'Cash in for demouser6', 'cash_in', '2024-01-01 14:39:44', '2024-01-01 14:39:44'),
(191, 10, 0, 20.00000000, 13.00000000, 183.00000000, '+', 'KTKJK3HVK4QY', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 14:39:44', '2024-01-01 14:39:44'),
(192, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '3Q8E6RXCP1QW', 'Commission for cash in', 'cash_in_commission', '2024-01-01 14:39:44', '2024-01-01 14:39:44'),
(193, 0, 14, 500.00000000, 6.00000000, 504.00000000, '+', 'H8YV3N51RWSS', 'Deposit Via Stripe Storefront - USD', 'deposit', '2024-01-01 16:00:53', '2024-01-01 16:00:53'),
(194, 0, 14, 18.00000000, 0.00000000, 326.00000000, '-', '1175XAK6TC1E', 'Cash in for demouser', 'cash_in', '2024-01-01 18:05:34', '2024-01-01 18:05:34'),
(195, 1, 0, 18.00000000, 12.90000000, 299.55000000, '+', 'DCPM997UOHMU', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:05:34', '2024-01-01 18:05:34'),
(196, 0, 14, 0.36000000, 0.00000000, 0.00000000, '+', '74JRWDM6SBNM', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:05:34', '2024-01-01 18:05:34'),
(197, 0, 14, 20.00000000, 0.00000000, 306.00000000, '-', 'DVVHQ5Z21Q92', 'Cash in for demouser', 'cash_in', '2024-01-01 18:06:56', '2024-01-01 18:06:56'),
(198, 1, 0, 20.00000000, 13.00000000, 306.55000000, '+', 'EZWVQGWXO8VT', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:06:56', '2024-01-01 18:06:56'),
(199, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'TC45ETP42YO8', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:06:56', '2024-01-01 18:06:56'),
(200, 0, 14, 15.00000000, 0.00000000, 291.00000000, '-', 'UUWD1YF8QD4E', 'Cash in for demouser', 'cash_in', '2024-01-01 18:09:48', '2024-01-01 18:09:48'),
(201, 1, 0, 15.00000000, 12.75000000, 308.80000000, '+', 'JNVMJVAAZCFG', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:09:48', '2024-01-01 18:09:48'),
(202, 0, 14, 0.30000000, 0.00000000, 0.00000000, '+', 'SO5XR8NRMQYN', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:09:48', '2024-01-01 18:09:48'),
(203, 0, 14, 15.00000000, 0.00000000, 276.00000000, '-', 'CDEQ32H6EZHD', 'Cash in for demouser', 'cash_in', '2024-01-01 18:10:23', '2024-01-01 18:10:23'),
(204, 1, 0, 15.00000000, 12.75000000, 311.05000000, '+', '69ZX5JVT9M5C', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:10:23', '2024-01-01 18:10:23'),
(205, 0, 14, 0.30000000, 0.00000000, 0.00000000, '+', 'KUPV5WJJT82N', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:10:23', '2024-01-01 18:10:23'),
(206, 0, 14, 99.00000000, 0.00000000, 177.00000000, '-', 'C181UJJABRWZ', 'Cash in for demosajib', 'cash_in', '2024-01-01 18:13:21', '2024-01-01 18:13:21'),
(207, 17, 0, 99.00000000, 16.95000000, 82.05000000, '+', '967BK6ORGM39', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:13:21', '2024-01-01 18:13:21'),
(208, 0, 14, 1.98000000, 0.00000000, 0.00000000, '+', 'PZU9VV22XMFB', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:13:21', '2024-01-01 18:13:21'),
(209, 0, 14, 100.00000000, 0.00000000, 77.00000000, '-', 'WBVOW3AMYSVJ', 'Cash in for demosajib', 'cash_in', '2024-01-01 18:17:26', '2024-01-01 18:17:26'),
(210, 17, 0, 100.00000000, 17.00000000, 165.05000000, '+', 'T59B8JANDUOJ', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:17:26', '2024-01-01 18:17:26'),
(211, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'MS3AU8CHUPUX', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:17:26', '2024-01-01 18:17:26'),
(212, 15, 0, 10.00000000, 0.00000000, 10.00000000, '+', '8A66YVJP3J6E', 'Level 1 referral commission From shahnewaj', 'referral', '2024-01-01 18:17:26', NULL),
(213, 0, 14, 100.00000000, 0.00000000, 400.00000000, '-', 'JTRB3N76E7DD', 'Cash in for demouser', 'cash_in', '2024-01-01 18:21:02', '2024-01-01 18:21:02'),
(214, 1, 0, 100.00000000, 17.00000000, 394.05000000, '+', 'QP3YXX52FOB6', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:21:02', '2024-01-01 18:21:02'),
(215, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'U4Y3RQ54HOS2', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:21:02', '2024-01-01 18:21:02'),
(216, 2, 0, 10.00000000, 0.00000000, 34.00000000, '+', 'W5HO2WYOXFDU', 'Level 1 referral commission From demouser2', 'referral', '2024-01-01 18:21:02', NULL),
(217, 3, 0, 8.00000000, 0.00000000, 103.00000000, '+', 'F56GBET4DXYU', 'Level 2 referral commission From demouser3', 'referral', '2024-01-01 18:21:02', NULL),
(218, 4, 0, 6.00000000, 0.00000000, 189.00000000, '+', '2N3R13Y35QQZ', 'Level 3 referral commission From demouser4', 'referral', '2024-01-01 18:21:02', NULL),
(219, 5, 0, 3.00000000, 0.00000000, 86.00000000, '+', 'ORE3KC11AB3X', 'Level 4 referral commission From demouser5', 'referral', '2024-01-01 18:21:02', NULL),
(220, 0, 14, 100.00000000, 0.00000000, 300.00000000, '-', 'T5W34GH3ODOO', 'Cash in for demouser', 'cash_in', '2024-01-01 18:21:49', '2024-01-01 18:21:49'),
(221, 1, 0, 100.00000000, 17.00000000, 477.05000000, '+', 'PHXP3MNN14BA', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:21:49', '2024-01-01 18:21:49'),
(222, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '1HMUC2NW2PV1', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:21:49', '2024-01-01 18:21:49'),
(223, 2, 0, 10.00000000, 0.00000000, 44.00000000, '+', 'AP5Z3YMOKK42', 'Level 1 referral commission From demouser2', 'referral', '2024-01-01 18:21:49', NULL),
(224, 3, 0, 8.00000000, 0.00000000, 111.00000000, '+', 'ZW54Y5KUMKKX', 'Level 2 referral commission From demouser3', 'referral', '2024-01-01 18:21:49', NULL),
(225, 4, 0, 6.00000000, 0.00000000, 195.00000000, '+', 'JA4J33HBJ26U', 'Level 3 referral commission From demouser4', 'referral', '2024-01-01 18:21:49', NULL),
(226, 5, 0, 3.00000000, 0.00000000, 89.00000000, '+', 'YFMU5ANA1O77', 'Level 4 referral commission From demouser5', 'referral', '2024-01-01 18:21:49', NULL),
(227, 0, 14, 100.00000000, 0.00000000, 200.00000000, '-', 'N9J3FJYSW9HG', 'Cash in for demouser', 'cash_in', '2024-01-01 18:25:20', '2024-01-01 18:25:20'),
(228, 1, 0, 100.00000000, 17.00000000, 560.05000000, '+', 'A44PNKGZ3GYK', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:25:20', '2024-01-01 18:25:20'),
(229, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', 'BZS7QEXH2E6X', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:25:20', '2024-01-01 18:25:20'),
(230, 2, 0, 10.00000000, 0.00000000, 54.00000000, '+', 'NMHJSGTH6AJG', 'Level 1 referral commission From demouser2', 'referral', '2024-01-01 18:25:20', NULL),
(231, 3, 0, 8.00000000, 0.00000000, 119.00000000, '+', '2ODC95WERZEZ', 'Level 2 referral commission From demouser3', 'referral', '2024-01-01 18:25:20', NULL),
(232, 4, 0, 6.00000000, 0.00000000, 201.00000000, '+', 'RK73YD3T677F', 'Level 3 referral commission From demouser4', 'referral', '2024-01-01 18:25:20', NULL),
(233, 5, 0, 3.00000000, 0.00000000, 92.00000000, '+', 'Q8T2UZSQCU7M', 'Level 4 referral commission From demouser5', 'referral', '2024-01-01 18:25:20', NULL),
(234, 0, 14, 50.00000000, 0.00000000, 150.00000000, '-', 'CQ9VMUTPHGW2', 'Cash in for demouser', 'cash_in', '2024-01-01 18:39:28', '2024-01-01 18:39:28'),
(235, 1, 0, 50.00000000, 14.50000000, 595.55000000, '+', 'MH8CUNKCME2S', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:39:28', '2024-01-01 18:39:28'),
(236, 0, 14, 1.00000000, 0.00000000, 0.00000000, '+', '18KF5EHXEDWA', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:39:28', '2024-01-01 18:39:28'),
(237, 0, 14, 20.00000000, 0.00000000, 130.00000000, '-', '2AN4496UWPC5', 'Cash in for demouser', 'cash_in', '2024-01-01 18:42:55', '2024-01-01 18:42:55'),
(238, 1, 0, 20.00000000, 13.00000000, 602.55000000, '+', 'KH6KQRDABPX5', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:42:55', '2024-01-01 18:42:55'),
(239, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', '2T8BRBPPQ2WY', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:42:55', '2024-01-01 18:42:55'),
(240, 0, 14, 20.00000000, 0.00000000, 110.00000000, '-', 'CDA8Q4HSPXGE', 'Cash in for demouser', 'cash_in', '2024-01-01 18:43:35', '2024-01-01 18:43:35'),
(241, 1, 0, 20.00000000, 13.00000000, 609.55000000, '+', 'C3RQ2OWV99UQ', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:43:35', '2024-01-01 18:43:35'),
(242, 0, 14, 0.40000000, 0.00000000, 0.00000000, '+', 'D9E3DVFQDMH4', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:43:35', '2024-01-01 18:43:35'),
(243, 0, 14, 100.00000000, 0.00000000, 10.00000000, '-', '6YPZ93SJ3ZBQ', 'Cash in for demouser', 'cash_in', '2024-01-01 18:44:12', '2024-01-01 18:44:12'),
(244, 1, 0, 100.00000000, 17.00000000, 692.55000000, '+', '73Z4GR78UOMO', 'Cash in from fakeagenttwo', 'cash_in', '2024-01-01 18:44:12', '2024-01-01 18:44:12'),
(245, 0, 14, 2.00000000, 0.00000000, 0.00000000, '+', '7AAJ1DUFF3MA', 'Commission for cash in', 'cash_in_commission', '2024-01-01 18:44:12', '2024-01-01 18:44:12'),
(246, 2, 0, 10.00000000, 0.00000000, 64.00000000, '+', 'N3B2H1H3D43V', 'Level 1 referral commission From demouser2', 'referral', '2024-01-01 18:44:12', NULL),
(247, 3, 0, 8.00000000, 0.00000000, 127.00000000, '+', 'CE18R1DEMPH8', 'Level 2 referral commission From demouser3', 'referral', '2024-01-01 18:44:12', NULL),
(248, 4, 0, 6.00000000, 0.00000000, 207.00000000, '+', 'GF9OO99O23X8', 'Level 3 referral commission From demouser4', 'referral', '2024-01-01 18:44:12', NULL),
(249, 5, 0, 3.00000000, 0.00000000, 95.00000000, '+', 'XJ9PDTFG27UG', 'Level 4 referral commission From demouser5', 'referral', '2024-01-01 18:44:12', NULL),
(250, 0, 22, 500.00000000, 6.00000000, 500.00000000, '+', 'VGDVHQ9XC3CQ', 'Deposit Via Stripe Storefront - USD', 'deposit', '2024-01-01 05:18:19', '2024-01-01 05:18:19'),
(251, 0, 22, 200.00000000, 2.00000000, 300.00000000, '-', 'C5TKQE9CT8YG', '198.00 USD Withdraw Via Demo One', 'withdraw', '2024-01-01 05:24:39', '2024-01-01 05:24:39'),
(252, 0, 22, 20.00000000, 0.00000000, 0.00000000, '-', 'JHHXFJWTVAOH', 'Cash in for demouser', 'cash_in', '2024-01-01 05:56:03', '2024-01-01 05:56:03'),
(253, 1, 0, 20.00000000, 13.00000000, 699.55000000, '+', 'P31M379G1E8P', 'Cash in from demoagentten', 'cash_in', '2024-01-01 05:56:03', '2024-01-01 05:56:03'),
(254, 0, 22, 0.40000000, 0.00000000, 0.00000000, '+', 'TW6X84JXTTWE', 'Commission for cash in', 'cash_in_commission', '2024-01-01 05:56:03', '2024-01-01 05:56:03'),
(255, 0, 22, 100.00000000, 0.00000000, 900.00000000, '-', 'RDC4TZ1G1G68', 'Cash in for demouser', 'cash_in', '2024-01-01 05:58:09', '2024-01-01 05:58:09'),
(256, 1, 0, 100.00000000, 17.00000000, 782.55000000, '+', '51CC1UG6TH45', 'Cash in from demoagentten', 'cash_in', '2024-01-01 05:58:09', '2024-01-01 05:58:09'),
(257, 0, 22, 2.00000000, 0.00000000, 0.00000000, '+', 'GMZWZ1BUPRS5', 'Commission for cash in', 'cash_in_commission', '2024-01-01 05:58:09', '2024-01-01 05:58:09'),
(258, 2, 0, 10.00000000, 0.00000000, 74.00000000, '+', 'XE4ZRG8QBZQ6', 'Level 1 referral commission From demouser2', 'referral', '2024-01-01 05:58:09', NULL),
(259, 3, 0, 8.00000000, 0.00000000, 135.00000000, '+', 'JBXOV5C4Y5G2', 'Level 2 referral commission From demouser3', 'referral', '2024-01-01 05:58:09', NULL),
(260, 4, 0, 6.00000000, 0.00000000, 213.00000000, '+', 'HQWDV1DWKPDA', 'Level 3 referral commission From demouser4', 'referral', '2024-01-01 05:58:09', NULL),
(261, 5, 0, 3.00000000, 0.00000000, 98.00000000, '+', 'EM74Z3VSPPTY', 'Level 4 referral commission From demouser5', 'referral', '2024-01-01 05:58:09', NULL),
(262, 0, 22, 100.00000000, 0.00000000, 800.00000000, '-', 'EPBEYBJK2J2D', 'Cash in for demouser', 'cash_in', '2024-01-01 05:59:02', '2024-01-01 05:59:02'),
(263, 1, 0, 100.00000000, 17.00000000, 865.55000000, '+', 'TTE7F4VSAGD6', 'Cash in from demoagentten', 'cash_in', '2024-01-01 05:59:02', '2024-01-01 05:59:02'),
(264, 0, 22, 2.00000000, 0.00000000, 0.00000000, '+', 'R7ORJMU996ZF', 'Commission for cash in', 'cash_in_commission', '2024-01-01 05:59:02', '2024-01-01 05:59:02'),
(265, 1, 0, 100.00000000, 10.00000000, 755.55000000, '-', 'OJHE8GJK83AO', 'Send money to 93123456789', 'send_money', '2024-01-02 17:07:56', '2024-01-02 17:07:56'),
(266, 2, 0, 100.00000000, 0.00000000, 174.00000000, '+', 'HNV7W5KN1MNR', 'Received money from 880123456789', 'send_money', '2024-01-02 17:07:56', '2024-01-02 17:07:56'),
(267, 1, 0, 100.00000000, 10.00000000, 645.55000000, '-', 'K36Y34QA8WST', 'Send money to 8808801779435375', 'send_money', '2024-01-02 18:06:01', '2024-01-02 18:06:01'),
(268, 21, 0, 100.00000000, 0.00000000, 100.00000000, '+', '7KGYJO6AGW8F', 'Received money from 880123456789', 'send_money', '2024-01-02 18:06:01', '2024-01-02 18:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `country_name` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text DEFAULT NULL,
  `kc` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: KYC unconfirmed, 2: KYC pending, 1: KYC confirmed',
  `ec` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: email unconfirmed, 1: email confirmed',
  `sc` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: mobile unconfirmed, 1: mobile confirmed',
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tc` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0: 2fa unconfirmed, 1: 2fa confirmed',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `image`, `firstname`, `lastname`, `username`, `email`, `country_code`, `country_name`, `mobile`, `ref_by`, `balance`, `password`, `address`, `status`, `kyc_data`, `kc`, `ec`, `sc`, `ver_code`, `ver_code_send_at`, `ts`, `tc`, `tsc`, `ban_reason`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '658980754f5131703510133.png', 'Sherrinford', 'Willum', 'demouser', 'demouser@gmail.com', 'BD', 'Bangladesh', '880123456789', 2, 645.55000000, '$2y$10$F/PKNBijOx2DUe4V7XT2J.JHiBo33GMQRvMyzGKw7EZyOf4BU5YQu', '{\"state\":\"Uttara\",\"zip\":\"1230\",\"city\":\"Dhaka\"}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"asdasd\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"asdasd\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/04\\/656cc2b0d76911701626544.png\"}]', 1, 1, 1, '578418', '2023-12-18 18:58:43', 0, 1, NULL, NULL, NULL, '2023-11-09 12:39:56', '2024-01-02 18:06:01'),
(2, '', 'Demo', 'User Two', 'demouser2', 'demotwo@gmail.com', 'AF', 'Afghanistan', '93123456789', 3, 174.00000000, '$2y$10$NhcLfz/6ORQvy5uNrwWUUe9LvQHbx3.F5utkCbzwHtfhYpzaVGnfy', '{\"city\":\"dsfdsf\",\"state\":\"sadfsdf\",\"zip\":\"dsfdsf\",\"country\":\"Afghanistan\"}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"Demo User Two\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"13245689\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/02\\/656b6254118e21701536340.png\"}]', 1, 1, 1, '938614', '2023-12-02 22:53:05', 0, 1, NULL, NULL, NULL, '2023-12-02 16:53:04', '2024-01-02 17:07:56'),
(3, NULL, 'Demo', 'Three', 'demouser3', 'demothree@demo.com', 'BH', 'Bahrain', '97312345678', 4, 135.00000000, '$2y$10$9iV79hrH/TxCjRvajYu9OuLFS25dZAtgrvutJiQSNuOW7ulWk9uEq', NULL, 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"zsdgsdfg\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"dsfgdsfgdsf\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/06\\/657076ff5a9221701869311.png\"}]', 2, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-05 16:06:26', '2024-01-01 05:58:09'),
(4, NULL, 'Demo', 'User Four', 'demouser4', 'demofour@demo.com', 'KW', 'Kuwait', '96512345678', 5, 213.00000000, '$2y$10$WMIdOJ01QcjUW9CSk1vjx.j6n4cWwD4V/T2O82ckTFYVg5m0dnUXK', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-05 16:07:25', '2024-01-01 05:58:09'),
(5, NULL, 'Demo', 'User Five', 'demouser5', 'demofive@demo.com', 'MT', 'Malta', '35612345678', 0, 98.00000000, '$2y$10$mHk3S8SI3O7MCKlhvxLi7u4Px4v9ZXWm6Ux.pLPSe4wRB6Hm7dZVW', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-05 16:09:35', '2024-01-01 05:58:09'),
(10, NULL, 'Demo', 'User Six', 'demouser6', 'demosix@demo.com', 'TM', 'Turkmenistan', '993123456789', 0, 190.00000000, '$2y$10$i3XurA7Zxy3h1dWiUP12b.s.Tcn0a9Do2gBUbmujUwz4bpvti1A7e', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-05 17:19:44', '2024-01-01 15:56:21'),
(11, NULL, 'Demo', 'User Seven', 'demouser7', 'demoseven@demo.com', 'ZA', 'South Africa', '2712345678', 0, 138.35000000, '$2y$10$.DrLjmLxOzvlmEqgHmf7zeiDiFV5WOoAEyDhwaj9HjbZHYnNfDw3i', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-05 17:20:42', '2023-12-25 22:56:24'),
(12, '658969fee47ed1703504382.png', 'demo', 'u', 'abc', 'demo@gmail.com', 'BD', 'Bangladesh', '8801779435375', 0, 133.15000000, '$2y$10$gHGfJRAPEHYYbjLvUSSKPukyz9rLHyvdwA3GxBapU/uida/CfyGiC', '{\"state\":\"Dhaka\",\"zip\":\"1219\",\"city\":\"Dhaka\"}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"demoagentthree\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"654564654654\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/12\\/6578087be8eed1702365307.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"684968496847894789\"}]', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-09 22:56:17', '2023-12-30 17:01:52'),
(15, '658ed8a832cad1703860392.jpg', 'shahnewaj', 'sajib', 'shahnewaj', 'sajibsust99@gmail.com', 'BD', 'Bangladesh', '880176456456', 0, 10.00000000, '$2y$10$trr4xA5q2J7xscOPTOb64uwyoAftCvNLLK2qZuYSImpf.fnVYnBJm', '{\"state\":null,\"zip\":null,\"city\":null}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"shahnewaj sajib\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"dfgshgfds\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2023\\/12\\/29\\/658ed9883ba561703860616.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"ergdhgehrdf\"}]', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-29 08:31:36', '2024-01-01 18:17:26'),
(16, NULL, 'fakeuser', 'fake', 'fakeuser', 'rana@gmail.com', 'AF', 'Afghanistan', '9301779435375', 0, 0.00000000, '$2y$10$/lqCcuspvVCs4cM/RQI3heU.Nnict9B.CkdmHiWnP2Iphwnshd2gC', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-29 10:09:40', '2023-12-29 10:09:40'),
(17, NULL, 'demo', 'sajib', 'demosajib', 'sajib@gmail.com', 'BD', 'Bangladesh', '8801779465454', 15, 165.05000000, '$2y$10$SY7Xf03fBOFdtdLVIF./Fe.Y4qAxBjE5ggnEpe9DVnb1vZhO8th5C', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-31 20:21:49', '2024-01-01 18:17:26'),
(18, NULL, 'demosajib', 'two', 'demosajibtwo', 'sajibfgjg@gmail.com', 'BD', 'Bangladesh', '8801455654', 17, 0.00000000, '$2y$10$0uLhHGRtEkmfhE5LEV.6eeRnoQjy421zJP8JjGeTwajzAiGZvqzOO', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-31 20:23:53', '2023-12-31 20:23:53'),
(19, NULL, 'demosajib', 'three', 'demosajibthree', 'd@d.com', 'BD', 'Bangladesh', '880345345', 18, 0.00000000, '$2y$10$Sw.9wH/Okdcs6eH/IzOHSe9y9ZW0fKoFP1vRe0y24heUPl82VttIm', NULL, 1, NULL, 0, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-12-31 20:26:34', '2023-12-31 20:26:34'),
(20, '6593a749010121704175433.png', 'demouser', 'ten', 'demouserten', 'demouserten@gmail.com', 'BD', 'Bangladesh', '8806546456465', 0, 0.00000000, '$2y$10$DXq3InyUizXPGcNRo4gFbuPWM8qz7xyNs/Y16tD8r6Rh91GgP/4HK', '{\"state\":null,\"zip\":null,\"city\":null}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"demouser\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"321321321321\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2024\\/01\\/01\\/65929fb8cec9c1704107960.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"3123213213\"}]', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2024-01-01 04:26:32', '2024-01-02 14:03:53'),
(21, NULL, 'demouser', 'twenty', 'demousertwenty', 'demousertwenty@gmail.com', 'BD', 'Bangladesh', '8808801779435375', 0, 100.00000000, '$2y$10$//nwoBpGUHeGiZnZlT0GOeltoNtoq8WGr35p328aPjsY/6sEPJszu', NULL, 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"Fake user twenty\"},{\"name\":\"Voter Id\",\"type\":\"textarea\",\"value\":\"54654654654\"},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2024\\/01\\/02\\/6593ccc1b247a1704185025.png\"},{\"name\":\"Driving License No\",\"type\":\"text\",\"value\":\"5646546\"}]', 2, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2024-01-02 16:36:55', '2024-01-02 18:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agent_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `method_id`, `user_id`, `agent_id`, `amount`, `currency`, `rate`, `charge`, `trx`, `final_amount`, `after_charge`, `withdraw_information`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(9, 2, 0, 14, 10.00000000, 'USD', 1.00000000, 0.00000000, 'DR2JEJJM1MBT', 10.00000000, 10.00000000, '[{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/65797d0d18bf91702460685.png\"}]', 1, 'great', '2023-12-13 23:44:40', '2023-12-14 00:16:37'),
(10, 2, 0, 14, 11.00000000, 'USD', 1.00000000, 0.00000000, '3NFX89XGJHOV', 11.00000000, 11.00000000, '[{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/657984a0279c51702462624.png\"}]', 1, 'As my wish', '2023-12-14 00:16:59', '2023-12-17 23:23:33'),
(11, 2, 0, 14, 20.00000000, 'USD', 1.00000000, 0.00000000, '73KDXJV4NNZB', 20.00000000, 20.00000000, '[{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2023\\/12\\/13\\/6579850074b8b1702462720.png\"}]', 3, 'bad', '2023-12-14 00:18:36', '2023-12-14 00:27:21'),
(12, 1, 0, 14, 500.00000000, 'USD', 1.00000000, 5.00000000, '7MTGB5QN6BH1', 495.00000000, 495.00000000, '[{\"name\":\"Full name\",\"type\":\"text\",\"value\":\"Fake agent two\"},{\"name\":\"Father Name\",\"type\":\"text\",\"value\":\"The demo fahter\"},{\"name\":\"Mother Name\",\"type\":\"text\",\"value\":\"The demo mother\"}]', 3, 'My wish', '2023-12-19 00:03:23', '2023-12-19 00:05:08'),
(13, 1, 12, 0, 300.00000000, 'USD', 1.00000000, 3.00000000, '1ASUJF2F233P', 297.00000000, 297.00000000, '[{\"name\":\"Full name\",\"type\":\"text\",\"value\":\"demo user\"},{\"name\":\"Father Name\",\"type\":\"text\",\"value\":\"demo\"},{\"name\":\"Mother Name\",\"type\":\"text\",\"value\":\"demo\"}]', 2, NULL, '2023-12-19 21:53:09', '2023-12-19 21:53:26'),
(14, 1, 12, 0, 15.00000000, 'USD', 1.00000000, 0.15000000, 'ZYWZJAZ5XQKE', 14.85000000, 14.85000000, '[{\"name\":\"Full name\",\"type\":\"text\",\"value\":\"shahnewaj Mohammed sajib\"},{\"name\":\"Father Name\",\"type\":\"text\",\"value\":\"Mohammed Nazrul Islam\"},{\"name\":\"Mother Name\",\"type\":\"text\",\"value\":\"Shahana Islam\"}]', 2, NULL, '2023-12-26 00:04:39', '2023-12-26 00:07:36'),
(15, 1, 0, 14, 10.00000000, 'USD', 1.00000000, 0.10000000, '4VNYFENKHH7T', 9.90000000, 9.90000000, '[{\"name\":\"Full name\",\"type\":\"text\",\"value\":\"Fake agent two\"},{\"name\":\"Father Name\",\"type\":\"text\",\"value\":\"The demo fahter\"},{\"name\":\"Mother Name\",\"type\":\"text\",\"value\":\"The demo mother\"}]', 2, NULL, '2023-12-26 20:28:32', '2023-12-26 20:31:39'),
(16, 1, 0, 14, 11.00000000, 'USD', 1.00000000, 0.11000000, 'X3QU1NVBVHWO', 10.89000000, 10.89000000, NULL, 0, NULL, '2023-12-26 20:46:20', '2023-12-26 20:46:20'),
(17, 1, 0, 14, 15.00000000, 'USD', 1.00000000, 0.15000000, 'DJ87356EKWXP', 14.85000000, 14.85000000, '[{\"name\":\"Full name\",\"type\":\"text\",\"value\":\"shahnewaj sajib\"},{\"name\":\"Father Name\",\"type\":\"text\",\"value\":\"dfsgfgg\"},{\"name\":\"Mother Name\",\"type\":\"text\",\"value\":\"gfrddfg\"}]', 2, NULL, '2023-12-29 08:11:14', '2023-12-29 08:11:26'),
(18, 1, 0, 22, 200.00000000, 'USD', 1.00000000, 2.00000000, 'KUAQJCFUBXV2', 198.00000000, 198.00000000, NULL, 0, NULL, '2024-01-01 05:24:04', '2024-01-01 05:24:04'),
(19, 1, 0, 22, 200.00000000, 'USD', 1.00000000, 2.00000000, 'C5TKQE9CT8YG', 198.00000000, 198.00000000, '[{\"name\":\"Full name\",\"type\":\"text\",\"value\":\"demoagentten\"},{\"name\":\"Father Name\",\"type\":\"text\",\"value\":\"dfsgfgg\"},{\"name\":\"Mother Name\",\"type\":\"text\",\"value\":\"gfrddfg\"}]', 1, 'yes', '2024-01-01 05:24:29', '2024-01-02 14:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE IF NOT EXISTS `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `guideline` text DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `form_id`, `name`, `min_amount`, `max_amount`, `fixed_charge`, `rate`, `percent_charge`, `currency`, `guideline`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'Demo One', 1.00000000, 1000.00000000, 0.00000000, 1.00000000, 1.00, 'USD', '<p>Demo withdrawal instruction I have given for you. Don\'t worry, Real version and data will come very soon.</p>', 1, '2023-11-21 11:15:53', '2023-11-30 06:25:14'),
(2, 7, 'Demo Two', 1.00000000, 1000.00000000, 0.00000000, 1.00000000, 0.00, 'USD', '<p>This is another demo. Let\'s have a check on this.</p>', 1, '2023-11-21 17:08:05', '2023-11-23 06:55:58');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
