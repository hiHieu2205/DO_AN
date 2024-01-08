-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 07:16 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlyhieusach`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Goo', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 2147483647),
(2, 'Mod đz', 'mod@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Danh mục sách', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2017-04-22 05:37:02'),
(7, 'SÁCH NƯỚC NGOÀI', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'SÁCH TRONG NƯỚC', '', 1, 2, '2017-04-22 05:37:36'),
(9, 'THAM KHẢO THÊM', '', 1, 3, '2017-04-22 05:37:50'),
(10, 'BUSINESS AND MANAGEMENT', '', 7, 1, '2017-04-22 09:08:19'),
(11, 'CHILDREN BOOKS ', '', 7, 2, '2017-04-22 09:08:36'),
(12, 'PERSONAL DEVELOPMENT', '', 7, 3, '2017-04-22 09:09:01'),
(13, 'FICTION', '', 7, 4, '2017-04-22 09:09:14'),
(14, 'COMIC', '', 7, 5, '2017-04-22 09:09:31'),
(15, 'VĂN HỌC', '', 8, 1, '2017-04-22 09:09:46'),
(16, 'KINH TẾ', '', 8, 2, '2017-04-22 09:10:10'),
(17, 'CHÍNH TRỊ', '', 8, 3, '2017-04-22 09:23:39'),
(18, 'LỊCH SỬ', '', 8, 4, '2017-04-22 09:23:57'),
(19, 'TỬ VI-PHONG THỦY', '', 9, 1, '2017-04-22 09:25:55'),
(20, 'Y HỌC-SỨC KHỎE', '', 9, 2, '2017-04-22 09:26:21'),
(21, 'TRIẾT HỌC-ĐỜI SỐNG', '', 9, 4, '2017-04-22 09:26:34');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(29, 23, 72, 2, '200000.00', 0),
(28, 23, 71, 1, '100000.00', 0),
(27, 22, 71, 1, '100000.00', 0),
(26, 21, 71, 1, '100000.00', 0),
(25, 20, 72, 1, '100000.00', 0),
(24, 20, 71, 1, '100000.00', 0),
(23, 19, 69, 1, '500000.00', 0),
(22, 18, 71, 1, '100000.00', 0),
(21, 18, 72, 1, '100000.00', 0),
(20, 17, 69, 1, '500000.00', 0),
(16, 13, 29, 1, '180000.00', 0),
(17, 14, 29, 1, '180000.00', 0),
(18, 15, 50, 1, '100.00', 0),
(19, 16, 50, 1, '100.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(66, 15, 'Bến Xe ', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>8935212349208</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/dinh-ti?fhs_campaign=ATTRIBUTE_PRODUCT\">Đinh Tị</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Thương Th&aacute;i Vi</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Người Dịch</th>\r\n			<td>Greenrosetq</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>NXB Văn Học</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2020</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Ng&ocirc;n Ngữ</th>\r\n			<td>Tiếng Việt</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>300</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>20.5 x 13 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>284</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/dinh-ti?fhs_campaign=INTERNAL_LINKING\">Đinh Tị</a></li>\r\n				<li><a href=\"https://www.fahasa.com/vnpay?fhs_campaign=INTERNAL_LINKING\">V&iacute; VNPAY</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/ngon-tinh.html?order=num_orders_month\">Top 100 sản phẩm Ng&ocirc;n T&igrave;nh b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Bến Xe (T&aacute;i Bản 2020)</p>\r\n\r\n<p>Bến Xe</p>\r\n\r\n<p>Thứ t&ocirc;i c&oacute; thể cho em trong cuộc đời n&agrave;y</p>\r\n\r\n<p>chỉ l&agrave; danh dự trong sạch</p>\r\n\r\n<p>v&agrave; một tương lai tươi đẹp m&agrave; th&ocirc;i.</p>\r\n\r\n<p>Thế nhưng, nếu ch&uacute;ng ta c&oacute; kiếp sau,</p>\r\n\r\n<p>nếu kiếp sau t&ocirc;i c&oacute; đ&ocirc;i mắt s&aacute;ng,</p>\r\n\r\n<p>t&ocirc;i sẽ ở bến xe n&agrave;y&hellip; đợi em.</p>\r\n', '100000.00', 20000, 'xe.jpg', '[]', 2, 0, 4, 1, 1650357802),
(65, 14, 'Làm Dâu Nhà Sói ', '<p>L&agrave;m D&acirc;u Nh&agrave; S&oacute;i</p>\r\n\r\n<p>Tộc s&oacute;i c&oacute; một truyền thống được gọi l&agrave; &ldquo;h&oacute;a d&acirc;u&rdquo;.</p>\r\n\r\n<p>Kaede thuộc tộc thỏ đ&atilde; v&igrave; ng&ocirc;i l&agrave;ng của m&igrave;nh m&agrave; đi l&agrave;m d&acirc;u cho một gia đ&igrave;nh danh gi&aacute; của tộc s&oacute;i. Mặc d&ugrave; tức giận v&igrave; cuộc h&ocirc;n nh&acirc;n chẳng kh&aacute;c n&agrave;o lễ hiến tế n&agrave;y, nhưng với bản t&iacute;nh quyết chiến, Kaede đ&atilde; thẳng thắn đối mặt với vị h&ocirc;n phu của m&igrave;nh. Vậy m&agrave; Ren, cậu trai nối d&otilde;i của nh&agrave; s&oacute;i chỉ đ&aacute;p lại bằng th&aacute;i độ lạnh l&ugrave;ng v&agrave; cộc lốc. Đ&atilde; thế, ngay sau khi đến nơi Kaede được biết, &ldquo;Cậu phải thay đổi thể chất của m&igrave;nh để c&oacute; thể kết đ&ocirc;i với chủng lo&agrave;i kh&aacute;c.&rdquo; Sau đ&oacute;, cậu bị bắt uống một loại thuốc c&oacute; t&ecirc;n gọi l&agrave; &ldquo;Thuốc h&oacute;a d&acirc;u&rdquo;. Thế l&agrave; k&igrave; &ldquo;h&oacute;a d&acirc;u&rdquo; đ&atilde; bắt đầu v&agrave; sẽ k&eacute;o d&agrave;i suốt 1 th&aacute;ng cho đến ng&agrave;y cử h&agrave;nh h&ocirc;n lễ ch&iacute;nh thức&hellip;</p>\r\n', '50000.00', 5000, 'soi.jpg', '[]', 1, 0, 4, 1, 1650357719),
(64, 13, 'Safe Haven', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>9781455523542</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/hachette-publishing?fhs_campaign=ATTRIBUTE_PRODUCT\">Hachette Book Group</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td><a href=\"https://www.fahasa.com/best-romance-authors?fhs_campaign=ATTRIBUTE_PRODUCT\">Best Romance Authors</a>,&nbsp;<a href=\"https://www.fahasa.com/favorite-author-nicholas-sparks?fhs_campaign=ATTRIBUTE_PRODUCT\">Nicholas Sparks</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>Hachette</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>18/12/2012</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>222</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>17.3 x 10.7 x 3.0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>405</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/best-romance-authors?fhs_campaign=INTERNAL_LINKING\">Best Romance Authors</a></li>\r\n				<li><a href=\"https://www.fahasa.com/best-spring-summer-reads?fhs_campaign=INTERNAL_LINKING\">Best Spring - Summer Reads</a></li>\r\n				<li><a href=\"https://www.fahasa.com/do-you-love-me?fhs_campaign=INTERNAL_LINKING\">Do You Love Me</a></li>\r\n				<li><a href=\"https://www.fahasa.com/favorite-author-nicholas-sparks?fhs_campaign=INTERNAL_LINKING\">Nicholas Sparks</a></li>\r\n				<li><a href=\"https://www.fahasa.com/romantic-evening-books?fhs_campaign=INTERNAL_LINKING\">Romantic Evening Books</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/foreigncategory/fiction/romance.html?order=num_orders_month\">Top 100 sản phẩm Romance b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>When a mysterious young woman named Katie appears in the small North Carolina town of Southport, her sudden arrival raises questions about her past. Beautiful yet self-effacing, Katie seems determined to avoid forming personal ties until a series of events draws her into two reluctant relationships: one with Alex, a widowed store owner with a kind heart and two young children; and another with her plainspoken single neighbor, Jo. Despite her reservations, Katie slowly begins to let down her guard, putting down roots in the close-knit community and becoming increasingly attached to Alex and his family. But even as Katie begins to fall in love, she struggles with the dark secret that still haunts and terrifies her . . . a past that set her on a fearful, shattering journey across the country, to the sheltered oasis of Southport. With Jo&#39;s empathic and stubborn support, Katie eventually realizes that she must choose between a life of transient safety and one of riskier rewards . . . and that in the darkest hour, love is the only true safe haven.</p>\r\n', '100000.00', 10000, 'nico.jpg', '[\"nico1.jpg\"]', 1, 0, 4, 1, 1650357523),
(62, 13, 'The Haunting of Hill House', '<p>The greatest haunted house story ever written and the inspiration for a 10-part Netflix series directed by Mike Flanagan and starring Michiel Huisman, Carla Gugino, and Timothy Hutton. First published in 1959, Shirley Jackson&#39;s The Haunting of Hill House has been hailed as a perfect work of unnerving terror. It is the story of four seekers who&nbsp;arrive at a notoriously unfriendly pile called Hill House: Dr. Montague, an occult&nbsp;&nbsp;scholar looking for solid evidence of a &quot;haunting&quot;; Theodora, his lighthearted&nbsp;assistant; Eleanor, a friendless, fragile young woman well acquainted with&nbsp;poltergeists; and Luke, the future heir of Hill House. At first, their stay seems&nbsp;destined to be merely a spooky encounter with inexplicable phenomena. But Hill&nbsp;House is gathering its powers--and soon it will choose one of them to make its&nbsp;own.&nbsp;</p>\r\n', '125000.00', 3000, 'hunt.jpg', '[\"hunt2.png\",\"hunt3.png\"]', 0, 0, 4, 1, 1650357303),
(63, 13, 'Percy Jackson And The Olympians 4 The Battle Of The Labyrinth', '<p>Half Boy. Half God. All Hero. Honestly, blowing up another school was the last thing I wanted to do. As the son of a Greek God, I&#39;ve had my share of near-death disaster - and now my arch enemy Luke wants to invade our camp via an ancient labyrinth. If he succeeds, thousands of bloodthirsty monsters will attack. So it&#39;s goodbye sunshine, hello darkness as four of us descend into the terrifying underground and beyond...Rick Riordan is the Mythmaster. The Greek Gods are alive and kicking.</p>\r\n', '150000.00', 25000, 'per.jpg', '[\"per2.jpg\"]', 0, 0, 4, 1, 1650357430),
(54, 10, 'The 100 Absolutely Unbreakable Laws of Business Success', '<p>Why are some people more successful in business? Why do some businesses flourish where others fail? Renowned business speaker and author, Brian Tracy has discovered the answers to these puzzling questions. In The 100 Absolutely Unbreakable Laws of Business Success Tracy draws on his thirty years&#39; experience to present a set of universal laws that lie behind the success of business people everywhere, in every kind of enterprise, large and small. Tracy breaks the 100 laws down into nine categories: Life, Success, Business, Leadership, Money, Economics, Selling, Negotiating, and Time Management. Drawing on a lifetime of observation, investigation, and experience, Tracy identifies and defines each law - such as the Law of Cause and Effect and the Law of Increasing Returns - and reveals its source, illustrates how it functions through real-life examples, and shows how to apply it through specific exercises that everyone can use to begin the journey toward greater business success. Easy to read, easy to understand, and easy to apply, The 100 Absolutely Unbreakable Laws of Business Success offers a straightforward, eye-opening, life-affirming approach to how the world of business really works.</p>\r\n', '300000.00', 0, 'BRIAN.jpg', '[\"BRIAN2.png\",\"BRIAN3.png\"]', 1, 0, 4, 1, 1650356036),
(53, 10, 'Think Big', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>9780062022394</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/harper-collins?fhs_campaign=ATTRIBUTE_PRODUCT\">HarperCollins Publishers</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Bill Zanker Donald J. Trump</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>HarperCollins Publishers Inc</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2012/01/05</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>181.44</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>2.7 x 10.6 x 17.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>384</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/foreign-book-collection-new?fhs_campaign=INTERNAL_LINKING\">Foreign Book - Collection - New</a></li>\r\n				<li><a href=\"https://www.fahasa.com/harper-collins?fhs_campaign=INTERNAL_LINKING\">HarperCollins Publishers</a></li>\r\n				<li><a href=\"https://www.fahasa.com/sach-kinh-te-mua-manh-giam-bao?fhs_campaign=INTERNAL_LINKING\">S&aacute;ch Kinh Tế</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/foreigncategory/business-finance-law/business-management.html?order=num_orders_month\">Top 100 sản phẩm Business &amp; Management b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Donald J. Trump is an icon: the very definition of the American success story. President-elect, reality-television star, and developer of some of the planet&#39;s most prestigious real estate, he&#39;s also become one of the world&#39;s wealthiest men.</p>\r\n\r\n<p>Trump is a living example of how thinking BIG and knowing when to back up your opinions aggressively-regardless of what your critics or opponents might say-can help you maximize your personal and professional achievements. In his first political campaign, Trump defeated his opponents by rallying voters nationwide to &quot;Make America Great Again.&quot; For the first time ever, you too can learn Trump&#39;s secrets to thinking BIG and kicking ass! Learn:</p>\r\n\r\n<p>Momentum: the Big Mo. How to get it and how to get it back.<br />\r\nRevenge: how and when to get it (and why it&#39;s so sweet).<br />\r\n&quot;I love you, now sign this!&quot; Why contracts in business and personal life are so important.<br />\r\nReal-life stories from people who&#39;ve applied the think BIG formula in their own lives.</p>\r\n\r\n<p>These strategies are proven and attested to by those who&#39;ve learned to think BIG from Donald Trump and found success in their own lives even when the world seems to be against them. Co-authored with Bill Zanker, an entrepreneur who learned these tactics firsthand from Trump, Think BIG and Kick Ass shows you how to bring a winning attitude to everything you do.</p>\r\n', '200000.00', 0, 'TRUMP.jpg', '[\"TRUMP2.png\",\"TRUMP3.png\"]', 2, 0, 4, 1, 1650355844),
(58, 11, 'Exile ', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>9781442445970</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Độ Tuổi</th>\r\n			<td><a href=\"https://www.fahasa.com/all-category.html?age=45879&amp;fhs_campaign=ATTRIBUTE_PRODUCT\">8 - 12</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/all-category.html?supplier_list=1229201&amp;fhs_campaign=ATTRIBUTE_PRODUCT\">Simon And Schuster</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Shannon Messenger</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>Aladdin</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2018</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>379</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>13 x 4.3 x 19.4 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>592</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/foreigncategory/children-s-books/fiction/fantasy.html?order=num_orders_month\">Top 100 sản phẩm Fantasy b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Exile (Keeper of the Lost Cities)</strong></p>\r\n\r\n<p><strong>A&nbsp;<em>New York Times</em>&nbsp;bestselling series</strong><br />\r\n<strong>A&nbsp;<em>USA TODAY</em>&nbsp;bestselling series</strong><br />\r\n<strong>A California Young Reader Medal&ndash;winning series</strong></p>\r\n\r\n<p>Sophie befriends the mythical Alicorn&mdash;and puts her mysterious powers to the test&mdash;in this enchanting sequel to&nbsp;<em>Keeper of the Lost Cities</em>.</p>\r\n\r\n<p>Sophie is settling in nicely to her new home and her new life in the world of the lost cities. And it helps that living at Havenfield means getting to spend time with rare, precious species&mdash;including the first female Alicorn, who shows herself to Sophie and trusts no one but her.</p>\r\n\r\n<p>Sophie is tasked with helping to train the magical creature so that the Alicorn can be revealed to the people of the lost cities as a sign of hope, and Sophie wants to believe that the recent drama and anguish is gone for good.</p>\r\n\r\n<p>But the secrets buried deep in Sophie&rsquo;s memories remain, and before long before she&rsquo;s back in incredible danger, risking everything to find the answers to questions that could save not only her life, but the life of someone close to her&hellip;</p>\r\n', '100000.00', 0, 'keeper.jpg', '[\"keeper2.png\",\"keeper3.png\"]', 1, 0, 4, 1, 1650356686),
(59, 12, 'Rich Dad s Guide to Becoming Rich Without Cutting Up Your Credit Cards', '<p>There are &ldquo;financial experts&rdquo; who advise people to take out their credits cards and cut them up. And that may be a good plan for someone who is financially irresponsible, it&rsquo;s not great advice for someone who wants to build wealth and become financially free. Cutting up your credit cards won&rsquo;t make you rich; learning to leverage and manage debt will.</p>\r\n\r\n<p>If a person has a solid financial education they will know that there are two kinds of debt: good debt and bad debt. A person who understands debt will know how to use good debt to make them richer faster. And when we take control and learn to manage bad debt, seeing it for what it is and understanding the toll it can take if abused, we are on the road to financial freedom.</p>\r\n\r\n<p>Learn how to make your money work hard for you&hellip; instead of you working hard for money all your life. Understanding debt and how to use and leverage it is an important first step.</p>\r\n', '150000.00', 0, 'rich.jpg', '[\"rich3.jpg\"]', 1, 0, 4, 1, 1650356963),
(60, 12, 'Our Iceberg is Melting: Changing and Succeeding Under Any Conditions', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>9781509830114</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/macmillan-elt?fhs_campaign=ATTRIBUTE_PRODUCT\">Macmillan Publishers</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>John Kotter, Holger Rathgeber</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>Pan MacMillan</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2017</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Ng&ocirc;n Ngữ</th>\r\n			<td>Tiếng Anh</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>470</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>15.1 x 21.7 x 2.1 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>176</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Cứng</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/flashsale?fhs_campaign=INTERNAL_LINKING\">Flashsale</a></li>\r\n				<li><a href=\"https://www.fahasa.com/foreign-book-collection-new?fhs_campaign=INTERNAL_LINKING\">Foreign Book - Collection - New</a></li>\r\n				<li><a href=\"https://www.fahasa.com/ma-giam-gia?fhs_campaign=INTERNAL_LINKING\">M&atilde; Giảm Gi&aacute;</a></li>\r\n				<li><a href=\"https://www.fahasa.com/macmillan?fhs_campaign=INTERNAL_LINKING\">MACMILLAN PUBLISHING</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/foreigncategory/personal-development/popular-psychology/assertiveness-motivation-self-esteem.html?order=num_orders_month\">Top 100 sản phẩm Assertiveness, Motivation &amp; Self-esteem b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Our Iceberg is Melting: Changing and Succeeding Under Any Conditions</strong></p>\r\n\r\n<p><strong>In&nbsp;<em>Our Iceberg is Melting&nbsp;</em>a simple fable about penguins illustrates how to conquer change, with profound lessons for working and living in an ever-changing world.</strong></p>\r\n\r\n<p>This charming story about a penguin colony in Antarctica illustrates key truths about how we deal with the issue of change: handle the challenge well and you can prosper greatly; handle it poorly and you put yourself at risk. The penguins are living happily on their iceberg as they have done for many years. Then one curious penguin discovers a potentially devastating problem threatening their home &ndash; and pretty much no one listens to him.</p>\r\n\r\n<p>The characters in this fable are like people we recognize, even ourselves. Their story is one of resistance to change and heroic action, confusion and insight, seemingly intractable obstacles and the most clever tactics for dealing with those obstacles. It is a story that is occuring in different forms around us today &ndash; but the penguins handle change a great deal better than most of us.</p>\r\n\r\n<p>Based on John Kotter&#39;s pioneering work on how to make smart change happen faster and better, the lessons you can learn from this short and easy-to-read book will serve you well in your job, in your family and in your community. And these lessons are becoming ever more important as the world around us changes faster and faster.</p>\r\n\r\n<p><strong>This edition celebrates ten years since the publication of this classic business fable with new and improved illustrations and a foreword by Spencer Johnson, author of&nbsp;<em>Who Moved My Cheese?</em></strong></p>\r\n', '200000.00', 0, 'cut.jpg', '[\"cut2.jpg\",\"cut3.jpg\"]', 0, 0, 4, 1, 1650357082),
(61, 12, 'Chicken Soup For The Soul The Cat Really Did That', '<p>Our cats make us smile every day, but some days they really outdo themselves! This book is full of those hilarious and heartwarming stories about the many ways our mischevious feline friends surprise us, make us laugh, and touch our&nbsp;<br />\r\nhearts.&nbsp;</p>\r\n\r\n<p>With a focus on rescue cats, these 101 true, personal stories will make you laugh, nod your head in recognition, and sometimes tear up a little. Royalties from the book go to American Humane, one of the organizations that Chicken Soup for the Soul supports in its broad program to help care for shelter animals and promote adoption.</p>\r\n', '250000.00', 50000, 'meo.jpg', '[\"meo2.png\",\"meo3.png\"]', 0, 0, 4, 1, 1650357183),
(67, 16, 'Đầu Tư Chứng Khoán Khôn Ngoan Khi Bạn Không Phải Cá Mập', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>8936066688741</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/1980-books?fhs_campaign=ATTRIBUTE_PRODUCT\">1980 Books</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Kevin J Davey</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Người Dịch</th>\r\n			<td>L&ecirc; Dung</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>NXB C&ocirc;ng Thương</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2020</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Ng&ocirc;n Ngữ</th>\r\n			<td>Tiếng Việt</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>400</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>20.5 x 13 x 0.5 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>382</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/1980-books?fhs_campaign=INTERNAL_LINKING\">1980 Books</a></li>\r\n				<li><a href=\"https://www.fahasa.com/sach-kinh-te-mua-manh-giam-bao?fhs_campaign=INTERNAL_LINKING\">S&aacute;ch Kinh Tế</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/chung-khoan-bat-dong-san-dau-tu.html?order=num_orders_month\">Top 100 sản phẩm Chứng Kho&aacute;n - Bất Động Sản - Đầu Tư b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Bạn c&oacute; muốn t&iacute;ch lũy cho kế hoạch tương lai? Bạn c&oacute; muốn gia tăng t&agrave;i sản phục vụ cho những mục đ&iacute;ch d&agrave;i hạn? Bạn bắt đầu quan t&acirc;m v&agrave; t&igrave;m hiểu kế hoạch t&agrave;i ch&iacute;nh c&aacute; nh&acirc;n. Bạn nghe nhiều về sự cần thiết của việc đầu tư để t&iacute;ch lũy t&agrave;i ch&iacute;nh cho tương lai nhưng băn khoăn lựa chọn h&igrave;nh thức đầu tư ph&ugrave; hợp ? V&agrave; bạn được khuy&ecirc;n rằng đầu tư cổ phiếu ch&iacute;nh l&agrave; giải ph&aacute;p th&ocirc;ng minh cho kế hoạch t&agrave;i ch&iacute;nh c&aacute; nh&acirc;n của bạn, ngay cả khi bạn chỉ c&oacute; nguồn vốn hạn hẹp. Nhưng l&agrave;m thế n&agrave;o để bắt đầu khi bạn kh&ocirc;ng c&oacute; kiến thức t&agrave;i ch&iacute;nh, bạn mơ hồ về c&aacute;c thuật ngữ kinh tế v&agrave; thậm ch&iacute; bạn chưa từng xem một bản tin t&agrave;i ch&iacute;nh. Đầu tư chứng kho&aacute;n kh&ocirc;n ngoan khi bạn kh&ocirc;ng phải&nbsp;<strong>&ldquo;c&aacute; mập&rdquo;</strong>&nbsp;ch&iacute;nh l&agrave; cuốn s&aacute;ch d&agrave;nh cho bạn.</p>\r\n\r\n<p><strong>Cuốn s&aacute;ch Đầu tư chứng kho&aacute;n kh&ocirc;n ngoan khi bạn kh&ocirc;ng phải c&aacute; mập&nbsp;</strong>chắc chắn sẽ l&agrave; ch&igrave;a kh&oacute;a mở c&aacute;nh cửa đầu tư cho bạn. Tạo nền tảng chuẩn bị cho những nh&agrave; đầu tư bắt đầu t&igrave;m hiểu v&agrave; gia nhập thị trường, cuốn s&aacute;ch hướng dẫn tổng qu&aacute;t về thị trường chứng kho&aacute;n, cổ phiếu với nhiều loại kh&aacute;c nhau, quy tr&igrave;nh mở t&agrave;i khoản v&agrave; thao t&aacute;c đặt lệnh giao dịch. Bạn đọc cũng được hướng dẫn căn bản về ph&acirc;n t&iacute;ch cổ phiếu như theo d&otilde;i biểu đồ gi&aacute;, thuật to&aacute;n giao dịch, lựa chọn cổ phiếu, x&acirc;y dựng danh mục hay ph&acirc;n bổ vị thế. Trọng t&acirc;m của cuốn s&aacute;ch l&agrave; th&aacute;p lựa chọn cổ phiếu với t&aacute;m cấp độ kh&aacute;c nhau cho ph&eacute;p những nh&agrave; đầu tư tiềm năng lựa chọn phương ph&aacute;p v&agrave; chiến lược giao dịch cổ phiếu kh&ocirc;n ngoan v&agrave; ph&ugrave; hợp nhất.</p>\r\n', '200000.00', 0, 'ck.jpg', '[]', 0, 0, 4, 1, 1650357892),
(52, 10, 'Elon Musk: How the Billionaire CEO of SpaceX and Tesla is Shaping our Future', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>9780753557525</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/grantham?fhs_campaign=ATTRIBUTE_PRODUCT\">Grantham Book Services</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Ashlee Vance</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>Ebury Publishing</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>01/03/2016</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>238</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>2.0 x 17.0 x 11.0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>416</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/elon-musk?fhs_campaign=INTERNAL_LINKING\">ELON MUSK</a></li>\r\n				<li><a href=\"https://www.fahasa.com/famous-person?fhs_campaign=INTERNAL_LINKING\">Famous Person</a></li>\r\n				<li><a href=\"https://www.fahasa.com/foreign-book-collection-new?fhs_campaign=INTERNAL_LINKING\">Foreign Book - Collection - New</a></li>\r\n				<li><a href=\"https://www.fahasa.com/foreign-books-flat-20-off?fhs_campaign=INTERNAL_LINKING\">Foreign Books - Flat 20% Off</a></li>\r\n				<li><a href=\"https://www.fahasa.com/grantham?fhs_campaign=INTERNAL_LINKING\">Grantham Book Services</a></li>\r\n				<li><a href=\"https://www.fahasa.com/new-york-times-bestsellers?fhs_campaign=INTERNAL_LINKING\">New York Times Bestsellers</a></li>\r\n				<li><a href=\"https://www.fahasa.com/sach-kinh-te-mua-manh-giam-bao?fhs_campaign=INTERNAL_LINKING\">S&aacute;ch Kinh Tế</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/foreigncategory/business-finance-law/business-management/entrepreneurship.html?order=num_orders_month\">Top 100 sản phẩm Entrepreneurship b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>South African born Elon Musk is the renowned entrepreneur and innovator behind PayPal, SpaceX, Tesla, and SolarCity. Musk wants to save our planet; he wants to send citizens into space, to form a colony on Mars; he wants to make money while doing these things; and he wants us all to know about it. He is the real-life inspiration for the&nbsp;<em>Iron Man</em>&nbsp;series of films starring Robert Downey Junior.<br />\r\n<br />\r\nThe personal tale of Musk&rsquo;s life comes with all the trappings one associates with a great, drama-filled story. He was a freakishly bright kid who was bullied brutally at school, and abused by his father. In the midst of these rough conditions, and the violence of apartheid South Africa, Musk still thrived academically and attended the University of Pennsylvania, where he paid his own way through school by turning his house into a club and throwing massive parties.<br />\r\n<br />\r\nHe started a pair of huge dot-com successes, including PayPal, which eBay acquired for $1.5 billion in 2002. Musk was forced out as CEO and so began his lost years in which he decided to go it alone and baffled friends by investing his fortune in rockets and electric cars. Meanwhile Musk&rsquo;s marriage disintegrated as his technological obsessions took over his life ...<br />\r\n<br />\r\nElon Musk is the Steve Jobs of the present and the future, and for the past twelve months, he has been shadowed by tech reporter, Ashlee Vance.&nbsp;<em>Elon Musk: How the Billionaire CEO of Spacex and Tesla is Shaping our Future&nbsp;</em>is an important, exciting and intelligent account of the real-life Iron Man.</p>\r\n', '108000.00', 50000, 'bussiness1_elonmusk.jpg', '[\"elon_musk_2.png\",\"elon_musk_3.png\"]', 2, 0, 9, 2, 1650355140),
(56, 11, 'The Lion King Read-Along Storybook And CD', '<p>With original character voices and sound effects from the award-winning film,&nbsp;<em>The Lion King</em>, this thrilling read-along brings all the action to life. Readers can turn the pages at the sound of the chime and follow along with the word-for-word narration on the CD!</p>\r\n', '100000.00', 0, 'ELSA.jpg', '[\"ELSA2.jpg\",\"ELSA3.jpg\"]', 1, 0, 4, 1, 1650356432),
(57, 11, 'Disney Kids Readers Level 1: Nemo In School', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>9781292346649</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Cấp Độ/ Lớp</th>\r\n			<td><a href=\"https://www.fahasa.com/all-category.html?reading_level=292801&amp;fhs_campaign=ATTRIBUTE_PRODUCT\">Cấp Độ 1</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/pearson-elt?fhs_campaign=ATTRIBUTE_PRODUCT\">Pearson Education</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Nicola Schofield, Kathryn Harper, Gregg Schroeder, Hawys Morgan, Marie Crook, Gregg Schroeder, Rachel Wilson</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>Pearson</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2021</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Ng&ocirc;n Ngữ</th>\r\n			<td>Tiếng Anh</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>100</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>23 x 18.7 x 0.5 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>24</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/happy-childrens-day?fhs_campaign=INTERNAL_LINKING\">Happy Childrens Day</a></li>\r\n				<li><a href=\"https://www.fahasa.com/pearson-elt?fhs_campaign=INTERNAL_LINKING\">Pearson Education</a></li>\r\n				<li><a href=\"https://www.fahasa.com/pearson-elt-new-arrivals?fhs_campaign=INTERNAL_LINKING\">Pearson ELT - New Arrivals</a></li>\r\n				<li><a href=\"https://www.fahasa.com/pearson-elt-teaching-resources-education?fhs_campaign=INTERNAL_LINKING\">Pearson ELT - Teaching Resources &amp; Education</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/foreigncategory/children-s-books/education/english-language.html?order=num_orders_month\">Top 100 sản phẩm English Language b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Disney Kids Readers Level 1: Nemo In School</strong></p>\r\n\r\n<p>Disney PIXAR Nemo in School - Nemo is a fish. Nemo and his dad live in the ocean. It is the first day of school today. Who does Nemo see in school on the first day?</p>\r\n\r\n<p>Discover the magic of stories. Disney Kids Readers (DKR) for Young Learners is designed to make your child learn English better.</p>\r\n\r\n<p>They can dive into adventures with their favourite Disney characters, and enjoy the interactive features at the end of each story when they share &quot;reading time&quot; with you!</p>\r\n\r\n<p>The 36 DKR volumes use beautiful artwork from animated and live Disney and PIXAR films, helping students expand their reading skills in an engaging and motivating way. &nbsp;There is also an audiobook feature that can help your child learn how to pronounce English words correctly!</p>\r\n\r\n<p>Learning to read and speak in English has never been so much fun!</p>\r\n\r\n<p>All Disney Kids Readers are aligned to the Global Scale of English and Common European Framework (CEFR).</p>\r\n\r\n<p>Level 1<br />\r\nCEFR: &lt;A1/A1, GSE: 16-27<br />\r\nPages: 24<br />\r\nHeadwords: 200<br />\r\nNarrative wordcount: 90-140<br />\r\nWords per page: 5-10<br />\r\nExtra words: +5</p>\r\n', '100000.00', 0, 'nemo.jpg', '[\"nemo2.jpg\"]', 1, 0, 4, 1, 1650356551),
(68, 17, 'Chính Trị Luận  ', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>8935270700195</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/alpha-books?fhs_campaign=ATTRIBUTE_PRODUCT\">Alpha Books</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Aristotle</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Người Dịch</th>\r\n			<td>N&ocirc;ng Duy Trường</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>NXB Thế Giới</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2018</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Ng&ocirc;n Ngữ</th>\r\n			<td>Tiếng Việt</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>450</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>20.5 x 14 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>440</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/alpha-books?fhs_campaign=INTERNAL_LINKING\">Alpha Books</a></li>\r\n				<li><a href=\"https://www.fahasa.com/omega?fhs_campaign=INTERNAL_LINKING\">Tuyển Tập S&aacute;ch Omega</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/sach-trong-nuoc/chinh-tri-phap-ly-triet-hoc/tri-t-h-c-ly-lu-n-chinh-tr.html?order=num_orders_month\">Top 100 sản phẩm Triết Học- L&yacute; Luận Ch&iacute;nh Trị b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Ch&iacute;nh Trị Luận (T&aacute;i Bản 2018)</p>\r\n\r\n<p>T&aacute;c phẩm nổi tiếng viết về c&aacute;c kh&aacute;i niệm m&agrave; từ đ&oacute; định h&igrave;nh c&aacute;c quốc gia v&agrave; ch&iacute;nh phủ. Mặc d&ugrave;, Aristotle cổ vũ mạnh mẽ cho chế độ n&ocirc; lệ lạc hậu, quan điểm của &ocirc;ng về Hiến ph&aacute;p v&agrave; c&aacute;ch điều h&agrave;nh ch&iacute;nh phủ lại rất kinh điển. D&ugrave; chỉ thảo luận về nh&agrave; nước v&agrave; c&aacute;c định chế thời Hy Lạp cổ nhưng t&aacute;c phẩm n&agrave;y của &ocirc;ng đ&atilde; đặt nền tảng cho khoa học ch&iacute;nh trị hiện đại.</p>\r\n\r\n<p>T&aacute;c phẩm n&agrave;y được xem l&agrave; căn bản cho Ch&iacute;nh trị học T&acirc;y phương.&nbsp;<em>Ch&iacute;nh trị luận</em>&nbsp;nghi&ecirc;n cứu c&aacute;c vấn đề cơ bản về nh&agrave; nước, ch&iacute;nh quyền, ch&iacute;nh trị, tự do, c&ocirc;ng bằng, t&agrave;i sản, quyền, luật v&agrave; việc thực thi luật ph&aacute;p của c&aacute;c cơ quan thẩm quyền.</p>\r\n\r\n<p>Aristotle l&agrave; biểu tượng của tr&iacute; tuệ tư duy triết học. Mặc d&ugrave; nội dung rất s&acirc;u sắc nhưng c&aacute;ch tr&igrave;nh b&agrave;y của &ocirc;ng lại rất dễ hiểu. &Ocirc;ng viết những suy nghĩ của m&igrave;nh một c&aacute;ch r&otilde; r&agrave;ng với độ ch&iacute;nh x&aacute;c si&ecirc;u ph&agrave;m. Học thuyết của &ocirc;ng c&oacute; ảnh hưởng lớn đến những lĩnh vực hiện đại như : khoa học, chủ nghĩa duy thực v&agrave; logic học</p>\r\n\r\n<p>Theo Aristotle, l&agrave; một người tốt kh&ocirc;ng th&ocirc;i chưa đủ. Nếu người d&acirc;n tốt m&agrave; kh&ocirc;ng t&iacute;ch cực tham gia v&agrave;o đời sống ch&iacute;nh trị của chế độ th&igrave; chế độ đ&oacute; c&oacute; cơ nguy trở th&agrave;nh tho&aacute;i h&oacute;a v&agrave; trở th&agrave;nh một chế độ xấu. &ndash; Dịch giả N&ocirc;ng Duy Trường</p>\r\n', '100000.00', 0, 'ct.jpg', '[]', 0, 0, 4, 1, 1650357986),
(69, 18, 'Lịch Sử Nam Bộ Kháng Chiến Tập 1 ', '<p>Cuốn s&aacute;ch cung cấp cho đ&ocirc;ng đảo độc giả những tư liệu tham khảo c&oacute; gi&aacute; trị trong việc t&igrave;m hiểu, nghi&ecirc;n cứu về lịch sử kh&aacute;ng chiến của qu&acirc;n, d&acirc;n Nam Bộ n&oacute;i ri&ecirc;ng, lịch sử đấu tranh c&aacute;ch mạng của nh&acirc;n d&acirc;n Việt Nam n&oacute;i chung, về sự l&atilde;nh đạo t&agrave;i t&igrave;nh của Đảng ta, về chủ nghĩa anh h&ugrave;ng c&aacute;ch mạng, về sức mạnh của b&agrave;n tay v&agrave; khối &oacute;c con người Việt Nam trong kh&aacute;ng chiến cũng như trong x&acirc;y dựng v&agrave; ph&aacute;t triển đất nước.</p>\r\n\r\n<p>Kh&ocirc;ng chỉ đơn thuần l&agrave; một bộ s&aacute;ch lịch sử, &ldquo;Lịch sử Nam bộ kh&aacute;ng chiến&rdquo; c&ograve;n mở ra một vấn đề mới. Bộ s&aacute;ch tr&igrave;nh b&agrave;y chi tiết cụ thể một qu&aacute; khứ gian lao nhưng h&agrave;o h&ugrave;ng của nhiều thế hệ cha &ocirc;ng. Những thế hệ đ&oacute; đ&atilde; sống, chiến đấu, hy sinh trọn vẹn cho Tổ quốc. N&oacute;i như &ocirc;ng Nguyễn Trọng Xuất: &ldquo;Thế hệ ch&uacute;ng t&ocirc;i đ&atilde; l&agrave;m tr&ograve;n bổn phận của m&igrave;nh rồi, ch&uacute;ng t&ocirc;i xả th&acirc;n v&igrave; l&yacute; tưởng độc lập, tự do, hạnh ph&uacute;c cho mọi người. B&acirc;y giờ nhiệm vụ tới đ&acirc;y, tiếp tục l&agrave;m tự do v&agrave; hạnh ph&uacute;c cho mọi người, c&acirc;u trả lời phải do ch&iacute;nh thế hệ trẻ t&igrave;m ra&rdquo;. Đ&oacute; l&agrave; những lời nhắn gửi đến tương lai từ qu&aacute; khứ m&agrave; bộ s&aacute;ch &ldquo;Lịch sử Nam bộ kh&aacute;ng chiến&rdquo; gửi đến bạn đọc nhất l&agrave; những người trẻ, tương lai của đất nước.</p>\r\n\r\n<p>Tập 1 tập trung phản &aacute;nh cuộc đấu tranh chống thực d&acirc;n Ph&aacute;p của nh&acirc;n d&acirc;n Việt Nam diễn ra tr&ecirc;n địa b&agrave;n Nam bộ thời kỳ 1945 - 1954.</p>\r\n', '1000000.00', 500000, 'vn.jpg', '[]', 0, 0, 4, 1, 1650358049),
(70, 19, 'Sổ Tay Đá Quý Phong Thủy', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>8935088555437</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/minh-lam?fhs_campaign=ATTRIBUTE_PRODUCT\">Cty Văn H&oacute;a Minh L&acirc;m</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Th&iacute;ch Minh Nghi&ecirc;m</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>NXB Hồng Đức</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Năm XB</th>\r\n			<td>2021</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>610</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>24 x 16 x 2 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>375</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm hiển thị trong</th>\r\n			<td>\r\n			<ul>\r\n				<li><a href=\"https://www.fahasa.com/minh-lam?fhs_campaign=INTERNAL_LINKING\">Cty Văn H&oacute;a Minh L&acirc;m</a></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/sach-trong-nuoc/phong-thuy-kinh-dich.html?order=num_orders_month\">Top 100 sản phẩm Phong Thủy - Kinh Dịch b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;Văn h&oacute;a ngọc đ&atilde; hấp thu v&agrave; t&iacute;ch lũy tinh hoa văn h&oacute;a, tư tưởng của người&nbsp;Trung Quốc h&agrave;ng ngh&igrave;n năm. Trải qua qu&aacute; h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển, vật phẩm ngọc Trung Quốc được v&iacute; như b&ocirc;ng hoa | rực rỡ trong kho t&agrave;ng văn h&oacute;a nghệ thuật thế giới. Từ hơn 2.000 năm trước, nh&agrave; T&acirc;y Chu đ&atilde; bước đầu ho&agrave;n thiện v&agrave; ph&aacute;t triển chế độ d&ugrave;ng ngọc trong c&aacute;c tầng lớp quan lại, qu&yacute; tộc. Người thời đ&oacute; cho rằng, ngọc l&agrave; vật qu&yacute;, hội tủ đầy đủ 5 đức t&iacute;nh qu&yacute; của con người: Nh&acirc;n, lễ, nghĩa, tr&iacute;, t&iacute;n. Độ cứng, nhăn l&acirc;u d&agrave;i của ngọc tượng trưng cho cốt c&aacute;ch của người qu&acirc;n tử. Độ b&oacute;ng của ngọc tượng trưng cho phẩm c&aacute;ch trong s&aacute;ng, cao thượng. Tầng lớp qu&yacute; tộc đeo ngọc tr&ecirc;n người để thế hiện đạo đức, phẩm c&aacute;ch v&agrave; địa vị của m&igrave;nh.Từ đ&oacute;, việc sử dụng ngọc cũng dần l&agrave; ti&ecirc;u ch&iacute; thể hiện đẳng cấp x&atilde; hội.</p>\r\n\r\n<p>Sau thời Đ&ocirc;ng Chu, đất nước Trung Quốc trải qua 2 thời kỳ Xu&acirc;n thu, Chiến quốc. Nhưng trong thời gian 600 năm đ&oacute;, cục diện ch&iacute;nh trị bất ổn định dường như kh&ocirc;ng ảnh hưởng đến sự ph&aacute;t triển của văn h&oacute;a ngọc. Ngược lại, n&oacute; đ&atilde; th&uacute;c đẩy sự dung h&ograve;a nhiều loại phong c&aacute;ch nghệ thuật v&agrave;o kỹ thuật chế t&aacute;c đồ ngọc, Đến thời H&aacute;n, do ảnh hưởng của t&igrave;nh h&igrave;nh x&atilde; hội, văn h&oacute;a ngọc ph&aacute;t triển chậm lại, d&acirc;n mất đi t&iacute;nh b&iacute; ẩn v&agrave; được sử dụng phổ biến trong d&acirc;n gian. Sau thời T&ugrave;y, Đường, chức năng d&ugrave;ng trong hoạt động c&uacute;ng tế biến mất v&agrave; ngọc trở th&agrave;nh đồ trang sức hay vật trang tr&iacute;. Việc sử dụng ngọc kh&ocirc;ng c&ograve;n giới hạn ở giai cấp thống trị m&agrave; n&oacute; nhận được sự y&ecirc;u th&iacute;ch của tầng lớp b&igrave;nh d&acirc;n. Đến thời Tống, sưu tầm ngọc trở th&agrave;nh tr&agrave;o lưu chung của c&aacute;c quan vi&ecirc;n quyền cao chức trọng . Sau những biến động thăng trầm, văn h&oacute;a ngọc Trung Quốc đ&atilde; đạt đến thời kỳ phồn vinh chưa từng c&oacute; v&agrave;o thời kỳ Minh - Thanh, nghề chế t&aacute;c đồ ngọc được x&atilde; hội thượng lưu đặc biệt ch&uacute; trọng. Cũng trong giai đoạn n&agrave;y, đồ ngọc Trung Quốc đạt đến đỉnh cao với n&eacute;t s&aacute;ng tạo mới mẻ v&agrave; ho&agrave;n mỹ. Trong x&atilde; hội hiện đại, ngọc đ&atilde; trở th&agrave;nh vật phẩm bất kỳ ai cũng c&oacute; thể sở hữu. Yếu tố ch&iacute;nh trị v&agrave; t&ocirc;n gi&aacute;o li&ecirc;n quan đến n&oacute; đ&atilde; dần mờ nhạt.</p>\r\n', '50000.00', 0, 'tuvi.jpg', '[]', 0, 0, 4, 1, 1650358130),
(71, 20, 'Trung Y Học Khái Luận', '<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>M&atilde; h&agrave;ng</th>\r\n			<td>8935236416955</td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&ecirc;n Nh&agrave; Cung Cấp</th>\r\n			<td><a href=\"https://www.fahasa.com/minh-thang?fhs_campaign=ATTRIBUTE_PRODUCT\">Nh&agrave; S&aacute;ch Minh Thắng</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>T&aacute;c giả</th>\r\n			<td>Học viện Trung y Nam Kinh</td>\r\n		</tr>\r\n		<tr>\r\n			<th>NXB</th>\r\n			<td>NXB Hồng Đức</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Trọng lượng (gr)</th>\r\n			<td>350</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch Thước Bao B&igrave;</th>\r\n			<td>19 x 27</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Số trang</th>\r\n			<td>328</td>\r\n		</tr>\r\n		<tr>\r\n			<th>H&igrave;nh thức</th>\r\n			<td>B&igrave;a Mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Sản phẩm b&aacute;n chạy nhất</th>\r\n			<td><a href=\"https://www.fahasa.com/sach-trong-nuoc/khoa-hoc-ky-thuat/y-hoc.html?order=num_orders_month\">Top 100 sản phẩm Y học b&aacute;n chạy của th&aacute;ng</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Trung y học kh&aacute;i luận (Quyển Hạ)</p>\r\n\r\n<p>Trung y học kh&aacute;i luận &nbsp;(tập hạ) lại dựa v&agrave;o những điều kh&aacute;i niệm về: nội khoa, ch&acirc;m cứu khoa, phụ khoa, nhi khoa, ngoại khoa, thương khoa, nh&atilde;n khoa, hầu khoa, kh&iacute; c&ocirc;ng, thoa b&oacute;p v&agrave; hộ l&yacute;. Trong đ&oacute; lấy nội khoa v&agrave; ch&acirc;m cứu l&agrave;m trọng điểm. N&oacute;i t&oacute;m lại, tập tr&ecirc;n l&agrave; l&yacute; luận cơ bản, tập dưới l&agrave; kiến thức về l&acirc;m s&agrave;ng của Trung y.<br />\r\nS&aacute;ch n&agrave;y đối với to&agrave;n bộ của Trung y học chỉ mới tr&igrave;nh b&agrave;y một c&aacute;ch kh&aacute;i qu&aacute;t để l&agrave;m c&aacute;i cầu cho những người mới học.<br />\r\nNội dung ch&iacute;nh gồm c&oacute; XI chương:<br />\r\n+ Chương I Nội khoa kh&aacute;i yếu<br />\r\n+ Chương II Ch&acirc;m cứu kh&aacute;i yếu<br />\r\n+ Chương III Phụ khoa kh&aacute;i yếu<br />\r\n+ Chương IV Nhi khoa kh&aacute;i yếu<br />\r\n+ Chương V Ngoại khoa kh&aacute;i yếu<br />\r\n+ Chương VI Thương khoa kh&aacute;i yếu<br />\r\n+ Chương VII Nh&atilde;n khoa kh&aacute;i yếu<br />\r\n+ Chương VIII Hầu khoa kh&aacute;i yếu<br />\r\n+ Chương IX Kh&iacute; c&ocirc;ng kh&aacute;i yếu<br />\r\n+ Chương X &Aacute;n ma kh&aacute;i yếu<br />\r\n+ Chương XI Hộ l&yacute; (chăm s&oacute;c)</p>\r\n', '100000.00', 0, 'y_học.jpg', '[\"y1.png\",\"y2.png\"]', 1, 2, 4, 1, 1650358234),
(72, 21, 'Thời Dựng Đảng', '<p>L&ecirc;-nin viết: chủ nghĩa M&aacute;c đ&atilde; ra đời ở nước Nga trong đau thương. Chủ nghĩa M&aacute;c đ&atilde; ra đời ở nước ta như thế n&agrave;o? C&aacute;ch đ&acirc;y vừa tr&ograve;n một nửa thế kỷ, đồng ch&iacute; Nguyễn &Aacute;i Quốc, chỉ sau &iacute;t th&aacute;ng trở về b&ecirc;n cạnh Tổ quốc Việt Nam, tại Quảng Ch&acirc;u, với niềm tin v&agrave; vui m&agrave; &iacute;t ai tr&ecirc;n đời n&agrave;y th&ocirc;ng cảm hết, đ&atilde; ghi lại trong t&agrave;i liệu lịch sử k&yacute; t&ecirc;n Người đề ng&agrave;y 19-2-1925: &ldquo;T&ocirc;i đ&atilde; lập một nh&oacute;m b&iacute; mật gồm 9 hội vi&ecirc;n&rdquo;, trong đ&oacute; &ldquo;c&oacute; 5 người đ&atilde; l&agrave; đảng vi&ecirc;n dự bị của Đảng Cộng sản..., 2 đo&agrave;n vi&ecirc;n dự bị của Đo&agrave;n Thanh ni&ecirc;n Cộng sản L&ecirc;nin&rdquo;(1). Đ&acirc;y l&agrave; c&aacute;i mầm đầu ti&ecirc;n của tổ chức cộng sản Việt Nam. Xin ph&eacute;p tạm lấy ng&agrave;y th&aacute;ng c&ograve;n ghi trong t&agrave;i liệu đ&oacute; để t&iacute;nh mốc khởi điểm cho sự diệu kỳ: nh&acirc;n tố của mọi nh&acirc;n tố thắng lợi đ&atilde; b&eacute;n rễ tươi r&oacute;i v&agrave;o d&acirc;n tộc v&agrave; qu&ecirc; hương.<br />\r\n(1) Thư b&aacute;o c&aacute;o của đồng ch&iacute; Nguyễn &Aacute;i Quốc gửi Đo&agrave;n Chủ tịch Quốc tế Cộng sản ng&agrave;y 19-2-1925.</p>\r\n', '100000.00', 0, 'triet.jpg', '[]', 2, 1, 4, 1, 1650358314);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(20, 1, 8, 'hoàng anh', 'hoanganh@gmail.com', '00111', 'Hòa Bình', 'giao giờ hành chính', '200000.00', '', 1650364558),
(22, 0, 0, 'phan sy anh', 'anh@gmail.com', '1921925', 'anh', 'aa', '100000.00', '', 1650377518),
(23, 0, 8, 'anh', 'anh@gmail.com', '1', 'anh', 'k', '300000.00', '', 1650383073);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(6, 'Nguyen An', 'khachhang1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01201212222', 'Thủy Nguyên - Hải Phòng', 2147483647),
(5, 'User', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2147483647),
(7, 'TEST@gmail.com', 'TEST@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2017),
(8, 'anh', 'anh@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'anh', 2022);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
