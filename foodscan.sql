-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/02/2026 às 14:33
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `foodscan`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `item_id` varchar(255) NOT NULL,
  `license_code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `analytics`
--

CREATE TABLE `analytics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `analytic_sections`
--

CREATE TABLE `analytic_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `analytic_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `section` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `branches`
--

INSERT INTO `branches` (`id`, `name`, `email`, `phone`, `latitude`, `longitude`, `city`, `state`, `zip_code`, `address`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Mirpur-1 (main)', 'mirpur@inilabs.xyz', '+536464646464', '23.8042375', '90.3525979', 'Mirpur-1', 'Dhaka', '1216', 'House : 25, Road No: 2, Block A, Mirpur-1, Dhaka 1216', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `capture_payment_notifications`
--

CREATE TABLE `capture_payment_notifications` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_cryptocurrency` tinyint(3) UNSIGNED NOT NULL,
  `exchange_rate` decimal(19,2) DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `is_cryptocurrency`, `exchange_rate`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Dollars', '$', 'USD', 10, 1.00, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `default_access`
--

CREATE TABLE `default_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `default_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `default_access`
--

INSERT INTO `default_access` (`id`, `name`, `user_id`, `default_id`, `created_at`, `updated_at`) VALUES
(1, 'branch_id', 1, 1, '2026-02-07 16:54:44', '2026-02-07 16:54:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dining_tables`
--

CREATE TABLE `dining_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `dining_tables`
--

INSERT INTO `dining_tables` (`id`, `name`, `slug`, `size`, `qr_code`, `branch_id`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Mensal', 'mirpur-1-main-mensal', 4, 'storage/qr_codes/nzndUTQPf3.png', 1, 5, NULL, NULL, NULL, NULL, '2026-02-07 16:55:37', '2026-02-07 16:55:37'),
(2, 'Mensal1', 'mirpur-1-main-mensal1', 4, 'storage/qr_codes/Ij1wmBFLWw.png', 1, 5, NULL, NULL, NULL, NULL, '2026-02-07 17:21:25', '2026-02-07 17:21:25'),
(3, 'Mensal2', 'mirpur-1-main-mensal2', 4, 'storage/qr_codes/UDSuyUu2uX.png', 1, 5, NULL, NULL, NULL, NULL, '2026-02-07 17:40:51', '2026-02-07 17:40:51');

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gateway_options`
--

CREATE TABLE `gateway_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `option` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `activities` longtext DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `gateway_options`
--

INSERT INTO `gateway_options` (`id`, `model_id`, `model_type`, `option`, `value`, `type`, `activities`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'App\\Models\\PaymentGateway', 'paypal_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(2, 3, 'App\\Models\\PaymentGateway', 'paypal_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(3, 3, 'App\\Models\\PaymentGateway', 'paypal_client_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(4, 3, 'App\\Models\\PaymentGateway', 'paypal_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(5, 3, 'App\\Models\\PaymentGateway', 'paypal_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(6, 4, 'App\\Models\\PaymentGateway', 'stripe_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(7, 4, 'App\\Models\\PaymentGateway', 'stripe_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(8, 4, 'App\\Models\\PaymentGateway', 'stripe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(9, 4, 'App\\Models\\PaymentGateway', 'stripe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(10, 5, 'App\\Models\\PaymentGateway', 'flutterwave_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(11, 5, 'App\\Models\\PaymentGateway', 'flutterwave_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(12, 5, 'App\\Models\\PaymentGateway', 'flutterwave_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(13, 5, 'App\\Models\\PaymentGateway', 'flutterwave_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(14, 6, 'App\\Models\\PaymentGateway', 'paystack_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(15, 6, 'App\\Models\\PaymentGateway', 'paystack_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(16, 6, 'App\\Models\\PaymentGateway', 'paystack_payment_url', 'https://api.paystack.co', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(17, 6, 'App\\Models\\PaymentGateway', 'paystack_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(18, 6, 'App\\Models\\PaymentGateway', 'paystack_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(19, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_name', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(20, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(21, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(22, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(23, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(24, 8, 'App\\Models\\PaymentGateway', 'mollie_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(25, 8, 'App\\Models\\PaymentGateway', 'mollie_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(26, 8, 'App\\Models\\PaymentGateway', 'mollie_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(27, 9, 'App\\Models\\PaymentGateway', 'senangpay_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(28, 9, 'App\\Models\\PaymentGateway', 'senangpay_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(29, 9, 'App\\Models\\PaymentGateway', 'senangpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(30, 9, 'App\\Models\\PaymentGateway', 'senangpay_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(31, 10, 'App\\Models\\PaymentGateway', 'bkash_app_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(32, 10, 'App\\Models\\PaymentGateway', 'bkash_app_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(33, 10, 'App\\Models\\PaymentGateway', 'bkash_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(34, 10, 'App\\Models\\PaymentGateway', 'bkash_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(35, 10, 'App\\Models\\PaymentGateway', 'bkash_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(36, 10, 'App\\Models\\PaymentGateway', 'bkash_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(37, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(38, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(39, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_website', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(40, 11, 'App\\Models\\PaymentGateway', 'paytm_channel', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(41, 11, 'App\\Models\\PaymentGateway', 'paytm_industry_type', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(42, 11, 'App\\Models\\PaymentGateway', 'paytm_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(43, 11, 'App\\Models\\PaymentGateway', 'paytm_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(44, 12, 'App\\Models\\PaymentGateway', 'razorpay_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(45, 12, 'App\\Models\\PaymentGateway', 'razorpay_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(46, 12, 'App\\Models\\PaymentGateway', 'razorpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(47, 12, 'App\\Models\\PaymentGateway', 'razorpay_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(48, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_id', NULL, 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 17:41:26'),
(49, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_secret', NULL, 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 17:41:26'),
(50, 13, 'App\\Models\\PaymentGateway', 'mercadopago_mode', '5', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 17:41:27'),
(51, 13, 'App\\Models\\PaymentGateway', 'mercadopago_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(52, 14, 'App\\Models\\PaymentGateway', 'cashfree_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(53, 14, 'App\\Models\\PaymentGateway', 'cashfree_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(54, 14, 'App\\Models\\PaymentGateway', 'cashfree_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(55, 14, 'App\\Models\\PaymentGateway', 'cashfree_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(56, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(57, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(58, 15, 'App\\Models\\PaymentGateway', 'payfast_passphrase', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(59, 15, 'App\\Models\\PaymentGateway', 'payfast_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(60, 15, 'App\\Models\\PaymentGateway', 'payfast_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(61, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_email', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(62, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_api_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(63, 16, 'App\\Models\\PaymentGateway', 'skrill_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(64, 16, 'App\\Models\\PaymentGateway', 'skrill_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(65, 17, 'App\\Models\\PaymentGateway', 'phonepe_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(66, 17, 'App\\Models\\PaymentGateway', 'phonepe_merchant_user_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(67, 17, 'App\\Models\\PaymentGateway', 'phonepe_key_index', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(68, 17, 'App\\Models\\PaymentGateway', 'phonepe_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(69, 17, 'App\\Models\\PaymentGateway', 'phonepe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(70, 17, 'App\\Models\\PaymentGateway', 'phonepe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(71, 18, 'App\\Models\\PaymentGateway', 'telr_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(72, 18, 'App\\Models\\PaymentGateway', 'telr_store_auth_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(73, 18, 'App\\Models\\PaymentGateway', 'telr_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(74, 18, 'App\\Models\\PaymentGateway', 'telr_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(75, 19, 'App\\Models\\PaymentGateway', 'iyzico_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(76, 19, 'App\\Models\\PaymentGateway', 'iyzico_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(77, 19, 'App\\Models\\PaymentGateway', 'iyzico_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(78, 19, 'App\\Models\\PaymentGateway', 'iyzico_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(79, 20, 'App\\Models\\PaymentGateway', 'pesapal_consumer_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(80, 20, 'App\\Models\\PaymentGateway', 'pesapal_consumer_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(81, 20, 'App\\Models\\PaymentGateway', 'pesapal_ipn_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(82, 20, 'App\\Models\\PaymentGateway', 'pesapal_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(83, 20, 'App\\Models\\PaymentGateway', 'pesapal_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(84, 21, 'App\\Models\\PaymentGateway', 'midtrans_server_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(85, 21, 'App\\Models\\PaymentGateway', 'midtrans_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(86, 21, 'App\\Models\\PaymentGateway', 'midtrans_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(87, 22, 'App\\Models\\PaymentGateway', 'myfatoorah_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(88, 22, 'App\\Models\\PaymentGateway', 'myfatoorah_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(89, 22, 'App\\Models\\PaymentGateway', 'myfatoorah_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(90, 23, 'App\\Models\\PaymentGateway', 'easypaisa_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(91, 23, 'App\\Models\\PaymentGateway', 'easypaisa_hash_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(92, 23, 'App\\Models\\PaymentGateway', 'easypaisa_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(93, 23, 'App\\Models\\PaymentGateway', 'easypaisa_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(94, 23, 'App\\Models\\PaymentGateway', 'easypaisa_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(95, 23, 'App\\Models\\PaymentGateway', 'easypaisa_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(96, 1, 'App\\Models\\SmsGateway', 'twilio_account_sid', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(97, 1, 'App\\Models\\SmsGateway', 'twilio_auth_token', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(98, 1, 'App\\Models\\SmsGateway', 'twilio_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(99, 1, 'App\\Models\\SmsGateway', 'twilio_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(100, 2, 'App\\Models\\SmsGateway', 'clickatell_apikey', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(101, 2, 'App\\Models\\SmsGateway', 'clickatell_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(102, 3, 'App\\Models\\SmsGateway', 'nexmo_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(103, 3, 'App\\Models\\SmsGateway', 'nexmo_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(104, 3, 'App\\Models\\SmsGateway', 'nexmo_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(105, 4, 'App\\Models\\SmsGateway', 'msg91_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(106, 4, 'App\\Models\\SmsGateway', 'msg91_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(107, 4, 'App\\Models\\SmsGateway', 'msg91_template_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(108, 4, 'App\\Models\\SmsGateway', 'msg91_template_variable', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(109, 4, 'App\\Models\\SmsGateway', 'msg91_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(110, 5, 'App\\Models\\SmsGateway', 'twofactor_module', 'PROMO_SMS', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(111, 5, 'App\\Models\\SmsGateway', 'twofactor_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(112, 5, 'App\\Models\\SmsGateway', 'twofactor_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(113, 5, 'App\\Models\\SmsGateway', 'twofactor_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(114, 6, 'App\\Models\\SmsGateway', 'bulksms_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(115, 6, 'App\\Models\\SmsGateway', 'bulksms_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(116, 6, 'App\\Models\\SmsGateway', 'bulksms_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(117, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(118, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(119, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(120, 8, 'App\\Models\\SmsGateway', 'telesign_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(121, 8, 'App\\Models\\SmsGateway', 'telesign_customer_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(122, 8, 'App\\Models\\SmsGateway', 'telesign_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(123, 8, 'App\\Models\\SmsGateway', 'telesign_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `caution` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `item_type` tinyint(4) NOT NULL DEFAULT 5,
  `order` bigint(20) NOT NULL DEFAULT 1,
  `is_featured` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_addons`
--

CREATE TABLE `item_addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `addon_item_id` bigint(20) UNSIGNED NOT NULL,
  `addon_item_variation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`addon_item_variation`)),
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_attributes`
--

CREATE TABLE `item_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `sort` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_extras`
--

CREATE TABLE `item_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(19,6) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_variations`
--

CREATE TABLE `item_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `item_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `caution` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `display_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `display_mode`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 5, 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(5, 'Portuguese', 'pt', 5, 5, NULL, NULL, NULL, NULL, '2026-02-07 17:08:09', '2026-02-07 17:08:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\PaymentGateway', 1, 'd46fb0b2-313d-4cbf-89fc-10ae73192bc3', 'payment-gateway', 'cash-on-delivery', 'cash-on-delivery.png', 'image/png', 'public', 'public', 3437, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(2, 'App\\Models\\PaymentGateway', 2, 'b2adba5e-3ad5-4f96-8876-10ad676f7d3e', 'payment-gateway', 'credit', 'credit.png', 'image/png', 'public', 'public', 3885, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(3, 'App\\Models\\PaymentGateway', 3, '9f142301-e83f-4daa-b02b-ae1f97577f2d', 'payment-gateway', 'paypal', 'paypal.png', 'image/png', 'public', 'public', 3809, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(4, 'App\\Models\\PaymentGateway', 4, '1da09ff6-126e-4a52-8d46-e0b6ddd778d6', 'payment-gateway', 'stripe', 'stripe.png', 'image/png', 'public', 'public', 3635, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(5, 'App\\Models\\PaymentGateway', 5, '44f9fcd6-f6fd-4e45-a8e1-200d739059af', 'payment-gateway', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 'public', 5191, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(6, 'App\\Models\\PaymentGateway', 6, 'd024436f-8fb2-4a1e-871c-256b4cf14cdf', 'payment-gateway', 'paystack', 'paystack.png', 'image/png', 'public', 'public', 4195, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(7, 'App\\Models\\PaymentGateway', 7, '77584055-3459-48d2-96ee-4c05d7d705ae', 'payment-gateway', 'sslcommerz', 'sslcommerz.png', 'image/png', 'public', 'public', 4546, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(8, 'App\\Models\\PaymentGateway', 8, 'd8f5b25e-cab4-45a1-b4d3-5a7681db4125', 'payment-gateway', 'mollie', 'mollie.png', 'image/png', 'public', 'public', 8116, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(9, 'App\\Models\\PaymentGateway', 9, '836bc87c-ccd5-4c2e-a444-142ed54bc985', 'payment-gateway', 'senangpay', 'senangpay.png', 'image/png', 'public', 'public', 6541, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(10, 'App\\Models\\PaymentGateway', 10, 'ce299826-80be-4227-9d60-af2282d3f857', 'payment-gateway', 'bkash', 'bkash.png', 'image/png', 'public', 'public', 5282, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(11, 'App\\Models\\PaymentGateway', 11, 'b9e6907f-a169-45f1-8b3a-3c5b7cbbe084', 'payment-gateway', 'paytm', 'paytm.png', 'image/png', 'public', 'public', 3285, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(12, 'App\\Models\\PaymentGateway', 12, '1a443bd3-268d-40b4-a81d-4fb1495589f4', 'payment-gateway', 'razorpay', 'razorpay.png', 'image/png', 'public', 'public', 4847, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(13, 'App\\Models\\PaymentGateway', 13, 'acea5b94-cb73-420f-a6d3-e821bb1105ca', 'payment-gateway', 'mercadopago', 'mercadopago.png', 'image/png', 'public', 'public', 11423, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(14, 'App\\Models\\PaymentGateway', 14, 'cbd064ca-a2ed-49a4-8c0b-6f7a61eb7b25', 'payment-gateway', 'cashfree', 'cashfree.png', 'image/png', 'public', 'public', 4940, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(15, 'App\\Models\\PaymentGateway', 15, 'f81af2b9-600a-4369-a995-a9b92e082c25', 'payment-gateway', 'payfast', 'payfast.png', 'image/png', 'public', 'public', 2173, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(16, 'App\\Models\\PaymentGateway', 16, '94f5a282-e9fb-4425-a836-8cd15c6082a5', 'payment-gateway', 'skrill', 'skrill.png', 'image/png', 'public', 'public', 7074, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(17, 'App\\Models\\PaymentGateway', 17, '24480dbf-a380-492c-8f3f-ddb2db2e3834', 'payment-gateway', 'phonepe', 'phonepe.png', 'image/png', 'public', 'public', 4417, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(18, 'App\\Models\\PaymentGateway', 18, '83925b75-5b5c-43e5-86c3-766aa0ac5244', 'payment-gateway', 'telr', 'telr.png', 'image/png', 'public', 'public', 7594, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(19, 'App\\Models\\PaymentGateway', 19, '4f9e788c-7a96-4d9a-98c9-d4d70f1c8108', 'payment-gateway', 'iyzico', 'iyzico.png', 'image/png', 'public', 'public', 7652, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(20, 'App\\Models\\PaymentGateway', 20, '1d08b697-8923-466d-9512-9e559992c1c1', 'payment-gateway', 'pesapal', 'pesapal.png', 'image/png', 'public', 'public', 9373, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(21, 'App\\Models\\PaymentGateway', 21, '1b0ee45d-e008-443c-8773-5c41f85fcf1c', 'payment-gateway', 'midtrans', 'midtrans.png', 'image/png', 'public', 'public', 5877, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(22, 'App\\Models\\PaymentGateway', 22, 'c31dfebb-c20b-4716-92ba-3d77e5906990', 'payment-gateway', 'myfatoorah', 'myfatoorah.png', 'image/png', 'public', 'public', 5411, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(23, 'App\\Models\\PaymentGateway', 23, '9f6ca3e6-7239-48bb-8a33-6f6e2407c90a', 'payment-gateway', 'easypaisa', 'easypaisa.png', 'image/png', 'public', 'public', 11255, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(24, 'App\\Models\\Language', 1, '955ccf88-07c3-4b01-9187-504cb918e891', 'language', 'english', 'english.png', 'image/png', 'public', 'public', 1149, '[]', '[]', '[]', '[]', 1, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(28, 'App\\Models\\Language', 5, '7bc8f626-5413-4f34-98b2-6afbdec4b4ac', 'language', 'round-brazilian-flag-on-transparent-600nw-2632507125', 'round-brazilian-flag-on-transparent-600nw-2632507125.webp', 'image/webp', 'public', 'public', 22472, '[]', '[]', '[]', '[]', 1, '2026-02-07 17:18:56', '2026-02-07 17:18:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `priority` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `menus`
--

INSERT INTO `menus` (`id`, `name`, `language`, `url`, `icon`, `status`, `parent`, `type`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'dashboard', 'lab lab-dashboard', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(2, 'Items', 'items', 'items', 'lab lab-items', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(3, 'Dining Tables', 'dining_tables', 'dining-tables', 'lab lab-dining-table', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(4, 'Pos & Orders', 'pos_and_orders', '#', 'lab lab-pos', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(5, 'POS', 'pos', 'pos', 'lab lab-pos', 1, 4, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(6, 'POS Orders', 'pos_orders', 'pos-orders', 'lab lab-pos-orders', 1, 4, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(7, 'Table Orders', 'table_orders', 'table-orders', 'lab lab-reserve-line', 1, 4, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(8, 'K.D.S', 'k_d_s', 'kitchen-display-system', 'lab lab-kds', 1, 4, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(9, 'O.S.S', 'o_s_s', 'order-status-screen', 'lab lab-cds', 1, 4, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(10, 'Promo', 'promo', '#', 'lab ', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(11, 'Offers', 'offers', 'offers', 'lab lab-offers', 1, 10, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(12, 'Users', 'users', '#', 'lab ', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(13, 'Administrators', 'administrators', 'administrators', 'lab lab-administrators', 1, 12, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(14, 'Customers', 'customers', 'customers', 'lab lab-customers', 1, 12, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(15, 'Employees', 'employees', 'employees', 'lab lab-employee', 1, 12, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(16, 'Waiters', 'waiters', 'waiters', 'lab lab-waiter', 1, 12, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(17, 'Chef', 'chefs', 'chefs', 'lab lab-chef', 1, 12, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(18, 'Accounts', 'accounts', '#', 'lab ', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(19, 'Transactions', 'transactions', 'transactions', 'lab lab-transactions', 1, 18, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(20, 'Reports', 'reports', '#', 'lab ', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(21, 'Sales Report', 'sales_report', 'sales-report', 'lab lab-sales-report', 1, 20, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(22, 'Items Report', 'items_report', 'items-report', 'lab lab-items-report', 1, 20, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(23, 'Credit Balance Report', 'credit_balance_report', 'credit-balance-report', 'lab lab-credit-balance-report', 1, 20, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(24, 'Setup', 'setup', '#', 'lab ', 1, 0, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12'),
(25, 'Settings', 'settings', 'settings', 'lab lab-settings', 1, 24, 1, 100, '2026-02-07 16:54:12', '2026-02-07 16:54:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu_sections`
--

CREATE TABLE `menu_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `menu_sections`
--

INSERT INTO `menu_sections` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Header Section', NULL, NULL, NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(2, 'Footer Section', NULL, NULL, NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu_templates`
--

CREATE TABLE `menu_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `menu_templates`
--

INSERT INTO `menu_templates` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', NULL, NULL, NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `message_histories`
--

CREATE TABLE `message_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` longtext DEFAULT NULL,
  `is_read` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_09_10_080029_create_menus_table', 1),
(6, '2022_05_01_142407_create_permission_tables', 1),
(7, '2022_05_24_204620_create_settings_table', 1),
(8, '2022_05_25_124629_create_currencies_table', 1),
(9, '2022_06_26_055545_create_default_access_table', 1),
(10, '2022_08_10_143500_create_media_table', 1),
(11, '2022_10_31_015126_create_pesapals_table', 1),
(12, '2022_11_17_110125_create_branches_table', 1),
(13, '2022_11_17_110157_create_languages_table', 1),
(14, '2022_11_17_110300_create_addresses_table', 1),
(15, '2022_11_17_110428_create_item_categories_table', 1),
(16, '2022_11_17_110455_create_offers_table', 1),
(17, '2022_11_17_110459_create_taxes_table', 1),
(18, '2022_11_17_110514_create_items_table', 1),
(19, '2022_11_17_110541_create_item_attributes_table', 1),
(20, '2022_11_17_110621_create_item_variations_table', 1),
(21, '2022_11_17_110650_create_item_extras_table', 1),
(22, '2022_11_17_110810_create_orders_table', 1),
(23, '2022_11_17_110832_create_order_items_table', 1),
(24, '2022_11_17_111737_create_offer_items_table', 1),
(25, '2022_11_17_113842_create_menu_sections_table', 1),
(26, '2022_11_17_114040_create_menu_templates_table', 1),
(27, '2022_11_17_114144_create_analytics_table', 1),
(28, '2022_11_17_114516_create_analytics_sections_table', 1),
(29, '2022_11_17_114835_create_payment_gateways_table', 1),
(30, '2022_11_17_115136_create_sms_gateways_table', 1),
(31, '2022_11_17_115341_create_gateway_options_table', 1),
(32, '2022_11_17_115716_create_addons_table', 1),
(33, '2022_11_17_120130_create_notifications_table', 1),
(34, '2022_11_17_120408_create_messages_table', 1),
(35, '2022_11_17_120624_create_message_histories_table', 1),
(36, '2022_11_17_120626_create_pages_table', 1),
(37, '2022_11_17_120627_create_item_addons_table', 1),
(38, '2022_11_23_125038_create_push_notifications_table', 1),
(39, '2023_01_09_111734_create_time_slots_table', 1),
(40, '2023_02_20_180253_create_order_addresses_table', 1),
(41, '2023_03_06_154954_create_otps_table', 1),
(42, '2023_03_23_143747_create_transactions_table', 1),
(43, '2023_03_23_170303_create_capture_payment_notifications_table', 1),
(44, '2023_03_27_140107_create_notification_alerts_table', 1),
(45, '2023_07_19_135307_add_soft_delete_column_to_users_table', 1),
(46, '2023_07_20_095727_add_total_tax_to_orders_table', 1),
(47, '2023_07_20_095843_add_tax_to_order_items_table', 1),
(48, '2023_09_05_133748_create_dining_tables_table', 1),
(49, '2023_11_18_154743_add_dining_table_id_to_order_table', 1),
(50, '2024_01_22_172712_add_display_mode_to_languages_table', 1),
(51, '2024_03_07_095727_add_sort_to_item_categories_table', 1),
(52, '2024_10_28_000000_add_pos_payment_method_and_note_to_orders_table', 1),
(53, '2025_02_09_000000_add_pos_received_amount_to_orders_table', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `data` longtext DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification_alerts`
--

CREATE TABLE `notification_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `mail_message` varchar(255) DEFAULT NULL,
  `sms_message` varchar(255) DEFAULT NULL,
  `push_notification_message` varchar(255) DEFAULT NULL,
  `mail` tinyint(4) DEFAULT NULL,
  `sms` tinyint(4) DEFAULT NULL,
  `push_notification` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `notification_alerts`
--

INSERT INTO `notification_alerts` (`id`, `name`, `language`, `mail_message`, `sms_message`, `push_notification_message`, `mail`, `sms`, `push_notification`, `created_at`, `updated_at`) VALUES
(1, 'Admin And Branch Manager New Order Message', 'admin_and_branch_manager_new_order_message', 'You have a new order.', 'You have a new order.', 'You have a new order.', 10, 10, 10, '2026-02-07 16:54:14', '2026-02-07 16:54:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `offer_items`
--

CREATE TABLE `offer_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_serial_no` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(19,6) NOT NULL,
  `discount` decimal(19,6) DEFAULT 0.000000,
  `delivery_charge` decimal(19,6) DEFAULT 0.000000,
  `total_tax` decimal(19,6) DEFAULT NULL,
  `total` decimal(19,6) NOT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT 5,
  `order_datetime` timestamp NOT NULL DEFAULT '2026-02-07 16:02:08',
  `delivery_time` varchar(255) DEFAULT NULL,
  `preparation_time` int(11) NOT NULL DEFAULT 0,
  `is_advance_order` tinyint(4) NOT NULL DEFAULT 5,
  `payment_method` bigint(20) NOT NULL DEFAULT 1,
  `pos_payment_method` tinyint(4) DEFAULT NULL,
  `pos_received_amount` decimal(19,6) DEFAULT 0.000000,
  `pos_payment_note` varchar(200) DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 10,
  `status` tinyint(4) NOT NULL,
  `dining_table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_boy_id` bigint(20) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `discount` decimal(19,6) NOT NULL,
  `tax_name` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,6) DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL,
  `tax_amount` decimal(19,6) DEFAULT NULL,
  `price` decimal(19,6) NOT NULL,
  `item_variations` longtext DEFAULT NULL,
  `item_extras` longtext DEFAULT NULL,
  `item_variation_total` decimal(19,6) DEFAULT 0.000000,
  `item_extra_total` decimal(19,6) DEFAULT 0.000000,
  `total_price` decimal(19,6) DEFAULT 0.000000,
  `instruction` text DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `otps`
--

CREATE TABLE `otps` (
  `phone` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `menu_section_id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `misc` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 'cash-on-delivery', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(2, 'Credit', 'credit', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(3, 'Paypal', 'paypal', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(4, 'Stripe', 'stripe', '{\"input\":[\"stripe.stripeInput.blade.php\"],\"js\":[\"stripe.stripeJs.blade.php\"],\"submit\":true}', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(5, 'Flutterwave', 'flutterwave', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(6, 'Paystack', 'paystack', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(7, 'SslCommerz', 'sslcommerz', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(8, 'Mollie', 'mollie', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(9, 'Senangpay', 'senangpay', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(10, 'Bkash', 'bkash', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(11, 'Paytm', 'paytm', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(12, 'Razorpay', 'razorpay', '{\"input\":[],\"js\":[\"razorpay.razorpayJs.blade.php\"],\"submit\":false}', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:14', '2026-02-07 16:54:14'),
(13, 'Mercadopago', 'mercadopago', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 17:41:27'),
(14, 'Cashfree', 'cashfree', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(15, 'Payfast', 'payfast', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(16, 'Skrill', 'skrill', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(17, 'PhonePe', 'phonepe', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(18, 'Telr', 'telr', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(19, 'Iyzico', 'iyzico', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(20, 'Pesapal', 'pesapal', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(21, 'Midtrans', 'midtrans', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(22, 'MyFatoorah', 'myfatoorah', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(23, 'EasyPaisa', 'easypaisa', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `name`, `guard_name`, `url`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'sanctum', 'dashboard', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(2, 'Items', 'items', 'sanctum', 'items', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(3, 'Items Create', 'items_create', 'sanctum', 'items/create', 2, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(4, 'Items Edit', 'items_edit', 'sanctum', 'items/edit', 2, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(5, 'Items Delete', 'items_delete', 'sanctum', 'items/delete', 2, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(6, 'Items Show', 'items_show', 'sanctum', 'items/show', 2, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(7, 'Dining Tables', 'dining-tables', 'sanctum', 'dining-tables', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(8, 'Dining Tables Create', 'dining_tables_create', 'sanctum', 'dining-table/create', 7, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(9, 'Dining Tables Edit', 'dining_tables_edit', 'sanctum', 'dining-table/edit', 7, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(10, 'Dining Tables Delete', 'dining_tables_delete', 'sanctum', 'dining-tables/delete', 7, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(11, 'Dining Tables Show', 'dining_tables_show', 'sanctum', 'dining-tables/show', 7, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(12, 'POS', 'pos', 'sanctum', 'pos', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(13, 'POS Orders', 'pos-orders', 'sanctum', 'pos-orders', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(14, 'Table Orders', 'table-orders', 'sanctum', 'table-orders', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(15, 'K.D.S', 'kitchen-display-system', 'sanctum', 'kitchen-display-system', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(16, 'O.S.S', 'order-status-screen', 'sanctum', 'order-status-screen', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(17, 'Offers', 'offers', 'sanctum', 'offers', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(18, 'Offers Create', 'offers_create', 'sanctum', 'offers/create', 17, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(19, 'Offers Edit', 'offers_edit', 'sanctum', 'offers/edit', 17, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(20, 'Offers Delete', 'offers_delete', 'sanctum', 'offers/delete', 17, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(21, 'Offers Show', 'offers_show', 'sanctum', 'offers/show', 17, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(22, 'Administrators', 'administrators', 'sanctum', 'administrators', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(23, 'Administrators Create', 'administrators_create', 'sanctum', 'administrators/create', 22, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(24, 'Administrators Edit', 'administrators_edit', 'sanctum', 'administrators/edit', 22, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(25, 'Administrators Delete', 'administrators_delete', 'sanctum', 'administrators/delete', 22, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(26, 'Administrators Show', 'administrators_show', 'sanctum', 'administrators/show', 22, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(27, 'Delivery Boys', 'delivery-boys', 'sanctum', 'delivery-boys', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(28, 'Delivery Boys Create', 'delivery-boys_create', 'sanctum', 'delivery-boys/create', 27, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(29, 'Delivery Boys Edit', 'delivery-boys_edit', 'sanctum', 'delivery-boys/edit', 27, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(30, 'Delivery Boys Delete', 'delivery-boys_delete', 'sanctum', 'delivery-boys/delete', 27, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(31, 'Delivery Boys Show', 'delivery-boys_show', 'sanctum', 'delivery-boys/show', 27, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(32, 'Customers', 'customers', 'sanctum', 'customers', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(33, 'Customers Create', 'customers_create', 'sanctum', 'customers/create', 32, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(34, 'Customers Edit', 'customers_edit', 'sanctum', 'customers/edit', 32, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(35, 'Customers Delete', 'customers_delete', 'sanctum', 'customers/delete', 32, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(36, 'Customers Show', 'customers_show', 'sanctum', 'customers/show', 32, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(37, 'Employees', 'employees', 'sanctum', 'employees', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(38, 'Employees Create', 'employees_create', 'sanctum', 'employees/create', 37, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(39, 'Employees Edit', 'employees_edit', 'sanctum', 'employees/edit', 37, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(40, 'Employees Delete', 'employees_delete', 'sanctum', 'employees/delete', 37, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(41, 'Employees Show', 'employees_show', 'sanctum', 'employees/show', 37, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(42, 'Waiters', 'waiters', 'sanctum', 'waiters', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(43, 'Waiters Create', 'waiters_create', 'sanctum', 'waiters/create', 42, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(44, 'Waiters Edit', 'waiters_edit', 'sanctum', 'waiters/edit', 42, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(45, 'Waiters Delete', 'waiters_delete', 'sanctum', 'waiters/delete', 42, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(46, 'Waiters Show', 'waiters_show', 'sanctum', 'waiters/show', 42, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(47, 'Chefs', 'chefs', 'sanctum', 'chefs', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(48, 'Chefs Create', 'chefs_create', 'sanctum', 'chefs/create', 47, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(49, 'Chefs Edit', 'chefs_edit', 'sanctum', 'chefs/edit', 47, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(50, 'Chefs Delete', 'chefs_delete', 'sanctum', 'chefs/delete', 47, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(51, 'Chefs Show', 'chefs_show', 'sanctum', 'chefs/show', 47, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(52, 'Transactions', 'transactions', 'sanctum', 'transactions', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(53, 'Sales Report', 'sales-report', 'sanctum', 'sales-report', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(54, 'Items Report', 'items-report', 'sanctum', 'items-report', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(55, 'Credit Balance Report', 'credit-balance-report', 'sanctum', 'credit-balance-report', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(56, 'Settings', 'settings', 'sanctum', 'settings', 0, '2026-02-07 16:54:13', '2026-02-07 16:54:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'auth_token', 'b8d568f9f7a959aacc2ee77c370732eccdc90c5b456e55fac7a4063e8436e8ca', '[\"*\"]', '2026-02-07 17:59:52', NULL, '2026-02-07 17:51:16', '2026-02-07 17:59:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pesapals`
--

CREATE TABLE `pesapals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_line_1` varchar(255) DEFAULT NULL,
  `billing_address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `amount` text NOT NULL,
  `currency` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `merchant_reference` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` text DEFAULT NULL,
  `tracking_id` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'sanctum', '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(2, 'Customer', 'sanctum', '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(3, 'Waiter', 'sanctum', '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(4, 'Chef', 'sanctum', '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(5, 'Branch Manager', 'sanctum', '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(6, 'POS Operator', 'sanctum', '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(7, 'Stuff', 'sanctum', '2026-02-07 16:54:13', '2026-02-07 16:54:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 5),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(12, 5),
(12, 6),
(13, 1),
(13, 5),
(13, 6),
(14, 1),
(14, 5),
(15, 1),
(15, 4),
(15, 5),
(16, 1),
(16, 4),
(16, 5),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 5),
(28, 1),
(28, 5),
(29, 1),
(29, 5),
(30, 1),
(30, 5),
(31, 1),
(31, 5),
(32, 1),
(32, 5),
(33, 1),
(33, 5),
(34, 1),
(34, 5),
(35, 1),
(35, 5),
(36, 1),
(36, 5),
(37, 1),
(37, 5),
(38, 1),
(38, 5),
(39, 1),
(39, 5),
(40, 1),
(40, 5),
(41, 1),
(41, 5),
(42, 1),
(42, 5),
(43, 1),
(43, 5),
(44, 1),
(44, 5),
(45, 1),
(45, 5),
(46, 1),
(46, 5),
(47, 1),
(47, 5),
(48, 1),
(48, 5),
(49, 1),
(49, 5),
(50, 1),
(50, 5),
(51, 1),
(51, 5),
(52, 1),
(52, 5),
(53, 1),
(53, 5),
(54, 1),
(55, 1),
(56, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `settingable_type` varchar(255) DEFAULT NULL,
  `settingable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `group`, `key`, `payload`, `settingable_type`, `settingable_id`, `created_at`, `updated_at`) VALUES
(1, 'company', 'company_name', '{\"$value\":\"FoodScan - QrCode Restaurant Menu Maker and Contactless Menu Ordering system\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(2, 'company', 'company_email', '{\"$value\":\"info@inilabs.net\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(3, 'company', 'company_phone', '{\"$value\":\"+13333846282\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(4, 'company', 'company_website', '{\"$value\":\"http:\\/\\/localhost:8001\\/\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(5, 'company', 'company_city', '{\"$value\":\"Manaus\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(6, 'company', 'company_state', '{\"$value\":\"Amazonas\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(7, 'company', 'company_country_code', '{\"$value\":\"BRA\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(8, 'company', 'company_zip_code', '{\"$value\":\"1216\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(9, 'company', 'company_address', '{\"$value\":\"House : 25, Road No: 2, Block A, Mirpur-1, Dhaka 1216\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:20:14', '2026-02-07 17:20:14'),
(10, 'site', 'site_date_format', '{\"$value\":\"d-m-Y\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(11, 'site', 'site_time_format', '{\"$value\":\"h:i A\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(12, 'site', 'site_default_timezone', '{\"$value\":\"Asia\\/Dhaka\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(13, 'site', 'site_default_branch', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(14, 'site', 'site_default_currency', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(15, 'site', 'site_default_currency_symbol', '{\"$value\":\"$\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(16, 'site', 'site_currency_position', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(17, 'site', 'site_digit_after_decimal_point', '{\"$value\":\"2\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(18, 'site', 'site_email_verification', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(19, 'site', 'site_phone_verification', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(20, 'site', 'site_default_language', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(21, 'site', 'site_google_map_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(22, 'site', 'site_copyright', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(23, 'site', 'site_language_switch', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(24, 'site', 'site_app_debug', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(25, 'site', 'site_auto_update', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(26, 'site', 'site_online_payment_gateway', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(27, 'site', 'site_default_sms_gateway', '{\"$value\":0,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(28, 'site', 'site_food_preparation_time', '{\"$value\":\"30\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(29, 'notification', 'notification_fcm_public_vapid_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(30, 'notification', 'notification_fcm_api_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(31, 'notification', 'notification_fcm_auth_domain', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(32, 'notification', 'notification_fcm_project_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(33, 'notification', 'notification_fcm_storage_bucket', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(34, 'notification', 'notification_fcm_messaging_sender_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(35, 'notification', 'notification_fcm_app_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(36, 'notification', 'notification_fcm_measurement_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(37, 'notification', 'notification_fcm_json_file', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:13', '2026-02-07 16:54:13'),
(38, 'mail', 'mail_mailer', '{\"$value\":\"smtp\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(39, 'mail', 'mail_host', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(40, 'mail', 'mail_port', '{\"$value\":\"0\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(41, 'mail', 'mail_username', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(42, 'mail', 'mail_password', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(43, 'mail', 'mail_encryption', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(44, 'mail', 'mail_from_name', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(45, 'mail', 'mail_from_email', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(46, 'order_setup', 'order_setup_food_preparation_time', '{\"$value\":\"30\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(47, 'order_setup', 'order_setup_schedule_order_slot_duration', '{\"$value\":\"30\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(48, 'order_setup', 'order_setup_takeaway', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(49, 'order_setup', 'order_setup_delivery', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(50, 'order_setup', 'order_setup_free_delivery_kilometer', '{\"$value\":\"2\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(51, 'order_setup', 'order_setup_basic_delivery_charge', '{\"$value\":\"1\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(52, 'order_setup', 'order_setup_charge_per_kilo', '{\"$value\":\"1\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(53, 'otp', 'otp_type', '{\"$value\":\"5\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(54, 'otp', 'otp_digit_limit', '{\"$value\":\"4\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(55, 'otp', 'otp_expire_time', '{\"$value\":\"10\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(56, 'theme', 'theme_logo', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(57, 'theme', 'theme_favicon_logo', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(58, 'theme', 'theme_footer_logo', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:17', '2026-02-07 16:54:17'),
(59, 'license', 'license_key', '{\"$value\":\"rYT583k3Gk8hrE1dJHWmQ2MyvqBOgbgGl\",\"$cast\":null}', NULL, NULL, '2026-02-07 17:23:41', '2026-02-07 17:23:41'),
(60, 'social_media', 'social_media_facebook', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:18', '2026-02-07 16:54:18'),
(61, 'social_media', 'social_media_youtube', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:18', '2026-02-07 16:54:18'),
(62, 'social_media', 'social_media_instagram', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:18', '2026-02-07 16:54:18'),
(63, 'social_media', 'social_media_twitter', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2026-02-07 16:54:18', '2026-02-07 16:54:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `misc` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Twilio', 'twilio', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(2, 'Clickatell', 'clickatell', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(3, 'Nexmo', 'nexmo', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(4, 'Msg91', 'msg91', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(5, '2Factor', 'twofactor', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(6, 'Bulksms', 'bulksms', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:15', '2026-02-07 16:54:15'),
(7, 'Bulksmsbd', 'bulksmsbd', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16'),
(8, 'Telesign', 'telesign', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `tax_rate` decimal(19,6) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_time` varchar(255) NOT NULL,
  `closing_time` varchar(255) NOT NULL,
  `day` tinyint(4) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sign` varchar(255) NOT NULL DEFAULT '+',
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_no` varchar(255) NOT NULL,
  `amount` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `payment_method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'payment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `web_token` varchar(255) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT 0,
  `country_code` varchar(255) DEFAULT NULL,
  `is_guest` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `balance` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `username`, `email_verified_at`, `password`, `device_token`, `web_token`, `branch_id`, `country_code`, `is_guest`, `status`, `balance`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'John Doe', 'e3marcos@gmail.com', '1254875855', 'admin', '2026-02-07 16:54:16', '$2y$10$r9qh.N4Uv5Sp6oUpJhuGs.55Pg4MotRaCtZM.rKi/TwK1XwJuBO86', NULL, NULL, 0, '+55', 10, 5, 0.000000, NULL, NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 17:46:13', NULL),
(2, 'Walking Customer', 'walkingcustomer@example.com', '1254444555', 'default-customer', '2026-02-07 16:54:16', '$2y$10$PbsYK1B0J4K0krciyMCzv.4d2gkiJy2hiPfQ8HMue4w80zf4rudCq', NULL, NULL, 0, '+880', 10, 5, 0.000000, NULL, NULL, NULL, NULL, NULL, '2026-02-07 16:54:16', '2026-02-07 16:54:16', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Índices de tabela `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `analytic_sections`
--
ALTER TABLE `analytic_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytic_sections_analytic_id_foreign` (`analytic_id`);

--
-- Índices de tabela `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `default_access`
--
ALTER TABLE `default_access`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `dining_tables`
--
ALTER TABLE `dining_tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dining_tables_slug_unique` (`slug`),
  ADD KEY `dining_tables_branch_id_foreign` (`branch_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `gateway_options`
--
ALTER TABLE `gateway_options`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `items_tax_id_foreign` (`tax_id`);

--
-- Índices de tabela `item_addons`
--
ALTER TABLE `item_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_addons_item_id_foreign` (`item_id`),
  ADD KEY `item_addons_addon_item_id_foreign` (`addon_item_id`);

--
-- Índices de tabela `item_attributes`
--
ALTER TABLE `item_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `item_extras`
--
ALTER TABLE `item_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_extras_item_id_foreign` (`item_id`);

--
-- Índices de tabela `item_variations`
--
ALTER TABLE `item_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_variations_item_id_foreign` (`item_id`),
  ADD KEY `item_variations_item_attribute_id_foreign` (`item_attribute_id`);

--
-- Índices de tabela `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Índices de tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu_sections`
--
ALTER TABLE `menu_sections`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu_templates`
--
ALTER TABLE `menu_templates`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Índices de tabela `message_histories`
--
ALTER TABLE `message_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_histories_message_id_foreign` (`message_id`),
  ADD KEY `message_histories_user_id_foreign` (`user_id`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notification_alerts`
--
ALTER TABLE `notification_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `offer_items`
--
ALTER TABLE `offer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_items_offer_id_foreign` (`offer_id`);

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_branch_id_foreign` (`branch_id`);

--
-- Índices de tabela `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_id_foreign` (`order_id`),
  ADD KEY `order_addresses_user_id_foreign` (`user_id`);

--
-- Índices de tabela `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_branch_id_foreign` (`branch_id`),
  ADD KEY `order_items_item_id_foreign` (`item_id`);

--
-- Índices de tabela `otps`
--
ALTER TABLE `otps`
  ADD KEY `otps_phone_index` (`phone`);

--
-- Índices de tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_menu_section_id_foreign` (`menu_section_id`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices de tabela `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices de tabela `pesapals`
--
ALTER TABLE `pesapals`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_settingable_type_settingable_id_index` (`settingable_type`,`settingable_id`);

--
-- Índices de tabela `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `analytics`
--
ALTER TABLE `analytics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `analytic_sections`
--
ALTER TABLE `analytic_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `default_access`
--
ALTER TABLE `default_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `dining_tables`
--
ALTER TABLE `dining_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gateway_options`
--
ALTER TABLE `gateway_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de tabela `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_addons`
--
ALTER TABLE `item_addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_attributes`
--
ALTER TABLE `item_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_extras`
--
ALTER TABLE `item_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_variations`
--
ALTER TABLE `item_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `menu_sections`
--
ALTER TABLE `menu_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `menu_templates`
--
ALTER TABLE `menu_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `message_histories`
--
ALTER TABLE `message_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notification_alerts`
--
ALTER TABLE `notification_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `offer_items`
--
ALTER TABLE `offer_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pesapals`
--
ALTER TABLE `pesapals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de tabela `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `analytic_sections`
--
ALTER TABLE `analytic_sections`
  ADD CONSTRAINT `analytic_sections_analytic_id_foreign` FOREIGN KEY (`analytic_id`) REFERENCES `analytics` (`id`);

--
-- Restrições para tabelas `dining_tables`
--
ALTER TABLE `dining_tables`
  ADD CONSTRAINT `dining_tables_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`);

--
-- Restrições para tabelas `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`),
  ADD CONSTRAINT `items_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`);

--
-- Restrições para tabelas `item_addons`
--
ALTER TABLE `item_addons`
  ADD CONSTRAINT `item_addons_addon_item_id_foreign` FOREIGN KEY (`addon_item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_addons_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Restrições para tabelas `item_extras`
--
ALTER TABLE `item_extras`
  ADD CONSTRAINT `item_extras_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Restrições para tabelas `item_variations`
--
ALTER TABLE `item_variations`
  ADD CONSTRAINT `item_variations_item_attribute_id_foreign` FOREIGN KEY (`item_attribute_id`) REFERENCES `item_attributes` (`id`),
  ADD CONSTRAINT `item_variations_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Restrições para tabelas `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `message_histories`
--
ALTER TABLE `message_histories`
  ADD CONSTRAINT `message_histories_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  ADD CONSTRAINT `message_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `offer_items`
--
ALTER TABLE `offer_items`
  ADD CONSTRAINT `offer_items_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`);

--
-- Restrições para tabelas `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Restrições para tabelas `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_menu_section_id_foreign` FOREIGN KEY (`menu_section_id`) REFERENCES `menu_sections` (`id`);

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
