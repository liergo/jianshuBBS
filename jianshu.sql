-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-08 09:52:34
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jianshu`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'system', '系统权限', '2017-09-09 09:15:34', '2017-09-09 09:15:34'),
(2, 'post', '文章权限', '2017-09-09 09:15:51', '2017-09-09 09:15:51'),
(3, 'topic', '专题权限', '2017-09-09 09:16:31', '2017-09-09 09:16:31'),
(4, 'notice', '通知管理', '2017-09-11 04:46:12', '2017-09-11 04:46:12');

-- --------------------------------------------------------

--
-- 表的结构 `admin_permissions_role`
--

CREATE TABLE `admin_permissions_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_permissions_role`
--

INSERT INTO `admin_permissions_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'system_management', '系统管理员', '2017-09-09 09:14:53', '2017-09-09 09:14:53'),
(2, 'post_management', '文章管理员', '2017-09-11 04:47:30', '2017-09-11 04:47:30');

-- --------------------------------------------------------

--
-- 表的结构 `admin_role_user`
--

CREATE TABLE `admin_role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_role_user`
--

INSERT INTO `admin_role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `password`, `created_at`, `updated_at`) VALUES
(1, 'root', '$2y$10$4y.oaZ4d0IcyvJtYyDFUfuHBmPKn0vkuRqAWn2MXzCMHKz5boVuli', '2017-09-09 08:51:36', '2017-09-09 08:51:36'),
(2, 'user1', '$2y$10$l5OCxZZybaDbx62.xMXmYuO34QIzMKdrn0Knk/VWLW8eb/yPiMNAG', '2017-09-09 09:17:12', '2017-09-09 09:17:12'),
(3, 'user2', '$2y$10$CW4et4jc/e.XisKU81ebMu4Reex5Axp8GAUGpI4ydILyKsA4eJxcC', '2017-09-09 09:17:24', '2017-09-09 09:17:24');

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '只要技术好就不拍被淘汰', '2017-09-09 08:21:01', '2017-09-09 08:21:01'),
(2, 3, 3, '总是想着 诗和远方  是会迷路的', '2017-09-09 08:42:56', '2017-09-09 08:42:56'),
(3, 3, 4, '我的文章', '2017-09-09 08:45:00', '2017-09-09 08:45:00'),
(4, 1, 2, '德瓦达发撒反对', '2017-09-12 07:37:36', '2017-09-12 07:37:36'),
(5, 1, 2, '啊实打实的撒', '2017-09-12 07:37:44', '2017-09-12 07:37:44'),
(6, 1, 5, 'yes', '2017-09-18 06:03:20', '2017-09-18 06:03:20'),
(7, 1, 8, 'asdasdasdas', '2017-11-12 10:16:39', '2017-11-12 10:16:39'),
(8, 1, 5, 'dsafsdfsdf', '2017-11-24 07:11:58', '2017-11-24 07:11:58'),
(9, 1, 9, 'wefrwerfwe', '2017-11-24 07:13:31', '2017-11-24 07:13:31');

-- --------------------------------------------------------

--
-- 表的结构 `fans`
--

CREATE TABLE `fans` (
  `id` int(10) UNSIGNED NOT NULL,
  `fan_id` int(11) NOT NULL DEFAULT '0',
  `star_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fans`
--

INSERT INTO `fans` (`id`, `fan_id`, `star_id`, `created_at`, `updated_at`) VALUES
(3, 2, 1, '2017-10-09 06:49:56', '2017-10-09 06:49:56'),
(17, 4, 3, '2017-10-09 08:10:32', '2017-10-09 08:10:32');

-- --------------------------------------------------------

--
-- 表的结构 `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(256, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":4:{s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 255, NULL, 1505981116, 1505981116),
(257, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":5:{s:28:\\"\\u0000App\\\\Jobs\\\\SendMessage\\u0000notice\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Notice\\";s:2:\\"id\\";i:3;}s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 0, NULL, 1505981138, 1505981138),
(258, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":5:{s:28:\\"\\u0000App\\\\Jobs\\\\SendMessage\\u0000notice\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Notice\\";s:2:\\"id\\";i:4;}s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 0, NULL, 1505984000, 1505984000),
(259, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":5:{s:9:\\"\\u0000*\\u0000notice\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Notice\\";s:2:\\"id\\";i:5;}s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 0, NULL, 1505986422, 1505986422),
(260, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":5:{s:9:\\"\\u0000*\\u0000notice\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Notice\\";s:2:\\"id\\";i:6;}s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 0, NULL, 1505994520, 1505994520),
(261, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":5:{s:9:\\"\\u0000*\\u0000notice\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Notice\\";s:2:\\"id\\";i:7;}s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 0, NULL, 1505994567, 1505994567),
(262, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":5:{s:9:\\"\\u0000*\\u0000notice\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Notice\\";s:2:\\"id\\";i:10;}s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 0, NULL, 1506008316, 1506008316),
(263, 'default', '{"displayName":"App\\\\Jobs\\\\SendMessage","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendMessage","command":"O:20:\\"App\\\\Jobs\\\\SendMessage\\":5:{s:9:\\"\\u0000*\\u0000notice\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Notice\\";s:2:\\"id\\";i:11;}s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 0, NULL, 1506056408, 1506056408);

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_06_25_143524_create_posts_table', 1),
(4, '2017_07_07_004403_create_comments_table', 1),
(5, '2017_07_09_184319_create_zans_table', 1),
(6, '2017_07_10_232201_create_fans_table', 1),
(7, '2017_08_30_223857_create_topics_table', 1),
(8, '2017_08_30_225340_create_post_topic_table', 1),
(9, '2017_09_01_145020_create_admin_users_table', 1),
(10, '2017_09_06_163553_alter_posts_table', 1),
(11, '2017_09_07_140906_create_permission_and_roles', 1),
(12, '2017_09_15_180323_create_notice_table', 2),
(13, '2017_09_15_202823_create_jobs_table', 3),
(14, '2017_09_28_170528_alter_users_table', 4);

-- --------------------------------------------------------

--
-- 表的结构 `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `notices`
--

INSERT INTO `notices` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, '这是测试通知', '这是测试通知 这是测试通知 这是测试通知', '2017-09-15 11:41:58', '2017-09-15 11:41:58'),
(2, '国庆节快乐', '欢迎大家登录简书  祝大家国庆节快乐', '2017-09-15 12:48:35', '2017-09-15 12:48:35'),
(3, 'hello world', '这是一条测试数据哦', '2017-09-21 08:05:38', '2017-09-21 08:05:38'),
(4, 'a\'s\'DA\'s\'d', 'SD发DFSSDF', '2017-09-21 08:53:19', '2017-09-21 08:53:19'),
(5, 'xVZXVVvvvvvvvvvvvvvvvvvvvv', 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', '2017-09-21 09:33:42', '2017-09-21 09:33:42'),
(6, 'eahhhhhhhhhhhhhhhhhhhhhhhh', 'hhahdffffffffffffffffffff', '2017-09-21 11:48:40', '2017-09-21 11:48:40'),
(7, '1111111111111111111111111', '11111111111111111111111111111111111', '2017-09-21 11:49:27', '2017-09-21 11:49:27'),
(8, '1111111111111111111111111111111111', '1111111111111111111111111111111111111111111111111111111', '2017-09-21 15:28:45', '2017-09-21 15:28:45'),
(9, '1111111111111111111111111111111111', '1111111111111111111111111111111111111111111111111111111', '2017-09-21 15:30:25', '2017-09-21 15:30:25'),
(10, '1111111111111111111111111111111111', '1111111111111111111111111111111111111111111111111111111', '2017-09-21 15:38:35', '2017-09-21 15:38:35'),
(11, '123131231231231231231231231', '1313131313131313', '2017-09-22 05:00:08', '2017-09-22 05:00:08');

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
(1, '学IT技术有前途吗？刚上大学有学习IT技术的必要吗？', '<p>IT行业是目前我国最火爆的热门岗位，发展前景十分的明朗，在“互联网+”持续升温的现在，很多人都想投身IT行业，学习高端IT技术，转变为IT工程师。作为高端IT技术咨询师，总是会被学生咨询这些问题：学习IT技术有前途吗？以后行业的前景好吗？刚上大学有学习IT技术的必要吗？</p><p><br></p>', 1, '2017-09-09 08:18:01', '2017-10-09 03:32:34', 1),
(2, '云计算时代的 IT 运维转型升级之路', '<p>1.云计算时代，IT运维迎来转型升级</p><p>传统 IT 运维问题日显， IT 运维转型是必然趋势;云计算时代的 IT 运维转型升级向云运维方向发展，包含两方面内涵：运维技术的云化和对云的运维;市场对高效运维的需求和云计算、大数据等技术手段是云运维得以兴起的根本原因。</p><p>2.从产品和技术趋势深度探析 IT 运维产业特征</p><p>智能化、自动化、可视化是运维发展的三大趋向； DOCKER 技术或将给运维带来大变革；在 IT 运维转型大势驱动下，</p><p>BSM(Business ServiceManagement， 业务服务管理)、 APM（应用性能管理） 将顺势崛起； 基于大数据分析是 IT</p><p>运维向高级发展的重要路径。</p><p>3.IT运维转型升级机会大，细分领域将涌现龙头企业</p><p>1）从市场看， 云计算蓬勃发展，市场规模增速快， 云计算在中国的落地和繁荣将成为云运维持续发展的核心动力； 从政策层面看，</p><p>国家政策鼓励发展“互联网+”、云计算、大数据、物联网，提高各行业信息化建设水平，促进运维需求增长，推动传统运维向云运维转型，</p><p>同时国家建设绿色数据中心的要求将推进智能化运维的发展，为运维转型升级提供动力。</p><p>2） 细分领域专业化程度尚低， 产业与资本仍在酝酿。</p><p>3）国外企业如 IBM、 BWC、 HP 等企业在云运维领域的产品和布局为国内运维企业</p><p>发展提供了借鉴。</p><p>4）国内企业如华胜天成、 广通软件、 北塔软件、银信科技和新华三等纷纷推出云运维相关产品。</p><p>4.三重逻辑把握 IT 运维转型升级带来的机遇</p><p>1）从细分领域看，需抓好 IT 运维新领域应用大机会，我们重点看好APM、 BSM 等新领域。</p><p>2）从运维技术看，把握新技术运用方可引领未来，我们优选新兴的 Docker 技术、 基于大数据的运维管理、 SaaS 化运维等技术这几大技术方向。</p><p>3）综合地来看，</p><p>在云运维领域，在技术有领先优势、在细分领域深耕细作、对客户资源有较强把控力的企业，能够更好地服务于客户，在同质化竞争中打出差异化路线、并且以高的用户黏性和高的用户续费率源源不断地为公司创造价值并且产生现金流。因此，这部分拥有综合优势的企业将更有希望在</p><p>IT 运维转型升级领域中脱颖而出。</p><p>一、云计算时代， IT 运维迎来转型升级</p><p>1.1传统 IT 运维问题日显， IT 运维转型是必然趋势</p><p>IT 运维是信息化时代企业不可或缺的一环。 IT 运维管理,是指单位 IT 部门采用相关的方法、手段、技术、制度、流程和文档等,对 IT</p><p>运行环境(如软硬件环境、网络环境等)、 IT 业务系统和 IT 运维人员进行的综合管理。配备专职 IT 运维人员的企业会自行进行 IT</p><p>运维管理；而其余企业选择将 IT 部门的职能全部或部分外包给专业的第三方 IT 外包公司管理，集中精力发展自身的核心业务。</p><p>自信息化普及以来， IT 运维对企业的发展而言不可或缺，因其能保障企业“网络不断、系统不瘫、数据不丢”，在保证各类 IT 基础设施稳定运行的基础上对关键业务提供良好支撑，使企业的核心业务能够实现不间断、高质量的运行，最终保证并提升公司的运营效益。36大数据（http://www.36dsj.com/）</p><p><br><br></p><p>作者：运维行业研究家</p><p><br></p><p>链接：http://www.jianshu.com/p/8d84fed7a87b</p><p><br></p><p>來源：简书</p><p><br></p><p>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br></p>', 1, '2017-09-09 08:18:35', '2017-10-09 03:37:26', 1),
(3, '既然不快乐，不如一路向西去旅行', '<p>说起自己的圈子，我经常被朋友们认为他们认识的人里面是最懂民谣的人。</p><p>我几乎会唱我喜欢的所有民谣，当然包括郝云的《去大理》。今天的标题，也恰好出自这首歌。</p><p>记得有一次去自驾，我在对讲机里把这首歌唱完了，听说把另外一俩车上的人唱哭了。</p><p>见过我唱民谣的朋友都说我唱民谣的时候是最认真，最深情的时候。</p><p>如果有缘的话，我可以唱给你听。</p><p>不过，我今天不是来谈民谣，也不会唱歌给你听，而是讲讲我踏遍千山万水，为你推荐的西部旅行。</p><p><br><br></p><p>作者：有备而来的路人甲</p><p><br></p><p>链接：http://www.jianshu.com/p/7ff4a46a075e</p><p><br></p><p>來源：简书</p><p><br></p><p>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br></p>', 2, '2017-09-09 08:30:23', '2017-10-09 03:57:51', 1),
(4, '毕业第四年，我一个人在大连生活', '<p>中元节，加班，归家时天已蒙蒙黑。</p><p>等过了三辆公交车，一辆也没挤上去，纠结良久，最后还是决定步行回家。没走几步胃痛的不行，在路边买了个烤冷面，边走边吃。</p><p>海大是我回家的必经之路。学生开学了，穿着军训服成群的从我身边穿过，看着他们稚嫩的脸颊，不由得伤感。我站到小路的一侧，让出足够的空间给他们，嘴角也许还残留着油渍。借着路灯微弱的光，我不知道他们会用何样的眼光打量我这个逆行者，或者压根没有注意到我的存在，唯一值得庆幸的是我有夜盲症，根本也看不清对方的表情。</p><p>脚步声渐远，说笑声也随之远去，心里难免酸酸的，拾起沉重的失落继续前行。</p><p>曾经，和他们一样的年纪，我的身旁也总有三五好友围绕，一起打闹玩笑，肆意张扬毫不在乎旁人眼光。如今回想， 那些往事就跟城里的星光一样，纵使知道它存在，也根本望不见。无言变成了陪伴，耳机才是最忠实的伙伴，闯先生用他异常磁性的声音发问，“你在哪座城市，留下过怎样的故事，又怎样轻轻说声再见……”冬去春来，夏走秋至，一年又一年！</p><p>一开始的时候，很不习惯一个人吃饭，一个人逛街，亦或是一个人看电影，怕被熟人看见，怕孤独感被人同情，被人放大。后来才发现，城市那么大，哪有那么多的缘分让你遇见。三年，换过三份工作，真正熟悉的不到50人，剩余认识的人只有在特定的环境下才可以称得上是认识，但大连市一共有700万人口，所有的熟悉感融入700万的洪流中都会变得陌生又渺小。</p><p>渐渐地，开始习惯一个人。习惯一个人吃饭，一个人逛街，一个人看电影……果真，从来没遇见过熟人。</p><p><br><br></p><p>作者：造梦者独慕溪</p><p><br></p><p>链接：http://www.jianshu.com/p/f9d78088610d</p><p><br></p><p>來源：简书</p><p><br></p><p>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br></p>', 3, '2017-09-09 08:44:46', '2017-10-09 03:58:01', 1),
(5, '在AI面前，自媒体没那么好写了', '<p>毫不客气的说，用不了几年，我们看到的微博、公众号、头条文章将死掉至少90%的创作者。当然，以某些文章的垃圾程度，这也不见得是件有多可惜的事。</p><p>对于文字创作者，这几年赶上了人类历史上几乎最好的内容创作时代：创作成本低；全社会都在鼓励并帮助你打开传播途径；读者口味不挑，写出来的东西只要达到及格线，比如文字通顺、逻辑清晰，有点个人特色，作者写个几年都能拥有自己比较稳定的读者群体。</p><p>不过这种温床的环境很快就会打破。因为能自己写文章的AI时代已经来了。</p><p>你可以尝试去搜索“原创文章生成器”，只要朋友圈爆一篇热点10W+文章，它能通过改变句子结构、替换用词，分分钟生成另一篇读上去几乎雷同，但偏又能逃过机器审查的“原创认定”文章。</p><p>尽管这些文章现在读起来味同嚼蜡，但相信我，真的，用不了多久，快速更新迭代的“爆文一键生成器”就会出现。输入主题、关键内容、文章风格等关键参数，一键点“OK”， 千字文瞬间生成。</p><p>现在很多写作训练课会教你“如何在60分钟写作”，它的核心是教会“套路”，按照某些规则来写作。不好意思，在AI面前，</p><p><br><br></p><p>作者：赵苏七sukie</p><p><br></p><p>链接：http://www.jianshu.com/p/4c062b66a704</p><p><br></p><p>來源：简书</p><p><br></p><p>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br></p>', 4, '2017-09-09 08:47:19', '2017-10-09 03:58:03', 1),
(6, '112121edasfdsdasdas', '<p>asdasdasdaasdasdasdasdas</p>', 1, '2017-10-09 04:08:39', '2017-10-09 04:08:51', -1),
(7, '123123qsaedasdasd', '<p>adasdasdqqq</p>', 1, '2017-10-09 12:56:26', '2017-10-09 12:56:34', -1),
(10, 'dfgsdfgdfsgdf', '<p>gsfdjhngchkm&nbsp; vbbnxfgjhndfxgh<br></p>', 1, '2017-11-24 07:14:46', '2017-11-24 07:14:46', 0);

-- --------------------------------------------------------

--
-- 表的结构 `post_topics`
--

CREATE TABLE `post_topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `post_topics`
--

INSERT INTO `post_topics` (`id`, `post_id`, `topic_id`, `created_at`, `updated_at`) VALUES
(1, 3, 2, '2017-09-21 09:49:08', '2017-09-21 09:49:08');

-- --------------------------------------------------------

--
-- 表的结构 `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `topics`
--

INSERT INTO `topics` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, '旅游', '2017-09-15 09:27:15', '2017-09-15 09:27:15');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, '李成', '1150400220@qq.com', '$2y$10$wzFIymarmeGpOxYo91xKA.o7Ed38zf5jcoAyjDX8e7Gyq7OyWRfvK', 'RCyO3IaRJYKia3XH11GUd6FXFXZ3Z2X9NGXQf4aDpbiMoTNS9799czus8Ydn', '2017-09-09 08:13:42', '2017-12-01 09:05:34', '/storage/1/vSDHfU1Zvc2n9CufQrQjIvOkc9EwgLz8AEWkGrC0.jpeg'),
(2, '凌海森', '1111111111@qq.com', '$2y$10$hYmOmvu/9uAlp16K8FN0OuAlokmU1yETso6T3xee2WmzmJeUuGEve', 'XAC7JQ9E3LHJL5tJvIpT7a7rMyQKKl4GgHDqLnqvkydKwD9fVZPEmcQZ73LU', '2017-09-09 08:20:00', '2017-09-09 08:20:00', ''),
(3, '廖宇', '2222222222@qq.com', '$2y$10$eBfJxbtj4Xskh91OrKH78OyijpIAJYzN5n8xJHfvVpeStab.QIzt.', 'pmQy4h6MN6sTcb1zbADJsNtoEmWfUNUQ97gz9fRPd2hd82nZfHIozVIoG2va', '2017-09-09 08:42:10', '2017-09-09 08:42:10', ''),
(4, '兰博', '3333333333@qq.com', '$2y$10$.xOWYNetViF1Pyv9arzSz./gCg94MoTwovOq.DXgPZswNtCa5n2L.', '3gkatHDsmdJShRZGCiijQdd2QYC3DQ6fLkv1sgETPyxMvjOCxtoKo82B8r89', '2017-09-09 08:46:01', '2017-10-09 04:54:52', '/storage/4/hIgv1Pc1M6DNCQlKRgUTPmYB9Rnch4GjtsHC69SG.jpeg');

-- --------------------------------------------------------

--
-- 表的结构 `user_notice`
--

CREATE TABLE `user_notice` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notice_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `user_notice`
--

INSERT INTO `user_notice` (`id`, `user_id`, `notice_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zans`
--

CREATE TABLE `zans` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `zans`
--

INSERT INTO `zans` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2017-09-09 08:20:17', '2017-09-09 08:20:17'),
(2, 3, 3, '2017-09-09 08:42:25', '2017-09-09 08:42:25'),
(3, 3, 4, '2017-09-09 08:45:18', '2017-09-09 08:45:18'),
(6, 4, 5, '2017-10-09 07:34:55', '2017-10-09 07:34:55'),
(7, 1, 2, '2017-10-31 05:06:13', '2017-10-31 05:06:13'),
(10, 1, 8, '2017-11-20 07:14:02', '2017-11-20 07:14:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_permissions_role`
--
ALTER TABLE `admin_permissions_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_role_user`
--
ALTER TABLE `admin_role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fans`
--
ALTER TABLE `fans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_topics`
--
ALTER TABLE `post_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notice`
--
ALTER TABLE `user_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zans`
--
ALTER TABLE `zans`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `admin_permissions_role`
--
ALTER TABLE `admin_permissions_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `admin_role_user`
--
ALTER TABLE `admin_role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `fans`
--
ALTER TABLE `fans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;
--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `post_topics`
--
ALTER TABLE `post_topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `user_notice`
--
ALTER TABLE `user_notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `zans`
--
ALTER TABLE `zans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
