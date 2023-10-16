-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2023 at 11:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'BREAKFAST', 'Energize your mornings with our delicious breakfast selection. Experience softer, tastier delights for a delightful start to your day.', '2021-03-17 18:16:28'),
(2, 'LUNCH', 'Satisfy your lunchtime cravings with our irresistibly soft and flavorful dishes.', '2021-03-17 18:17:14'),
(4, 'CHINESE', 'Authentic Chinese flavors meet soft noodles and fragrant fried rice for a truly delightful meal.\r\n', '2021-03-17 18:19:10'),
(5, 'BEVERAGES', 'Complement your pizza with wide range of beverages available at Domino\'s Pizza India', '2021-03-17 21:58:58'),
(6, 'FRUIT JUICES', 'Quench your thirst with our refreshing fruit juices, bursting with natural flavors and served with a touch of softness.', '2021-03-18 07:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(4, 2, 1, 1),
(5, 2, 2, 1),
(6, 2, 3, 1),
(7, 2, 42, 1),
(8, 2, 43, 1),
(9, 2, 44, 1),
(10, 3, 2, 1),
(11, 3, 16, 1),
(12, 3, 36, 1),
(13, 3, 39, 1),
(14, 3, 43, 1),
(15, 4, 1, 13),
(16, 4, 4, 1),
(17, 4, 16, 1),
(18, 5, 1, 1),
(19, 5, 16, 1),
(20, 5, 15, 1),
(21, 5, 39, 1),
(22, 5, 53, 1),
(23, 6, 16, 2),
(24, 6, 19, 2),
(25, 6, 39, 1),
(26, 6, 46, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(2, 4, '106,House of aavaas , chaitanya villas colony, upperpally court,attapur, ', 500030, 9394554885, 230, '0', '0', '2023-07-04 22:12:42'),
(3, 4, '106,House of aavaas , chaitanya villas colony, upperpally court,attapur, ', 500030, 9394554885, 370, '0', '0', '2023-07-05 02:43:50'),
(4, 4, '106,House of aavaas , chaitanya villas colony, upperpally court,attapur, ', 500030, 9394554885, 270, '0', '0', '2023-07-05 10:06:13'),
(5, 4, '106,House of aavaas , chaitanya villas colony, upperpally court,attapur, ', 500030, 9394554885, 475, '0', '0', '2023-07-05 11:20:42'),
(6, 4, '106,House of aavaas , chaitanya villas colony, upperpally court,attapur, ', 500030, 9394554885, 825, '0', '0', '2023-07-05 14:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(1, 'Plain Dosa', 30, 'A classic plain dosa delight.Soft, tangy, and irresistible.', 1, '2021-03-17 21:03:26'),
(2, 'Masala Dosa', 35, 'The ever-popular masala dosa, A beloved South Indian favorite.', 1, '2021-03-17 21:20:58'),
(3, 'Onion Dosa\r\n', 35, 'Onion Dosa, a savory treat that will tantalize your taste buds\r\n', 1, '2021-03-17 21:22:07'),
(4, 'Paneer Dosa', 40, 'Flavorful paneer in our Paneer Dosa - quite a mouthful!\r\n\r\n', 1, '2021-03-17 21:23:05'),
(5, 'Idly\r\n', 30, 'Indulge in the soft and fluffy goodness of our Idly!', 1, '2021-03-17 21:23:48'),
(6, 'Sambar Idly', 35, 'Flavorful sambar in our Sambar Idly, a classic South Indian delicacy that will satisfy your cravings\r\n\r\n', 1, '2021-03-17 21:24:38'),
(7, 'Puri\r\n', 30, 'Delight in the golden and puffed-up goodness of our Puri, a deep-fried bread that is soft on the inside and crispy on the outside, making it a perfect accompaniment to a variety of flavorful curries and chutneys.\r\n\r\n', 1, '2021-03-17 21:25:42'),
(8, 'Vada', 30, 'Crispy and delight of our Vada, a deep-fried lentil fritter that is crispy on the outside and soft on the inside, served with tangy sambar and coconut chutney for a truly satisfying experience.\"', 1, '2021-03-17 21:26:31'),
(9, 'Upma', 30, 'Comforting flavors of our Upma, a wholesome semolina dish cooked with aromatic spices, vegetables, and garnished with fresh herbs, offering a delightful breakfast or snack option that will warm your soul.', 1, '2021-03-17 21:27:21'),
(13, 'Veg Thali', 80, 'Experience the flavors of our Veg Thali: a wholesome vegetarian meal.', 2, '2021-03-17 21:34:37'),
(14, 'Vegetable Biryani', 150, 'Fragrant basmati rice cooked with a mix of seasonal vegetables and aromatic spices.', 2, '2021-03-17 21:35:31'),
(15, 'Palak Paneer', 180, 'Bite into creamy spinach curry with cubes of paneer (Indian cottage cheese), served with rice or bread.\r\n', 2, '2021-03-17 21:37:21'),
(16, 'Chicken Biryani\r\n', 200, 'Mmm! the taste of Hyderabad\'s famous Chicken Biryani, a crowd favorite.\r\n', 2, '2021-03-17 21:36:36'),
(17, 'Parota', 40, 'Traditional Indian bread made in a clay oven, perfect for scooping up curries.', 2, '2021-03-17 21:38:13'),
(18, 'Chole Bhature\r\n', 120, 'Spiced chickpeas served with deep-fried bread (bhature), accompanied by pickle and yogurt.', 2, '2021-03-17 21:39:49'),
(19, 'Butter Chicken', 150, 'Succulent pieces of chicken cooked in a creamy and mildly spiced tomato-based gravy.', 2, '2021-03-17 21:40:58'),
(20, 'Indi Chicken Tikka', 150, 'The wholesome flavour of tandoori masala with Chicken tikka I onion I red paprika I mint mayo', 2, '2021-03-17 21:41:49'),
(29, 'Veg Fried Rice', 40, 'Classic Chinese dish with steamed rice stir-fried with vegetablesand soy sauce.', 4, '2021-03-17 22:01:33'),
(30, 'Egg Fried Rice', 50, 'Delicious Egg Fried Rice: A Chinese favorite, packed with flavor and satisfaction.', 4, '2021-03-17 22:02:50'),
(31, 'Chicken Freid Rice', 60, 'A Chinese delight with tender chicken and fragrant rice.', 4, '2021-03-17 22:03:44'),
(32, 'Veg Noodles', 40, 'A delightful combination of fresh vegetables and flavorful noodles.', 4, '2021-03-17 22:05:08'),
(33, 'Egg Noodles', 50, 'Irresistible noodles tossed with scrambled eggs and vegetables.', 4, '2021-03-17 22:06:06'),
(34, 'Chicken Noodles', 60, 'Tender chicken strips and flavorful noodles in a delightful combination.', 4, '2021-03-17 22:06:59'),
(35, 'Spring Rolls', 50, 'Crispy rolls filled with vegetables, meat, and sometimes seafood, served with a dipping sauce.', 4, '2021-03-17 22:08:13'),
(36, 'Soup', 50, 'A comforting bowl of goodness, packed with flavorful ingredients.', 4, '2021-03-17 22:08:58'),
(37, 'Lipton Ice Tea', 25, ' 250ml', 5, '2021-03-17 22:12:53'),
(38, 'Mirinda', 20, '250ml', 5, '2021-03-17 22:13:38'),
(39, 'PEPSI BLACK CAN', 45, 'PEPSI BLACK CAN', 5, '2021-03-17 22:14:24'),
(40, 'Pepsi\r\n', 20, '250ml', 5, '2021-03-17 22:16:29'),
(41, '7Up', 20, '250ml', 5, '2021-03-17 22:17:08'),
(42, 'Refreshing Watermelon Juice', 40, 'Juicy and hydrating, perfect for a hot summer day.', 6, '2021-03-18 07:57:27'),
(43, 'Zesty Orange Juice', 40, 'A burst of citrusy goodness to invigorate your taste buds.', 6, '2021-03-18 07:59:52'),
(44, 'Indulgent Oreo Shake', 50, 'A creamy and decadent treat, blending the classic flavors of Oreo cookies into a rich and satisfying shake.', 6, '2021-03-18 08:00:39'),
(45, 'Mouthwatering Musk Melon Juice', 40, 'A sweet and refreshing juice made from ripe musk melon, perfect for a refreshing and hydrating experience.', 6, '2021-03-18 08:01:29'),
(46, 'Luscious Grape Juice', 40, 'A delightful and tangy juice made from succulent grapes, offering a burst of natural sweetness with every sip.', 6, '2021-03-18 08:03:17'),
(53, 'Packaged Drinking Water', 20, 'Drinking Water	', 5, '2021-03-18 08:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'Campus Dining', 'akashnadigepu@gmail.com', 9394554885, 0, 'CMR ENGINEERING COLLEGE,Medchal Road, Kandlaykoya Village, Hyderabad, Telangana 501401 ', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(4, 'Akash', 'Akash', 'Nadigepu', 'akashnadigepu@gmail.com', 9394554885, '0', '$2y$10$7oLP/ex5J7wpUC4sjBfIE..cDD/WH3G9.ErvNndXPjWvYGHcMvCsW', '2023-07-04 22:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(26, 1, 2, 3, '2023-07-04 22:09:52'),
(27, 6, 1, 3, '2023-07-04 22:09:55'),
(28, 8, 1, 3, '2023-07-04 22:09:56'),
(29, 34, 1, 3, '2023-07-04 22:10:04'),
(30, 40, 1, 3, '2023-07-04 22:10:13'),
(31, 42, 1, 3, '2023-07-04 22:10:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
