CREATE DATABASE  IF NOT EXISTS `adplify_manager` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adplify_manager`;
-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Mar 10, 2017 alle 09:34
-- Versione del server: 5.5.52-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adplify_manager`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `api_customer_settings`
--

DROP TABLE IF EXISTS `api_customer_settings`;
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

DROP TABLE IF EXISTS `coupon`;
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

DROP TABLE IF EXISTS `db_user`;
CREATE TABLE IF NOT EXISTS `db_user` (
  `user_id` int(11) unsigned NOT NULL,
  `db_host` varchar(255) NOT NULL DEFAULT '',
  `db_user` varchar(255) DEFAULT NULL,
  `db_password` varchar(255) DEFAULT NULL,
  `db_port` varchar(8) DEFAULT '3309',
  `db_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `db_user`
--

INSERT INTO `db_user` (`user_id`, `db_host`, `db_user`, `db_password`, `db_port`, `db_name`) VALUES
(18, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_18'),
(19, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_19'),
(20, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_20');

-- --------------------------------------------------------

--
-- Struttura della tabella `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `code` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `languages`
--

INSERT INTO `languages` (`code`, `description`) VALUES
('en', 'English');

-- --------------------------------------------------------

--
-- Struttura della tabella `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `severity` smallint(6) NOT NULL,
  `log` varchar(255) NOT NULL,
  `message` text,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_login` smallint(6) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=821 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `log`
--

INSERT INTO `log` (`id`, `created_at`, `severity`, `log`, `message`, `user_id`, `is_login`) VALUES
(1, '2017-03-09 16:07:51', 2, 'Tentativo di registrazione utente fallito per errore sconosciuto', 'Tentativo di registrazione utente fallito per errore sconosciuto', NULL, 0),
(2, '2017-03-09 16:08:04', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(3, '2017-03-09 16:08:18', 2, 'Tentativo di registrazione utente fallito per errore sconosciuto', 'Tentativo di registrazione utente fallito per errore sconosciuto', NULL, 0),
(4, '2017-03-09 16:08:33', 1, 'User ok', 'User ok', NULL, 0),
(5, '2017-03-09 16:08:33', 1, 'User attivato', 'User attivato', NULL, 0),
(6, '2017-03-09 16:08:33', 1, 'Prima login', 'Prima login', NULL, 0),
(7, '2017-03-09 16:08:33', 1, ' user id 19', ' user id 19', NULL, 0),
(8, '2017-03-09 16:08:33', 1, 'creo db', 'creo db', NULL, 0),
(9, '2017-03-09 16:08:34', 1, 'db creato', 'db creato', NULL, 0),
(10, '2017-03-09 16:08:34', 1, 'db impostato', 'db impostato', NULL, 0),
(11, '2017-03-09 16:08:35', 1, 'Utente salvato', 'Utente salvato', NULL, 0),
(12, '2017-03-09 16:08:35', 1, 'refreshAllTokensByUserId called ', 'refreshAllTokensByUserId called ', NULL, 0),
(13, '2017-03-09 16:08:41', 1, 'User ok', 'User ok', NULL, 0),
(14, '2017-03-09 16:08:41', 1, 'User attivato', 'User attivato', NULL, 0),
(15, '2017-03-09 16:08:41', 1, 'Prima login', 'Prima login', NULL, 0),
(16, '2017-03-09 16:08:41', 1, ' user id 18', ' user id 18', NULL, 0),
(17, '2017-03-09 16:08:41', 1, 'creo db', 'creo db', NULL, 0),
(18, '2017-03-09 16:08:43', 1, 'db creato', 'db creato', NULL, 0),
(19, '2017-03-09 16:08:43', 1, 'db impostato', 'db impostato', NULL, 0),
(20, '2017-03-09 16:08:43', 1, 'Utente salvato', 'Utente salvato', NULL, 0),
(21, '2017-03-09 16:08:43', 1, 'refreshAllTokensByUserId called ', 'refreshAllTokensByUserId called ', NULL, 0),
(22, '2017-03-09 16:09:12', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(23, '2017-03-09 16:09:12', 1, 'user_id 19', 'user_id 19', NULL, 0),
(24, '2017-03-09 16:09:12', 1, 'code 4/lrmY1rkdOGY5Eq4Idc23YLvLKlMLi8NNHXa37YTBBro', 'code 4/lrmY1rkdOGY5Eq4Idc23YLvLKlMLi8NNHXa37YTBBro', NULL, 0),
(25, '2017-03-09 16:09:12', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(26, '2017-03-09 16:09:12', 1, 'JSON REQUEST :code=4%2FlrmY1rkdOGY5Eq4Idc23YLvLKlMLi8NNHXa37YTBBro&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpubl', 'JSON REQUEST :code=4%2FlrmY1rkdOGY5Eq4Idc23YLvLKlMLi8NNHXa37YTBBro&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpublic%2Findex.php%2Fapi%2Foauth2%2FsetAccessToken&grant_type=authorization_code', NULL, 0),
(27, '2017-03-09 16:09:13', 1, 'JSON:{\n  "access_token" : "ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6ImU1NTFhZjlhNWZmZGM3MjZjZDQ1O', 'JSON:{\n  "access_token" : "ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6ImU1NTFhZjlhNWZmZGM3MjZjZDQ1ODY4MGQzZjQzODRhMjZlZmMyMTkifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDc1NzUzLCJleHAiOjE0ODkwNzkzNTMsImF0X2hhc2giOiJDZDZNc0dvOGQtZmRZNFJMVjdSMXdnIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTEyMTE4Nzg4ODYwMDMyMDMxMzk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvdmFsYXVyYTIwMTZAZ21haWwuY29tIn0.eZUvzAur6mbBCU15mqvKhTGvgUy-irqS92ryZg6F45cBLQQ5nmjcl5yUbfz1p6MEwDkxvjrjuuHqfD8Set-qQ8hkuQw79qzH9w4dwNWRiaFBi5rRvBS2xzrXYA5Zv4FXmGap10wOYFgH28NyR8fu53bdJQ_m5f3gw1pn1uNQwneAIR5C45ayOxEp-i_V-ts7REPIPjWrb8i7VG3OyzVVM903yeoyrcdafcf0LZWX4eL5wVzhaM04qLey_v68wyt98Ya0RLqJw8b0Ht8MPfEySAHR0OlQmj7miYrffv36Lv2cgcHPtC7ZETCuUrlqT1rrWcxrn8-Qt7V1axAT0cBW1g",\n  "refresh_token" : "1/2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di",\n  "token_type" : "Bearer"\n}', NULL, 0),
(28, '2017-03-09 16:09:13', 1, 'autenticato', 'autenticato', NULL, 0),
(29, '2017-03-09 16:09:13', 1, '\r\naccess_token =  ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6ImU1NTFhZjlhNWZmZGM3MjZjZDQ1ODY4MGQzZjQzODRhMjZlZmMyMTkifQ.eyJpc3M', '\r\naccess_token =  ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6ImU1NTFhZjlhNWZmZGM3MjZjZDQ1ODY4MGQzZjQzODRhMjZlZmMyMTkifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDc1NzUzLCJleHAiOjE0ODkwNzkzNTMsImF0X2hhc2giOiJDZDZNc0dvOGQtZmRZNFJMVjdSMXdnIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTEyMTE4Nzg4ODYwMDMyMDMxMzk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvdmFsYXVyYTIwMTZAZ21haWwuY29tIn0.eZUvzAur6mbBCU15mqvKhTGvgUy-irqS92ryZg6F45cBLQQ5nmjcl5yUbfz1p6MEwDkxvjrjuuHqfD8Set-qQ8hkuQw79qzH9w4dwNWRiaFBi5rRvBS2xzrXYA5Zv4FXmGap10wOYFgH28NyR8fu53bdJQ_m5f3gw1pn1uNQwneAIR5C45ayOxEp-i_V-ts7REPIPjWrb8i7VG3OyzVVM903yeoyrcdafcf0LZWX4eL5wVzhaM04qLey_v68wyt98Ya0RLqJw8b0Ht8MPfEySAHR0OlQmj7miYrffv36Lv2cgcHPtC7ZETCuUrlqT1rrWcxrn8-Qt7V1axAT0cBW1g\r\nrefresh_token =  1/2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di\r\ntoken_type =  Bearer', NULL, 0),
(30, '2017-03-09 16:09:13', 1, 'prendo access token ', 'prendo access token ', NULL, 0),
(31, '2017-03-09 16:09:13', 1, 'access token ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM', 'access token ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM', NULL, 0),
(32, '2017-03-09 16:09:13', 1, 'refresh token 1/2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di', 'refresh token 1/2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di', NULL, 0),
(33, '2017-03-09 16:09:13', 1, 'expires_in 3600', 'expires_in 3600', NULL, 0),
(34, '2017-03-09 16:09:13', 1, 'JSON REQUEST :access_token=ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM', 'JSON REQUEST :access_token=ya29.GlsJBMCEmzDDLFomegSLez960RKMxXtXyozoleEbydWOpEJQYrKeZpysHWJCrUuDWaE5CH_DFMcUJaLP1GtRgLUL44croKlfVElbAUe4uixYFuH9kmhMaXQtwCeM', NULL, 0),
(35, '2017-03-09 16:09:13', 1, 'JSON:{\n "id": "112118788860032031399",\n "email": "provalaura2016@gmail.com",\n "verified_email": true,\n "name": "Laura prova",\n "given_name": "Laura",\n "family_name": "prova",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAA', 'JSON:{\n "id": "112118788860032031399",\n "email": "provalaura2016@gmail.com",\n "verified_email": true,\n "name": "Laura prova",\n "given_name": "Laura",\n "family_name": "prova",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg",\n "locale": "it"\n}\n', NULL, 0),
(36, '2017-03-09 16:09:13', 1, 'ho ottenuto le info utente', 'ho ottenuto le info utente', NULL, 0),
(37, '2017-03-09 16:09:13', 1, ' email provalaura2016@gmail.com', ' email provalaura2016@gmail.com', NULL, 0),
(38, '2017-03-09 16:09:13', 1, 'Salvo access token', 'Salvo access token', NULL, 0),
(39, '2017-03-09 16:09:13', 1, 'salvato', 'salvato', NULL, 0),
(40, '2017-03-09 16:09:13', 1, ' Google account creato con id 1', ' Google account creato con id 1', NULL, 0),
(41, '2017-03-09 16:09:19', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(42, '2017-03-09 16:09:19', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(43, '2017-03-09 16:09:19', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(44, '2017-03-09 16:09:19', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(45, '2017-03-09 16:09:21', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(46, '2017-03-09 16:09:21', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(47, '2017-03-09 16:09:21', 1, 'saveAdGroups 2 601207815', 'saveAdGroups 2 601207815', NULL, 0),
(48, '2017-03-09 16:09:21', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(49, '2017-03-09 16:09:22', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(50, '2017-03-09 16:09:23', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(51, '2017-03-09 16:09:23', 1, 'saveAdGroups 2 612348397', 'saveAdGroups 2 612348397', NULL, 0),
(52, '2017-03-09 16:09:23', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(53, '2017-03-09 16:09:24', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(54, '2017-03-09 16:09:24', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(55, '2017-03-09 16:09:24', 1, 'saveAdGroups 2 629570633', 'saveAdGroups 2 629570633', NULL, 0),
(56, '2017-03-09 16:09:24', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(57, '2017-03-09 16:09:25', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(58, '2017-03-09 16:09:25', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(59, '2017-03-09 16:09:25', 1, 'saveAdGroups 2 213353060', 'saveAdGroups 2 213353060', NULL, 0),
(60, '2017-03-09 16:09:26', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(61, '2017-03-09 16:09:26', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(62, '2017-03-09 16:09:27', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(63, '2017-03-09 16:09:27', 1, 'saveAdGroups 2 213596180', 'saveAdGroups 2 213596180', NULL, 0),
(64, '2017-03-09 16:09:27', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(65, '2017-03-09 16:09:28', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(66, '2017-03-09 16:09:28', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(67, '2017-03-09 16:09:28', 1, 'saveAdGroups 2 166120940', 'saveAdGroups 2 166120940', NULL, 0),
(68, '2017-03-09 16:09:28', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(69, '2017-03-09 16:09:29', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(70, '2017-03-09 16:09:30', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(71, '2017-03-09 16:09:30', 1, 'saveAdGroups 2 166058180', 'saveAdGroups 2 166058180', NULL, 0),
(72, '2017-03-09 16:09:30', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(73, '2017-03-09 16:09:31', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(74, '2017-03-09 16:09:31', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(75, '2017-03-09 16:09:31', 1, 'saveAdGroups 2 177849260', 'saveAdGroups 2 177849260', NULL, 0),
(76, '2017-03-09 16:09:32', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(77, '2017-03-09 16:09:32', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(78, '2017-03-09 16:09:33', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(79, '2017-03-09 16:09:33', 1, 'saveAdGroups 2 177849140', 'saveAdGroups 2 177849140', NULL, 0),
(80, '2017-03-09 16:09:33', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(81, '2017-03-09 16:09:35', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(82, '2017-03-09 16:09:35', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(83, '2017-03-09 16:09:35', 1, 'saveAdGroups 2 124397060', 'saveAdGroups 2 124397060', NULL, 0),
(84, '2017-03-09 16:09:35', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(85, '2017-03-09 16:09:45', 1, 'User ok', 'User ok', NULL, 0),
(86, '2017-03-09 16:09:45', 1, 'User attivato', 'User attivato', NULL, 0),
(87, '2017-03-09 16:09:45', 1, 'Utente salvato', 'Utente salvato', NULL, 0),
(88, '2017-03-09 16:09:45', 1, 'refreshAllTokensByUserId called ', 'refreshAllTokensByUserId called ', NULL, 0),
(89, '2017-03-09 16:09:56', 2, 'Errore nel salvataggio dell''account', 'Errore nel salvataggio dell''account', NULL, 0),
(90, '2017-03-09 16:10:08', 2, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', NULL, 0),
(91, '2017-03-09 16:10:19', 2, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', NULL, 0),
(92, '2017-03-09 16:10:36', 3, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 18, 0),
(93, '2017-03-09 16:11:41', 1, 'User ok', 'User ok', NULL, 0),
(94, '2017-03-09 16:11:42', 1, 'User attivato', 'User attivato', NULL, 0),
(95, '2017-03-09 16:11:42', 1, 'Utente salvato', 'Utente salvato', NULL, 0),
(96, '2017-03-09 16:11:42', 1, 'refreshAllTokensByUserId called ', 'refreshAllTokensByUserId called ', NULL, 0),
(97, '2017-03-09 16:12:23', 1, 'unlinkAdwordsAccount called', 'unlinkAdwordsAccount called', NULL, 0),
(98, '2017-03-09 16:12:23', 1, 'user id passato 19', 'user id passato 19', NULL, 0),
(99, '2017-03-09 16:12:23', 1, 'id account 1', 'id account 1', NULL, 0),
(100, '2017-03-09 16:12:25', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(101, '2017-03-09 16:13:19', 1, 'User ok', 'User ok', NULL, 0),
(102, '2017-03-09 16:13:19', 1, 'User attivato', 'User attivato', NULL, 0),
(103, '2017-03-09 16:13:19', 1, 'Utente salvato', 'Utente salvato', NULL, 0),
(104, '2017-03-09 16:13:19', 1, 'refreshAllTokensByUserId called ', 'refreshAllTokensByUserId called ', NULL, 0),
(105, '2017-03-09 16:14:07', 2, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', NULL, 0),
(106, '2017-03-09 16:14:14', 2, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', NULL, 0),
(107, '2017-03-09 16:14:27', 2, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', NULL, 0),
(108, '2017-03-09 16:14:41', 3, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 19, 0),
(109, '2017-03-09 16:16:15', 2, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', NULL, 0),
(110, '2017-03-09 16:16:27', 3, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 19, 0),
(111, '2017-03-09 16:17:27', 1, 'User ok', 'User ok', NULL, 0),
(112, '2017-03-09 16:17:27', 1, 'User attivato', 'User attivato', NULL, 0),
(113, '2017-03-09 16:17:27', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(114, '2017-03-09 16:17:34', 1, 'User ok', 'User ok', NULL, 0),
(115, '2017-03-09 16:17:35', 1, 'User attivato', 'User attivato', NULL, 0),
(116, '2017-03-09 16:17:35', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(117, '2017-03-09 16:17:39', 1, 'User ok', 'User ok', NULL, 0),
(118, '2017-03-09 16:17:39', 1, 'User attivato', 'User attivato', NULL, 0),
(119, '2017-03-09 16:17:40', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(120, '2017-03-09 16:18:00', 1, 'User ok', 'User ok', NULL, 0),
(121, '2017-03-09 16:18:00', 1, 'User attivato', 'User attivato', NULL, 0),
(122, '2017-03-09 16:18:00', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(123, '2017-03-09 16:18:09', 1, 'User ok', 'User ok', NULL, 0),
(124, '2017-03-09 16:18:09', 1, 'User attivato', 'User attivato', NULL, 0),
(125, '2017-03-09 16:18:09', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(126, '2017-03-09 16:18:48', 1, 'User ok', 'User ok', NULL, 0),
(127, '2017-03-09 16:18:48', 1, 'User attivato', 'User attivato', NULL, 0),
(128, '2017-03-09 16:18:49', 1, 'Prima login', 'Prima login', NULL, 0),
(129, '2017-03-09 16:18:49', 1, ' user id 20', ' user id 20', NULL, 0),
(130, '2017-03-09 16:18:49', 1, 'creo db', 'creo db', NULL, 0),
(131, '2017-03-09 16:18:50', 1, 'db creato', 'db creato', NULL, 0),
(132, '2017-03-09 16:18:50', 1, 'db impostato', 'db impostato', NULL, 0),
(133, '2017-03-09 16:18:50', 1, 'Utente salvato', 'Utente salvato', NULL, 0),
(134, '2017-03-09 16:18:51', 1, 'refreshAllTokensByUserId called ', 'refreshAllTokensByUserId called ', NULL, 0),
(135, '2017-03-09 16:19:01', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(136, '2017-03-09 16:19:01', 1, 'user_id 20', 'user_id 20', NULL, 0),
(137, '2017-03-09 16:19:01', 1, 'code 4/l8pD0XnQgFdc81p8LvVzCQyQM-VpErgOcGohPPHti3w', 'code 4/l8pD0XnQgFdc81p8LvVzCQyQM-VpErgOcGohPPHti3w', NULL, 0),
(138, '2017-03-09 16:19:01', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(139, '2017-03-09 16:19:02', 1, 'JSON REQUEST :code=4%2Fl8pD0XnQgFdc81p8LvVzCQyQM-VpErgOcGohPPHti3w&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpubl', 'JSON REQUEST :code=4%2Fl8pD0XnQgFdc81p8LvVzCQyQM-VpErgOcGohPPHti3w&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpublic%2Findex.php%2Fapi%2Foauth2%2FsetAccessToken&grant_type=authorization_code', NULL, 0),
(140, '2017-03-09 16:19:02', 1, 'JSON:{\n  "access_token" : "ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhM', 'JSON:{\n  "access_token" : "ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDc2MzQyLCJleHAiOjE0ODkwNzk5NDIsImF0X2hhc2giOiJzOVc4NUQ1UlFTREpvZ0NfWDBEWVlRIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA4MjM0MTUxODYzNzQ1Njc0OTk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvZG90dGlAZXhvbGFiLml0In0.fCVfTivvH1dGgNR9QFoOo4RomjoU8bQoMKJ6Y78bqZ4JDF0hTVb0HH06qfJHgZEaPdNhTrj8YyAibSlaJOc5OotSSD8YQL86Y0Y8opa_OWx04ptamFhI-kZzrdmL91wTyN4T9HANmcUm19-VLl5XJuRX-QsuxsSY7In02Q_OArzzaUWmEmIedi-ycSqJV5W1b2Cp-pTRWuQp8JcLKg0_a6pCbC7injD3JIQ-Sm6q_fMtia-mdy8kb3k6uh2zYC-H2n3rNsWsbhesoufEsGiQ38da3PdYO3DF1ZxDTw6Iu45_yGOIyRsFK-cpaEtoNrPm-khGxrtzjfd_71tu0xStQg",\n  "refresh_token" : "1/tk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs",\n  "token_type" : "Bearer"\n}', NULL, 0),
(141, '2017-03-09 16:19:02', 1, 'autenticato', 'autenticato', NULL, 0),
(142, '2017-03-09 16:19:02', 1, '\r\naccess_token =  ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3M', '\r\naccess_token =  ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDc2MzQyLCJleHAiOjE0ODkwNzk5NDIsImF0X2hhc2giOiJzOVc4NUQ1UlFTREpvZ0NfWDBEWVlRIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA4MjM0MTUxODYzNzQ1Njc0OTk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvZG90dGlAZXhvbGFiLml0In0.fCVfTivvH1dGgNR9QFoOo4RomjoU8bQoMKJ6Y78bqZ4JDF0hTVb0HH06qfJHgZEaPdNhTrj8YyAibSlaJOc5OotSSD8YQL86Y0Y8opa_OWx04ptamFhI-kZzrdmL91wTyN4T9HANmcUm19-VLl5XJuRX-QsuxsSY7In02Q_OArzzaUWmEmIedi-ycSqJV5W1b2Cp-pTRWuQp8JcLKg0_a6pCbC7injD3JIQ-Sm6q_fMtia-mdy8kb3k6uh2zYC-H2n3rNsWsbhesoufEsGiQ38da3PdYO3DF1ZxDTw6Iu45_yGOIyRsFK-cpaEtoNrPm-khGxrtzjfd_71tu0xStQg\r\nrefresh_token =  1/tk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs\r\ntoken_type =  Bearer', NULL, 0),
(143, '2017-03-09 16:19:02', 1, 'prendo access token ', 'prendo access token ', NULL, 0),
(144, '2017-03-09 16:19:02', 1, 'access token ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR', 'access token ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR', NULL, 0),
(145, '2017-03-09 16:19:02', 1, 'refresh token 1/tk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs', 'refresh token 1/tk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs', NULL, 0),
(146, '2017-03-09 16:19:02', 1, 'expires_in 3600', 'expires_in 3600', NULL, 0),
(147, '2017-03-09 16:19:02', 1, 'JSON REQUEST :access_token=ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR', 'JSON REQUEST :access_token=ya29.GlsJBMx7GjtpB4H_MrZqs3zVi7ouj0Lb8fsG_5xQQCtzroOnVxbUA8SS6-fvwTom7hARXF9sDNvuEzKpZ6sDdmGi1LZ8WlIMq38bQ6cL6NZi60BeYwG-x8YddVpR', NULL, 0),
(148, '2017-03-09 16:19:03', 1, 'JSON:{\n "id": "108234151863745674999",\n "email": "prodotti@exolab.it",\n "verified_email": true,\n "name": "Prodotti Exolab",\n "given_name": "Prodotti",\n "family_name": "Exolab",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAA', 'JSON:{\n "id": "108234151863745674999",\n "email": "prodotti@exolab.it",\n "verified_email": true,\n "name": "Prodotti Exolab",\n "given_name": "Prodotti",\n "family_name": "Exolab",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg",\n "locale": "en"\n}\n', NULL, 0),
(149, '2017-03-09 16:19:03', 1, 'ho ottenuto le info utente', 'ho ottenuto le info utente', NULL, 0),
(150, '2017-03-09 16:19:03', 1, ' email prodotti@exolab.it', ' email prodotti@exolab.it', NULL, 0),
(151, '2017-03-09 16:19:03', 1, 'Salvo access token', 'Salvo access token', NULL, 0),
(152, '2017-03-09 16:19:03', 1, 'salvato', 'salvato', NULL, 0),
(153, '2017-03-09 16:19:03', 1, ' Google account creato con id 1', ' Google account creato con id 1', NULL, 0),
(154, '2017-03-09 16:19:14', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(155, '2017-03-09 16:19:14', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(156, '2017-03-09 16:19:15', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(157, '2017-03-09 16:19:15', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(158, '2017-03-09 16:19:16', 3, '[AuthorizationError.USER_PERMISSION_DENIED @ ; trigger:''<null>'']', '[AuthorizationError.USER_PERMISSION_DENIED @ ; trigger:''<null>'']', NULL, 0),
(159, '2017-03-09 16:19:16', 3, 'Impossibile caricare le campagne per il customer id selezionato', 'Impossibile caricare le campagne per il customer id selezionato', NULL, 0),
(160, '2017-03-09 16:30:17', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(161, '2017-03-09 16:30:17', 1, 'user_id 20', 'user_id 20', NULL, 0),
(162, '2017-03-09 16:30:17', 1, 'code 4/H7Ef7Q1HSB5OZ1qrNBtiuM0Q6NscSfmaNwNDhbR9h9Q', 'code 4/H7Ef7Q1HSB5OZ1qrNBtiuM0Q6NscSfmaNwNDhbR9h9Q', NULL, 0),
(163, '2017-03-09 16:30:17', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(164, '2017-03-09 16:30:17', 1, 'JSON REQUEST :code=4%2FH7Ef7Q1HSB5OZ1qrNBtiuM0Q6NscSfmaNwNDhbR9h9Q&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpubl', 'JSON REQUEST :code=4%2FH7Ef7Q1HSB5OZ1qrNBtiuM0Q6NscSfmaNwNDhbR9h9Q&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpublic%2Findex.php%2Fapi%2Foauth2%2FsetAccessToken&grant_type=authorization_code', NULL, 0),
(165, '2017-03-09 16:30:17', 1, 'JSON:{\n  "access_token" : "ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhM', 'JSON:{\n  "access_token" : "ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDc3MDE3LCJleHAiOjE0ODkwODA2MTcsImF0X2hhc2giOiI2MGtteHlLdHJOYjB1b1E4NVRVQmd3IiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTEyMTE4Nzg4ODYwMDMyMDMxMzk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvdmFsYXVyYTIwMTZAZ21haWwuY29tIn0.L9yb3q53QHNLTvKT51euzg2P6oxLj21vWvtxlthhDTdu5a3rB856dCuwzp2blDOcg0Uk_FF_TnoFxjiSTLEeny7L53AtTWsxOt2ycsZ9B-y42Ajh52ACDBnUGOgi8egr3qOp-R9Wgn_u5zbOwFwnfazGdp6XYPW8ZKOVND2cptWBOSu8lvOL2E6qyAFYQn2-b9KNwAno4m4YONXKt8xqraWrsoBrobPWIs8B2AyCi4mq_NoMNXshnXYD5JdCTPYcoGLmfYTP6HAZRZiUMSYw2LTK56WxS-zbFNu-kxE6mYN6CvfCUBh18LEj3TvHVhq1rQgEYh5QR3R8gPW-05JjQA",\n  "refresh_token" : "1/kDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8",\n  "token_type" : "Bearer"\n}', NULL, 0),
(166, '2017-03-09 16:30:18', 1, 'autenticato', 'autenticato', NULL, 0),
(167, '2017-03-09 16:30:18', 1, '\r\naccess_token =  ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3M', '\r\naccess_token =  ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDc3MDE3LCJleHAiOjE0ODkwODA2MTcsImF0X2hhc2giOiI2MGtteHlLdHJOYjB1b1E4NVRVQmd3IiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTEyMTE4Nzg4ODYwMDMyMDMxMzk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvdmFsYXVyYTIwMTZAZ21haWwuY29tIn0.L9yb3q53QHNLTvKT51euzg2P6oxLj21vWvtxlthhDTdu5a3rB856dCuwzp2blDOcg0Uk_FF_TnoFxjiSTLEeny7L53AtTWsxOt2ycsZ9B-y42Ajh52ACDBnUGOgi8egr3qOp-R9Wgn_u5zbOwFwnfazGdp6XYPW8ZKOVND2cptWBOSu8lvOL2E6qyAFYQn2-b9KNwAno4m4YONXKt8xqraWrsoBrobPWIs8B2AyCi4mq_NoMNXshnXYD5JdCTPYcoGLmfYTP6HAZRZiUMSYw2LTK56WxS-zbFNu-kxE6mYN6CvfCUBh18LEj3TvHVhq1rQgEYh5QR3R8gPW-05JjQA\r\nrefresh_token =  1/kDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8\r\ntoken_type =  Bearer', NULL, 0),
(168, '2017-03-09 16:30:18', 1, 'prendo access token ', 'prendo access token ', NULL, 0),
(169, '2017-03-09 16:30:18', 1, 'access token ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD', 'access token ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD', NULL, 0),
(170, '2017-03-09 16:30:18', 1, 'refresh token 1/kDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8', 'refresh token 1/kDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8', NULL, 0),
(171, '2017-03-09 16:30:18', 1, 'expires_in 3600', 'expires_in 3600', NULL, 0),
(172, '2017-03-09 16:30:18', 1, 'JSON REQUEST :access_token=ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD', 'JSON REQUEST :access_token=ya29.GlsJBIg4hIgXrjyDsX_W_qfAIpLtPiXjiiVCWkH_aLn-D9WbeL9JDhr8uaJ3ZUxonbhugCNksyJOBGM5d2UZ5yw90LjnDXCRrtOBVlOHTPBqYi_orOzCQVeiR9eD', NULL, 0),
(173, '2017-03-09 16:30:18', 1, 'JSON:{\n "id": "112118788860032031399",\n "email": "provalaura2016@gmail.com",\n "verified_email": true,\n "name": "Laura prova",\n "given_name": "Laura",\n "family_name": "prova",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAA', 'JSON:{\n "id": "112118788860032031399",\n "email": "provalaura2016@gmail.com",\n "verified_email": true,\n "name": "Laura prova",\n "given_name": "Laura",\n "family_name": "prova",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg",\n "locale": "it"\n}\n', NULL, 0),
(174, '2017-03-09 16:30:18', 1, 'ho ottenuto le info utente', 'ho ottenuto le info utente', NULL, 0),
(175, '2017-03-09 16:30:18', 1, ' email provalaura2016@gmail.com', ' email provalaura2016@gmail.com', NULL, 0),
(176, '2017-03-09 16:30:18', 1, 'Salvo access token', 'Salvo access token', NULL, 0),
(177, '2017-03-09 16:30:18', 1, 'salvato', 'salvato', NULL, 0),
(178, '2017-03-09 16:30:18', 1, ' Google account creato con id 2', ' Google account creato con id 2', NULL, 0),
(179, '2017-03-09 16:30:26', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(180, '2017-03-09 16:30:26', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(181, '2017-03-09 16:30:27', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(182, '2017-03-09 16:30:27', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(183, '2017-03-09 16:30:28', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(184, '2017-03-09 16:30:29', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(185, '2017-03-09 16:30:29', 1, 'saveAdGroups 2 601207815', 'saveAdGroups 2 601207815', NULL, 0),
(186, '2017-03-09 16:30:29', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(187, '2017-03-09 16:30:30', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(188, '2017-03-09 16:30:30', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(189, '2017-03-09 16:30:30', 1, 'saveAdGroups 2 612348397', 'saveAdGroups 2 612348397', NULL, 0),
(190, '2017-03-09 16:30:30', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(191, '2017-03-09 16:30:31', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(192, '2017-03-09 16:30:31', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(193, '2017-03-09 16:30:32', 1, 'saveAdGroups 2 629570633', 'saveAdGroups 2 629570633', NULL, 0),
(194, '2017-03-09 16:30:32', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(195, '2017-03-09 16:30:32', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(196, '2017-03-09 16:30:33', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(197, '2017-03-09 16:30:33', 1, 'saveAdGroups 2 213353060', 'saveAdGroups 2 213353060', NULL, 0),
(198, '2017-03-09 16:30:33', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(199, '2017-03-09 16:30:34', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(200, '2017-03-09 16:30:35', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(201, '2017-03-09 16:30:35', 1, 'saveAdGroups 2 213596180', 'saveAdGroups 2 213596180', NULL, 0),
(202, '2017-03-09 16:30:35', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(203, '2017-03-09 16:30:35', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(204, '2017-03-09 16:30:36', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(205, '2017-03-09 16:30:36', 1, 'saveAdGroups 2 166120940', 'saveAdGroups 2 166120940', NULL, 0),
(206, '2017-03-09 16:30:36', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(207, '2017-03-09 16:30:37', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(208, '2017-03-09 16:30:38', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(209, '2017-03-09 16:30:38', 1, 'saveAdGroups 2 166058180', 'saveAdGroups 2 166058180', NULL, 0),
(210, '2017-03-09 16:30:38', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(211, '2017-03-09 16:30:38', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(212, '2017-03-09 16:30:39', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(213, '2017-03-09 16:30:39', 1, 'saveAdGroups 2 177849260', 'saveAdGroups 2 177849260', NULL, 0),
(214, '2017-03-09 16:30:39', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(215, '2017-03-09 16:30:40', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(216, '2017-03-09 16:30:40', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(217, '2017-03-09 16:30:40', 1, 'saveAdGroups 2 177849140', 'saveAdGroups 2 177849140', NULL, 0),
(218, '2017-03-09 16:30:41', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(219, '2017-03-09 16:30:41', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(220, '2017-03-09 16:30:42', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(221, '2017-03-09 16:30:42', 1, 'saveAdGroups 2 124397060', 'saveAdGroups 2 124397060', NULL, 0),
(222, '2017-03-09 16:30:43', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(223, '2017-03-09 16:30:58', 1, 'getCampaigns called ', 'getCampaigns called ', NULL, 0),
(224, '2017-03-09 16:31:24', 2, 'Errore nel salvataggio dell''account', 'Errore nel salvataggio dell''account', NULL, 0),
(225, '2017-03-09 16:35:38', 2, 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', 'Impossibile cambiare la password utente, possibili cause : utente non trovato o password attuale errata ', NULL, 0),
(226, '2017-03-09 17:04:59', 1, 'User ok', 'User ok', NULL, 0),
(227, '2017-03-09 17:04:59', 1, 'User attivato', 'User attivato', NULL, 0),
(228, '2017-03-09 17:04:59', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(229, '2017-03-09 17:05:15', 2, 'Tentativo di registrazione utente fallito per errore sconosciuto', 'Tentativo di registrazione utente fallito per errore sconosciuto', NULL, 0),
(230, '2017-03-09 17:06:11', 1, 'User ok', 'User ok', NULL, 0),
(231, '2017-03-09 17:06:11', 1, 'User attivato', 'User attivato', NULL, 0),
(232, '2017-03-09 17:06:11', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(233, '2017-03-09 17:39:48', 4, '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', NULL, 0),
(234, '2017-03-09 17:39:48', 1, 'handleSoapFault called', 'handleSoapFault called', NULL, 0),
(235, '2017-03-09 17:39:48', 4, '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', NULL, 0),
(236, '2017-03-09 17:39:48', 1, 'handleSoapFault called', 'handleSoapFault called', NULL, 0),
(237, '2017-03-09 17:39:50', 1, 'User ok', 'User ok', NULL, 0),
(238, '2017-03-09 17:39:50', 1, 'User attivato', 'User attivato', NULL, 0),
(239, '2017-03-09 17:39:50', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(240, '2017-03-09 17:39:53', 4, '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', NULL, 0),
(241, '2017-03-09 17:39:53', 1, 'handleSoapFault called', 'handleSoapFault called', NULL, 0),
(242, '2017-03-09 17:40:02', 2, 'Tentativo di registrazione utente fallito per errore sconosciuto', 'Tentativo di registrazione utente fallito per errore sconosciuto', NULL, 0),
(243, '2017-03-09 17:40:42', 4, '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', '[AuthenticationError.OAUTH_TOKEN_INVALID @ ; trigger:''<null>'']', NULL, 0),
(244, '2017-03-09 17:40:42', 1, 'handleSoapFault called', 'handleSoapFault called', NULL, 0),
(245, '2017-03-09 17:40:44', 1, 'User ok', 'User ok', NULL, 0),
(246, '2017-03-09 17:40:44', 1, 'User attivato', 'User attivato', NULL, 0),
(247, '2017-03-09 17:40:44', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(248, '2017-03-09 17:40:52', 1, 'User ok', 'User ok', NULL, 0),
(249, '2017-03-09 17:40:52', 1, 'User attivato', 'User attivato', NULL, 0),
(250, '2017-03-09 17:40:52', 3, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(251, '2017-03-09 17:40:57', 1, 'User ok', 'User ok', NULL, 0),
(252, '2017-03-09 17:40:57', 1, 'User attivato', 'User attivato', NULL, 0),
(253, '2017-03-09 17:40:57', 1, 'Utente salvato', 'Utente salvato', NULL, 0),
(254, '2017-03-09 17:40:57', 1, 'refreshAllTokensByUserId called ', 'refreshAllTokensByUserId called ', NULL, 0),
(255, '2017-03-09 17:40:58', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(256, '2017-03-09 17:40:58', 1, 'JSON REQUEST :refresh_token=1%2F2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', 'JSON REQUEST :refresh_token=1%2F2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', NULL, 0),
(257, '2017-03-09 17:40:58', 1, 'JSON:{\n  "access_token" : "ya29.GlsJBAGictTmOb9Pg3CKGXSDh5I1Ow9bQzUOS4EZRqBT5yFLzk53MiDhDiDJNBRPBHXo7f8eAiZgSWbWE73XRDm_F7GWjWOnZAM9azqzHKhJ22waYCEhWwIXIRkX",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhM', 'JSON:{\n  "access_token" : "ya29.GlsJBAGictTmOb9Pg3CKGXSDh5I1Ow9bQzUOS4EZRqBT5yFLzk53MiDhDiDJNBRPBHXo7f8eAiZgSWbWE73XRDm_F7GWjWOnZAM9azqzHKhJ22waYCEhWwIXIRkX",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDgxMjU4LCJleHAiOjE0ODkwODQ4NTgsImF0X2hhc2giOiJkbkp0eVl2cHNFTTdLbjhoUWMtXzJRIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTEyMTE4Nzg4ODYwMDMyMDMxMzk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvdmFsYXVyYTIwMTZAZ21haWwuY29tIn0.RNOk--pkHKOuVz2W1QprydMZ2UpdOHVQxaalErRQaWW2c6qHKCfmLDRtZoJN-QaO0Yu3tqK0pi30eOtZzni465Vb0fYdg5a43aFdyLkij1IfjlH-5PBqYSDoNzRONtK97h8umF2jSdzR2hnZ1KX9MJihCqmr6NACOlMAJGwjKtWZfeFXiGbXlEl2btVxbIpie5T73Mjv_IzkmXFy7tvl6ixE1ym616ClclZ_YwTGFjq-klYAE-PAP8pemsxUWmDFmONljIL_zuho-GP6rzEe1EfLlIUTlGylJPYQR6j8NZJi3-QiIGxTTXM3A2dVLdr0fsH1tQFqux53CQteFXbOtQ",\n  "token_type" : "Bearer"\n}', NULL, 0),
(258, '2017-03-09 17:40:58', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(259, '2017-03-09 17:40:58', 1, 'ok', 'ok', NULL, 0),
(260, '2017-03-09 17:40:58', 1, 'access_token=ya29.GlsJBAGictTmOb9Pg3CKGXSDh5I1Ow9bQzUOS4EZRqBT5yFLzk53MiDhDiDJNBRPBHXo7f8eAiZgSWbWE73XRDm_F7GWjWOnZAM9azqzHKhJ22waYCEhWwIXIRkX', 'access_token=ya29.GlsJBAGictTmOb9Pg3CKGXSDh5I1Ow9bQzUOS4EZRqBT5yFLzk53MiDhDiDJNBRPBHXo7f8eAiZgSWbWE73XRDm_F7GWjWOnZAM9azqzHKhJ22waYCEhWwIXIRkX', NULL, 0),
(261, '2017-03-09 17:40:58', 1, 'expires_in=3600', 'expires_in=3600', NULL, 0),
(262, '2017-03-09 17:40:58', 1, 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDgxMjU4LCJleHAiOjE0ODkwODQ4NTgsImF0X2hhc2giOiJkbkp0eVl2cHNFTTdLbjhoUWMtXzJRIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXN', 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDgxMjU4LCJleHAiOjE0ODkwODQ4NTgsImF0X2hhc2giOiJkbkp0eVl2cHNFTTdLbjhoUWMtXzJRIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTEyMTE4Nzg4ODYwMDMyMDMxMzk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvdmFsYXVyYTIwMTZAZ21haWwuY29tIn0.RNOk--pkHKOuVz2W1QprydMZ2UpdOHVQxaalErRQaWW2c6qHKCfmLDRtZoJN-QaO0Yu3tqK0pi30eOtZzni465Vb0fYdg5a43aFdyLkij1IfjlH-5PBqYSDoNzRONtK97h8umF2jSdzR2hnZ1KX9MJihCqmr6NACOlMAJGwjKtWZfeFXiGbXlEl2btVxbIpie5T73Mjv_IzkmXFy7tvl6ixE1ym616ClclZ_YwTGFjq-klYAE-PAP8pemsxUWmDFmONljIL_zuho-GP6rzEe1EfLlIUTlGylJPYQR6j8NZJi3-QiIGxTTXM3A2dVLdr0fsH1tQFqux53CQteFXbOtQ', NULL, 0),
(263, '2017-03-09 17:40:58', 1, 'token_type=Bearer', 'token_type=Bearer', NULL, 0),
(264, '2017-03-09 17:41:10', 1, 'unlinkAdwordsAccount called', 'unlinkAdwordsAccount called', NULL, 0),
(265, '2017-03-09 17:41:10', 1, 'user id passato 19', 'user id passato 19', NULL, 0),
(266, '2017-03-09 17:41:10', 1, 'id account 1', 'id account 1', NULL, 0),
(267, '2017-03-09 17:41:23', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(268, '2017-03-09 17:41:46', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(269, '2017-03-09 17:41:46', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(270, '2017-03-09 17:41:47', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(271, '2017-03-09 17:41:47', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(272, '2017-03-09 17:41:52', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(273, '2017-03-09 17:41:53', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(274, '2017-03-09 17:41:53', 1, 'saveAdGroups 2 673967709', 'saveAdGroups 2 673967709', NULL, 0),
(275, '2017-03-09 17:41:54', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(276, '2017-03-09 17:41:55', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(277, '2017-03-09 17:41:56', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(278, '2017-03-09 17:41:56', 1, 'saveAdGroups 2 675116605', 'saveAdGroups 2 675116605', NULL, 0),
(279, '2017-03-09 17:41:56', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(280, '2017-03-09 17:42:03', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(281, '2017-03-09 17:42:04', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(282, '2017-03-09 17:42:04', 1, 'saveAdGroups 2 673967703', 'saveAdGroups 2 673967703', NULL, 0),
(283, '2017-03-09 17:42:04', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(284, '2017-03-09 17:42:04', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(285, '2017-03-09 17:42:05', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(286, '2017-03-09 17:42:05', 1, 'saveAdGroups 2 634187427', 'saveAdGroups 2 634187427', NULL, 0),
(287, '2017-03-09 17:42:05', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(288, '2017-03-09 17:42:06', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(289, '2017-03-09 17:42:07', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(290, '2017-03-09 17:42:07', 1, 'saveAdGroups 2 624065039', 'saveAdGroups 2 624065039', NULL, 0),
(291, '2017-03-09 17:42:07', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(292, '2017-03-09 17:42:08', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(293, '2017-03-09 17:42:08', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(294, '2017-03-09 17:42:08', 1, 'saveAdGroups 2 624065033', 'saveAdGroups 2 624065033', NULL, 0),
(295, '2017-03-09 17:42:08', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(296, '2017-03-09 17:42:09', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(297, '2017-03-09 17:42:10', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(298, '2017-03-09 17:42:10', 1, 'saveAdGroups 2 624065165', 'saveAdGroups 2 624065165', NULL, 0),
(299, '2017-03-09 17:42:10', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(300, '2017-03-09 17:42:11', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(301, '2017-03-09 17:42:12', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(302, '2017-03-09 17:42:12', 1, 'saveAdGroups 2 624065168', 'saveAdGroups 2 624065168', NULL, 0),
(303, '2017-03-09 17:42:12', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(304, '2017-03-09 17:42:13', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(305, '2017-03-09 17:42:13', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(306, '2017-03-09 17:42:13', 1, 'saveAdGroups 2 625494885', 'saveAdGroups 2 625494885', NULL, 0),
(307, '2017-03-09 17:42:13', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(308, '2017-03-09 17:42:14', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(309, '2017-03-09 17:42:15', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(310, '2017-03-09 17:42:15', 1, 'saveAdGroups 2 625494888', 'saveAdGroups 2 625494888', NULL, 0),
(311, '2017-03-09 17:42:16', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(312, '2017-03-09 17:42:17', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(313, '2017-03-09 17:42:17', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(314, '2017-03-09 17:42:17', 1, 'saveAdGroups 2 625494891', 'saveAdGroups 2 625494891', NULL, 0),
(315, '2017-03-09 17:42:17', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(316, '2017-03-09 17:42:18', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(317, '2017-03-09 17:42:19', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(318, '2017-03-09 17:42:19', 1, 'saveAdGroups 2 625494894', 'saveAdGroups 2 625494894', NULL, 0),
(319, '2017-03-09 17:42:19', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(320, '2017-03-09 17:42:20', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(321, '2017-03-09 17:42:20', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(322, '2017-03-09 17:42:20', 1, 'saveAdGroups 2 719399660', 'saveAdGroups 2 719399660', NULL, 0),
(323, '2017-03-09 17:42:20', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(324, '2017-03-09 17:42:21', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(325, '2017-03-09 17:42:22', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(326, '2017-03-09 17:42:22', 1, 'saveAdGroups 2 719399663', 'saveAdGroups 2 719399663', NULL, 0),
(327, '2017-03-09 17:42:22', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(328, '2017-03-09 17:42:22', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(329, '2017-03-09 17:42:23', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(330, '2017-03-09 17:42:23', 1, 'saveAdGroups 2 717490475', 'saveAdGroups 2 717490475', NULL, 0),
(331, '2017-03-09 17:42:23', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(332, '2017-03-09 17:42:24', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(333, '2017-03-09 17:42:24', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(334, '2017-03-09 17:42:24', 1, 'saveAdGroups 2 717587485', 'saveAdGroups 2 717587485', NULL, 0),
(335, '2017-03-09 17:42:24', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(336, '2017-03-09 17:42:25', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(337, '2017-03-09 17:42:25', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(338, '2017-03-09 17:42:25', 1, 'saveAdGroups 2 624075533', 'saveAdGroups 2 624075533', NULL, 0),
(339, '2017-03-09 17:42:25', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(340, '2017-03-09 17:42:26', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(341, '2017-03-09 17:42:27', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(342, '2017-03-09 17:42:27', 1, 'saveAdGroups 2 624075530', 'saveAdGroups 2 624075530', NULL, 0),
(343, '2017-03-09 17:42:27', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(344, '2017-03-09 17:42:28', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(345, '2017-03-09 17:42:29', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(346, '2017-03-09 17:42:29', 1, 'saveAdGroups 2 624075539', 'saveAdGroups 2 624075539', NULL, 0),
(347, '2017-03-09 17:42:29', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(348, '2017-03-09 17:42:30', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(349, '2017-03-09 17:42:30', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(350, '2017-03-09 17:42:30', 1, 'saveAdGroups 2 624075536', 'saveAdGroups 2 624075536', NULL, 0),
(351, '2017-03-09 17:42:30', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(352, '2017-03-09 17:42:31', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(353, '2017-03-09 17:42:32', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(354, '2017-03-09 17:42:32', 1, 'saveAdGroups 2 624075542', 'saveAdGroups 2 624075542', NULL, 0),
(355, '2017-03-09 17:42:32', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(356, '2017-03-09 17:42:33', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(357, '2017-03-09 17:42:34', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(358, '2017-03-09 17:42:34', 1, 'saveAdGroups 2 624075545', 'saveAdGroups 2 624075545', NULL, 0);
INSERT INTO `log` (`id`, `created_at`, `severity`, `log`, `message`, `user_id`, `is_login`) VALUES
(359, '2017-03-09 17:42:34', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(360, '2017-03-09 17:42:35', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(361, '2017-03-09 17:42:35', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(362, '2017-03-09 17:42:35', 1, 'saveAdGroups 2 624075548', 'saveAdGroups 2 624075548', NULL, 0),
(363, '2017-03-09 17:42:35', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(364, '2017-03-09 17:42:36', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(365, '2017-03-09 17:42:36', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(366, '2017-03-09 17:42:36', 1, 'saveAdGroups 2 624075551', 'saveAdGroups 2 624075551', NULL, 0),
(367, '2017-03-09 17:42:37', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(368, '2017-03-09 17:42:37', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(369, '2017-03-09 17:42:38', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(370, '2017-03-09 17:42:38', 1, 'saveAdGroups 2 624085628', 'saveAdGroups 2 624085628', NULL, 0),
(371, '2017-03-09 17:42:38', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(372, '2017-03-09 17:42:39', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(373, '2017-03-09 17:42:40', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(374, '2017-03-09 17:42:40', 1, 'saveAdGroups 2 624178023', 'saveAdGroups 2 624178023', NULL, 0),
(375, '2017-03-09 17:42:40', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(376, '2017-03-09 17:42:41', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(377, '2017-03-09 17:42:41', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(378, '2017-03-09 17:42:41', 1, 'saveAdGroups 2 624084860', 'saveAdGroups 2 624084860', NULL, 0),
(379, '2017-03-09 17:42:41', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(380, '2017-03-09 17:42:42', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(381, '2017-03-09 17:42:43', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(382, '2017-03-09 17:42:43', 1, 'saveAdGroups 2 624085631', 'saveAdGroups 2 624085631', NULL, 0),
(383, '2017-03-09 17:42:43', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(384, '2017-03-09 17:42:44', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(385, '2017-03-09 17:42:44', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(386, '2017-03-09 17:42:45', 1, 'saveAdGroups 2 624089750', 'saveAdGroups 2 624089750', NULL, 0),
(387, '2017-03-09 17:42:45', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(388, '2017-03-09 17:42:45', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(389, '2017-03-09 17:42:46', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(390, '2017-03-09 17:42:46', 1, 'saveAdGroups 2 623892614', 'saveAdGroups 2 623892614', NULL, 0),
(391, '2017-03-09 17:42:46', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(392, '2017-03-09 17:42:46', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(393, '2017-03-09 17:42:47', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(394, '2017-03-09 17:42:47', 1, 'saveAdGroups 2 708441806', 'saveAdGroups 2 708441806', NULL, 0),
(395, '2017-03-09 17:42:47', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(396, '2017-03-09 17:42:47', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(397, '2017-03-09 17:42:48', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(398, '2017-03-09 17:42:48', 1, 'saveAdGroups 2 634284225', 'saveAdGroups 2 634284225', NULL, 0),
(399, '2017-03-09 17:42:48', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(400, '2017-03-09 17:42:49', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(401, '2017-03-09 17:42:50', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(402, '2017-03-09 17:42:50', 1, 'saveAdGroups 2 634284222', 'saveAdGroups 2 634284222', NULL, 0),
(403, '2017-03-09 17:42:50', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(404, '2017-03-09 17:42:51', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(405, '2017-03-09 17:42:51', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(406, '2017-03-09 17:42:51', 1, 'saveAdGroups 2 634080718', 'saveAdGroups 2 634080718', NULL, 0),
(407, '2017-03-09 17:42:51', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(408, '2017-03-09 17:42:52', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(409, '2017-03-09 17:42:53', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(410, '2017-03-09 17:42:53', 1, 'saveAdGroups 2 634080712', 'saveAdGroups 2 634080712', NULL, 0),
(411, '2017-03-09 17:42:53', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(412, '2017-03-09 17:42:53', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(413, '2017-03-09 17:42:54', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(414, '2017-03-09 17:42:54', 1, 'saveAdGroups 2 634080715', 'saveAdGroups 2 634080715', NULL, 0),
(415, '2017-03-09 17:42:54', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(416, '2017-03-09 17:42:55', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(417, '2017-03-09 17:42:55', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(418, '2017-03-09 17:42:55', 1, 'saveAdGroups 2 634080709', 'saveAdGroups 2 634080709', NULL, 0),
(419, '2017-03-09 17:42:55', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(420, '2017-03-09 17:42:56', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(421, '2017-03-09 17:42:57', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(422, '2017-03-09 17:42:57', 1, 'saveAdGroups 2 624190767', 'saveAdGroups 2 624190767', NULL, 0),
(423, '2017-03-09 17:42:57', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(424, '2017-03-09 17:42:57', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(425, '2017-03-09 17:42:58', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(426, '2017-03-09 17:42:58', 1, 'saveAdGroups 2 624190773', 'saveAdGroups 2 624190773', NULL, 0),
(427, '2017-03-09 17:42:58', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(428, '2017-03-09 17:42:59', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(429, '2017-03-09 17:42:59', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(430, '2017-03-09 17:42:59', 1, 'saveAdGroups 2 624190749', 'saveAdGroups 2 624190749', NULL, 0),
(431, '2017-03-09 17:42:59', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(432, '2017-03-09 17:43:01', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(433, '2017-03-09 17:43:02', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(434, '2017-03-09 17:43:02', 1, 'saveAdGroups 2 624189276', 'saveAdGroups 2 624189276', NULL, 0),
(435, '2017-03-09 17:43:02', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(436, '2017-03-09 17:43:03', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(437, '2017-03-09 17:43:03', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(438, '2017-03-09 17:43:03', 1, 'saveAdGroups 2 624399296', 'saveAdGroups 2 624399296', NULL, 0),
(439, '2017-03-09 17:43:03', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(440, '2017-03-09 17:43:04', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(441, '2017-03-09 17:43:04', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(442, '2017-03-09 17:43:04', 1, 'saveAdGroups 2 623915267', 'saveAdGroups 2 623915267', NULL, 0),
(443, '2017-03-09 17:43:04', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(444, '2017-03-09 17:43:05', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(445, '2017-03-09 17:43:06', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(446, '2017-03-09 17:43:06', 1, 'saveAdGroups 2 673746122', 'saveAdGroups 2 673746122', NULL, 0),
(447, '2017-03-09 17:43:06', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(448, '2017-03-09 17:43:06', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(449, '2017-03-09 17:43:07', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(450, '2017-03-09 17:43:07', 1, 'saveAdGroups 2 673744295', 'saveAdGroups 2 673744295', NULL, 0),
(451, '2017-03-09 17:43:07', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(452, '2017-03-09 17:43:08', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(453, '2017-03-09 17:43:08', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(454, '2017-03-09 17:43:08', 1, 'saveAdGroups 2 687848607', 'saveAdGroups 2 687848607', NULL, 0),
(455, '2017-03-09 17:43:08', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(456, '2017-03-09 17:43:09', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(457, '2017-03-09 17:43:09', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(458, '2017-03-09 17:43:09', 1, 'saveAdGroups 2 673967706', 'saveAdGroups 2 673967706', NULL, 0),
(459, '2017-03-09 17:43:10', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(460, '2017-03-09 17:43:10', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(461, '2017-03-09 17:43:11', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(462, '2017-03-09 17:43:11', 1, 'saveAdGroups 2 673988109', 'saveAdGroups 2 673988109', NULL, 0),
(463, '2017-03-09 17:43:11', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(464, '2017-03-09 17:43:12', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(465, '2017-03-09 17:43:12', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(466, '2017-03-09 17:43:12', 1, 'saveAdGroups 2 626586181', 'saveAdGroups 2 626586181', NULL, 0),
(467, '2017-03-09 17:43:12', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(468, '2017-03-09 17:43:13', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(469, '2017-03-09 17:43:13', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(470, '2017-03-09 17:43:13', 1, 'saveAdGroups 2 626586178', 'saveAdGroups 2 626586178', NULL, 0),
(471, '2017-03-09 17:43:13', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(472, '2017-03-09 17:43:14', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(473, '2017-03-09 17:43:15', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(474, '2017-03-09 17:43:15', 1, 'saveAdGroups 2 626586175', 'saveAdGroups 2 626586175', NULL, 0),
(475, '2017-03-09 17:43:15', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(476, '2017-03-09 17:43:15', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(477, '2017-03-09 17:43:16', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(478, '2017-03-09 17:43:16', 1, 'saveAdGroups 2 626586172', 'saveAdGroups 2 626586172', NULL, 0),
(479, '2017-03-09 17:43:16', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(480, '2017-03-09 17:43:17', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(481, '2017-03-09 17:43:18', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(482, '2017-03-09 17:43:18', 1, 'saveAdGroups 2 627192676', 'saveAdGroups 2 627192676', NULL, 0),
(483, '2017-03-09 17:43:18', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(484, '2017-03-09 17:43:18', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(485, '2017-03-09 17:43:19', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(486, '2017-03-09 17:43:19', 1, 'saveAdGroups 2 627192679', 'saveAdGroups 2 627192679', NULL, 0),
(487, '2017-03-09 17:43:19', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(488, '2017-03-09 17:43:20', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(489, '2017-03-09 17:43:20', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(490, '2017-03-09 17:43:20', 1, 'saveAdGroups 2 624656367', 'saveAdGroups 2 624656367', NULL, 0),
(491, '2017-03-09 17:43:20', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(492, '2017-03-09 17:43:21', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(493, '2017-03-09 17:43:22', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(494, '2017-03-09 17:43:22', 1, 'saveAdGroups 2 624656364', 'saveAdGroups 2 624656364', NULL, 0),
(495, '2017-03-09 17:43:22', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(496, '2017-03-09 17:43:23', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(497, '2017-03-09 17:43:24', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(498, '2017-03-09 17:43:24', 1, 'saveAdGroups 2 624399299', 'saveAdGroups 2 624399299', NULL, 0),
(499, '2017-03-09 17:43:24', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(500, '2017-03-09 17:43:24', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(501, '2017-03-09 17:43:25', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(502, '2017-03-09 17:43:25', 1, 'saveAdGroups 2 623997110', 'saveAdGroups 2 623997110', NULL, 0),
(503, '2017-03-09 17:43:25', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(504, '2017-03-09 17:43:25', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(505, '2017-03-09 17:43:26', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(506, '2017-03-09 17:43:26', 1, 'saveAdGroups 2 627192673', 'saveAdGroups 2 627192673', NULL, 0),
(507, '2017-03-09 17:43:26', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(508, '2017-03-09 17:43:27', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(509, '2017-03-09 17:43:27', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(510, '2017-03-09 17:43:27', 1, 'saveAdGroups 2 627370983', 'saveAdGroups 2 627370983', NULL, 0),
(511, '2017-03-09 17:43:27', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(512, '2017-03-09 17:43:28', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(513, '2017-03-09 17:43:28', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(514, '2017-03-09 17:43:29', 1, 'saveAdGroups 2 708172207', 'saveAdGroups 2 708172207', NULL, 0),
(515, '2017-03-09 17:43:29', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(516, '2017-03-09 17:43:29', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(517, '2017-03-09 17:43:30', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(518, '2017-03-09 17:43:30', 1, 'saveAdGroups 2 708542592', 'saveAdGroups 2 708542592', NULL, 0),
(519, '2017-03-09 17:43:30', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(520, '2017-03-09 17:43:30', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(521, '2017-03-09 17:43:31', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(522, '2017-03-09 17:43:31', 1, 'saveAdGroups 2 708542595', 'saveAdGroups 2 708542595', NULL, 0),
(523, '2017-03-09 17:43:31', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(524, '2017-03-09 17:43:32', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(525, '2017-03-09 17:43:32', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(526, '2017-03-09 17:43:32', 1, 'saveAdGroups 2 708592209', 'saveAdGroups 2 708592209', NULL, 0),
(527, '2017-03-09 17:43:32', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(528, '2017-03-09 17:43:33', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(529, '2017-03-09 17:43:34', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(530, '2017-03-09 17:43:34', 1, 'saveAdGroups 2 708542589', 'saveAdGroups 2 708542589', NULL, 0),
(531, '2017-03-09 17:43:34', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(532, '2017-03-09 17:43:35', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(533, '2017-03-09 17:43:35', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(534, '2017-03-09 17:43:35', 1, 'saveAdGroups 2 708542598', 'saveAdGroups 2 708542598', NULL, 0),
(535, '2017-03-09 17:43:35', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(536, '2017-03-09 17:43:36', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(537, '2017-03-09 17:43:36', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(538, '2017-03-09 17:43:36', 1, 'saveAdGroups 2 634226633', 'saveAdGroups 2 634226633', NULL, 0),
(539, '2017-03-09 17:43:36', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(540, '2017-03-09 17:43:37', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(541, '2017-03-09 17:43:38', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(542, '2017-03-09 17:43:38', 1, 'saveAdGroups 2 655183399', 'saveAdGroups 2 655183399', NULL, 0),
(543, '2017-03-09 17:43:38', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(544, '2017-03-09 17:43:38', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(545, '2017-03-09 17:43:39', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(546, '2017-03-09 17:43:39', 1, 'saveAdGroups 2 657894214', 'saveAdGroups 2 657894214', NULL, 0),
(547, '2017-03-09 17:43:39', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(548, '2017-03-09 17:43:40', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(549, '2017-03-09 17:43:40', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(550, '2017-03-09 17:43:41', 1, 'saveAdGroups 2 623864344', 'saveAdGroups 2 623864344', NULL, 0),
(551, '2017-03-09 17:43:41', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(552, '2017-03-09 17:43:41', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(553, '2017-03-09 17:43:42', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(554, '2017-03-09 17:43:42', 1, 'saveAdGroups 2 624399302', 'saveAdGroups 2 624399302', NULL, 0),
(555, '2017-03-09 17:43:42', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(556, '2017-03-09 17:43:42', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(557, '2017-03-09 17:43:43', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(558, '2017-03-09 17:43:43', 1, 'saveAdGroups 2 624399308', 'saveAdGroups 2 624399308', NULL, 0),
(559, '2017-03-09 17:43:43', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(560, '2017-03-09 17:43:43', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(561, '2017-03-09 17:43:44', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(562, '2017-03-09 17:43:44', 1, 'saveAdGroups 2 624399305', 'saveAdGroups 2 624399305', NULL, 0),
(563, '2017-03-09 17:43:44', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(564, '2017-03-09 17:43:45', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(565, '2017-03-09 17:43:46', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(566, '2017-03-09 17:43:46', 1, 'saveAdGroups 2 624274030', 'saveAdGroups 2 624274030', NULL, 0),
(567, '2017-03-09 17:43:46', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(568, '2017-03-09 17:43:46', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(569, '2017-03-09 17:43:47', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(570, '2017-03-09 17:43:47', 1, 'saveAdGroups 2 624274261', 'saveAdGroups 2 624274261', NULL, 0),
(571, '2017-03-09 17:43:47', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(572, '2017-03-09 17:43:48', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(573, '2017-03-09 17:43:48', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(574, '2017-03-09 17:43:48', 1, 'saveAdGroups 2 624274270', 'saveAdGroups 2 624274270', NULL, 0),
(575, '2017-03-09 17:43:49', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(576, '2017-03-09 17:43:49', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(577, '2017-03-09 17:43:50', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(578, '2017-03-09 17:43:50', 1, 'saveAdGroups 2 624430227', 'saveAdGroups 2 624430227', NULL, 0),
(579, '2017-03-09 17:43:50', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(580, '2017-03-09 17:43:50', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(581, '2017-03-09 17:43:51', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(582, '2017-03-09 17:43:51', 1, 'saveAdGroups 2 624273964', 'saveAdGroups 2 624273964', NULL, 0),
(583, '2017-03-09 17:43:51', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(584, '2017-03-09 17:43:51', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(585, '2017-03-09 17:43:52', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(586, '2017-03-09 17:43:52', 1, 'saveAdGroups 2 624340490', 'saveAdGroups 2 624340490', NULL, 0),
(587, '2017-03-09 17:43:52', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(588, '2017-03-09 17:43:53', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(589, '2017-03-09 17:43:53', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(590, '2017-03-09 17:43:53', 1, 'saveAdGroups 2 624340496', 'saveAdGroups 2 624340496', NULL, 0),
(591, '2017-03-09 17:43:53', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(592, '2017-03-09 17:43:54', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(593, '2017-03-09 17:43:55', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(594, '2017-03-09 17:43:55', 1, 'saveAdGroups 2 624274264', 'saveAdGroups 2 624274264', NULL, 0),
(595, '2017-03-09 17:43:55', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(596, '2017-03-09 17:43:55', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(597, '2017-03-09 17:43:56', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(598, '2017-03-09 17:43:56', 1, 'saveAdGroups 2 624086609', 'saveAdGroups 2 624086609', NULL, 0),
(599, '2017-03-09 17:43:56', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(600, '2017-03-09 17:43:56', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(601, '2017-03-09 17:43:57', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(602, '2017-03-09 17:43:57', 1, 'saveAdGroups 2 624086612', 'saveAdGroups 2 624086612', NULL, 0),
(603, '2017-03-09 17:43:57', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(604, '2017-03-09 17:43:58', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(605, '2017-03-09 17:43:59', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(606, '2017-03-09 17:43:59', 1, 'saveAdGroups 2 624086618', 'saveAdGroups 2 624086618', NULL, 0),
(607, '2017-03-09 17:43:59', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(608, '2017-03-09 17:43:59', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(609, '2017-03-09 17:44:00', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(610, '2017-03-09 17:44:00', 1, 'saveAdGroups 2 624086615', 'saveAdGroups 2 624086615', NULL, 0),
(611, '2017-03-09 17:44:00', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(612, '2017-03-09 17:44:02', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(613, '2017-03-09 17:44:02', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(614, '2017-03-09 17:44:02', 1, 'saveAdGroups 2 624086624', 'saveAdGroups 2 624086624', NULL, 0),
(615, '2017-03-09 17:44:02', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(616, '2017-03-09 17:44:03', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(617, '2017-03-09 17:44:04', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(618, '2017-03-09 17:44:04', 1, 'saveAdGroups 2 624086621', 'saveAdGroups 2 624086621', NULL, 0),
(619, '2017-03-09 17:44:04', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(620, '2017-03-09 17:44:04', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(621, '2017-03-09 17:44:05', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(622, '2017-03-09 17:44:05', 1, 'saveAdGroups 2 624086627', 'saveAdGroups 2 624086627', NULL, 0),
(623, '2017-03-09 17:44:05', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(624, '2017-03-09 17:44:07', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(625, '2017-03-09 17:44:07', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(626, '2017-03-09 17:44:07', 1, 'saveAdGroups 2 624086630', 'saveAdGroups 2 624086630', NULL, 0),
(627, '2017-03-09 17:44:07', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(628, '2017-03-09 17:44:08', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(629, '2017-03-09 17:44:09', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(630, '2017-03-09 17:44:09', 1, 'saveAdGroups 2 634187430', 'saveAdGroups 2 634187430', NULL, 0),
(631, '2017-03-09 17:44:09', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(632, '2017-03-09 17:44:09', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(633, '2017-03-09 17:44:10', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(634, '2017-03-09 17:44:10', 1, 'saveAdGroups 2 633438622', 'saveAdGroups 2 633438622', NULL, 0),
(635, '2017-03-09 17:44:10', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(636, '2017-03-09 17:44:10', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(637, '2017-03-09 17:44:11', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(638, '2017-03-09 17:44:11', 1, 'saveAdGroups 2 634187433', 'saveAdGroups 2 634187433', NULL, 0),
(639, '2017-03-09 17:44:11', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(640, '2017-03-09 17:44:11', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(641, '2017-03-09 17:44:12', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(642, '2017-03-09 17:44:12', 1, 'saveAdGroups 2 633978197', 'saveAdGroups 2 633978197', NULL, 0),
(643, '2017-03-09 17:44:12', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(644, '2017-03-09 17:44:13', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(645, '2017-03-09 17:44:13', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(646, '2017-03-09 17:44:13', 1, 'saveAdGroups 2 624399311', 'saveAdGroups 2 624399311', NULL, 0),
(647, '2017-03-09 17:44:13', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(648, '2017-03-09 17:44:14', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(649, '2017-03-09 17:44:14', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(650, '2017-03-09 17:44:14', 1, 'saveAdGroups 2 623881430', 'saveAdGroups 2 623881430', NULL, 0),
(651, '2017-03-09 17:44:14', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(652, '2017-03-09 17:44:15', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(653, '2017-03-09 17:44:15', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(654, '2017-03-09 17:44:16', 1, 'saveAdGroups 2 624399317', 'saveAdGroups 2 624399317', NULL, 0),
(655, '2017-03-09 17:44:16', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(656, '2017-03-09 17:44:16', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(657, '2017-03-09 17:44:17', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(658, '2017-03-09 17:44:17', 1, 'saveAdGroups 2 624399314', 'saveAdGroups 2 624399314', NULL, 0),
(659, '2017-03-09 17:44:17', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(660, '2017-03-09 17:44:18', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(661, '2017-03-09 17:44:18', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(662, '2017-03-09 17:44:18', 1, 'saveAdGroups 2 624358448', 'saveAdGroups 2 624358448', NULL, 0),
(663, '2017-03-09 17:44:18', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(664, '2017-03-09 17:44:19', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(665, '2017-03-09 17:44:20', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(666, '2017-03-09 17:44:20', 1, 'saveAdGroups 2 624357767', 'saveAdGroups 2 624357767', NULL, 0),
(667, '2017-03-09 17:44:20', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(668, '2017-03-09 17:44:20', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(669, '2017-03-09 17:44:21', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(670, '2017-03-09 17:44:21', 1, 'saveAdGroups 2 624448995', 'saveAdGroups 2 624448995', NULL, 0),
(671, '2017-03-09 17:44:21', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(672, '2017-03-09 17:44:22', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(673, '2017-03-09 17:44:22', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(674, '2017-03-09 17:44:22', 1, 'saveAdGroups 2 624449022', 'saveAdGroups 2 624449022', NULL, 0),
(675, '2017-03-09 17:44:22', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(676, '2017-03-09 17:44:24', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(677, '2017-03-09 17:44:24', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(678, '2017-03-09 17:44:24', 1, 'saveAdGroups 2 681777512', 'saveAdGroups 2 681777512', NULL, 0),
(679, '2017-03-09 17:44:24', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(680, '2017-03-09 17:44:25', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(681, '2017-03-09 17:44:25', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(682, '2017-03-09 17:44:25', 1, 'saveAdGroups 2 624358451', 'saveAdGroups 2 624358451', NULL, 0),
(683, '2017-03-09 17:44:25', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(684, '2017-03-09 17:44:26', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(685, '2017-03-09 17:44:27', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(686, '2017-03-09 17:44:27', 1, 'saveAdGroups 2 624294466', 'saveAdGroups 2 624294466', NULL, 0),
(687, '2017-03-09 17:44:27', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(688, '2017-03-09 17:44:27', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(689, '2017-03-09 17:44:28', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(690, '2017-03-09 17:44:28', 1, 'saveAdGroups 2 624355142', 'saveAdGroups 2 624355142', NULL, 0),
(691, '2017-03-09 17:44:28', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(692, '2017-03-09 17:44:29', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(693, '2017-03-09 17:44:30', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(694, '2017-03-09 17:44:30', 1, 'saveAdGroups 2 624294856', 'saveAdGroups 2 624294856', NULL, 0),
(695, '2017-03-09 17:44:30', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(696, '2017-03-09 17:44:31', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(697, '2017-03-09 17:44:31', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(698, '2017-03-09 17:44:31', 1, 'saveAdGroups 2 624399320', 'saveAdGroups 2 624399320', NULL, 0),
(699, '2017-03-09 17:44:31', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(700, '2017-03-09 17:44:32', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(701, '2017-03-09 17:44:33', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(702, '2017-03-09 17:44:33', 1, 'saveAdGroups 2 636358700', 'saveAdGroups 2 636358700', NULL, 0),
(703, '2017-03-09 17:44:33', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(704, '2017-03-09 17:44:33', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(705, '2017-03-09 17:44:34', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(706, '2017-03-09 17:44:34', 1, 'saveAdGroups 2 636358694', 'saveAdGroups 2 636358694', NULL, 0),
(707, '2017-03-09 17:44:34', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(708, '2017-03-09 17:44:35', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(709, '2017-03-09 17:44:35', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(710, '2017-03-09 17:44:35', 1, 'saveAdGroups 2 636358697', 'saveAdGroups 2 636358697', NULL, 0),
(711, '2017-03-09 17:44:35', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(712, '2017-03-09 17:44:36', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(713, '2017-03-09 17:44:36', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(714, '2017-03-09 17:44:36', 1, 'saveAdGroups 2 636358703', 'saveAdGroups 2 636358703', NULL, 0),
(715, '2017-03-09 17:44:37', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(716, '2017-03-09 17:44:37', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(717, '2017-03-09 17:44:38', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(718, '2017-03-09 17:44:38', 1, 'saveAdGroups 2 623483175', 'saveAdGroups 2 623483175', NULL, 0),
(719, '2017-03-09 17:44:38', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(720, '2017-03-09 17:44:38', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(721, '2017-03-09 17:44:39', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(722, '2017-03-09 17:44:39', 1, 'saveAdGroups 2 624399326', 'saveAdGroups 2 624399326', NULL, 0),
(723, '2017-03-09 17:44:39', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(724, '2017-03-09 17:44:40', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(725, '2017-03-09 17:44:41', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(726, '2017-03-09 17:44:41', 1, 'saveAdGroups 2 624399323', 'saveAdGroups 2 624399323', NULL, 0),
(727, '2017-03-09 17:44:41', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(728, '2017-03-09 17:44:42', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(729, '2017-03-09 17:44:42', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(730, '2017-03-09 17:44:42', 1, 'saveAdGroups 2 624399329', 'saveAdGroups 2 624399329', NULL, 0),
(731, '2017-03-09 17:44:42', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(732, '2017-03-09 17:44:43', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(733, '2017-03-09 17:44:43', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(734, '2017-03-09 17:44:43', 1, 'saveAdGroups 2 624025401', 'saveAdGroups 2 624025401', NULL, 0),
(735, '2017-03-09 17:44:43', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(736, '2017-03-09 17:44:44', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(737, '2017-03-09 17:44:44', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(738, '2017-03-09 17:44:45', 1, 'saveAdGroups 2 624399335', 'saveAdGroups 2 624399335', NULL, 0),
(739, '2017-03-09 17:44:45', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(740, '2017-03-09 17:44:45', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(741, '2017-03-09 17:44:46', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(742, '2017-03-09 17:44:46', 1, 'saveAdGroups 2 624399332', 'saveAdGroups 2 624399332', NULL, 0),
(743, '2017-03-09 17:44:46', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(744, '2017-03-09 17:44:46', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(745, '2017-03-09 17:44:47', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(746, '2017-03-09 17:44:47', 1, 'saveAdGroups 2 624085592', 'saveAdGroups 2 624085592', NULL, 0),
(747, '2017-03-09 17:44:47', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(748, '2017-03-09 17:44:48', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(749, '2017-03-09 17:44:48', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(750, '2017-03-09 17:44:48', 1, 'saveAdGroups 2 624189279', 'saveAdGroups 2 624189279', NULL, 0),
(751, '2017-03-09 17:44:48', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(752, '2017-03-09 17:44:49', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(753, '2017-03-09 17:44:49', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(754, '2017-03-09 17:44:49', 1, 'saveAdGroups 2 624190776', 'saveAdGroups 2 624190776', NULL, 0),
(755, '2017-03-09 17:44:50', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(756, '2017-03-09 17:44:50', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(757, '2017-03-09 17:44:51', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(758, '2017-03-09 17:44:51', 1, 'saveAdGroups 2 624034015', 'saveAdGroups 2 624034015', NULL, 0),
(759, '2017-03-09 17:44:51', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(760, '2017-03-09 17:44:52', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(761, '2017-03-09 17:44:52', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(762, '2017-03-09 17:44:52', 1, 'saveAdGroups 2 624399338', 'saveAdGroups 2 624399338', NULL, 0),
(763, '2017-03-09 17:44:52', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(764, '2017-03-09 17:44:53', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(765, '2017-03-09 17:44:53', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(766, '2017-03-09 17:44:53', 1, 'saveAdGroups 2 624020055', 'saveAdGroups 2 624020055', NULL, 0),
(767, '2017-03-09 17:44:53', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(768, '2017-03-09 17:45:01', 1, 'getCampaigns called ', 'getCampaigns called ', NULL, 0),
(769, '2017-03-09 17:45:10', 1, 'getCampaigns called ', 'getCampaigns called ', NULL, 0),
(770, '2017-03-09 17:46:10', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(771, '2017-03-09 17:46:10', 1, 'user_id 19', 'user_id 19', NULL, 0),
(772, '2017-03-09 17:46:10', 1, 'code 4/C78G0S8m42OMgbBydiEytFKwoRGKm7xn_erHa2t4gQo', 'code 4/C78G0S8m42OMgbBydiEytFKwoRGKm7xn_erHa2t4gQo', NULL, 0),
(773, '2017-03-09 17:46:10', 1, 'Inizio autenticazione', 'Inizio autenticazione', NULL, 0),
(774, '2017-03-09 17:46:10', 1, 'JSON REQUEST :code=4%2FC78G0S8m42OMgbBydiEytFKwoRGKm7xn_erHa2t4gQo&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpubl', 'JSON REQUEST :code=4%2FC78G0S8m42OMgbBydiEytFKwoRGKm7xn_erHa2t4gQo&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&redirect_uri=http%3A%2F%2Fdevadplify.exolab.it%2Fadplify_be%2Fpublic%2Findex.php%2Fapi%2Foauth2%2FsetAccessToken&grant_type=authorization_code', NULL, 0),
(775, '2017-03-09 17:46:11', 1, 'JSON:{\n  "access_token" : "ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhM', 'JSON:{\n  "access_token" : "ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDgxNTcxLCJleHAiOjE0ODkwODUxNzEsImF0X2hhc2giOiIzVEp0cHRTbDF3RDI5Z3JRaEhQc3ZBIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA4MjM0MTUxODYzNzQ1Njc0OTk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvZG90dGlAZXhvbGFiLml0In0.Vrd6ucS8_jeQ_tJ0Eu5UFydHCSxTSCgxPQom_et2smVmW_VNz5wXit57cKZ5ySUfzFJoIjXIF_MDGqGQpt_-Yp9R5cMUk97tKyAJNwMlNaz-IDnYpE1QqPeMWEwjkSwoUB6ekOnE3jf1xmpbN0d-yD7KEVA0d1mO9HddEQ967Rg5PKLHbiUZoybnXcSHMRk2AhAQ6C4T4VY8M2QrC91K_NcvMWIDmEETxqponpT1VhR2ER1vdm7qDvK8r2AWJ18Dcj83ftokwQpLqnbpFoja2vwHllmOhDUKa91-oSUeCsorkSqp_LnAYIIkJKOsgERfhkvK5jtrnjS5OVaSd25SiQ",\n  "refresh_token" : "1/Tx86GyunKP_WWJdoJsNqnVS0lHXPS9VNCWXGsu_SqYY",\n  "token_type" : "Bearer"\n}', NULL, 0),
(776, '2017-03-09 17:46:11', 1, 'autenticato', 'autenticato', NULL, 0),
(777, '2017-03-09 17:46:11', 1, '\r\naccess_token =  ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3M', '\r\naccess_token =  ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur\r\nid_token =  eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDg5MDgxNTcxLCJleHAiOjE0ODkwODUxNzEsImF0X2hhc2giOiIzVEp0cHRTbDF3RDI5Z3JRaEhQc3ZBIiwiYXVkIjoiMTM1OTA4OTM1MDQ0LXNxZnE0aWpqcm9sdHFwaGl0NjdxM2ozZjNiaGpxNG5sLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA4MjM0MTUxODYzNzQ1Njc0OTk5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6IjEzNTkwODkzNTA0NC1zcWZxNGlqanJvbHRxcGhpdDY3cTNqM2YzYmhqcTRubC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoicHJvZG90dGlAZXhvbGFiLml0In0.Vrd6ucS8_jeQ_tJ0Eu5UFydHCSxTSCgxPQom_et2smVmW_VNz5wXit57cKZ5ySUfzFJoIjXIF_MDGqGQpt_-Yp9R5cMUk97tKyAJNwMlNaz-IDnYpE1QqPeMWEwjkSwoUB6ekOnE3jf1xmpbN0d-yD7KEVA0d1mO9HddEQ967Rg5PKLHbiUZoybnXcSHMRk2AhAQ6C4T4VY8M2QrC91K_NcvMWIDmEETxqponpT1VhR2ER1vdm7qDvK8r2AWJ18Dcj83ftokwQpLqnbpFoja2vwHllmOhDUKa91-oSUeCsorkSqp_LnAYIIkJKOsgERfhkvK5jtrnjS5OVaSd25SiQ\r\nrefresh_token =  1/Tx86GyunKP_WWJdoJsNqnVS0lHXPS9VNCWXGsu_SqYY\r\ntoken_type =  Bearer', NULL, 0),
(778, '2017-03-09 17:46:11', 1, 'prendo access token ', 'prendo access token ', NULL, 0),
(779, '2017-03-09 17:46:11', 1, 'access token ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur', 'access token ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur', NULL, 0),
(780, '2017-03-09 17:46:11', 1, 'refresh token 1/Tx86GyunKP_WWJdoJsNqnVS0lHXPS9VNCWXGsu_SqYY', 'refresh token 1/Tx86GyunKP_WWJdoJsNqnVS0lHXPS9VNCWXGsu_SqYY', NULL, 0),
(781, '2017-03-09 17:46:11', 1, 'expires_in 3600', 'expires_in 3600', NULL, 0),
(782, '2017-03-09 17:46:11', 1, 'JSON REQUEST :access_token=ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur', 'JSON REQUEST :access_token=ya29.GlsJBKn2IJ8gCUVFxqHaWD_wYmtc2tzHQ_OzcUwF1x9O8f_Nd-9uHC-A3oh5d6RmeK4xd7VuiRYPXD2OplGgS6bvpthyiMWw0rChg10Pa7f5oqXLX3ncnCOGeUur', NULL, 0),
(783, '2017-03-09 17:46:11', 1, 'JSON:{\n "id": "108234151863745674999",\n "email": "prodotti@exolab.it",\n "verified_email": true,\n "name": "Prodotti Exolab",\n "given_name": "Prodotti",\n "family_name": "Exolab",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAA', 'JSON:{\n "id": "108234151863745674999",\n "email": "prodotti@exolab.it",\n "verified_email": true,\n "name": "Prodotti Exolab",\n "given_name": "Prodotti",\n "family_name": "Exolab",\n "picture": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg",\n "locale": "en"\n}\n', NULL, 0),
(784, '2017-03-09 17:46:11', 1, 'ho ottenuto le info utente', 'ho ottenuto le info utente', NULL, 0),
(785, '2017-03-09 17:46:11', 1, ' email prodotti@exolab.it', ' email prodotti@exolab.it', NULL, 0),
(786, '2017-03-09 17:46:11', 1, 'Salvo access token', 'Salvo access token', NULL, 0),
(787, '2017-03-09 17:46:12', 1, 'salvato', 'salvato', NULL, 0),
(788, '2017-03-09 17:46:12', 1, ' Google account creato con id 2', ' Google account creato con id 2', NULL, 0),
(789, '2017-03-09 17:46:45', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(790, '2017-03-09 17:46:45', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(791, '2017-03-09 17:46:46', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(792, '2017-03-09 17:46:46', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(793, '2017-03-09 17:46:47', 3, '[AuthorizationError.USER_PERMISSION_DENIED @ ; trigger:''<null>'']', '[AuthorizationError.USER_PERMISSION_DENIED @ ; trigger:''<null>'']', NULL, 0),
(794, '2017-03-09 17:46:47', 3, 'Impossibile caricare le campagne per il customer id selezionato', 'Impossibile caricare le campagne per il customer id selezionato', NULL, 0),
(795, '2017-03-09 17:47:30', 1, 'getCampaigns called ', 'getCampaigns called ', NULL, 0),
(796, '2017-03-09 17:47:32', 1, 'getCampaigns called ', 'getCampaigns called ', NULL, 0),
(797, '2017-03-09 17:47:32', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(798, '2017-03-09 17:47:33', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(799, '2017-03-09 17:47:33', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(800, '2017-03-09 17:47:34', 3, '[AuthorizationError.USER_PERMISSION_DENIED @ ; trigger:''<null>'']', '[AuthorizationError.USER_PERMISSION_DENIED @ ; trigger:''<null>'']', NULL, 0),
(801, '2017-03-09 17:47:34', 3, 'Impossibile caricare le campagne per il customer id selezionato', 'Impossibile caricare le campagne per il customer id selezionato', NULL, 0),
(802, '2017-03-09 17:47:37', 1, 'getCampaigns called ', 'getCampaigns called ', NULL, 0),
(803, '2017-03-10 08:34:06', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(804, '2017-03-10 08:34:06', 1, 'JSON REQUEST :refresh_token=1%2F2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', 'JSON REQUEST :refresh_token=1%2F2AM1lETkQDOoxi28vHR19v7ozGy_X4BMXqlLZTzVt9tTFQQ8shosA-MiGB4QK7di&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', NULL, 0),
(805, '2017-03-10 08:34:07', 1, 'JSON:{\n  "access_token" : "ya29.GlwKBHgLcN24ZODS2coTmpWOmnglpMkP98CmRCfVNeiARsy7VN0KJJTSVKmkoSadQrDPJHxtonMvKJTaej4qD5X8wnU7GMP41XBo2EsCLXuaW8ZOj1gbNFJNwLpYFg",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmR', 'JSON:{\n  "access_token" : "ya29.GlwKBHgLcN24ZODS2coTmpWOmnglpMkP98CmRCfVNeiARsy7VN0KJJTSVKmkoSadQrDPJHxtonMvKJTaej4qD5X8wnU7GMP41XBo2EsCLXuaW8ZOj1gbNFJNwLpYFg",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIxMTg3ODg4NjAwMzIwMzEzOTkiLCJlbWFpbCI6InByb3ZhbGF1cmEyMDE2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiS0ZQcEswVWhVbFhBY0JMaFNySGRxdyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODkxMzQ4NDcsImV4cCI6MTQ4OTEzODQ0N30.KfLkv4vUfKKRyD1j9zrwc8okfjefYmG-0aiM4ilewND0NwgL1EIfb_q5FD-iXcPnB6NuA22OWBoh-nnQBMFCmp3ZLOT9EkfXIn2F19nM5OzDB2vXwt9svTKDteDRK_tzdKQxrMhVqr6-YjScPCCRoThL1B539TC7FNQH6hyoZBSSMSKUOi1IXryf5u301Y3gEAMv4c3P8xYrgQ4th7oZ6lrvRtlGiev8o8EyphbnkSB1M2ZNuG5MxxOnl_iJzjDuJgE0nrsKhdxJxNdkCRFo_eBR5oIz1AHXm8mPjEvF-4K39219GkbJYWaXtZa7PXb9LzgIOH9o-YAhNZFf0lYaWw",\n  "token_type" : "Bearer"\n}', NULL, 0),
(806, '2017-03-10 08:34:07', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(807, '2017-03-10 08:34:07', 1, 'ok', 'ok', NULL, 0),
(808, '2017-03-10 08:34:07', 1, 'access_token=ya29.GlwKBHgLcN24ZODS2coTmpWOmnglpMkP98CmRCfVNeiARsy7VN0KJJTSVKmkoSadQrDPJHxtonMvKJTaej4qD5X8wnU7GMP41XBo2EsCLXuaW8ZOj1gbNFJNwLpYFg', 'access_token=ya29.GlwKBHgLcN24ZODS2coTmpWOmnglpMkP98CmRCfVNeiARsy7VN0KJJTSVKmkoSadQrDPJHxtonMvKJTaej4qD5X8wnU7GMP41XBo2EsCLXuaW8ZOj1gbNFJNwLpYFg', NULL, 0),
(809, '2017-03-10 08:34:07', 1, 'expires_in=3600', 'expires_in=3600', NULL, 0),
(810, '2017-03-10 08:34:07', 1, 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ', 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIxMTg3ODg4NjAwMzIwMzEzOTkiLCJlbWFpbCI6InByb3ZhbGF1cmEyMDE2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiS0ZQcEswVWhVbFhBY0JMaFNySGRxdyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODkxMzQ4NDcsImV4cCI6MTQ4OTEzODQ0N30.KfLkv4vUfKKRyD1j9zrwc8okfjefYmG-0aiM4ilewND0NwgL1EIfb_q5FD-iXcPnB6NuA22OWBoh-nnQBMFCmp3ZLOT9EkfXIn2F19nM5OzDB2vXwt9svTKDteDRK_tzdKQxrMhVqr6-YjScPCCRoThL1B539TC7FNQH6hyoZBSSMSKUOi1IXryf5u301Y3gEAMv4c3P8xYrgQ4th7oZ6lrvRtlGiev8o8EyphbnkSB1M2ZNuG5MxxOnl_iJzjDuJgE0nrsKhdxJxNdkCRFo_eBR5oIz1AHXm8mPjEvF-4K39219GkbJYWaXtZa7PXb9LzgIOH9o-YAhNZFf0lYaWw', NULL, 0),
(811, '2017-03-10 08:34:07', 1, 'token_type=Bearer', 'token_type=Bearer', NULL, 0),
(812, '2017-03-10 08:34:07', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(813, '2017-03-10 08:34:07', 1, 'JSON REQUEST :refresh_token=1%2FTx86GyunKP_WWJdoJsNqnVS0lHXPS9VNCWXGsu_SqYY&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', 'JSON REQUEST :refresh_token=1%2FTx86GyunKP_WWJdoJsNqnVS0lHXPS9VNCWXGsu_SqYY&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', NULL, 0),
(814, '2017-03-10 08:34:07', 1, 'JSON:{\n  "access_token" : "ya29.GlwKBCZZfIjVmS_dllCsKcGHMudxNk2Rj7_qhmOxOZGiK_4QV0_NjxWnmCz3SO3LpegJVyFRz-nUzmfziTNFtE8VFidw8Q_1Nl81NkoZnwCZemzI7qu8yLmArd3sMQ",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmR', 'JSON:{\n  "access_token" : "ya29.GlwKBCZZfIjVmS_dllCsKcGHMudxNk2Rj7_qhmOxOZGiK_4QV0_NjxWnmCz3SO3LpegJVyFRz-nUzmfziTNFtE8VFidw8Q_1Nl81NkoZnwCZemzI7qu8yLmArd3sMQ",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDgyMzQxNTE4NjM3NDU2NzQ5OTkiLCJlbWFpbCI6InByb2RvdHRpQGV4b2xhYi5pdCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiSThIZzFnd0RWUVJBX0I0dDFzSzhuUSIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODkxMzQ4NDcsImV4cCI6MTQ4OTEzODQ0N30.IN7206aZRdte2egryhWF1O6FScLykuVUTVh5W2LTx_aGmNJ-1yKr0b2z00yrRVApRJw3wTgcObGhnAL2ohMzlY0O-rUc5IiLJANwcoLjqO1D69AVKaMw5IQxvLxlcNaBkXMH8gZlloX0DXaTuqMPfAFMnZyxcx2bA3au9fMWRGEC_cYxQvNoNlAKHuRqdM17vF3GEb-w6_Kg1GYudnr6KHXlyPP7G2bTJHkdVeVm5BalmK3goh9x54bA7HUEDqXy1uVVvcc2lxF3UuciOSLlvDq2H15LIPZirM4iDWvp2a7SD-VFY4wvjkaDPFo2AA5X1i_pm46227kUAV64IICQFw",\n  "token_type" : "Bearer"\n}', NULL, 0),
(815, '2017-03-10 08:34:07', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(816, '2017-03-10 08:34:07', 1, 'ok', 'ok', NULL, 0),
(817, '2017-03-10 08:34:07', 1, 'access_token=ya29.GlwKBCZZfIjVmS_dllCsKcGHMudxNk2Rj7_qhmOxOZGiK_4QV0_NjxWnmCz3SO3LpegJVyFRz-nUzmfziTNFtE8VFidw8Q_1Nl81NkoZnwCZemzI7qu8yLmArd3sMQ', 'access_token=ya29.GlwKBCZZfIjVmS_dllCsKcGHMudxNk2Rj7_qhmOxOZGiK_4QV0_NjxWnmCz3SO3LpegJVyFRz-nUzmfziTNFtE8VFidw8Q_1Nl81NkoZnwCZemzI7qu8yLmArd3sMQ', NULL, 0),
(818, '2017-03-10 08:34:07', 1, 'expires_in=3600', 'expires_in=3600', NULL, 0);
INSERT INTO `log` (`id`, `created_at`, `severity`, `log`, `message`, `user_id`, `is_login`) VALUES
(819, '2017-03-10 08:34:08', 1, 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ', 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmMmI1ZTZkOTZlMWQ0YzJjNmRhMjBhOGEwMGFjN2ZlNzdhYWNlOTAifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDgyMzQxNTE4NjM3NDU2NzQ5OTkiLCJlbWFpbCI6InByb2RvdHRpQGV4b2xhYi5pdCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiSThIZzFnd0RWUVJBX0I0dDFzSzhuUSIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODkxMzQ4NDcsImV4cCI6MTQ4OTEzODQ0N30.IN7206aZRdte2egryhWF1O6FScLykuVUTVh5W2LTx_aGmNJ-1yKr0b2z00yrRVApRJw3wTgcObGhnAL2ohMzlY0O-rUc5IiLJANwcoLjqO1D69AVKaMw5IQxvLxlcNaBkXMH8gZlloX0DXaTuqMPfAFMnZyxcx2bA3au9fMWRGEC_cYxQvNoNlAKHuRqdM17vF3GEb-w6_Kg1GYudnr6KHXlyPP7G2bTJHkdVeVm5BalmK3goh9x54bA7HUEDqXy1uVVvcc2lxF3UuciOSLlvDq2H15LIPZirM4iDWvp2a7SD-VFY4wvjkaDPFo2AA5X1i_pm46227kUAV64IICQFw', NULL, 0),
(820, '2017-03-10 08:34:08', 1, 'token_type=Bearer', 'token_type=Bearer', NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

DROP TABLE IF EXISTS `migrations`;
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

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

DROP TABLE IF EXISTS `roles`;
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

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struttura della tabella `service_profile_types`
--

DROP TABLE IF EXISTS `service_profile_types`;
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `adwords_accounts_limit` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `service_profile_types`
--

INSERT INTO `service_profile_types` (`id`, `serviceName`, `serviceCost`, `serviceBillingPeriod`, `serviceUpgradable`, `serviceDescription`, `serviceLogo`, `freeTrial`, `created_at`, `updated_at`, `adwords_accounts_limit`) VALUES
(1, 'service1', 500, 1000, 0, 'Service description 1', 'logo1', 1, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `settings`
--

DROP TABLE IF EXISTS `settings`;
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
(1, 'mamadigital', 'online', 'adplify', '135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com', 'KQ1KrvbPvGN4Tv_J2PvkWfcc', 'http://devadplify.exolab.it/adplify_fe/index.php#/select-accounts', 'mjDNeLG_BMo-psJEcFsZHw', '601-806-2243', '1/Vd6f5rarMAsCT0I7cpvSyBvGuO3TRdLn_211oXvmV1I', 'https://accounts.google.com/o/oauth2/token', 'http://devadplify.exolab.it/adplify_be/public/index.php/api/oauth2/setAccessToken', 'https://www.googleapis.com/oauth2/v1/userinfo', 'http://devadplify.exolab.it/adplify_fe/index.php');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

DROP TABLE IF EXISTS `users`;
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
  `accessToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferred_language` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `purchasedType`, `taxCode`, `dateBirth`, `billingAddress`, `profileType`, `username`, `email`, `password`, `confirmed`, `confirmation_code`, `remember_token`, `created_at`, `updated_at`, `manager_id`, `initial_data_import_status`, `first_login`, `userType`, `picture`, `accessToken`, `preferred_language`) VALUES
(18, 'Francesco', 'Protano', NULL, NULL, '1972-11-07', NULL, NULL, NULL, 'francesco.protano@gmail.com', '$2y$10$P7oV4Fn3r7XPwncke1LZm.5CQiAIoydNfrIniva6i2DnvVgAoR3..', 1, '5M8JFRDZQOk9PKiNFTtV2iiTuFktUS', NULL, '2017-03-09 15:08:26', '2017-03-09 15:11:14', NULL, 0, 0, 2, NULL, NULL, 'en'),
(19, 'Giampiero', '', NULL, NULL, '1970-01-01', NULL, NULL, NULL, 'giampiero.mazzi@gmail.com', '$2y$10$NtfL36OwMuVQamJZKq5dpumXId2Olh9nUkv5lotqFs/p7GilEsE1u', 1, '6WIiK0eoScXXLkSywRasJ1CLGQJLw9', NULL, '2017-03-09 15:08:27', '2017-03-09 16:48:18', NULL, 0, 0, 2, NULL, NULL, 'en'),
(20, 'Francesco', 'Protano', NULL, NULL, '1972-11-07', NULL, NULL, NULL, 'fprotano@yahoo.com', '$2y$10$7Q2qu1CvbGFsvT8bMR02eOFbRdbgVJhgXPXh9mQOjjNV7VI7z8RVe', 1, 'xYmHH47zPUT3S7o997ORlOrKHi3KEm', NULL, '2017-03-09 15:18:37', '2017-03-09 15:19:51', NULL, 0, 0, 2, NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_service_profile_types`
--

DROP TABLE IF EXISTS `user_service_profile_types`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `user_service_profile_types`
--

INSERT INTO `user_service_profile_types` (`id`, `user_id`, `service_profile_type_id`, `freeTrialStartedAt`, `freeTrialEndedAt`, `activatedAt`, `suspendAt`, `cancelledAt`, `currentStatus`, `coupon_code`) VALUES
(2, 18, 1, '2017-03-09 16:08:00', NULL, '2017-03-09 16:08:00', NULL, NULL, NULL, NULL),
(3, 19, 1, '2017-03-09 16:08:00', NULL, '2017-03-09 16:08:00', NULL, NULL, NULL, NULL),
(4, 20, 1, '2017-03-09 16:18:00', NULL, '2017-03-09 16:18:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_type`
--

DROP TABLE IF EXISTS `user_type`;
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
-- Indici per le tabelle `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`code`);

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
  ADD KEY `u_ut_ut_id` (`userType`),
  ADD KEY `preferred_language` (`preferred_language`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=821;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la tabella `user_service_profile_types`
--
ALTER TABLE `user_service_profile_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`preferred_language`) REFERENCES `languages` (`code`),
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
