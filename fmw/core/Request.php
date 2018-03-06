<?php
namespace Fmw\Core;

class Request
{

	private $type;
	private $catid = false;
	private $mod;

	function __construct($type = 'out')
	{
		session_start();
		$this->type = $type;
	}

	function getUri()
	{
		$uri = '';
		if (isset($_SERVER['SCRIPT_URL'])) {
			$uri = $_SERVER['SCRIPT_URL'];
		} else {
			$uri = $_SERVER['REQUEST_URI'];
			$uri = str_replace('/pub', '', $uri);
		}

		// $uri will be used for database lookup where
		// URI is stored without the query (?) part.
		$uri = $this->getUriWithoutQuery($uri);

		return $uri;
	}

	/**
	 * Returns the passed $uri without the query part (?).
	 * @param type $uri
	 * @return type
	 */
	public function getUriWithoutQuery($uri)
	{

		// Splits the $uri in chunks by the '?' symbol.
		$uriParts = explode('?', $uri);

		// Returns the first chunk if has otherwise returns empty.
		return empty($uriParts[0]) ? '' : $uriParts[0];
	}

	function parse()
	{
		/*
		  $srv = $_SERVER;
		  ksort($srv);
		  prex(   $srv );
		 * 
		 */
		$uri = $this->getUri();
		$this->st = $this->getStItem($uri);

		// get cat
		if ($this->st) {
			$this->loadStMod();
			return true;

			// get cat item
		} else {
			$catDirArr = explode('/', $uri);
			$recStr = array_pop($catDirArr);
			$this->rec_str = $this->getRecStr($recStr);
			$recId = getPosNum($this->rec_str);
			if ($recId) {
				$this->rec_id = $recId;
			}
			$catDir = implode('/', $catDirArr);
			$this->st = $this->getStItem($catDir);

			if ($this->st) {
				$this->loadStMod();
				return true;
			}
		}
		return false;
	}

	/**
	 * get records id from last uri part
	 * @param type $str
	 * @return boolean
	 */
	function getRecStr($str)
	{
		$arr = explode('-', $str);
		if (isset($arr[0])) {
			return $arr[0];
		}
		return false;
	}

	function getStItem($dir)
	{
		$uriStart = substr($dir, 0, 6);

		// handle admin / pub req
		if ($uriStart == '/admin') {
			$st = new Model\StCoreModel();
		} else {
			$st = new Model\StModel();
		}
		if ($dir == '/') {
			$langId = Model\LangModel::getDefLang('id');
			if ($st->getDefCat($langId)) {
				return $st;
			}
		} else {
			$st->dir = $dir;
			if ($st->findOne()) {
				return $st;
			}
		}

		return false;
	}

	function loadStMod()
	{
		global $_web;
		$_web = new \stdClass();
		$out = new Model\OutModuleModel();
		if ($out->load($this->st->out)) {
			$path = $out->getPath($this->st->type);
			if ($path) {
				$_web->cat = $this->st;
				$_web->mod = $out;
				if (isset($this->rec_id)) {
					$_web->rec_id = $this->rec_id;
				}
				if (isset($this->rec_str)) {
					$_web->rec_str = $this->rec_str;
				}
				$_web->langId = $this->getActiveLangId();
				$this->loadMod();
			}
		}
	}

	function getActiveLangId()
	{
		global $_config, $_web;
		if (isset($_web->cat->lang_id)) {
			$catId = getPosNum($_web->cat->lang_id);
		} else {
			if (isset($_config->lang['id'])) {
				$catId = getPosNum($_config->lang['id']);
			}
		}
		if ($catId) {
			return $catId;
		}
		return 1;
	}

	// load module
	function loadMod()
	{
		global $_web;
		$module = $_web->mod->getModule($this->catid);
		$this->loadLayout($module);
	}

	function loadLayout($module)
	{
		$layout = $this->st->getLayout();
		if ($layout) {
			global $_web, $_config;

			$module->smarty->assign('_home', $_config->home);
			$module->smarty->assign('_web', $_web);

			$layoutFile = $this->st->getLayoutFile($layout->name, $this->st->type);
			$tplStr = $module->getTemplStr($_web->mod->dir, $layoutFile);

			if ($tplStr) {
				$module->smarty->display($tplStr);
			}
		} else {
			prex('Layout is not set');
		}
	}
}

?>
