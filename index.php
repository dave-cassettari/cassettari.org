<?php

//include('functions.php');

$files = glob('images/resized/*.jpg');

shuffle($files);

$index = array_rand($files);
$file = $files[$index];

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>

	<title>cassettari.org</title>

	<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'>

	<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:300'/>
	<link rel='stylesheet' type='text/css' href='/css/compiled/v3.css'/>
</head>
<body>

<h1 class='title'>cassettari.org</h1>

<div class='backgrounds'>
	<img src='<?php echo $file; ?>'/>
</div>

<div class='projects'>
	<a class='project' target='_blank' href='http://www.102labs.com/'>
		<img class='project-image' src='/images/projects/102.jpg'/>
		<span class='project-name'>102labs</span>
	</a>

	<a class='project' target='_blank' href='https://www.investinme.co.uk/'>
		<img class='project-image' src='/images/projects/iim.jpg'/>
		<span class='project-name'>Invest In Me</span>
	</a>

	<a class='project' target='_blank' href='https://www.db.com/index_e.htm'>
		<img class='project-image' src='/images/projects/db.jpg'/>
		<span class='project-name'>Deutsche Bank</span>
	</a>
</div>

<script src='/js/jquery.js'></script>
<script src='/js/imagesloaded.js'></script>
<script src='/js/tiles.js'></script>
</body>
</html>
