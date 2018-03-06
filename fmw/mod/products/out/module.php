<?php

class productsModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		global $_web;

		if (isset($_web->rec_id)) {
			$this->getOne($_web->rec_id);
		} else {
			$this->getList();
		}
	}

	function getList()
	{
		global $_web;
		$mod = new Fmw\Common\Model\ProductModel();
		$mod->_filter = 1;
		$mod->status = 'active';
		$mod->cat_id = $_web->cat->id;
		$list = $mod->getList();
		if ($list) {
			$this->smarty->assign('products', $list);
		}
		$this->setTempl('list');
	}

	function getOne($id)
	{
		$mod = new Fmw\Common\Model\ProductModel();
		if ($mod->load($id)) {
			$this->smarty->assign('product', $mod);
			$this->setTempl('one');
			return true;
		}
		$this->getList();
	}
}

?>
