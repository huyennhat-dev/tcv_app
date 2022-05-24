-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3305
-- Thời gian đã tạo: Th5 16, 2022 lúc 12:32 PM
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
-- Cấu trúc bảng cho bảng `tbl_account`
--

CREATE TABLE `tbl_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `numberphone` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `yearofbirth` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `introduce` text DEFAULT NULL,
  `lever` int(11) NOT NULL DEFAULT 1,
  `joindate` datetime NOT NULL DEFAULT current_timestamp(),
  `sohoa` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_account`
--

INSERT INTO `tbl_account` (`id`, `email`, `username`, `password`, `numberphone`, `avatar`, `yearofbirth`, `sex`, `introduce`, `lever`, `joindate`, `sohoa`) VALUES
(8, 'hoangdz001@gmail.com', 'Ngọc Phong', 'dc2d55a8aac962907bc51161a90f0d85', '0773312827', 'IMG_04302022090114am.webp', '2002', 1, 'Hidd', 1, '2021-11-18 20:18:21', 990),
(9, 'hoangdz002@gmail.com', 'Quan Nhị Gia', 'dc2d55a8aac962907bc51161a90f0d85', '00777', 'IMG_04292022060651pm.webp', '22-11-2002', 2, 'Nhất kiếm phá vạn pháp', 1, '2021-11-19 09:03:34', 986),
(10, 'hoangdz003@gmail.com', 'Huy Hoàng', '25d55ad283aa400af464c76d713c07ad', '0773312827', 'IMG_04292022020532pm.webp', '2002-04-11', 1, 'Ngàn vàng dễ kiếm\nChân ái khó cầu', 1, '2021-11-25 09:41:12', 1000),
(11, 'pro111@pro.com', 'User11282021013259', 'ad381c4827d7cee7d1d80d1da0ece904', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 08:32:59', 1000),
(12, 'lon@gmail.com', 'User11282021013353', '1bbd886460827015e5d605ed44252251', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 08:33:53', 1000),
(13, 'thanh@gmail.com', 'User11282021013703', 'cc825ee7b7647b4357fd2b74b0d879cb', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 08:37:03', 1000),
(14, 'pro@pro.pro', 'User11282021014402', 'ad381c4827d7cee7d1d80d1da0ece904', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 08:44:02', 1000),
(15, 'admin@gmail.com', 'User11282021014909', 'fe335e670c307f704156eed804f3db8f', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 08:49:09', 1000),
(16, 'trang@gmail', 'Trang', '1e184ab537f0d6d6d94bbb5790b1fee0', '0966080602', NULL, '2002-08-06', 2, NULL, 1, '2021-11-28 10:19:49', 1000),
(17, 'dat123@gmail.com', 'User11282021105148', 'cae00f1c0fa7d2349dbf495c42eae1a6', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 17:51:48', 1000),
(18, 'abc2@gmail.com', 'User11282021110507', '61c5e729cc3e339e0012f0b55ddc6695', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 18:05:07', 1000),
(19, 'hacker@hacker.com', 'User11282021121148', '78a98915b938d91d9958437b4497a7fe', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 19:11:48', 1000),
(20, 'kisme789@gmail.com', 'User11282021010520', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 20:05:20', 1000),
(21, 'fdgsg@gmail.com', 'User11282021015502', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-28 20:55:02', 1000),
(22, 'test@gmail.com', 'User11292021040432', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-29 11:04:32', 1000),
(23, 'viethoang@gmail.com', 'User11292021120236', '59a0a4dbc4a30d327c66ee524deaba96', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-29 19:02:36', 1000),
(24, 'aa@gmai', 'User11292021015600', 'f5bb0c8de146c67b44babbf4e6584cc0', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-29 20:56:00', 1000),
(25, 'sdasdsa@gmail.com', 'User11292021063752', '648e747e0bc0d5a16e586bbdc6bc3c50', NULL, NULL, NULL, NULL, NULL, 1, '2021-11-30 01:37:52', 1000),
(26, 'ngocphong98@gmail.com', 'Trương Nhược Trần', 'dc2d55a8aac962907bc51161a90f0d85', NULL, 'BOOK_IMG_11302021014401am.wepb', NULL, 1, NULL, 1, '2021-11-30 08:34:43', 998),
(27, 'hoangdz004@gmail.com', 'Khuyết', 'dc2d55a8aac962907bc51161a90f0d85', NULL, 'IMG_04292022030048pm.webp', '1998-06-23', 1, NULL, 1, '2021-12-01 14:43:15', 977),
(28, 'Alohaha@gmail.com', 'User12012021023822', '25f9e794323b453885f5181f1b624d0b', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-01 21:38:22', 1000),
(29, '123123123@gmai.dqdq', 'User12022021035233', 'f63d94ffe339ea6de1861540ecea872b', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-02 10:52:33', 1000),
(30, 'everodo30@mail.ru', 'User12062021033840', '67231cc6bd94c5767a10001ef793028e', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-06 22:38:40', 1000),
(31, 'dotran260@gmail.com', 'User12092021062113', 'edf1b2a5fd7a7290efeefe6025ca9356', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-09 13:21:13', 100),
(32, 'phanquocphu1998@gmail.com', 'User12162021105718', '88e1ac580f1f02c188f82c384b537b5c', NULL, NULL, NULL, NULL, NULL, 1, '2021-12-16 17:57:18', 100),
(33, 'hoangdz005@gmail.com', 'Huy Hoàng', 'dc2d55a8aac962907bc51161a90f0d85', '0999999999', 'IMG_04302022092509am.webp', '2002-07-25', 1, 'Nhất kiếm phá vạn pháp', 1, '2022-01-06 18:48:29', 100),
(34, 'hoangdeptrai@gmail.com', 'User04222022014045', 'dc2d55a8aac962907bc51161a90f0d85', NULL, NULL, NULL, NULL, NULL, 1, '2022-04-22 08:40:45', 100),
(35, 'hoangdz12345678@gmail.com', 'User04222022014952', 'dc2d55a8aac962907bc51161a90f0d85', NULL, NULL, NULL, NULL, NULL, 1, '2022-04-22 08:49:52', 100),
(36, 'hoangdev01@gmail.com', 'User04272022024215', 'dc2d55a8aac962907bc51161a90f0d85', NULL, NULL, NULL, NULL, NULL, 1, '2022-04-27 09:42:15', 100),
(37, 'hoangdev02@gmail.com', 'User04272022032106', 'dc2d55a8aac962907bc51161a90f0d85', NULL, NULL, NULL, NULL, NULL, 1, '2022-04-27 10:21:06', 100),
(38, 'hoangdev09@gmail.com', 'Nghịch Trần 2', 'dc2d55a8aac962907bc51161a90f0d85', '0773312827', 'BOOK_IMG_05012022064835pm.wepb', '2022-04-16', 0, '<p>Nhất kiếm định c&agrave;n kh&ocirc;n</p>', 1, '2022-04-27 10:24:56', 100),
(39, 'hoangdz005@gmail.com', 'User04272022044347', 'dc2d55a8aac962907bc51161a90f0d85', NULL, NULL, NULL, NULL, NULL, 1, '2022-04-27 23:43:47', 100),
(40, 'hoangdz005@gmail.com', 'Hoàng', 'e10adc3949ba59abbe56e057f20f883e', '077777777', 'IMG_04272022045341pm.webp', NULL, NULL, 'Vô địch cmnr', 1, '2022-04-27 23:44:10', 100),
(41, 'hoangit09@gmail.com', 'Huy Hoàng', '25d55ad283aa400af464c76d713c07ad', '0773312827', 'IMG_05062022042309am.webp', NULL, NULL, NULL, 1, '2022-05-06 11:21:34', 100),
(67, 'hoangsenpai.dev@gmail.com', 'Huy Hoàng', '31b4665e3983a7bbd358baa3f66dee9a', NULL, 'IMG_05102022011608am.webp', NULL, NULL, NULL, 1, '2022-05-07 08:58:17', 100),
(68, 'hoangdz00123@gmail.com', 'Taylor Swift', '31b4665e3983a7bbd358baa3f66dee9a', '0773312827', 'IMG_05152022114612am.webp', '2002', 1, 'haizzz', 1, '2022-05-07 23:26:45', 100),
(69, 'thhoang.20it3@vku.udn.vn', 'trương huy hoàng', '31b4665e3983a7bbd358baa3f66dee9a', NULL, 'IMG_05072022071227pm.webp', NULL, NULL, NULL, 1, '2022-05-08 02:12:28', 100);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
