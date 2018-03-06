<?php

class cat_content_listModule extends Fmw\Core\Model\InListModel
{

	function __construct()
	{
		parent::__construct();
		if (isset($_GET['catid'])) {
			$catid = getPosNum($_GET['catid']);
			if ($catid) {
				$this->getList($catid);
			}
		}
		$this->smarty->assign('catContentOneUrl', '/admin/cat/content/one');
	}

	function getList($catid)
	{
		$mod = $this->getMod($catid);
		if ($mod) {
			$fields = $mod->getFields();
			if ($fields) {
				if (isset($_POST['submitList'])) {
					$this->submit($mod, $_POST['submitList']);
				}

				$this->smarty->assign('fields', $fields);
				$mod->_filter = 1;
				$mod->cat_id = $catid;
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
							$mod->delete();
						}
					}
				}
			}
		}
	}
}

?>
