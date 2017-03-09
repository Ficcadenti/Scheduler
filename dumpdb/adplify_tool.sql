-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Mar 08, 2017 alle 12:33
-- Versione del server: 5.5.52-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adplify_tool`
--
CREATE DATABASE IF NOT EXISTS `adplify_tool` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `adplify_tool`;

-- --------------------------------------------------------

--
-- Struttura della tabella `api_customer_settings`
--

CREATE TABLE IF NOT EXISTS `api_customer_settings` (
  `user_id` int(10) unsigned NOT NULL,
  `campaign_freq_sync_minutes` int(11) DEFAULT NULL,
  `adgroup_freq_sync_minutes` int(11) DEFAULT NULL,
  `keywords_freq_sync_minutes` int(11) DEFAULT NULL,
  `url_freq_sync_minutes` int(11) DEFAULT NULL,
  `adtext_freq_sync_minutes` int(11) DEFAULT NULL,
  `campaign_attributes_freq_sync_minutes` int(11) DEFAULT NULL,
  `adgroup_attributes_freq_sync_minutes` int(11) DEFAULT NULL,
  `keywords_attributes_freq_sync_minutes` int(11) DEFAULT NULL,
  `adtext_attributes_freq_sync_minutes` int(11) DEFAULT NULL,
  `url_attributes_freq_sync_minutes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_code` varchar(255) NOT NULL,
  `validity_start` datetime NOT NULL,
  `validity_end` datetime DEFAULT NULL,
  `consumed_by_single_user` smallint(6) DEFAULT '1',
  `consumed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `db_user`
--

