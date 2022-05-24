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
-- Cấu trúc bảng cho bảng `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` int(10) UNSIGNED NOT NULL,
  `cauhoi` text NOT NULL,
  `cautraloi` text NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_faq`
--

INSERT INTO `tbl_faq` (`id`, `cauhoi`, `cautraloi`, `trangthai`) VALUES
(2, 'Làm sao đổi màu nền, cỡ chữ, font chữ?', '<p>- D&ugrave;ng web tr&ecirc;n m&aacute;y t&iacute;nh: ấn v&agrave;o n&uacute;t b&aacute;nh răng ở b&ecirc;n tr&aacute;i khung đọc truyện. Video hướng dẫn: https://static.cdnno.com/videos/howto/setting-desktop.mp4<br />\r\n- D&ugrave;ng web tr&ecirc;n điện thoại: ấn v&agrave;o giữa nội dung chương truyện rồi ấn n&uacute;t b&aacute;nh răng ở b&ecirc;n dưới. Video hướng dẫn: https://static.cdnno.com/videos/howto/setting-mobile.mp4<br />\r\n- D&ugrave;ng app M&ecirc; Truyện Chữ - Nữ Hiệp tr&ecirc;n điện thoại: ấn v&agrave;o giữa nội dung chương truyện rồi chọn C&agrave;i đặt. Vdeo hướng dẫn: https://static.cdnno.com/videos/howto/setting-app.mp4<br />\r\n<br />\r\nTips: ở tr&ecirc;n app ngo&agrave;i c&agrave;i đặt m&agrave;u nền, cỡ chữ, font chữ bạn c&ograve;n c&oacute; thể c&agrave;i đặt chế độ đọc truyện theo Lật trang hoặc Cuộn dọc, ở chế độ Lật trang bạn c&oacute; thể ấn v&agrave;o m&eacute;p phải m&agrave;n h&igrave;nh để lật trang thay v&igrave; vuốt</p>', 0),
(3, 'Hoa là gì và dùng để làm gì?', '<p>Hoa l&agrave; một loại phiếu đề cử, d&ugrave;ng để đề cử truyện bạn th&iacute;ch, gi&uacute;p cho nhiều người biết đến truyện đ&oacute; hơn v&agrave; hỗ trợ người đăng truyện. Truyện c&agrave;ng được đề cử nhiều Hoa th&igrave; đang c&oacute; thứ hạng tốt tr&ecirc;n Bảng Xếp Hạng</p>', 0),
(4, 'Làm sao để có Hoa?', '<p>Hoa được cộng tự động v&agrave;o t&agrave;i khoản của bạn v&agrave;o l&uacute;c 0h00 h&agrave;ng ng&agrave;y, số lượng nhận được t&ugrave;y v&agrave;o Đẳng Cấp của bạn</p>', 0),
(5, 'Hoa tồn tại được bao lâu?', '<p>Hoa phải sử dụng ngay trong ng&agrave;y, nếu kh&ocirc;ng sẽ t&agrave;n v&agrave; kh&ocirc;ng sử dụng được nữa.</p>', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
