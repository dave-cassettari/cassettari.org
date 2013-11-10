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
$files = glob($dir . '/*.[jJ][pP][gG]');
$max = isset($_REQUEST['tiles']) ? intval($_REQUEST['tiles']) : 1;
$max = min($max, sizeof($files));

shuffle($files);

for ($i = 0; $i < $max; $i++)
{
	?>
	<a href='<?php echo $files[$i]; ?>' class='tile is-loading'>
		<img src='<?php echo thumbnail($files[$i], 200); ?>'/>
	</a>
<?php
}
