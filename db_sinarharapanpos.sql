-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 04:16 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sinarharapanpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_akun`
--

CREATE TABLE `tb_akun` (
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `level` enum('admin','karyawan') NOT NULL,
  `id_karyawan` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_akun`
--

INSERT INTO `tb_akun` (`username`, `password`, `level`, `id_karyawan`) VALUES
('admin', '123456', 'admin', 'AD0001'),
('adr', '456', 'karyawan', 'KR0002'),
('asd', '13', 'karyawan', 'KR0001'),
('tes', '123', 'karyawan', 'KR0003');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` char(6) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `kuantitas` int(6) NOT NULL,
  `harga_beli` int(8) NOT NULL,
  `harga_jual` int(8) NOT NULL,
  `id_jenis` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `kuantitas`, `harga_beli`, `harga_jual`, `id_jenis`) VALUES
('BR0001', 'Nippon paint 1kg', 8, 12000, 15000, 'JS001'),
('BR0002', 'Nippont paint 2kg', 12, 20000, 23000, 'JS001'),
('BR0003', 'rucika tipe 1', 16, 20000, 22000, 'JS002'),
('BR0004', 'Pipa Tipe 77', 2546, 12300, 15000, 'JS002'),
('BR0009', 'asdasd', 12, 12, 12, 'JS001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pembelian`
--

CREATE TABLE `tb_detail_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detail_pembelian`
--

INSERT INTO `tb_detail_pembelian` (`id_pembelian`, `id_barang`, `jumlah`) VALUES
(1, 'BR0004', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_penjualan`
--

CREATE TABLE `tb_detail_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detail_penjualan`
--

INSERT INTO `tb_detail_penjualan` (`id_penjualan`, `id_barang`, `jumlah`) VALUES
(1, 'BR0004', 2),
(2, 'BR0001', 2),
(4, 'BR0003', 2),
(4, 'BR0004', 23),
(5, 'BR0004', 2),
(5, 'BR0001', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_barang`
--

CREATE TABLE `tb_jenis_barang` (
  `id_jenis` char(6) NOT NULL,
  `nama_jenis` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jenis_barang`
--

INSERT INTO `tb_jenis_barang` (`id_jenis`, `nama_jenis`) VALUES
('JS001', 'Cat Tembok'),
('JS002', 'Pipa'),
('JS003', 'Paku'),
('JS007', 'Baut');

-- --------------------------------------------------------

--
-- Table structure for table `tb_karyawan`
--

CREATE TABLE `tb_karyawan` (
  `id_karyawan` char(6) NOT NULL,
  `nama_karyawan` varchar(225) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(225) NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_karyawan`
--

INSERT INTO `tb_karyawan` (`id_karyawan`, `nama_karyawan`, `jenis_kelamin`, `alamat`, `no_hp`, `email`, `tgl_lahir`) VALUES
('AD0001', 'admin', 'Laki-laki', '-', '-', '-', '1992-11-02'),
('KR0001', 'Satria Yuda Pamungkas', 'Laki-laki', 'Situbondo', '082332665746', 'satria@gmail.com', '1999-07-02'),
('KR0002', 'Andru Christo', 'Laki-laki', 'Jember', '082334554345', 'andru@gmail.com', '2002-03-23'),
('KR0003', 'Tes', 'Laki-laki', 'Stb', '21', 'adjsad', '2021-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ongkir`
--

CREATE TABLE `tb_ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `berat` float NOT NULL,
  `jarak` float NOT NULL,
  `harga_ongkir` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian`
--

CREATE TABLE `tb_pembelian` (
  `id_pembelian` int(4) NOT NULL,
  `tgl_pembelian` datetime NOT NULL,
  `total_harga` int(10) NOT NULL,
  `id_supplier` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pembelian`
--

INSERT INTO `tb_pembelian` (`id_pembelian`, `tgl_pembelian`, `total_harga`, `id_supplier`) VALUES
(1, '2021-12-11 09:46:50', 24600, 'SP0001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `tgl_penjualan` datetime NOT NULL,
  `total_harga` int(10) NOT NULL,
  `id_karyawan` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id_penjualan`, `tgl_penjualan`, `total_harga`, `id_karyawan`) VALUES
(1, '2021-12-11 00:09:05', 30000, 'KR0001'),
(2, '2021-12-11 00:57:49', 34500, 'KR0001'),
(4, '2021-12-11 01:04:12', 389000, 'KR0001'),
(5, '2021-12-11 01:19:25', 75000, 'KR0001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_supplier` char(6) NOT NULL,
  `nama_supplier` varchar(225) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_hp`) VALUES
('SP0001', 'PT Indo Jaya', 'Sumberwaru', '087676556788'),
('SP0002', 'PT Indah Bunga', 'Jl Ahmad Yani No 33', '082332445435');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_akun`
--
ALTER TABLE `tb_akun`
  ADD PRIMARY KEY (`username`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_jenis` (`id_jenis`);

--
-- Indexes for table `tb_detail_pembelian`
--
ALTER TABLE `tb_detail_pembelian`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indexes for table `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  ADD KEY `id_pembelian` (`id_penjualan`),
  ADD KEY `tb_detail_penjualan_ibfk_2` (`id_barang`);

--
-- Indexes for table `tb_jenis_barang`
--
ALTER TABLE `tb_jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tb_karyawan`
--
ALTER TABLE `tb_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `tb_ongkir`
--
ALTER TABLE `tb_ongkir`
  ADD PRIMARY KEY (`id_ongkir`),
  ADD KEY `id_penjualan` (`id_penjualan`);

--
-- Indexes for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_ongkir`
--
ALTER TABLE `tb_ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  MODIFY `id_pembelian` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_akun`
--
ALTER TABLE `tb_akun`
  ADD CONSTRAINT `tb_akun_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `tb_jenis_barang` (`id_jenis`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_detail_pembelian`
--
ALTER TABLE `tb_detail_pembelian`
  ADD CONSTRAINT `tb_detail_pembelian_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_pembelian_ibfk_3` FOREIGN KEY (`id_pembelian`) REFERENCES `tb_pembelian` (`id_pembelian`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  ADD CONSTRAINT `tb_detail_penjualan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_penjualan_ibfk_3` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id_penjualan`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_ongkir`
--
ALTER TABLE `tb_ongkir`
  ADD CONSTRAINT `tb_ongkir_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id_penjualan`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  ADD CONSTRAINT `tb_pembelian_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `penjualan_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
