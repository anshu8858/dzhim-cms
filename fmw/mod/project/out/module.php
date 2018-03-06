<?php

class projectModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		global $_web;
		$mod = new Fmw\Common\Model\ProjectModel();
		$mod->_filter = 1;
		$mod->cat_id = $_web->cat->id;
		$list = $mod->getList();
		if ($list) {
			$this->smarty->assign('projects', $list);
		}
	}
}

?>
