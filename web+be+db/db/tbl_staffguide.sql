-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3305
-- Thời gian đã tạo: Th5 16, 2022 lúc 12:34 PM
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
-- Cấu trúc bảng cho bảng `tbl_staffguide`
--

CREATE TABLE `tbl_staffguide` (
  `id` int(10) UNSIGNED NOT NULL,
  `cauhoi` text NOT NULL,
  `cautraloi` text NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_staffguide`
--

INSERT INTO `tbl_staffguide` (`id`, `cauhoi`, `cautraloi`, `trangthai`) VALUES
(1, 'Đăng truyện ở đây có được tiền không?', '<p>C&acirc;u trả lời l&agrave; &quot;c&ograve;n t&ugrave;y&quot; v&agrave;o bạn.<br />\r\n<br />\r\nC&aacute;c website trong hệ thống Truyen.Onl trả cho nh&agrave; xuất bản (t&aacute;c giả, dịch giả) theo cơ chế c&agrave;ng nhiều người đọc truyện bạn đăng bạn c&agrave;ng được nhiều tiền. N&ecirc;n &quot;c&ograve;n t&ugrave;y&quot; v&agrave;o truyện bạn đăng c&oacute; người đọc hay kh&ocirc;ng m&agrave; bạn c&oacute; kiếm được tiền hay kh&ocirc;ng.</p>', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_staffguide`
--
ALTER TABLE `tbl_staffguide`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_staffguide`
--
ALTER TABLE `tbl_staffguide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
