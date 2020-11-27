-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2020 at 03:39 AM
-- Server version: 5.7.24
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loket`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL,
  `agenda` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `file` varchar(150) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `agenda`, `file`) VALUES
(1, 'Kuliah Gratis', 'agenda_1606431059.png'),
(2, 'Entreprenueurial Model', 'agenda_1606430884.png'),
(3, 'E-Learning Waskita - amikom.ac.id', 'agenda_1606430761.png');

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id_instansi` int(2) NOT NULL,
  `instansi` varchar(50) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `instansi`, `telp`, `alamat`, `logo`) VALUES
(1, 'DIREKTORAT ADMINISTRASI AKADEMIK DAN KEMAHASISWAAN', '0274-884201', 'UNIVERSITAS AMIKOM YOGYAKARTA\r\nJL. RINGROAD UTARA, CONDONG CATUR, DEPOK, SLEMAN\r\nGEDUNG 4 Lantai 1', 'logo_1606423626.png');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `username` varchar(40) NOT NULL DEFAULT '',
  `nama` varchar(50) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `id_loket` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`username`, `nama`, `telp`, `alamat`, `password`, `level`, `id_loket`) VALUES
('admin', 'admin amikom', '08384494040', '-', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 'Admin', NULL),
('loket1', 'Loket 1', '08984494040', 'aaa', '8cec719e846091925976f10fe19891310fee57db', 'Penjaga', 6),
('loket1dpk', 'loket 1 dpk', '08478545', '-', '8cec719e846091925976f10fe19891310fee57db', 'Penjaga', 10),
('loket2', 'Loket 2', '083823120', 'Jl. jalan', 'e0748e097924471fcad9f5056967f07c5f24c9bc', 'Penjaga', 7),
('loket2dpk', 'loket 2 dpk', '286382', '-', 'e0748e097924471fcad9f5056967f07c5f24c9bc', 'Penjaga', 11);

-- --------------------------------------------------------

--
-- Table structure for table `loket`
--

