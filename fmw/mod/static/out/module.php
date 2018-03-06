<?php

class staticModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();

		global $_web;
		$mod = new Fmw\Common\Model\StaticModel();
		$mod->_filter = 1;
		$mod->status = 'active';
		$mod->cat_id = $_web->cat->id;
		if ($mod->findOne()) {
			$this->smarty->assign('item', $mod);
		}
	}
}

?>
