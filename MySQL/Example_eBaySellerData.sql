-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 23, 2013 at 10:34 AM
-- Server version: 5.5.31-0ubuntu0.13.04.1
-- PHP Version: 5.4.9-4ubuntu2.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `MyUser_eBaySellerData`
--

-- --------------------------------------------------------

--
-- Table structure for table `goodscategorylevelone`
--

CREATE TABLE IF NOT EXISTS `goodscategorylevelone` (
  `PK` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(64) NOT NULL,
  PRIMARY KEY (`PK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `goodscategorylevelone`
--

INSERT INTO `goodscategorylevelone` (`PK`, `TITLE`) VALUES
(1, 'eBay Motors'),
(2, 'Collectibles'),
(3, 'Business & Industrial'),
(4, 'Home & Garden'),
(5, 'Computers/Tablets & Networking'),
(6, 'Cell Phones & PDAs'),
(7, 'Music'),
(8, 'Electronics'),
(9, 'Dolls & Bears'),
(10, 'Consumer Electronics'),
(11, 'Coins & Paper Money'),
(12, 'Toys & Hobbies'),
(13, 'DVDs & Movies'),
(14, 'NO CATEGORY 1'),
(15, 'Computers & Networking'),
(16, 'Pet Supplies'),
(17, 'Health & Beauty'),
(18, 'Musical Instruments'),
(19, 'Jewelry & Watches'),
(20, 'Clothing, Shoes & Accessories'),
(21, 'Sporting Goods'),
(22, 'Cameras & Photo'),
(23, 'Cell Phones & Accessories'),
(24, 'Camera & Photo'),
(25, 'Books'),
(26, 'Gift Cards & Coupons'),
(27, 'Video Games & Consoles');

-- --------------------------------------------------------

--
-- Table structure for table `goodscategoryleveltwo`
--

CREATE TABLE IF NOT EXISTS `goodscategoryleveltwo` (
  `PK` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SUB_HEADING` int(10) unsigned NOT NULL,
  `TITLE` varchar(64) NOT NULL,
  PRIMARY KEY (`PK`),
  KEY `SUB_HEADING` (`SUB_HEADING`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `goodscategoryleveltwo`
--

INSERT INTO `goodscategoryleveltwo` (`PK`, `SUB_HEADING`, `TITLE`) VALUES
(1, 10, 'Wholesale Lots'),
(2, 15, 'Cases, Covers, Keyboard Folios'),
(3, 22, 'Digital Cameras'),
(4, 4, 'Kitchen, Dining & Bar'),
(5, 3, 'Healthcare, Lab & Life Science'),
(6, 26, 'Gift Cards'),
(7, 3, 'Retail & Services'),
(8, 3, 'Packing & Shipping'),
(9, 4, 'Lamps, Lighting & Ceiling Fans'),
(10, 15, 'Computer DVD-RW/+RW Drives'),
(11, 21, 'Water Sports'),
(12, 15, 'Other Computer Components'),
(13, 3, 'Printing & Graphic Arts'),
(14, 2, 'Postcards'),
(15, 5, 'Desktops & All-In-Ones'),
(16, 2, 'Decorative Collectibles'),
(17, 15, 'Laptop Docking Stations'),
(18, 15, 'Computer Network Interface Cards'),
(19, 13, 'DVDs & Blu-ray Discs'),
(20, 3, 'Electrical & Test Equipment'),
(21, 15, 'Computer Projectors'),
(22, 10, 'Portable Audio & Headphones'),
(23, 15, 'Computer DSL Modem-Router Combos'),
(24, 22, 'Lenses & Filters'),
(25, 15, 'Computer Components & Parts'),
(26, 12, 'Model Railroads & Trains'),
(27, 11, 'Bullion'),
(28, 5, 'Computer Components & Parts'),
(29, 15, 'Computer Audio Cables'),
(30, 17, 'Makeup'),
(31, 3, 'Other'),
(32, 5, 'Printers, Scanners & Supplies'),
(33, 17, 'Hair Care & Styling'),
(34, 2, 'Cultures & Ethnicities'),
(35, 10, 'Home Telephones'),
(36, 15, 'Laptop Adapters & Chargers'),
(37, 21, 'Team Sports'),
(38, 4, 'Tools'),
(39, 10, 'Home Surveillance'),
(40, 15, 'Server Components-Memory'),
(41, 15, 'Laptop Replacement Keyboards'),
(42, 11, 'Coins: World'),
(43, 16, 'Dog Supplies'),
(44, 2, 'Holiday & Seasonal'),
(45, 27, 'Video Game Consoles'),
(46, 15, 'Computer Printers-Laser Toner'),
(47, 20, 'Women''s Handbags & Bags'),
(48, 4, 'Housekeeping & Organization'),
(49, 10, 'Radio Communication'),
(50, 21, 'Hunting'),
(51, 5, 'Laptop & Desktop Accessories'),
(52, 17, 'Shaving & Hair Removal'),
(53, 24, 'Camera Lenses'),
(54, 8, 'Home Audio-Receivers'),
(55, 8, 'Vintage Speakers'),
(56, 9, 'Dolls'),
(57, 17, 'Skin Care'),
(58, 8, 'GPS Navigation Systems'),
(59, 2, 'Historical Memorabilia'),
(60, 4, 'Furnaces/Heating Systems'),
(61, 1, 'Cars & Trucks'),
(62, 10, 'TV, Video & Home Audio'),
(63, 2, 'Photographic Images'),
(64, 21, 'Outdoor Sports'),
(65, 12, 'Building Toys'),
(66, 20, 'Women''s Shoes'),
(67, 5, 'Software'),
(68, 23, 'Cell Phone Accessories'),
(69, 8, 'Home Audio-CD Players & Recorders'),
(70, 3, 'Other Test Equipment'),
(71, 14, 'NO CATEGORY 2'),
(72, 5, 'Laptops & Netbooks'),
(73, 25, 'Children & Young Adults'),
(74, 24, 'Digital Cameras'),
(75, 19, 'Men''s Jewelry'),
(76, 17, 'Fragrances'),
(77, 15, 'PC Laptops & Netbooks'),
(78, 21, 'Golf'),
(79, 15, 'Computer Monitors'),
(80, 3, 'MRO & Industrial Supply'),
(81, 20, 'Women''s Accessories'),
(82, 10, 'Vehicle Electronics & GPS'),
(83, 5, 'iPads, Tablets & eBook Readers'),
(84, 15, 'Computer Graphics, Video & TV Cards'),
(85, 2, 'Militaria'),
(86, 15, 'Docking Stations/Keyboards'),
(87, 12, 'Action Figures'),
(88, 4, 'Solar Energy-Solar Panels'),
(89, 17, 'Medical, Mobility & Disability'),
(90, 7, 'Records'),
(91, 23, 'Cell Phones & Smartphones'),
(92, 17, 'Nail Care & Polish'),
(93, 3, 'Office'),
(94, 24, 'Camera Cases, Bags & Covers'),
(95, 8, 'DVD & Blu-ray Players'),
(96, 15, 'Wireless Networking-Antennas'),
(97, 5, 'Other'),
(98, 8, 'Speaker Parts & Components'),
(99, 10, 'Home Automation'),
(100, 5, 'Home Networking & Connectivity'),
(101, 5, 'Cables & Connectors'),
(102, 15, 'Motherboards'),
(103, 15, 'Printers, Scanners & Supplies - Printers'),
(104, 3, 'Construction'),
(105, 3, 'Manufacturing & Metalworking'),
(106, 5, 'Power Protection, Distribution'),
(107, 2, 'Clocks'),
(108, 3, 'Oscilloscopes'),
(109, 4, 'Home Improvement'),
(110, 17, 'Bath & Body'),
(111, 25, 'Nonfiction'),
(112, 20, 'Women''s Clothing'),
(113, 22, 'Camcorders'),
(114, 13, 'VHS Tapes'),
(115, 3, 'Casters & Wheels in Material Handling'),
(116, 24, 'Camera Memory Cards'),
(117, 1, 'Parts & Accessories'),
(118, 5, 'Drives, Storage & Blank Media'),
(119, 5, 'Keyboards, Mice & Pointing'),
(120, 8, 'Home Audio-Turntable Parts & Acc.'),
(121, 21, 'Exercise & Fitness'),
(122, 3, 'Other Industrial Supply & MRO'),
(123, 21, 'Indoor Games'),
(124, 3, 'Other Packaging'),
(125, 15, 'iPads & Tablets'),
(126, 3, 'Control Systems and PLCs'),
(127, 15, 'Computer Modems'),
(128, 2, 'Radio, Phonograph, TV, Phone'),
(129, 19, 'Fashion Jewelry'),
(130, 5, 'Monitors, Projectors & Accs'),
(131, 25, 'Textbooks, Education'),
(132, 5, 'iPad/Tablet/eBook Accessories'),
(133, 3, 'Restaurant & Catering'),
(134, 25, 'Audiobooks'),
(135, 15, 'PC Desktops'),
(136, 10, 'Gadgets & Other Electronics'),
(137, 10, 'Multipurpose Batteries & Power'),
(138, 5, 'Enterprise Networking, Servers'),
(139, 25, 'Antiquarian & Collectible'),
(140, 2, 'Tobacciana'),
(141, 15, 'Apple Laptops & Notebooks'),
(142, 3, 'Heavy Equipment Parts & Accs'),
(143, 3, 'Plugs in Electrical Equipment'),
(144, 3, 'Other Meters in Electrical & Test Equipment'),
(145, 15, 'Internal (Desktop) Hard Drives '),
(146, 3, 'Test Equipment in Electrical & Test Equipment'),
(147, 5, 'Vintage Computing'),
(148, 3, 'Test Equip-DC Power Supplies'),
(149, 4, 'Rugs & Carpets'),
(150, 15, 'Computer CPUs'),
(151, 3, 'Websites & Businesses for Sale'),
(152, 22, 'Camera & Photo Accessories'),
(153, 3, 'Light Equipment & Tools'),
(154, 8, 'Television Parts & Accessories'),
(155, 15, 'Computer Memory'),
(156, 3, 'Material Handling'),
(157, 5, 'Wholesale Lots'),
(158, 8, 'DVD & Home Theater'),
(159, 4, 'Kids & Teens at Home'),
(160, 25, 'Fiction & Literature'),
(161, 2, 'Pens & Writing Instruments'),
(162, 15, 'Computer TV Cards, Tuners'),
(163, 20, 'Men''s Shoes'),
(164, 11, 'Coins: US'),
(165, 10, 'Vintage Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `mainconf`
--

CREATE TABLE IF NOT EXISTS `mainconf` (
  `PK` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(20) NOT NULL,
  `PAGE_LOAD_INTERVAL` int(11) NOT NULL,
  `CACHE_SIZE` int(11) NOT NULL,
  `ITEM_LIMIT` int(11) NOT NULL,
  `FLAG_PAUSE` tinyint(1) NOT NULL,
  PRIMARY KEY (`PK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mainconf`
--

INSERT INTO `mainconf` (`PK`, `TITLE`, `PAGE_LOAD_INTERVAL`, `CACHE_SIZE`, `ITEM_LIMIT`, `FLAG_PAUSE`) VALUES
(1, 'Default', 1, 50, 10000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sellercategory`
--

CREATE TABLE IF NOT EXISTS `sellercategory` (
  `PK` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SELLER` int(10) unsigned NOT NULL,
  `SUB_CATEGORY` int(10) unsigned NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`PK`),
  KEY `SELLER` (`SELLER`),
  KEY `SUB_CATEGORY` (`SUB_CATEGORY`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=474 ;

--
-- Dumping data for table `sellercategory`
--

INSERT INTO `sellercategory` (`PK`, `SELLER`, `SUB_CATEGORY`, `QUANTITY`) VALUES
(1, 39, 47, 2),
(2, 39, 112, 140),
(3, 39, 66, 2),
(4, 39, 81, 1),
(5, 2, 32, 386),
(6, 2, 72, 3),
(7, 56, 72, 1),
(8, 3, 77, 2),
(9, 4, 72, 10),
(10, 4, 100, 1),
(11, 4, 28, 3),
(12, 4, 118, 1),
(13, 5, 76, 51),
(14, 5, 57, 78),
(15, 5, 52, 1),
(16, 5, 30, 2),
(17, 5, 33, 1),
(18, 5, 92, 307),
(19, 5, 110, 161),
(20, 6, 72, 55),
(21, 6, 83, 2),
(22, 34, 117, 7),
(23, 34, 42, 1),
(24, 34, 164, 20),
(25, 34, 38, 7),
(26, 34, 91, 5),
(27, 34, 85, 1),
(28, 34, 140, 15),
(29, 7, 72, 2),
(30, 65, 32, 6),
(31, 65, 72, 1),
(32, 65, 138, 4),
(33, 65, 51, 1),
(34, 65, 28, 3),
(35, 65, 118, 1),
(36, 65, 7, 3),
(37, 65, 93, 2),
(38, 65, 68, 3),
(39, 8, 72, 1),
(40, 9, 119, 4),
(41, 9, 72, 6),
(42, 9, 118, 12),
(43, 9, 51, 2),
(44, 9, 28, 82),
(45, 9, 67, 1),
(46, 10, 72, 1),
(47, 11, 62, 1),
(48, 11, 72, 1),
(49, 12, 43, 43),
(50, 12, 39, 1),
(51, 12, 22, 10),
(52, 12, 62, 2),
(53, 12, 49, 1),
(54, 12, 136, 3),
(55, 12, 82, 148),
(56, 12, 132, 7),
(57, 12, 83, 16),
(58, 12, 15, 3),
(59, 12, 100, 1),
(60, 12, 119, 2),
(61, 12, 72, 10),
(62, 12, 51, 1),
(63, 12, 28, 1),
(64, 12, 118, 2),
(65, 12, 11, 10),
(66, 12, 64, 169),
(67, 12, 78, 2),
(68, 12, 121, 7),
(69, 12, 50, 153),
(70, 13, 72, 189),
(71, 13, 130, 31),
(72, 13, 83, 18),
(73, 13, 15, 19),
(74, 13, 132, 7),
(75, 14, 72, 1),
(76, 27, 72, 2),
(77, 16, 132, 3),
(78, 16, 83, 5),
(79, 16, 147, 1),
(80, 16, 100, 8),
(81, 16, 97, 5),
(82, 16, 119, 2),
(83, 16, 72, 54),
(84, 16, 138, 21),
(85, 16, 101, 7),
(86, 16, 51, 24),
(87, 16, 28, 329),
(88, 16, 118, 29),
(89, 17, 72, 1),
(90, 18, 72, 1),
(91, 19, 116, 1),
(92, 19, 74, 15),
(93, 19, 94, 1),
(94, 19, 53, 4),
(95, 19, 23, 1),
(96, 19, 125, 13),
(97, 19, 86, 1),
(98, 19, 2, 1),
(99, 19, 135, 1),
(100, 19, 21, 1),
(101, 19, 77, 33),
(102, 52, 146, 22),
(103, 52, 148, 3),
(104, 52, 126, 3),
(105, 52, 144, 3),
(106, 52, 108, 4),
(107, 52, 70, 3),
(108, 52, 122, 3),
(109, 52, 158, 24),
(110, 52, 69, 3),
(111, 52, 54, 3),
(112, 52, 58, 3),
(113, 52, 95, 4),
(114, 52, 150, 22),
(115, 52, 36, 6),
(116, 52, 79, 5),
(117, 52, 40, 5),
(118, 52, 145, 5),
(119, 52, 10, 26),
(120, 52, 84, 13),
(121, 52, 135, 5),
(122, 52, 29, 7),
(123, 52, 18, 8),
(124, 52, 41, 9),
(125, 52, 155, 19),
(126, 52, 25, 79),
(127, 52, 103, 15),
(128, 45, 72, 1),
(129, 45, 83, 1),
(130, 45, 132, 1),
(131, 21, 32, 14),
(132, 21, 130, 5),
(133, 21, 72, 3),
(134, 21, 51, 1),
(135, 21, 138, 1),
(136, 21, 159, 6),
(137, 22, 72, 1),
(138, 23, 72, 1),
(139, 23, 130, 2),
(140, 23, 47, 5),
(141, 23, 81, 5),
(142, 24, 45, 45),
(143, 24, 72, 1),
(144, 24, 91, 1),
(145, 43, 72, 135),
(146, 43, 28, 23),
(147, 15, 113, 1),
(148, 15, 163, 1),
(149, 15, 91, 1),
(150, 28, 72, 1),
(151, 29, 72, 1),
(152, 30, 72, 1),
(153, 46, 72, 1),
(154, 32, 32, 3),
(155, 32, 15, 7),
(156, 32, 130, 2),
(157, 32, 100, 1),
(158, 32, 72, 2),
(159, 32, 138, 5),
(160, 32, 28, 1),
(161, 32, 101, 5),
(162, 33, 72, 2),
(163, 33, 28, 1),
(164, 31, 32, 1),
(165, 31, 157, 1),
(166, 31, 100, 1),
(167, 31, 72, 18),
(168, 31, 138, 7),
(169, 31, 28, 6),
(170, 31, 118, 1),
(171, 68, 77, 1),
(172, 36, 32, 32),
(173, 36, 67, 1),
(174, 36, 106, 2),
(175, 36, 83, 1),
(176, 36, 15, 359),
(177, 36, 130, 27),
(178, 36, 100, 5),
(179, 36, 97, 9),
(180, 36, 119, 4),
(181, 36, 72, 54),
(182, 36, 138, 59),
(183, 36, 101, 5),
(184, 36, 51, 11),
(185, 36, 28, 113),
(186, 36, 118, 59),
(187, 36, 93, 23),
(188, 36, 80, 115),
(189, 36, 5, 11),
(190, 36, 151, 1),
(191, 36, 31, 8),
(192, 36, 104, 6),
(193, 36, 20, 53),
(194, 36, 153, 2),
(195, 36, 7, 13),
(196, 36, 13, 3),
(197, 37, 32, 9),
(198, 37, 106, 10),
(199, 37, 83, 4),
(200, 37, 130, 4),
(201, 37, 100, 6),
(202, 37, 72, 86),
(203, 37, 138, 137),
(204, 37, 101, 1),
(205, 37, 51, 3),
(206, 37, 28, 26),
(207, 37, 118, 3),
(208, 37, 153, 4),
(209, 37, 80, 6),
(210, 37, 7, 14),
(211, 37, 93, 34),
(212, 37, 20, 85),
(213, 38, 71, 71),
(214, 58, 85, 1),
(215, 58, 63, 3),
(216, 58, 44, 1),
(217, 58, 16, 2),
(218, 58, 14, 1),
(219, 58, 140, 4),
(220, 58, 59, 3),
(221, 58, 72, 1),
(222, 58, 119, 2),
(223, 58, 75, 75),
(224, 58, 129, 129),
(225, 58, 90, 90),
(226, 58, 27, 2),
(227, 58, 164, 3),
(228, 40, 117, 2),
(229, 40, 22, 1),
(230, 40, 62, 1),
(231, 40, 72, 3),
(232, 40, 28, 2),
(233, 40, 19, 2),
(234, 41, 117, 1),
(235, 41, 72, 1),
(236, 41, 26, 1),
(237, 41, 80, 1),
(238, 41, 20, 1),
(239, 42, 83, 12),
(240, 42, 15, 7),
(241, 42, 130, 2),
(242, 42, 119, 5),
(243, 42, 72, 120),
(244, 42, 118, 1),
(245, 42, 67, 6),
(246, 42, 111, 27),
(247, 42, 19, 39),
(248, 25, 16, 1),
(249, 25, 85, 1),
(250, 25, 140, 1),
(251, 25, 59, 3),
(252, 25, 72, 1),
(253, 25, 100, 1),
(254, 25, 67, 3),
(255, 25, 51, 1),
(256, 25, 118, 3),
(257, 25, 131, 1),
(258, 25, 73, 4),
(259, 25, 160, 5),
(260, 25, 111, 5),
(261, 25, 134, 1),
(262, 25, 139, 13),
(263, 25, 56, 56),
(264, 25, 19, 2),
(265, 25, 114, 3),
(266, 57, 141, 1),
(267, 48, 72, 3),
(268, 49, 39, 31),
(269, 49, 99, 3),
(270, 49, 22, 1),
(271, 49, 62, 32),
(272, 49, 165, 2),
(273, 49, 49, 31),
(274, 49, 136, 6),
(275, 49, 82, 1),
(276, 49, 35, 8),
(277, 49, 137, 2),
(278, 49, 32, 81),
(279, 49, 106, 5),
(280, 49, 147, 3),
(281, 49, 15, 2),
(282, 49, 130, 10),
(283, 49, 100, 14),
(284, 49, 97, 5),
(285, 49, 119, 9),
(286, 49, 72, 14),
(287, 49, 138, 131),
(288, 49, 118, 92),
(289, 49, 51, 25),
(290, 49, 28, 130),
(291, 49, 101, 29),
(292, 49, 105, 6),
(293, 49, 93, 114),
(294, 49, 5, 275),
(295, 49, 80, 49),
(296, 49, 104, 10),
(297, 49, 20, 117),
(298, 49, 153, 85),
(299, 49, 142, 1),
(300, 49, 7, 32),
(301, 49, 13, 4),
(302, 50, 72, 1),
(303, 51, 102, 1),
(304, 51, 77, 3),
(305, 20, 156, 4),
(306, 20, 143, 1),
(307, 20, 124, 3),
(308, 20, 115, 1),
(309, 20, 60, 1),
(310, 20, 88, 2),
(311, 20, 150, 13),
(312, 20, 46, 1),
(313, 20, 40, 1),
(314, 20, 145, 1),
(315, 20, 127, 1),
(316, 20, 17, 1),
(317, 20, 12, 1),
(318, 20, 96, 1),
(319, 20, 162, 1),
(320, 20, 77, 14),
(321, 20, 154, 3),
(322, 20, 98, 1),
(323, 20, 55, 3),
(324, 20, 120, 2),
(325, 53, 15, 9),
(326, 53, 72, 4),
(327, 53, 6, 6),
(328, 54, 22, 1),
(329, 54, 62, 25),
(330, 54, 165, 7),
(331, 54, 49, 1),
(332, 54, 136, 1),
(333, 54, 82, 1),
(334, 54, 35, 1),
(335, 54, 32, 14),
(336, 54, 147, 4),
(337, 54, 130, 1),
(338, 54, 97, 1),
(339, 54, 119, 3),
(340, 54, 72, 65),
(341, 54, 138, 2),
(342, 54, 28, 6),
(343, 54, 67, 1),
(344, 54, 159, 1),
(345, 54, 4, 1),
(346, 54, 109, 6),
(347, 54, 93, 11),
(348, 54, 5, 1),
(349, 54, 80, 5),
(350, 54, 20, 7),
(351, 54, 142, 2),
(352, 54, 7, 6),
(353, 54, 107, 1),
(354, 54, 34, 4),
(355, 54, 128, 2),
(356, 54, 161, 1),
(357, 55, 39, 4),
(358, 55, 22, 38),
(359, 55, 62, 20),
(360, 55, 165, 1),
(361, 55, 49, 4),
(362, 55, 136, 2),
(363, 55, 82, 16),
(364, 55, 35, 1),
(365, 55, 137, 4),
(366, 55, 32, 35),
(367, 55, 132, 3),
(368, 55, 101, 1),
(369, 55, 83, 9),
(370, 55, 100, 1),
(371, 55, 97, 1),
(372, 55, 119, 3),
(373, 55, 72, 1),
(374, 55, 118, 1),
(375, 55, 51, 5),
(376, 55, 28, 3),
(377, 55, 67, 3),
(378, 55, 93, 10),
(379, 55, 5, 3),
(380, 55, 8, 1),
(381, 55, 80, 9),
(382, 55, 104, 1),
(383, 55, 20, 5),
(384, 55, 153, 1),
(385, 55, 7, 26),
(386, 55, 13, 1),
(387, 55, 24, 4),
(388, 55, 3, 43),
(389, 55, 113, 3),
(390, 55, 152, 6),
(391, 55, 19, 155),
(392, 59, 15, 31),
(393, 59, 130, 1),
(394, 59, 97, 1),
(395, 59, 119, 6),
(396, 59, 72, 242),
(397, 59, 138, 3),
(398, 59, 51, 32),
(399, 59, 28, 117),
(400, 59, 118, 30),
(401, 64, 123, 1),
(402, 64, 121, 133),
(403, 64, 37, 17),
(404, 64, 149, 52),
(405, 64, 109, 285),
(406, 26, 72, 183),
(407, 26, 28, 17),
(408, 26, 118, 1),
(409, 60, 117, 1),
(410, 60, 3, 2),
(411, 60, 72, 1),
(412, 61, 117, 2),
(413, 61, 82, 1),
(414, 61, 49, 1),
(415, 61, 65, 3),
(416, 61, 87, 1),
(417, 61, 89, 1),
(418, 61, 109, 1),
(419, 61, 9, 1),
(420, 62, 136, 10),
(421, 62, 62, 57),
(422, 62, 157, 1),
(423, 62, 132, 6),
(424, 62, 83, 2),
(425, 62, 100, 2),
(426, 62, 15, 21),
(427, 62, 130, 10),
(428, 62, 67, 3),
(429, 62, 97, 2),
(430, 62, 119, 4),
(431, 62, 72, 46),
(432, 62, 118, 3),
(433, 62, 51, 44),
(434, 62, 28, 39),
(435, 62, 101, 5),
(436, 63, 164, 15),
(437, 63, 72, 5),
(438, 67, 72, 54),
(439, 66, 61, 1),
(440, 66, 117, 12),
(441, 66, 82, 6),
(442, 66, 165, 57),
(443, 66, 1, 1),
(444, 66, 62, 1),
(445, 66, 32, 21),
(446, 66, 138, 5),
(447, 66, 51, 1),
(448, 66, 72, 1),
(449, 66, 101, 2),
(450, 66, 105, 1),
(451, 66, 133, 2),
(452, 66, 93, 4),
(453, 66, 5, 2),
(454, 66, 8, 1),
(455, 66, 80, 30),
(456, 66, 104, 82),
(457, 66, 20, 9),
(458, 66, 7, 1),
(459, 66, 13, 2),
(460, 66, 48, 1),
(461, 66, 109, 1),
(462, 66, 9, 11),
(463, 44, 72, 3),
(464, 44, 118, 3),
(465, 44, 51, 5),
(466, 44, 28, 38),
(467, 44, 101, 3),
(468, 69, 130, 3),
(469, 69, 119, 2),
(470, 69, 72, 67),
(471, 69, 138, 15),
(472, 69, 28, 126),
(473, 69, 118, 16);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE IF NOT EXISTS `sellers` (
  `PK` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(64) NOT NULL,
  `SCORE` int(11) NOT NULL,
  `AVERAGE_PRICE` decimal(11,2) NOT NULL,
  `USED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`PK`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`PK`, `USERNAME`, `SCORE`, `AVERAGE_PRICE`, `USED_TIME`) VALUES
(1, 'deal.maker360', 207, 550.00, NULL),
(2, 'tech_handyman', 13199, 58.06, NULL),
(3, 'go_buckeyes', 377, 104.99, NULL),
(4, 'kyman1530', 7595, 215.72, NULL),
(5, '865be9', 1954, 19.66, NULL),
(6, 'laptopexperience', 12975, 195.55, NULL),
(7, 'pdeckworks', 11, 112.50, NULL),
(8, 't.nicewicz', 24, 71.00, NULL),
(9, 'slidingscalecomputers', 962, 36.38, NULL),
(10, 'pritkesh', 48, 56.50, NULL),
(11, 'joedelgaudio2012', 3, 161.50, NULL),
(12, 'geekdeal', 153885, 155.37, NULL),
(13, 'acer', 11660, 336.85, NULL),
(14, 'cellphonesandthings', 1002, 150.00, NULL),
(15, 'nyczdav1d', 26, 370.00, NULL),
(16, 'hum747', 12634, 231.69, NULL),
(17, 'mrcomponents_2013', 71, 47.71, NULL),
(18, 't-mjolnir', 211, 1400.00, NULL),
(19, 'digjungle', 4228, 340.84, NULL),
(20, 'recycletek', 1664, 52.89, NULL),
(21, 'kvjl**va', 7785, 39.57, NULL),
(22, 'newlou-half', 146, 785.00, NULL),
(23, 'vnoel1107', 1688, 345.85, NULL),
(24, 'hello.614', 346, 110.00, NULL),
(25, 'wally94142', 2164, 18.42, NULL),
(26, 'cpmatrix', 15145, 285.10, NULL),
(27, 'sweetd58', 709, 200.95, NULL),
(28, 'dicales', 893, 68.00, NULL),
(29, '1pmi', 3, 132.50, NULL),
(30, 'wrschubert', 450, 299.99, NULL),
(31, 'ars2004arsrecycle', 6805, 105.86, NULL),
(32, 'htg_tech', 1120, 201.68, NULL),
(33, 'coolcustomcomputers', 1252, 74.33, NULL),
(34, 'dienowbob2012', 365, 46.08, NULL),
(35, 'johanjrck', 285, 220.00, NULL),
(36, 'e-cyclepro', 50797, 48.45, NULL),
(37, 'excel-telco', 11034, 155.34, NULL),
(38, 'dell-official-store-usa-refurbish...', 0, 0.00, NULL),
(39, 'jlknovi', 835, 90.47, NULL),
(40, 'byronspawnstore2', 296, 121.82, NULL),
(41, 'knuckles203', 173, 77.99, NULL),
(42, 'e-techgalaxy', 18901, 333.23, NULL),
(43, 'buybest13', 19256, 72.78, NULL),
(44, 'j*jcompsystems', 901, 108.66, NULL),
(45, 'williamsbh', 106, 108.66, NULL),
(46, 'kglane219', 277, 51.00, NULL),
(47, 'natestump', 39, 0.00, NULL),
(48, 'rmd_pc', 119, 237.50, NULL),
(49, 'digitalintl', 5373, 142.77, NULL),
(50, 'usajordi', 33, 389.00, NULL),
(51, 'laptop_resources', 579, 151.00, NULL),
(52, 'gws_inc', 28841, 49.54, NULL),
(53, 'skudu-tech-inc', 1122, 405.99, NULL),
(54, 'ics101', 875, 161.99, NULL),
(55, 'dotcom-sales', 122018, 14.70, NULL),
(56, 'agon4008', 347, 175.00, NULL),
(57, 'bmcnab3', 77, 625.00, NULL),
(58, 'lcestates', 482, 11.85, NULL),
(59, 'skeez3535', 29373, 463.41, NULL),
(60, 'lflaxman', 1704, 202.90, NULL),
(61, 'msfmx', 426, 42.13, NULL),
(62, 'brown-box', 34337, 241.79, NULL),
(63, 'jims5096', 578, 38.75, NULL),
(64, 'incstores', 961, 136.04, NULL),
(65, 'populous100', 743, 53.07, NULL),
(66, 'strange_horizon', 392, 55.50, NULL),
(67, 'toshiba', 3978, 379.23, NULL),
(68, 'mike$bz', 61, 810.00, NULL),
(69, 'pcrecyclerva', 10407, 22.94, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `goodscategoryleveltwo`
--
ALTER TABLE `goodscategoryleveltwo`
  ADD CONSTRAINT `goodscategoryleveltwo_ibfk_1` FOREIGN KEY (`SUB_HEADING`) REFERENCES `goodscategorylevelone` (`PK`) ON UPDATE CASCADE;

--
-- Constraints for table `sellercategory`
--
ALTER TABLE `sellercategory`
  ADD CONSTRAINT `sellercategory_ibfk_1` FOREIGN KEY (`SELLER`) REFERENCES `sellers` (`PK`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sellercategory_ibfk_2` FOREIGN KEY (`SUB_CATEGORY`) REFERENCES `goodscategoryleveltwo` (`PK`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
