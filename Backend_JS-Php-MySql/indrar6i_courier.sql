-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2022 at 09:29 AM
-- Server version: 5.7.23-23
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indrar6i_courier`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_name`, `password`, `email`, `image`) VALUES
(1, 'Admin', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', 'admin@admin.com', 'f12aae9c53d66ed98af13b83fef43597.png');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) NOT NULL,
  `app_email` varchar(500) NOT NULL,
  `app_contact` varchar(500) NOT NULL,
  `app_website` varchar(500) NOT NULL,
  `app_description` text NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `app_aboutus` text NOT NULL,
  `email_subject` varchar(500) NOT NULL,
  `email_subject_confirm` varchar(500) NOT NULL,
  `email_text1` text NOT NULL,
  `email_text2` text NOT NULL,
  `email_text3` text NOT NULL,
  `email_text4` text NOT NULL,
  `app_logo` varchar(500) NOT NULL,
  `smtp_host` varchar(500) NOT NULL,
  `smtp_port` varchar(500) NOT NULL,
  `smtp_username` varchar(500) NOT NULL,
  `smtp_password` varchar(500) NOT NULL,
  `smtp_from` varchar(500) NOT NULL,
  `smtp_secure` varchar(250) NOT NULL,
  `app_name` varchar(500) NOT NULL,
  `app_address` text NOT NULL,
  `app_linkgoogle` varchar(500) NOT NULL,
  `app_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `app_currency_text` varchar(10) NOT NULL,
  `stripe_secret_key` varchar(500) NOT NULL,
  `stripe_published_key` varchar(500) NOT NULL,
  `stripe_status` varchar(5) NOT NULL,
  `stripe_active` varchar(20) NOT NULL,
  `paypal_key` varchar(500) NOT NULL,
  `paypal_mode` varchar(20) NOT NULL,
  `paypal_active` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `app_email`, `app_contact`, `app_website`, `app_description`, `app_privacy_policy`, `app_aboutus`, `email_subject`, `email_subject_confirm`, `email_text1`, `email_text2`, `email_text3`, `email_text4`, `app_logo`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `smtp_from`, `smtp_secure`, `app_name`, `app_address`, `app_linkgoogle`, `app_currency`, `app_currency_text`, `stripe_secret_key`, `stripe_published_key`, `stripe_status`, `stripe_active`, `paypal_key`, `paypal_mode`, `paypal_active`) VALUES
(1, 'info@slogfy.xyz', '081234567890', 'https://slogfy.xyz/demo', '', '<div xss=\"removed\"><span xss=\"removed\"><font face=\"Verdana\"><p xss=\"removed\"><strong xss=\"removed\"><span xss=\"removed\"></span></strong></p><h4 xss=\"removed\"><font xss=\"removed\"><b>PRIVACY POLICY</b></font></h4><h4 xss=\"removed\"><strong xss=\"removed\"><span xss=\"removed\">Information obtained from you or from your mobile device directly</span></strong><br></h4><ul class=\"list-disc\" xss=\"removed\"><li xss=\"removed\">When you register and create an account with us using the Application you have to provide to us certain Personal Information, including your name, physical address, e-mail address and your phone number. If you are using the Application as a service provider, you have to provide us with additional Personal Information as part of the service provider onboarding process. This would include details of your vehicle (licenses, approvals, and other authorizations for you to operate the vehicle and to provide the transportation services), your insurance policy, and your bank account.</li><li xss=\"removed\"><div xss=\"removed\"><span xss=\"removed\">When you use the Application, you have to provide us with relevant information as may reasonably be required by us in order for the Application to work, for example:</span></div><ul xss=\"removed\"><li xss=\"removed\">If you are using the Application as a user, you will need to provide us with information as to the type of service you seek, and details as to the pick-up and/or delivery.</li><li xss=\"removed\">If you are using the Application as a service provider, in order for the Application to work, you will need to provide us with the information on the services you are able to accept orders for at the time, and details as to your current, and after an order for a service placed by a user is accepted by you as the service provider, you may need to provide us with other data that we need to manage the Application and ecosystem, and to monitor overall usage of the Application.</li><li xss=\"removed\">If you utilize and/or when a payment or transfer is made through the electronic money and/or electronic wallet facility provided by us, if you are the payer or sender, you will provide us the information relating to the utilization, payment or transfer, including but not limited to the transfer and/or payment receiver details, the amount of payment paid, the type of payment card or account used, the name of the issuer of that payment card or account, the name of the holder for that payment card or account, the identification number of that payment card or account, the verification code of that payment card or account and the expiration date of that payment card or account, as applicable.</li><li xss=\"removed\">If you intend to apply as registered or verified account holder of the electronic money facility provided by us, you will provide to us the required information including but not limited to your full name, your identity card numbers, type of identity card you use for registration, address, gender, place and date of birth, occupation, tax details, nationality and/or biometric data.</li><li xss=\"removed\">If you intend to add your payment card or account as a source of fund for payment in the Application, you will provide us information relating to the type of payment card or account registered, the issuer of that payment card or account, the name of the holder for that payment card or account, the identification number of that payment card or account and the verification code of that payment card or account and the expiration date of that payment card or account, as applicable.</li></ul></li></ul><p xss=\"removed\"></p><ul xss=\"removed\"></ul><p xss=\"removed\"></p><p xss=\"removed\"><strong xss=\"removed\">Information collected every time you use the Application or visit our website</strong></p><ul class=\"list-disc\" xss=\"removed\"><li xss=\"removed\"><font xss=\"removed\">Every time you use the Application or visit our website, we may collect certain technical data in connection with your use such as internet protocol address, web page information previously or subsequently viewed, duration of each visit / session, internet device identity or media access control address , and </font><em>mobile advertising ID</em><font xss=\"removed\"> and other device information including information about the manufacturer, model and operating system of the device you use to access our Application or website.</font></li><li xss=\"removed\"><font xss=\"removed\">When you use the Application or visit our website, certain information can also be collected automatically by using </font><em>cookies</em><font xss=\"removed\"> . </font><em>Cookies</em><font xss=\"removed\"><font xss=\"removed\"> are small data files stored on your computer or mobile device. </font><font xss=\"removed\">We use </font></font><em>cookies</em><font xss=\"removed\"><font xss=\"removed\"> to track user activity in order to improve the user interface and experience. </font><font xss=\"removed\">Most mobile devices and internet browsers support the use of </font></font><em>cookies</em><font xss=\"removed\"><font xss=\"removed\"> ; </font><font xss=\"removed\">however, you can adjust the settings on your mobile device or internet browser to refuse certain types of </font></font><em>cookies</em><font xss=\"removed\"> or </font><em>cookies</em><font xss=\"removed\"><font xss=\"removed\">specifics. </font><font xss=\"removed\">Your mobile device and / or browser also allows you to delete any cookies that have been previously stored. </font><font xss=\"removed\">However, it may affect the functions available on our Application or website.</font></font></li><li xss=\"removed\"><font xss=\"removed\"><font xss=\"removed\">Every time you use the Application via a mobile device, we will track and collect your geographic location information in real time. </font><font xss=\"removed\">In some cases, you will be asked or required to activate the </font></font><em>Global Positioning System</em><font xss=\"removed\"><font xss=\"removed\"> (GPS) on your mobile device to enable us to provide you with a better experience using the Application (for example, to provide information about how close the service provider is to you). </font><font xss=\"removed\">You can temporarily disable geographic location tracking information on your mobile device. </font><font xss=\"removed\">However, this may affect the functions available on the Application.</font></font></li><li xss=\"removed\"><font xss=\"removed\">If you use and / or when payments or transfers are made through electronic money facilities and / or electronic wallets provided by us, we may collect certain information related to the source of funds you use to top up (including bank account details), account details withdrawal recipient, transaction history (including beneficiary details), bill details, invoices, and phone numbers.</font></li><li xss=\"removed\"><font xss=\"removed\">If you use a virtual account provided by us to receive payments using electronic money and / or electronic wallets from payers, whether you are a service provider or a merchant, we may collect certain information related to your use including but not limited to services and / or goods transactions, the amount you collect from each transaction, details of your withdrawal or payment settlement account and history of withdrawals or settlement of payments.</font></li><li xss=\"removed\"><font xss=\"removed\">If you use and / or when a payment is made via a payment card or account that you add to the Application, we may collect certain information related to transaction records, including details of recipients, details of bills, details of receipts, and details of phone numbers.</font></li></ul></font></span></div><div xss=\"removed\"><div xss=\"removed\"><span xss=\"removed\"><b><font face=\"Verdana\">Ordriver App Using a Background Location</font></b></span></div><div xss=\"removed\"><span xss=\"removed\"><b><font face=\"Verdana\"><br></font></b></span></div><font face=\"Verdana\"><div xss=\"removed\"><span xss=\"removed\">This is an online transportation provider service partner application, the user of this application is someone who works as a driver partner, they receive service orders from customers through this application. Our admin and customers need to know the location of the driver who aims to monitor ongoing orders.</span></div><div xss=\"removed\"><span xss=\"removed\"><br></span></div><div xss=\"removed\"><span xss=\"removed\"><span xss=removed>Ordriver collects driver location data to send to the server then forward it to the customer so that the customer can find out the current location of the driver.</span><br></span></div></font></div>', '<div xss=removed><strong xss=\"removed\" xss=removed>Lorem Ipsum</strong><span xss=\"removed\" xss=removed> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></div>', 'Reset Password', 'Registration accepted', '<div style=\"text-align: justify;\"><span style=\"font-size: 0.875rem; font-weight: initial;\">We have received your request to reset the password. Please confirm via the button below:</span></div>', '<div style=\"text-align: justify;\"><span style=\"font-size: 0.875rem; font-weight: initial;\">Ignore this email if you never asked to reset your password. For questions, please contact </span></div>', '<div style=\"text-align: justify;\"><span style=\"font-size: 0.875rem; font-weight: initial;\">Thank you for registering a driver, we have accepted, please click the button below to reset your password:</span></div>', '<span style=\"text-align: justify;\">Ignore this email if you never asked to reset your password. For questions, please contact </span>', 'lol.jpg', 'mail.slogfy.xyz', '465', 'info@slogfy.xyz', 'lopk.000', 'info@slogfy.xyz', 'ssl', 'SlogApp', '<p><span style=\"font-size: 14px; text-align: justify;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s</span><br></p>', 'https://play.google.com', 'Rs.', 'USD', 'sk_test_WRuTFWBsvTvRaCnJt2V87QjQ00vTewyiWS', 'pk_test_kUsRHrV9bdD9LzHq5CYvOqn7001mufIjai', '1', '1', 'Ab95j_J-CIrQ-Fbg6dAv2ee9d1dD3OQLmAqTp_ZJZybEp1OCmqRBaoLBEaAA0cTL_dIjxvGVFWMPGljb', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `number` bigint(20) UNSIGNED NOT NULL,
  `id_user` varchar(200) NOT NULL,
  `balance` int(11) DEFAULT '0',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`number`, `id_user`, `balance`, `update_at`) VALUES
(12, 'M1618761446', 0, '2021-04-18 15:57:26'),
(74, 'P1630573622', 0, '2021-09-02 09:07:02'),
(108, 'D1658242062', 1144, '2022-07-19 14:47:42'),
(45, 'D1626720869', 0, '2021-07-19 18:54:29'),
(13, 'D1618783793', 9995000, '2021-04-18 22:09:53'),
(112, 'P1658696769', 0, '2022-07-24 21:06:09'),
(15, 'D1619075606', 500000, '2021-04-22 07:13:26'),
(16, 'P1619601946', 0, '2021-04-28 09:25:46'),
(17, 'D1619605015', 0, '2021-04-28 10:16:55'),
(18, 'D1619978888', 0, '2021-05-02 18:08:08'),
(19, 'P1619979347', 0, '2021-05-02 18:15:47'),
(20, 'D1620114961', 0, '2021-05-04 07:56:01'),
(21, 'D1620120858', 0, '2021-05-04 09:34:18'),
(22, 'D1620121843', 0, '2021-05-04 09:50:43'),
(23, 'P1621583097', 0, '2021-05-21 07:44:57'),
(24, 'D1621584357', -3000, '2021-05-21 08:05:57'),
(25, 'D1622194674', 0, '2021-05-28 09:37:54'),
(26, 'P1622547855', 0, '2021-06-01 11:44:15'),
(27, 'P1623499414', 100000, '2021-06-12 12:03:34'),
(28, 'P1623751694', 0, '2021-06-15 10:08:14'),
(29, 'D1623751809', -1542, '2021-06-15 10:10:09'),
(30, 'P1623765449', 0, '2021-06-15 13:57:29'),
(31, 'P1623765977', 0, '2021-06-15 14:06:17'),
(39, 'P1624970660', 0, '2021-06-29 12:44:20'),
(34, 'P1624691359', 0, '2021-06-26 07:09:19'),
(36, 'P1624901656', 0, '2021-06-28 17:34:16'),
(37, 'P1624902271', 0, '2021-06-28 17:44:31'),
(38, 'P1624943286', 500000, '2021-06-29 05:08:06'),
(40, 'P1624978649', 0, '2021-06-29 14:57:29'),
(41, 'P1624978880', 0, '2021-06-29 15:01:20'),
(42, 'P1624980130', 0, '2021-06-29 15:22:10'),
(44, 'D1626686751', 0, '2021-07-19 09:25:51'),
(46, 'P1626850955', 0, '2021-07-21 07:02:35'),
(47, 'P1626851687', 0, '2021-07-21 07:14:47'),
(48, 'D1626855709', 0, '2021-07-21 08:21:49'),
(49, 'D1626860698', 0, '2021-07-21 09:44:58'),
(50, 'D1626861883', 0, '2021-07-21 10:04:43'),
(51, 'D1626870410', 0, '2021-07-21 12:26:50'),
(52, 'D1626942556', -10, '2021-07-22 08:29:16'),
(65, 'D1629973756', 0, '2021-08-26 10:29:16'),
(57, 'D1628155846', 4604756, '2021-08-05 09:30:46'),
(70, 'P1630056415', 0, '2021-08-27 09:26:55'),
(59, 'D1628840936', -6226, '2021-08-13 07:48:56'),
(61, 'P1629221586', 0, '2021-08-17 17:33:06'),
(62, 'P1629601740', 0, '2021-08-22 03:09:00'),
(66, 'D1629973907', 0, '2021-08-26 10:31:47'),
(67, 'D1629974496', 0, '2021-08-26 10:41:36'),
(73, 'D1630566263', -310336, '2021-09-02 07:04:23'),
(71, 'D1630126892', -41, '2021-08-28 05:01:32'),
(113, 'P1658697379', 0, '2022-07-24 21:16:19'),
(77, 'D1632034734', 0, '2021-09-19 06:58:54'),
(78, 'P1634731163', 0, '2021-10-20 11:59:23'),
(79, 'D1634808158', -20, '2021-10-21 09:22:38'),
(86, 'P1635421870', 0, '2021-10-28 11:51:10'),
(85, 'P1635400820', 0, '2021-10-28 06:00:20'),
(83, 'P1635243053', 0, '2021-10-26 10:10:53'),
(84, 'P1635244012', 0, '2021-10-26 10:26:52'),
(96, 'D1635774769', 0, '2021-11-01 13:52:49'),
(88, 'D1635747916', 0, '2021-11-01 06:25:16'),
(89, 'D1635747934', 0, '2021-11-01 06:25:34'),
(90, 'D1635748150', 0, '2021-11-01 06:29:10'),
(91, 'D1635748249', 0, '2021-11-01 06:30:49'),
(92, 'D1635748349', 0, '2021-11-01 06:32:29'),
(93, 'D1635749134', 0, '2021-11-01 06:45:34'),
(94, 'D1635757763', 0, '2021-11-01 09:09:23'),
(95, 'D1635758030', -48567, '2021-11-01 09:13:50'),
(97, 'D1635777657', 0, '2021-11-01 14:40:57'),
(105, 'P1655989171', 0, '2022-06-23 12:59:31'),
(100, 'D1655981361', 0, '2022-06-23 10:49:21'),
(101, 'D1655981556', 0, '2022-06-23 10:52:36'),
(102, 'D1655981966', 0, '2022-06-23 10:59:26'),
(103, 'D1655981967', 0, '2022-06-23 10:59:27'),
(104, 'D1655982368', 0, '2022-06-23 11:06:08'),
(109, 'P1658387740', 0, '2022-07-21 07:15:40'),
(110, 'P1658497814', 0, '2022-07-22 13:50:14'),
(114, 'D1658697721', -1347, '2022-07-24 21:22:01'),
(115, 'D1659368939', -35, '2022-08-01 15:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `bank_list`
--

CREATE TABLE `bank_list` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `bank_logo` varchar(250) NOT NULL,
  `bank_account` varchar(250) NOT NULL,
  `bank_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_list`
--

INSERT INTO `bank_list` (`bank_id`, `bank_name`, `bank_logo`, `bank_account`, `bank_status`) VALUES
(1, '57579578', '2df79d9dbc1106bc669f49c25a04e9ef.png', 'rest', '1');

-- --------------------------------------------------------

--
-- Table structure for table `category_item`
--

CREATE TABLE `category_item` (
  `category_item_id` int(11) NOT NULL,
  `category_name_item` varchar(250) NOT NULL,
  `category_item_images` varchar(250) NOT NULL,
  `merchant_id` varchar(250) NOT NULL,
  `created_cat_item` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `all_category` varchar(50) NOT NULL,
  `category_status` varchar(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_item`
--

INSERT INTO `category_item` (`category_item_id`, `category_name_item`, `category_item_images`, `merchant_id`, `created_cat_item`, `all_category`, `category_status`) VALUES
(1, 'All', '', '0', '2020-04-21 08:49:42', '1', '1'),
(4, 'testcat', '', '3', '2021-04-18 15:57:55', '0', '1'),
(5, 'testcat', '', '3', '2021-04-18 15:57:56', '0', '1'),
(6, 'testcate', '', '3', '2021-04-18 16:00:18', '0', '1'),
(7, 'test', '', '3', '2021-04-22 06:48:14', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `config_driver`
--

CREATE TABLE `config_driver` (
  `driver_id` varchar(200) NOT NULL,
  `latitude` varchar(30) NOT NULL DEFAULT '0',
  `longitude` varchar(30) NOT NULL DEFAULT '0',
  `bearing` varchar(250) NOT NULL DEFAULT '0',
  `uang_belanja` int(11) NOT NULL DEFAULT '1',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config_driver`
--

INSERT INTO `config_driver` (`driver_id`, `latitude`, `longitude`, `bearing`, `uang_belanja`, `update_at`, `status`) VALUES
('D1618783793', '28.5172554', '77.2014265', '249.7264', 1, '2021-04-29 11:02:13', '1'),
('D1658242062', '20.2140924', '85.7158405', '256.73056', 1, '2022-08-01 15:56:21', '1'),
('D1619075606', '0', '0', '0', 1, '2021-04-22 07:13:26', '5'),
('D1619605015', '0', '0', '0', 1, '2021-04-28 10:16:55', '5'),
('D1619978888', '23.1960437', '72.6330476', '252.28864', 1, '2021-05-04 08:41:55', '1'),
('D1620114961', '0', '0', '0', 1, '2021-07-21 08:09:05', '4'),
('D1620120858', '0', '0', '0', 1, '2021-05-04 09:34:18', '5'),
('D1620121843', '28.517255', '77.2014204', '249.7264', 1, '2021-05-28 09:35:14', '5'),
('D1621584357', '22.854875740595162', '75.99504746496677', '253.26178', 1, '2021-06-19 02:06:57', '1'),
('D1622194674', '0', '0', '0', 1, '2021-05-28 09:39:02', '4'),
('D1626686751', '0', '0', '0', 1, '2021-07-19 09:25:51', '5'),
('D1623751809', '23.1963674', '72.63331', '252.28845', 1, '2021-07-21 06:33:40', '1'),
('D1626720869', '0', '0', '0', 1, '2021-07-19 18:54:29', '5'),
('D1626855709', '0', '0', '0', 1, '2021-07-21 08:21:49', '5'),
('D1626860698', '0', '0', '0', 1, '2021-07-21 09:44:58', '5'),
('D1626861883', '0', '0', '0', 1, '2021-07-21 10:04:43', '5'),
('D1626870410', '0', '0', '0', 1, '2021-07-21 12:26:50', '5'),
('D1626942556', '28.5172553', '77.2014169', '249.7264', 1, '2021-07-22 09:00:07', '5'),
('D1628155846', '25.9857907', '79.4375116', '251.88593', 1, '2021-08-26 10:36:57', '4'),
('D1628840936', '28.498481666666667', '77.198385', '249.73792', 1, '2021-08-26 10:36:01', '4'),
('D1629973907', '0', '0', '0', 1, '2021-08-26 10:31:47', '5'),
('D1629973756', '0', '0', '0', 1, '2021-08-26 10:29:16', '5'),
('D1629974496', '0', '0', '0', 1, '2021-08-26 10:41:36', '5'),
('D1630566263', '28.5200978', '77.1635857', '249.71541', 1, '2021-11-18 17:04:12', '1'),
('D1630126892', '23.1960258', '72.6332853', '252.2887', 1, '2021-09-03 08:55:39', '3'),
('D1634808158', '28.5177646', '77.1644369', '249.71713', 1, '2021-11-02 06:13:03', '3'),
('D1632034734', '51.5269723', '-0.6640243', '180.73833', 1, '2022-03-17 19:22:08', '1'),
('D1635774769', '20.79993', '70.69784333333334', '253.60565', 1, '2021-11-02 13:45:13', '4'),
('D1635747916', '0', '0', '0', 1, '2021-11-01 06:25:16', '5'),
('D1635747934', '0', '0', '0', 1, '2021-11-01 06:25:34', '5'),
('D1635748150', '0', '0', '0', 1, '2021-11-01 06:29:10', '5'),
('D1635748249', '0', '0', '0', 1, '2021-11-01 06:30:49', '5'),
('D1635748349', '0', '0', '0', 1, '2021-11-01 06:32:29', '5'),
('D1635749134', '0', '0', '0', 1, '2021-11-01 06:45:34', '5'),
('D1635757763', '0', '0', '0', 1, '2021-11-01 09:09:23', '5'),
('D1635758030', '20.799916666666665', '70.69791333333333', '253.60568', 1, '2021-11-25 04:20:13', '1'),
('D1635777657', '0', '0', '0', 1, '2021-11-01 14:42:12', '4'),
('D1655981361', '0', '0', '0', 1, '2022-06-23 10:49:21', '5'),
('D1655981556', '0', '0', '0', 1, '2022-06-23 10:52:36', '5'),
('D1655981966', '0', '0', '0', 1, '2022-06-23 10:59:26', '5'),
('D1655981967', '0', '0', '0', 1, '2022-06-23 10:59:27', '5'),
('D1655982368', '20.2140923', '85.7158397', '256.73056', 1, '2022-08-01 14:22:42', '1'),
('D1658697721', '51.5016143', '-0.7089426', '180.78865', 1, '2022-07-28 07:05:30', '2'),
('D1659368939', '28.5201169', '77.1636009', '249.7154', 1, '2022-08-02 09:28:59', '3');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` varchar(200) NOT NULL,
  `customer_fullname` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `countrycode` varchar(20) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dob` varchar(50) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `customer_rating` double NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `token` varchar(250) NOT NULL,
  `customer_image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_fullname`, `email`, `phone_number`, `countrycode`, `phone`, `password`, `created_on`, `dob`, `latitude`, `longitude`, `address`, `city`, `state`, `zipcode`, `customer_rating`, `status`, `token`, `customer_image`) VALUES
('P1619979347', 'AAA', 'aa@a.com', '917874456665', '+91', '7874456665', 'ebc1e93c8b301a465e37bf5c64319c4ab81e119b', '2021-05-02 18:15:47', '2021-05-02', '23.196038', '72.632954', 'DA IICT RD', 'Ahemdabad', 'GJ', '382006', 0, 1, 'e_YqpMq0R8CY9lH6ybwYux:APA91bFuZ1Qj-LtWrFkecLOHLNx1CwI7KZPpJj_Uuacr2Nv9fQR7Nwx3aWtOwboC3s1JB5AE1nRcswqP-p4hmInEi9rNkBdVf2sCAD_NmL7bVe4ZslXlrRIFDDyjwjXP8An754sDEm-S', '1619979347-22343.jpg'),
('P1622547855', 'shaillk99@gmail.com', 'shaillk99@gmail.com', '916352188966', '+91', '6352188966', 'd1aa530969331002bd192fd05064dbd85d5d14e1', '2021-06-01 11:44:15', '2021-06-01', '', '', '', '', '', '', 0, 1, 'dRXhbEP7QB-a38aCcB3p3J:APA91bGk3ampdsc1Zt8FBrkJm6F2qaar2szVw3zfZUJRL0or3ncxcPl3hQ5eWwP3bd6kC5w__Ss24HFPpdA_7BBTOYnzARBMjcEWnYFVbtlWmNUDbWJpj0xSfDLDH1IjEKysizy4AQCf', '1622547855-71017.jpg'),
('P1626851687', 'ajay', 'sloggroups@gmail.com', '917880648217', '+91', '7880648217', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-07-21 07:14:47', '2011-01-03', '23.1962218', '72.6306846', 'gurhat', 'Fhandhinagar', 'Gujrat', '382421', 0, 1, 'T1626851687', 'b3ce63d7bff9649c0dce41ebc47a9475.jpg'),
('P1619601946', 'Mohit', 'mohitjaiswal0995@gmail.com', '918958757107', '+91', '8958757107', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '2021-04-28 09:25:46', '1997-09-19', '22.854875698685646', '75.99478251300752', 'Dakachya', 'Indore', 'MP', '453771', 0, 1, 'cTivrX5gRz6e1_RZ9v04iR:APA91bGDB0eXKHe_1F_qqqYPmw8R0g2yApExZ4quJLU3C2tPtMz55_AmDS0qMDpRX97oBWneW7UjciAtKNkJrxa7q17uA0ySl9CSb-SC47I9AArpvxs_RRKn8ivVPpefxdQGoMU9B4J6', '1619601946-64951.jpg'),
('P1621583097', 'jitendra patel', 'jitupatel7687@gmail.com', '919009497975', '+91', '9009497975', '7c222fb2927d828af22f592134e8932480637c0d', '2021-05-21 07:44:57', '1987-06-07', '22.854875698685646', '75.99478251300752', 'Palasiya', 'Indore', 'MP', '453771', 0, 1, 'f_nfMTiYRxKnRVflciQRW4:APA91bFS0qgl65RtS0kS-ho9FE4hh-A5SzRnIzsV9Jc8LPIJWobaJ6Yuc24akYC2kV0_D5QYKl3BD_xs2mt8aE2Gpw051TI1zoHFoxS0QLtBPzqJzpLEtCt06kysQ-Er7uHWiWEc9saq', '1621583097-15235.jpg'),
('P1658696769', 'Suman', 'sumanpal300@gmail.com', '447551415622', '+44', '7551415622', '60cb6fbcda1b8606e74e58e65bfcb693e09a69d9', '2022-07-24 21:06:09', '1991-06-01', '51.610157', '-0.70909', '64 prors way', 'Maidenhead', 'maidenhead', '1234', 0, 1, 'coORrgPcRW6-D3UstgVQr3:APA91bElanJmVIWPTwqULREFGgCPdjRFQhDPIClpsr3zVZIPG0q8vedU-pkBfu2BPqRjFKYSINAwSm7VSLhX5G2csyvx0j783oZmVt5EPX9eMLF_0178D1wlNJ-9dOZ_VGkBp1l4OIJk', '8e7a151d1e587d286c045f2a9a7630e5.jpeg'),
('P1626850955', 'Janmejay singh', 'worldslog@gmail.com', '917007344184', '+91', '7007344184', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-07-21 07:02:35', '2021-07-14', '23.1961626', '72.630985', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421', 'Delhi', 'Delhi', '110030', 0, 1, 'T1626850955', '3cb246e282e2f5707519903522dbc670.png'),
('P1623751694', 'dhairya', 'd@gmail.com', '917041637900', '+91', '7041637900', '23dafed011e7b7a6d97650586d0fbba0a34de81d', '2021-06-15 10:08:14', '2021-06-15', '23.2139504', '72.6345805', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India', 'Gandhinagar', 'Gujarat', '382421', 0, 1, 'cR1mKlwLS-e93VyIrIx5m0:APA91bGPDpfUR_DM7s6bHj1mqUTCdiF5wn1LJCSCsYdlLurfucPoYP47gtnJFuxb7p0fBXZct9YfErE4-J_1FX2b4E9V6BXT3xm-D4AW_cqUlpvLqSi8OaPmBqNW0_1tETMoz4zu042u', '1623751694-2021.jpg'),
('P1623765449', 'Kaushik', 'keshavkaushik14@yahoo.com', '919990091946', '+91', '9990091946', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-06-15 13:57:29', '2021-06-15', '28.5132749', '77.2300491', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India', 'New Delhi', 'Delhi', '110062', 0, 1, 'cIGT6_MuR2GABQs2KHOlVh:APA91bFqk9RAaqS4XAabu_0EKyNu2bIgtVOYB5AWaBdAHr2gK1IdPfVN0xgZdeCGOAviFJCD4dbHF22sqzeBetswnz2jiyjuwq68PNysqtK7s95ywesnzEoyAI02_o4-0xQFjVaF7lR5', '1623765449-31423.jpg'),
('P1623765977', 'kapil', 'kapil.rao1027@gmail.com', '917042765377', '+91', '7042765377', 'fcab423c2227a33f4bf84a110c77c7c6fbee6d79', '2021-06-15 14:06:17', '2001-06-15', '28.5131591', '77.2042575', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India', 'New Delhi', 'Delhi', '110030', 0, 1, 'cQsZwmVMT3WXgOrLY4lQw0:APA91bFS-ZYcECKCWD4NYrLvK3i2N7_rrIfIIEuOozCkQ-t8OQshh31KX2gYUeEv4esSp5YJGtkUTU9AQO7oSogVUh3pplByyQFj3LKLSJx-Vqqpr_WRVjdKzsezhgrJsKtk6Dgf40QJ', '1623765977-25439.jpg'),
('P1630573622', 'naendr main', 'narendok22@gmail.com', '918851719915', '+91', '8851719915', '0fc72a727470f3ed4ce3808552bda3ccee93ab97', '2021-09-02 09:07:02', '1944-01-26', '28.5190292', '77.1972687', 'gurukul library, near oye rooms, sidulajab, saket', 'Delhi', 'Delhi', '110030', 0, 1, 'f27AOmeVTqG2aYn92kHHSi:APA91bFrvsTbhA8NL8CDY9lJeYKsDDXt68trnZHtMA9Y3wkepagEal23AEXLT_IPxkdEfznMLo9SYbhBB5zeWqqkG2me0KBuVC0F3UWSIrNDnWuRz138uzcL4J9sKn00osOr3Ykdcv9Y', 'ab008739963ad1f7770cbaaa1b042471.png'),
('P1624970660', 'Satyam', 'singhsatyamks@gmail.com', '918104375247', '+91', '8104375247', '38d7378acabb74e1d66f5524f9c38d903da8a61b', '2021-06-29 12:44:20', '1992-03-10', '19.1133753', '72.8653091', '151, Andheri- Kurla Rd, Chimatpada, Marol', 'Andheri East Mumbai', 'Maharashtra', '400059', 0, 1, 'cKuWpZAZQTK7WUoqhJTs3Y:APA91bHjpgKLgnb4P4whwsN6Wjb4dGnzYnQOV2g6sywf36K6skUD5YiXdNmbLXd5wPDd8OVtZ3xlKo3dER6YK0oEzPh1KG2lOYJicSz1Fq78PN1Bz9lczN4FW4Dv3fWrMWkAftEvW3zs', 'noimage.jpg'),
('P1624691359', 'Sanjay', 'vermasanjay844@gmail.com', '918765094789', '+91', '8765094789', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-06-26 07:09:19', '2006-06-26', '28.517253', '77.2014179', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11', 'New Delhi', 'Delhi', '110030', 0, 1, 'c9-GEb41QeSdzmI6Xmojfy:APA91bFx0Ck87uoR4ZQ27ZLXkS0CJ8N55jYJwdz1T61d5KlVPi057Cl09H5RnIl_GaAoAMVRdJReSqvX292wq0M1UsGKKQn0GDFy-ZGHYMLnm6cthcMglImI0IXqGEtdS0XuXguv2D8q', '1624691359-59109.jpg'),
('P1624901656', 'test', 'test@gmail.com', '621234567890', '+62', '1234567890', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '2021-06-28 17:34:16', '2021-06-28', '', '', '', '', '', '', 0, 1, 'T1624901656', 'noimage.jpg'),
('P1624902271', 'test123', 'test2@gmail.com', '629879871234', '+62', '9879871234', '109f4b3c50d7b0df729d299bc6f8e9ef9066971f', '2021-06-28 17:44:31', '2021-06-28', '12345', '12345', 'test', 'delhi', 'delhi', '123456', 0, 1, 'T1624902271', 'noimage.jpg'),
('P1624943286', 'Janmejay', 'janmejay23@gmail.com', '919205137675', '91', '9205137675', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '2021-06-29 05:08:06', '1999-11-26', '28.5147319', '77.1960034', 'F-244 , G. Floor, Front office saidulajab, near mother dairy', 'Delhi', 'Delhi', '110030', 0, 1, 'e_YqpMq0R8CY9lH6ybwYux:APA91bFuZ1Qj-LtWrFkecLOHLNx1CwI7KZPpJj_Uuacr2Nv9fQR7Nwx3aWtOwboC3s1JB5AE1nRcswqP-p4hmInEi9rNkBdVf2sCAD_NmL7bVe4ZslXlrRIFDDyjwjXP8An754sDEm-S', 'eb06356f7ac18893bdca5e8f6f80a0b3.png'),
('P1624978649', 'Ranapratap', 'rana@gmail.com', '919838847375', '+91', '9838847375', '8d58ecef2d88fb79f1104d14ee71c3b832331176', '2021-06-29 14:57:29', '1991-12-10', '28.6657628', '77.0635248', '4, 50 feet Rd, Nihal Vihar, Nangloi, New Delhi', 'new Delhi', 'Delhi', '110041', 0, 1, 'T1624978649', 'noimage.jpg'),
('P1624978880', 'Sadanand', 'sadanand@gmail.com', '919892999531', '+91', '9892999531', '43bdb83869cd076bc0a049fb5d821033e17067ef', '2021-06-29 15:01:20', '1991-12-10', '19.1541124', '72.8838548', 'SRD Building 3, Aarey Rd, Royal Palms, Aarey Colony, Goregaon Mumbai Maharastra', 'Goregaon', 'Maharashtra', '400065', 0, 1, 'T1624978880', 'noimage.jpg'),
('P1624980130', 'rajkumar', 'rajkumar1996azm@gmail.com', '917783908048', '+91', '7783908048', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2021-06-29 15:22:10', '1993-01-01', '25.7235112', '82.9156981', 'Rajkumar Rajbhar Gosaigunj Azamgarh', 'azamgarh', 'uttar pradesh', '276201', 0, 1, 'eHiMpvW4SNatCVkHhQza7G:APA91bFnNJMaIE3kP0TPtELgKp3UVKfXfsBmxpAiT91sdkV8Z7wJeTI878ft-66ZjgE_EQ1pNEFung_Xy_YszUmLhnDXPTjPiUGczyRHfGAUxsj5IJU5CQsMtuir5GLn7zHaRibtAjQt', 'noimage.jpg'),
('P1630056415', 'internyash', 'yashokk@gmail.com', '918802064294', '+91', '8802064294', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-08-27 09:26:55', '1994-02-01', '28.5190292', '77.1972687', 'gurukul library, near oye rooms, sidulajab, saket', 'Delhi', 'Delhi', '110017', 0, 1, 'crHQRhumQMqlAOr5_wQWhQ:APA91bEB01kKzyG56BPO2HhlHDnF7KspvHyfE_akRHt_rQf7mcZcSOOtVSAMN1YbnHBCVk3xi6Nxp-NPQgVUqfhk4uwiS8gv9bd1vtoDRtQHsSqzAEQjcvdMJZA64Chf01TrBxSLk3wx', '913f267a7a4c1df87f909077d3c1c250.jpg'),
('P1629601740', 'man', 'mansinghokay@gmail.com', '917897696650', '+91', '7897696650', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-08-22 03:09:00', '1996-10-26', '25.9890637', '79.4282152', 'F-244 , G. Floor, Front office saidulajab, near mother dairy', 'Orai', 'jalaun', '285001', 0, 1, 'fv9WYyNhT1m1K9Swmzt7jD:APA91bElIOLxrDhJdIYc7Da3Bfk59NVg3JN7VBPFBklHpBGGdrUbcOBrR46ebqIg3jU1BoN85QN9yN6hODAOmagoiKKfgdOhIRdwxK8CQPnP5yBhzaoaaY1Z7xxvHJnkO_aDjWRctnxu', '7e8ad53a61f9c4d93eb488a183ae8f1d.png'),
('P1629221586', 'surajsi', 'testingslog2@gmail.com', '919871873043', '+91', '9871873043', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-08-17 17:33:06', '2020-02-06', '28.5190292', '77.1972687', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,', 'Delhi', 'Delhi', '110017', 0, 1, 'fv9WYyNhT1m1K9Swmzt7jD:APA91bElIOLxrDhJdIYc7Da3Bfk59NVg3JN7VBPFBklHpBGGdrUbcOBrR46ebqIg3jU1BoN85QN9yN6hODAOmagoiKKfgdOhIRdwxK8CQPnP5yBhzaoaaY1Z7xxvHJnkO_aDjWRctnxu', '0557802585323cdf4caa2b3ccf595e63.png'),
('P1658697379', 'indresh', 'indresh.poul22@gmail.com', '447555422631', '+44', '7555422631', '60cb6fbcda1b8606e74e58e65bfcb693e09a69d9', '2022-07-24 21:16:19', '1991-12-10', '51.5016262568298', '-0.7089601553811593', '64', 'Beaconsfield', 'maidenhead', '1212', 0, 1, 'cDGeFuLPTlqiVuipEDyMe1:APA91bHPefTD_AdQGLAOa_jGERE69bAykYZVI8Kj3gX8C6C3PhIiIJfs_xyRWSbeftS4gs8pDL__IdZDBOzh-6MMr--ovo9XZ8RT2pftcjL7tbsp54EGxAh4SSJ67yeBYC4q9go8mxtg', '5ac6fb9dfbc2dd1ae2acb892e4c1255b.jpeg'),
('P1658387740', 'aksash verma', 'Akashkumar511yahoo@gmail.com', '919560702457', '91', '9560702457', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '2022-07-21 07:15:40', '1995-10-26', '28.510918', '77.175064', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,', 'Delhi', 'Delhi', '110070', 0, 1, 'dqjes0q3R7CINlnbhD2cq9:APA91bGk8hovQg6szzJ1oWRh5xgDwQ05I2FNlZk6_V6JrTy8VM2SM8XrQZXvFCZfqmBFdObYU1T8AP2skH82WaSC6KTtmyoIH-3VfVAtVvDMttYBbNpy6vSfnZoEIpGYB_J9jQoBKnQJ', '34eda80897583a43b3a7d6300cab8337.png'),
('P1634731163', 'kapil verma', 'syedmusaib66@gmail.com', '919949998790', '91', '9949998790', '356c60da82398e943f7d69b6ae35d2bd2da4ef66', '2021-10-20 11:59:23', '1994-06-24', '', '', '', '', '', '', 0, 1, 'fv9WYyNhT1m1K9Swmzt7jD:APA91bElIOLxrDhJdIYc7Da3Bfk59NVg3JN7VBPFBklHpBGGdrUbcOBrR46ebqIg3jU1BoN85QN9yN6hODAOmagoiKKfgdOhIRdwxK8CQPnP5yBhzaoaaY1Z7xxvHJnkO_aDjWRctnxu', '8bfa5548eb24297dac810f3c129118e6.png'),
('P1635421870', 'Yash', 'yashpatilc2001@gmail.com', '917517096043', '+91', '7517096043', '2b4f958885b7bef4f2e830b56f1e1a57a1fd28cb', '2021-10-28 11:51:10', '2001-11-08', '', '', '', '', '', '', 0, 1, 'esUaR5GGTG-3hIwSUfKJOe:APA91bE4cPXTlZf7aVDIW8ovqmgNbqS7dGWR5hrz-d5q9-9amxNgn5Uo6wQ0DnsdRlyve17mq7EjHLWlFxCqSs89Q_Yosv6_5qmrcRoUKKxIqviff_JakSvIxSmOAPPuovZKN7o3lAxs', '1635493798-88433.jpg'),
('P1635400820', 'samarth', 'samarthkariya.3@gmail.com', '918849753350', '+91', '8849753350', 'd5a1541787c4b53ec9242fc71c47f0a7729e9433', '2021-10-28 06:00:20', '2021-10-13', '20.799820', '70.697646', '', 'kodinar', 'gujarat', '362720', 0, 1, 'eE9LT7WdTeqrz85d2JZYtA:APA91bGKi2tKlchvi4UcZAr_By1Rie7KsjMKix4rTAhyUQau4eMTZFudMxOx36lrNXhRBnU_8u6iXjcoShYtOBzs5GxYlHpQidCBKSh9l_B5mdJUJT6B491GddaiDMsFSWNgxDM0C7jA', '1635440883-45306.jpg'),
('P1635244012', 'kapil verma', 'lopklopk134@gmail.com', '919158532170', '91', '9158532170', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '2021-10-26 10:26:52', '2000-02-24', '', '', '', '', '', '', 0, 1, 'fv9WYyNhT1m1K9Swmzt7jD:APA91bElIOLxrDhJdIYc7Da3Bfk59NVg3JN7VBPFBklHpBGGdrUbcOBrR46ebqIg3jU1BoN85QN9yN6hODAOmagoiKKfgdOhIRdwxK8CQPnP5yBhzaoaaY1Z7xxvHJnkO_aDjWRctnxu', '9f391d96ac40f066805a1274722a50e5.png'),
('P1635243053', 'kapil verma', 'lopklopk124@gmail.com', '919921547051', '91', '9921547051', 'fe44e13e7edba5eb5df4221530ba5711a816cb06', '2021-10-26 10:10:53', '2000-02-26', '', '', '', '', '', '', 0, 1, 'cUtwquzbTp-I6-2d7LLXge:APA91bE5xKTApcOmX3W2YdFAnz1LEkhw-RbwKlnB_N20ymkHOjA8oONShonp58rXMcOT62KLl2YYK5LYj92IljItvYCSzL-n9x4yFHy1x28vyszx6LSKsPrC8NRhNajYTmvkhCaKRcIW', '993f5f7dedf6ebebfade92626f248098.png'),
('P1655989171', 'Suraj', 'hotmailsuraj@gmail.com', '918408068178', '+91', '8408068178', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '2022-06-23 12:59:31', '2000-08-10', '20.214285653173224', '85.71581339342228', 'Bhubaneswar', 'Bhubaneshwar', 'Odisha', '752054', 0, 1, 'cqCPSpoRpFhrNswIKd-I6R:APA91bGaN-stWZNFMTm-nwDvE58aRb3NLqxJTrmwVu7mzk6jIjTxTwI9Lfv718C4jkqiuf2x8sPHRQKPIA7pMzM7kKLkmey4bxZX_9dbE1g4emJBFh7c1iqAPRENzAypAI9Y4ty58gBt', '3dc6e0701ef6af9993b1b2863a613088.jpg'),
('P1658497814', 'Suraj', 'infraredparadox@gmail.com', '91+91 87660 393', '91', '+91 87660 39312', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '2022-07-22 13:50:14', '2000-08-10', '', '', '', '', '', '', 0, 1, 'T1658497814', 'a5721d9b12b8a095b3c91ebfd2690f48.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_send_transaction`
--

CREATE TABLE `detail_send_transaction` (
  `send_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `goods_item` varchar(250) NOT NULL,
  `sender_name` varchar(250) NOT NULL,
  `receiver_name` varchar(250) NOT NULL,
  `sender_phone` varchar(250) NOT NULL,
  `receiver_phone` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_send_transaction`
--

INSERT INTO `detail_send_transaction` (`send_id`, `transaction_id`, `goods_item`, `sender_name`, `receiver_name`, `sender_phone`, `receiver_phone`) VALUES
(13, '135', 'document', 'dhairya', 'shsj', '+917874456665', '+621113334445'),
(14, '136', 'document', 'xhxhxh', 'HH', '+6275457575767', '+6276464649797'),
(15, '138', 'document', 'avzuvuqzx', 'axax', '+62818181884', '+62848497979'),
(16, '139', 'document', 'zbzb', 'zhhz', '+62767676', '+62767676'),
(17, '140', 'document', 'bzbzb', 'shzhz', '+62766467', '+624676776'),
(18, '142', 'document', 'test', 'test recieve', '+628851719915', '+629643872577'),
(19, '143', 'document', 'jitendra patel', 'nikesh', '+919009497975', '+919770382020'),
(20, '145', 'document', '26255535', 'dgg', '+62918851719915', '+624846880898'),
(21, '146', 'document', 'jitendra', 'sanju', '+919009497975', '+919865329865'),
(22, '147', 'document', 'shsh', 'xudy', '+91766446', '+918564343'),
(23, '148', 'document', 'jitendra pat', 'jp', '+919009497975', '+6297703820202'),
(24, '149', 'document', 'jpppp', 'rp', '+919009497975', '+91494994949'),
(25, '150', 'document', 'ji', 'ghh', '+629009497975', '+6254564455555'),
(26, '152', 'document', 'rp', 'mp', '+62794499499', '+62794949499494'),
(27, '153', 'document', 'dhshs2872277', 'sjjaj', '+629779946464', '+62136767676767'),
(28, '154', 'document', 'gfff', 'rudhdhf', '+62554158745', '+628644643437'),
(29, '155', 'document', 'jssjjsz', 'w7wjdudy', '+624949499494', '+6261998984949'),
(30, '156', 'document', 'sjjjsjsjs', '277277', '+621646464676', '+6279794949944'),
(31, '157', 'document', 'jp', 'mp', '+629009497975', '+629894946646'),
(32, '158', 'document', 'shsb', 'whhah', '+6246664664946', '+62799797'),
(33, '159', 'document', 'jp', 'dj', '+629009497975', '+6289894949449'),
(34, '160', 'document', 'jp', 'kd', '+6259494949999', '+62894499499449'),
(35, '161', 'P1621583097', 'jp', 'mp', '9009497975', '9770382020'),
(36, '162', 'P1621583097', 'jp', 'mp', '9009497975', '9770382020'),
(37, '163', 'P1621583097', 'jp', 'mp', '9009497975', '9770382020'),
(38, '164', 'P1621583097', 'jp', 'mp', '9009497975', '9770382020'),
(39, '165', 'P1621583097', 'jp', 'mp', '9009497975', '9770382020'),
(40, '166', 'P1621583097', 'jp', 'mp', '9009497975', '9770382020'),
(41, '167', 'document', 'dhairay', 'nzzn', '+917979797997', '+9197979797971'),
(42, '1', 'document', 'jp', 'mp', '+6246494699491', '+6289797947979449'),
(43, '2', 'document', 'shhs', 'bzzjsj', '+916464646464', '+915946464646'),
(44, '3', 'document', 'bdbdbd', 'whhshs', '+624949944994', '+624979979779'),
(45, '4', 'document', 'hehrjr', 'eeehe', '+625956564464', '+6256646494949'),
(46, '5', 'document', 'xhhzx', 'sgG', '+916776674785', '+914646464444'),
(47, '6', 'document', 'hsh', 'hH', '+917979797979', '+917676464646'),
(48, '7', 'document', 'kapil', 'kapil recipient', '+919696969699', '+918888888888'),
(49, '8', 'document', 'testing', 'testing', '+919990091946', '+919990091946'),
(50, '9', 'document', 'vzjdjjr', 'ndjdjdjj', '+918464949994', '+91899497979'),
(51, '10', 'document', 'dhjdj', 'shjsjdn sjdnxb', '+9156569895', '+915979979797'),
(52, '11', 'fashion', 'sjssjs', 'sbsbsbsn', '+91494995', '+917979794949'),
(53, '12', 'document', 'gdjdhdh', 'gdjdhdh', '+91564649494', '+9154646466'),
(54, '13', 'document', 'hdjdhdh', 'zvzbbshdn', '+9146497979', '+914949799787'),
(55, '14', 'document', 'shsjhdb', 'zvzbbxhd', '+91898679499', '+917976679898'),
(56, '15', 'document', 'svgs', 'Vvsshb', '+9191919494949', '+919494466446'),
(57, '16', 'document', 'dhhxjcj', 'vshdhcbc', '+91956468484', '+91596464998'),
(58, '17', 'document', 'zhhz', 'zuzh', '+91734676797', '+9173767677676'),
(59, '18', 'document', 'hzgzz', 'zgzvzgz', '+91434649797', '+917576767676'),
(60, '19', 'document', 'hsjjd', 'gsghxjxj', '+91964376676', '+918851719917'),
(61, '20', 'document', 'bfjdjxh', 'zvzhzjj', '+9149646797', '+91764676977'),
(62, '21', 'document', 'bzhzjsb', 'svshhzb', '+919797979', '+917967679'),
(63, '22', 'document', 'svhdhdh', 'dvsbbzb', '+91499494989', '+9179949595'),
(64, '23', 'document', 'gujgg', 'xfghh', '+915382', '+918663566'),
(65, '24', 'document', 'indresh pal', 'indresh pal', '+447405937994', '+447551415622'),
(66, '25', 'document', 'hshs', 'hxhd', '+916464646895', '+91676767676767'),
(67, '26', 'document', 'dece', 'xsxe', '+9181812188184', '+91818182828284'),
(68, '27', 'document', 'sggs', 'sgshs', '+914434646464', '+914546464646'),
(69, '28', 'document', 'dvdjdj', 'hfjdjdhd', '+917846466767', '+914846499745'),
(70, '29', 'document', 'af', 'agahahsys', '+917454554444', '+914646646494'),
(71, '30', 'document', 'af', 'agahahsys', '+917454554444', '+914646646494'),
(72, '31', 'document', 'af', 'agahahsys', '+917454554444', '+914646646494'),
(73, '32', 'document', 'af', 'agahahsys', '+917454554444', '+914646646494'),
(74, '33', 'document', 'af', 'agahahsys', '+917454554444', '+914646646494'),
(75, '34', 'document', 'zvhzbzb', 'zcvzvzv', '+9179797978', '+9197979797'),
(76, '35', 'document', 'BB', 'shaha', '+917464646464', '+914316478787'),
(77, '36', 'document', 'narendd', 'zvbzbxb', '+9159898998', '+9179799798'),
(78, '37', 'document', 'svvzv', 'gzggxg', '+91876767', '+915467667'),
(79, '38', 'document', 'vzbvzv', 'hdjdjdj', '+9179797997', '+9149767667'),
(80, '39', 'document', 'zvbzbz', 'svVvr', '+919897979', '+9197979797'),
(81, '40', 'document', 'vzhzhz', 'zvhzbzh', '+9145676767', '+91454697'),
(82, '41', 'document', 'svbxbz', 'dggxgx', '+91679797', '+9155866767'),
(83, '42', 'document', 'indresh pal', 'indresh pal', '+447405937994', '+447405937994'),
(84, '43', 'document', 'sbhzhxh', 'zgzhzvvzv', '+919868979#', '+9176676767'),
(85, '44', 'document', 'indresh pal', 'indresh pal', '+447405937994', '+447405937994'),
(86, '45', 'document', 'indresh pal', 'indresh pal', '+447405937994', '+917405937994'),
(87, '46', 'document', 'dgdjjf', 'zvbzbz', '+9164649794', '+919595997'),
(88, '48', 'Twsy', 'gshdh', 'xhzhhz', '+91565665', '+91597697'),
(89, '49', 'document', 'bzbz', 'zbzh', '+917676767676', '+914646767676'),
(90, '50', 'document', 'zvzvv', 'bzhxbdb', '+9149599898', '+9149494994'),
(91, '51', 'document', 'hshzhd', 'vzbxjjx', '+91689797', '+916568668'),
(92, '52', 'document', 'bxbzyou', 'vzbzbz', '+917756797', '+915797979'),
(93, '53', 'document', 'dbhx', 'sgs', '+91499494', '+9154646'),
(94, '54', 'document', 'vzvzzggz', 'vzvvz', '+91867', '+917979'),
(95, '55', 'document', 'rtf', 'rfgh', '+915288', '+9122688'),
(96, '56', 'document', 'gzgz', 'xxx', '+91858686', '+91858686'),
(97, '57', 'document', 'zgsh', 'zys', '+916764137676', '+914646646464'),
(98, '58', 'document', 'sysy', 'Gaha', '+914613164679', '+911646464649'),
(99, '59', 'document', 'Gag', 'qyqyta', '+911231247887', '+914545548797'),
(100, '60', 'document', 'wusvvusw', 'qGQG', '+914134151514', '+917181751787'),
(101, '61', 'document', 'da', 'zagza', '+911567487487', '+918146864757'),
(102, '62', 'document', 'zvV', 'Gaga', '+917616164649', '+914646797979'),
(103, '63', 'document', 'vz', 'gzgzg', '+91464677', '+915457997'),
(104, '64', 'document', 'zjs', 'zhz', '+916764649779', '+915646464646'),
(105, '65', 'document', 'zvvz', 'dbsb', '+9149799', '+91194991'),
(106, '66', 'document', 'hsbxzgxb', 'gxvvx', '+91879798', '+9157668'),
(107, '67', 'document', 'vzgz', 'gzgfggxv', '+91838', '+916767'),
(108, '68', 'document', 'gzvz', 'sbzv', '+917979', '+91797'),
(109, '69', 'document', 'zv', 'svsb', '+917979', '+914897'),
(110, '70', 'document', 'bxvd', 'zbbzv', '+9189899', '+9197979'),
(111, '71', 'document', 'hfjf', 'gshxh', '+91599767', '+91689898'),
(112, '72', 'document', 'dd', 'r', '+9155', '+9155'),
(113, '73', 'document', 'dddde', 'df', '+9155', '+9155'),
(114, '74', 'document', 'vzvz', 'bsv', '+917979', '+918979'),
(115, '75', 'document', 'sbdh', 'zbzb', '+91599', '+917997'),
(116, '76', 'document', 'zvzv', 'xbzb', '+9179979', '+917997'),
(117, '77', 'document', 'svvzv zzb', 'vzvgh.z', '+917997', '+91767'),
(118, '78', 'document', 'zbbz', 'zvvz in', '+91979', '+916497'),
(119, '79', 'document', ',fztd', 'gxtcy', '+913535382858', '+916535285050'),
(120, '80', 'document', 'xyc', 'u h', '+916868686868', '+913838686060'),
(121, '81', 'document', 'zgz', 'gzvz', '+916797', '+915767'),
(122, '82', 'document', 'gz', 'gz', '+9175', '+91677'),
(123, '83', 'document', 'Vs sgzh', 'shzh', '+914697', '+914949'),
(124, '84', 'document', 'sgbwr', 'zcsge', '+912184848487', '+918484858584'),
(125, '85', 'document', 'sgwg', 'xahxahxa', '+914548459151', '+911594608467'),
(126, '86', 'document', 'hxu', 'ch', '+91868', '+91868'),
(127, '87', 'document', 'ch', 'hc', '+918338', '+91606'),
(128, '88', 'document', 'csfs', 'fsgs', '+918461648487', '+918594845151'),
(129, '89', 'document', 'dvdwfs', 'vadwfvvw', '+914540418515', '+919451954955'),
(130, '90', 'document', 'feeg', 'dacsdqvd', '+914959159151', '+915481621266'),
(131, '91', 'document', 'vzgz', 'xvvz', '+918989', '+9179794'),
(132, '92', 'document', 'svsv', 'zgz', '+91779', '+917997'),
(133, '93', 'document', 'xg', 'xvx', '+9189', '+91868'),
(134, '94', 'document', 'vxx', 'xg', '+91868', '+9158'),
(135, '95', 'document', 'xx', 'fc', '+91888', '+91888'),
(136, '96', 'document', 'xx', 'cc', '+9188', '+9188'),
(137, '97', 'document', 'ff', 'gv', '+9155', '+9185'),
(138, '98', 'document', 'vzb', 'xvv', '+918997', '+91791'),
(139, '99', 'document', 'zb', 'db', '+919797', '+9179'),
(140, '100', 'document', 'vz', 'bxv', '+9197', '+91798'),
(141, '101', 'document', 'zvvx', 'zbzb', '+917989', '+91779'),
(142, '102', 'document', 'vV', 'vzv', '+917587', '+91799'),
(143, '103', 'document', 'xg', 'vzh', '+9187', '+91797'),
(144, '104', 'document', 'vz', ' z', '+91797', '+9197'),
(145, '105', 'document', 'zvvz', 'vx', '+91767', '+91898'),
(146, '106', 'document', 'vzvz', 'gzzxvv', '+917557', '+91858'),
(147, '107', 'document', 'fzv', 'vzv', '+917557', '+91897'),
(148, '108', 'document', 'vz', 'gzv', '+917579', '+91579'),
(149, '109', 'document', 'vz', 'vd', '+9179', '+9148'),
(150, '110', 'document', 'xx', 'xx', '+917', '+9188.'),
(151, '111', 'document', 'dvvs', 'vadv', '+915464594594', '+911659458499'),
(152, '112', 'document', ' dg', 'bafvwf', '+916126548450', '+919519158158'),
(153, '113', 'document', 'gv', 'vv', '+916', '+9166'),
(154, '114', 'document', 'v', 'g', '+916', '+9163'),
(155, '115', 'document', 'fz', 'gsg', '+9185', '+9135.'),
(156, '116', 'document', 'vzv', 'zv', '+9197', '+9146'),
(157, '117', 'document', 'gg', ' f', '+9195', '+9155'),
(158, '118', 'document', 'dgshs', 'sgshs', '+911661346497', '+914646467979'),
(159, '119', 'document', 'narrbd', 'bxbx', '+91989', '+91986'),
(160, '120', 'document', 'vzx', 'vxv', '+91686', '+91686'),
(161, '121', 'document', 'dvhs', 'gfgz', '+9178877', '+916497'),
(162, '122', 'document', 'zbg', 'bxv', '+9189', '+918'),
(163, '123', 'document', 'zb', 'bxb', '+91979', '+918998'),
(164, '124', 'document', 'bx', 'bdbd', '+91949', '+919897'),
(165, '125', 'document', 'vsv', 'bzb', '+914998', '+91686'),
(166, '126', 'document', '73', 'bdb', '+91686', '+91989'),
(167, '127', 'document', 'gzg', 'hxh', '+913768', '+916898'),
(168, '128', 'document', 'ff', 'bxb', '+91956', '+919568'),
(169, '129', 'document', 'dhh', 'hx', '+91595', '+9184'),
(170, '130', 'document', 'gdg', 'dgg', '+9186', '+91566'),
(171, '131', 'document', 'x', 'xx', '+9188', '+91588'),
(172, '132', 'document', 'cgtc', 'wzgwzg', '+919391679716', '+911784138713'),
(173, '133', 'document', 'vhqsvsh', 'wzvhwzvhwz', '+914861346914', '+911793161616'),
(174, '134', 'document', 'zv', 'zhshsh', '+917646464794', '+911343467679'),
(175, '135', 'document', 'xnxnx', 'ahah', '+917649497849', '+914646797997'),
(176, '136', 'document', 'stzv', 'agG', '+914546799799', '+914545786767'),
(177, '137', 'document', ' zhsvwh', 'zwyczwvy', '+914131848468', '+915135916711'),
(178, '138', 'document', 'vyqavqy', 'YUQv', '+914143134961', '+917179137913'),
(179, '139', 'document', 'bsgbaf', 'advadvad', '+917494594954', '+919815915448'),
(180, '140', 'document', 'csge', 'bafafh', '+914615126426', '+919159459485'),
(181, '141', 'document', 'vsb', 'bsbs', '+9189795995', '+91979'),
(182, '142', 'document', 'vsvs', 'vs', '+91949', '+919797'),
(183, '143', 'document', 'xxx', 'yxyx', '+9188', '+91868'),
(184, '144', 'document', 'sfgz', 'ztgx', '+91757', '+918238'),
(185, '145', 'document', 'vzv', 'vdh', '+916767', '+915698'),
(186, '146', 'document', 'xgx', 'xgyx', '+918388', '+918388'),
(187, '147', 'document', 'fz', 'dgg x', '+91888', '+91838'),
(188, '148', 'document', 'x', 'dgx', '+918 ', '+9188'),
(189, '149', 'document', 'dgsh', 'gzgz', '+916868', '+9135335'),
(190, '150', 'document', 'xx', 'yxv', '+918383', '+913868'),
(191, '151', 'document', 'ff', 'hxhx', '+91558', '+91888'),
(192, '152', 'document', 't', 'fyg', '+9155', '+915555'),
(193, '153', 'document', 'dhbaf', 'zhaza', '+918137843781', '+917197197049'),
(194, '154', 'document', 'sggsga', 'avava', '+914646487078', '+914949979797'),
(195, '155', 'document', 'bxb', 'hdh', '+915665', '+913565'),
(196, '156', 'document', 'V', 'gsvs', '+914554', '+91464'),
(197, '157', 'document', 'vsgz', 'sts', '+91464', '+91464'),
(198, '158', 'document', 'shsh', 'shsb', '+915316497979', '+914646464949'),
(199, '159', 'document', 'gzvz', ' zv', '+917979', '+9189'),
(200, '160', 'document', 'gzvz', 'vxvx', '+9176897', '+91389'),
(201, '161', 'document', 'zv', 'zvzv', '+917977', '+91897'),
(202, '162', 'document', 'gzgz', 'zgzg', '+918668', '+916868'),
(203, '163', 'document', 'vz', 'vzb', '+9129797', '+919959'),
(204, '164', 'document', 'vsvz', 'zgzg', '+9177', '+91858'),
(205, '165', 'document', 'zgzh', 'zgs', '+914646464679', '+915646467679'),
(206, '166', 'document', 'shsh', 'sbs', '+914616467979', '+918676469797'),
(207, '167', 'document', 'dg', 'ghxbx', '+918886', '+91979'),
(208, '168', 'document', 'avfehf', 'vdavad', '+916156545499', '+916124598484'),
(209, '169', 'document', 'vv', 'vgg', '+91499', '+91888'),
(210, '170', 'document', 'udgd', 'gxvxydg', '+91868', '+9156'),
(211, '171', 'document', 'udjdj', 'gdhx', '+9156566', '+9139898'),
(212, '172', 'document', 'zv x', 'xfxg', '+918885', '+9188'),
(213, '173', 'document', 'vzgz', 'vxv', '+91888', '+918668'),
(214, '174', 'document', 'vxbx', 'dvv', '+919595', '+919595'),
(215, '175', 'document', 'b', 'db', '+915', '+915959'),
(216, '176', 'document', 'ibfhd', 'dtgf', '+9155288', '+9152658'),
(217, '177', 'document', 'gydhe', 'hi she', '+9166461', '+9195556'),
(218, '178', 'box', 'gff', 'gfhh', '+910556', '+9195666'),
(219, '179', 'document', 'vbsb', 'zbb', '+917989', '+91795'),
(220, '180', 'document', 'vzvz', 'xvvx', '+918888', '+91979868'),
(221, '181', 'document', 'gzgx', 'xhhx', '+91538', '+918386'),
(222, '182', 'document', 'd', 'xtx', '+918', '+918'),
(223, '183', 'document', 'dhdh', 'dhds', '+914642', '+916553'),
(224, '184', 'document', 'gyeh', 'vwhyah', '+91349516', '+91199646'),
(225, '185', 'document', 'vz', 'bzbs', '+915995', '+918968'),
(226, '186', 'document', 'Ndjdj', 'bxhxb', '+916565659', '+91656567'),
(227, '187', 'document', 'dgxb', 'vzv', '+9188', '+919595'),
(228, '188', 'document', 'h', 'tt', '+9125', '+9133'),
(229, '189', 'document', 'f', 'ff', '+9122', '+915'),
(230, '190', 'document', 'gs', 'dbsb', '+9177794949', '+914949'),
(231, '191', 'document', 'hjssjnd', 'Vvsvs', '+9194848585', '+919794085'),
(232, '192', 'document', 'desbb', 'vshh', '+9154248', '+912480'),
(233, '193', 'document', 'g', 'bb', '+9166', '+9169'),
(234, '194', 'document', 'rajesh', 'ram', '+911234567890', '+916457813794'),
(235, '195', 'document', 'vhhh', 'cccgg', '+91552585', '+918888'),
(236, '196', 'document', 'fdds', 'fgddd', '+9156555', '+918555'),
(237, '197', 'document', 'gdggddgg', 'sgsgsg', '+919889', '+915959'),
(238, '198', 'document', 'ram singh', 'shap kumar', '+918965231477', '+914348421846'),
(239, '199', 'document', 'chandrbhan ', 'viraj', '+919763707175', '+914651323798'),
(240, '200', 'document', 'yash', 'raj', '+919434919735', '+919564646469'),
(241, '201', 'document', 'shreeyash', 'bhavana', '+916565656595', '+919494994964'),
(242, '202', 'document', 'vvv', 'xfff ', '+916886828517', '+916885885888'),
(243, '203', 'document', 'yash1', 'jayesh', '+919894994649', '+915956564649'),
(244, '204', 'document', 'rdyhg', 'ewfc', '+911018', '+9144856'),
(245, '205', 'document', 'fdhh', 'dfczf', '+914528', '+917855'),
(246, '206', 'document', 'dghs', 'atgxf', '+9152607', '+914600'),
(247, '207', 'document', 'tsfgs', 'fags', '+9184848', '+918464'),
(248, '208', 'document', 'xz', 'xcc', '+915578', '+91588'),
(249, '209', 'document', 'ag', 'zvzv', '+918584879745', '+916988879588'),
(250, '210', 'document', 'ggd', 'xccv', '+914855454879', '+918898989898'),
(251, '211', 'document', 'fdf', 'cx', '+916598', '+91589'),
(252, '212', 'document', 'gcz', 'vz s ', '+91878877804', '+91948470'),
(253, '213', 'document', 'gcz', 'vz s ', '+91878877804', '+91948470'),
(254, '214', 'document', 'cgxgg', ' ccccxxx', '+918558005888', '+918588688855'),
(255, '215', 'document', 'cgxgg', ' ccccxxx', '+918558005888', '+918588688855'),
(256, '216', 'document', 'gff', 'fdgfe', '+91665584444', '+9165541'),
(257, '217', 'document', 'fdgg', 'rtfc', '+915565', '+91555'),
(258, '218', 'document', 'gug', 'cfguh', '+915568968888', '+918868884445'),
(259, '219', 'document', 'gshs', 'ggs', '+9144949949', '+9176464959'),
(260, '220', 'document', 'sbbsbd', 'ggsge', '+919494994', '+914884858858'),
(261, '221', 'document', 'dfzxtsuf', 'sfrugdxggh', '+9142278', '+9156454424'),
(262, '222', 'document', 'vcc', 'vcx', '+91985', '+9158878'),
(263, '223', 'document', 'gfvxx', 'xvxx', '+9188898', '+917888'),
(264, '224', 'document', 'gcg', 'vcx', '+91868', '+91898'),
(265, '225', 'document', 'exgggxx', 'terijf', '+9121378', '+9157398'),
(266, '226', 'document', 'dff', 'rtt', '+918665', '+9155'),
(267, '227', 'document', 'tech', 'tech', '+9125618', '+9123235'),
(268, '228', 'document', 'sggsh', 'wgwgwgw', '+919494948488', '+9148484844'),
(269, '229', 'document', 'fhgcc', 'xgcgh', '+915888', '+916996'),
(270, '230', 'document', 'gg', 'fgg', '+91666888', '+9169999'),
(271, '231', 'document', 'ztyh', 'tdxt', '+912272', '+9152566'),
(272, '232', 'document', 'vdc', 'fxc', '+91655', '+91555'),
(273, '233', 'document', 'cxcc', 'ccvx', '+9188777', '+9188877'),
(274, '234', 'document', 'tech', 'tevh', '+912434', '+912435'),
(275, '235', 'document', 'ghh', 'ggg', '+91536', '+91569'),
(276, '236', 'document', 'ghh', 'ggg', '+91536', '+91569'),
(277, '237', 'document', 'yfg', 'vvvv', '+9156688', '+919998'),
(278, '238', 'document', 'chv', ' b b', '+91899', '+91089'),
(279, '239', 'document', 'ccv', ' cvvg', '+918888', '+918980'),
(280, '240', 'document', 'bvb', 'vjvv', '+9199980', '+91569887'),
(281, '241', 'document', 'bvb', 'vjvv', '+9199980', '+91569887'),
(282, '242', 'document', 'bvb', 'vjvv', '+9199980', '+91569887'),
(283, '243', 'document', 'bvb', 'vjvv', '+9199980', '+91569887'),
(284, '244', 'document', 'ccc', 'tggg', '+91868', '+91888'),
(285, '245', 'document', 'fstsy', 'tsff', '+9155464', '+915455'),
(286, '246', 'document', 'ydyg', 'tshh', '+9182458', '+916588'),
(287, '247', 'document', 'fsc', 'xvx', '+915870', '+910000'),
(288, '248', 'document', 'yddyh', 'tsxxh', '+91235247', '+91578445'),
(289, '249', 'document', 'gdyt', 'fzydfh', '+9154250', '+9152488'),
(290, '250', 'document', 'reyfd', 'etgd', '+912249', '+912135'),
(291, '251', 'document', 'eyff', 'stfz', '+914587', '+91225778'),
(292, '252', 'document', 'fg', 'cggv', '+9189885', '+918566'),
(293, '253', 'document', 'ggg', 'cvc', '+918888', '+918888'),
(294, '254', 'document', 'gvzzv', 'vvs', '+9167694', '+9184884'),
(295, '255', 'document', 'VZ', 'vs ', '+91464959', '+9133143'),
(296, '256', 'document', 'vzsv', 'vzvv', '+9198959', '+919794'),
(297, '257', 'document', 'cyg', ' vgg', '+91865', '+916555'),
(298, '258', 'document', 'dhdf', 'urxig', '+9157668', '+9173984'),
(299, '259', 'document', 'cnfjj', 'hfdf', '+916555', '+91652782'),
(300, '260', 'document', 'hrfd', 'yrtsx', '+916275', '+916555'),
(301, '261', 'document', 'bbs', 'svsv', '+919797', '+9197494'),
(302, '262', 'document', 'vzvsv', 'vvs', '+919848', '+919779'),
(303, '263', 'document', 'babs', 'gagagg', '+919799785', '+916464'),
(304, '264', 'document', 'bs', 'zbzb', '+919494', '+91594'),
(305, '265', 'document', 'vsvd', 'sgsg', '+91949', '+915929'),
(306, '266', 'document', 'tesing1', 'checking1', '+9169794948', '+915959595994'),
(307, '267', 'document', 'hzsh', 'vshs', '+9154848', '+9197499'),
(308, '268', 'document', 'gssh', 'hsh', '+914949', '+9155'),
(309, '269', 'document', 'shhs', 'shsh', '+914949', '+91578'),
(310, '270', 'document', 'vzvz', 'vzvvs', '+919499', '+914948'),
(311, '271', 'document', 'bbdbs', 'vs vs', '+9195995', '+91984'),
(312, '272', 'document', 'ha zgggga', 'zbbzb', '+9179997', '+91979799'),
(313, '273', 'document', 'yabs', 'vvssvs', '+9149949', '+919449'),
(314, '274', 'document', 'vs', 'vz s', '+91949494', '+9184880'),
(315, '275', 'document', 'Vva', 'vvs', '+919459', '+9194994'),
(316, '276', 'document', 'bsbsb', 'svssv', '+919494', '+919494'),
(317, '277', 'document', 'ha', 'vavs s', '+919499184', '+91499494'),
(318, '278', 'document', ' zx', ' s dgsgsg', '+9149494', '+91644949'),
(319, '279', 'document', 'check it', 's vs', '+9185944', '+91949499'),
(320, '280', 'document', 'hehysg', 'gwg', '+9184546', '+9164616'),
(321, '281', 'document', 'cgv', 'vgcc', '+9186808', '+918680'),
(322, '282', 'document', 'stxx', 'etgf', '+91528', '+9155998'),
(323, '283', 'document', 'rtdxz', 'eygc', '+9125688', '+915567'),
(324, '284', 'document', 'hgvg', 'cvgv', '+918568', '+918688'),
(325, '285', 'document', 'bzbsbbs', 'bzvvs', '+9166446', '+91994'),
(326, '286', 'document', 'vjfx', 'jfc', '+9156839', '+91658'),
(327, '287', 'document', 'veghe', 'hahhv', '+9188594', '+919858'),
(328, '288', 'document', 'bssbv', 'bss', '+919759', '+91978'),
(329, '289', 'document', 'vzx ', 'vvzvs', '+91979794', '+919797'),
(330, '290', 'document', 'xnn', 'bxb', '+91689', '+919897'),
(331, '291', 'document', 'vh', 'ghh', '+9166', '+9166'),
(332, '292', 'document', 'sav', 'sfc', '+91554', '+918608'),
(333, '293', 'document', 'sgff', 'gddd', '+915489', '+9157976'),
(334, '294', 'document', 'fgf', 'dgf', '+915688', '+915568'),
(335, '295', 'document', 'fgcc', 'dhcc', '+915588', '+918688'),
(336, '296', 'document', 'gsg', 'hehh', '+913466', '+9184649'),
(337, '297', 'document', 'vdbzbhx', 'gsxh', '+918494676957', '+91565668968'),
(338, '298', 'document', 'cgvc4733773', 'hsbxbx', '+913313', '+9145767667'),
(339, '299', 'document', 'vx', 'dhxjchjx', '+91889688', '+91866'),
(340, '300', 'document', 'Narendok', 'bhjj', '+91576796767', '+918596868'),
(342, '302', 'document', 'vb', 'c', '+916666', '+91885'),
(343, '303', 'document', 'bxhz', 'fhjx', '+918851719915', '+918851719915'),
(344, '304', 'document', 'Suraj ', 'Suraj', '+918408068178', '+918408068178'),
(345, '305', 'document', 'Suraj', 'Suraj', '+918408068178', '+918408068178'),
(346, '306', 'document', 'Suraj', 'suraj', '+918408068178', '+918408060178'),
(347, '307', 'document', 'Suraj Singh ', 'Narendra ', '+918408068178', '+918408068178'),
(348, '308', 'document', 'Suraj Kumar Singh ', 'Narendra ', '+918408060170', '+918408068178'),
(349, '309', 'document', 'Hariom', 'Mukesh', '+918408068178', '+918408068178'),
(350, '310', 'document', 'the deshbhakt ', 'bhakt Banerjee ', '+918408068178', '+918408068178'),
(351, '311', 'document', 'Suraj ', 'modi', '+918408068178', '+918408068178'),
(352, '312', 'document', 'yes', 'jammejay', '+9184068178', '+918408068178'),
(353, '313', 'document', 'gsgsvs', 'sgvsvsv', '+9188484', '+91948484'),
(354, '314', 'document', 'sgshsh', 'sgsgsgs', '+9154548', '+91454848'),
(355, '315', 'document', 'sender agent ', 'reciever agent ', '+918448', '+91949494'),
(356, '316', 'document', 'gsgsvsv', 'sgsvsvs', '+91846184', '+914645484'),
(357, '317', 'document', 'dfgg', 'fhfhb', '+91888669', '+915698'),
(358, '318', 'document', 'fegeg', 'sgwgwgs', '+91548484', '+91848484'),
(359, '319', 'document', 'gagagsgs', 'vagsvs', '+91848484', '+915154845'),
(360, '320', 'document', 'bshshsh', 'vsgsgs', '+91949494', '+916494848'),
(361, '321', 'document', 'dghggh', 'gdddfg', '+918408068178', '+918408060178'),
(362, '322', 'document', 'gwgwgwgw', 'gwgwgwg', '+916151815', '+91818181'),
(363, '323', 'document', 'vsgsgsg', 'cscscc', '+918488484', '+9184885'),
(364, '324', 'document', 'sgsbdbs', 'vavsvsv', '+91518181', '+91188588'),
(365, '325', 'document', 'djgxcn', 'xhyfc', '+915358', '+918888'),
(366, '326', 'document', 'hxgsvdv', 'gsgsvsvs', '+91484848', '+91548484'),
(367, '327', 'document', 'sdgjj', 'gsgs', '+915454', '+91848454'),
(368, '328', 'document', 'dhfvb', 'rghh', '+91556', '+914899'),
(369, '329', 'document', 'fghug', 'fhgff', '+9126658', '+9128665'),
(370, '330', 'document', 'gb', 'vv', '+91666', '+91588'),
(371, '331', 'document', 'dhxb', 'xvbzbz', '+91976797', '+91596766'),
(372, '332', 'document', 'huh', 'fhhg', '+915668', '+912658'),
(373, '333', 'document', 'dhxbx', 'ch h ', '+91880', '+91888'),
(374, '334', 'document', 'vzbzx', 'hxx ', '+91888', '+9188888'),
(375, '335', 'document', 'hh_', 'dhxh', '+9188668868', '+916868'),
(376, '336', 'document', 'gHa', 'vsb', '+919494', '+919594'),
(377, '337', 'document', 'hfhx', 'c', '+9188', '+9186'),
(378, '338', 'document', 'sggs', 'xcb', '+91888.88', '+91959'),
(379, '339', 'document', 'hdhx', 'cc', '+918868', '+918689'),
(380, '340', 'document', 'vh', 'vv', '+9189', '+91996'),
(381, '341', 'document', 'dfg', 'ffg', '+9185555', '+9185588'),
(382, '342', 'document', 'zdd', 'xfgd', '+915558', '+915588'),
(383, '343', 'document', 'fagag', 'vagaga', '+91754549', '+918437649'),
(384, '344', 'document', 'vvc', '??????', '+915880', '+918558'),
(385, '345', 'document', '?????', '???', '+91976658', '+916758'),
(386, '346', 'document', 'gh+', 'hzjxhx', '+91568', '+916586'),
(387, '347', 'document', 'dgxhx', 'gzhzx', '+917', '+9188'),
(388, '348', 'document', 'vxvx', 'ccc', '+91888', '+91888'),
(389, '349', 'document', 'vzv', 'bzbzb', '+91997979', '+91976797'),
(390, '350', 'document', 'rff', 'ccc', '+91998888', '+9188');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` varchar(200) NOT NULL,
  `driver_name` varchar(20) NOT NULL,
  `user_nationid` varchar(16) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `driver_birthplace` varchar(20) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `countrycode` varchar(20) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `job` int(11) NOT NULL,
  `gender` varchar(250) DEFAULT '2',
  `driver_address` text NOT NULL,
  `vehicle` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reg_id` varchar(250) DEFAULT NULL,
  `status` char(1) DEFAULT '2',
  `agent_id` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `driver_name`, `user_nationid`, `dob`, `driver_birthplace`, `phone_number`, `countrycode`, `phone`, `email`, `password`, `photo`, `rating`, `job`, `gender`, `driver_address`, `vehicle`, `created_at`, `update_at`, `reg_id`, `status`, `agent_id`) VALUES
('D1618783793', 'jd', '569', '1986-04-19', NULL, '919935086126', '+91', '9935086126', 'ravindslog@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '1618783793-85409.jpg', 0, 7, 'Male', 'Hauz khas', 494, '2021-04-18 22:09:53', '2021-04-18 22:12:04', 'djr_1On8Rzu5mykxasmIXo:APA91bFbpQaXMoBiBFLdXV2MXihV4NzUZvQgt4ccKc1SJscsDEE9jZJqTMPCMh9YfCYkRN58ANVZjke3jCIRsHeRHcNfoq6TVOXMr1RHjN4Q0mLmfoRuDXZPlFIGGLB5OvK0VAc45l44', '1', NULL),
('D1658242062', 'bxb', '596868676', '1998-07-19', NULL, '919289740267', '+91', '9289740267', 'narendra@sixsensemobility.com', '0fc72a727470f3ed4ce3808552bda3ccee93ab97', '1658242062-28761.jpg', 0, 13, 'Male', 'Bus Stand Rd, Umarar Khera, Orai, Uttar Pradesh 285001, India', 539, '2022-07-19 14:47:42', '2022-08-01 14:37:47', 'fPjpLFpGR5qQmGscTk7XPw:APA91bHaQ_aSR0iBrMDtXug4ivkpWA-9aQkYmjyePSSFCol692ouq2JdPKmT_EpmDPooAUqCwqhFvZprXLBAWpAeRD-01fHlFiwr1DyIk5_7_gac6xWqGkxcl1o8PJcvyVffyqwBO0q0', '1', 'P1630573622'),
('D1619605015', 'Mohit', '123456789', '1997-09-19', NULL, '918958757107', '+91', '8958757107', 'mohitjaiswal0995@gmail.com', 'cadaf3b2007f2ad25eea17eb930851cc2cec0eea', '1619605015-8944.jpg', 0, 7, 'Male', 'hapur', 496, '2021-04-28 10:16:55', '2021-05-02 18:13:28', '12345', '1', NULL),
('D1620121843', 'yesr', '56808', '1998-05-04', NULL, '919336118365', '+91', '9336118365', 'slogfy@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '1620121843-17237.jpg', 0, 10, 'Male', 'addres', 500, '2021-05-04 09:50:43', '2021-05-04 09:55:18', 'cjqw8PD4QEau_J-ObpwRIX:APA91bHvVeHkCCen4aCbxjdHQj1NQopeQd0Mb61f0bwy97vlZXaKVGbyjnyu12XAqPldkqilm7YiRpUJbZJHGKySE3x-tpvIjC9AitYmUAOQryBR5SRWsjSUUJGrCiwkw6--amvKqIN5', '1', NULL),
('D1620114961', 'Narendr verma', '3465436', '2001-12-31', NULL, '919305054934', '91', '9305054934', 'slogrobo@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '3790123c0eb1223f58cd3ad02a8e2e1a.jpg', 0, 8, 'Male', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,', 498, '2021-05-04 07:56:01', '2021-07-21 08:09:05', 'ckDpf0RwQNSgYQ5Yl3moxJ:APA91bEzeQcdRcAZcNDyVxCdvxO1UcxWL2q6IT0frwuVTVAMR8hApVnjoiLvjaPqZJegM8ATmdONzf8weRXVuUdD5h3AZFFQeRUXuXkCnnlZXkNkv62P-VyZNgLwBDfozikjLzLz2dB9', '1', NULL),
('D1623751809', 'Dhairya', '1', '2021-06-15', NULL, '911874456665', '+91', '1874456665', 'madhudhairya@gmail.com', '23dafed011e7b7a6d97650586d0fbba0a34de81d', '1623751809-23044.jpg', 0, 13, 'Male', 'sjsj', 503, '2021-06-15 10:10:09', '2021-07-21 10:04:38', 'eYPxCfLNRvGMIfsn7YU9hH:APA91bGntxwr4LGTJjzDv2OfV_86pd2i-LNI1DRMylcqN9t3xtWdMLJrLE7uWU7b5F1iH3tEEIddaem6XIb37isIc5k-DdG5tSIOBjVTXximGIXCtURae9482kXBYAB3pp2dFQXTgGv8', '1', 'P1619979347'),
('D1621584357', 'jp', '5646669449', '2009-05-21', NULL, '919009497975', '+91', '9009497975', 'jitupatel7687@gmail.com', 'ebc1e93c8b301a465e37bf5c64319c4ab81e119b', '1621584357-41381.jpg', 5, 7, 'Male', 'indore', 501, '2021-05-21 08:05:57', '2021-06-15 10:18:02', 'ceOz2_NOSj-ZMtj1eGg3Rt:APA91bGZutzrE3n-U4ZdeBYHLxsUDz8U9YJ9Y8DH9LIKgYMfFihdfoBV3rlv-xNX37MupB4LFd2yDk_GpZIQab8J0CZ34hR2uSP-HORAafWvL5sd_Vp1H47KSDZ_lY5F7L5HhdgN7IN1', '1', NULL),
('D1622194674', 'test', '23523', '0000-00-00', NULL, '911234567890', '+91', '1234567890', 'info@covidslog.co', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '7c9deb5981aa4865aad4e715953b53f5.jpg', 0, 8, 'Male', 'sgsdg', 502, '2021-05-28 09:37:54', '2021-06-15 10:12:41', 'ccy93q8uQeu_azzwC4Z7cP:APA91bFz80n6ZixVAmjKJVpnjukSQjtCTKhml2vP5f0wXxzmL9SWV1SyWhnU8Mry5RzyoVEsmCGPZrSx18mD2UplRqxVQK7nzsDu7Mk5AOLY7_XxlIeE1fFBZVbQo1jlEEwR-iarWe1-', '1', NULL),
('D1626686751', 'shdj', '191929', '2021-07-19', NULL, '917041637900', '+91', '7041637900', 'djdj@gmail.com', '61b1dd24f2336bedd2076980cd6d40bcd82c535a', '1626686751-31336.jpg', 0, 14, 'Male', 'shsjxjd', 504, '2021-07-19 09:25:51', '2021-07-21 10:31:04', '12345', '0', NULL),
('D1626855709', 'Stemslog Pvt ltd', 'Admin', '2021-07-04', NULL, '919971387265', '91', '9971387265', 'lopklopk2@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '15dc2ee9ba283a8d48f49b364f9985d0.png', 0, 8, 'Male', 'gurukul library, near oye rooms, sidulajab, saket, call 9205137385 or 8851719915', 506, '2021-07-21 08:21:49', '2021-07-21 08:24:45', '12345', '0', NULL),
('D1626860698', 'abaha', '4545', '2021-07-21', NULL, '919876543210', '+91', '1278754649', 'developer@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '1626860698-92479.jpg', 0, 14, 'Male', 'sbshhs', 507, '2021-07-21 09:44:58', '2021-08-26 10:37:45', '12345', '1', 'P1624943286'),
('D1630126892', 'dhairya', '6467', '2021-08-28', NULL, '917874456665', '+91', '7874456665', 'd@gmail.com', 'ebc1e93c8b301a465e37bf5c64319c4ab81e119b', '1630126892-80960.jpg', 0, 13, 'Male', 'gzbz', 519, '2021-08-28 05:01:32', '2021-08-28 05:07:59', 'ePJut1E1QDyfw7oh5adXBJ:APA91bGhhMLtl6XL9Bj2tilj4EMzJklIGl59GWhKoEMCZ5w-7Wtqol1ANKEH6NTJ9V2rQKKGlFMiwqE3aLkEOcbGBRCRZXyBWxdOCBZpKnb2sCmpsCYTnTtMSjuJs5F97m3uO0ujoF4o', '1', 'P1619979347'),
('D1626870410', 'bshxb', '9889989', '2021-07-07', NULL, '917500330025', '+91', '7500330025', 'lopklopk3@gmail.com', '4e0b325ccdd718e72c072fdd09e4c8f00bf7e2d6', '1626870410-98071.jpg', 0, 8, 'Male', 'Saket dnx', 509, '2021-07-21 12:26:50', '2021-07-21 12:26:50', '12345', '0', 'P1626162287'),
('D1626942556', 'natrxn', '6797988', '1988-07-22', NULL, '919891583357', '+91', '9891583357', 'lopklopk4@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '1626942556-20083.jpg', 0, 15, 'Male', 'vdjxj', 510, '2021-07-22 08:29:16', '2021-07-22 08:43:51', 'ckDpf0RwQNSgYQ5Yl3moxJ:APA91bEzeQcdRcAZcNDyVxCdvxO1UcxWL2q6IT0frwuVTVAMR8hApVnjoiLvjaPqZJegM8ATmdONzf8weRXVuUdD5h3AZFFQeRUXuXkCnnlZXkNkv62P-VyZNgLwBDfozikjLzLz2dB9', '1', 'P1626162287'),
('D1629974496', 'Akshay', 'sunit', '1999-11-01', NULL, '919818165603', '91', '9818165603', 'akshay@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '49ed3d9130c4f3a152558d4bbb7966d4.png', 0, 8, 'Male', 'gurukul library,delhi, lado saria', 517, '2021-08-26 10:41:36', '2021-08-26 10:42:40', '12345', '0', NULL),
('D1628155846', 'bN', '979798989', '2021-08-05', NULL, '918319696764', '+91', '8319696764', 'xbbdb@ghdh.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '1628155846-58765.jpg', 0, 8, 'Male', 'roboslog', 513, '2021-08-05 09:30:46', '2021-08-16 08:46:49', 'fh5wxFaeQw6btXPBmU5IRx:APA91bECZxdsue4yKmlQoZrVi2v6PQk0tjvId4mqa4lTT5swy2We-WGOWsJxsQ4D3Rx8_tq0rV0DaA6xTa6iNtopha2BwePOZw3AMbukkO8MCcNHQDM8394lR4JJ4XBJ-xZT5hHYSUlf', '1', 'P1628155415'),
('D1628840936', 'sunit', '797997', '2021-08-13', NULL, '918178065789', '+91', '8178065789', 'sumytchauhan1@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '1628840936-79226.jpg', 0, 13, 'Male', 'roboslog', 514, '2021-08-13 07:48:56', '2021-08-13 08:01:38', 'fh5wxFaeQw6btXPBmU5IRx:APA91bECZxdsue4yKmlQoZrVi2v6PQk0tjvId4mqa4lTT5swy2We-WGOWsJxsQ4D3Rx8_tq0rV0DaA6xTa6iNtopha2BwePOZw3AMbukkO8MCcNHQDM8394lR4JJ4XBJ-xZT5hHYSUlf', '1', 'P1628176810'),
('D1632034734', 'Brijesh Pal', 'hdfhshs', '1992-11-11', NULL, '447404503552', '+44', '7404503552', 'brijesh11nov@gmail.com', 'd5c4340871f69abf1be387a9e953e25ccab53345', '2d0bb1c2eb855ba571e4d341b479528b.jpeg', 0, 8, 'Male', '76, Brunel Road\r\nBrunel Road', 521, '2021-09-19 06:58:54', '2021-09-19 21:04:04', 'cmz0h95sS9S5F5zGuulGOB:APA91bFt4P0_DtyOIwoLlLkXVVXOaOQ9dELfaA0om4xeZ2Ey6OwRB7HQd4122W6QlAsnZwKl-c64uejYKXqwZcH_o15GDFyKejQHr9Uq-oL5a_dHgXy1vkBLaYJOYhUpBGat4n3j0t56', '1', NULL),
('D1630566263', 'xbbz', '97986', '1997-09-02', NULL, '919643872577', '+91', '9643872577', 'narendok3@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '1630566263-52555.jpg', 0, 8, 'Male', 'saket, delhi', 520, '2021-09-02 07:04:23', '2021-11-02 15:01:26', 'eEdw6oFnRWmxC4FgyV1CQR:APA91bEFLcLx31kWYlbI0-avwQ3tQyjZTyl7zxxVWvRWM8PM6XPlbdBWMDM4jAgff6GMnIPD8Ik6wMwSjqh0xxhGpYP06uQlxXLAr4EdmxhAjDokSCsSS7-P5QdJCleN7_qeWqRVdKd9', '1', 'P1630055159'),
('D1634808158', 'jdj', '6568668', '2007-10-21', NULL, '918125609787', '+91', '8125609787', 'ravindraslog@gmail.com', '356c60da82398e943f7d69b6ae35d2bd2da4ef66', '1634808158-76875.jpg', 2, 8, 'Female', 'hsjxj', 522, '2021-10-21 09:22:38', '2021-10-27 18:08:36', 'cQBMQD9JSW6NNpEE47Uxjm:APA91bFlTD3Qfia5jXjEhJ1CSf0czTIDvrs1o52ysDOwPJErsyGZ62REWrL1mo6p6b7SnjXU7BcZQiIm0kIQ_3vR8cITgTNArstvTEXL-LzVdG5clVSX5cC51q9IuseOwBSQcc9N2KQa', '1', 'P1630573622'),
('D1635774769', 'yash ', '149464937', '2021-11-08', NULL, '917517096043', '+91', '7517096043', 'yashpatilc2001@gmail.com', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '1635774769-81555.jpg', 0, 8, 'Male', 'nashik, maharashtra', 532, '2021-11-01 13:52:49', '2021-11-03 12:34:54', 'cNYlXWNzT0eJENFTDZkS-c:APA91bET-hRHP0KQak2vnTHtKyIq4_7ZQVXpTr-mlbPy_SeBgddazdp74anvNEzKlVmdcz9q-5KRCWi0FlgeGu82ob3mxzGKD5McLvEFnqEqfJnHx2GFSbHvBoaMP0Pov6L4rH3y73LT', '1', 'P1635421870'),
('D1635758030', 'sam', '165420', '2021-11-01', NULL, '918849753350', '+91', '8849753350', 'samarthkariya.3@gmail.com', 'd5a1541787c4b53ec9242fc71c47f0a7729e9433', '1635758030-44492.jpg', 0, 8, 'Male', 'kodinar', 531, '2021-11-01 09:13:50', '2021-11-04 06:46:16', 'c9rFWQkURZesZjATnOZix2:APA91bG_5d8AOpDRsJ1w2af9FhdM-eKFejQmDD0AadSijGK6umEHvEwL7gWoV1aLc7PMBX2krCZ1WcL73Uh9OmpD1VhuuBgj16iCzyYT4N4FnqJOa-KsxGJwBJ4vQu2miHhWLKvPiVde', '1', 'P1635400820'),
('D1635777657', 'yash1', '9464676', '2021-11-08', NULL, '919921547051', '+91', '9921547051', 'ypc08112001@gmail.com', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '1635777657-12626.jpg', 0, 8, 'Male', 'Nashik, maharashtra', 533, '2021-11-01 14:40:57', '2021-11-01 14:59:05', NULL, '1', 'P1635421870'),
('D1655982368', 'Suraj', '4577', '2000-08-10', NULL, '918408068178', '+91', '8408068178', 'hotmailsuraj@gmail.com', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '1655982368-45476.jpg', 0, 9, 'Male', '133,2nd floor, lane 1, West end Marg, saidulajab, saiyad ul ajaib, sainik farm, new Delhi 11, new Delhi, Delhi -110030', 538, '2022-06-23 11:06:08', '2022-07-26 13:49:24', 'f-Hy_OcSQFehyI4bp-Faqb:APA91bGOHA5ZRGD82ZIF96dAqJ8jA4RHMJg4RYNxdt3H_YsLbY1DfDBEEk3YPkJW2Ff2G8j5X-BUGx660S-UvCDKks0pNlbJoUZZeKej6y0i3hMnv1UXFUGLHdwkRWeKv9QkBgVKWPco', '1', 'P1655364497'),
('D1658697721', 'suman', '928664', '1991-06-01', NULL, '447551415622', '+44', '7551415622', 'sumanpal300@gmail.com', '60cb6fbcda1b8606e74e58e65bfcb693e09a69d9', '1658697721-69654.jpg', 4, 10, 'Female', '1', 540, '2022-07-24 21:22:01', '2022-07-26 12:34:56', 'e8tHXCLzRtuNYMvTKxdVZt:APA91bEGTgG5ta7FjXqZcRdGOxby3Si_h5KEgs00J70sP9tITBESFTgKONpAh0TX4W-tnCXmX8nQP2RuynMRkWl1cojYYeOTqwZuP4b1ieiQgHLe0PsdVNBuuyJ1nO-3qmUX3DJyEqin', '1', 'P1658696769'),
('D1659368939', 'Narendok', '97979', '2022-08-01', NULL, '918765094789', '+91', '8765094789', 'narendslog@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1659368939-77315.jpg', 0, 8, 'Male', 'Bus Stand Rd, Umarar Khera, Orai, Uttar Pradesh 285001, India', 541, '2022-08-01 15:48:59', '2022-08-01 16:16:04', 'cM2klpuTTdySeXUb0tzUqp:APA91bHlR3I6Oaaylk1nYYvrg2TmLXXUENnFMVqH1ZZotOtbtKhy1VlOqPxMh_O_Jbq98yCxTA2rGxSSk2VtymTW2aN7XpegJxQArs0L1G9AhTMk1TZC7Ge5cDGQQcWeOAGmc-oiQ_7c', '1', 'P1630573622');

-- --------------------------------------------------------

--
-- Table structure for table `driver_job`
--

CREATE TABLE `driver_job` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_job` varchar(250) NOT NULL,
  `icon` varchar(20) NOT NULL DEFAULT '1',
  `status_job` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_job`
--

INSERT INTO `driver_job` (`id`, `driver_job`, `icon`, `status_job`) VALUES
(8, 'Car', '2', '1'),
(7, 'Bike', '1', '1'),
(9, 'Truck', '3', '1'),
(10, 'Hatchback', '5', '1'),
(11, 'SUV Car', '6', '1'),
(12, 'Van Car', '7', '1'),
(13, 'Delivery Box', '4', '1'),
(14, 'Bicycle', '8', '1'),
(15, 'Tuktuk', '9', '1'),
(19, 'slog', '8', '1');

-- --------------------------------------------------------

--
-- Table structure for table `driver_rating`
--

CREATE TABLE `driver_rating` (
  `number` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(200) NOT NULL,
  `driver_id` varchar(200) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `note` varchar(200) DEFAULT 'Good job',
  `rating` int(11) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_rating`
--

INSERT INTO `driver_rating` (`number`, `customer_id`, `driver_id`, `transaction_id`, `note`, `rating`, `update_at`) VALUES
(34, 'P1621583097', 'D1621584357', 152, 'owd', 5, '2021-05-31 08:05:53'),
(35, 'P1621583097', 'D1621584357', 3, 'good', 5, '2021-06-17 09:52:56'),
(37, 'P1630573622', 'D1634808158', 186, 'Good job', 2, '2021-10-27 18:08:36'),
(38, 'P1658697379', 'D1658697721', 341, 'hw was good', 4, '2022-07-26 12:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `file_driver`
--

CREATE TABLE `file_driver` (
  `file_id` int(11) NOT NULL,
  `driver_id` varchar(250) NOT NULL,
  `idcard_images` varchar(250) NOT NULL,
  `driver_license_images` varchar(250) NOT NULL,
  `driver_license_id` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_driver`
--

INSERT INTO `file_driver` (`file_id`, `driver_id`, `idcard_images`, `driver_license_images`, `driver_license_id`, `created`) VALUES
(827, 'M1618761446', '4e049d021dad68d4d10e0b51b89fe219.png', '', '', '2021-04-18 15:57:26'),
(828, 'D1618783793', '1618783793-27407.jpg', '1618783793-53731.jpg', '56', '2021-04-18 22:09:53'),
(830, 'D1619605015', '1619605015-88701.jpg', '1619605015-51233.jpg', '123456789', '2021-04-28 10:16:55'),
(831, 'D1619978888', '1619978888-49693.jpg', '1619978888-36277.jpg', '467997', '2021-05-02 18:08:08'),
(832, 'D1620114961', 'd280ab8318c80de47b83308665baba89.png', '4415bfb5a30df433f1b000c56edb4c00.png', '265236', '2021-05-04 07:56:01'),
(833, 'D1620120858', '1620120858-57452.jpg', '1620120858-33288.jpg', '979797', '2021-05-04 09:34:18'),
(834, 'D1620121843', '1620121843-72735.jpg', '1620121843-46121.jpg', '58888698', '2021-05-04 09:50:43'),
(835, 'D1621584357', '1621584357-2458.jpg', '1621584357-98453.jpg', '499499949499', '2021-05-21 08:05:57'),
(836, 'D1622194674', 'd7e5d8a5cad5035687a28821d5b1f7cf.jpg', 'e09bc11f73b478524ea1b1b935c53875.jpg', '425235', '2021-05-28 09:37:54'),
(837, 'D1623751809', '1623751809-42199.jpg', '1623751809-49745.jpg', '2', '2021-06-15 10:10:09'),
(838, 'D1626686751', '1626686751-34202.jpg', '1626686751-3452.jpg', '821928', '2021-07-19 09:25:51'),
(839, 'D1626720869', '1626720869-48916.jpg', '1626720869-44092.jpg', '64676', '2021-07-19 18:54:29'),
(840, 'D1626855709', '7402394a2f4001afd338fbac69b6b476.png', 'db0e56dae56d7a945f2437f65ad58005.png', '4353467', '2021-07-21 08:21:49'),
(841, 'D1626860698', '1626860698-59560.jpg', '1626860698-66483.jpg', '684615', '2021-07-21 09:44:58'),
(842, 'D1626861883', '1626861883-10610.jpg', '1626861883-64788.jpg', '343131', '2021-07-21 10:04:43'),
(843, 'D1626870410', '1626870410-25260.jpg', '1626870410-3235.jpg', '45576779797', '2021-07-21 12:26:50'),
(844, 'D1626942556', '1626942556-40469.jpg', '1626942556-60701.jpg', '499797979', '2021-07-22 08:29:16'),
(847, 'D1628155846', '1628155846-93337.jpg', '1628155846-36984.jpg', '8797989', '2021-08-05 09:30:46'),
(848, 'D1628840936', '1628840936-80088.jpg', '1628840936-40218.jpg', '09898', '2021-08-13 07:48:56'),
(849, 'D1629973756', '11118d223c22188d0bf88f19cd6baaa2.gif', 'ce6b25bd79af0415a36d33db8bfaa5cc.jpg', '547rer4537457', '2021-08-26 10:29:16'),
(850, 'D1629973907', 'f0c8c97b7082a4ba3d2e63b4f3da0608.png', 'f441c62900284c320a886820264331c5.png', '23463416', '2021-08-26 10:31:47'),
(851, 'D1629974496', 'aa787405b9f79cfe12ba65a1d68e9447.png', '97f19ecc406bc628b7c40cb4dcb5378c.png', '23523523', '2021-08-26 10:41:36'),
(853, 'D1630126892', '1630126892-23276.jpg', '1630126892-74716.jpg', '6598959', '2021-08-28 05:01:32'),
(854, 'D1630566263', '1630566263-56092.jpg', '1630566263-23434.jpg', '97988', '2021-09-02 07:04:23'),
(855, 'D1632034734', '8ed94387e14d366510f4f3b61846db09.jpeg', '1262d593e74c6dc29e6826de5174262d.jpeg', 'cacaca', '2021-09-19 06:58:54'),
(856, 'D1634808158', '1634808158-59758.jpg', '1634808158-19140.jpg', '57676767', '2021-10-21 09:22:38'),
(858, 'D1635758030', '1635758030-52760.jpg', '1635758030-8195.jpg', '24846887', '2021-11-01 09:13:50'),
(859, 'D1635774769', '1635774769-96047.jpg', '1635774769-94355.jpg', '646464494', '2021-11-01 13:52:49'),
(860, 'D1635777657', '1635777657-35336.jpg', '1635777657-9802.jpg', '9688855', '2021-11-01 14:40:57'),
(861, 'D1655981361', 'b06f937375e86c3df22728c1ddd5f0ae.jpg', 'ab8140111aa2558a97eb1ab17a98d466.jpg', '8408068178', '2022-06-23 10:49:21'),
(862, 'D1655981556', 'b2603ff5bd2a43974c80800ceb23c92c.jpg', '371829f37c8a3aebff6c8c32f32ab628.jpg', 'MH12 20190068931', '2022-06-23 10:52:36'),
(863, 'D1655981966', 'cd24602d778535b44c40e0b280709fee.jpg', '89f8057b83907f00103cb18a5c05b196.jpg', 'MH12 20190068931', '2022-06-23 10:59:26'),
(864, 'D1655981967', '12acb1e9e2c50004d4509bef445f7d52.jpg', '2d55a9fe0afcf32b51df82d0a79cd034.jpg', 'MH12 20190068931', '2022-06-23 10:59:27'),
(865, 'D1655982368', '1655982368-61746.jpg', '1655982368-50400.jpg', '21020065', '2022-06-23 11:06:08'),
(866, 'D1658242062', '1658242062-50393.jpg', '1658242062-8240.jpg', '95989898', '2022-07-19 14:47:42'),
(867, 'D1658697721', '1658697721-30118.jpg', '1658697721-85956.jpg', '7551415622', '2022-07-24 21:22:01'),
(868, 'D1659368939', '1659368939-44497.jpg', '1659368939-38368.jpg', '8689', '2022-08-01 15:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

CREATE TABLE `forgot_password` (
  `id` int(11) NOT NULL,
  `idkey` int(11) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `token` varchar(500) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forgot_password`
--

INSERT INTO `forgot_password` (`id`, `idkey`, `userid`, `token`, `created`) VALUES
(13, 3, 'M1618761446', '65fda424a1a3f5763b81e46cb0445064ed34ef5c', '2021-04-18 15:57:40'),
(14, 2, 'D1618783793', 'd49f2ae105132cda81983c53119130bdb13c5f22', '2021-04-18 22:10:57'),
(17, 2, 'D1619978888', '0a751474c2b6b418cb0745a2cc3e65f584be426d', '2021-05-02 18:12:57'),
(18, 2, 'D1619605015', '361c91907072b9ded7c5b709e1c5e7f518f59d3f', '2021-05-02 18:13:28'),
(20, 2, 'D1620114961', '6b0ca36c9c1084ac1d6e168fad63633e5a2d7518', '2021-05-04 07:56:12'),
(21, 2, 'D1620121843', '4a60316ac5a94375a507511605c0fbe3e836153f', '2021-05-04 09:54:55'),
(22, 2, 'D1622194674', '4e96d3f8f880b0dd58ee9633a0adefa8101a473a', '2021-05-28 09:38:15'),
(26, 2, 'D1626855709', '8e1597dd61d7c233a00e0a55dbbd90d4aaad4f01', '2021-07-21 08:24:15'),
(27, 2, 'D1626855709', '3d23dae79e56c5269765bbfda4c37ac8162793e4', '2021-07-21 08:25:36'),
(28, 2, 'D1628155846', 'b8b891fcf9998f725859dee29b90872d999e5836', '2021-08-13 07:43:26'),
(30, 2, 'D1629974496', '378be27955c28f5ae349642a9296e5fd44778ad8', '2021-08-26 10:42:14'),
(31, 2, 'D1629974496', '0af7cb918ab264213429fd608011a0208d09eac2', '2021-08-26 10:42:44'),
(32, 2, 'D1629974496', 'b87469237b25902ff895b4d9c0a6d6724d2b820a', '2021-08-26 10:43:23'),
(33, 2, 'D1658697721', 'cf3226d7b1057edf9de52bd40ba2231ad9a4f152', '2022-07-24 21:22:51'),
(34, 2, 'D1658697721', 'ed6f7e5a5ccdfd9c19c6ca6af08bad240b93b4ae', '2022-07-24 21:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `merchant_id` varchar(100) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `item_price` int(250) NOT NULL,
  `promo_price` int(100) NOT NULL,
  `item_category` varchar(200) NOT NULL,
  `item_desc` text NOT NULL,
  `item_image` varchar(250) NOT NULL,
  `created_item` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `item_status` varchar(10) NOT NULL,
  `promo_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `merchant_id`, `item_name`, `item_price`, `promo_price`, `item_category`, `item_desc`, `item_image`, `created_item`, `item_status`, `promo_status`) VALUES
(5, '3', 'yest', 0, 0, '4', 'djwjs', '1618761730-48695.jpg', '2021-04-18 16:02:10', '1', '0'),
(6, '3', 'yest1', 0, 0, '4', 'djwjs', '1618761730-48695.jpg', '2021-04-18 16:02:10', '1', '0'),
(7, '3', 'yest3', 0, 0, '4', 'djwjs', '1618761730-48695.jpg', '2021-04-18 16:02:10', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `item_transaction`
--

CREATE TABLE `item_transaction` (
  `transaction_item_id` int(11) NOT NULL,
  `item_id` varchar(200) NOT NULL,
  `merchant_id` varchar(100) NOT NULL,
  `transaction_id` varchar(200) NOT NULL,
  `item_amount` varchar(200) NOT NULL,
  `item_note` text NOT NULL,
  `total_cost` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_admin`
--

CREATE TABLE `menu_admin` (
  `menu_id` int(11) NOT NULL,
  `menu_icon` varchar(250) NOT NULL,
  `menu_title` varchar(250) NOT NULL,
  `menu_url` varchar(250) NOT NULL,
  `menu_sub` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_admin`
--

INSERT INTO `menu_admin` (`menu_id`, `menu_icon`, `menu_title`, `menu_url`, `menu_sub`) VALUES
(1, 'icon-home', 'Dashboard', '', 0),
(2, 'icon-list', 'Transaction History', 'historytransaction', 0),
(6, 'icon-user', 'User', '#', 1),
(7, 'icon-percent', 'Promotion', '#', 1),
(8, 'icon-dollar-sign', 'Wallet', '#', 1),
(9, 'icon-layers', 'Service', '#', 1),
(10, 'icon-settings', 'Settings', '#', 1),
(11, 'icon-bell', 'Notifications', '#', 1),
(12, 'icon-book-open', 'News', '#', 1);

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE `merchant` (
  `merchant_id` int(11) NOT NULL,
  `service_id` varchar(100) NOT NULL,
  `merchant_name` varchar(250) NOT NULL,
  `merchant_address` varchar(250) NOT NULL,
  `merchant_latitude` varchar(250) NOT NULL,
  `merchant_longitude` varchar(250) NOT NULL,
  `open_hour` varchar(250) NOT NULL,
  `close_hour` varchar(250) NOT NULL,
  `merchant_category` varchar(100) NOT NULL,
  `merchant_image` varchar(250) NOT NULL,
  `merchant_telephone_number` varchar(250) NOT NULL,
  `merchant_desc` text NOT NULL,
  `merchant_phone_number` varchar(250) NOT NULL,
  `merchant_country_code` varchar(20) NOT NULL,
  `merchant_status` varchar(250) NOT NULL,
  `merchant_open_status` varchar(20) NOT NULL,
  `merchant_token` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`merchant_id`, `service_id`, `merchant_name`, `merchant_address`, `merchant_latitude`, `merchant_longitude`, `open_hour`, `close_hour`, `merchant_category`, `merchant_image`, `merchant_telephone_number`, `merchant_desc`, `merchant_phone_number`, `merchant_country_code`, `merchant_status`, `merchant_open_status`, `merchant_token`) VALUES
(3, '46', 'Naren', 'saket', '5758', '34523', '00:00', '21:00', '5', '7498d300d6e0a25035a674b51604c97d.png', '918851719915', '', '8851719915', '+91', '1', '', 'b47c757a6f99fff9261082b3ef185aa4bf94ae92');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_category`
--

CREATE TABLE `merchant_category` (
  `category_merchant_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `category_images` varchar(250) NOT NULL,
  `service_id` varchar(200) NOT NULL,
  `category_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchant_category`
--

INSERT INTO `merchant_category` (`category_merchant_id`, `category_name`, `category_images`, `service_id`, `category_status`) VALUES
(1, 'All', '', '0', '1'),
(3, 'Standard', '', '23', '1');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_detail_transaction`
--

CREATE TABLE `merchant_detail_transaction` (
  `merchant_transaction_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `merchant_id` varchar(250) NOT NULL,
  `total_price` varchar(250) NOT NULL,
  `final_price` varchar(250) NOT NULL,
  `validation_code` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `category_id` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `news_images` varchar(250) NOT NULL,
  `news_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `news_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `category_id`, `title`, `content`, `news_images`, `news_created`, `news_status`) VALUES
(2, '2', 'URL shortener', '<p>actaully i\'m web deveoper , not able to solve few<br></p>', '7aeacacea7f11670a0ade2e720acca8d.jpg', '2021-04-10 20:13:46', '1'),
(3, '2', 'electronics risk to carry', '<p>Aware ... be safe while carrying electronics </p>', '7fe4374093c8acf7acbe04b1b5233a32.png', '2021-04-10 20:14:54', '1');

-- --------------------------------------------------------

--
-- Table structure for table `news_category`
--

CREATE TABLE `news_category` (
  `news_category_id` int(11) NOT NULL,
  `category` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`news_category_id`, `category`, `created`) VALUES
(2, 'test', '2021-04-10 20:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `partner_id` varchar(200) NOT NULL,
  `partner_name` varchar(250) NOT NULL,
  `partner_type_identity` varchar(250) NOT NULL,
  `partner_identity_number` varchar(250) NOT NULL,
  `partner_address` varchar(250) NOT NULL,
  `partner_email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `partner_telephone` varchar(250) NOT NULL,
  `partner_phone` varchar(250) NOT NULL,
  `partner_country_code` varchar(250) NOT NULL,
  `merchant_id` varchar(250) NOT NULL,
  `partner` varchar(250) NOT NULL,
  `partner_status` varchar(10) NOT NULL,
  `partner_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`partner_id`, `partner_name`, `partner_type_identity`, `partner_identity_number`, `partner_address`, `partner_email`, `password`, `partner_telephone`, `partner_phone`, `partner_country_code`, `merchant_id`, `partner`, `partner_status`, `partner_created`) VALUES
('M1618761446', 'test', 'adhr', '436346236', 'test', 'roboslog@gmail.com', '472477709fbfa0b99e95fe3b35218e2d8de28e8b', '919643872577', '9643872577', '+91', '3', '0', '1', '2021-04-18 15:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `payusettings`
--

CREATE TABLE `payusettings` (
  `id` int(11) NOT NULL,
  `payu_key` varchar(250) NOT NULL,
  `payu_id` varchar(250) NOT NULL,
  `payu_salt` varchar(250) NOT NULL,
  `payu_debug` varchar(250) NOT NULL,
  `active` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payusettings`
--

INSERT INTO `payusettings` (`id`, `payu_key`, `payu_id`, `payu_salt`, `payu_debug`, `active`) VALUES
(1, '4JreBobn', '7094565', 'gIY79pFnX9', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `promo_id` int(11) NOT NULL,
  `promo_title` varchar(250) NOT NULL,
  `promo_code` varchar(250) NOT NULL,
  `promo_amount` varchar(500) NOT NULL,
  `promo_type` varchar(250) NOT NULL,
  `expired` varchar(250) NOT NULL,
  `service` varchar(250) NOT NULL,
  `promo_image` varchar(500) NOT NULL,
  `status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promocode`
--

INSERT INTO `promocode` (`promo_id`, `promo_title`, `promo_code`, `promo_amount`, `promo_type`, `expired`, `service`, `promo_image`, `status`) VALUES
(4, 'agri', '10', '10', 'persen', '2021-07-09', '17', '4c34cc3ee9e74a5cf9cb70ccf187f26e.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exp_date` date NOT NULL,
  `promotion_service` int(11) NOT NULL,
  `promotion_link` varchar(500) DEFAULT NULL,
  `promotion_type` varchar(250) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `is_show` varchar(3) NOT NULL,
  `action` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `created_on`, `exp_date`, `promotion_service`, `promotion_link`, `promotion_type`, `photo`, `is_show`, `action`) VALUES
(18, '2021-04-06 18:43:06', '2021-05-05', 17, '2', 'service', 'c875070ee03d2dcb1f1ec2f0b8be861d.png', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `service` varchar(20) NOT NULL,
  `cost` int(11) NOT NULL,
  `minimum_cost` int(11) NOT NULL,
  `minimum_distance` varchar(100) NOT NULL,
  `maks_distance` varchar(250) NOT NULL,
  `minimum_wallet` varchar(100) NOT NULL,
  `commision` varchar(200) DEFAULT '0',
  `cost_desc` varchar(50) NOT NULL,
  `driver_job` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `home` varchar(1) NOT NULL,
  `active` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `service`, `cost`, `minimum_cost`, `minimum_distance`, `maks_distance`, `minimum_wallet`, `commision`, `cost_desc`, `driver_job`, `description`, `icon`, `home`, `active`) VALUES
(21, 'Food', 120, 300, '1000000', '70', '000', '10', 'KM', 13, 'In Town Merchant', '4a75feea7e9e6ecb69669cd1c1c61e16.png', '4', '0'),
(27, 'Hatchback Car', 70, 200, '5', '70', '1000', '10', 'KM', 10, 'Max 4 Person', 'fa23127777a76b5ff7d505ef613a0762.png', '1', '0'),
(17, 'Send Goods', 70, 100, '500000', '1000000', '55555500', '10', 'KM', 13, 'Max 5 0 KG or 0.5 M2', '9b3b0a492348ceb0d002f33d19661fa1.png', '2', '1'),
(16, 'Saloon Car', 120, 170, '5', '50', '3000', '10', 'KM', 8, 'Max 3 person', '3455045b87aea1ec76bbcce1947b3066.png', '1', '0'),
(15, 'Ride', 70, 200, '5', '70', '1000', '10', 'KM', 7, 'Max 1 Person', 'cafad9edd5aa96ea0732b174fd23f80e.png', '1', '0'),
(22, 'Shop', 120, 200, '5', '70', '1000', '10', 'KM', 13, 'In Town Shop Merchant', '06d943f123882b2d7682e30a25f54e39.png', '4', '0'),
(23, 'Grocery', 30, 100, '4', '12', '1000', '10', 'KM', 14, 'In Town Grocery Merchant', '0babfde5514897112049b393eb89f46f.png', '4', '0'),
(24, 'Medicine', 70, 200, '5', '500', '1000', '10', 'KM', 13, 'In Town Drugstore', 'b2501da020a00ebd0cc8e074bd16fc5c.png', '4', '0'),
(25, 'SUV Car', 150, 900, '5', '150', '3000', '10', 'Hr', 11, 'Max 5 Person', 'ed2c25007536177045d7ae31b83afab2.png', '3', '0'),
(26, 'Van Shipment', 30, 300, '4', '70', '1000', '10', 'KM', 12, 'Send Big Item', '2da31839bc3ecc6dc9719f0f2225a339.png', '2', '0'),
(28, 'SUV Rent Car', 400, 4500, '5', '1000', '3000', '10', 'Hr', 11, 'In Town Use', '9a763977427b18d16cc493dbc1d6be8a.png', '3', '0'),
(29, 'Tuktuk', 500, 1000, '100', '50', '5000', '15', 'KM', 15, 'take the tuktuk wherever you want', '45ddcde228beef10ff52747beec43768.png', '1', '0'),
(39, 'Documents', 5000, 10000, '10', '10', '1000', '10', 'KM', 13, 'lets us shift your documenys safely', '6bd2ae4503b076de672d46a0c4836131.png', '2', '0'),
(40, 'IT things', 5000, 10000, '10', '10', '1000', '10', 'KM', 8, 'lets us shift your IT stuff safely', '7fe2ea416ab35865203b63973a4a9dc6.png', '2', '0'),
(41, 'Cloths', 5000, 10000, '10', '10', '1000', '10', 'KM', 8, 'lets us shift your Cloths easily', 'e5dcde65ef29011c66011338b1e7ec4e.png', '2', '0'),
(42, 'Electronics', 5000, 10000, '10', '10', '1000', '10', 'KM', 13, 'lets us shift your electronics safely', '17d54efae66fb2a37c6e77fa0210898f.png', '2', '0'),
(44, 'Flour', 5000, 10000, '10', '10', '1000', '10', 'KM', 13, 'lets us shift your documenys safely', 'ce3e2ada0cad28e3bce1c592bd507003.png', '2', '0'),
(45, 'Milk / Dairy Product', 5000, 10000, '10', '10', '1000', '10', 'KM', 13, 'lets us shift your Milk products easily', 'b64f3153e8e7437bc4810f4d3ab38066.png', '2', '0');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `id` int(11) NOT NULL,
  `ext_id` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`id`, `ext_id`, `title`, `created`) VALUES
(1, '1', 'Passenger Transportation', '2020-12-07 06:41:58'),
(2, '2', 'Shipment', '2020-12-07 06:41:58'),
(3, '3', 'Rental', '2020-12-07 06:41:58'),
(4, '4', 'Purchasing Service', '2020-12-07 06:41:58');

-- --------------------------------------------------------

--
-- Table structure for table `submenu_admin`
--

CREATE TABLE `submenu_admin` (
  `sub_id` int(11) NOT NULL,
  `menu_id` varchar(250) NOT NULL,
  `sub_title` varchar(250) NOT NULL,
  `sub_url` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submenu_admin`
--

INSERT INTO `submenu_admin` (`sub_id`, `menu_id`, `sub_title`, `sub_url`) VALUES
(1, '3', 'General', 'statistic/general'),
(2, '3', 'Transactions', '	\r\nstatistic/trasactionstatistic\r\n'),
(3, '3', 'Finance', 'statistic/earningsstatistic'),
(4, '3', 'Valuation', 'statistic/valuationstatistic'),
(5, '4', 'Driver', 'tracking/trackingdriver'),
(6, '4', 'Merchant', 'tracking/trackingmerchant'),
(7, '5', 'Driver', 'newregistration/newregdriver'),
(8, '5', 'Merchant', 'newregistration/newregmerchant'),
(9, '6', 'Agent', 'user/customerdata'),
(10, '6', 'Driver', 'user/driverdata'),
(12, '7', 'Slider', 'promotion/sliderdata'),
(13, '7', 'Promo Code', 'promotion/promocodedata'),
(14, '8', 'Wallet', 'wallet/walletdata'),
(15, '8', 'Top Up', 'wallet/topupdata'),
(16, '8', 'Withdraw', 'wallet/withdrawdata'),
(17, '9', 'Vehicle Type', 'service/vehicletypedata'),
(18, '9', 'Service', 'service/servicedata'),
(19, '9', 'Category Merchant', 'service/merchantcategorydata'),
(20, '10', 'Application', 'settings/appsettings'),
(21, '10', 'Email', 'settings/emailsettings'),
(22, '10', 'SMTP', 'settings/smtpsettings'),
(23, '10', 'Stripe', 'settings/stripesettings'),
(24, '10', 'Paypal', 'settings/paypalsettings'),
(25, '10', 'Bank Transfer', 'settings/banktransfersettings'),
(26, '11', 'Send Email', 'notification/sendemail'),
(27, '11', 'Send Notification', 'notification/sendnotification'),
(28, '12', 'Category', 'news/newscategory'),
(29, '12', 'News', 'news/newsdata');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `customer_id` varchar(200) NOT NULL,
  `destination_customer_id` varchar(200) NOT NULL,
  `driver_id` varchar(200) DEFAULT NULL,
  `service_order` tinyint(4) NOT NULL,
  `start_latitude` varchar(20) NOT NULL,
  `start_longitude` varchar(20) NOT NULL,
  `end_latitude` varchar(20) NOT NULL,
  `end_longitude` varchar(20) NOT NULL,
  `distance` double NOT NULL,
  `price` int(11) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finish_time` timestamp NULL DEFAULT NULL,
  `estimate_time` varchar(500) NOT NULL,
  `pickup_address` varchar(500) NOT NULL,
  `destination_address` varchar(500) DEFAULT NULL,
  `promo_discount` int(11) NOT NULL DEFAULT '0',
  `final_cost` int(11) DEFAULT '0',
  `wallet_payment` tinyint(1) NOT NULL DEFAULT '0',
  `rate` varchar(11) NOT NULL,
  `parcel_image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `customer_id`, `destination_customer_id`, `driver_id`, `service_order`, `start_latitude`, `start_longitude`, `end_latitude`, `end_longitude`, `distance`, `price`, `order_time`, `finish_time`, `estimate_time`, `pickup_address`, `destination_address`, `promo_discount`, `final_cost`, `wallet_payment`, `rate`, `parcel_image`) VALUES
(1, 'P1621583097', 'P1619601946', NULL, 40, '22.854998828843', '75.994798941538', '22.854998828843', '75.994798941538', 0, 10000, '2021-06-12 19:58:50', NULL, '0 mins', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 0, 10000, 0, '', NULL),
(2, 'P1623499414', 'P1619979347', NULL, 37, '23.1960911', '72.633219', '23.206853223601', '72.633793656313', 2, 10000, '2021-06-15 13:22:08', NULL, '5 mins', 'Infocity, Gandhinagar, Gujarat, India', 'Sector 3, Gandhinagar, Gandhinagar, Gujarat, India', 0, 10000, 0, '', NULL),
(3, 'P1621583097', 'P1619601946', 'D1621584357', 40, '22.854799884371', '75.994752421975', '22.854799884371', '75.994752421975', 0, 10000, '2021-06-15 13:57:29', '2021-06-15 14:01:36', '0 mins', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 0, 10000, 0, '5.0', NULL),
(4, 'P1621583097', 'P1619601946', NULL, 41, '22.854958050884', '75.994582520798', '22.854958050884', '75.994582520798', 0, 10000, '2021-06-15 15:32:37', NULL, '0 mins', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 0, 10000, 0, '', NULL),
(5, 'P1623499414', 'P1619979347', NULL, 37, '23.19602812', '72.63321567', '23.208532979466', '72.630911318383', 3, 15000, '2021-06-15 15:34:39', NULL, '6 mins', 'Infocity, Gandhinagar, Gujarat, India', 'Sector 3, Gandhinagar, Gandhinagar, Gujarat, India', 0, 15000, 0, '', NULL),
(6, 'P1623751694', 'P1619979347', 'D1623751809', 37, '23.1960111', '72.6329651', '23.208418285887', '72.636563903137', 3, 15000, '2021-06-15 17:25:53', '2021-06-15 17:30:16', '7 mins', 'CROSSWORD, Infocity, Gandhinagar, Gujarat, India', 'Sector 7, Gandhinagar, Gandhinagar, Gujarat, India', 0, 15000, 0, '', NULL),
(7, 'P1623765977', 'P1623765449', NULL, 17, '28.513326553171', '77.204409702512', '28.513748', '77.230242', 4, 280, '2021-06-15 21:13:03', NULL, '11 mins', 'IGNOU, Mehrauli Badarpur Rd, Sainik Farm, New Delhi, Delhi, India', 'Khanpur, Mehrauli Badarpur Rd, Madangir Camp, Dr Ambedkar Nagar, New Delhi, Delhi, India', 0, 280, 0, '', NULL),
(8, 'P1623765449', 'P1623765977', NULL, 17, '28.513362249131', '77.229459343758', '28.5205445', '77.201698', 3, 210, '2021-06-15 21:19:24', NULL, '8 mins', 'Khanpur, Mehrauli Badarpur Rd, Madangir Camp, Dr Ambedkar Nagar, New Delhi, Delhi, India', 'Saket Metro Station, Mehrauli Badarpur Road, Saiyad-Ul-Ajaib, Saket, New Delhi, Delhi, India', 0, 210, 0, '', NULL),
(11, 'P1621583097', 'P1619601946', NULL, 41, '22.8553602', '75.9930206', '22.8553602', '75.9930206', 0, 10000, '2021-06-17 16:55:39', NULL, '0 mins', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 'Palasiya, Sawer, Indore, Madhya Pradesh, India', 0, 10000, 0, '', NULL),
(169, 'P1630573622', 'P1624691359', 'D1630566263', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-09-03 17:37:46', '2021-09-03 19:28:45', '3 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(15, 'P1623751694', 'P1619979347', NULL, 17, '23.1961296', '72.6330675', '23.220955372846', '72.639715630439', 4, 280, '2021-06-25 13:13:32', NULL, '9 mins', 'Infocity, Gandhinagar, Gujarat, India', 'Civil Hospital Gandhinagar, Gandhinagar, Gujarat, India', 0, 280, 0, '', NULL),
(17, 'P1623751694', 'P1619979347', NULL, 17, '23.1960517', '72.6329867', '23.21019325307', '72.633626045129', 3, 210, '2021-06-25 19:33:39', NULL, '6 mins', 'CROSSWORD, Infocity, Gandhinagar, Gujarat, India', 'Sector 6, Gandhinagar, Gandhinagar, Gujarat, India', 0, 210, 0, '', NULL),
(18, 'P1623751694', 'P1619979347', 'D1623751809', 17, '23.20757834', '72.62747773', '23.238579453892', '72.631351115008', 6, 420, '2021-06-25 23:19:47', '2021-07-08 17:55:34', '12 mins', 'Sector 3, Gandhinagar, Gandhinagar, Gujarat, India', 'Axis Bank ATM, Vakharia PJ High School Campus, Opposite Vidya Vihar Society, Gandhinagar, Gujarat, India', 0, 420, 0, '', NULL),
(181, 'P1630573622', 'P1623765449', 'D1630566263', 17, '28.5190292', '77.1972687', '28.5132749', '77.2300491', 5, 350, '2021-09-21 19:58:16', '2021-09-21 20:00:44', '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 350, 0, '', NULL),
(60, 'P1619979347', 'P1619601946', NULL, 17, '23.196038', '72.632954', '22.854875698686', '75.994782513008', 432, 30240, '2021-07-24 15:24:50', NULL, '411 mins', 'DA IICT RD,Ahemdabad,GJ', 'Dakachya,Indore,MP-453771', 0, 30240, 0, '', NULL),
(21, 'P1624691359', 'P1623765449', NULL, 17, '28.51918', '77.21301', '28.511565', '77.240838', 4, 280, '2021-06-27 14:32:01', NULL, '12 mins', 'VERO MODA, Anchor 1, Ground Floor, DLF Mall, New Delhi, Delhi, India', 'Axis Bank ATM, Bazar Road, New Delhi, Delhi, India', 0, 280, 0, '', NULL),
(57, 'P1624943286', 'P1619601946', NULL, 17, '28.5147319', '77.1960034', '22.854875698686', '75.994782513008', 880, 61600, '2021-07-24 15:13:44', NULL, '820 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Dakachya,Indore,MP-453771', 0, 61600, 0, '', NULL),
(58, 'P1624943286', 'P1619979347', NULL, 17, '28.5147319', '77.1960034', '23.196038', '72.632954', 888, 62160, '2021-07-24 15:14:30', NULL, '794 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'DA IICT RD,Ahemdabad,GJ-453771', 0, 62160, 0, '', NULL),
(180, 'P1630573622', 'P1624691359', 'D1630566263', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-09-21 19:47:44', '2021-09-21 19:57:13', '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(25, 'P1623751694', 'P1619979347', NULL, 17, '23.1960462', '72.6330997', '23.209855088233', '72.63415948724', 3, 210, '2021-07-02 18:52:24', NULL, '6 mins', 'Infocity, Gandhinagar, Gujarat, India', 'Sector 6, Gandhinagar, Gandhinagar, Gujarat, India', 0, 210, 0, '', NULL),
(26, 'P1623751694', 'P1619979347', NULL, 17, '23.1960406', '72.6329629', '23.209217942263', '72.633420260118', 2, 140, '2021-07-02 18:53:50', NULL, '6 mins', 'CROSSWORD, Infocity, Gandhinagar, Gujarat, India', 'Sector 3, Gandhinagar, Gandhinagar, Gujarat, India', 0, 140, 0, '', NULL),
(27, 'P1624943286', 'P1619979347', NULL, 17, '23.1961025', '72.6332049', '23.212837677538', '72.634608134653', 3, 210, '2021-07-08 19:18:36', NULL, '7 mins', 'Infocity, Gandhinagar, Gujarat, India', 'Civil Hospital Gandhinagar, Gandhinagar, Gujarat, India', 0, 210, 0, '', NULL),
(28, 'P1624943286', 'P1623765977', NULL, 17, '28.528392', '77.220241', '28.513748', '77.230242', 3, 210, '2021-07-09 13:45:33', NULL, '8 mins', 'Kiran Nadar Museum of Art, 145, DLF South Court Mall, Saket, New Delhi, Delhi, India', 'Khanpur, Mehrauli Badarpur Rd, Madangir Camp, Dr Ambedkar Nagar, New Delhi, Delhi, India', 0, 210, 0, '', NULL),
(170, 'P1630573622', 'P1630253070', 'D1630566263', 17, '28.5190292', '77.1972687', '51.518965', '-0.7299156', 10833, 758310, '2021-09-03 17:38:52', '2021-09-03 19:28:55', '8290 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,UK,UK-666666', 0, 758310, 0, '', NULL),
(168, 'P1619979347', 'P1623751694', 'D1630126892', 17, '23.196038', '72.632954', '23.2139504', '72.6345805', 3, 210, '2021-09-03 15:55:00', NULL, '7 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 210, 0, '', NULL),
(90, 'P1619979347', 'P1623751694', 'D1628155846', 17, '23.196038', '72.632954', '23.1960432', '72.6329557', 0, 100, '2021-08-16 11:41:30', '2021-08-17 21:17:09', '0 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 100, 0, '', NULL),
(88, 'P1619979347', 'P1626851687', NULL, 17, '23.196038', '72.632954', '23.1962218', '72.6306846', 1, 100, '2021-08-16 11:40:32', NULL, '1 mins', 'DA IICT RD,Ahemdabad,GJ', 'gurhat,Fhandhinagar,Gujrat-382421', 0, 100, 0, '', NULL),
(89, 'P1619979347', 'P1626851687', 'D1628155846', 17, '23.196038', '72.632954', '23.1962218', '72.6306846', 1, 100, '2021-08-16 11:41:08', '2021-08-17 21:17:30', '1 mins', 'DA IICT RD,Ahemdabad,GJ', 'gurhat,Fhandhinagar,Gujrat-382421', 0, 100, 0, '', NULL),
(179, 'P1630573622', 'P1623765977', 'D1630566263', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-09-21 19:44:38', '2021-09-21 19:46:13', '5 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(153, 'P1619979347', 'P1626851687', 'D1630126892', 17, '23.196038', '72.632954', '23.1962218', '72.6306846', 1, 100, '2021-08-28 12:11:42', '2021-09-02 11:36:27', '1 mins', 'DA IICT RD,Ahemdabad,GJ', 'gurhat,Fhandhinagar,Gujrat-382421', 0, 100, 0, '', NULL),
(85, 'P1619979347', 'P1623751694', NULL, 17, '23.196038', '72.632954', '23.1960432', '72.6329557', 0, 100, '2021-08-14 15:43:34', NULL, '0 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 100, 0, '', NULL),
(154, 'P1619979347', 'P1623751694', 'D1630126892', 17, '23.196038', '72.632954', '23.1960432', '72.6329557', 0, 100, '2021-08-28 12:12:06', '2021-09-02 11:36:15', '0 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 100, 0, '', NULL),
(49, 'P1624943286', 'P1619979347', NULL, 17, '28.5147319', '77.1960034', '23.196038', '72.632954', 888, 62160, '2021-07-21 13:16:30', NULL, '800 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'DA IICT RD,Ahemdabad,GJ-453771', 0, 62160, 0, '', NULL),
(332, 'P1630573622', 'P1623765977', 'D1658242062', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2022-07-22 21:55:08', '2022-07-22 23:21:09', '10 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1658501708_71724.jpg'),
(128, 'P1629601740', 'P1624691359', 'D1628155846', 17, '25.9890637', '79.4282152', '28.517253', '77.2014179', 479, 33530, '2021-08-24 15:57:18', '2021-08-25 16:32:20', '428 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 33530, 0, '', NULL),
(80, 'P1619979347', 'P1626851687', 'D1628155846', 18, '23.196038', '72.632954', '23.1962218', '72.6306846', 1, 1500, '2021-08-07 17:51:18', '2021-08-17 21:17:52', '2 mins', 'DA IICT RD,Ahemdabad,GJ', 'gurhat,Fhandhinagar,Gujrat-382421', 0, 1500, 0, '', NULL),
(158, 'P1619979347', 'P1623751694', 'D1630126892', 17, '23.196038', '72.632954', '23.2139504', '72.6345805', 3, 210, '2021-09-02 11:42:42', '2021-09-02 16:33:09', '7 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 210, 0, '', NULL),
(126, 'P1629601740', 'P1624943286', 'D1628155846', 17, '25.9890637', '79.4282152', '28.5147319', '77.1960034', 479, 33530, '2021-08-24 15:55:07', '2021-08-25 16:32:36', '428 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 33530, 0, '', NULL),
(127, 'P1629601740', 'P1623765449', 'D1628155846', 17, '25.9890637', '79.4282152', '28.5132749', '77.2300491', 472, 33040, '2021-08-24 15:55:28', '2021-08-25 16:32:29', '421 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 33040, 0, '', NULL),
(125, 'P1629601740', 'P1623765449', 'D1628155846', 17, '25.9890637', '79.4282152', '28.5132749', '77.2300491', 472, 33040, '2021-08-23 23:59:09', '2021-08-25 16:32:43', '423 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 33040, 0, '', NULL),
(172, 'P1630573622', 'P1630253070', 'D1630566263', 17, '28.5190292', '77.1972687', '51.518965', '-0.7299156', 10907, 763490, '2021-09-04 12:50:32', '2021-09-04 22:43:29', '8204 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,UK,UK-666666', 0, 763490, 0, '', NULL),
(151, 'P1630056415', 'P1624943286', NULL, 17, '28.5190292', '77.1972687', '28.5147319', '77.1960034', 1, 100, '2021-08-27 18:44:48', NULL, '2 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(175, 'P1630573622', 'P1623765449', 'D1630566263', 17, '28.5190292', '77.1972687', '28.5132749', '77.2300491', 5, 350, '2021-09-04 22:46:03', '2021-09-21 19:57:25', '11 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 350, 0, '', NULL),
(173, 'P1630573622', 'P1623765449', 'D1630566263', 17, '28.5190292', '77.1972687', '28.5132749', '77.2300491', 5, 350, '2021-09-04 12:50:56', '2021-09-04 22:44:28', '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 350, 0, '', NULL),
(174, 'P1630573622', 'P1624691359', 'D1630566263', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-09-04 22:45:41', '2021-09-21 19:56:26', '3 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(123, 'P1629601740', 'P1624691359', 'D1628155846', 17, '25.9890637', '79.4282152', '28.517253', '77.2014179', 475, 33250, '2021-08-23 23:58:16', '2021-08-24 00:05:45', '429 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 33250, 0, '', NULL),
(124, 'P1629601740', 'P1626850955', 'D1628155846', 17, '25.9890637', '79.4282152', '23.1961626', '72.630985', 960, 67200, '2021-08-23 23:58:43', '2021-08-24 00:03:54', '896 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 67200, 0, '', NULL),
(122, 'P1629601740', 'P1623765449', 'D1628155846', 17, '25.9890637', '79.4282152', '28.5132749', '77.2300491', 440, 30800, '2021-08-23 16:22:06', NULL, '419 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 30800, 0, '', NULL),
(121, 'P1629601740', 'P1624943286', 'D1628155846', 17, '25.9890637', '79.4282152', '28.5147319', '77.1960034', 443, 31010, '2021-08-23 16:21:19', '2021-08-24 00:03:09', '426 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 31010, 0, '', NULL),
(120, 'P1629601740', 'P1624943286', 'D1628155846', 17, '25.9890637', '79.4282152', '28.5147319', '77.1960034', 443, 31010, '2021-08-23 13:22:22', '2021-08-23 13:26:33', '431 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 31010, 0, '', NULL),
(119, 'P1629601740', 'P1624691359', 'D1628155846', 17, '25.9890637', '79.4282152', '28.517253', '77.2014179', 443, 31010, '2021-08-23 13:21:26', '2021-08-23 16:20:09', '431 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 31010, 0, '', NULL),
(100, 'P1629221586', 'P1624943286', 'D1628155846', 17, '28.5190292', '77.1972687', '28.5147319', '77.1960034', 1, 100, '2021-08-18 00:38:04', '2021-08-18 00:59:05', '2 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(101, 'P1629221586', 'P1626850955', 'D1628155846', 17, '28.5190292', '77.1972687', '23.1961626', '72.630985', 888, 62160, '2021-08-18 00:39:40', '2021-08-18 00:53:48', '800 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 62160, 0, '', NULL),
(102, 'P1629221586', 'P1626850955', 'D1628155846', 17, '28.5190292', '77.1972687', '23.1961626', '72.630985', 888, 62160, '2021-08-18 00:45:23', '2021-08-18 00:51:25', '800 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 62160, 0, '', NULL),
(103, 'P1629221586', 'P1623765449', 'D1628155846', 17, '28.5190292', '77.1972687', '28.5132749', '77.2300491', 5, 350, '2021-08-18 00:45:56', '2021-08-18 00:47:48', '11 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 350, 0, '', NULL),
(104, 'P1629221586', 'P1624691359', 'D1628155846', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-08-18 00:49:45', '2021-08-18 00:53:15', '3 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(105, 'P1629221586', 'P1623765977', 'D1628155846', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-08-18 00:54:44', '2021-08-18 01:00:13', '6 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(106, 'P1629221586', 'P1628176810', 'D1628155846', 17, '28.5190292', '77.1972687', '28.5190292', '77.1972687', 0, 100, '2021-08-18 00:55:44', '2021-08-18 01:00:02', '0 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(107, 'P1629221586', 'P1624943286', 'D1628155846', 17, '28.5190292', '77.1972687', '28.5147319', '77.1960034', 1, 100, '2021-08-18 00:56:51', '2021-08-18 00:59:53', '2 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(117, 'P1629601740', 'P1626850955', 'D1628155846', 17, '25.9890637', '79.4282152', '23.1961626', '72.630985', 960, 67200, '2021-08-22 10:54:38', '2021-08-23 13:25:55', '894 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 67200, 0, '', NULL),
(108, 'P1629221586', 'P1624943286', 'D1628155846', 17, '28.5190292', '77.1972687', '28.5147319', '77.1960034', 1, 100, '2021-08-18 01:01:25', '2021-08-18 10:36:15', '2 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(333, 'P1630573622', 'P1623765977', 'D1658242062', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2022-07-22 23:10:48', '2022-07-22 23:18:59', '10 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1658506248_91918.jpg'),
(163, 'P1630573622', 'P1624943286', 'D1630566263', 17, '28.5190292', '77.1972687', '28.5147319', '77.1960034', 1, 100, '2021-09-02 16:07:56', '2021-09-02 18:09:42', '2 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(164, 'P1630573622', 'P1623765449', 'D1630566263', 17, '28.5190292', '77.1972687', '28.5132749', '77.2300491', 5, 350, '2021-09-02 16:08:17', '2021-09-02 17:55:25', '11 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 350, 0, '', NULL),
(165, 'P1619979347', 'P1626851687', 'D1630126892', 17, '23.196038', '72.632954', '23.1962218', '72.6306846', 1, 100, '2021-09-02 16:11:21', NULL, '1 mins', 'DA IICT RD,Ahemdabad,GJ', 'gurhat,Fhandhinagar,Gujrat-382421', 0, 100, 0, '', NULL),
(112, 'P1619979347', 'P1623751694', NULL, 17, '23.196038', '72.632954', '23.1960432', '72.6329557', 0, 100, '2021-08-21 11:44:24', NULL, '0 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 100, 0, '', NULL),
(113, 'P1629601740', 'P1624943286', 'D1628155846', 17, '25.9890637', '79.4282152', '28.5147319', '77.1960034', 443, 31010, '2021-08-22 10:11:10', '2021-08-22 10:50:59', '428 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 31010, 0, '', NULL),
(114, 'P1629601740', 'P1624691359', 'D1628155846', 17, '25.9890637', '79.4282152', '28.517253', '77.2014179', 443, 31010, '2021-08-22 10:12:07', '2021-08-22 10:40:14', '429 mins', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Orai,jalaun', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 31010, 0, '', NULL),
(171, 'P1630573622', 'P1630253070', 'D1630566263', 17, '28.5190292', '77.1972687', '51.518965', '-0.7299156', 10853, 759710, '2021-09-04 12:38:20', '2021-09-04 12:42:09', '8187 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,UK,UK-666666', 0, 759710, 0, '', NULL),
(137, 'P1619979347', 'P1626851687', NULL, 17, '23.196038', '72.632954', '23.1962218', '72.6306846', 1, 100, '2021-08-26 15:52:31', NULL, '1 mins', 'DA IICT RD,Ahemdabad,GJ', 'gurhat,Fhandhinagar,Gujrat-382421', 0, 100, 0, '', NULL),
(138, 'P1623751694', 'P1619979347', NULL, 17, '23.196038', '72.632954', '23.1960432', '72.6329557', 1, 100, '2021-08-26 15:53:04', NULL, '0 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 100, 0, '', NULL),
(166, 'P1619979347', 'P1623751694', 'D1630126892', 17, '23.196038', '72.632954', '23.2139504', '72.6345805', 3, 210, '2021-09-02 16:11:40', NULL, '7 mins', 'DA IICT RD,Ahemdabad,GJ', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421, India,Gandhinagar,Gujarat-382421', 0, 210, 0, '', NULL),
(167, 'P1630573622', 'P1630253070', 'D1630566263', 17, '28.5190292', '77.1972687', '51.518965', '-0.7299156', 10793, 755510, '2021-09-02 17:56:14', '2021-09-02 18:09:32', '8256 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,UK,UK-666666', 0, 755510, 0, '', NULL),
(182, 'P1630573622', 'P1626850955', 'D1630566263', 17, '28.5190292', '77.1972687', '23.1961626', '72.630985', 888, 62160, '2021-09-21 19:58:44', '2021-09-21 20:02:16', '838 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 62160, 0, '', NULL),
(331, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2022-07-22 21:50:31', NULL, '10 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1658501431_56189.jpg'),
(330, 'P1630573622', 'P1623765977', 'D1658242062', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2022-07-22 21:39:02', '2022-07-22 23:19:38', '10 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1658500742_46249.jpg'),
(185, 'P1630573622', 'P1624691359', 'D1630566263', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-10-19 23:07:32', '2021-10-19 23:08:40', '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(186, 'P1630573622', 'P1624691359', 'D1634808158', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-10-21 20:15:15', '2021-10-21 23:07:34', '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '2.0', NULL),
(187, 'P1630573622', 'P1624691359', 'D1634808158', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-10-21 23:54:22', '2021-10-22 09:00:11', '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(188, 'P1630573622', 'P1624691359', NULL, 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-10-22 09:02:46', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(189, 'P1630573622', 'P1626850955', 'D1634808158', 17, '28.5190292', '77.1972687', '23.1961626', '72.630985', 888, 62160, '2021-10-22 09:03:08', NULL, '851 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 62160, 0, '', NULL),
(190, 'P1630573622', 'P1623765449', 'D1634808158', 17, '28.5190292', '77.1972687', '28.5132749', '77.2300491', 5, 350, '2021-10-22 11:34:51', NULL, '15 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 350, 0, '', NULL),
(191, 'P1630573622', 'P1624691359', NULL, 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-10-26 16:38:45', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(192, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-26 16:42:45', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(193, 'P1630056415', 'P1623765449', NULL, 17, '28.5190292', '77.1972687', '28.5132749', '77.2300491', 5, 350, '2021-10-26 17:34:07', NULL, '15 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'F 132/3, Block-F, Khanpur Colony, New Delhi, Delhi 110062, India,New Delhi,Delhi-110062', 0, 350, 0, '', NULL),
(194, 'P1630056415', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-26 18:51:35', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(195, 'P1630056415', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-27 18:41:25', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(196, 'P1630056415', 'P1623765977', NULL, 18, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 1500, '2021-10-27 22:24:51', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 1500, 0, '', '1635348291-85021.jpg'),
(197, 'P1630056415', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-27 23:06:46', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635350806-6468.jpg'),
(198, 'P1630056415', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-27 23:24:09', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635351849-27076.jpg'),
(199, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-27 23:51:28', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635353488-34309.jpg'),
(200, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 00:13:04', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635354784-86763.jpg'),
(201, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 00:56:56', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635357416-36884.jpg'),
(202, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 01:12:36', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635358356-67092.jpg'),
(203, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 08:50:17', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635385817-81840.jpg'),
(204, 'P1635400820', 'P1630573622', NULL, 18, '20.79982', '70.697646', '28.5190292', '77.1972687', 0, 0, '2021-10-28 14:24:30', NULL, '', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 0, 0, '', '1635405870-13909.jpg'),
(205, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1285, 89950, '2021-10-28 15:05:36', NULL, '1301 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 89950, 0, '', NULL),
(206, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1285, 89950, '2021-10-28 15:16:19', NULL, '1300 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 89950, 0, '', NULL),
(207, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-28 15:22:30', NULL, '1305 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', NULL),
(208, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 15:41:47', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(209, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 15:55:17', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(210, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 15:58:09', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(211, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 17:20:44', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635416444-96340.jpg'),
(212, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 17:27:46', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(213, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 17:27:56', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', NULL),
(214, 'P1630573622', 'P1624691359', NULL, 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-10-28 17:30:07', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', NULL),
(215, 'P1630573622', 'P1624691359', NULL, 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-10-28 17:32:34', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', 'images/parcel/1635417154-33782.jpg'),
(216, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 17:36:18', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', 'images/parcel/1635417378-98807.jpg'),
(217, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-28 17:45:00', NULL, '1294 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', 'images/parcel/1635417900-77834.jpg'),
(218, 'P1630573622', 'P1623765977', NULL, 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-10-28 18:02:43', NULL, '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', 'images/parcel/1635418963-83342.jpg'),
(219, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-28 18:53:56', NULL, '1268 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', 'images/parcel/1635422036-39604.jpg'),
(220, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-28 19:00:22', NULL, '1270 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', 'images/parcel/1635422422-27799.jpg'),
(221, 'P1635400820', 'P1624691359', NULL, 17, '20.79982', '70.697646', '28.517253', '77.2014179', 1286, 90020, '2021-10-28 19:29:04', NULL, '1332 mins', ',kodinar,gujarat', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 90020, 0, '', 'images/parcel/1635424144-54296.jpg'),
(222, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-28 20:15:43', NULL, '1273 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', 'images/parcel/1635426943-21960.jpg'),
(223, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-28 20:24:54', NULL, '1274 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', 'images/parcel/1635427494-55583.jpg'),
(224, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-28 20:30:59', NULL, '1279 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', 'images/parcel/1635427859-5500.jpg'),
(225, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-28 21:27:01', NULL, '1338 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', 'images/parcel/1635431221-40962.jpg'),
(226, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-28 22:14:49', NULL, '1304 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', 'images/parcel/1635434089-52380.jpg'),
(227, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-29 00:05:05', NULL, '1305 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', 'images/parcel/1635440704-68931.jpg'),
(228, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1271, 88970, '2021-10-29 09:27:08', NULL, '1288 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88970, 0, '', 'images/parcel/1635474428-4027.jpg'),
(229, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-29 09:32:43', NULL, '1280 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', 'images/parcel/1635474763-80496.jpg'),
(230, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 09:38:23', NULL, '1284 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', 'images/parcel/1635475103-63642.jpg'),
(231, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1284, 89880, '2021-10-29 11:38:24', NULL, '1308 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 89880, 0, '', 'images/parcel/1635482304-96394.jpg'),
(232, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1269, 88830, '2021-10-29 13:04:53', NULL, '1252 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88830, 0, '', '1635487493_45743.jpg'),
(233, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 13:13:46', NULL, '1253 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635488026_33390.jpg'),
(234, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-29 13:31:32', NULL, '1290 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635489092_92739.jpg'),
(235, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 15:27:51', NULL, '1258 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635496071_64013.jpg'),
(236, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 15:28:04', NULL, '1258 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635496084_36894.jpg'),
(237, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 16:14:17', NULL, '1269 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635498857_53880.jpg'),
(238, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 16:26:50', NULL, '1263 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635499610_32480.jpg'),
(239, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 16:53:30', NULL, '1262 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635501210_62315.jpg'),
(240, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-29 17:10:56', NULL, '1262 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', '1635502256_17306.jpg'),
(241, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-29 17:26:44', NULL, '1262 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', '1635503204_47684.jpg'),
(242, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-29 17:30:45', NULL, '1262 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', '1635503445_94981.jpg'),
(243, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-29 17:31:07', NULL, '1262 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', '1635503467_87339.jpg'),
(244, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 17:35:12', NULL, '1259 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635503712_27053.jpg'),
(245, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-29 17:43:06', NULL, '1295 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635504186_39845.jpg'),
(246, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-29 17:47:39', NULL, '1295 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635504459_6536.jpg'),
(247, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-10-29 17:48:15', NULL, '1269 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635504495_9086.jpg'),
(248, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-29 17:54:11', NULL, '1297 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635504851_18852.jpg'),
(249, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-29 18:31:35', NULL, '1305 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635507095_77311.jpg'),
(250, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1285, 89950, '2021-10-29 20:03:34', NULL, '1332 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 89950, 0, '', '1635512614_61175.jpg'),
(251, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-10-30 22:05:43', NULL, '1310 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635606343_6394.jpg'),
(252, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-10-31 22:25:20', NULL, '1297 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', '1635693920_3139.jpg'),
(253, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1292, 90440, '2021-10-31 22:45:56', NULL, '1302 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 90440, 0, '', '1635695156_14475.jpg'),
(254, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1244, 87080, '2021-10-31 22:49:07', NULL, '1295 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 87080, 0, '', '1635695347_19266.jpg');
INSERT INTO `transaction` (`id`, `customer_id`, `destination_customer_id`, `driver_id`, `service_order`, `start_latitude`, `start_longitude`, `end_latitude`, `end_longitude`, `distance`, `price`, `order_time`, `finish_time`, `estimate_time`, `pickup_address`, `destination_address`, `promo_discount`, `final_cost`, `wallet_payment`, `rate`, `parcel_image`) VALUES
(255, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1271, 88970, '2021-11-01 00:43:03', NULL, '1288 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 88970, 0, '', '1635702183_66424.jpg'),
(256, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 89040, '2021-11-01 01:09:30', NULL, '1290 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 89040, 0, '', '1635703770_92713.jpg'),
(257, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1268, 88760, '2021-11-01 12:51:01', NULL, '1260 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 88760, 0, '', '1635745860_40311.jpg'),
(258, 'P1635400820', 'P1630573622', 'D1635758030', 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-11-01 16:28:28', '2021-11-01 16:30:03', '1314 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635758908_90069.jpg'),
(259, 'P1635400820', 'P1630573622', 'D1635758030', 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-11-01 17:08:17', '2021-11-01 17:24:18', '1302 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635761297_18841.jpg'),
(260, 'P1635400820', 'P1630573622', 'D1635758030', 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-11-01 17:21:39', '2021-11-01 17:24:35', '1300 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635762099_55962.jpg'),
(261, 'P1630573622', 'P1623765977', 'D1630566263', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2021-11-02 00:11:14', '2021-11-02 22:02:28', '6 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1635786674_54926.jpg'),
(262, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-11-02 00:14:17', NULL, '1293 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635786857_50680.jpg'),
(263, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1269, 88830, '2021-11-02 00:34:08', NULL, '1288 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 88830, 0, '', '1635788048_11217.jpg'),
(264, 'P1630573622', 'P1624691359', 'D1634808158', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2021-11-02 13:10:16', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', '1635833416_31868.jpg'),
(265, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1269, 88830, '2021-11-02 13:44:29', NULL, '1285 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 88830, 0, '', '1635835469_58035.jpg'),
(266, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1269, 45, '2021-11-02 13:53:23', NULL, '1284 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 45, 0, '', '1635836003_35455.jpg'),
(267, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1271, 45, '2021-11-02 14:07:17', NULL, '1257 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 45, 0, '', '1635836837_1821.jpg'),
(268, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1271, 88970, '2021-11-02 14:13:24', NULL, '1259 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 88970, 0, '', '1635837204_75951.jpg'),
(269, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 450, '2021-11-02 14:15:35', NULL, '1285 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 450, 0, '', '1635837335_12648.jpg'),
(270, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 889, '2021-11-02 14:32:04', NULL, '1287 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 889, 0, '', '1635838324_347.jpg'),
(271, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 755, '2021-11-02 14:54:30', NULL, '1260 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 755, 0, '', '1635839670_65053.jpg'),
(272, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1342, 77949, '2021-11-02 15:06:14', NULL, '1318 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 77949, 0, '', '1635840374_38876.jpg'),
(273, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1342, 93940, '2021-11-02 15:29:55', NULL, '1321 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 93940, 0, '', '1635841795_19181.jpg'),
(274, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1342, 93940, '2021-11-02 15:33:29', NULL, '1322 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 93940, 0, '', '1635842009_63833.jpg'),
(275, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 88900, '2021-11-02 15:41:57', NULL, '1257 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 88900, 0, '', '1635842517_25814.jpg'),
(276, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1269, 5886, '2021-11-02 15:48:44', NULL, '1255 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 5886, 0, '', '1635842924_13747.jpg'),
(277, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1269, 4528, '2021-11-02 16:18:07', NULL, '1257 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 4528, 0, '', '1635844687_20686.jpg'),
(278, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 45023, '2021-11-02 16:22:21', NULL, '1260 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 45023, 0, '', '1635844941_12003.jpg'),
(279, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 55500, '2021-11-02 16:27:18', NULL, '1260 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 55500, 0, '', '1635845238_57106.jpg'),
(280, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-11-02 17:06:00', NULL, '1298 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1635847560_52157.jpg'),
(281, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 830, '2021-11-02 17:09:04', NULL, '1271 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 830, 0, '', '1635847744_83410.jpg'),
(282, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 5387, '2021-11-02 17:25:46', NULL, '1294 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 5387, 0, '', '1635848746_72709.jpg'),
(283, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 362514, '2021-11-02 17:27:06', NULL, '1294 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 362514, 0, '', '1635848826_62864.jpg'),
(284, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 585, '2021-11-02 17:31:21', NULL, '1264 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 585, 0, '', '1635849081_67503.jpg'),
(285, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1272, 8602, '2021-11-02 17:40:28', NULL, '1267 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 8602, 0, '', '1635849628_80716.jpg'),
(286, 'P1635400820', 'P1630573622', 'D1635758030', 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 1245, '2021-11-02 17:40:59', '2021-11-04 13:40:19', '1290 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 1245, 0, '', '1635849659_83477.jpg'),
(287, 'P1635400820', 'P1630573622', 'D1635758030', 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 123500, '2021-11-02 17:44:51', '2021-11-04 13:39:53', '1290 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 123500, 0, '', '1635849891_25976.jpg'),
(288, 'P1635421870', 'P1623765977', NULL, 17, '20.013932', '73.717096', '28.5131591', '77.2042575', 1270, 56480, '2021-11-02 17:50:02', NULL, '1266 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 56480, 0, '', '1635850202_37237.jpg'),
(289, 'P1635421870', 'P1630573622', NULL, 17, '20.013932', '73.717096', '28.5190292', '77.1972687', 1269, 564230, '2021-11-02 17:50:56', NULL, '1264 mins', 'Arnav Heights, second floor,\r\nDhruva Nagar,nashik,Maharashtra', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 564230, 0, '', '1635850256_44489.jpg'),
(290, 'P1630573622', 'P1624691359', 'D1634808158', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 5550, '2021-11-02 20:12:15', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 5550, 0, '', '1635858735_91771.jpg'),
(291, 'P1630573622', 'P1624691359', 'D1630566263', 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 2000, '2021-11-18 23:19:57', '2021-11-18 23:59:09', '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 2000, 0, '', '1637252397_80069.jpg'),
(292, 'P1635400820', 'P1630573622', 'D1635758030', 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-11-25 11:18:08', '2021-11-25 11:20:01', '1303 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1637813888_60817.jpg'),
(293, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 1255, '2021-11-25 11:33:09', NULL, '1303 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 1255, 0, '', '1637814789_37390.jpg'),
(294, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 90230, '2021-11-25 11:38:07', NULL, '1303 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 90230, 0, '', '1637815087_81382.jpg'),
(295, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 252800, '2021-11-25 11:39:05', NULL, '1303 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 252800, 0, '', '1637815145_15010.jpg'),
(296, 'P1635400820', 'P1630573622', NULL, 17, '20.79982', '70.697646', '28.5190292', '77.1972687', 1289, 100000, '2021-11-25 16:36:47', NULL, '1308 mins', ',kodinar,gujarat', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 100000, 0, '', '1637833007_53336.jpg'),
(297, 'P1630573622', 'P1624691359', NULL, 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2022-01-11 01:18:29', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', '1641838709_85590.jpg'),
(298, 'P1630573622', 'P1624691359', NULL, 17, '28.5190292', '77.1972687', '28.517253', '77.2014179', 1, 100, '2022-01-12 19:50:43', NULL, '4 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 100, 0, '', '1641991843_32351.jpg'),
(300, 'P1630573622', 'P1623765977', NULL, 17, '20.799903', '70.697817', '28.5131591', '77.2042575', 1303, 91210, '2022-06-20 22:07:01', NULL, '1363 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 91210, 0, '', '1655737621_43249.jpg'),
(302, 'P1630573622', 'P1623765977', NULL, 17, '20.799903', '70.697817', '28.5131591', '77.2042575', 1309, 91630, '2022-06-22 00:00:14', NULL, '1383 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 91630, 0, '', '1655830814_26957.jpg'),
(303, 'P1630573622', 'P1623765977', NULL, 17, '20.799903', '70.697817', '28.5131591', '77.2042575', 1310, 91700, '2022-06-22 12:33:00', NULL, '1362 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 91700, 0, '', '1655875980_77379.jpg'),
(307, 'P1655989171', 'P1630573622', 'D1655982368', 18, '20.799903', '70.697817', '28.5190292', '77.1972687', 0, 0, '2022-06-23 20:30:10', '2022-06-23 20:32:04', '', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 0, 0, '', '1655991010_90113.jpg'),
(308, 'P1655989171', 'P1630573622', NULL, 17, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 1780, 124600, '2022-07-01 18:49:17', NULL, '1810 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 124600, 0, '', '1656676157_8504.jpg'),
(306, 'P1655989171', 'P1630573622', 'D1655982368', 18, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 0, 0, '2022-06-23 20:05:31', '2022-06-23 20:10:34', '', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 0, 0, '', '1655989531_62403.jpg'),
(309, 'P1655989171', 'P1630573622', NULL, 17, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 1780, 124600, '2022-07-02 00:06:23', NULL, '1814 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 124600, 0, '', '1656695183_16160.jpg'),
(310, 'P1655989171', 'P1630573622', NULL, 17, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 1780, 124600, '2022-07-02 00:12:24', NULL, '1813 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 124600, 0, '', '1656695544_50460.jpg'),
(311, 'P1655989171', 'P1630573622', NULL, 17, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 1780, 124600, '2022-07-02 00:35:31', NULL, '1811 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 124600, 0, '', '1656696931_86293.jpg'),
(312, 'P1655989171', 'P1624943286', NULL, 17, '20.214285653173', '85.715813393422', '28.5147319', '77.1960034', 1780, 124600, '2022-07-02 00:50:12', NULL, '1815 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 124600, 0, '', '1656697812_62777.jpg'),
(313, 'P1655989171', 'P1630573622', NULL, 17, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 1780, 124600, '2022-07-02 01:04:39', NULL, '1814 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 124600, 0, '', '1656698679_28083.jpg'),
(314, 'P1655989171', 'P1630573622', NULL, 17, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 1780, 124600, '2022-07-02 01:18:35', NULL, '1816 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 124600, 0, '', '1656699515_23514.jpg'),
(315, 'P1655989171', 'P1624943286', NULL, 17, '20.214285653173', '85.715813393422', '28.5147319', '77.1960034', 1780, 50000, '2022-07-02 01:34:30', NULL, '1818 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 50000, 0, '', '1656700470_27611.jpg'),
(316, 'P1655989171', 'P1624943286', NULL, 17, '20.214285653173', '85.715813393422', '28.5147319', '77.1960034', 1780, 124600, '2022-07-02 01:38:21', NULL, '1818 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 124600, 0, '', '1656700701_96859.jpg'),
(317, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1780, 124600, '2022-07-02 01:48:11', NULL, '1816 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124600, 0, '', '1656701291_88228.jpg'),
(318, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1780, 124600, '2022-07-02 01:54:24', NULL, '1814 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124600, 0, '', '1656701664_49013.jpg'),
(319, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1780, 124600, '2022-07-02 02:00:12', NULL, '1813 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124600, 0, '', '1656702012_46114.jpg'),
(320, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1780, 124600, '2022-07-02 02:06:47', NULL, '1811 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124600, 0, '', '1656702407_90071.jpg'),
(321, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1780, 124600, '2022-07-02 02:12:06', NULL, '1810 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124600, 0, '', '1656702726_87448.jpg'),
(322, 'P1655989171', 'P1624943286', NULL, 17, '20.214285653173', '85.715813393422', '28.5147319', '77.1960034', 1780, 124600, '2022-07-02 02:23:45', NULL, '1810 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 124600, 0, '', '1656703425_79102.jpg'),
(323, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1780, 124600, '2022-07-02 02:55:54', NULL, '1809 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124600, 0, '', '1656705354_30086.jpg'),
(324, 'P1655989171', 'P1624943286', NULL, 17, '20.214285653173', '85.715813393422', '28.5147319', '77.1960034', 1780, 100, '2022-07-02 10:03:36', NULL, '1794 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 100, 0, '', '1656731016_48511.jpg'),
(325, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1781, 124670, '2022-07-05 10:11:01', NULL, '1779 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124670, 0, '', '1656990661_42655.jpg'),
(326, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1784, 124880, '2022-07-05 10:37:41', NULL, '1779 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 124880, 0, '', '1656992261_77971.jpg'),
(327, 'P1655989171', 'P1624943286', NULL, 17, '20.214285653173', '85.715813393422', '28.5147319', '77.1960034', 1787, 125090, '2022-07-05 10:44:37', NULL, '1781 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'F-244 , G. Floor, Front office saidulajab, near mother dairy,Delhi,Delhi-110030', 0, 125090, 0, '', '1656992677_7586.jpg'),
(328, 'P1655989171', 'P1630573622', NULL, 17, '20.214285653173', '85.715813393422', '28.5190292', '77.1972687', 1787, 125090, '2022-07-05 10:55:53', NULL, '1783 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 125090, 0, '', '1656993353_82194.jpg'),
(329, 'P1655989171', 'P1624691359', NULL, 17, '20.214285653173', '85.715813393422', '28.517253', '77.2014179', 1788, 125160, '2022-07-05 11:16:12', NULL, '1789 mins', 'Bhubaneswar,Bhubaneshwar,Odisha', '133, 2nd Floor, Lane 1, West End Marg, Saidulajab, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 11,New Delhi,Delhi-110030', 0, 125160, 0, '', '1656994572_37690.jpg'),
(334, 'P1630573622', 'P1658387740', NULL, 17, '28.5190292', '77.1972687', '28.510918', '77.175064', 5, 350, '2022-07-22 23:12:56', NULL, '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi-110070', 0, 350, 0, '', '1658506376_8098.jpg'),
(335, 'P1658387740', 'P1630573622', 'D1658242062', 17, '28.510918', '77.175064', '28.5190292', '77.1972687', 5, 350, '2022-07-23 22:03:46', '2022-07-23 22:12:21', '15 mins', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi-110030', 0, 350, 0, '', '1658588626_65144.jpg'),
(336, 'P1630573622', 'P1658387740', 'D1658242062', 17, '28.5190292', '77.1972687', '28.510918', '77.175064', 5, 350, '2022-07-23 22:20:03', '2022-07-23 22:22:35', '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi-110070', 0, 350, 0, '', '1658589603_41733.jpg'),
(337, 'P1630573622', 'P1623765977', 'D1658242062', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2022-07-23 22:24:02', '2022-07-23 22:24:35', '10 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1658589842_23864.jpg'),
(338, 'P1630573622', 'P1623765977', 'D1658242062', 17, '28.5190292', '77.1972687', '28.5131591', '77.2042575', 2, 140, '2022-07-24 00:09:02', '2022-07-24 00:10:19', '10 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'IGNOU Main Rd, Saiyad ul Ajaib, Sainik Farm, New Delhi, Delhi 110030, India,New Delhi,Delhi-110030', 0, 140, 0, '', '1658596142_79468.jpg'),
(339, 'P1630573622', 'P1658387740', 'D1658242062', 37, '28.5190292', '77.1972687', '28.510918', '77.175064', 5, 25000, '2022-07-24 00:12:20', '2022-07-24 00:12:51', '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi-110070', 0, 25000, 0, '', '1658596340_14467.jpg'),
(340, 'P1630573622', 'P1658387740', NULL, 17, '28.5190292', '77.1972687', '28.510918', '77.175064', 5, 350, '2022-07-25 10:56:35', NULL, '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi-110070', 0, 350, 0, '', '1658721395_39575.jpg'),
(341, 'P1658697379', 'P1658696769', 'D1658697721', 17, '51.50162625683', '-0.70896015538116', '51.610157', '-0.70909', 21, 1470, '2022-07-26 19:29:29', '2022-07-26 19:32:43', '22 mins', '64,Beaconsfield,maidenhead', '64 prors way,Maidenhead,maidenhead-1234', 0, 1470, 0, '4.0', '1658838569_24671.jpg'),
(342, 'P1658697379', 'P1658696769', 'D1658697721', 17, '51.50162625683', '-0.70896015538116', '51.610157', '-0.70909', 21, 12000, '2022-07-26 20:00:42', '2022-07-26 20:03:26', '22 mins', '64,Beaconsfield,maidenhead', '64 prors way,Maidenhead,maidenhead-1234', 0, 12000, 0, '', '1658840442_15546.jpg'),
(343, 'P1658697379', 'P1658696769', NULL, 17, '51.50162625683', '-0.70896015538116', '51.610157', '-0.70909', 21, 18500, '2022-07-26 20:10:08', NULL, '22 mins', '64,Beaconsfield,maidenhead', '64 prors way,Maidenhead,maidenhead-1234', 0, 18500, 0, '', '1658841008_2350.jpg'),
(344, 'P1658697379', 'P1658696769', 'D1658697721', 17, '51.50162625683', '-0.70896015538116', '51.610157', '-0.70909', 21, 2500, '2022-07-26 20:17:32', NULL, '22 mins', '64,Beaconsfield,maidenhead', '64 prors way,Maidenhead,maidenhead-1234', 0, 2500, 0, '', '1658841452_27267.jpg'),
(345, 'P1658697379', 'P1658696769', 'D1658697721', 17, '51.50162625683', '-0.70896015538116', '51.610157', '-0.70909', 21, 8500, '2022-07-26 20:19:01', NULL, '22 mins', '64,Beaconsfield,maidenhead', '64 prors way,Maidenhead,maidenhead-1234', 0, 8500, 0, '', '1658841541_47869.jpg'),
(346, 'P1630573622', 'P1626850955', NULL, 17, '28.5190292', '77.1972687', '23.1961626', '72.630985', 888, 62160, '2022-07-31 22:04:22', NULL, '888 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 62160, 0, '', '1659279862_14719.jpg'),
(347, 'P1630573622', 'P1658387740', 'D1658242062', 17, '28.5190292', '77.1972687', '28.510918', '77.175064', 5, 350, '2022-08-01 21:37:06', NULL, '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi-110070', 0, 350, 0, '', '1659364626_4482.jpg'),
(348, 'P1630573622', 'P1626850955', 'D1658242062', 17, '28.5190292', '77.1972687', '23.1961626', '72.630985', 888, 62160, '2022-08-01 21:51:52', '2022-08-01 21:53:32', '896 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 62160, 0, '', '1659365512_80612.jpg'),
(349, 'P1630573622', 'P1658387740', 'D1659368939', 17, '28.5190292', '77.1972687', '28.510918', '77.175064', 5, 350, '2022-08-01 22:54:30', '2022-08-01 22:56:49', '12 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', 'Ground floor, Gali no.1 , F244, Near mother dairy, Saidulajab, Saket Metro Gate-2,,Delhi,Delhi-110070', 0, 350, 0, '', '1659369270_62059.jpg'),
(350, 'P1630573622', 'P1626850955', 'D1659368939', 17, '28.5190292', '77.1972687', '23.1961626', '72.630985', 888, 62160, '2022-08-02 16:02:12', NULL, '914 mins', 'gurukul library, near oye rooms, sidulajab, saket,Delhi,Delhi', '401, GH 0 Cir, Opp. Gwalia Sweets, Infocity, Gandhinagar, Gujarat 382421,Delhi,Delhi-110030', 0, 62160, 0, '', '1659430932_27041.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `number` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `driver_id` varchar(200) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `note` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`number`, `transaction_id`, `driver_id`, `date`, `status`, `note`) VALUES
(1, 1, 'D0', '2021-06-12 12:58:50', 0, NULL),
(2, 2, 'D0', '2021-06-15 06:22:08', 0, NULL),
(3, 3, 'D1621584357', '2021-06-15 06:57:29', 4, NULL),
(4, 4, 'D0', '2021-06-15 08:32:37', 0, NULL),
(5, 5, 'D0', '2021-06-15 08:34:39', 0, NULL),
(6, 6, 'D1623751809', '2021-06-15 10:25:53', 4, NULL),
(7, 7, 'D0', '2021-06-15 14:13:03', 0, NULL),
(8, 8, 'D0', '2021-06-15 14:19:24', 0, NULL),
(9, 9, 'D0', '2021-06-15 18:54:19', 0, NULL),
(11, 11, 'D0', '2021-06-17 09:55:39', 0, NULL),
(65, 65, 'D0', '2021-08-02 16:00:55', 5, NULL),
(172, 172, 'D1630566263', '2021-09-04 05:50:32', 4, NULL),
(15, 15, 'D0', '2021-06-25 06:13:32', 0, NULL),
(16, 16, 'D0', '2021-06-25 12:12:58', 0, NULL),
(17, 17, 'D0', '2021-06-25 12:33:39', 0, NULL),
(18, 18, 'D1623751809', '2021-06-25 16:19:47', 4, NULL),
(154, 154, 'D1630126892', '2021-08-28 05:12:06', 4, NULL),
(153, 153, 'D1630126892', '2021-08-28 05:11:42', 4, NULL),
(21, 21, 'D0', '2021-06-27 07:32:01', 0, NULL),
(171, 171, '', '2021-09-04 05:38:20', 6, NULL),
(24, 24, 'D0', '2021-06-30 06:05:00', 0, NULL),
(25, 25, 'D0', '2021-07-02 11:52:24', 0, NULL),
(26, 26, 'D0', '2021-07-02 11:53:50', 0, NULL),
(27, 27, 'D0', '2021-07-08 12:18:36', 0, NULL),
(28, 28, 'D0', '2021-07-09 06:45:33', 0, NULL),
(55, 55, 'D0', '2021-07-23 18:35:36', 0, NULL),
(57, 57, 'D0', '2021-07-24 08:13:44', 0, NULL),
(58, 58, 'D0', '2021-07-24 08:14:30', 0, NULL),
(34, 34, 'D0', '2021-07-15 10:31:39', 0, NULL),
(60, 60, 'D0', '2021-07-24 08:24:50', 0, NULL),
(52, 52, 'D0', '2021-07-22 09:07:06', 0, NULL),
(151, 151, 'D0', '2021-08-27 11:44:48', 0, NULL),
(51, 51, 'D0', '2021-07-22 08:58:43', 0, NULL),
(36, 36, 'D0', '2021-07-15 11:04:37', 0, NULL),
(37, 37, 'D0', '2021-07-15 11:11:37', 0, NULL),
(38, 38, 'D0', '2021-07-15 11:12:49', 0, NULL),
(39, 39, 'D0', '2021-07-15 11:16:56', 5, NULL),
(40, 40, 'D0', '2021-07-15 11:53:52', 0, NULL),
(50, 50, 'D1626942556', '2021-07-22 08:45:28', 4, NULL),
(42, 42, 'D0', '2021-07-16 05:37:16', 0, NULL),
(49, 49, 'D0', '2021-07-21 06:16:30', 0, NULL),
(44, 44, 'D0', '2021-07-17 09:40:29', 0, NULL),
(45, 45, 'D0', '2021-07-17 19:12:55', 0, NULL),
(46, 46, 'D0', '2021-07-19 10:07:28', 0, NULL),
(47, 47, 'D0', '2021-07-19 10:20:28', 0, NULL),
(48, 48, 'D0', '2021-07-19 18:47:50', 0, NULL),
(66, 66, 'D0', '2021-08-03 07:37:24', 0, NULL),
(67, 67, 'D0', '2021-08-03 07:59:19', 0, NULL),
(68, 68, 'D1628155846', '2021-08-05 09:26:49', 4, NULL),
(69, 69, 'D0', '2021-08-05 09:38:31', 0, NULL),
(70, 70, 'D0', '2021-08-05 09:39:45', 0, NULL),
(71, 71, 'D0', '2021-08-05 09:54:15', 0, NULL),
(72, 72, 'D0', '2021-08-05 10:07:02', 0, NULL),
(73, 73, 'D0', '2021-08-05 10:09:01', 0, NULL),
(74, 74, 'D1628155846', '2021-08-05 15:21:50', 4, NULL),
(75, 75, 'D1628155846', '2021-08-05 15:26:09', 4, NULL),
(76, 76, 'D1628155846', '2021-08-05 15:27:19', 4, NULL),
(77, 77, 'D1628155846', '2021-08-05 15:29:22', 4, NULL),
(78, 78, 'D1628155846', '2021-08-05 15:32:36', 4, NULL),
(80, 80, 'D1628155846', '2021-08-07 10:51:18', 4, NULL),
(81, 81, 'D0', '2021-08-08 11:12:53', 0, NULL),
(82, 82, 'D0', '2021-08-13 07:39:25', 0, NULL),
(83, 83, 'D1628840936', '2021-08-13 09:20:35', 4, NULL),
(169, 169, '', '2021-09-03 10:37:46', 6, NULL),
(85, 85, 'D0', '2021-08-14 08:43:34', 0, NULL),
(170, 170, 'D1630566263', '2021-09-03 10:38:52', 4, NULL),
(86, 86, 'D1628840936', '2021-08-15 10:42:28', 4, NULL),
(87, 87, 'D1628155846', '2021-08-15 10:43:18', 4, NULL),
(88, 88, 'D0', '2021-08-16 04:40:32', 0, NULL),
(89, 89, 'D1628155846', '2021-08-16 04:41:08', 4, NULL),
(90, 90, 'D1628155846', '2021-08-16 04:41:30', 4, NULL),
(91, 91, 'D1628155846', '2021-08-16 17:29:36', 4, NULL),
(92, 92, 'D1628155846', '2021-08-16 17:30:01', 4, NULL),
(93, 93, 'D1628155846', '2021-08-17 14:19:21', 4, NULL),
(94, 94, 'D1628155846', '2021-08-17 14:20:47', 4, NULL),
(95, 95, 'D1628155846', '2021-08-17 14:21:58', 4, NULL),
(96, 96, 'D1628155846', '2021-08-17 14:22:52', 4, NULL),
(97, 97, 'D1628155846', '2021-08-17 14:28:03', 4, NULL),
(98, 98, 'D1628155846', '2021-08-17 17:26:31', 4, NULL),
(99, 99, 'D1628155846', '2021-08-17 17:27:17', 4, NULL),
(100, 100, 'D1628155846', '2021-08-17 17:38:04', 4, NULL),
(101, 101, 'D1628155846', '2021-08-17 17:39:40', 4, NULL),
(102, 102, 'D1628155846', '2021-08-17 17:45:23', 4, NULL),
(103, 103, 'D1628155846', '2021-08-17 17:45:56', 4, NULL),
(104, 104, 'D1628155846', '2021-08-17 17:49:45', 4, NULL),
(105, 105, 'D1628155846', '2021-08-17 17:54:44', 4, NULL),
(106, 106, 'D1628155846', '2021-08-17 17:55:44', 4, NULL),
(107, 107, 'D1628155846', '2021-08-17 17:56:51', 4, NULL),
(108, 108, 'D1628155846', '2021-08-17 18:01:25', 4, NULL),
(109, 109, 'D1628155846', '2021-08-17 18:03:51', 4, NULL),
(110, 110, 'D1628155846', '2021-08-18 03:34:09', 4, NULL),
(168, 168, 'D1630126892', '2021-09-03 08:55:00', 3, NULL),
(112, 112, 'D0', '2021-08-21 04:44:24', 0, NULL),
(113, 113, 'D1628155846', '2021-08-22 03:11:10', 4, NULL),
(114, 114, 'D1628155846', '2021-08-22 03:12:07', 4, NULL),
(115, 115, 'D1628155846', '2021-08-22 03:39:15', 4, NULL),
(116, 116, 'D1628155846', '2021-08-22 03:39:43', 4, NULL),
(117, 117, 'D1628155846', '2021-08-22 03:54:38', 4, NULL),
(167, 167, 'D1630566263', '2021-09-02 10:56:14', 4, NULL),
(119, 119, 'D1628155846', '2021-08-23 06:21:26', 4, NULL),
(120, 120, 'D1628155846', '2021-08-23 06:22:22', 4, NULL),
(121, 121, 'D1628155846', '2021-08-23 09:21:19', 4, NULL),
(122, 122, 'D1628155846', '2021-08-23 09:22:06', 2, NULL),
(123, 123, 'D1628155846', '2021-08-23 16:58:16', 4, NULL),
(124, 124, 'D1628155846', '2021-08-23 16:58:43', 4, NULL),
(125, 125, 'D1628155846', '2021-08-23 16:59:09', 4, NULL),
(126, 126, 'D1628155846', '2021-08-24 08:55:07', 4, NULL),
(127, 127, 'D1628155846', '2021-08-24 08:55:28', 4, NULL),
(128, 128, 'D1628155846', '2021-08-24 08:57:18', 4, NULL),
(129, 129, 'D1628155846', '2021-08-24 09:00:13', 4, NULL),
(130, 130, 'D1628155846', '2021-08-24 09:00:44', 4, NULL),
(131, 131, 'D1628155846', '2021-08-25 09:33:25', 2, NULL),
(164, 164, 'D1630566263', '2021-09-02 09:08:17', 4, NULL),
(165, 165, 'D1630126892', '2021-09-02 09:11:21', 3, NULL),
(166, 166, 'D1630126892', '2021-09-02 09:11:40', 3, NULL),
(162, 162, 'D1630566263', '2021-09-02 08:36:05', 2, NULL),
(163, 163, 'D1630566263', '2021-09-02 09:07:56', 4, NULL),
(137, 137, 'D0', '2021-08-26 08:52:31', 0, NULL),
(138, 138, 'D0', '2021-08-26 08:53:04', 0, NULL),
(142, 142, 'D0', '2021-08-27 08:58:26', 0, NULL),
(141, 141, 'D0', '2021-08-27 08:58:09', 0, NULL),
(157, 157, 'D0', '2021-08-30 06:08:57', 0, NULL),
(161, 161, 'D0', '2021-09-02 08:35:43', 5, NULL),
(158, 158, 'D1630126892', '2021-09-02 04:42:42', 4, NULL),
(159, 159, 'D0', '2021-09-02 07:00:32', 0, NULL),
(160, 160, 'D0', '2021-09-02 07:00:59', 0, NULL),
(173, 173, 'D1630566263', '2021-09-04 05:50:56', 4, NULL),
(174, 174, 'D1630566263', '2021-09-04 15:45:41', 4, NULL),
(175, 175, 'D1630566263', '2021-09-04 15:46:03', 4, NULL),
(333, 333, 'D1658242062', '2022-07-22 16:10:48', 4, NULL),
(332, 332, 'D1658242062', '2022-07-22 14:55:08', 4, NULL),
(331, 331, 'D0', '2022-07-22 14:50:31', 0, NULL),
(179, 179, 'D1630566263', '2021-09-21 12:44:38', 4, NULL),
(180, 180, 'D1630566263', '2021-09-21 12:47:44', 4, NULL),
(181, 181, '', '2021-09-21 12:58:16', 6, NULL),
(182, 182, '', '2021-09-21 12:58:44', 6, NULL),
(330, 330, 'D1658242062', '2022-07-22 14:39:02', 4, NULL),
(184, 184, '', '2021-10-16 19:40:18', 6, NULL),
(185, 185, '', '2021-10-19 16:07:32', 6, NULL),
(186, 186, 'D1634808158', '2021-10-21 13:15:15', 4, NULL),
(187, 187, 'D1634808158', '2021-10-21 16:54:22', 4, NULL),
(188, 188, 'D0', '2021-10-22 02:02:46', 0, NULL),
(189, 189, 'D1634808158', '2021-10-22 02:03:08', 2, NULL),
(190, 190, 'D1634808158', '2021-10-22 04:34:51', 2, NULL),
(191, 191, 'D0', '2021-10-26 09:38:45', 0, NULL),
(192, 192, 'D0', '2021-10-26 09:42:45', 0, NULL),
(193, 193, 'D0', '2021-10-26 10:34:07', 0, NULL),
(194, 194, 'D0', '2021-10-26 11:51:35', 0, NULL),
(195, 195, 'D0', '2021-10-27 11:41:25', 0, NULL),
(196, 196, 'D0', '2021-10-27 15:24:51', 0, NULL),
(197, 197, 'D0', '2021-10-27 16:06:46', 0, NULL),
(198, 198, 'D0', '2021-10-27 16:24:09', 0, NULL),
(199, 199, 'D0', '2021-10-27 16:51:28', 0, NULL),
(200, 200, 'D0', '2021-10-27 17:13:04', 0, NULL),
(201, 201, 'D0', '2021-10-27 17:56:56', 0, NULL),
(202, 202, 'D0', '2021-10-27 18:12:36', 0, NULL),
(203, 203, 'D0', '2021-10-28 01:50:17', 0, NULL),
(204, 204, '', '2021-10-28 07:24:30', 6, NULL),
(205, 205, '', '2021-10-28 08:05:36', 6, NULL),
(206, 206, '', '2021-10-28 08:16:19', 6, NULL),
(207, 207, '', '2021-10-28 08:22:30', 6, NULL),
(208, 208, 'D0', '2021-10-28 08:41:47', 0, NULL),
(209, 209, 'D0', '2021-10-28 08:55:17', 0, NULL),
(210, 210, 'D0', '2021-10-28 08:58:09', 0, NULL),
(211, 211, 'D0', '2021-10-28 10:20:44', 0, NULL),
(212, 212, 'D0', '2021-10-28 10:27:46', 0, NULL),
(213, 213, 'D0', '2021-10-28 10:27:56', 0, NULL),
(214, 214, 'D0', '2021-10-28 10:30:07', 0, NULL),
(215, 215, 'D0', '2021-10-28 10:32:34', 0, NULL),
(216, 216, 'D0', '2021-10-28 10:36:18', 0, NULL),
(217, 217, '', '2021-10-28 10:45:00', 6, NULL),
(218, 218, 'D0', '2021-10-28 11:02:43', 0, NULL),
(219, 219, 'D0', '2021-10-28 11:53:56', 0, NULL),
(220, 220, 'D0', '2021-10-28 12:00:22', 0, NULL),
(221, 221, 'D0', '2021-10-28 12:29:04', 0, NULL),
(222, 222, 'D0', '2021-10-28 13:15:43', 0, NULL),
(223, 223, 'D0', '2021-10-28 13:24:54', 0, NULL),
(224, 224, 'D0', '2021-10-28 13:30:59', 0, NULL),
(225, 225, '', '2021-10-28 14:27:01', 6, NULL),
(226, 226, 'D0', '2021-10-28 15:14:49', 0, NULL),
(227, 227, '', '2021-10-28 17:05:05', 6, NULL),
(228, 228, 'D0', '2021-10-29 02:27:08', 0, NULL),
(229, 229, 'D0', '2021-10-29 02:32:44', 0, NULL),
(230, 230, 'D0', '2021-10-29 02:38:23', 0, NULL),
(231, 231, '', '2021-10-29 04:38:24', 6, NULL),
(232, 232, 'D0', '2021-10-29 06:04:53', 0, NULL),
(233, 233, 'D0', '2021-10-29 06:13:46', 0, NULL),
(234, 234, '', '2021-10-29 06:31:32', 6, NULL),
(235, 235, 'D0', '2021-10-29 08:27:51', 0, NULL),
(236, 236, 'D0', '2021-10-29 08:28:04', 0, NULL),
(237, 237, 'D0', '2021-10-29 09:14:17', 0, NULL),
(238, 238, 'D0', '2021-10-29 09:26:50', 0, NULL),
(239, 239, 'D0', '2021-10-29 09:53:30', 0, NULL),
(240, 240, 'D0', '2021-10-29 10:10:56', 0, NULL),
(241, 241, 'D0', '2021-10-29 10:26:44', 0, NULL),
(242, 242, 'D0', '2021-10-29 10:30:45', 0, NULL),
(243, 243, 'D0', '2021-10-29 10:31:07', 0, NULL),
(244, 244, 'D0', '2021-10-29 10:35:12', 0, NULL),
(245, 245, '', '2021-10-29 10:43:06', 6, NULL),
(246, 246, '', '2021-10-29 10:47:39', 6, NULL),
(247, 247, 'D0', '2021-10-29 10:48:15', 0, NULL),
(248, 248, '', '2021-10-29 10:54:11', 6, NULL),
(249, 249, '', '2021-10-29 11:31:35', 6, NULL),
(250, 250, '', '2021-10-29 13:03:34', 6, NULL),
(251, 251, '', '2021-10-30 15:05:43', 6, NULL),
(252, 252, 'D0', '2021-10-31 15:25:20', 0, NULL),
(253, 253, 'D0', '2021-10-31 15:45:56', 0, NULL),
(254, 254, 'D0', '2021-10-31 15:49:07', 5, NULL),
(255, 255, '', '2021-10-31 17:43:03', 6, NULL),
(256, 256, 'D0', '2021-10-31 18:09:30', 0, NULL),
(257, 257, '', '2021-11-01 05:51:01', 6, NULL),
(258, 258, '', '2021-11-01 09:28:28', 6, NULL),
(259, 259, '', '2021-11-01 10:08:17', 6, NULL),
(260, 260, '', '2021-11-01 10:21:39', 6, NULL),
(261, 261, 'D1630566263', '2021-11-01 17:11:14', 4, NULL),
(262, 262, 'D0', '2021-11-01 17:14:17', 0, NULL),
(263, 263, '', '2021-11-01 17:34:08', 6, NULL),
(264, 264, 'D1634808158', '2021-11-02 06:10:16', 3, NULL),
(265, 265, '', '2021-11-02 06:44:29', 6, NULL),
(266, 266, '', '2021-11-02 06:53:23', 6, NULL),
(267, 267, '', '2021-11-02 07:07:17', 6, NULL),
(268, 268, '', '2021-11-02 07:13:24', 6, NULL),
(269, 269, 'D0', '2021-11-02 07:15:35', 0, NULL),
(270, 270, 'D0', '2021-11-02 07:32:04', 0, NULL),
(271, 271, 'D0', '2021-11-02 07:54:30', 0, NULL),
(272, 272, 'D0', '2021-11-02 08:06:14', 0, NULL),
(273, 273, 'D0', '2021-11-02 08:29:55', 0, NULL),
(274, 274, 'D0', '2021-11-02 08:33:29', 0, NULL),
(275, 275, 'D0', '2021-11-02 08:41:57', 0, NULL),
(276, 276, 'D0', '2021-11-02 08:48:44', 0, NULL),
(277, 277, '', '2021-11-02 09:18:07', 6, NULL),
(278, 278, 'D0', '2021-11-02 09:22:21', 0, NULL),
(279, 279, 'D0', '2021-11-02 09:27:18', 0, NULL),
(280, 280, '', '2021-11-02 10:06:00', 6, NULL),
(281, 281, 'D0', '2021-11-02 10:09:04', 0, NULL),
(282, 282, '', '2021-11-02 10:25:46', 6, NULL),
(283, 283, '', '2021-11-02 10:27:06', 6, NULL),
(284, 284, 'D0', '2021-11-02 10:31:21', 0, NULL),
(285, 285, 'D0', '2021-11-02 10:40:28', 0, NULL),
(286, 286, '', '2021-11-02 10:40:59', 6, NULL),
(287, 287, '', '2021-11-02 10:44:51', 6, NULL),
(288, 288, 'D0', '2021-11-02 10:50:02', 0, NULL),
(289, 289, '', '2021-11-02 10:50:56', 6, NULL),
(290, 290, 'D1634808158', '2021-11-02 13:12:15', 2, NULL),
(291, 291, 'D1630566263', '2021-11-18 16:19:57', 4, NULL),
(292, 292, '', '2021-11-25 04:18:08', 6, NULL),
(293, 293, '', '2021-11-25 04:33:09', 6, NULL),
(294, 294, '', '2021-11-25 04:38:07', 6, NULL),
(295, 295, '', '2021-11-25 04:39:05', 6, NULL),
(296, 296, '', '2021-11-25 09:36:47', 6, NULL),
(297, 297, '', '2022-01-10 18:18:29', 6, NULL),
(298, 298, '', '2022-01-12 12:50:43', 6, NULL),
(299, 299, 'D0', '2022-06-16 03:47:25', 0, NULL),
(300, 300, 'D0', '2022-06-20 15:07:01', 0, NULL),
(302, 302, 'D0', '2022-06-21 17:00:14', 0, NULL),
(303, 303, 'D0', '2022-06-22 05:33:00', 0, NULL),
(304, 304, 'D0', '2022-06-23 12:20:06', 0, NULL),
(305, 305, 'D0', '2022-06-23 12:22:26', 0, NULL),
(306, 306, '', '2022-06-23 13:05:31', 6, NULL),
(307, 307, '', '2022-06-23 13:30:10', 6, NULL),
(308, 308, '', '2022-07-01 11:49:17', 6, NULL),
(309, 309, '', '2022-07-01 17:06:23', 6, NULL),
(310, 310, '', '2022-07-01 17:12:24', 6, NULL),
(311, 311, '', '2022-07-01 17:35:31', 6, NULL),
(312, 312, 'D0', '2022-07-01 17:50:12', 0, NULL),
(313, 313, '', '2022-07-01 18:04:39', 6, NULL),
(314, 314, '', '2022-07-01 18:18:35', 6, NULL),
(315, 315, 'D0', '2022-07-01 18:34:30', 0, NULL),
(316, 316, 'D0', '2022-07-01 18:38:21', 0, NULL),
(317, 317, 'D0', '2022-07-01 18:48:11', 0, NULL),
(318, 318, 'D0', '2022-07-01 18:54:24', 0, NULL),
(319, 319, 'D0', '2022-07-01 19:00:12', 0, NULL),
(320, 320, 'D0', '2022-07-01 19:06:47', 0, NULL),
(321, 321, 'D0', '2022-07-01 19:12:06', 0, NULL),
(322, 322, 'D0', '2022-07-01 19:23:45', 0, NULL),
(323, 323, 'D0', '2022-07-01 19:55:54', 0, NULL),
(324, 324, 'D0', '2022-07-02 03:03:36', 0, NULL),
(325, 325, 'D0', '2022-07-05 03:11:01', 0, NULL),
(326, 326, 'D0', '2022-07-05 03:37:41', 0, NULL),
(327, 327, 'D0', '2022-07-05 03:44:37', 0, NULL),
(328, 328, '', '2022-07-05 03:55:53', 6, NULL),
(329, 329, 'D0', '2022-07-05 04:16:12', 0, NULL),
(334, 334, '', '2022-07-22 16:12:56', 6, NULL),
(335, 335, '', '2022-07-23 15:03:46', 6, NULL),
(336, 336, 'D1658242062', '2022-07-23 15:20:03', 4, NULL),
(337, 337, 'D1658242062', '2022-07-23 15:24:02', 4, NULL),
(338, 338, 'D1658242062', '2022-07-23 17:09:02', 4, NULL),
(339, 339, 'D1658242062', '2022-07-23 17:12:20', 4, NULL),
(340, 340, 'D0', '2022-07-25 03:56:35', 0, NULL),
(341, 341, '', '2022-07-26 12:29:29', 6, NULL),
(342, 342, '', '2022-07-26 13:00:42', 6, NULL),
(343, 343, '', '2022-07-26 13:10:08', 6, NULL),
(344, 344, 'D1658697721', '2022-07-26 13:17:32', 2, NULL),
(345, 345, 'D1658697721', '2022-07-26 13:19:01', 2, NULL),
(346, 346, 'D0', '2022-07-31 15:04:22', 0, NULL),
(347, 347, 'D1658242062', '2022-08-01 14:37:06', 5, NULL),
(348, 348, 'D1658242062', '2022-08-01 14:51:52', 4, NULL),
(349, 349, 'D1659368939', '2022-08-01 15:54:30', 4, NULL),
(350, 350, 'D1659368939', '2022-08-02 09:02:12', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_status`
--

CREATE TABLE `transaction_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_status`
--

INSERT INTO `transaction_status` (`id`, `transaction_status`) VALUES
(3, 'process'),
(4, 'complete'),
(5, 'cancel'),
(2, 'driver found'),
(1, 'find driver'),
(6, 'received ');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `variant` varchar(40) NOT NULL,
  `vehicle_registration_number` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `brand`, `type`, `variant`, `vehicle_registration_number`, `color`) VALUES
(491, 'maruti', 'vsa', '', '43643634', '#2986cc'),
(492, 'maruti', 'suzuki', '', '63838838', 'blue'),
(493, 'car', 'ta', '', '572428727', 'blue'),
(494, 'maruti', 'test', '', 'fjhg', 'bpue'),
(495, 'maruti', 'baleno', '', 'Gj06 AD 5073', 'White'),
(496, 'hero', 'bike', '', '1234', 'black'),
(497, 'zbzb', 'zhzh', '', '1123', 'sjsn'),
(498, 'maruti', 'vsa', '', '43643634', 'blue'),
(499, 'zhzg', 'zvzz', '', '2222', 'xhsh'),
(500, 'gjj', 'gh', '', '47788', 'fu'),
(501, 'bajaj', 'bike', '', 'mp09mr8427', 'blue'),
(502, 'stew', 'sgwe', '', '25235', 'blue'),
(503, 'kzn\nddm\nd\nd', 'd', '', 's21111', 'jsjs'),
(504, 'xjd', 'jxdj', '', '19292', 'nxdn'),
(505, 'bsbz', 'shdn', '', '3838', 'oue'),
(506, 's ewry', 'revyery', '', 'vywery', 'rveyw'),
(507, 'sbsb', 'shsb', '', 'xbdbd', 'dndbd'),
(508, 'shsg', 'shshs', '', '2625', 'sbbs'),
(509, 'zbbxh', 'xbxbb', '', 'xbbxhd', 'xhxh'),
(510, 'xbb', 'shhdj', '', 'hhdjdj', 'xbxhhx'),
(511, 'bxjx', 'xbbxdbzbz', '', 'bdbxbd', 'dbbxb'),
(512, 'fu', 'sbbz', '', 'xbxbbx', 'zbbx'),
(513, 'manuru', 'bxbx', '', 'bxbx', 'dbbx'),
(514, 'bsnd', 'dvdbdnd', '', 'hdjxj', '0000'),
(515, 'maruti', 'sd', '', '43643634', '#5111f4'),
(516, 'sf', 'ewr', '', '43643634235', '23523'),
(517, 'rtwery', 'wey', '', '43236436', 'ryre'),
(518, 'Gdjjd', 'bxbx', '', 'bdbxb', 'bdbfb'),
(519, 'shhs', 'shsh', '', 'suwu7', 'ywhs'),
(520, 'gdhd', 'bzbz', '', 'xvxb', 'dvx'),
(521, 'ccsc', 'sdscsd', '', 'svdsvdvs', 'scvscvs'),
(522, 'hxh', 'xhxx', '', '63737', 'blue'),
(523, 'honda', 'truck', '', 'MH 15 AL 1234', 'red'),
(524, 'TATA', 'PUNCH', '', 'GJ11AA4545', 'black'),
(525, 'TATA', 'PUNCH', '', 'GJ11AA4545', 'black'),
(526, 'TATA', 'PUNCH', '', 'GJ11AA4545', 'black'),
(527, 'TATA', 'PUNCH', '', 'GJ11AA4545', 'black'),
(528, 'TATA', 'PUNCH', '', 'GJ11AA4545', 'black'),
(529, 'TATA', 'PUNCH', '', 'GJ11AA4545', 'black'),
(530, 'TATA', 'PUNCH', '', 'GJ11AA4545', 'black'),
(531, 'TATA', 'car', '', '123456', 'black'),
(532, 'suzhuki', 'car', '', '266236', 'red'),
(533, 'Suzhuki', 'car', '', '2266226', 'red'),
(534, 'Sumo', 'Sumo', '', '8408068178', 'black'),
(535, 'Sumo', 'Sumo', '', ' MH-19-AG-5465', 'black'),
(536, 'Sumo', 'Sumo', '', ' MH-19-AG-5465', 'black'),
(537, 'Sumo', 'Sumo', '', ' MH-19-AG-5465', 'black'),
(538, 'sumo', 'Truck', '', 'MH-19-AG-5465', 'black'),
(539, 'bxbx', 'narendra@sixsensemob', '', 'g hbc', 'narendra@sixsensemobility.com'),
(540, 'hfgh', 'sumanpal300@gmail.co', '', 'hdhxhh', 'sumanpal300@gmail.com'),
(541, 'hzhx', 'hb', '', 'bxnxn', 'na');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher` varchar(20) NOT NULL,
  `voucher_type` char(1) NOT NULL,
  `voucher_service` int(11) NOT NULL,
  `expired` date NOT NULL,
  `voucher_discount` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `count_to_use` int(11) NOT NULL,
  `is_valid` varchar(3) NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `voucher`, `voucher_type`, `voucher_service`, `expired`, `voucher_discount`, `description`, `count_to_use`, `is_valid`) VALUES
(1, 'DISKON', '1', 15, '2020-01-31', 2, 'Discount', 0, 'yes'),
(2, 'DISKON', '1', 16, '2020-01-31', 5, 'Discount', 0, 'yes'),
(3, 'DISKON', '1', 17, '2020-01-31', 5, 'Discount', 0, 'yes'),
(13, 'DISKON', '1', 27, '2020-01-31', 0, 'Discount', 0, 'yes'),
(7, 'DISKON', '1', 21, '2020-01-31', 2, 'Discount', 0, 'yes'),
(8, 'DISKON', '1', 22, '2020-01-31', 0, 'Discount', 0, 'yes'),
(9, 'DISKON', '1', 23, '2020-01-31', 0, 'Discount', 0, 'yes'),
(10, 'DISKON', '1', 24, '2020-01-31', 0, 'Discount', 0, 'yes'),
(11, 'DISKON', '1', 25, '2020-01-31', 5, 'Discount', 0, 'yes'),
(12, 'DISKON', '1', 26, '2020-01-31', 0, 'Discount', 0, 'yes'),
(14, 'DISKON', '1', 28, '2020-01-31', 5, 'Discount', 0, 'yes'),
(15, 'DISKON', '1', 29, '2020-01-31', 0, 'Discount', 0, 'yes'),
(16, 'DISKON', '1', 30, '2020-01-31', 5, 'Discount', 0, 'yes'),
(25, 'DISKON', '1', 39, '2020-01-31', 0, 'Discount', 0, 'yes'),
(26, 'DISKON', '1', 40, '2020-01-31', 10, 'Discount', 0, 'yes'),
(27, 'DISKON', '1', 41, '2020-01-31', 10, 'Discount', 0, 'yes'),
(28, 'DISKON', '1', 42, '2020-01-31', 10, 'Discount', 0, 'yes'),
(30, 'DISKON', '1', 44, '2020-01-31', 10, 'Discount', 0, 'yes'),
(31, 'DISKON', '1', 45, '2020-01-31', 10, 'Discount', 0, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `wallet_amount` int(11) NOT NULL,
  `bank` varchar(250) NOT NULL,
  `holder_name` varchar(500) NOT NULL,
  `wallet_account` varchar(250) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `id_user`, `wallet_amount`, `bank`, `holder_name`, `wallet_account`, `date`, `type`, `status`) VALUES
(1013, 'D1618783793', 10000000, 'admin', 'jd', 'admin', '2021-04-18 22:13:14', 'topup', 1),
(1014, 'D1621584357', 1000, 'Wood', 'jp', 'wallet', '2021-05-31 06:24:36', 'Order-', 1),
(1015, 'D1621584357', 1000, 'Cycle', 'jp', 'wallet', '2021-05-31 08:05:10', 'Order-', 1),
(1016, 'D1621584357', 1000, 'IT things', 'jp', 'wallet', '2021-06-15 07:01:37', 'Order-', 1),
(1017, 'D1623751809', 1500, 'Cycle', 'Dhairya', 'wallet', '2021-06-15 10:30:18', 'Order-', 1),
(1026, 'D1623751809', 42, 'Send Goods', 'Dhairya', 'wallet', '2021-07-08 10:55:34', 'Order-', 1),
(1121, 'D1630126892', 10, 'Send Goods', 'dhairya', 'wallet', '2021-09-02 04:36:27', 'Order-', 1),
(1120, 'D1630126892', 10, 'Send Goods', 'dhairya', 'wallet', '2021-09-02 04:36:15', 'Order-', 1),
(1134, 'D1630566263', 14, 'Send Goods', 'xbbz', 'wallet', '2021-09-21 12:46:14', 'Order-', 1),
(1051, 'D1628155846', 14, 'Send Goods', 'bN', 'wallet', '2021-08-05 15:23:14', 'Order-', 1),
(1035, 'P1624943286', 500000, 'admin', 'narendra verma', 'admin', '2021-07-15 11:23:43', 'topup', 1),
(1157, 'D1658242062', 35, 'Send Goods', 'bxb', 'wallet', '2022-07-23 15:12:23', 'Order-', 1),
(1039, 'D1626942556', 10, 'Send Goods', 'natrxn', 'wallet', '2021-07-22 08:46:15', 'Order-', 1),
(1156, 'D1658242062', 14, 'Send Goods', 'bxb', 'wallet', '2022-07-22 16:21:11', 'Order-', 1),
(1155, 'D1658242062', 14, 'Send Goods', 'bxb', 'wallet', '2022-07-22 16:19:40', 'Order-', 1),
(1049, 'D1628155846', 4676400, 'admin', 'bN', 'admin', '2021-08-05 09:43:25', 'topup', 1),
(1050, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-05 15:13:26', 'Order-', 1),
(1052, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-05 15:30:34', 'Order-', 1),
(1053, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-05 15:34:35', 'Order-', 1),
(1054, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-08 11:11:49', 'Order-', 1),
(1055, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-08 11:16:05', 'Order-', 1),
(1056, 'D1628840936', 10, 'Send Goods', 'sunit', 'wallet', '2021-08-13 09:23:11', 'Order-', 1),
(1129, 'D1630566263', 76349, 'Send Goods', 'xbbz', 'wallet', '2021-09-04 15:43:29', 'Order-', 1),
(1058, 'D1628840936', 6216, 'Send Goods', 'sunit', 'wallet', '2021-08-15 10:44:42', 'Order-', 1),
(1059, 'D1628155846', 35, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:16:36', 'Order-', 1),
(1060, 'D1628155846', 14, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:16:54', 'Order-', 1),
(1061, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:17:09', 'Order-', 1),
(1062, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:17:32', 'Order-', 1),
(1063, 'D1628155846', 150, 'Truck', 'bN', 'wallet', '2021-08-17 14:17:53', 'Order-', 1),
(1064, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:18:23', 'Order-', 1),
(1065, 'D1628155846', 35, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:19:49', 'Order-', 1),
(1066, 'D1628155846', 35, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:25:58', 'Order-', 1),
(1067, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:27:00', 'Order-', 1),
(1068, 'D1628155846', 6216, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:34:50', 'Order-', 1),
(1069, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 14:42:55', 'Order-', 1),
(1071, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 17:46:33', 'Order-', 1),
(1072, 'D1628155846', 35, 'Send Goods', 'bN', 'wallet', '2021-08-17 17:47:48', 'Order-', 1),
(1073, 'D1628155846', 6216, 'Send Goods', 'bN', 'wallet', '2021-08-17 17:51:26', 'Order-', 1),
(1074, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 17:53:16', 'Order-', 1),
(1075, 'D1628155846', 6216, 'Send Goods', 'bN', 'wallet', '2021-08-17 17:53:48', 'Order-', 1),
(1076, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 17:59:05', 'Order-', 1),
(1077, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 17:59:54', 'Order-', 1),
(1078, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 18:00:03', 'Order-', 1),
(1079, 'D1628155846', 14, 'Send Goods', 'bN', 'wallet', '2021-08-17 18:00:14', 'Order-', 1),
(1080, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-17 18:02:39', 'Order-', 1),
(1081, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-18 03:36:16', 'Order-', 1),
(1082, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-18 03:37:43', 'Order-', 1),
(1083, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-18 03:37:55', 'Order-', 1),
(1130, 'D1630566263', 35, 'Send Goods', 'xbbz', 'wallet', '2021-09-04 15:44:28', 'Order-', 1),
(1085, 'D1628155846', 3101, 'Send Goods', 'bN', 'wallet', '2021-08-22 03:40:15', 'Order-', 1),
(1086, 'D1628155846', 3101, 'Send Goods', 'bN', 'wallet', '2021-08-22 03:51:00', 'Order-', 1),
(1128, 'D1630566263', 75971, 'Send Goods', 'xbbz', 'wallet', '2021-09-04 05:42:10', 'Order-', 1),
(1126, 'D1630566263', 10, 'Send Goods', 'xbbz', 'wallet', '2021-09-03 12:28:45', 'Order-', 1),
(1089, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-23 06:07:48', 'Order-', 1),
(1090, 'D1628155846', 3332, 'Send Goods', 'bN', 'wallet', '2021-08-23 06:20:03', 'Order-', 1),
(1091, 'D1628155846', 6720, 'Send Goods', 'bN', 'wallet', '2021-08-23 06:25:56', 'Order-', 1),
(1092, 'D1628155846', 3101, 'Send Goods', 'bN', 'wallet', '2021-08-23 06:26:33', 'Order-', 1),
(1093, 'D1628155846', 3101, 'Send Goods', 'bN', 'wallet', '2021-08-23 09:20:10', 'Order-', 1),
(1094, 'D1628155846', 3101, 'Send Goods', 'bN', 'wallet', '2021-08-23 17:03:10', 'Order-', 1),
(1095, 'D1628155846', 6720, 'Send Goods', 'bN', 'wallet', '2021-08-23 17:03:55', 'Order-', 1),
(1096, 'D1628155846', 3325, 'Send Goods', 'bN', 'wallet', '2021-08-23 17:05:46', 'Order-', 1),
(1097, 'D1628155846', 3528, 'Send Goods', 'bN', 'wallet', '2021-08-25 09:31:15', 'Order-', 1),
(1098, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-25 09:31:22', 'Order-', 1),
(1099, 'D1628155846', 10, 'Send Goods', 'bN', 'wallet', '2021-08-25 09:31:23', 'Order-', 1),
(1100, 'D1628155846', 3353, 'Send Goods', 'bN', 'wallet', '2021-08-25 09:32:20', 'Order-', 1),
(1101, 'D1628155846', 3304, 'Send Goods', 'bN', 'wallet', '2021-08-25 09:32:29', 'Order-', 1),
(1102, 'D1628155846', 3353, 'Send Goods', 'bN', 'wallet', '2021-08-25 09:32:37', 'Order-', 1),
(1103, 'D1628155846', 3304, 'Send Goods', 'bN', 'wallet', '2021-08-25 09:32:43', 'Order-', 1),
(1127, 'D1630566263', 75831, 'Send Goods', 'xbbz', 'wallet', '2021-09-03 12:28:56', 'Order-', 1),
(1124, 'D1630566263', 75551, 'Send Goods', 'xbbz', 'wallet', '2021-09-02 11:09:33', 'Order-', 1),
(1125, 'D1630566263', 10, 'Send Goods', 'xbbz', 'wallet', '2021-09-02 11:09:43', 'Order-', 1),
(1122, 'D1630126892', 21, 'Send Goods', 'dhairya', 'wallet', '2021-09-02 09:33:09', 'Order-', 1),
(1123, 'D1630566263', 35, 'Send Goods', 'xbbz', 'wallet', '2021-09-02 10:55:26', 'Order-', 1),
(1135, 'D1630566263', 10, 'Send Goods', 'xbbz', 'wallet', '2021-09-21 12:56:26', 'Order-', 1),
(1136, 'D1630566263', 10, 'Send Goods', 'xbbz', 'wallet', '2021-09-21 12:57:13', 'Order-', 1),
(1137, 'D1630566263', 35, 'Send Goods', 'xbbz', 'wallet', '2021-09-21 12:57:26', 'Order-', 1),
(1138, 'D1630566263', 35, 'Send Goods', 'xbbz', 'wallet', '2021-09-21 13:00:45', 'Order-', 1),
(1139, 'D1630566263', 6216, 'Send Goods', 'xbbz', 'wallet', '2021-09-21 13:02:16', 'Order-', 1),
(1154, 'D1658242062', 14, 'Send Goods', 'bxb', 'wallet', '2022-07-22 16:19:03', 'Order-', 1),
(1141, 'D1630566263', 10, 'Send Goods', 'xbbz', 'wallet', '2021-10-19 16:08:40', 'Order-', 1),
(1142, 'D1634808158', 10, 'Send Goods', 'jdj', 'wallet', '2021-10-21 16:07:35', 'Order-', 1),
(1143, 'D1634808158', 10, 'Send Goods', 'jdj', 'wallet', '2021-10-22 02:00:12', 'Order-', 1),
(1144, 'D1635758030', 9023, 'Send Goods', 'sam', 'wallet', '2021-11-01 09:30:04', 'Order-', 1),
(1145, 'D1635758030', 9023, 'Send Goods', 'sam', 'wallet', '2021-11-01 10:24:19', 'Order-', 1),
(1146, 'D1635758030', 9023, 'Send Goods', 'sam', 'wallet', '2021-11-01 10:24:36', 'Order-', 1),
(1147, 'D1630566263', 14, 'Send Goods', 'xbbz', 'wallet', '2021-11-02 15:02:28', 'Order-', 1),
(1148, 'D1635758030', 12350, 'Send Goods', 'sam', 'wallet', '2021-11-04 06:39:54', 'Order-', 1),
(1149, 'D1635758030', 125, 'Send Goods', 'sam', 'wallet', '2021-11-04 06:40:20', 'Order-', 1),
(1150, 'D1630566263', 200, 'Send Goods', 'xbbz', 'wallet', '2021-11-18 16:59:10', 'Order-', 1),
(1151, 'D1635758030', 9023, 'Send Goods', 'sam', 'wallet', '2021-11-25 04:20:02', 'Order-', 1),
(1152, 'D1655982368', 0, 'Truck', 'Suraj', 'wallet', '2022-06-23 13:10:35', 'Order-', 1),
(1153, 'D1655982368', 0, 'Truck', 'Suraj', 'wallet', '2022-06-23 13:32:04', 'Order-', 1),
(1158, 'D1658242062', 35, 'Send Goods', 'bxb', 'wallet', '2022-07-23 15:22:38', 'Order-', 1),
(1159, 'D1658242062', 14, 'Send Goods', 'bxb', 'wallet', '2022-07-23 15:24:37', 'Order-', 1),
(1160, 'D1658242062', 14, 'Send Goods', 'bxb', 'wallet', '2022-07-23 17:10:22', 'Order-', 1),
(1161, 'D1658242062', 2500, 'Cycle', 'bxb', 'wallet', '2022-07-23 17:12:53', 'Order-', 1),
(1162, 'D1618783793', 5000, 'fkfj', 'jhg', 'uyhf', '2022-07-23 17:17:26', 'withdraw', 1),
(1163, 'D1658242062', 10000, 'admin', 'bxb', 'admin', '2022-07-23 17:18:35', 'topup', 1),
(1164, 'D1658697721', 147, 'Send Goods', 'suman', 'wallet', '2022-07-26 12:32:45', 'Order-', 1),
(1165, 'D1658697721', 1200, 'Send Goods', 'suman', 'wallet', '2022-07-26 13:03:29', 'Order-', 1),
(1166, 'D1658242062', 6216, 'Send Goods', 'bxb', 'wallet', '2022-08-01 14:53:34', 'Order-', 1),
(1167, 'D1659368939', 35, 'Send Goods', 'Narendok', 'wallet', '2022-08-01 15:56:52', 'Order-', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`number`),
  ADD UNIQUE KEY `number` (`number`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `bank_list`
--
ALTER TABLE `bank_list`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `category_item`
--
ALTER TABLE `category_item`
  ADD PRIMARY KEY (`category_item_id`);

--
-- Indexes for table `config_driver`
--
ALTER TABLE `config_driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `latitude` (`latitude`),
  ADD KEY `longitude` (`longitude`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `detail_send_transaction`
--
ALTER TABLE `detail_send_transaction`
  ADD PRIMARY KEY (`send_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `user_nationid` (`user_nationid`);

--
-- Indexes for table `driver_job`
--
ALTER TABLE `driver_job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `driver_rating`
--
ALTER TABLE `driver_rating`
  ADD PRIMARY KEY (`number`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Indexes for table `file_driver`
--
ALTER TABLE `file_driver`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `item_transaction`
--
ALTER TABLE `item_transaction`
  ADD PRIMARY KEY (`transaction_item_id`);

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`merchant_id`);

--
-- Indexes for table `merchant_category`
--
ALTER TABLE `merchant_category`
  ADD PRIMARY KEY (`category_merchant_id`);

--
-- Indexes for table `merchant_detail_transaction`
--
ALTER TABLE `merchant_detail_transaction`
  ADD PRIMARY KEY (`merchant_transaction_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`news_category_id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`partner_id`),
  ADD UNIQUE KEY `partner_email` (`partner_email`),
  ADD UNIQUE KEY `partner_telephone` (`partner_telephone`);

--
-- Indexes for table `payusettings`
--
ALTER TABLE `payusettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `id` (`service_id`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenu_admin`
--
ALTER TABLE `submenu_admin`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`customer_id`,`order_time`),
  ADD UNIQUE KEY `number` (`id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`number`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Indexes for table `transaction_status`
--
ALTER TABLE `transaction_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `id` (`vehicle_id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `number` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `bank_list`
--
ALTER TABLE `bank_list`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_item`
--
ALTER TABLE `category_item`
  MODIFY `category_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `detail_send_transaction`
--
ALTER TABLE `detail_send_transaction`
  MODIFY `send_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT for table `driver_job`
--
ALTER TABLE `driver_job`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `driver_rating`
--
ALTER TABLE `driver_rating`
  MODIFY `number` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `file_driver`
--
ALTER TABLE `file_driver`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=869;

--
-- AUTO_INCREMENT for table `forgot_password`
--
ALTER TABLE `forgot_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item_transaction`
--
ALTER TABLE `item_transaction`
  MODIFY `transaction_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant`
--
ALTER TABLE `merchant`
  MODIFY `merchant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `merchant_category`
--
ALTER TABLE `merchant_category`
  MODIFY `category_merchant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `merchant_detail_transaction`
--
ALTER TABLE `merchant_detail_transaction`
  MODIFY `merchant_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_category`
--
ALTER TABLE `news_category`
  MODIFY `news_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payusettings`
--
ALTER TABLE `payusettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `submenu_admin`
--
ALTER TABLE `submenu_admin`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `number` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `transaction_status`
--
ALTER TABLE `transaction_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicle_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1168;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
