<?php
namespace Fmw\Core;

class Autoload
{

	function register($class)
	{
		$paths = array('fmw' . DIRECTORY_SEPARATOR . 'core', 'fmw' . DIRECTORY_SEPARATOR . 'common');
		$classFile = str_replace('\\', DIRECTORY_SEPARATOR, $class);
		$classPI = pathinfo($classFile);
		$classPath = strtolower($classPI['dirname']);

		foreach ($paths as $path) {
			if (strpos($classPath, $path) !== false) {
				$filePath = __root . DIRECTORY_SEPARATOR . $classPath . DIRECTORY_SEPARATOR . $classPI['filename'] . '.php';
				require_once( $filePath );
			}
		}
	}
}

/*
  <?php
  function shutdown()
  {
  // This is our shutdown function, in
  // here we can do any last operations
  // before the script is complete.

  echo 'Script executed with success', PHP_EOL;
  }

  register_shutdown_function('shutdown');
  ?>
 */

?>