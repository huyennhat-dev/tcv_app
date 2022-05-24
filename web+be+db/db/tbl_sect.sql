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
-- Cấu trúc bảng cho bảng `tbl_sect`
--

CREATE TABLE `tbl_sect` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenluuphai` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_sect`
--

INSERT INTO `tbl_sect` (`id`, `tenluuphai`, `slug`, `trangthai`) VALUES
(2, 'Hệ Thống', 'he-thong', 0),
(3, 'Lão Gia', 'lao-gia', 0),
(4, 'Bàn Thờ', 'ban-tho', 0),
(5, 'Tùy Thân', 'tuy-than', 0),
(6, 'Phàm Nhân', 'pham-nhan', 0),
(7, 'Vô Địch', 'vo-dich', 0),
(8, 'Xuyên Qua', 'xuyen-qua', 0),
(9, 'Trọng Sinh', 'trong-sinh', 0),
(10, 'Sảng Văn', 'sang-van', 0),
(11, 'Xây Dựng Thế Lực', 'xay-dung-the-luc', 0),
(13, 'Nữ Cường', 'nu-cuong', 0),
(14, 'Khế Ước', 'khe-uoc', 0),
(15, 'Hồng Lâu', 'hong-lau', 0),
(16, 'Học Viện', 'hoc-vien', 0),
(17, 'Biến Thân', 'bien-than', 0),
(18, 'Cổ Ngu', 'co-ngu', 0),
(19, 'Chuyển Thế', 'chuyen-the', 0),
(20, 'Xuyên Sách', 'xuyen-sach', 0),
(21, 'Đàn Xuyên', 'dan-xuyen', 0),
(22, 'Phế Tài', 'phe-tai', 0),
(23, 'Dưỡng Thành', 'duong-thanh', 0),
(24, 'Cơm Mềm', 'com-mem', 0),
(25, 'Mary Sue', 'mary-sue', 0),
(26, 'Vô Hạn', 'vo-han', 0),
(27, 'Cá Mặn', 'ca-man', 0),
(28, 'Xuyên Nhanh', 'xuyen-nhanh', 0),
(29, 'Nữ Phụ', 'nu-phu', 0),
(30, 'Vả Mặt', 'va-mat', 0),
(31, 'Xuyên Không', 'xuyen-khong', 0),
(32, 'Ngọt Sủng', 'ngot-sung', 0),
(33, 'Ngự Thú', 'ngu-thu', 0),
(34, 'Điền Viên', 'dien-vien', 0),
(35, 'Toàn Dân', 'toan-dan', 0),
(36, 'Mỹ Thực', 'my-thuc', 0),
(37, 'Dị Năng', 'di-nang', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_sect`
--
ALTER TABLE `tbl_sect`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_sect`
--
ALTER TABLE `tbl_sect`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
