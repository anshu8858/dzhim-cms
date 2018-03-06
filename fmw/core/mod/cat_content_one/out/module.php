<?php

class cat_content_oneModule extends Fmw\Core\Model\InOneModel
{

	function __construct()
	{
		parent::__construct();
		$this->listUrl = '/admin/cat/content/list';
		$this->smarty->assign('catContentListUrl', $this->listUrl);

		// launch req handling
		$this->handleReq();
	}
}

?>
