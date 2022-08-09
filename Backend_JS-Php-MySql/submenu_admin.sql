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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `submenu_admin`
--
ALTER TABLE `submenu_admin`
  ADD PRIMARY KEY (`sub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `submenu_admin`
--
ALTER TABLE `submenu_admin`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
