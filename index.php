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
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>

	<title>cassettari.org</title>

	<meta name='description' content=''>
	<meta name='viewport' content='width=device-width, initial-scale=1'>

	<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300'/>
	<link rel='stylesheet' type='text/css' href='css/compiled/style.css'/>
</head>
<body style='background-image: url("<?php echo '/' . $background; ?>");'>

<div class='content'>
	<h1>cassettari.org</h1>

	<a class='nav-prev' href=''>&laquo;</a>
	<a class='nav-next' href=''>&raquo;</a>

	<ul class='projects'>
		<li class='is-selected'>
			<a href='http://www.102labs.com/'>
				<img src='images/projects/102.jpg' alt='102labs'/>

				<span>102labs</span>
			</a>
		</li>
		<li>
			<a href='https://www.db.com/index_e.htm'>
				<img src='images/projects/db.jpg' alt=' '/>

				<span>Deutsche Bank</span>
			</a>
		</li>
		<li>
			<a href='https://www.investinme.com/'>
				<img src='images/projects/iim.jpg' alt=' '/>

				<span>Invest In Me</span>
			</a>
		</li>
	</ul>
</div>

<script src='/js/jquery.js'></script>
<script src='/js/controller.js'></script>
</body>
</html>
