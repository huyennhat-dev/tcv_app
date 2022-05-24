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
-- Cấu trúc bảng cho bảng `tbl_tickbook`
--

CREATE TABLE `tbl_tickbook` (
  `id` int(10) UNSIGNED NOT NULL,
  `truyen_id` int(11) NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `tentruyen` varchar(255) NOT NULL,
  `chuong_id` int(11) NOT NULL,
  `chuong_slug` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_tickbook`
--

INSERT INTO `tbl_tickbook` (`id`, `truyen_id`, `hinhanh`, `tentruyen`, `chuong_id`, `chuong_slug`, `u_id`) VALUES
(109, 45, 'BOOK_IMG_11272021012421pm.wepb', 'Đỉnh Cấp Khí Vận, Lặng Lẽ Tu Luyện Ngàn Năm', 156, 1, 33),
(114, 83, 'BOOK_IMG_01062022115534am.wepb', 'Bắt Đầu Hoàng Triều Chi Chủ, Từ Chư Thiên Triệu Hoán Thần Ma', 1, 1, 27),
(133, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 1, 1, 64),
(135, 89, 'BOOK_IMG_05072022080012pm.wepb', 'Nội Ứng Ngày Đầu Tiên, Bị Nữ Đế Nhìn Thấy Nhân Sinh Kịch Bản', 1, 1, 69),
(136, 88, 'BOOK_IMG_05072022075529pm.wepb', 'Thái Giám Võ Đế, Lãnh Cung Quét Rác Một Trăm Năm', 1, 1, 69),
(137, 87, 'BOOK_IMG_05072022075125pm.wepb', 'Tận Thế Trò Chơi: Bắt Đầu Tự Tay Mình Giết Hoa Khôi Bạn Gái', 1, 1, 69),
(138, 86, 'BOOK_IMG_05072022074406pm.wepb', 'Thấy Chết Không Sờn Ngụy Quân Tử', 1, 1, 69),
(139, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 1, 1, 69),
(140, 83, 'BOOK_IMG_01062022115534am.wepb', 'Bắt Đầu Hoàng Triều Chi Chủ, Từ Chư Thiên Triệu Hoán Thần Ma', 1, 1, 69),
(141, 80, 'BOOK_IMG_12092021020007am.wepb', 'Toàn Chức Nghệ Thuật Gia', 1, 1, 69),
(142, 78, 'BOOK_IMG_12012021081632am.wepb', 'Nhà Ta Đại Sư Huynh Diễn Kỹ Quá Xốc Nổi!', 1, 1, 69),
(143, 76, 'BOOK_IMG_12012021075903am.wepb', 'Trường Sinh Chí Dị, Bắt Đầu Thái Thị Khẩu Bị Trảm Thủ', 1, 1, 69),
(144, 45, 'BOOK_IMG_11272021012421pm.wepb', 'Đỉnh Cấp Khí Vận, Lặng Lẽ Tu Luyện Ngàn Năm', 1, 1, 69),
(145, 75, 'BOOK_IMG_12012021074800am.wepb', 'Hắc Ám Ảnh Đế', 1, 1, 67),
(146, 71, 'BOOK_IMG_11302021061258pm.wepb', 'Toàn Cầu Tiến Nhập Đại Hồng Thủy Thời Đại', 267, 3, 68),
(147, 85, 'BOOK_IMG_05012022065026pm.wepb', 'Tỏ Tình Ngươi Không Chấp Nhận, Ta Thay Lòng Đổi Dạ Ngươi Khóc Cái Gì ?', 1, 1, 68),
(153, 53, 'BOOK_IMG_11272021030000pm.wepb', 'Giáo Chủ Về Hưu Thường Ngày', 1, 1, 68);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_tickbook`
--
ALTER TABLE `tbl_tickbook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_tickbook`
--
ALTER TABLE `tbl_tickbook`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
