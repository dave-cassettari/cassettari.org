<?php

function thumbnail($file, $size)
{
	$thumbnail_file = str_replace('photos/', 'thumbs/', $file);

	if (!file_exists($thumbnail_file))
	{
		$image  = imagecreatefromjpeg($file);
		$width  = imagesx($image);
		$height = imagesy($image);
		$small  = NULL;

		if ($width > $height)
		{
			$y     = 0;
			$x     = ($width - $height) / 2;
			$small = $height;
		}
		else
		{
			$x     = 0;
			$y     = ($height - $width) / 2;
			$small = $width;
		}

		$thumbnail = imagecreatetruecolor($size, $size);

		imagecopyresized($thumbnail, $image, 0, 0, $x, $y, $size, $size, $small, $small);

		imagejpeg($thumbnail, $thumbnail_file);
		imagedestroy($thumbnail);
		imagedestroy($image);
	}

	return $thumbnail_file;
}

$dir = 'images/photos';
$files = glob($dir . '/*.jpg');

shuffle($files);

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
	<h1 class='tile title'>cassettari.org</h1>

	<a class='tile is-loading' target='_blank' href='http://www.102labs.com/'>
		<img src='/images/projects/102.jpg'/>
		<span class='label'>102labs</span>
	</a>

	<a class='tile is-loading' target='_blank' href='https://www.investinme.co.uk/'>
		<img src='/images/projects/iim.jpg'/>
		<span class='label'>Invest In Me</span>
	</a>

	<a class='tile is-loading' target='_blank' href='https://www.db.com/index_e.htm'>
		<img src='/images/projects/db.jpg'/>
		<span class='label'>Deutsche Bank</span>
	</a>

	<?php

	for ($i = 0; $i < sizeof($files); $i++)
	{
		$title = pathinfo($files[$i], PATHINFO_FILENAME);

		?>
		<a class='tile is-loading' target='_blank' href='<?php echo $files[$i]; ?>'>
			<img src='<?php echo thumbnail($files[$i], 200); ?>'/>
			<span class='label'><?php echo $title; ?></span>
		</a>
	<?php
	}

	?>
</div>

<script src='/js/jquery.js'></script>
<script src='/js/imagesloaded.js'></script>
<script src='/js/tiles.js'></script>
</body>
</html>
