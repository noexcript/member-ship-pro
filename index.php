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

const _WOJO = true;

include('init.php');
$core = App::Core();

include('./routes/web.php');
include('./routes/api.php');
