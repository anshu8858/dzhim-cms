<?php

class cat_lang_menuModule extends \Fmw\Core\Model\InModel
{

	function __construct()
	{
		parent::__construct();

		$mod = new \Fmw\Core\Model\LangModel();

		$mod->getLastWeight();

		$mod->_orderBy = 'weight';
		$list = $mod->getList();
		if ($list) {
			$activeLang = $this->getcatLang();
			if ($activeLang) {
				$this->smarty->assign('activeLang', $activeLang);
			}

			$this->smarty->assign('list', $list);
		}
	}
}

?>
