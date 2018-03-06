<?php

class ip_oneModule extends Fmw\Core\Model\InOneModel
{

	function __construct()
	{
		parent::__construct();

		// init custom data
		global $_web;
		$this->listUrl = '/admin/ip/list';
		$this->mod = new Fmw\Core\Model\IpInModel();
		$this->catId = $_web->cat->id;

		// launch req handling
		$this->handleReq();
		$this->smarty->assign('catContentListUrl', $this->listUrl);
	}
}

?>
