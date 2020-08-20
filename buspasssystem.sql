-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2020 at 07:55 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buspasssystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `bus_name` varchar(30) NOT NULL,
  `bus_from` varchar(50) NOT NULL,
  `bus_to` varchar(50) NOT NULL,
  `bus_timing` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `bus_name`, `bus_from`, `bus_to`, `bus_timing`) VALUES
(4, 'bus2', 'Bareilly', 'Delhi', '12-3'),
(5, 'bus3', 'Mumbai', 'pune', '3PM'),
(6, 'Bus3', 'Bareilly', 'Delhi', '4-7pm'),
(7, 'bus4', 'pune', 'ghazi', '12'),
(8, 'cx', 'vvc', 'fbd', '');

-- --------------------------------------------------------

--
-- Table structure for table `pass`
--

CREATE TABLE `pass` (
  `user_id` varchar(10) DEFAULT NULL,
  `validity` varchar(10) DEFAULT NULL,
  `entryDate` datetime DEFAULT NULL,
  `expDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pass`
--

INSERT INTO `pass` (`user_id`, `validity`, `entryDate`, `expDate`) VALUES
('1', '57', '2019-04-23 18:12:51', '2019-05-23 18:12:51');

--
-- Triggers `pass`
--
DELIMITER $$
CREATE TRIGGER `test_trigger` BEFORE INSERT ON `pass` FOR EACH ROW SET
NEW.entryDate = IFNULL(NeW.entryDate, NOW()),
NEW.expDate = TIMESTAMPADD(DAY,30,NEW.entryDate)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `user_id` varchar(50) NOT NULL,
  `bus_name` varchar(50) NOT NULL,
  `seat_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`user_id`, `bus_name`, `seat_number`) VALUES
('2', 'bus4', '11'),
('2', 'bus4', '14'),
('2', 'bus4', '18'),
('2', 'bus4', '19'),
('1', 'cx', '8');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `user_id` varchar(10) NOT NULL,
  `validity` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`user_id`, `validity`) VALUES
('1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pno` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `pass`, `email`, `pno`) VALUES
(1, 'Anand', '0987654321', 'anand9412868527@gmail.com', '8979669612'),
(2, 'cvh', 'cv', 'hh', '66'),
(3, 'admin', 'admin', 'admin@gmail.com', '8979669612'),
(4, 'Anand', '12345', 'ana@gmail.com', '1234567890'),
(5, 'conductor', 'conductor', 'conductor@gmail.com', '1234567890'),
(7, 'Divyansh', '1233', 'divyansh@gmail.com', '7895151554'),
(8, 'Divyansh', '12345', 'divyansh@gmail.com', '7895151554'),
(9, 'anad', '1257', 'anfgug@fg.gg', '7895151554'),
(10, 'afg', '35679', 'dfg@fvb.gh', '7895151554'),
(11, 'Shivam Pathak', '12345', 'shivam@gmail.com', '8171572849'),
(12, 'Anand', '12335', 'anand9412868527@gmail.com', '1234567890'),
(13, 'Anand', '12345', 'anand9412868527@gmail.com', '8979669612'),
(14, 'Anand', '12345', 'anand9412868527@gmail.com', '8979669612'),
(15, 'xgh', 'sfh', 'fh', '1234567890'),
(16, 'fgh', 'sch', 'fhj@fb', '1234567890'),
(17, 'sfh', 'svb', 'dg', '1234567890'),
(18, 'Divyansh', '11345', 'divyansh@gmil.com', '7895151554'),
(19, 'conductor', '12345', 'conductor@gmail.com', '1234567890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
