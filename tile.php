<?php

include('functions.php');

$files = get_files();
$exclude = (isset($_GET['exclude']) && is_array($_GET['exclude'])) ? $_GET['exclude'] : array();
$available = array();

foreach ($files as $file)
{
	if (!in_array($file, $exclude))
	{
		$available[] = $file;
	}
}

if (sizeof($available) == 0)
{
	exit;
}

shuffle($available);

$i = array_rand($available);
$file = $available[$i];
$title = pathinfo($file, PATHINFO_FILENAME);

?>
<a target='_blank' href='<?php echo $file; ?>'>
	<img src='<?php echo thumbnail($file, 200); ?>'/>
	<span class='label'><?php echo $title; ?></span>
</a>