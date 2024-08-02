<?php

/**
 * index
 *
 * @package Wojo Framework
 * @author wojoscripts.com
 * @copyright 2023
 * @version 5.0: index.php, v1.00 7/1/2023 4:41 PM Gewa Exp $
 *
 */

const _Devxjs = true;

include('init.php');
$core = App::Core();
$router = new Router();
$tpl = App::View(BASEPATH . 'view/');

include('./routes/web.php');
