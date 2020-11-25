-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jan 2020 pada 04.13
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

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
-- Struktur dari tabel `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL,
  `agenda` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `file` varchar(150) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data untuk tabel `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `agenda`, `file`) VALUES
(1, 'Osis', 'agenda_1510110916.jpg'),
(2, 'Ga tau', 'agenda_1510111008.jpg'),
(3, 'Ini nama agenda', 'agenda_1510127207.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `instansi`
--

CREATE TABLE `instansi` (
  `id_instansi` int(2) NOT NULL,
  `instansi` varchar(50) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `instansi`, `telp`, `alamat`, `logo`) VALUES
(1, 'SMK Informatika Utama', '021-321312', 'Jl. JCC Komplek PLN P2B TJBB No.61 Krukut Limo Depok', 'logo_1383876609.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
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
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`username`, `nama`, `telp`, `alamat`, `password`, `level`, `id_loket`) VALUES
('aaa', 'Aaaa', '08967987568', 'Jl. Hkasdas', '3b3690fba8bd08059eae130425396eb05ded1b7d', 'Penjaga', 6),
('admin', 'admin', '08384494040', '-', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 'Admin', NULL),
('loket1', 'Loket 1', '08984494040', 'aaa', '8cec719e846091925976f10fe19891310fee57db', 'Penjaga', 6),
('loket2', 'Loket 2', '083823120', 'Jl. jalan', '3b3690fba8bd08059eae130425396eb05ded1b7d', 'Penjaga', 7),
('loket3', 'Loket 3', '08343294', 'Cinere', '3b3690fba8bd08059eae130425396eb05ded1b7d', 'Penjaga', 8),
('loket4', 'Loket 4', '083458345', 'Gandul', '3b3690fba8bd08059eae130425396eb05ded1b7d', 'Penjaga', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `loket`
--

CREATE TABLE `loket` (
  `id_loket` int(3) NOT NULL,
  `loket` varchar(40) DEFAULT NULL,
  `suara` varchar(150) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `loket`
--

INSERT INTO `loket` (`id_loket`, `loket`, `suara`, `status`) VALUES
(6, '1', NULL, 1),
(7, '2', NULL, 0),
(8, '3', NULL, 0),
(9, '4', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `text_jalan`
--

CREATE TABLE `text_jalan` (
  `id_text` int(11) NOT NULL,
  `text` varchar(150) DEFAULT NULL,
  `img` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `text_jalan`
--

INSERT INTO `text_jalan` (`id_text`, `text`, `img`) VALUES
(1, 'Nasir sayang saropahahaha', 'text_1510111034.png'),
(2, 'Saropah sayang alpi', 'text_1510111058.jpg'),
(3, 'alpi sayang maymunah', 'text_1510111073.jpg'),
(4, 'Karena kau buktikan untukku satu kisah tentang cinta', 'text_1510125601.png'),
(5, 'Ayu si tukang ngupil', 'text_1510127085.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `no_antrian` int(11) DEFAULT NULL,
  `id_loket` int(3) NOT NULL DEFAULT '0',
  `username` varchar(40) DEFAULT NULL,
  `tgl` int(8) UNSIGNED ZEROFILL DEFAULT '00000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `no_antrian`, `id_loket`, `username`, `tgl`) VALUES
(19, 1, 8, 'loket3', 12112017),
(20, 2, 6, 'loket1', 12112017),
(21, 3, 6, 'loket1', 12112017),
(22, 4, 0, NULL, 12112017),
(23, 5, 0, NULL, 12112017),
(24, 6, 0, NULL, 12112017),
(25, 1, 0, NULL, 14112017),
(26, 2, 0, NULL, 14112017),
(27, 1, 6, 'loket1', 16112017),
(28, 2, 6, 'loket1', 16112017),
(29, 3, 7, 'loket2', 16112017),
(30, 1, 6, 'loket1', 17112017),
(31, 2, 7, 'loket2', 17112017),
(32, 3, 8, 'loket3', 17112017),
(33, 4, 9, 'loket4', 17112017),
(34, 5, 0, NULL, 17112017),
(35, 6, 0, NULL, 17112017),
(36, 7, 0, NULL, 17112017),
(37, 8, 0, NULL, 17112017),
(38, 9, 0, NULL, 17112017),
(39, 10, 0, NULL, 17112017),
(40, 11, 0, NULL, 17112017),
(41, 12, 0, NULL, 17112017),
(42, 13, 0, NULL, 17112017),
(43, 14, 0, NULL, 17112017),
(44, 15, 0, NULL, 17112017),
(45, 16, 0, NULL, 17112017),
(46, 17, 0, NULL, 17112017),
(47, 18, 0, NULL, 17112017),
(48, 19, 0, NULL, 17112017),
(49, 20, 0, NULL, 17112017),
(50, 21, 0, NULL, 17112017),
(51, 22, 0, NULL, 17112017),
(52, 23, 0, NULL, 17112017),
(53, 24, 0, NULL, 17112017),
(54, 25, 0, NULL, 17112017),
(55, 26, 0, NULL, 17112017),
(56, 27, 0, NULL, 17112017),
(57, 28, 0, NULL, 17112017),
(58, 29, 0, NULL, 17112017),
(59, 1, 6, 'loket1', 10012020),
(60, 2, 0, NULL, 10012020);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indeks untuk tabel `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `loket`
--
ALTER TABLE `loket`
  ADD PRIMARY KEY (`id_loket`);

--
-- Indeks untuk tabel `text_jalan`
--
ALTER TABLE `text_jalan`
  ADD PRIMARY KEY (`id_text`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `loket`
--
ALTER TABLE `loket`
  MODIFY `id_loket` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `text_jalan`
--
ALTER TABLE `text_jalan`
  MODIFY `id_text` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
