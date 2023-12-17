-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_tiketbioskop
CREATE DATABASE IF NOT EXISTS `db_tiketbioskop` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_tiketbioskop`;

-- Dumping structure for table db_tiketbioskop.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_tiketbioskop.admin: ~2 rows (approximately)
INSERT INTO `admin` (`id_admin`, `nama`, `password`) VALUES
	(1, 'aldi', 'polmed'),
	(2, 'tyler', 'polmed');

-- Dumping structure for table db_tiketbioskop.film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` varchar(100) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `poster_film` varchar(100) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  PRIMARY KEY (`id_film`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_tiketbioskop.film: ~4 rows (approximately)
INSERT INTO `film` (`id_film`, `judul`, `poster_film`, `sinopsis`) VALUES
	('F001', 'Oppenheimer', 'oppenheimer.jpg', 'Film Oppenheimer (2023) merupakan film biopik thriller buatan sutradara Christopher Nolan \\nyang bercerita tentang bapak bom atom, J. Robert Oppenheimer. \\nFilm ini akan memperlihatkan kesibukan Oppenheimer untuk menyusun \\nproyek Manhattan yang begitu terkenal di Laboratorium Los Alamos.'),
	('F002', 'Barbie', 'barbie.jpg', 'Film Barbie (2023) karya Greta Gerwig, bercerita tentang kehidupan para Barbie di Barbie Land.  \\nDi dunia itu, semua Barbie hidup dengan ekspektasi untuk menjadi sempurna. \\nSampai suatu hari, Barbie memutuskan pergi ke dunia nyata. \\nNamun, Ken (Ryan Gosling) yang mengetahui rencana Barbie pun ikut menemani perjalanannya.'),
	('F003', 'The Killer', 'thekiller.jpg', 'Film The Killer (2023) menceritakan tentang seorang pembunuh bayaran yang melakukan pembalasan dendam.\\nFilm ini disutradarai oleh David Fincher dan dibintangi oleh Michael Fassbender. \\nSuatu hari dia ditugaskan untuk melakukan pengintaian sebuah kamar hotel di Paris.  \\n Dirinya segera membidik target yang segera masuk ke kamar tersebut dan melepaskan tembakan.'),
	('F004', 'Napoleon', 'napoleon.jpg', 'Film Napoleon (2023) adalah film drama sejarah epik yang disutradarai oleh Ridley Scott \\ndan dibintangi oleh Joaquin Phoenix sebagai Napoleon Bonaparte.  \\nFilm ini menceritakan kisah kehidupan Napoleon, salah satu tokoh paling berpengaruh dalam sejarah dunia. \\nFilm ini berfokus pada kebangkitan dan kejatuhan Napoleon.');

-- Dumping structure for table db_tiketbioskop.pembelian
CREATE TABLE IF NOT EXISTS `pembelian` (
  `id_pembelian` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `id_user` int(11) NOT NULL,
  `film` varchar(30) NOT NULL,
  `tanggal` varchar(30) NOT NULL,
  `waktu` varchar(30) NOT NULL,
  `jumlah_tiket` int(11) NOT NULL,
  `total_bayar` varchar(200) NOT NULL,
  `no_bangku` text DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `id` (`id_user`) USING BTREE,
  CONSTRAINT `FK_pembelian_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tiketbioskop.pembelian: ~4 rows (approximately)
INSERT INTO `pembelian` (`id_pembelian`, `id_user`, `film`, `tanggal`, `waktu`, `jumlah_tiket`, `total_bayar`, `no_bangku`) VALUES
	('U1P2', 1, 'Oppenheimer', 'Senin, 25 Desember 2023', '20:00', 2, 'Rp 81,600', 'A7, B7'),
	('U1P3', 1, 'The Killer', 'Minggu, 24 Desember 2023', '15:00', 4, 'Rp 163,200', 'A1, A2, B1, B2'),
	('U2P1', 2, 'Oppenheimer', 'Kamis, 21 Desember 2023', '10:00', 2, 'Rp 81,600', 'A4, A5'),
	('U2P2', 2, 'Barbie', 'Sabtu, 23 Desember 2023', '20:00', 2, 'Rp 81,600', 'B7, C7'),
	('U3P1', 3, 'Barbie', 'Selasa, 26 Desember 2023', '15:00', 2, 'Rp 81,600', 'B6, B7'),
	('U4P1', 4, 'Napoleon', 'Minggu, 31 Desember 2023', '17:30', 4, 'Rp 163,200', 'A3, B3, B4, B5'),
	('U5P1', 5, 'The Killer', 'Rabu, 27 Desember 2023', '17:30', 1, 'Rp 40,800', 'A6'),
	('U5P2', 5, 'The Killer', 'Rabu, 27 Desember 2023', '17:30', 2, 'Rp 81,600', 'B3, B4'),
	('U6P1', 6, 'Napoleon', 'Jumat, 22 Desember 2023', '15:00', 4, 'Rp 163,200', 'A1, A2, B1, B2'),
	('U6P2', 6, 'Barbie', 'Kamis, 21 Desember 2023', '10:00', 2, 'Rp 81,600', 'A1, A2');

-- Dumping structure for table db_tiketbioskop.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_depan` varchar(20) NOT NULL,
  `nm_belakang` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tiketbioskop.user: ~4 rows (approximately)
INSERT INTO `user` (`id`, `nm_depan`, `nm_belakang`, `username`, `password`, `alamat`) VALUES
	(1, 'aldi', 'winandar', 'alwi', 'polmed', 'medan'),
	(2, 'ryan', 'gosling', 'keen', 'polmed', 'jambi'),
	(3, 'rahman', 'fajri', 'fajri32', 'polmed', 'medan'),
	(4, 'jack', 'smirking', 'jack44', 'polmed', 'deli serdang'),
	(5, 'asep', 'karbu', 'kasep11', 'polmed', 'binjai'),
	(6, 'Aldi', 'Harahap', 'aldi123', 'polmed', 'medan');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
