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
-- Cấu trúc bảng cho bảng `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(10) UNSIGNED NOT NULL,
  `truyen_id` int(11) NOT NULL,
  `avt` varchar(255) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `sosao` double NOT NULL,
  `u_id` int(11) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `ngaydang` datetime NOT NULL DEFAULT current_timestamp(),
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_rating`
--

INSERT INTO `tbl_rating` (`id`, `truyen_id`, `avt`, `ten`, `sosao`, `u_id`, `noidung`, `ngaydang`, `trangthai`) VALUES
(113, 83, 'IMG_05072022071227pm.webp', 'trương huy hoàng', 5.001, 69, 'Good', '2022-05-08 02:12:46', 1),
(114, 85, 'IMG_05072022071227pm.webp', 'trương huy hoàng', 5.001, 69, 'Good', '2022-05-08 02:13:15', 1),
(115, 89, 'IMG_05072022071227pm.webp', 'trương huy hoàng', 5.001, 69, 'Đỉnh của chóp 😍😍😍', '2022-05-08 21:48:11', 1),
(116, 89, 'IMG_05102022011608am.webp', 'Huy Hoàng', 4.001, 67, 'hahha', '2022-05-15 08:15:21', 1),
(117, 85, 'IMG_05152022114612am.webp', 'Green Lyrics', 4.001, 68, 'very good', '2022-05-15 11:38:57', 1),
(118, 53, 'IMG_05152022114612am.webp', 'Taylor Swift', 5.001, 68, 'Hay', '2022-05-15 11:42:33', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
