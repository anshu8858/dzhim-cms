<?php

class galleryModule extends \Fmw\Core\Model\OutModel
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
		$mod = new \Fmw\Common\Model\GalleryModel();
		$mod->_filter = 1;
		$mod->cat_id = $_web->cat->id;
		$list = $mod->getList();
		if ($list) {
			$this->smarty->assign('galleries', $list);
		}
		$this->setTempl('list');
	}

	function getOne($id)
	{
		$mod = new \Fmw\Common\Model\GalleryModel();
		if ($mod->load($id)) {
			$mod->loadRel('gallery_item');
			$this->smarty->assign('gallery', $mod);
			$this->setTempl('one');
			return true;
		}
		$this->getList();
	}
}

?>
