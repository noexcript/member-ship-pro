-- ================================================================
--
-- @version $Id: structure.sql 2023-07-01 12:12:05 gewa $
-- @package Membership Manager Pro
-- @copyright 2023. wojoscripts.com
--
-- ================================================================
-- Database Content
-- ================================================================


--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `discount`, `type`, `membership_id`, `created`, `active`)
VALUES (1, '10 percent off', '12345', 10, 'p', '3,5', '2016-05-12 21:21:27', 1),
       (2, '10 Dollars off', '45678', 4, 'a', '2,3,4,5,1', '2016-08-19 16:38:04', 1);

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `title`, `description`, `body`, `price`, `days`, `period`, `recurring`, `thumb`, `private`, `created`, `sorting`, `active`)
VALUES (1, 'Trial', 'This is 7 days membership', '<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 2 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>', '0.00', 7, 'D', 0, NULL, 0, '2023-02-28 06:24:24', 1, 1),
       (2, 'Bronze', 'This is 30 days basic membership', '<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 20 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>', '2.99', 1, 'M', 1, 'bronze.svg', 0, '2023-02-28 06:24:24', 3, 1),
       (3, 'Gold', 'This is 90 days basic membership', '<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 40 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>', '6.99', 90, 'D', 0, 'gold.svg', 0, '2023-02-28 06:24:24', 4, 1),
       (4, 'Platinum', 'Platinum Yearly Subscription', '<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 10 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>', '149.99', 1, 'Y', 0, 'platinum.svg', 0, '2023-02-28 06:24:24', 5, 1),
       (5, 'Silver', 'This is 7 days basic membership.', '<div class=\"row gutters\">\r\n   <div class=\"columns phone-100\">\r\n      <ul class=\"wojo styled check circle list positive\">\r\n         <li class=\"item\">Up to 20 people</li>\r\n         <li class=\"item\">Collect data</li>\r\n         <li class=\"item\">Code extensibility</li>\r\n      </ul>\r\n   </div>\r\n   <div class=\"columns phone-100\"\">\r\n      <ul class=\"wojo styled x circle list negative\">\r\n         <li class=\"item\">Custom reports</li>\r\n         <li class=\"item\">Product support</li>\r\n         <li class=\"item\">Activity reporting</li>\r\n      </ul>\r\n   </div>\r\n</div>', '1.99', 1, 'W', 0, 'silver.svg', 1, '2023-02-28 06:24:24', 2, 1);


