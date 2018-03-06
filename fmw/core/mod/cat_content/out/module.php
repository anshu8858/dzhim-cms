<?php

class cat_contentModule extends Fmw\Core\Model\InModel
{

	function __construct()
	{
		parent::__construct();
		$url = '/admin/cat';

		if (isset($_GET['catid'])) {
			$catId = getPosNum($_GET['catid']);
			if ($catId) {
				if (\Fmw\Core\Model\StModel::hasInMod($_GET['catid'])) {
					$url = '/admin/cat/content/list?catid=' . $catId;
				} else {
					$url = '/admin/cat/settings?catid=' . $catId;
				}
			}
		}
		header('Location: ' . $url);
		exit();
	}
}

?>
