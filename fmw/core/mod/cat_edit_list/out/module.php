<?php

class cat_edit_listModule extends \Fmw\Core\Model\InModel
{

	function __construct()
	{
		parent::__construct();

		$this->smarty->assign('catSettingsUrl', '/admin/cat/settings');
		$this->smarty->assign('catContentUrl', '/admin/cat/content');

		$st = new \Fmw\Core\Model\StModel();
		$langId = $this->getcatLang();

		if (isset($_GET['catid']) && $_GET['catid']) {
			$st->load($_GET['catid']);
		}
		$root = $st->getTree($langId);
		if ($root) {
			$this->smarty->assign('root', $root);
		}
		$this->smarty->assign('langId', $langId);
	}
}

?>
