-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Mar 15, 2017 alle 13:57
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
CREATE DATABASE IF NOT EXISTS `adplify_manager` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `adplify_manager`;

-- --------------------------------------------------------

--
-- Struttura della tabella `api_account-performance-report`
--

CREATE TABLE IF NOT EXISTS `api_account-performance-report` (
  `Name` varchar(255) DEFAULT '',
  `Display Name` varchar(255) DEFAULT '',
  `XMLAttribute` varchar(255) DEFAULT '',
  `Type` varchar(255) DEFAULT '',
  `Filterable` varchar(255) DEFAULT '',
  `Supports Zero Impressions` varchar(255) DEFAULT '',
  `EnumValues` text,
  `Behavior` varchar(255) DEFAULT '',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `api_account-performance-report`
--

INSERT INTO `api_account-performance-report` (`Name`, `Display Name`, `XMLAttribute`, `Type`, `Filterable`, `Supports Zero Impressions`, `EnumValues`, `Behavior`, `Notes`) VALUES
('AccountCurrencyCode', 'Currency', 'currency', 'String', 'True', 'True', '', 'Attribute', 'The currency of the Customer account.'),
('AccountDescriptiveName', 'Account', 'account', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer account.'),
('AccountTimeZoneId', 'Time zone', 'timeZone', 'String', 'True', 'True', '', 'Attribute', 'Name of the timezone selected for the Customer account. For example: "(GMT-05:00) Eastern Time". This field does not reflect the current state of daylight saving time for the timezone.'),
('ActiveViewCpm', 'Active View avg. CPM', 'activeViewAvgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average cost of viewable impressions (ActiveViewImpressions).'),
('ActiveViewCtr', 'Active View viewable CTR', 'activeViewViewableCTR', 'Double', 'True', 'True', '', 'Metric', 'How often people clicked your ad after it became viewable.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewImpressions', 'Active View viewable impressions', 'activeViewViewableImpressions', 'Long', 'True', 'True', '', 'Metric', 'How often your ad has become viewable on a Display Network site.'),
('ActiveViewMeasurability', 'Active View measurable impr. / impr.', 'activeViewMeasurableImprImpr', 'Double', 'True', 'True', '', 'Metric', 'The ratio of impressions that could be measured by Active View over the number of served impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewMeasurableCost', 'Active View measurable cost', 'activeViewMeasurableCost', 'Money', 'True', 'True', '', 'Metric', 'The cost of the impressions you received that were measurable by Active View.'),
('ActiveViewMeasurableImpressions', 'Active View measurable impr.', 'activeViewMeasurableImpr', 'Long', 'True', 'True', '', 'Metric', 'The number of times your ads are appearing on placements in positions where they can be seen.'),
('ActiveViewViewability', 'Active View viewable impr. / measurable impr.', 'activeViewViewableImprMeasurableImpr', 'Double', 'True', 'True', '', 'Metric', 'The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions).\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AdNetworkType1', 'Network', 'network', 'AdNetworkType1', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Search Network\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'First level network type.'),
('AdNetworkType2', 'Network (with search partners)', 'networkWithSearchPartners', 'AdNetworkType2', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Google search\nSEARCH_PARTNERS / Search partners\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'Second level network type (includes search partners).'),
('AllConversionRate', 'All conv. rate', 'allConvRate', 'Double', 'True', 'True', '', 'Metric', 'AllConversions divided by total clicks that can be conversion-tracked. This is how often a click on your ad resulted in a conversion. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversions', 'All conv.', 'allConv', 'Double', 'True', 'True', '', 'Metric', 'Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversionValue', 'All conv. value', 'allConvValue', 'Double', 'True', 'True', '', 'Metric', 'The total value of all of your conversions, including those that are estimated.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageCost', 'Avg. Cost', 'avgCost', 'Money', 'True', 'True', '', 'Metric', 'The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions.'),
('AverageCpc', 'Avg. CPC', 'avgCPC', 'Money', 'True', 'True', '', 'Metric', 'The total cost of all clicks divided by the total number of clicks received.'),
('AverageCpe', 'Avg. CPE', 'avgCPE', 'Double', 'True', 'True', '', 'Metric', 'The average amount that youâ€™ve been charged for an ad engagement. This amount is the total cost of all ad engagements divided by the total number of ad engagements.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageCpm', 'Avg. CPM', 'avgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average Cost-per-thousand impressions (CPM).'),
('AverageCpv', 'Avg. CPV', 'avgCPV', 'Double', 'True', 'True', '', 'Metric', 'The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AveragePosition', 'Avg. position', 'avgPosition', 'Double', 'True', 'True', '', 'Metric', 'Your ad''s position relative to those of other advertisers.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CanManageClients', 'Can manage clients', 'canManageClients', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if the account is an MCC account (true) or a regular AdWords account (false).'),
('Clicks', 'Clicks', 'clicks', 'Long', 'True', 'True', '', 'Metric', 'The number of clicks.'),
('ClickType', 'Click type', 'clickType', 'ClickType', 'True', 'False', 'URL_CLICKS / Headline\nCALLS / Phone calls\nOTHER / Other\nPRODUCT_EXTENSION_CLICKS / Product plusbox offer\nSITELINKS / Sitelink\nPRODUCT_LISTING_AD_CLICKS / Shopping ad - Standard\nGET_DIRECTIONS / Driving direction\nOFFER_PRINTS / Print offer\nBREADCRUMBS / Breadcrumbs\nCALL_TRACKING / Manually dialed phone calls\nMOBILE_CALL_TRACKING / Mobile phone calls\nLOCATION_EXPANSION / Get location details\nSTORE_LOCATOR / Show nearby locations\nAPP_DEEPLINK / App engagement ad deep link\nTABLE_EXTENSION / Table Extension\nVIDEO_WEBSITE_CLICKS / Website\nVIDEO_CALL_TO_ACTION_CLICKS / Call-to-Action overlay\nVIDEO_APP_STORE_CLICKS / App store\nVIDEO_CARD_ACTION_HEADLINE_CLICKS / Cards\nVIDEO_END_CAP_CLICKS / End cap\nCLICK_ON_ENGAGEMENT_AD / Click on engagement ad\nLOCATION_FORMAT_MAP / Map\nLOCATION_FORMAT_LANDING_PAGE / Go to landing page\nLOCATION_FORMAT_STORE_INFO / Go to store info\nLOCATION_FORMAT_DIRECTIONS / Directions\nLOCATION_FORMAT_CALL / Call\nLOCATION_FORMAT_TEXT / Text\nLOCATION_FORMAT_IMAGE / Image(s)\nBROADBAND_PLAN / Broadband Plan\nWIRELESS_PLAN / Wireless Plan\nVISUAL_SITELINKS / Visual Sitelinks\nUNKNOWN / unknown\n', 'Segment', 'The Impressions field will reflect how often the ad was served with that click type available. Since ads can serve with multiple click types displayed, impressions may be double counted and the totals may not be accurate.'),
('ContentBudgetLostImpressionShare', 'Content Lost IS (budget)', 'contentLostISBudget', 'Double', 'True', 'True', '', 'Metric', 'The estimated percent of times that your ad was eligible to show on the Display Network but didn''t because your budget was too low. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ContentImpressionShare', 'Content Impr. share', 'contentImprShare', 'Double', 'True', 'True', '', 'Metric', 'The impressions youâ€™ve received on the Display Network divided by the estimated number of impressions you were eligible to receive. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ContentRankLostImpressionShare', 'Content Lost IS (rank)', 'contentLostISRank', 'Double', 'True', 'True', '', 'Metric', 'The estimated percentage of impressions on the Display Network that your ads didn''t receive due to poor Ad Rank. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ConversionCategoryName', 'Conversion category', 'conversionCategory', 'String', 'True', 'False', '', 'Segment', 'A category that describes the action the user will take to complete a conversion. Prevents zero-conversion rows from being returned. Values: "Download", "Lead", "Purchase/Sale", "Signup", "View of a key page", and "Other".'),
('ConversionRate', 'Conv. rate', 'convRate', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions divided by total clicks that can be tracked to conversions. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Conversions', 'Conversions', 'conversions', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions for all conversion actions that you have opted into optimization. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ConversionTrackerId', 'Conversion Tracker Id', 'conversionTrackerId', 'Long', 'True', 'False', '', 'Segment', 'ID of the conversion tracker.'),
('ConversionTypeName', 'Conversion name', 'conversionName', 'String', 'True', 'False', '', 'Segment', 'The name of the conversion type. Prevents zero-conversion rows from being returned.'),
('ConversionValue', 'Total conv. value', 'totalConvValue', 'Double', 'True', 'True', '', 'Metric', 'The sum of conversion values for all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Cost', 'Cost', 'cost', 'Money', 'True', 'True', '', 'Metric', 'The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.'),
('CostPerAllConversion', 'Cost / all conv.', 'costAllConv', 'Money', 'True', 'True', '', 'Metric', 'Total cost divided by all conversions.'),
('CostPerConversion', 'Cost / conv.', 'costConv', 'Money', 'True', 'True', '', 'Metric', 'The Cost attributable to conversion-tracked clicks divided by the number of conversions'),
('CrossDeviceConversions', 'Cross-device conv.', 'crossDeviceConv', 'Double', 'True', 'True', '', 'Metric', 'Conversions from when a customer clicks on an AdWords ad on one device, then converts on a different device or browser. Cross-device conversions are already included in your AllConversions column. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Ctr', 'CTR', 'ctr', 'Double', 'True', 'True', '', 'Metric', 'The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions). Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CustomerDescriptiveName', 'Client name', 'clientName', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer.'),
('Date', 'Day', 'day', 'Date', 'True', 'True', '', 'Segment', 'The date formatted as yyyy-MM-dd.'),
('DayOfWeek', 'Day of week', 'dayOfWeek', 'DayOfWeek', 'True', 'True', 'MONDAY / Monday\nTUESDAY / Tuesday\nWEDNESDAY / Wednesday\nTHURSDAY / Thursday\nFRIDAY / Friday\nSATURDAY / Saturday\nSUNDAY / Sunday\n', 'Segment', 'The name of the day of the week, e.g., "Monday".'),
('Device', 'Device', 'device', 'DeviceType', 'True', 'True', 'UNKNOWN / Other\nDESKTOP / Computers\nHIGH_END_MOBILE / Mobile devices with full browsers\nTABLET / Tablets with full browsers\n', 'Segment', 'Device type where the impression was shown.'),
('EngagementRate', 'Engagement rate', 'engagementRate', 'Double', 'True', 'True', '', 'Metric', 'How often people engage with your ad after it''s shown to them. This is the number of ad expansions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Engagements', 'Engagements', 'engagements', 'Long', 'True', 'True', '', 'Metric', 'The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics.'),
('ExternalConversionSource', 'Conversion source', 'conversionSource', 'ExternalConversionSource', 'True', 'False', 'UNKNOWN / Other\nWEBPAGE / Website\nANALYTICS / Analytics\nUPLOAD / Import from clicks\nAD_CALL_METRICS / Calls from ads\nOFFERS / Offers\nENGAGEMENT / Engagement ads\nWEBSITE_CALL_METRICS / Calls from website\nSTORE_VISITS / Store visits\nANDROID_IN_APP / Android in-app action\nANDROID_DOWNLOAD / Android app install (from Google Play)\nIOS_IN_APP / iOS in-app action\nIOS_FIRST_OPEN / iOS app install (first open)\nAPP_UNSPECIFIED / Mobile app\nANDROID_FIRST_OPEN / Android app install (first open)\nUPLOAD_CALLS / Import from calls\nFIREBASE / Firebase\nCLICK_TO_CALL / Phone number clicks\nSALESFORCE / Salesforce.com\nSTORE_SALES_CRM / Store sales (data partner)\nSTORE_SALES_PAYMENT_NETWORK / Store sales (payment network)\nGOOGLE_PLAY / Google Play\n', 'Segment', 'The source of conversion such as website, import from calls.'),
('ExternalCustomerId', 'Customer ID', 'customerID', 'Long', 'True', 'True', '', 'Attribute', 'The Customer ID.'),
('HourOfDay', 'Hour of day', 'hourOfDay', 'Integer', 'True', 'False', '', 'Segment', 'The hour of day as a number between 0 and 23, inclusive.'),
('Impressions', 'Impressions', 'impressions', 'Long', 'True', 'True', '', 'Metric', 'Count of how often your ad has appeared on a search results page or website on the Google Network.'),
('InteractionRate', 'Interaction Rate', 'interactionRate', 'Double', 'True', 'True', '', 'Metric', 'How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Interactions', 'Interactions', 'interactions', 'Long', 'True', 'True', '', 'Metric', 'The number of interactions. An interaction is the main user action associated with an ad formatâ€”clicks for text and shopping ads, views for video ads, and so on.'),
('InteractionTypes', 'Interaction Types', 'interactionTypes', 'EnumSet', 'True', 'True', '', 'Metric', 'The types of interactions that are reflected in the Interactions, InteractionRate, and AverageCost columns.'),
('InvalidClickRate', 'Invalid click rate', 'invalidClickRate', 'Double', 'True', 'True', '', 'Metric', 'The percentage ("x.xx%") of clicks filtered out of your total number of clicks (filtered + non-filtered clicks) during the reporting period.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('InvalidClicks', 'Invalid clicks', 'invalidClicks', 'Long', 'True', 'True', '', 'Metric', 'Number of clicks Google considers illegitimate and doesn''t charge you for.'),
('IsAutoTaggingEnabled', 'Auto tagging enabled', 'autoTaggingEnabled', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if auto tagging is enabled on the account.'),
('IsTestAccount', 'Test account', 'testAccount', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if the account is a test account.'),
('Month', 'Month', 'month', 'String', 'True', 'True', '', 'Segment', 'The first day of the month, formatted as yyyy-MM-dd.'),
('MonthOfYear', 'Month of Year', 'monthOfYear', 'MonthOfYear', 'True', 'True', 'JANUARY / January\nFEBRUARY / February\nMARCH / March\nAPRIL / April\nMAY / May\nJUNE / June\nJULY / July\nAUGUST / August\nSEPTEMBER / September\nOCTOBER / October\nNOVEMBER / November\nDECEMBER / December\n', 'Segment', 'The name of the month of the year, e.g., "December".'),
('PrimaryCompanyName', 'Company name', 'companyName', 'String', 'True', 'True', '', 'Attribute', 'Company name of the account.'),
('Quarter', 'Quarter', 'quarter', 'String', 'True', 'True', '', 'Segment', 'The first day of the quarter, formatted as yyyy-MM-dd. Uses the calendar year for quarters, e.g., the second quarter of 2014 starts on 2014-04-01.'),
('SearchBudgetLostImpressionShare', 'Search Lost IS (budget)', 'searchLostISBudget', 'Double', 'True', 'True', '', 'Metric', 'The estimated percent of times that your ad was eligible to show on the Search Network but didn''t because your budget was too low. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchExactMatchImpressionShare', 'Search Exact match IS', 'searchExactMatchIS', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received divided by the estimated number of impressions you were eligible to receive on the Search Network for search terms that matched your keywords exactly (or were close variants of your keyword), regardless of your keyword match types. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchImpressionShare', 'Search Impr. share', 'searchImprShare', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received on the Search Network divided by the estimated number of impressions you were eligible to receive. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchRankLostImpressionShare', 'Search Lost IS (rank)', 'searchLostISRank', 'Double', 'True', 'True', '', 'Metric', 'The estimated percentage of impressions on the Search Network that your ads didn''t receive due to poor Ad Rank. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Slot', 'Top vs. Other', 'topVsOther', 'Slot', 'True', 'True', 'SearchRhs / Google search: Side\nSearchTop / Google search: Top\nSearchOther / Google search: Other\nContent / Google Display Network\nAfsTop / Search partners: Top\nAfsOther / Search partners: Other\nUnknown / \n', 'Segment', 'The position of the Ad.'),
('ValuePerAllConversion', 'Value / all conv.', 'valueAllConv', 'Double', 'True', 'True', '', 'Metric', 'The value, on average, of all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ValuePerConversion', 'Value / conv.', 'valueConv', 'Double', 'True', 'True', '', 'Metric', 'The total value of your conversions divided by the total number of conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViewRate', 'View rate', 'viewRate', 'Double', 'True', 'True', '', 'Metric', 'The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViews', 'Views', 'views', 'Long', 'True', 'True', '', 'Metric', 'The number of times your video ads were viewed.'),
('ViewThroughConversions', 'View-through conv.', 'viewThroughConv', 'Long', 'True', 'True', '', 'Metric', 'The total number of view-through conversions. These happen when a customer sees a Display network ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('Week', 'Week', 'week', 'String', 'True', 'True', '', 'Segment', 'The date for the Monday of the week, formatted as yyyy-MM-dd.'),
('Year', 'Year', 'year', 'Integer', 'True', 'True', '', 'Segment', 'The year, formatted as yyyy.');

-- --------------------------------------------------------

--
-- Struttura della tabella `api_adgroup-performance-report`
--

CREATE TABLE IF NOT EXISTS `api_adgroup-performance-report` (
  `Name` varchar(255) DEFAULT '',
  `DisplayName` varchar(255) DEFAULT '',
  `XMLAttribute` varchar(255) DEFAULT '',
  `Type` varchar(255) DEFAULT '',
  `Filterable` varchar(255) DEFAULT '',
  `SupportsZeroImpressions` varchar(255) DEFAULT '',
  `EnumValues` text,
  `Behavior` varchar(255) DEFAULT '',
  `Notes` text,
  `enabled` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `api_adgroup-performance-report`
--

INSERT INTO `api_adgroup-performance-report` (`Name`, `DisplayName`, `XMLAttribute`, `Type`, `Filterable`, `SupportsZeroImpressions`, `EnumValues`, `Behavior`, `Notes`, `enabled`) VALUES
('AccountCurrencyCode', 'Currency', 'currency', 'String', 'True', 'True', '', 'Attribute', 'The currency of the Customer account.', 0),
('AccountDescriptiveName', 'Account', 'account', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer account.', 0),
('AccountTimeZoneId', 'Time zone', 'timeZone', 'String', 'True', 'True', '', 'Attribute', 'Name of the timezone selected for the Customer account. For example: "(GMT-05:00) Eastern Time". This field does not reflect the current state of daylight saving time for the timezone.', 0),
('ActiveViewCpm', 'Active View avg. CPM', 'activeViewAvgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average cost of viewable impressions (ActiveViewImpressions).', 0),
('ActiveViewCtr', 'Active View viewable CTR', 'activeViewViewableCTR', 'Double', 'True', 'True', '', 'Metric', 'How often people clicked your ad after it became viewable.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ActiveViewImpressions', 'Active View viewable impressions', 'activeViewViewableImpressions', 'Long', 'True', 'True', '', 'Metric', 'How often your ad has become viewable on a Display Network site.', 0),
('ActiveViewMeasurability', 'Active View measurable impr. / impr.', 'activeViewMeasurableImprImpr', 'Double', 'True', 'True', '', 'Metric', 'The ratio of impressions that could be measured by Active View over the number of served impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ActiveViewMeasurableCost', 'Active View measurable cost', 'activeViewMeasurableCost', 'Money', 'True', 'True', '', 'Metric', 'The cost of the impressions you received that were measurable by Active View.', 0),
('ActiveViewMeasurableImpressions', 'Active View measurable impr.', 'activeViewMeasurableImpr', 'Long', 'True', 'True', '', 'Metric', 'The number of times your ads are appearing on placements in positions where they can be seen.', 0),
('ActiveViewViewability', 'Active View viewable impr. / measurable impr.', 'activeViewViewableImprMeasurableImpr', 'Double', 'True', 'True', '', 'Metric', 'The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions).\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AdGroupDesktopBidModifier', 'Desktop bid adj.', 'desktopBidAdj', 'Double', 'True', 'True', '', 'Attribute', 'Desktop bid modifier override at the ad group level.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AdGroupId', 'Ad group ID', 'adGroupID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the AdGroup.', 0),
('AdGroupMobileBidModifier', 'Mobile bid adj.', 'mobileBidAdj', 'Double', 'True', 'True', '', 'Attribute', 'Mobile bid modifier override at ad group level.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AdGroupName', 'Ad group', 'adGroup', 'String', 'True', 'True', '', 'Attribute', 'The name of the AdGroup.', 0),
('AdGroupStatus', 'Ad group state', 'adGroupState', 'AdGroupStatus', 'True', 'True', 'UNKNOWN / unknown\nENABLED / enabled\nPAUSED / paused\nREMOVED / removed\n', 'Attribute', 'Status of the ad group.', 0),
('AdGroupTabletBidModifier', 'Tablet bid adj.', 'tabletBidAdj', 'Double', 'True', 'True', '', 'Attribute', 'Tablet bid modifier override at the ad group level.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AdNetworkType1', 'Network', 'network', 'AdNetworkType1', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Search Network\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'First level network type.', 0),
('AdNetworkType2', 'Network (with search partners)', 'networkWithSearchPartners', 'AdNetworkType2', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Google search\nSEARCH_PARTNERS / Search partners\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'Second level network type (includes search partners).', 0),
('AllConversionRate', 'All conv. rate', 'allConvRate', 'Double', 'True', 'True', '', 'Metric', 'AllConversions divided by total clicks that can be conversion-tracked. This is how often a click on your ad resulted in a conversion. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AllConversions', 'All conv.', 'allConv', 'Double', 'True', 'True', '', 'Metric', 'Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AllConversionValue', 'All conv. value', 'allConvValue', 'Double', 'True', 'True', '', 'Metric', 'The total value of all of your conversions, including those that are estimated.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AverageCost', 'Avg. Cost', 'avgCost', 'Money', 'True', 'True', '', 'Metric', 'The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions.', 0),
('AverageCpc', 'Avg. CPC', 'avgCPC', 'Money', 'True', 'True', '', 'Metric', 'The total cost of all clicks divided by the total number of clicks received.', 0),
('AverageCpe', 'Avg. CPE', 'avgCPE', 'Double', 'True', 'True', '', 'Metric', 'The average amount that youâ€™ve been charged for an ad engagement. This amount is the total cost of all ad engagements divided by the total number of ad engagements.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AverageCpm', 'Avg. CPM', 'avgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average Cost-per-thousand impressions (CPM).', 0),
('AverageCpv', 'Avg. CPV', 'avgCPV', 'Double', 'True', 'True', '', 'Metric', 'The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AveragePageviews', 'Pages / session', 'pagesSession', 'Double', 'True', 'True', '', 'Metric', 'Average number of pages viewed per session. Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AveragePosition', 'Avg. position', 'avgPosition', 'Double', 'True', 'True', '', 'Metric', 'Your ad''s position relative to those of other advertisers.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('AverageTimeOnSite', 'Avg. session duration (seconds)', 'avgSessionDurationSeconds', 'Double', 'True', 'True', '', 'Metric', 'Total duration of all sessions (in seconds) / number of sessions. Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('BaseAdGroupId', 'Base Ad group ID', 'baseAdGroupID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of base ad group of trial ad groups. For regular ad groups, this is equal to AdGroupId.', 0),
('BaseCampaignId', 'Base Campaign ID', 'baseCampaignID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of base campaign of trial campaigns. For regular campaigns, this is equal to CampaignId.', 0),
('BiddingStrategyId', 'Bid Strategy ID', 'bidStrategyID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the BiddingStrategyConfiguration.', 0),
('BiddingStrategyName', 'Bid Strategy Name', 'bidStrategyName', 'String', 'True', 'True', '', 'Attribute', 'The name of the BiddingStrategyConfiguration.', 0),
('BiddingStrategySource', 'Bidding Strategy Source', 'biddingStrategySource', 'BiddingStrategySource', 'True', 'True', 'CAMPAIGN / campaign\nADGROUP / ad group\nCRITERION / ad group criterion\n', 'Attribute', 'Indicates where the bidding strategy is associated i.e. campaign, ad group or ad group criterion.', 0),
('BiddingStrategyType', 'Bid Strategy Type', 'bidStrategyType', 'BiddingStrategyType', 'True', 'True', 'BUDGET_OPTIMIZER / auto\nCONVERSION_OPTIMIZER / max/target cpa\nMANUAL_CPC / cpc\nMANUAL_CPV / cpv\nMANUAL_CPM / cpm\nPAGE_ONE_PROMOTED / Target search page location\nTARGET_SPEND / Maximize clicks\nENHANCED_CPC / Enhanced CPC\nTARGET_CPA / Target CPA\nTARGET_ROAS / Target ROAS\nTARGET_OUTRANK_SHARE / Target Outranking Share\nNONE / None\nUNKNOWN / unknown\n', 'Attribute', 'The type of the BiddingStrategyConfiguration.', 0),
('BidType', 'Conversion optimizer bid type', 'conversionOptimizerBidType', 'BidType', 'True', 'True', 'TARGET_CPA / target cpa\n', 'Attribute', 'The bid type.', 0),
('BounceRate', 'Bounce rate', 'bounceRate', 'Double', 'True', 'True', '', 'Metric', 'Percentage of clicks where the user only visited a single page on your site, formatted as "x.xx%". Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('CampaignId', 'Campaign ID', 'campaignID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the Campaign.', 0),
('CampaignName', 'Campaign', 'campaign', 'String', 'True', 'True', '', 'Attribute', 'The name of the Campaign.', 0),
('CampaignStatus', 'Campaign state', 'campaignState', 'CampaignStatus', 'True', 'True', 'UNKNOWN / unknown\nENABLED / enabled\nPAUSED / paused\nREMOVED / removed\n', 'Attribute', 'The status of the Campaign.', 0),
('ClickAssistedConversions', 'Click Assisted Conv.', 'clickAssistedConv', 'Long', 'True', 'True', '', 'Metric', 'The total number of conversions for which this keyword, ad, ad group, or campaign contributed one or more assist clicks. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.', 0),
('ClickAssistedConversionsOverLastClickConversions', 'Click Assisted Conv. / Last Click Conv.', 'clickAssistedConvLastClickConv', 'Double', 'True', 'True', '', 'Metric', 'The total number of conversions for which this keyword, ad, ad group, or campaign received assist clicks divided by the total number of conversions for which it triggered the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ClickAssistedConversionValue', 'Click Assisted Conv. Value', 'clickAssistedConvValue', 'Double', 'True', 'True', '', 'Metric', 'The total value of all conversions for which this keyword, ad, ad group, or campaign triggered assist clicks.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Clicks', 'Clicks', 'clicks', 'Long', 'True', 'True', '', 'Metric', 'The number of clicks.', 0),
('ClickType', 'Click type', 'clickType', 'ClickType', 'True', 'False', 'URL_CLICKS / Headline\nCALLS / Phone calls\nOTHER / Other\nPRODUCT_EXTENSION_CLICKS / Product plusbox offer\nSITELINKS / Sitelink\nPRODUCT_LISTING_AD_CLICKS / Shopping ad - Standard\nGET_DIRECTIONS / Driving direction\nOFFER_PRINTS / Print offer\nBREADCRUMBS / Breadcrumbs\nCALL_TRACKING / Manually dialed phone calls\nMOBILE_CALL_TRACKING / Mobile phone calls\nLOCATION_EXPANSION / Get location details\nSTORE_LOCATOR / Show nearby locations\nAPP_DEEPLINK / App engagement ad deep link\nTABLE_EXTENSION / Table Extension\nVIDEO_WEBSITE_CLICKS / Website\nVIDEO_CALL_TO_ACTION_CLICKS / Call-to-Action overlay\nVIDEO_APP_STORE_CLICKS / App store\nVIDEO_CARD_ACTION_HEADLINE_CLICKS / Cards\nVIDEO_END_CAP_CLICKS / End cap\nCLICK_ON_ENGAGEMENT_AD / Click on engagement ad\nLOCATION_FORMAT_MAP / Map\nLOCATION_FORMAT_LANDING_PAGE / Go to landing page\nLOCATION_FORMAT_STORE_INFO / Go to store info\nLOCATION_FORMAT_DIRECTIONS / Directions\nLOCATION_FORMAT_CALL / Call\nLOCATION_FORMAT_TEXT / Text\nLOCATION_FORMAT_IMAGE / Image(s)\nBROADBAND_PLAN / Broadband Plan\nWIRELESS_PLAN / Wireless Plan\nVISUAL_SITELINKS / Visual Sitelinks\nUNKNOWN / unknown\n', 'Segment', 'The Impressions field will reflect how often the ad was served with that click type available. Since ads can serve with multiple click types displayed, impressions may be double counted and the totals may not be accurate.', 0),
('ContentBidCriterionTypeGroup', 'Content Network Bid Dimension', 'contentNetworkBidDimension', 'CriterionTypeGroup', 'True', 'True', 'KEYWORD / Keyword\nUSER_INTEREST_AND_LIST / User Interest and List\nVERTICAL / Vertical\nGENDER / Gender\nAGE_RANGE / Age\nPLACEMENT / Placement\nPARENT / Parental status\nNONE / None\nUNKNOWN / unknown\n', 'Attribute', 'The type of criteria the ad group uses for absolute bids on the Display Network.', 0),
('ContentImpressionShare', 'Content Impr. share', 'contentImprShare', 'Double', 'True', 'True', '', 'Metric', 'The impressions youâ€™ve received on the Display Network divided by the estimated number of impressions you were eligible to receive. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ContentRankLostImpressionShare', 'Content Lost IS (rank)', 'contentLostISRank', 'Double', 'True', 'True', '', 'Metric', 'The estimated percentage of impressions on the Display Network that your ads didn''t receive due to poor Ad Rank. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ConversionCategoryName', 'Conversion category', 'conversionCategory', 'String', 'True', 'False', '', 'Segment', 'A category that describes the action the user will take to complete a conversion. Prevents zero-conversion rows from being returned. Values: "Download", "Lead", "Purchase/Sale", "Signup", "View of a key page", and "Other".', 0),
('ConversionRate', 'Conv. rate', 'convRate', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions divided by total clicks that can be tracked to conversions. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Conversions', 'Conversions', 'conversions', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions for all conversion actions that you have opted into optimization. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ConversionTrackerId', 'Conversion Tracker Id', 'conversionTrackerId', 'Long', 'True', 'False', '', 'Segment', 'ID of the conversion tracker.', 0),
('ConversionTypeName', 'Conversion name', 'conversionName', 'String', 'True', 'False', '', 'Segment', 'The name of the conversion type. Prevents zero-conversion rows from being returned.', 0),
('ConversionValue', 'Total conv. value', 'totalConvValue', 'Double', 'True', 'True', '', 'Metric', 'The sum of conversion values for all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Cost', 'Cost', 'cost', 'Money', 'True', 'True', '', 'Metric', 'The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.', 0),
('CostPerAllConversion', 'Cost / all conv.', 'costAllConv', 'Money', 'True', 'True', '', 'Metric', 'Total cost divided by all conversions.', 0),
('CostPerConversion', 'Cost / conv.', 'costConv', 'Money', 'True', 'True', '', 'Metric', 'The Cost attributable to conversion-tracked clicks divided by the number of conversions', 0),
('CpcBid', 'Default max. CPC', 'defaultMaxCPC', 'Money', 'True', 'True', '', 'Attribute', 'Cost per click bid. Values can be one of: a) a money amount in micros, b) "auto: x" or "auto" if AdWords is automatically setting the bid via the chosen bidding strategy, or c) "--" if no CPC bid applies to the row.', 0),
('CpmBid', 'Max. CPM', 'maxCPM', 'Money', 'True', 'True', '', 'Attribute', 'CPM (cost per thousand impressions) bid.', 0),
('CpvBid', 'Max. CPV', 'maxCPV', 'Money', 'True', 'True', '', 'Attribute', 'Cost per view bid. Values can be one of: a) a money amount in micros, b) "auto: x" or "auto" if AdWords is automatically setting the bid via the chosen bidding strategy, or c) "--" if no CPV bid applies to the row.', 0),
('CrossDeviceConversions', 'Cross-device conv.', 'crossDeviceConv', 'Double', 'True', 'True', '', 'Metric', 'Conversions from when a customer clicks on an AdWords ad on one device, then converts on a different device or browser. Cross-device conversions are already included in your AllConversions column. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Ctr', 'CTR', 'ctr', 'Double', 'True', 'True', '', 'Metric', 'The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions). Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('CustomerDescriptiveName', 'Client name', 'clientName', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer.', 0),
('Date', 'Day', 'day', 'Date', 'True', 'True', '', 'Segment', 'The date formatted as yyyy-MM-dd.', 0),
('DayOfWeek', 'Day of week', 'dayOfWeek', 'DayOfWeek', 'True', 'True', 'MONDAY / Monday\nTUESDAY / Tuesday\nWEDNESDAY / Wednesday\nTHURSDAY / Thursday\nFRIDAY / Friday\nSATURDAY / Saturday\nSUNDAY / Sunday\n', 'Segment', 'The name of the day of the week, e.g., "Monday".', 0),
('Device', 'Device', 'device', 'DeviceType', 'True', 'True', 'UNKNOWN / Other\nDESKTOP / Computers\nHIGH_END_MOBILE / Mobile devices with full browsers\nTABLET / Tablets with full browsers\n', 'Segment', 'Device type where the impression was shown.', 0),
('EngagementRate', 'Engagement rate', 'engagementRate', 'Double', 'True', 'True', '', 'Metric', 'How often people engage with your ad after it''s shown to them. This is the number of ad expansions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Engagements', 'Engagements', 'engagements', 'Long', 'True', 'True', '', 'Metric', 'The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics.', 0),
('EnhancedCpcEnabled', 'Enhanced CPC enabled', 'enhancedCPCEnabled', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if enhanced CPC is enabled on the bidding strategy.', 0),
('EnhancedCpvEnabled', 'Enhanced CPV enabled', 'enhancedCPVEnabled', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if enhanced CPV is enabled on the bidding strategy.', 0),
('ExternalConversionSource', 'Conversion source', 'conversionSource', 'ExternalConversionSource', 'True', 'False', 'UNKNOWN / Other\nWEBPAGE / Website\nANALYTICS / Analytics\nUPLOAD / Import from clicks\nAD_CALL_METRICS / Calls from ads\nOFFERS / Offers\nENGAGEMENT / Engagement ads\nWEBSITE_CALL_METRICS / Calls from website\nSTORE_VISITS / Store visits\nANDROID_IN_APP / Android in-app action\nANDROID_DOWNLOAD / Android app install (from Google Play)\nIOS_IN_APP / iOS in-app action\nIOS_FIRST_OPEN / iOS app install (first open)\nAPP_UNSPECIFIED / Mobile app\nANDROID_FIRST_OPEN / Android app install (first open)\nUPLOAD_CALLS / Import from calls\nFIREBASE / Firebase\nCLICK_TO_CALL / Phone number clicks\nSALESFORCE / Salesforce.com\nSTORE_SALES_CRM / Store sales (data partner)\nSTORE_SALES_PAYMENT_NETWORK / Store sales (payment network)\nGOOGLE_PLAY / Google Play\n', 'Segment', 'The source of conversion such as website, import from calls.', 0),
('ExternalCustomerId', 'Customer ID', 'customerID', 'Long', 'True', 'True', '', 'Attribute', 'The Customer ID.', 0),
('GmailForwards', 'Gmail forwards', 'gmailForwards', 'Long', 'True', 'True', '', 'Metric', 'The number of times your ad was forwarded to someone else as a message.', 0),
('GmailSaves', 'Gmail saves', 'gmailSaves', 'Long', 'True', 'True', '', 'Metric', 'The number of times someone has saved your Gmail ad to their inbox as a message.', 0),
('GmailSecondaryClicks', 'Gmail clicks to website', 'gmailClicksToWebsite', 'Long', 'True', 'True', '', 'Metric', 'The number of clicks to your landing page on the expanded state of Gmail ads.', 0),
('HourOfDay', 'Hour of day', 'hourOfDay', 'Integer', 'True', 'False', '', 'Segment', 'The hour of day as a number between 0 and 23, inclusive.', 0),
('ImpressionAssistedConversions', 'Impr. Assisted Conv.', 'imprAssistedConv', 'Long', 'True', 'True', '', 'Metric', 'Total number of conversions for which this object triggered assist impressions prior to the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.', 0),
('ImpressionAssistedConversionsOverLastClickConversions', 'Impr. Assisted Conv. / Last Click Conv.', 'imprAssistedConvLastClickConv', 'Double', 'True', 'True', '', 'Metric', 'Total number of conversions for which this object triggered assist impressions divided by the total number of conversions for which this object triggered the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ImpressionAssistedConversionValue', 'Impr. Assisted Conv. Value', 'imprAssistedConvValue', 'Double', 'True', 'True', '', 'Metric', 'Total value of all conversions for which this object triggered assist impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Impressions', 'Impressions', 'impressions', 'Long', 'True', 'True', '', 'Metric', 'Count of how often your ad has appeared on a search results page or website on the Google Network.', 0),
('InteractionRate', 'Interaction Rate', 'interactionRate', 'Double', 'True', 'True', '', 'Metric', 'How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Interactions', 'Interactions', 'interactions', 'Long', 'True', 'True', '', 'Metric', 'The number of interactions. An interaction is the main user action associated with an ad formatâ€”clicks for text and shopping ads, views for video ads, and so on.', 0),
('InteractionTypes', 'Interaction Types', 'interactionTypes', 'EnumSet', 'True', 'True', '', 'Metric', 'The types of interactions that are reflected in the Interactions, InteractionRate, and AverageCost columns.', 0),
('LabelIds', 'Label IDs', 'labelIDs', 'List', 'True', 'True', '', 'Attribute', 'List of label IDs for the main object of this row.\nList elements are returned in JSON list format.', 0),
('Labels', 'Labels', 'labels', 'List', 'True', 'True', '', 'Attribute', 'List of label names for the main object of this row.\nList elements are returned in JSON list format.', 0),
('Month', 'Month', 'month', 'String', 'True', 'True', '', 'Segment', 'The first day of the month, formatted as yyyy-MM-dd.', 0),
('MonthOfYear', 'Month of Year', 'monthOfYear', 'MonthOfYear', 'True', 'True', 'JANUARY / January\nFEBRUARY / February\nMARCH / March\nAPRIL / April\nMAY / May\nJUNE / June\nJULY / July\nAUGUST / August\nSEPTEMBER / September\nOCTOBER / October\nNOVEMBER / November\nDECEMBER / December\n', 'Segment', 'The name of the month of the year, e.g., "December".', 0),
('NumOfflineImpressions', 'Phone impressions', 'phoneImpressions', 'Long', 'True', 'True', '', 'Metric', 'Number of offline phone impressions.', 0),
('NumOfflineInteractions', 'Phone calls', 'phoneCalls', 'Long', 'True', 'True', '', 'Metric', 'Number of offline phone calls.', 0),
('OfflineInteractionRate', 'PTR', 'ptr', 'Double', 'True', 'True', '', 'Metric', 'Number of phone calls received (NumOfflineInteractions) divided by the number of times your phone number is shown (NumOfflineImpressions).\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('PercentNewVisitors', '% new sessions', 'newSessions', 'Double', 'True', 'True', '', 'Metric', 'Percentage of first-time sessions (from people who had never visited your site before), formatted as "x.xx%". Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('PrimaryCompanyName', 'Company name', 'companyName', 'String', 'True', 'True', '', 'Attribute', 'Company name of the account.', 0),
('Quarter', 'Quarter', 'quarter', 'String', 'True', 'True', '', 'Segment', 'The first day of the quarter, formatted as yyyy-MM-dd. Uses the calendar year for quarters, e.g., the second quarter of 2014 starts on 2014-04-01.', 0),
('RelativeCtr', 'Relative CTR', 'relativeCTR', 'Double', 'True', 'True', '', 'Metric', 'Your clickthrough rate (Ctr) divided by the average clickthrough rate of all advertisers on the websites that show your ads. Measures how your ads perform on Display Network sites compared to other ads on the same sites.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('SearchExactMatchImpressionShare', 'Search Exact match IS', 'searchExactMatchIS', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received divided by the estimated number of impressions you were eligible to receive on the Search Network for search terms that matched your keywords exactly (or were close variants of your keyword), regardless of your keyword match types. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('SearchImpressionShare', 'Search Impr. share', 'searchImprShare', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received on the Search Network divided by the estimated number of impressions you were eligible to receive. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('SearchRankLostImpressionShare', 'Search Lost IS (rank)', 'searchLostISRank', 'Double', 'True', 'True', '', 'Metric', 'The estimated percentage of impressions on the Search Network that your ads didn''t receive due to poor Ad Rank. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('Slot', 'Top vs. Other', 'topVsOther', 'Slot', 'True', 'True', 'SearchRhs / Google search: Side\nSearchTop / Google search: Top\nSearchOther / Google search: Other\nContent / Google Display Network\nAfsTop / Search partners: Top\nAfsOther / Search partners: Other\nUnknown / \n', 'Segment', 'The position of the Ad.', 0),
('TargetCpa', 'Target CPA', 'targetCPA', 'Money', 'True', 'True', '', 'Attribute', 'The average CPA target set on the Target CPA bidding strategy.', 0),
('TargetCpaBidSource', 'Target CPA source', 'targetCPASource', 'BidSource', 'True', 'True', 'ADGROUP / ad groups\nCRITERION / ad group criteria\nADGROUP_BIDDING_STRATEGY / ad group bidding strategy\nCAMPAIGN_BIDDING_STRATEGY / campaign bidding strategy\n', 'Attribute', 'The level at which the target CPA bid was set. This is applicable only at the ad group level.', 0),
('TrackingUrlTemplate', 'Tracking template', 'trackingTemplate', 'String', 'True', 'True', '', 'Attribute', 'Tracking template of the main object of this row.', 0),
('UrlCustomParameters', 'Custom parameter', 'customParameter', 'CustomParameters', 'False', 'True', '', 'Attribute', 'Custom URL parameters of the main object of this row.\nCustomParameters elements are returned in JSON map format.', 0),
('ValuePerAllConversion', 'Value / all conv.', 'valueAllConv', 'Double', 'True', 'True', '', 'Metric', 'The value, on average, of all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('ValuePerConversion', 'Value / conv.', 'valueConv', 'Double', 'True', 'True', '', 'Metric', 'The total value of your conversions divided by the total number of conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('VideoQuartile100Rate', 'Video played to 100%', 'videoPlayedTo100', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched all of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('VideoQuartile25Rate', 'Video played to 25%', 'videoPlayedTo25', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 25% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('VideoQuartile50Rate', 'Video played to 50%', 'videoPlayedTo50', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 50% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('VideoQuartile75Rate', 'Video played to 75%', 'videoPlayedTo75', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 75% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('VideoViewRate', 'View rate', 'viewRate', 'Double', 'True', 'True', '', 'Metric', 'The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.', 0),
('VideoViews', 'Views', 'views', 'Long', 'True', 'True', '', 'Metric', 'The number of times your video ads were viewed.', 0),
('ViewThroughConversions', 'View-through conv.', 'viewThroughConv', 'Long', 'True', 'True', '', 'Metric', 'The total number of view-through conversions. These happen when a customer sees a Display network ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.', 0),
('Week', 'Week', 'week', 'String', 'True', 'True', '', 'Segment', 'The date for the Monday of the week, formatted as yyyy-MM-dd.', 0),
('Year', 'Year', 'year', 'Integer', 'True', 'True', '', 'Segment', 'The year, formatted as yyyy.', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `api_campaign-performance-report`
--

CREATE TABLE IF NOT EXISTS `api_campaign-performance-report` (
  `Name` varchar(255) DEFAULT '',
  `DisplayName` varchar(255) DEFAULT '',
  `XMLAttribute` varchar(255) DEFAULT '',
  `Type` varchar(255) DEFAULT '',
  `Filterable` varchar(255) DEFAULT '',
  `SupportsZeroImpressions` varchar(255) DEFAULT '',
  `EnumValues` text,
  `Behavior` varchar(255) DEFAULT '',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `api_campaign-performance-report`
--

INSERT INTO `api_campaign-performance-report` (`Name`, `DisplayName`, `XMLAttribute`, `Type`, `Filterable`, `SupportsZeroImpressions`, `EnumValues`, `Behavior`, `Notes`) VALUES
('AccountCurrencyCode', 'Currency', 'currency', 'String', 'True', 'True', '', 'AccountCurrencyCode', 'The currency of the Customer account.'),
('AccountDescriptiveName', 'Account', 'account', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer account.'),
('AccountTimeZoneId', 'Time zone', 'timeZone', 'String', 'True', 'True', '', 'Attribute', 'Name of the timezone selected for the Customer account. For example: "(GMT-05:00) Eastern Time". This field does not reflect the current state of daylight saving time for the timezone.'),
('ActiveViewCpm', 'Active View avg. CPM', 'activeViewAvgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average cost of viewable impressions (ActiveViewImpressions).'),
('ActiveViewCtr', 'Active View viewable CTR', 'activeViewViewableCTR', 'Double', 'True', 'True', '', 'Metric', 'How often people clicked your ad after it became viewable.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewImpressions', 'Active View viewable impressions', 'activeViewViewableImpressions', 'Long', 'True', 'True', '', 'Metric', 'How often your ad has become viewable on a Display Network site.'),
('ActiveViewMeasurability', 'Active View measurable impr. / impr.', 'activeViewMeasurableImprImpr', 'Double', 'True', 'True', '', 'Metric', 'The ratio of impressions that could be measured by Active View over the number of served impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewMeasurableCost', 'Active View measurable cost', 'activeViewMeasurableCost', 'Money', 'True', 'True', '', 'Metric', 'The cost of the impressions you received that were measurable by Active View.'),
('ActiveViewMeasurableImpressions', 'Active View measurable impr.', 'activeViewMeasurableImpr', 'Long', 'True', 'True', '', 'Metric', 'The number of times your ads are appearing on placements in positions where they can be seen.'),
('ActiveViewViewability', 'Active View viewable impr. / measurable impr.', 'activeViewViewableImprMeasurableImpr', 'Double', 'True', 'True', '', 'Metric', 'The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions).\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AdNetworkType1', 'Network', 'network', 'AdNetworkType1', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Search Network\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'First level network type.'),
('AdNetworkType2', 'Network (with search partners)', 'networkWithSearchPartners', 'AdNetworkType2', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Google search\nSEARCH_PARTNERS / Search partners\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'Second level network type (includes search partners).'),
('AdvertisingChannelSubType', 'Advertising Sub Channel', 'advertisingSubChannel', 'AdvertisingChannelSubType', 'True', 'True', 'UNKNOWN / Unknown\nSEARCH_MOBILE_APP / Search Mobile App\nDISPLAY_MOBILE_APP / Display Mobile App\nSEARCH_EXPRESS / Search Express\nDISPLAY_EXPRESS / Display Express\nUNIVERSAL_APP_CAMPAIGN / Universal App Campaign\n', 'Attribute', 'Optional refinement of the campaign''s AdvertisingChannelType.'),
('AdvertisingChannelType', 'Advertising Channel', 'advertisingChannel', 'AdvertisingChannelType', 'True', 'True', 'UNKNOWN / Unknown\nSEARCH / Search\nDISPLAY / Display\nSHOPPING / Shopping\nVIDEO / Video\nMULTI_CHANNEL / Multi Channel\n', 'Attribute', 'Primary serving target for ads in the campaign.'),
('AllConversionRate', 'All conv. rate', 'allConvRate', 'Double', 'True', 'True', '', 'Metric', 'AllConversions divided by total clicks that can be conversion-tracked. This is how often a click on your ad resulted in a conversion. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversions', 'All conv.', 'allConv', 'Double', 'True', 'True', '', 'Metric', 'Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversionValue', 'All conv. value', 'allConvValue', 'Double', 'True', 'True', '', 'Metric', 'The total value of all of your conversions, including those that are estimated.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Amount', 'Budget', 'budget', 'Money', 'True', 'True', '', 'Attribute', 'The daily budget. On the Campaign Performance Report this column reflects the entire shared budget if the campaign draws from a shared budget.'),
('AverageCost', 'Avg. Cost', 'avgCost', 'Money', 'True', 'True', '', 'Metric', 'The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions.'),
('AverageCpc', 'Avg. CPC', 'avgCPC', 'Money', 'True', 'True', '', 'Metric', 'The total cost of all clicks divided by the total number of clicks received.'),
('AverageCpe', 'Avg. CPE', 'avgCPE', 'Double', 'True', 'True', '', 'Metric', 'The average amount that youâ€™ve been charged for an ad engagement. This amount is the total cost of all ad engagements divided by the total number of ad engagements.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageCpm', 'Avg. CPM', 'avgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average Cost-per-thousand impressions (CPM).'),
('AverageCpv', 'Avg. CPV', 'avgCPV', 'Double', 'True', 'True', '', 'Metric', 'The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageFrequency', 'Avg. impr. freq. per cookie', 'avgImprFreqPerCookie', 'Double', 'True', 'True', '', 'Metric', 'Average number of times a unique cookie was exposed to your ad over a given time period. Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AveragePageviews', 'Pages / session', 'pagesSession', 'Double', 'True', 'True', '', 'Metric', 'Average number of pages viewed per session. Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AveragePosition', 'Avg. position', 'avgPosition', 'Double', 'True', 'True', '', 'Metric', 'Your ad''s position relative to those of other advertisers.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageTimeOnSite', 'Avg. session duration (seconds)', 'avgSessionDurationSeconds', 'Double', 'True', 'True', '', 'Metric', 'Total duration of all sessions (in seconds) / number of sessions. Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('BaseCampaignId', 'Base Campaign ID', 'baseCampaignID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of base campaign of trial campaigns. For regular campaigns, this is equal to CampaignId.'),
('BiddingStrategyId', 'Bid Strategy ID', 'bidStrategyID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the BiddingStrategyConfiguration.'),
('BiddingStrategyName', 'Bid Strategy Name', 'bidStrategyName', 'String', 'True', 'True', '', 'Attribute', 'The name of the BiddingStrategyConfiguration.'),
('BiddingStrategyType', 'Bid Strategy Type', 'bidStrategyType', 'BiddingStrategyType', 'True', 'True', 'BUDGET_OPTIMIZER / auto\nCONVERSION_OPTIMIZER / max/target cpa\nMANUAL_CPC / cpc\nMANUAL_CPV / cpv\nMANUAL_CPM / cpm\nPAGE_ONE_PROMOTED / Target search page location\nTARGET_SPEND / Maximize clicks\nENHANCED_CPC / Enhanced CPC\nTARGET_CPA / Target CPA\nTARGET_ROAS / Target ROAS\nTARGET_OUTRANK_SHARE / Target Outranking Share\nNONE / None\nUNKNOWN / unknown\n', 'Attribute', 'The type of the BiddingStrategyConfiguration.'),
('BidType', 'Conversion optimizer bid type', 'conversionOptimizerBidType', 'BidType', 'True', 'True', 'TARGET_CPA / target cpa\n', 'Attribute', 'The bid type.'),
('BounceRate', 'Bounce rate', 'bounceRate', 'Double', 'True', 'True', '', 'Metric', 'Percentage of clicks where the user only visited a single page on your site, formatted as "x.xx%". Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('BudgetId', 'Budget ID', 'budgetID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the Budget.'),
('CampaignDesktopBidModifier', 'Desktop bid adj.', 'desktopBidAdj', 'Double', 'True', 'True', '', 'Attribute', 'Desktop bid modifier override at the campaign level.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CampaignId', 'Campaign ID', 'campaignID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the Campaign.'),
('CampaignMobileBidModifier', 'Mobile bid adj.', 'mobileBidAdj', 'Double', 'True', 'True', '', 'Attribute', 'Mobile bid modifier of the campaign. To filter by this field, use values greater than 0 and less than or equal to 1. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CampaignName', 'Campaign', 'campaign', 'String', 'True', 'True', '', 'Attribute', 'The name of the Campaign.'),
('CampaignStatus', 'Campaign state', 'campaignState', 'CampaignStatus', 'True', 'True', 'UNKNOWN / unknown\nENABLED / enabled\nPAUSED / paused\nREMOVED / removed\n', 'Attribute', 'The status of the Campaign.'),
('CampaignTabletBidModifier', 'Tablet bid adj.', 'tabletBidAdj', 'Double', 'True', 'True', '', 'Attribute', 'Tablet bid modifier override at the campaign level.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CampaignTrialType', 'Campaign Trial Type', 'campaignTrialType', 'CampaignTrialType', 'True', 'True', 'UNKNOWN / unknown\nBASE / base campaign\nDRAFT / draft campaign\nTRIAL / trial campaign\n', 'Attribute', 'The type of campaign. This shows if the campaign is a trial campaign or not.'),
('ClickAssistedConversions', 'Click Assisted Conv.', 'clickAssistedConv', 'Long', 'True', 'True', '', 'Metric', 'The total number of conversions for which this keyword, ad, ad group, or campaign contributed one or more assist clicks. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('ClickAssistedConversionsOverLastClickConversions', 'Click Assisted Conv. / Last Click Conv.', 'clickAssistedConvLastClickConv', 'Double', 'True', 'True', '', 'Metric', 'The total number of conversions for which this keyword, ad, ad group, or campaign received assist clicks divided by the total number of conversions for which it triggered the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ClickAssistedConversionValue', 'Click Assisted Conv. Value', 'clickAssistedConvValue', 'Double', 'True', 'True', '', 'Metric', 'The total value of all conversions for which this keyword, ad, ad group, or campaign triggered assist clicks.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Clicks', 'Clicks', 'clicks', 'Long', 'True', 'True', '', 'Metric', 'The number of clicks.'),
('ClickType', 'Click type', 'clickType', 'ClickType', 'True', 'False', 'URL_CLICKS / Headline\nCALLS / Phone calls\nOTHER / Other\nPRODUCT_EXTENSION_CLICKS / Product plusbox offer\nSITELINKS / Sitelink\nPRODUCT_LISTING_AD_CLICKS / Shopping ad - Standard\nGET_DIRECTIONS / Driving direction\nOFFER_PRINTS / Print offer\nBREADCRUMBS / Breadcrumbs\nCALL_TRACKING / Manually dialed phone calls\nMOBILE_CALL_TRACKING / Mobile phone calls\nLOCATION_EXPANSION / Get location details\nSTORE_LOCATOR / Show nearby locations\nAPP_DEEPLINK / App engagement ad deep link\nTABLE_EXTENSION / Table Extension\nVIDEO_WEBSITE_CLICKS / Website\nVIDEO_CALL_TO_ACTION_CLICKS / Call-to-Action overlay\nVIDEO_APP_STORE_CLICKS / App store\nVIDEO_CARD_ACTION_HEADLINE_CLICKS / Cards\nVIDEO_END_CAP_CLICKS / End cap\nCLICK_ON_ENGAGEMENT_AD / Click on engagement ad\nLOCATION_FORMAT_MAP / Map\nLOCATION_FORMAT_LANDING_PAGE / Go to landing page\nLOCATION_FORMAT_STORE_INFO / Go to store info\nLOCATION_FORMAT_DIRECTIONS / Directions\nLOCATION_FORMAT_CALL / Call\nLOCATION_FORMAT_TEXT / Text\nLOCATION_FORMAT_IMAGE / Image(s)\nBROADBAND_PLAN / Broadband Plan\nWIRELESS_PLAN / Wireless Plan\nVISUAL_SITELINKS / Visual Sitelinks\nUNKNOWN / unknown\n', 'Segment', 'The Impressions field will reflect how often the ad was served with that click type available. Since ads can serve with multiple click types displayed, impressions may be double counted and the totals may not be accurate.'),
('ContentBudgetLostImpressionShare', 'Content Lost IS (budget)', 'contentLostISBudget', 'Double', 'True', 'True', '', 'Metric', 'The estimated percent of times that your ad was eligible to show on the Display Network but didn''t because your budget was too low. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ContentImpressionShare', 'Content Impr. share', 'contentImprShare', 'Double', 'True', 'True', '', 'Metric', 'The impressions youâ€™ve received on the Display Network divided by the estimated number of impressions you were eligible to receive. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ContentRankLostImpressionShare', 'Content Lost IS (rank)', 'contentLostISRank', 'Double', 'True', 'True', '', 'Metric', 'The estimated percentage of impressions on the Display Network that your ads didn''t receive due to poor Ad Rank. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ConversionCategoryName', 'Conversion category', 'conversionCategory', 'String', 'True', 'False', '', 'Segment', 'A category that describes the action the user will take to complete a conversion. Prevents zero-conversion rows from being returned. Values: "Download", "Lead", "Purchase/Sale", "Signup", "View of a key page", and "Other".'),
('ConversionRate', 'Conv. rate', 'convRate', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions divided by total clicks that can be tracked to conversions. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Conversions', 'Conversions', 'conversions', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions for all conversion actions that you have opted into optimization. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ConversionTrackerId', 'Conversion Tracker Id', 'conversionTrackerId', 'Long', 'True', 'False', '', 'Segment', 'ID of the conversion tracker.'),
('ConversionTypeName', 'Conversion name', 'conversionName', 'String', 'True', 'False', '', 'Segment', 'The name of the conversion type. Prevents zero-conversion rows from being returned.'),
('ConversionValue', 'Total conv. value', 'totalConvValue', 'Double', 'True', 'True', '', 'Metric', 'The sum of conversion values for all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Cost', 'Cost', 'cost', 'Money', 'True', 'True', '', 'Metric', 'The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.'),
('CostPerAllConversion', 'Cost / all conv.', 'costAllConv', 'Money', 'True', 'True', '', 'Metric', 'Total cost divided by all conversions.'),
('CostPerConversion', 'Cost / conv.', 'costConv', 'Money', 'True', 'True', '', 'Metric', 'The Cost attributable to conversion-tracked clicks divided by the number of conversions'),
('CrossDeviceConversions', 'Cross-device conv.', 'crossDeviceConv', 'Double', 'True', 'True', '', 'Metric', 'Conversions from when a customer clicks on an AdWords ad on one device, then converts on a different device or browser. Cross-device conversions are already included in your AllConversions column. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Ctr', 'CTR', 'ctr', 'Double', 'True', 'True', '', 'Metric', 'The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions). Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CustomerDescriptiveName', 'Client name', 'clientName', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer.'),
('Date', 'Day', 'day', 'Date', 'True', 'True', '', 'Segment', 'The date formatted as yyyy-MM-dd.'),
('DayOfWeek', 'Day of week', 'dayOfWeek', 'DayOfWeek', 'True', 'True', 'MONDAY / Monday\nTUESDAY / Tuesday\nWEDNESDAY / Wednesday\nTHURSDAY / Thursday\nFRIDAY / Friday\nSATURDAY / Saturday\nSUNDAY / Sunday\n', 'Segment', 'The name of the day of the week, e.g., "Monday".'),
('Device', 'Device', 'device', 'DeviceType', 'True', 'True', 'UNKNOWN / Other\nDESKTOP / Computers\nHIGH_END_MOBILE / Mobile devices with full browsers\nTABLET / Tablets with full browsers\n', 'Segment', 'Device type where the impression was shown.'),
('EndDate', 'End date', 'endDate', 'Date', 'True', 'True', '', 'Attribute', 'The end date of the campaign, formatted as yyyy-MM-dd.'),
('EngagementRate', 'Engagement rate', 'engagementRate', 'Double', 'True', 'True', '', 'Metric', 'How often people engage with your ad after it''s shown to them. This is the number of ad expansions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Engagements', 'Engagements', 'engagements', 'Long', 'True', 'True', '', 'Metric', 'The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics.'),
('EnhancedCpcEnabled', 'Enhanced CPC enabled', 'enhancedCPCEnabled', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if enhanced CPC is enabled on the bidding strategy.'),
('EnhancedCpvEnabled', 'Enhanced CPV enabled', 'enhancedCPVEnabled', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if enhanced CPV is enabled on the bidding strategy.'),
('ExternalConversionSource', 'Conversion source', 'conversionSource', 'ExternalConversionSource', 'True', 'False', 'UNKNOWN / Other\nWEBPAGE / Website\nANALYTICS / Analytics\nUPLOAD / Import from clicks\nAD_CALL_METRICS / Calls from ads\nOFFERS / Offers\nENGAGEMENT / Engagement ads\nWEBSITE_CALL_METRICS / Calls from website\nSTORE_VISITS / Store visits\nANDROID_IN_APP / Android in-app action\nANDROID_DOWNLOAD / Android app install (from Google Play)\nIOS_IN_APP / iOS in-app action\nIOS_FIRST_OPEN / iOS app install (first open)\nAPP_UNSPECIFIED / Mobile app\nANDROID_FIRST_OPEN / Android app install (first open)\nUPLOAD_CALLS / Import from calls\nFIREBASE / Firebase\nCLICK_TO_CALL / Phone number clicks\nSALESFORCE / Salesforce.com\nSTORE_SALES_CRM / Store sales (data partner)\nSTORE_SALES_PAYMENT_NETWORK / Store sales (payment network)\nGOOGLE_PLAY / Google Play\n', 'Segment', 'The source of conversion such as website, import from calls.'),
('ExternalCustomerId', 'Customer ID', 'customerID', 'Long', 'True', 'True', '', 'Attribute', 'The Customer ID.'),
('GmailForwards', 'Gmail forwards', 'gmailForwards', 'Long', 'True', 'True', '', 'Metric', 'The number of times your ad was forwarded to someone else as a message.'),
('GmailSaves', 'Gmail saves', 'gmailSaves', 'Long', 'True', 'True', '', 'Metric', 'The number of times someone has saved your Gmail ad to their inbox as a message.'),
('GmailSecondaryClicks', 'Gmail clicks to website', 'gmailClicksToWebsite', 'Long', 'True', 'True', '', 'Metric', 'The number of clicks to your landing page on the expanded state of Gmail ads.'),
('HourOfDay', 'Hour of day', 'hourOfDay', 'Integer', 'True', 'False', '', 'Segment', 'The hour of day as a number between 0 and 23, inclusive.'),
('ImpressionAssistedConversions', 'Impr. Assisted Conv.', 'imprAssistedConv', 'Long', 'True', 'True', '', 'Metric', 'Total number of conversions for which this object triggered assist impressions prior to the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('ImpressionAssistedConversionsOverLastClickConversions', 'Impr. Assisted Conv. / Last Click Conv.', 'imprAssistedConvLastClickConv', 'Double', 'True', 'True', '', 'Metric', 'Total number of conversions for which this object triggered assist impressions divided by the total number of conversions for which this object triggered the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ImpressionAssistedConversionValue', 'Impr. Assisted Conv. Value', 'imprAssistedConvValue', 'Double', 'True', 'True', '', 'Metric', 'Total value of all conversions for which this object triggered assist impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ImpressionReach', 'Unique cookies', 'uniqueCookies', 'Long', 'True', 'True', '', 'Metric', 'Number of unique cookies that were exposed to your ad over a given time period, or the special value "< 100" if the number of cookies is less than 100.'),
('Impressions', 'Impressions', 'impressions', 'Long', 'True', 'True', '', 'Metric', 'Count of how often your ad has appeared on a search results page or website on the Google Network.'),
('InteractionRate', 'Interaction Rate', 'interactionRate', 'Double', 'True', 'True', '', 'Metric', 'How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Interactions', 'Interactions', 'interactions', 'Long', 'True', 'True', '', 'Metric', 'The number of interactions. An interaction is the main user action associated with an ad formatâ€”clicks for text and shopping ads, views for video ads, and so on.'),
('InteractionTypes', 'Interaction Types', 'interactionTypes', 'EnumSet', 'True', 'True', '', 'Metric', 'The types of interactions that are reflected in the Interactions, InteractionRate, and AverageCost columns.'),
('InvalidClickRate', 'Invalid click rate', 'invalidClickRate', 'Double', 'True', 'True', '', 'Metric', 'The percentage ("x.xx%") of clicks filtered out of your total number of clicks (filtered + non-filtered clicks) during the reporting period.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('InvalidClicks', 'Invalid clicks', 'invalidClicks', 'Long', 'True', 'True', '', 'Metric', 'Number of clicks Google considers illegitimate and doesn''t charge you for.'),
('IsBudgetExplicitlyShared', 'Budget explicitly shared', 'budgetExplicitlyShared', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if the budget is a shared budget (true) or specific to the campaign (false).'),
('LabelIds', 'Label IDs', 'labelIDs', 'List', 'True', 'True', '', 'Attribute', 'List of label IDs for the main object of this row.\nList elements are returned in JSON list format.'),
('Labels', 'Labels', 'labels', 'List', 'True', 'True', '', 'Attribute', 'List of label names for the main object of this row.\nList elements are returned in JSON list format.'),
('Month', 'Month', 'month', 'String', 'True', 'True', '', 'Segment', 'The first day of the month, formatted as yyyy-MM-dd.'),
('MonthOfYear', 'Month of Year', 'monthOfYear', 'MonthOfYear', 'True', 'True', 'JANUARY / January\nFEBRUARY / February\nMARCH / March\nAPRIL / April\nMAY / May\nJUNE / June\nJULY / July\nAUGUST / August\nSEPTEMBER / September\nOCTOBER / October\nNOVEMBER / November\nDECEMBER / December\n', 'Segment', 'The name of the month of the year, e.g., "December".'),
('NumOfflineImpressions', 'Phone impressions', 'phoneImpressions', 'Long', 'True', 'True', '', 'Metric', 'Number of offline phone impressions.'),
('NumOfflineInteractions', 'Phone calls', 'phoneCalls', 'Long', 'True', 'True', '', 'Metric', 'Number of offline phone calls.'),
('OfflineInteractionRate', 'PTR', 'ptr', 'Double', 'True', 'True', '', 'Metric', 'Number of phone calls received (NumOfflineInteractions) divided by the number of times your phone number is shown (NumOfflineImpressions).\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('PercentNewVisitors', '% new sessions', 'newSessions', 'Double', 'True', 'True', '', 'Metric', 'Percentage of first-time sessions (from people who had never visited your site before), formatted as "x.xx%". Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Period', 'Budget period', 'budgetPeriod', 'BudgetPeriod', 'False', 'True', '', 'Attribute', 'Period over which to spend the budget.'),
('PrimaryCompanyName', 'Company name', 'companyName', 'String', 'True', 'True', '', 'Attribute', 'Company name of the account.'),
('Quarter', 'Quarter', 'quarter', 'String', 'True', 'True', '', 'Segment', 'The first day of the quarter, formatted as yyyy-MM-dd. Uses the calendar year for quarters, e.g., the second quarter of 2014 starts on 2014-04-01.'),
('RelativeCtr', 'Relative CTR', 'relativeCTR', 'Double', 'True', 'True', '', 'Metric', 'Your clickthrough rate (Ctr) divided by the average clickthrough rate of all advertisers on the websites that show your ads. Measures how your ads perform on Display Network sites compared to other ads on the same sites.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchBudgetLostImpressionShare', 'Search Lost IS (budget)', 'searchLostISBudget', 'Double', 'True', 'True', '', 'Metric', 'The estimated percent of times that your ad was eligible to show on the Search Network but didn''t because your budget was too low. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchExactMatchImpressionShare', 'Search Exact match IS', 'searchExactMatchIS', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received divided by the estimated number of impressions you were eligible to receive on the Search Network for search terms that matched your keywords exactly (or were close variants of your keyword), regardless of your keyword match types. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchImpressionShare', 'Search Impr. share', 'searchImprShare', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received on the Search Network divided by the estimated number of impressions you were eligible to receive. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchRankLostImpressionShare', 'Search Lost IS (rank)', 'searchLostISRank', 'Double', 'True', 'True', '', 'Metric', 'The estimated percentage of impressions on the Search Network that your ads didn''t receive due to poor Ad Rank. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ServingStatus', 'Campaign serving status', 'campaignServingStatus', 'ServingStatus', 'True', 'True', 'SERVING / eligible\nNONE / none\nENDED / ended\nPENDING / pending\nSUSPENDED / suspended\n', 'Attribute', 'Indicates if the Campaign is serving ads.'),
('Slot', 'Top vs. Other', 'topVsOther', 'Slot', 'True', 'True', 'SearchRhs / Google search: Side\nSearchTop / Google search: Top\nSearchOther / Google search: Other\nContent / Google Display Network\nAfsTop / Search partners: Top\nAfsOther / Search partners: Other\nUnknown / \n', 'Segment', 'The position of the Ad.'),
('StartDate', 'Start date', 'startDate', 'Date', 'True', 'True', '', 'Attribute', 'The start date of the campaign, formatted as yyyy-MM-dd'),
('TrackingUrlTemplate', 'Tracking template', 'trackingTemplate', 'String', 'True', 'True', '', 'Attribute', 'Tracking template of the main object of this row.'),
('UrlCustomParameters', 'Custom parameter', 'customParameter', 'CustomParameters', 'False', 'True', '', 'Attribute', 'Custom URL parameters of the main object of this row.\nCustomParameters elements are returned in JSON map format.'),
('ValuePerAllConversion', 'Value / all conv.', 'valueAllConv', 'Double', 'True', 'True', '', 'Metric', 'The value, on average, of all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ValuePerConversion', 'Value / conv.', 'valueConv', 'Double', 'True', 'True', '', 'Metric', 'The total value of your conversions divided by the total number of conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile100Rate', 'Video played to 100%', 'videoPlayedTo100', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched all of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile25Rate', 'Video played to 25%', 'videoPlayedTo25', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 25% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile50Rate', 'Video played to 50%', 'videoPlayedTo50', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 50% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile75Rate', 'Video played to 75%', 'videoPlayedTo75', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 75% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViewRate', 'View rate', 'viewRate', 'Double', 'True', 'True', '', 'Metric', 'The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViews', 'Views', 'views', 'Long', 'True', 'True', '', 'Metric', 'The number of times your video ads were viewed.'),
('ViewThroughConversions', 'View-through conv.', 'viewThroughConv', 'Long', 'True', 'True', '', 'Metric', 'The total number of view-through conversions. These happen when a customer sees a Display network ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('Week', 'Week', 'week', 'String', 'True', 'True', '', 'Segment', 'The date for the Monday of the week, formatted as yyyy-MM-dd.'),
('Year', 'Year', 'year', 'Integer', 'True', 'True', '', 'Segment', 'The year, formatted as yyyy.');

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
-- Struttura della tabella `api_keywords-performance-report`
--

CREATE TABLE IF NOT EXISTS `api_keywords-performance-report` (
  `Name` varchar(255) DEFAULT '',
  `DisplayName` varchar(255) DEFAULT '',
  `XMLAttribute` varchar(255) DEFAULT '',
  `Type` varchar(255) DEFAULT '',
  `Filterable` text,
  `SupportsZeroImpressions` varchar(255) DEFAULT '',
  `EnumValues` text,
  `Behavior` varchar(255) DEFAULT '',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `api_keywords-performance-report`
--

INSERT INTO `api_keywords-performance-report` (`Name`, `DisplayName`, `XMLAttribute`, `Type`, `Filterable`, `SupportsZeroImpressions`, `EnumValues`, `Behavior`, `Notes`) VALUES
('AccountCurrencyCode', 'Currency', 'currency', 'String', 'True', 'True', '', 'Attribute', 'The currency of the Customer account.'),
('AccountDescriptiveName', 'Account', 'account', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer account.'),
('AccountTimeZoneId', 'Time zone', 'timeZone', 'String', 'True', 'True', '', 'Attribute', 'Name of the timezone selected for the Customer account. For example: "(GMT-05:00) Eastern Time". This field does not reflect the current state of daylight saving time for the timezone.'),
('ActiveViewCpm', 'Active View avg. CPM', 'activeViewAvgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average cost of viewable impressions (ActiveViewImpressions).'),
('ActiveViewCtr', 'Active View viewable CTR', 'activeViewViewableCTR', 'Double', 'True', 'True', '', 'Metric', 'How often people clicked your ad after it became viewable.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewImpressions', 'Active View viewable impressions', 'activeViewViewableImpressions', 'Long', 'True', 'True', '', 'Metric', 'How often your ad has become viewable on a Display Network site.'),
('ActiveViewMeasurability', 'Active View measurable impr. / impr.', 'activeViewMeasurableImprImpr', 'Double', 'True', 'True', '', 'Metric', 'The ratio of impressions that could be measured by Active View over the number of served impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewMeasurableCost', 'Active View measurable cost', 'activeViewMeasurableCost', 'Money', 'True', 'True', '', 'Metric', 'The cost of the impressions you received that were measurable by Active View.'),
('ActiveViewMeasurableImpressions', 'Active View measurable impr.', 'activeViewMeasurableImpr', 'Long', 'True', 'True', '', 'Metric', 'The number of times your ads are appearing on placements in positions where they can be seen.'),
('ActiveViewViewability', 'Active View viewable impr. / measurable impr.', 'activeViewViewableImprMeasurableImpr', 'Double', 'True', 'True', '', 'Metric', 'The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions).\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AdGroupId', 'Ad group ID', 'adGroupID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the AdGroup.'),
('AdGroupName', 'Ad group', 'adGroup', 'String', 'True', 'True', '', 'Attribute', 'The name of the AdGroup.'),
('AdGroupStatus', 'Ad group state', 'adGroupState', 'AdGroupStatus', 'True', 'True', 'UNKNOWN / unknown\nENABLED / enabled\nPAUSED / paused\nREMOVED / removed\n', 'Attribute', 'Status of the ad group.'),
('AdNetworkType1', 'Network', 'network', 'AdNetworkType1', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Search Network\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'First level network type.'),
('AdNetworkType2', 'Network (with search partners)', 'networkWithSearchPartners', 'AdNetworkType2', 'True', 'True', 'UNKNOWN / unknown\nSEARCH / Google search\nSEARCH_PARTNERS / Search partners\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'Second level network type (includes search partners).'),
('AllConversionRate', 'All conv. rate', 'allConvRate', 'Double', 'True', 'True', '', 'Metric', 'AllConversions divided by total clicks that can be conversion-tracked. This is how often a click on your ad resulted in a conversion. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversions', 'All conv.', 'allConv', 'Double', 'True', 'True', '', 'Metric', 'Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversionValue', 'All conv. value', 'allConvValue', 'Double', 'True', 'True', '', 'Metric', 'The total value of all of your conversions, including those that are estimated.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ApprovalStatus', 'Approval Status', 'approvalStatus', 'ApprovalStatus', 'True', 'True', 'APPROVED / approved\nPENDING_REVIEW / pending review\nUNDER_REVIEW / under review\nDISAPPROVED / disapproved\n', 'Attribute', 'Approval status of the criterion.'),
('AverageCost', 'Avg. Cost', 'avgCost', 'Money', 'True', 'True', '', 'Metric', 'The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions.'),
('AverageCpc', 'Avg. CPC', 'avgCPC', 'Money', 'True', 'True', '', 'Metric', 'The total cost of all clicks divided by the total number of clicks received.'),
('AverageCpe', 'Avg. CPE', 'avgCPE', 'Double', 'True', 'True', '', 'Metric', 'The average amount that youâ€™ve been charged for an ad engagement. This amount is the total cost of all ad engagements divided by the total number of ad engagements.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageCpm', 'Avg. CPM', 'avgCPM', 'Money', 'True', 'True', '', 'Metric', 'Average Cost-per-thousand impressions (CPM).'),
('AverageCpv', 'Avg. CPV', 'avgCPV', 'Double', 'True', 'True', '', 'Metric', 'The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AveragePageviews', 'Pages / session', 'pagesSession', 'Double', 'True', 'True', '', 'Metric', 'Average number of pages viewed per session. Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AveragePosition', 'Avg. position', 'avgPosition', 'Double', 'True', 'True', '', 'Metric', 'Your ad''s position relative to those of other advertisers.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageTimeOnSite', 'Avg. session duration (seconds)', 'avgSessionDurationSeconds', 'Double', 'True', 'True', '', 'Metric', 'Total duration of all sessions (in seconds) / number of sessions. Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('BaseAdGroupId', 'Base Ad group ID', 'baseAdGroupID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of base ad group of trial ad groups. For regular ad groups, this is equal to AdGroupId.'),
('BaseCampaignId', 'Base Campaign ID', 'baseCampaignID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of base campaign of trial campaigns. For regular campaigns, this is equal to CampaignId.'),
('BiddingStrategyId', 'Bid Strategy ID', 'bidStrategyID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the BiddingStrategyConfiguration.'),
('BiddingStrategyName', 'Bid Strategy Name', 'bidStrategyName', 'String', 'True', 'True', '', 'Attribute', 'The name of the BiddingStrategyConfiguration.'),
('BiddingStrategySource', 'Bidding Strategy Source', 'biddingStrategySource', 'BiddingStrategySource', 'True', 'True', 'CAMPAIGN / campaign\nADGROUP / ad group\nCRITERION / ad group criterion\n', 'Attribute', 'Indicates where the bidding strategy is associated i.e. campaign, ad group or ad group criterion.'),
('BiddingStrategyType', 'Bid Strategy Type', 'bidStrategyType', 'BiddingStrategyType', 'True', 'True', 'BUDGET_OPTIMIZER / auto\nCONVERSION_OPTIMIZER / max/target cpa\nMANUAL_CPC / cpc\nMANUAL_CPV / cpv\nMANUAL_CPM / cpm\nPAGE_ONE_PROMOTED / Target search page location\nTARGET_SPEND / Maximize clicks\nENHANCED_CPC / Enhanced CPC\nTARGET_CPA / Target CPA\nTARGET_ROAS / Target ROAS\nTARGET_OUTRANK_SHARE / Target Outranking Share\nNONE / None\nUNKNOWN / unknown\n', 'Attribute', 'The type of the BiddingStrategyConfiguration.'),
('BidType', 'Conversion optimizer bid type', 'conversionOptimizerBidType', 'BidType', 'True', 'True', 'TARGET_CPA / target cpa\n', 'Attribute', 'The bid type.'),
('BounceRate', 'Bounce rate', 'bounceRate', 'Double', 'True', 'True', '', 'Metric', 'Percentage of clicks where the user only visited a single page on your site, formatted as "x.xx%". Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CampaignId', 'Campaign ID', 'campaignID', 'Long', 'True', 'True', '', 'Attribute', 'The ID of the Campaign.'),
('CampaignName', 'Campaign', 'campaign', 'String', 'True', 'True', '', 'Attribute', 'The name of the Campaign.'),
('CampaignStatus', 'Campaign state', 'campaignState', 'CampaignStatus', 'True', 'True', 'UNKNOWN / unknown\nENABLED / enabled\nPAUSED / paused\nREMOVED / removed\n', 'Attribute', 'The status of the Campaign.'),
('ClickAssistedConversions', 'Click Assisted Conv.', 'clickAssistedConv', 'Long', 'True', 'True', '', 'Metric', 'The total number of conversions for which this keyword, ad, ad group, or campaign contributed one or more assist clicks. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('ClickAssistedConversionsOverLastClickConversions', 'Click Assisted Conv. / Last Click Conv.', 'clickAssistedConvLastClickConv', 'Double', 'True', 'True', '', 'Metric', 'The total number of conversions for which this keyword, ad, ad group, or campaign received assist clicks divided by the total number of conversions for which it triggered the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ClickAssistedConversionValue', 'Click Assisted Conv. Value', 'clickAssistedConvValue', 'Double', 'True', 'True', '', 'Metric', 'The total value of all conversions for which this keyword, ad, ad group, or campaign triggered assist clicks.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Clicks', 'Clicks', 'clicks', 'Long', 'True', 'True', '', 'Metric', 'The number of clicks.'),
('ClickType', 'Click type', 'clickType', 'ClickType', 'True', 'False', 'URL_CLICKS / Headline\nCALLS / Phone calls\nOTHER / Other\nPRODUCT_EXTENSION_CLICKS / Product plusbox offer\nSITELINKS / Sitelink\nPRODUCT_LISTING_AD_CLICKS / Shopping ad - Standard\nGET_DIRECTIONS / Driving direction\nOFFER_PRINTS / Print offer\nBREADCRUMBS / Breadcrumbs\nCALL_TRACKING / Manually dialed phone calls\nMOBILE_CALL_TRACKING / Mobile phone calls\nLOCATION_EXPANSION / Get location details\nSTORE_LOCATOR / Show nearby locations\nAPP_DEEPLINK / App engagement ad deep link\nTABLE_EXTENSION / Table Extension\nVIDEO_WEBSITE_CLICKS / Website\nVIDEO_CALL_TO_ACTION_CLICKS / Call-to-Action overlay\nVIDEO_APP_STORE_CLICKS / App store\nVIDEO_CARD_ACTION_HEADLINE_CLICKS / Cards\nVIDEO_END_CAP_CLICKS / End cap\nCLICK_ON_ENGAGEMENT_AD / Click on engagement ad\nLOCATION_FORMAT_MAP / Map\nLOCATION_FORMAT_LANDING_PAGE / Go to landing page\nLOCATION_FORMAT_STORE_INFO / Go to store info\nLOCATION_FORMAT_DIRECTIONS / Directions\nLOCATION_FORMAT_CALL / Call\nLOCATION_FORMAT_TEXT / Text\nLOCATION_FORMAT_IMAGE / Image(s)\nBROADBAND_PLAN / Broadband Plan\nWIRELESS_PLAN / Wireless Plan\nVISUAL_SITELINKS / Visual Sitelinks\nUNKNOWN / unknown\n', 'Segment', 'The Impressions field will reflect how often the ad was served with that click type available. Since ads can serve with multiple click types displayed, impressions may be double counted and the totals may not be accurate.'),
('ConversionCategoryName', 'Conversion category', 'conversionCategory', 'String', 'True', 'False', '', 'Segment', 'A category that describes the action the user will take to complete a conversion. Prevents zero-conversion rows from being returned. Values: "Download", "Lead", "Purchase/Sale", "Signup", "View of a key page", and "Other".'),
('ConversionRate', 'Conv. rate', 'convRate', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions divided by total clicks that can be tracked to conversions. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Conversions', 'Conversions', 'conversions', 'Double', 'True', 'True', '', 'Metric', 'The number of conversions for all conversion actions that you have opted into optimization. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ConversionTrackerId', 'Conversion Tracker Id', 'conversionTrackerId', 'Long', 'True', 'False', '', 'Segment', 'ID of the conversion tracker.'),
('ConversionTypeName', 'Conversion name', 'conversionName', 'String', 'True', 'False', '', 'Segment', 'The name of the conversion type. Prevents zero-conversion rows from being returned.'),
('ConversionValue', 'Total conv. value', 'totalConvValue', 'Double', 'True', 'True', '', 'Metric', 'The sum of conversion values for all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Cost', 'Cost', 'cost', 'Money', 'True', 'True', '', 'Metric', 'The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.'),
('CostPerAllConversion', 'Cost / all conv.', 'costAllConv', 'Money', 'True', 'True', '', 'Metric', 'Total cost divided by all conversions.'),
('CostPerConversion', 'Cost / conv.', 'costConv', 'Money', 'True', 'True', '', 'Metric', 'The Cost attributable to conversion-tracked clicks divided by the number of conversions'),
('CpcBid', 'Max. CPC', 'maxCPC', 'Money', 'True', 'True', '', 'Attribute', 'Cost per click bid. Values can be one of: a) a money amount in micros, b) "auto: x" or "auto" if AdWords is automatically setting the bid via the chosen bidding strategy, or c) "--" if no CPC bid applies to the row.'),
('CpcBidSource', 'Max CPC source', 'maxCPCSource', 'BidSource', 'True', 'True', 'ADGROUP / ad groups\nCRITERION / ad group criteria\nADGROUP_BIDDING_STRATEGY / ad group bidding strategy\nCAMPAIGN_BIDDING_STRATEGY / campaign bidding strategy\n', 'Attribute', 'Source of the CPC bid.'),
('CpmBid', 'Max. CPM', 'maxCPM', 'Money', 'True', 'True', '', 'Attribute', 'CPM (cost per thousand impressions) bid.'),
('CreativeQualityScore', 'Ad relevance', 'adRelevance', 'QualityScoreBucket', 'True', 'True', 'UNKNOWN / Not applicable\nBELOW_AVERAGE / Below average\nAVERAGE / Average\nABOVE_AVERAGE / Above average\n', 'Attribute', 'The quality score of the ad.'),
('Criteria', 'Keyword', 'keyword', 'String', 'True', 'True', '', 'Attribute', 'Descriptive string for the Criterion. For more information on the format of criteria types in reports, see <a href=''https://developers.google.com/adwords/api/docs/guides/reporting#criteria_prefixes''>the <b>Criteria prefixes</b> section of the reporting guide</a>.'),
('CriteriaDestinationUrl', 'Destination URL', 'destinationURL', 'String', 'True', 'True', '', 'Attribute', 'Destination URL of the criterion that triggered ads.'),
('CrossDeviceConversions', 'Cross-device conv.', 'crossDeviceConv', 'Double', 'True', 'True', '', 'Metric', 'Conversions from when a customer clicks on an AdWords ad on one device, then converts on a different device or browser. Cross-device conversions are already included in your AllConversions column. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Ctr', 'CTR', 'ctr', 'Double', 'True', 'True', '', 'Metric', 'The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions). Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CustomerDescriptiveName', 'Client name', 'clientName', 'String', 'True', 'True', '', 'Attribute', 'The descriptive name of the Customer.'),
('Date', 'Day', 'day', 'Date', 'True', 'True', '', 'Segment', 'The date formatted as yyyy-MM-dd.'),
('DayOfWeek', 'Day of week', 'dayOfWeek', 'DayOfWeek', 'True', 'True', 'MONDAY / Monday\nTUESDAY / Tuesday\nWEDNESDAY / Wednesday\nTHURSDAY / Thursday\nFRIDAY / Friday\nSATURDAY / Saturday\nSUNDAY / Sunday\n', 'Segment', 'The name of the day of the week, e.g., "Monday".'),
('Device', 'Device', 'device', 'DeviceType', 'True', 'True', 'UNKNOWN / Other\nDESKTOP / Computers\nHIGH_END_MOBILE / Mobile devices with full browsers\nTABLET / Tablets with full browsers\n', 'Segment', 'Device type where the impression was shown.'),
('EngagementRate', 'Engagement rate', 'engagementRate', 'Double', 'True', 'True', '', 'Metric', 'How often people engage with your ad after it''s shown to them. This is the number of ad expansions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Engagements', 'Engagements', 'engagements', 'Long', 'True', 'True', '', 'Metric', 'The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics.'),
('EnhancedCpcEnabled', 'Enhanced CPC enabled', 'enhancedCPCEnabled', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if enhanced CPC is enabled on the bidding strategy.'),
('EstimatedAddClicksAtFirstPositionCpc', 'Est. add. clicks/wk (first position bid)', 'estAddClicksWkFirstPositionBid', 'Long', 'True', 'True', '', 'Attribute', 'Estimate of how many clicks per week you might get by changing your keyword bid to the value in FirstPositionCpc.'),
('EstimatedAddCostAtFirstPositionCpc', 'Est. add. cost/wk (first position bid)', 'estAddCostWkFirstPositionBid', 'Money', 'True', 'True', '', 'Attribute', 'Estimate of how your cost per week might change when changing your keyword bid to the value in FirstPositionCpc.'),
('ExternalConversionSource', 'Conversion source', 'conversionSource', 'ExternalConversionSource', 'True', 'False', 'UNKNOWN / Other\nWEBPAGE / Website\nANALYTICS / Analytics\nUPLOAD / Import from clicks\nAD_CALL_METRICS / Calls from ads\nOFFERS / Offers\nENGAGEMENT / Engagement ads\nWEBSITE_CALL_METRICS / Calls from website\nSTORE_VISITS / Store visits\nANDROID_IN_APP / Android in-app action\nANDROID_DOWNLOAD / Android app install (from Google Play)\nIOS_IN_APP / iOS in-app action\nIOS_FIRST_OPEN / iOS app install (first open)\nAPP_UNSPECIFIED / Mobile app\nANDROID_FIRST_OPEN / Android app install (first open)\nUPLOAD_CALLS / Import from calls\nFIREBASE / Firebase\nCLICK_TO_CALL / Phone number clicks\nSALESFORCE / Salesforce.com\nSTORE_SALES_CRM / Store sales (data partner)\nSTORE_SALES_PAYMENT_NETWORK / Store sales (payment network)\nGOOGLE_PLAY / Google Play\n', 'Segment', 'The source of conversion such as website, import from calls.'),
('ExternalCustomerId', 'Customer ID', 'customerID', 'Long', 'True', 'True', '', 'Attribute', 'The Customer ID.'),
('FinalAppUrls', 'App final URL', 'appFinalURL', 'AppUrlList', 'True', 'True', '', 'Attribute', 'List of final app URLs of the main object of this row. List entries will start with one of: a) "android-app:" (for Android apps) or b) "os-app:" (for iOS apps).\nAppUrlList elements are returned in JSON list format.'),
('FinalMobileUrls', 'Mobile final URL', 'mobileFinalURL', 'UrlList', 'True', 'True', '', 'Attribute', 'List of final mobile URLs of the main object of this row.\nUrlList elements are returned in JSON list format.'),
('FinalUrls', 'Final URL', 'finalURL', 'UrlList', 'True', 'True', '', 'Attribute', 'List of final URLs of the main object of this row.\nUrlList elements are returned in JSON list format.'),
('FirstPageCpc', 'First page CPC', 'firstPageCPC', 'Bid', 'True', 'True', '', 'Attribute', 'Estimate of the CPC bid required in order to show your ad on the first page of search results.\nUsually a number in micros, but may be prefixed with "auto: " or may simply be the string "auto" if automatic bidding is used.'),
('FirstPositionCpc', 'First position CPC', 'firstPositionCPC', 'Bid', 'True', 'True', '', 'Attribute', 'Estimate of the amount you might need to pay for your ad to be displayed in the first position at the top of the first page of Google search results.\nUsually a number in micros, but may be prefixed with "auto: " or may simply be the string "auto" if automatic bidding is used.'),
('GmailForwards', 'Gmail forwards', 'gmailForwards', 'Long', 'True', 'True', '', 'Metric', 'The number of times your ad was forwarded to someone else as a message.'),
('GmailSaves', 'Gmail saves', 'gmailSaves', 'Long', 'True', 'True', '', 'Metric', 'The number of times someone has saved your Gmail ad to their inbox as a message.'),
('GmailSecondaryClicks', 'Gmail clicks to website', 'gmailClicksToWebsite', 'Long', 'True', 'True', '', 'Metric', 'The number of clicks to your landing page on the expanded state of Gmail ads.'),
('HasQualityScore', 'Has Quality Score', 'hasQualityScore', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Whether the QualityScore field of the criterion has value. Use this field in a report request predicate to include or exclude criteria with or without a value for the QualityScore field.'),
('Id', 'Keyword ID', 'keywordID', 'Long', 'True', 'True', '', 'Attribute', 'ID of the main object of this row.'),
('ImpressionAssistedConversions', 'Impr. Assisted Conv.', 'imprAssistedConv', 'Long', 'True', 'True', '', 'Metric', 'Total number of conversions for which this object triggered assist impressions prior to the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('ImpressionAssistedConversionsOverLastClickConversions', 'Impr. Assisted Conv. / Last Click Conv.', 'imprAssistedConvLastClickConv', 'Double', 'True', 'True', '', 'Metric', 'Total number of conversions for which this object triggered assist impressions divided by the total number of conversions for which this object triggered the last click. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ImpressionAssistedConversionValue', 'Impr. Assisted Conv. Value', 'imprAssistedConvValue', 'Double', 'True', 'True', '', 'Metric', 'Total value of all conversions for which this object triggered assist impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Impressions', 'Impressions', 'impressions', 'Long', 'True', 'True', '', 'Metric', 'Count of how often your ad has appeared on a search results page or website on the Google Network.'),
('InteractionRate', 'Interaction Rate', 'interactionRate', 'Double', 'True', 'True', '', 'Metric', 'How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Interactions', 'Interactions', 'interactions', 'Long', 'True', 'True', '', 'Metric', 'The number of interactions. An interaction is the main user action associated with an ad formatâ€”clicks for text and shopping ads, views for video ads, and so on.'),
('InteractionTypes', 'Interaction Types', 'interactionTypes', 'EnumSet', 'True', 'True', '', 'Metric', 'The types of interactions that are reflected in the Interactions, InteractionRate, and AverageCost columns.'),
('IsNegative', 'Is negative', 'isNegative', 'Enum', 'True', 'True', 'TRUE / true\nFALSE / false\n', 'Attribute', 'Indicates if the criterion for this row is a negative (exclusion) criterion.'),
('KeywordMatchType', 'Match type', 'matchType', 'KeywordMatchType', 'True', 'True', 'EXACT / Exact\nPHRASE / Phrase\nBROAD / Broad\n', 'Attribute', 'The match type for the Keyword.'),
('LabelIds', 'Label IDs', 'labelIDs', 'List', 'True', 'True', '', 'Attribute', 'List of label IDs for the main object of this row.\nList elements are returned in JSON list format.'),
('Labels', 'Labels', 'labels', 'List', 'True', 'True', '', 'Attribute', 'List of label names for the main object of this row.\nList elements are returned in JSON list format.'),
('Month', 'Month', 'month', 'String', 'True', 'True', '', 'Segment', 'The first day of the month, formatted as yyyy-MM-dd.'),
('MonthOfYear', 'Month of Year', 'monthOfYear', 'MonthOfYear', 'True', 'True', 'JANUARY / January\nFEBRUARY / February\nMARCH / March\nAPRIL / April\nMAY / May\nJUNE / June\nJULY / July\nAUGUST / August\nSEPTEMBER / September\nOCTOBER / October\nNOVEMBER / November\nDECEMBER / December\n', 'Segment', 'The name of the month of the year, e.g., "December".'),
('PercentNewVisitors', '% new sessions', 'newSessions', 'Double', 'True', 'True', '', 'Metric', 'Percentage of first-time sessions (from people who had never visited your site before), formatted as "x.xx%". Imported from Google Analytics.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('PostClickQualityScore', 'Landing page experience', 'landingPageExperience', 'QualityScoreBucket', 'True', 'True', 'UNKNOWN / Not applicable\nBELOW_AVERAGE / Below average\nAVERAGE / Average\nABOVE_AVERAGE / Above average\n', 'Attribute', 'The quality score of the landing page.'),
('PrimaryCompanyName', 'Company name', 'companyName', 'String', 'True', 'True', '', 'Attribute', 'Company name of the account.'),
('QualityScore', 'Quality score', 'qualityScore', 'Integer', 'True', 'True', '', 'Attribute', 'The quality score of the AdGroupCriterion. Ranges from 1 (lowest) to 10 (highest). If quality score information is missing, then "--" will be returned. You can filter using the "HasQualityScore" column to include or exclude criteria with or without a value for the QualityScore field. See the <a href=''https://developers.google.com/adwords/api/docs/guides/reporting-concepts#quality_score_in_reports''>reporting concepts</a> guide for more details.'),
('Quarter', 'Quarter', 'quarter', 'String', 'True', 'True', '', 'Segment', 'The first day of the quarter, formatted as yyyy-MM-dd. Uses the calendar year for quarters, e.g., the second quarter of 2014 starts on 2014-04-01.'),
('SearchExactMatchImpressionShare', 'Search Exact match IS', 'searchExactMatchIS', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received divided by the estimated number of impressions you were eligible to receive on the Search Network for search terms that matched your keywords exactly (or were close variants of your keyword), regardless of your keyword match types. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchImpressionShare', 'Search Impr. share', 'searchImprShare', 'Double', 'True', 'True', '', 'Metric', 'The impressions you''ve received on the Search Network divided by the estimated number of impressions you were eligible to receive. A percentage returned as "xx.xx%", or the special value "< 10%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('SearchPredictedCtr', 'Expected clickthrough rate', 'expectedClickthroughRate', 'QualityScoreBucket', 'True', 'True', 'UNKNOWN / Not applicable\nBELOW_AVERAGE / Below average\nAVERAGE / Average\nABOVE_AVERAGE / Above average\n', 'Attribute', 'Clickthrough rate compared to that of other advertisers.'),
('SearchRankLostImpressionShare', 'Search Lost IS (rank)', 'searchLostISRank', 'Double', 'True', 'True', '', 'Metric', 'The estimated percentage of impressions on the Search Network that your ads didn''t receive due to poor Ad Rank. A percentage returned as "xx.xx%", or the special value "> 90%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Slot', 'Top vs. Other', 'topVsOther', 'Slot', 'True', 'True', 'SearchRhs / Google search: Side\nSearchTop / Google search: Top\nSearchOther / Google search: Other\nContent / Google Display Network\nAfsTop / Search partners: Top\nAfsOther / Search partners: Other\nUnknown / \n', 'Segment', 'The position of the Ad.'),
('Status', 'Keyword state', 'keywordState', 'UserStatus', 'True', 'True', 'ENABLED / enabled\nREMOVED / removed\nPAUSED / paused\n', 'Attribute', 'The status of the main object in this row. For example, in a Campaign Performance Report this will be the status of each row''s Campaign. In an Ad Group Performance Report this will be the status of each row''s AdGroup.'),
('SystemServingStatus', 'Criterion serving status', 'criterionServingStatus', 'SystemServingStatus', 'True', 'True', 'ELIGIBLE / eligible\nRARELY_SERVED / low search volume\n', 'Attribute', 'Serving status of the criterion.'),
('TopOfPageCpc', 'Top of page CPC', 'topOfPageCPC', 'Bid', 'True', 'True', '', 'Attribute', 'Estimate of the CPC bid required in order to show your ad on the top of the first page of search results.\nUsually a number in micros, but may be prefixed with "auto: " or may simply be the string "auto" if automatic bidding is used.'),
('TrackingUrlTemplate', 'Tracking template', 'trackingTemplate', 'String', 'True', 'True', '', 'Attribute', 'Tracking template of the main object of this row.'),
('UrlCustomParameters', 'Custom parameter', 'customParameter', 'CustomParameters', 'True', 'True', '', 'Attribute', 'Custom URL parameters of the main object of this row.\nCustomParameters elements are returned in JSON map format.'),
('ValuePerAllConversion', 'Value / all conv.', 'valueAllConv', 'Double', 'True', 'True', '', 'Metric', 'The value, on average, of all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ValuePerConversion', 'Value / conv.', 'valueConv', 'Double', 'True', 'True', '', 'Metric', 'The total value of your conversions divided by the total number of conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile100Rate', 'Video played to 100%', 'videoPlayedTo100', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched all of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile25Rate', 'Video played to 25%', 'videoPlayedTo25', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 25% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile50Rate', 'Video played to 50%', 'videoPlayedTo50', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 50% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile75Rate', 'Video played to 75%', 'videoPlayedTo75', 'Double', 'True', 'True', '', 'Metric', 'Percentage of impressions where the viewer watched 75% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViewRate', 'View rate', 'viewRate', 'Double', 'True', 'True', '', 'Metric', 'The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViews', 'Views', 'views', 'Long', 'True', 'True', '', 'Metric', 'The number of times your video ads were viewed.'),
('ViewThroughConversions', 'View-through conv.', 'viewThroughConv', 'Long', 'True', 'True', '', 'Metric', 'The total number of view-through conversions. These happen when a customer sees a Display network ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('Week', 'Week', 'week', 'String', 'True', 'True', '', 'Segment', 'The date for the Monday of the week, formatted as yyyy-MM-dd.'),
('Year', 'Year', 'year', 'Integer', 'True', 'True', '', 'Segment', 'The year, formatted as yyyy.');

-- --------------------------------------------------------

--
-- Struttura della tabella `api_url-performance-report`
--

CREATE TABLE IF NOT EXISTS `api_url-performance-report` (
  `Name` varchar(255) DEFAULT '',
  `DisplayName` varchar(255) DEFAULT '',
  `XMLAttribute` varchar(255) DEFAULT '',
  `Type` varchar(255) DEFAULT '',
  `Filterable` text,
  `SupportsZeroImpressions` varchar(255) DEFAULT '',
  `EnumValues` text,
  `Behavior` varchar(255) DEFAULT '',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `api_url-performance-report`
--

INSERT INTO `api_url-performance-report` (`Name`, `DisplayName`, `XMLAttribute`, `Type`, `Filterable`, `SupportsZeroImpressions`, `EnumValues`, `Behavior`, `Notes`) VALUES
('AccountCurrencyCode', 'Currency', 'currency', 'String', 'True', 'False', '', 'Attribute', 'The currency of the Customer account.'),
('AccountDescriptiveName', 'Account', 'account', 'String', 'True', 'False', '', 'Attribute', 'The descriptive name of the Customer account.'),
('AccountTimeZoneId', 'Time zone', 'timeZone', 'String', 'True', 'False', '', 'Attribute', 'Name of the timezone selected for the Customer account. For example: "(GMT-05:00) Eastern Time". This field does not reflect the current state of daylight saving time for the timezone.'),
('ActiveViewCpm', 'Active View avg. CPM', 'activeViewAvgCPM', 'Money', 'True', 'False', '', 'Metric', 'Average cost of viewable impressions (ActiveViewImpressions).'),
('ActiveViewCtr', 'Active View viewable CTR', 'activeViewViewableCTR', 'Double', 'True', 'False', '', 'Metric', 'How often people clicked your ad after it became viewable.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewImpressions', 'Active View viewable impressions', 'activeViewViewableImpressions', 'Long', 'True', 'False', '', 'Metric', 'How often your ad has become viewable on a Display Network site.'),
('ActiveViewMeasurability', 'Active View measurable impr. / impr.', 'activeViewMeasurableImprImpr', 'Double', 'True', 'False', '', 'Metric', 'The ratio of impressions that could be measured by Active View over the number of served impressions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ActiveViewMeasurableCost', 'Active View measurable cost', 'activeViewMeasurableCost', 'Money', 'True', 'False', '', 'Metric', 'The cost of the impressions you received that were measurable by Active View.'),
('ActiveViewMeasurableImpressions', 'Active View measurable impr.', 'activeViewMeasurableImpr', 'Long', 'True', 'False', '', 'Metric', 'The number of times your ads are appearing on placements in positions where they can be seen.'),
('ActiveViewViewability', 'Active View viewable impr. / measurable impr.', 'activeViewViewableImprMeasurableImpr', 'Double', 'True', 'False', '', 'Metric', 'The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions).\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AdFormat', 'Ad type', 'adType', 'AdFormat', 'True', 'False', 'UNKNOWN / unknown\nTEXT / text\nIMAGE / image\nDYNAMIC_IMAGE / dynamic_image\nFLASH / flash\nVIDEO / video\nHTML / html\nAUDIO / audio\nCOMPOSITE / composite\nPRINT / print\n', 'Segment', 'The underlying media format of the ad. Values can be one of the <b>formats</b> on the <a href=''https://developers.google.com/adwords/api/docs/appendix/templateads''>Template Ads</a> page, or a <a href=''https://developers.google.com/adwords/api/docs/reference/latest/AdGroupAdService.Media.MediaType''>MediaType</a> enum.'),
('AdGroupCriterionStatus', 'Keyword/Placement state', 'keywordPlacementState', 'UserStatus', 'True', 'False', 'ENABLED / enabled\nREMOVED / removed\nPAUSED / paused\n', 'Attribute', 'Status of the ad group criterion (keyword, placement, etc.).'),
('AdGroupId', 'Ad group ID', 'adGroupID', 'Long', 'True', 'False', '', 'Attribute', 'The ID of the AdGroup.'),
('AdGroupName', 'Ad group', 'adGroup', 'String', 'True', 'False', '', 'Attribute', 'The name of the AdGroup.'),
('AdGroupStatus', 'Ad group state', 'adGroupState', 'AdGroupStatus', 'True', 'False', 'UNKNOWN / unknown\nENABLED / enabled\nPAUSED / paused\nREMOVED / removed\n', 'Attribute', 'Status of the ad group.'),
('AdNetworkType1', 'Network', 'network', 'AdNetworkType1', 'True', 'False', 'UNKNOWN / unknown\nSEARCH / Search Network\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'First level network type.'),
('AdNetworkType2', 'Network (with search partners)', 'networkWithSearchPartners', 'AdNetworkType2', 'True', 'False', 'UNKNOWN / unknown\nSEARCH / Google search\nSEARCH_PARTNERS / Search partners\nCONTENT / Display Network\nYOUTUBE_SEARCH / YouTube Search\nYOUTUBE_WATCH / YouTube Videos\n', 'Segment', 'Second level network type (includes search partners).'),
('AllConversionRate', 'All conv. rate', 'allConvRate', 'Double', 'True', 'False', '', 'Metric', 'AllConversions divided by total clicks that can be conversion-tracked. This is how often a click on your ad resulted in a conversion. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversions', 'All conv.', 'allConv', 'Double', 'True', 'False', '', 'Metric', 'Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AllConversionValue', 'All conv. value', 'allConvValue', 'Double', 'True', 'False', '', 'Metric', 'The total value of all of your conversions, including those that are estimated.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageCost', 'Avg. Cost', 'avgCost', 'Money', 'True', 'False', '', 'Metric', 'The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions.'),
('AverageCpc', 'Avg. CPC', 'avgCPC', 'Money', 'True', 'False', '', 'Metric', 'The total cost of all clicks divided by the total number of clicks received.'),
('AverageCpe', 'Avg. CPE', 'avgCPE', 'Double', 'True', 'False', '', 'Metric', 'The average amount that youâ€™ve been charged for an ad engagement. This amount is the total cost of all ad engagements divided by the total number of ad engagements.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('AverageCpm', 'Avg. CPM', 'avgCPM', 'Money', 'True', 'False', '', 'Metric', 'Average Cost-per-thousand impressions (CPM).'),
('AverageCpv', 'Avg. CPV', 'avgCPV', 'Double', 'True', 'False', '', 'Metric', 'The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CampaignId', 'Campaign ID', 'campaignID', 'Long', 'True', 'False', '', 'Attribute', 'The ID of the Campaign.'),
('CampaignName', 'Campaign', 'campaign', 'String', 'True', 'False', '', 'Attribute', 'The name of the Campaign.'),
('CampaignStatus', 'Campaign state', 'campaignState', 'CampaignStatus', 'True', 'False', 'UNKNOWN / unknown\nENABLED / enabled\nPAUSED / paused\nREMOVED / removed\n', 'Attribute', 'The status of the Campaign.'),
('Clicks', 'Clicks', 'clicks', 'Long', 'True', 'False', '', 'Metric', 'The number of clicks.'),
('ConversionCategoryName', 'Conversion category', 'conversionCategory', 'String', 'True', 'False', '', 'Segment', 'A category that describes the action the user will take to complete a conversion. Prevents zero-conversion rows from being returned. Values: "Download", "Lead", "Purchase/Sale", "Signup", "View of a key page", and "Other".'),
('ConversionRate', 'Conv. rate', 'convRate', 'Double', 'True', 'False', '', 'Metric', 'The number of conversions divided by total clicks that can be tracked to conversions. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Conversions', 'Conversions', 'conversions', 'Double', 'True', 'False', '', 'Metric', 'The number of conversions for all conversion actions that you have opted into optimization. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ConversionTrackerId', 'Conversion Tracker Id', 'conversionTrackerId', 'Long', 'True', 'False', '', 'Segment', 'ID of the conversion tracker.'),
('ConversionTypeName', 'Conversion name', 'conversionName', 'String', 'True', 'False', '', 'Segment', 'The name of the conversion type. Prevents zero-conversion rows from being returned.'),
('ConversionValue', 'Total conv. value', 'totalConvValue', 'Double', 'True', 'False', '', 'Metric', 'The sum of conversion values for all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Cost', 'Cost', 'cost', 'Money', 'True', 'False', '', 'Metric', 'The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.'),
('CostPerAllConversion', 'Cost / all conv.', 'costAllConv', 'Money', 'True', 'False', '', 'Metric', 'Total cost divided by all conversions.'),
('CostPerConversion', 'Cost / conv.', 'costConv', 'Money', 'True', 'False', '', 'Metric', 'The Cost attributable to conversion-tracked clicks divided by the number of conversions'),
('CriteriaParameters', 'Keyword / Placement', 'keywordPlacement', 'String', 'True', 'False', '', 'Attribute', 'Descriptive string for the Criterion. For more information on the format of criteria types in reports, see <a href=''https://developers.google.com/adwords/api/docs/guides/reporting#criteria_prefixes''>the <b>Criteria prefixes</b> section of the reporting guide</a>.'),
('CrossDeviceConversions', 'Cross-device conv.', 'crossDeviceConv', 'Double', 'True', 'False', '', 'Metric', 'Conversions from when a customer clicks on an AdWords ad on one device, then converts on a different device or browser. Cross-device conversions are already included in your AllConversions column. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Ctr', 'CTR', 'ctr', 'Double', 'True', 'False', '', 'Metric', 'The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions). Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('CustomerDescriptiveName', 'Client name', 'clientName', 'String', 'True', 'False', '', 'Attribute', 'The descriptive name of the Customer.'),
('Date', 'Day', 'day', 'Date', 'True', 'False', '', 'Segment', 'The date formatted as yyyy-MM-dd.'),
('DayOfWeek', 'Day of week', 'dayOfWeek', 'DayOfWeek', 'True', 'False', 'MONDAY / Monday\nTUESDAY / Tuesday\nWEDNESDAY / Wednesday\nTHURSDAY / Thursday\nFRIDAY / Friday\nSATURDAY / Saturday\nSUNDAY / Sunday\n', 'Segment', 'The name of the day of the week, e.g., "Monday".'),
('Device', 'Device', 'device', 'DeviceType', 'True', 'False', 'UNKNOWN / Other\nDESKTOP / Computers\nHIGH_END_MOBILE / Mobile devices with full browsers\nTABLET / Tablets with full browsers\n', 'Segment', 'Device type where the impression was shown.'),
('DisplayName', 'Criteria Display Name', 'criteriaDisplayName', 'String', 'False', 'False', '', 'Attribute', 'Descriptive name for the criterion. For more information on the format of criteria types in reports, see <a href=''https://developers.google.com/adwords/api/docs/guides/reporting#criteria_prefixes''>the <b>Criteria prefixes</b> section of the reporting guide</a>.'),
('Domain', 'Domain', 'domain', 'String', 'False', 'False', '', 'Attribute', 'The domain of the URL (placement) where the impression was shown.'),
('EngagementRate', 'Engagement rate', 'engagementRate', 'Double', 'True', 'False', '', 'Metric', 'How often people engage with your ad after it''s shown to them. This is the number of ad expansions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Engagements', 'Engagements', 'engagements', 'Long', 'True', 'False', '', 'Metric', 'The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics.'),
('ExternalConversionSource', 'Conversion source', 'conversionSource', 'ExternalConversionSource', 'True', 'False', 'UNKNOWN / Other\nWEBPAGE / Website\nANALYTICS / Analytics\nUPLOAD / Import from clicks\nAD_CALL_METRICS / Calls from ads\nOFFERS / Offers\nENGAGEMENT / Engagement ads\nWEBSITE_CALL_METRICS / Calls from website\nSTORE_VISITS / Store visits\nANDROID_IN_APP / Android in-app action\nANDROID_DOWNLOAD / Android app install (from Google Play)\nIOS_IN_APP / iOS in-app action\nIOS_FIRST_OPEN / iOS app install (first open)\nAPP_UNSPECIFIED / Mobile app\nANDROID_FIRST_OPEN / Android app install (first open)\nUPLOAD_CALLS / Import from calls\nFIREBASE / Firebase\nCLICK_TO_CALL / Phone number clicks\nSALESFORCE / Salesforce.com\nSTORE_SALES_CRM / Store sales (data partner)\nSTORE_SALES_PAYMENT_NETWORK / Store sales (payment network)\nGOOGLE_PLAY / Google Play\n', 'Segment', 'The source of conversion such as website, import from calls.'),
('ExternalCustomerId', 'Customer ID', 'customerID', 'Long', 'True', 'False', '', 'Attribute', 'The Customer ID.'),
('Impressions', 'Impressions', 'impressions', 'Long', 'True', 'False', '', 'Metric', 'Count of how often your ad has appeared on a search results page or website on the Google Network.'),
('InteractionRate', 'Interaction Rate', 'interactionRate', 'Double', 'True', 'False', '', 'Metric', 'How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('Interactions', 'Interactions', 'interactions', 'Long', 'True', 'False', '', 'Metric', 'The number of interactions. An interaction is the main user action associated with an ad formatâ€”clicks for text and shopping ads, views for video ads, and so on.'),
('InteractionTypes', 'Interaction Types', 'interactionTypes', 'EnumSet', 'True', 'False', '', 'Metric', 'The types of interactions that are reflected in the Interactions, InteractionRate, and AverageCost columns.'),
('IsAutoOptimized', 'Targeting Mode', 'targetingMode', 'Enum', 'True', 'False', 'TRUE / Auto-optimized\nFALSE / Standard\n', 'Segment', 'Indicates if Display Campaign Optimizer is enabled for the ad group. Corresponds to the ad group''s ExplorerAutoOptimizerSetting.'),
('IsBidOnPath', 'Added', 'added', 'boolean', 'False', 'False', '', 'Attribute', 'Indicates if the placement was added as a criterion.'),
('IsPathExcluded', 'Excluded', 'excluded', 'boolean', 'False', 'False', '', 'Attribute', 'Indicates if the URL or placement is currently excluded.'),
('Month', 'Month', 'month', 'String', 'True', 'False', '', 'Segment', 'The first day of the month, formatted as yyyy-MM-dd.'),
('MonthOfYear', 'Month of Year', 'monthOfYear', 'MonthOfYear', 'True', 'False', 'JANUARY / January\nFEBRUARY / February\nMARCH / March\nAPRIL / April\nMAY / May\nJUNE / June\nJULY / July\nAUGUST / August\nSEPTEMBER / September\nOCTOBER / October\nNOVEMBER / November\nDECEMBER / December\n', 'Segment', 'The name of the month of the year, e.g., "December".'),
('PrimaryCompanyName', 'Company name', 'companyName', 'String', 'True', 'False', '', 'Attribute', 'Company name of the account.'),
('Quarter', 'Quarter', 'quarter', 'String', 'True', 'False', '', 'Segment', 'The first day of the quarter, formatted as yyyy-MM-dd. Uses the calendar year for quarters, e.g., the second quarter of 2014 starts on 2014-04-01.'),
('Url', 'URL', 'url', 'String', 'False', 'False', '', 'Attribute', 'The URL (placement) where the impression was shown.'),
('ValuePerAllConversion', 'Value / all conv.', 'valueAllConv', 'Double', 'True', 'False', '', 'Metric', 'The value, on average, of all conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('ValuePerConversion', 'Value / conv.', 'valueConv', 'Double', 'True', 'False', '', 'Metric', 'The total value of your conversions divided by the total number of conversions.\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile100Rate', 'Video played to 100%', 'videoPlayedTo100', 'Double', 'True', 'False', '', 'Metric', 'Percentage of impressions where the viewer watched all of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile25Rate', 'Video played to 25%', 'videoPlayedTo25', 'Double', 'True', 'False', '', 'Metric', 'Percentage of impressions where the viewer watched 25% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile50Rate', 'Video played to 50%', 'videoPlayedTo50', 'Double', 'True', 'False', '', 'Metric', 'Percentage of impressions where the viewer watched 50% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoQuartile75Rate', 'Video played to 75%', 'videoPlayedTo75', 'Double', 'True', 'False', '', 'Metric', 'Percentage of impressions where the viewer watched 75% of your video. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViewRate', 'View rate', 'viewRate', 'Double', 'True', 'False', '', 'Metric', 'The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads. Percentage returned as "x.xx%".\nTo prevent calculation accuracy issues, fields whose data type is <code>Double</code> can be used <em>only</em> with the following operators in predicates: <code>LESS_THAN</code> or <code>GREATER_THAN</code>. This is also true for <a href=''/adwords/api/docs/guides/awql''>AWQL</a>: <em>Only</em> the operators <code>&lt;</code> and <code>&gt;</code> are allowed in the <code>WHERE</code> clause.'),
('VideoViews', 'Views', 'views', 'Long', 'True', 'False', '', 'Metric', 'The number of times your video ads were viewed.'),
('ViewThroughConversions', 'View-through conv.', 'viewThroughConv', 'Long', 'True', 'False', '', 'Metric', 'The total number of view-through conversions. These happen when a customer sees a Display network ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad. This field is formatted using US locale, i.e., using comma "," for thousands and dot "." for decimals.'),
('Week', 'Week', 'week', 'String', 'True', 'False', '', 'Segment', 'The date for the Monday of the week, formatted as yyyy-MM-dd.'),
('Year', 'Year', 'year', 'Integer', 'True', 'False', '', 'Segment', 'The year, formatted as yyyy.');

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

--
-- Dump dei dati per la tabella `db_user`
--

INSERT INTO `db_user` (`user_id`, `db_host`, `db_user`, `db_password`, `db_port`, `db_name`) VALUES
(18, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_18'),
(19, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_19'),
(20, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_20'),
(21, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_21'),
(22, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_22'),
(23, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_23'),
(24, 'localhost', 'adplify', 'adplify', '3306', 'adplify_customer_24');

-- --------------------------------------------------------

--
-- Struttura della tabella `languages`
--

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

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `severity` smallint(6) NOT NULL,
  `log` varchar(255) NOT NULL,
  `message` text,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_login` smallint(6) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `log`
--

INSERT INTO `log` (`id`, `created_at`, `severity`, `log`, `message`, `user_id`, `is_login`) VALUES
(1, '2017-03-15 09:52:50', 1, 'user id24', 'user id24', NULL, 0),
(2, '2017-03-15 09:52:50', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(3, '2017-03-15 09:52:50', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(4, '2017-03-15 09:56:46', 1, 'user id24', 'user id24', NULL, 0),
(5, '2017-03-15 09:56:46', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(6, '2017-03-15 09:56:46', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(7, '2017-03-15 09:57:53', 1, 'user id24', 'user id24', NULL, 0),
(8, '2017-03-15 09:57:53', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(9, '2017-03-15 09:57:53', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(10, '2017-03-15 09:57:54', 1, 'user id24', 'user id24', NULL, 0),
(11, '2017-03-15 09:57:54', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(12, '2017-03-15 09:57:54', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(13, '2017-03-15 09:57:54', 1, 'user id24', 'user id24', NULL, 0),
(14, '2017-03-15 09:57:54', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(15, '2017-03-15 09:57:54', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(16, '2017-03-15 10:01:54', 1, 'user id24', 'user id24', NULL, 0),
(17, '2017-03-15 10:01:54', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(18, '2017-03-15 10:01:54', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(19, '2017-03-15 10:01:55', 1, 'user id24', 'user id24', NULL, 0),
(20, '2017-03-15 10:01:55', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(21, '2017-03-15 10:01:56', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(22, '2017-03-15 10:02:21', 1, 'user id24', 'user id24', NULL, 0),
(23, '2017-03-15 10:02:21', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(24, '2017-03-15 10:02:21', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(25, '2017-03-15 10:02:22', 1, 'user id24', 'user id24', NULL, 0),
(26, '2017-03-15 10:02:22', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(27, '2017-03-15 10:02:22', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(28, '2017-03-15 10:02:23', 1, 'user id24', 'user id24', NULL, 0),
(29, '2017-03-15 10:02:23', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(30, '2017-03-15 10:02:23', 2, 'Tentativo di autenticazione fallito', 'Tentativo di autenticazione fallito', NULL, 0),
(31, '2017-03-15 10:02:43', 1, 'user id24', 'user id24', NULL, 0),
(32, '2017-03-15 10:04:20', 1, 'user id24', 'user id24', NULL, 0),
(33, '2017-03-15 10:04:20', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(34, '2017-03-15 10:04:20', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(35, '2017-03-15 10:04:21', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(36, '2017-03-15 10:04:21', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(37, '2017-03-15 10:04:22', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(38, '2017-03-15 10:04:23', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(39, '2017-03-15 10:04:23', 1, 'saveAdGroups 2 601207815', 'saveAdGroups 2 601207815', NULL, 0),
(40, '2017-03-15 10:04:23', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(41, '2017-03-15 10:04:24', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(42, '2017-03-15 10:04:25', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(43, '2017-03-15 10:04:25', 1, 'saveAdGroups 2 612348397', 'saveAdGroups 2 612348397', NULL, 0),
(44, '2017-03-15 10:04:25', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(45, '2017-03-15 10:04:25', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(46, '2017-03-15 10:04:26', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(47, '2017-03-15 10:04:26', 1, 'saveAdGroups 2 629570633', 'saveAdGroups 2 629570633', NULL, 0),
(48, '2017-03-15 10:04:26', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(49, '2017-03-15 10:04:27', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(50, '2017-03-15 10:04:27', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(51, '2017-03-15 10:04:28', 1, 'saveAdGroups 2 213353060', 'saveAdGroups 2 213353060', NULL, 0),
(52, '2017-03-15 10:04:28', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(53, '2017-03-15 10:04:28', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(54, '2017-03-15 10:04:29', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(55, '2017-03-15 10:04:29', 1, 'saveAdGroups 2 213596180', 'saveAdGroups 2 213596180', NULL, 0),
(56, '2017-03-15 10:04:29', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(57, '2017-03-15 10:04:30', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(58, '2017-03-15 10:04:31', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(59, '2017-03-15 10:04:31', 1, 'saveAdGroups 2 166120940', 'saveAdGroups 2 166120940', NULL, 0),
(60, '2017-03-15 10:04:31', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(61, '2017-03-15 10:04:32', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(62, '2017-03-15 10:04:32', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(63, '2017-03-15 10:04:32', 1, 'saveAdGroups 2 166058180', 'saveAdGroups 2 166058180', NULL, 0),
(64, '2017-03-15 10:04:32', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(65, '2017-03-15 10:04:34', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(66, '2017-03-15 10:04:35', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(67, '2017-03-15 10:04:35', 1, 'saveAdGroups 2 177849260', 'saveAdGroups 2 177849260', NULL, 0),
(68, '2017-03-15 10:04:35', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(69, '2017-03-15 10:04:36', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(70, '2017-03-15 10:04:37', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(71, '2017-03-15 10:04:37', 1, 'saveAdGroups 2 177849140', 'saveAdGroups 2 177849140', NULL, 0),
(72, '2017-03-15 10:04:37', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(73, '2017-03-15 10:04:38', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(74, '2017-03-15 10:04:38', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(75, '2017-03-15 10:04:38', 1, 'saveAdGroups 2 124397060', 'saveAdGroups 2 124397060', NULL, 0),
(76, '2017-03-15 10:04:38', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(77, '2017-03-15 10:06:31', 1, 'user id24', 'user id24', NULL, 0),
(78, '2017-03-15 10:06:31', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(79, '2017-03-15 10:06:49', 1, 'user id24', 'user id24', NULL, 0),
(80, '2017-03-15 10:06:49', 1, 'linkAdwordsAccount called', 'linkAdwordsAccount called', NULL, 0),
(81, '2017-03-15 10:06:50', 1, 'saveCampaignsHierarchy called ', 'saveCampaignsHierarchy called ', NULL, 0),
(82, '2017-03-15 10:06:50', 1, 'saveCampaignsHierarchy 1 ', 'saveCampaignsHierarchy 1 ', NULL, 0),
(83, '2017-03-15 10:06:50', 1, 'saveCampaignsHierarchy 2 ', 'saveCampaignsHierarchy 2 ', NULL, 0),
(84, '2017-03-15 10:06:51', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(85, '2017-03-15 10:06:52', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(86, '2017-03-15 10:06:52', 1, 'saveAdGroups 2 601207815', 'saveAdGroups 2 601207815', NULL, 0),
(87, '2017-03-15 10:06:53', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(88, '2017-03-15 10:06:53', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(89, '2017-03-15 10:06:54', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(90, '2017-03-15 10:06:54', 1, 'saveAdGroups 2 612348397', 'saveAdGroups 2 612348397', NULL, 0),
(91, '2017-03-15 10:06:54', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(92, '2017-03-15 10:06:55', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(93, '2017-03-15 10:06:55', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(94, '2017-03-15 10:06:55', 1, 'saveAdGroups 2 629570633', 'saveAdGroups 2 629570633', NULL, 0),
(95, '2017-03-15 10:06:55', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(96, '2017-03-15 10:06:56', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(97, '2017-03-15 10:06:57', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(98, '2017-03-15 10:06:57', 1, 'saveAdGroups 2 213353060', 'saveAdGroups 2 213353060', NULL, 0),
(99, '2017-03-15 10:06:57', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(100, '2017-03-15 10:06:58', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(101, '2017-03-15 10:06:58', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(102, '2017-03-15 10:06:58', 1, 'saveAdGroups 2 213596180', 'saveAdGroups 2 213596180', NULL, 0),
(103, '2017-03-15 10:06:58', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(104, '2017-03-15 10:06:59', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(105, '2017-03-15 10:07:00', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(106, '2017-03-15 10:07:00', 1, 'saveAdGroups 2 166120940', 'saveAdGroups 2 166120940', NULL, 0),
(107, '2017-03-15 10:07:00', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(108, '2017-03-15 10:07:01', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(109, '2017-03-15 10:07:01', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(110, '2017-03-15 10:07:02', 1, 'saveAdGroups 2 166058180', 'saveAdGroups 2 166058180', NULL, 0),
(111, '2017-03-15 10:07:02', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(112, '2017-03-15 10:07:02', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(113, '2017-03-15 10:07:03', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(114, '2017-03-15 10:07:03', 1, 'saveAdGroups 2 177849260', 'saveAdGroups 2 177849260', NULL, 0),
(115, '2017-03-15 10:07:03', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(116, '2017-03-15 10:07:04', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(117, '2017-03-15 10:07:05', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(118, '2017-03-15 10:07:05', 1, 'saveAdGroups 2 177849140', 'saveAdGroups 2 177849140', NULL, 0),
(119, '2017-03-15 10:07:05', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(120, '2017-03-15 10:07:06', 1, 'saveAdGroups called ', 'saveAdGroups called ', NULL, 0),
(121, '2017-03-15 10:07:07', 1, 'saveAdGroups 1 ', 'saveAdGroups 1 ', NULL, 0),
(122, '2017-03-15 10:07:07', 1, 'saveAdGroups 2 124397060', 'saveAdGroups 2 124397060', NULL, 0),
(123, '2017-03-15 10:07:07', 1, 'saveAdGroups 3 ', 'saveAdGroups 3 ', NULL, 0),
(124, '2017-03-15 10:30:05', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(125, '2017-03-15 10:30:05', 1, 'JSON REQUEST :refresh_token=1%2Ftk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', 'JSON REQUEST :refresh_token=1%2Ftk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', NULL, 0),
(126, '2017-03-15 10:30:05', 1, 'JSON:{\n  "access_token" : "ya29.GlwPBOQWRyL4P_1X2dVA70dXGZJ0YyyrC79f80oySvi0pjgTU4sx-lVsGUcwKjmlS_yBc0e5Fb7Ff23Fhb4sAYn5b1BjlE4H-wUpNv-npUd_tFitwbHAKQtKzILFPg",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDg', 'JSON:{\n  "access_token" : "ya29.GlwPBOQWRyL4P_1X2dVA70dXGZJ0YyyrC79f80oySvi0pjgTU4sx-lVsGUcwKjmlS_yBc0e5Fb7Ff23Fhb4sAYn5b1BjlE4H-wUpNv-npUd_tFitwbHAKQtKzILFPg",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDgyMzQxNTE4NjM3NDU2NzQ5OTkiLCJlbWFpbCI6InByb2RvdHRpQGV4b2xhYi5pdCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiOXBnU2tvS2hpQXB5aFFaWWExU0tVZyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1NzM4MDUsImV4cCI6MTQ4OTU3NzQwNX0.ZjFIQZ-YT-sGl3XjMAgCgG9moU7AvXp6qUWG8YWipeHubBgD5U-3d13xsvPnTp9NvIQwB69y69g5KxhefZFImgip8mnLYe7pz-j9W4Z6Kjww_dPCC73H51pM65FUil0vhy-TjT6igOs7rOYXgDsxUZi8Vvdrcn3AGfvozkpyL8atIgnH9aWcDXEnzVtR3hzUGjm5Kk54LOdXushAzL7AtlFH3lJUUuXzjEgNv5JKy0QLSyQbya7fMSUtLVCoPS_pevK6ykz3qcVi9oOpfbZ7yxKf7SYmwUwYXVLZ_2ktgQwUMz92GjAX3GDm61nHSRNB9xgnR3VjNbZubFKpOHO9og",\n  "token_type" : "Bearer"\n}', NULL, 0),
(127, '2017-03-15 10:30:05', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(128, '2017-03-15 10:30:05', 1, 'ok', 'ok', NULL, 0),
(129, '2017-03-15 10:30:05', 1, 'access_token=ya29.GlwPBOQWRyL4P_1X2dVA70dXGZJ0YyyrC79f80oySvi0pjgTU4sx-lVsGUcwKjmlS_yBc0e5Fb7Ff23Fhb4sAYn5b1BjlE4H-wUpNv-npUd_tFitwbHAKQtKzILFPg', 'access_token=ya29.GlwPBOQWRyL4P_1X2dVA70dXGZJ0YyyrC79f80oySvi0pjgTU4sx-lVsGUcwKjmlS_yBc0e5Fb7Ff23Fhb4sAYn5b1BjlE4H-wUpNv-npUd_tFitwbHAKQtKzILFPg', NULL, 0),
(130, '2017-03-15 10:30:05', 1, 'expires_in=3600', 'expires_in=3600', NULL, 0),
(131, '2017-03-15 10:30:06', 1, 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ', 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDgyMzQxNTE4NjM3NDU2NzQ5OTkiLCJlbWFpbCI6InByb2RvdHRpQGV4b2xhYi5pdCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiOXBnU2tvS2hpQXB5aFFaWWExU0tVZyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1NzM4MDUsImV4cCI6MTQ4OTU3NzQwNX0.ZjFIQZ-YT-sGl3XjMAgCgG9moU7AvXp6qUWG8YWipeHubBgD5U-3d13xsvPnTp9NvIQwB69y69g5KxhefZFImgip8mnLYe7pz-j9W4Z6Kjww_dPCC73H51pM65FUil0vhy-TjT6igOs7rOYXgDsxUZi8Vvdrcn3AGfvozkpyL8atIgnH9aWcDXEnzVtR3hzUGjm5Kk54LOdXushAzL7AtlFH3lJUUuXzjEgNv5JKy0QLSyQbya7fMSUtLVCoPS_pevK6ykz3qcVi9oOpfbZ7yxKf7SYmwUwYXVLZ_2ktgQwUMz92GjAX3GDm61nHSRNB9xgnR3VjNbZubFKpOHO9og', NULL, 0),
(132, '2017-03-15 10:30:06', 1, 'token_type=Bearer', 'token_type=Bearer', NULL, 0),
(133, '2017-03-15 10:30:06', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(134, '2017-03-15 10:30:06', 1, 'JSON REQUEST :refresh_token=1%2FkDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', 'JSON REQUEST :refresh_token=1%2FkDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', NULL, 0),
(135, '2017-03-15 10:30:06', 1, 'JSON:{\n  "access_token" : "ya29.GlwPBCWJhN7XBWxaGQ7CrZZOroNf7cnT_jqvw_4dVvFB3fyz2fALfoHclafnjyd75j3qNDmuLJosaPi98xSC_kMiob40HGRtWe4uJ9Nhliiryium21zR79G7eyxa6A",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDg', 'JSON:{\n  "access_token" : "ya29.GlwPBCWJhN7XBWxaGQ7CrZZOroNf7cnT_jqvw_4dVvFB3fyz2fALfoHclafnjyd75j3qNDmuLJosaPi98xSC_kMiob40HGRtWe4uJ9Nhliiryium21zR79G7eyxa6A",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIxMTg3ODg4NjAwMzIwMzEzOTkiLCJlbWFpbCI6InByb3ZhbGF1cmEyMDE2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiVGRYWnFyOGYyaXRSc05Wa1A1d2I2USIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1NzM4MDYsImV4cCI6MTQ4OTU3NzQwNn0.HXrU627oZjWazOmoOWlIQTHvAJvYPHKf1SlP_h6bmnCyPMrUK-LcX27nAxckr9FZm1CVXnoXJnTJDsu4PDbZX_MXWfQICC_6NXo3fF8dl4edENf_J_8YHxgccTWux-iEjo1XXcvw4vlDNooX3rQYuzrnBxPxtYC4xYzE3Eiv0wtrHgQyJN_mtU8UcBqMdCR_AiCefCjzRyawAn2WFy4RbkcQ-IOGTa6GeAdTZLHaln0x9drnvTYAtoyDVr0Pq9veg-djsbabKuU27gIN5bxnRNONJbQ1aWEbcRtV0NQi31qk9FKBDWQ5myCQZQOQC3qp0kl-WXTsId140ujU_lDd5g",\n  "token_type" : "Bearer"\n}', NULL, 0),
(136, '2017-03-15 10:30:06', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(137, '2017-03-15 10:30:06', 1, 'ok', 'ok', NULL, 0),
(138, '2017-03-15 10:30:06', 1, 'access_token=ya29.GlwPBCWJhN7XBWxaGQ7CrZZOroNf7cnT_jqvw_4dVvFB3fyz2fALfoHclafnjyd75j3qNDmuLJosaPi98xSC_kMiob40HGRtWe4uJ9Nhliiryium21zR79G7eyxa6A', 'access_token=ya29.GlwPBCWJhN7XBWxaGQ7CrZZOroNf7cnT_jqvw_4dVvFB3fyz2fALfoHclafnjyd75j3qNDmuLJosaPi98xSC_kMiob40HGRtWe4uJ9Nhliiryium21zR79G7eyxa6A', NULL, 0),
(139, '2017-03-15 10:30:06', 1, 'expires_in=3600', 'expires_in=3600', NULL, 0),
(140, '2017-03-15 10:30:06', 1, 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ', 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIxMTg3ODg4NjAwMzIwMzEzOTkiLCJlbWFpbCI6InByb3ZhbGF1cmEyMDE2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiVGRYWnFyOGYyaXRSc05Wa1A1d2I2USIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1NzM4MDYsImV4cCI6MTQ4OTU3NzQwNn0.HXrU627oZjWazOmoOWlIQTHvAJvYPHKf1SlP_h6bmnCyPMrUK-LcX27nAxckr9FZm1CVXnoXJnTJDsu4PDbZX_MXWfQICC_6NXo3fF8dl4edENf_J_8YHxgccTWux-iEjo1XXcvw4vlDNooX3rQYuzrnBxPxtYC4xYzE3Eiv0wtrHgQyJN_mtU8UcBqMdCR_AiCefCjzRyawAn2WFy4RbkcQ-IOGTa6GeAdTZLHaln0x9drnvTYAtoyDVr0Pq9veg-djsbabKuU27gIN5bxnRNONJbQ1aWEbcRtV0NQi31qk9FKBDWQ5myCQZQOQC3qp0kl-WXTsId140ujU_lDd5g', NULL, 0),
(141, '2017-03-15 10:30:06', 1, 'token_type=Bearer', 'token_type=Bearer', NULL, 0),
(142, '2017-03-15 13:30:08', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(143, '2017-03-15 13:30:08', 1, 'JSON REQUEST :refresh_token=1%2Ftk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', 'JSON REQUEST :refresh_token=1%2Ftk_Cvv2hIjZK9Nop8cItPHUBLP_oNfz_niMk0FX9zXs&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', NULL, 0),
(144, '2017-03-15 13:30:08', 1, 'JSON:{\n  "access_token" : "ya29.GlwPBCJ9TyWVZGQZfwqfAiG06yxM3FRKrMoJYbW0giLAbf90vIgL0DKOAIZEaKdtK-XikMGq1HctWQReEHUvq0753Eb_Ls7WYxRIX9mbqO0dS89NJMDm42b2h7Gcmw",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDg', 'JSON:{\n  "access_token" : "ya29.GlwPBCJ9TyWVZGQZfwqfAiG06yxM3FRKrMoJYbW0giLAbf90vIgL0DKOAIZEaKdtK-XikMGq1HctWQReEHUvq0753Eb_Ls7WYxRIX9mbqO0dS89NJMDm42b2h7Gcmw",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDgyMzQxNTE4NjM3NDU2NzQ5OTkiLCJlbWFpbCI6InByb2RvdHRpQGV4b2xhYi5pdCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoicjZnTndYQnJvV0gwRkVyTFdHdms5ZyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1ODQ2MDgsImV4cCI6MTQ4OTU4ODIwOH0.YSPDh8tst78W1R3cyiqc-XA_F2tbPNKz1P6uCK167G4owGAMEXxCrcdhGjIFznk6YDX1hJo7L76IL01iEUYtBHFu9Ahm4olzupdTj7QGSyjtQUIeSGpjpZzYCi5rdjgkkDDV3ncoDC9zw4JvfsElYeBzTGAFuY4O1eczOqlv2_52D_VG57pI_vaoZMcX1HltBYk534iZfEc-LXniLhJzHdroTjUcmZVxC1BqTSXCq29N7_caFXbEKq329atrXC5FLQFdhlaMplHJvMP0MRwAGtqgi4pkR3Q8pTZss2fZDnWbpYEGAY7-uH59h9BVXWBB7IiwxU6vIDewJ6O_Aq0wHA",\n  "token_type" : "Bearer"\n}', NULL, 0),
(145, '2017-03-15 13:30:08', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(146, '2017-03-15 13:30:08', 1, 'ok', 'ok', NULL, 0),
(147, '2017-03-15 13:30:08', 1, 'access_token=ya29.GlwPBCJ9TyWVZGQZfwqfAiG06yxM3FRKrMoJYbW0giLAbf90vIgL0DKOAIZEaKdtK-XikMGq1HctWQReEHUvq0753Eb_Ls7WYxRIX9mbqO0dS89NJMDm42b2h7Gcmw', 'access_token=ya29.GlwPBCJ9TyWVZGQZfwqfAiG06yxM3FRKrMoJYbW0giLAbf90vIgL0DKOAIZEaKdtK-XikMGq1HctWQReEHUvq0753Eb_Ls7WYxRIX9mbqO0dS89NJMDm42b2h7Gcmw', NULL, 0),
(148, '2017-03-15 13:30:09', 1, 'expires_in=3600', 'expires_in=3600', NULL, 0),
(149, '2017-03-15 13:30:09', 1, 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ', 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDgyMzQxNTE4NjM3NDU2NzQ5OTkiLCJlbWFpbCI6InByb2RvdHRpQGV4b2xhYi5pdCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoicjZnTndYQnJvV0gwRkVyTFdHdms5ZyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1ODQ2MDgsImV4cCI6MTQ4OTU4ODIwOH0.YSPDh8tst78W1R3cyiqc-XA_F2tbPNKz1P6uCK167G4owGAMEXxCrcdhGjIFznk6YDX1hJo7L76IL01iEUYtBHFu9Ahm4olzupdTj7QGSyjtQUIeSGpjpZzYCi5rdjgkkDDV3ncoDC9zw4JvfsElYeBzTGAFuY4O1eczOqlv2_52D_VG57pI_vaoZMcX1HltBYk534iZfEc-LXniLhJzHdroTjUcmZVxC1BqTSXCq29N7_caFXbEKq329atrXC5FLQFdhlaMplHJvMP0MRwAGtqgi4pkR3Q8pTZss2fZDnWbpYEGAY7-uH59h9BVXWBB7IiwxU6vIDewJ6O_Aq0wHA', NULL, 0),
(150, '2017-03-15 13:30:09', 1, 'token_type=Bearer', 'token_type=Bearer', NULL, 0),
(151, '2017-03-15 13:30:09', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(152, '2017-03-15 13:30:09', 1, 'JSON REQUEST :refresh_token=1%2FkDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', 'JSON REQUEST :refresh_token=1%2FkDkYe8tiWQNu-0Pa3ev7s5BqpwQlxdksfyFb9wKUlw8&client_id=135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com&client_secret=KQ1KrvbPvGN4Tv_J2PvkWfcc&grant_type=refresh_token', NULL, 0),
(153, '2017-03-15 13:30:09', 1, 'JSON:{\n  "access_token" : "ya29.GlwPBHGUfVTOT_jOfubmWZN2iydduluon8Vc_2RxnFrnpx7GXr4PWBBvt-o8kFU8GAfTgIsx_NqTfxlUTmgX2bh5_m50R_rpN3Yv8-0aXIRIUCv4BJPbZQniBv9TWw",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDg', 'JSON:{\n  "access_token" : "ya29.GlwPBHGUfVTOT_jOfubmWZN2iydduluon8Vc_2RxnFrnpx7GXr4PWBBvt-o8kFU8GAfTgIsx_NqTfxlUTmgX2bh5_m50R_rpN3Yv8-0aXIRIUCv4BJPbZQniBv9TWw",\n  "expires_in" : 3600,\n  "id_token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIxMTg3ODg4NjAwMzIwMzEzOTkiLCJlbWFpbCI6InByb3ZhbGF1cmEyMDE2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiekZGaHQ3ODBNbE9LTlRqT0pfa2V3ZyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1ODQ2MDksImV4cCI6MTQ4OTU4ODIwOX0.rgFwHqHv8D4t3vHFjwHrUojuebfYHMEtEqV30gwcaRU5FtAfXqeUWYAbpqH-easNvxY9XAReooEhu82qHJ42tcXn556oEK1nuDkgm4wj1vxMTAElp49BuJFPS6AQWl-frPmlR-IcggcNG9jbkhgmrPzLxWGVpbZFPSWwrNn6eTAtpN-Tp-Nkot60572n3m5hNY4bJKsz09z8ZY2dJ2U8DWJkkJ2nGh6pGy5NGPfY0eprjnKrJwkST-VIdjD0XXRHhVcv0UvtKqa4wOaJsstw3JMBm_GYd2eFj63_ZPRqf6-E1WKlM3E_NscQd4zTD-cZeEEW2zMK_rgqKCVP_880RQ",\n  "token_type" : "Bearer"\n}', NULL, 0),
(154, '2017-03-15 13:30:09', 1, 'faccio refresh del token', 'faccio refresh del token', NULL, 0),
(155, '2017-03-15 13:30:09', 1, 'ok', 'ok', NULL, 0),
(156, '2017-03-15 13:30:09', 1, 'access_token=ya29.GlwPBHGUfVTOT_jOfubmWZN2iydduluon8Vc_2RxnFrnpx7GXr4PWBBvt-o8kFU8GAfTgIsx_NqTfxlUTmgX2bh5_m50R_rpN3Yv8-0aXIRIUCv4BJPbZQniBv9TWw', 'access_token=ya29.GlwPBHGUfVTOT_jOfubmWZN2iydduluon8Vc_2RxnFrnpx7GXr4PWBBvt-o8kFU8GAfTgIsx_NqTfxlUTmgX2bh5_m50R_rpN3Yv8-0aXIRIUCv4BJPbZQniBv9TWw', NULL, 0),
(157, '2017-03-15 13:30:09', 1, 'expires_in=3600', 'expires_in=3600', NULL, 0),
(158, '2017-03-15 13:30:09', 1, 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ', 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5YThhNDY0NWZjZWNmNDk3ZDgyNjMwMGZjNjU0N2NlYWYyYTljODgifQ.eyJhenAiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIxMzU5MDg5MzUwNDQtc3FmcTRpampyb2x0cXBoaXQ2N3EzajNmM2JoanE0bmwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIxMTg3ODg4NjAwMzIwMzEzOTkiLCJlbWFpbCI6InByb3ZhbGF1cmEyMDE2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiekZGaHQ3ODBNbE9LTlRqT0pfa2V3ZyIsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0ODk1ODQ2MDksImV4cCI6MTQ4OTU4ODIwOX0.rgFwHqHv8D4t3vHFjwHrUojuebfYHMEtEqV30gwcaRU5FtAfXqeUWYAbpqH-easNvxY9XAReooEhu82qHJ42tcXn556oEK1nuDkgm4wj1vxMTAElp49BuJFPS6AQWl-frPmlR-IcggcNG9jbkhgmrPzLxWGVpbZFPSWwrNn6eTAtpN-Tp-Nkot60572n3m5hNY4bJKsz09z8ZY2dJ2U8DWJkkJ2nGh6pGy5NGPfY0eprjnKrJwkST-VIdjD0XXRHhVcv0UvtKqa4wOaJsstw3JMBm_GYd2eFj63_ZPRqf6-E1WKlM3E_NscQd4zTD-cZeEEW2zMK_rgqKCVP_880RQ', NULL, 0),
(159, '2017-03-15 13:30:09', 1, 'token_type=Bearer', 'token_type=Bearer', NULL, 0);

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
-- Struttura della tabella `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `adwords_accounts_limit` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `service_profile_types`
--

INSERT INTO `service_profile_types` (`id`, `serviceName`, `serviceCost`, `serviceBillingPeriod`, `serviceUpgradable`, `serviceDescription`, `serviceLogo`, `freeTrial`, `created_at`, `updated_at`, `adwords_accounts_limit`) VALUES
(1, 'service1', 500, 1000, 0, 'Service description 1', 'logo1', 1, NULL, NULL, 3);

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
  `frontend_error_url` varchar(255) DEFAULT NULL,
  `batch_ws_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `access_type`, `application_name`, `client_id`, `client_secret`, `after_token_provided_redirect_url`, `dev_key`, `customer_client_id`, `refresh_token`, `google_auth_url`, `after_auth_redirect_url`, `google_userinfo_url`, `frontend_error_url`, `batch_ws_url`) VALUES
(1, 'mamadigital', 'online', 'adplify', '135908935044-sqfq4ijjroltqphit67q3j3f3bhjq4nl.apps.googleusercontent.com', 'KQ1KrvbPvGN4Tv_J2PvkWfcc', 'http://devadplify.exolab.it/adplify_fe/index.php#/select-accounts', 'mjDNeLG_BMo-psJEcFsZHw', '601-806-2243', '1/Vd6f5rarMAsCT0I7cpvSyBvGuO3TRdLn_211oXvmV1I', 'https://accounts.google.com/o/oauth2/token', 'http://devadplify.exolab.it/adplify_be/public/index.php/api/oauth2/setAccessToken', 'https://www.googleapis.com/oauth2/v1/userinfo', 'http://devadplify.exolab.it/adplify_fe/index.php', 'http://devadplify.exolab.it/Scheduler/ws/ws.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `user_service_profile_types`
--

INSERT INTO `user_service_profile_types` (`id`, `user_id`, `service_profile_type_id`, `freeTrialStartedAt`, `freeTrialEndedAt`, `activatedAt`, `suspendAt`, `cancelledAt`, `currentStatus`, `coupon_code`) VALUES
(2, 18, 1, '2017-03-09 16:08:00', NULL, '2017-03-09 16:08:00', NULL, NULL, NULL, NULL),
(3, 19, 1, '2017-03-09 16:08:00', NULL, '2017-03-09 16:08:00', NULL, NULL, NULL, NULL),
(4, 20, 1, '2017-03-09 16:18:00', NULL, '2017-03-09 16:18:00', NULL, NULL, NULL, NULL),
(5, 21, 1, '2017-03-10 11:13:00', NULL, '2017-03-10 11:13:00', NULL, NULL, NULL, NULL),
(6, 22, 1, '2017-03-10 17:50:00', NULL, '2017-03-10 17:50:00', NULL, NULL, NULL, NULL),
(7, 23, 1, '2017-03-14 23:21:00', NULL, '2017-03-14 23:21:00', NULL, NULL, NULL, NULL),
(8, 24, 1, '2017-03-15 09:49:00', NULL, '2017-03-15 09:49:00', NULL, NULL, NULL, NULL);

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
  `accessToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferred_language` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `purchasedType`, `taxCode`, `dateBirth`, `billingAddress`, `profileType`, `username`, `email`, `password`, `confirmed`, `confirmation_code`, `remember_token`, `created_at`, `updated_at`, `manager_id`, `initial_data_import_status`, `first_login`, `userType`, `picture`, `accessToken`, `preferred_language`) VALUES
(18, 'Francesco', 'Protano', NULL, NULL, '1972-11-07', NULL, NULL, NULL, 'francesco.protano@gmail.com', '$2y$10$P7oV4Fn3r7XPwncke1LZm.5CQiAIoydNfrIniva6i2DnvVgAoR3..', 1, '5M8JFRDZQOk9PKiNFTtV2iiTuFktUS', NULL, '2017-03-09 15:08:26', '2017-03-09 15:11:14', NULL, 0, 0, 2, NULL, NULL, 'en'),
(19, 'Giampiero', '', NULL, NULL, '1970-01-01', NULL, NULL, NULL, 'giampiero.mazzi@gmail.com', '$2y$10$NtfL36OwMuVQamJZKq5dpumXId2Olh9nUkv5lotqFs/p7GilEsE1u', 1, '6WIiK0eoScXXLkSywRasJ1CLGQJLw9', NULL, '2017-03-09 15:08:27', '2017-03-13 08:38:49', NULL, 0, 0, 2, NULL, NULL, 'en'),
(20, 'Francesco', 'Protano', NULL, NULL, '1972-11-07', NULL, NULL, NULL, 'fprotano@yahoo.com', '$2y$10$7Q2qu1CvbGFsvT8bMR02eOFbRdbgVJhgXPXh9mQOjjNV7VI7z8RVe', 1, 'xYmHH47zPUT3S7o997ORlOrKHi3KEm', NULL, '2017-03-09 15:18:37', '2017-03-09 15:19:51', NULL, 0, 0, 2, NULL, NULL, 'en'),
(21, 'Simone', '', NULL, NULL, '1970-01-01', NULL, NULL, NULL, 'simone.rinzivillo@mamadigital.com', '$2y$10$dfYdRJFhDetjRi/Bool6yunYVwFj2NQLDChz8m6IQJ8CvsHbqcy7W', 1, 'vTL6avpE77i8nMHi1jiClL5w6rHF37', NULL, '2017-03-10 10:13:16', '2017-03-10 10:23:26', NULL, 0, 0, 1, NULL, NULL, 'en'),
(22, 'giampiero', '', NULL, NULL, '1970-01-01', NULL, NULL, NULL, 'g.mazzi@exolab.it', '$2y$10$6xWwFCjBN4RnX/EMbGQG3eYPJcjr/mBpo/vUi19YFYbXLveyg0sbO', 1, 'xEu0DN1s8bAZzWefMWUre09BuWasyM', NULL, '2017-03-10 16:50:32', '2017-03-10 16:52:23', NULL, 0, 0, 1, NULL, NULL, 'en'),
(23, 'Raffaele', 'Ficcadenti', NULL, NULL, NULL, NULL, NULL, NULL, 'raffaele.ficcadenti@gmail.com', '$2y$10$2HWUZhD1PALHKePY2kwB5.dCnIdqt6ieQ6WhKpsxLUGmm5by7G57a', 1, 'UG7vdT3wsXr9eQ6j1jDWdZ8f541baj', NULL, '2017-03-14 22:21:33', '2017-03-14 22:21:52', NULL, 0, 0, 2, NULL, NULL, 'en'),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stefano.bettarini@yahoo.it', '$2y$10$hXtGrK6pEYx.V6erei50rurIt2ntMyCTHi63645RGH5SrxBQ0GSlC', 1, '5S0yrZWUfKp5xhaHXpoL55zARv6b82', NULL, '2017-03-15 08:49:28', '2017-03-15 08:49:38', NULL, 0, 0, 2, NULL, NULL, 'en');

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
-- Indici per le tabelle `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indici per le tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

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
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `u_ut_ut_id` (`userType`),
  ADD KEY `preferred_language` (`preferred_language`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=160;
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
-- AUTO_INCREMENT per la tabella `user_service_profile_types`
--
ALTER TABLE `user_service_profile_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT per la tabella `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
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
-- Limiti per la tabella `user_service_profile_types`
--
ALTER TABLE `user_service_profile_types`
  ADD CONSTRAINT `fk_user_service_profile_types` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_profiles_service_profile_type_id_foreign` FOREIGN KEY (`service_profile_type_id`) REFERENCES `service_profile_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`preferred_language`) REFERENCES `languages` (`code`),
  ADD CONSTRAINT `u_ut_ut_id` FOREIGN KEY (`userType`) REFERENCES `user_type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
