-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2019 at 01:21 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `cthd`
--

CREATE TABLE `cthd` (
  `idHD` int(11) NOT NULL,
  `idSP` int(11) NOT NULL,
  `Gia` varchar(20) NOT NULL,
  `SoLuong` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cthd`
--

INSERT INTO `cthd` (`idHD`, `idSP`, `Gia`, `SoLuong`) VALUES
(1, 1, '21000000', 1),
(1, 2, '9000000', 1),
(3, 3, '22000000', 1),
(4, 5, '15000000', 2),
(5, 7, '11000000', 1),
(5, 6, '12000000', 1),
(2, 1, '21000000', 2),
(6, 1, '21000000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `idHD` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `HoTen` varchar(100) CHARACTER SET utf8 NOT NULL,
  `DiaChi` varchar(200) CHARACTER SET utf8 NOT NULL,
  `SDT` varchar(10) NOT NULL,
  `TongTien` varchar(100) NOT NULL,
  `LoaiGH` int(1) NOT NULL COMMENT '1: giao nhanh, 2: giao hàng tiết kiệm',
  `TienVC` varchar(30) NOT NULL,
  `HTThanhToan` int(1) NOT NULL COMMENT '1: cod 2: tructuyen',
  `TrangThaiHD` int(1) NOT NULL COMMENT '1:da xac nhan,2: moi dat , 3: đang giao, 4 : da nhan, 5: da huy',
  `TrangThaiThanhToan` int(1) NOT NULL COMMENT '0: chua, 1: da thanh toan',
  `NgayDat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`idHD`, `idUser`, `HoTen`, `DiaChi`, `SDT`, `TongTien`, `LoaiGH`, `TienVC`, `HTThanhToan`, `TrangThaiHD`, `TrangThaiThanhToan`, `NgayDat`) VALUES
