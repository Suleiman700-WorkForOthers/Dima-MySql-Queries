-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 09:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dima`
--
CREATE DATABASE IF NOT EXISTS `dima` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dima`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `CategoryName`) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Liquid'),
(4, 'Liquid'),
(5, 'Chocolates');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `City` varchar(50) DEFAULT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `ContactTitle` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `City`, `ContactName`, `CompanyName`, `ContactTitle`, `Phone`) VALUES
(1, 'Eilat', 'John Smith', 'ABC Company', 'Manager', '0512345678'),
(2, 'Tel Aviv', 'Jane Doe', 'XYZ Corporation', 'Sales Representative', '0523456789'),
(3, 'Haifa', 'David Cohen', '123 Industries', 'CEO', '0534567890'),
(4, 'Beer Sheva', 'Sarah Levy', 'Smith & Co.', 'Marketing Manager', '0549876543'),
(5, 'Haifa', 'Michael Katz', 'KLM Enterprises', 'Accountant', '0559876543');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `FirstName`, `LastName`, `City`) VALUES
(1, 'John', 'Doe', 'New York'),
(2, 'Jane', 'Smith', 'Los Angeles'),
(3, 'David', 'Johnson', 'Seattle'),
(4, 'Sarah', 'Williams', 'Houston'),
(5, 'Michael', 'Brown', 'Seattle');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `ShipPostalCode` varchar(50) DEFAULT NULL,
  `RequiredDate` date DEFAULT NULL,
  `ShipAddress` varchar(255) DEFAULT NULL,
  `Freight` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `OrderDate`, `ShippedDate`, `CustomerID`, `ShipPostalCode`, `RequiredDate`, `ShipAddress`, `Freight`) VALUES
(1, '2023-05-01', '2023-05-05', 1, '98124-1234', '2023-05-06', '123 Main St', 12.99),
(2, '2023-05-02', '2023-05-06', 2, '98124-5678', '2023-05-07', '456 Elm St', 8.50),
(3, '2023-05-03', '2023-05-07', 3, '98124-9012', '2023-05-08', '789 Oak St', 16.75),
(4, '2023-05-04', '2023-05-08', 4, '98124-3456', '2023-05-09', '987 Maple St', 9.99),
(5, '2023-05-05', '2023-05-09', 5, '98124-7890', '2023-05-10', '654 Pine St', 14.50);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Discount` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `OrderID`, `ProductID`, `UnitPrice`, `Quantity`, `Discount`) VALUES
(1, 1, 1, 199.99, 2, 0.10),
(2, 1, 2, 14.99, 3, 0.00),
(3, 2, 3, 9.99, 1, 0.00),
(4, 3, 4, 49.99, 1, 0.05),
(5, 3, 5, 79.99, 2, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `UnitsInStock` int(11) DEFAULT NULL,
  `UnitsOnOrder` int(11) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `ProductName`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `SupplierID`, `CategoryID`) VALUES
(1, 'Smartphone', 499.99, 10, 1, 1, 1),
(2, 'T-Shirt', 19.99, 3, 0, 2, 2),
(3, 'Liquid One', 12.99, 9, 10, 3, 3),
(4, 'Liquid Two', 9.99, 55, 0, 3, 4),
(5, 'White Chocolate', 89.99, 46, 1, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `CompanyName`, `City`) VALUES
(1, 'Samsung', 'Tel Aviv'),
(2, 'Adidas', 'Haifa'),
(3, 'Exotic Liquids', 'Jerusalem'),
(4, 'Smith Supplier', 'Netanya'),
(5, 'Specialty Biscuits, Ltd', 'Herzliya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
