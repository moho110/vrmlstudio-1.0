--TEST--
vrmlstudio_test1() Basic test
--SKIPIF--
<?php
if (!extension_loaded('vrmlstudio')) {
	echo 'skip';
}
?>
--FILE--
<?php
$ret = vrmlstudio_test1();

var_dump($ret);
?>
--EXPECT--
The extension vrmlstudio is loaded and working!
NULL
