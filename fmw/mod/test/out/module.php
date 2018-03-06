<?php

class Module extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();

		$mod = new Fmw\Common\Model\ParnterModel();
		$list = $mod->getList();
		if ($list) {
			$this->smarty->assign('partners', $list);
		}
	}
}

?>
