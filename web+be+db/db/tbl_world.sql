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
-- Cấu trúc bảng cho bảng `tbl_world`
--

CREATE TABLE `tbl_world` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenthegioi` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_world`
--

INSERT INTO `tbl_world` (`id`, `tenthegioi`, `slug`, `trangthai`) VALUES
(2, 'Đông Phương Huyền Huyễn', 'dong-phuong-huyen-huyen', 0),
(3, 'Dị Thế Đại Lục', 'di-the-dai-luc', 0),
(4, 'Vương Triều Tranh Bá', 'vuong-trieu-tranh-ba', 0),
(5, 'Tây Phương Kỳ Huyễn', 'tay-phuong-ky-huyen', 0),
(6, 'Tu Chân Văn Minh', 'tu-chan-van-minh', 0),
(7, 'Mạt Thế Nguy Cơ', 'mat-the-nguy-co', 0),
(8, 'Thần Thoại Tu Chân', 'than-thoai-tu-chan', 0),
(9, 'Kỳ Diệu Thế Giới', 'ky-dieu-the-gioi', 0),
(10, 'Võ Hiệp Huyễn Tưởng', 'vo-hiep-huyen-tuong', 0),
(11, 'Cao Võ Thế Giới', 'cao-vo-the-gioi', 0),
(12, 'Hiện Đại Ma Pháp', 'hien-dai-ma-phap', 0),
(13, 'Hắc Ám Huyễn Tưởng', 'hac-am-huyen-tuong', 0),
(14, 'Lịch Sử Thần Thoại', 'lich-su-than-thoai', 0),
(15, 'Cổ Võ Tương Lai', 'co-vo-tuong-lai', 0),
(16, 'Huyễn Tưởng Tu Tiên', 'huyen-tuong-tu-tien', 0),
(17, 'Hiện Đại Tu Chân', 'hien-dai-tu-chan', 0),
(18, 'Cổ Điển Tiên Hiệp', 'co-dien-tien-hiep', 0),
(19, 'Viễn Cổ Hồng Hoang', 'vien-co-hong-hoang', 0),
(20, 'Đô Thị Sinh Hoạt', 'do-thi-sinh-hoat', 0),
(21, 'Đô Thị Dị Năng', 'do-thi-di-nang', 0),
(22, 'Thanh Xuân Vườn Trường', 'thanh-xuan-vuon-truong', 0),
(23, 'Ngu Nhạc Minh Tinh', 'ngu-nhac-minh-tinh', 0),
(24, 'Thương Chiến Chức Tràng', 'thuong-chien-chuc-trang', 0),
(25, 'Giá Không Lịch Sử', 'gia-khong-lich-su', 0),
(26, 'Lịch Sử Quân Sự', 'lich-su-quan-su', 0),
(27, 'Dân Gian Truyền Thuyết', 'dan-gian-truyen-thuyet', 0),
(28, 'Lịch Sử Quan Trường', 'lich-su-quan-truong', 0),
(29, 'Quỷ Bí Huyền Nghi', 'quy-bi-huyen-nghi', 0),
(30, 'Thời Không Xuyên Toa', 'thoi-khong-xuyen-toa', 0),
(31, 'Hư Nghĩ Võng Du', 'hu-nghi-vong-du', 0),
(32, 'Du Hí Dị Giới', 'du-hi-di-gioi', 0),
(33, 'Điện Tử Cạnh Kỹ', 'dien-tu-canh-ky', 0),
(34, 'Thể Dục Cạnh Kỹ', 'the-duc-canh-ky', 0),
(35, 'Cổ Võ Cơ Giáp', 'co-vo-co-giap', 0),
(36, 'Thế Giới Tương Lai', 'the-gioi-tuong-lai', 0),
(37, 'Tinh Tế Văn Minh', 'tinh-te-van-minh', 0),
(38, 'Tiến Hóa Biến Dị', 'tien-hoa-bien-di', 0),
(39, 'Trinh Tham Thôi Lý', 'trinh-tham-thoi-ly', 0),
(40, 'Thám Hiểm Sinh Tồn', 'tham-hiem-sinh-ton', 0),
(41, 'Cung Vi Trạch Đấu', 'cung-vi-trach-dau', 0),
(42, 'Kinh Thương Chủng Điền', 'kinh-thuong-chung-dien', 0),
(43, 'Hào Môn Thế Gia', 'hao-mon-the-gia', 0),
(44, 'Tiên Lữ Kỳ Duyên', 'tien-lu-ky-duyen', 0),
(45, 'Dị Tộc Luyến Tình', 'di-toc-luyen-tinh', 0),
(46, 'Ma Pháp Huyễn Tình', 'ma-phap-huyen-tinh', 0),
(47, 'Tinh Tế Luyến Ca', 'tinh-te-luyen-ca', 0),
(48, 'Linh Khí Khôi Phục', 'linh-khi-khoi-phuc', 0),
(49, 'Chư Thiên Vạn Giới', 'chu-thien-van-gioi', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_world`
--
ALTER TABLE `tbl_world`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_world`
--
ALTER TABLE `tbl_world`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
