<?php

	function Connection(){
		$server="localhost";
		$user="slogf_light";
		$pass="lopk.000";
		$db="slogf_light";
	   	
		$connection = mysql_connect($server, $user, $pass);

		if (!$connection) {
	    	die('MySQL ERROR: ' . mysql_error());
		}
		else
		echo("fine");
		
		mysql_select_db($db) or die( 'MySQL ERROR: '. mysql_error() );

		return $connection;
	}
?>
