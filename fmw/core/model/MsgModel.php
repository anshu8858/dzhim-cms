<?php
namespace Fmw\Core\Model;

class MsgModel extends \Fmw\Core\Model
{

	public $defTab = '_msg';

	function __construct()
	{
		parent::__construct();
	}

	static function getByName($name, $langId = false, $content = false)
	{
		if (!$langId) {
			$langId = LangModel::getDefLang('id');
			if (!$langId) {
				return false;
			}
		}
		$mod = new self;
		$mod->_filter = 1;
		$mod->name = $name;
		$mod->lang_id = $langId;
		if ($mod->findOne()) {
			return $mod->content;
		} elseif ($content) {
			if (self::ins($name, $content)) {
				return $content;
			}
		}
		return false;
	}

	static function ins($name, $content)
	{
		$name = trim($name);
		$name = strip_tags($name);
		if (strlen($name)) {
			$langs = LangModel::getActiveList();
			if ($langs) {
				foreach ($langs as $lang) {
					$mod = new self;
					$mod->name = $name;
					$mod->content = $content;
					$mod->lang_id = $lang->id;
					$mod->insert();
				}
			}
			return true;
		}
		return false;
	}

	static function delByName($name)
	{
		$mod = new self;
		$mod->_filter = 1;
		$mod->name = $name;
		$list = $mod->getList();
		if ($list) {
			foreach ($list as $item) {
				$item->delete();
			}
		}
	}
}

?>
