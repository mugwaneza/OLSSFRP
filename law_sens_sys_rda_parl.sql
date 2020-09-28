-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2020 at 06:37 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `email`, `password`, `created_at`) VALUES
(1, NULL, NULL, NULL, NULL),
(2, 'Karangwa Jules', 'karagwa@gmail.com', 'karangwa123', NULL);

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
(1, 2, 'karar@yahoo.com', 'Karangwa', 'We appreciate this platform', '2020-09-08 15:02:10'),
(4, 4, '82828', 'Chever', 'Testing comment', '2020-09-08 18:43:56'),
(5, 1, '8282822', 'Clever', 'This is not fair', '2020-09-09 08:55:45');

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
(3, NULL, 'My first qery', 'Kabera', '123', 'Please come to the paliament for discussions', '2020-09-09', '2020-09-13 21:45:40'),
(37, NULL, 'Good night', 'Kabera', '123', NULL, NULL, '2020-09-13 22:35:58'),
(38, 2, 'This system how can I use it', 'Ruvebana Claude', '1239', 'Thanks sir', '2020-09-14 17:53:45', '2020-09-13 22:35:58'),
(39, NULL, 'Good night', 'Kabera', '123', NULL, NULL, '2020-09-13 22:35:58'),
(40, NULL, 'Hello sir. I want to know when the new law of land surveilling will be implemented', 'Hertien', 'hertien@gmail.com', NULL, NULL, '2020-09-14 17:55:15'),
(41, 2, 'And I will really appreciate your feedback', 'Hertien', 'hertien@gmail.com', 'Dear Hertien we shall let you know very soon', '2020-09-14 17:57:19', '2020-09-14 17:55:51'),
(42, NULL, 'And I will really appreciate your feedback', 'Hertien', 'hertien@gmail.com', NULL, NULL, '2020-09-14 17:57:39'),
(43, NULL, 'I am still waiting\r\n', 'Heritien', 'hertien@gmail.com', NULL, NULL, '2020-09-14 17:58:21'),
(44, NULL, 'Thanks\r\n', 'Hertien', 'hertier@gmail.com', NULL, NULL, '2020-09-14 18:23:11'),
(45, NULL, 'Test inquiry\r\n', 'Hertien', 'hertien@gmail.com', NULL, NULL, '2020-09-14 18:24:03');

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
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laws`
--

INSERT INTO `laws` (`id`, `cat_id`, `admin_id`, `law_name`, `law_number`, `description`, `created_at`) VALUES
(1, 1, 1, 'Robery', 'Law 123 ', 'criminal law', '2020-09-06 12:25:29'),
(2, 2, 1, 'Wedding', 'Law 123 ', 'family', '2020-09-06 16:18:27'),
(3, 1, 1, 'Assault', 'Case law is the reduction of the judge\'s decision to writing and published in specific', 'books that publish the decisions of various courts. Some cases, for example, would', '2020-09-08 11:34:05'),
(4, 1, 1, 'Contract Disputes', 'Contract Disputes. Contract disputes occur when one or more parties who signed a contract cannot or will not fulfill their obligations. ...', 'Contract Disputes. Contract disputes occur when one or more parties who signed a contract cannot or will not fulfill their obligations. ...', '2020-09-08 11:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `laws_category`
--

CREATE TABLE `laws_category` (
  `id` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laws_category`
--

INSERT INTO `laws_category` (`id`, `admin_id`, `category_name`, `description`, `created_at`) VALUES
(1, 1, 'Criminal law', 'Aaaaah, I think I see the error of my ways. I wallPostIndex parameter', '2020-09-06 11:46:11'),
(2, 1, 'Family law', 'how to pass sql array values from java controller to scala template', '2020-09-06 16:17:41'),
(3, 2, 'Judicial laws', 'Judicial', '2020-09-09 08:53:52'),
(4, 2, 'Migration law', 'migration', '2020-09-09 08:54:20');

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
(1, 2, '02929', '2020-09-08 18:20:26'),
(5, 2, '192.168.56.1', '2020-09-08 18:33:12'),
(6, 2, '192.168.56.1', '2020-09-08 18:33:54'),
(7, 2, '192.168.56.1', '2020-09-08 18:34:26'),
(8, 2, '192.168.56.1', '2020-09-08 18:42:21'),
(9, 1, '192.168.56.1', '2020-09-08 18:42:50'),
(10, 1, '192.168.56.1', '2020-09-08 18:43:14'),
(11, 3, '192.168.56.1', '2020-09-08 18:44:51'),
(12, 3, '192.168.56.1', '2020-09-08 18:45:13'),
(13, 4, '192.168.56.1', '2020-09-08 18:45:23'),
(14, 1, '192.168.56.1', '2020-09-08 18:45:39'),
(15, 3, '192.168.56.1', '2020-09-09 08:54:55'),
(16, 3, '192.168.56.1', '2020-09-09 08:54:59'),
(17, 1, '192.168.56.1', '2020-09-09 08:55:17'),
(18, 2, '192.168.56.1', '2020-09-13 19:16:02'),
(19, 1, '192.168.56.1', '2020-09-14 18:26:45');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `laws`
--
ALTER TABLE `laws`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laws_category`
--
ALTER TABLE `laws_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laws_review`
--
ALTER TABLE `laws_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