(1, 1, 'Nguyễn Thành Pháp', '123  Quang Trung, P. 15, q.Gò Vấp, tp HCM', '0987654321', '30030000', 1, '30000', 1, 5, 1, '2019-06-01 10:32:00'),
(2, 2, 'Trần Thị Như Ý', '231/1 Phạm Văn Đồng, p.1, q.Bình Thạnh, tp HCM', '0987754321', '22020000', 1, '20000', 1, 1, 1, '2019-06-10 00:00:00'),
(3, 1, 'Trần Văn Khôi', '123 Phan Văn Trị, p.16, q.Gò Vấp, tp HCM', '0987654321', '22010000', 2, '10000', 2, 3, 1, '2019-06-04 09:16:00'),
(4, 1, 'Nguyễn Thành Pháp', '123  Quang Trung, P. 15, q.Gò Vấp, tp HCM', '0987654321', '30030000', 1, '30000', 1, 2, 0, '2019-06-11 10:09:00'),
(5, 1, 'Nguyễn Thành Pháp', '123  Quang Trung, P. 15, q.Gò Vấp, tp HCM', '0987654321', '23030000', 1, '30000', 1, 4, 0, '2019-06-02 04:32:00'),
(6, 2, 'Trần Thị Như Ý', '231/1 Phạm Văn Đồng, p.1, q.Bình Thạnh, tp HCM', '0987754321', '36020000', 1, '20000', 1, 1, 1, '2019-06-10 12:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `loaisp`
--

CREATE TABLE `loaisp` (
  `idLoai` int(11) NOT NULL,
  `TenLoai` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loaisp`
--

INSERT INTO `loaisp` (`idLoai`, `TenLoai`) VALUES
(1, 'Samsum'),
(2, 'Nokia'),
(3, 'Apple'),
(4, 'Dell'),
(5, 'HTC');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `idSP` int(11) NOT NULL,
  `idLoai` int(11) NOT NULL,
  `TenSP` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Hinh` varchar(200) NOT NULL,
  `MoTa` text CHARACTER SET utf8 NOT NULL,
  `ChiTiet` text CHARACTER SET utf8 NOT NULL,
  `Gia` varchar(100) NOT NULL,
  `SoLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`idSP`, `idLoai`, `TenSP`, `Hinh`, `MoTa`, `ChiTiet`, `Gia`, `SoLuong`) VALUES
(1, 3, 'Iphone X', 'iphone-x-64gb-1-400x460.png', '    * Hệ điều hành Symbian\r\n    * Màn hình cảm ứng điện dung\r\n    * Máy ảnh 8 MP với Flash kép\r\n    * Máy nghe nhạc, xem phim nhiều định dạng\r\n    * Mạng 3G, kết nối Wifi, GPS, Bluetooth\r\n    * Xem văn bản (Word, Excel, PowerPoint, PDF)\r\n    * Kết nối Tivi', '<h2>3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt</h2>\r\n<div class=\"news_description\">Tại sự kiện Nokia World diễn ra ở  London (Anh), h&atilde;ng điện thoại Phần Lan giới thiệu 3 model C6-01, C7 v&agrave;  E7 thuộc loại cao cấp với mức gi&aacute; từ 340 USD trở l&ecirc;n.</div>\r\n<p class=\"Normal\">Nokia E7 sử dụng  m&agrave;n h&igrave;nh cảm ứng AMOLED 4 inch 640 x 360 pixel, được bổ sung c&ocirc;ng nghệ  ClearBlack Display độc quyền cho h&igrave;nh ảnh sống động như thật, kh&ocirc;ng thua  k&eacute;m g&igrave; Retina Display tr&ecirc;n iPhone 4. E7 d&agrave;y 13,8 mm, t&iacute;ch hợp m&aacute;y ảnh 8  megapixel, quay video HD, b&agrave;n ph&iacute;m Qwerty c&ugrave;ng 16 GB bộ nhớ trong. Sản  phẩm được Nokia nhắm đến đối tượng doanh nh&acirc;n, hỗ trợ ứng dụng Microsoft  Exchange, hệ thống Ovi v&agrave; c&oacute; gi&aacute; b&aacute;n l&agrave; 650 USD.</p>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"1\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img title=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" src=\"http://images.thegioididong.com/Files/2010/09/15/21061/1_3-smartphone-chup-anh-8-cham-cua-Nokia-ra-mat.jpg\" border=\"1\" alt=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" width=\"450\" height=\"288\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"Normal\" align=\"middle\">Ảnh: <em>Nokia.</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"Normal\">C&ograve;n model C7 sử dụng lớp vỏ bằng lớp th&eacute;p chống gỉ  c&ugrave;ng m&agrave;n h&igrave;nh cảm ứng AMOLED 3,5 inch kết hợp với ClearBlack Display  giống E7. M&aacute;y t&iacute;ch hợp camera 8 \"chấm\", hỗ trợ quay video HD v&agrave; được  xuất xưởng v&agrave;o cuối năm nay với mức gi&aacute; 430 USD.</p>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"1\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img title=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" src=\"http://images.thegioididong.com/Files/2010/09/15/21061/2_3-smartphone-chup-anh-8-cham-cua-Nokia-ra-mat.jpg\" border=\"1\" alt=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" width=\"400\" height=\"333\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"Image\" align=\"middle\">Nokia C6-01 v&agrave; C7. Ảnh: <em>Nokia.</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Cuối c&ugrave;ng l&agrave; Nokia C6-01 c&oacute; m&agrave;n h&igrave;nh giống với C7  nhưng b&eacute; hơn, chỉ 3,2 inch 640 x 360 pixel. Sản phẩm c&oacute; thiết kế giống  với model C6 nhưng kh&ocirc;ng c&oacute; b&agrave;n ph&iacute;m Qwerty. M&aacute;y hỗ trợ xem TV tr&ecirc;n web,  c&aacute;c mạng x&atilde; hội v&agrave; c&oacute; gi&aacute; 340 USD.</p>', '21000000', 100),
(2, 1, 'Samsung Galaxy A50', 'samsung-galaxy-a50-128gb-blue-400x460.png', '    * Hệ điều hành Symbian\r\n    * Màn hình cảm ứng điện dung\r\n    * Máy ảnh 8 MP với Flash kép\r\n    * Máy nghe nhạc, xem phim nhiều định dạng\r\n    * Mạng 3G, kết nối Wifi, GPS, Bluetooth\r\n    * Xem văn bản (Word, Excel, PowerPoint, PDF)\r\n    * Kết nối Tivi', '<h2>3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt</h2>\r\n<div class=\"news_description\">Tại sự kiện Nokia World diễn ra ở  London (Anh), h&atilde;ng điện thoại Phần Lan giới thiệu 3 model C6-01, C7 v&agrave;  E7 thuộc loại cao cấp với mức gi&aacute; từ 340 USD trở l&ecirc;n.</div>\r\n<p class=\"Normal\">Nokia E7 sử dụng  m&agrave;n h&igrave;nh cảm ứng AMOLED 4 inch 640 x 360 pixel, được bổ sung c&ocirc;ng nghệ  ClearBlack Display độc quyền cho h&igrave;nh ảnh sống động như thật, kh&ocirc;ng thua  k&eacute;m g&igrave; Retina Display tr&ecirc;n iPhone 4. E7 d&agrave;y 13,8 mm, t&iacute;ch hợp m&aacute;y ảnh 8  megapixel, quay video HD, b&agrave;n ph&iacute;m Qwerty c&ugrave;ng 16 GB bộ nhớ trong. Sản  phẩm được Nokia nhắm đến đối tượng doanh nh&acirc;n, hỗ trợ ứng dụng Microsoft  Exchange, hệ thống Ovi v&agrave; c&oacute; gi&aacute; b&aacute;n l&agrave; 650 USD.</p>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"1\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img title=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" src=\"http://images.thegioididong.com/Files/2010/09/15/21061/1_3-smartphone-chup-anh-8-cham-cua-Nokia-ra-mat.jpg\" border=\"1\" alt=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" width=\"450\" height=\"288\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"Normal\" align=\"middle\">Ảnh: <em>Nokia.</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"Normal\">C&ograve;n model C7 sử dụng lớp vỏ bằng lớp th&eacute;p chống gỉ  c&ugrave;ng m&agrave;n h&igrave;nh cảm ứng AMOLED 3,5 inch kết hợp với ClearBlack Display  giống E7. M&aacute;y t&iacute;ch hợp camera 8 \"chấm\", hỗ trợ quay video HD v&agrave; được  xuất xưởng v&agrave;o cuối năm nay với mức gi&aacute; 430 USD.</p>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"1\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img title=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" src=\"http://images.thegioididong.com/Files/2010/09/15/21061/2_3-smartphone-chup-anh-8-cham-cua-Nokia-ra-mat.jpg\" border=\"1\" alt=\"3 smartphone chụp ảnh 8 \'chấm\' của Nokia ra mắt\" width=\"400\" height=\"333\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"Image\" align=\"middle\">Nokia C6-01 v&agrave; C7. Ảnh: <em>Nokia.</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Cuối c&ugrave;ng l&agrave; Nokia C6-01 c&oacute; m&agrave;n h&igrave;nh giống với C7  nhưng b&eacute; hơn, chỉ 3,2 inch 640 x 360 pixel. Sản phẩm c&oacute; thiết kế giống  với model C6 nhưng kh&ocirc;ng c&oacute; b&agrave;n ph&iacute;m Qwerty. M&aacute;y hỗ trợ xem TV tr&ecirc;n web,  c&aacute;c mạng x&atilde; hội v&agrave; c&oacute; gi&aacute; 340 USD.</p>', '9000000', 50),
(3, 1, 'Samsung Galaxy Note 9', 'samsung-galaxy-note-9-black-400x460-400x460.png', 'Hệ điều hành Bada\r\nMáy ảnh 5.0 MP, Flash, nhận diện khuôn mặt\r\nMạng 3G với tốc độ 7.2 Mbps\r\nKết nối Wifi, Bluetooth, định vị GPS\r\nĐài FM tích hợp, ghi âm FM', '<h2 style=\"color: #ff9501; padding: 5px 0px 3px 10px; margin: 0px; font-weight: bolder;\">Samsung ra mắt smartphone nền tảng Bada thứ hai</h2>\r\n<div class=\"news_description\" style=\"color: #606060; padding: 0px 0px 0px 10px; margin-bottom: 10px;\">H&ocirc;m (30/8), h&atilde;ng điện tử H&agrave;n Quốc đ&atilde; tr&igrave;nh l&agrave;ng th&ecirc;m mẫu \"dế\" Bada với t&ecirc;n gọi Wave 723 (t&ecirc;n m&atilde; GT-S7320E) hướng tới đối tượng người d&ugrave;ng l&agrave; giới trẻ v&agrave; th&iacute;ch kết nối bạn b&egrave;.</div>\r\n<div class=\"new_pro_detail_contet\" style=\"padding: 5px 3px 5px 10px;\">\r\n<p class=\"pBody\" style=\"margin: 14px 0px; line-height: 18px; text-align: center;\"><img class=\"oImage\" title=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" src=\"http://images.thegioididong.com/Files/2010/09/06/20445/253_Samsung-ra-mat-smartphone-nen-tang-Bada-thu-hai.jpg\" border=\"0\" alt=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" hspace=\"0\" align=\"middle\" /></p>\r\n<p class=\"pBody\" style=\"margin: 14px 0px; line-height: 18px;\">Wave 723 d&agrave;y chỉ 11,8 mm mang thiết kế đặc trưng của Samsung với mặt sau l&agrave;m từ kim loại m&agrave;i xước, mang tới vẻ sang trọng cho m&aacute;y.</p>\r\n<p class=\"pBody\" style=\"margin: 14px 0px; line-height: 18px;\">M&aacute;y được trang bị m&agrave;n h&igrave;nh cảm ứng TFT 3,2 inch độ ph&acirc;n giải WQVGA (240 x 400 pixel), camera 5 megapixel với chế độ tự động lấy n&eacute;t (AF) v&agrave; đ&egrave;n flash LED trợ s&aacute;ng, giắc cắm tai nghe chuẩn 3,5mm, bộ nhớ 90 MB c&oacute; thể mở rộng th&ocirc;ng qua khe cắm thẻ microSD.</p>\r\n<p class=\"pBody\" style=\"margin: 14px 0px; line-height: 18px;\">Điện thoại hỗ trợ kết nối kh&ocirc;ng d&acirc;y Wi-Fi 802.11 b/g/n, GPS, Bluetooth 3.0, quad-band 2G v&agrave; băng tần k&eacute;p 3G.</p>\r\n<p class=\"pBody\" style=\"margin: 14px 0px; line-height: 18px;\">Samsung Wave 723 được c&agrave;i sẵn kh&aacute; nhiều phần mềm, tr&ograve; chơi, mạng x&atilde; hội, ebook c&ugrave;ng c&aacute;c ứng dụng kh&aacute;c, dự kiến sẽ được b&aacute;n tại Đức v&agrave;o th&aacute;ng 9 tới v&agrave; sau đ&oacute; l&agrave; ở Ch&acirc;u &Acirc;u, Đ&ocirc;ng Nam &Aacute; v&agrave; Ch&acirc;u Phi với gi&aacute; 240 euro.</p>\r\n<table style=\"border-collapse: collapse; background-color: #ffffff;\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\" width=\"200\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"text-align: center;\"><img title=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" src=\"http://images.thegioididong.com/Files/2010/09/06/20445/254_Samsung-ra-mat-smartphone-nen-tang-Bada-thu-hai.jpg\" border=\"0\" alt=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" hspace=\"0\" align=\"middle\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\"><img title=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" src=\"http://images.thegioididong.com/Files/2010/09/06/20445/255_Samsung-ra-mat-smartphone-nen-tang-Bada-thu-hai.jpg\" border=\"0\" alt=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" hspace=\"0\" align=\"middle\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\"><img title=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" src=\"http://images.thegioididong.com/Files/2010/09/06/20445/256_Samsung-ra-mat-smartphone-nen-tang-Bada-thu-hai.jpg\" border=\"0\" alt=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" hspace=\"0\" align=\"middle\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\"><img title=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" src=\"http://images.thegioididong.com/Files/2010/09/06/20445/257_Samsung-ra-mat-smartphone-nen-tang-Bada-thu-hai.jpg\" border=\"0\" alt=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" hspace=\"0\" align=\"middle\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\"><img title=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" src=\"http://images.thegioididong.com/Files/2010/09/06/20445/258_Samsung-ra-mat-smartphone-nen-tang-Bada-thu-hai.jpg\" border=\"0\" alt=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" hspace=\"0\" align=\"middle\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\"><img title=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" src=\"http://images.thegioididong.com/Files/2010/09/06/20445/259_Samsung-ra-mat-smartphone-nen-tang-Bada-thu-hai.jpg\" border=\"0\" alt=\"Samsung ra mắt smartphone nền tảng Bada thứ hai\" hspace=\"0\" align=\"middle\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br class=\"Apple-interchange-newline\" /></div>', '22000000', 20),
(4, 3, 'iPhone Xr 128GB', 'iphone-xr-128gb-red-400x460.png', '    * Thiết kế trượt thời trang\r\n    * Màn hình 16 triệu màu\r\n    * Camera 2.0 MP, hỗ trợ quay phim\r\n    * Máy nghe nhạc nhiều định dạng\r\n    * Chế độ giả lập cuộc gọi ản\r\n    * Kết nối Bluetooth, USB, đài FM \r\n\r\n', '<h1 class=\"features_subject\"><span style=\"font-size: small;\">Phong c&aacute;ch b&ecirc;n ngo&agrave;i lẫn b&ecirc;n trong </span></h1>\r\n<p class=\"features_text\">Samsung S3500 l&agrave; chiếc điện thoại trượt thời trang hỗ trợ M&agrave;n h&igrave;nh 2.2\" QVGA 16 triệu m&agrave;u TFT LCD với giao diện menu sử dụng t&ugrave;y biến Camera 2.0 Megapixel, hỗ trợ nhạc đa dịnh dạng MP3 / AAC / AAC+ / MIDIplayback, lưu trữ thật lớn với hỗ trợ thẻ nhớ microSD 8G (bộ nhớ trong 40MB). Theo d&otilde;i điện thoại 2.0 gi&uacute;p bạn bảo mật th&ocirc;ng tin c&aacute; nh&acirc;n trong trường hợp bạn bị thất lạc.</p>\r\n<div class=\"contentlt\">\r\n<div class=\"content_block\">\r\n<div class=\"title_para\">\r\n<h2><span style=\"font-size: small;\">Thiết kế trượt sang trọng thuộc d&ograve;ng Soul</span></h2>\r\n</div>\r\n<img class=\"img\" src=\"http://www.thegioididong.com/dtdd/news/BaivietSP/Samsung/S3500_A_02.jpg\" alt=\"thiết kế trượt sang trọng thuộc d&ograve;ng Soul\" width=\"344\" /><br />\r\n<div class=\"memo\">&bull; Thiết kế trượt v&agrave; mỏng 99.9 x 48 x 13.9mm.<br />&bull; Vỏ được l&agrave;m bằng kim loại mờ xước cho cảm gi&aacute;c thật sang trọng. <br />&bull; Phần vỏ được gia c&ocirc;ng kỹ thuật cắt liền (kh&ocirc;ng c&oacute; vết h&agrave;n) gi&uacute;p tr&ocirc;ng thật liền lạc.</div>\r\n</div>\r\n<div class=\"content_block\">\r\n<div class=\"title_para\">\r\n<h2><span style=\"font-size: small;\">T&iacute;nh năng kh&aacute;c tr&ecirc;n S3500</span></h2>\r\n</div>\r\n<img class=\"img\" src=\"http://www.thegioididong.com/dtdd/news/BaivietSP/Samsung/S3500_A_01.jpg\" alt=\"t&iacute;nh năng kh&aacute;c tr&ecirc;n S3500\" width=\"344\" /><br />\r\n<div class=\"memo\">&bull; Gửi v&agrave; nhận SMS, EMS, MMS v&agrave; tin nhắn video.<br />&bull; Danh bạ lưu được 1000 số gi&uacute;p bạn lưu trữ tất cả danh một nơi v&agrave; dễ d&agrave;ng quản l&yacute; ch&uacute;ng.<br />&bull; Tin nhắn Bluetooth gi&uacute;p bạn gửi tin đến những người ban xung quanh m&agrave; kh&ocirc;ng tốn bất kỳ một chi ph&iacute; n&agrave;o.<br />&bull; Theo d&otilde;i điện thoại 2.0 (Utrack 2.0) gi&uacute;p bạn bảo mật th&ocirc;ng tin c&aacute; nh&acirc;n trong trường hợp bạn bị thất lạc.<br />&bull; Tin nhắn khẩn cấp sẽ b&aacute;o động bằng 1 tin nhắn cần trợ gi&uacute;p khi bạn cần.</div>\r\n</div>\r\n</div>\r\n<!-- Left Content END --><!-- Right Content START -->\r\n<div class=\"content_block2\">\r\n<div class=\"title_para\">\r\n<h2><span style=\"font-size: small;\">Giải tr&iacute; với Music &amp; FM Radio</span></h2>\r\n</div>\r\n<div class=\"memo\">&bull; Hỗ trợ nhạc đa dịnh dạng MP3 / AAC / AAC+ / MIDIplayback. <br />&bull; Quản l&yacute; nhạc theo thư viện gi&uacute;p bạn dễ d&agrave;ng lựa chọn b&agrave;i nhạc. <br />&bull; Chế độ nghe nhạc nền gi&uacute;p bạn c&oacute; thể vừa thuởng thức &acirc;m nhạc vừ a sử dụng c&aacute;c chức năng kh&aacute;c.<br />&bull; Ghi &acirc;m một đoạn FM v&agrave; chuyển th&agrave;nh nhạc chu&ocirc;ng.</div>\r\n</div>\r\n<div class=\"title_para\">\r\n<h2><span style=\"font-size: small;\">Chụp h&igrave;nh v&agrave; quay phim s&agrave;nh điệu</span></h2>\r\n</div>\r\n<p><img class=\"img\" src=\"http://www.thegioididong.com/dtdd/news/BaivietSP/Samsung/S3500_A_03.jpg\" alt=\"chụp h&igrave;nh v&agrave; quay phim s&agrave;nh điệu\" width=\"344\" /><br />&bull; Camera 2 Megapixel cho những tấm ảnh chất lượng cao v&agrave; dễ d&agrave;ng chia sẻ, in ấn.<br />&bull; Quay video với 15 f/s QVGA định dạng MPEG4 v&agrave; H.263 (xem lại với 25 f/s QVGA).<br /><em><strong><br />Theo Samsung</strong></em></p>', '25000000', 10),
(5, 3, 'iPhone 8 256GB\r\n', 'iphone-8-256gb-h4-1-400x460.png', 'Màn hình AMOLED 16 triệu màu, rộng 3.7 inches\r\nMáy ảnh 5.0 MP (2592 x 1944 pixels)\r\nĐài FM tích hợp: Có\r\nNghe nhạc: WMA, WAV, AAC+, MP3\r\nXem Phim: WMV, 3GP, MP4\r\nKết nối 3G: HSDPA, 7.2 Mbps; HSUPA, 2 Mbps, Wifi Wi-Fi 802.11 b/g, GPS: A-GPS, Bluetooth: Có,', '<div class=\"newstitle\">\r\n<h1>Desire - Chiếc Android mạnh mẽ nhất của HTC</h1>\r\n</div>\r\n<div class=\"newsintro\">\r\n<p>HTC Desire l&agrave; di động chạy Android mạnh mẽ nhất của HTC hiện nay với vi xử l&yacute; 1GHz, m&agrave;n h&igrave;nh AMOLED 3,7 inch v&agrave; nhiều trang bị kh&aacute;c.</p>\r\n</div>\r\n<p class=\"Normal\">Đ&acirc;y l&agrave; một trong số ba mẫu di động được HTC c&ocirc;ng bố đầu năm nay b&ecirc;n cạnh HD Mini v&agrave; Legend. Trong đ&oacute;, Legend đ&atilde; b&aacute;n tại Việt Nam, HD Mini sẽ xuất hiện trong thời gian tới, c&ograve;n Desire c&oacute; thể sang th&aacute;ng 5 mới c&oacute; mặt.</p>\r\n<p class=\"Normal\">Desire được xem l&agrave; một phi&ecirc;n bản kh&aacute;c của Nexus One được HTC sản xuất cho Google, tuy nhi&ecirc;n m&aacute;y thay đổi một v&agrave;i điểm trong thiết kế, ngo&agrave;i ra dung lượng RAM được cải thiện v&agrave; th&ecirc;m c&aacute;c t&iacute;nh năng như đ&agrave;i FM.<br /><br /><strong><span style=\"color: #ff0000;\">&gt;&gt;&gt;</span> Xem chi tiết th&ocirc;ng tin, h&igrave;nh ảnh, video HTC Desire &lt;<a href=\"http://www.mainguyen.vn/dienthoai/chitiet/dien-thoai-htc-desire-1522-19.html\" target=\"_blank\">tại đ&acirc;y</a>&gt;</strong><br /><span style=\"color: #3366ff;\">HTC Desire ch&iacute;nh h&atilde;ng dự kiến sẽ c&oacute; h&agrave;ng tại Mai Nguy&ecirc;n v&agrave;o đầu th&aacute;ng 5/2010.</span></p>\r\n<p class=\"Normal\"><em>Dưới đ&acirc;y l&agrave; một số h&igrave;nh ảnh thực tế Desire.</em></p>\r\n<table style=\"width: 77%;\" border=\"0\" cellspacing=\"2\" cellpadding=\"2\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/1.jpg\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">M&aacute;y b&aacute;n ra đi k&egrave;m c&aacute;c phụ kiện như sạc, c&aacute;p USB, tai  nghe.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/2.jpg\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">Desire c&oacute; k&iacute;ch thước 119 x 60 x 11,9 mm, nặng 135  gram.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/3.jpg\" alt=\"\" width=\"480\" height=\"407\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">Mặt trước model n&agrave;y l&agrave; m&agrave;n h&igrave;nh cảm ứng đa điểm  AMOLED rộng 3,7 inch, độ ph&acirc;n giải 480 x 800 pixel.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/4.jpg\" alt=\"\" width=\"480\" height=\"345\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">M&aacute;y trang bị kết nối Wi-Fi chuẩn b/g, HSDPA, 7,2  Mb/gi&acirc;y; HSUPA, 2 Mb/gi&acirc;y, Bluetooth với A2DP, GPS, hỗ trợ A-GPS.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/5.jpg\" alt=\"\" width=\"480\" height=\"319\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">So d&aacute;ng với Xperia X10, Samsung Galaxy S v&agrave; iPhone  3GS.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/6.jpg\" alt=\"\" width=\"480\" height=\"298\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">Giao diện của 4 model n&agrave;y.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/7.jpg\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">Kh&aacute;c với Nexus One, Desire sử dụng n&uacute;t điều khiển quang học giống Legend, c&aacute;c n&uacute;t bấm kh&aacute;c như Home, Menu, back v&agrave; n&uacute;t t&igrave;m kiếm được đưa xuống.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/8.jpg\" alt=\"\" width=\"480\" height=\"275\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">Cạnh tr&aacute;i l&agrave; ph&iacute;m tăng giảm &acirc;m lượng.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/9.jpg\" alt=\"\" width=\"480\" height=\"302\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">N&uacute;t nguồn v&agrave; giắc cắm tai nghe 3,5 mm ở tr&ecirc;n đỉnh.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/10.jpg\" alt=\"\" width=\"480\" height=\"318\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">M&aacute;y sử dụng cổng giao tiếp microUSB.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/11.jpg\" alt=\"\" width=\"480\" height=\"336\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"Normal\">Mặt sau của Desire l&agrave; camera 5 Megapixel, hỗ trợ chế độ tự động cạnh n&eacute;t, nhận dạng khu&ocirc;n mặt, geotagging. Ngo&agrave;i ra, model n&agrave;y c&ograve;n c&oacute; đ&egrave;n flash LED, quay video WVGA 800 x 480 pixel ở 15 khung h&igrave;nh/gi&acirc;y. M&aacute;y kh&ocirc;ng c&oacute; camera thứ hai để đ&agrave;m thoại video.</td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\"><img style=\"border: 1px solid black;\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/21/6C/12.jpg\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"BoxLink\">Pin theo m&aacute;y c&oacute; dung lượng 1400 mAh.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '15000000', 10),
(6, 5, 'HTC Desire 19+\r\n', 'htc-desire-19-plus-400x460.png', 'Hệ điều hành Android OS, v1.5\r\n256 MB RAM, 512 MB ROM\r\nCPU: Qualcomm MSM 7225, 528 MHz processor\r\nCamera 3.2 MP, hỗ trợ lấy nét tự động\r\nMạng 3G với tốc độ truyền dữ liệu 7.2 Mbps\r\nKết nối Wifi, Bluetooth 2.0\r\nChức năng định vị GPS\r\nĐài FM', '<p class=\"Title\">HTC Tattoo ch&iacute;nh h&atilde;ng gi&aacute; kh&ocirc;ng thấp</p>\r\n<p class=\"Lead\">Mức gi&aacute; của Tattoo kh&ocirc;ng b&igrave;nh d&acirc;n như trước đ&oacute;, với 8,5 triệu đồng, chiếc Android thứ ba của HTC tại Việt Nam nằm trong ph&acirc;n kh&uacute;c h&agrave;ng cao cấp.<br />&gt; <span style=\"text-decoration: underline;\"><a href=\"http://sohoa.vnexpress.net/SH/Dien-thoai/PDA/2009/09/3B9B0BFD/\">HTC Tattoo - chiếc Android gi&aacute; thấp</a></span></p>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"1\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/10/87/HTC_Tattoo.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"282\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"Image\">Tattoo tại Việt Nam nằm trong ph&acirc;n kh&uacute;c cao cấp.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"Normal\">H&ocirc;m nay, HTC Tattoo đ&atilde; xuất hiện tr&ecirc;n một số cửa h&agrave;ng, si&ecirc;u thị di động ở H&agrave; Nội v&agrave; TP HCM. Model được HTC r&uacute;t gọn nhiều trang bị, v&agrave; nhắm tới người d&ugrave;ng c&oacute; t&uacute;i tiền eo hẹp, muốn sử dụng một chiếc di động Android nhiều kết nối. Tattoo được xem l&agrave; model sở hữu lợi thế về gi&aacute;, tham gia cuộc đua smartphone gi&aacute; rẻ rầm rộ hiện nay.</p>\r\n<p class=\"Normal\">Tuy nhi&ecirc;n, mức gi&aacute; 8,5 triệu đồng của model n&agrave;y cho thị trường Việt Nam cao hơn c&aacute;c model kh&aacute;c như Nokia E75, E71... v&agrave; nằm trong ph&acirc;n kh&uacute;c smartphone cao cấp, mặc d&ugrave; kh&ocirc;ng so k&egrave; với nhiều model tr&ecirc;n 10 triệu đồng. Hiện HTC đ&atilde; giới thiệu ba chiếc Android cho thị trường Việt Nam, c&ugrave;ng với Hero (12,5 triệu đồng), Magic (11,4 triệu đồng).</p>\r\n<p class=\"Normal\">So với hai phi&ecirc;n bản đ&agrave;n anh, Tattoo được r&uacute;t gọn nhiều trang bị, m&aacute;y c&oacute; m&agrave;n h&igrave;nh nhỏ, d&ugrave; vẫn hỗ trợ c&aacute;c kết nối HSDPA, Wi-Fi, GPS. Ngo&agrave;i ra, model n&agrave;y cũng c&agrave;i đặt sẵn giao diện Sense như \"&ocirc;ng anh\" Hero.</p>\r\n<p class=\"Normal\">M&agrave;n h&igrave;nh cảm ứng của m&aacute;y rộng 2,8 inch, chuẩn QVGA với độ ph&acirc;n giải 240 x 320 pixel, camera 3,2 Megapixel. C&ocirc;ng nghệ cảm ứng của Tattoo l&agrave; điện trở, m&aacute;y trang bị b&agrave;n ph&iacute;m ảo, nhiều phần mềm kết nối mạng x&atilde; hội đi k&egrave;m.</p>', '12000000', 10),
(7, 1, 'Samsung Galaxy J7 Pro', 'samsung-galaxy-j7-pro-6-400x460.png', '    * Hệ điều hành Android 1.6 có thể nâng cấp lên 2.2\r\n    * Mạng 3G với HSDPA, 7.2 Mbps\r\n    * HSUPA, 5.76 Mbps\r\n    * Chức năng văn phòng với QuickOffice\r\n    * Google Search, Maps, Gmail, YouTube, Google Talk\r\n    * Chỉnh sửa hình ảnh, Adobe Flash 10.', '<h2>smarphone khổng lồ Dell Streak</h2>\r\n<div class=\"news_description\">iFixit vừa tiến h&agrave;nh mở chiếc smartphone khổng lồ Streak của Dell, model sở hữu m&agrave;n h&igrave;nh rộng 5 inch.</div>\r\n<div class=\"news_pro_link\"><a tabindex=\"0\" href=\"http://thegioididong.com/tin-tuc-dien-thoai-di-dong,14966-dell-streak-quoc-te-175-trieu-o-ha-noi.aspx\">&nbsp;&gt;&nbsp;Dell Streak quốc tế 17.5 triệu ở H&agrave; Nội</a></div>\r\n<div class=\"new_pro_detail_contet\">\r\n<p>&nbsp;</p>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"1\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/70_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"To&agrave;n bộ nội tạng của Dell Streak. Ảnh: iFixit.\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"Image\">To&agrave;n bộ nội tạng của Dell Streak. Ảnh: <em>iFixit.</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"Normal\">Model n&agrave;y c&oacute; m&agrave;n h&igrave;nh cảm ứng LCD rộng 5 inch, độ ph&acirc;n giải 800 x 480 pixel, m&aacute;y sở hữu camera 5 Megaoixel, m&aacute;y ảnh ph&iacute;a trước, vi xử l&yacute; Qualcomm 8250 Snapdragon tốc độ 1GHz.</p>\r\n<p class=\"Normal\">Giống như c&aacute;c mẫu di động kh&aacute;c, việc thao Dell Streak kh&ocirc;ng qu&aacute; kh&oacute; khăn, đầu ti&ecirc;n, cần mở rời pin, sau đ&oacute;, b&oacute;c mặt sau, v&agrave; th&aacute;o mở c&aacute;c chi tiết b&ecirc;n trong, bo mạch, cũng như mảng m&agrave;n h&igrave;nh ph&iacute;a trước.</p>\r\n<p class=\"Normal\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<table border=\"0\" cellspacing=\"2\" cellpadding=\"2\" width=\"80%\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/71_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"359\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/72_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/73_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"350\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/74_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"359\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/75_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/76_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/77_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/78_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/79_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"359\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/80_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"345\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/81_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"359\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/82_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /><br />\r\n<table border=\"0\" cellspacing=\"2\" cellpadding=\"2\" width=\"80%\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/83_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"338\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/84_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/85_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/86_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/87_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"336\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/88_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/89_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/90_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"359\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/91_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"313\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img src=\"http://images.thegioididong.com/Files/2010/08/21/15919/115_Mo-bung-smarphone-khong-lo-Dell-Streak.jpg\" border=\"1\" alt=\"\" width=\"480\" height=\"360\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '11000000', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `HoTen` varchar(100) CHARACTER SET utf8 NOT NULL,
  `DiaChi` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SDT` varchar(10) NOT NULL,
  `NgaySinh` date NOT NULL,
  `GioiTinh` int(1) NOT NULL COMMENT '0:Nu, 1:Nam',
  `DNSai` int(1) NOT NULL DEFAULT '0' COMMENT 'số lần đăng nhập sai',
  `TgCuoi` datetime NOT NULL COMMENT 'thời gian đăng nhập cuối cùng'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `Email`, `Password`, `HoTen`, `DiaChi`, `SDT`, `NgaySinh`, `GioiTinh`, `DNSai`, `TgCuoi`) VALUES
(1, 'ninh@gmail.com', '123456', 'Nguyễn Văn Lâm', '123 thủ đức', '0987654321', '1997-03-14', 0, 0, '2019-05-11 03:21:00'),
(2, 'hai@gmail.com', '123456', 'Nguyễn Văn Hải', '231 thủ đức', '0988654321', '1997-06-05', 1, 1, '2019-05-11 18:55:00'),
(3, 'c@gmail.com', '123456', 'Trần Văn C', '321 quận 12', '0997654321', '1997-06-24', 0, 0, '2019-06-11 13:12:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cthd`
--
ALTER TABLE `cthd`
  ADD KEY `cthd_ibfk_1` (`idHD`),
  ADD KEY `idSP` (`idSP`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`idHD`);

--
-- Indexes for table `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`idLoai`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`idSP`),
  ADD KEY `idLoai` (`idLoai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `idHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loaisp`
--
ALTER TABLE `loaisp`
  MODIFY `idLoai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `idSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cthd`
--
ALTER TABLE `cthd`
  ADD CONSTRAINT `cthd_ibfk_1` FOREIGN KEY (`idHD`) REFERENCES `hoadon` (`idHD`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cthd_ibfk_2` FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`idLoai`) REFERENCES `loaisp` (`idLoai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
