<?php

class cat_langModule extends \Fmw\Core\Model\InModel
{

	function __construct()
	{
		parent::__construct();

		if (isset($_POST['submitLang'])) {
			$this->submit($_POST['submitLang']);
		}

		if (isset($_GET['id'])) {
			$id = getPosNum($_GET['id']);
			if ($id) {
				$this->setcatLang($id);

				$mod = new \Fmw\Core\Model\LangModel();
				if ($mod->load($id)) {
					$this->smarty->assign('item', $mod);
				}
			}
		}
	}

	function submit($action = 'ins')
	{
		switch ($action) {
			case 'up':
				$this->move($action);
				break;
			case 'down':
				$this->move($action);
				break;
			case 'upd':
				$this->upd();
				break;
			case 'ins':
				$this->ins();
				break;
			case 'del':
				$this->del();
				break;
		}
	}

	function move($direction)
	{
		if (isset($_POST['id'])) {
			$id = getPosNum($_POST['id']);
			$lang = new \Fmw\Core\Model\LangModel();
			if ($lang->load($id)) {
				$lang->move($direction);
			}
		}
	}

	function del()
	{
		if (isset($_POST['id'])) {
			$id = getPosNum($_POST['id']);
			$lang = new \Fmw\Core\Model\LangModel();
			if ($lang->load($id)) {
				$st = new \Fmw\Core\Model\StModel();
				$root = $st->getRootByLangId($lang->id);
				if ($root) {
					$root->delTree();
				}
				$lang->delete();

				$lang = new \Fmw\Core\Model\LangModel();
				$list = $lang->getList();
				if ($list) {
					$toLang = current($list);
					header('Location: /admin/cat/lang?id=' . $toLang->id);
				} else {
					header('Location: /admin/cat');
				}
				exit();
			}
		}
	}

	function upd()
	{
		$mod = new \Fmw\Core\Model\LangModel();
		$mod->setFields($_POST);
		if (isset($_POST['is_def'])) {
			$mod->setDefLang();
		}
		$mod->update();
	}

	function ins()
	{
		$mod = new \Fmw\Core\Model\LangModel();
		$mod->setFields($_POST);
		$mod->setWeight();
		if (isset($_POST['is_def'])) {
			$mod->setDefLang();
		}
		$id = $mod->insert();

		// insert new sp in new lang
		if ($id) {
			$st = new \Fmw\Core\Model\StModel();
			$st->title = 'Startpage';
			$st->status = 'inactive';
			$st->lang_id = $id;
			$st->is_def = 1;
			$st->dir = '/' . $_POST['three_char'];
			$st->insert();

			header('Location: ?id=' . $id);
			exit();
		}
	}
}

?>
