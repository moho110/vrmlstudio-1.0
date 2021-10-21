--TEST--
Check if vrmlstudio is loaded
--SKIPIF--
<?php
if (!extension_loaded('vrmlstudio')) {
	echo 'skip';
}
?>
--FILE--
<?php
echo 'The extension "vrmlstudio" is available';
?>
--EXPECT--
The extension "vrmlstudio" is available
