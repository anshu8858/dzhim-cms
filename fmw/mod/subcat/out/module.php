<?php

class subcatModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		global $_web;

		$st = new Fmw\Core\Model\StModel();
		$st->_filter = 1;
		$st->_orderBy = 'title';
		$st->status = 'active';
		$st->parent_id = $_web->cat->id;
		$list = $st->getList();
		if ($list) {
			$this->smarty->assign('subcats', $list);
		}
	}
}

?>
