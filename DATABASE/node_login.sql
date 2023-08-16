-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2023 at 02:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `age` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `age`) VALUES
(1, 'test@test.com', '3c9909afec25354d551dae21590bb2', 25),
(2, 'test1@test.com', 'fa585d89c851dd338a70dcf535aa2a', 25),
(3, 'test2@test.com', 'b397ea54df5f1c3dcc5e575e022a86', 22),
(4, 'test3@test.com', '5e3155774d39d97c5f9e17c108c2b3', 22),
(5, 'test33@test.com', '5e3155774d39d97c5f9e17c108c2b3', 22),
(6, 'coba@test.com', 'a665a45920422f9d417e4867efdc4f', 25),
(7, 'coba2@test.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 25),
(8, 'testdong@test.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 25),
(9, 'test22222@test.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 25),
(10, 'test3@test.c', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 25),
(11, 'test32@test.com', 'b822bb93905a9bd8b3a0c08168c427696436cf8bf37ed4ab8ebf41a07642ed1c', 15),
(12, 'test3333333333@test.com', '932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', 19),
(13, 'test322323@test.com', 'be351ab75a50892c1705a2635f076fa4b888b164c9b634e0606367b1fc796c94', 18),
(14, 'test323213213@test.com', '283beb1e3ddc7b9decf7159b6fea85bb1eca1df70e78381e86b4d93a0dea9193', 19),
(15, 'test13333@test.com', 'e07aa597c1d6b47ef708f292374c605194b4f4c68477d15bf91c9ca1ee561583', 19),
(16, 'test333332222@test.com', '06a4fb95a011076fa7a9232da26a0c9ba67a3d3b6c5ede518f4b8992ed6535bf', 20),
(17, 'test13232@test.com', '232accee73674245eac642dd91eefb84662bedeaef7d9492108c05fe23a89f13', 20),
(18, 'test323232@test.com', '0072041167e76b844c3b9392d20ded57d08a99afd2cf88a5c2bd07d3dd706f6b', 22),
(19, 'test232323@test.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 23),
(20, 'te323231st@test.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 23),
(21, 'te323232221st@test.com', '84ab17c86a6ebe9a91ae83b3d5608ecebe24edaf12566540cf7011f62f296de6', 17),
(22, 'test1@test.c', '8f55b58e4e168b4350d6544218e69d48fce8ac8224dcdd646965b5cb23255591', 12),
(23, 'test1@test.c', '8f55b58e4e168b4350d6544218e69d48fce8ac8224dcdd646965b5cb23255591', 12),
(24, 'test@test.c', 'dc9588b488dca3e81be619b0d1a735ced71ba4cc3155b1897436c0823138149f', 12),
(25, 'test@test.c', '522211685da1d2fd5021c5c58934d3be2d95f2d15a328985706963648cf0c134', 12),
(26, 'test@test.c', 'e00ad3f65e2ce8345a25279ca74bd047fd4d7c708e4c2d3de5255ad9d65d6df5', 12),
(27, 'test@test.c', '1f7d56b03eab0b20147e66b1ec1dc4dbe761ec258df39f0889b6870b4eb02e46', 12),
(28, 'test32323232123@test.com', 'dcfb60862005c7dc35f428466ae86ffa3dd8ed28362e816b1b120fdd86d1ce72', 18),
(29, 'fxade97@gmail.com', '912ec17b11906373b677ba70447193d20faef3dd7c4c6517e3a0173411e04422', 132),
(30, 'test22@test.com', '4c16f000d3e583fa0c64bb3662423a1aa72fd5f716ae7172f817dfe03372bf59', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
