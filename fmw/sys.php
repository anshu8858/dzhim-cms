<?php
namespace Fmw;

class Sys
{

	function __construct()
	{
		// ini_set('display_errors', TRUE);
		define('__core', __fmw . '/core');
		$fnPath = __core . '/fn.php';
		require_once $fnPath;
		setErrorReporting();
		setDefLocale();
		if ($this->setAutoload()) {
			if ($this->loadConfig()) {
				return true;
			}
		}
		return false;
	}

	// load config
	function loadConfig()
	{
		global $_config;
		$path = __fmw . '/config.php';
		if (is_r($path)) {
			require_once( $path );

			$_config = new Config();
			return $_config->isOk();
		}
		return false;
	}

	function setAutoload()
	{
		$path = __core . '/Autoload.php';
		if (is_r($path)) {
			require_once( $path );

			// will create class when called
			$autoload = new \Fmw\Core\Autoload();
			spl_autoload_register(array($autoload, 'register'));
			//spl_autoload_extensions('.php');
			//spl_autoload_register();

			return true;
		}
		return false;
	}
}

?>
