<?php
namespace Fmw\Core\Out;

class Smarty
{

	public $tplFile = false;

	function setAtuoTplFile($path = false)
	{
		if (!$path) {
			$path = __core . '/ui/input/auto.tpl';
		}
		$this->tplFile = $path;
	}

	function __construct()
	{
		global $_config;
		$smartyDir = __core . '/tool/vendor/smarty/smarty/libs/';
		$path = $smartyDir . 'Smarty.class.php';
		require_once $path;

		$smarty = new \Smarty();

		$smarty->setTemplateDir($_config->layout['path']);
		$smarty->setCompileDir($_config->templ_c['path']);
		$smarty->setCacheDir($_config->cache['path']);
		$smarty->setConfigDir($smartyDir . '/configs');
		$this->setAtuoTplFile();

		//$smarty->force_compile = true;
		//$smarty->debugging = true;
		//$smarty->caching = true;
		//$smarty->cache_lifetime = 120;
		//$smarty->testInstall();
		$this->smarty = $smarty;
	}

	function getTemplStr($modDir, $layoutFile = false)
	{
		$tplStr = false;
		$modTplPath = false;


		//  $smarty->display('extends:layout.tpl|myproject.tpl|mypage.tpl'); 
		// add mod tpl
		if (is_r($modDir . '/def.tpl')) {
			$modTplPath = $modDir . '/def.tpl';
		} elseif ($this->tplFile && is_r($this->tplFile)) {
			$modTplPath = $this->tplFile;
		} else {
			die('Problems with templates.');
		}



		// add layout tpl
		if ($layoutFile && $modTplPath) {
			$tplStr = 'extends:' . $layoutFile . '|' . $modTplPath;
		} else {
			if ($layoutFile) {
				$tplStr = $layoutFile;
			} else {
				$tplStr = $modTplPath;
			}
		}
		return $tplStr;
	}

	function setTempl($name)
	{
		global $_web;
		if (isset($_web->mod->dir)) {
			$this->tplFile = $_web->mod->dir . '/' . $name . '.tpl';
		}
	}
}

?>
