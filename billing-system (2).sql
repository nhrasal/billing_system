-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2020 at 04:52 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billing-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ex_in_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 'Test Category', 'this is test category', '1', '2020-11-04 04:43:11', '2020-11-04 04:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `details`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 'Chairmen', NULL, '1', NULL, NULL),
(2, 'Managing Director ', NULL, '1', NULL, NULL),
(3, 'Director Finance', NULL, '1', NULL, NULL),
(4, 'Director Admin', NULL, '1', NULL, NULL),
(5, 'Accounts Admin', NULL, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `address`, `image`, `designation`, `joining_date`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 'NH Rasal', '01853195548', 'nhrasal.cse@gmail.com', 'malibag', '/backend/employee-image/5fa3742f233efjpg', '1', '2019-12-15', '1', '2020-11-04 09:33:07', '2020-11-04 09:35:55'),
(2, 'titahs', '0181422588111', 'test@gmail.com', 'dfdfdfd', '/backend/employee-image/5fa3742f233efjpg', '2', '2020-11-03', '1', '2020-11-04 21:40:31', '2020-11-17 09:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `expanse_due_paid_histories`
--

CREATE TABLE `expanse_due_paid_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expanse_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_expense` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(200) DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `category_id`, `subcategory_id`, `employee_id`, `total_expense`, `paid`, `due`, `date`, `comments`, `status`, `user_id`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1', '5500', NULL, NULL, '11-17-2020', NULL, 0, '1', '1', '2020-11-17 10:15:52', '2020-11-17 10:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_details`
--

INSERT INTO `expense_details` (`id`, `expense_id`, `expense`, `amount`, `date`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, '1', 'transport expense1', '500', '11-17-2020', '1', '2020-11-17 10:15:52', '2020-11-17 10:15:52'),
(2, '1', 'transport expense2', '5000', '11-17-2020', '1', '2020-11-17 10:15:53', '2020-11-17 10:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `project_id`, `employee_id`, `total_amount`, `working_day`, `paid`, `due`, `comments`, `date`, `user_id`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '500000', '30', '5000', '495000', 'advance amount', '11-12-2020', '1', '1', '2020-11-12 13:08:58', '2020-11-12 13:14:30'),
(2, '1', '1', '500000', '30', '5000', '495000', 'advance amount', '11-12-2020', '1', '1', '2020-11-12 13:21:51', '2020-11-12 13:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `income_due_paid_histories`
--

CREATE TABLE `income_due_paid_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `income_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_03_072207_create_categories_table', 1),
(5, '2020_11_03_072439_create_sub_categories_table', 1),
(6, '2020_11_04_040414_create_employees_table', 1),
(7, '2020_11_04_040430_create_projects_table', 1),
(8, '2020_11_04_040454_create_designations_table', 1),
(9, '2020_11_04_040542_create_accounts_table', 1),
(10, '2020_11_04_040933_create_expenses_table', 1),
(11, '2020_11_04_040951_create_incomes_table', 1),
(12, '2020_11_04_041352_create_expense_details_table', 1),
(13, '2020_11_04_085619_create_roles_table', 1),
(14, '2020_11_12_182652_create_expanse_due_paid_histories_table', 2),
(15, '2020_11_12_182751_create_income_due_paid_histories_table', 2),
(16, '2020_11_17_145917_create_note_sheet_processes_table', 3),
(17, '2020_11_17_145954_create_note_sheet_process_comments_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `note_sheet_processes`
--

CREATE TABLE `note_sheet_processes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notesheet_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chairmen_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `managing_director_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director_finance_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director_admin_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts_admin_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clearence_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `note_sheet_processes`
--

INSERT INTO `note_sheet_processes` (`id`, `notesheet_id`, `chairmen_status`, `managing_director_status`, `director_finance_status`, `director_admin_status`, `accounts_admin_status`, `clearence_status`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, '1', '', '', '1', '1', NULL, NULL, '0', '2020-11-17 10:15:52', '2020-11-20 10:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `note_sheet_process_comments`
--

CREATE TABLE `note_sheet_process_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notesheet_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` int(200) DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `note_sheet_process_comments`
--

INSERT INTO `note_sheet_process_comments` (`id`, `notesheet_id`, `admin_id`, `comments`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, '1', 8, 'advance amount', '0', '2020-11-20 09:58:18', '2020-11-20 09:58:18'),
(2, '1', 7, 'fdfdfdf', '0', '2020-11-20 10:15:36', '2020-11-20 10:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `project_details`, `project_value`, `start_day`, `end_day`, `company_name`, `phone`, `email`, `address`, `image`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 'web development', 'fdfdf', '500000', '20020-12-15', '2020-12-15', 'dsdsd', 'dsdsd', 'dsdsds', 'dsdsds', '/backend/project-image/5fad7cb19cc83png', '1', '2020-11-04 22:01:54', '2020-11-12 12:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `details`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, '1', NULL, NULL),
(2, 'Chairmen', NULL, '1', NULL, NULL),
(3, 'Managing Director ', NULL, '1', NULL, NULL),
(4, 'Director Finance', NULL, '1', NULL, NULL),
(5, 'Director Admin', NULL, '1', NULL, NULL),
(6, 'Accounts Admin', NULL, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `description`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Test Sub Category', 'this is test sub category', '1', '2020-11-04 04:44:00', '2020-11-04 04:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role_id`, `status`, `image`, `delete_status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'NH Rasal', 'nhrasal.cse@gmail.com', '01853195548', '1', '1', '/user/image/5faad0abf0733.png', '1', NULL, '$2y$10$3tVhwD1OUx8w1YhbopmCz.v0b2/0k34F/a9McPqfY.7fiR4fD6duC', NULL, '2020-11-04 03:03:30', '2020-11-12 11:07:57'),
(2, 'Test Admin', 'test@admin.com', '01515693097', '1', '1', NULL, '1', NULL, '$2y$10$3tVhwD1OUx8w1YhbopmCz.v0b2/0k34F/a9McPqfY.7fiR4fD6duC', NULL, '2020-11-12 11:27:48', '2020-11-17 09:42:44'),
(3, 'Chairmen', 'chairmen@admin.com', '018531', '2', '1', NULL, '1', NULL, '$2y$10$3tVhwD1OUx8w1YhbopmCz.v0b2/0k34F/a9McPqfY.7fiR4fD6duC', NULL, '2020-11-18 10:31:24', '2020-11-18 10:31:24'),
(5, 'Managing Director', 'md@admin.com', '0185319', '3', '1', NULL, '1', NULL, '$2y$10$3tVhwD1OUx8w1YhbopmCz.v0b2/0k34F/a9McPqfY.7fiR4fD6duC', NULL, '2020-11-18 10:33:03', '2020-11-18 10:33:03'),
(7, 'Director Finance', 'df@admin.com', '01853195', '4', '1', NULL, '1', NULL, '$2y$10$3tVhwD1OUx8w1YhbopmCz.v0b2/0k34F/a9McPqfY.7fiR4fD6duC', NULL, '2020-11-18 10:33:38', '2020-11-18 10:33:38'),
(8, 'Director Admin', 'da@admin.com', '018531950', '5', '1', NULL, '1', NULL, '$2y$10$3tVhwD1OUx8w1YhbopmCz.v0b2/0k34F/a9McPqfY.7fiR4fD6duC', NULL, '2020-11-18 10:35:11', '2020-11-18 10:36:11'),
(10, 'Accounts Admin', 'aa@admin.com', '0185319500', '6', '1', NULL, '1', NULL, '$2y$10$3tVhwD1OUx8w1YhbopmCz.v0b2/0k34F/a9McPqfY.7fiR4fD6duC', NULL, '2020-11-18 10:35:37', '2020-11-18 10:35:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expanse_due_paid_histories`
--
ALTER TABLE `expanse_due_paid_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_due_paid_histories`
--
ALTER TABLE `income_due_paid_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `note_sheet_processes`
--
ALTER TABLE `note_sheet_processes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `note_sheet_process_comments`
--
ALTER TABLE `note_sheet_process_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expanse_due_paid_histories`
--
ALTER TABLE `expanse_due_paid_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `income_due_paid_histories`
--
ALTER TABLE `income_due_paid_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `note_sheet_processes`
--
ALTER TABLE `note_sheet_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `note_sheet_process_comments`
--
ALTER TABLE `note_sheet_process_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
