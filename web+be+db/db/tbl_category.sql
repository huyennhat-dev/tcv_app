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
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `tentheloai` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `mota` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `tentheloai`, `slug`, `mota`, `trangthai`) VALUES
(2, 'Võng Du', 'vong-du', 'Võng du là thể loại truyện về game online trực tuyến ảo. Các nhân vật chính trong truyện sẽ hóa thân mình vào người chơi và bắt đầu ngao du, khám phá thế giới ảo.', 0),
(3, 'Tiên Hiệp', 'tien-hiep', 'Tiên Hiệp là những tiểu thuyết lấy bối cảnh chính ở thời Trung Quốc cổ đại, nội dung truyện thường miêu tả con đường cầu tiên tu đạo, đấu tranh sinh tồn trong thế giới tu tiên của nhân vật chính.', 0),
(4, 'Khoa Huyễn', 'khoa-huyen', 'Truyện Khoa Huyễn còn được biết đến với tên gọi khác là truyện khoa học viễn tưởng. Đây là truyện được hư cấu và sáng tạo nhờ trí tưởng tượng phong phú của tác giả. ...', 0),
(5, 'Kiếm Hiệp', 'kiem-hiep', 'Kiếm hiệp là một thể loại của Hoa Ngữ. Truyện kể về cuộc phiêu lưu của những cao thủ, kiếm khách hay còn gọi là hiệp khách sống trên giang hồ.', 0),
(6, 'Huyền Huyễn', 'huyen-huyen', 'Truyện Huyền Huyễn còn có tên gọi khác là truyện Huyền Ảo. Thể loại truyện này hấp dẫn bạn đọc bởi chứa đựng rất nhiều yếu tố kỳ ảo trong không gian siêu tưởng, đầy pháp thuật.', 0),
(7, 'Đồng Nhân', 'dong-nhan', 'Đồng nhân được hiểu đơn giản là một loại truyện có bối cảnh từ phim ảnh, truyện tranh, phim hoạt hình hay một câu chuyện đã có sẵn từ trước.', 0),
(8, 'Đô Thị', 'do-thi', 'Truyện đô thị sinh ra là để thỏa mãn được trí tưởng tượng hướng bạn đến với sự hoàn mỹ, khát khao vươn tới thành công.', 0),
(9, 'Lịch Sử', 'lich-su', 'Thể loại văn học lịch sử (tiếng Pháp: genre historiques) là lĩnh vực văn học bao gồm các thể loại văn học khác nhau cùng viết về đề tài lịch sử: ...', 0),
(10, 'Huyền Nghi', 'huyen-nghi', 'Truyện Huyền nghi là những truyện có nội dung bí ẩn, trinh thám, phá án, đan xen những yếu tố ly kì.', 0),
(11, 'Cạnh Kỹ', 'canh-ky', 'Truyện Cạnh Kỹ  tương tự như thể loại Thể Thao, đa phần tập trung vào Bóng đá hay những công việc đòi hỏi tính chiến lược, tính toán.', 0),
(12, 'Kỳ Ảo', 'ky-ao', 'Kỳ ảo là một thể loại văn học nghệ thuật trong đó phép thuật và các yếu tố siêu nhiên khác được sử dụng làm đề tài, cốt truyện hay bối cảnh.', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
