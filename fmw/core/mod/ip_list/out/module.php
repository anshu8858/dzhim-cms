<?php

class ip_listModule extends Fmw\Core\Model\InListModel
{

	function __construct()
	{
		parent::__construct();
		$this->getList();
		$this->smarty->assign('catContentOneUrl', '/admin/ip/one');
	}

	function getList()
	{
		$mod = new Fmw\Core\Model\IpInModel();
		$fields = $mod->getFields();
		if ($fields) {
			if (isset($_POST['submitList'])) {
				$this->submit($mod, $_POST['submitList']);
			}

			$this->smarty->assign('fields', $fields);
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
