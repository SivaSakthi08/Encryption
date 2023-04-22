-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 05, 2021 at 10:47 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mas_encryption`
--
CREATE DATABASE IF NOT EXISTS `mas_encryption` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mas_encryption`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add client_reg', 7, 'add_client_reg'),
(20, 'Can change client_reg', 7, 'change_client_reg'),
(21, 'Can delete client_reg', 7, 'delete_client_reg'),
(22, 'Can add customer_reg', 8, 'add_customer_reg'),
(23, 'Can change customer_reg', 8, 'change_customer_reg'),
(24, 'Can delete customer_reg', 8, 'delete_customer_reg'),
(25, 'Can add upload_land', 9, 'add_upload_land'),
(26, 'Can change upload_land', 9, 'change_upload_land'),
(27, 'Can delete upload_land', 9, 'delete_upload_land'),
(28, 'Can add upload_product1', 10, 'add_upload_product1'),
(29, 'Can change upload_product1', 10, 'change_upload_product1'),
(30, 'Can delete upload_product1', 10, 'delete_upload_product1'),
(31, 'Can add client_bargain', 11, 'add_client_bargain'),
(32, 'Can change client_bargain', 11, 'change_client_bargain'),
(33, 'Can delete client_bargain', 11, 'delete_client_bargain'),
(34, 'Can add customer_bargain11', 12, 'add_customer_bargain11'),
(35, 'Can change customer_bargain11', 12, 'change_customer_bargain11'),
(36, 'Can delete customer_bargain11', 12, 'delete_customer_bargain11'),
(37, 'Can add customer_payment1', 13, 'add_customer_payment1'),
(38, 'Can change customer_payment1', 13, 'change_customer_payment1'),
(39, 'Can delete customer_payment1', 13, 'delete_customer_payment1');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client_client_reg`
--

CREATE TABLE IF NOT EXISTS `client_client_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(300) NOT NULL,
  `mobile` varchar(300) NOT NULL,
  `gender` varchar(300) NOT NULL,
  `location` varchar(300) NOT NULL,
  `uname` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `client_client_reg`
--

INSERT INTO `client_client_reg` (`id`, `client_name`, `mobile`, `gender`, `location`, `uname`, `password`) VALUES
(1, 'ramya', '8967543434', 'female', 'chennai', 'ramya', 'ramya'),
(2, 'arjun', '7656565656', 'male', 'chennai', 'arjun', 'arjun'),
(3, 'deva', '8767565656', 'male', 'chennai', 'deva', 'deva'),
(4, 'aravind', '8767565656', 'male', 'chennai', 'aravind', 'aravind'),
(5, 'murugan', '9878676767', 'male', 'chennai', 'murugan', 'murugan'),
(6, 'rajan', '8978675656', 'male', 'chennai', 'rajan', 'rajan'),
(7, 'sankar', '8767564545', 'male', 'salem', 'sankar', 'sankar'),
(8, 'jeeva', '9878675656', 'male', 'coimbator', 'jeeva', 'jeeva');

-- --------------------------------------------------------

--
-- Table structure for table `client_upload_land`
--

CREATE TABLE IF NOT EXISTS `client_upload_land` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(300) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `square_feet` varchar(300) NOT NULL,
  `patta_number` varchar(300) NOT NULL,
  `district` varchar(300) NOT NULL,
  `taluk` varchar(300) NOT NULL,
  `village` varchar(300) NOT NULL,
  `enc_clientname` varchar(300) NOT NULL,
  `enc_district` varchar(300) NOT NULL,
  `enc_pattanumber` varchar(300) NOT NULL,
  `enc_squarefeet` varchar(300) NOT NULL,
  `enc_taluk` varchar(300) NOT NULL,
  `enc_village` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `client_upload_land`
--

