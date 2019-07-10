-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2019 at 08:36 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `paket_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `gambar` varchar(255) NOT NULL DEFAULT 'default.png',
  `theme` varchar(20) NOT NULL DEFAULT 'sb_admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama`, `status`, `gambar`, `theme`) VALUES
(2, 'admin@admin.com', 'admin', 'admin', 1, 'default.png', 'sb_admin');

-- --------------------------------------------------------

--
-- Table structure for table `detail_operator`
--

CREATE TABLE IF NOT EXISTS `detail_operator` (
  `id_detail` int(3) NOT NULL AUTO_INCREMENT,
  `id_operator` int(1) NOT NULL,
  `kode_operator` varchar(6) NOT NULL,
  `kuota_operator` varchar(10) NOT NULL,
  `ket_operator` text NOT NULL,
  `masa_aktif` varchar(10) NOT NULL,
  `harga` varchar(7) NOT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
  `id_kriteria` int(1) NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(50) NOT NULL,
  `bobot` int(1) NOT NULL,
  PRIMARY KEY (`id_kriteria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kriteria`, `bobot`) VALUES
(1, 'Promo', 2),
(2, 'Harga', 4),
(3, 'Speed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_provider`
--

CREATE TABLE IF NOT EXISTS `kriteria_provider` (
  `id_kriteria_provider` int(3) NOT NULL AUTO_INCREMENT,
  `id_kriteria` int(3) NOT NULL,
  `id_operator` int(3) NOT NULL,
  `bobot` int(1) NOT NULL,
  PRIMARY KEY (`id_kriteria_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kuisioner`
--

CREATE TABLE IF NOT EXISTS `kuisioner` (
  `id_kuisioner` int(3) NOT NULL AUTO_INCREMENT,
  `pertanyaan` text NOT NULL,
  PRIMARY KEY (`id_kuisioner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kuisioner`
--

INSERT INTO `kuisioner` (`id_kuisioner`, `pertanyaan`) VALUES
(1, '<p>\r\n	Mana kah yang lebih diminati dari 3 pilihan tersebut?</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE IF NOT EXISTS `operator` (
  `id_operator` int(1) NOT NULL AUTO_INCREMENT,
  `nama_operator` varchar(50) NOT NULL,
  `gambar_operator` varchar(255) NOT NULL,
  PRIMARY KEY (`id_operator`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`id_operator`, `nama_operator`, `gambar_operator`) VALUES
(3, 'Simpati', ''),
(4, '3', ''),
(5, 'Indosat', ''),
(6, 'XL', ''),
(8, 'Smartfren', '');

-- --------------------------------------------------------

--
-- Table structure for table `pg_kuisioner`
--

CREATE TABLE IF NOT EXISTS `pg_kuisioner` (
  `id_pg_kuisioner` int(4) NOT NULL AUTO_INCREMENT,
  `id_kuisioner` int(4) NOT NULL,
  `pg_kuisioner` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pg_kuisioner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pg_kuisioner`
--

INSERT INTO `pg_kuisioner` (`id_pg_kuisioner`, `id_kuisioner`, `pg_kuisioner`) VALUES
(1, 1, 'Harga'),
(2, 1, 'Jaringan'),
(3, 1, 'Kuota');

-- --------------------------------------------------------

--
-- Table structure for table `pollingg`
--

CREATE TABLE IF NOT EXISTS `pollingg` (
  `id_polling` int(4) NOT NULL AUTO_INCREMENT,
  `id_kuisioner` int(4) NOT NULL,
  `id_pg_kuisioner` int(4) NOT NULL,
  PRIMARY KEY (`id_polling`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tjm_menu`
--

CREATE TABLE IF NOT EXISTS `tjm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_menu` int(11) NOT NULL DEFAULT '1',
  `nama_menu` varchar(50) NOT NULL,
  `url_menu` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `urutan` tinyint(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` enum('Admin') NOT NULL DEFAULT 'Admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `tjm_menu`
--

INSERT INTO `tjm_menu` (`id`, `parent_menu`, `nama_menu`, `url_menu`, `icon`, `urutan`, `status`, `type`) VALUES
(1, 1, 'root', '/', '', 0, 0, 'Admin'),
(2, 1, 'dashboard', 'admin/dashboard', 'fa fa-fw fa-dashboard', 1, 1, 'Admin'),
(3, 1, 'User Admin', 'admin/useradmin', 'fa fa-users', 99, 0, 'Admin'),
(4, 1, 'Menu', 'admin/menu', 'fa fa-gear', 100, 1, 'Admin'),
(25, 1, 'Master', 'admin/master', 'fa fa-ticket', 2, 0, 'Admin'),
(30, 1, 'Operator', 'admin/Operator', 'glyphicon glyphicon-glass', 2, 1, 'Admin'),
(31, 1, 'Detail Operator', 'admin/Detailoperator', 'glyphicon glyphicon-pushpin', 3, 1, 'Admin'),
(32, 1, 'Kuisioner', 'admin/Kuisioner', 'glyphicon glyphicon-paperclip', 4, 1, 'Admin'),
(33, 1, 'Pilihan Kuisioner', 'admin/Pilihankuisioner', 'glyphicon glyphicon-send', 5, 1, 'Admin'),
(34, 1, 'Kriteria', 'admin/Kriteria', 'glyphicon glyphicon-certificate', 6, 1, 'Admin'),
(35, 1, 'Kriteria Provider', 'admin/kriteria_provider', 'glyphicon glyphicon-leaf', 7, 1, 'Admin'),
(36, 1, 'Proses Kalkulasi SPK', 'admin/kalkulasi', 'glyphicon glyphicon-play', 8, 0, 'Admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
