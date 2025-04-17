-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 27, 2024 at 07:11 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-datamining`
--

-- --------------------------------------------------------

--
-- Table structure for table `atribut`
--

CREATE TABLE `atribut` (
  `id_atribut` int NOT NULL,
  `nama_atribut` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `atribut`
--

INSERT INTO `atribut` (`id_atribut`, `nama_atribut`) VALUES
(1, 'jumlah stok'),
(2, 'jumlah terjual'),
(3, 'Turnover(hari)');

-- --------------------------------------------------------

--
-- Table structure for table `cluster`
--

CREATE TABLE `cluster` (
  `id_cluster` int NOT NULL,
  `nama_cluster` varchar(250) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cluster`
--

INSERT INTO `cluster` (`id_cluster`, `nama_cluster`) VALUES
(1, 'Cepat Laku'),
(2, 'Sedang'),
(3, 'Lambat Laku');

-- --------------------------------------------------------

--
-- Table structure for table `data_barang`
--

CREATE TABLE `data_barang` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_barang`
--

INSERT INTO `data_barang` (`id_barang`, `nama_barang`) VALUES
(1, 'sprocket sany'),
(2, 'hydraulic pump');

-- --------------------------------------------------------

--
-- Table structure for table `data_nilai_barang`
--

CREATE TABLE `data_nilai_barang` (
  `id_atribut` int NOT NULL,
  `id_nilai_barang` int NOT NULL,
  `id_barang` int NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_nilai_barang`
--

INSERT INTO `data_nilai_barang` (`id_atribut`, `id_nilai_barang`, `id_barang`, `nilai`) VALUES
(1, 1, 1, 12),
(2, 2, 1, 9),
(3, 3, 1, 2),
(1, 4, 2, 19);

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `tanggal_laporan` datetime DEFAULT NULL,
  `jumlah_iterasi` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id`, `user_id`, `tanggal_laporan`, `jumlah_iterasi`) VALUES
(114, 1, '2024-08-08 11:03:52', '2'),
(115, 1, '2024-08-08 11:04:43', '2'),
(116, 1, '2024-08-08 11:06:56', '2'),
(117, 1, '2024-08-08 11:06:59', '2'),
(118, 1, '2024-08-08 11:07:02', '2'),
(119, 1, '2024-08-08 11:14:44', '2'),
(120, 1, '2024-08-08 11:14:47', '2'),
(121, 1, '2024-08-08 11:15:11', '2'),
(122, 1, '2024-08-08 11:15:14', '2'),
(123, 1, '2024-08-08 17:12:03', '2'),
(124, 2, '2024-08-08 21:51:38', '2'),
(125, 2, '2024-08-08 22:21:45', '2'),
(126, 1, '2024-08-13 19:03:13', '2'),
(127, 1, '2024-08-13 19:03:30', '2'),
(128, 1, '2024-10-26 16:10:39', '2'),
(129, 1, '2024-10-26 20:46:21', '2'),
(130, 1, '2024-10-26 21:22:06', '2'),
(131, 1, '2024-10-26 21:22:37', '2'),
(132, 1, '2024-10-27 11:04:01', '2');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_hasil_akhir`
--

