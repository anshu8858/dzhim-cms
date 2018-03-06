<?php

class usr_listModule extends Fmw\Core\Model\InListModel
{

	function __construct()
	{
		parent::__construct();
		$this->getList();
		$this->smarty->assign('catContentOneUrl', '/admin/usr/one');
	}

	function getList()
	{
		$mod = new \Fmw\Core\Model\UsrModel();
		$showFields = array('id', 'email', 'status', 'name', 'surname', 'tries_left', 'last_login_time', 'last_ip');
		$fields = $mod->getFields($showFields);
		if ($fields) {
			if (isset($_POST['submitList'])) {
				$this->submit($mod, $_POST['submitList']);
			}

			$this->smarty->assign('fields', $fields);
			$mod->_orderBy = 'name';
			$list = $mod->getList();
			if ($list) {
				$this->smarty->assign('list', $list);
			}
		}
	}

	function submit($mod, $action = 'del')
	{
		if (isset($_POST['id'])) {
			$id = getPosNum($_POST['id']);
			if ($id) {
				if ($action == 'del') {
					if ($mod->load($id)) {
						$mod->delete();
					}
				}
			}
		}
	}
}

?>
