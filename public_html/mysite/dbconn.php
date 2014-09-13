<?php
// Check which server we are on
switch ($_SERVER['SERVER_NAME']) {
	case 'lyc.local':
		// Set DB connection
		$server 	= 'localhost';
		$username 	= 'root';
		$password 	= '';
		$database 	= 'loveyour_ss';
		break;
	default:
		// Set DB connection
		$server 	= 'localhost';
		$username 	= 'loveyour_lyc';
		$password 	= 'jWl56ef0H82182R';
		$database 	= 'loveyour_ss';
		break;
}
?>