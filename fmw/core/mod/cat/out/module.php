<?php

class catModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
	}

	function addSettings()
	{
		if (isset($_POST['submCat'])) {
			$this->submit();
		}
	}

	function addFormData()
	{
		$mmod = new Model\OutModuleModel();
		$mmod->_filter = 1;
		$mmod->type = 'pub';
		$list = $mmod->getList();
		if ($list) {
			$this->smarty->assign('outMods', $list);
		}
	}

	function getOne($id)
	{
		$this->addFormData();

		// load item data
		$st = new \Fmw\Core\Model\StCoreModel();
		if ($st->load($id)) {
			$this->smarty->assign('cat', $st);
		} else {
			prex('Can not load category ' . $id);
		}
	}

	function submit()
	{
		$st = new \Fmw\Core\Model\StCoreModel();
		$st->setFields($_POST);
		if (isset($_POST['id'])) {
			$st->update();
		} else {
			$st->insert();
			pr('Should redirect to content.');
		}
	}
}

?>
