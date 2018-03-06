<?php
namespace Fmw\Core\Model;

class ModuleModel extends \Fmw\Core\Model
{

	function getPath($scope, $type)
	{
		global $_config;
		$base = '';

		if ($scope == 'core') {
			$base = __core . '/mod';
		} else {
			$base = $_config->mod['path'];
		}

		$dir = $base . '/' . $this->name . '/' . $type;
		if (is_r($dir)) {

			$this->dir = $dir;
			$path = $dir . '/module.php';

			if (is_r($path)) {

				$this->path = $path;
				return $path;
			}
		}
		return false;
	}

	function getModule($id = false)
	{
		require_once $this->path;
		$classTitle = $this->name . 'Module';
		return new $classTitle($id);
	}

	static function getByName($name)
	{
		$name = getStr($name);
		if ($name) {
			$mod = new self;
			$mod->name = $name;
			if ($mod->findOne()) {
				return $mod;
			}
		}
		return false;
	}

	static function getIdByName($name)
	{
		$mod = self::getByName($name);
		if ($mod) {
			return $mod->id;
		}
		return false;
	}

	/**
	 * pass list from db and compare list from fs
	 * @global type $_config
	 * @param type $list
	 * @return type
	 */
	function getUnregModList($list)
	{
		global $_config;
		$return = array();
		$base = $_config->mod['path'];

		// put type to regmod path
		//foreach
		// get list from fs
		$dirList = $this->getModDirList();
		if ($dirList) {

			// traverse list from db
			foreach ($list as $type => $regMods) {

				if ($regMods) {
					foreach ($regMods as $regMod) {
						// rm reg mods from all mods
						if (in_array($regMod->name, $dirList[$type])) {
							unset($dirList[$type][$regMod->name]);
						}
					}
				}
			}
		}
		return $dirList;
	}

	function getModDirList()
	{
		global $_config;
		$return['in'] = $return['out'] = array();
		$base = $_config->mod['path'];
		$types = array('in', 'out');

		// iterates all mod dirs
		foreach (new \DirectoryIterator($base) as $fileInfo) {
			if ($fileInfo->isDot())
				continue;
			$filename = $fileInfo->getFilename();
			if ($filename != 'clean') {
				foreach ($types as $type) {
					if (is_r($fileInfo->getPathname() . '/' . $type . '/module.php')) {
						$return[$type][$filename] = $filename;
					}
				}
			}
		}
		return $return;
	}

	function isModDir($name, $type = 'in')
	{
		
	}
}

?>
