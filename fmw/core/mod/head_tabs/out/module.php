<?php

class head_tabsModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();

		$adminId = \Fmw\Core\Model\StCoreModel::getIdByDir('/admin');
		if ($adminId) {
			$st = new \Fmw\Core\Model\StCoreModel();
			$st->_filter = 1;
			$st->_orderBy = 'weight';
			$st->status = 'active';
			$st->type = 'core';
			$st->parent_id = $adminId;
			$list = $st->getList();

			if ($list) {
				$this->smarty->assign('links', $list);
			}
		}
	}
}

?>
