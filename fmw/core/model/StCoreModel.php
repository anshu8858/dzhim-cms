<?php
namespace Fmw\Core\Model;

class StCoreModel extends StModel
{

	public $defTab = '_st_core';

	static function getByDir($dir)
	{
		$dir = getStr($dir);
		if ($dir) {
			$mod = new self;
			$mod->dir = $dir;
			if ($mod->findOne()) {
				return $mod;
			}
		}
		return false;
	}

	static function getIdByDir($dir)
	{
		$mod = self::getByDir($dir);
		if ($mod) {
			return $mod->id;
		}
		return false;
	}
}

?>
