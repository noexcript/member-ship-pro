-- ================================================================
--
-- @version $Id: structure.sql 2023-05-01 11:12:05 gewa $
-- @package Membership Manager Pro Pro
-- @copyright 2020. wojoscripts.com
--
-- ================================================================
-- Database structure
-- ================================================================

--
-- Table structure for table `banlist`
--

DROP TABLE IF EXISTS `banlist`;
CREATE TABLE IF NOT EXISTS `banlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum ('IP','Email') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'IP',
  `comment` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ban_ip` (`item`)
  ) ENGINE = MyISAM AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `membership_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `coupon_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tax` decimal(13, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `totaltax` decimal(13, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `coupon` decimal(13, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `total` decimal(13, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `originalprice` decimal(13, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `totalprice` decimal(13, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `cart_id` varchar(100) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_membership` (`membership_id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `abbr` varchar(2) NOT NULL,
  `name` varchar(70) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `home` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `vat` decimal(13, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `sorting` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `abbrv` (`abbr`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `abbr`, `name`, `active`, `home`, `vat`, `sorting`)
VALUES (1, 'AF', 'Afghanistan', 1, 0, '1.25', 0),
       (2, 'AL', 'Albania', 1, 0, '0.00', 0),
       (3, 'DZ', 'Algeria', 1, 0, '0.50', 0),
       (4, 'AS', 'American Samoa', 1, 0, '0.00', 0),
       (5, 'AD', 'Andorra', 1, 0, '0.00', 0),
       (6, 'AO', 'Angola', 1, 0, '0.00', 0),
       (7, 'AI', 'Anguilla', 1, 0, '0.00', 0),
       (8, 'AQ', 'Antarctica', 1, 0, '0.00', 0),
       (9, 'AG', 'Antigua and Barbuda', 1, 0, '0.00', 0),
       (10, 'AR', 'Argentina', 1, 0, '0.00', 0),
       (11, 'AM', 'Armenia', 1, 0, '0.00', 0),
       (12, 'AW', 'Aruba', 1, 0, '0.00', 0),
       (13, 'AU', 'Australia', 1, 0, '0.00', 0),
       (14, 'AT', 'Austria', 1, 0, '0.00', 0),
       (15, 'AZ', 'Azerbaijan', 1, 0, '0.00', 0),
       (16, 'BS', 'Bahamas', 1, 0, '0.00', 0),
       (17, 'BH', 'Bahrain', 1, 0, '0.00', 0),
       (18, 'BD', 'Bangladesh', 1, 0, '0.00', 0),
       (19, 'BB', 'Barbados', 1, 0, '0.00', 0),
       (20, 'BY', 'Belarus', 1, 0, '0.00', 0),
       (21, 'BE', 'Belgium', 1, 0, '0.00', 0),
       (22, 'BZ', 'Belize', 1, 0, '0.00', 0),
       (23, 'BJ', 'Benin', 1, 0, '0.00', 0),
       (24, 'BM', 'Bermuda', 1, 0, '0.00', 0),
       (25, 'BT', 'Bhutan', 1, 0, '0.00', 0),
       (26, 'BO', 'Bolivia', 1, 0, '0.00', 0),
       (27, 'BA', 'Bosnia and Herzegowina', 1, 0, '0.00', 0),
       (28, 'BW', 'Botswana', 1, 0, '0.00', 0),
       (29, 'BV', 'Bouvet Island', 1, 0, '0.00', 0),
       (30, 'BR', 'Brazil', 1, 0, '0.00', 0),
       (31, 'IO', 'British Indian Ocean Territory', 1, 0, '0.00', 0),
       (32, 'VG', 'British Virgin Islands', 1, 0, '0.00', 0),
       (33, 'BN', 'Brunei Darussalam', 1, 0, '0.00', 0),
       (34, 'BG', 'Bulgaria', 1, 0, '0.00', 0),
       (35, 'BF', 'Burkina Faso', 1, 0, '0.00', 0),
       (36, 'BI', 'Burundi', 1, 0, '0.00', 0),
       (37, 'KH', 'Cambodia', 1, 0, '0.00', 0),
       (38, 'CM', 'Cameroon', 1, 0, '0.00', 0),
       (39, 'CA', 'Canada', 1, 1, '13.00', 1000),
       (40, 'CV', 'Cape Verde', 1, 0, '0.00', 0),
       (41, 'KY', 'Cayman Islands', 1, 0, '0.00', 0),
       (42, 'CF', 'Central African Republic', 1, 0, '0.00', 0),
       (43, 'TD', 'Chad', 1, 0, '0.00', 0),
       (44, 'CL', 'Chile', 1, 0, '0.00', 0),
       (45, 'CN', 'China', 1, 0, '0.00', 0),
       (46, 'CX', 'Christmas Island', 1, 0, '0.00', 0),
       (47, 'CC', 'Cocos (Keeling) Islands', 1, 0, '0.00', 0),
       (48, 'CO', 'Colombia', 1, 0, '0.00', 0),
       (49, 'KM', 'Comoros', 1, 0, '0.00', 0),
       (50, 'CG', 'Congo', 1, 0, '0.00', 0),
       (51, 'CK', 'Cook Islands', 1, 0, '0.00', 0),
       (52, 'CR', 'Costa Rica', 1, 0, '0.00', 0),
       (53, 'CI', 'Cote D\'ivoire', 1, 0, '0.00', 0),
       (54, 'HR', 'Croatia', 1, 0, '0.00', 0),
       (55, 'CU', 'Cuba', 1, 0, '0.00', 0),
       (56, 'CY', 'Cyprus', 1, 0, '0.00', 0),
       (57, 'CZ', 'Czech Republic', 1, 0, '0.00', 0),
       (58, 'DK', 'Denmark', 1, 0, '0.00', 0),
       (59, 'DJ', 'Djibouti', 1, 0, '0.00', 0),
       (60, 'DM', 'Dominica', 1, 0, '0.00', 0),
       (61, 'DO', 'Dominican Republic', 1, 0, '0.00', 0),
       (62, 'TP', 'East Timor', 1, 0, '0.00', 0),
       (63, 'EC', 'Ecuador', 1, 0, '0.00', 0),
       (64, 'EG', 'Egypt', 1, 0, '0.00', 0),
       (65, 'SV', 'El Salvador', 1, 0, '0.00', 0),
       (66, 'GQ', 'Equatorial Guinea', 1, 0, '0.00', 0),
       (67, 'ER', 'Eritrea', 1, 0, '0.00', 0),
       (68, 'EE', 'Estonia', 1, 0, '0.00', 0),
       (69, 'ET', 'Ethiopia', 1, 0, '0.00', 0),
       (70, 'FK', 'Falkland Islands (Malvinas)', 1, 0, '0.00', 0),
       (71, 'FO', 'Faroe Islands', 1, 0, '0.00', 0),
       (72, 'FJ', 'Fiji', 1, 0, '0.00', 0),
       (73, 'FI', 'Finland', 1, 0, '0.00', 0),
       (74, 'FR', 'France', 1, 0, '0.00', 0),
       (75, 'GF', 'French Guiana', 1, 0, '0.00', 0),
       (76, 'PF', 'French Polynesia', 1, 0, '0.00', 0),
       (77, 'TF', 'French Southern Territories', 1, 0, '0.00', 0),
       (78, 'GA', 'Gabon', 1, 0, '0.00', 0),
       (79, 'GM', 'Gambia', 1, 0, '0.00', 0),
       (80, 'GE', 'Georgia', 1, 0, '0.00', 0),
       (81, 'DE', 'Germany', 1, 0, '0.00', 0),
       (82, 'GH', 'Ghana', 1, 0, '0.00', 0),
       (83, 'GI', 'Gibraltar', 1, 0, '0.00', 0),
       (84, 'GR', 'Greece', 1, 0, '0.00', 0),
       (85, 'GL', 'Greenland', 1, 0, '0.00', 0),
       (86, 'GD', 'Grenada', 1, 0, '0.00', 0),
       (87, 'GP', 'Guadeloupe', 1, 0, '0.00', 0),
       (88, 'GU', 'Guam', 1, 0, '0.00', 0),
       (89, 'GT', 'Guatemala', 1, 0, '0.00', 0),
       (90, 'GN', 'Guinea', 1, 0, '0.00', 0),
       (91, 'GW', 'Guinea-Bissau', 1, 0, '0.00', 0),
       (92, 'GY', 'Guyana', 1, 0, '0.00', 0),
       (93, 'HT', 'Haiti', 1, 0, '0.00', 0),
       (94, 'HM', 'Heard and McDonald Islands', 1, 0, '0.00', 0),
       (95, 'HN', 'Honduras', 1, 0, '0.00', 0),
       (96, 'HK', 'Hong Kong', 1, 0, '0.00', 0),
       (97, 'HU', 'Hungary', 1, 0, '0.00', 0),
       (98, 'IS', 'Iceland', 1, 0, '0.00', 0),
       (99, 'IN', 'India', 1, 0, '0.00', 0),
       (100, 'ID', 'Indonesia', 1, 0, '0.00', 0),
       (101, 'IQ', 'Iraq', 1, 0, '0.00', 0),
       (102, 'IE', 'Ireland', 1, 0, '0.00', 0),
       (103, 'IR', 'Islamic Republic of Iran', 1, 0, '0.00', 0),
       (104, 'IL', 'Israel', 1, 0, '0.00', 0),
       (105, 'IT', 'Italy', 1, 0, '0.00', 0),
       (106, 'JM', 'Jamaica', 1, 0, '0.00', 0),
       (107, 'JP', 'Japan', 1, 0, '0.00', 0),
       (108, 'JO', 'Jordan', 1, 0, '0.00', 0),
       (109, 'KZ', 'Kazakhstan', 1, 0, '0.00', 0),
       (110, 'KE', 'Kenya', 1, 0, '0.00', 0),
       (111, 'KI', 'Kiribati', 1, 0, '0.00', 0),
       (112, 'KP', 'Korea, Dem. Peoples Rep of', 1, 0, '0.00', 0),
       (113, 'KR', 'Korea, Republic of', 1, 0, '0.00', 0),
       (114, 'KW', 'Kuwait', 1, 0, '0.00', 0),
       (115, 'KG', 'Kyrgyzstan', 1, 0, '0.00', 0),
       (116, 'LA', 'Laos', 1, 0, '0.00', 0),
       (117, 'LV', 'Latvia', 1, 0, '0.00', 0),
       (118, 'LB', 'Lebanon', 1, 0, '0.00', 0),
       (119, 'LS', 'Lesotho', 1, 0, '0.00', 0),
       (120, 'LR', 'Liberia', 1, 0, '0.00', 0),
       (121, 'LY', 'Libyan Arab Jamahiriya', 1, 0, '0.00', 0),
       (122, 'LI', 'Liechtenstein', 1, 0, '0.00', 0),
       (123, 'LT', 'Lithuania', 1, 0, '0.00', 0),
       (124, 'LU', 'Luxembourg', 1, 0, '0.00', 0),
       (125, 'MO', 'Macau', 1, 0, '0.00', 0),
       (126, 'MK', 'Macedonia', 1, 0, '0.00', 0),
       (127, 'MG', 'Madagascar', 1, 0, '0.00', 0),
       (128, 'MW', 'Malawi', 1, 0, '0.00', 0),
       (129, 'MY', 'Malaysia', 1, 0, '0.00', 0),
       (130, 'MV', 'Maldives', 1, 0, '0.00', 0),
       (131, 'ML', 'Mali', 1, 0, '0.00', 0),
       (132, 'MT', 'Malta', 1, 0, '0.00', 0),
       (133, 'MH', 'Marshall Islands', 1, 0, '0.00', 0),
       (134, 'MQ', 'Martinique', 1, 0, '0.00', 0),
       (135, 'MR', 'Mauritania', 1, 0, '0.00', 0),
       (136, 'MU', 'Mauritius', 1, 0, '0.00', 0),
       (137, 'YT', 'Mayotte', 1, 0, '0.00', 0),
       (138, 'MX', 'Mexico', 1, 0, '0.00', 0),
       (139, 'FM', 'Micronesia', 1, 0, '0.00', 0),
       (140, 'MD', 'Moldova, Republic of', 1, 0, '0.00', 0),
       (141, 'MC', 'Monaco', 1, 0, '0.00', 0),
       (142, 'MN', 'Mongolia', 1, 0, '0.00', 0),
       (143, 'MS', 'Montserrat', 1, 0, '0.00', 0),
       (144, 'MA', 'Morocco', 1, 0, '0.00', 0),
       (145, 'MZ', 'Mozambique', 1, 0, '0.00', 0),
       (146, 'MM', 'Myanmar', 1, 0, '0.00', 0),
       (147, 'NA', 'Namibia', 1, 0, '0.00', 0),
       (148, 'NR', 'Nauru', 1, 0, '0.00', 0),
       (149, 'NP', 'Nepal', 1, 0, '0.00', 0),
       (150, 'NL', 'Netherlands', 1, 0, '0.00', 0),
       (151, 'AN', 'Netherlands Antilles', 1, 0, '0.00', 0),
       (152, 'NC', 'New Caledonia', 1, 0, '0.00', 0),
       (153, 'NZ', 'New Zealand', 1, 0, '0.00', 0),
       (154, 'NI', 'Nicaragua', 1, 0, '0.00', 0),
       (155, 'NE', 'Niger', 1, 0, '0.00', 0),
       (156, 'NG', 'Nigeria', 1, 0, '0.00', 0),
       (157, 'NU', 'Niue', 1, 0, '0.00', 0),
       (158, 'NF', 'Norfolk Island', 1, 0, '0.00', 0),
       (159, 'MP', 'Northern Mariana Islands', 1, 0, '0.00', 0),
       (160, 'NO', 'Norway', 1, 0, '0.00', 0),
       (161, 'OM', 'Oman', 1, 0, '0.00', 0),
       (162, 'PK', 'Pakistan', 1, 0, '0.00', 0),
       (163, 'PW', 'Palau', 1, 0, '0.00', 0),
       (164, 'PA', 'Panama', 1, 0, '0.00', 0),
       (165, 'PG', 'Papua New Guinea', 1, 0, '0.00', 0),
       (166, 'PY', 'Paraguay', 1, 0, '0.00', 0),
       (167, 'PE', 'Peru', 1, 0, '0.00', 0),
       (168, 'PH', 'Philippines', 1, 0, '0.00', 0),
       (169, 'PN', 'Pitcairn', 1, 0, '0.00', 0),
       (170, 'PL', 'Poland', 1, 0, '0.00', 0),
       (171, 'PT', 'Portugal', 1, 0, '0.00', 0),
       (172, 'PR', 'Puerto Rico', 1, 0, '0.00', 0),
       (173, 'QA', 'Qatar', 1, 0, '0.00', 0),
       (174, 'RE', 'Reunion', 1, 0, '0.00', 0),
       (175, 'RO', 'Romania', 1, 0, '0.00', 0),
       (176, 'RU', 'Russian Federation', 1, 0, '0.00', 0),
       (177, 'RW', 'Rwanda', 1, 0, '0.00', 0),
       (178, 'LC', 'Saint Lucia', 1, 0, '0.00', 0),
       (179, 'WS', 'Samoa', 1, 0, '0.00', 0),
       (180, 'SM', 'San Marino', 1, 0, '0.00', 0),
       (181, 'ST', 'Sao Tome and Principe', 1, 0, '0.00', 0),
       (182, 'SA', 'Saudi Arabia', 1, 0, '0.00', 0),
       (183, 'SN', 'Senegal', 1, 0, '0.00', 0),
       (184, 'RS', 'Serbia', 1, 0, '0.00', 0),
       (185, 'SC', 'Seychelles', 1, 0, '0.00', 0),
       (186, 'SL', 'Sierra Leone', 1, 0, '0.00', 0),
       (187, 'SG', 'Singapore', 1, 0, '0.00', 0),
       (188, 'SK', 'Slovakia', 1, 0, '0.00', 0),
       (189, 'SI', 'Slovenia', 1, 0, '0.00', 0),
       (190, 'SB', 'Solomon Islands', 1, 0, '0.00', 0),
       (191, 'SO', 'Somalia', 1, 0, '0.00', 0),
       (192, 'ZA', 'South Africa', 1, 0, '0.00', 0),
       (193, 'ES', 'Spain', 1, 0, '0.00', 0),
       (194, 'LK', 'Sri Lanka', 1, 0, '0.00', 0),
       (195, 'SH', 'St. Helena', 1, 0, '0.00', 0),
       (196, 'KN', 'St. Kitts and Nevis', 1, 0, '0.00', 0),
       (197, 'PM', 'St. Pierre and Miquelon', 1, 0, '0.00', 0),
       (198, 'VC', 'St. Vincent and the Grenadines', 1, 0, '0.00', 0),
       (199, 'SD', 'Sudan', 1, 0, '0.00', 0),
       (200, 'SR', 'Suriname', 1, 0, '0.00', 0),
       (201, 'SJ', 'Svalbard and Jan Mayen Islands', 1, 0, '0.00', 0),
       (202, 'SZ', 'Swaziland', 1, 0, '0.00', 0),
       (203, 'SE', 'Sweden', 1, 0, '0.00', 0),
       (204, 'CH', 'Switzerland', 1, 0, '0.00', 0),
       (205, 'SY', 'Syrian Arab Republic', 1, 0, '0.00', 0),
       (206, 'TW', 'Taiwan', 1, 0, '0.00', 0),
       (207, 'TJ', 'Tajikistan', 1, 0, '0.00', 0),
       (208, 'TZ', 'Tanzania, United Republic of', 1, 0, '0.00', 0),
       (209, 'TH', 'Thailand', 1, 0, '0.00', 0),
       (210, 'TG', 'Togo', 1, 0, '0.00', 0),
       (211, 'TK', 'Tokelau', 1, 0, '0.00', 0),
       (212, 'TO', 'Tonga', 1, 0, '0.00', 0),
       (213, 'TT', 'Trinidad and Tobago', 1, 0, '0.00', 0),
       (214, 'TN', 'Tunisia', 1, 0, '0.00', 0),
       (215, 'TR', 'Turkey', 1, 0, '0.00', 0),
       (216, 'TM', 'Turkmenistan', 1, 0, '0.00', 0),
       (217, 'TC', 'Turks and Caicos Islands', 1, 0, '0.00', 0),
       (218, 'TV', 'Tuvalu', 1, 0, '0.00', 0),
       (219, 'UG', 'Uganda', 1, 0, '0.00', 0),
       (220, 'UA', 'Ukraine', 1, 0, '0.00', 0),
       (221, 'AE', 'United Arab Emirates', 1, 0, '0.00', 0),
       (222, 'GB', 'United Kingdom (GB)', 1, 0, '23.00', 999),
       (224, 'US', 'United States', 1, 0, '7.50', 998),
       (225, 'VI', 'United States Virgin Islands', 1, 0, '0.00', 0),
       (226, 'UY', 'Uruguay', 1, 0, '0.00', 0),
       (227, 'UZ', 'Uzbekistan', 1, 0, '0.00', 0),
       (228, 'VU', 'Vanuatu', 1, 0, '0.00', 0),
       (229, 'VA', 'Vatican City State', 1, 0, '0.00', 0),
       (230, 'VE', 'Venezuela', 1, 0, '0.00', 0),
       (231, 'VN', 'Vietnam', 1, 0, '0.00', 0),
       (232, 'WF', 'Wallis And Futuna Islands', 1, 0, '0.00', 0),
       (233, 'EH', 'Western Sahara', 1, 0, '0.00', 0),
       (234, 'YE', 'Yemen', 1, 0, '0.00', 0),
       (235, 'ZR', 'Zaire', 1, 0, '0.00', 0),
       (236, 'ZM', 'Zambia', 1, 0, '0.00', 0),
       (237, 'ZW', 'Zimbabwe', 1, 0, '0.00', 0);

--
-- Table structure for table `cronjobs`
--

DROP TABLE IF EXISTS `cronjobs`;
CREATE TABLE IF NOT EXISTS `cronjobs` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `membership_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `stripe_customer` varchar(60) NOT NULL,
  `stripe_pm` varchar(80) NOT NULL,
  `amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `renewal` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_membership_id` (`membership_id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `code` varchar(30) NOT NULL,
  `discount` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `type` enum ('p','a') NOT NULL DEFAULT 'p',
  `membership_id` varchar(50) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `tooltip` varchar(100) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `required` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `section` varchar(30) DEFAULT NULL,
  `sorting` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
CREATE TABLE IF NOT EXISTS `downloads` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alias` varchar(60) NOT NULL,
  `name` varchar(80) NOT NULL,
  `filesize` int(11) UNSIGNED NOT NULL,
  `extension` varchar(4) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `fileaccess` varchar(24) NOT NULL DEFAULT '0' COMMENT '0 = all',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `help` tinytext,
  `body` text NOT NULL,
  `type` enum ('news','mailer') DEFAULT 'mailer',
  `typeid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `help`, `body`, `type`, `typeid`)
VALUES (1, 'Registration Email', 'Please verify your email', 'This template is used to send Registration Verification Email, when Configuration Registration Verification is set to YES', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"e036b6jq8u1u\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"4q0ezesrmapj\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME], thanks for signing up!</p>\r\n                <p style=\"background: #EFF8FF; border-radius: 12px; padding:14px\">The administrator of this site has requested all new accounts to be activated by the users who created them thus your account is currently inactive. To activate your account, please visit the link below.</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\">Activate your account</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"3f06iim5p7u3\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"ger80dm1r3v7\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"5zmro5phptef\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'regMail'),

       (2, 'Welcome Mail From Admin', 'You have been registered', 'This template is used to send welcome email, when user is added by administrator', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"nx5t5w9hxjjw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"tdillwcpct3m\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You\'re now a member of [SITE_NAME].</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to login</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"nhnhstrwuw40\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"imaq57xdbyr5\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"icgjxbn8ed8f\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'regMailAdmin'),
       (3, 'Default Newsletter', 'Newsletter', 'This is a default newsletter template', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"t3awwxkkek38\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_envelope.svg\" style=\"width:170px\" data-image=\"y21lpynr8eyi\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">[ATTACHMENT] </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left;\">Newsletter content goes here...  </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"o4y1qq9ya3u9\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"5vic7v3epyz7\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"v4leysp717al\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'newsletter'),
       (4, 'Single Email', 'Single User Email', 'This template is used to email single user', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"1nga2mnv0u9a\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"yz7ot90jjgsr\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]</p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\"> Your message goes here... </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"o9qwfphwdsqc\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"9rwzrav4kwxv\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"8s5vfq2ueb93\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'singleMail'),
       (5, 'Forgot Password Admin', 'Password Reset', 'This template is used for retrieving lost admin password', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"k1zba5ll6zwg\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_password.svg\" style=\"width:170px\" data-image=\"w7w4byt2ycsc\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">it seems that you or someone requested a new password for you. </p>\r\n				  <p style=\"margin-bottom:2px; color:#7E8299\">We have generated a new password, as requested. </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to password reset page</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"nbt21yllo1i5\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"t5dq2gjz0vm2\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"od5705rjhb5w\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'adminPassReset'),
       (6, 'Forgot Password User', 'Password Reset', 'This template is used for retrieving lost user password', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"cuabtjclmfqw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_password.svg\" style=\"width:170px\" data-image=\"th79hxnb3ati\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">it seems that you or someone requested a new password for you. </p>\r\n				  <p style=\"margin-bottom:2px; color:#7E8299\">We have generated a new password, as requested. </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to password reset page</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"dug5xsfwxhzo\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"ilyvv0fxmi4d\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"ebgqwv983ozo\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'userPassReset'),
       (7, 'Welcome Email', 'Welcome', 'This template is used to welcome newly registered user when Configuration->Registration Verification and Configuration->Auto Registration are both set to YES', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"nx5t5w9hxjjw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"tdillwcpct3m\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME], thanks for signing up!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You\'re now a member of [SITE_NAME].</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Go to login</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"nhnhstrwuw40\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"imaq57xdbyr5\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"icgjxbn8ed8f\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'welcomeEmail'),
       (8, 'Registration Pending', 'Registration Verification Pending', 'This template is used to send Registration Verification Email, when Configuration->Auto Registration is set to NO', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"k374krla5wrr\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_welcome.svg\" style=\"width:170px\" data-image=\"qra15dri8k2f\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME], thanks for signing up!</p>\r\n                <p style=\"background: #EFF8FF; border-radius: 12px; padding:14px\">The administrator of this site has requested all new accounts to be activated manually. Your account is currently pending verification process. You will be notify once its activated.</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Here are your login details. Please keep them in a safe place</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [USERNAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Password: [PASSWORD] </p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"rts6uvekmpb1\"></a>\r\n<a href=\"https://facebook.com/[FB]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"e6p1ivhp3ujq\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"yow3f4jrns6h\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'regMailPending'),
       (9, 'Notify Admin', 'New User Registration', 'This template is used to notify admin of new registration when Configuration->Registration Notification is set to YES', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"xf2oy38egsxw\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_user.svg\" style=\"width:170px\" data-image=\"stbk9ea9r33z\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey Admin!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You have a new user registration. </p>\r\n				<p style=\"margin-bottom:2px; color:#7E8299\">You can login into your admin panel to view details:</p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left\">\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Email: [EMAIL]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Name: [NAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">IP: [IP]</p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"qvzy4b14h1mx\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"2wlhqz3dz3be\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"oj7fgnvph7jm\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'notifyAdmin'),
       (10, 'Contact Request', 'Contact Inquiry', 'This template is used to send default Contact Request Form', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"ywpos41bfvx0\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_envelope.svg\" style=\"width:170px\" data-image=\"kciweuwcn8dp\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey Admin!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You have a new contact request: </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">From: [NAME] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Email: [EMAIL] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Telephone: [PHONE] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Subject: [MAILSUBJECT] </p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">IP: [IP] </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left;\"> [MESSAGE] </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"sg1gbyqyjz48\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"6qccmsconfri\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"xvyiw16bmplc\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'contact'),
       (11, 'Transaction Completed Admin', 'Payment Completed', 'This template is used to notify administrator on successful payment transaction', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"338z2e6crnf7\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_payment.svg\" style=\"width:170px\" data-image=\"51hzxn30s9q5\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey Admin!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">You have received new payment following: </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left\">\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Username: [NAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Membership: [ITEMNAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Price: [PRICE]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Status: [STATUS]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Processor: [PP]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">IP: [IP]</p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"x4z9u3sx4rup\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"vcads5ej3eme\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"n51e4y5e3st0\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'payComplete'),
       (12, 'Transaction Completed User', 'Payment Completed', 'This template is used to notify user on successful payment transaction', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"338z2e6crnf7\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_payment.svg\" style=\"width:170px\" data-image=\"51hzxn30s9q5\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Your payment has been completed successfully: </p>\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;text-align:left\">\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Membership: [ITEMNAME]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Price: [PRICE]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">VAT/TAX: [TAX]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Discount: [COUPON]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Status: [STATUS]</p>\r\n                <p style=\"margin-bottom:2px; color:#7E8299\">Processor: [PP]</p>\r\n              </div>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"x4z9u3sx4rup\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"vcads5ej3eme\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"n51e4y5e3st0\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'payCompleteUser');
INSERT INTO `email_templates` (`id`, `name`, `subject`, `help`, `body`, `type`, `typeid`)
VALUES (13, 'Membership Expired', 'Membership Has Expired', 'This template is used to notify user when membership is about to expire a day before. ', '<div id=\"#kt_app_body_content\" style=\"background-color:#D5D9E2; font-family:Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin:0; padding:0; width:100%;\">\r\n  <div style=\"background-color:#ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin:40px auto; max-width: 600px;\">\r\n    <table style=\"border-collapse:collapse\" width=\"100%\" height=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n      <tbody>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 10px\" valign=\"center\" align=\"center\"><div style=\"text-align:center; margin:0 15px 34px 15px\">\r\n              <div style=\"margin-bottom: 10px\">\r\n                <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\">\r\n                <img alt=\"Logo\" src=\"[SITEURL]/uploads/[LOGO]\" style=\"height: 32px\" data-image=\"96wzboz0ihr4\">\r\n                </a>\r\n              </div>\r\n              <div style=\"margin-bottom: 15px\">\r\n                <img alt=\"image\" src=\"[SITEURL]/assets/email/email_membership.svg\" style=\"width:170px\" data-image=\"snecu3fz98bu\">\r\n              </div>\r\n              <div style=\"font-size: 14px; font-weight: 500; margin-bottom: 27px; font-family:Arial,Helvetica,sans-serif;\">\r\n                <p style=\"margin-bottom:9px; color:#181C32; font-size: 22px; font-weight:700\">Hey [NAME]!</p>\r\n                <p style=\"margin-bottom:2px; color:#F44336\">Your current membership has expired! </p>\r\n				  <p style=\"margin-bottom:2px; color:#7E8299\">Please login to your user panel to extend or upgrade your membership.. </p>\r\n              </div>\r\n              <a href=\"[LINK]\" target=\"_blank\" style=\"background-color:#2196F3; border-radius:6px;display:inline-block; padding:11px 19px; color: #FFFFFF; font-size: 14px; font-weight:500;\"> Login</a>\r\n            </div></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; text-align:center; padding: 0 10px 10px 10px; font-weight: 500; color: #A1A5B7; font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p style=\"color:#181C32; font-size: 16px; font-weight: 600; margin-bottom:9px\">Stay in touch</p>\r\n<p style=\"margin-bottom:4px\">You may reach us at\r\n              <a href=\"[SITEURL]\" rel=\"noopener\" target=\"_blank\" style=\"font-weight: 600\"> [SITE_NAME]</a>\r\n            </p>\r\n<p>We serve Mon-Fri, 9AM-18AM</p></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"text-align:center; padding-bottom: 20px;\" valign=\"center\" align=\"center\"><a href=\"mailto:[CEMAIL]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-email.svg\" style=\"width:24px\" data-image=\"gj75tx95851x\"></a>\r\n<a href=\"https://facebook.com/[FB]\" style=\"margin-right:10px\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-facebook.svg\" style=\"width:24px\" data-image=\"0yrtm40v9wm8\"></a>\r\n<a href=\"https://twitter.com/[TW]\"><img alt=\"Logo\" src=\"[SITEURL]/assets/email/icon-twitter.svg\" style=\"width:24px\" data-image=\"lz2511lnq040\"></a></td>\r\n        </tr>\r\n        <tr>\r\n          <td style=\"font-size: 13px; padding:0 15px; text-align:center; font-weight: 500; color: #A1A5B7;font-family:Arial,Helvetica,sans-serif\" valign=\"center\" align=\"center\"><p> The information above is gathered from the user input. © Copyright [DATE] [COMPANY]. All rights reserved.</p></td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n</div>', 'mailer', 'memExpired');

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
CREATE TABLE IF NOT EXISTS `gateways` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `displayname` varchar(50) NOT NULL,
  `dir` varchar(30) NOT NULL,
  `live` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `extra_txt` varchar(120) DEFAULT NULL,
  `extra_txt2` varchar(120) DEFAULT NULL,
  `extra_txt3` varchar(120) DEFAULT NULL,
  `extra` varchar(120) NOT NULL,
  `extra2` varchar(120) DEFAULT NULL,
  `extra3` varchar(120) DEFAULT NULL,
  `is_recurring` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `name`, `displayname`, `dir`, `live`, `extra_txt`, `extra_txt2`, `extra_txt3`, `extra`, `extra2`, `extra3`, `is_recurring`, `active`)
VALUES (1, 'paypal', 'PayPal', 'paypal', 1, 'Paypal Email Address', 'Currency Code', 'Not in Use', 'user@paypal', 'CAD', '', 1, 1),
       (2, 'skrill', 'Skrill', 'skrill', 1, 'Skrill Email Address', 'Currency Code', 'Secret Passphrase', 'secrey', 'EUR', 'skrill', 1, 1),
       (3, 'stripe', 'Stripe', 'stripe', 1, 'Stripe Secret Key', 'Currency Code', '', 'sk_test_', 'CAD', 'pk_test_', 1, 1),
       (4, 'payfast', 'PayFast', 'payfast', 1, 'Merchant ID', 'Merchant Key', 'PassPhrase', '1616', 'sdgsdg', 'Alex0208alex', 1, 1),
       (6, 'ideal', 'iDeal', 'ideal', 1, 'API Key', 'Currency Code', 'Not in Use', 'test_', 'EUR', '', 0, 1),
       (7, 'offline', 'Offline', 'offline', 1, 'Currency Code', 'Not in Use', 'Not in Use', 'CAD', '', '', 0, 1),
       (8, 'razorpay', 'RazorPay', 'razorpay', 1, 'Api Key', 'Currency Code', 'Secret Key', 'rzp_test_', 'INR', '13456', 0, 1),
       (9, 'paystack', 'PayStack', 'paystack', 1, 'Secret Key', 'Currency Code', 'Public Key', 'sk_test_', 'ZAR', 'pk_test_', 0, 1);

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
CREATE TABLE IF NOT EXISTS `memberships` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `body` text,
  `price` decimal(12, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `days` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `period` varchar(1) NOT NULL DEFAULT 'D',
  `recurring` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `thumb` varchar(40) DEFAULT NULL,
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sorting` smallint(1) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `author` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(50) DEFAULT NULL,
  `membership_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rate_amount` decimal(12, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `tax` decimal(12, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `coupon` decimal(12, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `total` decimal(12, 2) UNSIGNED NOT NULL DEFAULT '0.00',
  `currency` varchar(4) DEFAULT NULL,
  `pp` varchar(20) NOT NULL DEFAULT 'Stripe',
  `ip` varbinary(16) DEFAULT '000.000.000.000',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_membership` (`membership_id`),
  KEY `idx_user` (`user_id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `body` longtext,
  `page_type` varchar(15) NOT NULL DEFAULT 'normal',
  `membership_id` varchar(20) NOT NULL DEFAULT '0',
  `keywords` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sorting` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
  ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `body`, `page_type`, `membership_id`, `keywords`, `description`, `created`, `is_hide`, `sorting`, `active`)
VALUES (4, 'Membership Page', 'membership-page', '<h4>This is a membership protected page, and you have access to it.</h4>\r\n<p>Our team works on global, cross-functional projects that are at the \r\n   heart of what we do at Front. As a member of the business strategy team,\r\n   you will deliver insights that drive decision-making, execution, and \r\n   investments for our most critical initiatives.\r\n</p>\r\n<p>The role will be driving \r\n   strategic plans, analyzing business performance and implementing \r\n   operational improvements to scale the business. Success requires \r\n   analytical savvy, problem-solving sophistication and a dedication to \r\n   making the highest impact.\r\n</p>\r\n<p>We are looking for humble, hardworking and \r\n   collaborative individuals that can think on their feet and thrive in a \r\n   fast-paced environment.\r\n</p>\r\n<p>We are a lean team, which \r\n   will provide you opportunities to present directly to our senior \r\n   leaders. Your impact will be felt immediately!\r\n</p>\r\n', 'membership', '2,3,4', '', '', '2021-06-01 11:13:40', 1, 2, 1),
       (3, 'About', 'about', '<div class=\"row big-gutters justify-center\">\r\n            <div class=\"columns screen-60 tablet-100 mobile-100 phone-100 center-align\">\r\n               <h1>About</h1>\r\n               <p class=\"lead\">We cut through complexity, empowering businesses to challenge the status quo, create unlimited opportunities – and change the world.</p>\r\n            </div>\r\n         </div>\r\n<div class=\"margin-big-bottom\">\r\n            <figure class=\"wojo fluid image\">\r\n               <img src=\"[SITEURL]/uploads/img11.jpg\" alt=\"image Description\" class=\"rounded\" data-image=\"hgd8iqa6yysx\">\r\n            </figure>\r\n         </div>\r\n<div class=\"row big-gutters\">\r\n            <div class=\"columns mobile-100 phone-100\">\r\n               <h4>Work environment</h4>\r\n               <p>Only by seeking out diverse talent around the globe and by creating an inclusive workplace can we access the breadth of skills, abilities and creativity that we need to create exceptional and innovative products and services for our customers.</p>\r\n               <p>We strongly believe that an inclusive working environment enables everyone to realise their full potential and to deliver outstanding service to our customers. We continually strive to use all the experiences that our employees bring with them to influence and shape our decision-making process.</p>\r\n               <p>We are an equal opportunities employer and we aim to recruit, train and promote based on individual aptitudes and skills.</p>\r\n            </div>\r\n\r\n            <div class=\"columns mobile-100 phone-100\">\r\n               <div class=\"wojo very relaxed list\">\r\n                  <div class=\"item\">\r\n                     <i class=\"icon building\"></i>\r\n                     <div class=\"content\"><h5>High quality Co-Living spaces</h5>\r\n                        <p>Our fully furnished spaces are designed and purpose-built with Co-Living in mind, featuring high-end finishes and amenities that go far beyond traditional apartment buildings.</p>\r\n                     </div>\r\n                  </div>\r\n                  <div class=\"item\">\r\n                     <i class=\"icon shield\"></i>\r\n                     <div class=\"content\"><h5>Simple and all-inclusive</h5>\r\n                        <p>We worry about the details so that our residents don\'t have to. From our online application process to simple, all-inclusive billing we aim to make the living experience as effortless as possible.</p>\r\n                     </div>\r\n                  </div>\r\n               </div>\r\n            </div>\r\n         </div>\r\n<div class=\"row gutters justify-center\">\r\n            <div class=\"columns center-align\">\r\n               <figure class=\"wojo normal image\">\r\n                  <img src=\"[SITEURL]/uploads/plane.svg\" alt=\"image Description\" class=\"rounded\" data-image=\"xi35io17ewjj\">\r\n               </figure>\r\n            </div>\r\n         </div>\r\n<div class=\"row big-gutters justify-center\">\r\n            <div class=\"columns center-align screen-70 tablet-100 mobile-100 phone-100\">\r\n               <h3>We\'re always looking for talented freelancers to work with. Get in touch if you think you’d be a good fit!</h3>\r\n            </div>\r\n         </div>', 'normal', '', '', '', '2021-06-01 11:13:51', 0, 3, 1),
       (1, 'Home', 'home-page', '\r\n   <div class=\"row gutters\">\r\n      <div class=\"columns center-align\"><span class=\"wojo simple label\">Small business solutions</span></div>\r\n   </div>\r\n   <div class=\"row gutters\">\r\n      <div class=\"columns center-align\"><h1>Turn online shoppers into <span class=\"text-color-primary\">lifetime customers</span></h1></div>\r\n   </div>\r\n\r\n\r\n         <div class=\"rounded-big bg-color-secondary\">\r\n            <div class=\"row align-middle\">\r\n               <div class=\"columns screen-40 tablet-50 mobile-100 phone-100\">\r\n                  <div class=\"padding-large\">\r\n                     <div class=\"margin-bottom\">\r\n                        <h3 class=\"text-color-white margin-bottom\">Drive maximum customer-satisfaction</h3>\r\n                        <p class=\"text-color-white dimmed-text-more\">Connect with your customers better by giving them an excellent post-purchase experience. Engage customers, reduce queries and build trust with automated tracking notifications and custom branded tracking page.</p>\r\n                     </div>\r\n                     <ul class=\"wojo styled check list\">\r\n                        <li class=\"item text-color-white\">Customize labels, packaging</li>\r\n                        <li class=\"item text-color-white\">Custom branded tracking page</li>\r\n                        <li class=\"item text-color-white\">FREE Email &amp; SMS notifications</li>\r\n                     </ul>\r\n                     <div class=\"margin-top\">\r\n                        <a class=\"wojo primary right button\">Learn more\r\n                           <i class=\"icon arrow right\"></i>\r\n                        </a>\r\n                     </div>\r\n                  </div>\r\n               </div>\r\n               <div class=\"columns screen-60 tablet-50 mobile-100 phone-100 right-align\">\r\n                  <div class=\"relative zindex1 padding-large\">\r\n                     <img class=\"rounded-big\" src=\"[SITEURL]/uploads/img2.jpg\" alt=\"Image Description\">\r\n                     <div class=\"absolute zindex2 position-left position-bottom max-width400 margin-huge-bottom margin-huge-left tablet-hide phone-hide mobile-hide\">\r\n                        <img class=\"rounded-big\" src=\"[SITEURL]/uploads/img5.png\" alt=\"Image Description\">\r\n                     </div>\r\n                     <figure class=\"absolute zindex2 position-right position-top max-width200 margin-right margin-top phone-hide mobile-hide\">\r\n                        <img src=\"[SITEURL]/uploads/dots-warning.svg\" alt=\"Image Description\">\r\n                     </figure>\r\n                  </div>\r\n               </div>\r\n            </div>\r\n         </div>\r\n         <div class=\"padding-big-vertical\">\r\n            <div class=\"row gutters justify-center\">\r\n               <div class=\"columns screen-60 tablet-80 mobile-100 phone-100 center-align\"><h3>Solo, agency or team? We’ve got you covered.</h3></div>\r\n            </div>\r\n         </div>\r\n', 'home', '0', NULL, NULL, '2023-07-15 06:09:53', 0, 1, 1),
       (2, 'Contact', 'contact', '<div class=\"row big-gutters\">\r\n   <div class=\"columns center-align\"><h2>How can we help?</h2></div>\r\n</div>\r\n<div class=\"row gutters\">\r\n   <div class=\"columns mobile-100 phone-100\">\r\n      <div class=\"wojo segment relaxed center-align\">\r\n         <div class=\"margin-bottom\">\r\n            <h4>Pre-visit inquiries</h4>\r\n         </div>\r\n         <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 32 32\" width=\"128\" height=\"128\">\r\n            <g>\r\n               <path d=\"M24.25 17.12v-1A8.25 8.25 0 0 0 16 7.82a8.48 8.48 0 0 0-8.25 8.48v.81A1.87 1.87 0 0 0 5.93 19v3.3a1.88 1.88 0 0 0 1.87 1.88h1a1.88 1.88 0 0 0 1.88-1.87V19a1.88 1.88 0 0 0-1.88-1.87h-.05v-.83A7.47 7.47 0 0 1 16 8.82a7.25 7.25 0 0 1 7.24 7.25v1h-.09A1.88 1.88 0 0 0 21.28 19v3.3a1.88 1.88 0 0 0 1.88 1.88h1a1.88 1.88 0 0 0 1.88-1.87V19a1.87 1.87 0 0 0-1.79-1.88Zm-15.41 1a.88.88 0 0 1 .88.88v3.3a.88.88 0 0 1-.87.88h-1a.88.88 0 0 1-.87-.87V19a.88.88 0 0 1 .88-.87h1Zm16.23 4.18a.88.88 0 0 1-.87.88h-1a.88.88 0 0 1-.87-.87V19a.88.88 0 0 1 .88-.87h1a.88.88 0 0 1 .88.88Z\"/>\r\n               <path d=\"M16 16a4.11 4.11 0 1 0 4.11 4.11A4.11 4.11 0 0 0 16 16Zm0 7.21a3.11 3.11 0 1 1 3.11-3.11A3.11 3.11 0 0 1 16 23.18Z\"/>\r\n               <path d=\"M16 20.44a.5.5 0 0 0 .5-.5v-1.57a.5.5 0 0 0-1 0v1.57a.5.5 0 0 0 .5.5zm0 .38a.5.5 0 0 0-.5.5v.45a.5.5 0 0 0 1 0v-.45a.5.5 0 0 0-.5-.5z\"/>\r\n            </g>\r\n         </svg>\r\n         <div class=\"margin-bottom\">\r\n            <span>Mon-Fri</span>\r\n            <p>9:30 AM to 6:00 PM Eastern</p>\r\n         </div>\r\n         <div class=\"margin-small-bottom\">\r\n            <a class=\"wojo fluid basic primary button\">\r\n               <i class=\"icon envelope\"></i>\r\n               support@site.com\r\n            </a>\r\n         </div>\r\n         <a class=\"wojo small white button\">\r\n            <i class=\"icon telephone\"></i>\r\n            065 2354876\r\n         </a>\r\n      </div>\r\n   </div>\r\n   <div class=\"columns mobile-100 phone-100\">\r\n      <div class=\"wojo segment relaxed center-align\">\r\n         <div class=\"margin-bottom\">\r\n            <h4>Billing questions</h4>\r\n         </div>\r\n         <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 32 32\" width=\"128\" height=\"128\">\r\n            <g>\r\n               <path d=\"M24.71 5.92H11.83a1.29 1.29 0 0 0-1.29 1.28v5.47H7.2A1.29 1.29 0 0 0 5.92 14v9.33a1.28 1.28 0 0 0 1.28 1.24h3.24a.3.3 0 0 1 .14 0L13 26a1.32 1.32 0 0 0 .64.17 1.27 1.27 0 0 0 .64-.17l2.42-1.4a.3.3 0 0 1 .15 0h3.23a1.29 1.29 0 0 0 1.29-1.28v-5.48h3.33a1.29 1.29 0 0 0 1.3-1.31V7.2a1.29 1.29 0 0 0-1.29-1.28Zm-4.62 17.65h-3.23a1.3 1.3 0 0 0-.65.18l-2.42 1.4a.3.3 0 0 1-.29 0l-2.42-1.4a1.3 1.3 0 0 0-.64-.18H7.2a.28.28 0 0 1-.28-.28V14a.28.28 0 0 1 .28-.29h3.34v2.86a1.29 1.29 0 0 0 1.29 1.29h3.23a.28.28 0 0 1 .14 0l2.42 1.4a1.28 1.28 0 0 0 1.29 0l1.47-.85v4.88a.29.29 0 0 1-.29.28Zm4.91-7a.29.29 0 0 1-.29.29h-3.23a1.27 1.27 0 0 0-.64.17l-2.43 1.4a.28.28 0 0 1-.28 0L15.71 17a1.29 1.29 0 0 0-.64-.17h-3.24a.29.29 0 0 1-.29-.29V7.2a.29.29 0 0 1 .29-.29h12.88a.29.29 0 0 1 .29.29Z\"/>\r\n               <path d=\"M16.08 11.67H15a.5.5 0 0 0 0 1h1.12a.5.5 0 0 0 0-1zm2.75 0h-1.12a.5.5 0 0 0 0 1h1.13a.5.5 0 0 0 0-1zm2.76 0h-1.13a.5.5 0 0 0 0 1h1.13a.5.5 0 1 0 0-1z\"/>\r\n            </g>\r\n         </svg>\r\n         <div class=\"margin-bottom\">\r\n            <span>Mon-Fri</span>\r\n            <p>9:30 AM to 5:00 PM Eastern</p>\r\n         </div>\r\n         <div class=\"margin-small-bottom\">\r\n            <a class=\"wojo fluid basic primary button\">\r\n               <i class=\"icon envelope\"></i>\r\n               biling@site.com\r\n            </a>\r\n         </div>\r\n         <a class=\"wojo small white button\">\r\n            <i class=\"icon telephone\"></i>\r\n            065 2354877\r\n         </a>\r\n      </div>\r\n   </div>\r\n   <div class=\"columns mobile-100 phone-100\">\r\n      <div class=\"wojo segment relaxed center-align\">\r\n         <div class=\"margin-bottom\">\r\n            <h4>Sales questions</h4>\r\n         </div>\r\n         <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 32 32\" width=\"128\" height=\"128\">\r\n            <g>\r\n               <path d=\"M8.84 15.75H7.75a1.35 1.35 0 0 0-1.32 1.36v3.32a1.37 1.37 0 0 0 1.37 1.38h1a1.37 1.37 0 0 0 1.38-1.37v-3.32a1.37 1.37 0 0 0-1.34-1.37zm15.41.01h-1.09a1.37 1.37 0 0 0-1.38 1.37v3.32a1.37 1.37 0 0 0 1.38 1.37h1.09a1.35 1.35 0 0 0 1.32-1.36v-3.34a1.35 1.35 0 0 0-1.32-1.36zm-3.12-6.68a7.17 7.17 0 0 1 2.12 5.13v1h1v-1A8.26 8.26 0 0 0 16 6a8.48 8.48 0 0 0-8.26 8.48v.82h1v-.81A7.47 7.47 0 0 1 16 7a7.19 7.19 0 0 1 5.13 2.08zm2.12 13.23v1.08A1.65 1.65 0 0 1 21.6 25h-4.86a.5.5 0 0 0 0 1h4.86a2.65 2.65 0 0 0 2.65-2.65V22.3h-1z\"/>\r\n               <path d=\"M17.76 20.93h1.78a.43.43 0 0 0 .46-.43v-5.13a.43.43 0 0 0-.43-.43h-7.11a.43.43 0 0 0-.43.43v5.13a.43.43 0 0 0 .43.43h1.78a.39.39 0 0 1 .21.06l1.33.77a.49.49 0 0 0 .44 0l1.33-.76a.39.39 0 0 1 .21-.07Zm-2.58-2.43h-1.12a.5.5 0 0 1 0-1h1.12a.5.5 0 0 1 0 1Zm1.14-.5a.5.5 0 0 1 .5-.5h1.12a.5.5 0 0 1 0 1h-1.12a.5.5 0 0 1-.5-.5Z\"/>\r\n            </g>\r\n         </svg>\r\n         <div class=\"margin-bottom\">\r\n            <span>Mon-Fri</span>\r\n            <p>9:30 AM to 6:00 PM Eastern</p>\r\n         </div>\r\n         <div class=\"margin-small-bottom\">\r\n            <a class=\"wojo fluid basic primary button\">\r\n               <i class=\"icon envelope\"></i>\r\n               sales@site.com\r\n            </a>\r\n         </div>\r\n         <a class=\"wojo small white button\">\r\n            <i class=\"icon telephone\"></i>\r\n            065 2354879\r\n         </a>\r\n      </div>\r\n   </div>\r\n</div>', 'contact', '0', NULL, NULL, '2023-07-15 06:10:22', 0, 4, 1),
       (6, 'Privacy', 'privacy', '<p>\r\n        1.     <strong>Introduction</strong></p>\r\n<p>\r\n        1.1    We are  committed to safeguarding the privacy of [our website visitors and service  users].</p>\r\n<p>\r\n        1.2    This policy  applies where we are acting as a data controller with respect to the personal  data of [our website visitors and service users]; in other words, where we  determine the purposes and means of the processing of that personal data.</p>\r\n<p>\r\n        1.3    We use  cookies on our website. Insofar as those cookies are not strictly necessary for  the provision of [our website and services], we will ask you to consent to our  use of cookies when you first visit our website.</p>\r\n<p>\r\n        1.4    Our website  incorporates privacy controls which affect how we will process your personal  data. By using the privacy controls, you can [specify whether you would like to  receive direct marketing communications and limit the publication of your  information]. You can access the privacy controls via <em>[URL]</em>.</p>\r\n<p>\r\n        1.5    In this  policy, \"we\", \"us\" and \"our\" refer to <em>[data  controller name]</em>.[ For more information about us, see Section 13.]<br></p>', 'privacy', '', '', '', '2023-07-16 12:55:13', 0, 5, 0);


--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE IF NOT EXISTS `privileges` (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `mode` varchar(8) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `code`, `name`, `description`, `mode`, `type`)
VALUES (1, 'manage_users', 'Manage Users', 'Permission to add/edit/delete users', 'manage', 'Users'),
       (2, 'manage_files', 'Manage Files', 'Permission to access File Manager', 'manage', 'Files'),
       (3, 'manage_pages', 'Manage Pages', 'Permission to Add/edit/delete pages', 'manage', 'Pages'),
       (4, 'manage_menus', 'Manage Menus', 'Permission to Add/edit and delete menus', 'manage', 'Menus'),
       (5, 'manage_email', 'Manage Email Templates', 'Permission to modify email templates', 'manage', 'Emails'),
       (6, 'manage_languages', 'Manage Language Phrases', 'Permission to modify language phrases', 'manage', 'Languages'),
       (7, 'manage_backup', 'Manage Database Backups', 'Permission to create backups and restore', 'manage', 'Backups'),
       (8, 'manage_memberships', 'Manage Memberships', 'Permission to manage memberships', 'manage', 'Memberships'),
       (9, 'edit_user', 'Edit Users', 'Permission to edit user', 'edit', 'Users'),
       (10, 'add_user', 'Add User', 'Permission to add users', 'add', 'Users'),
       (11, 'delete_user', 'Delete Users', 'Permission to delete users', 'delete', 'Users'),
       (12, 'manage_coupons', 'Manage Coupons', 'Permission to Add/Edit and delete coupons', 'manage', 'Coupons'),
       (13, 'manage_fields', 'Mange Fileds', 'Permission to Add/edit and delete custom fields', 'manage', 'Fields'),
       (14, 'manage_news', 'Manage News', 'Permission to Add/edit and delete news', 'manage', 'News'),
       (15, 'manage_newsletter', 'Manage Newsletter', 'Permission to send newsletter and emails', 'manage', 'Newsletter');

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `code`, `icon`, `name`, `description`)
VALUES (1, 'owner', 'badge', 'Site Owner', 'Site Owner is the owner of the site, has all privileges and could not be removed.'),
       (2, 'staff', 'trophy', 'Staff Member', 'The "Staff" members  is required to assist the Owner, has different privileges and may be created by Site Owner.'),
       (3, 'editor', 'note', 'Editor', 'The &#34;Editor&#34; is required to assist the Staff Members, has different privileges and may be created by Site Owner.');

--
-- Table structure for table `role_privileges`
--

DROP TABLE IF EXISTS `role_privileges`;
CREATE TABLE IF NOT EXISTS `role_privileges` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `pid` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx` (`rid`,`pid`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role_privileges`
--

INSERT INTO `role_privileges` (`id`, `rid`, `pid`, `active`)
VALUES (1, 1, 1, 1),
       (2, 2, 1, 1),
       (3, 3, 1, 0),
       (4, 1, 2, 1),
       (5, 2, 2, 1),
       (6, 3, 2, 1),
       (7, 1, 3, 1),
       (8, 2, 3, 1),
       (9, 3, 3, 1),
       (10, 1, 4, 1),
       (11, 2, 4, 1),
       (12, 3, 4, 1),
       (13, 1, 5, 1),
       (14, 2, 5, 1),
       (15, 3, 5, 0),
       (16, 1, 6, 1),
       (17, 2, 6, 1),
       (18, 3, 6, 1),
       (19, 1, 7, 1),
       (20, 2, 7, 1),
       (21, 3, 7, 0),
       (22, 1, 8, 1),
       (23, 2, 8, 1),
       (24, 3, 8, 0),
       (25, 1, 9, 1),
       (26, 2, 9, 1),
       (27, 3, 9, 0),
       (28, 1, 10, 1),
       (29, 2, 10, 1),
       (30, 3, 10, 0),
       (31, 1, 11, 1),
       (32, 2, 11, 1),
       (33, 3, 11, 0),
       (34, 1, 12, 1),
       (35, 2, 12, 1),
       (36, 3, 12, 1),
       (37, 1, 13, 1),
       (38, 2, 13, 1),
       (39, 3, 13, 0),
       (40, 1, 14, 1),
       (41, 2, 14, 1),
       (42, 3, 14, 1),
       (43, 1, 15, 1),
       (44, 2, 15, 1),
       (45, 3, 15, 0);

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `company` varchar(50) NOT NULL,
  `site_email` varchar(80) NOT NULL,
  `psite_email` varchar(80) DEFAULT NULL,
  `site_dir` varchar(100) DEFAULT NULL,
  `reg_allowed` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `reg_verify` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notify_admin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `auto_verify` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `perpage` tinyint(1) UNSIGNED NOT NULL DEFAULT '12',
  `backup` varchar(60) DEFAULT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `plogo` varchar(40) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `enable_tax` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tax_rate` decimal(6,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `long_date` varchar(50) DEFAULT NULL,
  `short_date` varchar(50) DEFAULT NULL,
  `time_format` varchar(20) DEFAULT NULL,
  `calendar_date` varchar(30) DEFAULT NULL,
  `dtz` varchar(80) DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `eucookie` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `one_login` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weekstart` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `inv_info` text,
  `inv_note` text,
  `offline_info` text,
  `social_media` blob,
  `page_slugs` blob,
  `enable_dmembership` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dmembership` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `file_dir` varchar(100) DEFAULT NULL,
  `mailer` enum('SMTP','SMAIL') NOT NULL DEFAULT 'SMTP',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(50) DEFAULT NULL,
  `smtp_pass` varchar(50) DEFAULT NULL,
  `smtp_port` varchar(6) DEFAULT NULL,
  `is_ssl` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sendmail` varchar(150) DEFAULT NULL,
  `wojon` decimal(4,2) UNSIGNED NOT NULL DEFAULT '1.00',
  `wojov` decimal(4,2) UNSIGNED NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`id`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company`, `site_email`, `psite_email`, `site_dir`, `reg_allowed`, `reg_verify`, `notify_admin`, `auto_verify`, `perpage`, `backup`, `logo`, `plogo`, `currency`, `enable_tax`, `tax_rate`, `long_date`, `short_date`, `time_format`, `calendar_date`, `dtz`, `locale`, `lang`, `eucookie`, `one_login`, `weekstart`, `inv_info`, `inv_note`, `offline_info`, `social_media`, `page_slugs`, `enable_dmembership`, `dmembership`, `file_dir`, `mailer`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `is_ssl`, `sendmail`, `wojon`, `wojov`) VALUES
  (1, '', '', '', '', 1, 1, 0, 0, 12, '08-Jul-2023_04-39-04.sql', 'logo.svg', 'print_logo.svg', 'CAD', 0, '0.00', 'MMMM dd, yyyy hh:mm a', 'dd MMM yyyy', 'HH:mm', 'dd-mm-yyyy', 'America/Toronto', 'en_CA', 'en', 0, 0, 0, '<p><strong>ABC Company Pty Ltd</strong><br>123 Burke Street, Toronto ON, CANADA<br>Tel : (416) 1234-5678, Fax : (416) 1234-5679, Email : sales@abc-company.com<br>Web Site : www.abc-company.com</p>', '<p>TERMS & CONDITIONS<br>1. Interest may be levied on overdue accounts. <br>2. Goods sold are not returnable or refundable</p>', '<p>Instructions for offline payments...</p>', 0x7b2266616365626f6f6b223a2266616365626f6f6b5f70616765222c2274776974746572223a22747769747465725f70616765227d, 0x7b22686f6d65223a5b7b22706167655f74797065223a22686f6d65227d5d2c22636f6e74616374223a5b7b22706167655f74797065223a22636f6e74616374227d5d2c2270726976616379223a5b7b22706167655f74797065223a2270726976616379227d5d7d, 0, 0, '/home/downloads/', 'SMTP', 'in-v3.mailjet.com', '123', '456', '587', 0, 'sendmail path', '1.00', '5.00');

--
-- Table structure for table `trash`
--


DROP TABLE IF EXISTS `trash`;
CREATE TABLE IF NOT EXISTS `trash` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent` varchar(15) DEFAULT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(15) DEFAULT NULL,
  `dataset` blob,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `fname` varchar(60) DEFAULT NULL,
  `lname` varchar(60) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `membership_id` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `mem_expire` varchar(20) DEFAULT NULL,
  `hash` varchar(70) NOT NULL,
  `token` varchar(40) NOT NULL DEFAULT '0',
  `userlevel` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `sesid` varchar(80) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'member',
  `trial_used` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT '000.000.000.000',
  `login_info` varchar(150) DEFAULT NULL,
  `login_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `avatar` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `user_files` varchar(150) NOT NULL DEFAULT '0',
  `notes` tinytext,
  `newsletter` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `stripe_cus` varchar(100) DEFAULT NULL,
  `stripe_pm` varchar(80) DEFAULT NULL,
  `custom_fields` varchar(200) DEFAULT NULL,
  `active` enum('y','n','t','b') NOT NULL DEFAULT 'n',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `user_custom_fields`
--

DROP TABLE IF EXISTS `user_custom_fields`;
CREATE TABLE IF NOT EXISTS `user_custom_fields` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `field_name` varchar(40) DEFAULT NULL,
  `field_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_field` (`field_id`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `user_memberships`
--

DROP TABLE IF EXISTS `user_memberships`;
CREATE TABLE IF NOT EXISTS `user_memberships` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `membership_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `activated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expire` timestamp NULL DEFAULT NULL,
  `recurring` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 = expired, 1 = active',
  PRIMARY KEY (`id`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;