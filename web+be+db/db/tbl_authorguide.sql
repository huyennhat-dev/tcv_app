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
-- Cấu trúc bảng cho bảng `tbl_authorguide`
--

CREATE TABLE `tbl_authorguide` (
  `id` int(10) UNSIGNED NOT NULL,
  `cauhoi` text NOT NULL,
  `cautraloi` text NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_authorguide`
--

INSERT INTO `tbl_authorguide` (`id`, `cauhoi`, `cautraloi`, `trangthai`) VALUES
(1, 'Bạn Cần Chuẩn Bị Những Gì Trước Khi Viết Truyện?', '<p>1. Chuẩn bị chọn chủ đề<br />\r\n<br />\r\n&ldquo;Đại qu&acirc;n tấn c&ocirc;ng &ndash; Lương thực đi trước.&rdquo;<br />\r\n<br />\r\nChuẩn bị đầy đủ l&agrave; điều kiện ti&ecirc;n quyết để th&agrave;nh c&ocirc;ng, đối với việc viết truyện, chọn đề t&agrave;i l&agrave; c&ocirc;ng việc ti&ecirc;n quyết thường bị xem nhẹ nhưng thực tế lại c&oacute; t&aacute;c động rất lớn. Rất nhiều t&aacute;c giả th&agrave;nh c&ocirc;ng từng d&agrave;nh rất nhiều c&ocirc;ng sức cho việc lựa chọn chủ đề trước khi họ bắt đầu viết.<br />\r\n<br />\r\nNếu t&aacute;c giả muốn t&aacute;c phẩm của m&igrave;nh trở th&agrave;nh &lsquo;bom tấn&rsquo; th&igrave; việc chọn đề t&agrave;i l&agrave; một kh&acirc;u chuẩn bị kh&ocirc;ng thể thiếu. C&aacute;c chủ đề chất lượng cao c&oacute; thể mang lại lượng độc giả nhiều hơn, danh tiếng cao hơn v&agrave; cuối c&ugrave;ng cho ph&eacute;p t&aacute;c giả thu nhập tốt hơn so với chọn chủ đề sai lầm.<br />\r\n<br />\r\nVậy c&acirc;u hỏi đặt ra l&agrave; chọn lựa đề t&agrave;i như thế n&agrave;o?<br />\r\n<br />\r\nĐể lựa chọn hướng đi của đề t&agrave;i, ch&uacute;ng ta phải tiến h&agrave;nh từ những đặc điểm ri&ecirc;ng của c&aacute; nh&acirc;n bản th&acirc;n m&igrave;nh.<br />\r\n<br />\r\nV&iacute; dụ: T&aacute;c giả l&agrave; một cảnh s&aacute;t v&agrave; c&oacute; kinh nghiệm l&agrave;m việc phong ph&uacute; trong hệ thống cảnh s&aacute;t, th&igrave; việc viết một số tiểu thuyết như cảnh s&aacute;t, điều tra tội phạm, th&aacute;m tử, hồi hộp, v.v. l&agrave; một sự kết hợp ho&agrave;n hảo giữa kỹ năng văn học v&agrave; thực tế kinh nghiệm chiến đấu. Sau khi c&oacute; kinh nghiệm thực tiễn về một số trường hợp giữa cảnh s&aacute;t v&agrave; tội phạm, bạn c&oacute; rất nhiều lợi thế v&agrave; kinh nghiệm so với c&aacute;c t&aacute;c giả kh&aacute;c.<br />\r\n<br />\r\nHoặc t&aacute;c giả l&agrave; một gi&aacute;o vi&ecirc;n hoặc một sinh vi&ecirc;n, vậy th&igrave; s&aacute;ng tạo một bộ truyện li&ecirc;n quan đến nơi l&agrave;m việc v&agrave; học tập, gi&aacute;o vi&ecirc;n, sinh vi&ecirc;n, khu&ocirc;n vi&ecirc;n trường, học tập, học b&aacute;&hellip; kh&ocirc;ng phải l&agrave; một lựa chọn tuyệt vời hay sao!<br />\r\n<br />\r\nV&igrave; vậy, đối với t&aacute;c giả, việc kết hợp bản sắc ri&ecirc;ng v&agrave; đặc điểm nghề nghiệp, lựa chọn lĩnh vực li&ecirc;n quan khi chọn đề t&agrave;i, ph&ugrave; hợp với sở th&iacute;ch c&aacute; nh&acirc;n sẽ tạo th&agrave;nh một chủ đề nếu kh&ocirc;ng được viết ra th&igrave; thật đ&aacute;ng tiếc.<br />\r\n<br />\r\nNgo&agrave;i ra, việc lựa chọn chủ đề kh&ocirc;ng n&ecirc;n giới hạn trong một yếu tố nhất định, nếu nghề nghiệp hoặc kinh nghiệm của bạn c&oacute; hạn, bạn c&oacute; thể xem x&eacute;t c&aacute;c chủ đề phổ biến hơn ở thời điểm hiện tại, hoặc thậm ch&iacute; chọn trực tiếp c&aacute;c chủ đề phổ biến từ l&acirc;u chẳng hạn như: kiếm hiệp, trinh th&aacute;m, h&agrave;i hước, kinh dị, t&igrave;nh cảm, nhiệt huyết&hellip; v.v.. Tất nhi&ecirc;n, c&aacute;c chủ đề n&oacute;ng sẽ c&oacute; t&iacute;nh cạnh tranh cao v&agrave; y&ecirc;u cầu của độc giả cũng tương đối cao, đ&acirc;y l&agrave; một th&aacute;ch thức đối với người mới v&agrave; mọi người phải c&acirc;n nhắc hợp l&yacute;.<br />\r\n<br />\r\nN&oacute;i chung, thứ tự ưu ti&ecirc;n khi chọn chủ đề theo m&igrave;nh l&agrave;: Li&ecirc;n quan đến nghề nghiệp&gt; Li&ecirc;n quan đến cuộc sống bản th&acirc;n&gt; Sở th&iacute;ch&gt; Chủ đề theo &yacute; tưởng c&oacute; sẵn&gt; Chủ đề phổ biến&gt; Lựa chọn ngẫu nhi&ecirc;n.<br />\r\n<br />\r\nCần đặc biệt ch&uacute; &yacute; đến những chủ đề &lsquo;hot trend&rsquo;. Điều n&agrave;y chỉ ph&ugrave; hợp với truyện ngay l&uacute;c đ&oacute;, những ng&agrave;y sau n&agrave;y khi &lsquo;hot trend&rsquo; kh&ocirc;ng c&ograve;n hot nữa th&igrave; rất c&oacute; thể truyện của bạn cũng theo đ&oacute; bị ghẻ lạnh.<br />\r\n<br />\r\n2. S&agrave;ng Lọc C&aacute;c Vấn Đề Nhạy Cảm<br />\r\n<br />\r\nSau khi chọn đề t&agrave;i, bạn kh&ocirc;ng được qu&ecirc;n bước tiếp theo n&agrave;y.<br />\r\n<br />\r\nMột số t&aacute;c giả bị thiệt hại nặng nề, sau khi truyện hội đủ c&aacute;c yếu tố đề t&agrave;i hay, d&agrave;n &yacute; hay, cốt truyện hay, c&aacute;ch h&agrave;nh văn hay, miệt m&agrave;i viết một thời gian d&agrave;i th&igrave; bất ngờ ph&aacute;t hiện ra hướng đi n&agrave;y li&ecirc;n quan đến những vấn đề nhạy cảm, bị hủy xuất bản. Mọi nỗ lực trước đ&oacute; đều tan th&agrave;nh m&acirc;y kh&oacute;i.<br />\r\n<br />\r\nV&igrave; vậy, sau khi chọn chủ đề, n&ecirc;n tự kiểm tra c&aacute;c vấn đề nhạy cảm. Trước hết, h&atilde;y t&igrave;m hiểu nền tảng hiện tại bạn muốn đăng c&oacute; những quy tắc n&agrave;o. Tại Vtruyen, bạn cần đọc thật kỹ điều khoản v&agrave; quy định trước khi đăng truyện tại: https://pub.truyen.onl/pages/quy-dinh-khi-dang-truyen<br />\r\n<br />\r\nC&aacute;c t&aacute;c giả mới nhập m&ocirc;n, tr&aacute;nh xa c&aacute;c chủ đề nhạy cảm l&agrave; sự lựa chọn tốt nhất. Về sau cường đại, đối với cuộc sống c&oacute; trải nghiệm khắc s&acirc;u hơn, tự nhi&ecirc;n b&uacute;t lực sẽ c&agrave;ng th&acirc;m s&acirc;u, liền sẽ c&oacute; nhiều cơ hội hơn nếm thử t&igrave;m hiểu c&aacute;c chủ đề nhạy cảm.<br />\r\n<br />\r\n3. Đại Cương<br />\r\n<br />\r\nĐại cương tức l&agrave; h&igrave;nh d&aacute;ng, l&agrave; xương sống của to&agrave;n bộ t&aacute;c phẩm. Cố sự muốn giảng c&aacute;i g&igrave;, c&oacute; những ai, h&igrave;nh d&aacute;ng, bối cảnh của bọn họ như thế n&agrave;o, ban đầu định ra th&igrave; sau n&agrave;y gặp trường hợp kh&oacute; viết cũng kh&ocirc;ng đến nỗi b&iacute; văn.<br />\r\n<br />\r\nKh&ocirc;ng c&oacute; đại cương, qu&aacute; tr&igrave;nh s&aacute;ng t&aacute;c sau n&agrave;y tựa như l&agrave; con ruồi kh&ocirc;ng đầu, bay lung tung, kh&ocirc;ng chỉ l&agrave;m cho t&aacute;c phẩm dễ chệch hướng so với dự định ban đầu, c&ograve;n dễ d&agrave;ng b&iacute; văn, th&aacute;i gi&aacute;m, cho n&ecirc;n đại cương rất quan trọng.<br />\r\n<br />\r\nĐại cương c&acirc;̀n chỉ ra cốt truyện ch&iacute;nh, cũng ch&iacute;nh l&agrave; hướng ph&aacute;t triển mạch lạc của to&agrave;n bộ c&acirc;u chuyện. Nếu như đem to&agrave;n bộ c&acirc;u chuyện v&iacute; như một c&acirc;y đại thụ, lớn như vậy Đại cương ch&iacute;nh l&agrave; th&acirc;n c&acirc;y, chống đỡ to&agrave;n bộ c&agrave;nh l&aacute; rậm rạp.<br />\r\n<br />\r\nT&aacute;c giả thiết lập đại cương cũng muốn ch&uacute; &yacute; đem nh&acirc;n vật quyết định kỹ c&agrave;ng, phối hợp tốt trước mặt đề t&agrave;i, mẫn cảm t&iacute;nh vấn đề, kỹ c&agrave;ng một ch&uacute;t đại cương c&oacute; hiệu quả nhất, thực sự kh&ocirc;ng c&oacute; thời gian, đại kh&aacute;i th&ocirc; sơ giản lược, c&oacute; c&aacute;i h&igrave;nh thức ban đầu cũng c&oacute; thể sử dụng tạm. Tại đại cương b&ecirc;n trong hẳn l&agrave; mai phục một ch&uacute;t phục b&uacute;t, gi&uacute;p dễ d&agrave;ng th&uacute;c đẩy t&igrave;nh tiết truyện.<br />\r\n<br />\r\nVề nguy&ecirc;n tắc, tiểu thuyết c&agrave;ng d&agrave;i kỳ, đại cương c&agrave;ng trọng yếu, nhất định kh&ocirc;ng được lười biếng.<br />\r\n<br />\r\n4. Nhờ người g&oacute;p &yacute;.<br />\r\n<br />\r\nNếu li&ecirc;n hệ với Bi&ecirc;n tập vi&ecirc;n, bạn c&oacute; thể cho anh ta biết rằng t&aacute;c phẩm mới của bạn đang được chuẩn bị, sau đ&oacute; thảo luận về chủ đề v&agrave; c&agrave;i đặt, đồng thời sửa đổi &yacute; tưởng ban đầu dựa tr&ecirc;n nhận x&eacute;t của người bi&ecirc;n tập.<br />\r\n<br />\r\nLưu &yacute; rằng bạn n&ecirc;n chọn &aacute;p dụng dựa tr&ecirc;n t&igrave;nh h&igrave;nh của ri&ecirc;ng bạn, v&agrave; &yacute; kiến của b&ecirc;n kia c&oacute; thể kh&ocirc;ng ph&ugrave; hợp với bạn . Nếu bạn chưa li&ecirc;n hệ với bi&ecirc;n tập vi&ecirc;n hoặc bạn kh&ocirc;ng quen với bi&ecirc;n tập vi&ecirc;n, bạn c&oacute; thể hỏi một người người bạn đ&aacute;ng tin cậy của bạn đọc bản nh&aacute;p, v&agrave; gửi cho anh ta sau khi bản thảo ho&agrave;n th&agrave;nh v&agrave; nhờ anh ta đưa ra một số nhận x&eacute;t.<br />\r\n<br />\r\nĐộc giả b&igrave;nh thường kh&ocirc;ng nhạy cảm với nội dung chi tiết như chủ đề v&agrave; thiết lập nh&acirc;n vật, nhưng cảm nhận tổng thể l&agrave; rất trực quan, gần như c&oacute; thể đại diện cho cảm gi&aacute;c đầu ti&ecirc;n của hầu hết độc giả kh&aacute;c, v&igrave; vậy n&oacute; cũng c&oacute; gi&aacute; trị tham khảo lớn.<br />\r\n<br />\r\nSau khi c&ocirc;ng việc tr&ecirc;n ho&agrave;n th&agrave;nh, cơ bản ho&agrave;n th&agrave;nh c&ocirc;ng t&aacute;c chuẩn bị sơ bộ, bước tiếp theo ch&iacute;nh thức bắt đầu, việc chuẩn bị sơ bộ kỹ lưỡng sẽ c&oacute; t&aacute;c động t&iacute;ch cực rất lớn đến việc viết l&aacute;ch v&agrave; cuối c&ugrave;ng l&agrave; tạo đ&agrave; cho sự ra đời của những t&aacute;c phẩm hay.<br />\r\n<br />\r\nC&ograve;n về năng khiếu văn chương th&igrave; đ&oacute; l&agrave; b&agrave;i to&aacute;n h&agrave;nh trang t&iacute;ch g&oacute;p theo thời gian, kh&ocirc;ng thể ng&agrave;y một ng&agrave;y hai m&agrave; thay đổi được.<br />\r\n<br />\r\nNgo&agrave;i ra , cũng kh&ocirc;ng nhất định phải l&agrave; tiến sĩ văn học mới c&oacute; thể viết được truyện? C&oacute; v&ocirc; số t&aacute;c giả viết truyện rất hay nhưng kh&ocirc;ng c&oacute; tr&igrave;nh độ học vấn cao. Kiến thức của bạn quả thực cần tăng cường học hỏi về l&acirc;u d&agrave;i, nhưng nếu bạn đ&atilde; c&oacute; &yacute; tưởng th&igrave; b&acirc;y giờ h&atilde;y mạnh dạn đặt b&uacute;t!</p>', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_authorguide`
--
ALTER TABLE `tbl_authorguide`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_authorguide`
--
ALTER TABLE `tbl_authorguide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
