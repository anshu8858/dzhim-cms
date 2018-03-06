<?php

class partnerModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		global $_web;
		$mod = new Fmw\Common\Model\ParnterModel();
		$mod->_filter = 1;
		$mod->cat_id = $_web->cat->id;
		$list = $mod->getList();
		if ($list) {
			$this->smarty->assign('partners', $list);
		}
	}
}

?>
