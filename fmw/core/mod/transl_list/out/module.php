<?php

class transl_listModule extends Fmw\Core\Model\InListModel
{

	function __construct()
	{
		parent::__construct();

		$this->getList();

		$this->smarty->assign('catContentOneUrl', '/admin/transl/one');
	}

	function getList()
	{
		$mod = new Fmw\Core\Model\MsgModel();
		if ($mod) {
			$showFields = array('name', 'content');
			$fields = $mod->getFields($showFields);
			if ($fields) {
				if (isset($_POST['submitList'])) {
					$this->submit($mod, $_POST['submitList']);
				}

				$this->smarty->assign('fields', $fields);
				$mod->_orderBy = 'name';
				$mod->_gpBy = 'name';
				$list = $mod->getList();
				if ($list) {
					$this->smarty->assign('list', $list);
				}
			}
		}
	}

	function submit($mod, $action = 'del')
	{
		if ($action == 'del') {
			if (isset($_POST['id']) && !empty($_POST['id'])) {
				foreach ($_POST['id'] as $key => $val) {
					$id = getPosNum($key);
					if ($id) {
						if ($mod->load($id)) {
							Fmw\Core\Model\MsgModel::delByName($mod->name);
						}
					}
				}
			}
		}
	}
}

?>
