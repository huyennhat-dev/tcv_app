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
-- Cấu trúc bảng cho bảng `tbl_readingbooks`
--

CREATE TABLE `tbl_readingbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `truyen_id` int(11) NOT NULL,
  `hinhanh` varchar(255) DEFAULT NULL,
  `tentruyen` varchar(255) DEFAULT NULL,
  `chuong_id` int(11) NOT NULL,
  `chuong_slug` int(255) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_readingbooks`
--

INSERT INTO `tbl_readingbooks` (`id`, `truyen_id`, `hinhanh`, `tentruyen`, `chuong_id`, `chuong_slug`, `u_id`) VALUES
(89, 45, 'BOOK_IMG_11272021012421pm.wepb', 'Đỉnh Cấp Khí Vận, Lặng Lẽ Tu Luyện Ngàn Năm', 160, 5, 33),
(91, 83, 'BOOK_IMG_01062022115534am.wepb', 'Bắt Đầu Hoàng Triều Chi Chủ, Từ Chư Thiên Triệu Hoán Thần Ma', 326, 1, 27),
(92, 80, 'BOOK_IMG_12092021020007am.wepb', 'Toàn Chức Nghệ Thuật Gia', 324, 1, 9),
(93, 83, 'BOOK_IMG_01062022115534am.wepb', 'Bắt Đầu Hoàng Triều Chi Chủ, Từ Chư Thiên Triệu Hoán Thần Ma', 327, 2, 9),
(94, 59, 'BOOK_IMG_11282021063829am.wepb', 'Ngã Tại Dị Giới Sưu Tập Toàn Thành Tựu', 220, 2, 9),
(116, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 329, 1, 38),
(117, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 329, 1, 10),
(122, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 329, 1, 8),
(123, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 329, 1, 64),
(124, 51, 'BOOK_IMG_11272021024213pm.wepb', 'Thanh Liên Chi Đỉnh', 190, 1, 65),
(125, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 329, 1, 67),
(126, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 329, 1, 69),
(127, 43, 'BOOK_IMG_11272021124611pm.wepb', 'Vạn Cổ Thần Đế', 201, 6, 69),
(128, 59, 'BOOK_IMG_11282021063829am.wepb', 'Ngã Tại Dị Giới Sưu Tập Toàn Thành Tựu', 221, 3, 69),
(129, 89, 'BOOK_IMG_05072022080012pm.wepb', 'Nội Ứng Ngày Đầu Tiên, Bị Nữ Đế Nhìn Thấy Nhân Sinh Kịch Bản', 338, 1, 69),
(131, 53, 'BOOK_IMG_11272021030000pm.wepb', 'Giáo Chủ Về Hưu Thường Ngày', 202, 1, 67),
(132, 71, 'BOOK_IMG_11302021061258pm.wepb', 'Toàn Cầu Tiến Nhập Đại Hồng Thủy Thời Đại', 267, 3, 68),
(133, 89, 'BOOK_IMG_05072022080012pm.wepb', 'Nội Ứng Ngày Đầu Tiên, Bị Nữ Đế Nhìn Thấy Nhân Sinh Kịch Bản', 338, 1, 68);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_readingbooks`
--
ALTER TABLE `tbl_readingbooks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_readingbooks`
--
ALTER TABLE `tbl_readingbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
