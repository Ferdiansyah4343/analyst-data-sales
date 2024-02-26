-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2024 at 07:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `da_sales_tech`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customer_id`, `customer_name`, `address`, `city`, `email`) VALUES
(1, 'John Doe', '123 Main St', 'New York', 'john@example.com'),
(2, 'Jane Smith', '456 Elm St', 'Los Angeles', 'jane@example.com'),
(3, 'David Johnson', '789 Oak St', 'Chicago', 'david@example.com'),
(4, 'Emily Brown', '101 Pine St', 'San Francisco', 'emily@example.com'),
(5, 'Michael Wilson', '202 Maple St', 'Seattle', 'michael@example.com'),
(6, 'Sarah Johnson', '303 Walnut St', 'Miami', 'sarah@example.com'),
(7, 'Daniel Martinez', '404 Cedar St', 'Austin', 'daniel@example.com'),
(8, 'Lisa Lee', '505 Pine St', 'Boston', 'lisa@example.com'),
(9, 'Kevin Taylor', '606 Elm St', 'Denver', 'kevin@example.com'),
(10, 'Rachel Thomas', '707 Oak St', 'Portland', 'rachel@example.com'),
(11, 'Jessica Brown', '808 Maple St', 'Seattle', 'jessica@example.com'),
(12, 'Andrew White', '909 Oak St', 'Chicago', 'andrew@example.com'),
(13, 'Michelle Wilson', '1010 Pine St', 'Los Angeles', 'michelle@example.com'),
(14, 'James Anderson', '1111 Elm St', 'New York', 'james@example.com'),
(15, 'Lauren Garcia', '1212 Cedar St', 'San Francisco', 'lauren@example.com'),
(16, 'Tyler Harris', '1313 Main St', 'Miami', 'tyler@example.com'),
(17, 'Olivia Martinez', '1414 Elm St', 'Denver', 'olivia@example.com'),
(18, 'Ethan Taylor', '1515 Oak St', 'Portland', 'ethan@example.com'),
(19, 'Ava Thomas', '1616 Pine St', 'Boston', 'ava@example.com'),
(20, 'Noah Garcia', '1717 Cedar St', 'Austin', 'noah@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 1, 1200.00),
(2, 2, 2, 2, 400.00),
(3, 3, 3, 1, 1000.00),
(4, 4, 4, 3, 150.00),
(5, 5, 5, 1, 80.00),
(6, 1, 6, 1, 20.00),
(7, 2, 7, 1, 100.00),
(8, 3, 8, 2, 60.00),
(9, 4, 9, 2, 60.00),
(10, 5, 10, 1, 40.00),
(11, 1, 11, 1, 150.00),
(12, 6, 12, 1, 200.00),
(13, 7, 13, 1, 150.00),
(14, 8, 14, 2, 40.00),
(15, 9, 15, 1, 120.00),
(16, 10, 16, 2, 25.00),
(17, 6, 17, 1, 70.00),
(18, 7, 18, 1, 60.00),
(19, 8, 19, 1, 50.00),
(20, 9, 20, 1, 20.00),
(21, 10, 21, 1, 100.00),
(22, 6, 22, 1, 90.00),
(23, 11, 12, 2, 200.00),
(24, 12, 13, 1, 150.00),
(25, 13, 14, 3, 40.00),
(26, 14, 15, 2, 120.00),
(27, 15, 16, 1, 25.00),
(28, 11, 17, 2, 70.00),
(29, 12, 18, 1, 60.00),
(30, 13, 19, 1, 50.00),
(31, 14, 20, 2, 20.00),
(32, 15, 21, 1, 100.00),
(33, 11, 22, 2, 90.00),
(34, 16, 12, 3, 200.00),
(35, 17, 13, 2, 150.00),
(36, 18, 14, 4, 40.00),
(37, 19, 15, 3, 120.00),
(38, 20, 16, 2, 25.00),
(39, 16, 17, 3, 70.00),
(40, 17, 18, 2, 60.00),
(41, 18, 19, 2, 50.00),
(42, 19, 20, 3, 20.00),
(43, 20, 21, 2, 100.00),
(44, 16, 22, 3, 90.00);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_payment` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `customer_id`, `order_date`, `total_payment`) VALUES
(1, 1, '2024-02-01', 1500.00),
(2, 2, '2024-02-03', 900.00),
(3, 3, '2024-02-05', 500.00),
(4, 4, '2024-02-07', 1200.00),
(5, 5, '2024-02-10', 800.00),
(6, 1, '2024-02-15', 700.00),
(7, 2, '2024-02-20', 850.00),
(8, 3, '2024-02-25', 950.00),
(9, 4, '2024-02-28', 1100.00),
(10, 5, '2024-02-29', 600.00),
(11, 6, '2024-03-05', 1250.00),
(12, 7, '2024-03-10', 900.00),
(13, 8, '2024-03-15', 1100.00),
(14, 9, '2024-03-20', 800.00),
(15, 10, '2024-03-25', 700.00),
(16, 11, '2024-04-05', 1450.00),
(17, 12, '2024-04-10', 950.00),
(18, 13, '2024-04-15', 1150.00),
(19, 14, '2024-04-20', 850.00),
(20, 15, '2024-04-25', 750.00);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`product_id`, `product_name`, `category`, `price`) VALUES
(1, 'Laptop ASUS', 'Elektronik', 1200.00),
(2, 'Smartphone Samsung', 'Elektronik', 800.00),
(3, 'TV LED LG', 'Elektronik', 1000.00),
(4, 'Kemeja Pria', 'Pakaian', 50.00),
(5, 'Sepatu Sneakers', 'Pakaian', 80.00),
(6, 'Mouse Wireless', 'Elektronik', 20.00),
(7, 'Keyboard Mechanical', 'Elektronik', 100.00),
(8, 'Earphone Bluetooth', 'Elektronik', 30.00),
(9, 'T-shirt Basic', 'Pakaian', 20.00),
(10, 'Celana Panjang', 'Pakaian', 40.00),
(11, 'Smartwatch', 'Elektronik', 150.00),
(12, 'Monitor LED', 'Elektronik', 200.00),
(13, 'Printer Inkjet', 'Elektronik', 150.00),
(14, 'Smart Speaker', 'Elektronik', 80.00),
(15, 'External Hard Drive', 'Elektronik', 120.00),
(16, 'Wireless Router', 'Elektronik', 50.00),
(17, 'Gaming Mouse', 'Elektronik', 70.00),
(18, 'Fitness Tracker', 'Elektronik', 60.00),
(19, 'Bluetooth Headphones', 'Elektronik', 40.00),
(20, 'Power Bank', 'Elektronik', 30.00),
(21, 'USB Flash Drive', 'Elektronik', 15.00),
(22, 'Graphic Tablet', 'Elektronik', 100.00),
(23, 'Smart Thermostat', 'Elektronik', 90.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `OrderDetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  ADD CONSTRAINT `OrderDetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
