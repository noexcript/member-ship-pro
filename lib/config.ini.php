<?php 
	/** 
	* Configuration

	* @package Wojo Framework
	* @author wojoscripts.com
	* @copyright 2024
	* @version Id: config.ini.php, v1.00 2024-07-29 03:11:28 gewa Exp $
	*/
 
	 if (!defined("_WOJO")) 
     die('Direct access to this location is not allowed.');
 
	/** 
	* Database Constants - these constants refer to 
	* the database configuration settings. 
	*/
	 const DB_SERVER = 'localhost'; 
	 const DB_USER = 'root'; 
	 const DB_PASS = ''; 
	 const DB_DATABASE = 'members_v2';
	 const DB_DRIVER = 'mysql';
 
	 const INSTALL_KEY = 'HBNmQcOzCdRydx4T'; 
 
	/** 
	* Show Debugger Console. 
	* Display errors in console view. Not recommended for live site. true/false 
	*/
	 const DEBUG = false;
?>