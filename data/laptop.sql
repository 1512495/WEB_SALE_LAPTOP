-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 03, 2018 at 10:40 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptop`
--

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_hoa_don`
--

DROP TABLE IF EXISTS `chi_tiet_hoa_don`;
CREATE TABLE IF NOT EXISTS `chi_tiet_hoa_don` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_hoa_don` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `so_luong` int(10) NOT NULL,
  `gia` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_hoa_don` (`id_hoa_don`),
  KEY `id_san_pham` (`id_san_pham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
CREATE TABLE IF NOT EXISTS `hoa_don` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `ngay_dat` date NOT NULL,
  `tong_tien` bigint(20) NOT NULL,
  `trang_thai` nvarchar(20) NOT NULL,  
  `thanh_toan` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nha_san_xuat`
--

DROP TABLE IF EXISTS `nha_san_xuat`;
CREATE TABLE IF NOT EXISTS `nha_san_xuat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `nha_san_xuat` (`ten`) VALUES
('apple'),
('asus'),
('hp'),
('dell'),
('msi');

-- --------------------------------------------------------

--
-- Table structure for table `loai_san_pham`
--
DROP TABLE IF EXISTS `loai_san_pham`;
CREATE TABLE IF NOT EXISTS `loai_san_pham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `loai_san_pham` (`ten`) VALUES
('Cảm ứng'),
('Mini Laptop'),
('Gaming'),
('Business'),
('Old');
-- --------------------------------------------------------

--
-- Table structure for table `san_pham`
--
DROP TABLE IF EXISTS `san_pham`;
CREATE TABLE IF NOT EXISTS `san_pham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_loai` int(11) NOT NULL,
  `id_nsx` int(11) NOT NULL,  
  `mo_ta` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `gia` bigint(20) UNSIGNED NOT NULL,
  `gia_km` bigint(20) UNSIGNED NOT NULL,
  `hinh_anh` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `so_luot_xem` int(11) NOT NULL DEFAULT 0,
  `so_luot_ban` int(11) NOT NULL DEFAULT 0,
  `ngay_nhap` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nsx` (`id_loai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `san_pham` (`ten`, `id_loai`, `id_nsx`, `mo_ta`, `gia`, `gia_km`, `hinh_anh`, `so_luot_xem`, `so_luot_ban`, `ngay_nhap`) VALUES
('DELL LCD Monitor 17 inches Wide TFT (E1709W)', 1, 4, '<div>DELL LCD Monitor 17" Wide TFT (S1709W) - 8 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 26500000, 22000000,'DELL_1.jpg', 1, 1,'2018-06-14'),
('DELL LCD Monitor 18 inches TFT ( E170S )', 2,4, '<div>DELL LCD Monitor 17" TFT ( E170S ) - 5 ms; 1280 x 1024 Black<br />Bảo hành: 24 tháng</div>', 29600000, 28000000,'DELL_2.jpg', 1, 4, '2018-06-15'),
('DELL LCD Monitor 19 inches Wide TFT (E1909W)',3,4, '<div>DELL LCD Monitor 19" Wide TFT (E1909W) /w DVI - 5 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 2290000,2290000, 'DELL_3.jpg', 2, 0,'2018-06-18'),
('DELL Inspiron 1440 (S560602 - Black )',4,4,'<div class="product_content clearfix">\r\n<h2><span style="font-size: x-small;">Pentium Dual-Core T4200 (2x2.0GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14 LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam / Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn</span></h2>\r\n<p>BH: 12 tháng</p>\r\n</div>\r\n<p> </p>', 30000000,28000000, 'DELL_4.jpg', 10, 3, '2018-06-20'),
('DELL Inspiron 1270 (S560807 - Blue ) Linux',5,4, '<div>Pentium Dual-Core T4300 (2x2.1GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China  - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 11400000,10400000, 'DELL_5.jpg', 5, 2, '2018-06-14'),
('DELL Inspiron 1545 (S560605 - Blue ) Linux',1,4, '<div>Core 2 Duo T6600 (2x2.2GHz, FSB800MHz, 45nm) / 2MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 15.6" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 13450000,13000000, 'DELL_6.jpg', 1, 0, '2018-06-17'),
('DELL Vostro A860 R520004 (Linux)', 2,4, '<div>Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless /  Weight 2.55Kg  - Made in China<br />BH: 12 tháng</div>', 8200000,8000000, 'DELL_7.jpg', 2, 0, '2018-06-14'),
('DELL Vostro AVN-1320N (T718JP8600)', 3,4, '<p><span style="font-size: small;">Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3/ WXGA TrueLife LED Black-Light  / Card reader 3in1 / RGB  / NIC / Bluetooth/Pin 6 Cells / Wireless  802.11 b,g / Weight 2.02Kg - Made in China</span></p>\r\n<p>Bao hanh: 12 thang</p>', 16750000, 15750000,'DELL_8.jpg', 5, 1, '2018-06-19'),
('APPLE Monitor 17 inches Wide TFT (E1709W)', 1, 1, '<div>APPLE LCD Monitor 17" Wide TFT (S1709W) - 8 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 26500000, 22000000,'APPLE_1.jpg', 1, 1, '2018-06-26'),
('APPLE LCD  18 inches TFT ( E170S )', 2,1, '<div>APPLE LCD Monitor 17" TFT ( E170S ) - 5 ms; 1280 x 1024 Black<br />Bảo hành: 24 tháng</div>', 29600000, 28000000,'APPLE_2.jpg', 1, 4, '2018-06-9'),
('APPLE LCD Monitor  inches Wide TFT (E1909W)',3,1, '<div>APPLE LCD Monitor 19" Wide TFT (E1909W) /w DVI - 5 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 2290000,2290000, 'APPLE_3.jpg', 2, 0, '2018-06-19'),
('APPLE Inspiron 1440 inches Wide TFT (E1909W)',4,1,'<div class="product_content clearfix">\r\n<h2><span style="font-size: x-small;">Pentium Dual-Core T4200 (2x2.0GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14 LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam / Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn</span></h2>\r\n<p>BH: 12 tháng</p>\r\n</div>\r\n<p> </p>', 30000000,28000000, 'APPLE_4.jpg', 10, 3, '2018-06-23'),
('APPLE Inspiron 1270 (S560807 - Blue ) Linux',5,1, '<div>Pentium Dual-Core T4300 (2x2.1GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China  - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 11400000,10400000, 'APPLE_5.jpg', 5, 2, '2018-06-19'),
('APPLE Inspiron 1545 (S560605 - Blue ) Linux',1,1, '<div>Core 2 Duo T6600 (2x2.2GHz, FSB800MHz, 45nm) / 2MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 15.6" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 13450000,13000000, 'APPLE_6.jpg', 1, 0, '2018-06-19'),
('APPLE Vostro A860 R520004 (Linux)', 1,1, '<div>Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless /  Weight 2.55Kg  - Made in China<br />BH: 12 tháng</div>', 8200000,8000000, 'APPLE_7.jpg', 2, 0, '2018-06-25'),
('APPLE Vostro AVN-1320N (T718JP8600)', 2,1, '<p><span style="font-size: small;">Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3\\ WXGA TrueLife LED Black-Light  / Card reader 3in1 / RGB  / NIC / Bluetooth/Pin 6 Cells / Wireless  802.11 b,g / Weight 2.02Kg - Made in China</span></p>\r\n<p>Bao hanh: 12 thang</p>', 16750000, 15750000,'APPLE_8.jpg', 5, 1, '2018-06-15'),
('ASUS Monitor 17 inches Wide TFT (E1709W)', 1,2, '<div>Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless /  Weight 2.55Kg  - Made in China<br />BH: 12 tháng</div>', 8200000,8000000, 'ASUS_7.jpg', 2, 0, '2018-06-13'),
('ASUS LCD  18 inches TFT ( E170S)', 2,2, '<p><span style="font-size: small;">Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3\\ WXGA TrueLife LED Black-Light  / Card reader 3in1 / RGB  / NIC / Bluetooth/Pin 6 Cells / Wireless  802.11 b,g / Weight 2.02Kg - Made in China</span></p>\r\n<p>Bao hanh: 12 thang</p>', 16750000, 15750000,'ASUS_8.jpg', 5, 1, '2018-06-19'),
('ASUS LCD Monitor  inches Wide TFT (E1909W)', 2,2, '<div>ASUS LCD Monitor 17" TFT ( E170S ) - 5 ms; 1280 x 1024 Black<br />Bảo hành: 24 tháng</div>', 29600000, 28000000,'ASUS_2.jpg', 1, 4, '2018-06-19'),
('ASUS Inspiron 1440 inches Wide TFT (E1909W)',4,2,'<div class="product_content clearfix">\r\n<h2><span style="font-size: x-small;">Pentium Dual-Core T4200 (2x2.0GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14 LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam / Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn</span></h2>\r\n<p>BH: 12 tháng</p>\r\n</div>\r\n<p> </p>', 30000000,28000000, 'ASUS_4.jpg', 10, 3, '2018-06-26'),
('ASUS Inspiron 1270 (S560807 - Blue ) Linux',5,2, '<div>Pentium Dual-Core T4300 (2x2.1GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China  - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 11400000,10400000, 'ASUS_5.jpg', 5, 2, '2018-06-19'),
('ASUS Inspiron 1545 (S560605 - Blue ) Linux',1,2, '<div>Core 2 Duo T6600 (2x2.2GHz, FSB800MHz, 45nm) / 2MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 15.6" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 13450000,13000000, 'ASUS_6.jpg', 1, 0, '2018-06-19'),
('ASUS Vostro A860 R520004 (Linux)', 2,2, '<div>Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless /  Weight 2.55Kg  - Made in China<br />BH: 12 tháng</div>', 8200000,8000000, 'ASUS_7.jpg', 2, 0, '2018-06-13'),
('ASUS Vostro AVN-1320N (T718JP8600)', 3,2, '<p><span style="font-size: small;">Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3\\ WXGA TrueLife LED Black-Light  / Card reader 3in1 / RGB  / NIC / Bluetooth/Pin 6 Cells / Wireless  802.11 b,g / Weight 2.02Kg - Made in China</span></p>\r\n<p>Bao hanh: 12 thang</p>', 16750000, 15750000,'ASUS_8.jpg', 5, 1, '2018-06-19'),
('HP Monitor 17 inches Wide TFT (E1709W)', 1, 3, '<div>HP LCD Monitor 17" Wide TFT (S1709W) - 8 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 26500000, 22000000,'HP_1.jpg', 1, 1, '2018-06-21'),
('HP LCD  18 inches TFT ( E170S )', 2,3, '<div>HP LCD Monitor 17" TFT ( E170S ) - 5 ms; 1280 x 1024 Black<br />Bảo hành: 24 tháng</div>', 29600000, 28000000,'HP_2.jpg', 1, 4, '2018-06-18'),
('HP LCD Monitor  inches Wide TFT (E1909W)',3,3, '<div>HP LCD Monitor 19" Wide TFT (E1909W) /w DVI - 5 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 2290000,2290000, 'HP_3.jpg', 2, 0, '2018-06-12'),
('HP Inspiron 1440 inches Wide TFT (E1909W)',4,3,'<div class="product_content clearfix">\r\n<h2><span style="font-size: x-small;">Pentium Dual-Core T4200 (2x2.0GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14 LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam / Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn</span></h2>\r\n<p>BH: 12 tháng</p>\r\n</div>\r\n<p> </p>', 30000000,28000000, 'HP_4.jpg', 10, 3, '2018-06-19'),
('HP Inspiron 1270 (S560807 - Blue ) Linux',5,3, '<div>Pentium Dual-Core T4300 (2x2.1GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China  - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 11400000,10400000, 'HP_5.jpg', 5, 2, '2018-06-22'),
('HP Inspiron 1545 (S560605 - Blue ) Linux',1,3, '<div>Core 2 Duo T6600 (2x2.2GHz, FSB800MHz, 45nm) / 2MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 15.6" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 13450000,13000000, 'HP_6.jpg', 1, 0, '2018-06-19'),
('HP Vostro A860 R520004 (Linux)', 2,3, '<div>Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless /  Weight 2.55Kg  - Made in China<br />BH: 12 tháng</div>', 8200000,8000000, 'HP_7.jpg', 2, 0, '2018-06-19'),
('HP Vostro AVN-1320N (T718JP8600)', 1,3, '<p><span style="font-size: small;">Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3\\ WXGA TrueLife LED Black-Light  / Card reader 3in1 / RGB  / NIC / Bluetooth/Pin 6 Cells / Wireless  802.11 b,g / Weight 2.02Kg - Made in China</span></p>\r\n<p>Bao hanh: 12 thang</p>', 16750000, 15750000,'HP_8.jpg', 5, 1, '2018-06-19'),
('MSI Monitor 17 inches Wide TFT (E1709W)', 1, 5, '<div>MSI LCD Monitor 17" Wide TFT (S1709W) - 8 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 26500000, 22000000,'MSI_1.jpg', 1, 1, '2018-05-19'),
('MSI LCD  18 inches TFT ( E170S )', 2,5, '<div>MSI LCD Monitor 17" TFT ( E170S ) - 5 ms; 1280 x 1024 Black<br />Bảo hành: 24 tháng</div>', 29600000, 28000000,'MSI_2.jpg', 1, 4, '2018-04-19'),
('MSI LCD Monitor  inches Wide TFT (E1909W)',3,5, '<div>MSI LCD Monitor 19" Wide TFT (E1909W) /w DVI - 5 ms; 1440 x 900<br />Bảo hành: 24 tháng</div>', 2290000,2290000, 'MSI_3.jpg', 2, 0, '2018-06-26'),
('MSI Inspiron 1440 inches Wide TFT (E1909W)',4,5,'<div class="product_content clearfix">\r\n<h2><span style="font-size: x-small;">Pentium Dual-Core T4200 (2x2.0GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14 LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam / Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn</span></h2>\r\n<p>BH: 12 tháng</p>\r\n</div>\r\n<p> </p>', 30000000,28000000, 'MSI_4.jpg', 10, 3, '2018-06-19'),
('MSI Inspiron 1270 (S560807 - Blue ) Linux',5,5, '<div>Pentium Dual-Core T4300 (2x2.1GHz, FSB800MHz, 45nm) / 1MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 14" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China  - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 11400000,10400000, 'MSI_5.jpg', 5, 2, '2018-06-22'),
('MSI Inspiron 1545 (S560605 - Blue ) Linux',1,5, '<div>Core 2 Duo T6600 (2x2.2GHz, FSB800MHz, 45nm) / 2MB Cache / 2GB DDR2-800 / VGA Intel GMA X4500MHD upto 512MB HDD 320GB SATA / DVD-RW / 15.6" LED Backlight wide 16:9 LCD / Pin 6 Cell /  Wireless /  Card Reader / Webcam/ Bluetooth Weight 2.4Kg  / Made in China - Phong cách trẻ trung ấn tương - LCD đèn nền LED siêu sáng, tiết kiệm pin - HDD dung lượng lớn<br />BH: 12 tháng</div>', 13450000,13000000, 'MSI_6.jpg', 1, 0, '2018-06-19'),
('MSI Vostro A860 R520004 (Linux)', 2,5, '<div>Intel Celeron Dual-Core T1400 (2*1.73GHz, FSB533MHz) / 512KB Cache / 1GB DDRam/ HDD 120GB SATA / VGA GMA X3100 128MB shared DVD-RW / 15.6" wide 16:9 HD720p - WXGA TrueLife / Pin 6 Cell / Bluetooth / Wireless /  Weight 2.55Kg  - Made in China<br />BH: 12 tháng</div>', 8200000,8000000, 'MSI_7.jpg', 2, 0, '2018-06-19'),
('MSI Vostro AVN-1320N (T718JP8600)', 1,5, '<p><span style="font-size: small;">Core 2 Duo P8600 2*2.4GHZ/3MB L2 cache, 1066MHz FSB/Ram 3GB/HDD 320GB /VGA Intel GMA X4500MHD upto 512MB 13.3\\ WXGA TrueLife LED Black-Light  / Card reader 3in1 / RGB  / NIC / Bluetooth/Pin 6 Cells / Wireless  802.11 b,g / Weight 2.02Kg - Made in China</span></p>\r\n<p>Bao hanh: 12 thang</p>', 16750000, 15750000,'MSI_8.jpg', 5, 1, '2018-06-19');
-- --------------------------------------------------------

  
--
-- Table structure for table `slide`
--

DROP TABLE IF EXISTS `slide`;
CREATE TABLE IF NOT EXISTS `slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hinh_anh` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `slide` (`hinh_anh`) VALUES
('slider2.jpg'),
('slider1.jpg'),
('slider3.jpg');
-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `gioi_tinh` varchar(5) NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dia_chi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(21) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chi_tiet_hoa_don`
--
ALTER TABLE `chi_tiet_hoa_don`
  ADD CONSTRAINT `chi_tiet_hoa_don_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`),
  ADD CONSTRAINT `chi_tiet_hoa_don_ibfk_2` FOREIGN KEY (`id_hoa_don`) REFERENCES `hoa_don` (`id`);

--
-- Constraints for table `hoa_don`
--
ALTER TABLE `hoa_don`
  ADD CONSTRAINT `hoa_don_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);


--
-- Constraints for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`id_loai`) REFERENCES `loai_san_pham` (`id`),
  ADD CONSTRAINT `san_pham_ibfk_2` FOREIGN KEY (`id_nsx`) REFERENCES `nha_san_xuat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
