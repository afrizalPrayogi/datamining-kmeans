-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dev-datamining
CREATE DATABASE IF NOT EXISTS `dev-datamining` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dev-datamining`;

-- Dumping structure for table dev-datamining.atribut
CREATE TABLE IF NOT EXISTS `atribut` (
  `id_atribut` int NOT NULL AUTO_INCREMENT,
  `nama_atribut` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_atribut`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dev-datamining.atribut: ~2 rows (approximately)
INSERT INTO `atribut` (`id_atribut`, `nama_atribut`) VALUES
	(1, 'jumlah stok'),
	(2, 'jumlah terjual');

-- Dumping structure for table dev-datamining.cluster
CREATE TABLE IF NOT EXISTS `cluster` (
  `id_cluster` int NOT NULL,
  `nama_cluster` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_cluster`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dev-datamining.cluster: ~3 rows (approximately)
INSERT INTO `cluster` (`id_cluster`, `nama_cluster`) VALUES
	(1, 'Cluster 1'),
	(2, 'Cluster 2'),
	(3, 'Cluster 3');

-- Dumping structure for table dev-datamining.data_barang
CREATE TABLE IF NOT EXISTS `data_barang` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dumping structure for table dev-datamining.laporan
CREATE TABLE IF NOT EXISTS `laporan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `tanggal_laporan` datetime DEFAULT NULL,
  `jumlah_iterasi` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dumping structure for table dev-datamining.laporan_hasil_akhir
CREATE TABLE IF NOT EXISTS `laporan_hasil_akhir` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_laporan` int NOT NULL,
  `nama_barang` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_cluster` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_laporan` (`id_laporan`),
  CONSTRAINT `fk_id_laporan` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7733 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- Dumping structure for table dev-datamining.laporan_hasil_akhir_atribut
CREATE TABLE IF NOT EXISTS `laporan_hasil_akhir_atribut` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_laporan_hasil_akhir` int NOT NULL,
  `nama_atribut` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `nilai` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_laporan_hasil_akhir` (`id_laporan_hasil_akhir`),
  CONSTRAINT `fk_id_laporan_hasil_akhir` FOREIGN KEY (`id_laporan_hasil_akhir`) REFERENCES `laporan_hasil_akhir` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30350 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dev-datamining.laporan_hasil_akhir_atribut: ~920 rows (approximately)


-- Dumping structure for table dev-datamining.nilai_cluster
CREATE TABLE IF NOT EXISTS `nilai_cluster` (
  `id_atribut` int NOT NULL,
  `id_cluster` int NOT NULL,
  `id_nilai_cluster` int NOT NULL AUTO_INCREMENT,
  `nilai` float NOT NULL,
  PRIMARY KEY (`id_nilai_cluster`),
  KEY `fk_nilaicluster_atribut` (`id_atribut`),
  KEY `fk_nilaicluster_cluster` (`id_cluster`),
  CONSTRAINT `fk_nilaicluster_atribut` FOREIGN KEY (`id_atribut`) REFERENCES `atribut` (`id_atribut`),
  CONSTRAINT `fk_nilaicluster_cluster` FOREIGN KEY (`id_cluster`) REFERENCES `cluster` (`id_cluster`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dev-datamining.nilai_cluster: ~6 rows (approximately)
INSERT INTO `nilai_cluster` (`id_atribut`, `id_cluster`, `id_nilai_cluster`, `nilai`) VALUES
	(1, 2, 50, 11),
	(2, 2, 51, 1),
	(1, 3, 54, 55),
	(2, 3, 55, 40),
	(1, 1, 102, 48),
	(2, 1, 103, 16);

-- Dumping structure for table dev-datamining.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dev-datamining.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `username`, `nama`, `email`, `password`, `role`, `avatar`) VALUES
	(1, 'yogi.yogi', 'Yogi', 'yogi@gmail.com', 'yogi123', 'admin', '66a793ea107e5.jpeg');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
