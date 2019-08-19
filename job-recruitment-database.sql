-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2017 at 08:37 PM
-- Server version: 5.7.9-log
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- -----------------------------------------------------
-- Schema inventory
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `job-recruitment` ;

-- -----------------------------------------------------
-- Schema inventory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `job-recruitment` DEFAULT CHARACTER SET utf8 ;
USE `job-recruitment` ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `job-recruitment`.`posts`;
CREATE TABLE IF NOT EXISTS `job-recruitment`.`posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT null,
  `body` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Forever young by Jayz and Hudson.', '  This is the content of the post of forever young by Jayz and Hudson. This is the content of the post of forever young by Jayz and Hudson. This is the content of the post of forever young by Jayz and Hudson. This is the content of the post of forever young by Jayz and Hudson. This is the content of the post of forever young by Jayz and Hudson.', 7, '2017-07-21 13:44:49', '2017-07-21 13:44:49'),
(2, 'Mysterious Ways - Song by Punjah Kort', ' This is the description of the song by Punjah Kort, it is soul relieving and self satisfying.', 7, '2017-07-21 17:32:22', '2017-07-21 17:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `job-recruitment`.`roles`;
CREATE TABLE IF NOT EXISTS `job-recruitment`.`roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Super Admin', 'This is the super admin, has all rights!'),
(2, 'Moderator', 'Fewer permissions than admin'),
(3, 'User', 'Common user');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `job-recruitment`.`users`;
CREATE TABLE IF NOT EXISTS `job-recruitment`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT '3',
  `country_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `country_id`, `province_id`, `first_name`, `last_name`, `email`, `password`, `gender`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 204, 9, 'John', 'Doeadmin', 'defaultadmin@gmail.com', '$2y$10$/idREEAxZSQpGaAV4ugXSO5mDyyyThE/LZnpWeUovbo8nbZaBEMRq', 'male', NULL, '2017-06-29 06:39:52', NULL),
(2, 3, 204, 9, 'Jenny', 'Doeuser', 'defaultuser@gmail.com', '$2y$10$/idREEAxZSQpGaAV4ugXSO5mDyyyThE/LZnpWeUovbo8nbZaBEMRq', 'female', '0802222', '2017-06-29 06:39:52', '2017-06-29 06:39:52');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

DROP TABLE IF EXISTS `job-recruitment`.`countries`;
CREATE TABLE IF NOT EXISTS `job-recruitment`.`countries` (
`id` int(11) NOT NULL auto_increment,
`code` varchar(2) NOT NULL default '',
`name` varchar(100) NOT NULL default '',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- 
-- Dumping data for table `countries`
-- 
INSERT INTO `countries` VALUES (null, 'AF', 'Afghanistan');
INSERT INTO `countries` VALUES (null, 'AL', 'Albania');
INSERT INTO `countries` VALUES (null, 'DZ', 'Algeria');
INSERT INTO `countries` VALUES (null, 'DS', 'American Samoa');
INSERT INTO `countries` VALUES (null, 'AD', 'Andorra');
INSERT INTO `countries` VALUES (null, 'AO', 'Angola');
INSERT INTO `countries` VALUES (null, 'AI', 'Anguilla');
INSERT INTO `countries` VALUES (null, 'AQ', 'Antarctica');
INSERT INTO `countries` VALUES (null, 'AG', 'Antigua and Barbuda');
INSERT INTO `countries` VALUES (null, 'AR', 'Argentina');
INSERT INTO `countries` VALUES (null, 'AM', 'Armenia');
INSERT INTO `countries` VALUES (null, 'AW', 'Aruba');
INSERT INTO `countries` VALUES (null, 'AU', 'Australia');
INSERT INTO `countries` VALUES (null, 'AT', 'Austria');
INSERT INTO `countries` VALUES (null, 'AZ', 'Azerbaijan');
INSERT INTO `countries` VALUES (null, 'BS', 'Bahamas');
INSERT INTO `countries` VALUES (null, 'BH', 'Bahrain');
INSERT INTO `countries` VALUES (null, 'BD', 'Bangladesh');
INSERT INTO `countries` VALUES (null, 'BB', 'Barbados');
INSERT INTO `countries` VALUES (null, 'BY', 'Belarus');
INSERT INTO `countries` VALUES (null, 'BE', 'Belgium');
INSERT INTO `countries` VALUES (null, 'BZ', 'Belize');
INSERT INTO `countries` VALUES (null, 'BJ', 'Benin');
INSERT INTO `countries` VALUES (null, 'BM', 'Bermuda');
INSERT INTO `countries` VALUES (null, 'BT', 'Bhutan');
INSERT INTO `countries` VALUES (null, 'BO', 'Bolivia');
INSERT INTO `countries` VALUES (null, 'BA', 'Bosnia and Herzegovina');
INSERT INTO `countries` VALUES (null, 'BW', 'Botswana');
INSERT INTO `countries` VALUES (null, 'BV', 'Bouvet Island');
INSERT INTO `countries` VALUES (null, 'BR', 'Brazil');
INSERT INTO `countries` VALUES (null, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES (null, 'BN', 'Brunei Darussalam');
INSERT INTO `countries` VALUES (null, 'BG', 'Bulgaria');
INSERT INTO `countries` VALUES (null, 'BF', 'Burkina Faso');
INSERT INTO `countries` VALUES (null, 'BI', 'Burundi');
INSERT INTO `countries` VALUES (null, 'KH', 'Cambodia');
INSERT INTO `countries` VALUES (null, 'CM', 'Cameroon');
INSERT INTO `countries` VALUES (null, 'CA', 'Canada');
INSERT INTO `countries` VALUES (null, 'CV', 'Cape Verde');
INSERT INTO `countries` VALUES (null, 'KY', 'Cayman Islands');
INSERT INTO `countries` VALUES (null, 'CF', 'Central African Republic');
INSERT INTO `countries` VALUES (null, 'TD', 'Chad');
INSERT INTO `countries` VALUES (null, 'CL', 'Chile');
INSERT INTO `countries` VALUES (null, 'CN', 'China');
INSERT INTO `countries` VALUES (null, 'CX', 'Christmas Island');
INSERT INTO `countries` VALUES (null, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES (null, 'CO', 'Colombia');
INSERT INTO `countries` VALUES (null, 'KM', 'Comoros');
INSERT INTO `countries` VALUES (null, 'CD', 'Democratic Republic of the Congo');
INSERT INTO `countries` VALUES (null, 'CG', 'Republic of Congo');
INSERT INTO `countries` VALUES (null, 'CK', 'Cook Islands');
INSERT INTO `countries` VALUES (null, 'CR', 'Costa Rica');
INSERT INTO `countries` VALUES (null, 'HR', 'Croatia (Hrvatska)');
INSERT INTO `countries` VALUES (null, 'CU', 'Cuba');
INSERT INTO `countries` VALUES (null, 'CY', 'Cyprus');
INSERT INTO `countries` VALUES (null, 'CZ', 'Czech Republic');
INSERT INTO `countries` VALUES (null, 'DK', 'Denmark');
INSERT INTO `countries` VALUES (null, 'DJ', 'Djibouti');
INSERT INTO `countries` VALUES (null, 'DM', 'Dominica');
INSERT INTO `countries` VALUES (null, 'DO', 'Dominican Republic');
INSERT INTO `countries` VALUES (null, 'TP', 'East Timor');
INSERT INTO `countries` VALUES (null, 'EC', 'Ecuador');
INSERT INTO `countries` VALUES (null, 'EG', 'Egypt');
INSERT INTO `countries` VALUES (null, 'SV', 'El Salvador');
INSERT INTO `countries` VALUES (null, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` VALUES (null, 'ER', 'Eritrea');
INSERT INTO `countries` VALUES (null, 'EE', 'Estonia');
INSERT INTO `countries` VALUES (null, 'ET', 'Ethiopia');
INSERT INTO `countries` VALUES (null, 'FK', 'Falkland Islands (Malvinas)');
INSERT INTO `countries` VALUES (null, 'FO', 'Faroe Islands');
INSERT INTO `countries` VALUES (null, 'FJ', 'Fiji');
INSERT INTO `countries` VALUES (null, 'FI', 'Finland');
INSERT INTO `countries` VALUES (null, 'FR', 'France');
INSERT INTO `countries` VALUES (null, 'FX', 'France, Metropolitan');
INSERT INTO `countries` VALUES (null, 'GF', 'French Guiana');
INSERT INTO `countries` VALUES (null, 'PF', 'French Polynesia');
INSERT INTO `countries` VALUES (null, 'TF', 'French Southern Territories');
INSERT INTO `countries` VALUES (null, 'GA', 'Gabon');
INSERT INTO `countries` VALUES (null, 'GM', 'Gambia');
INSERT INTO `countries` VALUES (null, 'GE', 'Georgia');
INSERT INTO `countries` VALUES (null, 'DE', 'Germany');
INSERT INTO `countries` VALUES (null, 'GH', 'Ghana');
INSERT INTO `countries` VALUES (null, 'GI', 'Gibraltar');
INSERT INTO `countries` VALUES (null, 'GK', 'Guernsey');
INSERT INTO `countries` VALUES (null, 'GR', 'Greece');
INSERT INTO `countries` VALUES (null, 'GL', 'Greenland');
INSERT INTO `countries` VALUES (null, 'GD', 'Grenada');
INSERT INTO `countries` VALUES (null, 'GP', 'Guadeloupe');
INSERT INTO `countries` VALUES (null, 'GU', 'Guam');
INSERT INTO `countries` VALUES (null, 'GT', 'Guatemala');
INSERT INTO `countries` VALUES (null, 'GN', 'Guinea');
INSERT INTO `countries` VALUES (null, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` VALUES (null, 'GY', 'Guyana');
INSERT INTO `countries` VALUES (null, 'HT', 'Haiti');
INSERT INTO `countries` VALUES (null, 'HM', 'Heard and Mc Donald Islands');
INSERT INTO `countries` VALUES (null, 'HN', 'Honduras');
INSERT INTO `countries` VALUES (null, 'HK', 'Hong Kong');
INSERT INTO `countries` VALUES (null, 'HU', 'Hungary');
INSERT INTO `countries` VALUES (null, 'IS', 'Iceland');
INSERT INTO `countries` VALUES (null, 'IN', 'India');
INSERT INTO `countries` VALUES (null, 'IM', 'Isle of Man');
INSERT INTO `countries` VALUES (null, 'ID', 'Indonesia');
INSERT INTO `countries` VALUES (null, 'IR', 'Iran (Islamic Republic of)');
INSERT INTO `countries` VALUES (null, 'IQ', 'Iraq');
INSERT INTO `countries` VALUES (null, 'IE', 'Ireland');
INSERT INTO `countries` VALUES (null, 'IL', 'Israel');
INSERT INTO `countries` VALUES (null, 'IT', 'Italy');
INSERT INTO `countries` VALUES (null, 'CI', 'Ivory Coast');
INSERT INTO `countries` VALUES (null, 'JE', 'Jersey');
INSERT INTO `countries` VALUES (null, 'JM', 'Jamaica');
INSERT INTO `countries` VALUES (null, 'JP', 'Japan');
INSERT INTO `countries` VALUES (null, 'JO', 'Jordan');
INSERT INTO `countries` VALUES (null, 'KZ', 'Kazakhstan');
INSERT INTO `countries` VALUES (null, 'KE', 'Kenya');
INSERT INTO `countries` VALUES (null, 'KI', 'Kiribati');
INSERT INTO `countries` VALUES (null, 'KP', 'Korea, Democratic People''s Republic of');
INSERT INTO `countries` VALUES (null, 'KR', 'Korea, Republic of');
INSERT INTO `countries` VALUES (null, 'XK', 'Kosovo');
INSERT INTO `countries` VALUES (null, 'KW', 'Kuwait');
INSERT INTO `countries` VALUES (null, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` VALUES (null, 'LA', 'Lao People''s Democratic Republic');
INSERT INTO `countries` VALUES (null, 'LV', 'Latvia');
INSERT INTO `countries` VALUES (null, 'LB', 'Lebanon');
INSERT INTO `countries` VALUES (null, 'LS', 'Lesotho');
INSERT INTO `countries` VALUES (null, 'LR', 'Liberia');
INSERT INTO `countries` VALUES (null, 'LY', 'Libyan Arab Jamahiriya');
INSERT INTO `countries` VALUES (null, 'LI', 'Liechtenstein');
INSERT INTO `countries` VALUES (null, 'LT', 'Lithuania');
INSERT INTO `countries` VALUES (null, 'LU', 'Luxembourg');
INSERT INTO `countries` VALUES (null, 'MO', 'Macau');
INSERT INTO `countries` VALUES (null, 'MK', 'North Macedonia');
INSERT INTO `countries` VALUES (null, 'MG', 'Madagascar');
INSERT INTO `countries` VALUES (null, 'MW', 'Malawi');
INSERT INTO `countries` VALUES (null, 'MY', 'Malaysia');
INSERT INTO `countries` VALUES (null, 'MV', 'Maldives');
INSERT INTO `countries` VALUES (null, 'ML', 'Mali');
INSERT INTO `countries` VALUES (null, 'MT', 'Malta');
INSERT INTO `countries` VALUES (null, 'MH', 'Marshall Islands');
INSERT INTO `countries` VALUES (null, 'MQ', 'Martinique');
INSERT INTO `countries` VALUES (null, 'MR', 'Mauritania');
INSERT INTO `countries` VALUES (null, 'MU', 'Mauritius');
INSERT INTO `countries` VALUES (null, 'TY', 'Mayotte');
INSERT INTO `countries` VALUES (null, 'MX', 'Mexico');
INSERT INTO `countries` VALUES (null, 'FM', 'Micronesia, Federated States of');
INSERT INTO `countries` VALUES (null, 'MD', 'Moldova, Republic of');
INSERT INTO `countries` VALUES (null, 'MC', 'Monaco');
INSERT INTO `countries` VALUES (null, 'MN', 'Mongolia');
INSERT INTO `countries` VALUES (null, 'ME', 'Montenegro');
INSERT INTO `countries` VALUES (null, 'MS', 'Montserrat');
INSERT INTO `countries` VALUES (null, 'MA', 'Morocco');
INSERT INTO `countries` VALUES (null, 'MZ', 'Mozambique');
INSERT INTO `countries` VALUES (null, 'MM', 'Myanmar');
INSERT INTO `countries` VALUES (null, 'NA', 'Namibia');
INSERT INTO `countries` VALUES (null, 'NR', 'Nauru');
INSERT INTO `countries` VALUES (null, 'NP', 'Nepal');
INSERT INTO `countries` VALUES (null, 'NL', 'Netherlands');
INSERT INTO `countries` VALUES (null, 'AN', 'Netherlands Antilles');
INSERT INTO `countries` VALUES (null, 'NC', 'New Caledonia');
INSERT INTO `countries` VALUES (null, 'NZ', 'New Zealand');
INSERT INTO `countries` VALUES (null, 'NI', 'Nicaragua');
INSERT INTO `countries` VALUES (null, 'NE', 'Niger');
INSERT INTO `countries` VALUES (null, 'NG', 'Nigeria');
INSERT INTO `countries` VALUES (null, 'NU', 'Niue');
INSERT INTO `countries` VALUES (null, 'NF', 'Norfolk Island');
INSERT INTO `countries` VALUES (null, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` VALUES (null, 'NO', 'Norway');
INSERT INTO `countries` VALUES (null, 'OM', 'Oman');
INSERT INTO `countries` VALUES (null, 'PK', 'Pakistan');
INSERT INTO `countries` VALUES (null, 'PW', 'Palau');
INSERT INTO `countries` VALUES (null, 'PS', 'Palestine');
INSERT INTO `countries` VALUES (null, 'PA', 'Panama');
INSERT INTO `countries` VALUES (null, 'PG', 'Papua New Guinea');
INSERT INTO `countries` VALUES (null, 'PY', 'Paraguay');
INSERT INTO `countries` VALUES (null, 'PE', 'Peru');
INSERT INTO `countries` VALUES (null, 'PH', 'Philippines');
INSERT INTO `countries` VALUES (null, 'PN', 'Pitcairn');
INSERT INTO `countries` VALUES (null, 'PL', 'Poland');
INSERT INTO `countries` VALUES (null, 'PT', 'Portugal');
INSERT INTO `countries` VALUES (null, 'PR', 'Puerto Rico');
INSERT INTO `countries` VALUES (null, 'QA', 'Qatar');
INSERT INTO `countries` VALUES (null, 'RE', 'Reunion');
INSERT INTO `countries` VALUES (null, 'RO', 'Romania');
INSERT INTO `countries` VALUES (null, 'RU', 'Russian Federation');
INSERT INTO `countries` VALUES (null, 'RW', 'Rwanda');
INSERT INTO `countries` VALUES (null, 'KN', 'Saint Kitts and Nevis');
INSERT INTO `countries` VALUES (null, 'LC', 'Saint Lucia');
INSERT INTO `countries` VALUES (null, 'VC', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` VALUES (null, 'WS', 'Samoa');
INSERT INTO `countries` VALUES (null, 'SM', 'San Marino');
INSERT INTO `countries` VALUES (null, 'ST', 'Sao Tome and Principe');
INSERT INTO `countries` VALUES (null, 'SA', 'Saudi Arabia');
INSERT INTO `countries` VALUES (null, 'SN', 'Senegal');
INSERT INTO `countries` VALUES (null, 'RS', 'Serbia');
INSERT INTO `countries` VALUES (null, 'SC', 'Seychelles');
INSERT INTO `countries` VALUES (null, 'SL', 'Sierra Leone');
INSERT INTO `countries` VALUES (null, 'SG', 'Singapore');
INSERT INTO `countries` VALUES (null, 'SK', 'Slovakia');
INSERT INTO `countries` VALUES (null, 'SI', 'Slovenia');
INSERT INTO `countries` VALUES (null, 'SB', 'Solomon Islands');
INSERT INTO `countries` VALUES (null, 'SO', 'Somalia');
INSERT INTO `countries` VALUES (null, 'ZA', 'South Africa');
INSERT INTO `countries` VALUES (null, 'GS', 'South Georgia South Sandwich Islands');
INSERT INTO `countries` VALUES (null, 'SS', 'South Sudan');
INSERT INTO `countries` VALUES (null, 'ES', 'Spain');
INSERT INTO `countries` VALUES (null, 'LK', 'Sri Lanka');
INSERT INTO `countries` VALUES (null, 'SH', 'St. Helena');
INSERT INTO `countries` VALUES (null, 'PM', 'St. Pierre and Miquelon');
INSERT INTO `countries` VALUES (null, 'SD', 'Sudan');
INSERT INTO `countries` VALUES (null, 'SR', 'Suriname');
INSERT INTO `countries` VALUES (null, 'SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `countries` VALUES (null, 'SZ', 'Swaziland');
INSERT INTO `countries` VALUES (null, 'SE', 'Sweden');
INSERT INTO `countries` VALUES (null, 'CH', 'Switzerland');
INSERT INTO `countries` VALUES (null, 'SY', 'Syrian Arab Republic');
INSERT INTO `countries` VALUES (null, 'TW', 'Taiwan');
INSERT INTO `countries` VALUES (null, 'TJ', 'Tajikistan');
INSERT INTO `countries` VALUES (null, 'TZ', 'Tanzania, United Republic of');
INSERT INTO `countries` VALUES (null, 'TH', 'Thailand');
INSERT INTO `countries` VALUES (null, 'TG', 'Togo');
INSERT INTO `countries` VALUES (null, 'TK', 'Tokelau');
INSERT INTO `countries` VALUES (null, 'TO', 'Tonga');
INSERT INTO `countries` VALUES (null, 'TT', 'Trinidad and Tobago');
INSERT INTO `countries` VALUES (null, 'TN', 'Tunisia');
INSERT INTO `countries` VALUES (null, 'TR', 'Turkey');
INSERT INTO `countries` VALUES (null, 'TM', 'Turkmenistan');
INSERT INTO `countries` VALUES (null, 'TC', 'Turks and Caicos Islands');
INSERT INTO `countries` VALUES (null, 'TV', 'Tuvalu');
INSERT INTO `countries` VALUES (null, 'UG', 'Uganda');
INSERT INTO `countries` VALUES (null, 'UA', 'Ukraine');
INSERT INTO `countries` VALUES (null, 'AE', 'United Arab Emirates');
INSERT INTO `countries` VALUES (null, 'GB', 'United Kingdom');
INSERT INTO `countries` VALUES (null, 'US', 'United States');
INSERT INTO `countries` VALUES (null, 'UM', 'United States minor outlying islands');
INSERT INTO `countries` VALUES (null, 'UY', 'Uruguay');
INSERT INTO `countries` VALUES (null, 'UZ', 'Uzbekistan');
INSERT INTO `countries` VALUES (null, 'VU', 'Vanuatu');
INSERT INTO `countries` VALUES (null, 'VA', 'Vatican City State');
INSERT INTO `countries` VALUES (null, 'VE', 'Venezuela');
INSERT INTO `countries` VALUES (null, 'VN', 'Vietnam');
INSERT INTO `countries` VALUES (null, 'VG', 'Virgin Islands (British)');
INSERT INTO `countries` VALUES (null, 'VI', 'Virgin Islands (U.S.)');
INSERT INTO `countries` VALUES (null, 'WF', 'Wallis and Futuna Islands');
INSERT INTO `countries` VALUES (null, 'EH', 'Western Sahara');
INSERT INTO `countries` VALUES (null, 'YE', 'Yemen');
INSERT INTO `countries` VALUES (null, 'ZM', 'Zambia');
INSERT INTO `countries` VALUES (null, 'ZW', 'Zimbabwe');

DROP TABLE IF EXISTS `job-recruitment`.`provinces`;
CREATE TABLE IF NOT EXISTS `job-recruitment`.`provinces` (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  country_id INT(11) NOT NULL,
  code VARCHAR(6) NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX id_UNIQUE (id ASC),
  UNIQUE INDEX code_UNIQUE (code ASC)
) ENGINE = InnoDB;
-- 
-- Dumping data for table `provinces`
-- 
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-C', 'A Coruña');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-VI', 'Araba/Álava');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-AB', 'Albacete');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-A', 'Alicante/Alacant');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-AL', 'Almería');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-O', 'Asturias');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-AV', 'Ávila');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-BA', 'Badajoz');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-PM', 'Balears');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-B', 'Barcelona');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-BI', 'Bizkaia');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-BU', 'Burgos');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-CC', 'Cáceres');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-CA', 'Cádiz');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-S', 'Cantabria');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-CS', 'Castellón/Castelló');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-CR', 'Ciudad Real');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-CO', 'Córdoba');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-CU', 'Cuenca');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-SS', 'Gipuzkoa');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-GI', 'Girona');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-GR', 'Granada');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-GU', 'Guadalajara');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-H', 'Huelva');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-HU', 'Huesca');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-J', 'Jaén');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-LO', 'La Rioja');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-GC', 'Las Palmas');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-LE', 'León');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-L', 'Lleida');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-LU', 'Lugo');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-M', 'Madrid');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-MA', 'Málaga');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-MU', 'Murcia');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-NA', 'Navarra/Nafarro');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-OR', 'Ourense');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-P', 'Palencia');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-PO', 'Pontevedra');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-SA', 'Salamanca');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-TF', 'Santa Cruz de Tenerife');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-SG', 'Segovia');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-SE', 'Sevilla');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-SO', 'Soria');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-T', 'Tarragona');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-TE', 'Teruel');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-TO', 'Toledo');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-V', 'Valencia/València');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-VA', 'Valladolid');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-ZA', 'Zamora');
INSERT INTO provinces (id, country_id, code, name) VALUES (null, 204, 'ES-Z', 'Zaragoza');
--
-- Table structure for table `skills`
--
DROP TABLE IF EXISTS `job-recruitment`.`skills`;
CREATE TABLE `job-recruitment`.`skills` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NULL,
    `description` TEXT,
    `user_id` INT(11) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=MYISAM;