-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Mar 08, 2017 alle 12:37
-- Versione del server: 5.5.52-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adplify_customer_13`
--
CREATE DATABASE IF NOT EXISTS `adplify_customer_13` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `adplify_customer_13`;

-- --------------------------------------------------------

--
-- Struttura della tabella `adwords_account`
--

CREATE TABLE IF NOT EXISTS `adwords_account` (
  `id` bigint(20) NOT NULL,
  `api_accountcurrencycode` varchar(5) DEFAULT NULL,
  `api_accountdescriptivename` varchar(255) DEFAULT NULL,
  `api_externalcustomerid` varchar(255) DEFAULT NULL,
  `google_user_id` int(11) DEFAULT NULL,
  `logically_deleted_at` datetime DEFAULT NULL,
  `default_account` smallint(6) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `adwords_account`
--

INSERT INTO `adwords_account` (`id`, `api_accountcurrencycode`, `api_accountdescriptivename`, `api_externalcustomerid`, `google_user_id`, `logically_deleted_at`, `default_account`) VALUES
(1, 'EUR', 'MDS - TIVUSAT', '8374530883', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_adgroup_attributes`
--

CREATE TABLE IF NOT EXISTS `cache_adgroup_attributes` (
  `api_adgroupid` bigint(20) DEFAULT NULL,
  `api_adgroupname` varchar(255) DEFAULT NULL,
  `api_adgroupstatus` varchar(30) DEFAULT NULL,
  `api_campaignid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `cache_adgroup_attributes`
--

INSERT INTO `cache_adgroup_attributes` (`api_adgroupid`, `api_adgroupname`, `api_adgroupstatus`, `api_campaignid`) VALUES
(29052212780, 'Gruppo Europei ''16 - Brand ++', 'ENABLED', 601207815),
(29024697380, 'Gruppo Europei ''16 - LOW " "', 'ENABLED', 601207815),
(29004385940, 'Gruppo Europei ''16 " "', 'ENABLED', 601207815),
(29052242780, 'Gruppo Europei ''16 " " broad', 'ENABLED', 601207815),
(29004385820, 'Gruppo Europei ''16 [ ]', 'ENABLED', 601207815),
(29463521780, '1 - Gruppo Europei ''16 - Brand ++', 'ENABLED', 612348397),
(29463522380, '1 - Gruppo Europei ''16 " " broad', 'ENABLED', 612348397),
(29463522260, 'Gruppo Europei ''16 - LOW " "', 'PAUSED', 612348397),
(29463522020, 'Gruppo Europei ''16 " "', 'PAUSED', 612348397),
(29463521660, 'Gruppo Europei ''16 [ ]', 'PAUSED', 612348397),
(31453200860, 'Gruppo Olimpiadi ''16 " "', 'ENABLED', 629570633),
(31453200740, 'Gruppo Olimpiadi ''16 [ ]', 'ENABLED', 629570633),
(31944084380, 'Gruppo Olimpiadi ''16 Brand - + +', 'ENABLED', 629570633),
(15110722100, 'blog_forum', 'ENABLED', 213353060),
(15110722220, 'digitale', 'ENABLED', 213353060),
(15110721980, 'dispositivi', 'ENABLED', 213353060),
(15110722460, 'guida_tv', 'ENABLED', 213353060),
(15110722580, 'notizie_tecnologia', 'ENABLED', 213353060),
(15110722700, 'tecnologia', 'ENABLED', 213353060),
(15110722340, 'tv_hd', 'ENABLED', 213353060),
(15118172660, 'Brand', 'ENABLED', 213596180),
(15118173020, 'decoder_digitale', 'ENABLED', 213596180),
(15118172900, 'decoder_hd', 'ENABLED', 213596180),
(15118173140, 'guida_tv', 'ENABLED', 213596180),
(15118172780, 'hd', 'ENABLED', 213596180),
(15118173740, 'infinity', 'PAUSED', 213596180),
(15118173260, 'offerte_tv', 'ENABLED', 213596180),
(15118173620, 'rai_replay', 'PAUSED', 213596180),
(15118173380, 'tv', 'ENABLED', 213596180),
(15118173500, 'tv_on_demand', 'ENABLED', 213596180),
(9082895420, 'gossip', 'ENABLED', 166120940),
(9082895540, 'gossip_flash', 'ENABLED', 166120940),
(9082895060, 'guida_tv', 'ENABLED', 166120940),
(9082895660, 'guida_tv_flash', 'ENABLED', 166120940),
(9082895300, 'news', 'ENABLED', 166120940),
(9082895780, 'news_flash', 'ENABLED', 166120940),
(9082895180, 'spettacolo', 'ENABLED', 166120940),
(9082895900, 'spettacolo_flash', 'ENABLED', 166120940),
(9082894940, 'tv', 'ENABLED', 166120940),
(9082896020, 'tv_flash', 'ENABLED', 166120940),
(9082561940, 'canali_digitale_terrestre', 'ENABLED', 166058180),
(9082561820, 'digitale_satellitare', 'ENABLED', 166058180),
(9082561700, 'digitale_terrestre', 'ENABLED', 166058180),
(9082561100, 'guida_tv', 'ENABLED', 166058180),
(9082561580, 'palinsesto_tv', 'ENABLED', 166058180),
(9082561460, 'programma_tv', 'ENABLED', 166058180),
(9082561340, 'programmazione_tv', 'ENABLED', 166058180),
(9082562060, 'programmi_digitale_terrestre', 'ENABLED', 166058180),
(9082561220, 'stasera_tv', 'ENABLED', 166058180),
(9851204300, 'notizie_spettacolo', 'ENABLED', 177849260),
(9860712020, 'notizie_spettacolo_jpeg', 'ENABLED', 177849260),
(9851204180, 'notizie_tecnologia', 'ENABLED', 177849260),
(9860712140, 'notizie_tecnologia_jpeg', 'ENABLED', 177849260),
(9851204060, 'tecnologia', 'ENABLED', 177849260),
(9860712260, 'tecnologia_jpeg', 'ENABLED', 177849260),
(9851203940, 'tv_hd', 'ENABLED', 177849260),
(9860712380, 'tv_hd_jpeg', 'ENABLED', 177849260),
(9851203100, 'brand', 'ENABLED', 177849140),
(13567120340, 'calcio_hd', 'PAUSED', 177849140),
(20808955340, 'cam_hd', 'ENABLED', 177849140),
(9851203340, 'canali_hd', 'ENABLED', 177849140),
(9851203700, 'decoder_digitale', 'ENABLED', 177849140),
(9851203580, 'decoder_hd', 'ENABLED', 177849140),
(9851203820, 'decoder_satellitare', 'ENABLED', 177849140),
(9851203220, 'hd', 'ENABLED', 177849140),
(13567120220, 'mondiali_hd', 'PAUSED', 177849140),
(9851203460, 'rai_hd', 'ENABLED', 177849140),
(5503054340, '4G', 'ENABLED', 124397060),
(4511767220, 'brand', 'ENABLED', 124397060),
(4511767940, 'canali_digitale_terrestre', 'ENABLED', 124397060),
(4511768300, 'copertura_digitale_terrestre', 'ENABLED', 124397060),
(4511767580, 'decoder_digitale_terrestre', 'ENABLED', 124397060),
(4511767700, 'decoder_satellitare', 'ENABLED', 124397060),
(4511767340, 'digital_terrestre', 'ENABLED', 124397060),
(4511767460, 'digitale_satellitare', 'ENABLED', 124397060),
(5503054220, 'LTE', 'ENABLED', 124397060),
(4511767820, 'problemi_digital_terrestre', 'ENABLED', 124397060),
(4511768060, 'programmi_digitale_terrestre', 'ENABLED', 124397060),
(4511768180, 'sintonizzare_digitale_terrestre', 'ENABLED', 124397060);

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_adgroup_metrics`
--

CREATE TABLE IF NOT EXISTS `cache_adgroup_metrics` (
  `id` int(11) NOT NULL,
  `api_date` varchar(10) DEFAULT NULL,
  `api_allconversionrate` decimal(11,2) DEFAULT NULL,
  `api_allconversions` decimal(11,2) DEFAULT NULL,
  `api_allconversionvalue` decimal(11,2) DEFAULT NULL,
  `api_averagecost` decimal(11,2) DEFAULT NULL,
  `api_averagecpc` decimal(11,2) DEFAULT NULL,
  `api_averagecpe` decimal(11,2) DEFAULT NULL,
  `api_averagecpm` decimal(11,2) DEFAULT NULL,
  `api_averagecpv` decimal(11,2) DEFAULT NULL,
  `api_averagefrequency` decimal(11,2) DEFAULT NULL,
  `api_averagepageviews` decimal(11,2) DEFAULT NULL,
  `api_averageposition` decimal(11,2) DEFAULT NULL,
  `api_averagetimeonsite` decimal(11,2) DEFAULT NULL,
  `api_clicks` bigint(20) DEFAULT NULL,
  `api_contentbudgetlostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentranklostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_conversionrate` decimal(11,3) DEFAULT NULL,
  `api_conversions` decimal(11,3) DEFAULT NULL,
  `api_conversionvalue` decimal(11,3) DEFAULT NULL,
  `api_cost` decimal(11,3) DEFAULT NULL,
  `api_costperallconversion` decimal(11,3) DEFAULT NULL,
  `api_costperconversion` decimal(11,3) DEFAULT NULL,
  `api_crossdeviceconversions` decimal(11,3) DEFAULT NULL,
  `api_ctr` decimal(11,3) DEFAULT NULL,
  `api_impressions` decimal(11,3) DEFAULT NULL,
  `api_valueperallconversion` decimal(11,3) DEFAULT NULL,
  `api_valueperconversion` decimal(11,3) DEFAULT NULL,
  `api_videoviewrate` decimal(11,3) DEFAULT NULL,
  `api_videoviews` decimal(11,3) DEFAULT NULL,
  `api_viewthroughconversions` decimal(11,3) DEFAULT NULL,
  `api_adgroupid` bigint(20) DEFAULT NULL,
  `api_campaignid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_campaign_attributes`
--

CREATE TABLE IF NOT EXISTS `cache_campaign_attributes` (
  `api_amount` decimal(11,3) DEFAULT NULL,
  `api_campaignid` bigint(20) NOT NULL,
  `api_campaignname` varchar(255) DEFAULT NULL,
  `api_campaignstatus` varchar(30) DEFAULT NULL,
  `api_enddate` varchar(10) DEFAULT NULL,
  `api_servingstatus` varchar(10) DEFAULT NULL,
  `api_startdate` varchar(10) DEFAULT NULL,
  `api_externalcustomerid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `cache_campaign_attributes`
--

INSERT INTO `cache_campaign_attributes` (`api_amount`, `api_campaignid`, `api_campaignname`, `api_campaignstatus`, `api_enddate`, `api_servingstatus`, `api_startdate`, `api_externalcustomerid`) VALUES
(0.000, 124397060, 'TivùSat_Mama_Search', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 166058180, 'TivùSat_Guidatv_Search', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 166120940, 'TivùSat_Guidatv_Display_', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 177849140, 'TivùSat_HD_Search', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 177849260, 'TivùSat_HD_Display', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 213353060, 'Tivù.tv_DGTVi_Display', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 213596180, 'Tivù.tv_DGTVi_Search', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 601207815, '1 - 1-Search - Europei ''16 HD', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 612348397, '1 - 1-Search - Europei ''16 UHD', NULL, NULL, NULL, NULL, '8374530883'),
(0.000, 629570633, '1 - 2-Search - Olimpiadi ''16', NULL, NULL, NULL, NULL, '8374530883');

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_campaign_metrics`
--

CREATE TABLE IF NOT EXISTS `cache_campaign_metrics` (
  `id` int(11) NOT NULL,
  `api_date` varchar(10) DEFAULT NULL,
  `api_allconversionrate` decimal(11,2) DEFAULT NULL,
  `api_allconversions` decimal(11,2) DEFAULT NULL,
  `api_allconversionvalue` decimal(11,2) DEFAULT NULL,
  `api_averagecost` decimal(11,2) DEFAULT NULL,
  `api_averagecpc` decimal(11,2) DEFAULT NULL,
  `api_averagecpe` decimal(11,2) DEFAULT NULL,
  `api_averagecpm` decimal(11,2) DEFAULT NULL,
  `api_averagecpv` decimal(11,2) DEFAULT NULL,
  `api_averagefrequency` decimal(11,2) DEFAULT NULL,
  `api_averagepageviews` decimal(11,2) DEFAULT NULL,
  `api_averageposition` decimal(11,2) DEFAULT NULL,
  `api_averagetimeonsite` decimal(11,2) DEFAULT NULL,
  `api_clicks` bigint(20) DEFAULT NULL,
  `api_contentbudgetlostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentranklostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_conversionrate` decimal(11,3) DEFAULT NULL,
  `api_conversions` decimal(11,3) DEFAULT NULL,
  `api_conversionvalue` decimal(11,3) DEFAULT NULL,
  `api_cost` decimal(11,3) DEFAULT NULL,
  `api_costperallconversion` decimal(11,3) DEFAULT NULL,
  `api_costperconversion` decimal(11,3) DEFAULT NULL,
  `api_crossdeviceconversions` decimal(11,3) DEFAULT NULL,
  `api_ctr` decimal(11,3) DEFAULT NULL,
  `api_impressions` decimal(11,3) DEFAULT NULL,
  `api_valueperallconversion` decimal(11,3) DEFAULT NULL,
  `api_valueperconversion` decimal(11,3) DEFAULT NULL,
  `api_videoviewrate` decimal(11,3) DEFAULT NULL,
  `api_videoviews` decimal(11,3) DEFAULT NULL,
  `api_viewthroughconversions` decimal(11,3) DEFAULT NULL,
  `api_campaignid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_keywords_attributes`
--

CREATE TABLE IF NOT EXISTS `cache_keywords_attributes` (
  `api_id` bigint(20) NOT NULL,
  `api_campaignid` bigint(20) NOT NULL,
  `api_adgroupid` bigint(20) NOT NULL,
  `api_qualityscore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_keywords_metrics`
--

CREATE TABLE IF NOT EXISTS `cache_keywords_metrics` (
  `id` int(11) NOT NULL,
  `api_date` varchar(10) DEFAULT NULL,
  `api_allconversionrate` decimal(11,2) DEFAULT NULL,
  `api_allconversions` decimal(11,2) DEFAULT NULL,
  `api_allconversionvalue` decimal(11,2) DEFAULT NULL,
  `api_averagecost` decimal(11,2) DEFAULT NULL,
  `api_averagecpc` decimal(11,2) DEFAULT NULL,
  `api_averagecpe` decimal(11,2) DEFAULT NULL,
  `api_averagecpm` decimal(11,2) DEFAULT NULL,
  `api_averagecpv` decimal(11,2) DEFAULT NULL,
  `api_averagefrequency` decimal(11,2) DEFAULT NULL,
  `api_averagepageviews` decimal(11,2) DEFAULT NULL,
  `api_averageposition` decimal(11,2) DEFAULT NULL,
  `api_averagetimeonsite` decimal(11,2) DEFAULT NULL,
  `api_clicks` bigint(20) DEFAULT NULL,
  `api_contentbudgetlostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentranklostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_conversionrate` decimal(11,3) DEFAULT NULL,
  `api_conversions` decimal(11,3) DEFAULT NULL,
  `api_conversionvalue` decimal(11,3) DEFAULT NULL,
  `api_cost` decimal(11,3) DEFAULT NULL,
  `api_costperallconversion` decimal(11,3) DEFAULT NULL,
  `api_costperconversion` decimal(11,3) DEFAULT NULL,
  `api_crossdeviceconversions` decimal(11,3) DEFAULT NULL,
  `api_ctr` decimal(11,3) DEFAULT NULL,
  `api_impressions` decimal(11,3) DEFAULT NULL,
  `api_valueperallconversion` decimal(11,3) DEFAULT NULL,
  `api_valueperconversion` decimal(11,3) DEFAULT NULL,
  `api_videoviewrate` decimal(11,3) DEFAULT NULL,
  `api_videoviews` decimal(11,3) DEFAULT NULL,
  `api_viewthroughconversions` decimal(11,3) DEFAULT NULL,
  `api_id` bigint(20) DEFAULT NULL,
  `api_campaignid` bigint(20) DEFAULT NULL,
  `api_adgroupid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_url_attributes`
--

CREATE TABLE IF NOT EXISTS `cache_url_attributes` (
  `id` bigint(20) NOT NULL,
  `api_url` varchar(255) DEFAULT NULL,
  `api_campaignid` bigint(20) DEFAULT NULL,
  `api_adgroupid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_url_metrics`
--

CREATE TABLE IF NOT EXISTS `cache_url_metrics` (
  `id` int(11) NOT NULL,
  `api_campaignid` bigint(20) DEFAULT NULL,
  `api_adgroupid` bigint(20) DEFAULT NULL,
  `api_date` varchar(10) DEFAULT NULL,
  `api_allconversionrate` decimal(11,2) DEFAULT NULL,
  `api_allconversions` decimal(11,2) DEFAULT NULL,
  `api_allconversionvalue` decimal(11,2) DEFAULT NULL,
  `api_averagecost` decimal(11,2) DEFAULT NULL,
  `api_averagecpc` decimal(11,2) DEFAULT NULL,
  `api_averagecpe` decimal(11,2) DEFAULT NULL,
  `api_averagecpm` decimal(11,2) DEFAULT NULL,
  `api_averagecpv` decimal(11,2) DEFAULT NULL,
  `api_averagefrequency` decimal(11,2) DEFAULT NULL,
  `api_averagepageviews` decimal(11,2) DEFAULT NULL,
  `api_averageposition` decimal(11,2) DEFAULT NULL,
  `api_averagetimeonsite` decimal(11,2) DEFAULT NULL,
  `api_clicks` bigint(20) DEFAULT NULL,
  `api_contentbudgetlostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_contentranklostimpressionshare` decimal(11,3) DEFAULT NULL,
  `api_conversionrate` decimal(11,3) DEFAULT NULL,
  `api_conversions` decimal(11,3) DEFAULT NULL,
  `api_conversionvalue` decimal(11,3) DEFAULT NULL,
  `api_cost` decimal(11,3) DEFAULT NULL,
  `api_costperallconversion` decimal(11,3) DEFAULT NULL,
  `api_costperconversion` decimal(11,3) DEFAULT NULL,
  `api_crossdeviceconversions` decimal(11,3) DEFAULT NULL,
  `api_ctr` decimal(11,3) DEFAULT NULL,
  `api_impressions` decimal(11,3) DEFAULT NULL,
  `api_valueperallconversion` decimal(11,3) DEFAULT NULL,
  `api_valueperconversion` decimal(11,3) DEFAULT NULL,
  `api_videoviewrate` decimal(11,3) DEFAULT NULL,
  `api_videoviews` decimal(11,3) DEFAULT NULL,
  `api_viewthroughconversions` decimal(11,3) DEFAULT NULL,
  `url_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `google_account`
--

CREATE TABLE IF NOT EXISTS `google_account` (
  `id` bigint(20) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `token_refreshed_at` datetime NOT NULL,
  `google_email` varchar(70) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `google_account`
--

INSERT INTO `google_account` (`id`, `access_token`, `refresh_token`, `expires_in`, `token_refreshed_at`, `google_email`, `user_id`) VALUES
(1, 'ya29.GlsIBEBmYngka-SBmjwzm5IvLm5DFdxc1Shlc2djaljNalNV7hZPaTQv_deZJCHy8fAMpIr99i5cjMX5wNj8TeoWpGmuOqdYPCP4hngzsoNBISI74c7g356LV5rc', '1/2RgdzGGI82egavgQ5nwLcDdzkQ5zUEQUmzZ_yugPWvk', 3600, '2017-03-08 12:09:00', 'provalaura2016@gmail.com', 13);

-- --------------------------------------------------------

--
-- Struttura della tabella `last_sync`
--

CREATE TABLE IF NOT EXISTS `last_sync` (
  `api_context` varchar(100) NOT NULL,
  `last_sync_at` datetime NOT NULL
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
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `adwords_account`
--
ALTER TABLE `adwords_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_adwords_account` (`api_externalcustomerid`);

--
-- Indici per le tabelle `cache_adgroup_attributes`
--
ALTER TABLE `cache_adgroup_attributes`
  ADD UNIQUE KEY `idx_cache_adgroup_attributes` (`api_campaignid`,`api_adgroupid`);

--
-- Indici per le tabelle `cache_adgroup_metrics`
--
ALTER TABLE `cache_adgroup_metrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cache_adgroup` (`api_campaignid`,`api_adgroupid`),
  ADD KEY `idx_cache_adgroup_0` (`api_campaignid`);

--
-- Indici per le tabelle `cache_campaign_attributes`
--
ALTER TABLE `cache_campaign_attributes`
  ADD PRIMARY KEY (`api_campaignid`),
  ADD KEY `idx_cache_campaign_attributes` (`api_externalcustomerid`);

--
-- Indici per le tabelle `cache_campaign_metrics`
--
ALTER TABLE `cache_campaign_metrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cache_campaign` (`api_campaignid`);

--
-- Indici per le tabelle `cache_keywords_attributes`
--
ALTER TABLE `cache_keywords_attributes`
  ADD PRIMARY KEY (`api_campaignid`,`api_adgroupid`,`api_id`),
  ADD UNIQUE KEY `pk_cache_keywords_attributes` (`api_campaignid`,`api_adgroupid`),
  ADD KEY `idx_cache_keywords_attributes_0` (`api_adgroupid`);

--
-- Indici per le tabelle `cache_keywords_metrics`
--
ALTER TABLE `cache_keywords_metrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cache_keywords` (`api_campaignid`),
  ADD KEY `fk_cache_keywords` (`api_campaignid`,`api_adgroupid`);

--
-- Indici per le tabelle `cache_url_attributes`
--
ALTER TABLE `cache_url_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_cache_url_attributes_0` (`api_campaignid`,`id`,`api_adgroupid`),
  ADD KEY `fk_cache_url_attributes` (`api_campaignid`,`api_adgroupid`);

--
-- Indici per le tabelle `cache_url_metrics`
--
ALTER TABLE `cache_url_metrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cache_url` (`api_campaignid`),
  ADD KEY `fk_cache_url` (`api_campaignid`,`url_id`,`api_adgroupid`);

--
-- Indici per le tabelle `google_account`
--
ALTER TABLE `google_account`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `last_sync`
--
ALTER TABLE `last_sync`
  ADD PRIMARY KEY (`api_context`);

--
-- Indici per le tabelle `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `adwords_account`
--
ALTER TABLE `adwords_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `cache_adgroup_metrics`
--
ALTER TABLE `cache_adgroup_metrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `cache_campaign_metrics`
--
ALTER TABLE `cache_campaign_metrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `cache_keywords_metrics`
--
ALTER TABLE `cache_keywords_metrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `cache_url_attributes`
--
ALTER TABLE `cache_url_attributes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `cache_url_metrics`
--
ALTER TABLE `cache_url_metrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `google_account`
--
ALTER TABLE `google_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cache_adgroup_attributes`
--
ALTER TABLE `cache_adgroup_attributes`
  ADD CONSTRAINT `fk_cache_adgroup_attributes` FOREIGN KEY (`api_campaignid`) REFERENCES `cache_campaign_attributes` (`api_campaignid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `cache_adgroup_metrics`
--
ALTER TABLE `cache_adgroup_metrics`
  ADD CONSTRAINT `fk_cache_adgroup` FOREIGN KEY (`api_campaignid`, `api_adgroupid`) REFERENCES `cache_adgroup_attributes` (`api_campaignid`, `api_adgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `cache_campaign_attributes`
--
ALTER TABLE `cache_campaign_attributes`
  ADD CONSTRAINT `fk_cache_campaign_attributes` FOREIGN KEY (`api_externalcustomerid`) REFERENCES `adwords_account` (`api_externalcustomerid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `cache_campaign_metrics`
--
ALTER TABLE `cache_campaign_metrics`
  ADD CONSTRAINT `fk_cache_campaign` FOREIGN KEY (`api_campaignid`) REFERENCES `cache_campaign_attributes` (`api_campaignid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `cache_keywords_attributes`
--
ALTER TABLE `cache_keywords_attributes`
  ADD CONSTRAINT `fk_cache_keywords_attributes` FOREIGN KEY (`api_campaignid`, `api_adgroupid`) REFERENCES `cache_adgroup_attributes` (`api_campaignid`, `api_adgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `cache_keywords_metrics`
--
ALTER TABLE `cache_keywords_metrics`
  ADD CONSTRAINT `fk_cache_keywords` FOREIGN KEY (`api_campaignid`, `api_adgroupid`) REFERENCES `cache_keywords_attributes` (`api_campaignid`, `api_adgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `cache_url_attributes`
--
ALTER TABLE `cache_url_attributes`
  ADD CONSTRAINT `fk_cache_url_attributes` FOREIGN KEY (`api_campaignid`, `api_adgroupid`) REFERENCES `cache_adgroup_attributes` (`api_campaignid`, `api_adgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `cache_url_metrics`
--
ALTER TABLE `cache_url_metrics`
  ADD CONSTRAINT `fk_cache_url` FOREIGN KEY (`api_campaignid`, `url_id`, `api_adgroupid`) REFERENCES `cache_url_attributes` (`api_campaignid`, `id`, `api_adgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
