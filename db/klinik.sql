-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jan 2021 pada 10.06
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berobata`
--

CREATE TABLE `berobata` (
  `id_berobat` int(5) NOT NULL,
  `id_pasien` int(5) NOT NULL,
  `id_dokter` int(5) NOT NULL,
  `tgl_berobat` date NOT NULL,
  `keluhan_pasien` varchar(200) NOT NULL,
  `hasil_diagnosa` varchar(200) NOT NULL,
  `penatalaksanaan` enum('Rawat Jalan','Rawat Inap','Rujuk','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berobata`
--

INSERT INTO `berobata` (`id_berobat`, `id_pasien`, `id_dokter`, `tgl_berobat`, `keluhan_pasien`, `hasil_diagnosa`, `penatalaksanaan`) VALUES
(1, 2, 3, '0000-00-00', 'Gatal di tenggorokan', 'Kanker tenggorokan', 'Rawat Jalan'),
(2, 3, 3, '0000-00-00', 'Gelisah', 'Kebutuhan Dicintai', 'Rawat Jalan'),
(3, 3, 3, '0000-00-00', '', '', 'Rawat Jalan'),
(4, 6, 5, '2021-01-09', 'Gatal di tenggorokan', 'Kanker AIDS', 'Rawat Jalan'),
(6, 8, 5, '2021-01-09', 'Sakit kepala', 'Hidrosefalus', 'Rawat Inap'),
(7, 8, 5, '2021-01-10', 'Sakit Kepala', 'Gak ada kepala', 'Rawat Inap'),
(8, 6, 5, '2021-01-10', 'Susah nelan', 'Tenggorokan pindah ke mata', 'Rawat Jalan'),
(9, 6, 7, '2021-01-15', 'Kedinginan', 'Butuh Kasih Sayang', 'Rawat Jalan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(5) NOT NULL,
  `nama_d` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_d`) VALUES
(5, 'Jhonny Sins,Sp.THT.'),
(6, 'Hitomi Tanaka,SpKK.'),
(7, 'Kang Lee,Sp.KJ.'),
(8, 'Rehan Simatupang,Sp.KO.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(5) NOT NULL,
  `name_obat` varchar(30) NOT NULL,
  `daftar_w` enum('P.No1','P.No2','P.No3','P.No4','P.No5') NOT NULL,
  `jumlah` int(15) NOT NULL,
  `harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id_obat`, `name_obat`, `daftar_w`, `jumlah`, `harga`) VALUES
(7, 'Antimo', 'P.No1', 10, 999),
(10, 'Alkohol', 'P.No3', 10, 999),
(12, 'Cocaine', 'P.No1', 10, 60000),
(13, 'Promag', 'P.No1', 10, 999),
(14, 'Anti Depresan', 'P.No1', 10, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(5) NOT NULL,
  `nama_p` varchar(30) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan','','') NOT NULL,
  `umur` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_p`, `jenis_kelamin`, `umur`) VALUES
(6, 'Eimi Fukada', 'Perempuan', 22),
(8, 'Eric Matin', 'Laki-laki', 27),
(9, 'Sutrisno Sulti', 'Perempuan', 26);

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep_obata`
--

CREATE TABLE `resep_obata` (
  `id_resep` int(5) NOT NULL,
  `id_berobat` int(5) DEFAULT NULL,
  `id_obat` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resep_obata`
--

INSERT INTO `resep_obata` (`id_resep`, `id_berobat`, `id_obat`) VALUES
(14, 8, 7),
(15, 8, 10),
(16, 8, 13),
(17, 9, 12),
(18, 9, 13),
(19, 4, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_perawat` int(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_perawat`, `nama`, `username`, `password`) VALUES
(6, 'Febriando Manik', 'Febriando', 'd41d8cd98f00b204e9800998ecf842'),
(9, 'Mia Khalifa', 'Mia', '4e1a9dd93e0af81ac97ba059275702'),
(11, 'DeadSoon', 'Happy', 'happy'),
(12, 'Simson Panggabean', 'Simson', 'e2e735edee93b141f8db7d861af5ba');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berobata`
--
ALTER TABLE `berobata`
  ADD PRIMARY KEY (`id_berobat`) USING BTREE,
  ADD KEY `FK_berobata_pasien` (`id_pasien`),
  ADD KEY `FK_berobata_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `resep_obata`
--
ALTER TABLE `resep_obata`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `FK_resep_obata_berobata` (`id_berobat`),
  ADD KEY `FK_resep_obata_obat` (`id_obat`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_perawat`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berobata`
--
ALTER TABLE `berobata`
  MODIFY `id_berobat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `resep_obata`
--
ALTER TABLE `resep_obata`
  MODIFY `id_resep` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_perawat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `berobata`
--
ALTER TABLE `berobata`
  ADD CONSTRAINT `FK_berobata_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_berobata_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep_obata`
--
ALTER TABLE `resep_obata`
  ADD CONSTRAINT `FK_resep_obata_berobata` FOREIGN KEY (`id_berobat`) REFERENCES `berobata` (`id_berobat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_resep_obata_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
