-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2020 at 03:07 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery_andrey_aleksovski`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(55) NOT NULL,
  `house_number` int(11) NOT NULL,
  `entrance_number` int(11) NOT NULL,
  `appartment_number` int(11) NOT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `street`, `house_number`, `entrance_number`, `appartment_number`, `zip_code`) VALUES
(1, 'Markhofgasse', 2, 1, 3, 1030),
(2, 'Habsburger strasse', 12, 1, 7, 1070),
(3, 'Hietzinger Kai', 9, 1, 8, 1040),
(4, 'Wagramer strasse', 5, 0, 0, 1010),
(5, 'Hietzinger Kai', 9, 1, 8, 1040),
(6, 'Wagramer strasse', 5, 3, 15, 1010),
(7, 'Geli Promenade', 2, 1, 7, 1160),
(8, 'Oberedonaustrasse', 4, 1, 2, 1110),
(9, 'Unterebelvedere', 2, 5, 8, 1030),
(10, 'Sweizgasse', 6, 9, 7, 1040);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `outpost_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `date_of_birth`, `outpost_id`, `role_id`) VALUES
(1, 'Mark', 'Zukenberg', '2001-04-09', 3, 4),
(2, 'Jeff', 'Bezos', '2000-02-26', 5, 5),
(3, 'Elon', 'Musk', '2000-02-19', 3, 6),
(4, 'Jack', 'Larson', '1988-08-18', 6, 1),
(5, 'Filip', 'Fluente', '1988-01-11', 4, 3),
(6, 'Sam', 'Goodrich', '1977-08-09', 6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `employee_role`
--

CREATE TABLE `employee_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  `role_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_role`
--

INSERT INTO `employee_role` (`role_id`, `role_name`, `role_description`) VALUES
(1, 'City Carrier', 'Delivers and collects mail on foot or by vehicle under varying road and weather conditions in a prescribed area; maintains professional and effective public relations with customers and others, requiring a general familiarity with postal laws, regulations'),
(2, 'Mail Processing Cler', 'The primary job of a mail processing clerk is to operate and maintain the various types of automated sorting and scanning machines used for mail processing and distribution'),
(3, 'Data Conversion Oper', 'Data conversion operators are entry level positions with the US Postal Service who help to prepare mail and parcels for automated sorting. '),
(4, 'Mail Handler', 'Loads, unloads, and moves bulk mail and performs other duties incidental to the movement and processing of mail. '),
(5, 'Rural Carrier', 'RCAs are responsible for the safe and efficient delivery and collection of the U.S. Mail™, working part time when regular carriers have scheduled days off or take vacation days'),
(6, 'Mechanic', 'Repairs the vehicles, order parts and does maintenance'),
(7, 'Outpost Manager', 'Responsible for the whole outpost including the stuff and customer satisfaction as a priority');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `date_received` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_delivered` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `outpost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `date_received`, `date_delivered`, `sender_id`, `receiver_id`, `outpost_id`) VALUES
(3, '2020-08-08 10:32:11', '2020-08-08 11:32:10', 3, 3, 6),
(4, '2020-08-08 10:32:51', NULL, 5, 4, 3),
(5, '2020-08-08 10:32:51', NULL, 4, 5, 2),
(6, '2020-08-08 10:34:07', NULL, 3, 2, 4),
(7, '2020-08-08 10:34:07', NULL, 2, 5, 6),
(10, '2020-03-10 06:14:08', '2020-04-07 02:17:15', 3, 3, 3),
(11, '2020-04-06 22:00:00', '2020-05-12 03:11:00', 2, 2, 6),
(12, '2019-06-19 05:21:21', '2019-06-22 05:21:21', 4, 2, 6),
(13, '2017-07-13 05:18:00', '2017-07-15 07:18:00', 5, 4, 5),
(14, '2019-11-13 09:19:19', '2019-12-01 09:19:19', 2, 5, 1),
(15, '2019-12-11 07:00:00', '2019-12-12 08:00:00', 4, 2, 2),
(16, '2020-08-08 11:55:42', NULL, 4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `processing_system`
--

CREATE TABLE `processing_system` (
  `package_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `current_status` enum('In preparation','to be picked up','picked up','delivered') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `processing_system`
--

INSERT INTO `processing_system` (`package_id`, `employee_id`, `current_status`) VALUES
(4, 2, 'In preparation'),
(6, 2, 'to be picked up'),
(5, 6, 'picked up'),
(3, 4, 'delivered'),
(10, 4, 'delivered'),
(11, 4, 'delivered'),
(12, 6, 'delivered'),
(13, 3, 'delivered'),
(14, 1, 'delivered'),
(15, 4, 'delivered');

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `receiver_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`receiver_id`, `first_name`, `last_name`, `email`, `phone_number`, `address_id`) VALUES
(2, 'Sam', 'Longarm', 'samlongarm@gmail.com', '+4369964497789', NULL),
(3, 'Sean', 'Korbi', 'seankorbi@gmail.com', '+438977418118', 5),
(4, 'Poli', 'Smartson', 'polismartson@hotmail.com', '+436889569767', 7),
(5, 'Robert', 'Manos', 'robertmanos@gmail.com', '+4369987458415', 2);

-- --------------------------------------------------------

--
-- Table structure for table `receiving_outpost`
--

CREATE TABLE `receiving_outpost` (
  `outpost_id` int(11) NOT NULL,
  `outpost_name` varchar(20) NOT NULL,
  `outpost_address` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receiving_outpost`
--

INSERT INTO `receiving_outpost` (`outpost_id`, `outpost_name`, `outpost_address`) VALUES
(1, 'Donaustadt', 'Wagramer Strasse 15'),
(2, 'Floridsdorf', 'Brunnerstrasse 251'),
(3, 'Handelskai', 'Westbahnstrasse 11'),
(4, 'Landstrasse', 'Landstrasse Hauptstrasse 151'),
(5, 'Dobling', 'Otto-Miller Strasse 18'),
(6, 'Hitzing', 'Hitzingerstrasse 165');

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_id`, `first_name`, `last_name`, `email`, `phone_number`, `address_id`) VALUES
(2, 'Markus', 'Schwarz', 'markus.schwarz@yahoo.com', '+4369958744411', 2),
(3, 'Jackie', 'Bluberger', 'jackieblueberger@yahoo.com', '+436996449780', 5),
(4, 'Moli', 'Clarkson', 'moliclarkson@gmail.com', '+436885541444', 10),
(5, 'Pete', 'Galon', 'petegalon@gmail.com', '+436998784587', 9);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `employee_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`employee_id`, `vehicle_id`) VALUES
(2, 3),
(3, 2),
(6, 4),
(5, 3),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_data`
--

CREATE TABLE `vehicle_data` (
  `vehicle_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `load_capacity_kg` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_data`
--

INSERT INTO `vehicle_data` (`vehicle_id`, `type`, `brand`, `model`, `load_capacity_kg`) VALUES
(1, 'Kombi', 'Mercedes', 'Transporter V5', 2000),
(2, 'Kombi', 'VW', 'Boxer', 1500),
(3, 'Kombi', 'Fiat', 'Doblo', 500),
(4, 'LKW', 'Volvo', 'B65', 24000);

-- --------------------------------------------------------

--
-- Table structure for table `zip_code`
--

CREATE TABLE `zip_code` (
  `zip_code` int(11) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zip_code`
