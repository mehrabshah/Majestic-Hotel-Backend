-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2024 at 06:22 PM
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
-- Database: `majestic`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `capacity` int(11) NOT NULL,
  `capacityChild` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `description`, `price`, `createdAt`, `updatedAt`, `capacity`, `capacityChild`) VALUES
(1, 'Double Room', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', 500, '2024-04-14 15:43:08', '2024-04-28 18:27:47', 2, NULL),
(2, 'Twin Room', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', 500, '2024-04-14 15:45:24', '2024-04-28 18:27:47', 2, NULL),
(3, 'Single Room', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', 500, '2024-04-14 15:46:38', '2024-04-28 18:27:47', 1, NULL),
(4, 'Double Room with Sea View', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', 500, '2024-04-14 15:48:44', '2024-04-28 18:27:47', 2, NULL),
(5, 'Superior Double Room Sea View', './assets/RoomImages/SuperiorDoubleRoom/SuperiorDoubleRoom1.jpg', 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', 500, '2024-04-14 15:54:12', '2024-04-28 18:27:47', 2, NULL),
(6, 'Twin Room with Sea View', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', 300, '2024-04-14 18:09:30', '2024-04-28 18:27:47', 2, NULL),
(7, 'Family Room', './assets/RoomImages/FamilyRoom/FamilyRoom1.webp', 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', 500, '2024-04-14 18:10:29', '2024-04-28 18:27:47', 4, NULL),
(8, 'Single Room Sea View', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', 500, '2024-04-15 16:54:44', '2024-04-28 18:27:47', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_images`
--

CREATE TABLE `category_images` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `telephone`, `subject`, `comments`, `createdAt`, `updatedAt`) VALUES
(2, 'Hassan Shahzad', 'hassanshahzadu@gmail.com', '111111111111', 'I booked my stay ON A DIFFERENT WEBSITE and require further information', 'ww', '2024-04-11 07:27:21', '2024-04-11 07:27:21'),
(3, 'Hassan Shahzad', 'hassanshahzadu@gmail.com', '111111111111', 'I booked my stay ON A DIFFERENT WEBSITE and require further information', 'ww', '2024-04-11 07:27:52', '2024-04-11 07:27:52'),
(4, 'Hassan Shahzad', 'hassanshahzadu@gmail.com', '111111111111', 'I booked my stay ON A DIFFERENT WEBSITE and require further information', 'ww', '2024-04-11 07:29:09', '2024-04-11 07:29:09'),
(5, 'Hassan Shahzad', 'hassanshahzadu@gmail.com', '111111111111', 'I booked my stay ON A DIFFERENT WEBSITE and require further information', 'ww', '2024-04-11 07:29:35', '2024-04-11 07:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postalCode` varchar(255) NOT NULL,
  `countryRegionCode` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `name`, `image`, `price`, `description`, `createdAt`, `updatedAt`, `categoryId`) VALUES
(85, 'Double Room 1', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(86, 'Double Room 2', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(87, 'Double Room 3', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(88, 'Double Room 4', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(89, 'Double Room 5', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(90, 'Double Room 6', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(91, 'Double Room 7', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(92, 'Double Room 8', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(93, 'Double Room 9', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(94, 'Double Room 10', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(95, 'Double Room 11', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(96, 'Double Room 12', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(97, 'Double Room 13', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(98, 'Double Room 14', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(99, 'Double Room 15', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(100, 'Double Room 16', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(101, 'Double Room 17', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(102, 'Double Room 18', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(103, 'Double Room 19', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(104, 'Double Room 20', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(105, 'Double Room 21', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(106, 'Double Room 22', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(107, 'Double Room 23', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(108, 'Double Room 24', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(109, 'Double Room 25', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(110, 'Double Room 26', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(111, 'Double Room 27', './assets/RoomImages/DoubleRoom/doubleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities. When booking 5 rooms or more, different terms and conditions will apply', '2024-04-15 16:13:58', '2024-04-15 16:13:58', 1),
(112, 'Twin Room 1', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(113, 'Twin Room 2', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(114, 'Twin Room 3', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(115, 'Twin Room 4', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(116, 'Twin Room 5', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(117, 'Twin Room 6', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(118, 'Twin Room 7', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(119, 'Twin Room 8', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(120, 'Twin Room 9', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(121, 'Twin Room 10', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(122, 'Twin Room 11', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(123, 'Twin Room 12', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(124, 'Twin Room 13', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(125, 'Twin Room 14', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(126, 'Twin Room 15', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(127, 'Twin Room 16', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(128, 'Twin Room 17', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(129, 'Twin Room 18', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(130, 'Twin Room 19', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(131, 'Twin Room 20', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(132, 'Twin Room 21', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(133, 'Twin Room 22', './assets/RoomImages/TwinRoom/twinRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:14:14', '2024-04-15 16:14:14', 2),
(134, 'Single Room 1', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(135, 'Single Room 2', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(136, 'Single Room 3', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(137, 'Single Room 4', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(138, 'Single Room 5', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(139, 'Single Room 6', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(140, 'Single Room 7', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(141, 'Single Room 8', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(142, 'Single Room 9', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(143, 'Single Room 10', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(144, 'Single Room 11', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(145, 'Single Room 12', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(146, 'Single Room 13', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:15:06', '2024-04-15 16:15:06', 3),
(147, 'Double Room with Sea View 1', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(148, 'Double Room with Sea View 2', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(149, 'Double Room with Sea View 3', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(150, 'Double Room with Sea View 4', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(151, 'Double Room with Sea View 5', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(152, 'Double Room with Sea View 6', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(153, 'Double Room with Sea View 7', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(154, 'Double Room with Sea View 8', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(155, 'Double Room with Sea View 9', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(156, 'Double Room with Sea View 10', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(157, 'Double Room with Sea View 11', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(158, 'Double Room with Sea View 12', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(159, 'Double Room with Sea View 13', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(160, 'Double Room with Sea View 14', './assets/RoomImages/DoubleRoomSV/doubleRoomSeeView1.jpg', 500, 'The double room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 1 bed.', '2024-04-15 16:16:37', '2024-04-15 16:16:37', 4),
(166, 'Superior Double Room Sea View 1', './assets/RoomImages/SuperiorDoubleRoom/SuperiorDoubleRoom1.jpg', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:50:37', '2024-04-15 16:50:37', 5),
(167, 'Superior Double Room Sea View 2', './assets/RoomImages/SuperiorDoubleRoom/SuperiorDoubleRoom1.jpg', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:50:37', '2024-04-15 16:50:37', 5),
(168, 'Superior Double Room Sea View 3', './assets/RoomImages/SuperiorDoubleRoom/SuperiorDoubleRoom1.jpg', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:50:37', '2024-04-15 16:50:37', 5),
(169, 'Superior Double Room Sea View 4', './assets/RoomImages/SuperiorDoubleRoom/SuperiorDoubleRoom1.jpg', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:50:37', '2024-04-15 16:50:37', 5),
(170, 'Superior Double Room Sea View 5', './assets/RoomImages/SuperiorDoubleRoom/SuperiorDoubleRoom1.jpg', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:50:37', '2024-04-15 16:50:37', 5),
(171, 'Twin Room with Sea View 1', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(172, 'Twin Room with Sea View 2', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(173, 'Twin Room with Sea View 3', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(174, 'Twin Room with Sea View 4', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(175, 'Twin Room with Sea View 5', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(176, 'Twin Room with Sea View 6', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(177, 'Twin Room with Sea View 7', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(178, 'Twin Room with Sea View 8', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(179, 'Twin Room with Sea View 9', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(180, 'Twin Room with Sea View 10', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(181, 'Twin Room with Sea View 11', './assets/RoomImages/TwinRoomSV/TwinRoomSV1.jpg', 500, 'The twin room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. The unit has 2 beds.', '2024-04-15 16:52:00', '2024-04-15 16:52:00', 6),
(182, 'Family Room 1', './assets/RoomImages/FamilyRoom/FamilyRoom1.webp', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:52:48', '2024-04-15 16:52:48', 7),
(183, 'Family Room 2', './assets/RoomImages/FamilyRoom/FamilyRoom1.webp', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:52:48', '2024-04-15 16:52:48', 7),
(184, 'Family Room 3', './assets/RoomImages/FamilyRoom/FamilyRoom1.webp', 500, 'The family room features a wardrobe, an electric kettle, as well as a private bathroom boasting a bath or a shower and a hairdryer. This family room has a carpeted floor, heating and a TV. The unit has 3 beds.', '2024-04-15 16:52:48', '2024-04-15 16:52:48', 7),
(185, 'Single Room Sea View 1', './assets/RoomImages/SingleRoom/singleRoom1.jpg', 500, 'These rooms have private bathrooms, a TV, a hairdryer, and tea/coffee making facilities.', '2024-04-15 16:55:49', '2024-04-15 16:55:49', 8);

-- --------------------------------------------------------

--
-- Table structure for table `roomimages`
--

CREATE TABLE `roomimages` (
  `id` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230831102935-user.js'),
('20230907213343-create-contact-us.js'),
('20240414140757-create-categories-table.js'),
('20240414140937-create-booking-table.js'),
('20240414141236-create-room-table.js'),
('20240414141406-create-room-images-table.js'),
('20240414141819-create-category-images-table.js'),
('20240415143432-add_capacity_to_categories.js'),
('20240415143438-add_categoryId_to_room.js'),
('20240419154813-order.js'),
('20240421081410-add_categoryChild_column.js');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`, `firstName`, `lastName`, `createdAt`, `updatedAt`) VALUES
(1, 'admin@gmail.com', '$2b$10$2l48Va.Vjtx4mPSfEnNhue3rJyVTnyrYbe68iQBIhIZSmHrtoeFGa', 'ADMIN', 'John', 'Doe', '2024-04-11 06:22:16', '2024-04-11 06:22:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomId` (`roomId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_images`
--
ALTER TABLE `category_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_categoryId_foreign_idx` (`categoryId`);

--
-- Indexes for table `roomimages`
--
ALTER TABLE `roomimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomId` (`roomId`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_images`
--
ALTER TABLE `category_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `roomimages`
--
ALTER TABLE `roomimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_images`
--
ALTER TABLE `category_images`
  ADD CONSTRAINT `category_images_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_categoryId_foreign_idx` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roomimages`
--
ALTER TABLE `roomimages`
  ADD CONSTRAINT `roomimages_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