CREATE TABLE `laporan_hasil_akhir` (
  `id` int NOT NULL,
  `id_laporan` int NOT NULL,
  `nama_barang` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `nama_cluster` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_hasil_akhir`
--

INSERT INTO `laporan_hasil_akhir` (`id`, `id_laporan`, `nama_barang`, `nama_cluster`) VALUES
(7409, 119, 'Minyak goreng', 'Cluster 1'),
(7410, 119, 'tepung', 'Cluster 1'),
(7411, 119, 'Krupuk', 'Cluster 1'),
(7412, 119, 'Aqua galon', 'Cluster 1'),
(7413, 119, 'Kopi Kapal Api', 'Cluster 1'),
(7414, 119, 'Garem', 'Cluster 1'),
(7415, 119, 'Indomie Goreng 1', 'Cluster 1'),
(7416, 119, 'Indomie Rendang', 'Cluster 1'),
(7417, 119, 'Indomie Soto', 'Cluster 1'),
(7418, 119, 'Sikat Gigi', 'Cluster 1'),
(7419, 119, 'Gula Pasir', 'Cluster 1'),
(7420, 119, 'Telur', 'Cluster 1'),
(7421, 119, 'Beras', 'Cluster 1'),
(7422, 119, 'Shampoo', 'Cluster 1'),
(7423, 119, 'Sabun Mandi', 'Cluster 1'),
(7424, 119, 'cake', 'Cluster 1'),
(7425, 120, 'Minyak goreng', 'Cluster 1'),
(7426, 120, 'tepung', 'Cluster 1'),
(7427, 120, 'Krupuk', 'Cluster 1'),
(7428, 120, 'Aqua galon', 'Cluster 1'),
(7429, 120, 'Kopi Kapal Api', 'Cluster 1'),
(7430, 120, 'Garem', 'Cluster 1'),
(7431, 120, 'Indomie Goreng 1', 'Cluster 1'),
(7432, 120, 'Indomie Rendang', 'Cluster 1'),
(7433, 120, 'Indomie Soto', 'Cluster 1'),
(7434, 120, 'Sikat Gigi', 'Cluster 1'),
(7435, 120, 'Gula Pasir', 'Cluster 1'),
(7436, 120, 'Telur', 'Cluster 1'),
(7437, 120, 'Beras', 'Cluster 1'),
(7438, 120, 'Shampoo', 'Cluster 1'),
(7439, 120, 'Sabun Mandi', 'Cluster 1'),
(7440, 120, 'cake', 'Cluster 1'),
(7441, 121, 'Minyak goreng', 'Cluster 1'),
(7442, 121, 'tepung', 'Cluster 1'),
(7443, 121, 'Krupuk', 'Cluster 1'),
(7444, 121, 'Aqua galon', 'Cluster 1'),
(7445, 121, 'Kopi Kapal Api', 'Cluster 1'),
(7446, 121, 'Garem', 'Cluster 1'),
(7447, 121, 'Indomie Goreng 1', 'Cluster 1'),
(7448, 121, 'Indomie Rendang', 'Cluster 1'),
(7449, 121, 'Indomie Soto', 'Cluster 1'),
(7450, 121, 'Sikat Gigi', 'Cluster 1'),
(7451, 121, 'Gula Pasir', 'Cluster 1'),
(7452, 121, 'Telur', 'Cluster 1'),
(7453, 121, 'Beras', 'Cluster 1'),
(7454, 121, 'Shampoo', 'Cluster 1'),
(7455, 121, 'Sabun Mandi', 'Cluster 1'),
(7456, 121, 'cake', 'Cluster 1'),
(7457, 122, 'Minyak goreng', 'Cluster 1'),
(7458, 122, 'tepung', 'Cluster 1'),
(7459, 122, 'Krupuk', 'Cluster 1'),
(7460, 122, 'Aqua galon', 'Cluster 1'),
(7461, 122, 'Kopi Kapal Api', 'Cluster 1'),
(7462, 122, 'Garem', 'Cluster 1'),
(7463, 122, 'Indomie Goreng 1', 'Cluster 1'),
(7464, 122, 'Indomie Rendang', 'Cluster 1'),
(7465, 122, 'Indomie Soto', 'Cluster 1'),
(7466, 122, 'Sikat Gigi', 'Cluster 1'),
(7467, 122, 'Gula Pasir', 'Cluster 1'),
(7468, 122, 'Telur', 'Cluster 1'),
(7469, 122, 'Beras', 'Cluster 1'),
(7470, 122, 'Shampoo', 'Cluster 1'),
(7471, 122, 'Sabun Mandi', 'Cluster 1'),
(7472, 122, 'cake', 'Cluster 1'),
(7473, 123, 'Minyak goreng', 'Cluster 1'),
(7474, 123, 'tepung', 'Cluster 1'),
(7475, 123, 'Krupuk', 'Cluster 1'),
(7476, 123, 'Aqua galon', 'Cluster 1'),
(7477, 123, 'Kopi Kapal Api', 'Cluster 1'),
(7478, 123, 'Garem', 'Cluster 1'),
(7479, 123, 'Indomie Goreng 1', 'Cluster 1'),
(7480, 123, 'Indomie Rendang', 'Cluster 1'),
(7481, 123, 'Indomie Soto', 'Cluster 1'),
(7482, 123, 'Sikat Gigi', 'Cluster 1'),
(7483, 123, 'Gula Pasir', 'Cluster 1'),
(7484, 123, 'Telur', 'Cluster 1'),
(7485, 123, 'Beras', 'Cluster 1'),
(7486, 123, 'Shampoo', 'Cluster 1'),
(7487, 123, 'Sabun Mandi', 'Cluster 1'),
(7488, 123, 'sagu', 'Cluster 1'),
(7489, 123, 'bawang', 'Cluster 1'),
(7490, 123, 'cake', 'Cluster 1'),
(7491, 124, 'Minyak goreng', 'Cluster 1'),
(7492, 124, 'tepung', 'Cluster 1'),
(7493, 124, 'Krupuk', 'Cluster 1'),
(7494, 124, 'Aqua galon', 'Cluster 1'),
(7495, 124, 'Kopi Kapal Api', 'Cluster 1'),
(7496, 124, 'Garem', 'Cluster 1'),
(7497, 124, 'Indomie Goreng 1', 'Cluster 1'),
(7498, 124, 'Indomie Rendang', 'Cluster 1'),
(7499, 124, 'Indomie Soto', 'Cluster 1'),
(7500, 124, 'Sikat Gigi', 'Cluster 1'),
(7501, 124, 'Gula Pasir', 'Cluster 1'),
(7502, 124, 'Telur', 'Cluster 1'),
(7503, 124, 'Beras', 'Cluster 1'),
(7504, 124, 'Shampoo', 'Cluster 1'),
(7505, 124, 'Sabun Mandi', 'Cluster 1'),
(7506, 124, 'sagu', 'Cluster 1'),
(7507, 124, 'bawang', 'Cluster 1'),
(7508, 124, 'bihun', 'Cluster 1'),
(7509, 124, 'cake', 'Cluster 1'),
(7510, 125, 'Minyak goreng', 'Cluster 3'),
(7511, 125, 'tepung', 'Cluster 3'),
(7512, 125, 'Krupuk', 'Cluster 3'),
(7513, 125, 'Aqua galon', 'Cluster 3'),
(7514, 125, 'Kopi Kapal Api', 'Cluster 3'),
(7515, 125, 'Garem', 'Cluster 3'),
(7516, 125, 'Indomie Goreng 1', 'Cluster 3'),
(7517, 125, 'Indomie Rendang', 'Cluster 3'),
(7518, 125, 'Indomie Soto', 'Cluster 3'),
(7519, 125, 'Sikat Gigi', 'Cluster 3'),
(7520, 125, 'Gula Pasir', 'Cluster 3'),
(7521, 125, 'Telur', 'Cluster 3'),
(7522, 125, 'Beras', 'Cluster 3'),
(7523, 125, 'Shampoo', 'Cluster 3'),
(7524, 125, 'Sabun Mandi', 'Cluster 3'),
(7525, 125, 'sagu', 'Cluster 3'),
(7526, 125, 'bawang', 'Cluster 3'),
(7527, 125, 'bihun', 'Cluster 3'),
(7528, 125, 'cake', 'Cluster 3'),
(7529, 126, 'Minyak goreng', 'Cluster 3'),
(7530, 126, 'tepung', 'Cluster 3'),
(7531, 126, 'Krupuk', 'Cluster 3'),
(7532, 126, 'Aqua galon', 'Cluster 3'),
(7533, 126, 'Kopi Kapal Api', 'Cluster 3'),
(7534, 126, 'Garem', 'Cluster 3'),
(7535, 126, 'Indomie Goreng 1', 'Cluster 3'),
(7536, 126, 'Indomie Rendang', 'Cluster 3'),
(7537, 126, 'Indomie Soto', 'Cluster 3'),
(7538, 126, 'Sikat Gigi', 'Cluster 3'),
(7539, 126, 'Gula Pasir', 'Cluster 3'),
(7540, 126, 'Telur', 'Cluster 3'),
(7541, 126, 'Beras', 'Cluster 3'),
(7542, 126, 'Shampoo', 'Cluster 3'),
(7543, 126, 'Sabun Mandi', 'Cluster 3'),
(7544, 126, 'sagu', 'Cluster 3'),
(7545, 126, 'bawang', 'Cluster 3'),
(7546, 126, 'bihun', 'Cluster 3'),
(7547, 126, 'cakes', 'Cluster 3'),
(7548, 127, 'Minyak goreng', 'Cluster 3'),
(7549, 127, 'tepung', 'Cluster 3'),
(7550, 127, 'Krupuk', 'Cluster 3'),
(7551, 127, 'Aqua galon', 'Cluster 3'),
(7552, 127, 'Kopi Kapal Api', 'Cluster 3'),
(7553, 127, 'Garem', 'Cluster 3'),
(7554, 127, 'Indomie Goreng 1', 'Cluster 3'),
(7555, 127, 'Indomie Rendang', 'Cluster 3'),
(7556, 127, 'Indomie Soto', 'Cluster 3'),
(7557, 127, 'Sikat Gigi', 'Cluster 3'),
(7558, 127, 'Gula Pasir', 'Cluster 3'),
(7559, 127, 'Telur', 'Cluster 3'),
(7560, 127, 'Beras', 'Cluster 3'),
(7561, 127, 'Shampoo', 'Cluster 3'),
(7562, 127, 'Sabun Mandi', 'Cluster 3'),
(7563, 127, 'sagu', 'Cluster 3'),
(7564, 127, 'bawang', 'Cluster 3'),
(7565, 127, 'bihun', 'Cluster 3'),
(7566, 127, 'cakes', 'Cluster 3'),
(7567, 128, 'Minyak goreng', 'Cluster 3'),
(7568, 128, 'tepung', 'Cluster 3'),
(7569, 128, 'Krupuk', 'Cluster 3'),
(7570, 128, 'Aqua galon', 'Cluster 3'),
(7571, 128, 'Kopi Kapal Api', 'Cluster 3'),
(7572, 128, 'Garem', 'Cluster 3'),
(7573, 128, 'Indomie Goreng 1', 'Cluster 3'),
(7574, 128, 'Indomie Rendang', 'Cluster 3'),
(7575, 128, 'Indomie Soto', 'Cluster 3'),
(7576, 128, 'Sikat Gigi', 'Cluster 3'),
(7577, 128, 'Gula Pasir', 'Cluster 3'),
(7578, 128, 'Telur', 'Cluster 3'),
(7579, 128, 'Beras', 'Cluster 3'),
(7580, 128, 'Shampoo', 'Cluster 3'),
(7581, 128, 'Sabun Mandi', 'Cluster 3'),
(7582, 128, 'sany', 'Cluster 3'),
(7583, 128, 'sagu', 'Cluster 3'),
(7584, 128, 'bawang', 'Cluster 3'),
(7585, 128, 'bihun', 'Cluster 3'),
(7586, 128, 'cakes', 'Cluster 3'),
(7587, 129, 'Minyak goreng', 'Cluster 3'),
(7588, 129, 'tepung', 'Cluster 3'),
(7589, 129, 'Krupuk', 'Cluster 3'),
(7590, 129, 'Aqua galon', 'Cluster 3'),
(7591, 129, 'Kopi Kapal Api', 'Cluster 3'),
(7592, 129, 'Garem', 'Cluster 3'),
(7593, 129, 'Indomie Goreng 1', 'Cluster 3'),
(7594, 129, 'Indomie Rendang', 'Cluster 3'),
(7595, 129, 'Indomie Soto', 'Cluster 3'),
(7596, 129, 'Sikat Gigi', 'Cluster 3'),
(7597, 129, 'Gula Pasir', 'Cluster 3'),
(7598, 129, 'Telur', 'Cluster 3'),
(7599, 129, 'Beras', 'Cluster 3'),
(7600, 129, 'Shampoo', 'Cluster 3'),
(7601, 129, 'Sabun Mandi', 'Cluster 3'),
(7602, 129, 'sany', 'Cluster 3'),
(7603, 129, 'sagu', 'Cluster 3'),
(7604, 129, 'bawang', 'Cluster 3'),
(7605, 129, 'bihun', 'Cluster 3'),
(7606, 129, 'cakes', 'Cluster 3'),
(7607, 130, 'Minyak goreng', 'Cluster 3'),
(7608, 130, 'tepung', 'Cluster 3'),
(7609, 130, 'Krupuk', 'Cluster 3'),
(7610, 130, 'Aqua galon', 'Cluster 3'),
(7611, 130, 'Kopi Kapal Api', 'Cluster 3'),
(7612, 130, 'Garem', 'Cluster 3'),
(7613, 130, 'Indomie Goreng 1', 'Cluster 3'),
(7614, 130, 'Indomie Rendang', 'Cluster 3'),
(7615, 130, 'Indomie Soto', 'Cluster 3'),
(7616, 130, 'Sikat Gigi', 'Cluster 3'),
(7617, 130, 'Gula Pasir', 'Cluster 3'),
(7618, 130, 'Telur', 'Cluster 3'),
(7619, 130, 'Beras', 'Cluster 3'),
(7620, 130, 'Shampoo', 'Cluster 3'),
(7621, 130, 'Sabun Mandi', 'Cluster 3'),
(7622, 130, 'sany', 'Cluster 3'),
(7623, 130, 'sagu', 'Cluster 3'),
(7624, 130, 'bawang', 'Cluster 3'),
(7625, 130, 'bihun', 'Cluster 3'),
(7626, 130, 'cakes', 'Cluster 3'),
(7627, 131, 'Minyak goreng', 'Cluster 3'),
(7628, 131, 'tepung', 'Cluster 3'),
(7629, 131, 'Krupuk', 'Cluster 3'),
(7630, 131, 'Aqua galon', 'Cluster 3'),
(7631, 131, 'Kopi Kapal Api', 'Cluster 3'),
(7632, 131, 'Garem', 'Cluster 3'),
(7633, 131, 'Indomie Goreng 1', 'Cluster 3'),
(7634, 131, 'Indomie Rendang', 'Cluster 3'),
(7635, 131, 'Indomie Soto', 'Cluster 3'),
(7636, 131, 'Sikat Gigi', 'Cluster 3'),
(7637, 131, 'Gula Pasir', 'Cluster 3'),
(7638, 131, 'Telur', 'Cluster 3'),
(7639, 131, 'Beras', 'Cluster 3'),
(7640, 131, 'Shampoo', 'Cluster 3'),
(7641, 131, 'Sabun Mandi', 'Cluster 3'),
(7642, 131, 'sany', 'Cluster 3'),
(7643, 131, 'sagu', 'Cluster 3'),
(7644, 131, 'bawang', 'Cluster 3'),
(7645, 131, 'bihun', 'Cluster 3'),
(7646, 131, 'cakes', 'Cluster 3'),
(7647, 132, 'Minyak goreng', 'Cluster 3'),
(7648, 132, 'tepung', 'Cluster 3'),
(7649, 132, 'Krupuk', 'Cluster 3'),
(7650, 132, 'Aqua galon', 'Cluster 3'),
(7651, 132, 'Kopi Kapal Api', 'Cluster 3'),
(7652, 132, 'Garem', 'Cluster 3'),
(7653, 132, 'Indomie Goreng 1', 'Cluster 3'),
(7654, 132, 'Indomie Rendang', 'Cluster 3'),
(7655, 132, 'Indomie Soto', 'Cluster 3'),
(7656, 132, 'Sikat Gigi', 'Cluster 3'),
(7657, 132, 'Gula Pasir', 'Cluster 3'),
(7658, 132, 'Telur', 'Cluster 3'),
(7659, 132, 'Beras', 'Cluster 3'),
(7660, 132, 'Shampoo', 'Cluster 3'),
(7661, 132, 'Sabun Mandi', 'Cluster 3'),
(7662, 132, 'sany', 'Cluster 3'),
(7663, 132, 'sagu', 'Cluster 3'),
(7664, 132, 'bawang', 'Cluster 3'),
(7665, 132, 'bihun', 'Cluster 3'),
(7666, 132, 'cakes', 'Cluster 3');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_hasil_akhir_atribut`
--

CREATE TABLE `laporan_hasil_akhir_atribut` (
  `id` int NOT NULL,
  `id_laporan_hasil_akhir` int NOT NULL,
  `nama_atribut` varchar(250) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_hasil_akhir_atribut`
--

INSERT INTO `laporan_hasil_akhir_atribut` (`id`, `id_laporan_hasil_akhir`, `nama_atribut`, `nilai`) VALUES
(29394, 7409, 'jumlah stok', 50),
(29395, 7409, 'jumlah terjual', 40),
(29396, 7410, 'jumlah stok', 48),
(29397, 7410, 'jumlah terjual', 16),
(29398, 7411, 'jumlah stok', 50),
(29399, 7411, 'jumlah terjual', 11),
(29400, 7412, 'jumlah stok', 30),
(29401, 7412, 'jumlah terjual', 8),
(29402, 7413, 'jumlah stok', 38),
(29403, 7413, 'jumlah terjual', 8),
(29404, 7414, 'jumlah stok', 50),
(29405, 7414, 'jumlah terjual', 18),
(29406, 7415, 'jumlah stok', 100),
(29407, 7415, 'jumlah terjual', 70),
(29408, 7416, 'jumlah stok', 30),
(29409, 7416, 'jumlah terjual', 9),
(29410, 7417, 'jumlah stok', 150),
(29411, 7417, 'jumlah terjual', 40),
(29412, 7418, 'jumlah stok', 11),
(29413, 7418, 'jumlah terjual', 1),
(29414, 7419, 'jumlah stok', 50),
(29415, 7419, 'jumlah terjual', 23),
(29416, 7420, 'jumlah stok', 90),
(29417, 7420, 'jumlah terjual', 55),
(29418, 7421, 'jumlah stok', 26),
(29419, 7421, 'jumlah terjual', 5),
(29420, 7422, 'jumlah stok', 70),
(29421, 7422, 'jumlah terjual', 10),
(29422, 7423, 'jumlah stok', 15),
(29423, 7423, 'jumlah terjual', 2),
(29424, 7424, 'jumlah stok', 0),
(29425, 7424, 'jumlah terjual', 0),
(29426, 7425, 'jumlah stok', 50),
(29427, 7425, 'jumlah terjual', 40),
(29428, 7426, 'jumlah stok', 48),
(29429, 7426, 'jumlah terjual', 16),
(29430, 7427, 'jumlah stok', 50),
(29431, 7427, 'jumlah terjual', 11),
(29432, 7428, 'jumlah stok', 30),
(29433, 7428, 'jumlah terjual', 8),
(29434, 7429, 'jumlah stok', 38),
(29435, 7429, 'jumlah terjual', 8),
(29436, 7430, 'jumlah stok', 50),
(29437, 7430, 'jumlah terjual', 18),
(29438, 7431, 'jumlah stok', 100),
(29439, 7431, 'jumlah terjual', 70),
(29440, 7432, 'jumlah stok', 30),
(29441, 7432, 'jumlah terjual', 9),
(29442, 7433, 'jumlah stok', 150),
(29443, 7433, 'jumlah terjual', 40),
(29444, 7434, 'jumlah stok', 11),
(29445, 7434, 'jumlah terjual', 1),
(29446, 7435, 'jumlah stok', 50),
(29447, 7435, 'jumlah terjual', 23),
(29448, 7436, 'jumlah stok', 90),
(29449, 7436, 'jumlah terjual', 55),
(29450, 7437, 'jumlah stok', 26),
(29451, 7437, 'jumlah terjual', 5),
(29452, 7438, 'jumlah stok', 70),
(29453, 7438, 'jumlah terjual', 10),
(29454, 7439, 'jumlah stok', 15),
(29455, 7439, 'jumlah terjual', 2),
(29456, 7440, 'jumlah stok', 0),
(29457, 7440, 'jumlah terjual', 0),
(29458, 7441, 'jumlah stok', 50),
(29459, 7441, 'jumlah terjual', 40),
(29460, 7442, 'jumlah stok', 48),
(29461, 7442, 'jumlah terjual', 16),
(29462, 7443, 'jumlah stok', 50),
(29463, 7443, 'jumlah terjual', 11),
(29464, 7444, 'jumlah stok', 30),
(29465, 7444, 'jumlah terjual', 8),
(29466, 7445, 'jumlah stok', 38),
(29467, 7445, 'jumlah terjual', 8),
(29468, 7446, 'jumlah stok', 50),
(29469, 7446, 'jumlah terjual', 18),
(29470, 7447, 'jumlah stok', 100),
(29471, 7447, 'jumlah terjual', 70),
(29472, 7448, 'jumlah stok', 30),
(29473, 7448, 'jumlah terjual', 9),
(29474, 7449, 'jumlah stok', 150),
(29475, 7449, 'jumlah terjual', 40),
(29476, 7450, 'jumlah stok', 11),
(29477, 7450, 'jumlah terjual', 1),
(29478, 7451, 'jumlah stok', 50),
(29479, 7451, 'jumlah terjual', 23),
(29480, 7452, 'jumlah stok', 90),
(29481, 7452, 'jumlah terjual', 55),
(29482, 7453, 'jumlah stok', 26),
(29483, 7453, 'jumlah terjual', 5),
(29484, 7454, 'jumlah stok', 70),
(29485, 7454, 'jumlah terjual', 10),
(29486, 7455, 'jumlah stok', 15),
(29487, 7455, 'jumlah terjual', 2),
(29488, 7456, 'jumlah stok', 0),
(29489, 7456, 'jumlah terjual', 0),
(29490, 7457, 'jumlah stok', 50),
(29491, 7457, 'jumlah terjual', 40),
(29492, 7458, 'jumlah stok', 48),
(29493, 7458, 'jumlah terjual', 16),
(29494, 7459, 'jumlah stok', 50),
(29495, 7459, 'jumlah terjual', 11),
(29496, 7460, 'jumlah stok', 30),
(29497, 7460, 'jumlah terjual', 8),
(29498, 7461, 'jumlah stok', 38),
(29499, 7461, 'jumlah terjual', 8),
(29500, 7462, 'jumlah stok', 50),
(29501, 7462, 'jumlah terjual', 18),
(29502, 7463, 'jumlah stok', 100),
(29503, 7463, 'jumlah terjual', 70),
(29504, 7464, 'jumlah stok', 30),
(29505, 7464, 'jumlah terjual', 9),
(29506, 7465, 'jumlah stok', 150),
(29507, 7465, 'jumlah terjual', 40),
(29508, 7466, 'jumlah stok', 11),
(29509, 7466, 'jumlah terjual', 1),
(29510, 7467, 'jumlah stok', 50),
(29511, 7467, 'jumlah terjual', 23),
(29512, 7468, 'jumlah stok', 90),
(29513, 7468, 'jumlah terjual', 55),
(29514, 7469, 'jumlah stok', 26),
(29515, 7469, 'jumlah terjual', 5),
(29516, 7470, 'jumlah stok', 70),
(29517, 7470, 'jumlah terjual', 10),
(29518, 7471, 'jumlah stok', 15),
(29519, 7471, 'jumlah terjual', 2),
(29520, 7472, 'jumlah stok', 0),
(29521, 7472, 'jumlah terjual', 0),
(29522, 7473, 'jumlah stok', 50),
(29523, 7473, 'jumlah terjual', 20),
(29524, 7474, 'jumlah stok', 48),
(29525, 7474, 'jumlah terjual', 16),
(29526, 7475, 'jumlah stok', 50),
(29527, 7475, 'jumlah terjual', 11),
(29528, 7476, 'jumlah stok', 30),
(29529, 7476, 'jumlah terjual', 8),
(29530, 7477, 'jumlah stok', 38),
(29531, 7477, 'jumlah terjual', 8),
(29532, 7478, 'jumlah stok', 50),
(29533, 7478, 'jumlah terjual', 18),
(29534, 7479, 'jumlah stok', 100),
(29535, 7479, 'jumlah terjual', 70),
(29536, 7480, 'jumlah stok', 30),
(29537, 7480, 'jumlah terjual', 9),
(29538, 7481, 'jumlah stok', 150),
(29539, 7481, 'jumlah terjual', 40),
(29540, 7482, 'jumlah stok', 11),
(29541, 7482, 'jumlah terjual', 1),
(29542, 7483, 'jumlah stok', 50),
(29543, 7483, 'jumlah terjual', 23),
(29544, 7484, 'jumlah stok', 90),
(29545, 7484, 'jumlah terjual', 55),
(29546, 7485, 'jumlah stok', 26),
(29547, 7485, 'jumlah terjual', 5),
(29548, 7486, 'jumlah stok', 70),
(29549, 7486, 'jumlah terjual', 10),
(29550, 7487, 'jumlah stok', 15),
(29551, 7487, 'jumlah terjual', 2),
(29552, 7488, 'jumlah stok', 15),
(29553, 7488, 'jumlah terjual', 11),
(29554, 7489, 'jumlah stok', 0),
(29555, 7489, 'jumlah terjual', 0),
(29556, 7490, 'jumlah stok', 0),
(29557, 7490, 'jumlah terjual', 0),
(29558, 7491, 'jumlah stok', 50),
(29559, 7491, 'jumlah terjual', 20),
(29560, 7492, 'jumlah stok', 48),
(29561, 7492, 'jumlah terjual', 16),
(29562, 7493, 'jumlah stok', 50),
(29563, 7493, 'jumlah terjual', 11),
(29564, 7494, 'jumlah stok', 30),
(29565, 7494, 'jumlah terjual', 8),
(29566, 7495, 'jumlah stok', 38),
(29567, 7495, 'jumlah terjual', 8),
(29568, 7496, 'jumlah stok', 50),
(29569, 7496, 'jumlah terjual', 18),
(29570, 7497, 'jumlah stok', 100),
(29571, 7497, 'jumlah terjual', 70),
(29572, 7498, 'jumlah stok', 30),
(29573, 7498, 'jumlah terjual', 9),
(29574, 7499, 'jumlah stok', 150),
(29575, 7499, 'jumlah terjual', 40),
(29576, 7500, 'jumlah stok', 11),
(29577, 7500, 'jumlah terjual', 1),
(29578, 7501, 'jumlah stok', 50),
(29579, 7501, 'jumlah terjual', 23),
(29580, 7502, 'jumlah stok', 90),
(29581, 7502, 'jumlah terjual', 55),
(29582, 7503, 'jumlah stok', 26),
(29583, 7503, 'jumlah terjual', 5),
(29584, 7504, 'jumlah stok', 70),
(29585, 7504, 'jumlah terjual', 10),
(29586, 7505, 'jumlah stok', 15),
(29587, 7505, 'jumlah terjual', 2),
(29588, 7506, 'jumlah stok', 15),
(29589, 7506, 'jumlah terjual', 11),
(29590, 7507, 'jumlah stok', 0),
(29591, 7507, 'jumlah terjual', 0),
(29592, 7508, 'jumlah stok', 0),
(29593, 7508, 'jumlah terjual', 0),
(29594, 7509, 'jumlah stok', 0),
(29595, 7509, 'jumlah terjual', 0),
(29596, 7510, 'jumlah stok', 50),
(29597, 7510, 'jumlah terjual', 20),
(29598, 7511, 'jumlah stok', 48),
(29599, 7511, 'jumlah terjual', 16),
(29600, 7512, 'jumlah stok', 50),
(29601, 7512, 'jumlah terjual', 11),
(29602, 7513, 'jumlah stok', 30),
(29603, 7513, 'jumlah terjual', 8),
(29604, 7514, 'jumlah stok', 38),
(29605, 7514, 'jumlah terjual', 8),
(29606, 7515, 'jumlah stok', 50),
(29607, 7515, 'jumlah terjual', 18),
(29608, 7516, 'jumlah stok', 100),
(29609, 7516, 'jumlah terjual', 70),
(29610, 7517, 'jumlah stok', 30),
(29611, 7517, 'jumlah terjual', 9),
(29612, 7518, 'jumlah stok', 150),
(29613, 7518, 'jumlah terjual', 40),
(29614, 7519, 'jumlah stok', 11),
(29615, 7519, 'jumlah terjual', 1),
(29616, 7520, 'jumlah stok', 50),
(29617, 7520, 'jumlah terjual', 23),
(29618, 7521, 'jumlah stok', 90),
(29619, 7521, 'jumlah terjual', 55),
(29620, 7522, 'jumlah stok', 26),
(29621, 7522, 'jumlah terjual', 5),
(29622, 7523, 'jumlah stok', 70),
(29623, 7523, 'jumlah terjual', 10),
(29624, 7524, 'jumlah stok', 15),
(29625, 7524, 'jumlah terjual', 2),
(29626, 7525, 'jumlah stok', 15),
(29627, 7525, 'jumlah terjual', 11),
(29628, 7526, 'jumlah stok', 0),
(29629, 7526, 'jumlah terjual', 0),
(29630, 7527, 'jumlah stok', 0),
(29631, 7527, 'jumlah terjual', 0),
(29632, 7528, 'jumlah stok', 0),
(29633, 7528, 'jumlah terjual', 0),
(29634, 7529, 'jumlah stok', 50),
(29635, 7529, 'jumlah terjual', 20),
(29636, 7530, 'jumlah stok', 48),
(29637, 7530, 'jumlah terjual', 16),
(29638, 7531, 'jumlah stok', 50),
(29639, 7531, 'jumlah terjual', 11),
(29640, 7532, 'jumlah stok', 30),
(29641, 7532, 'jumlah terjual', 8),
(29642, 7533, 'jumlah stok', 38),
(29643, 7533, 'jumlah terjual', 8),
(29644, 7534, 'jumlah stok', 50),
(29645, 7534, 'jumlah terjual', 18),
(29646, 7535, 'jumlah stok', 100),
(29647, 7535, 'jumlah terjual', 70),
(29648, 7536, 'jumlah stok', 30),
(29649, 7536, 'jumlah terjual', 9),
(29650, 7537, 'jumlah stok', 150),
(29651, 7537, 'jumlah terjual', 40),
(29652, 7538, 'jumlah stok', 11),
(29653, 7538, 'jumlah terjual', 1),
(29654, 7539, 'jumlah stok', 50),
(29655, 7539, 'jumlah terjual', 23),
(29656, 7540, 'jumlah stok', 90),
(29657, 7540, 'jumlah terjual', 55),
(29658, 7541, 'jumlah stok', 26),
(29659, 7541, 'jumlah terjual', 5),
(29660, 7542, 'jumlah stok', 70),
(29661, 7542, 'jumlah terjual', 10),
(29662, 7543, 'jumlah stok', 15),
(29663, 7543, 'jumlah terjual', 2),
(29664, 7544, 'jumlah stok', 15),
(29665, 7544, 'jumlah terjual', 11),
(29666, 7545, 'jumlah stok', 0),
(29667, 7545, 'jumlah terjual', 0),
(29668, 7546, 'jumlah stok', 0),
(29669, 7546, 'jumlah terjual', 0),
(29670, 7547, 'jumlah stok', 0),
(29671, 7547, 'jumlah terjual', 0),
(29672, 7548, 'jumlah stok', 50),
(29673, 7548, 'jumlah terjual', 20),
(29674, 7549, 'jumlah stok', 48),
(29675, 7549, 'jumlah terjual', 16),
(29676, 7550, 'jumlah stok', 50),
(29677, 7550, 'jumlah terjual', 11),
(29678, 7551, 'jumlah stok', 30),
(29679, 7551, 'jumlah terjual', 8),
(29680, 7552, 'jumlah stok', 38),
(29681, 7552, 'jumlah terjual', 8),
(29682, 7553, 'jumlah stok', 50),
(29683, 7553, 'jumlah terjual', 18),
(29684, 7554, 'jumlah stok', 100),
(29685, 7554, 'jumlah terjual', 70),
(29686, 7555, 'jumlah stok', 30),
(29687, 7555, 'jumlah terjual', 9),
(29688, 7556, 'jumlah stok', 150),
(29689, 7556, 'jumlah terjual', 40),
(29690, 7557, 'jumlah stok', 11),
(29691, 7557, 'jumlah terjual', 1),
(29692, 7558, 'jumlah stok', 50),
(29693, 7558, 'jumlah terjual', 23),
(29694, 7559, 'jumlah stok', 90),
(29695, 7559, 'jumlah terjual', 55),
(29696, 7560, 'jumlah stok', 26),
(29697, 7560, 'jumlah terjual', 5),
(29698, 7561, 'jumlah stok', 70),
(29699, 7561, 'jumlah terjual', 10),
(29700, 7562, 'jumlah stok', 15),
(29701, 7562, 'jumlah terjual', 2),
(29702, 7563, 'jumlah stok', 15),
(29703, 7563, 'jumlah terjual', 11),
(29704, 7564, 'jumlah stok', 0),
(29705, 7564, 'jumlah terjual', 0),
(29706, 7565, 'jumlah stok', 0),
(29707, 7565, 'jumlah terjual', 0),
(29708, 7566, 'jumlah stok', 0),
(29709, 7566, 'jumlah terjual', 0),
(29710, 7567, 'jumlah stok', 50),
(29711, 7567, 'jumlah terjual', 20),
(29712, 7568, 'jumlah stok', 48),
(29713, 7568, 'jumlah terjual', 16),
(29714, 7569, 'jumlah stok', 50),
(29715, 7569, 'jumlah terjual', 11),
(29716, 7570, 'jumlah stok', 30),
(29717, 7570, 'jumlah terjual', 8),
(29718, 7571, 'jumlah stok', 38),
(29719, 7571, 'jumlah terjual', 8),
(29720, 7572, 'jumlah stok', 50),
(29721, 7572, 'jumlah terjual', 18),
(29722, 7573, 'jumlah stok', 100),
(29723, 7573, 'jumlah terjual', 70),
(29724, 7574, 'jumlah stok', 30),
(29725, 7574, 'jumlah terjual', 9),
(29726, 7575, 'jumlah stok', 150),
(29727, 7575, 'jumlah terjual', 40),
(29728, 7576, 'jumlah stok', 11),
(29729, 7576, 'jumlah terjual', 1),
(29730, 7577, 'jumlah stok', 50),
(29731, 7577, 'jumlah terjual', 23),
(29732, 7578, 'jumlah stok', 90),
(29733, 7578, 'jumlah terjual', 55),
(29734, 7579, 'jumlah stok', 26),
(29735, 7579, 'jumlah terjual', 5),
(29736, 7580, 'jumlah stok', 70),
(29737, 7580, 'jumlah terjual', 10),
(29738, 7581, 'jumlah stok', 15),
(29739, 7581, 'jumlah terjual', 2),
(29740, 7582, 'jumlah stok', 0),
(29741, 7582, 'jumlah terjual', 0),
(29742, 7583, 'jumlah stok', 15),
(29743, 7583, 'jumlah terjual', 11),
(29744, 7584, 'jumlah stok', 0),
(29745, 7584, 'jumlah terjual', 0),
(29746, 7585, 'jumlah stok', 0),
(29747, 7585, 'jumlah terjual', 0),
(29748, 7586, 'jumlah stok', 0),
(29749, 7586, 'jumlah terjual', 0),
(29750, 7587, 'jumlah stok', 50),
(29751, 7587, 'jumlah terjual', 20),
(29752, 7588, 'jumlah stok', 48),
(29753, 7588, 'jumlah terjual', 16),
(29754, 7589, 'jumlah stok', 50),
(29755, 7589, 'jumlah terjual', 11),
(29756, 7590, 'jumlah stok', 30),
(29757, 7590, 'jumlah terjual', 8),
(29758, 7591, 'jumlah stok', 38),
(29759, 7591, 'jumlah terjual', 8),
(29760, 7592, 'jumlah stok', 50),
(29761, 7592, 'jumlah terjual', 18),
(29762, 7593, 'jumlah stok', 100),
(29763, 7593, 'jumlah terjual', 70),
(29764, 7594, 'jumlah stok', 30),
(29765, 7594, 'jumlah terjual', 9),
(29766, 7595, 'jumlah stok', 150),
(29767, 7595, 'jumlah terjual', 40),
(29768, 7596, 'jumlah stok', 11),
(29769, 7596, 'jumlah terjual', 1),
(29770, 7597, 'jumlah stok', 50),
(29771, 7597, 'jumlah terjual', 23),
(29772, 7598, 'jumlah stok', 90),
(29773, 7598, 'jumlah terjual', 55),
(29774, 7599, 'jumlah stok', 26),
(29775, 7599, 'jumlah terjual', 5),
(29776, 7600, 'jumlah stok', 70),
(29777, 7600, 'jumlah terjual', 10),
(29778, 7601, 'jumlah stok', 15),
(29779, 7601, 'jumlah terjual', 2),
(29780, 7602, 'jumlah stok', 0),
(29781, 7602, 'jumlah terjual', 0),
(29782, 7603, 'jumlah stok', 15),
(29783, 7603, 'jumlah terjual', 11),
(29784, 7604, 'jumlah stok', 0),
(29785, 7604, 'jumlah terjual', 0),
(29786, 7605, 'jumlah stok', 0),
(29787, 7605, 'jumlah terjual', 0),
(29788, 7606, 'jumlah stok', 0),
(29789, 7606, 'jumlah terjual', 0),
(29790, 7607, 'jumlah stok', 50),
(29791, 7607, 'jumlah terjual', 20),
(29792, 7608, 'jumlah stok', 48),
(29793, 7608, 'jumlah terjual', 16),
(29794, 7609, 'jumlah stok', 50),
(29795, 7609, 'jumlah terjual', 11),
(29796, 7610, 'jumlah stok', 30),
(29797, 7610, 'jumlah terjual', 8),
(29798, 7611, 'jumlah stok', 38),
(29799, 7611, 'jumlah terjual', 8),
(29800, 7612, 'jumlah stok', 50),
(29801, 7612, 'jumlah terjual', 18),
(29802, 7613, 'jumlah stok', 100),
(29803, 7613, 'jumlah terjual', 70),
(29804, 7614, 'jumlah stok', 30),
(29805, 7614, 'jumlah terjual', 9),
(29806, 7615, 'jumlah stok', 150),
(29807, 7615, 'jumlah terjual', 40),
(29808, 7616, 'jumlah stok', 11),
(29809, 7616, 'jumlah terjual', 1),
(29810, 7617, 'jumlah stok', 50),
(29811, 7617, 'jumlah terjual', 23),
(29812, 7618, 'jumlah stok', 90),
(29813, 7618, 'jumlah terjual', 55),
(29814, 7619, 'jumlah stok', 26),
(29815, 7619, 'jumlah terjual', 5),
(29816, 7620, 'jumlah stok', 70),
(29817, 7620, 'jumlah terjual', 10),
(29818, 7621, 'jumlah stok', 15),
(29819, 7621, 'jumlah terjual', 2),
(29820, 7622, 'jumlah stok', 0),
(29821, 7622, 'jumlah terjual', 0),
(29822, 7623, 'jumlah stok', 15),
(29823, 7623, 'jumlah terjual', 11),
(29824, 7624, 'jumlah stok', 0),
(29825, 7624, 'jumlah terjual', 0),
(29826, 7625, 'jumlah stok', 0),
(29827, 7625, 'jumlah terjual', 0),
(29828, 7626, 'jumlah stok', 0),
(29829, 7626, 'jumlah terjual', 0),
(29830, 7627, 'jumlah stok', 50),
(29831, 7627, 'jumlah terjual', 20),
(29832, 7628, 'jumlah stok', 48),
(29833, 7628, 'jumlah terjual', 16),
(29834, 7629, 'jumlah stok', 50),
(29835, 7629, 'jumlah terjual', 11),
(29836, 7630, 'jumlah stok', 30),
(29837, 7630, 'jumlah terjual', 8),
(29838, 7631, 'jumlah stok', 38),
(29839, 7631, 'jumlah terjual', 8),
(29840, 7632, 'jumlah stok', 50),
(29841, 7632, 'jumlah terjual', 18),
(29842, 7633, 'jumlah stok', 100),
(29843, 7633, 'jumlah terjual', 70),
(29844, 7634, 'jumlah stok', 30),
(29845, 7634, 'jumlah terjual', 9),
(29846, 7635, 'jumlah stok', 150),
(29847, 7635, 'jumlah terjual', 40),
(29848, 7636, 'jumlah stok', 11),
(29849, 7636, 'jumlah terjual', 1),
(29850, 7637, 'jumlah stok', 50),
(29851, 7637, 'jumlah terjual', 23),
(29852, 7638, 'jumlah stok', 90),
(29853, 7638, 'jumlah terjual', 55),
(29854, 7639, 'jumlah stok', 26),
(29855, 7639, 'jumlah terjual', 5),
(29856, 7640, 'jumlah stok', 70),
(29857, 7640, 'jumlah terjual', 10),
(29858, 7641, 'jumlah stok', 15),
(29859, 7641, 'jumlah terjual', 2),
(29860, 7642, 'jumlah stok', 0),
(29861, 7642, 'jumlah terjual', 0),
(29862, 7643, 'jumlah stok', 15),
(29863, 7643, 'jumlah terjual', 11),
(29864, 7644, 'jumlah stok', 0),
(29865, 7644, 'jumlah terjual', 0),
(29866, 7645, 'jumlah stok', 0),
(29867, 7645, 'jumlah terjual', 0),
(29868, 7646, 'jumlah stok', 0),
(29869, 7646, 'jumlah terjual', 0),
(29870, 7647, 'jumlah stok', 50),
(29871, 7647, 'jumlah terjual', 20),
(29872, 7648, 'jumlah stok', 48),
(29873, 7648, 'jumlah terjual', 16),
(29874, 7649, 'jumlah stok', 50),
(29875, 7649, 'jumlah terjual', 11),
(29876, 7650, 'jumlah stok', 30),
(29877, 7650, 'jumlah terjual', 8),
(29878, 7651, 'jumlah stok', 38),
(29879, 7651, 'jumlah terjual', 8),
(29880, 7652, 'jumlah stok', 50),
(29881, 7652, 'jumlah terjual', 18),
(29882, 7653, 'jumlah stok', 100),
(29883, 7653, 'jumlah terjual', 70),
(29884, 7654, 'jumlah stok', 30),
(29885, 7654, 'jumlah terjual', 9),
(29886, 7655, 'jumlah stok', 150),
(29887, 7655, 'jumlah terjual', 40),
(29888, 7656, 'jumlah stok', 11),
(29889, 7656, 'jumlah terjual', 1),
(29890, 7657, 'jumlah stok', 50),
(29891, 7657, 'jumlah terjual', 23),
(29892, 7658, 'jumlah stok', 90),
(29893, 7658, 'jumlah terjual', 55),
(29894, 7659, 'jumlah stok', 26),
(29895, 7659, 'jumlah terjual', 5),
(29896, 7660, 'jumlah stok', 70),
(29897, 7660, 'jumlah terjual', 10),
(29898, 7661, 'jumlah stok', 15),
(29899, 7661, 'jumlah terjual', 2),
(29900, 7662, 'jumlah stok', 0),
(29901, 7662, 'jumlah terjual', 0),
(29902, 7663, 'jumlah stok', 15),
(29903, 7663, 'jumlah terjual', 11),
(29904, 7664, 'jumlah stok', 0),
(29905, 7664, 'jumlah terjual', 0),
(29906, 7665, 'jumlah stok', 0),
(29907, 7665, 'jumlah terjual', 0),
(29908, 7666, 'jumlah stok', 0),
(29909, 7666, 'jumlah terjual', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_cluster`
--

CREATE TABLE `nilai_cluster` (
  `id_atribut` int NOT NULL,
  `id_cluster` int NOT NULL,
  `id_nilai_cluster` int NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai_cluster`
--

INSERT INTO `nilai_cluster` (`id_atribut`, `id_cluster`, `id_nilai_cluster`, `nilai`) VALUES
(1, 2, 50, 419),
(2, 2, 51, 15),
(3, 2, 52, 19),
(4, 2, 53, 15),
(1, 3, 54, 3),
(2, 3, 55, 23),
(3, 3, 56, 20),
(4, 3, 57, 110),
(1, 1, 102, 350),
(2, 1, 103, 11),
(3, 1, 104, 1),
(4, 1, 105, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(250) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(50) NOT NULL,
  `avatar` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `email`, `password`, `role`, `avatar`) VALUES
(1, 'yogi', 'Deni', 'yogi@gmail.com', 'yogi123', 'Admin', '66b4a1f5583f7.png'),
(2, 'Deni', 'Deni', 'deni@gmail.com', 'deni123', 'Admin', '66b4b96220107.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atribut`
--
ALTER TABLE `atribut`
  ADD PRIMARY KEY (`id_atribut`);

--
-- Indexes for table `cluster`
--
ALTER TABLE `cluster`
  ADD PRIMARY KEY (`id_cluster`);

--
-- Indexes for table `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`id_barang`) USING BTREE;

--
-- Indexes for table `data_nilai_barang`
--
ALTER TABLE `data_nilai_barang`
  ADD PRIMARY KEY (`id_nilai_barang`) USING BTREE,
  ADD KEY `fk_nilaibarang_atribut` (`id_atribut`) USING BTREE,
  ADD KEY `fk_nilaibarang_databarang` (`id_barang`) USING BTREE;

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `laporan_hasil_akhir`
--
ALTER TABLE `laporan_hasil_akhir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_hasil_akhir_atribut`
--
ALTER TABLE `laporan_hasil_akhir_atribut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_laporan_hasil_akhir` (`id_laporan_hasil_akhir`);

--
-- Indexes for table `nilai_cluster`
--
ALTER TABLE `nilai_cluster`
  ADD PRIMARY KEY (`id_nilai_cluster`),
  ADD KEY `fk_nilaicluster_atribut` (`id_atribut`),
  ADD KEY `fk_nilaicluster_cluster` (`id_cluster`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atribut`
--
ALTER TABLE `atribut`
  MODIFY `id_atribut` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `data_nilai_barang`
--
ALTER TABLE `data_nilai_barang`
  MODIFY `id_nilai_barang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=773;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `laporan_hasil_akhir`
--
ALTER TABLE `laporan_hasil_akhir`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7667;

--
-- AUTO_INCREMENT for table `laporan_hasil_akhir_atribut`
--
ALTER TABLE `laporan_hasil_akhir_atribut`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29910;

--
-- AUTO_INCREMENT for table `nilai_cluster`
--
ALTER TABLE `nilai_cluster`
  MODIFY `id_nilai_cluster` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_nilai_barang`
--
ALTER TABLE `data_nilai_barang`
  ADD CONSTRAINT `fk_nilaikelurahan_atribut` FOREIGN KEY (`id_atribut`) REFERENCES `atribut` (`id_atribut`),
  ADD CONSTRAINT `fk_nilaikelurahan_kelurahan` FOREIGN KEY (`id_barang`) REFERENCES `data_barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
