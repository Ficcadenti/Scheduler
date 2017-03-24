<?php

date_default_timezone_set ( 'UTC' );
date_default_timezone_set ( 'Europe/Rome' );

function split_file($source, $targetpath, $lines){
	$i=0;
	$j=1;
	$buffer='';

	$handle = fopen ($source, "r");

	while (!feof ($handle)) {
		$buffer .= fgets($handle, 4096);
		$i++;
		if ($i >= $lines) {
			$fname = $targetpath.".part_".$j.".log";
			saveToFile($buffer, $fname);
			$j++;
			$i=0;
		}
	}
	$fname = $targetpath.".part_".$j.".log";
	saveToFile($buffer, $fname);
	fclose ($handle);
}

function saveToFile(&$buffer, $fname)
{
	if (!$fhandle = fopen($fname, 'w')) {
		echo "Cannot open file ($fname)";
		exit;
	}
	if (!fwrite($fhandle, $buffer)) {
		echo "Cannot write to file ($fname)";
		exit;
	}
	fclose($fhandle);
	$buffer = '';
}


print_r("split_file start\n");

$tstart=time();
split_file("pippo.csv","pippo.csv",10000);
$tstop=time();
$delta=($tstop-$tstart);
print_r("in $delta msec\n");

print_r("split_file stop\n");
?>