CREATE TABLE IF NOT EXISTS `db_user` (
  `user_id` int(11) unsigned NOT NULL,
  `db_host` varchar(255) NOT NULL DEFAULT '',
  `db_user` varchar(255) DEFAULT NULL,
  `db_password` varchar(255) DEFAULT NULL,
  `db_port` varchar(8) DEFAULT '3309',
  `db_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `severity` smallint(6) NOT NULL,
  `log` varchar(255) NOT NULL,
  `message` text,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_login` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(48, '2014_10_12_000000_create_users_table', 1),
(49, '2014_10_12_100000_create_password_resets_table', 1),
(50, '2016_11_19_231021_entrust_setup_tables', 1),
(51, '2016_11_26_163614_create_service_profile_types', 1),
(52, '2016_11_29_115339_create_user_profiles', 1),
(53, '2016_11_29_141327_create_adwords_accounts', 1),
(54, '2016_11_29_142237_create_owners', 1),
(55, '2016_11_29_142853_create_adwords_accounts_owners', 1),
(56, '2016_11_29_999999_add_foreign_keys', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `displayName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `roles`
--

INSERT INTO `roles` (`id`, `name`, `displayName`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Administrator', '2016-12-02 09:51:23', '2016-12-02 09:51:23'),
(2, 'user_manager', 'User Manager', 'User Manager', '2016-12-02 09:51:23', '2016-12-02 09:51:23'),
(3, 'user_standard', 'User Standard', 'User Standard', '2016-12-02 09:51:23', '2016-12-02 09:51:23'),
(4, 'user_read_only', 'User Read Only', 'User Read Only', '2016-12-02 09:51:23', '2016-12-02 09:51:23');

-- --------------------------------------------------------

--
-- Struttura della tabella `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `service_profile_types`
--

CREATE TABLE IF NOT EXISTS `service_profile_types` (
  `id` int(10) unsigned NOT NULL,
  `serviceName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serviceCost` int(11) DEFAULT NULL,
  `serviceBillingPeriod` int(11) DEFAULT NULL,
  `serviceUpgradable` tinyint(1) NOT NULL DEFAULT '1',
  `serviceDescription` text COLLATE utf8_unicode_ci,
  `serviceLogo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `freeTrial` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `service_profile_types`
--

INSERT INTO `service_profile_types` (`id`, `serviceName`, `serviceCost`, `serviceBillingPeriod`, `serviceUpgradable`, `serviceDescription`, `serviceLogo`, `freeTrial`, `created_at`, `updated_at`) VALUES
(1, 'service1', 500, 1000, 0, 'Service description 1', 'logo1', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `access_type` varchar(15) DEFAULT NULL,
  `application_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `after_token_provided_redirect_url` varchar(255) DEFAULT NULL,
  `dev_key` varchar(255) DEFAULT NULL,
  `customer_client_id` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `google_auth_url` varchar(255) DEFAULT NULL,
  `after_auth_redirect_url` varchar(255) DEFAULT NULL,
  `google_userinfo_url` varchar(255) DEFAULT NULL,
  `frontend_error_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `access_type`, `application_name`, `client_id`, `client_secret`, `after_token_provided_redirect_url`, `dev_key`, `customer_client_id`, `refresh_token`, `google_auth_url`, `after_auth_redirect_url`, `google_userinfo_url`, `frontend_error_url`) VALUES
(1, 'mamadigital', 'online', 'adplify', '135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com', 'KQ1KrvbPvGN4Tv_J2PvkWfcc', 'http://devadplify.exolab.it/adplify_fe/index.php#/select-accounts', 'mjDNeLG_BMo-psJEcFsZHw', '601-806-2243', '1/Vnol6qrG1Wa7JlW6WPpTRBEaoC8miXSWJEIt9H-T2sw', 'https://accounts.google.com/o/oauth2/token', 'http://devadplify.exolab.it/adplify_be/public/index.php/api/oauth2/setAccessToken', 'https://www.googleapis.com/oauth2/v1/userinfo', 'http://devadplify.exolab.it/adplify_fe/index.php');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchasedType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taxCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `billingAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profileType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `initial_data_import_status` smallint(6) DEFAULT '0',
  `first_login` smallint(6) DEFAULT '1',
  `userType` int(11) DEFAULT NULL,
  `picture` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_service_profile_types`
--

CREATE TABLE IF NOT EXISTS `user_service_profile_types` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `service_profile_type_id` int(10) unsigned NOT NULL,
  `freeTrialStartedAt` datetime DEFAULT NULL,
  `freeTrialEndedAt` datetime DEFAULT NULL,
  `activatedAt` datetime DEFAULT NULL,
  `suspendAt` datetime DEFAULT NULL,
  `cancelledAt` datetime DEFAULT NULL,
  `currentStatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `user_type`
--

INSERT INTO `user_type` (`id`, `name`) VALUES
(1, 'Company'),
(2, 'Individual');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `api_customer_settings`
--
ALTER TABLE `api_customer_settings`
  ADD PRIMARY KEY (`user_id`);

--
-- Indici per le tabelle `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_code`);

--
-- Indici per le tabelle `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indici per le tabelle `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indici per le tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indici per le tabelle `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indici per le tabelle `service_profile_types`
--
ALTER TABLE `service_profile_types`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `u_ut_ut_id` (`userType`);

--
-- Indici per le tabelle `user_service_profile_types`
--
ALTER TABLE `user_service_profile_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_user_service_profile_types` (`coupon_code`),
  ADD KEY `idx_user_service_profile_types` (`user_id`),
  ADD KEY `user_profiles_service_profile_type_id_foreign` (`service_profile_type_id`);

--
-- Indici per le tabelle `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT per la tabella `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `service_profile_types`
--
ALTER TABLE `service_profile_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `user_service_profile_types`
--
ALTER TABLE `user_service_profile_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `api_customer_settings`
--
ALTER TABLE `api_customer_settings`
  ADD CONSTRAINT `fk_api_customer_settings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `db_user`
--
ALTER TABLE `db_user`
  ADD CONSTRAINT `db_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limiti per la tabella `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `u_ut_ut_id` FOREIGN KEY (`userType`) REFERENCES `user_type` (`id`);

--
-- Limiti per la tabella `user_service_profile_types`
--
ALTER TABLE `user_service_profile_types`
  ADD CONSTRAINT `fk_user_service_profile_types` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_profiles_service_profile_type_id_foreign` FOREIGN KEY (`service_profile_type_id`) REFERENCES `service_profile_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
