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
-- Cấu trúc bảng cho bảng `tbl_slide`
--

CREATE TABLE `tbl_slide` (
  `id` int(10) UNSIGNED NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `mota` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_slide`
--

INSERT INTO `tbl_slide` (`id`, `hinhanh`, `mota`, `trangthai`) VALUES
(7, 'Slide_IMG_11092021062651am.wepb', 'Yến Thần Lục', 0),
(8, 'Slide_IMG_11092021034509am.wepb', 'Vạn Biến Hồn Đế', 0),
(10, 'Slide_IMG_11092021034601am.wepb', 'Ta chính là thần', 0),
(11, 'Slide_IMG_11092021034618am.wepb', 'Ngụy quân tử', 0),
(12, 'Slide_IMG_11092021040255am.wepb', 'Phong Lưu Chân Tiên', 0),
(13, 'Slide_IMG_11282021012648am.wepb', 'Bồi Dưỡng Hồn Sủng', 0),
(15, 'Slide_IMG_11282021012752am.wepb', 'Toàn Bộ Vị Diện Đều Quỳ Cầu Nhân Vật Phản Diện Nữ Chính Làm Người', 0),
(16, 'Slide_IMG_11282021012809am.wepb', 'Dòng Máu Lạc Hồng', 0),
(17, 'Slide_IMG_11282021012825am.wepb', 'Nhất Kiếm Tiên Phàm', 0),
(20, 'Slide_IMG_11282021012949am.wepb', 'Tiêu Dao Lục', 0),
(28, 'Slide_IMG_05062022074602pm.wepb', 'Đại huyền đệ nhất duệ thám', 0),
(29, 'Slide_IMG_05062022074621pm.wepb', 'Thiien mệnh phối hợp diễn', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_slide`
--
ALTER TABLE `tbl_slide`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_slide`
--
ALTER TABLE `tbl_slide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
