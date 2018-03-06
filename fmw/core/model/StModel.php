<?php
namespace Fmw\Core\Model;

class StModel extends \Fmw\Core\Model
{

	public $defTab = '_st';

	function setLastWeightOnLevel($parentDir)
	{
		$st = new self;
		$list = $st->getChildren($parentDir, $this->level, 1, 'DESC');
		if ($list) {
			$last = current($list);
			$this->weight = $last->weight + 1;
			return true;
		}
		return false;
	}

	function move($direction)
	{
		$rootLevelCnt = 2;

		// get neighbour cats (same parent and level)
		$dirLevels = explode('/', $this->dir);
		$levelCnt = count($dirLevels);

		// ignore root level (starpage)
		if ($levelCnt > $rootLevelCnt) {

			// throw out this level dir and so then gets parent levels dir
			array_pop($dirLevels);
			$parentDir = implode('/', $dirLevels);

			$st = new self;
			$list = $st->getChildren($parentDir, $this->level);
			$catCnt = count($list);

			// have more than one, so there is something to switch places with
			if ($catCnt > 1) {

				// search for current cat
				for ($i = 0; $i < $catCnt; $i++) { // $list as $item) {
					$item = current($list);

					// found
					if ($item->dir == $this->dir) {

						// find neighbour
						if ($direction == 'up') {
							// up == decrease weight
							$neighbour = prev($list);
						} elseif ($direction == 'down') {
							// down == increase weight
							$neighbour = next($list);
						}

						// partner to switch places
						if ($neighbour) {
							$neighbourWeight = $neighbour->weight;
							$neighbour->weight = $item->weight;
							$item->weight = $neighbourWeight;
							$neighbour->update();
							$item->update();
							return true;
						}
						break;
					}
					next($list);
				}
			}
		}
		return false;
	}

	static function hasInMod($id)
	{
		$st = new self;
		if ($st->load($id)) {
			$in = getPosNum($st->in);
			if ($in) {
				$mmod = new \Fmw\Core\Model\InModuleModel();
				if ($mmod->load($in)) {
					return $mmod;
				}
			}
		}
		return false;
	}

	/**
	 * get lang def cat. freq used for handling / req
	 * @param type $langId
	 * @return boolean
	 */
	function getDefCat($langId)
	{
		$this->_filter = 1;
		$this->is_def = 1;
		$this->lang_id = $langId;
		if ($this->findOne()) {
			return true;
		}
		return false;
	}

	/**
	 * delete tree where root is $this
	 * @return boolean
	 */
	function delTree()
	{
		if (isset($this->dir)) {
			$st = new self;
			$st->_filter = 1;
			$st->_op = array('dir' => 'LIKE');
			$st->dir = $this->dir . '%';
			$list = $st->getList();
			foreach ($list as $item) {
				$item->delete();
			}
			return true;
		}
		return false;
	}

	function getTree($langId)
	{
		$root = $this->getRootByLangId($langId);

		if ($root) {
			$dir = false;

			// active cat is set
			if (isset($this->dir) && $this->dir != $root->dir) {
				$dir = str_replace($root->dir, '', $this->dir);
			} else {
				$dir = $root->dir;
			}
			if ($dir) {
				$dirLevels = explode('/', $dir);

				// remove first empty one
				array_shift($dirLevels);
				$root->addChildren($dirLevels);
				return $root;
			}
		}
		return false;
	}

	function getChildren($dir, $level = false, $limit = false, $order = 'ASC')
	{
		$this->_filter = 1;
		$this->_op = array('dir' => 'LIKE');
		$this->dir = $dir . '%';
		$this->level = $level;
		$this->_orderBy = 'weight ' . $order;
		return $this->getList($limit);
	}

	function addChildren(&$dirLevels)
	{
		$st = new self;
		$list = $st->getChildren($this->dir, $this->level + 1);

		if ($list) {
			$this->children = $list;
			unset($list);
			$levelDir = array_shift($dirLevels);

			foreach ($this->children as &$child) {
				if ($child->dir == $this->dir . '/' . $levelDir) {
					$child->addChildren($dirLevels);
				}
			}
		}
	}

	function getRootByLangId($langId, $field = false)
	{
		$st = new self;
		$st->_filter = 1;
		$st->_op = array('parent_id' => 'IS');
		$st->parent_id = 'NULL';
		$st->lang_id = $langId;
		if ($st->findOne()) {
			if ($field) {
				return $st->$field;
			}
			return $st;
		}
		return false;
	}

	function setUri()
	{
		$uriArr = explode('/', $this->dir);
		if (count($uriArr) > 2) {
			$this->dir = array_pop($uriArr);
			return true;
		}
		return false;
	}

	function setDir($parentDir)
	{
		// Use language's 'three_char' value if this is the root page.
		if ((int) $this->level === 1 && $this->lang_id) {

			$lang = new \Fmw\Core\Model\LangModel();
			if ($lang->load($this->lang_id)) {

				$this->dir = '/' . $lang->three_char;
			}
		} else {

			if ($this->title) {

				$dir = strip_tags($this->title);
				$dir = trim($dir);
				if (strlen($dir)) {
					$dir = getSlug($dir);
					$this->dir = $parentDir . '/' . $dir;
					return true;
				}
			}
		}

		//die('Forbidden dir');
	}

	function getLayout()
	{
		$layout = new \Fmw\Core\Model\LayoutModel();
		if ($this->layout_id) {
			if ($layout->load($this->layout_id)) {
				return $layout;
			}
		}
		return false;
	}

	function getLayoutFile($title, $scope)
	{
		global $_config;
		$base = '';
		$file = '';

		if ($scope == 'core') {
			$base = __core . '/ui/layout';
		} else {
			$base = $_config->layout['path'];
		}

		$file = $base . '/' . $title . '.tpl';
		return $file;
	}

	static
		function getByDir($dir)
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

	static
		function getIdByDir($dir)
	{
		$mod = self::getByDir($dir);
		if ($mod) {
			return $mod->id;
		}
		return false;
	}

	/**
	 * mark specifc langs def cat
	 * @return boolean
	 */
	function setDefCat()
	{
		$st = new self;
		$st->_filter = 1;
		$st->is_def = 1;
		$st->lang_id = $this->lang_id;
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
}

?>
