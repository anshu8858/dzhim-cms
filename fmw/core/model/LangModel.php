<?php
namespace Fmw\Core\Model;

class LangModel extends \Fmw\Core\Model
{

	public $defTab = '_lang';

	function move($direction)
	{
		$neighbour = new self;
		switch ($direction) {
			case 'up':
				$neighbour->weight = $this->weight - 1;
				break;
			case 'down':
				$neighbour->weight = $this->weight + 1;
				break;
			default :
				return false;
		}
		$neighbour->_filter = 1;
		if ($neighbour->findOne()) {
			$neighbourWeight = $neighbour->weight;
			$neighbour->weight = $this->weight;
			$this->weight = $neighbourWeight;
			$this->update();
			$neighbour->update();
			return true;
		}
		return false;
	}

	/**
	 * get default lang
	 * @param type $field
	 * @return \self|boolean
	 */
	static function getDefLang($field)
	{
		$mod = new self;
		$mod->_filter = 1;
		$mod->is_def = 1;
		if ($mod->findOne()) {
			if ($field) {
				return $mod->$field;
			}
			return $mod;
		}
		return false;
	}

	function setWeight()
	{
		$this->weight = $this->getLastWeight() + 1;
	}

	function getLastWeight()
	{
		$mod = new self;
		$mod->_orderBy = 'weight DESC';
		$list = $mod->getList(1);
		if ($list) {
			$last = array_pop($list);
			$weight = $last->weight;
			return $weight;
		}
		return 1;
	}

	function setDefLang()
	{
		$st = new self;
		$st->_filter = 1;
		$st->is_def = 1;
		$list = $st->getList();
		if ($list) {
			foreach ($list as $item) {
				$item->is_def = 0;
				$item->update();
			}
		}
		$this->is_def = 1;
		return true;
	}

	static function get($langId = false, $field = false)
	{
		if (!$langId) {
			global $_web;
			if (isset($_web->langId) && $_web->langId) {
				$langId = $_web->langId;
			}
		}

		if ($langId) {
			// get active langs three char
			$lang = new LangModel();
			$lang->_filter = 1;
			$lang->id = $langId;
			if ($lang->findOne()) {
				if ($field) {
					return $lang->$field;
				}
				return $lang;
			}
		}

		return false;
	}

	static function getActiveList()
	{
		$mod = new \Fmw\Core\Model\LangModel();
		$mod->addCommonFilter();
		$mod->addCommonOrder();
		return $mod->getList();
	}

	function addCommonOrder()
	{
		$this->_orderBy = 'weight';
	}

	function addCommonFilter()
	{
		$this->_filter = 1;
		$this->status = 'active';
	}
	/*
	  function beforeInsert() {
	  $this->path = win2utf8( $this->path );
	  }
	 * 
	 */
}

?>