INSERT INTO `client_upload_land` (`id`, `client_id`, `client_name`, `square_feet`, `patta_number`, `district`, `taluk`, `village`, `enc_clientname`, `enc_district`, `enc_pattanumber`, `enc_squarefeet`, `enc_taluk`, `enc_village`) VALUES
(1, '1', 'ramya', '1200', '675656', 'tirunelveli', 'tirunelveli', 'Ettankulam', 'b''gAAAAABgPcxiYJHACqcXQS3QOQYL2ShfA9YjjyW-IMTx83oEJ8cCwri68GODhfJroiHyJWUaLiMRhgfXdRFUB9KtKIid-WooSQ==''', 'b''gAAAAABgPcxing-X-WXJYwyY9xuIswyYLLDm4ZbCDV7V3XrDsTIoZkf8mxqisg7nKkmC2n5SHL0hRMo8c63ggF_2IC2WrFmKnw==''', 'b''gAAAAABgPcxivRjmDmweJ0i28Yf9Ru7gDyxe2dXd52obuNsmr3TZ_Swa7TazT4IVJ8hXI966YIfRKbYA4CZIrNKC0QgNzpS_Hw==''', 'b''gAAAAABgPcxi3Onf6eCvUYjTjD_0ws0fHrMgzell58ke78zr0NjYcl1r5VTKvqPDVLUy9hrUS1-trUS7Wiu2585xfUmx05-OaQ==''', 'b''gAAAAABgPcxiel4JjKYFoXPV0ABxeJ11CxI7tqeslwsNGQnT4tOaKZzixTy3Xsu60DdrS8d2SGA4KEZBY5W9PayGlGHMXekO8Q==''', 'b''gAAAAABgPcxinds5XSjywX1a7QdHSj6G1FAY8LuH_nPTQJAcCWu0p_0RDa7RYWMhz4TNzbL10XV1RGFFTZG3XIwVKCqjSWrurQ=='''),
(2, '6', 'rajan', '1200', '5676545', 'salem', 'salem', 'salem', 'b''gAAAAABgQgwQxL8-kCbM0q_L--skSWcxvBBSSEXKuo7SuAWXr9sSlMp7nLdboRgVkmHtX7h1yTI2MyytkAjXjW2kdW2BcrgGKA==''', 'b''gAAAAABgQgwQdh3rkb4jyTMMNKfAbW-h3XzUcbUWXblq1ZGbR7QzlpiMP1Hnsm1BhufF4669KAPr2IcC23SaSIcOUCNIoZVczg==''', 'b''gAAAAABgQgwQpkKNF-5UhVHR3x3_zsxGqQtsiINA2gppi2GG1lcKzA5OrwWJ8wUXtWaWWvC-4S360njjsj5RAIGiKz_PbvoZuQ==''', 'b''gAAAAABgQgwQxPO81-D9XCaw3MEgm6lk_Xm0dWisZfsV2bEpIYyqt7zyIbQlknnQSMZfwalfAEjtknwenqm5xKpjUtw-aWYO1A==''', 'b''gAAAAABgQgwQ5oNSh5gFqIKL1M0MoEB33ETzO6T2b0EpQkaMFGQTLQGo9s0gyX30Wg8_1XpKttHg1l5nhq7ZlmnemXTWdn1yig==''', 'b''gAAAAABgQgwQsIZD_H58H6aduy0kNi_-ogWi5YpKuK7KcmkyJnBl-eUb3Lm7iXxFTXtmPXE5DZVFD9QQuq0gZ9Es4S5UKNEP9w=='''),
(3, '7', 'sankar', '1700', '786756454545', 'salem', 'salem', 'salem', 'b''gAAAAABgQgjNdrOJCBZ726ZnNNh7Z5pSyKV6GSUhQWMKgjwA8Cqtzr1UlBGP5QOYr5MZhIQykYGPfsTvA6d-_-sU48NUFlCVuQ==''', 'b''gAAAAABgQgjNNf24VULjmfbqQrmXlReOqlE5OTE_wy9axoLUAuAy3ObL4OV5wBcYoyX8fG_gl79f2Z7NV9aMSUoOeiIFV4TzUw==''', 'b''gAAAAABgQgjNTzs4MoaOsvrZ_Z03ATpVa4mo60hArce8CyvgpCl4rv5_wS9Yxl3fX8Vfi4EfwEmN803nr3ntOyVw3NvejaVcUg==''', 'b''gAAAAABgQgjNDYrFF84e5c3R0HCEhIzFaEHR6rvDzSyktK_7zzo7CoUigkvaXkIpXOwead93gB4F_9eiIqk_QvJ5C-ORuEJUOg==''', 'b''gAAAAABgQgjNdcvsWoznZGp52n-fN-N7RzG1U4IfI0paWl093r4TPfMeaqegZKE58OFXAucq8xdw1npXpKGBVX9vGFfyfRmxWQ==''', 'b''gAAAAABgQgjNrgD0hf183zf6blfPdrE248KtC_YfnwNajRZIWEScKFIfOVxuhu5h_xNzhpNIpbmyDMGmqYOP82cWOJvgAXBN9g=='''),
(4, '8', 'jeeva', '2000', '09897867', 'coimbatore', 'coimbatore', 'kovilpalayam', 'b''gAAAAABgQgolYHkZqdG1YyVwvWtDqxrpYevfQgpgbsAnZ2Rt6G9GEswlCkdlH9BZUQUWgKlxuJqXwRiAvtSTgS9sM3bsEVJ_iA==''', 'b''gAAAAABgQgol1JlBXiWlGNdL1q-z9w9Lk-SbuACSZZw9NPlQukkvpEy4tBEwmC8Q7DNmPchi7WfP9-VStztBcPtDBXnrWZA5_w==''', 'b''gAAAAABgQgol6N28Ljd5k7IiBCHlrnTbiSe1DvCAJmi6FOdFjMwhf5HN3o5oJspXd3T3KamOP_LJ6yCQN7oWLH62_2JLTyaJKQ==''', 'b''gAAAAABgQgolrU4H1jDaF4IX0QJSOlWLaaOK9R_PheRvxMaczxW2bPJCm_7rZv62g_Sk7piTb6GRTTvkPoIm1lhjP6xpjpblxA==''', 'b''gAAAAABgQgol3hEpxHcAMLqv-cgHtpb35hPLMGLSTKQtdHzjwcHnt-P5Lr5eKz1QoAQ9mAP1-RSGPdjzJpl1yh4tON9Xx9CEwA==''', 'b''gAAAAABgQgolCzC_0y1Iyhy68oBTBFeChDpa7cSB6HcSVEnyKGYWdF4A_-leQaaJFIKHJsyR_6IzKTDwjKBIBf4PKw4dqcK2NA==''');

