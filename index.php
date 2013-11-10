<?php

function randomFile($dir = 'images/backgrounds')
{
	$files = glob($dir . '/*.jpg');
	$file  = array_rand($files);

	return $files[$file];
}

$background = randomFile();

?>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class='no-js lt-ie9 lt-ie8 lt-ie7'> <![endif]-->
<!--[if IE 7]>
<html class='no-js lt-ie9 lt-ie8'> <![endif]-->
<!--[if IE 8]>
<html class='no-js lt-ie9'> <![endif]-->
<!--[if gt IE 8]><!-->
<html class='no-js'> <!--<![endif]-->
<head>
	<meta charset='utf-8'>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>

	<title>cassettari.org</title>

	<meta name='description' content=''>
	<meta name='viewport'
	      content='width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no'>

	<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300'/>
	<link rel='stylesheet' type='text/css' href='css/compiled/style.css'/>
</head>
<body>

<div class='background' style='background-image: url("<?php echo '/' . $background; ?>");'></div>

<h1>cassettari.org</h1>

<div class='slideshow'>

	<a class='nav-prev' href=''>&laquo;</a>
	<a class='nav-next' href=''>&raquo;</a>

	<ul class='projects'>
		<li>
			<a target='_blank' href='https://www.db.com/index_e.htm'>
				<img src='images/projects/db.jpg' alt=' '/>
			</a>
		</li>
		<li class='is-selected'>
			<a target='_blank' href='http://www.102labs.com/'>
				<img src='images/projects/102.jpg' alt='102labs'/>
			</a>
		</li>
		<li>
			<a target='_blank' href='https://www.investinme.com/'>
				<img src='images/projects/iim.jpg' alt=' '/>
			</a>
		</li>
	</ul>
</div>

<nav>
	<a href='https://www.db.com/index_e.htm'>Deutsche Bank</a>
	<a class='is-selected' href='http://www.102labs.com/'>102labs</a>
	<a href='https://www.investinme.com/'>Invest In Me</a>
</nav>

<script src='/js/jquery.js'></script>
<script src='/js/controller.js'></script>
</body>
</html>