--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `body`, `author`, `created`, `active`)
VALUES (1, 'Welcome to our Client Area!', '<p>We are pleased to announce the new release of fully responsive Membership Manager Pro v 4.0</p>', 'Web Master', '2023-07-05 18:30:14', 1),
       (2, 'New Version Update', '<p>We are pleased to announce the new release of fully responsive Membership Manager Pro v 4.50</p>', 'Web Master', '2023-07-02 18:30:19', 1);

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `txn_id`, `membership_id`, `user_id`, `rate_amount`, `tax`, `coupon`, `total`, `currency`, `pp`, `ip`, `created`, `status`)
VALUES (1, 'txn_4rX4ydAuaWCC3h', 1, 2, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x3138312e3132392e3138342e313830, '2016-07-11 13:20:12', 1),
       (2, 'txn_4rX4ydAuaWCC3h', 4, 3, '9.99', '0.00', '0.00', '9.99', 'USD', 'PayPal', 0x3135382e3233332e32302e323136, '2016-05-10 04:38:15', 1),
       (3, 'txn_4rX4ydAuaWCC3h', 4, 4, '19.99', '0.00', '0.00', '19.99', 'USD', 'Ideal', 0x3139342e3134312e31342e323234, '2016-06-17 04:11:22', 1),
       (4, 'txn_4rX4ydAuaWCC3h', 2, 5, '49.99', '0.00', '0.00', '49.99', 'USD', '2Checkout', 0x39362e3138362e3138312e3730, '2016-05-30 16:40:47', 1),
       (5, 'txn_4rX4ydAuaWCC3h', 3, 6, '5.99', '0.00', '0.00', '5.99', 'USD', 'Authorize.net', 0x33332e3134372e3139332e313634, '2016-03-26 06:02:24', 1),
       (6, 'txn_4rX4ydAuaWCC3h', 1, 7, '9.99', '0.00', '0.00', '9.99', 'USD', 'PayPal', 0x38382e35392e31302e3831, '2016-06-13 14:34:14', 1),
       (7, 'txn_4rX4ydAuaWCC3h', 1, 8, '19.99', '0.00', '0.00', '19.99', 'USD', 'PayPal', 0x32372e3134352e3137342e3234, '2016-03-25 18:45:44', 1),
       (8, 'txn_4rX4ydAuaWCC3h', 1, 9, '49.99', '0.00', '0.00', '49.99', 'USD', 'PayPal', 0x3132382e3136342e3137372e3734, '2016-07-06 08:34:34', 1),
       (9, 'txn_4rX4ydAuaWCC3h', 1, 10, '5.99', '0.00', '0.00', '5.99', 'USD', 'PayPal', 0x3132312e3139362e3231382e313335, '2016-03-27 22:27:34', 1),
       (10, 'txn_4rX4ydAuaWCC3h', 2, 11, '9.99', '0.00', '0.00', '9.99', 'USD', 'PayPal', 0x3233372e3230302e3134382e323132, '2016-08-22 01:27:01', 1),
       (11, 'txn_4rX4ydAuaWCC3h', 3, 12, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x35302e3138322e3234362e323032, '2016-02-21 18:48:17', 1),
       (12, 'txn_4rX4ydAuaWCC3h', 4, 13, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x3231382e37372e3233362e323335, '2016-02-18 03:58:22', 1),
       (13, 'txn_4rX4ydAuaWCC3h', 3, 14, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x3136332e3136302e3232372e3338, '2016-06-25 02:43:19', 1),
       (14, 'txn_4rX4ydAuaWCC3h', 1, 15, '9.99', '0.00', '0.00', '9.99', 'USD', 'Ideal', 0x3132392e3132312e3134312e323339, '2016-02-05 05:50:25', 1),
       (15, 'txn_4rX4ydAuaWCC3h', 2, 16, '19.99', '0.00', '0.00', '19.99', 'USD', 'Ideal', 0x37362e3133312e33332e3737, '2016-03-04 19:56:14', 1),
       (16, 'txn_4rX4ydAuaWCC3h', 3, 17, '49.99', '0.00', '0.00', '49.99', 'USD', 'Ideal', 0x3230362e31322e3134302e313136, '2016-06-12 11:41:01', 1),
       (17, 'txn_4rX4ydAuaWCC3h', 4, 21, '5.99', '0.00', '0.00', '5.99', 'USD', 'Ideal', 0x33372e37372e3139332e313837, '2016-02-13 06:32:37', 1),
       (18, 'txn_4rX4ydAuaWCC3h', 3, 2, '9.99', '0.00', '0.00', '9.99', 'USD', 'Ideal', 0x3233302e3232342e3137392e3938, '2016-05-30 15:18:09', 1),
       (19, 'txn_4rX4ydAuaWCC3h', 3, 3, '19.99', '0.00', '0.00', '19.99', 'USD', '2Checkout', 0x3138352e38332e33362e3333, '2016-06-26 07:45:12', 1),
       (20, 'txn_4rX4ydAuaWCC3h', 1, 4, '49.99', '0.00', '0.00', '49.99', 'USD', '2Checkout', 0x3133362e32392e38342e313634, '2016-04-24 03:28:47', 1),
       (21, 'txn_4rX4ydAuaWCC3h', 4, 5, '5.99', '0.00', '0.00', '5.99', 'USD', '2Checkout', 0x3134322e3139302e39322e323036, '2016-01-26 16:56:57', 1),
       (22, 'txn_4rX4ydAuaWCC3h', 2, 6, '9.99', '0.00', '0.00', '9.99', 'USD', '2Checkout', 0x3131352e3233322e3233322e313632, '2016-03-22 09:16:49', 1),
       (23, 'txn_4rX4ydAuaWCC3h', 4, 7, '19.99', '0.00', '0.00', '19.99', 'USD', '2Checkout', 0x3134362e39372e32382e3431, '2016-04-19 02:23:47', 1),
       (24, 'txn_4rX4ydAuaWCC3h', 3, 8, '49.99', '0.00', '0.00', '49.99', 'USD', 'Authorize.net', 0x33342e3234302e39362e3338, '2016-07-08 15:40:45', 1),
       (25, 'txn_4rX4ydAuaWCC3h', 4, 9, '5.99', '0.00', '0.00', '5.99', 'USD', 'Authorize.net', 0x3136332e3130382e3139382e313935, '2016-02-11 03:10:09', 1),
       (26, 'txn_4rX4ydAuaWCC3h', 4, 10, '9.99', '0.00', '0.00', '9.99', 'USD', 'Authorize.net', 0x3232362e39352e32352e313435, '2016-05-23 02:39:56', 1),
       (27, 'txn_4rX4ydAuaWCC3h', 3, 11, '19.99', '0.00', '0.00', '19.99', 'USD', 'Authorize.net', 0x38332e3137322e38302e313337, '2016-06-15 06:54:14', 1),

       (28, 'txn_4rX4ydAuaWCC3h', 3, 12, '49.99', '0.00', '0.00', '49.99', 'USD', 'Authorize.net', 0x3136342e39372e3133322e313332, '2016-04-10 19:35:59', 1),
       (29, 'txn_4rX4ydAuaWCC3h', 3, 13, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x32312e3139312e3137362e3238, '2016-03-15 02:24:47', 1),
       (30, 'txn_4rX4ydAuaWCC3h', 2, 14, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x38322e3134382e33382e313237, '2016-01-06 23:01:09', 1),
       (31, 'txn_4rX4ydAuaWCC3h', 2, 15, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x37362e3231382e3234312e3135, '2016-05-18 18:57:44', 1),
       (32, 'txn_4rX4ydAuaWCC3h', 3, 16, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x3232382e3138392e302e313732, '2016-06-22 13:22:21', 1),
       (33, 'txn_4rX4ydAuaWCC3h', 1, 17, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x3232342e33372e33352e3237, '2016-06-21 14:29:49', 1),
       (34, 'txn_4rX4ydAuaWCC3h', 2, 21, '9.99', '0.00', '0.00', '9.99', 'USD', 'PayPal', 0x39342e3133322e3231362e323237, '2016-04-01 09:33:34', 1),
       (35, 'txn_4rX4ydAuaWCC3h', 4, 2, '19.99', '0.00', '0.00', '19.99', 'USD', 'PayPal', 0x3133332e352e3135302e3437, '2016-01-12 01:24:05', 1),
       (36, 'txn_4rX4ydAuaWCC3h', 2, 3, '49.99', '0.00', '0.00', '49.99', 'USD', 'PayPal', 0x3232302e392e34342e323332, '2016-04-07 16:33:20', 1),
       (37, 'txn_4rX4ydAuaWCC3h', 2, 4, '5.99', '0.00', '0.00', '5.99', 'USD', 'PayPal', 0x31322e38392e3135352e313432, '2016-05-12 10:34:46', 1),
       (38, 'txn_4rX4ydAuaWCC3h', 3, 5, '9.99', '0.00', '0.00', '9.99', 'USD', 'PayPal', 0x3137392e33372e34312e3131, '2016-04-24 12:42:54', 1),
       (39, 'txn_4rX4ydAuaWCC3h', 2, 6, '19.99', '0.00', '0.00', '19.99', 'USD', '2Checkout', 0x3139382e39302e392e313136, '2016-07-05 05:32:25', 1),
       (40, 'txn_4rX4ydAuaWCC3h', 3, 7, '49.99', '0.00', '0.00', '49.99', 'USD', '2Checkout', 0x3139322e3136302e38322e313137, '2016-02-15 20:26:12', 1),
       (41, 'txn_4rX4ydAuaWCC3h', 1, 8, '5.99', '0.00', '0.00', '5.99', 'USD', '2Checkout', 0x33382e36332e3137322e3134, '2016-01-10 03:10:48', 1),
       (42, 'txn_4rX4ydAuaWCC3h', 2, 9, '9.99', '0.00', '0.00', '9.99', 'USD', '2Checkout', 0x3135332e3139362e3138372e3839, '2016-04-14 22:25:12', 1),
       (43, 'txn_4rX4ydAuaWCC3h', 2, 10, '19.99', '0.00', '0.00', '19.99', 'USD', '2Checkout', 0x3134382e3232382e3134342e313733, '2016-06-01 09:49:27', 1),
       (44, 'txn_4rX4ydAuaWCC3h', 1, 11, '49.99', '0.00', '0.00', '49.99', 'USD', 'Ideal', 0x3232342e3230372e38302e323233, '2016-06-08 02:02:57', 1),
       (45, 'txn_4rX4ydAuaWCC3h', 2, 12, '5.99', '0.00', '0.00', '5.99', 'USD', 'Ideal', 0x3139322e3137332e3234382e323533, '2016-03-26 17:16:25', 1),
       (46, 'txn_4rX4ydAuaWCC3h', 2, 13, '9.99', '0.00', '3.99', '9.99', 'USD', 'Ideal', 0x31372e3233352e3232392e3833, '2016-08-21 16:10:03', 1),
       (47, 'txn_4rX4ydAuaWCC3h', 4, 14, '19.99', '0.00', '0.00', '19.99', 'USD', 'Ideal', 0x38312e3134332e3235352e323532, '2016-06-03 02:09:05', 1),
       (48, 'txn_4rX4ydAuaWCC3h', 3, 15, '49.99', '0.00', '0.00', '49.99', 'USD', 'Ideal', 0x3134312e3232302e39362e3830, '2016-06-11 15:03:36', 1),
       (49, 'txn_4rX4ydAuaWCC3h', 4, 16, '5.99', '0.00', '0.00', '5.99', 'USD', 'Payfast', 0x3232392e3135332e37322e3638, '2016-05-28 02:14:27', 1),
       (50, 'txn_4rX4ydAuaWCC3h', 1, 17, '9.99', '0.00', '0.00', '9.99', 'USD', 'Payfast', 0x3132362e3232312e37352e3431, '2016-04-12 08:03:58', 1),
       (51, 'txn_4rX4ydAuaWCC3h', 4, 21, '14.99', '0.00', '5.00', '14.99', 'USD', 'Payfast', 0x39302e38352e3232352e30, '2016-01-14 22:01:45', 1),
       (52, 'txn_4rX4ydAuaWCC3h', 4, 2, '49.99', '0.00', '0.00', '49.99', 'USD', 'Payfast', 0x31372e3138342e3136382e31, '2016-05-02 04:13:03', 1),
       (53, 'txn_4rX4ydAuaWCC3h', 4, 3, '5.99', '0.00', '0.00', '5.99', 'USD', 'Payfast', 0x3134312e3131382e3135382e313935, '2016-03-15 09:22:24', 1),
       (54, 'txn_4rX4ydAuaWCC3h', 2, 4, '9.99', '0.00', '0.00', '9.99', 'USD', 'Payfast', 0x3139342e36362e3230352e313533, '2016-06-21 02:39:40', 1),
       (55, 'txn_4rX4ydAuaWCC3h', 2, 5, '19.99', '0.00', '0.00', '19.99', 'USD', 'PayPal', 0x3232302e3133392e3139392e3933, '2016-01-24 06:34:30', 1),
       (56, 'txn_4rX4ydAuaWCC3h', 3, 6, '49.99', '0.00', '0.00', '49.99', 'USD', 'PayPal', 0x322e3233382e3235312e3536, '2016-01-15 08:41:07', 1),
       (57, 'txn_4rX4ydAuaWCC3h', 4, 7, '5.99', '0.00', '0.00', '5.99', 'USD', 'PayPal', 0x34392e3131362e32362e313633, '2016-04-28 17:00:23', 1),
       (58, 'txn_4rX4ydAuaWCC3h', 3, 8, '9.99', '0.00', '0.00', '9.99', 'USD', 'PayPal', 0x3133302e3137382e3233322e3735, '2016-04-24 23:22:41', 1),
       (59, 'txn_4rX4ydAuaWCC3h', 1, 9, '19.99', '0.00', '0.00', '19.99', 'USD', 'PayPal', 0x34392e392e38322e3732, '2016-02-18 09:55:42', 1),
       (60, 'txn_4rX4ydAuaWCC3h', 2, 10, '49.99', '0.00', '0.00', '49.99', 'USD', 'PayPal', 0x32302e3232372e3134342e3733, '2016-04-18 23:56:18', 1),
       (61, 'txn_4rX4ydAuaWCC3h', 3, 11, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x32312e36362e34342e313935, '2016-02-19 04:43:55', 1),
       (62, 'txn_4rX4ydAuaWCC3h', 2, 12, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x32362e3135342e34392e323532, '2016-06-12 01:11:29', 1),
       (63, 'txn_4rX4ydAuaWCC3h', 3, 13, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x31382e3231382e3134302e313132, '2016-04-26 11:55:26', 1),
       (64, 'txn_4rX4ydAuaWCC3h', 3, 14, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x35342e3132382e3230332e3731, '2016-06-28 12:22:23', 1),
       (65, 'txn_4rX4ydAuaWCC3h', 4, 15, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x3232392e3139312e33332e3630, '2016-08-21 14:47:14', 1),
       (66, 'txn_4rX4ydAuaWCC3h', 4, 16, '9.99', '0.00', '0.00', '9.99', 'USD', '2Checkout', 0x3136362e3235302e3235352e313736, '2016-06-05 06:57:15', 1),
       (67, 'txn_4rX4ydAuaWCC3h', 3, 17, '19.99', '0.00', '0.00', '19.99', 'USD', '2Checkout', 0x3135302e36342e3231312e313132, '2016-05-06 23:52:13', 1),
       (68, 'txn_4rX4ydAuaWCC3h', 2, 21, '49.99', '0.00', '0.00', '49.99', 'USD', '2Checkout', 0x3138392e3233352e3133392e37, '2016-04-25 19:35:07', 1),
       (69, 'txn_4rX4ydAuaWCC3h', 1, 2, '5.99', '0.00', '0.00', '5.99', 'USD', '2Checkout', 0x3130342e3130332e38332e313535, '2016-03-28 04:29:11', 1),
       (70, 'txn_4rX4ydAuaWCC3h', 1, 3, '9.99', '0.00', '0.00', '9.99', 'USD', '2Checkout', 0x3132382e3138332e3234322e323437, '2016-05-22 02:14:58', 1),
       (71, 'txn_4rX4ydAuaWCC3h', 4, 4, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x3136342e39392e3233362e313735, '2016-07-05 06:44:22', 1),
       (72, 'txn_4rX4ydAuaWCC3h', 4, 5, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x3133392e32332e39382e3135, '2016-03-29 17:10:32', 1),
       (73, 'txn_4rX4ydAuaWCC3h', 2, 6, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x35302e3233312e3133302e313033, '2016-05-01 06:46:16', 1),
       (74, 'txn_4rX4ydAuaWCC3h', 4, 7, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x3130322e34342e3136312e313033, '2016-05-29 05:44:22', 1),
       (75, 'txn_4rX4ydAuaWCC3h', 2, 8, '19.99', '0.00', '0.00', '19.99', 'USD', '2Checkout', 0x382e3232312e3136312e323038, '2016-04-19 05:43:36', 1),
       (76, 'txn_4rX4ydAuaWCC3h', 2, 9, '49.99', '0.00', '0.00', '49.99', 'USD', '2Checkout', 0x39362e39322e32352e313736, '2016-03-01 03:18:15', 1),
       (77, 'txn_4rX4ydAuaWCC3h', 4, 10, '5.99', '0.00', '0.00', '5.99', 'USD', '2Checkout', 0x38362e39342e3131382e3237, '2016-03-22 13:50:15', 1),
       (78, 'txn_4rX4ydAuaWCC3h', 2, 11, '9.99', '0.00', '0.00', '9.99', 'USD', '2Checkout', 0x3231322e36302e392e3231, '2016-02-07 17:01:32', 1),
       (79, 'txn_4rX4ydAuaWCC3h', 2, 12, '19.99', '0.00', '0.00', '19.99', 'USD', '2Checkout', 0x38362e3233302e38392e3130, '2016-04-01 04:46:53', 1),
       (80, 'txn_4rX4ydAuaWCC3h', 3, 13, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x37332e38382e33312e313032, '2016-06-27 00:31:46', 1),
       (81, 'txn_4rX4ydAuaWCC3h', 4, 14, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x34332e32362e3135392e313437, '2016-01-13 07:15:42', 1),
       (82, 'txn_4rX4ydAuaWCC3h', 2, 15, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x34312e31392e3135352e323531, '2016-01-14 23:10:50', 1),
       (83, 'txn_4rX4ydAuaWCC3h', 4, 16, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x3134352e35322e38332e3536, '2016-07-01 22:32:15', 1),
       (84, 'txn_4rX4ydAuaWCC3h', 3, 17, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x3233362e39322e31342e323134, '2016-05-27 02:15:02', 1),
       (85, 'txn_4rX4ydAuaWCC3h', 3, 21, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x3232312e3138332e3136382e3134, '2016-03-19 20:31:19', 1),
       (86, 'txn_4rX4ydAuaWCC3h', 4, 2, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x32342e3135312e37362e3730, '2016-05-20 19:13:10', 1),
       (87, 'txn_4rX4ydAuaWCC3h', 4, 3, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x3134342e3230312e3232302e3334, '2016-03-14 04:14:42', 1),
       (88, 'txn_4rX4ydAuaWCC3h', 4, 4, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x3232392e3133332e3232342e3531, '2016-05-09 07:32:40', 1),
       (89, 'txn_4rX4ydAuaWCC3h', 4, 5, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x3130342e3231362e38372e323233, '2016-05-10 12:31:38', 1),
       (90, 'txn_4rX4ydAuaWCC3h', 1, 6, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x34362e3231322e39372e323239, '2016-02-01 04:33:07', 1),
       (91, 'txn_4rX4ydAuaWCC3h', 2, 7, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x3232302e34362e3131342e313335, '2016-06-20 12:20:21', 1),
       (92, 'txn_4rX4ydAuaWCC3h', 2, 8, '49.99', '2.99', '0.00', '49.99', 'USD', 'Stripe', 0x31362e3232332e3138372e3738, '2016-08-21 20:01:11', 1),
       (93, 'txn_4rX4ydAuaWCC3h', 1, 9, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x34342e3136392e3232332e3438, '2016-06-07 22:46:55', 1),
       (94, 'txn_4rX4ydAuaWCC3h', 4, 10, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x3133382e3133372e3136312e323533, '2016-04-17 08:01:26', 1),
       (95, 'txn_4rX4ydAuaWCC3h', 3, 11, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x3137342e3235312e34302e3935, '2016-01-25 04:42:45', 1),
       (96, 'txn_4rX4ydAuaWCC3h', 2, 12, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x3234332e31332e3235322e3335, '2016-05-26 01:22:23', 1),
       (97, 'txn_4rX4ydAuaWCC3h', 3, 13, '5.99', '0.00', '0.00', '5.99', 'USD', 'Stripe', 0x3234302e37392e3138392e313830, '2016-03-27 14:38:15', 1),
       (98, 'txn_4rX4ydAuaWCC3h', 3, 14, '9.99', '0.00', '0.00', '9.99', 'USD', 'Stripe', 0x3132382e3135322e3137302e313634, '2016-05-16 06:10:21', 1),
       (99, 'txn_4rX4ydAuaWCC3h', 4, 15, '19.99', '0.00', '0.00', '19.99', 'USD', 'Stripe', 0x39362e3136362e3135352e323135, '2016-05-19 03:58:45', 1),
       (100, 'txn_4rX4ydAuaWCC3h', 2, 16, '49.99', '0.00', '0.00', '49.99', 'USD', 'Stripe', 0x3231332e3134342e3137332e3837, '2016-06-08 02:55:50', 1);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fname`, `lname`, `email`, `membership_id`, `mem_expire`, `hash`, `token`, `userlevel`, `sesid`, `type`, `trial_used`, `lastlogin`, `lastip`, `login_info`, `login_status`, `avatar`, `address`, `city`, `state`, `zip`, `country`, `user_files`, `notes`, `newsletter`, `stripe_cus`, `stripe_pm`, `custom_fields`, `active`, `created`)
VALUES (2, 'adean0', 'Adam', 'Dean', 'adean0@google.com', 1, '2023-07-27 21:12:05', 'lJb2OY9iJw', '0', 1, '0', 'member', 0, '2016-01-04 15:40:31', 0x36372e31372e3230392e3635, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'b', '2015-10-27 10:46:36'),
       (3, 'jrussell1', 'Joe', 'Russell', 'jrussell1@ameblo.jp', 0, NULL, '$2a$10$weEB4PIcfUFTFwsqKMx8n.gTWu4DFpt6JlP7AOhcbwwk8U0wJJfAa', '0', 1, '0', 'member', 0, '2016-03-28 01:48:09', 0x3135372e36332e38302e313931, NULL, 0, NULL, '', '', '', '', 'CA', '0', '', 1, NULL, NULL, 'NA', 'y', '2015-10-25 06:58:34'),
       (4, 'tfields2', 'Timothy', 'Fields', 'tfields2@intel.com', 0, NULL, '3CFHV0lyyZD', '0', 1, '0', 'member', 0, '2016-02-28 17:18:17', 0x3131312e3139302e3136392e3435, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-08-01 17:46:02'),
       (5, 'hreyes3', 'Henry', 'Reyes', 'hreyes3@chron.com', 0, NULL, 'FNQB0g', '0', 7, '0', 'editor', 0, '2015-07-11 17:49:47', 0x312e3130362e3136372e3738, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2016-01-19 04:16:26'),
       (6, 'sryan4', 'Steven', 'Ryan', 'sryan4@spotify.com', 4, '2021-02-15 17:02:55', '4onG2AWLXW', '0', 1, '0', 'member', 0, '2015-07-03 23:05:28', 0x3137382e35392e3135372e3634, NULL, 0, NULL, '', '', '', '', 'CA', '0', '', 1, NULL, NULL, NULL, 'y', '2016-02-09 23:39:50'),
       (7, 'smartin5', 'Stephen', 'Martin', 'smartin5@nifty.com', 0, NULL, 'VKEh5bwWKv', '0', 1, '0', 'member', 0, '2015-09-23 21:49:19', 0x35392e3139382e3133342e32, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-09-17 13:05:39'),
       (8, 'kbutler6', 'Keith', 'Butler', 'kbutler6@samsung.com', 1, '2020-11-06 00:00:00', 'kPSPPu4VJ', '0', 1, '0', 'member', 0, '2015-08-12 19:08:43', 0x3232322e3234312e3134352e313830, NULL, 0, NULL, '', '', '', '', 'CA', '21', '', 1, NULL, NULL, NULL, 'y', '2016-04-27 02:44:30'),
       (9, 'bcook7', 'Betty', 'Cook', 'bcook7@arstechnica.com', 0, NULL, 'PZBrJCykQY', '0', 1, '0', 'member', 0, '2016-02-29 15:05:09', 0x36332e3132342e3234372e313931, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-07-13 07:19:49'),
       (10, 'kmontgomery8', 'Kelly', 'Montgomery', 'kmontgomery8@jigsy.com', 2, '2016-12-22 13:13:12', 'PUxQiB', '0', 1, '0', 'member', 0, '2015-11-26 20:47:26', 0x3231352e3135352e3137302e313539, NULL, 0, 'av4.jpg', '', '', 'Alabama', '0', 'CA', '0', '', 1, NULL, NULL, NULL, 'b', '2016-03-23 10:13:45'),
       (11, 'khart9', 'Kenneth', 'Hart', 'keneth.h@email.com', 2, '2016-12-27 13:13:12', '$2a$10$MWxdiPxA17FkAaGUXhMBi.yvQx6y.iNFPzkpAv5ifR.PHFdv.0b9S', '1234567879', 1, '0', 'member', 0, '2015-07-01 09:07:16', 0x36372e3139302e37322e3535, NULL, 0, NULL, '', '', '', '', '', '2,6', '', 1, NULL, NULL, NULL, 'n', '2015-12-25 16:29:37'),
       (12, 'rdiaza', 'Rose', 'Diaz', 'rdiaza@zdnet.com', 0, NULL, '$2a$10$L..NwF88Gcnz6WwzTSjWI.yr7380z36pe.RInVwfoGTCogGjGB3iq', '0', 1, '0', 'member', 0, '2020-11-29 12:10:18', 0x3132372e302e302e31, NULL, 0, 'av6.jpg', '', '', '', '', 'CA', '2,3,4,5', '', 1, NULL, NULL, 'Na', 'y', '2016-03-21 04:46:11'),
       (13, 'cbowmanb', 'Christina', 'Bowman', 'cbowmanb@toplist.cz', 0, NULL, 'fR6CGo', '0', 8, '0', 'staff', 0, '2015-08-10 06:40:32', 0x38302e3130372e3132382e323236, NULL, 0, 'av3.jpg', NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2016-04-17 02:35:52'),
       (14, 'nclarkc', 'Norma', 'Clark', 'nclarkc@photobucket.com', 0, NULL, '1XbKgN4eta', '0', 1, '0', 'member', 0, '2015-08-02 13:58:09', 0x3233332e3231382e3130322e3338, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-08-01 07:40:01'),
       (15, 'bcarrolld', 'Bobby', 'Carroll', 'bcarrolld@studiopress.com', 0, NULL, 'TYovRT', '0', 1, '0', 'member', 0, '2016-01-11 23:09:47', 0x3133352e3139332e3136352e3837, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-07-11 05:12:08'),
       (16, 'gwoode', 'Gary', 'Wood', 'gwoode@ovh.net', 0, NULL, '5ssS8HaelP', '0', 1, '0', 'member', 0, '2016-03-03 05:20:09', 0x3233362e32302e3234382e323332, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-10-20 08:18:10'),
       (17, 'byoungf', 'Bonnie', 'Young', 'byoungf@samsung.com', 0, NULL, 'VmkMDwxWuW', '0', 1, '0', 'member', 0, '2015-08-13 22:00:34', 0x34322e38382e35372e313333, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-10-10 14:07:44'),
       (18, 'rcunninghamg', 'Ralph', 'Cunningham', 'rcunninghamg@amazon.co.jp', 0, NULL, 'EORNbgXTQLvp', '0', 1, '0', 'member', 0, '2015-12-06 00:07:08', 0x3132302e3138392e3133332e323534, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-10-27 17:37:18'),
       (19, 'jcooperh', 'Joyce', 'Cooper', 'jcooperh@xrea.com', 0, NULL, 'QQqkTzEudI', '0', 1, '0', 'member', 0, '2015-09-19 06:36:16', 0x3232332e3133332e3138372e313938, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, NULL, NULL, NULL, 'y', '2015-09-10 14:51:46'),
       (20, 'scastilloi', 'Steve', 'Castillo', 'scastilloi@apple.com', 3, '2017-02-24 21:12:46', 'HOsXFAee9s0', '0', 1, '0', 'member', 0, '2015-12-21 00:40:06', 0x3234362e3137332e3137392e3132, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', 1, NULL, NULL, NULL, 't', '2016-01-21 23:00:05');


--
-- Dumping data for table `user_memberships`
--

INSERT INTO `user_memberships` (`id`, `transaction_id`, `user_id`, `membership_id`, `activated`, `expire`, `recurring`, `active`)
VALUES (1, 85, 20, 4, '2016-07-03 20:57:38', '2016-10-27 05:48:32', 1, 1),
       (2, 106, 20, 2, '2020-01-17 19:15:56', '2020-02-17 19:15:56', 1, 1),
       (3, 107, 3, 5, '2020-06-23 22:29:47', '2020-06-30 22:29:47', 0, 1),
       (4, 108, 10, 5, '2020-06-23 22:36:21', '2020-06-30 22:36:21', 0, 1);
