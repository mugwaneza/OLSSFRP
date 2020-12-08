-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2020 at 02:25 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `law_sens_sys_rda_parl`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `email`, `password`, `status`, `created_at`) VALUES
(2, 'Alexis MUGWANEZA', 'mugwales@gmail.com', 'mugwaneza123', 1, NULL),
(3, 'mpano Daniel', 'mpdaniel@gmail.com', 'mpanodaniel', 1, '2020-11-07 05:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `law_id` bigint(20) DEFAULT NULL,
  `citizen_identity` varchar(255) DEFAULT NULL,
  `citizen_name` varchar(255) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `law_id`, `citizen_identity`, `citizen_name`, `suggestion`, `created_at`) VALUES
(6, 6, 'jimy@gmail.com', 'Jimy', 'The violence is not being punished as it might be\r\n', '2020-11-07 06:23:16'),
(7, 5, '749029299292', 'Nobel uhagaze', 'I liked this law', '2020-11-15 14:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inquiry` varchar(255) DEFAULT NULL,
  `citizen_name` varchar(255) DEFAULT NULL,
  `citizen_identification` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `replied_at` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `admin_id`, `inquiry`, `citizen_name`, `citizen_identification`, `reply`, `replied_at`, `created_at`) VALUES
(46, 2, 'I wish to thank you for this platform you brought to us', 'Charles', 'charles@gmail.com', 'Thank you for your feedback', '2020-11-07 06:33:11', '2020-11-07 06:32:36'),
(47, 3, 'I want to ask you something', 'Kamana', 'kamana@gmail.com', 'Yes come on Kamana', '2020-11-15 14:12:28', '2020-11-15 14:11:51'),
(48, NULL, 'I want to ask you something', 'Kamana', 'kamana@gmail.com', NULL, NULL, '2020-11-15 14:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `laws`
--

CREATE TABLE `laws` (
  `id` bigint(20) NOT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `law_name` varchar(255) DEFAULT NULL,
  `law_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laws`
--

INSERT INTO `laws` (`id`, `cat_id`, `admin_id`, `law_name`, `law_number`, `description`, `status`, `created_at`) VALUES
(5, 5, 2, 'Majority', 'LAW Nº 32/2016 OF 28/08/2016 GOVERNING PERSONS', 'The age of majority is eighteen (18) years', 1, '2020-11-07 06:07:50'),
(6, 6, 2, 'Violence against children', 'Organic Law No 20/2006 of 22/04/2006', 'Criminal law deals with behavior that is or can be construed as an offense against the public, society', 1, '2020-11-07 06:13:24'),
(7, 7, 2, 'Breach of contract', ' N° 45/2011 RYO KUWA 25/11/2011 ', 'Breach of contract is a legal cause of action and a type of civil wrong', 1, '2020-11-07 06:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `laws_category`
--

CREATE TABLE `laws_category` (
  `id` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laws_category`
--

INSERT INTO `laws_category` (`id`, `admin_id`, `category_name`, `description`, `status`, `created_at`) VALUES
(5, 2, 'Family Law', 'Family law is a legal practice area that focuses on issues involving family relationships, such as adoption, divorce, and child custody, among others.', 1, '2020-11-07 06:01:01'),
(6, 2, 'Criminal law', ' It proscribes conduct perceived as threatening, harmful, or otherwise endangering to the property, health', 1, '2020-11-07 06:03:33'),
(7, 2, 'civil law', 'The law relating to civil wrongs and quasi-contracts is part of the civil law, as is law of property', 1, '2020-11-07 06:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `laws_review`
--

CREATE TABLE `laws_review` (
  `id` bigint(20) NOT NULL,
  `law_id` bigint(20) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `visit_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laws_review`
--

INSERT INTO `laws_review` (`id`, `law_id`, `country`, `visit_time`) VALUES
(20, 6, '192.168.1.100', '2020-11-07 06:22:35'),
(21, 7, '192.168.1.100', '2020-11-07 06:31:32'),
(22, 6, '192.168.1.145', '2020-11-13 19:36:39'),
(23, 6, '192.168.50.62', '2020-11-15 12:11:29'),
(24, 5, '192.168.50.62', '2020-11-15 14:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `play_evolutions`
--

CREATE TABLE `play_evolutions` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apply_script` text DEFAULT NULL,
  `revert_script` text DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `last_problem` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `play_evolutions`
--

INSERT INTO `play_evolutions` (`id`, `hash`, `applied_at`, `apply_script`, `revert_script`, `state`, `last_problem`) VALUES
(1, 'e1e1acc3defa97b38920317d7957b3318e3d9b67', '2020-09-06 09:42:57', 'create table admin (\nid                        bigint auto_increment not null,\nfullname                  varchar(255),\nemail                     varchar(255),\npassword                  varchar(255),\ncreated_at                datetime,\nconstraint pk_admin primary key (id))\n;\n\ncreate table comments (\nid                        bigint auto_increment not null,\nlaw_id                    bigint,\ncitizen_identity          varchar(255),\ncitizen_name              varchar(255),\nsuggestion                varchar(255),\ncreated_at                datetime,\nconstraint pk_comments primary key (id))\n;\n\ncreate table inquiries (\nid                        bigint auto_increment not null,\nadmin_id                  bigint,\ninquery                   varchar(255),\ncitizen_name              varchar(255),\ncitizen_identification    varchar(255),\nreply                     tinyint(1) default 0,\nreplied_at                varchar(255),\ncreated_at                datetime,\nconstraint pk_inquiries primary key (id))\n;\n\ncreate table laws (\nid                        bigint auto_increment not null,\ncat_id                    bigint,\nadmin_id                  bigint,\nlaw_name                  varchar(255),\nlaw_number                varchar(255),\ndescription               varchar(255),\ncreated_at                datetime,\nconstraint pk_laws primary key (id))\n;\n\ncreate table laws_category (\nid                        bigint auto_increment not null,\nadmin_id                  bigint,\ncategory_name             varchar(255),\ndescription               varchar(255),\ncreated_at                datetime,\nconstraint pk_laws_category primary key (id))\n;\n\ncreate table laws_review (\nid                        bigint auto_increment not null,\nlaw_id                    bigint,\ncountry                   varchar(255),\nvisit_time                datetime,\nconstraint pk_laws_review primary key (id))\n;\n\nalter table comments add constraint fk_comments_law_1 foreign key (law_id) references laws (id) on delete restrict on update restrict;\ncreate index ix_comments_law_1 on comments (law_id);\nalter table inquiries add constraint fk_inquiries_admin_2 foreign key (admin_id) references admin (id) on delete restrict on update restrict;\ncreate index ix_inquiries_admin_2 on inquiries (admin_id);\nalter table laws add constraint fk_laws_cat_3 foreign key (cat_id) references laws_category (id) on delete restrict on update restrict;\ncreate index ix_laws_cat_3 on laws (cat_id);\nalter table laws add constraint fk_laws_admin_4 foreign key (admin_id) references admin (id) on delete restrict on update restrict;\ncreate index ix_laws_admin_4 on laws (admin_id);\nalter table laws_category add constraint fk_laws_category_admin_5 foreign key (admin_id) references admin (id) on delete restrict on update restrict;\ncreate index ix_laws_category_admin_5 on laws_category (admin_id);\nalter table laws_review add constraint fk_laws_review_law_6 foreign key (law_id) references laws (id) on delete restrict on update restrict;\ncreate index ix_laws_review_law_6 on laws_review (law_id);', 'SET FOREIGN_KEY_CHECKS=0;\n\ndrop table admin;\n\ndrop table comments;\n\ndrop table inquiries;\n\ndrop table laws;\n\ndrop table laws_category;\n\ndrop table laws_review;\n\nSET FOREIGN_KEY_CHECKS=1;', 'applied', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_comments_law_1` (`law_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_inquiries_admin_2` (`admin_id`);

--
-- Indexes for table `laws`
--
ALTER TABLE `laws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_laws_cat_3` (`cat_id`),
  ADD KEY `ix_laws_admin_4` (`admin_id`);

--
-- Indexes for table `laws_category`
--
ALTER TABLE `laws_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_laws_category_admin_5` (`admin_id`);

--
-- Indexes for table `laws_review`
--
ALTER TABLE `laws_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_laws_review_law_6` (`law_id`);

--
-- Indexes for table `play_evolutions`
--
ALTER TABLE `play_evolutions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `laws`
--
ALTER TABLE `laws`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `laws_category`
--
ALTER TABLE `laws_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `laws_review`
--
ALTER TABLE `laws_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_law_1` FOREIGN KEY (`law_id`) REFERENCES `laws` (`id`);

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `fk_inquiries_admin_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Constraints for table `laws`
--
ALTER TABLE `laws`
  ADD CONSTRAINT `fk_laws_admin_4` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `fk_laws_cat_3` FOREIGN KEY (`cat_id`) REFERENCES `laws_category` (`id`);

--
-- Constraints for table `laws_category`
--
ALTER TABLE `laws_category`
  ADD CONSTRAINT `fk_laws_category_admin_5` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Constraints for table `laws_review`
--
ALTER TABLE `laws_review`
  ADD CONSTRAINT `fk_laws_review_law_6` FOREIGN KEY (`law_id`) REFERENCES `laws` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
