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
-- Cấu trúc bảng cho bảng `tbl_mail`
--

CREATE TABLE `tbl_mail` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_id` int(11) NOT NULL,
  `receive_id` int(11) NOT NULL,
  `noidung` text NOT NULL,
  `ngaygui` datetime NOT NULL DEFAULT current_timestamp(),
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_mail`
--

INSERT INTO `tbl_mail` (`id`, `send_id`, `receive_id`, `noidung`, `ngaygui`, `trangthai`) VALUES
(1, 0, 9, '<p>hi</p>', '2021-11-25 21:44:35', 1),
(2, 8, 0, '<p>Hi ad</p>', '2021-11-25 23:55:43', 1),
(3, 0, 8, '<p>Hi Phong</p>', '2021-11-26 00:01:17', 1),
(4, 0, 8, '<p>Ch&agrave;o phong</p>\r\n\r\n<p>&nbsp;</p>', '2021-11-26 00:14:10', 1),
(5, 0, 8, '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Từ ng&agrave;y 5 th&aacute;ng 1 năm 2022, ch&uacute;ng t&ocirc;i sẽ cập nhật Điều khoản dịch vụ của m&igrave;nh (&quot;<strong>Điều khoản</strong>&quot;) để l&agrave;m r&otilde; v&agrave; gi&uacute;p bạn dễ d&agrave;ng nắm bắt những điều cần biết khi sử dụng dịch vụ YouTube. Những thay đổi n&agrave;y sẽ kh&ocirc;ng ảnh hưởng đến c&aacute;ch bạn sử dụng YouTube. Bạn c&oacute; thể xem bản t&oacute;m tắt nội dung thay đổi v&agrave;&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnEwx7C_Q4VzIzuCJgV6YhQa4lH5_OmJC-BUJTEi_AgYGzQ-1NL1VvmTyiaC1olARmUBnqrR2deIbM0gRtnGmagpWR-bmijn7hEpjMiN6Xqo_1arW8SJ6xJ8rBOHyi3hxT7GjOw\" target=\"_blank\">Điều khoản mới tại đ&acirc;y</a>.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>T&oacute;m tắt về lần cập nhật n&agrave;y:</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<ul>\r\n				<li><strong>Th&ocirc;ng tin r&otilde; r&agrave;ng hơn về những điều cần biết:</strong>&nbsp;Ch&uacute;ng t&ocirc;i sẽ cung cấp th&ocirc;ng tin r&otilde; r&agrave;ng hơn về c&aacute;ch ch&uacute;ng t&ocirc;i ph&aacute;t triển, cải thiện v&agrave; cập nhật dịch vụ của m&igrave;nh, trong đ&oacute; bao gồm nhiều th&ocirc;ng tin cụ thể hơn về l&yacute; do ch&uacute;ng t&ocirc;i điều chỉnh v&agrave; cập nhật, c&ugrave;ng th&ocirc;ng b&aacute;o trước m&agrave; ch&uacute;ng t&ocirc;i gửi cho bạn.</li>\r\n				<li><strong>Nội dung cập nhật chung để c&aacute;c điều khoản đọc dễ hiểu hơn:</strong>&nbsp;Mặc d&ugrave; Điều khoản vẫn l&agrave; một t&agrave;i liệu ph&aacute;p l&yacute;, nhưng ch&uacute;ng t&ocirc;i đ&atilde; cố gắng hết sức để tr&igrave;nh b&agrave;y t&agrave;i liệu n&agrave;y sao cho dễ hiểu hơn, trong đ&oacute; c&oacute; việc sắp xếp lại một số phần (chẳng hạn như Việc đ&igrave;nh chỉ v&agrave; chấm dứt t&agrave;i khoản) v&agrave; điều chỉnh từ ngữ trong c&aacute;c phần kh&aacute;c (chẳng hạn như Việc thay đổi Thoả thuận n&agrave;y).</li>\r\n				<li><strong>Việc bổ sung quy tr&igrave;nh cảnh c&aacute;o vi phạm Nguy&ecirc;n tắc cộng đồng:</strong>&nbsp;Việc bạn sử dụng YouTube vốn lu&ocirc;n phải tu&acirc;n thủ Nguy&ecirc;n tắc cộng đồng v&agrave; quy tr&igrave;nh cảnh c&aacute;o. Nhưng giờ đ&acirc;y, ch&uacute;ng t&ocirc;i đ&atilde; n&ecirc;u r&otilde; th&ocirc;ng tin về quy tr&igrave;nh&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnEznOYtVON8ThFP4d1bDfdF-PdTgmDqjMEej2Pzp64EqOZKb0Og-UOpehmnYUBqfe_WSXTRvHZt0ommPbzSjDtau8lcYQdhQvQGyITDpPatSxoXNf0vaPQWX1IQcAUpWjRW3tw\" target=\"_blank\">cảnh c&aacute;o do vi phạm Nguy&ecirc;n tắc cộng đồng</a>&nbsp;trong Điều khoản để thể hiện t&iacute;nh minh bạch r&otilde; r&agrave;ng hơn. Ch&uacute;ng t&ocirc;i kh&ocirc;ng điều chỉnh g&igrave; về c&aacute;ch hoạt động của cảnh c&aacute;o vi phạm Nguy&ecirc;n tắc cộng đồng cũng như trường hợp k&ecirc;nh hoặc nội dung c&oacute; thể phải nhận cảnh c&aacute;o.</li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Vui l&ograve;ng đọc kỹ nội dung cập nhật&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnExcbjku4tpouJOz0lRU7bjyX9WgF9vYSFUQC32NoGQJnuM4I5MzJUJ_IzEno5redr0BWeXOnS9rk8E0dsUggsgmEYXTsMN8gjo4hWwF4CZd9XDDG-6aHQZJMKibWLs1fp4Oww\" target=\"_blank\">Điều khoản</a>. Bằng việc tiếp tục sử dụng YouTube sau ng&agrave;y n&ecirc;u tr&ecirc;n, bạn đồng &yacute; với c&aacute;c Điều khoản cập nhật. Lưu &yacute;: Nếu bạn cho ph&eacute;p con m&igrave;nh sử dụng YouTube Kids hoặc bạn quản l&yacute; việc trẻ sử dụng YouTube th&ocirc;ng qua&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnEyTb7sIklMXa0QzdF0d9zuHsj9FPgajptJc3q9J_2KtRZvUQvnmYQ07_4RI4w3UZVwstBb_HVDGBNKbdn17sje353tkXOB8c9Ze87p8w3-LunXMljZtS7wUbBlpKqYZ\" target=\"_blank\">Family Link</a>, h&atilde;y d&agrave;nh ch&uacute;t thời gian trao đổi với trẻ về những thay đổi n&agrave;y.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Cảm ơn bạn đ&atilde; tham gia cộng đồng to&agrave;n cầu của ch&uacute;ng t&ocirc;i!</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2021-11-26 15:39:41', 1),
(6, 8, 0, '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>Từ ng&agrave;y 5 th&aacute;ng 1 năm 2022, ch&uacute;ng t&ocirc;i sẽ cập nhật Điều khoản dịch vụ của m&igrave;nh (&quot;<strong>Điều khoản</strong>&quot;) để l&agrave;m r&otilde; v&agrave; gi&uacute;p bạn dễ d&agrave;ng nắm bắt những điều cần biết khi sử dụng dịch vụ YouTube. Những thay đổi n&agrave;y sẽ kh&ocirc;ng ảnh hưởng đến c&aacute;ch bạn sử dụng YouTube. Bạn c&oacute; thể xem bản t&oacute;m tắt nội dung thay đổi v&agrave;&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnEwx7C_Q4VzIzuCJgV6YhQa4lH5_OmJC-BUJTEi_AgYGzQ-1NL1VvmTyiaC1olARmUBnqrR2deIbM0gRtnGmagpWR-bmijn7hEpjMiN6Xqo_1arW8SJ6xJ8rBOHyi3hxT7GjOw\" target=\"_blank\">Điều khoản mới tại đ&acirc;y</a>.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>T&oacute;m tắt về lần cập nhật n&agrave;y:</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<ul>\r\n				<li><strong>Th&ocirc;ng tin r&otilde; r&agrave;ng hơn về những điều cần biết:</strong>&nbsp;Ch&uacute;ng t&ocirc;i sẽ cung cấp th&ocirc;ng tin r&otilde; r&agrave;ng hơn về c&aacute;ch ch&uacute;ng t&ocirc;i ph&aacute;t triển, cải thiện v&agrave; cập nhật dịch vụ của m&igrave;nh, trong đ&oacute; bao gồm nhiều th&ocirc;ng tin cụ thể hơn về l&yacute; do ch&uacute;ng t&ocirc;i điều chỉnh v&agrave; cập nhật, c&ugrave;ng th&ocirc;ng b&aacute;o trước m&agrave; ch&uacute;ng t&ocirc;i gửi cho bạn.</li>\r\n				<li><strong>Nội dung cập nhật chung để c&aacute;c điều khoản đọc dễ hiểu hơn:</strong>&nbsp;Mặc d&ugrave; Điều khoản vẫn l&agrave; một t&agrave;i liệu ph&aacute;p l&yacute;, nhưng ch&uacute;ng t&ocirc;i đ&atilde; cố gắng hết sức để tr&igrave;nh b&agrave;y t&agrave;i liệu n&agrave;y sao cho dễ hiểu hơn, trong đ&oacute; c&oacute; việc sắp xếp lại một số phần (chẳng hạn như Việc đ&igrave;nh chỉ v&agrave; chấm dứt t&agrave;i khoản) v&agrave; điều chỉnh từ ngữ trong c&aacute;c phần kh&aacute;c (chẳng hạn như Việc thay đổi Thoả thuận n&agrave;y).</li>\r\n				<li><strong>Việc bổ sung quy tr&igrave;nh cảnh c&aacute;o vi phạm Nguy&ecirc;n tắc cộng đồng:</strong>&nbsp;Việc bạn sử dụng YouTube vốn lu&ocirc;n phải tu&acirc;n thủ Nguy&ecirc;n tắc cộng đồng v&agrave; quy tr&igrave;nh cảnh c&aacute;o. Nhưng giờ đ&acirc;y, ch&uacute;ng t&ocirc;i đ&atilde; n&ecirc;u r&otilde; th&ocirc;ng tin về quy tr&igrave;nh&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnEznOYtVON8ThFP4d1bDfdF-PdTgmDqjMEej2Pzp64EqOZKb0Og-UOpehmnYUBqfe_WSXTRvHZt0ommPbzSjDtau8lcYQdhQvQGyITDpPatSxoXNf0vaPQWX1IQcAUpWjRW3tw\" target=\"_blank\">cảnh c&aacute;o do vi phạm Nguy&ecirc;n tắc cộng đồng</a>&nbsp;trong Điều khoản để thể hiện t&iacute;nh minh bạch r&otilde; r&agrave;ng hơn. Ch&uacute;ng t&ocirc;i kh&ocirc;ng điều chỉnh g&igrave; về c&aacute;ch hoạt động của cảnh c&aacute;o vi phạm Nguy&ecirc;n tắc cộng đồng cũng như trường hợp k&ecirc;nh hoặc nội dung c&oacute; thể phải nhận cảnh c&aacute;o.</li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Vui l&ograve;ng đọc kỹ nội dung cập nhật&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnExcbjku4tpouJOz0lRU7bjyX9WgF9vYSFUQC32NoGQJnuM4I5MzJUJ_IzEno5redr0BWeXOnS9rk8E0dsUggsgmEYXTsMN8gjo4hWwF4CZd9XDDG-6aHQZJMKibWLs1fp4Oww\" target=\"_blank\">Điều khoản</a>. Bằng việc tiếp tục sử dụng YouTube sau ng&agrave;y n&ecirc;u tr&ecirc;n, bạn đồng &yacute; với c&aacute;c Điều khoản cập nhật. Lưu &yacute;: Nếu bạn cho ph&eacute;p con m&igrave;nh sử dụng YouTube Kids hoặc bạn quản l&yacute; việc trẻ sử dụng YouTube th&ocirc;ng qua&nbsp;<a href=\"https://notifications.google.com/g/p/AD-FnEyTb7sIklMXa0QzdF0d9zuHsj9FPgajptJc3q9J_2KtRZvUQvnmYQ07_4RI4w3UZVwstBb_HVDGBNKbdn17sje353tkXOB8c9Ze87p8w3-LunXMljZtS7wUbBlpKqYZ\" target=\"_blank\">Family Link</a>, h&atilde;y d&agrave;nh ch&uacute;t thời gian trao đổi với trẻ về những thay đổi n&agrave;y.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Cảm ơn bạn đ&atilde; tham gia cộng đồng to&agrave;n cầu của ch&uacute;ng t&ocirc;i!</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2021-11-26 16:21:46', 1),
(7, 0, 14, '<p>Bạn phải th&ecirc;m chương cho truyện nữa th&igrave; truyện mới được duyệt l&ecirc;n hệ thống nha&lt;3</p>', '2021-11-28 09:17:57', 0),
(8, 0, 16, '<p>Hi Trang</p>\r\n\r\n<p>&nbsp;</p>', '2021-11-28 10:28:31', 1),
(9, 16, 0, '<p>Hello</p>', '2021-11-28 10:30:09', 1),
(10, 0, 16, '<p>Trang đăng 1 chương nữa mới được duyệt nh&eacute;!</p>', '2021-11-28 10:31:03', 0),
(11, 0, 20, '<p>Bạn phải cập nhật lại t&ecirc;n c&ugrave;ng avata rồi mới c&oacute; thể đăng truyện nh&eacute;</p>', '2021-11-28 21:10:47', 0),
(12, 0, 16, '<p>qq</p>', '2022-05-07 02:48:36', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_mail`
--
ALTER TABLE `tbl_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_id` (`send_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_mail`
--
ALTER TABLE `tbl_mail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