CREATE TABLE `loket` (
  `id_loket` int(3) NOT NULL,
  `loket` varchar(40) DEFAULT NULL,
  `suara` varchar(150) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `jenis_loket` enum('DAAK','DPK') DEFAULT NULL COMMENT '"DAAK", "DPK"'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loket`
--

INSERT INTO `loket` (`id_loket`, `loket`, `suara`, `status`, `jenis_loket`) VALUES
(6, '1', NULL, 0, 'DAAK'),
(7, '2', NULL, 0, 'DAAK'),
(10, '1', NULL, 0, 'DPK'),
(11, '2', NULL, 1, 'DPK');

-- --------------------------------------------------------

--
-- Table structure for table `text_jalan`
--

CREATE TABLE `text_jalan` (
  `id_text` int(11) NOT NULL,
  `text` varchar(150) DEFAULT NULL,
  `img` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `text_jalan`
--

INSERT INTO `text_jalan` (`id_text`, `text`, `img`) VALUES
(3, 'REKAPITULASI PERSENSI KEHADIRAN LINGBIS GANJIL 2020/2021 - daak.amikom.ac.id', 'text_1606430605.png'),
(4, 'JADWAL PENGGANTI LINGKUNGAN BISNIS TGL 14 NOVEMBER MENJADI 21 NOVEMBER 2020 - daak.amikom.ac.id', 'text_1606430583.png'),
(5, 'Jadwal Pengambilan Ijazah dan Transkip Yudisium April - Juni 2020 - daak.amikom.ac.id', 'text_1606430548.png');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `no_antrian` int(11) DEFAULT NULL,
  `id_loket` int(3) NOT NULL DEFAULT '0',
  `username` varchar(40) DEFAULT NULL,
  `tgl` int(8) UNSIGNED ZEROFILL DEFAULT '00000000',
  `jenis_pelayanan` enum('DAAK','DPK') NOT NULL DEFAULT 'DAAK' COMMENT '"DAAK", "DPK"',
  `panggil` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `no_antrian`, `id_loket`, `username`, `tgl`, `jenis_pelayanan`, `panggil`) VALUES
(19, 1, 8, 'loket3', 12112017, 'DAAK', NULL),
(20, 2, 6, 'loket1', 12112017, 'DAAK', NULL),
(21, 3, 6, 'loket1', 12112017, 'DAAK', NULL),
(22, 4, 0, NULL, 12112017, 'DAAK', NULL),
(23, 5, 0, NULL, 12112017, 'DAAK', NULL),
(24, 6, 0, NULL, 12112017, 'DAAK', NULL),
(25, 1, 0, NULL, 14112017, 'DAAK', NULL),
(26, 2, 0, NULL, 14112017, 'DAAK', NULL),
(27, 1, 6, 'loket1', 16112017, 'DAAK', NULL),
(28, 2, 6, 'loket1', 16112017, 'DAAK', NULL),
(29, 3, 7, 'loket2', 16112017, 'DAAK', NULL),
(30, 1, 6, 'loket1', 17112017, 'DAAK', NULL),
(31, 2, 7, 'loket2', 17112017, 'DAAK', NULL),
(32, 3, 8, 'loket3', 17112017, 'DAAK', NULL),
(33, 4, 9, 'loket4', 17112017, 'DAAK', NULL),
(34, 5, 0, NULL, 17112017, 'DAAK', NULL),
(35, 6, 0, NULL, 17112017, 'DAAK', NULL),
(36, 7, 0, NULL, 17112017, 'DAAK', NULL),
(37, 8, 0, NULL, 17112017, 'DAAK', NULL),
(38, 9, 0, NULL, 17112017, 'DAAK', NULL),
(39, 10, 0, NULL, 17112017, 'DAAK', NULL),
(40, 11, 0, NULL, 17112017, 'DAAK', NULL),
(41, 12, 0, NULL, 17112017, 'DAAK', NULL),
(42, 13, 0, NULL, 17112017, 'DAAK', NULL),
(43, 14, 0, NULL, 17112017, 'DAAK', NULL),
(44, 15, 0, NULL, 17112017, 'DAAK', NULL),
(45, 16, 0, NULL, 17112017, 'DAAK', NULL),
(46, 17, 0, NULL, 17112017, 'DAAK', NULL),
(47, 18, 0, NULL, 17112017, 'DAAK', NULL),
(48, 19, 0, NULL, 17112017, 'DAAK', NULL),
(49, 20, 0, NULL, 17112017, 'DAAK', NULL),
(50, 21, 0, NULL, 17112017, 'DAAK', NULL),
(51, 22, 0, NULL, 17112017, 'DAAK', NULL),
(52, 23, 0, NULL, 17112017, 'DAAK', NULL),
(53, 24, 0, NULL, 17112017, 'DAAK', NULL),
(54, 25, 0, NULL, 17112017, 'DAAK', NULL),
(55, 26, 0, NULL, 17112017, 'DAAK', NULL),
(56, 27, 0, NULL, 17112017, 'DAAK', NULL),
(57, 28, 0, NULL, 17112017, 'DAAK', NULL),
(58, 29, 0, NULL, 17112017, 'DAAK', NULL),
(59, 1, 6, 'loket1', 10012020, 'DAAK', NULL),
(60, 2, 0, NULL, 10012020, 'DAAK', NULL),
(61, 1, 0, NULL, 25112020, 'DAAK', NULL),
(62, 1, 6, 'loket1', 26112020, 'DAAK', NULL),
(63, 2, 6, 'loket1', 26112020, 'DAAK', NULL),
(64, 3, 6, 'loket1', 26112020, 'DAAK', NULL),
(65, 4, 7, 'loket2', 26112020, 'DAAK', NULL),
(66, 1, 7, 'loket2', 27112020, 'DAAK', NULL),
(67, 2, 6, 'loket1', 27112020, 'DAAK', NULL),
(68, 3, 7, 'loket2', 27112020, 'DAAK', NULL),
(69, 4, 6, 'loket1', 27112020, 'DAAK', NULL),
(70, 5, 6, 'loket1', 27112020, 'DAAK', NULL),
(71, 6, 6, 'loket1', 27112020, 'DAAK', NULL),
(72, 7, 7, 'loket2', 27112020, 'DAAK', NULL),
(73, 8, 6, 'loket1', 27112020, 'DAAK', '0000-00-00 00:00:00'),
(74, 9, 6, 'loket1', 27112020, 'DAAK', '2020-11-27 10:21:20'),
(75, 1, 10, 'loket1dpk', 27112020, 'DPK', NULL),
(76, 10, 6, 'loket1', 27112020, 'DAAK', '2020-11-27 10:23:53'),
(77, 2, 11, 'loket2dpk', 27112020, 'DPK', '0000-00-00 00:00:00'),
(78, 11, 6, 'loket1', 27112020, 'DAAK', '2020-11-27 10:24:06'),
(79, 12, 6, 'loket1', 27112020, 'DAAK', '2020-11-27 10:24:21'),
(80, 3, 10, 'loket1dpk', 27112020, 'DPK', '2020-11-27 10:22:33'),
(81, 4, 11, 'loket2dpk', 27112020, 'DPK', '2020-11-27 10:38:35'),
(82, 5, 0, NULL, 27112020, 'DPK', NULL),
(83, 6, 0, NULL, 27112020, 'DPK', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`username`),
  ADD KEY `id_loket` (`id_loket`);

--
-- Indexes for table `loket`
--
ALTER TABLE `loket`
  ADD PRIMARY KEY (`id_loket`);

--
-- Indexes for table `text_jalan`
--
ALTER TABLE `text_jalan`
  ADD PRIMARY KEY (`id_text`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `panggil` (`panggil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loket`
--
ALTER TABLE `loket`
  MODIFY `id_loket` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `text_jalan`
--
ALTER TABLE `text_jalan`
  MODIFY `id_text` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_loket`) REFERENCES `loket` (`id_loket`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
