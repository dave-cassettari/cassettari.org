<?php

$dir = 'images/photos';
$files = glob($dir . '/*.[jJ][pP][gG]');
$file = array_rand($files);

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>

	<title>cassettari.org</title>

	<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'>

	<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300'/>
	<link rel='stylesheet' type='text/css' href='/css/compiled/tiles.css'/>
</head>
<body>

<div class='tiles is-loading'>
	<h1 class='tile is-permanent title'>cassettari.org</h1>
</div>

<script src='/js/jquery.js'></script>
<script src='/js/imagesloaded.js'></script>
<script src='/js/tiles.js'></script>
</body>
</html>
