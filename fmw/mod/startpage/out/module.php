<?php

class startpageModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();

		$this->setText();
		$this->setProducts();
		$this->setAlbums();
		$this->setPartners();
		$this->setProjects();
	}

	function setText()
	{
		global $_web;
		$item = new Fmw\Common\Model\StaticModel();
		$item->_filter = 1;
		$item->status = 'active';
		$item->cat_id = $_web->cat->id;

		if ($item->findOne()) {
			$this->smarty->assign('item', $item);
		}
	}

	function setProducts($limit = 6)
	{
		$page = $this->getPageByOutMod('products');

		if (!empty($page->id)) {

			$item = new Fmw\Common\Model\ProductModel();
			$item->_filter = 1;
			$item->active = 1;
			$item->cat_id = $page->id;
			$list = $item->getList($limit);

			if (!empty($list)) {

				$this->smarty->assign('products', $list);
			}

			$this->smarty->assign('productPage', $page);
		}
	}

	function setAlbums($limit = 6)
	{
		$page = $this->getPageByOutMod('gallery');

		if (!empty($page)) {

			$item = new Fmw\Common\Model\GalleryModel();
			$item->_filter = 1;
			$item->cat_id = $page->id;
			$list = $item->getList($limit);

			if (!empty($list)) {

				$this->smarty->assign('albums', $list);
			}

			$this->smarty->assign('albumPage', $page);
		}
	}

	function setPartners($limit = 6)
	{
		$page = $this->getPageByOutMod('partner');

		if (!empty($page)) {

			$item = new Fmw\Common\Model\ParnterModel();
			$item->_filter = 1;
			$item->cat_id = $page->id;
			$list = $item->getList($limit);

			if (!empty($list)) {

				$this->smarty->assign('partners', $list);
			}
		}

		$this->smarty->assign('partnerPage', $page);
	}

	function setProjects($limit = 6)
	{
		$page = $this->getPageByOutMod('project');

		if (!empty($page)) {

			$item = new Fmw\Common\Model\ProjectModel();
			$item->_filter = 1;
			$item->cat_id = $page->id;
			$list = $item->getList($limit);

			if (!empty($list)) {

				$this->smarty->assign('projects', $list);
			}

			$this->smarty->assign('projectPage', $page);
		}
	}

	function getPageByOutMod($outModName)
	{
		$return = false;

		$outMod = new Fmw\Core\Model\OutModuleModel();
		$outMod->name = $outModName;
		if ($outMod->findOne()) {
			global $_web;

			$st = new Fmw\Core\Model\StModel();
			$st->lang_id = $_web->cat->lang_id;
			$st->out = $outMod->id;
			$st->findOne();
			$return = $st;
		}

		return $return;
	}
}

?>
