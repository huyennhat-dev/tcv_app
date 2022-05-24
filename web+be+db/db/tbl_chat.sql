-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3305
-- Thời gian đã tạo: Th5 16, 2022 lúc 12:33 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tcv`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_chat`
--

CREATE TABLE `tbl_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `u_id` int(11) NOT NULL,
  `noidung` varchar(150) NOT NULL,
  `ngaydang` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_chat`
--

INSERT INTO `tbl_chat` (`id`, `u_id`, `noidung`, `ngaydang`) VALUES
(32, 8, 'Hi 500 ae', '2021-11-27 19:43:43'),
(33, 8, 'mn vô có thể để lại 1 \'.\' giúp mình với ạ!', '2021-11-28 08:56:26'),
(34, 8, 'hi', '2021-11-28 16:12:08'),
(35, 8, 'hmm', '2021-11-28 16:13:05'),
(36, 26, 'hi', '2021-11-30 10:00:00'),
(37, 26, 'Ae chào nhau cái', '2021-11-30 13:56:25'),
(38, 8, 'chào ae', '2021-12-08 15:00:11'),
(39, 8, 'sádd', '2021-12-09 10:56:00'),
(40, 32, '.', '2021-12-16 17:57:51'),
(41, 33, 'hi', '2022-01-06 18:49:32');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_chat`
--
ALTER TABLE `tbl_chat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_chat`
--
ALTER TABLE `tbl_chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
