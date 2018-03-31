-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 31, 2018 at 06:46 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.27-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `im_expertreports`
--

-- --------------------------------------------------------

--
-- Table structure for table `im_areas`
--

CREATE TABLE `im_areas` (
  `id` int(11) NOT NULL,
  `inspectionId` varchar(255) NOT NULL,
  `areaName` varchar(255) NOT NULL,
  `visualObservation` varchar(255) NOT NULL,
  `generalObservation` varchar(255) NOT NULL,
  `recommendations` varchar(255) NOT NULL,
  `temprature` varchar(255) NOT NULL,
  `sampleType` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `rhRelativeHumidity` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_chats`
--

CREATE TABLE `im_chats` (
  `id` int(11) NOT NULL,
  `senderId` varchar(255) NOT NULL,
  `receiverId` varchar(255) NOT NULL,
  `conversationId` int(11) NOT NULL,
  `message` text NOT NULL,
  `file` text NOT NULL,
  `isDeleted` varchar(255) DEFAULT NULL,
  `readStatus` int(11) NOT NULL DEFAULT '0' COMMENT '//0-unread,1-read',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_clients`
--

CREATE TABLE `im_clients` (
  `id` int(11) NOT NULL,
  `inspectorId` varchar(255) NOT NULL,
  `clientId` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_commentmeta`
--

CREATE TABLE `im_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `im_comments`
--

CREATE TABLE `im_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `im_conversations`
--

CREATE TABLE `im_conversations` (
  `id` int(11) NOT NULL,
  `senderId` varchar(255) NOT NULL,
  `receiverId` varchar(255) NOT NULL,
  `inspectionId` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `im_conversations`
--

INSERT INTO `im_conversations` (`id`, `senderId`, `receiverId`, `inspectionId`, `created`) VALUES
(1, '7', '', '', '2018-03-30 13:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `im_documents`
--

CREATE TABLE `im_documents` (
  `id` int(11) NOT NULL,
  `certificate` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `im_documents`
--

INSERT INTO `im_documents` (`id`, `certificate`, `license`, `created`) VALUES
(1, 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/01/1517410633_cli.jpg', 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/01/1517410633_dbpr.jpg', '2018-01-31 14:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `im_dropdowns`
--

CREATE TABLE `im_dropdowns` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `keys` varchar(255) NOT NULL,
  `dataType` varchar(255) NOT NULL,
  `type` enum('0','1','2') NOT NULL COMMENT '//0-pblic adjuster,1-reme com,2-referal Source'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `im_dropdowns`
--

INSERT INTO `im_dropdowns` (`id`, `name`, `keys`, `dataType`, `type`) VALUES
(1, 'Mariela Calderin', '92e66484-0671-404b-81fd-f905129f2b83', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(2, 'Blue Star- Werner Chang', 'bb1029b4-d255-42c7-b386-474b28a59be7', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(3, 'remediator ISN', 'db277036-3e51-4f70-b73d-436d9f80172d', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(4, 'Manny Perez', '44322ee5-6483-4635-a6d8-a56d37cf072c', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(5, 'Manny Advanced Microclean', '1d0f2007-5800-44c4-8443-4e9224887951', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(6, 'Restoration 911-Mike ', 'ed1fc644-b69c-4b35-8193-4a8218dcfc09', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(7, 'Mariela-MR ', '8569bf2d-cdae-4b2d-acfd-9b57a26b06a0', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(8, 'Matt Restoration 1', '5a6a2edf-2a46-4a39-a15d-c969dc620a34', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(9, 'Joan Genesis Restoration', '831af94e-2a81-4645-b9c3-a00927b561a1', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(10, 'Tom  Jones', 'f1d63fff-1335-4fd2-ad26-aef02e5b43f1', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(11, ' Ultimate Restoration ', 'd41c2283-aa46-4300-9e0a-4f062aeb8038', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(12, ' Noah Restoration', 'b0d9b305-ece8-4216-b054-af5fbba44c53', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(13, 'Kirk Noah Restoration', '970729e7-e92d-464f-9fd6-a75e570e520a', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(14, 'Thomas 911 Restoration', 'ce668bd1-07ed-44fb-bc78-b81f796e1be9', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(15, 'Donald Brodsky  Flash Restoration', '432eb7a7-1460-40f8-b896-71580b531fd1', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(16, 'Victor 911 Restoration', 'f5373391-458b-494f-8668-f4ae5ccc5d5c', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(17, 'Michael Grant Rapid Water Restoration', 'b6d1a1ef-6aa7-489e-b83d-1ea81d1ca344', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(18, 'Gus Noah Restoration', '6ae44322-3c5a-41dd-b8cf-20a62f628eb0', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(19, 'Juan Cabrera- Ace Restoration', 'fb1afbc3-3b52-476f-aafe-7b4ef7d8a5f9', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(20, 'Restoration Giant ', 'e07105b6-6fa9-41dd-bccb-08a227d3695d', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(21, '', '12e60ccd-de96-4c67-bc04-cbd3c4feee78', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(22, 'Peter Xydes- ABC REstoration', '2056ba27-bcb2-4895-ba2a-20ef29526d2e', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(23, 'Tricounty All Restorations ', '41a944c4-bc11-4c15-a37e-8007d8a6b32f', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(24, 'Gus Ramentol', '5c7547ce-c057-4827-ae5e-1f813ac7e855', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(25, 'Nick Genesis Restoration', '123ef5a9-60a1-40d1-9733-de640c580506', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(26, 'Eduardo ', '1d057cde-a055-47d2-8f33-e83a1deb7c96', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(27, 'David Strabbing', '00a18cda-e7d2-4b44-ac15-4a643e37a0d0', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(28, 'Century Building Restoration USA ', '15fc4447-7764-4ce4-bf9e-472a641aa52b', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(29, 'Robert ', '52022273-7f5c-40f7-94d0-54f586d975d1', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(30, 'Andres Cajar', '46dd31bb-5145-400c-bb57-0bcd8af33cc4', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(31, 'Serge 911 Restoration', '7fe0e02a-23f7-42cd-8018-8462835f52f0', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(32, 'test  compeny', 'ca346c12-5be3-44e8-ab25-480fd089d074', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(33, 'Vladimir Denyuk', 'c587aa0f-3949-4ef9-a87a-cadfdec5fc2c', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(34, 'Payless Response Team ', 'b9132a08-b146-474e-9d86-bc0c77c6b5f1', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(35, 'test tetst', 'ec926770-5724-4c1d-a9c0-352934511069', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(36, 'remendiation testing', 'e2656377-6c25-443b-af3c-a4dba03ab42c', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(37, 'Pacey Lipkind', '7cffe016-4009-4155-96b9-f283efaaae70', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(38, 'National Water Restoration', '8b4ba624-8d5e-49f9-8a18-514f14b76a9c', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(39, '(Reggie)South Florida Water Restoration ', 'fbbab1a4-e8bc-49a9-a18e-534f37a8b5bb', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(40, 'Joe Remediator test', '93c3485b-6739-4042-87c6-d9e9bdf8962e', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(41, 'Anchor Water Damage Restoration RFes', '22815553-5397-4a5f-810e-29a8baa063e9', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(42, 'Blue Star- Werner Chang ', '25b95861-33bf-46d0-bbbb-b07ef68e0e3f', 'f8de01b7-836d-4624-90cb-05d568cf5063', '1'),
(43, 'Joe Puentes', 'e408181f-8df6-4be5-bad1-f57f99b85630', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(44, 'Joe Puentes', '11949869-ed66-417f-8f66-3edcc3ec8bcd', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(45, 'Carlos Nayor', '6d98a3c5-d8c9-4d7c-8d62-d536104bd628', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(46, 'Stellar vicky', 'a8829d03-6697-48a2-984c-fea19ae2ac1c', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(47, 'Nikki McCloud', '9545ade4-604f-41c0-bb07-8643f443ef20', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(48, 'Dom - Stellar Public Adjusting', '08b1e656-1f87-46c8-aa3d-7bd42bd33ba6', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(49, 'PA ISN', '09d4aae8-f260-476d-999d-7bbb2c6d9722', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(50, 'Rami Stellar Public Adjusting', 'fcf6facc-2fdc-4a0a-b22e-253461687c55', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(51, 'Vicky Stellar Public Adjusting', 'b5fca422-d86a-40b1-acd4-01c9718283f2', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(52, 'Jaime Restoration 1', 'd816f1f6-82b0-463d-8d37-db0c761e6ce3', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(53, 'Justin Restoration 1', '480a7d70-374f-4c28-8fc9-9e6a5aea6af6', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(54, 'Mike ', 'b9867a6d-fc7b-4617-858a-b7212b4e1100', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(55, 'Bertha Stellar Public Adjusting', '163a9e86-5b31-4887-a2bd-5e500367585c', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(56, 'Mariela-PA ', 'd8c6c1ae-3372-4f33-ae1f-2869ca1c08e9', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(57, 'Matt Restoration 1', 'e19f4950-69c1-4da5-b517-048b9e66228b', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(58, 'Peter Hardan Stellar Public Adjusting', '1d4b3936-8813-4569-8db1-9424c892b423', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(59, 'Grace Blanco', '4ab9bf82-ed83-408b-b8eb-05d24ec04903', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(60, 'Eric Faust- Bulldog Adjusters', 'f4dec955-ea1d-4cc4-b196-4a3afab93289', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(61, 'John Stec', 'd5ee1f3c-d496-40da-9eaf-db83d901e007', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(62, 'Elena Sosa Stellar ', 'b25996d9-c553-4082-a9c5-6ff25146e0e1', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(63, 'mike ', 'b55a185c-49c6-461c-80a3-e4fde24bba40', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(64, 'mariela ', 'd44067c5-02f2-47b9-bdc3-c648ed979a72', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(65, ' ', 'd8c172a5-1b33-4690-a279-37eca76885b5', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(66, 'Kirk Kelly', '046313dd-b1e5-4175-868b-ad369ee2310d', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(67, 'Howard- FL Best PA', 'f9c6ef61-aeb1-43d5-9f81-f068d49100ce', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(68, 'Barrington Guthrie', 'e38f9381-25e9-46d6-a7b1-e92e733453ca', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(69, 'Max Barbereba- Max Claim Consultants', '5a504d90-888f-4977-b216-094c9eff6a2e', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(70, 'Bertha Stellar Public Adjusting', 'ef8cba33-0965-48ca-8091-b9f8e4d3cf2b', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(71, 'Mariano Llorian', '5e9894ac-aa4d-4554-9671-cf94305da450', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(72, 'Eli Pinson Stellar Adjusting', '1fd68d06-4e3d-475e-b770-66f245dee80b', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(73, 'Wendy  Sanchez- Floridian PA', 'eb29c2b2-fa64-4684-bde4-5ac692e7fe6f', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(74, 'Dalton Watson- wat-ham enterprise', '744f066b-fde1-42a3-b6f6-af11f9611636', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(75, 'Braulio Quevedo-United Claims Specialist', 'f19ff1a3-c2a3-4194-bc22-dca3d0acce83', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(76, 'Arthur Camayd', '0d239399-6d1c-4c88-93fe-e94aebbd153b', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(77, 'Aaron Singer BullDog Adjusters', '7875c259-be92-48f1-9c5f-d520d2a7b0cd', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(78, 'Alfredo  Arnesen ', '6bbbdd75-2013-4ffe-93fc-24a5be265430', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(79, 'Eric  Yeager', '827bdc44-490c-45cc-ba3c-e1190b3ee2b0', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(80, 'Veve Talerando Stellar', 'c6c2255b-48f0-422f-b919-74ed3c2670cf', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(81, 'Stuart Hymson', 'a8344c94-64d2-4b4b-810b-fd3d4c1c2fdc', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(82, 'Dan Labow', '46bd891a-d7bb-44c7-9830-bb3e010de5fc', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(83, 'Paul Middleton- Insurance Estimating and Appraisal, Inc.', '83428bde-8254-4704-8d7a-f3bfc8ed1906', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(84, 'Maggie Izquierdo- Stellar', 'c9d304dc-7194-4b5e-ac58-a1af67cd8473', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(85, 'Juan  Cabrera- ACE Restor', '58643395-a8fb-487f-9c0f-5a6dfb37b2c4', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(86, 'Maggie  Izquierdo-Stellar', '36967bbf-8655-4c67-9929-5a2f05eec6ac', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(87, 'Mark Heramb', '4bee033c-f22c-45d0-9088-282b262f315e', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(88, 'vanessa Ortega- Stellar', 'df5c2c0b-36ac-4cda-99ac-7f828ff8a594', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(89, 'Cary- Stellar Adjusting ', '643b1f04-405b-4c00-9c93-744f8811a810', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(90, 'Miladie Cosme-Stellar', '0f8726e2-5d30-4187-bee3-d39c5f9b1354', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(91, 'Steven  Musgrave', 'a8c25293-d099-4dd5-831e-fac4fbd3074a', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(92, 'Ray Cophern- Rolling Green', '20285d8a-0e84-4f16-857b-0aba1fcd7fe4', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(93, 'Wendy Gonzalez', 'c7fa6097-dc50-4731-ace8-d77a59441110', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(94, 'Jess Ortega-stellar', '3fbc530b-28a6-401a-bd02-b5f48644cb4b', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(95, 'Ryan Risteen - Phoenix Claims Company', '8fb1b6c4-6597-4115-91e0-72c35c9a9da3', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(96, 'Jose Stellar Public Adjusting', 'f9c9b0dc-561f-41fc-b744-db53853be000', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(97, 'Curt Vogel', '7ef85785-cf09-4c78-9197-9fdcf1f04444', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(98, '', 'c3143169-ce57-4c94-a835-fd69d916bf6e', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(99, 'Jess  Ortega- Stellar', '65c45ee5-4ece-4a77-89cd-16fb4b99bf0c', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(100, 'Luis Carrillo-Floridian PA', 'c10b069c-068e-4aca-bf77-9a6fe5d830e4', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(101, 'Craig Drillich', '6c1a46fb-a181-4588-b6a9-d4d599d6f725', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(102, 'William Sans', '07fde329-9cdd-40d2-b29b-06ac2bdf3263', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(103, 'Eric  Yeager- Trouble in Paradise', 'e9c32fbb-8d43-476a-b53b-a0a25d21f9d4', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(104, 'Isabel Guerra', 'e4767c28-9105-410c-a3f9-8751e3edbce5', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(105, 'Tammy Lora', '65f1d451-fd80-4356-be43-0190064ef792', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(106, 'Marcus Louis- Stellar', 'c09fdc93-6c2e-4a6a-ba01-44622a7c1509', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(107, 'Rae - BULLDOG ', 'e4699a22-b573-4318-a4a6-1b8380608f40', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(108, 'Alexandra Trucido- Stellar', 'c31fcdb2-6428-441b-bb12-94a5653a2889', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(109, 'Yasiel Ramirez', 'f9e0d85e-df3f-4d47-80f8-7bbb0f27040f', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(110, 'Bianca Wright- Stellar PA', '2d4f44ef-e2b1-401f-be86-b232789131ae', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(111, 'Ruben Calas', 'b42b4359-efc8-4bf6-b988-a840278fb890', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(112, 'Tierra Davis', '74a5dfbd-62cc-4567-814d-8a76bb1db773', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(113, 'Amanda Sanchez', '161c57b5-0acd-4f18-b83a-93e5d3fbb762', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(114, 'Ivania Siares', '87c8b792-bb6c-4734-9cef-f4668ee24f1f', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(115, 'Asia ', 'e32b211c-2907-4f90-b295-2f1fd194dd44', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(116, 'Manny  Perez', '0ff65aa6-0e0a-49cf-a009-ae912c81820c', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(117, 'Alina Diaz', '91fca9ca-ceba-4074-88ad-fbe8716b4949', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(118, 'Myrna Ocasio- Stellar', '7c48aed7-3db5-4653-b439-c84dc9bf5b43', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(119, 'luis carrillo', '726afcd8-78dc-4229-94a8-187c92edafab', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(120, 'Yadin Acosta', 'a9e66dd7-b1f4-4629-97e1-d04b55951438', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(121, 'Ashlee Tapia- Stellar', 'cdc0db2f-23e6-4f50-a3a6-d29fd08489f6', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(122, 'Tasha Fussell', '4bbf6b9c-7871-4688-8784-56e12d830287', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(123, 'Porscha  March', 'a12717b6-b0db-4f80-90a1-f5aa307ace7d', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(124, 'Adriana Juncos', 'aa2a616f-a34b-4898-95f4-d87e4cdec415', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(125, 'Yanely Perez- Stellar', 'f5a0ecea-d3cb-47c8-ba2a-464a99e5edf0', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(126, 'Wendolyn Pichardo', 'e0afc0ec-a957-4905-907b-0e4d91e31d52', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(127, 'Jason Pyle', '289eedbb-7f5e-473b-a027-1a54ad467bc7', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(128, 'Spencer Weinreb- Stellar', '5905fa83-c2a4-4429-bf2e-6dbd706c225f', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(129, 'Jimmy Farach', '795824f5-5e6d-48ed-bc9f-270caf9f741e', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(130, 'Carlos Garcia', 'e02d43d3-8264-4bf3-9a5c-e34a6f357b8d', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(131, 'Christian Hernandez', 'ddd39808-0e1d-4f1f-bc19-1bce041ea0da', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(132, 'Steve Lorenzo', 'd1329a08-6649-4825-b0d1-6f30cdc18cfb', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(133, 'Lisandra Castillo', 'd49a920e-1183-4ecc-b699-f4e086a18166', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(134, '', 'c1fbc5c8-c9c1-41a9-80ce-ff75bf30cd85', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(135, 'Amanda Sanchez', 'fcc9f78a-bb46-40ed-9085-7cf22f46b6ba', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(136, 'Kirk Kelly PA', '9a51b208-6dae-4793-9c47-488644e7ab84', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(137, 'Samriti chandel', 'ea6a30a6-0036-4af9-ad14-96ab139bc884', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(138, 'Serge G', '1ec1ec84-7770-41fc-80fe-8fcc4aa910a3', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(139, 'Eddie  Cantelar', '09787545-3c3f-44ca-b04a-1828665c65d6', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(140, ' ', '4fa306d2-0127-4d61-ad11-57e9b4e7ff18', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(141, 'Carlos Aguilera', '494fc588-eb00-4559-9adc-2870c3031fb1', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(142, 'Werner Chang ', '8664ce86-557f-4eb5-a872-c02a5a74616a', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(143, 'Manuela Perez- Stellar', '161dd0ed-b328-4776-b532-f5eedf695ac9', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(144, 'Andy  Baker', '314e901f-a728-44e3-9669-7670ed161a02', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(145, ' ', '9a8c36d5-047e-4315-877d-f8d3c1fe8487', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(146, 'Ben  Noble', '48b5b33e-6e3f-4bb6-9aad-bf838518135f', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(147, 'Romy Valdespino', '774a62da-a4f5-4ded-8022-122af55b8930', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(148, 'Deanna  Rivera', 'f0f96680-baea-4f9e-ade9-ac1ad37d931f', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(149, 'Jade Jack', '5def93bb-21b7-4155-b51d-d84d71b81a6d', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(150, 'Platinum Public Adjuster Shane  Goldsmith', '57c24a79-38e7-49e0-9b1e-c6c5950e20de', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(151, 'Michael Lopez Coconut Grove Public adjusters ', 'd100ad5f-ac98-4f97-8d63-1943f258ee95', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(152, 'Elizabeth Hernandez', 'd2ed6a00-61ca-45d6-b272-0e700ec350fa', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(153, 'Joe  PA Tester', '1a8e4b5b-4a83-451d-89f1-ead2a31557e0', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(154, 'Floridian International Adjusters', '02dae557-9e37-496c-84e4-05413a7388a5', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(155, 'Platinum Public Adjuster Shane Go ', 'dcde2c9d-296d-4d7b-95d7-17b9139bffd6', '4951b051-43a4-4356-b562-c0779b0ea191', '0'),
(813, 'Daniel Spindler- Blue Star', 'db09a1d3-a2cf-4bd6-a610-cebfaaa547d6', '', '2'),
(814, 'Joe Puentes 411 Home Pros', 'c8adeeb4-7076-4b57-a9a8-eb4b54c3c7c2', '', '2'),
(815, 'ACCU Pools Isabello Rodriguez', 'dea3f184-9378-4fe9-af40-51f58ec3be02', '', '2'),
(816, 'Joe Tester', '853f7361-bf9a-4717-ae8c-94cd84fa1d3c', '', '2'),
(817, 'Stellar- Rami', '5dd44b01-0535-4c9b-bfb4-413ce8d3cddc', '', '2'),
(818, 'Restoration 1- Jaime Terrel ', 'd58b76ba-f6ef-433e-abf5-b2efa2c36a05', '', '2'),
(819, 'Justin  Restoration 1', '1da7f3c7-c1db-42db-9ac2-6c9138a1f747', '', '2'),
(820, 'Mike Restoration 911', 'cdd52267-7b9a-417f-b6cc-ed5390dcaf78', '', '2'),
(821, 'Daniel Spindler- Blue Star', 'db09a1d3-a2cf-4bd6-a610-cebfaaa547d6', '', '2'),
(822, 'Manny Perez Advanced Micro Clean', '9a4645cd-8a86-4eb1-aaf2-c0acb7276e1c', '', '2'),
(823, 'Joe Puentes 411 Home Pros', 'c8adeeb4-7076-4b57-a9a8-eb4b54c3c7c2', '', '2'),
(824, 'Bertha Stellar Public Adjusting', 'df92e0de-06aa-459c-9f3f-29615b40a268', '', '2'),
(825, 'ACCU Pools Isabello Rodriguez', 'dea3f184-9378-4fe9-af40-51f58ec3be02', '', '2'),
(826, ' Anchor Water Damage Restoration', '8799a379-d6ae-45d1-8557-c2006f2f8f9f', '', '2'),
(827, 'Joe Tester', '853f7361-bf9a-4717-ae8c-94cd84fa1d3c', '', '2'),
(828, 'Eli Stellar Public Adjusting', '2dd52552-73af-4e4a-9d89-f152b6af93d7', '', '2'),
(829, 'Stellar- Rami', '5dd44b01-0535-4c9b-bfb4-413ce8d3cddc', '', '2'),
(830, 'Carlos Nayor Atlantic Coast Public Adjusters', '0293e96e-3c8c-4b24-bc56-8ef19db9f4d2', '', '2'),
(831, 'Restoration 1- Jaime Terrel ', 'd58b76ba-f6ef-433e-abf5-b2efa2c36a05', '', '2'),
(832, 'Jenn Restoration 1', '8d82237c-13eb-4f71-aabe-04ab0b10f4ed', '', '2'),
(833, 'Justin  Restoration 1', '1da7f3c7-c1db-42db-9ac2-6c9138a1f747', '', '2'),
(834, 'Brian Christensen Restoration 1', 'fb536033-83c4-4112-8db8-ec607d53eb98', '', '2'),
(835, 'Mike Restoration 911', 'cdd52267-7b9a-417f-b6cc-ed5390dcaf78', '', '2'),
(836, 'Matt Beyers Restoration one', 'f2f96f19-d521-4690-8fbc-248abf139f2c', '', '2'),
(837, 'Manny Perez Advanced Micro Clean', '9a4645cd-8a86-4eb1-aaf2-c0acb7276e1c', '', '2'),
(838, 'Thea Vargas AJ Fulton', 'd444d264-e14e-4688-a550-7149a9fa8d53', '', '2'),
(839, 'Bertha Stellar Public Adjusting', 'df92e0de-06aa-459c-9f3f-29615b40a268', '', '2'),
(840, 'Nick Genesis Restoration', '0601ec07-d6e6-473d-b1e6-94b2d624da67', '', '2'),
(841, ' Anchor Water Damage Restoration', '8799a379-d6ae-45d1-8557-c2006f2f8f9f', '', '2'),
(842, 'Joan Genesis Restoration', '95a98051-6cdf-491b-9831-f8130b10abf2', '', '2'),
(843, 'Eli Stellar Public Adjusting', '2dd52552-73af-4e4a-9d89-f152b6af93d7', '', '2'),
(844, 'Andres Yeguez Advanta Clean', 'bb11a2ea-be8e-43fe-aff4-068830bf7a4e', '', '2'),
(845, 'Carlos Nayor Atlantic Coast Public Adjusters', '0293e96e-3c8c-4b24-bc56-8ef19db9f4d2', '', '2'),
(846, 'Gus Ramentol Top Remediation Specialist', '6a34b735-d2cf-4dba-8c29-e94461176502', '', '2'),
(847, 'Jenn Restoration 1', '8d82237c-13eb-4f71-aabe-04ab0b10f4ed', '', '2'),
(848, 'Andres Cajar Anchor Restoration', 'dd3a05e6-2f30-48f1-a6a1-01bfa2b5c85a', '', '2'),
(849, 'Brian Christensen Restoration 1', 'fb536033-83c4-4112-8db8-ec607d53eb98', '', '2'),
(850, 'Victor Restoration 911', '6c47aff3-b644-4532-a4dc-495daf3de759', '', '2'),
(851, 'Matt Beyers Restoration one', 'f2f96f19-d521-4690-8fbc-248abf139f2c', '', '2'),
(852, 'Tomas 911 Restoration', '25fff462-258a-497e-966f-1dddc7753250', '', '2'),
(853, 'Thea Vargas AJ Fulton', 'd444d264-e14e-4688-a550-7149a9fa8d53', '', '2'),
(854, 'Maureen Evans Stellar Public Adjusting', '9b32a89e-8333-40fc-9c7e-d63dd2e27a77', '', '2'),
(855, 'Nick Genesis Restoration', '0601ec07-d6e6-473d-b1e6-94b2d624da67', '', '2'),
(856, 'Joan Genesis Restoration', '95a98051-6cdf-491b-9831-f8130b10abf2', '', '2'),
(857, 'Vicky Chumpitaz Stellar Public Adjusting', '12bca4d1-e8c8-4fb6-90f2-15f9f8f0eee0', '', '2'),
(858, 'Vanessa Ortega Stellar Public Adjusting', 'cb9f23b9-c2a9-4a4d-9727-11a5115da651', '', '2'),
(859, 'Andres Yeguez Advanta Clean', 'bb11a2ea-be8e-43fe-aff4-068830bf7a4e', '', '2'),
(860, 'Gus Ramentol Top Remediation Specialist', '6a34b735-d2cf-4dba-8c29-e94461176502', '', '2'),
(861, 'Peter Hardan Stellar Public Adjusting', '42c186dd-ba9d-40f2-8f77-a825cc1f1dd0', '', '2'),
(862, 'Andres Cajar Anchor Restoration', 'dd3a05e6-2f30-48f1-a6a1-01bfa2b5c85a', '', '2'),
(863, 'Eliezer Pinson Stellar Public Adjusting', '8f219899-709e-4c37-83f3-06bfa7bb381d', '', '2'),
(864, 'Victor Restoration 911', '6c47aff3-b644-4532-a4dc-495daf3de759', '', '2'),
(865, ' ', 'd3c7f0b2-768f-4c00-bb83-7c6ddabed61b', '', '2'),
(866, 'Tomas 911 Restoration', '25fff462-258a-497e-966f-1dddc7753250', '', '2'),
(867, 'Blue Star', '6e57c097-d3f0-4583-ab1d-c53a6eea2a19', '', '2'),
(868, 'Maureen Evans Stellar Public Adjusting', '9b32a89e-8333-40fc-9c7e-d63dd2e27a77', '', '2'),
(869, 'Aj Fulton', 'b7101002-e6bd-4825-a360-05cd9347a2ed', '', '2'),
(870, 'Vicky Chumpitaz Stellar Public Adjusting', '12bca4d1-e8c8-4fb6-90f2-15f9f8f0eee0', '', '2'),
(871, 'Jason- Noah Restoration', 'ce3a692c-d61d-4f77-bed5-26e19211cb4b', '', '2'),
(872, 'Ultracontractors', '3aafea5e-48be-4f8d-aca1-5b761ee028d0', '', '2'),
(873, 'Vanessa Ortega Stellar Public Adjusting', 'cb9f23b9-c2a9-4a4d-9727-11a5115da651', '', '2'),
(874, 'Restore All', 'd631b655-ab9e-44bb-a5dd-12e32b1b2f55', '', '2'),
(875, 'Peter Hardan Stellar Public Adjusting', '42c186dd-ba9d-40f2-8f77-a825cc1f1dd0', '', '2'),
(876, 'Nikki McCloud', '516f5985-e5da-4d1f-898d-6ad8bc31671b', '', '2'),
(877, 'Eliezer Pinson Stellar Public Adjusting', '8f219899-709e-4c37-83f3-06bfa7bb381d', '', '2'),
(878, 'Mold Expert- sign', '22fb0fd8-0032-410c-ab23-9eceec782466', '', '2'),
(879, ' ', 'd3c7f0b2-768f-4c00-bb83-7c6ddabed61b', '', '2'),
(880, 'Nidal Dry Pro Restoration', '3bedfb72-c321-419c-8c6b-0dd690fd8e65', '', '2'),
(881, 'Blue Star', '6e57c097-d3f0-4583-ab1d-c53a6eea2a19', '', '2'),
(882, 'Jesus Gonzalez AdvantaClean Miami', 'e8467d6b-62e1-4d3a-a560-3891f7985aec', '', '2'),
(883, 'Aj Fulton', 'b7101002-e6bd-4825-a360-05cd9347a2ed', '', '2'),
(884, 'Mariela Calderin', 'ef10926e-6630-402f-9b42-9a256fd7d2ba', '', '2'),
(885, 'Jason- Noah Restoration', 'ce3a692c-d61d-4f77-bed5-26e19211cb4b', '', '2'),
(886, 'Barbara Rodriguez', '31c532c6-ed5b-4251-89dc-d40acb436892', '', '2'),
(887, 'Ultracontractors', '3aafea5e-48be-4f8d-aca1-5b761ee028d0', '', '2'),
(888, 'Ingrid Bryant', '93d8a3e6-0bd6-439c-9331-d7701e857204', '', '2'),
(889, 'Restore All', 'd631b655-ab9e-44bb-a5dd-12e32b1b2f55', '', '2'),
(890, 'Donald  Brodsky', '0084ec94-006c-407e-996d-9ac50b73ec3c', '', '2'),
(891, 'Nikki McCloud', '516f5985-e5da-4d1f-898d-6ad8bc31671b', '', '2'),
(892, 'Alex Gurevich', '14dcd5d8-2f75-453e-bd59-fdd0c952e09e', '', '2'),
(893, 'Mold Expert- sign', '22fb0fd8-0032-410c-ab23-9eceec782466', '', '2'),
(894, 'Michael Adkins', 'a2e00f44-1605-45ab-b70c-192370c000a1', '', '2'),
(895, 'Nidal Dry Pro Restoration', '3bedfb72-c321-419c-8c6b-0dd690fd8e65', '', '2'),
(896, 'Nancy Dominguez', 'ee6d174e-f5ca-4463-b34c-0de19825b059', '', '2'),
(897, 'Jesus Gonzalez AdvantaClean Miami', 'e8467d6b-62e1-4d3a-a560-3891f7985aec', '', '2'),
(898, 'Michael Scotto Flash Restoration', '37145e8a-5618-49c5-9d8d-f2e8d5ef6270', '', '2'),
(899, 'Mariela Calderin', 'ef10926e-6630-402f-9b42-9a256fd7d2ba', '', '2'),
(900, 'Ivania Siares Stellar Public Adjusting', '5c92fcdd-7b7c-4de6-8dd2-83a3bf773c46', '', '2'),
(901, 'Barbara Rodriguez', '31c532c6-ed5b-4251-89dc-d40acb436892', '', '2'),
(902, 'Grace Blanco -Stellar PA', '0f195f0d-6b0a-4fdb-9b9c-0a701c861ff3', '', '2'),
(903, 'Ingrid Bryant', '93d8a3e6-0bd6-439c-9331-d7701e857204', '', '2'),
(904, 'Eric Faust', 'bd55e295-7ed3-4472-9efd-6f5dd7638698', '', '2'),
(905, 'Donald  Brodsky', '0084ec94-006c-407e-996d-9ac50b73ec3c', '', '2'),
(906, 'Sohan Seavcharran', 'ffdf3eb7-652b-4ea4-90a8-6c2f76e0957c', '', '2'),
(907, 'Alex Gurevich', '14dcd5d8-2f75-453e-bd59-fdd0c952e09e', '', '2'),
(908, 'Ely Chang', '14cf01b5-a205-490c-808e-a4ab76a871ba', '', '2'),
(909, 'Michael Adkins', 'a2e00f44-1605-45ab-b70c-192370c000a1', '', '2'),
(910, 'Joana Stellar PA ', '2a82f899-bf68-4c27-afce-daf5282b5345', '', '2'),
(911, 'Elena Stellar ', 'ef776caa-c865-49ae-aa1e-da60aba6520a', '', '2'),
(912, 'Nancy Dominguez', 'ee6d174e-f5ca-4463-b34c-0de19825b059', '', '2'),
(913, 'Stephen  Lippy', '1ade21ff-1452-4552-a9ee-92ba30fa4780', '', '2'),
(914, 'Michael Scotto Flash Restoration', '37145e8a-5618-49c5-9d8d-f2e8d5ef6270', '', '2'),
(915, 'Ivania Siares Stellar Public Adjusting', '5c92fcdd-7b7c-4de6-8dd2-83a3bf773c46', '', '2'),
(916, 'Alex Bauer', '446a0c55-995e-4dd2-8c19-99662d11064b', '', '2'),
(917, 'Grace Blanco -Stellar PA', '0f195f0d-6b0a-4fdb-9b9c-0a701c861ff3', '', '2'),
(918, 'Santos Garcia', '31dbe2ed-510b-4321-ae97-7686944ea507', '', '2'),
(919, 'Eric Faust', 'bd55e295-7ed3-4472-9efd-6f5dd7638698', '', '2'),
(920, 'Russ  Lazega', '3e72eb99-00b2-4a1d-8abf-ebac9568fb44', '', '2'),
(921, 'Sohan Seavcharran', 'ffdf3eb7-652b-4ea4-90a8-6c2f76e0957c', '', '2'),
(922, 'Howard- FL Best PA ', '260ec904-ef96-4778-8fb8-7f848cf174c5', '', '2'),
(923, 'Ely Chang', '14cf01b5-a205-490c-808e-a4ab76a871ba', '', '2'),
(924, 'Barrington Guthrie', 'f6213ee9-2357-4bcb-932e-845e787bfb1b', '', '2'),
(925, 'Joana Stellar PA ', '2a82f899-bf68-4c27-afce-daf5282b5345', '', '2'),
(926, 'Dale Jackway', '1d2a1629-c543-40e8-b19b-90021a9637f5', '', '2'),
(927, 'Elena Stellar ', 'ef776caa-c865-49ae-aa1e-da60aba6520a', '', '2'),
(928, ' Ultimate Restoration ', 'cf3defea-7fc1-4386-9dd5-76a41647bcc8', '', '2'),
(929, 'Stephen  Lippy', '1ade21ff-1452-4552-a9ee-92ba30fa4780', '', '2'),
(930, 'THUMBTACK LEAD ', '6b2ecd84-57ed-4060-acb4-248a9fcea125', '', '2'),
(931, 'Alex Bauer', '446a0c55-995e-4dd2-8c19-99662d11064b', '', '2'),
(932, 'Alex  Bauer', '493e5dd9-180a-4b94-a4d9-b877823b5bc3', '', '2'),
(933, 'Santos Garcia', '31dbe2ed-510b-4321-ae97-7686944ea507', '', '2'),
(934, 'Scott  Stan', '450cd750-e27e-4a0c-9978-f6a428ce1e2a', '', '2'),
(935, 'Russ  Lazega', '3e72eb99-00b2-4a1d-8abf-ebac9568fb44', '', '2'),
(936, 'Anthony Tinelli', 'b7973134-eeb3-4814-8726-390e2916a376', '', '2'),
(937, 'Howard- FL Best PA ', '260ec904-ef96-4778-8fb8-7f848cf174c5', '', '2'),
(938, 'Karen Mooneeran', '62adf7ef-f615-4f55-b624-193d497339e3', '', '2'),
(939, 'Barrington Guthrie', 'f6213ee9-2357-4bcb-932e-845e787bfb1b', '', '2'),
(940, 'Dale Jackway', '1d2a1629-c543-40e8-b19b-90021a9637f5', '', '2'),
(941, 'Michael Kaplan', '0a7e6fc7-1e12-40f5-9a6a-32daccb89d1a', '', '2'),
(942, ' Ultimate Restoration ', 'cf3defea-7fc1-4386-9dd5-76a41647bcc8', '', '2'),
(943, 'Carlos  Santi', '10019b77-6e2f-4918-9f15-de9ded7f9e51', '', '2'),
(944, 'Rafael Viego III', '8edb1ccd-ad60-4ffe-8a1d-c7e0ad323441', '', '2'),
(945, 'THUMBTACK LEAD ', '6b2ecd84-57ed-4060-acb4-248a9fcea125', '', '2'),
(946, 'Jason Scarberry', 'd5eaea9a-e68a-4dce-9823-e8706e1f6a12', '', '2'),
(947, 'Alex  Bauer', '493e5dd9-180a-4b94-a4d9-b877823b5bc3', '', '2'),
(948, 'Scott  Stan', '450cd750-e27e-4a0c-9978-f6a428ce1e2a', '', '2'),
(949, 'Daniel Lopez', '4901ccd3-9736-44b4-95a0-66a038a4b722', '', '2'),
(950, 'Anthony Tinelli', 'b7973134-eeb3-4814-8726-390e2916a376', '', '2'),
(951, 'Clayton Khun', '6496b5ce-bde6-4f1f-8e6a-3097dc87d360', '', '2'),
(952, 'Karen Mooneeran', '62adf7ef-f615-4f55-b624-193d497339e3', '', '2'),
(953, 'Scott Klotzman', 'd59644fb-264c-4bbb-9b47-d147da9f9e2c', '', '2'),
(954, 'Michael Kaplan', '0a7e6fc7-1e12-40f5-9a6a-32daccb89d1a', '', '2'),
(955, 'Aaron Singer Bulldog Adjusters', '54d18edb-8844-45d6-b153-3b939e217892', '', '2'),
(956, 'Carlos  Santi', '10019b77-6e2f-4918-9f15-de9ded7f9e51', '', '2'),
(957, 'Chris Schirmer', '1942280f-3b04-4836-9c68-55cb1d06d00b', '', '2'),
(958, 'Rafael Viego III', '8edb1ccd-ad60-4ffe-8a1d-c7e0ad323441', '', '2'),
(959, 'Shermeka McSwain', 'cf34ca0a-8ba3-4133-be67-09df7b477a37', '', '2'),
(960, 'Veve Stellar Adjusting', '3cf8c1b6-79dc-4a70-819f-f71147c3e570', '', '2'),
(961, 'Jason Scarberry', 'd5eaea9a-e68a-4dce-9823-e8706e1f6a12', '', '2'),
(962, 'Wendy Gonzalez- Stellar Adjusting', '449ca17e-e0e0-415f-99fc-c07a4e9ed153', '', '2'),
(963, 'Daniel Lopez', '4901ccd3-9736-44b4-95a0-66a038a4b722', '', '2'),
(964, 'Alfredo Arnesen', 'f37d1d0d-ce9f-4c36-ba65-06cbb0bcf8bb', '', '2'),
(965, 'Clayton Khun', '6496b5ce-bde6-4f1f-8e6a-3097dc87d360', '', '2'),
(966, 'James Cox', '30daef21-ad04-441f-aec0-df81f31a44bd', '', '2'),
(967, 'Scott Klotzman', 'd59644fb-264c-4bbb-9b47-d147da9f9e2c', '', '2'),
(968, 'Restoration Giant ', 'a41ee0b1-9162-476b-a763-f1a3a230f1af', '', '2'),
(969, 'Aaron Singer Bulldog Adjusters', '54d18edb-8844-45d6-b153-3b939e217892', '', '2'),
(970, 'Shane McElroy', 'cd2b3973-0b41-463e-bbec-4ab664a01ce7', '', '2'),
(971, 'Chris Schirmer', '1942280f-3b04-4836-9c68-55cb1d06d00b', '', '2'),
(972, 'Tracey Foglia, Esq', 'be330295-17cf-4836-87c8-5a77015a4d1f', '', '2'),
(973, 'Shermeka McSwain', 'cf34ca0a-8ba3-4133-be67-09df7b477a37', '', '2'),
(974, 'Ed Acle', '3de199ff-d48d-4c08-acbc-407548d1dd48', '', '2'),
(975, 'Veve Stellar Adjusting', '3cf8c1b6-79dc-4a70-819f-f71147c3e570', '', '2'),
(976, 'Bobby Nuñez', '83812caf-d5d5-4e19-9e2e-2ed2d349f5be', '', '2'),
(977, 'Wendy Gonzalez- Stellar Adjusting', '449ca17e-e0e0-415f-99fc-c07a4e9ed153', '', '2'),
(978, 'Alfredo Arnesen', 'f37d1d0d-ce9f-4c36-ba65-06cbb0bcf8bb', '', '2'),
(979, 'Mark Heramb', '83a8e0e7-28da-4c55-b3f5-785fc9b3f144', '', '2'),
(980, 'James Cox', '30daef21-ad04-441f-aec0-df81f31a44bd', '', '2'),
(981, 'Enrique Villamar', '7fb31b09-e521-4021-89e5-145ef4bfbc23', '', '2'),
(982, 'Restoration Giant ', 'a41ee0b1-9162-476b-a763-f1a3a230f1af', '', '2'),
(983, 'Gimenez & Carrillo Attorneys at Law', 'eb0a9fdd-7c33-4827-a2c7-09d15ddb52f1', '', '2'),
(984, 'Shane McElroy', 'cd2b3973-0b41-463e-bbec-4ab664a01ce7', '', '2'),
(985, 'Stuart Hymson', 'b81117eb-bb33-461b-ad69-cfce547f8529', '', '2'),
(986, 'Jess Ortega', 'cedbbfd6-fbea-4a34-a6c7-c2ada7bafae9', '', '2'),
(987, 'Tracey Foglia, Esq', 'be330295-17cf-4836-87c8-5a77015a4d1f', '', '2'),
(988, 'Ed Acle', '3de199ff-d48d-4c08-acbc-407548d1dd48', '', '2'),
(989, 'Ryan Risteen', 'f00f3d09-6f4c-4078-b13d-a6a2f9717fd1', '', '2'),
(990, 'Bobby Nuñez', '83812caf-d5d5-4e19-9e2e-2ed2d349f5be', '', '2'),
(991, 'Ronda Coren', '658ddd84-d9e1-4680-a72d-48efa1a530c7', '', '2'),
(992, 'Mark Heramb', '83a8e0e7-28da-4c55-b3f5-785fc9b3f144', '', '2'),
(993, 'Ashlee Tapia', '74e0c373-6de9-4061-a626-ec44b216cb7d', '', '2'),
(994, 'Enrique Villamar', '7fb31b09-e521-4021-89e5-145ef4bfbc23', '', '2'),
(995, 'Florida Professional Law Group Tracy Foglia', '0d1a578f-2fb2-40f0-9595-73d8298c1922', '', '2'),
(996, 'Gimenez & Carrillo Attorneys at Law', 'eb0a9fdd-7c33-4827-a2c7-09d15ddb52f1', '', '2'),
(997, 'Peter Xydes - ABC', '1fc68509-15f9-4e70-9063-3bb3da2b30e7', '', '2'),
(998, 'Stuart Hymson', 'b81117eb-bb33-461b-ad69-cfce547f8529', '', '2'),
(999, 'Healthy  Homes', '08de98b2-cefd-4094-b75f-ad8abff13004', '', '2'),
(1000, 'Jess Ortega', 'cedbbfd6-fbea-4a34-a6c7-c2ada7bafae9', '', '2'),
(1001, 'Max Claim Consultant ', 'a1e68a6c-6836-4506-9c40-244ac60f3869', '', '2'),
(1002, 'Ryan Risteen', 'f00f3d09-6f4c-4078-b13d-a6a2f9717fd1', '', '2'),
(1003, 'Marty ', '1ed371dd-8e3d-4812-834b-3c2579bac65f', '', '2'),
(1004, 'Ronda Coren', '658ddd84-d9e1-4680-a72d-48efa1a530c7', '', '2'),
(1005, 'Steven Musgrave', '6e6d2b0b-3767-4bbf-b73b-1cc9e4eb45c9', '', '2'),
(1006, 'Ashlee Tapia', '74e0c373-6de9-4061-a626-ec44b216cb7d', '', '2'),
(1007, 'Rhonda Coren- FL Professional law group', '3ad30afd-d426-43a6-ba2d-6b94593a5154', '', '2'),
(1008, 'Florida Professional Law Group Tracy Foglia', '0d1a578f-2fb2-40f0-9595-73d8298c1922', '', '2'),
(1009, 'Luis Carrillo', '7021f4a3-1159-4d4b-aec6-a74e8dc6ddfb', '', '2'),
(1010, 'Peter Xydes - ABC', '1fc68509-15f9-4e70-9063-3bb3da2b30e7', '', '2'),
(1011, 'Miguel Planas- Cardenas Law Group', 'e254617d-0f3c-4e26-8d2b-112a4cca2d64', '', '2'),
(1012, 'Healthy  Homes', '08de98b2-cefd-4094-b75f-ad8abff13004', '', '2'),
(1013, 'Sebastian Fuetes', '9bd273fa-e0c1-450c-a963-0a550a8c83a6', '', '2'),
(1014, 'Max Claim Consultant ', 'a1e68a6c-6836-4506-9c40-244ac60f3869', '', '2'),
(1015, 'William Sans', '06d9fa7a-9fa2-4dec-a1ec-0ed00857bf4e', '', '2'),
(1016, 'Marty ', '1ed371dd-8e3d-4812-834b-3c2579bac65f', '', '2'),
(1017, ' ', '57ae303c-09c9-4178-b312-2e2a53173b0e', '', '2'),
(1018, 'Steven Musgrave', '6e6d2b0b-3767-4bbf-b73b-1cc9e4eb45c9', '', '2'),
(1019, 'Eric Yeager- Trouble in Paradise', '1744d361-36aa-40a8-82c4-653d526c2da4', '', '2'),
(1020, 'Rhonda Coren- FL Professional law group', '3ad30afd-d426-43a6-ba2d-6b94593a5154', '', '2'),
(1021, 'Lena  Ingram- Realtor', '9af25979-8eb2-4e3e-b4ef-ad59587d0ee8', '', '2'),
(1022, 'Luis Carrillo', '7021f4a3-1159-4d4b-aec6-a74e8dc6ddfb', '', '2'),
(1023, 'Arthur Camayd', '7228bce8-3693-4386-bcf6-70dc4559c96a', '', '2'),
(1024, 'Miguel Planas- Cardenas Law Group', 'e254617d-0f3c-4e26-8d2b-112a4cca2d64', '', '2'),
(1025, 'Leonardo Rabathaly', 'e33a6fa0-ee58-44c6-8e84-f4c1286c8cee', '', '2'),
(1026, 'Sebastian Fuetes', '9bd273fa-e0c1-450c-a963-0a550a8c83a6', '', '2'),
(1027, 'Isabel  Guerra', '6970c8e6-2b97-46b1-9c41-ead32d359819', '', '2'),
(1028, 'William Sans', '06d9fa7a-9fa2-4dec-a1ec-0ed00857bf4e', '', '2'),
(1029, 'Tammy Lora', 'd36e2354-7009-4d1b-9c48-6c0bfe3e55af', '', '2'),
(1030, ' ', '57ae303c-09c9-4178-b312-2e2a53173b0e', '', '2'),
(1031, 'Michael McCahill- Attny', 'caff69f2-1377-4670-84d5-31e7e2e6f613', '', '2'),
(1032, 'Eric Yeager- Trouble in Paradise', '1744d361-36aa-40a8-82c4-653d526c2da4', '', '2'),
(1033, 'Marcus Louis- Stellar', '07b2235a-3376-46fb-87b7-0386f545a4a8', '', '2'),
(1034, 'Lena  Ingram- Realtor', '9af25979-8eb2-4e3e-b4ef-ad59587d0ee8', '', '2'),
(1035, 'MoldExpert Free Inspection ', '0e103f02-4d47-4e73-8fb8-982eed489265', '', '2'),
(1036, 'Arthur Camayd', '7228bce8-3693-4386-bcf6-70dc4559c96a', '', '2'),
(1037, 'Rae Wurster', '67072d30-0a46-4860-8401-505e489366c6', '', '2'),
(1038, 'Leonardo Rabathaly', 'e33a6fa0-ee58-44c6-8e84-f4c1286c8cee', '', '2'),
(1039, 'Leonardo Tri County Restoration', 'b26d8e31-2043-4a3a-91e3-e8ab793b1d1b', '', '2'),
(1040, 'Isabel  Guerra', '6970c8e6-2b97-46b1-9c41-ead32d359819', '', '2'),
(1041, 'Facebook Leads ', 'd7efdbed-8e8c-419a-8fde-f5ac3a56db4f', '', '2'),
(1042, 'Tammy Lora', 'd36e2354-7009-4d1b-9c48-6c0bfe3e55af', '', '2'),
(1043, 'Mieno Salcedo Law ', 'c7e8e600-e349-4893-82db-8d358fe78358', '', '2'),
(1044, 'Michael McCahill- Attny', 'caff69f2-1377-4670-84d5-31e7e2e6f613', '', '2'),
(1045, 'Leonardo Tri County Restoration', '7110f9a9-c306-4fe8-8578-bf9e064bbce0', '', '2'),
(1046, 'Marcus Louis- Stellar', '07b2235a-3376-46fb-87b7-0386f545a4a8', '', '2'),
(1047, 'Mineo Salcedo Law Firm ', '7c1ce4a5-0fdd-4a8a-83b9-b246eb6b721a', '', '2'),
(1048, 'MoldExpert Free Inspection ', '0e103f02-4d47-4e73-8fb8-982eed489265', '', '2'),
(1049, 'Rae Wurster', '67072d30-0a46-4860-8401-505e489366c6', '', '2'),
(1050, 'Yasiel Ramirez- Floridan International Adjustiers', '209ff5cb-f9d1-4b3d-a575-a5e0f5e70c55', '', '2'),
(1051, 'Leonardo Tri County Restoration', 'b26d8e31-2043-4a3a-91e3-e8ab793b1d1b', '', '2'),
(1052, 'Nicole Santisteban', '17cb3b6c-b5c3-4e6b-becf-1700c44b62fb', '', '2'),
(1053, 'Ruben Calas', '3da9ecf3-5236-489e-9237-b853ed5b5bdd', '', '2'),
(1054, 'Facebook Leads ', 'd7efdbed-8e8c-419a-8fde-f5ac3a56db4f', '', '2'),
(1055, 'Hugo  Hernandez- H&M Construction', '9e7cc27c-de33-46de-aea5-7d78a0dc31de', '', '2'),
(1056, 'Mieno Salcedo Law ', 'c7e8e600-e349-4893-82db-8d358fe78358', '', '2'),
(1057, 'Vince- Bulldog Adjusters ', '208b9427-90e2-45cd-9079-99d4dd8048cb', '', '2'),
(1058, 'Leonardo Tri County Restoration', '7110f9a9-c306-4fe8-8578-bf9e064bbce0', '', '2'),
(1059, 'Asia ', '05002bcb-b3f8-41a0-8ac9-33f5d57ed751', '', '2'),
(1060, 'Mineo Salcedo Law Firm ', '7c1ce4a5-0fdd-4a8a-83b9-b246eb6b721a', '', '2'),
(1061, 'Anthony  Lopez- Attorney', 'a2fe19ed-3866-46b1-bb7a-e6e89a52a36e', '', '2'),
(1062, 'Yasiel Ramirez- Floridan International Adjustiers', '209ff5cb-f9d1-4b3d-a575-a5e0f5e70c55', '', '2'),
(1063, 'John Parker- Florida Professional Law Group', 'e7a3256a-1185-44a2-84e0-2a35b221c1bf', '', '2'),
(1064, 'Nicole Santisteban', '17cb3b6c-b5c3-4e6b-becf-1700c44b62fb', '', '2'),
(1065, 'Aaron ', '5b00c7fc-e91a-4f16-ae7a-cb51d033dcab', '', '2'),
(1066, 'Ruben Calas', '3da9ecf3-5236-489e-9237-b853ed5b5bdd', '', '2'),
(1067, 'Edo- Bulldog Adjusters ', 'ac0b8130-9116-4ead-a1b0-87b60fceeb10', '', '2'),
(1068, 'Hugo  Hernandez- H&M Construction', '9e7cc27c-de33-46de-aea5-7d78a0dc31de', '', '2'),
(1069, 'Anthony Lopez', '051d20b2-14f3-4fc9-ac82-5ebb341586d6', '', '2'),
(1070, 'Vince- Bulldog Adjusters ', '208b9427-90e2-45cd-9079-99d4dd8048cb', '', '2'),
(1071, 'Mark  Murphy', '1ff67d21-96e9-40a8-ab7a-1580f1631a8e', '', '2'),
(1072, 'Asia ', '05002bcb-b3f8-41a0-8ac9-33f5d57ed751', '', '2'),
(1073, 'Jacqueline  De Moya- Attorney', '685a45eb-0365-4d77-96ce-ff9f83545d72', '', '2'),
(1074, 'Anthony  Lopez- Attorney', 'a2fe19ed-3866-46b1-bb7a-e6e89a52a36e', '', '2'),
(1075, 'Jose Guevara', '0a0a3c54-428d-41e3-ac94-870d63662bbc', '', '2'),
(1076, 'John Parker- Florida Professional Law Group', 'e7a3256a-1185-44a2-84e0-2a35b221c1bf', '', '2'),
(1077, 'Joe Puentes- Mold Expert', 'ec191a06-0d80-45f1-810b-da55e9f2f2a2', '', '2'),
(1078, 'Aaron ', '5b00c7fc-e91a-4f16-ae7a-cb51d033dcab', '', '2'),
(1079, 'Eddie Cantelar', 'cc0c6dde-15a2-45bb-9c3c-0502eb8c1c95', '', '2'),
(1080, 'Edo- Bulldog Adjusters ', 'ac0b8130-9116-4ead-a1b0-87b60fceeb10', '', '2'),
(1081, 'Mold Tent ', 'ad548cc0-cbec-45cf-b2e7-387101b25bdb', '', '2'),
(1082, 'Anthony Lopez', '051d20b2-14f3-4fc9-ac82-5ebb341586d6', '', '2'),
(1083, ' ', 'fa3e967c-c3b7-4850-8075-3df6e5ccda63', '', '2'),
(1084, 'Mark  Murphy', '1ff67d21-96e9-40a8-ab7a-1580f1631a8e', '', '2'),
(1085, 'Eduardo Morales', 'c7794bcb-4f8a-4c11-a6ee-f15831f26ec6', '', '2'),
(1086, 'Jacqueline  De Moya- Attorney', '685a45eb-0365-4d77-96ce-ff9f83545d72', '', '2'),
(1087, 'Larry Mascowitz', '11a547b1-7feb-4ffe-ae92-affe2e8d283c', '', '2'),
(1088, 'Jose Guevara', '0a0a3c54-428d-41e3-ac94-870d63662bbc', '', '2'),
(1089, 'UNIVISION ', '0abc852e-bfbb-4387-b752-70d2dc873186', '', '2'),
(1090, 'Joe Puentes- Mold Expert', 'ec191a06-0d80-45f1-810b-da55e9f2f2a2', '', '2'),
(1091, 'Neal Moskowitz- attorney', '5d4defd0-3c60-4b01-857f-6c52b8442b63', '', '2'),
(1092, 'Waldo ', '391da473-4f2f-4d0f-ad68-2f5f84c38c84', '', '2'),
(1093, 'Eddie Cantelar', 'cc0c6dde-15a2-45bb-9c3c-0502eb8c1c95', '', '2'),
(1094, 'Lauren Ruda', '74a31656-ec4e-4a36-ae89-e0a8c81237af', '', '2'),
(1095, 'Mold Tent ', 'ad548cc0-cbec-45cf-b2e7-387101b25bdb', '', '2'),
(1096, 'Tasha Fussell', '00b62e7e-d8ac-460a-bbeb-a3a971511607', '', '2'),
(1097, ' ', 'fa3e967c-c3b7-4850-8075-3df6e5ccda63', '', '2'),
(1098, 'Porscha March', '7b089d52-c6ef-43a5-8ec2-f801af55fe38', '', '2'),
(1099, 'Eduardo Morales', 'c7794bcb-4f8a-4c11-a6ee-f15831f26ec6', '', '2'),
(1100, 'Enrique Villamar', 'cfdb4999-fe8e-44f0-bd65-11798b326f4c', '', '2'),
(1101, 'Larry Mascowitz', '11a547b1-7feb-4ffe-ae92-affe2e8d283c', '', '2'),
(1102, 'Wendloyne Pichardo- Stellar', '485c7a4d-abf8-46e9-b16b-0afff5c6d94e', '', '2'),
(1103, 'UNIVISION ', '0abc852e-bfbb-4387-b752-70d2dc873186', '', '2'),
(1104, 'Neal Moskowitz- attorney', '5d4defd0-3c60-4b01-857f-6c52b8442b63', '', '2'),
(1105, 'Searched Online ', 'd19ebab7-20f6-4586-b73f-513fed5649e7', '', '2'),
(1106, 'Waldo ', '391da473-4f2f-4d0f-ad68-2f5f84c38c84', '', '2'),
(1107, 'Teresa Santana- Realtor', 'd4537361-30d0-4d19-9d86-2ca2d4cb04aa', '', '2'),
(1108, 'Spencer Weinreb- Stellar', '17c6344d-793f-4191-b2d9-59392131ec16', '', '2'),
(1109, 'Lauren Ruda', '74a31656-ec4e-4a36-ae89-e0a8c81237af', '', '2'),
(1110, 'Jimmy Farach', '728bb1e7-3641-4917-8e9a-97d0692ef6f6', '', '2'),
(1111, 'Tasha Fussell', '00b62e7e-d8ac-460a-bbeb-a3a971511607', '', '2'),
(1112, 'Myrna Ocasio', 'ec0455f2-0154-4f09-a19e-df0584d9f400', '', '2'),
(1113, 'Porscha March', '7b089d52-c6ef-43a5-8ec2-f801af55fe38', '', '2'),
(1114, 'Steven Lorenzo', '9e65cbdc-64ea-482e-8f1b-2a041ff25e05', '', '2'),
(1115, 'Enrique Villamar', 'cfdb4999-fe8e-44f0-bd65-11798b326f4c', '', '2'),
(1116, 'samriti chandel', '0323317b-40af-4983-88d8-f5f2b5c77c88', '', '2'),
(1117, 'Wendloyne Pichardo- Stellar', '485c7a4d-abf8-46e9-b16b-0afff5c6d94e', '', '2'),
(1118, 'Nefer  Londono- Previous client', 'cac30f4c-9eff-4771-876b-f899938754e3', '', '2'),
(1119, 'Searched Online ', 'd19ebab7-20f6-4586-b73f-513fed5649e7', '', '2'),
(1120, 'David  Strabbing- Restoration one', '70e128bd-5937-4eba-bd9c-eb8af1b1e33c', '', '2'),
(1121, 'Teresa Santana- Realtor', 'd4537361-30d0-4d19-9d86-2ca2d4cb04aa', '', '2'),
(1122, 'Lisandra Castillo', '18ed9e21-64df-4cae-b639-f34cef3d5379', '', '2'),
(1123, 'Spencer Weinreb- Stellar', '17c6344d-793f-4191-b2d9-59392131ec16', '', '2'),
(1124, 'Tierra Davis', 'a4a81635-c5ef-4938-96a2-2f0faaf5bb78', '', '2'),
(1125, 'Jimmy Farach', '728bb1e7-3641-4917-8e9a-97d0692ef6f6', '', '2'),
(1126, 'Toni Parchment', '4a904f50-e083-46ed-b329-002a515eb49e', '', '2'),
(1127, 'Myrna Ocasio', 'ec0455f2-0154-4f09-a19e-df0584d9f400', '', '2'),
(1128, 'Renee Rieichanadter', '740fbdca-55b1-4999-b2ac-e9c3c9ecf91e', '', '2'),
(1129, 'Steven Lorenzo', '9e65cbdc-64ea-482e-8f1b-2a041ff25e05', '', '2'),
(1130, 'Vladimir Denyuk', 'a600a343-6035-4e80-a605-8d00ccde8a99', '', '2'),
(1131, 'samriti chandel', '0323317b-40af-4983-88d8-f5f2b5c77c88', '', '2'),
(1132, 'buyer ', '100c5067-d605-4e80-9af5-d1a2d5fee258', '', '2'),
(1133, 'Nefer  Londono- Previous client', 'cac30f4c-9eff-4771-876b-f899938754e3', '', '2'),
(1134, 'Jason  Pyle', 'd0d6b019-b3eb-4a4b-8634-e5bca570688d', '', '2'),
(1135, 'David  Strabbing- Restoration one', '70e128bd-5937-4eba-bd9c-eb8af1b1e33c', '', '2'),
(1136, 'Yemil Aragon', 'd6a0746b-5700-400b-af45-2f7e6f8a0f7f', '', '2'),
(1137, 'Lisandra Castillo', '18ed9e21-64df-4cae-b639-f34cef3d5379', '', '2'),
(1138, 'Serge G', '526001f7-54b7-4837-9852-8871cf4f136b', '', '2'),
(1139, 'Tierra Davis', 'a4a81635-c5ef-4938-96a2-2f0faaf5bb78', '', '2'),
(1140, 'Mark  Murphy', '466040a5-d910-4ea6-94f0-ba0394b61162', '', '2'),
(1141, 'Toni Parchment', '4a904f50-e083-46ed-b329-002a515eb49e', '', '2'),
(1142, 'Greys Del Rio ', '7bf2802e-ca9c-466c-9e49-45d58c8033ce', '', '2'),
(1143, 'Renee Rieichanadter', '740fbdca-55b1-4999-b2ac-e9c3c9ecf91e', '', '2'),
(1144, 'David Graham Insurance', 'b547d6b4-e351-4f36-ad7d-5148163d3321', '', '2'),
(1145, 'Vladimir Denyuk', 'a600a343-6035-4e80-a605-8d00ccde8a99', '', '2'),
(1146, 'Jay Arnesen  Webb ', '56293259-46d2-4202-aef1-063955806588', '', '2'),
(1147, 'buyer ', '100c5067-d605-4e80-9af5-d1a2d5fee258', '', '2'),
(1148, 'Amanda Sanchez Bulldog', '065901d3-83df-4413-b69e-8af297de0e5b', '', '2'),
(1149, 'Jason  Pyle', 'd0d6b019-b3eb-4a4b-8634-e5bca570688d', '', '2'),
(1150, 'ENT school Teacher', '865ef9e5-3040-47ee-8df1-fcd9d7550e9a', '', '2'),
(1151, 'Yemil Aragon', 'd6a0746b-5700-400b-af45-2f7e6f8a0f7f', '', '2'),
(1152, 'Serge G', '526001f7-54b7-4837-9852-8871cf4f136b', '', '2'),
(1153, 'Pierre Louis, Esq', '40cdc0b9-d6f6-4100-a2e4-f8f1dbeac952', '', '2'),
(1154, 'Rob Peregonza law', 'bfc6f7cd-7a26-4880-8f6b-314e955d72e8', '', '2'),
(1155, 'Mark  Murphy', '466040a5-d910-4ea6-94f0-ba0394b61162', '', '2'),
(1156, 'Greys Del Rio ', '7bf2802e-ca9c-466c-9e49-45d58c8033ce', '', '2'),
(1157, 'Vincent DeCicco', '648b1cd3-3c52-4e33-81c6-de8cb5a3c1ce', '', '2'),
(1158, 'David Graham Insurance', 'b547d6b4-e351-4f36-ad7d-5148163d3321', '', '2'),
(1159, 'Deluge  Doctors restoration', 'db5e161c-a84f-4fc1-8b82-bde9923945bf', '', '2'),
(1160, 'Jay Arnesen  Webb ', '56293259-46d2-4202-aef1-063955806588', '', '2'),
(1161, 'Carlos  Aguilera', '37ff3cc4-4aba-4592-8a8a-ca584256994c', '', '2'),
(1162, 'Amanda Sanchez Bulldog', '065901d3-83df-4413-b69e-8af297de0e5b', '', '2'),
(1163, 'Villamar  MacDonald', '41f3f588-c55f-4a3c-a6d8-f2c8f938e307', '', '2'),
(1164, 'ENT school Teacher', '865ef9e5-3040-47ee-8df1-fcd9d7550e9a', '', '2'),
(1165, 'Matthew  Vanderford', 'fddd792f-e8bd-4bd0-b318-7ef607a3a424', '', '2'),
(1166, 'Pierre Louis, Esq', '40cdc0b9-d6f6-4100-a2e4-f8f1dbeac952', '', '2'),
(1167, 'Ryan Sherman', '897f5fde-a80b-48dd-8ae8-c12b4afecf8f', '', '2'),
(1168, 'Rob Peregonza law', 'bfc6f7cd-7a26-4880-8f6b-314e955d72e8', '', '2'),
(1169, 'Vincent DeCicco', '649989ea-0915-433b-92d9-035cc5efde9a', '', '2'),
(1170, 'Vincent DeCicco', '648b1cd3-3c52-4e33-81c6-de8cb5a3c1ce', '', '2'),
(1171, 'Matthew Vanderford', '705e8449-5843-40a1-b36c-4f293f1cab4e', '', '2'),
(1172, 'Cary Acevedo', '1e0aeee5-4b22-4c9b-a841-1b9827961f62', '', '2'),
(1173, 'Deluge  Doctors restoration', 'db5e161c-a84f-4fc1-8b82-bde9923945bf', '', '2'),
(1174, 'Andy Baker', '3ad14cdf-c9f4-41df-b919-deff38171f0a', '', '2'),
(1175, 'Carlos  Aguilera', '37ff3cc4-4aba-4592-8a8a-ca584256994c', '', '2'),
(1176, 'Jim O\'Reilly', '2fe0c86e-0929-43a9-915d-d1e5260aa095', '', '2'),
(1177, 'Villamar  MacDonald', '41f3f588-c55f-4a3c-a6d8-f2c8f938e307', '', '2'),
(1178, 'Steven Lorenzo', '9da7efac-eda1-4293-af4e-c9692a1c8bd5', '', '2'),
(1179, 'Matthew  Vanderford', 'fddd792f-e8bd-4bd0-b318-7ef607a3a424', '', '2'),
(1180, 'Ryan Sherman', '897f5fde-a80b-48dd-8ae8-c12b4afecf8f', '', '2'),
(1181, 'John Nunez', '18ae75bd-76d7-4d01-8ad6-75ca56815e36', '', '2'),
(1182, 'Christopher  Smith', '46123484-15e9-45cd-bdde-525017685695', '', '2'),
(1183, 'Vincent DeCicco', '649989ea-0915-433b-92d9-035cc5efde9a', '', '2'),
(1184, 'alex Cordoba', '3a5d7328-b152-474a-9559-bdc65fbcb922', '', '2'),
(1185, 'Matthew Vanderford', '705e8449-5843-40a1-b36c-4f293f1cab4e', '', '2'),
(1186, 'Jay Ultimate Restoration ', '88c7b613-f62c-49b6-8afc-9b40899849ee', '', '2'),
(1187, 'Cary Acevedo', '1e0aeee5-4b22-4c9b-a841-1b9827961f62', '', '2'),
(1188, 'Romy Valdespino', '6e249343-6b18-4e83-ab32-42a7c07e2f55', '', '2'),
(1189, 'Andy Baker', '3ad14cdf-c9f4-41df-b919-deff38171f0a', '', '2'),
(1190, 'Christina Zanakos', 'b907bf05-7b60-4ce3-9b1b-4ee27b1276f8', '', '2'),
(1191, 'Jim O\'Reilly', '2fe0c86e-0929-43a9-915d-d1e5260aa095', '', '2'),
(1192, 'Deanna  Rivera', 'f8bf0680-43c4-4eec-b62d-259753f2c9d2', '', '2'),
(1193, 'Steven Lorenzo', '9da7efac-eda1-4293-af4e-c9692a1c8bd5', '', '2'),
(1194, 'Jade Jack', '569298f9-8776-47d3-a419-ba069626b188', '', '2'),
(1195, 'John Nunez', '18ae75bd-76d7-4d01-8ad6-75ca56815e36', '', '2'),
(1196, '(Reggie) South Florida Water Restoration', '35ad1236-5aa4-4386-86e1-3613fb3beccd', '', '2'),
(1197, 'Christopher  Smith', '46123484-15e9-45cd-bdde-525017685695', '', '2'),
(1198, 'Elizabeth Hernandez', '4a1829d9-f094-4b76-9437-d2168cf84b17', '', '2'),
(1199, 'alex Cordoba', '3a5d7328-b152-474a-9559-bdc65fbcb922', '', '2'),
(1200, 'National Water Restoration', 'f057a627-4f31-471e-bf44-73b178dfad6b', '', '2'),
(1201, 'Jay Ultimate Restoration ', '88c7b613-f62c-49b6-8afc-9b40899849ee', '', '2'),
(1202, 'Floridian International Adjusters', 'd28f9669-5e59-4626-ba3d-62682b876c51', '', '2'),
(1203, 'Romy Valdespino', '6e249343-6b18-4e83-ab32-42a7c07e2f55', '', '2'),
(1204, 'Gladys A Cardenas PA', '3b5f9ad4-0c6f-4848-946f-8e9c78183da5', '', '2'),
(1205, 'Christina Zanakos', 'b907bf05-7b60-4ce3-9b1b-4ee27b1276f8', '', '2'),
(1206, 'Waldo', '5e6c374d-9a96-465d-9481-275f1c0a8ec4', '', '2'),
(1207, 'Deanna  Rivera', 'f8bf0680-43c4-4eec-b62d-259753f2c9d2', '', '2'),
(1208, 'Dailenis Nunez', '4d72dcff-1f85-489f-85ae-5a8eeb0139c7', '', '2'),
(1209, 'Jade Jack', '569298f9-8776-47d3-a419-ba069626b188', '', '2'),
(1210, 'CLIENT CALLED ', '0aaa84fd-fbb0-4c3e-a70c-2cd038e93a13', '', '2'),
(1211, '(Reggie) South Florida Water Restoration', '35ad1236-5aa4-4386-86e1-3613fb3beccd', '', '2'),
(1212, 'Dianelis Nunez', 'a307f1c2-c1ef-4d25-aecb-47388e5245d4', '', '2'),
(1213, 'Elizabeth Hernandez', '4a1829d9-f094-4b76-9437-d2168cf84b17', '', '2'),
(1214, 'carlos  Garcia', '35c30c35-2ab9-49f9-8898-c93ea1aeecca', '', '2'),
(1215, 'National Water Restoration', 'f057a627-4f31-471e-bf44-73b178dfad6b', '', '2'),
(1216, 'Yomara  Morales', '3628a58c-9a5b-4d14-b9c3-e771218baf37', '', '2'),
(1217, 'Floridian International Adjusters', 'd28f9669-5e59-4626-ba3d-62682b876c51', '', '2'),
(1218, 'Scott Nebrasky ', '3d24bb73-13f7-48ca-80d5-d5f2bc91d0d5', '', '2'),
(1219, 'Gladys A Cardenas PA', '3b5f9ad4-0c6f-4848-946f-8e9c78183da5', '', '2'),
(1220, 'test referral source', '1a66bbad-de54-4437-acb9-25bda2139d9e', '', '2'),
(1221, 'Waldo', '5e6c374d-9a96-465d-9481-275f1c0a8ec4', '', '2'),
(1222, 'Test Referral', '6b4d0492-8c27-46db-bf11-499f9f699653', '', '2'),
(1223, 'Dailenis Nunez', '4d72dcff-1f85-489f-85ae-5a8eeb0139c7', '', '2'),
(1224, 'Melissa  Mare', '1f963ca8-0080-4cc9-93a3-5599cc3d870b', '', '2'),
(1225, 'CLIENT CALLED ', '0aaa84fd-fbb0-4c3e-a70c-2cd038e93a13', '', '2'),
(1226, 'ME-LEAD- Telesales (Primer ) ', 'a5df26e9-bbb9-4272-9916-777d3f4c861b', '', '2'),
(1227, 'Dianelis Nunez', 'a307f1c2-c1ef-4d25-aecb-47388e5245d4', '', '2'),
(1228, 'American Integrity ', 'd45e2307-d941-465f-8a95-726f8a2eb03f', '', '2'),
(1229, 'carlos  Garcia', '35c30c35-2ab9-49f9-8898-c93ea1aeecca', '', '2'),
(1230, 'Attorney Jhon  Called', '2f6d7391-9ed4-401d-a9ee-b0691c41ccad', '', '2'),
(1231, 'Yomara  Morales', '3628a58c-9a5b-4d14-b9c3-e771218baf37', '', '2'),
(1232, 'Osvaldo Yera', '58866c3c-b79a-4432-8afd-65beb0e4231b', '', '2'),
(1233, 'Scott Nebrasky ', '3d24bb73-13f7-48ca-80d5-d5f2bc91d0d5', '', '2'),
(1234, 'Friend saw Alex Car ', 'b6759eec-2065-46b3-8e2d-07b53a13489b', '', '2');
INSERT INTO `im_dropdowns` (`id`, `name`, `keys`, `dataType`, `type`) VALUES
(1235, 'test referral source', '1a66bbad-de54-4437-acb9-25bda2139d9e', '', '2'),
(1236, 'Eralda Handy Man  ', '6163fd0a-0a7f-4159-9781-83580b800c55', '', '2'),
(1237, 'Test Referral', '6b4d0492-8c27-46db-bf11-499f9f699653', '', '2'),
(1238, 'Alex Spindler', '78807120-eb96-481f-a4a1-1db4128d822b', '', '2'),
(1239, 'Melissa  Mare', '1f963ca8-0080-4cc9-93a3-5599cc3d870b', '', '2'),
(1240, 'Drew Harrison', '88d5545e-6b7f-4bc4-bb71-1d6ed3adae34', '', '2'),
(1241, 'ME-LEAD- Telesales (Primer ) ', 'a5df26e9-bbb9-4272-9916-777d3f4c861b', '', '2'),
(1242, 'Eralis Tester', '82a05c5b-4682-46dc-b9f3-430a39a48d33', '', '2'),
(1243, 'American Integrity ', 'd45e2307-d941-465f-8a95-726f8a2eb03f', '', '2'),
(1244, 'Attorney Jhon  Called', '2f6d7391-9ed4-401d-a9ee-b0691c41ccad', '', '2'),
(1245, 'Osvaldo Yera', '58866c3c-b79a-4432-8afd-65beb0e4231b', '', '2'),
(1246, 'Friend saw Alex Car ', 'b6759eec-2065-46b3-8e2d-07b53a13489b', '', '2'),
(1247, 'Eralda Handy Man  ', '6163fd0a-0a7f-4159-9781-83580b800c55', '', '2'),
(1248, 'Alex Spindler', '78807120-eb96-481f-a4a1-1db4128d822b', '', '2'),
(1249, 'Drew Harrison', '88d5545e-6b7f-4bc4-bb71-1d6ed3adae34', '', '2'),
(1250, 'Eralis Tester', '82a05c5b-4682-46dc-b9f3-430a39a48d33', '', '2');

-- --------------------------------------------------------

--
-- Table structure for table `im_images`
--

CREATE TABLE `im_images` (
  `id` int(11) NOT NULL,
  `areaId` varchar(255) NOT NULL,
  `imageKey` varchar(255) NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  `imageType` int(11) NOT NULL DEFAULT '0' COMMENT '0-image,1-diagram',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '//0- area,1-issue,2-sample,3-inspection',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_inspection_assignments`
--

CREATE TABLE `im_inspection_assignments` (
  `id` int(11) NOT NULL,
  `inspectionId` varchar(255) NOT NULL,
  `reporterId` int(11) NOT NULL,
  `qaId` int(11) NOT NULL,
  `inspectorId` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_inspection_details`
--

CREATE TABLE `im_inspection_details` (
  `id` int(11) NOT NULL,
  `inspectionId` varchar(255) NOT NULL,
  `clientId` varchar(255) NOT NULL,
  `outdoorTemprature` varchar(255) NOT NULL,
  `hvacSystem` varchar(255) NOT NULL,
  `inspectionTime` varchar(255) NOT NULL,
  `bullets` varchar(255) NOT NULL,
  `spoke_count` varchar(255) NOT NULL,
  `hvacSystemValue` varchar(255) NOT NULL,
  `enviornmentType` varchar(255) NOT NULL,
  `outdoorRh` varchar(255) NOT NULL,
  `hvacSystemVisual` varchar(255) NOT NULL,
  `inspectionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rehabbedAfterYear` varchar(255) NOT NULL,
  `paymentType` varchar(255) NOT NULL,
  `isnNotes` varchar(255) NOT NULL,
  `insuaranceCompany` varchar(255) NOT NULL,
  `policyNumber` varchar(255) NOT NULL,
  `claim` varchar(255) NOT NULL,
  `insuaranceAdjuster` varchar(255) NOT NULL,
  `claimCount` varchar(255) NOT NULL,
  `dateOfLoss` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `typeOfLoss` varchar(255) NOT NULL,
  `remedeationCompany` varchar(255) NOT NULL,
  `publicAdjuster` varchar(255) NOT NULL,
  `referralSource` varchar(255) NOT NULL,
  `ordertype` varchar(255) NOT NULL,
  `fee` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '0-inactive,1-active,2-accept,3-decline',
  `ductwork` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_isn_uploads`
--

CREATE TABLE `im_isn_uploads` (
  `id` int(11) NOT NULL,
  `inspectionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_issues`
--

CREATE TABLE `im_issues` (
  `id` int(11) NOT NULL,
  `selectionId` varchar(255) NOT NULL,
  `areaId` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `typeValue` varchar(255) NOT NULL,
  `measurements` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_labreports`
--

CREATE TABLE `im_labreports` (
  `id` int(11) NOT NULL,
  `inspectionId` varchar(255) NOT NULL,
  `report` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '0-pending,1-active,2-accepted,3-declined',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_links`
--

CREATE TABLE `im_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `im_new_inspections`
--

CREATE TABLE `im_new_inspections` (
  `id` int(11) NOT NULL,
  `inspectorId` varchar(255) NOT NULL,
  `clientId` varchar(255) NOT NULL,
  `isnInspectionId` varchar(255) NOT NULL,
  `jobNumber` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL DEFAULT '  ',
  `date` date DEFAULT NULL,
  `rehabbedAfterYear` varchar(255) NOT NULL,
  `inspectionType` varchar(255) NOT NULL,
  `paymentType` varchar(255) NOT NULL,
  `inspectionDate` datetime NOT NULL,
  `inspectionTime` varchar(255) NOT NULL,
  `isnNotes` text NOT NULL,
  `insuaranceCompany` varchar(255) NOT NULL,
  `policyNumber` varchar(255) NOT NULL,
  `claim` varchar(255) NOT NULL,
  `insuaranceAdjuster` varchar(255) NOT NULL,
  `claimCount` varchar(255) NOT NULL,
  `dateOfLoss` datetime NOT NULL,
  `typeOfLoss` varchar(255) NOT NULL,
  `remedeationCompany` varchar(255) NOT NULL,
  `publicAdjuster` varchar(255) NOT NULL,
  `fees` double NOT NULL,
  `referralSource` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_notifications`
--

CREATE TABLE `im_notifications` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `opponentId` varchar(255) NOT NULL DEFAULT '0',
  `moduleId` varchar(255) NOT NULL DEFAULT '0' COMMENT '//orders',
  `type` int(11) NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '0-unread,1-read',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_options`
--

CREATE TABLE `im_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_options`
--

INSERT INTO `im_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://clientstagingdev.com/expertreports', 'yes'),
(2, 'home', 'http://clientstagingdev.com/expertreports', 'yes'),
(3, 'blogname', 'Expert Reports', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'swaran.lata@imarkinfotech.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:89:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:19:\"akismet/akismet.php\";i:1;s:48:\"capability-manager-enhanced/capsman-enhanced.php\";i:2;s:33:\"wps-hide-login/wps-hide-login.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'expert', 'yes'),
(41, 'stylesheet', 'expert-child', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'im_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:69:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:14:\"ure_edit_roles\";b:1;s:16:\"ure_create_roles\";b:1;s:16:\"ure_delete_roles\";b:1;s:23:\"ure_create_capabilities\";b:1;s:23:\"ure_delete_capabilities\";b:1;s:18:\"ure_manage_options\";b:1;s:15:\"ure_reset_roles\";b:1;s:19:\"manage_capabilities\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:2:\"QA\";s:12:\"capabilities\";a:6:{s:12:\"delete_posts\";b:1;s:10:\"edit_posts\";b:1;s:7:\"level_0\";b:1;s:7:\"level_1\";b:1;s:14:\"manage_options\";b:1;s:4:\"read\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:8:\"Reporter\";s:12:\"capabilities\";a:5:{s:7:\"level_0\";b:1;s:14:\"manage_options\";b:1;s:10:\"edit_posts\";b:1;s:12:\"delete_posts\";b:1;s:4:\"read\";b:1;}}s:9:\"inspector\";a:2:{s:4:\"name\";s:9:\"Inspector\";s:12:\"capabilities\";a:3:{s:7:\"level_0\";b:1;s:14:\"manage_options\";b:1;s:4:\"read\";b:1;}}s:11:\"deactivated\";a:2:{s:4:\"name\";s:11:\"Deactivated\";s:12:\"capabilities\";a:1:{s:7:\"level_0\";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'cron', 'a:4:{i:1522480475;a:3:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1522480485;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1522562783;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(110, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1513927920;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(119, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1522437275;s:7:\"checked\";a:2:{s:12:\"expert-child\";s:5:\"1.0.0\";s:6:\"expert\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(126, 'can_compress_scripts', '0', 'no'),
(139, 'recently_activated', 'a:0:{}', 'yes'),
(140, 'widget_akismet_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(142, 'current_theme', 'Expert Child', 'yes'),
(143, 'theme_mods_expert-child', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1515560203;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}s:11:\"custom_logo\";i:77;}', 'yes'),
(144, 'theme_switched', '', 'yes'),
(258, 'theme_mods_expert', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:4;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1515560422;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(270, 'WPLANG', '', 'yes'),
(271, 'new_admin_email', 'swaran.lata@imarkinfotech.com', 'yes'),
(272, 'whl_page', 'portal', 'yes'),
(297, 'user_role_editor', 'a:7:{s:11:\"ure_version\";s:4:\"4.39\";s:15:\"show_admin_role\";i:0;s:17:\"ure_caps_readable\";i:0;s:24:\"ure_show_deprecated_caps\";i:0;s:23:\"ure_confirm_role_update\";s:1:\"1\";s:14:\"edit_user_caps\";s:1:\"1\";s:18:\"caps_columns_quant\";i:1;}', 'yes'),
(298, 'im_backup_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'no'),
(299, 'ure_tasks_queue', 'a:0:{}', 'yes'),
(311, 'ure_role_additional_options_values', 'a:1:{s:11:\"contributor\";a:0:{}}', 'yes'),
(318, 'capsman_version', '', 'yes'),
(414, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:29:\"swaran.lata@imarkinfotech.com\";s:7:\"version\";s:5:\"4.9.3\";s:9:\"timestamp\";i:1517865288;}', 'no'),
(614, 'inspectiontypes_children', 'a:0:{}', 'yes'),
(740, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.4-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9.4-partial-3.zip\";s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.4\";s:7:\"version\";s:5:\"4.9.4\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:5:\"4.9.3\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.4-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9.4-partial-3.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.4-rollback-3.zip\";}s:7:\"current\";s:5:\"4.9.4\";s:7:\"version\";s:5:\"4.9.4\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:5:\"4.9.3\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1522437275;s:15:\"version_checked\";s:5:\"4.9.3\";s:12:\"translations\";a:0:{}}', 'no'),
(741, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1522437275;s:8:\"response\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:7:\"default\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";s:7:\"default\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:37:\"user-role-editor/user-role-editor.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:30:\"w.org/plugins/user-role-editor\";s:4:\"slug\";s:16:\"user-role-editor\";s:6:\"plugin\";s:37:\"user-role-editor/user-role-editor.php\";s:11:\"new_version\";s:6:\"4.40.1\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/user-role-editor/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/user-role-editor.4.40.1.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:69:\"https://ps.w.org/user-role-editor/assets/icon-128x128.jpg?rev=1020390\";s:2:\"2x\";s:69:\"https://ps.w.org/user-role-editor/assets/icon-256x256.jpg?rev=1020390\";s:7:\"default\";s:69:\"https://ps.w.org/user-role-editor/assets/icon-256x256.jpg?rev=1020390\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:71:\"https://ps.w.org/user-role-editor/assets/banner-772x250.png?rev=1263116\";s:7:\"default\";s:71:\"https://ps.w.org/user-role-editor/assets/banner-772x250.png?rev=1263116\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:33:\"wps-hide-login/wps-hide-login.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:28:\"w.org/plugins/wps-hide-login\";s:4:\"slug\";s:14:\"wps-hide-login\";s:6:\"plugin\";s:33:\"wps-hide-login/wps-hide-login.php\";s:11:\"new_version\";s:7:\"1.2.6.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/wps-hide-login/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/wps-hide-login.1.2.6.1.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:67:\"https://ps.w.org/wps-hide-login/assets/icon-128x128.png?rev=1820667\";s:2:\"2x\";s:67:\"https://ps.w.org/wps-hide-login/assets/icon-256x256.png?rev=1820667\";s:7:\"default\";s:67:\"https://ps.w.org/wps-hide-login/assets/icon-256x256.png?rev=1820667\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:70:\"https://ps.w.org/wps-hide-login/assets/banner-1544x500.jpg?rev=1820667\";s:2:\"1x\";s:69:\"https://ps.w.org/wps-hide-login/assets/banner-772x250.jpg?rev=1820667\";s:7:\"default\";s:70:\"https://ps.w.org/wps-hide-login/assets/banner-1544x500.jpg?rev=1820667\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:48:\"capability-manager-enhanced/capsman-enhanced.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:41:\"w.org/plugins/capability-manager-enhanced\";s:4:\"slug\";s:27:\"capability-manager-enhanced\";s:6:\"plugin\";s:48:\"capability-manager-enhanced/capsman-enhanced.php\";s:11:\"new_version\";s:5:\"1.5.7\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/capability-manager-enhanced/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/capability-manager-enhanced.zip\";s:5:\"icons\";a:0:{}s:7:\"banners\";a:3:{s:2:\"2x\";s:82:\"https://ps.w.org/capability-manager-enhanced/assets/banner-1544x500.png?rev=776273\";s:2:\"1x\";s:81:\"https://ps.w.org/capability-manager-enhanced/assets/banner-772x250.png?rev=776273\";s:7:\"default\";s:82:\"https://ps.w.org/capability-manager-enhanced/assets/banner-1544x500.png?rev=776273\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(1143, '_site_transient_timeout_browser_466fcf973f0a5f94eef55120bcc54efb', '1522409122', 'no'),
(1144, '_site_transient_browser_466fcf973f0a5f94eef55120bcc54efb', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"65.0.3325.181\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1151, '_site_transient_timeout_browser_0db55d83e65f4fb2e5cf9e37dfafcbca', '1522492199', 'no'),
(1152, '_site_transient_browser_0db55d83e65f4fb2e5cf9e37dfafcbca', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"65.0.3325.181\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1171, '_site_transient_timeout_browser_63d96baab63efaf21cb01f3d7fa61642', '1522757906', 'no'),
(1172, '_site_transient_browser_63d96baab63efaf21cb01f3d7fa61642', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"65.0.3325.181\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1182, '_transient_is_multi_author', '0', 'yes'),
(1192, '_site_transient_timeout_browser_8d9b6ae1bc73e6e7286950ccae033872', '1522976006', 'no'),
(1193, '_site_transient_browser_8d9b6ae1bc73e6e7286950ccae033872', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"65.0.3325.146\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1197, '_site_transient_timeout_browser_49fe9f006c67dc11687a298401e5d5c2', '1523015906', 'no'),
(1198, '_site_transient_browser_49fe9f006c67dc11687a298401e5d5c2', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"65.0.3325.181\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1199, '_site_transient_timeout_browser_efc56fe28520bcd166ef136f44025003', '1523021131', 'no'),
(1200, '_site_transient_browser_efc56fe28520bcd166ef136f44025003', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"65.0.3325.181\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1201, '_site_transient_timeout_browser_3761e5c4733742374ba4795bb2ae7f72', '1523021322', 'no'),
(1202, '_site_transient_browser_3761e5c4733742374ba4795bb2ae7f72', 'a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"47.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:1;s:8:\"insecure\";b:1;s:6:\"mobile\";b:0;}', 'no'),
(1205, '_site_transient_timeout_theme_roots', '1522439075', 'no'),
(1206, '_site_transient_theme_roots', 'a:2:{s:12:\"expert-child\";s:7:\"/themes\";s:6:\"expert\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `im_orders`
--

CREATE TABLE `im_orders` (
  `id` int(11) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `inspectionId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_owner_details`
--

CREATE TABLE `im_owner_details` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `im_owner_details`
--

INSERT INTO `im_owner_details` (`id`, `username`, `password`) VALUES
(1, 'imark', '1121$sahil$');

-- --------------------------------------------------------

--
-- Table structure for table `im_postmeta`
--

CREATE TABLE `im_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_postmeta`
--

INSERT INTO `im_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2, 4, '_wp_attached_file', '2018/01/1-splash-e1515560250303.png'),
(3, 4, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:427;s:4:\"file\";s:35:\"2018/01/1-splash-e1515560250303.png\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"1-splash-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"1-splash-169x300.png\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"1-splash-768x1365.png\";s:5:\"width\";i:768;s:6:\"height\";i:1365;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"1-splash-576x1024.png\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:22:\"1-splash-1200x2133.png\";s:5:\"width\";i:1200;s:6:\"height\";i:2133;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(4, 4, '_edit_lock', '1515560231:1'),
(5, 4, '_wp_attachment_backup_sizes', 'a:1:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:1243;s:6:\"height\";i:2209;s:4:\"file\";s:12:\"1-splash.png\";}}'),
(6, 4, '_edit_last', '1'),
(7, 5, '_wp_attached_file', '2018/01/cropped-1-splash-e1515560250303.png'),
(8, 5, '_wp_attachment_context', 'custom-logo'),
(9, 5, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:239;s:4:\"file\";s:43:\"2018/01/cropped-1-splash-e1515560250303.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:43:\"cropped-1-splash-e1515560250303-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(23, 15, '_edit_lock', '1518442330:1'),
(24, 15, '_edit_last', '1'),
(25, 17, '_edit_last', '1'),
(26, 17, '_edit_lock', '1516602486:1'),
(54, 39, '_edit_lock', '1517644744:1'),
(55, 39, '_edit_last', '1'),
(56, 39, '_wp_page_template', 'latest_view_pdf.php'),
(57, 41, '_edit_lock', '1517476398:1'),
(58, 41, '_edit_last', '1'),
(59, 41, '_wp_page_template', 'pre_report.php'),
(61, 46, '_edit_last', '1'),
(62, 46, '_edit_lock', '1521412118:1'),
(63, 47, '_edit_last', '1'),
(64, 47, '_edit_lock', '1517839340:1'),
(65, 48, '_edit_lock', '1517839352:1'),
(66, 48, '_edit_last', '1'),
(67, 49, '_edit_last', '1'),
(68, 49, '_edit_lock', '1517839359:1'),
(69, 50, '_edit_last', '1'),
(70, 50, '_edit_lock', '1517915906:1'),
(71, 15, '_wp_page_template', 'default'),
(102, 52, '_edit_lock', '1519655019:1'),
(103, 52, '_edit_last', '1'),
(114, 58, '_edit_lock', '1518676383:1'),
(115, 58, '_edit_last', '1'),
(122, 62, '_edit_lock', '1518676457:1'),
(123, 62, '_edit_last', '1'),
(124, 63, '_edit_lock', '1519655246:1'),
(125, 63, '_edit_last', '1'),
(126, 64, '_edit_lock', '1518679633:1'),
(127, 64, '_edit_last', '1'),
(128, 65, '_edit_lock', '1518676602:1'),
(129, 65, '_edit_last', '1'),
(130, 66, '_edit_lock', '1518676602:1'),
(131, 66, '_edit_last', '1'),
(132, 67, '_edit_lock', '1518676603:1'),
(133, 67, '_edit_last', '1'),
(134, 68, '_edit_lock', '1518678239:1'),
(135, 68, '_edit_last', '1'),
(136, 69, '_edit_lock', '1518676599:1'),
(137, 69, '_edit_last', '1'),
(140, 71, '_edit_lock', '1518676599:1'),
(141, 71, '_edit_last', '1'),
(179, 74, '_wp_attached_file', '2018/01/cropped-1-splash-e1515560250303-1.png'),
(180, 74, '_wp_attachment_context', 'custom-logo'),
(181, 74, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:159;s:4:\"file\";s:45:\"2018/01/cropped-1-splash-e1515560250303-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"cropped-1-splash-e1515560250303-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(182, 75, '_wp_trash_meta_status', 'publish'),
(183, 75, '_wp_trash_meta_time', '1521031014'),
(184, 76, '_wp_attached_file', '2018/03/ME-Logo-2017-PSD.png'),
(185, 76, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:986;s:6:\"height\";i:253;s:4:\"file\";s:28:\"2018/03/ME-Logo-2017-PSD.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"ME-Logo-2017-PSD-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"ME-Logo-2017-PSD-300x77.png\";s:5:\"width\";i:300;s:6:\"height\";i:77;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:28:\"ME-Logo-2017-PSD-768x197.png\";s:5:\"width\";i:768;s:6:\"height\";i:197;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(186, 77, '_wp_attached_file', '2018/03/cropped-ME-Logo-2017-PSD.png'),
(187, 77, '_wp_attachment_context', 'custom-logo'),
(188, 77, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:61;s:4:\"file\";s:36:\"2018/03/cropped-ME-Logo-2017-PSD.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"cropped-ME-Logo-2017-PSD-150x61.png\";s:5:\"width\";i:150;s:6:\"height\";i:61;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(189, 78, '_wp_trash_meta_status', 'publish'),
(190, 78, '_wp_trash_meta_time', '1522238154');

-- --------------------------------------------------------

--
-- Table structure for table `im_posts`
--

CREATE TABLE `im_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_posts`
--

INSERT INTO `im_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(4, 1, '2018-01-10 04:57:07', '2018-01-10 04:57:07', '', '1 splash', '', 'inherit', 'open', 'closed', '', '1-splash', '', '', '2018-01-10 04:57:44', '2018-01-10 04:57:44', '', 0, 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/01/1-splash.png', 0, 'attachment', 'image/png', 0),
(5, 1, '2018-01-10 04:57:58', '2018-01-10 04:57:58', 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/01/cropped-1-splash-e1515560250303.png', 'cropped-1-splash-e1515560250303.png', '', 'inherit', 'open', 'closed', '', 'cropped-1-splash-e1515560250303-png', '', '', '2018-01-10 04:57:58', '2018-01-10 04:57:58', '', 0, 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/01/cropped-1-splash-e1515560250303.png', 0, 'attachment', 'image/png', 0),
(15, 1, '2018-01-22 06:07:05', '2018-01-22 06:07:05', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum est', 'Privacy Policy', '', 'publish', 'closed', 'closed', '', 'privacy-policy', '', '', '2018-02-12 13:34:08', '2018-02-12 13:34:08', '', 0, 'http://clientstagingdev.com/expertreports/?page_id=15', 0, 'page', '', 0),
(16, 1, '2018-01-22 06:07:05', '2018-01-22 06:07:05', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2018-01-22 06:07:05', '2018-01-22 06:07:05', '', 15, 'http://clientstagingdev.com/expertreports/2018/01/22/15-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2018-01-22 06:07:20', '2018-01-22 06:07:20', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Terms and Conditions', '', 'publish', 'closed', 'closed', '', 'terms-and-conditions', '', '', '2018-01-22 06:07:20', '2018-01-22 06:07:20', '', 0, 'http://clientstagingdev.com/expertreports/?page_id=17', 0, 'page', '', 0),
(18, 1, '2018-01-22 06:07:20', '2018-01-22 06:07:20', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'Terms and Conditions', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-01-22 06:07:20', '2018-01-22 06:07:20', '', 17, 'http://clientstagingdev.com/expertreports/2018/01/22/17-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2018-02-01 07:34:55', '2018-02-01 07:34:55', '', 'View PDF', '', 'publish', 'closed', 'closed', '', 'view-pdf', '', '', '2018-02-03 06:16:35', '2018-02-03 06:16:35', '', 0, 'http://clientstagingdev.com/expertreports/?page_id=39', 0, 'page', '', 0),
(40, 1, '2018-02-01 07:34:55', '2018-02-01 07:34:55', '', 'View PDF', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2018-02-01 07:34:55', '2018-02-01 07:34:55', '', 39, 'http://clientstagingdev.com/expertreports/2018/02/01/39-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2018-02-01 07:55:54', '2018-02-01 07:55:54', '', 'Pre Inspection Report', '', 'publish', 'closed', 'closed', '', 'pre-inspection-report', '', '', '2018-02-01 07:55:54', '2018-02-01 07:55:54', '', 0, 'http://clientstagingdev.com/expertreports/?page_id=41', 0, 'page', '', 0),
(42, 1, '2018-02-01 07:55:54', '2018-02-01 07:55:54', '', 'Pre Inspection Report', '', 'inherit', 'closed', 'closed', '', '41-revision-v1', '', '', '2018-02-01 07:55:54', '2018-02-01 07:55:54', '', 41, 'http://clientstagingdev.com/expertreports/2018/02/01/41-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2018-02-05 14:04:34', '2018-02-05 14:04:34', '', 'Air O Cell', '', 'publish', 'closed', 'closed', '', 'aoc', '', '', '2018-03-18 22:30:59', '2018-03-18 22:30:59', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=sampletypes&#038;p=46', 0, 'sampletypes', '', 0),
(47, 1, '2018-02-05 14:04:42', '2018-02-05 14:04:42', '', 'Bulk', '', 'publish', 'closed', 'closed', '', 'bulk', '', '', '2018-02-05 14:04:42', '2018-02-05 14:04:42', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=sampletypes&#038;p=47', 0, 'sampletypes', '', 0),
(48, 1, '2018-02-05 14:04:54', '2018-02-05 14:04:54', '', 'Cat3', '', 'publish', 'closed', 'closed', '', 'cat3', '', '', '2018-02-05 14:04:54', '2018-02-05 14:04:54', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=sampletypes&#038;p=48', 0, 'sampletypes', '', 0),
(49, 1, '2018-02-05 14:05:02', '2018-02-05 14:05:02', '', 'Swab', '', 'publish', 'closed', 'closed', '', 'swab', '', '', '2018-02-05 14:05:02', '2018-02-05 14:05:02', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=sampletypes&#038;p=49', 0, 'sampletypes', '', 0),
(50, 1, '2018-02-06 11:20:49', '2018-02-06 11:20:49', '', 'Soot', '', 'publish', 'closed', 'closed', '', 'soot', '', '', '2018-02-06 11:20:49', '2018-02-06 11:20:49', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=sampletypes&#038;p=50', 0, 'sampletypes', '', 0),
(51, 1, '2018-02-12 13:34:08', '2018-02-12 13:34:08', '<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum est', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2018-02-12 13:34:08', '2018-02-12 13:34:08', '', 15, 'http://clientstagingdev.com/expertreports/2018/02/12/15-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2018-02-15 06:32:33', '2018-02-15 06:32:33', 'Mold Inspection', 'Mold Inspection', '', 'publish', 'closed', 'closed', '', 'mold-inspection', '', '', '2018-02-26 14:24:23', '2018-02-26 14:24:23', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=52', 0, 'inspectiontypes', '', 0),
(58, 1, '2018-02-15 06:34:41', '2018-02-15 06:34:41', 'AOB Mold Inspection', 'AOB Mold Inspection', '', 'publish', 'closed', 'closed', '', 'aob-mold-inspection', '', '', '2018-02-15 06:34:41', '2018-02-15 06:34:41', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=58', 0, 'inspectiontypes', '', 0),
(62, 1, '2018-02-15 06:36:12', '2018-02-15 06:36:12', 'Re-Inspection', 'Re-Inspection', '', 'publish', 'closed', 'closed', '', 're-inspection', '', '', '2018-02-15 06:36:12', '2018-02-15 06:36:12', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=62', 0, 'inspectiontypes', '', 0),
(63, 1, '2018-02-15 06:36:26', '2018-02-15 06:36:26', 'Mold Clearance Test', 'Mold Clearance Test', '', 'publish', 'closed', 'closed', '', 'mold-clearance-test', '', '', '2018-02-26 14:26:14', '2018-02-26 14:26:14', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=63', 0, 'inspectiontypes', '', 0),
(64, 1, '2018-02-15 06:36:38', '2018-02-15 06:36:38', 'Estimate', 'Estimate', '', 'publish', 'closed', 'closed', '', 'estimate', '', '', '2018-02-15 06:36:38', '2018-02-15 06:36:38', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=64', 0, 'inspectiontypes', '', 0),
(65, 1, '2018-02-15 06:37:02', '2018-02-15 06:37:02', 'Chinese Drywall Testing', 'Chinese Drywall Testing', '', 'publish', 'closed', 'closed', '', 'chinese-drywall-testing', '', '', '2018-02-15 06:37:02', '2018-02-15 06:37:02', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=65', 0, 'inspectiontypes', '', 0),
(66, 1, '2018-02-15 06:37:19', '2018-02-15 06:37:19', 'Asbestos Testing', 'Asbestos Testing', '', 'publish', 'closed', 'closed', '', 'asbestos-testing', '', '', '2018-02-15 06:37:19', '2018-02-15 06:37:19', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=66', 0, 'inspectiontypes', '', 0),
(67, 1, '2018-02-15 06:37:32', '2018-02-15 06:37:32', 'Mold Inspection Protocol Report', 'Mold Inspection Protocol Report', '', 'publish', 'closed', 'closed', '', 'mold-inspection-protocol-report', '', '', '2018-02-15 06:37:32', '2018-02-15 06:37:32', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=67', 0, 'inspectiontypes', '', 0),
(68, 1, '2018-02-15 06:37:45', '2018-02-15 06:37:45', 'Additional Sampling', 'Additional Sampling', '', 'publish', 'closed', 'closed', '', 'additional-sampling', '', '', '2018-02-15 06:37:45', '2018-02-15 06:37:45', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=68', 0, 'inspectiontypes', '', 0),
(69, 1, '2018-02-15 06:38:00', '2018-02-15 06:38:00', 'CAT 3 Testing', 'CAT 3 Testing', '', 'publish', 'closed', 'closed', '', 'cat-3-testing', '', '', '2018-02-15 06:38:00', '2018-02-15 06:38:00', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=69', 0, 'inspectiontypes', '', 0),
(71, 1, '2018-02-15 06:38:32', '2018-02-15 06:38:32', 'AOB CAT 3 Home Inspection', 'AOB CAT 3 Home Inspection', '', 'publish', 'closed', 'closed', '', 'aob-cat-3-home-inspection', '', '', '2018-02-15 06:38:32', '2018-02-15 06:38:32', '', 0, 'http://clientstagingdev.com/expertreports/?post_type=inspectiontypes&#038;p=71', 0, 'inspectiontypes', '', 0),
(74, 1, '2018-03-14 12:36:51', '2018-03-14 12:36:51', 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/01/cropped-1-splash-e1515560250303-1.png', 'cropped-1-splash-e1515560250303-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-1-splash-e1515560250303-1-png', '', '', '2018-03-14 12:36:51', '2018-03-14 12:36:51', '', 0, 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/01/cropped-1-splash-e1515560250303-1.png', 0, 'attachment', 'image/png', 0),
(75, 1, '2018-03-14 12:36:54', '2018-03-14 12:36:54', '{\n    \"expert-child::custom_logo\": {\n        \"value\": 74,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-03-14 12:36:54\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0546e2e3-2fef-4231-8d1c-afe971468c06', '', '', '2018-03-14 12:36:54', '2018-03-14 12:36:54', '', 0, 'http://clientstagingdev.com/expertreports/2018/03/14/0546e2e3-2fef-4231-8d1c-afe971468c06/', 0, 'customize_changeset', '', 0),
(76, 1, '2018-03-28 11:55:40', '2018-03-28 11:55:40', '', 'ME Logo 2017 PSD', '', 'inherit', 'open', 'closed', '', 'me-logo-2017-psd', '', '', '2018-03-28 11:55:40', '2018-03-28 11:55:40', '', 0, 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/03/ME-Logo-2017-PSD.png', 0, 'attachment', 'image/png', 0),
(77, 1, '2018-03-28 11:55:51', '2018-03-28 11:55:51', 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/03/cropped-ME-Logo-2017-PSD.png', 'cropped-ME-Logo-2017-PSD.png', '', 'inherit', 'open', 'closed', '', 'cropped-me-logo-2017-psd-png', '', '', '2018-03-28 11:55:51', '2018-03-28 11:55:51', '', 0, 'http://clientstagingdev.com/expertreports/wp-content/uploads/2018/03/cropped-ME-Logo-2017-PSD.png', 0, 'attachment', 'image/png', 0),
(78, 1, '2018-03-28 11:55:54', '2018-03-28 11:55:54', '{\n    \"expert-child::custom_logo\": {\n        \"value\": 77,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-03-28 11:55:54\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'f8c6af44-f6ad-4c55-a401-7d4af3bc2689', '', '', '2018-03-28 11:55:54', '2018-03-28 11:55:54', '', 0, 'http://clientstagingdev.com/expertreports/2018/03/28/f8c6af44-f6ad-4c55-a401-7d4af3bc2689/', 0, 'customize_changeset', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `im_samples`
--

CREATE TABLE `im_samples` (
  `id` int(11) NOT NULL,
  `areaId` varchar(255) NOT NULL,
  `sampleType` varchar(255) NOT NULL,
  `sampleSerialNo` text NOT NULL,
  `sampleObservation` text NOT NULL,
  `labResults` text NOT NULL,
  `mold_spores` text NOT NULL,
  `other` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `im_selections`
--

CREATE TABLE `im_selections` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `im_selections`
--

INSERT INTO `im_selections` (`id`, `name`, `created`) VALUES
(1, 'Visible Mold like substance', '2018-02-05 12:03:49'),
(2, 'Moisture Stains Present', '2018-02-05 12:05:45'),
(3, 'Mold odor', '2018-02-05 12:05:45'),
(4, 'Remove Celling', '2018-02-05 12:05:45'),
(5, 'Remove Drywall', '2018-02-05 12:05:45'),
(6, 'Remove Baseboard', '2018-02-05 12:05:45'),
(7, 'Micro Clean Surfaces', '2018-02-05 12:05:45'),
(8, 'Horizontal Surface Cleaning', '2018-02-05 12:05:45'),
(9, 'Clean Furniture', '2018-02-05 12:05:45'),
(10, 'Clean Carpets', '2018-02-05 12:05:45'),
(11, 'Discard Carpets', '2018-02-05 12:05:45'),
(12, 'Fog Area with Antimicrobial', '2018-02-05 12:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `im_termmeta`
--

CREATE TABLE `im_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `im_terms`
--

CREATE TABLE `im_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_terms`
--

INSERT INTO `im_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Pre Inspections', 'pre-inspections', 0),
(3, 'Post Inspections', 'post-inspections', 0);

-- --------------------------------------------------------

--
-- Table structure for table `im_term_relationships`
--

CREATE TABLE `im_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_term_relationships`
--

INSERT INTO `im_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(52, 2, 0),
(58, 2, 0),
(62, 3, 0),
(63, 3, 0),
(64, 2, 0),
(65, 3, 0),
(66, 2, 0),
(67, 3, 0),
(68, 3, 0),
(69, 3, 0),
(71, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `im_term_taxonomy`
--

CREATE TABLE `im_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_term_taxonomy`
--

INSERT INTO `im_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'inspectiontypes', '', 0, 4),
(3, 3, 'inspectiontypes', '', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `im_usermeta`
--

CREATE TABLE `im_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_usermeta`
--

INSERT INTO `im_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'im@rk'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'coffee'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'im_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'im_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '0'),
(17, 1, 'im_dashboard_quick_press_last_post_id', '20'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:13:\"122.173.253.0\";}'),
(19, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(20, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(21, 1, 'im_user-settings', 'mfold=o&libraryContent=browse'),
(22, 1, 'im_user-settings-time', '1515560230'),
(111, 7, 'nickname', 'swaran'),
(112, 7, 'first_name', 'swaran'),
(113, 7, 'last_name', 'lata'),
(114, 7, 'description', ''),
(115, 7, 'rich_editing', 'true'),
(116, 7, 'syntax_highlighting', 'true'),
(117, 7, 'comment_shortcuts', 'false'),
(118, 7, 'admin_color', 'coffee'),
(119, 7, 'use_ssl', '0'),
(120, 7, 'show_admin_bar_front', 'true'),
(121, 7, 'locale', ''),
(122, 7, 'im_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(123, 7, 'im_user_level', '0'),
(125, 8, 'nickname', 'dushyant'),
(126, 8, 'first_name', 'dusyant'),
(127, 8, 'last_name', 'sengar'),
(128, 8, 'description', ''),
(129, 8, 'rich_editing', 'true'),
(130, 8, 'syntax_highlighting', 'true'),
(131, 8, 'comment_shortcuts', 'false'),
(132, 8, 'admin_color', 'coffee'),
(133, 8, 'use_ssl', '0'),
(134, 8, 'show_admin_bar_front', 'true'),
(135, 8, 'locale', ''),
(136, 8, 'im_capabilities', 'a:1:{s:11:\"contributor\";b:1;}'),
(137, 8, 'im_user_level', '1'),
(139, 8, 'im_dashboard_quick_press_last_post_id', '21'),
(140, 8, 'community-events-location', 'a:1:{s:2:\"ip\";s:13:\"122.173.253.0\";}'),
(141, 9, 'nickname', 'inspector'),
(142, 9, 'first_name', 'inspector'),
(143, 9, 'last_name', 'd'),
(144, 9, 'description', ''),
(145, 9, 'rich_editing', 'true'),
(146, 9, 'syntax_highlighting', 'true'),
(147, 9, 'comment_shortcuts', 'false'),
(148, 9, 'admin_color', 'fresh'),
(149, 9, 'use_ssl', '0'),
(150, 9, 'show_admin_bar_front', 'true'),
(151, 9, 'locale', ''),
(152, 9, 'im_capabilities', 'a:1:{s:9:\"inspector\";b:1;}'),
(153, 9, 'im_user_level', '0'),
(154, 9, 'dismissed_wp_pointers', ''),
(159, 9, 'session_tokens', 'a:1:{s:64:\"f90bfc36659680cbbf88cc71a5aa47c97a91f9f521deadaf0739d5c06f110124\";a:4:{s:10:\"expiration\";i:1523596327;s:2:\"ip\";s:14:\"122.173.253.43\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522386727;}}'),
(163, 7, 'im_dashboard_quick_press_last_post_id', '75'),
(164, 7, 'community-events-location', 'a:1:{s:2:\"ip\";s:13:\"122.173.253.0\";}'),
(170, 7, 'closedpostboxes_dashboard', 'a:0:{}'),
(171, 7, 'metaboxhidden_dashboard', 'a:0:{}'),
(172, 7, 'im_user-settings', 'mfold=o&unfold=1'),
(173, 7, 'im_user-settings-time', '1522215202'),
(174, 10, 'nickname', 'imark'),
(175, 10, 'first_name', 'Sahil'),
(176, 10, 'last_name', 'iMark'),
(177, 10, 'description', ''),
(178, 10, 'rich_editing', 'true'),
(179, 10, 'syntax_highlighting', 'true'),
(180, 10, 'comment_shortcuts', 'false'),
(181, 10, 'admin_color', 'coffee'),
(182, 10, 'use_ssl', '0'),
(183, 10, 'show_admin_bar_front', 'true'),
(184, 10, 'locale', ''),
(185, 10, 'im_capabilities', 'a:1:{s:9:\"inspector\";b:1;}'),
(186, 10, 'im_user_level', '0'),
(187, 9, 'is_enable_notification', '1'),
(188, 11, 'nickname', 'bhanu'),
(189, 11, 'first_name', 'bhanu'),
(190, 11, 'last_name', 'singh'),
(191, 11, 'description', ''),
(192, 11, 'rich_editing', 'true'),
(193, 11, 'syntax_highlighting', 'true'),
(194, 11, 'comment_shortcuts', 'false'),
(195, 11, 'admin_color', 'coffee'),
(196, 11, 'use_ssl', '0'),
(197, 11, 'show_admin_bar_front', 'true'),
(198, 11, 'locale', ''),
(199, 11, 'im_capabilities', 'a:1:{s:9:\"inspector\";b:1;}'),
(200, 11, 'im_user_level', '0'),
(201, 11, 'is_enable_notification', '1'),
(202, 11, 'session_tokens', 'a:3:{s:64:\"3bbbc0ae9a089ab987a3e3c8bdd786fb5a94f3b4b09870e22a267b8b750bbc42\";a:4:{s:10:\"expiration\";i:1518260756;s:2:\"ip\";s:13:\"171.61.192.92\";s:2:\"ua\";s:103:\"Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36\";s:5:\"login\";i:1518087956;}s:64:\"d7cbbdd9bf8d1f5c503b440b7811608f974982e3934901464ce798ce9639b726\";a:4:{s:10:\"expiration\";i:1518260770;s:2:\"ip\";s:13:\"171.61.192.92\";s:2:\"ua\";s:103:\"Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36\";s:5:\"login\";i:1518087970;}s:64:\"40927e6b34f90468494dd6f1739496c54d59d971e6a827da4fc73e48bd1b893c\";a:4:{s:10:\"expiration\";i:1518260817;s:2:\"ip\";s:13:\"171.61.192.92\";s:2:\"ua\";s:103:\"Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36\";s:5:\"login\";i:1518088017;}}'),
(203, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:24:\"example_dashboard_widget\";s:4:\"side\";s:0:\"\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
(204, 9, 'deviceToken', 'cchx5r-TMH8:APA91bE3L_kkVQNmhaP5_GXbnZhn8Rn9UnJsVvol1pKWovzp3EI_fgZ5FFFMOOLUhPxBOSKYlbPDL2GpUD-y5fffn6qzQK0XKknSdtxpIZ_gjYqLK9l08vxFesWG-Qikukl2Rvr5OzPI'),
(205, 9, 'deviceType', 'iOS'),
(206, 11, 'deviceToken', 'c-1P-VkkYpE:APA91bEXzcX15bmJjIw-wKU6fj426Z1ihdj_-Nin2cH-Bdj4-4y4Z2khvNJgnpHe9BuF0H0u9_HqeIsYN2WkDBcEXmbGQYDbocps4D9M3-y1RL0DctiPoF6jtZI6VV6UQIOo5MaZz35w'),
(207, 11, 'deviceType', 'android'),
(213, 7, 'session_tokens', 'a:10:{s:64:\"4df1d458035a0f10248a51f1f2804a9e2f6ebbc4c4f370fef717bb8cb47004a6\";a:4:{s:10:\"expiration\";i:1522669052;s:2:\"ip\";s:14:\"122.173.199.41\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36\";s:5:\"login\";i:1521459452;}s:64:\"07be857db46844ae567d22682fafe3db13e533005faeedd3311d9efe2a17a0d3\";a:4:{s:10:\"expiration\";i:1523026721;s:2:\"ip\";s:13:\"65.34.159.155\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36\";s:5:\"login\";i:1521817121;}s:64:\"990ad0c14f017a160d9189a67b69d9527e08248416af75a63122c2668fd6ab48\";a:4:{s:10:\"expiration\";i:1522478600;s:2:\"ip\";s:13:\"122.173.63.20\";s:2:\"ua\";s:103:\"Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522305800;}s:64:\"4f1d4e45037a5acd072eba903eb3fe170b532b3aa62e5a5cec39c54a918b8460\";a:4:{s:10:\"expiration\";i:1522479236;s:2:\"ip\";s:14:\"124.253.74.123\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522306436;}s:64:\"6461c7a212b648ea552d02724d43db48703aa80d104bcb35a602a3df39f585de\";a:4:{s:10:\"expiration\";i:1522506791;s:2:\"ip\";s:13:\"122.173.61.22\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522333991;}s:64:\"c921d63cc8380383a064cea72454a1d223bb3abbe1523d1fe976962022cd0ad1\";a:4:{s:10:\"expiration\";i:1522544006;s:2:\"ip\";s:14:\"63.138.181.139\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36\";s:5:\"login\";i:1522371206;}s:64:\"0b008ec6f521acea7828ced5ff11453a70b18773d2706548cedcc1fc32e0cab2\";a:4:{s:10:\"expiration\";i:1522561055;s:2:\"ip\";s:13:\"122.173.61.22\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522388255;}s:64:\"8c2b8a8cc0e9037b8c29fb2e45553069601916b87320aaa1f07fbdf32b6f64f8\";a:4:{s:10:\"expiration\";i:1522582294;s:2:\"ip\";s:13:\"122.173.61.22\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522409494;}s:64:\"ab86d1e24c94711fe33d8503d12e19f1df4f6cb647b7197afa0079895072ca5d\";a:4:{s:10:\"expiration\";i:1522583905;s:2:\"ip\";s:14:\"122.173.253.43\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522411105;}s:64:\"50efbb7813f95045a910014e6242b0f5d019cab1728205d05782e092d373181d\";a:4:{s:10:\"expiration\";i:1522641753;s:2:\"ip\";s:14:\"122.173.253.43\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522468953;}}'),
(214, 9, 'isnServerUserId', 'd734a00a-1bb1-477b-bf16-bd7e165f3c1d'),
(215, 11, 'isnServerUserId', 'e94ac5dc-aa29-4498-918f-b2f6f25cebba'),
(272, 15, 'nickname', 'abhishek'),
(273, 15, 'first_name', 'Abhi'),
(274, 15, 'last_name', 'Test'),
(275, 15, 'description', ''),
(276, 15, 'rich_editing', 'true'),
(277, 15, 'syntax_highlighting', 'true'),
(278, 15, 'comment_shortcuts', 'false'),
(279, 15, 'admin_color', 'coffee'),
(280, 15, 'use_ssl', '0'),
(281, 15, 'show_admin_bar_front', 'true'),
(282, 15, 'locale', ''),
(283, 15, 'im_capabilities', 'a:1:{s:9:\"inspector\";b:1;}'),
(284, 15, 'im_user_level', '0'),
(285, 15, 'deviceToken', ''),
(286, 15, 'deviceType', ''),
(287, 15, 'is_enable_notification', '1'),
(288, 15, 'isnServerUserId', '719733b1-9eb8-42df-8f22-6db04b142916'),
(290, 9, 'license', '123456WEWER'),
(291, 11, 'license', '123456QWEWEQWEQ'),
(292, 16, 'nickname', 'jpuentes'),
(293, 16, 'first_name', 'Joe'),
(294, 16, 'last_name', 'Puentes'),
(295, 16, 'description', ''),
(296, 16, 'rich_editing', 'true'),
(297, 16, 'syntax_highlighting', 'true'),
(298, 16, 'comment_shortcuts', 'false'),
(299, 16, 'admin_color', 'coffee'),
(300, 16, 'use_ssl', '0'),
(301, 16, 'show_admin_bar_front', 'true'),
(302, 16, 'locale', ''),
(303, 16, 'im_capabilities', 'a:1:{s:9:\"inspector\";b:1;}'),
(304, 16, 'im_user_level', '0'),
(305, 16, 'deviceToken', '123'),
(306, 16, 'deviceType', 'iOS'),
(307, 16, 'is_enable_notification', '1'),
(308, 16, 'isnServerUserId', '356daae1-1ecd-4513-beec-1a5af583503b'),
(309, 16, 'license', ''),
(311, 15, 'license', '51676878'),
(314, 17, 'nickname', 'bhanu2'),
(315, 17, 'first_name', 'bhanu2'),
(316, 17, 'last_name', 'singh'),
(317, 17, 'description', ''),
(318, 17, 'rich_editing', 'true'),
(319, 17, 'syntax_highlighting', 'true'),
(320, 17, 'comment_shortcuts', 'false'),
(321, 17, 'admin_color', 'coffee'),
(322, 17, 'use_ssl', '0'),
(323, 17, 'show_admin_bar_front', 'true'),
(324, 17, 'locale', ''),
(325, 17, 'im_capabilities', 'a:1:{s:9:\"inspector\";b:1;}'),
(326, 17, 'im_user_level', '0'),
(327, 17, 'deviceToken', ''),
(328, 17, 'deviceType', ''),
(329, 17, 'is_enable_notification', '1'),
(330, 17, 'isnServerUserId', '83bfd410-1e6b-4db0-ba82-c18b536fbed1'),
(331, 17, 'license', '1234564564'),
(335, 8, 'session_tokens', 'a:1:{s:64:\"21569583fda3bff363189afd825afb108f2affba8bc0930546cab7b46e735d82\";a:4:{s:10:\"expiration\";i:1523626122;s:2:\"ip\";s:14:\"122.173.253.43\";s:2:\"ua\";s:73:\"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0\";s:5:\"login\";i:1522416522;}}'),
(344, 1, 'session_tokens', 'a:1:{s:64:\"8651c5b8701fe3edd4cd0f5a1ce53fffece5c3eb7f71c59541f759267115ea0d\";a:4:{s:10:\"expiration\";i:1522470616;s:2:\"ip\";s:14:\"122.173.253.43\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522297816;}}'),
(345, 17, 'session_tokens', 'a:2:{s:64:\"26db275763f3ecb517e508c9227f4b43117876bfd6ddb7e506934019a7058981\";a:4:{s:10:\"expiration\";i:1523596306;s:2:\"ip\";s:14:\"122.173.253.43\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522386706;}s:64:\"cb10acdeb0f4d7e5549b7f839a5c3104d052a6fd261a976172732cd92e27be63\";a:4:{s:10:\"expiration\";i:1523596440;s:2:\"ip\";s:14:\"122.173.253.43\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\";s:5:\"login\";i:1522386840;}}');

-- --------------------------------------------------------

--
-- Table structure for table `im_users`
--

CREATE TABLE `im_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `im_users`
--

INSERT INTO `im_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'im@rk', '$P$BbvLwPRzbNHn97GbcsXug5l.RYSpgZ.', 'imrk', 'swaran.lataa@imarkinfotech.com', '', '2017-12-22 07:14:34', '', 0, 'swaran lata'),
(7, 'swaran', '$P$Bagz7NtZHzgASSWszz.2/fa891GNYw0', 'swaran', 'swaran.lata@imarkinfotech.com', '', '2018-01-10 12:03:27', '', 0, 'swaran lata'),
(8, 'dushyant', '$P$Bfb.SpfMtXdyevSiLOgHRNKtWAN0J21', 'dushyant', 'dushyant.sengar@imarkinfotech.com', '', '2018-01-10 12:08:23', '', 0, 'dusyant sengar'),
(9, 'inspector', '$P$BtlnU6RGzNY3vQbSqU8O3A3YwO2ZP00', 'inspector', 'inspector@gmail.com', '', '2018-01-12 12:05:37', '', 0, 'inspector d'),
(10, 'imark', '$P$BDAWEH/adZYBnMKm/TOt8w1jDJNWrG.', 'imark', 'gurpreet.bansal@imarkinfotech.com', '', '2018-02-02 07:23:57', '', 0, 'Sahil iMark'),
(11, 'bhanu', '$P$BHIkG/mMJz6FsB3GV48xIvcCd9XAy70', 'bhanu', 'bhanu.singh@imarkinfotech.com', '', '2018-02-02 13:02:56', '', 0, 'bhanu singh'),
(15, 'abhishek', '$P$BUHSTf/Xu6EneqC0ZmHiKWG4C2aXEN/', 'abhishek', 'abhishek@imarkinfotech.com', '', '2018-02-20 06:29:04', '', 0, 'Abhi Test'),
(16, 'jpuentes', '$P$BdENNYwv542BiGoWV/5S5isNy7dwz3/', 'jpuentes', 'joepricester@gmail.com', '', '2018-03-06 00:23:18', '', 0, 'Joe Puentes'),
(17, 'bhanu2', '$P$BOIxN8YzubF/X4pb/m9woMpsEuzLyt/', 'bhanu2', 'bhanu@gmail.com', '', '2018-03-09 12:56:00', '', 0, 'bhanu2 singh');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `test` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `test`) VALUES
(1, '12,34,43'),
(2, '12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `im_areas`
--
ALTER TABLE `im_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_chats`
--
ALTER TABLE `im_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_clients`
--
ALTER TABLE `im_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_commentmeta`
--
ALTER TABLE `im_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `im_comments`
--
ALTER TABLE `im_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `im_conversations`
--
ALTER TABLE `im_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_documents`
--
ALTER TABLE `im_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_dropdowns`
--
ALTER TABLE `im_dropdowns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_images`
--
ALTER TABLE `im_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_inspection_assignments`
--
ALTER TABLE `im_inspection_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_inspection_details`
--
ALTER TABLE `im_inspection_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_isn_uploads`
--
ALTER TABLE `im_isn_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_issues`
--
ALTER TABLE `im_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_labreports`
--
ALTER TABLE `im_labreports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_links`
--
ALTER TABLE `im_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `im_new_inspections`
--
ALTER TABLE `im_new_inspections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_notifications`
--
ALTER TABLE `im_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_options`
--
ALTER TABLE `im_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `im_orders`
--
ALTER TABLE `im_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_owner_details`
--
ALTER TABLE `im_owner_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_postmeta`
--
ALTER TABLE `im_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `im_posts`
--
ALTER TABLE `im_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `im_samples`
--
ALTER TABLE `im_samples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_selections`
--
ALTER TABLE `im_selections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `im_termmeta`
--
ALTER TABLE `im_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `im_terms`
--
ALTER TABLE `im_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `im_term_relationships`
--
ALTER TABLE `im_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `im_term_taxonomy`
--
ALTER TABLE `im_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `im_usermeta`
--
ALTER TABLE `im_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `im_users`
--
ALTER TABLE `im_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `im_areas`
--
ALTER TABLE `im_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_chats`
--
ALTER TABLE `im_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_clients`
--
ALTER TABLE `im_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_commentmeta`
--
ALTER TABLE `im_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_comments`
--
ALTER TABLE `im_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_conversations`
--
ALTER TABLE `im_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `im_documents`
--
ALTER TABLE `im_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `im_dropdowns`
--
ALTER TABLE `im_dropdowns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1251;

--
-- AUTO_INCREMENT for table `im_images`
--
ALTER TABLE `im_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_inspection_assignments`
--
ALTER TABLE `im_inspection_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_inspection_details`
--
ALTER TABLE `im_inspection_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_isn_uploads`
--
ALTER TABLE `im_isn_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `im_issues`
--
ALTER TABLE `im_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_labreports`
--
ALTER TABLE `im_labreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_links`
--
ALTER TABLE `im_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_new_inspections`
--
ALTER TABLE `im_new_inspections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_notifications`
--
ALTER TABLE `im_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_options`
--
ALTER TABLE `im_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1207;

--
-- AUTO_INCREMENT for table `im_orders`
--
ALTER TABLE `im_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_owner_details`
--
ALTER TABLE `im_owner_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `im_postmeta`
--
ALTER TABLE `im_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `im_posts`
--
ALTER TABLE `im_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `im_samples`
--
ALTER TABLE `im_samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_selections`
--
ALTER TABLE `im_selections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `im_termmeta`
--
ALTER TABLE `im_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_terms`
--
ALTER TABLE `im_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `im_term_taxonomy`
--
ALTER TABLE `im_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `im_usermeta`
--
ALTER TABLE `im_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT for table `im_users`
--
ALTER TABLE `im_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
