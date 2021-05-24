-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 05:14 PM
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
-- Database: `idiscuss`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_ID` int(10) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_description` varchar(2000) NOT NULL,
  `dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_ID`, `category_name`, `category_description`, `dt`) VALUES
(1, 'php', 'PHP is a general-purpose scripting language especially suited to web development. It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994. The PHP reference implementation.', '2021-05-09 23:02:16'),
(2, 'javascript', 'JavaScript, often abbreviated as JS, is a programming language that conforms to the ECMAScript specification. JavaScript is high-level, often just-in-time compiled, and multi-paradigm. It has curly-bracket syntax, dynamic typing, prototype-based object-orientation, and first-class functions.', '2021-05-10 23:52:24'),
(3, 'django', 'Django is a high-level Python Web framework that encourages rapid development and clean, pragmatic design. Built by experienced developers, it takes care of much of the hassle of Web development, so you can focus on writing your app without needing to reinvent the wheel. It’s free and open source.', '2021-05-11 00:01:23'),
(4, 'flask', 'Welcome to Flask’s documentation. Get started with Installation and then get an overview with the Quickstart. There is also a more detailed Tutorial that shows how to create a small but complete application with Flask. Common patterns are described in the Patterns for Flask section. The rest of the docs describe each component of Flask in detail, with a full reference in the API section.', '2021-05-11 00:02:10'),
(5, 'java', 'ava is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. ', '2021-05-11 23:56:14'),
(6, 'reactjs', 'React is an open-source, front end, JavaScript library for building user interfaces or UI components. It is maintained by Facebook and a community of individual developers and companies. React can be used as a base in the development of single-page or mobile applications', '2021-05-11 23:56:44'),
(7, 'laravel', 'Laravel is a free, open-source PHP web framework, created by Taylor Otwell and intended for the development of web applications following the model–view–controller architectural pattern and based on Symfony.', '2021-05-11 23:57:19'),
(8, 'mongodb', 'MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas. MongoDB is developed by MongoDB Inc. and licensed under the Server Side Public License.', '2021-05-11 23:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(8) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_by` int(20) NOT NULL,
  `thread_id` int(8) NOT NULL,
  `comment_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_content`, `comment_by`, `thread_id`, `comment_time`) VALUES
(1, 'this is a commment section', 0, 1, '2021-05-14 20:35:03'),
(2, 'please look into my problem related to the issue', 0, 2, '2021-05-14 20:48:13'),
(3, 'this has been posted', 0, 1, '2021-05-14 20:53:53'),
(4, 'mllmmmlmxv', 0, 1, '2021-05-14 21:05:41'),
(5, 'how to start the discussion', 0, 6, '2021-05-14 21:07:10'),
(6, 'his is a platform to solve issues and doubts No Spam / Advertising / Self-promote in the forums. ... Do not post copyright-infringing material. ... Do not post “offensive” posts, links or images. ... Do not cross post questions. ... Do not PM users asking for help. ... Remain respectful of other members at all times.\r\n\r\n', 0, 6, '2021-05-16 07:34:28'),
(7, 'how to solve the issues', 0, 3, '2021-05-16 16:46:35'),
(8, 'how to solve the issues', 0, 3, '2021-05-16 16:55:12'),
(9, 'vfldnncndn', 0, 6, '2021-05-21 18:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `thread_id` int(11) NOT NULL,
  `thread_title` varchar(300) NOT NULL,
  `thread_desc` text NOT NULL,
  `thread_cat_id` int(11) NOT NULL,
  `thread_user_id` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`thread_id`, `thread_title`, `thread_desc`, `thread_cat_id`, `thread_user_id`, `time`) VALUES
(1, 'how to solve php internal error 500', 'this can be solved putting efforts', 1, 0, '2021-05-11 22:37:31'),
(2, 'how to solve internal server error 500', 'this error is due to the server problem and can be solved by contacting the developer or by refreshing.', 1, 0, '2021-05-11 23:32:00'),
(3, 'how to solve nomodule error in python', 'Add a script called run.py in /home/bodacydo/work/project and edit it like this: import programs.my_python_program programs.my_python_program.main() (replace main() with your equivalent method in my_python_program .)\r\nGo to /home/bodacydo/work/project.\r\nRun run.py.', 1, 0, '2021-05-12 20:14:10'),
(4, 'How to fix ModuleNotFoundError and ImportError?', 'first make sure you are using absolute imports.\r\nexport the project\'s root directory to PYTHONPATH.\r\n', 1, 0, '2021-05-12 20:29:16'),
(5, 'how to solve reltionship issues', 'this canbe solved by only talking', 1, 0, '2021-05-13 15:53:16'),
(6, 'kaise kre insert', 'hone de na bhai insert', 2, 0, '2021-05-13 23:26:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `SNO` int(8) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`SNO`, `user_email`, `user_password`, `timestamp`) VALUES
(1, 'ojha@ojha.com', '1555', '2021-05-16 14:12:52'),
(2, 'this@this.com', '$2y$10$FE2G4PmNxQXSwUL6qcQDxOxo1d5RYIN2oJqF9kIZ72D6sfIPEoF16', '2021-05-16 16:32:40'),
(3, 'kashu@babe.com', '$2y$10$VOOIy4zyeWk4u7tPPAUJVucDyxhagcBAV9BG7cdJ/LNknsNqpqodK', '2021-05-16 16:42:42'),
(4, 'this@e.com', '$2y$10$A09eqCOZ14X/UnNlUGFm6OEfJlWugdQf3r/qgXdi1MfQ6xwO89XSi', '2021-05-17 15:44:18'),
(5, 'please@this.com', '$2y$10$NDzKc9md2rYFk/pDLSzF/uVwdD4EKKzli4XdnaIA5i4Cjl5qRX9eO', '2021-05-17 17:09:48'),
(6, 'anand@ojha.com', '$2y$10$K9OBLQQowzmsG8JLynbvMuq6wep5cnoDNddCALO/6K8DcBiEhNLhW', '2021-05-18 08:06:01'),
(7, 'login@logout.com', '$2y$10$IYA9PSQ74tK8.A1.GFGRE.wNWA8pEYmNjT6IAPlFv1udDy2XEKTCG', '2021-05-20 08:49:07'),
(8, 'anand@anand.com', '$2y$10$lXUhq3XT84Sgh0qtEph3TeoER1x.X1CKryd8YOnMKLedGdF7kYidy', '2021-05-21 14:57:01'),
(9, 'kutta@kutiya.com', '$2y$10$qbVqJWlRPbnHSrWVixLat.iy0woMU4XANtiiS/a3gHBPFw3Fgq.Lq', '2021-05-21 18:13:54'),
(10, 'kutta@kuttiya.com', '$2y$10$SXTq/hj4LA4eCZjGRT0P1OoXvbn3IGatp.qGQTOK/0gARj8lmq3HG', '2021-05-24 14:43:41'),
(11, 'bhai@bhen.com', '$2y$10$8z1OQrc4Jyln3DnLcXVooONqytCTEhKX70PLWfALu9TrjTx3lnvaq', '2021-05-24 15:03:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_ID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`thread_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`SNO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `SNO` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
