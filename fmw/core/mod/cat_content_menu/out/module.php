<?php

class cat_content_menuModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();

		if (isset($_GET['catid'])) {
			$catid = getPosNum($_GET['catid']);
			if ($catid) {
				if (Fmw\Core\Model\StModel::hasInMod($_GET['catid'])) {
					$this->smarty->assign('hasInMod', true);
				}
			}
		}
	}
}

?>
