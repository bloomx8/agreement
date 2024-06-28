-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 01:49 PM
-- Server version: 8.0.27
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agreement`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `allocation` int NOT NULL COMMENT 'this is the primary key of the table',
  `start` date DEFAULT NULL COMMENT 'Initial contract date ',
  `end` date DEFAULT NULL COMMENT 'last contract date.',
  `room` int DEFAULT NULL COMMENT 'this column links the allocation table to the room table. ',
  `contract` int DEFAULT NULL COMMENT 'this is the foreign key of the table '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `allocation`
--

INSERT INTO `allocation` (`allocation`, `start`, `end`, `room`, `contract`) VALUES
(4, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL),
(7, '2015-07-01', '2020-07-31', NULL, NULL),
(1, '2017-08-01', NULL, NULL, NULL),
(3, '2018-02-01', '2023-02-01', NULL, NULL),
(8, '2018-06-01', '2023-05-31', NULL, NULL),
(2, '2020-11-01', NULL, NULL, NULL),
(6, '2021-03-01', '2026-06-01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `business` int NOT NULL,
  `id` varchar(10) NOT NULL COMMENT 'A short version of the business''s name, e.g., chicjoint, coop, mz ',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'name of the business renting out space in the building ',
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'address of the business for it''s identification ',
  `account_details` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'account details that show where the rental money is to be deposited. ',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'title no that shows where the business is situated.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`business`, `id`, `name`, `address`, `account_details`, `title`) VALUES
(1, 'mutall', 'MUTALL INVESTMENT COMPANY LIMITED', 'Post Office Box Number 374-00206 Kiserian', 'MUTALL INVESTMENT CO. LTD, COOPERATIVE BANK OF KENYA LTD, KISERIAN, 01148583941800', 'NGONG/NGONG/17140');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `contract` int NOT NULL COMMENT 'column added as the primary key of the table ',
  `lawyer` int DEFAULT NULL COMMENT 'this column has been added to link with the contract table ',
  `tenant` int NOT NULL COMMENT 'this column is for linking with the contract table.  ',
  `date` date DEFAULT NULL COMMENT 'agreement date ',
  `term` int DEFAULT NULL COMMENT 'contract term (years)',
  `biling` double DEFAULT NULL COMMENT 'rate of monthly rent calculation (Ksh per sq ft)',
  `rent` int DEFAULT NULL COMMENT 'monthly rent (Ksh)',
  `frequency` enum('quaterly','monthly') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'payment interval for monthly rent ',
  `increment` double DEFAULT NULL COMMENT 'rate of rental increment (%)',
  `progression` double DEFAULT NULL COMMENT 'period of Increase (years).',
  `fee` double DEFAULT NULL COMMENT 'service charge fee ',
  `lapse` enum('quarterly','monthly') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'service charge payment interval ',
  `span` enum('quarterly','monthly') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'deposit payment period in months. ',
  `proportion` double DEFAULT NULL COMMENT 'monthly deposit amount (Ksh)',
  `penalty` double DEFAULT NULL COMMENT 'money to be paid by the tenant for late rental payment (%).',
  `fine` double DEFAULT NULL COMMENT 'money to be paid by the tenant for a dishonored cheque (%)',
  `VAT` double DEFAULT NULL COMMENT 'VAT to be charged by the tenant and is subject to change at the government of Kenya''s discretion\r\n(%) ',
  `electricity` double DEFAULT NULL COMMENT 'electricity deposit to be paid by the tenant(Ksh)',
  `payment_deadline` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Last date for rental payment (of that month)',
  `water` double DEFAULT NULL COMMENT 'deposit amount to be paid for water (Ksh)',
  `business` int DEFAULT '1' COMMENT 'this column is for linking with the contract column'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`contract`, `lawyer`, `tenant`, `date`, `term`, `biling`, `rent`, `frequency`, `increment`, `progression`, `fee`, `lapse`, `span`, `proportion`, `penalty`, `fine`, `VAT`, `electricity`, `payment_deadline`, `water`, `business`) VALUES
(1, NULL, 2, '2018-03-02', 6, 50, 145800, NULL, 10, 2, 1500, 'quarterly', 'quarterly', 4500, NULL, NULL, NULL, NULL, '', NULL, 1),
(2, NULL, 3, '2020-10-26', 5, NULL, 182500, NULL, NULL, NULL, 2500, 'quarterly', 'monthly', 150000, 10, 10000, 14, 20000, '10th', 5000, 1),
(3, NULL, 4, '2018-01-20', 5, NULL, 20000, 'quaterly', 10, 2, 1500, 'quarterly', NULL, 46500, NULL, NULL, NULL, 5000, '5th ', NULL, 1),
(4, NULL, 5, '2023-08-01', 5, NULL, 15000, 'quaterly', NULL, NULL, 1500, NULL, NULL, NULL, NULL, 10000, 16, 5000, '5th', NULL, 1),
(5, NULL, 6, '2023-03-01', 5, NULL, 21000, 'quaterly', NULL, NULL, 1750, NULL, NULL, NULL, NULL, 10000, 16, 5000, '5th', NULL, 1),
(6, NULL, 7, '2021-03-01', 5, 48, 47080, 'quaterly', 20, 1, 1750, 'quarterly', NULL, 90000, 10, NULL, 16, 5000, '', 300, 1),
(8, NULL, 8, '2015-05-19', 5, NULL, 20000, NULL, NULL, NULL, NULL, NULL, NULL, 44000, NULL, NULL, NULL, 2500, '', NULL, 1),
(9, NULL, 9, '2018-05-17', 5, NULL, 20000, 'quaterly', 10, 2, NULL, NULL, NULL, 46500, NULL, NULL, NULL, 5000, '5th', 1500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lawyer`
--