-- --------------------------------------------------------

--
-- Table structure for table `client_upload_product1`
--

CREATE TABLE IF NOT EXISTS `client_upload_product1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(300) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `district` varchar(300) NOT NULL,
  `rice_name` varchar(300) NOT NULL,
  `quantity` varchar(300) NOT NULL,
  `amount` varchar(300) NOT NULL,
  `enc_clientname` varchar(300) NOT NULL,
  `enc_district` varchar(300) NOT NULL,
  `enc_ricename` varchar(300) NOT NULL,
  `enc_quantity` varchar(300) NOT NULL,
  `enc_amount` varchar(300) NOT NULL,
  `product_status` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `client_upload_product1`
--

INSERT INTO `client_upload_product1` (`id`, `client_id`, `client_name`, `district`, `rice_name`, `quantity`, `amount`, `enc_clientname`, `enc_district`, `enc_ricename`, `enc_quantity`, `enc_amount`, `product_status`) VALUES
(1, '1', 'ramya', 'tirunelveli', 'Cochin Samba', '100kg', '9000', 'b''gAAAAABgPeXxLi79sin6ba9_Ds0bc9yiArAy5BW5Miwqa_qG5qMtLwHowrv1svKRlTMKZ48IrX1zVpaDZiHd4EgQP2XUs3wC2w==''', 'b''gAAAAABgPeXxtU17QNy1XfRDwJpM-MY0ljvcCtMjd-oKFijqO7_goO13NpL8mlgnebW1FoLIXub6Za08zlOVrzwTUr3ZEbPdow==''', 'b''gAAAAABgPeXx9u4u63hZEdGYrX3fPtlJOfv58Kbum1kqCqTG6jhWYjcdhL10ih5QZvHp7kas12yypOdDp4uB13lWqc5yjxu0jg==''', 'b''gAAAAABgPeXx6ctUW6nXmnn8w1xx-UYgPrN-njHc22tWxWv7yLZJlBZplPVkQzqoWX8DxezTl1IZUxt5GLm-HYYWqRqFHbdz9Q==''', 'b''gAAAAABgPeXxibJ4fWLWdICZAA8tRqaZ-VlPdSES9yTS0PoVCCfTiTa15YCKSU6G3iklLxlLKdkYyNxgW_CAUagLlJnfgngFbg==''', 'promote to sale'),
(2, '2', 'arjun', 'chengalpattu', 'Cochin Samba', '100kg', '9500', 'b''gAAAAABgPeaodxi9ZmGMlKl_jKcaM5bvQ7teEXBZrPk522hAiZXlwD1GnwZM4nTt1GwYCHstkxzC91JznTlAQDh2xT4ZfyYLOQ==''', 'b''gAAAAABgPeaoCwRf8pDmGpQbEj8yphDj0_IFKFYfyvVTPJEPuA9333Jpnd3cXazW1GT6whUd5L82oz9eNujxaS3BlTVUEJSqmw==''', 'b''gAAAAABgPeaoxaR2NgjxRIl1LYYJxQN_VwHGqFYdEp8fg-Yx7xd_DGK2IrRYcapUAbqomhNPXfkwWV7emP8ZIRHcX6Zo-_e-Eg==''', 'b''gAAAAABgPeao9m1j2rFdeZYVYaRHLu20XchWXfWAC9bCYMPtyZUETotQCEvAz_J2TSoZZ82ssRo8SWrT8MTBdfe_X3wHNecI3A==''', 'b''gAAAAABgPeaowXPc6tiMda3nVxql581LF8uIIP91hr2UtdzRYet74gDmm17DY3hLstckZA7o3PSfqctohrVvcYvc48SkOjrukA==''', 'promote to sale'),
(3, '3', 'deva', 'dindigul', 'Cochin Samba', '100kg', '9800', 'b''gAAAAABgP81NXSSu1jmUPCmXwabS_Yu5GYbKJY4v9kOxrG5UbxV-2xqizkuKqIT-kZugMfyXngloiulad_40aYfQ4PgGCqcwVg==''', 'b''gAAAAABgP81Oh580K3rKcLhMT1YzWnPN4hjgNH2EPeOK-9WWvpa2ZezHep75uJegHvUoELk4z_slfx2ljKLKK-e7FRgugYdhzA==''', 'b''gAAAAABgP81Oq9Ijus3-LTAZf6lfkkx2co1hkTi664568XmdasrfJozTkbBEiDq21HeeF5UvLJtvBvdoqH58Klw8KlJhQ13Dow==''', 'b''gAAAAABgP81OpiELsqyV5HWpkGixhiwmINhw0mV-ajdURIzy91TyjHAb30Dh8quMI2cRoXFHqeBbd-6KjqIHhJ0YY6udqL_KPw==''', 'b''gAAAAABgP81OLX6fyIp27sM2A5Pca-UhY8CJOvo11-UMy4A3NRfEroqdkXZ5sVT0e_iLZ9U0I-pG_HUtRqIOaI9xg1CmlqE3Sg==''', 'promote to sale'),
(4, '4', 'aravind', 'kanchipuram', 'Cochin Samba', '100kg', '1150', 'b''gAAAAABgP8-I36q3EHzQsZxSMrk6KuJ3OhxC1aTj7VhT6fqbuN42NHcz0AJzjDP2uT5LhgDTSwHk_bwK7v1nvHzIlu3oXdoYgg==''', 'b''gAAAAABgP8-Iu2AfH8lyBdljGehVWgVQX00xOLHC3G75u1n750WiXHvzJ5aECHaoJs8qQnVw09IXHv-9oyVJblT0Unzh40YDCQ==''', 'b''gAAAAABgP8-IHv5h7jZ9sDq2XJVK6hJxpXurvGvHe1Diryzugx0bsQ-_diyMb6T0zBW0q67vCHWhJa9nLY3PyeRj2MiD1ZlDDg==''', 'b''gAAAAABgP8-IebHOMGFQJuN6kWfB13EeLTs3hB5WMxeNM78MmfMLssjVP6AD0OKP2mXFDsEiQnSL7jDxYx__j1YMZa2UsWeglw==''', 'b''gAAAAABgP8-IZIoOxxgA6MqDh3_Uq6-OGsCti6t437b9ezSO2nvOq3QpridmolbGyifdv5scrk7n3vMqHZiHmtFpoTKO5l-djA==''', 'promote to sale'),
(5, '5', 'murugan', 'cuddalore', 'Cochin Samba', '100kg', '9200', 'b''gAAAAABgQLNRSrsFTf2aH6J-UnDGItZV2w-LVtCID0SgdqbwBpnmyBnDqr0tQ5rL1UWasZnHqvh7-S2KjK3__kaViMwuxaDK1A==''', 'b''gAAAAABgQLNRlehCn17F6JH8Jb-DzgoDO6ijbOj2pQmd2vYUGCd-TFihapv5reTtGO6M5P8EYeepSzGoXWIXGocMn7yU3YEtJA==''', 'b''gAAAAABgQLNRojmFHs19N81vO80TnoNWShW2vFD47rchZRNws2p-R38KUAZV-HN_bjpqmS2zWcKn-ArMhoeGtoq4BfkVLgugjw==''', 'b''gAAAAABgQLNRdVgZNMsmlgEGYQXGPQdTVGy1jIwwMBQPZYvcLaDOyamHSYYiHmSnCK8o5yxNGrhRZug8ysEjrvvbDABEG_6PLw==''', 'b''gAAAAABgQLNRgnqGaVCzk7oNxDnJn45ChyMbPnofx6r7d1JRg3FbbdwU7fCF3193b3jTiJDIfBN1tDyTVUmgJJ1ySSSxXDz4vQ==''', 'Not able to Buy'),
(6, '6', 'rajan', 'salem', 'Cochin Samba', '150kg', '11140', 'b''gAAAAABgQgwrHP4kSo7PHJ8FdwsWq_3lMpppzgrnMhhz0M5JvxQhRk_V3id0NNR_6bnOADKZrtQdccpOml2GEziAxpVXB0BwSg==''', 'b''gAAAAABgQgwrz8dh-0QfhWgqb41P1jCXm2J0gscis6Zvn07ZmwZ0n9snWELLhOldBMqSROmEwuTnsTCWj0t2uunyoAxhXHAuUA==''', 'b''gAAAAABgQgwrMgkgzeezoNvaqDc7CxaBkQfoYPRAdlhPFS9gZR6W6REB-tsW78r95L0Qz8OcKNSjeWZfpidG_2zJnSSEjGpK-g==''', 'b''gAAAAABgQgwr0a-a66AY4wEasUNVVt7Cbm5Sh3G5I8-Fk28xLwVQnpBBzLesejbMkAjznSqf7lCbraKdi5XjN-9auvZXu1tgxg==''', 'b''gAAAAABgQgwrN1eNwLasFYhdVT1BCrnb2rFAipxZBVGc5SNwCyU9DFzkS_uz1VfLrk-wLQf2HyE3GsoLrW5y5UbcF4rmH-7kNA==''', 'Not able to Buy'),
(7, '7', 'sankar', 'salem', 'Cochin Samba', '200kg', '20000', 'b''gAAAAABgQgjiZdI22JI05mRIBq7W_MT7OlLjQpJN4ZnPin8kcv1AIkdYo8Ydx5AGGr3U69viSXjnoxdjsT9XZuBRJjDrsbpI_g==''', 'b''gAAAAABgQgjiIrInmuL-N0aPo6BA1T6VlKXodUByIJMpeT0oAWuVW6uIER2KP3J8A52iZ9eH56A2KyifHMNRZS5K5YyzQwFZcg==''', 'b''gAAAAABgQgjilISuQnJeNcvrP4Bw03PsfsyXYMwfAPAfUeTeMDv0rn7LPC7EBGtLo-apOarpwzP24eD20iPTq8Wkuw2nQvSZ1g==''', 'b''gAAAAABgQgjiYi1BoSMoggDYVYI-FbtZhdf_my-K6-mEvwMFiVwyXXq4Db49ngHly6KzgDV6Dhif7TnEiskuKram_CcVhAAtFQ==''', 'b''gAAAAABgQgjixLGM-_pPYmpf7S2b1D0SIXUrWKpLK6XfitXScDPI4HTR-qD0AIhwOU_--_SVXNSh9BzfGfWO1oVdW-Y0Ssn5OA==''', 'pending'),
(8, '8', 'jeeva', 'coimbatore', 'Cochin Samba', '200kg', '19000', 'b''gAAAAABgQgo36CuyHmYPW_wa1SzLfoSvCiigeg_I3rya-sOrwvC7YdVwSVdpuZC94I3iXaqfpXdXkALQ9K5K-Qiy603WguyxtA==''', 'b''gAAAAABgQgo3BNVHVHQ6uyXNW03ClG-njyAtqcRp7OcPj3G5ctgP7mAHu7cob5g5vH9vKYCV2LewWfH2LJVhthds_rUd32MOpw==''', 'b''gAAAAABgQgo3kbOdGbVyQ9iNB55Y4h7qUJLKSEgeyVkU6qGRi2ch-7cGLQnlvsJgfwdHtCUiLMLWHlJcFt_U1FO9OKHfbE4zfQ==''', 'b''gAAAAABgQgo3Cr6tvGSJGWEzb0NbfzYDFAOX9YiCUQj3ysa_PjjnC-TGOkBuL6QocgBk_w7sjDOXzIueNV7G86ENbTlUkYtq5g==''', 'b''gAAAAABgQgo3FMPZub5i7Uodj5JGUmnWlS74neqbBbXeN9-C9-6fNEZx94c7b476vXZXiOA0EOtMDIodc8Tij0p192DbI-A92A==''', 'Not able to Buy');

-- --------------------------------------------------------

--
-- Table structure for table `customer_customer_bargain11`
--

CREATE TABLE IF NOT EXISTS `customer_customer_bargain11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(300) NOT NULL,
  `client_id` varchar(300) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `enc_clientname` varchar(300) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `district` varchar(300) NOT NULL,
  `quantity` varchar(300) NOT NULL,
  `originalamount` varchar(300) NOT NULL,
  `fixedamount` varchar(300) NOT NULL,
  `adminstatus1` varchar(300) NOT NULL,
  `customerstatus1` varchar(300) NOT NULL,
  `cutsomerid` varchar(300) NOT NULL,
  `cutsomername` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer_customer_bargain11`
--

INSERT INTO `customer_customer_bargain11` (`id`, `pid`, `client_id`, `client_name`, `enc_clientname`, `pname`, `district`, `quantity`, `originalamount`, `fixedamount`, `adminstatus1`, `customerstatus1`, `cutsomerid`, `cutsomername`) VALUES
(3, '5', '5', 'murugan', 'b''gAAAAABgQLNRSrsFTf2aH6J-UnDGItZV2w-LVtCID0SgdqbwBpnmyBnDqr0tQ5rL1UWasZnHqvh7-S2KjK3__kaViMwuxaDK1A==''', 'Cochin Samba', 'cuddalore', '100kg', '9200', '9200', 'accept', 'accept', '1', 'bhuvana'),
(5, '1', '1', 'ramya', 'b''gAAAAABgPeXxLi79sin6ba9_Ds0bc9yiArAy5BW5Miwqa_qG5qMtLwHowrv1svKRlTMKZ48IrX1zVpaDZiHd4EgQP2XUs3wC2w==''', 'Cochin Samba', 'tirunelveli', '100kg', '9000', '8900', 'accept', 'accept', '1', 'bhuvana'),
(6, '6', '6', 'rajan', 'b''gAAAAABgQgwrHP4kSo7PHJ8FdwsWq_3lMpppzgrnMhhz0M5JvxQhRk_V3id0NNR_6bnOADKZrtQdccpOml2GEziAxpVXB0BwSg==''', 'Cochin Samba', 'salem', '150kg', '11140', '11140', 'accept', 'accept', '2', 'nandhu'),
(7, '8', '8', 'jeeva', 'b''gAAAAABgQgo36CuyHmYPW_wa1SzLfoSvCiigeg_I3rya-sOrwvC7YdVwSVdpuZC94I3iXaqfpXdXkALQ9K5K-Qiy603WguyxtA==''', 'Cochin Samba', 'coimbatore', '200kg', '19000', '19000', 'accept', 'accept', '3', 'saravana');

-- --------------------------------------------------------

--
-- Table structure for table `customer_customer_payment1`
--

CREATE TABLE IF NOT EXISTS `customer_customer_payment1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(300) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `cname` varchar(300) NOT NULL,
  `district` varchar(300) NOT NULL,
  `quantity` varchar(300) NOT NULL,
  `amount` varchar(300) NOT NULL,
  `cardno` varchar(300) NOT NULL,
  `cvv` varchar(300) NOT NULL,
  `holder_name` varchar(300) NOT NULL,
  `validity` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_customer_payment1`
--

INSERT INTO `customer_customer_payment1` (`id`, `pid`, `pname`, `cname`, `district`, `quantity`, `amount`, `cardno`, `cvv`, `holder_name`, `validity`) VALUES
(1, '5', 'bhuvana', 'Cochin Samba', 'cuddalore', '100kg', '9200', '786756565656', '676', 'bhuvana', '12-09-2022'),
(2, '6', 'nandhu', 'Cochin Samba', 'salem', '150kg', '11140', '897867677', '765', 'nandhu', '06-10-2022'),
(3, '8', 'saravana', 'Cochin Samba', 'coimbatore', '200kg', '19000', '76564534343434341', '876', 'saravana', '23-09-2023');

-- --------------------------------------------------------

--
-- Table structure for table `customer_customer_reg`
--

CREATE TABLE IF NOT EXISTS `customer_customer_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(300) NOT NULL,
  `mobile` varchar(300) NOT NULL,
  `gender` varchar(300) NOT NULL,
  `location` varchar(300) NOT NULL,
  `uname` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_customer_reg`
--

INSERT INTO `customer_customer_reg` (`id`, `customer_name`, `mobile`, `gender`, `location`, `uname`, `password`) VALUES
(1, 'bhuvana', '8767565656', 'female', 'chennai', 'bhuvana', 'bhuvana'),
(2, 'nandhu', '8756454545', 'male', 'salem', 'nandhu', 'nandhu'),
(3, 'saravana', '8765343434', 'male', 'coimbatore', 'saravana', 'saravana');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'client', 'client_reg'),
(9, 'client', 'upload_land'),
(10, 'client', 'upload_product1'),
(5, 'contenttypes', 'contenttype'),
(12, 'customer', 'customer_bargain11'),
(13, 'customer', 'customer_payment1'),
(8, 'customer', 'customer_reg'),
(11, 'projectadmin', 'client_bargain'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-03-01 12:46:44.341005'),
(2, 'auth', '0001_initial', '2021-03-01 12:47:03.357438'),
(3, 'admin', '0001_initial', '2021-03-01 12:47:07.475846'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-03-01 12:47:07.585046'),
(5, 'contenttypes', '0002_remove_content_type_name', '2021-03-01 12:47:10.097728'),
(6, 'auth', '0002_alter_permission_name_max_length', '2021-03-01 12:47:13.631930'),
(7, 'auth', '0003_alter_user_email_max_length', '2021-03-01 12:47:17.855172'),
(8, 'auth', '0004_alter_user_username_opts', '2021-03-01 12:47:18.082185'),
(9, 'auth', '0005_alter_user_last_login_null', '2021-03-01 12:47:20.085299'),
(10, 'auth', '0006_require_contenttypes_0002', '2021-03-01 12:47:20.409318'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2021-03-01 12:47:20.553326'),
(12, 'auth', '0008_alter_user_username_max_length', '2021-03-01 12:47:24.004523'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2021-03-01 12:47:27.340714'),
(14, 'client', '0001_initial', '2021-03-01 12:47:28.171762'),
(15, 'customer', '0001_initial', '2021-03-01 12:47:29.337829'),
(16, 'sessions', '0001_initial', '2021-03-01 12:47:32.640017'),
(17, 'client', '0002_upload_land', '2021-03-01 17:10:20.018264'),
(18, 'client', '0003_auto_20210302_1034', '2021-03-02 05:05:07.206894'),
(19, 'client', '0004_remove_upload_land_enc_clientid', '2021-03-02 05:11:42.993635'),
(20, 'client', '0005_upload_product1', '2021-03-02 07:10:29.204104'),
(21, 'projectadmin', '0001_initial', '2021-03-02 11:24:55.650306'),
(22, 'projectadmin', '0002_auto_20210302_1742', '2021-03-02 12:12:34.995314'),
(23, 'projectadmin', '0003_auto_20210303_1914', '2021-03-03 13:45:13.592688'),
(24, 'client', '0006_upload_product1_product_status', '2021-03-04 10:14:51.945706'),
(25, 'customer', '0002_customer_bargain11', '2021-03-04 10:39:23.022005'),
(26, 'customer', '0003_auto_20210304_1611', '2021-03-04 10:41:50.084709'),
(27, 'customer', '0004_auto_20210304_1723', '2021-03-04 11:54:28.295525'),
(28, 'customer', '0005_customer_payment1', '2021-03-05 06:57:36.014027');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('clo41duq89ea3dt5ga0tckun1yedj1vc', 'ZGYwZTYzMzc2ZThhZGQyOTlmZTliNzU4MmYxZWNhNDkyNWE1YThhNDp7ImNsaWVudF9pZCI6OCwiY2xpZW50X25hbWUiOiJqZWV2YSIsImN1c3RvbWVyX2lkIjozLCJjdXN0b21lcl9uYW1lIjoic2FyYXZhbmEiLCJ1bmlxdWVpZCI6OCwidW5pZDExIjoxMCwiZmluYWxfdW5pZCI6MTAsInBpZDExIjo4LCJjZmluYWxfdW5pZCI6NywidW5yZXN1bHRpZDEiOjd9', '2021-03-19 10:44:06.108365');

-- --------------------------------------------------------

--
-- Table structure for table `projectadmin_client_bargain`
--

CREATE TABLE IF NOT EXISTS `projectadmin_client_bargain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniid` varchar(300) NOT NULL,
  `client_id` varchar(300) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `enc_clientname` varchar(300) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `district` varchar(300) NOT NULL,
  `quantity` varchar(300) NOT NULL,
  `fixedamount` varchar(300) NOT NULL,
  `adminstatus1` varchar(300) NOT NULL,
  `originalamount` varchar(300) NOT NULL,
  `clientstatus1` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `projectadmin_client_bargain`
--

INSERT INTO `projectadmin_client_bargain` (`id`, `uniid`, `client_id`, `client_name`, `enc_clientname`, `pname`, `district`, `quantity`, `fixedamount`, `adminstatus1`, `originalamount`, `clientstatus1`) VALUES
(3, '1', '1', 'ramya', 'b''gAAAAABgPeXxLi79sin6ba9_Ds0bc9yiArAy5BW5Miwqa_qG5qMtLwHowrv1svKRlTMKZ48IrX1zVpaDZiHd4EgQP2XUs3wC2w==''', 'Cochin Samba', 'tirunelveli', '100kg', '9000', 'accept', '9000', 'accept'),
(4, '2', '2', 'arjun', 'b''gAAAAABgPeaodxi9ZmGMlKl_jKcaM5bvQ7teEXBZrPk522hAiZXlwD1GnwZM4nTt1GwYCHstkxzC91JznTlAQDh2xT4ZfyYLOQ==''', 'Cochin Samba', 'chengalpattu', '100kg', '9500', 'accept', '10000', 'accept'),
(5, '3', '3', 'deva', 'b''gAAAAABgP81NXSSu1jmUPCmXwabS_Yu5GYbKJY4v9kOxrG5UbxV-2xqizkuKqIT-kZugMfyXngloiulad_40aYfQ4PgGCqcwVg==''', 'Cochin Samba', 'dindigul', '100kg', '9800', 'pending', '11000', 'accept'),
(6, '4', '4', 'aravind', 'b''gAAAAABgP8-I36q3EHzQsZxSMrk6KuJ3OhxC1aTj7VhT6fqbuN42NHcz0AJzjDP2uT5LhgDTSwHk_bwK7v1nvHzIlu3oXdoYgg==''', 'Cochin Samba', 'kanchipuram', '100kg', '1150', 'accept', '1200', 'accept'),
(7, '5', '5', 'murugan', 'b''gAAAAABgQLNRSrsFTf2aH6J-UnDGItZV2w-LVtCID0SgdqbwBpnmyBnDqr0tQ5rL1UWasZnHqvh7-S2KjK3__kaViMwuxaDK1A==''', 'Cochin Samba', 'cuddalore', '100kg', '9200', 'accept', '9500', 'accept'),
(8, '6', '6', 'rajan', 'b''gAAAAABgQgwrHP4kSo7PHJ8FdwsWq_3lMpppzgrnMhhz0M5JvxQhRk_V3id0NNR_6bnOADKZrtQdccpOml2GEziAxpVXB0BwSg==''', 'Cochin Samba', 'salem', '150kg', '11140', 'accept', '12000', 'accept'),
(9, '7', '7', 'sankar', 'b''gAAAAABgQgjiZdI22JI05mRIBq7W_MT7OlLjQpJN4ZnPin8kcv1AIkdYo8Ydx5AGGr3U69viSXjnoxdjsT9XZuBRJjDrsbpI_g==''', 'Cochin Samba', 'salem', '200kg', '19000', 'accept', '20000', 'pending'),
(10, '8', '8', 'jeeva', 'b''gAAAAABgQgo36CuyHmYPW_wa1SzLfoSvCiigeg_I3rya-sOrwvC7YdVwSVdpuZC94I3iXaqfpXdXkALQ9K5K-Qiy603WguyxtA==''', 'Cochin Samba', 'coimbatore', '200kg', '19000', 'accept', '20000', 'accept');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
