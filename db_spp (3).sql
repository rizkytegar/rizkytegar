-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 11 Mar 2021 pada 23.03
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL,
  `kompentensi_keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kompentensi_keahlian`) VALUES
(32, 'XII OTKP 1', 'OTKP'),
(35, 'XII OTKP 2', 'OTKP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bulan_dibayar` varchar(20) NOT NULL,
  `tahun_dibayar` varchar(4) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_dibayar`, `tahun_dibayar`, `jumlah_bayar`) VALUES
(2, 11, '09', '2021-03-10', '1', '1', 1),
(3, 11, '09', '2021-03-02', 'Februari', '22', 222);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(1, 'admin', 'pass', 'admin', 'admin'),
(11, 'petugas', 'petugas', 'petugas', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nisn` char(10) NOT NULL,
  `nis` char(8) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `id_spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `id_kelas`, `alamat`, `no_telp`, `id_spp`) VALUES
('09', '999', '9999', 35, 'ambon', '999', 2),
('11', '13131', '28', 30, '1313', '3', 2),
('123', '099', 'darminto o', 32, 'jogja', '0999', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `id_spp` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`id_spp`, `tahun`, `nominal`) VALUES
(2, 1, 122355111),
(3, 88, 9),
(5, 2009, 222222);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_pembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_pembayaran` (
`id_pembayaran` int(11)
,`nama_petugas` varchar(35)
,`nis` char(8)
,`nama` varchar(35)
,`nama_kelas` varchar(10)
,`kompentensi_keahlian` varchar(50)
,`tgl_bayar` date
,`bulan_dibayar` varchar(20)
,`tahun_dibayar` varchar(4)
,`jumlah_bayar` int(11)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_pembayaran`
--
DROP TABLE IF EXISTS `view_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pembayaran`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `petugas`.`nama_petugas` AS `nama_petugas`, `siswa`.`nis` AS `nis`, `siswa`.`nama` AS `nama`, `kelas`.`nama_kelas` AS `nama_kelas`, `kelas`.`kompentensi_keahlian` AS `kompentensi_keahlian`, `pembayaran`.`tgl_bayar` AS `tgl_bayar`, `pembayaran`.`bulan_dibayar` AS `bulan_dibayar`, `pembayaran`.`tahun_dibayar` AS `tahun_dibayar`, `pembayaran`.`jumlah_bayar` AS `jumlah_bayar` FROM (((`pembayaran` left join `petugas` on(`pembayaran`.`id_petugas` = `petugas`.`id_petugas`)) left join `siswa` on(`pembayaran`.`nisn` = `siswa`.`nisn`)) left join `kelas` on(`siswa`.`id_kelas` = `kelas`.`id_kelas`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `spp`
--
ALTER TABLE `spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
