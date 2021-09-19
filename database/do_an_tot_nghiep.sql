-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 07, 2021 lúc 10:27 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Banner1', 'banner1', 'https://smarthomevn.net/wp-content/uploads/2020/05/google-nest-smart-home-devices.jpg', '<p>1</p>', 'active', '2021-08-19 00:41:10', '2021-08-19 00:41:10'),
(2, 'Banner2', 'banner2', 'https://els.vn/wp-content/uploads/2020/06/lumi-smarthome-giai-phap-nha-thong-minh-gia-re-1.png', '<p>2</p>', 'active', '2021-08-19 01:11:34', '2021-08-19 01:11:34'),
(3, 'Banner3', 'banner3', 'https://lumi.vn/wp-content/uploads/2020/09/logo_1588562840-scaled.jpg', '<p>3</p>', 'active', '2021-08-19 01:12:51', '2021-08-19 01:12:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'WeSmart', 'wesmart', 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(2, 'BKAV', 'bkav', 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(3, 'Lumi', 'lumi', 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(4, 'Xiaomi', 'xiaomi', 'active', '2021-08-18 19:35:20', '2021-08-18 19:35:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 591150, 'new', 1, 591150, '2021-08-18 20:37:19', '2021-08-18 20:39:37'),
(2, 5, 3, 1, 169000, 'new', 1, 169000, '2021-08-18 20:41:27', '2021-08-18 20:42:15'),
(3, 9, 4, 3, 621000, 'new', 1, 621000, '2021-08-19 00:22:23', '2021-08-19 00:23:17'),
(4, 8, 5, 3, 420000, 'new', 1, 420000, '2021-08-19 01:39:54', '2021-08-19 01:40:31'),
(5, 7, 6, 2, 757640, 'new', 1, 757640, '2021-08-19 01:53:52', '2021-08-19 01:54:52'),
(6, 9, NULL, 3, 621000, 'new', 1, 621000, '2021-08-19 07:13:04', '2021-08-19 07:13:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bộ xử lý trung tâm', 'bo-xu-ly-trung-tam', NULL, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(2, 'Công tắc cảm ứng', 'cong-tac-cam-ung', NULL, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(3, 'Thiết bị điều khiển', 'thiet-bi-dieu-khien', NULL, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(4, 'Thiết bị an ninh', 'thiet-bi-an-ninh', NULL, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(5, 'Cảm biến thông minh', 'cam-bien-thong-minh', NULL, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(6, 'Ổ cắm thông minh', 'o-cam-thong-minh', NULL, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(43, '2014_10_12_000000_create_users_table', 1),
(44, '2014_10_12_100000_create_password_resets_table', 1),
(45, '2019_08_19_000000_create_failed_jobs_table', 1),
(46, '2020_07_10_021010_create_brands_table', 1),
(47, '2020_07_10_025334_create_banners_table', 1),
(48, '2020_07_10_112147_create_categories_table', 1),
(49, '2020_07_11_063857_create_products_table', 1),
(50, '2020_07_12_073132_create_post_categories_table', 1),
(51, '2020_07_12_073701_create_post_tags_table', 1),
(52, '2020_07_12_083638_create_posts_table', 1),
(53, '2020_07_13_151329_create_messages_table', 1),
(54, '2020_07_14_023748_create_shippings_table', 1),
(55, '2020_07_15_054356_create_orders_table', 1),
(56, '2020_07_15_102626_create_carts_table', 1),
(57, '2020_07_16_041623_create_notifications_table', 1),
(58, '2020_07_16_053240_create_coupons_table', 1),
(59, '2020_07_23_143757_create_wishlists_table', 1),
(60, '2020_07_24_074930_create_product_reviews_table', 1),
(61, '2020_07_24_131727_create_post_comments_table', 1),
(62, '2020_08_01_143408_create_settings_table', 1),
(63, '2021_07_14_224159_create_payments_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0a2053b2-7de3-40dc-ae09-278e4c5a9196', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t \\u0111\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-18 20:40:54', '2021-08-18 20:40:54'),
('1487da1f-3de4-40c7-a8d0-d9946d739328', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t \\u0111\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-19 01:54:52', '2021-08-19 01:54:52'),
('2a51c836-5411-4b80-b292-9ff9da8cda99', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/product-detail\\/cam-bien-cua-tu-thong-minh-kn-d06\",\"fas\":\"fa-star\"}', NULL, '2021-08-19 01:40:14', '2021-08-19 01:40:14'),
('64ecbda3-adef-49c6-80d9-1837e5c5e123', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/blog-detail\\/so-huu-can-ho-chung-cu-thong-minh-40-co-gi-dac-biet\",\"fas\":\"fas fa-comment\"}', NULL, '2021-08-19 00:25:41', '2021-08-19 00:25:41'),
('8d012144-4d08-4b16-b6e5-502067c8072b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/product-detail\\/o-cam-am-tuong-thong-minh-tuya-wifi-ho-tro-google-va-alexa\",\"fas\":\"fa-star\"}', NULL, '2021-08-19 00:24:45', '2021-08-19 00:24:45'),
('a4012dc2-a107-419c-9d36-af94a507eba9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t \\u0111\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-18 20:42:15', '2021-08-18 20:42:15'),
('e0fe5809-6f3a-4629-bd7e-505bcfe579a5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t \\u0111\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-19 00:23:17', '2021-08-19 00:23:17'),
('e3a73ca4-cbb6-41cf-8f71-47c27c4ed912', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t \\u0111\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-19 01:40:31', '2021-08-19 01:40:31'),
('f3def247-ec2a-4bc6-8719-3624938b79d9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t \\u0111\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/smartdeviceshop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-18 20:39:37', '2021-08-18 20:39:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total` int(11) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` int(11) DEFAULT NULL,
  `total_amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','vnpay') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `product_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'SMD-X8TORC1YWH', 1, 1, 591150, 5, NULL, 591150, 1, 'vnpay', 'paid', 'delivered', NULL, '2021-08-18 20:39:37', '2021-08-18 20:43:16'),
(3, 'SMD-ZPKRNZR0RU', 1, 1, 169000, 5, NULL, 169000, 1, 'vnpay', 'paid', 'cancel', NULL, '2021-08-18 20:42:15', '2021-08-18 21:05:01'),
(4, 'SMD-2WUF1J9LBP', 3, 9, 621000, 5, NULL, 661000, 1, 'cod', 'unpaid', 'new', NULL, '2021-08-19 00:23:17', '2021-08-19 00:23:17'),
(5, 'SMD-OUJ7WBKQXN', 3, 9, 420000, 5, NULL, 460000, 1, 'cod', 'unpaid', 'delivered', 'abc', '2021-08-19 01:40:31', '2021-08-19 01:41:24'),
(6, 'SMD-MB8WKIX3SJ', 2, 7, 757640, 3, NULL, 802640, 1, 'cod', 'unpaid', 'delivered', 'ok', '2021-08-19 01:54:52', '2021-08-19 01:56:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('user@gmail.com', 'd2tnqHcMPLWAbwZ7J82PwqpZ6g4Kaa0NOUYenuYsG2qduL9EKiMadkOX2qHshrIc', '2021-08-18 18:50:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_money` double(8,2) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vnp_response_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vnp_transaction_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_vnpay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `user_id`, `total_money`, `notes`, `vnp_response_code`, `vnp_transaction_code`, `code_vnpay`, `code_bank`, `time`, `created_at`, `updated_at`) VALUES
(2, 3, 1, 169000.00, 'Thanh toán hóa đơn phí dich vụ', '00', '20210819034145', '13568967', 'NCB', '2021-08-10 10:42:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, '10 lưu ý quan trọng khi lựa chọn và sử dụng hệ thống nhà thông minh', '10-luu-y-quan-trong-khi-lua-chon-va-su-dung-he-thong-nha-thong-minh', '<p><span style=\"color: rgb(51, 51, 51); font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px;\">&nbsp;Hệ thống nhà thông minh trong thời đại công nghệ đã trở thành sự lựa chọn hàng đầu của rất nhiều người tiêu dùng lựa chọn cho ngôi nhà của mình !&nbsp;.&nbsp;Vậy những lưu ý và chuẩn bị cần thiết trong giai đoạn đầu xây dựng nhà thông minh là gì ?</span><br></p>', '<p><div class=\"item_block\" data-action=\"news/NewsBlock/newsType/17\" data-method=\"get\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"box-left  \" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px;\"><div class=\"block-title text-center\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; text-align: center; margin: 0px auto 45px; width: 593.25px;\"></div></div></div></p><div class=\"detail-post mr-b-50\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; margin-bottom: 50px !important; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"ckeditor-post\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px;\"><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">1. Cân nhắc hệ thống điều khiển trung tâm</strong></section><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">Việc lựa chọn hệ thống điều khiển trung tâm có thể là vấn đề được quan tâm nhất.&nbsp;Nhưng trên thực tế, dù bạn chọn thương hiệu nhà thông minh nước ngoài hay trong nước thì điều quan trọng nhất là phải phù hợp với nhu cầu của chính bạn.&nbsp;Đặc điểm và điểm nhấn của mỗi thương hiệu điều khiển trung tâm là khác nhau, vì vậy hãy tìm thương hiệu phù hợp với bạn.</section><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/A%CC%89nh%20chu%CC%A3p%20ma%CC%80n%20hi%CC%80nh%202021-06-16%20154125.png\" alt=\"\" width=\"508\" height=\"304\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></section><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">Hệ thống điều khiển trung tâm nhà thông minh tương đương với “bộ não” của con người, sẽ giúp bạn kết nối các hạng mục nhà thông minh biến chúng thành một hệ thống thông minh chu đáo, mang đến cho bạn một cuộc sống thông minh trọn vẹn và ấm áp nhất.</section><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">2. Cân nhắc hệ thống chiếu sáng</strong></section><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">Hệ thống chiếu sáng tích hợp vào nhà thông minh có gì khác biệt:</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">1) Đèn cảm biến</strong>&nbsp;.&nbsp;Bằng cách thiết lập hợp lý các cảm biến trên ban công, cầu thang, lối đi, phòng thay đồ, nhà vệ sinh, phòng an ninh,… nhiều trường hợp bạn có thể quên bật tắt đèn, khi có người đến bật đèn, người đi tắt đèn.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　Ứng dụng tình huống: Khi bạn thức dậy vào ban đêm, ngay khi chân bạn chạm đất, đèn sàn mềm sẽ bật để dẫn bạn vào phòng tắm và khi bạn quay lại giường, nó sẽ tự động tắt, vì vậy bạn không không phải lo lắng về việc làm phiền gia đình bạn.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">2)Điều chỉnh độ sáng:</strong>&nbsp;Bạn có thể điều chỉnh độ sáng của từng đèn trên màn hình cảm ứng hoặc bảng điều khiển thông minh hoặc thực hiện điều khiển cảnh. Các thay đổi được tự động điều chỉnh trong thời gian thực.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">3) Cài đặt ngữ cảnh:&nbsp;</strong>Tích hợp chế độ toàn cảnh, tắt hoàn toàn và nhiều chế độ cảnh tùy chỉnh khác nhau, biến điều khiển bằng một phím.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　Ứng dụng tình huống: Nếu nhà của bạn ở giữa phòng ngủ chính và cửa ra vào, bạn phải nhấn ít nhất bảy lần ở các vị trí khác nhau và nếu bạn có hệ thống nhà thông minh, bạn có thể nhấn vào ban đêm của riêng mình màn hình cảm ứng khi bạn bước vào cửa.&nbsp;</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">4) Quản lý năng lượng:</strong><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">&nbsp;</strong>Với hệ thống chiếu sáng truyền thống, đặc biệt là trong những ngôi nhà lớn, một khi bạn quên tắt đèn trong phòng không thường xuyên sử dụng, nó có thể được bật trong vài ngày. Nhưng nếu bạn có hệ thống nhà thông minh thì nhìn thoáng qua giao diện đèn đang sáng và vị trí tắt đèn, khi ra ngoài bạn có thể bấm vào chế độ tắt hoàn toàn, tất cả đèn sẽ sáng.&nbsp;</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　*<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">Chuẩn bị sơ bộ cho việc trang trí hệ thống chiếu sáng:</strong></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　Làm việc với kiến trúc sư để xác định các mạch chiếu sáng, đóng mở thông thường, cần làm mờ, và mạch nào cần thiết kế đặc biệt (như: đèn ngủ, đèn cầu thang, v.v.); Hệ thống dây điện.</section></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/A%CC%89nh%20chu%CC%A3p%20ma%CC%80n%20hi%CC%80nh%202021-06-16%20155118.png\" alt=\"\" width=\"545\" height=\"286\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-role=\"outer\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-tools=\"135编辑器\" data-id=\"41173\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">3.Cân nhắc hệ thống rèm</strong></section></section></section></section></section></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">&nbsp;-<span>&nbsp;</span></strong>Hệ thống rèm thông minh&nbsp;với&nbsp;điều khiển một lúc cả hệ thống rèm</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">&nbsp;-&nbsp; Ứng dụng chế độ kịch bản&nbsp;</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">&nbsp;-&nbsp; Điều khiển liên kết cảm ứng</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-role=\"outer\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-tools=\"135编辑器\" data-id=\"41173\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">4. Cân nhắc hệ thống HVAC</strong></section></section></section></section></section></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">&nbsp; &nbsp; 　Hệ thống HVAC bao phủ tất cả không khí trong lành, hệ thống sưởi sàn, điều hòa không khí và các hệ thống khác. Sau khi được kết nối với hệ thống nhà thông minh, điều khiển tập trung được thực hiện. Chi phí truy cập thấp và chức năng mạnh mẽ. Đây thực sự là điều cần thiết cho ngôi nhà .</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　Hệ thống HVAC có thể kết nối với điều khiển nhà thông minh như thế nào:</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　-&nbsp;<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">Quản lý thống nhất và kiểm soát tập trung:&nbsp;</strong>Sẽ không còn những bảng điều khiển sưởi sàn điều hòa không khí trong lành xấu xí trên mỗi bức tường.&nbsp;Chúng không chỉ được điều khiển tập trung trên màn hình cảm ứng hoặc điện thoại di động.&nbsp;</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">&nbsp; &nbsp; &nbsp; -<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">&nbsp;Nhiệt độ và độ ẩm không đổi:&nbsp;</strong>Chỉ cần một cảm biến nhiệt độ và độ ẩm nhỏ, kết hợp với việc sử dụng hệ thống HVAC điều khiển trung tâm thông minh, bạn có thể tạo ra một không gian nhiệt độ và độ ẩm ổn định lý tưởng.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　&nbsp; &nbsp;-&nbsp;<strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">&nbsp;Điều khiển từ xa:</strong>&nbsp;Vào mùa nóng và lạnh khắc nghiệt, khi bạn đang đi làm, hãy nhấn vào chế độ home trên điện thoại hoặc đồng hồ, khi về đến nhà, không khí trong lành và nhiệt độ vừa phải.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">Chuẩn bị sơ bộ cho việc trang trí hệ thống HVAC:</strong></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/A%CC%89nh%20chu%CC%A3p%20ma%CC%80n%20hi%CC%80nh%202021-06-16%20160513.png\" alt=\"\" width=\"550\" height=\"274\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></strong></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　Vì nó được kết nối hoàn toàn với điều khiển nên không có quá nhiều cân nhắc bổ sung. Chỉ cần thảo luận với nhà thiết kế về cách bố trí điều hòa không khí, hệ thống sưởi sàn và không khí trong lành, sau đó chọn mô hình tương ứng theo nhu cầu chức năng của riêng bạn; hệ thống dây điện , nhãn hiệu khác nhau.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-role=\"outer\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-tools=\"135编辑器\" data-id=\"41173\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">5. Cân nhắc hệ thống nhạc nền</strong></section></section></section></section></section></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">&nbsp; &nbsp; &nbsp; &nbsp;Bạn có cần nhạc nền không?</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/A%CC%89nh%20chu%CC%A3p%20ma%CC%80n%20hi%CC%80nh%202021-06-16%20160618.png\" alt=\"\" width=\"543\" height=\"289\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">　　Việc truy cập vào nhạc nền của hệ thống điều khiển trung tâm thông minh không chỉ có thể đạt được khả năng kiểm soát vùng mà nó còn có thể là báo động trong hệ thống an ninh để cảnh báo những kẻ đột nhập; hoặc đồng hồ báo thức vào buổi sáng với tiếng nhạc du dương khiến mọi người thức giấc một cách tự nhiên; Nó cũng có thể là một micro ở từng khu vực, chẳng hạn người già có thể kêu cứu khi cần giúp đỡ.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-role=\"outer\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section data-tools=\"135编辑器\" data-id=\"41173\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">6. Cân nhắc mở rộng hệ thống thiết bị gia dụng thông minh</strong></section><section title=\"\" data-original-title=\"\" data-num=\"3\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/A%CC%89nh%20chu%CC%A3p%20ma%CC%80n%20hi%CC%80nh%202021-06-16%20160721.png\" alt=\"\" width=\"660\" height=\"373\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></strong></section></section></section></section></section></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\">&nbsp; &nbsp; &nbsp; &nbsp;Liệu trong tương lai sẽ có rất nhiều thiết bị gia dụng thông minh? Câu trả lời là có!&nbsp;Thiết bị đầu cuối sau lắp đặt là thiết bị có thể di chuyển bất cứ lúc nào mà không cần trang trí, phối ghép, chủ yếu bao gồm TV thông minh, máy giặt, loa, thiết bị nhà bếp và robot quét rác.</section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">7. Lắp đặt giàn phơi điều khiển điện từ xa ngoài ban công</strong></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/A%CC%89nh%20chu%CC%A3p%20ma%CC%80n%20hi%CC%80nh%202021-06-16%20160810.png\" alt=\"\" width=\"622\" height=\"450\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></strong></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">8. Cài đặt khóa vân tay trực quan trên cửa ra vào</strong></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/121242112_163122482114738_8124966139225590992_o_1.jpg\" alt=\"\" width=\"580\" height=\"326\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"><p style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; margin: 0px 0px 10px;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">9. Công tắc thông minh. Công tắc thông thường phải được thay thế bằng công tắc thông minh để thực hiện các chức năng như điều khiển bằng giọng nói, điều khiển APP di động, điều khiển cảm ứng, điều khiển từ xa, điều khiển thời gian và điều khiển cảnh.</strong></p><p style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; margin: 0px 0px 10px;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\"><img src=\"http://wulianvietnam.com.vn/uploads/tiny_uploads/web%201/A%CC%89nh%20chu%CC%A3p%20ma%CC%80n%20hi%CC%80nh%202021-06-16%20161338.png\" alt=\"\" width=\"630\" height=\"310\" style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; border: 0px; vertical-align: middle; max-width: 100%; height: auto !important;\"></strong></p><p style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; margin: 0px 0px 10px;\"><strong style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; font-weight: 700;\">10.&nbsp;Hệ thống an ninh hoàn hảo, chẳng hạn như máy dò cảm biến cơ thể người, báo động lũ lụt, cảm biến nhiệt độ và độ ẩm, cảm biến ánh sáng, từ tính cửa và cửa sổ thông minh, v.v.</strong></p><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"></section></section><section style=\"box-sizing: border-box; font-family: MyriadPro-Regular, Arial, sans-serif; font-size: 13px; display: block;\"></section></section></section></section></section></section></section></section></section></section></section></div></div>', NULL, 'http://wulianvietnam.com.vn/uploads/plugin/news/22/1623834915-246569672-18-l-u-y-quan-tr-ng-khi-l-a-ch-n-va-s-d-ng-h-th-ng-nha-thong-minh.png', '', 1, NULL, 1, 'active', '2021-08-18 20:22:33', '2021-08-18 20:22:33'),
(2, '8 thiết bị điện thông minh bảo vệ nhà an toàn tốt nhất.', '8-thiet-bi-dien-thong-minh-bao-ve-nha-an-toan-tot-nhat', '<p><span style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Những thiết bị điện thông minh bảo vệ an toàn tốt nhất Điện thông minh là xu hướng mới nhằm giúp căn hộ của bạn thêm tiện nghi, đẳng cấp và bảo vệ tốt hơn cho gia đình mình. Công nghệ mới này giúp bạn gắn kết các thiết bị sử dụng trong nhà nhằm […]</span><br></p>', '<h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Những thiết bị điện thông minh bảo vệ an toàn tốt nhất</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"1349\" height=\"499\" src=\"https://happysmarthome.vn/wp-content/uploads/2019/11/logo_1573437326.jpg\" alt=\"\" class=\"wp-image-268\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2019/11/logo_1573437326.jpg 1349w, https://happysmarthome.vn/wp-content/uploads/2019/11/logo_1573437326-800x296.jpg 800w, https://happysmarthome.vn/wp-content/uploads/2019/11/logo_1573437326-768x284.jpg 768w, https://happysmarthome.vn/wp-content/uploads/2019/11/logo_1573437326-600x222.jpg 600w\" sizes=\"(max-width: 1349px) 100vw, 1349px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><a href=\"https://happysmarthome.vn/san-pham/cong-tac-vien-nhom/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">Điện thông minh</a>&nbsp;là xu hướng mới nhằm giúp căn hộ của bạn thêm tiện nghi, đẳng cấp và bảo vệ tốt hơn cho gia đình mình. Công nghệ mới này giúp bạn gắn kết các thiết bị sử dụng trong nhà nhằm tạo ra hệ thống hoạt động gắn khít, đồng thời một hệ thống điện thông minh cũng giúp bạn quản lý và điều khiển tốt nhất, sử dụng tiết kiệm nhất các thiết bị điện trong nhà.</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Song, để có hệ thống điện thông minh siêu tiện ích như vậy, đầu tiên, bạn cần lựa chọn cho mình những&nbsp;<a href=\"https://happysmarthome.vn/lap-dat-thiet-bi-dien-thong-minh-gia-sieu-binh-dan/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">thiết bị điện thông minh</a>&nbsp;hoặc phải nâng cấp các thiết bị điện đang dùng thành các thiết bị cảm ứng truyền thông. Chủ nhà của&nbsp;<a href=\"https://happysmarthome.vn/3-tieu-chi-can-ho-thong-minh/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">căn hộ thông minh</a>&nbsp;sẽ điều khiển hệ thống điện, các thiết bị điện thông minh này bằng smartphone, máy tính bảng, thậm chí giọng nói và cử chỉ.&nbsp; Vậy, những thiết bị điện thông minh bảo vệ an ninh thường có trong một căn hộ bao gồm những gì?</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#1&nbsp;<span style=\"font-weight: bolder;\">Cảm biến chuyển động</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"534\" height=\"500\" src=\"https://happysmarthome.vn/wp-content/uploads/2019/11/cam-bien-chuyen-dong-gan-tran-534x500.jpg\" alt=\"thiết bị điện thông minh\" class=\"wp-image-320\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2019/11/cam-bien-chuyen-dong-gan-tran-534x500.jpg 534w, https://happysmarthome.vn/wp-content/uploads/2019/11/cam-bien-chuyen-dong-gan-tran-534x500-427x400.jpg 427w\" sizes=\"(max-width: 534px) 100vw, 534px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Là thiết bị nắm giữ vai trò phát hiện và báo động nhanh khi có người đột nhập bất thường vào nhà. Lúc này, màn hình điện thoại, máy tính bảng của chủ nhân sẽ xuất hiện báo động. Thiết bị này sử dụng đồng thời 2 cảm biến nhận tín hiệu nên không gặp phải những thông tin dự báo sai lệch.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Thiết bị&nbsp;<a href=\"https://happysmarthome.vn/san-pham/cam-bien-phat-hien-chuyen-dong/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">cảm biến chuyển động</a>&nbsp;cũng giúp hạn chế những báo động giả bởi vật nuôi, hạn chế được những lo lắng không cần thiết cho chủ nhà những lúc vắng mặt. Thêm vào đó, nó cũng tự động điều chỉnh được nhiệt độ nền khi môi trường, khí hậu có sự biến đổi.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/cong-tu-dong-thong-minh-lumi-dea-giai-phap-cho-he-thong-smarthome-hoan-hao-1/\" target=\"_blank\" rel=\"nofollow\" class=\"u837479b5e6e3ed5c566a1e30e64a6d22\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Cổng tự động thông minh Lumi - DEA - Giải pháp cho hệ thống Smarthome hoàn hảo</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#2&nbsp;<span style=\"font-weight: bolder;\">Cảm biến môi trường</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"564\" height=\"413\" src=\"https://happysmarthome.vn/wp-content/uploads/2019/11/led-16-trieu-mau.jpg\" alt=\"\" class=\"wp-image-270\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2019/11/led-16-trieu-mau.jpg 564w, https://happysmarthome.vn/wp-content/uploads/2019/11/led-16-trieu-mau-546x400.jpg 546w\" sizes=\"(max-width: 564px) 100vw, 564px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Đây cũng là một trong những thiết bị điện thông minh mà căn hộ bạn cần lắp đặt. Bởi nó giúp giám sát nhiệt độ và độ ẩm của căn hộ. Khi các yếu tố này vượt quá phạm vị cho phép sẽ dẫn tới nguy cơ hư hỏng các thiết bị, gây ảnh hưởng đến sức khỏe… Lúc này, cảm biến môi trường sẽ kịp thời báo động và gửi thông báo tới chủ nhân thông qua màn hình quản lý.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#3&nbsp;<span style=\"font-weight: bolder;\">Màn hình trong nhà</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"1093\" height=\"800\" src=\"https://happysmarthome.vn/wp-content/uploads/2019/11/dieu-hoa-tivi-home-1093x800.jpg\" alt=\"\" class=\"wp-image-271\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2019/11/dieu-hoa-tivi-home-1093x800.jpg 1093w, https://happysmarthome.vn/wp-content/uploads/2019/11/dieu-hoa-tivi-home-546x400.jpg 546w, https://happysmarthome.vn/wp-content/uploads/2019/11/dieu-hoa-tivi-home-768x562.jpg 768w, https://happysmarthome.vn/wp-content/uploads/2019/11/dieu-hoa-tivi-home-600x439.jpg 600w, https://happysmarthome.vn/wp-content/uploads/2019/11/dieu-hoa-tivi-home.jpg 1176w\" sizes=\"(max-width: 1093px) 100vw, 1093px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Lắp đặt màn hình trong nhà nhằm kiểm soát và quản lý các hoạt động, trạng thiết của các thiết bị cảm biến bên trong căn hộ. Màn hình còn có tính năng cài đặt báo động cho hệ thống 3S được tích hợp với các giải pháp căn hộ thông minh.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Màn hình trong nhà cũng cho phép bạn “từ chối khéo” những vị khách không muốn đón tiếp. Hơn thế, màn hình cũng là nơi tiếp nhận cuộc gọi từ hệ thống các chuông báo, mở và gọi thang máy từ xa cho người thân, những vị khách tới nhà mà bạn không thể trực tiếp tiếp đón. Màn hình hiển thị camera giám sát từ xa nên giúp chủ nhà quản lý an ninh chặt chẽ, đảm bảo an toàn.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#4&nbsp;<span style=\"font-weight: bolder;\">Chuông cửa&nbsp;</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Chuông cửa thông minh là giải pháp giúp bạn kiểm soát tốt nhất cửa ra vào của căn hộ, giúp bạn xử lý nhanh và an toàn những khi khách đến chơi nhà. Thiết bị cũng giúp bạn tiếp đón khách gián tiếp bằng cách mở cửa tự động khi vắng mặt thông qua chỉ tay trên thiết bị quản lý.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/dien-vien-viet-anh-khoe-nha-thong-minh-dieu-khien-bang-giong-noi/\" target=\"_blank\" rel=\"nofollow\" class=\"uf49b3eb99469c7951597594dce2ff3ec\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Diễn viên Việt Anh khoe nhà thông minh điều khiển bằng giọng nói.</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#5&nbsp;<span style=\"font-weight: bolder;\">Điều khiển báo động</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Thiết bị cho khả năng điều khiển toàn bộ hệ thống an ninh từ xa thông qua thiết bị quản lý cầm tay. Chủ nhà xử lý linh hoạt hơn các rủi ro trong căn hộ, bảo vệ an toàn hơn cho tổ ấm của mình mọi lúc, mọi nơi.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#6&nbsp;<span style=\"font-weight: bolder;\">Cảm biến mở cửa</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Cảm biển mở cửa hoạt động được với đa số cửa loại cửa có mặt trong căn hộ như cửa ra vào, cửa sổ… Thiết bị điện thông minh này nhanh chóng cảnh báo tới chủ nhân khi người khác cố tình mở cửa, đóng cửa đến điện thoại, máy tính bảng quản lý.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#6&nbsp;<span style=\"font-weight: bolder;\">Còi báo động</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Vừa phát ra ánh sáng vừa phát ra âm thanh báo động, còi báo động hoạt động khi xảy ra các biến cố kích hoạt từ cảm biến và nút báo động. Đây cũng là một trong những thiết bị điện thông minh bạn cần lắp đặt cho căn hộ đảm bảo an toàn tuyệt đối.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#7&nbsp;<span style=\"font-weight: bolder;\">Cảm biến khói</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Cảm biến khói ứng dụng theo nguyên lý cảm biến quang học, phát hiện khói để nhận định và cảnh báo về đám cháy diễn ra trong căn hộ. Điều này giúp chủ nhân có những xử lý kịp thời như thông báo cho các thành viên trong gia đình phân tán nhanh, gọi cứu hỏa thần tốc.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Điều đặc biệt nhất thiết bị mang đến là sự cảnh báo chính xác về đám cháy thông qua quá trình nhận định lượng khói thông qua hệ thống cảm biến. Do vậy, thiết bị thông thường được lắp đặt tại những vị trí thường xuyên có khói, dễ nảy sinh cháy nổ nhất.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/dien-vien-manh-truong-chia-se-goc-cong-nghe-thiet-bi-dien-thong-minh-lumi/\" target=\"_blank\" rel=\"nofollow\" class=\"u2b884a35226e92ad3d0b1a4e49df7e48\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Diễn viên Mạnh Trường chia sẻ góc công nghệ thiết bị điện thông minh Lumi</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">#8&nbsp;<span style=\"font-weight: bolder;\">Bộ điều khiển trung tâm</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"800\" height=\"800\" src=\"https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-800x800.jpeg\" alt=\"\" class=\"wp-image-1027\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-800x800.jpeg 800w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-400x400.jpeg 400w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-280x280.jpeg 280w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-768x768.jpeg 768w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-300x300.jpeg 300w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-600x600.jpeg 600w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-100x100.jpeg 100w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi.jpeg 1000w\" sizes=\"(max-width: 800px) 100vw, 800px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Bộ điều khiển trung tâm là “cơ quan” kiểm sát và “báo cáo” quá trình hoạt động của hệ thống cảm biến đến chủ nhà. Theo đó, thiết bị là bộ phận giao tiếp trực tiếp với các thiết bị cảm biến. Thiết bị này cũng cho phép chủ nhà điều khiển các hoạt động của thiết bị điện thông qua màn hình quản lý cầm tay và màn hình trong nhà.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Hiện nay, bộ điều khiển trung tâm được điều chỉnh đa ngon nhữ, nhạy bén và thân thiện giúp chủ nhân dễ dàng sử dụng, quản lý các thiết bị cũng như cài đặt hoạt cảnh, chế độ quản lý điều khiển căn hộ thông minh.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Đời sống vật chất được nâng cao cũng chính là lúc bạn cần bảo vệ tốt hơn cho bản thân và gia đình mình tránh khỏi những rủi ro đáng tiếc. Và sự ra đời và ứng dụng rộng rãi của các thiết bị điện thông minh cùng hệ thống quản lý, điều khiển căn hộ thông minh từ xa giúp bảo rất nhiều trong công tác bảo vệ này.&nbsp;</p><div><br></div>', NULL, 'https://happysmarthome.vn/wp-content/uploads/2020/10/nha%CC%80-tho%CC%82ng-minh.jpg', '', 1, NULL, 1, 'active', '2021-08-18 20:28:35', '2021-08-18 20:28:35');
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Hệ thống điện thông minh – “Bộ não 4.0” trong “cơ thể” nhà hiện đại.', 'he-thong-dien-thong-minh-bo-nao-40-trong-co-the-nha-hien-dai', '<p><span style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Hệ thống điện thông minh&nbsp;biến ngôi nhà bạn thông minh đáng kinh ngạc. Sống trong xã hội hiện đại hóa, con người dần lệ thuộc nhiều hơn vào các thiết bị điện. Đặc biệt nhất là vào những ngày hè oi bức hay mùa đông buốt giá, việc tiêu thụ điện năng cao làm hao […]</span><br></p>', '<ul><li style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Hệ thống điện thông minh&nbsp;biến ngôi nhà bạn thông minh đáng kinh ngạc.</span></li><li style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Sống trong xã hội hiện đại hóa, con người dần lệ thuộc nhiều hơn vào các thiết bị điện. Đặc biệt nhất là vào những ngày hè oi bức hay mùa đông buốt giá, việc tiêu thụ điện năng cao làm hao hụt rất nhiều kinh phí. Tuy rất muốn tiết kiệm điện năng, thu gọn chi phí chi trả hàng tháng, song mỗi chúng ta không thể giảm thiểu đi việc sử dụng các thiết bị điện mỗi ngày. Lúc này, hệ thống&nbsp;<a href=\"https://happysmarthome.vn/san-pham/cong-tac-vien-nhom/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">điện thông minh</a>&nbsp;ra đời, giúp bạn giải quyết các vấn đề nan giải trên đây.</li></ul><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"858\" height=\"482\" src=\"https://happysmarthome.vn/wp-content/uploads/2020/06/va%CC%86n-pho%CC%80ng-tho%CC%82ng-minh.jpg\" alt=\"\" class=\"wp-image-1012\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2020/06/văn-phòng-thông-minh.jpg 858w, https://happysmarthome.vn/wp-content/uploads/2020/06/văn-phòng-thông-minh-712x400.jpg 712w, https://happysmarthome.vn/wp-content/uploads/2020/06/văn-phòng-thông-minh-768x431.jpg 768w, https://happysmarthome.vn/wp-content/uploads/2020/06/văn-phòng-thông-minh-600x337.jpg 600w\" sizes=\"(max-width: 858px) 100vw, 858px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Không chỉ giúp quản lý điện năng chặt chẽ, hạn chế lãng phí điện khi không sử dụng, hệ thống điện thông minh với các thiết bị hiện đại còn phục vụ mọi nhu cầu, đáp ứng tốt nhất các mong muốn của các thành viên trong gia đình bạn. Bạn có lấy làm thích thú khi có thể điều khiển được mọi thiết bị trong căn hộ của mình mọi lúc, mọi nơi thông tin chiếc điện thoại di động hay máy tính bảng không?</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Hệ thống điện thông minh là gì?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Hệ thống điện thông minh còn được hiểu là hệ thống các thiết bị thông minh trong căn hộ hiện đại, giữa chúng có sự kết hợp với nhau thông qua đường truyền dẫn nhằm tối ưu hóa quá trình truyền tải điện. Đồng thời, hệ thống các thiết bị điện này kết nối với thiết bị điều khiển của chủ nhà thông qua internet giúp việc điều khiển hệ thống điện trong căn hộ trở nên đơn giản.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Thông thường, một hệ thống điện trong&nbsp;<a href=\"https://happysmarthome.vn/3-tieu-chi-can-ho-thong-minh/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">căn hộ thông minh</a>&nbsp;gôm có: Phát điện, truyền tải điện, phân phối điện và tiêu thụ điện. Với công nghệ điện thông minh cho căn hộ cao cấp, người dùng có thể tự động điều chỉnh chế độ sử dụng điện tùy theo mong muốn, nhu cầu của mình. Các thiết bị điện phục vụ ở mức độ tốt nhất, vừa phải hoặc tiết kiệm điện năng nhằm tối ưu hóa quá trình dùng của chủ nhà.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/ai-hub-camera-an-ninh/\" target=\"_blank\" rel=\"nofollow\" class=\"u5fe13b9bf152ddc9f5852cd8112d6820\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Camera an ninh ứng dụng AI hiệu quả - chống trộm 97% chính xác.</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Các tiện ích hệ thống điện thông minh mang lại&nbsp;</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"1067\" height=\"800\" src=\"https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi-1067x800.jpg\" alt=\"điện thông minh\r\n\" class=\"wp-image-942\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi-1067x800.jpg 1067w, https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi-533x400.jpg 533w, https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi-768x576.jpg 768w, https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi-1536x1152.jpg 1536w, https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi-600x450.jpg 600w, https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi.jpg 1600w\" sizes=\"(max-width: 1067px) 100vw, 1067px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Giải pháp điện thông minh không chỉ ra đời nhằm tiết kiệm điện năng tiêu thụ mà còn mang lại cuộc sống hiện đại rất nhiều tiện ích như:</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Bảo vệ các thiết bị tránh khỏi những tác động vật lý từ môi trường, khí hậu, con người, các tác nhân khác…</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Điện thông minh giúp chủ nhà dễ dàng quản lý quá trình tiêu thụ điện, diễn biến các thiết bị điện trong căn hộ của mình.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Lượng điện năng sử dụng được xoay vòng, tái sử dụng một cách hợp lý. Từ đó tiết kiệm tổng điện năng tiêu thụ.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Điện năng tiêu thụ cũng giám đáng kể trong quá trình sử dụng. Các thiết bị điện hạn chế hư hỏng, bảo đảm chất lượng và kéo dài tuổi thọ hơn.</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Hệ thống điện thông minh giúp căn hộ hiện đại, tiện nghi, tạo ra môi trường thân thiện và bảo vệ con người tốt hơn trong quá trình dùng.</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Nếu bạn nghĩ việc bỏ ra khoản tiền kha khá để đầu tư lắp đặt điện thông minh cho căn hộ của mình là lãng phí, thì với những tiện ích và lợi ích công nghệ này mang lại sẽ giúp bạn trút bỏ ngay ý nghĩ đó. Bởi, giá thành điện ngày càng tăng cao và việc phải truyền tải, tiêu thụ quá nhiều điện năng cũng khiến các thiết bị sử dụng điện xuống cấp nhanh chóng. Thi công điện thông minh giúp bạn vừa tiết kiệm chi phí chi trả tiền điện hàng tháng, đồng thời tiết kiệm chi phí bảo trì, bảo dưỡng thiết bị trong căn hộ của mình.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Các thiết bị điện thông minh cần thiết cho căn hộ của bạn</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"1176\" height=\"733\" src=\"https://happysmarthome.vn/wp-content/uploads/2019/12/Screen-Shot-2019-12-23-at-10.20.27.png\" alt=\"Nhà thông minh - Happy smarthome\" class=\"wp-image-667\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2019/12/Screen-Shot-2019-12-23-at-10.20.27.png 1176w, https://happysmarthome.vn/wp-content/uploads/2019/12/Screen-Shot-2019-12-23-at-10.20.27-642x400.png 642w, https://happysmarthome.vn/wp-content/uploads/2019/12/Screen-Shot-2019-12-23-at-10.20.27-768x479.png 768w, https://happysmarthome.vn/wp-content/uploads/2019/12/Screen-Shot-2019-12-23-at-10.20.27-600x374.png 600w\" sizes=\"(max-width: 1176px) 100vw, 1176px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"><figcaption style=\"margin-top: 0.5em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/goi-lap-dat/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">Nhà thông minh</a>&nbsp;– Happy&nbsp;<a href=\"https://happysmarthome.vn/cong-nghe-smarthome/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">smarthome</a></figcaption></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Sự phát triển của nền công nghệ điện thông minh mang đến loài người những trải nghiệm hay ho, phục vụ con đến “từng chân răng kẻ tóc”. Chỉ cầu bạn có nhu cầu sử dụng, mọi yêu cầu của bạn sẽ được thực thi ngay lập tức. Đó cũng là lý do ngày càng có nhiều&nbsp;<a href=\"https://happysmarthome.vn/lap-dat-thiet-bi-dien-thong-minh-gia-sieu-binh-dan/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">thiết bị điện thông minh</a>&nbsp;đến gần hơn với cuộc sống của bạn. Dưới đây chính là những thiết bị điện thông minh đặc trưng cần thiết trong mỗi căn hộ:&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/3-tieu-chi-can-ho-thong-minh/\" target=\"_blank\" rel=\"nofollow\" class=\"u8d3f0793a8399ea2b5ab278f2dee8137\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">3 tiêu chí cần có của một căn hộ thông minh.</span></div></a></div><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– TV thông minh: Cập nhật nội dung thường xuyên thông qua các ứng dụng và phát hình ảnh, âm thanh theo yêu cầu của người dùng. Rất nhiều TV hiện nay đã đáp ứng “mệnh lệnh” của chủ nhân qua giọng nói, cử chỉ.</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Hệ thống đèn chiếu sáng thông minh: Giúp bạn điều khiển được ánh sáng mọi ngóc ngách trong căn hộ dù ở gần hoặc xa. Chủ nhân điều khiển ánh sáng trong nhà, tắt hoặc mở thông qua 1 cái chỉ tay trên màn hình điện thoại, máy tính bảng.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Hệ thống cảm biến: Giúp chủ nhân phát hiện sự có mặt của người quen, người lạ, những “vị khách không mời mà tới” trong căn hộ. Hệ thống này giúp bạn điều chỉnh ánh sáng phù hợp của đèn chiếu sáng hoặc ánh sáng ban ngày.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Khóa thông minh: Cho phép chủ nhà mở cửa, đóng cửa từ xa, thậm chí khóa thông minh có thể nhận diện chủ nhà bằng giọng nói hay khuôn mặt. Ngoài ra, bạn cũng có thể cung cấp quyền ra vào nhà hoặc từ chối mở cửa cho khách khi đang không có mặt tại nhà.</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">–&nbsp;<a href=\"https://happysmarthome.vn/san-pham/ai-camera-hub-camera-an-ninh-thong-minh-canh-bao-tuc-thi/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">Camera an ninh</a>&nbsp;thông minh: Không chỉ giúp giám sát các khu vực trong căn hộ mà còn có khả năng cảnh báo nguy hiểm, có kẻ lạ đột nhập với chủ nhân qua hệ thống báo động. Camera thông minh cũng kết hợp với các thiết bị điện thông minh khác nhằm xây dựng những kích bản chống trộm, phòng kẻ xấu đột nhập, bảo vệ an toàn cho ngôi nhà.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/2021-giai-phap-nha-thong-minh/\" target=\"_blank\" rel=\"nofollow\" class=\"u877e81928ebcef3c7057430467d7e293\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Đừng nói bạn đang ở năm 2021 nếu không biết đến giải pháp nhà thông minh!</span></div></a></div><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Hệ thống rèm cửa thông mình: Với hệ thống này, rèm cửa nhà bạn có thể tự đóng mở tùy theo mong muốn của chủ nhân. Hoặc bạn cũng có thể điều chỉnh rèm đóng, mở thông qua smartphone.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Còn rất rất nhiều thiết bị điện thông minh phục vụ cho căn hộ hiện đại của bạn như: điều hòa thông minh, bếp điện thông minh, hệ thống âm thanh thông minh… Chúng phục vụ tốt nhất mọi nhu cầu của con người, mang lại sự tiện nghi nhất, bảo vệ tốt nhất cho căn hộ và các thành viên thân yêu khỏi những rủi ro không mong muốn.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Xét cho cùng, con người chạy đua cùng cuộc sống, vùi mình vào công việc cũng chỉ để phục vụ những nhu cầu thiết yếu của bản thân, để giúp mình và gia đình có một cuộc sống vui khỏe, sung túc.&nbsp;Sự xuất hiện và hòa mình của hệ thống điện thông minh cũng như công nghệ smarthome mang cuộc sống của bạn đến một tầm cao mới. Vậy bạn còn ngại gì mà không chọn ngay cho mình hệ thống điện cho căn hộ thông minh để được trải nghiệm sự mới mẻ, hiện?</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Hiện nay,&nbsp;HappySmarthome tự hào là một trong những đơn vị đi đầu trong việc lắp đặt và thi công hệ thống điện thông minh cùng công nghệ smarthome, mang những tiện ích cao cấp nhất đến với căn hộ, công trình sở hữu của bạn.</p><div><br></div>', NULL, 'https://happysmarthome.vn/wp-content/uploads/2020/10/ca%CC%86n-ho%CC%A3%CC%82.jpg', '', 2, NULL, 1, 'active', '2021-08-18 20:30:12', '2021-08-18 20:30:12'),
(4, 'Giải đáp “Vạn câu hỏi vì sao?” về công nghệ Smarthome', 'giai-dap-van-cau-hoi-vi-sao-ve-cong-nghe-smarthome', '<p><span style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Giải đáp “Vạn câu hỏi vì sao?” về công nghệ Smarthome Công nghệ Smarthome đang dần len lỏi và trở thành xu hướng nhà ở đẳng cấp trong những năm trở lại đây. Là hình thức nhà thông minh với tiêu chí “nhà không chỉ dùng để ở”, Smarthome mang đến cho bạn nhiều tiện […]</span><br></p>', '<h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Giải đáp “Vạn câu hỏi vì sao?” về công nghệ Smarthome</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Công nghệ&nbsp;<a href=\"https://happysmarthome.vn/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">Smarthome</a>&nbsp;đang dần len lỏi và trở thành xu hướng nhà ở đẳng cấp trong những năm trở lại đây. Là hình thức&nbsp;<a href=\"https://happysmarthome.vn/goi-lap-dat/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">nhà thông minh</a>&nbsp;với tiêu chí “nhà không chỉ dùng để ở”, Smarthome mang đến cho bạn nhiều tiện ích cao cấp cùng với khả năng phục vụ con người tuyệt hảo từ A – Z. Cũng chính vì những “khả năng thần kỳ” như vậy, Smarthome khiến con người hiện đại không khỏi tò mò. Và hôm nay, chúng tôi sẽ giúp bạn hiểu rõ tất tần tật về thế hệ nhà thông minh với hàng loạt câu hỏi trend nhất năm 2020!</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\">Smarthome –&nbsp;<span style=\"font-weight: bolder;\">Hệ thống nhà thông minh là gì?</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"800\" height=\"800\" src=\"https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-800x800.jpeg\" alt=\"smarthome\" class=\"wp-image-1027\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-800x800.jpeg 800w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-400x400.jpeg 400w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-280x280.jpeg 280w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-768x768.jpeg 768w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-300x300.jpeg 300w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-600x600.jpeg 600w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi-100x100.jpeg 100w, https://happysmarthome.vn/wp-content/uploads/2020/10/goi-nha-thong-minh-lumi.jpeg 1000w\" sizes=\"(max-width: 800px) 100vw, 800px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Hệ thống nhà thông minh được hiểu là công nghệ nhà ở hiện đại giúp kết nối các thiết bị nhà ở với chủ nhân thông qua thiết bị di động có liên kết mạng. Qua đó, bạn có thể quản lý các thiết bị điện, điều khiển mọi sự việc diễn ra trong căn hộ chỉ với 1 cái chỉ tay, giọng nói hay cử chỉ. Điều đặc biệt là người dùng có thể điều chỉnh các thiết bị hoạt động theo mong muốn mọi lúc mọi nơi mà không nhất thiết phải có mặt ở nhà.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Hay nói cách khác hơn, nhà thông minh là dịch vụ mang đến người dùng nhiều tiện ích cao cấp, phục vụ tốt nhất cho các nhu cầu sống, nâng tầm chất lượng cuộc sống của bạn. Thông qua công nghệ hiện đại, ngôi nhà ở 4.0 này cũng giúp bảo vệ tốt hơn cho con người và vật dụng của bạn, giúp bạn tiết kiệm thời gian và chi phí chi tiêu hàng tháng.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/thiet-bi-thong-minh-smarthome/\" target=\"_blank\" rel=\"nofollow\" class=\"u3a7aabd0725291ea7008d63017ee34e5\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Cuộc sống \"chất lừ\" với các thiết bị siêu thông minh đến từ smarthome.</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Thiết bị nào có thể dùng trong công nghệ Smarthome?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Thật ngạc nhiên khi câu trả lời là toàn bộ các khu vực, bộ phận và đồ dùng sử dụng điện được đều có thể ứng dụng công nghệ Smarthome. Theo đó, các đồ dùng này có thể liên kết với nhau qua hệ thống&nbsp;<a href=\"https://happysmarthome.vn/lap-dat-thiet-bi-dien-thong-minh-gia-sieu-binh-dan/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">điện thông minh</a>. Hệ thống này được chủ nhân quản lý và điều khiển thông qua màn hình quản lý trong nhà hoặc trên smartphone, máy tính bảng.</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Sử dụng các thiết bị thông minh trong căn hộ của bạn cũng đồng nghĩa với việc bạn đang là “vua” của một “vương quốc nhỏ”. Bạn có thể “sai khiến” các thiết bị hoạt động hoặc ngưng hoạt động theo nhu cầu dùng. Thậm chí bạn có thể đón tiếp khách đến nhà chơi mà không nhất thiết phải có mặt tại nhà chỉ bằng 1 cái chỉ tay. Và theo đó, ngôi nhà của bạn cũng sẽ được bảo vệ an toàn khỏi “những vị khách không mời mà tới”.</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Lắp đặt Smarthome tốn bao nhiêu?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Chắc hẳn khi nhắc đến công nghệ Smarthome, rất nhiều người cảm thấy “xa xỉ” và lắc đầu vì thu nhập của bản thân quá thấp để được tận hưởng những nghiên cứu đẳng cấp nhất mà ngành công nghệ mang lại. Song, bạn đừng vội nản chí nhé, nói cho bạn biết việc lắp đặt Smarthome không hề đắt đỏ và bất kỳ ai có thu nhập trung bình, thậm chí thu nhập thấp vẫn có thể dễ dàng sở hữu&nbsp; và sử dụng nó.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Đừng quá kinh ngạc khi chúng tôi bật mí hệ thống nhà thông minh chỉ được lắp đặt với kinh phí chỉ từ 30 triệu đồng. Điều đó hoàn toàn là sự thật và bạn không cần cảm thấy lo lắng quá nhiều về tiền bạc khi mơ ước sở hữu một&nbsp;<a href=\"https://happysmarthome.vn/3-tieu-chi-can-ho-thong-minh/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">căn hộ thông minh</a>&nbsp;bậc nhất như hiện nay nhé.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/a-z-nha-thong-minh-smarthome-4-0/\" target=\"_blank\" rel=\"nofollow\" class=\"u5191d78771b4036c028780141c02fa3c\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Từ A-Z về nhà thông minh - Công nghệ Smarthome 4.0</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Thời gian lắp đặt Smarthome có lâu không?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Bạn và các thành viên thân yêu trong gia đình không phải chờ đợi quá lâu để sở hữu căn hộ thông minh, tiện ích như mong đợi đâu nhé. Bởi quá trình thi công, lắp đặt Smarthome cũng khá nhanh chóng, không “ngốn” nhiều thời gian.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Với một nhà ở thông thương, các thiết bị điện đã có sẵn. Việc cần làm thi lắp đặt công nghệ thông minh là sắp xếp lại các vật dụng, thiết kế cơ sở hạ tầng điện để kết nối các thiết bị dùng điện và liên kết đến màn hình quản lý là hoàn tất. Toàn bộ quá trình này chỉ tốn khoảng 1 – 2 tuần, tùy vào diện tích và cấu trúc mỗi căn hộ.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Smarthome có thể hoạt động khi mất điện?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Smarthome hoạt động phục vụ và mang đến những tiện ích cho bạn thông qua hệ thống kết nói các thiết bị sử dụng điện. Do đó, việc mất điện sẽ gây ảnh hưởng khá lớn đến quá trình vận hành của hệ thống điện thông minh trong Smarthome. Để đảm bảo quá trình vận hành Smarthome diễn ra thuận lợi, không bị gián đoạn, bạn nên sử dụng thêm nguồn điện dự phòng hoặc máy phát điện.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Vì sao Smarthome bảo vệ tốt hơn cho sức khỏe?&nbsp;</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Tất nhiên, trẻ em sẽ không có đủ những hiểu biết để sử dụng và điều khiển được các thiết bị sử dụng điện. Về điều này, Smarthome hoàn toàn có thể giúp bạn thông qua hình thức điều khiển từ xa. Ngoài ra, căn hộ thông minh với các thiết bị cảm biến cũng giúp nhiệt độ, ánh sáng của không gian từng khu vực luôn ở mức phù hợp với người dùng. Dù nhà bạn có người lớn tuổi hoặc trẻ nhỏ thì việc thi công Smarthome cũng mang lại nhiều tiện ích bảo vệ sức khỏe tốt nhất.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/3-tieu-chi-nha-thong-minh-hoan-hao/\" target=\"_blank\" rel=\"nofollow\" class=\"u4fc86c6e759da421ec0a4570a83a1004\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">3 tiêu chí đặt ra để sở hữu nhà thông minh hoàn hảo</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Phải làm thế nào để bảo vệ nhà khi hệ thống trung tâm gặp sự cố?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Về điều này, bạn có thể yên tâm bởi trạng thái căn hộ của bạn sẽ không có bất kỳ nguy hiểm hay thay đổi nào khi hệ thống trung tâm gặp sự cố cả. Điều bạn cần làm lúc này là liên hệ các chuyên viên kỹ thuật để lỗi hệ thống được khắc phục nhanh chóng, Smarthome tiếp tục hoàn thành công tác phục vụ các nhu cầu và mang tiện ích đến với cuộc sống.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Trên đây chính là những vấn đề được nhiều người quan tâm nhất khi được hỏi về công nghệ Smarthome. Bạn có tò mò hay có những thắc mắc nào khác về công nghệ nhà ở hiện đại này không? Đừng ngần ngại liên hệ 0914353286 để được giải đáp nhanh nhất.</p>', NULL, 'https://happysmarthome.vn/wp-content/uploads/2020/05/1.NTM_la_gi-1067x800.jpg', '', 3, NULL, 1, 'active', '2021-08-18 20:31:39', '2021-08-18 20:31:39'),
(5, 'Sở hữu căn hộ chung cư thông minh 4.0 có gì đặc biệt?', 'so-huu-can-ho-chung-cu-thong-minh-40-co-gi-dac-biet', '<p><span style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Thông tin về căn hộ chung cư thông minh ai cũng nên biết Ai cũng có những nhu cầu riêng cho căn hộ của mình với việc mua sắm và sưu tập đầy đủ các thiết bị hiện đại phục vụ tốt nhất cho cuộc sống. Tuy nhiên, nếu chỉ sử dụng các thiết bị […]</span><br></p>', '<h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Thông tin về căn hộ chung cư thông minh ai cũng nên biết</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Ai cũng có những nhu cầu riêng cho căn hộ của mình với việc mua sắm và sưu tập đầy đủ các thiết bị hiện đại phục vụ tốt nhất cho cuộc sống. Tuy nhiên, nếu chỉ sử dụng các thiết bị điện thông thường thôi thì chưa thể gọi là “tận hưởng” được. Bạn nghĩ sao nếu sau một ngày làm việc mệt nhoài trở về nhà được các thiết bị thông minh “tự giác” phục vụ? Nghĩa là bạn chỉ cần ngồi yên 1 chỗ “lướt” smartphone hay máy tính bảng và “ra lệnh” để “phục vụ” mình. Thật thú vị và vô cùng hay ho phải không nào?&nbsp;Và điều đó hoàn toàn có thể trở thành sự thật khi bạn lựa chọn&nbsp;<a href=\"https://happysmarthome.vn/3-tieu-chi-can-ho-thong-minh/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">căn hộ thông minh</a>&nbsp;–&nbsp;<a href=\"https://happysmarthome.vn/cong-nghe-smarthome/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">smarthome</a>!</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Căn hộ chung cư thông minh là gì?</span></h2><figure class=\"wp-block-image size-large\" style=\"margin-bottom: 1em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\"><img loading=\"lazy\" width=\"800\" height=\"800\" src=\"https://happysmarthome.vn/wp-content/uploads/2020/04/214-800x800.jpg\" alt=\"căn hộ chung cư thông minh\" class=\"wp-image-914\" srcset=\"https://happysmarthome.vn/wp-content/uploads/2020/04/214-800x800.jpg 800w, https://happysmarthome.vn/wp-content/uploads/2020/04/214-400x400.jpg 400w, https://happysmarthome.vn/wp-content/uploads/2020/04/214-280x280.jpg 280w, https://happysmarthome.vn/wp-content/uploads/2020/04/214-768x768.jpg 768w, https://happysmarthome.vn/wp-content/uploads/2020/04/214-300x300.jpg 300w, https://happysmarthome.vn/wp-content/uploads/2020/04/214-600x600.jpg 600w, https://happysmarthome.vn/wp-content/uploads/2020/04/214-100x100.jpg 100w, https://happysmarthome.vn/wp-content/uploads/2020/04/214.jpg 900w\" sizes=\"(max-width: 800px) 100vw, 800px\" style=\"max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1; border-radius: inherit;\"></figure><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Nếu bạn nghĩ chỉ những biệt thự to lớn, nhà hạng sang mới có thể sử dụng các thiết bị thông minh thì chắc hẳn bạn sẽ ngạc nhiên lắm khi biết được chính căn hộ bé bé xinh xinh của mình cũng có thể hô biến thành một smarthome đẳng cấp. Và cái tên căn hộ chung cư mini cũng bắt nguồn từ đây!</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Căn hộ chung cư mini vốn dĩ cũng là căn hộ chung cư thông thường nhưng được trang bị thêm những thiết bị thông minh với nhiều tiện ích cho chủ nhà. Theo đó, đa phần các tính năng quản lý các hoạt động diễn ra trong căn hộ, giám sát từ xa, kiểm soát an ninh hay điều khiển các thiết bị thông minh từ xa trên smartphone, máy tính bảng được kích hoạt.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Không chỉ vậy, bạn còn có thể điều khiển các hoạt động của thiết bị diễn ra trong căn hộ chung cư của mình bằng giọng nói hay cử chỉ. Sẽ rất thú vị khi những vị khách tới chơi nhà bạn cảm thấy bối rối, ngạc nhiên và trố mắt trầm trồ bởi sự điều khiển đầy quyền lực của bạn đối với ngôi nhà của mình.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/a-z-nha-thong-minh-smarthome-4-0/\" target=\"_blank\" rel=\"nofollow\" class=\"ub2487168d90a5897fed3a49d2f2b5ec2\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Từ A-Z về nhà thông minh - Công nghệ Smarthome 4.0</span></div></a></div><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">So với căn hộ thông thường, nhà thông minh có gì khác biệt?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Nhắc đến sự khác biệt giữa căn hộ chung cư thông thường và căn hộ chung cư thông minh thì có quá nhiều vấn đề đề nói. Điều đầu tiên bạn dễ dàng nhận thấy đó chính là sự hiện đại bởi đây là một trong những công nghệ 4.0 hiện đại bậc nhất phục vụ nhu cầu cuộc sống của con người, nâng chất lượng cuộc sống lên một tầm cao mới.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Mô hình&nbsp;<a href=\"https://happysmarthome.vn/goi-lap-dat/\" style=\"touch-action: manipulation; color: rgb(60, 158, 99);\">nhà thông minh</a>&nbsp;với những “siêu tiện ích” giúp bạn bảo vệ tốt nhất cho bản thân, gia đình và căn hộ của mình. Đồng thời, nó cũng giúp bạn tạo ra sự gắn kết giữa các thiết bị, tổng thể ngôi nhà, tiết kiệm điện năng và duy trì tốt hơn độ bền của các thiết bị. Cụ thể, bạn có thể hiểu sự vượt bậc của căn hộ thông minh so với chung cư thông minh thông qua các tiện ích như:</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Có thể quản lý và điều khiển các thiết bị từ xa thông qua thiết bị nhỏ như smartphone, máy tính bảng. Bạn được trải nghiệm mọi thứ giống như đang cho cả ngôi nhà vào trong lòng bàn tay và mang đi khắp mọi nơi vậy.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Với hệ thống chiếu sáng thông minh, bạn và các thành viên trong gia đình, những vị khách thân yêu sẽ không cảm thấy sự tối tăm khi bước vào căn hộ dù ở bất kỳ thời gian nào trong ngày. Hệ thống này cũng có khả năng giúp điều chỉnh lượng ánh sáng bóng đèn, ánh sáng ban ngày phù hợp.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/10-loai-thiet-bi-dien-thong-minh-tot/\" target=\"_blank\" rel=\"nofollow\" class=\"u1d3c2c02dfc5376c91093d77411da1ea\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">10 loại thiết bị điện thông minh không thể thiếu cho nhà/ căn hộ thông minh 4.0</span></div></a></div><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Thật đơn giản, tiện lợi khi bạn có thể kiểm soát được mọi sự việc diễn ra trong căn hộ dù đang ở bất kỳ đâu thông qua việc nhìn vào màn hình điện thoại. Điều này cũng giúp bạn dễ dàng xử lý từ xa các vấn đề như: quên đóng cửa, quên tắt các thiết bị điện, khi có khách tới chơi nhà, có kẻ lạ đột nhập cũng như các sự cố diễn ra…</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Nhà thông minh với hệ thống rèm màn tự động như những “nàng osin vô hình”, biết nhận định thời gian, điều kiện ánh sáng để mở rèm màn, đóng rèm màn đúng lúc, phục vụ tốt nhất cho chủ nhân.&nbsp;&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Với các thiết bị cảm ứng, ngôi nhà của bạn hoàn toàn có khả năng tự kiểm soát và điều chỉnh nhiệt độ phù hợp với không gian, giúp bảo vệ tốt cho sức khỏe cả nhà, đồng thời hạn chế sự hao phí điện năng.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Chức năng kiểm soát tình trạng đóng mở cửa, hệ thống phòng chống trộm và những cảnh báo nguy hiểm khi có kẻ lạ đột nhập giúp bạn phát hiện nhanh nhất những “vị khách lạ” tấn công vào nhà. Từ đó, những phương án ứng phó, xử lý cũng được áp dụng kịp thời.</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">– Hệ thống báo cháy, báo rò rỉ gas, cảm biến khói… cũng chính là một trong những cơ quan góp phần bảo vệ an toàn tốt nhất cho căn hộ và những người chung sống tại đây. Nhất nhanh chóng những tình huống có khả năng gây nguy hiểm sẽ được cảnh báo qua màn hình trong nhà và thiết bị di động của bạn bằng cả hình ảnh hiển thị và âm thanh báo động.&nbsp;</p><div style=\"font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px; clear: both; margin-top: 0em; margin-bottom: 1em;\"><a href=\"https://happysmarthome.vn/thi-cong-nha-thong-minh-smarthome/\" target=\"_blank\" rel=\"nofollow\" class=\"uc7b972ce55d1d614afd84c62b35209ed\" style=\"background-color: rgb(234, 234, 234); touch-action: manipulation; color: rgb(60, 158, 99); padding-right: 0px; padding-left: 0px; margin: 0px; width: 958.875px; display: block; font-weight: bold; opacity: 1; transition: opacity 250ms ease 0s; padding-top: 1em !important; padding-bottom: 1em !important; border-width: 0px 0px 0px 4px !important; border-top-style: initial !important; border-right-style: initial !important; border-bottom-style: initial !important; border-top-color: initial !important; border-right-color: initial !important; border-bottom-color: initial !important; border-image: initial !important; border-left-style: solid !important; border-left-color: rgb(52, 73, 94) !important;\"><div style=\"padding-left: 1em; padding-right: 1em;\"><span class=\"ctaText\" style=\"color: inherit; font-size: 16px;\">Được xem nhiều:&nbsp;</span>&nbsp;&nbsp;<span class=\"postTitle\" style=\"color: rgb(0, 0, 0); font-size: 16px; text-decoration-line: underline !important;\">Những điều không thể bỏ qua khi thi công nhà thông minh.</span></div></a></div><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Ngoài ra, bạn sẽ được mở mang tầm mắt với sự linh hoạt về ngôn ngữ sử dụng trên màn hình quản lý trung tâm cùng những tiện ích tưới nước tự động, kết nối không giới hạn, các tiết ích tiết kiệm… Rất rất nhiều những trải nghiệm lý thú mà chỉ khi thi công và sử dụng căn hộ thông minh bạn mới nhận được.&nbsp;</p><h2 style=\"width: 958.875px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Kanit, sans-serif;\"><span style=\"font-weight: bolder;\">Căn hộ chung cư bình thường có thể biến thành Smarthome?</span></h2><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Với giải pháp Smarthome, câu trả lời là hoàn toàn có thể. Công nghệ nhà thông minh rất sẵn lòng hô biến một căn hộ chung cư thông thường trở thành căn hộ tiện nghi bậc nhất. Bạn không cần thiết phải thi công hay mua một căn hộ thông minh ngay từ đầu mà chỉ cần bỏ ra khoảng chi phí nhỏ để lắp đặt lại các hệ thống quản lý, kết nối các thiết bị điện và thiết bị di động.&nbsp;</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Như vậy, việc sở hữu một căn hộ chung cư thông minh không hề tốn quá nhiều thời gian và tiền bạc phải không nào? Bạn còn ngần ngại gì mà không thử?</p><p style=\"margin-bottom: 1.3em; font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 17.6px;\">Thật đơn giản và nhanh chóng để sở hữu căn hộ chung cư thông minh, mang chất lượng cuộc sống lên tầm cao mới khi đến với Happy Smarthome.</p>', NULL, 'https://happysmarthome.vn/wp-content/uploads/2019/11/Turkey-Penthouse-View-min-1.jpg', '', 3, NULL, 1, 'active', '2021-08-18 20:32:51', '2021-08-18 20:32:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Khách hàng', 'khach-hang', 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(2, 'Giải pháp nhà công nghệ', 'giai-phap-nha-cong-nghe', 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(3, 'Công nghệ', 'cong-nghe', 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 3, 5, 'rất hay', 'active', NULL, NULL, '2021-08-19 00:25:41', '2021-08-19 00:25:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(10,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `status`, `price`, `discount`, `cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Trung tâm điều khiển nhà thông minh RM4 PRO (version 2020)', 'trung-tam-dieu-khien-nha-thong-minh-rm4-pro-version-2020', '<table style=\"max-width: 100%; border-spacing: 0px; width: 880px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Lumi</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Trung Quốc</td></tr><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Kích thước</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">8.7x8.7x3.0</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Trung Quốc</td></tr><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Quy cách đóng gói</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\"><p style=\"margin: 5px 0px 12px;\">Không bao gồm củ sạc</p></td></tr></tbody></table>', '<p><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Mã sản phẩm: RM4 Pro. Điện áp: DC 5V 1A (Micro USB). Khoảng cách điều khiển hồng ngoại: Từ 8 – 15 mét. Tần số RF: 315; 433 MHz. Hỗ trợ Wifi: Wi-Fi 802.11b/g/n (2.4GHz); 3G, 4G. App hỗ trợ: Android, iOS. Hỗ trợ 50.000 mã IR trên đám mây. Nhiệt độ môi trường hoạt động: 0℃ - 50℃, RH ≤ 80％. Bộ sản phẩm bao gồm: 1 trung tâm + 1 cáp nguồn (dài 1 mét) + 1 bảng gắn + 1 hướng dẫn sử dụng.</span></p>', 'https://salt.tikicdn.com/ts/product/1f/e9/1b/287ff763f8df3127cfa6d7adb45df6ce.jpg', 29, 'active', 1689000.00, 65.00, 1, 3, '2021-08-18 19:07:24', '2021-08-18 20:43:16'),
(2, 'Aqara Hub M2 Bộ Điều Khiển Trung Tâm Zigbee 3.0 và Hồng Ngoại', 'aqara-hub-m2-bo-dieu-khien-trung-tam-zigbee-30-va-hong-ngoai', '<table style=\"max-width: 100%; border-spacing: 0px; width: 880px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">BKAV</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Trung Quốc</td></tr><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Chất liệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\"><p style=\"margin: 5px 0px 12px;\">Nhựa cứng</p></td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Hướng dẫn bảo quản</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\"><p style=\"margin: 5px 0px 12px;\">Bảo quản nơi khô thoáng, không dính nước</p></td></tr></tbody></table>', '<p><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Aqara Hub M2</span><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;là phiên bản&nbsp;&nbsp;mới nhất của Aqara. Cũng giống như&nbsp;, Hub M2 kết nối các thiết bị thông minh, cho phép điều khiển từ xa và tạo chuỗi hành động tự động hoá. Tuy nhiên, phiên bản mới có thiết kế hoàn toàn khác biệt như bo mặt đáy, vát mặt trên, màu chủ đạo là đen, mỏng và tinh tế hơn.</span><br></p>', 'https://salt.tikicdn.com/ts/product/4c/74/ce/082d1cbfcb38ab5f85e5b6a5ab8c7645.jpg', 15, 'active', 1750000.00, 3.00, 1, 2, '2021-08-18 19:11:21', '2021-08-18 19:11:21'),
(3, 'Công tắc cảm ứng Lumi viền nhôm 4 nút chữ nhật LM-S4 CN', 'cong-tac-cam-ung-lumi-vien-nhom-4-nut-chu-nhat-lm-s4-cn', '<table style=\"max-width: 100%; border-spacing: 0px; width: 880px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">LUMI</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Chống nước</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Không</td></tr></tbody></table>', '<p><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Điện áp: 150 - 250 VAC Nhiệt độ hoạt động: 0 - 40ºC max Công suất: 700w (Đèn sợi đốt) - 150w (Đèn led)/1 nút Kích thước: Hình vuông (95 x 95 mm) - Hình chữ nhật (121.5 x 80 mm)</span><br></p>', 'https://nhathongminh88.com/media/news/1508_cong-tac-cam-ung.jpg', 20, 'active', 1815000.00, 2.00, 2, 3, '2021-08-18 19:13:56', '2021-08-18 19:13:56'),
(4, 'Công Tắc Thông Minh Cảm Ứng 3 Nút Tròn SW2-3 Có Kèm Remote', 'cong-tac-thong-minh-cam-ung-3-nut-tron-sw2-3-co-kem-remote', '<p data-mce-style=\"text-align: justify;\" style=\"font-family: Roboto, sans-serif; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; line-height: 1.8; font-size: 14px; text-align: justify;\"><span data-mce-style=\"color: #000000; font-size: 12pt;\" style=\"margin: 0px; padding: 0px; font-size: 12pt;\">- Kích thước: 120 * 72 * 43mm</span><br style=\"margin: 0px; padding: 0px;\"><span data-mce-style=\"color: #000000; font-size: 12pt;\" style=\"margin: 0px; padding: 0px; font-size: 12pt;\">- Điện áp làm việc: 110-240VAC / 50Hz ~ 60Hz.</span><br style=\"margin: 0px; padding: 0px;\"><span data-mce-style=\"color: #000000; font-size: 12pt;\" style=\"margin: 0px; padding: 0px; font-size: 12pt;\">- Công suất: 5-300W / Gang</span><br style=\"margin: 0px; padding: 0px;\"><span data-mce-style=\"color: #000000; font-size: 12pt;\" style=\"margin: 0px; padding: 0px; font-size: 12pt;\">- Màu sắc: Trắng</span><br style=\"margin: 0px; padding: 0px;\"><span data-mce-style=\"color: #000000; font-size: 12pt;\" style=\"margin: 0px; padding: 0px; font-size: 12pt;\">- Vật liệu: nhựa và thủy tinh.</span><br style=\"margin: 0px; padding: 0px;\"><span data-mce-style=\"color: #000000; font-size: 12pt;\" style=\"margin: 0px; padding: 0px; font-size: 12pt;\">- Bảo hành: 24 tháng</span></p><div><span data-mce-style=\"color: #000000; font-size: 12pt;\" style=\"margin: 0px; padding: 0px; font-size: 12pt;\"><br></span></div>', '<p><span style=\"font-family: Roboto, sans-serif; margin: 0px; padding: 0px; font-weight: 700; text-align: justify;\">Công Tắc Thông Minh Cảm Ứng 3 Nút Tròn SW2-3</span><span style=\"font-family: Roboto, sans-serif; text-align: justify;\">&nbsp;phù hợp với đế âm hình chữ nhật tại Việt Nam, bật tắt bằng công nghệ chạm cảm ứng điện dung cao cấp. Bạn hoàn toàn có thể bật, tắt, hẹn giờ từ xa, kết nối toàn bộ công tắc trong nhà và hoàn toàn có thể thiết lập theo mong muốn của bạn.</span><br></p>', 'https://product.hstatic.net/1000177816/product/ava-cong-tac-3-nut-cam-ung-1.jpg', 20, 'active', 1040000.00, 13.00, 2, 1, '2021-08-18 19:17:54', '2021-08-18 19:17:54'),
(5, 'Công tắc điều khiển từ xa kết nối wifi/3G/4G Smart life phần mềm tiếng việt dễ sử dụng', 'cong-tac-dieu-khien-tu-xa-ket-noi-wifi3g4g-smart-life-phan-mem-tieng-viet-de-su-dung', '<table style=\"max-width: 100%; border-spacing: 0px; width: 880px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Lumi</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Trung Quốc</td></tr><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Kích thước</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">15*12*10</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Trung Quốc</td></tr></tbody></table>', '<p><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">PHIÊN BẢN TIẾNG VIỆT CÀI ĐẶT SỬ DỤNG DỄ DÀNG BẬT TẮT Ở BẤT CỨ ĐÂU THÔNG QUA KẾT NỐI WIFI HOẶC 3G/4G Công suất 10A (2500W)</span></p><p style=\"margin: 5px 0px 12px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><em>Công Tắc Thông Minh Điều Khiển Từ Xa Smart life - BẢN TIẾNG VIỆT, công tắc điều khiển từ xa, cong tac wifi, ổ cắm điều khiển từ xa, o cam hen gio, cong tac hen gio.</em></p><p style=\"margin: 5px 0px 12px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">ĐIỀU QUAN TRỌNG VÀ TIỆN ÍCH NHẤT CỦA SẢN PHẨM ĐÓ LÀ PHẦN MỀM SỬ DỤNG BẰNG TIẾNG VIỆT, ĐÂY LÀ SỰ KHÁC BIỆT LỚN SO MỚI CÁC LOẠI KHÁC.</p><p style=\"margin: 5px 0px 12px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">LƯU Ý: QUÝ KHÁCH KHÔNG NÊN DÙNG PHIÊN BẢN TIẾNG TRUNG VÌ CÓ THỂ CHỈ CẦN THAY ĐỔI 1 CHÚT LÀ KHÔNG KẾT NỐI ĐƯỢC.</p><p style=\"margin: 5px 0px 12px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Ứng dụng của:<em>Công tắc wifi Smart life.</em></p><p style=\"margin: 5px 0px 12px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Điều khiển bật tắt các thiết bị điện thông qua app trên điện thoại IOS hoặc android ở bất kỳ đâu kết nối thông qua mạng intenet hoặc 3G/4G.</p><p style=\"margin: 5px 0px 12px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">- Có chức năng hẹn giờ theo ngày hoặc theo tuần bật tắt luôn phiên</p><p style=\"margin: 5px 0px 12px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">- Nên kết hợp với khởi động từ NCH8 CHINT 25A/40A/63A tùy theo thiết bị bạn sử dụng công suất lớn hay nhỏ</p>', 'https://salt.tikicdn.com/ts/product/25/66/00/60e7755baa46a8da02784394401dfd92.jpg', 21, 'active', 169000.00, 0.00, 3, 3, '2021-08-18 19:23:45', '2021-08-18 21:05:01'),
(7, 'Thiết bị báo cháy Xiaomi Mijia Honeywell chính hãng Cảm biến khói nhạy cảm An ninh gia đình Zigbee Work With Gateway - Màu trắng', 'thiet-bi-bao-chay-xiaomi-mijia-honeywell-chinh-hang-cam-bien-khoi-nhay-cam-an-ninh-gia-dinh-zigbee-work-with-gateway-mau-trang', '<table style=\"max-width: 100%; border-spacing: 0px; width: 880px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Xiaomi</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">China</td></tr><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">china</td></tr></tbody></table>', '<div data-spm-anchor-id=\"a2g0o.detail.1000023.i2.6be37f264k9dhh\" style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Thương hiệu: Xiaomi</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Tên: Xiaomi Mijia HONEYWELL Báo Cháy Khói (Phiên bản tiếng Trung-Bạn cần để chuyển đổi APP Mihome máy chủ để \"Trung Quốc Đại Lục\" khi sử dụng)</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Kiểu pin: CR123A, tiêu chuẩn Điện áp 3V</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Chế độ báo động: Âm Thanh và ánh sáng báo động</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Báo động Phân loại: báo Cháy, báo lỗi báo động, báo pin yếu</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Âm thanh báo động cấp: 80dB trở lên</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Thời Gian chờ: Khoảng 1 năm</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Trọng lượng: 100g</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Nhiệt độ hoạt động: -10 ~ + 55 Độ C</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Vị trí lắp đặt: Trần</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Hỗ trợ: Android và IOS phiên bản: phiên bản Android 4.4/iOS 8.0 trở lên</div><div style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lưu ý: Thiết bị này có thể sử dụng chức năng báo động một cách độc lập, nhiều chức năng cần để phù hợp với Xiaomi Cửa Ngõ 3</div>', 'https://salt.tikicdn.com/cache/w444/ts/product/fd/01/85/27ce0cc666039e521b225490596bbf58.jpg', 19, 'active', 1457000.00, 48.00, 4, 4, '2021-08-18 19:37:14', '2021-08-19 01:56:25'),
(8, 'Cảm biến cửa từ thông minh KN-D06', 'cam-bien-cua-tu-thong-minh-kn-d06', '<table style=\"max-width: 100%; border-spacing: 0px; width: 880px; color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Lumi</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ thương hiệu</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Trung Quốc</td></tr><tr style=\"font-size: 13px; border-bottom: 0px;\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Kích thước</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">25x18x30</td></tr><tr style=\"font-size: 13px; border-bottom: 0px; background-color: rgb(250, 250, 250);\"><td style=\"padding: 10px 15px; width: 220px; vertical-align: top; color: rgb(79, 79, 79); background: rgb(239, 239, 239);\">Xuất xứ</td><td style=\"padding: 10px 15px; flex: 1 1 0%; border-right: 0px;\">Trung Quốc</td></tr></tbody></table>', '<div class=\"icondd\" style=\"color: rgb(101, 109, 120); font-family: verdana, geneva, sans-serif; font-size: 14px; text-align: justify;\">Cảm Biến Cửa Từ Thông Minh KN-D06 là cảm biến báo động cửa, có chức năng phát tín hiệu chuông báo khách hoặc báo động ngay khi cửa được mở ra.<br></div><div class=\"icondd\" style=\"color: rgb(101, 109, 120); font-family: verdana, geneva, sans-serif; font-size: 14px; text-align: justify;\">Khi để cảm biến ở chế độ khóa (arming), cảm biến sẽ báo động khi có người đột nhập trái phép từ các vị trí được lắp đặt cảm biến. KN-D06 có thể kết hợp được với các&nbsp;<a href=\"https://thietbidienthongminh.com/cam-bien-hong-ngoai\" target=\"_blank\" style=\"color: rgb(51, 51, 51); transition: color 200ms ease 0s, border-color 200ms ease-in-out 0s, background-color 200ms ease-in-out 0s; cursor: pointer; outline: 0px;\">cảm biến hồng ngoại</a>, cảm biến từ cửa, cảm biến gas, báo khói…<br></div><div class=\"icondd\" style=\"color: rgb(101, 109, 120); font-family: verdana, geneva, sans-serif; font-size: 14px; text-align: justify;\">Cảm biến cửa KN-D06 gồm có 3 bộ phận chính, bao gồm: 01 bộ trung tâm + 1 remote điều khiển + 1 nam châm.<br></div><div class=\"icondd\" style=\"color: rgb(101, 109, 120); font-family: verdana, geneva, sans-serif; font-size: 14px; text-align: justify;\">Sản phẩm được thiết kế có màu trắng sang trọng. Tích hợp 2 chế độ chuông, đó là: Chế độ báo khách và chế độ báo động.<br></div><div class=\"icondd\" style=\"color: rgb(101, 109, 120); font-family: verdana, geneva, sans-serif; font-size: 14px; text-align: justify;\">Tần số kết nối là 433MHz, khoảng cách kết nối lên đến 50 mét trong điều kiện không có vật cản.</div>', 'https://thietbidienthongminh.com/image/cache/catalog/cam-bien-cua-tu/cam-bien-cua-tu-thong-minh-kn-d06-tbdtm1-750x750.jpg', 19, 'active', 420000.00, 0.00, 5, 1, '2021-08-18 19:42:39', '2021-08-19 01:41:24'),
(9, 'Ổ cắm âm tường thông minh Tuya Wifi, hỗ trợ Google và Alexa', 'o-cam-am-tuong-thong-minh-tuya-wifi-ho-tro-google-va-alexa', '<ul style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(68, 68, 68); font-family: sans-serif; font-size: medium;\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\"><span style=\"font-weight: bolder;\">Ổ cắm âm tường thông minh Tuya Smart</span>&nbsp;điều khiển qua Wifi, mặt kính cường lực chống xước</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Công suất chịu tải cao, 10A/1 lỗ cắm</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Bật / tắt, điều khiển từ xa qua ứng dụng Tiếng Việt</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Lên lịch hoặc đếm ngược thời gian tự động bật / tắt</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Tạo ngữ cảnh kết hợp với các thiết bị Tuya khác</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Xem trạng thái hiện tại của thiết bị</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Tương thích với&nbsp;<a href=\"https://gucongnghe.com/google/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"touch-action: manipulation; color: rgb(2, 136, 209);\">Google Assistant</a>,&nbsp;<a href=\"https://gucongnghe.com/alexa/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"touch-action: manipulation; color: rgb(2, 136, 209);\">Amazon Alexa</a>, IFTTT</li></ul>', '<p style=\"margin-bottom: 1.3em; color: rgb(68, 68, 68); font-family: sans-serif; font-size: medium;\"><span style=\"font-weight: bolder;\">Ổ cắm âm tường thông minh Tuya</span>&nbsp;với mặt kính cường lực chống xước kết nối trực tiếp với Wifi cho phép bật / tắt các thiết bị cắm vào từ mọi nơi thông qua ứng dụng Smart Life / Tuya Smart trên điện thoại thông minh.</p><p style=\"margin-bottom: 1.3em; color: rgb(68, 68, 68); font-family: sans-serif; font-size: medium;\"><span style=\"font-weight: bolder;\">Ổ cắm thông minh Tuya</span>&nbsp;sử dụng đế âm tiêu chuẩn thông dụng tại Việt Nam, lắp đặt dễ dàng, cài đặt đơn giản trong vòng 1 phút. Bạn chỉ cần thay ổ cắm truyền thống đang dùng bằng ổ cắm Tuya, dây điện giữ nguyên không cần đi lại là có thể sử dụng điều khiển các thiết bị từ xa.</p><p style=\"margin-bottom: 1.3em; color: rgb(68, 68, 68); font-family: sans-serif; font-size: medium;\">Ổ cắm có công suất chịu tải cao tới 10A mỗi lỗ cắm,&nbsp;chân đa năng phù hợp với nhiều loại phích cắm khác nhau ở Việt Nam. Trên mặt kính cường lực có nút bấm cảm ứng để có thể điều khiển tắt, bật thiết bị mà không phải rút phích cắm, vô cùng tiện lợi.</p><p style=\"margin-bottom: 1.3em; color: rgb(68, 68, 68); font-family: sans-serif; font-size: medium;\">Sử dụng ổ cắm Wifi thông minh Tuya giúp bạn tiết kiệm năng lượng và tiết kiệm tiền điện một cách hiệu quả bằng cách tự động tắt các thiết bị điện gia dụng, thiết bị sưởi ấm, thiết bị làm mát khi không cần thiết.&nbsp;Ổ cắm còn được tích hợp tính năng đo điện năng tiêu thụ, điện áp, dòng điện của thiết bị cắm vào theo thời gian thực.</p><p style=\"margin-bottom: 1.3em; color: rgb(68, 68, 68); font-family: sans-serif; font-size: medium;\">Ổ cắm Tuya thiết kế tinh tế hiện đại, kết hợp giữa sự đơn giản và sang trọng, mang lại sự hoàn hảo cho ngôi nhà của bạn.</p>', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0WGYlerWMxFQvZzc7hJyKy7LxohkWMyTsHOmWJgJqnbarg30PaACBjsA41VqMPUSvRvol_Z0&usqp=CAc', 20, 'active', 690000.00, 10.00, 6, 3, '2021-08-18 19:45:21', '2021-08-18 19:45:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 9, 5, 'very good', 'active', '2021-08-19 00:24:45', '2021-08-19 00:24:45'),
(2, 3, 8, 5, 'good', 'active', '2021-08-19 01:40:14', '2021-08-19 01:40:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `summary`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Trong cuộc sống hiện đại ngày nay, Thiết Bị Điện Thông Minh đang ngày càng trở nên thông dụng. Và ngày càng được sử dụng rộng rãi.\n\n            Các thiết bị này giúp cho cuộc sống của chúng ta thêm tiện nghi và thông minh hơn.\n            \n            Không còn cái cảnh đi ra vào nhà vệ sinh, lên xuống cầu thang vào ban đêm. Phải dùng tay bật công tắc nữa. Các thiết bị như bóng đèn cảm ứng, đui đèn cảm ứng, cảm biến chuyển động,.. Đã thay chúng ta làm những việc đó, giúp tránh những rủi ro và tiết kiệm năng lượng.\n            Hay với các thiết bị điều khiển từ xa qua 3G,Wifi thì dù đi bất cứ đâu. Ta cũng có thể kiểm soát theo dõi được các thiết bị điện ở nhà. Muốn tắt hay mở thì bây giờ chỉ cần cầm điện thoại ra là có thể on, off.\n            Các thiết bị hẹn giờ tự động lại tự động giúp con người chúng ta bơm nước, tưới cây, tắt đèn bảng hiệu quảng cáo theo thời gian chúng ta mong muốn.\n            Trong thời buổi công nghệ càng ngày càng phát triển như hiện nay. Thì việc sử dụng thiết bị điện thông minh là tất yếu.\n            \n            Công ty Thiết Bị Điện tử Thông Minh là đơn vị chuyên cung cấp các thiết bị thông minh phù hợp với mọi đối tượng người dùng\n            \n            Các sản phảm và dịch vụ chung tôi cung cấp:\n            ➡ Thiết bị điện thông minh, nhà thông minh\n            \n            ➡ Các thiết bị hẹn giờ tự động\n            \n            ➡ Cửa tự động, cổng tự động.\n            \n            ➡ Thiết bị chống trộm thông minh\n            \n            ➡ Đèn năng lượng mặt trời giá rẻ\n            \n            Chúng tôi luôn mong muốn cung cấp các sản phẩm và giải pháp tốt nhất nhưng phải có giá thành tốt nhất đến cho bà con.\n            \n            Với mong muốn từ cái tâm của chúng tôi: Nhà nhà có thiết bị điện thông minh để dùng. Để cuộc sống người dân Việt Nam được nâng lên một tầm mới.\n            \n            ', 'Công nghệ 4.0 đang ngày càng phát triển mạnh mẽ với nhiều nghiên cứu ứng dụng hữu ích trong thực tiễn cuộc sống của con người, đặc biệt trong lĩnh vực Smarthome. SMARTDEVICE liên tục mở rộng hệ thống đại lý của mình trên toàn quốc nhằm giúp khách hàng dễ  dàng tiếp cận với công nghệ và trang bị hệ thống thông minh cho ngôi nhà của mình.', 'logo.jpg', 'image.jpg', 'Số 123, đường Lĩnh Nam, phường Vĩnh Hưng,Hoàng Mai,Hà Nội', '0377592469', 'daotheanh962@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VNPost – EMS (Bưu điện Việt Nam)', 62000, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(2, 'Viettel Post', 54000, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(3, 'Giaohangnhanh – GHN', 45000, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(4, 'Giaohangtietkiem – GHTK', 39000, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59'),
(5, 'J&T Express', 40000, 'active', '2021-08-18 17:16:59', '2021-08-18 17:16:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone`, `address`, `password`, `photo`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '0986747812', 'Thanh Nhan', '$2y$10$tGiRkyQ3b9BFjun9qGT90ugTP27D88z4X9Ufoc2YeoZsui6M4C.oW', NULL, 'admin', 'active', 'yGjOoJBZXrMcUFrRloMU3qUB3UKaxgyBs2DSytsJ4kBf1WaDph13kvphZxO6', '2021-08-18 10:16:59', '2021-08-18 10:16:59'),
(2, 'User', 'user@gmail.com', NULL, '0986747812', 'Quan 7', '$2y$10$Xy2ToCTAhTyZmBNGTJYAZumn.Vh9UDgtAnH7.xS9AX/VsHzK2v0mG', NULL, 'user', 'active', 'uIimGU6eyi', '2021-08-18 10:16:59', '2021-08-18 10:16:59'),
(3, 'Hennry John', 'daotheanh09062@gmail.com', '2021-08-19 00:22:13', '0377592469', 'Hoan Kiem, Ha Noi', '$2y$10$3X0WOAXyBqvj.KzmpKQa/udgGsxvwgp8898iXxgVDP.ektmUQ/QUq', NULL, 'user', 'active', NULL, '2021-08-19 00:21:12', '2021-08-19 07:10:53'),
(4, 'Jane Doe', 'janedoe@gmail.com', NULL, '0978654113', 'Cau Giay, Ha Noi', '$2y$10$/mI8zNhP4by0Hpi0xhmTk.bmBtnICnRYqoFB4KFH4u4spnadKxDt6', NULL, 'user', 'active', NULL, '2021-08-21 15:15:38', '2021-08-21 15:15:38'),
(5, 'Peter Parker', 'perterparker@gmail.com', NULL, '0341786345', 'Ha Dong, Ha Noi', '$2y$10$sfAl.RsP9vbVLd/.A4xeOe1NFDB48kfptA0Y2epxhi82bBUCi1zH.', NULL, 'user', 'active', NULL, '2021-08-24 16:08:54', '2021-08-24 16:08:54'),
(6, 'Tran Hoan', 'tranhoan123@gmail.com', NULL, '0986167824', 'Soc Son, Ha Noi', '$2y$10$FxzJ68RnI4NQd7DYDB/asucgZl/njppSNbk0Bar1kd1Ho1cJnUfFi', NULL, 'user', 'active', NULL, '2021-08-24 16:14:43', '2021-08-24 16:14:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 591150, 1, 591150, '2021-08-18 20:35:36', '2021-08-18 20:37:19');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
