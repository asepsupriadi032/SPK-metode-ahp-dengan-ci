-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2019 at 01:09 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paket_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `gambar` varchar(255) NOT NULL DEFAULT 'default.png',
  `theme` varchar(20) NOT NULL DEFAULT 'sb_admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama`, `status`, `gambar`, `theme`) VALUES
(2, 'admin@admin.com', 'admin', 'admin', 1, 'default.png', 'sb_admin');

-- --------------------------------------------------------

--
-- Table structure for table `detail_operator`
--

CREATE TABLE `detail_operator` (
  `id_detail` int(3) NOT NULL,
  `id_operator` int(1) NOT NULL,
  `id_kuota` int(2) NOT NULL,
  `kode_operator` varchar(10) NOT NULL,
  `ket_operator` text NOT NULL,
  `masa_aktif` varchar(20) NOT NULL,
  `harga` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_operator`
--

INSERT INTO `detail_operator` (`id_detail`, `id_operator`, `id_kuota`, `kode_operator`, `ket_operator`, `masa_aktif`, `harga`) VALUES
(2, 3, 34, 'DSK35', '<p>\r\n	Kuota 50GB + 2GB videomax (sesuai ZONA)</p>\r\n', '30 HARI', '200,000'),
(3, 3, 28, 'DSK25', '<p>\r\n	Kuota 25GB + 2GB videomax (sesuai ZONA)</p>\r\n', '30 HARI', '155,000'),
(4, 3, 23, 'DSK12', '<p>\r\n	Kuota 12GB + 2GB videomax (sesuai ZONA)</p>\r\n', '30 HARI', '99,000'),
(5, 3, 22, 'DSC10', '<p>\r\n	Kuota combo&nbsp; 10GB + 2GB videomax + 100menit + 100sms sesama tsel</p>\r\n', '30 HARI', '99,000'),
(6, 3, 20, 'DSK8', '<p>\r\n	Kuota 8GB + 2GB videomax (sesuai ZONA)</p>\r\n', '30 HARI', '85,000'),
(7, 3, 19, 'DS100', '<p>\r\n	Kuota 3,5GB + 2GB 4G + 2GBmidnight (sesuai ZONA)</p>\r\n', '30 HARI', '97,500'),
(8, 3, 17, 'DSK3', '<p>\r\n	Kuota 4,5GB + 2GB videomax (sesuai ZONA)</p>\r\n', '30 HARI', '60,000'),
(9, 3, 14, 'DSK1', '<p>\r\n	Kuota 2GB + 2GB videomax (sesuai ZONA)</p>\r\n', '30 HARI', '35,000'),
(10, 3, 13, 'DS50', '<p>\r\n	Kuota 1,2GB + 2GBmidnight (sesuai ZONA)</p>\r\n', '30 HARI', '49,650'),
(11, 3, 10, 'DSC2', '<p>\r\n	Kuuota combo 2GB + 2GB videomax + 60menit + 60sms sesama tsel</p>\r\n', '30 HARI', '60,000'),
(12, 3, 6, 'DS25', '<p>\r\n	&nbsp;Kuota 500MB (sesuai ZONA)</p>\r\n', '30 HARI', '25,100'),
(13, 3, 5, 'DS20', '<p>\r\n	Kuota 340MB (sesuai ZONA)</p>\r\n', '7 HARI', '20,200'),
(14, 3, 4, 'DS10', '<p>\r\n	Kuota 80MB (sesuai ZONA)</p>\r\n', '7 HARI', '10,600'),
(15, 6, 36, 'DXXC70', '<p>\r\n	Kuota 35GB (ALL) + 35GB(Youtube 24jam) + 140MNT TELP ALL OPERATOR</p>\r\n', '30 HARI', '215,500'),
(16, 6, 32, 'DXXC40', '<p>\r\n	Kuota 20GB (ALL) + 20GB(Youtube 24jam) + 100MNT TELP ALL OPERATOR</p>\r\n', '30 HARI', '161,800'),
(17, 6, 31, 'DXXC30', '<p>\r\n	Kuota 15GB (ALL) + 15GB(Youtube 24jam) + 60MNT TELP ALL OPERATOR</p>\r\n', '30 HARI', '116,900'),
(18, 6, 26, 'DXXC20', '<p>\r\n	Kuota 10GB (ALL) + 10GB(Youtube 24jam) + 40MNT TELP ALL OPERATOR</p>\r\n', '30 HARI', '81,000'),
(19, 6, 22, 'DXXC10', '<p>\r\n	Kuota 5GB (ALL) + 5GB(Youtube 24jam) + 20MNT TELP ALL OPERATOR</p>\r\n', '30 HARI', '54,300'),
(20, 6, 20, 'DX8', '<p>\r\n	Kuota 8GB (HOTROD 24jam)&nbsp;</p>\r\n', '30 HARI', '118,900'),
(21, 6, 16, 'DX6', '<p>\r\n	Kuota 6GB (HOTROD 24jam)&nbsp;</p>\r\n', '30 HARI', '91,500'),
(22, 6, 12, 'DX3', '<p>\r\n	Kuota 3GB (HOTROD 24jam)&nbsp;</p>\r\n', '30 HARI', '56,000'),
(23, 6, 9, 'DX15', '<p>\r\n	Kuota 1,5GB (HOTROD 24jam)&nbsp;</p>\r\n', '30 HARI', '46,600'),
(24, 6, 7, 'DX800', '<p>\r\n	Kuota 800MB (HOTROD 24jam)&nbsp;</p>\r\n', '30 HARI', '29,400'),
(25, 6, 1, 'DXBBF', '<p>\r\n	BB FULL SERVICE</p>\r\n', '30 HARI', '84,717'),
(26, 6, 1, 'DXBBG', '<p>\r\n	BB GAUL (CHAT+SOSMED)</p>\r\n', '30 HARI', '47,287'),
(27, 5, 30, 'DIP4', '<p>\r\n	Kuota 4GB (3G/4G) + 4GB (apps) + 20GB (Midnight) (PROMO BERWAKTU)</p>\r\n', '30 HARI', '53.950'),
(28, 5, 29, 'DIFL', '<p>\r\n	Kuota 4GB (3G) + 8GB (4G) + 10GB (Midnight) + 4GB APPS++*tlp isat</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', ' 85,750'),
(29, 5, 24, 'DI15 ', '<p>\r\n	Kuota 15GB (3G/4G) + Unlimited APPS + Unlimited telp&amp;sms kesesama</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '106,800'),
(30, 5, 23, 'DIFM', '<p>\r\n	Kuota 2GB (3G) + 3GB (4G) + 5GB (M9dnight) + 2GB APPS++*tlp isat</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', ' 58,750'),
(31, 5, 22, 'DI10 ', '<p>\r\n	Kuota 10GB (3G/4G) + Unlimited APPS + Unlimited telp&amp;sms kesesama</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '79,625'),
(32, 5, 18, 'DI7 ', '<p>\r\n	Kuota 7GB (3G/4G) + Unlimited APPS + Unlimited sms kesesama</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '63,000'),
(33, 5, 16, 'DIMN2', '<p>\r\n	Kuota 2GB (3G/4G) + 3.5GB (Midnight) + 500MB APPS (PROMO BERWAKTU)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '30,710'),
(34, 5, 12, 'DI3', '<p>\r\n	Kuota 3GB (3G/4G) + Unlimited APPS</p>\r\n', '30 HARI', '45,200'),
(35, 5, 11, 'DIMN1', '<p>\r\n	Kuota 1GB (3G/4G) + 1GB (Midnight) + 500MB APPS (PROMO BERWAKTU)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '14,510'),
(36, 5, 10, 'DI2 ', '<p>\r\n	Kuota 2GB (3G/4G) + Unlimited APPS</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '31,610'),
(37, 5, 8, 'DIY1G1', '<p>\r\n	Kuota 1GB (3G/4G)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '15 HARI', '11,540'),
(38, 5, 8, 'DIY1G7', '<p>\r\n	Kuota 1GB (3G/4G)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '7 HARI ', '9,650 '),
(39, 5, 8, 'DI1 ', '<p>\r\n	Kuota 1GB (3G/4G) + Unlimited APPS</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '19,460'),
(40, 5, 8, 'DI1U7', '<p>\r\n	Kuota 1GB (3G/4G)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '7 HARI ', '13,500'),
(41, 5, 6, 'DI500U', '<p>\r\n	Kuota 500MB (3G/4G)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '3 HARI', '7,500 '),
(42, 5, 2, 'DIJ1', '<p>\r\n	Kuota Unlimited + 100menit telp&amp;100 sms ke semua operator</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '140,850'),
(43, 5, 1, 'DIBBG3', '<p>\r\n	CHAT + SOSMED 1 BULAN</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '56,000'),
(44, 5, 1, 'DIBBG9', '<p>\r\n	CHAT + SOSMED 3 BULAN</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '82,000'),
(45, 4, 36, 'DTCINTA10', '<p>\r\n	Kuota 10GB all + 3GB (lokal) + 5GB (4G) + 32GB (WEEKEND) + 20GB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '90 HARI', '99,600'),
(46, 4, 34, 'DTCINTA6', '<p>\r\n	Kuota 6GB ALL + 2GB (Lokal) + 3GB (4G) + 19GB (WEEKEND) + 20GB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '90 HARI', '73,000'),
(47, 4, 31, 'DT10', '<p>\r\n	Kuota 10GB (3G) + 20GB (ALL JARINGAN 2G/3G/4G) + 20GB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '119,500'),
(48, 4, 27, 'DT8', '<p>\r\n	Kuota 8GB (3G) + 16GB (ALL JARINGAN 2G/3G/4G) + 20GB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '99,750'),
(49, 4, 25, 'DT6', '<p>\r\n	Kuota 6GB (3G) + 12GB (ALL JARINGAN 2G/3G/4G) + 20GB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '75,100'),
(50, 4, 24, 'DT5', '<p>\r\n	Kuota 5GB (3G) + 10GB (ALL JARINGAN 2G/3G/4G) + 10GB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '67,250'),
(51, 4, 24, 'DTGM5', '<p>\r\n	Kuota 5GB + 3GB (LOKAL) + 7GB (MOVIE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '90 HARI', '51,500'),
(52, 4, 23, 'DT4', '<p>\r\n	Kuota 4GB (3G) + 8GB (ALL JARINGAN 2G/3G/4G) + 10GB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '54,750'),
(53, 4, 21, 'DT3', '<p>\r\n	Kuota 3GB (3G) + 6GB (ALL JARINGAN 2G/3G/4G)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '47,000'),
(54, 4, 21, 'DTGM3', '<p>\r\n	Kuota 3GB + 1GB (LOKAL) + 5GB (MOVIE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '60 HARI ', '35,500'),
(55, 4, 16, 'DT2', '<p>\r\n	Kuota 2GB (3G) + 4GB (ALL JARINGAN 2G/3G/4G)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '32,500'),
(56, 4, 16, 'DTGM2', '<p>\r\n	Kuota 2GB + 1GB (LOKAL) + 3GB (MOVIE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '60 HARI ', '27,400'),
(57, 4, 12, 'DTBM3', '<p>\r\n	Kuota 1GB + 1.5GB (LOKAL) + 500MB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '24,500'),
(58, 4, 10, 'DT1', '<p>\r\n	Kuota 1GB (3G) + 1GB (ALL JARINGAN 2G/3G/4G)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Sesuai Kartu', '20,100'),
(59, 4, 9, 'DTBM1 ', '<p>\r\n	Kuota 500MB + 500MB (LOKAL) + 500MB (KENDO)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '16,500'),
(60, 8, 35, 'DSMV200', '<p>\r\n	30GB 24 jam + 30GB (01:00-04:59) + CHAT SEPUASNYA (BBM, WA, LINE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '181,000'),
(61, 8, 33, 'DSMV150', '<p>\r\n	22.5GB 24 jam + 22.5GB (01:00-04:59) + CHAT SEPUASNYA (BBM, WA, LINE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '136,000'),
(62, 8, 31, 'DSMV100', '<p>\r\n	15GB 24 jam + 15GB (01:00-04:59) + CHAT SEPUASNYA (BBM, WA, LINE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '88,500'),
(63, 8, 24, 'DSMV60', '<p>\r\n	8GB 24 jam + 8GB (01:00-04:59) + CHAT SEPUASNYA (BBM, WA, LINE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '30 HARI', '53,500'),
(64, 8, 20, 'DSMV30', '<p>\r\n	4GB 24 jam + 4GB (01:00-04:59) + CHAT SEPUASNYA (BBM, WA, LINE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '14 HARI', '28,000'),
(65, 8, 14, 'DSMV20', '<p>\r\n	2GB 24 jam + 2GB (01:00-04:59) + CHAT SEPUASNYA (BBM, WA, LINE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '14 HARI', '19,400'),
(66, 8, 12, 'DSMV10', '<p>\r\n	1.2GB 24 jam + 1.75GB (01:00-04:59) + CHAT SEPUASNYA (BBM, WA, LINE)</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '7 HARI ', '10,550');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(1) NOT NULL,
  `kriteria` varchar(50) NOT NULL,
  `bobot` int(1) NOT NULL,
  `urutan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kriteria`, `bobot`, `urutan`) VALUES
(1, 'Promo', 2, 1),
(2, 'Harga', 4, 2),
(3, 'Kecepatan', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_provider`
--

CREATE TABLE `kriteria_provider` (
  `id_kriteria_provider` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `id_operator` int(3) NOT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria_provider`
--

INSERT INTO `kriteria_provider` (`id_kriteria_provider`, `id_kriteria`, `id_operator`, `bobot`) VALUES
(1, 2, 4, 0.23),
(2, 2, 5, 0.24),
(3, 2, 8, 0.21),
(4, 2, 3, 0.12),
(5, 2, 6, 0.2),
(6, 1, 4, 0.17),
(7, 1, 5, 0.22),
(8, 1, 8, 0.17),
(9, 1, 3, 0.18),
(10, 1, 6, 0.26),
(11, 3, 4, 0.1),
(12, 3, 5, 0.17),
(13, 3, 8, 0.12),
(14, 3, 3, 0.39),
(15, 3, 6, 0.22);

-- --------------------------------------------------------

--
-- Table structure for table `kuisioner`
--

CREATE TABLE `kuisioner` (
  `id_kuisioner` int(3) NOT NULL,
  `pertanyaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuisioner`
--

INSERT INTO `kuisioner` (`id_kuisioner`, `pertanyaan`) VALUES
(1, '<p>\r\nSebarapa puas anda menggunakan aplikasi ini?</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `kuota`
--

CREATE TABLE `kuota` (
  `id_kuota` int(2) NOT NULL,
  `jml_kuota` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuota`
--

INSERT INTO `kuota` (`id_kuota`, `jml_kuota`) VALUES
(1, 'BBM'),
(2, 'Unlimited'),
(3, '20MB'),
(4, '80MB'),
(5, '340MB'),
(6, '500MB'),
(7, '800MB'),
(8, '1GB'),
(9, '1,5GB'),
(10, '2GB'),
(11, '2,5GB'),
(12, '3GB'),
(13, '3,2GB'),
(14, '4GB'),
(15, '5GB'),
(16, '6GB'),
(17, '6,5GB'),
(18, '7GB'),
(19, '7,5GB'),
(20, '8GB'),
(21, '9GB'),
(22, '10GB'),
(23, '12GB'),
(24, '15GB'),
(25, '18GB'),
(26, '20GB'),
(27, '24GB'),
(28, '25GB'),
(29, '26GB'),
(30, '28GB'),
(31, '30GB'),
(32, '40GB'),
(33, '45GB'),
(34, '50GB'),
(35, '60GB'),
(36, '70GB');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_menu` int(11) NOT NULL DEFAULT '1',
  `nama_menu` varchar(50) NOT NULL,
  `url_menu` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `urutan` tinyint(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` enum('Admin') NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_menu`, `nama_menu`, `url_menu`, `icon`, `urutan`, `status`, `type`) VALUES
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
(36, 1, 'Proses Kalkulasi SPK', 'admin/kalkulasi', 'glyphicon glyphicon-play', 8, 0, 'Admin'),
(37, 1, 'kuota', 'admin/kuota', '', 13, 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `id_operator` int(1) NOT NULL,
  `nama_operator` varchar(50) NOT NULL,
  `gambar_operator` varchar(255) NOT NULL,
  `urutan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`id_operator`, `nama_operator`, `gambar_operator`, `urutan`) VALUES
(3, 'TELKOMSEL', '', 1),
(4, '3', '', 4),
(5, 'Indosat', '', 3),
(6, 'XL', '', 2),
(8, 'Smartfren', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pg_kuisioner`
--

CREATE TABLE `pg_kuisioner` (
  `id_pg_kuisioner` int(4) NOT NULL,
  `id_kuisioner` int(4) NOT NULL,
  `pg_kuisioner` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pg_kuisioner`
--

INSERT INTO `pg_kuisioner` (`id_pg_kuisioner`, `id_kuisioner`, `pg_kuisioner`) VALUES
(1, 1, 'Sangat Puas'),
(2, 1, 'Puas'),
(3, 1, 'Kurang Puas');

-- --------------------------------------------------------

--
-- Table structure for table `pollingg`
--

CREATE TABLE `pollingg` (
  `id_polling` int(4) NOT NULL,
  `id_kuisioner` int(4) NOT NULL,
  `id_pg_kuisioner` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_operator`
--
ALTER TABLE `detail_operator`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `kriteria_provider`
--
ALTER TABLE `kriteria_provider`
  ADD PRIMARY KEY (`id_kriteria_provider`);

--
-- Indexes for table `kuisioner`
--
ALTER TABLE `kuisioner`
  ADD PRIMARY KEY (`id_kuisioner`);

--
-- Indexes for table `kuota`
--
ALTER TABLE `kuota`
  ADD PRIMARY KEY (`id_kuota`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`id_operator`);

--
-- Indexes for table `pg_kuisioner`
--
ALTER TABLE `pg_kuisioner`
  ADD PRIMARY KEY (`id_pg_kuisioner`);

--
-- Indexes for table `pollingg`
--
ALTER TABLE `pollingg`
  ADD PRIMARY KEY (`id_polling`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `detail_operator`
--
ALTER TABLE `detail_operator`
  MODIFY `id_detail` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kriteria_provider`
--
ALTER TABLE `kriteria_provider`
  MODIFY `id_kriteria_provider` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `kuisioner`
--
ALTER TABLE `kuisioner`
  MODIFY `id_kuisioner` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kuota`
--
ALTER TABLE `kuota`
  MODIFY `id_kuota` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `id_operator` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pg_kuisioner`
--
ALTER TABLE `pg_kuisioner`
  MODIFY `id_pg_kuisioner` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pollingg`
--
ALTER TABLE `pollingg`
  MODIFY `id_polling` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
