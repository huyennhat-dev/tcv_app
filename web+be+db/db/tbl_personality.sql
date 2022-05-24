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
-- Cấu trúc bảng cho bảng `tbl_personality`
--

CREATE TABLE `tbl_personality` (
  `id` int(10) UNSIGNED NOT NULL,
  `tentinhcach` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_personality`
--

INSERT INTO `tbl_personality` (`id`, `tentinhcach`, `slug`, `trangthai`) VALUES
(2, 'Điềm Đạm', 'diem-dam', 0),
(3, 'Nhiệt Huyết', 'nhiet-huyet', 0),
(4, 'Vô Sỉ', 'vo-si', 0),
(5, 'Nhẹ Nhàng', 'nhe-nhang', 0),
(6, 'Cơ Trí', 'co-tri', 0),
(7, 'Giảo Hoạt', 'giao-hoat', 0),
(8, 'Lãnh Khốc', 'lanh-khoc', 0),
(9, 'Ngu Ngốc', 'ngu-ngoc', 0),
(10, 'Kiêu Ngạo', 'kieu-ngao', 0),
(11, 'Thiết Huyết', 'thiet-huyet', 0),
(12, 'Hèn Mọn Bỉ Ổi', 'hen-mon-bi-oi', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_personality`
--
ALTER TABLE `tbl_personality`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_personality`
--
ALTER TABLE `tbl_personality`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