--

INSERT INTO `zip_code` (`zip_code`, `city`, `state`) VALUES
(1010, 'Wien', 'Wien'),
(1020, 'Wien', 'Wien'),
(1030, 'Wien', 'Wien'),
(1040, 'Wien', 'Wien'),
(1050, 'Wien', 'Wien'),
(1060, 'Wien', 'Wien'),
(1070, 'Wien', 'Wien'),
(1080, 'Wien', 'Wien'),
(1090, 'Wien', 'Wien'),
(1100, 'Wien', 'Wien'),
(1110, 'Wien', 'Wien'),
(1120, 'Wien', 'Wien'),
(1130, 'Wien', 'Wien'),
(1140, 'Wien', 'Wien'),
(1150, 'Wien', 'Wien'),
(1160, 'Wien', 'Wien'),
(1170, 'Wien', 'Wien');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `zip_code` (`zip_code`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `outpost_id` (`outpost_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `employee_role`
--
ALTER TABLE `employee_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `outpost_id` (`outpost_id`);

--
-- Indexes for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `receiving_outpost`
--
ALTER TABLE `receiving_outpost`
  ADD PRIMARY KEY (`outpost_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `vehicle_data`
--
ALTER TABLE `vehicle_data`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `zip_code`
--
ALTER TABLE `zip_code`
  ADD PRIMARY KEY (`zip_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_role`
--
ALTER TABLE `employee_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `receiver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `receiving_outpost`
--
ALTER TABLE `receiving_outpost`
  MODIFY `outpost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle_data`
--
ALTER TABLE `vehicle_data`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`zip_code`) REFERENCES `zip_code` (`zip_code`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`outpost_id`) REFERENCES `receiving_outpost` (`outpost_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `employee_role` (`role_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`receiver_id`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`outpost_id`) REFERENCES `receiving_outpost` (`outpost_id`);

--
-- Constraints for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `processing_system_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE;

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_data` (`vehicle_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
