<?php

class cat_settingsModule extends \Fmw\Core\Model\InModel
{

	function __construct()
	{
		parent::__construct();
		if (isset($_POST['submCat'])) {
			$this->submit($_POST['submCat']);
		}
		if (isset($_POST['add'])) {
			$this->add();
		} else {
			$this->addFormData();
			if (isset($_GET['catid'])) {
				$this->getOne($_GET['catid']);
			}
		}
	}

	function submit($op)
	{
		switch ($op) {
			case 'ins':
				$this->ins();
				break;
			case 'upd':
				$this->upd();
				break;
			case 'preview':
				$this->preview();
				break;
			case 'del':
				$this->del();
				break;
			case 'up':
				$this->move($op);
				break;
			case 'down':
				$this->move($op);
				break;
		}
	}

	function ins()
	{
		$st = new \Fmw\Core\Model\StModel();
		$st->setFields($_POST);
		$st->type = 'pub';
		if (isset($_SESSION['cat']['parent']) && $_SESSION['cat']['parent']) {
			$parent = $_SESSION['cat']['parent'];
			$st->setDir($parent ['dir']);
			$st->level = $parent['level'] + 1;
			$st->parent_id = $parent['id'];
			$st->lang_id = $parent['lang_id'];
			$st->setLastWeightOnLevel($parent ['dir']);
			if (isset($_POST['is_def'])) {
				$st->setDefCat();
			}
		} else {
			return false;
		}
		$id = $st->insert();
		if ($id) {
			header('Location: ?catid=' . $id);
			exit();
		}
	}

	function upd()
	{
		$id = $this->getId();
		if ($id) {
			$st = new \Fmw\Core\Model\StModel();
			if ($st->load($id)) {
				$dirArr = explode('/', $st->dir);
				array_pop($dirArr);
				$parentDir = implode('/', $dirArr);
				$st->setFields($_POST);
				if (isset($_POST['is_def'])) {
					$st->setDefCat();
				}
				$st->setDir($parentDir);
				$st->type = 'pub';
				if ($st->update()) {
					return $st;
				}
			}
		}
		return false;
	}

	function preview()
	{
		$cat = $this->upd();
		if ($cat) {
			$this->smarty->assign('previewUrl', $cat->dir);
		}
	}

	function del()
	{
		$id = $this->getId();
		if ($id) {
			$st = new \Fmw\Core\Model\StModel();
			if ($st->load($id)) {
				if ($st->delTree()) {
					if ($st->parent_id) {
						header('Location: /admin/cat/settings?catid=' . $st->parent_id);
					} else {
						header('Location: /admin/cat');
					}

					exit();
				}
			}
		}
		return false;
	}

	function move($direction)
	{
		$id = $this->getId();
		if ($id) {
			$st = new \Fmw\Core\Model\StModel();
			if ($st->load($id)) {
				$st->move($direction);
			}
		}
	}

	function add()
	{
		if (isset($_GET['catid'])) {
			$catid = getPosNum($_GET['catid']);
			if ($catid) {
				$st = new \Fmw\Core\Model\StModel();
				if ($st->load($catid)) {
					$_SESSION['cat']['parent'] = (array) $st;
					$this->addFormData();
				} else {
					prex('Problems witha parent cat');
				}
			}
		}
	}

	function getId()
	{
		$field = 'id';

		if (isset($_POST[$field])) {
			return getPosNum($_POST[$field]);
		}
		return false;
	}

	function addFormData()
	{
		// set tree level
		$mmod = new \Fmw\Core\Model\OutModuleModel();
		$mmod->_filter = 1;
		$mmod->type = 'pub';
		$mmod->_orderBy = 'name';
		$list = $mmod->getList();
		if ($list) {
			$this->smarty->assign('outMods', $list);
		}

		$mmod = new \Fmw\Core\Model\InModuleModel();
		$mmod->_filter = 1;
		$mmod->type = 'pub';
		$mmod->_orderBy = 'name';
		$list = $mmod->getList();
		if ($list) {
			$this->smarty->assign('inMods', $list);
		}

		$layoutMod = new \Fmw\Core\Model\LayoutModel();
		$layoutMod->_filter = 1;
		$layoutMod->_orderBy = 'name';
		$layoutMod->type = 'pub';
		$list = $layoutMod->getList();
		if ($list) {
			$this->smarty->assign('layouts', $list);
		}
	}

	function getOne($id)
	{
		// load item data
		$st = new \Fmw\Core\Model\StModel();
		if ($st->load($id)) {
			$st->setUri();
			$this->smarty->assign('cat', $st);
		} else {
			prex('Can not load category ' . $id);
		}
	}
}

?>
