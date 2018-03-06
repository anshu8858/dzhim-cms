<?php

class head_cat_menuModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();

		global $_web;
		$st = new \Fmw\Core\Model\StModel();
		$st->_op = array('level' => '<');
		$st->level = 3;
		$st->_orderBy = 'weight';
		$st->_filter = 1;
		$st->lang_id = $_web->langId;
		$st->status = 'active';
		$st->type = 'pub';
		$list = $st->getList();

		if ($list) {
			$this->smarty->assign('links', $list);
		}
	}
}

?>
