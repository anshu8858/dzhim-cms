<?php

class head_lang_menuModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		global $_web;
		$langs = \Fmw\Core\Model\LangModel::getActiveList();
		if ($langs) {
			if (count($langs) > 1) {
				$this->smarty->assign('langs', $langs);
				$this->smarty->assign('currentLangId', $_web->cat->lang_id);
			}
		}
	}
}

?>