CREATE TABLE `lawyer` (
  `lawyer` int NOT NULL COMMENT 'this is the primary key of the table ',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'this is the name of the lawyer who drew the contract ',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'this is the address, both physical and postal, of the lawyer '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lawyer`
--

INSERT INTO `lawyer` (`lawyer`, `name`, `address`) VALUES
(1, 'Joel Ntalya', '2nd Floor, Co-op Bank House Haile Selassie Avenue PO Box 48231--00100 Nairobi, Kenya'),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(6, NULL, NULL),
(7, NULL, NULL),
(8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room` int NOT NULL COMMENT 'this is the primary key of the table ',
  `business` int DEFAULT NULL COMMENT 'this column has been added to enable a link between the room and business tables',
  `uid` int DEFAULT NULL COMMENT 'this is the unique id that''s assigned to each room to be given to the tenant ',
  `space` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'this is the space occupied by the tenant in sq ft ',
  `floor_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'this is the floor that the tenant can be found '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room`, `business`, `uid`, `space`, `floor_no`) VALUES
(1, 1, 34, '2,916 sq ft', 'ground floor'),
(2, 1, NULL, NULL, 'Ground floor'),
(3, 1, NULL, NULL, NULL),
(4, 1, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL),
(9, NULL, 13, '1171', '1st Floor'),
(10, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `tenant` int NOT NULL COMMENT 'this is the primary key of the table.',
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT ' A short version of the tenant''s name, e.g., chicjoint, coop, mz ',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'This is the full offical name of the tenant, e.g., The Cooperative Bank of Kenya',
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'This is the physical address of the tenant, e.g., P.O.BOX 2345-00100 Kiserian'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`tenant`, `id`, `name`, `address`) VALUES
(2, 'COOP', 'The Cooperative Bank of Kenya', 'Post Office Box Number 46231- 00100 Nairobi'),
(3, 'Baltic', 'KENTAGON ENTERPRISES', 'Post Office Box Number 4079 - 00100, Nairobi, Kenya'),
(4, 'Pejmena', 'PEJMENA LEGACY LIMITED', 'Post Office Box Number  385 - 00206, KISERIAN  '),
(5, 'KDA', 'Kanchori Daniel and Co. Advocates ', ' Post Office Box Number  344- 00241, Kitengela, Kenya'),
(6, 'L.K', 'Lillian Kariuki and associate advocates ', 'Post Office Box Number  696- 00206, Nairobi, Kenya '),
(7, 'Mzalendo', 'Mzalendo saba saba Party of Kenya ', 'Post Office Box Number 954-00206, Kiserian in the Republic of Kenya '),
(8, 'Oigilal', 'Oigilal Properties ', 'Post Office Box Number 634 - 00206 Nairobi '),
(9, 'Archihub ', 'Archihub Construction Limited ', 'Post Office Box Number  646 - 00206, KISERIAN ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`allocation`),
  ADD UNIQUE KEY `id` (`start`,`end`,`room`,`contract`),
  ADD KEY `contract` (`contract`),
  ADD KEY `room` (`room`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`business`),
  ADD UNIQUE KEY `ID` (`id`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract`),
  ADD UNIQUE KEY `id` (`date`,`tenant`,`business`),
  ADD KEY `tenant` (`tenant`),
  ADD KEY `business` (`business`),
  ADD KEY `lawyer` (`lawyer`);

--
-- Indexes for table `lawyer`
--
ALTER TABLE `lawyer`
  ADD PRIMARY KEY (`lawyer`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `business` (`business`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`tenant`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation`
--
ALTER TABLE `allocation`
  MODIFY `allocation` int NOT NULL AUTO_INCREMENT COMMENT 'this is the primary key of the table', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `business` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `contract` int NOT NULL AUTO_INCREMENT COMMENT 'column added as the primary key of the table ', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lawyer`
--
ALTER TABLE `lawyer`
  MODIFY `lawyer` int NOT NULL AUTO_INCREMENT COMMENT 'this is the primary key of the table ', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room` int NOT NULL AUTO_INCREMENT COMMENT 'this is the primary key of the table ', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `tenant` int NOT NULL AUTO_INCREMENT COMMENT 'this is the primary key of the table.', AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `allocation_ibfk_2` FOREIGN KEY (`contract`) REFERENCES `contract` (`contract`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `allocation_ibfk_3` FOREIGN KEY (`room`) REFERENCES `room` (`room`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`tenant`) REFERENCES `tenant` (`tenant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`business`) REFERENCES `business` (`business`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`lawyer`) REFERENCES `lawyer` (`lawyer`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`business`) REFERENCES `business` (`business`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
