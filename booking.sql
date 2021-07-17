-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2021 at 05:53 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `fullname`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin@gmail.com', 'lorem ipsum', '$2b$12$LXU5PvIOJrki7xBILmFHLeOfJtNMhpm1weBLCrmr2WrKcJjQMwHci', '2021-07-15 18:54:29', '2021-07-15 18:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `type` enum('manual','auto') DEFAULT NULL,
  `brand` enum('avanza','toyota','tesla') DEFAULT NULL,
  `color` enum('black','white','gray','red','blue') DEFAULT NULL,
  `carId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `productionYear` int(11) DEFAULT NULL,
  `cost` bigint(20) DEFAULT 1000,
  `quantity` int(11) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `type`, `brand`, `color`, `carId`, `productionYear`, `cost`, `quantity`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'auto', 'tesla', 'white', '90b486cb-ee03-4aea-93a9-3e63265a28ef', 2000, 1000, 1, '2021-07-16 06:54:09', '2021-07-16 06:54:09', '2021-07-17'),
(2, 'auto', 'avanza', 'black', '90b486cb-ee03-4aea-93a9-3e63265a28ef', 2000, 1000, 1, '2021-07-16 06:54:52', '2021-07-16 06:54:52', '2021-07-17'),
(3, 'auto', 'avanza', 'black', '', 2000, 1000, 1, '2021-07-16 07:04:18', '2021-07-16 07:04:18', '2021-07-17'),
(4, 'auto', 'avanza', 'black', 'd966fad4-b354-442a-a4af-c6fd67a0637a', 2000, 1000, 1, '2021-07-16 07:06:07', '2021-07-16 07:06:07', '2021-07-17'),
(5, 'auto', 'avanza', 'black', 'd966fad4-b354-442a-a4af-c6fd67a0637a', 2000, 1000, 1, '2021-07-16 07:06:14', '2021-07-16 07:06:14', '2021-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `loggings`
--

CREATE TABLE `loggings` (
  `id` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loggings`
--

INSERT INTO `loggings` (`id`, `idUser`, `email`, `role`, `token`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'ipsumtest@gmail.com', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imlwc3VtdGVzdEBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTYyNjM3NDM0NSwiZXhwIjoxNjI2Mzc3OTQ1fQ.WNTF2SbJVLE2EmEnEJhZromybqdU0LVhR2KH42Y6sVs', '2021-07-15 18:39:05', '2021-07-15 18:39:05'),
(2, 1, 'admin@gmail.com', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYyNjM3NTMxNywiZXhwIjoxNjI2Mzc4OTE3fQ.kepzKtw7ykORNu7YP4L2qQQjDDHVr0iAogRK1LkI9lo', '2021-07-15 18:55:17', '2021-07-15 18:55:17'),
(3, 1, 'admin@gmail.com', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYyNjM3NTU3OCwiZXhwIjoxNjI2Mzc5MTc4fQ.8ph3nA6orDUGII9awAgsOPWGwKsLu7bDOsv0EImjxp0', '2021-07-15 18:59:38', '2021-07-15 18:59:38'),
(4, 1, 'admin@gmail.com', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYyNjM3NTcyMCwiZXhwIjoxNjI2Mzc5MzIwfQ.MI-sfV1_CURB3ij4L3shLw8_6-df0YKuQrRcAEjG7tA', '2021-07-15 19:02:00', '2021-07-15 19:02:00'),
(5, 1, 'admin@gmail.com', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYyNjM3NzE3OSwiZXhwIjoxNjI2MzgwNzc5fQ.FOxTEMi9ssMEEmpcnrToetXQO5tZp0WlMfSqeEfKCGg', '2021-07-15 19:26:19', '2021-07-15 19:26:19'),
(6, 1, 'admin@gmail.com', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYyNjM3NzIyOSwiZXhwIjoxNjI2MzgwODI5fQ.ldJO_lURcVsXDjyY27BlUd6-m3eLDi_ZS2ikv6DN9NA', '2021-07-15 19:27:09', '2021-07-15 19:27:09'),
(7, 1, 'ipsumtest@gmail.com', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imlwc3VtdGVzdEBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTYyNjM3ODk1MCwiZXhwIjoxNjI2MzgyNTUwfQ.HxFPnHNN7xuXM8bcGu-f4PZqZIKHM2tIgctLxQlsjhY', '2021-07-15 19:55:50', '2021-07-15 19:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20210715170038-create-user.js'),
('20210715170117-create-logging.js'),
('20210715171350-create-admin.js'),
('20210715183607-create-logging.js'),
('20210716062526-create-car.js'),
('20210717033450-create-cart.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `address`, `phone`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'test', 'ipsum', 'ipsumtest', 'ipsumtest@gmail.com', 'singapore', 12345, '$2b$12$FcLB8id4VHtTzxspDl7cHuYuA4l6yDfSRMVshxf.W8J.ULSzOSBgS', '2021-07-15 18:26:39', '2021-07-15 18:26:39'),
(2, NULL, NULL, 'admin', 'admin@gmail.com', NULL, NULL, '$2b$12$D0WVZsTL/6D3ydUBzpyTQuh5VhbllmsW3SOpMSMXcIo3Qqhv/RT7.', '2021-07-15 18:53:38', '2021-07-15 18:53:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loggings`
--
ALTER TABLE `loggings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loggings`
--
ALTER TABLE `loggings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
