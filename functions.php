<?php

function get_files($dir = 'images/photos')
{
	return glob($dir . '/*.jpg');
}

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