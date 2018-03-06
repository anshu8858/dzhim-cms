<?php

class modModule extends Fmw\Core\Model\InListModel
{

	function __construct()
	{
		parent::__construct();

		if (isset($_POST['modIns'])) {
			$this->ins($_POST['modIns']);
		}

		$this->getList();
	}

	function getList()
	{
		$regMods = array(
			'in' => array(),
			'out' => array()
		);

		$regMods['in'] = $this->getModList('in');
		if ($regMods['in']) {
			$this->smarty->assign('inMods', $regMods['in']);
		}

		$regMods['out'] = $this->getModList('out');
		if ($regMods['out']) {
			$this->smarty->assign('outMods', $regMods['out']);
		}

		$mod = new \Fmw\Core\Model\ModuleModel();
		$unRegMods = $mod->getUnregModList($regMods);

		$this->smarty->assign('regModsList', $regMods);
		$this->smarty->assign('unRegModsList', $unRegMods);
	}

	function getModel($type)
	{
		switch ($type) {
			case 'in':
				return new \Fmw\Core\Model\InModuleModel();

			case 'out':
				return new \Fmw\Core\Model\OutModuleModel();
		}
		return false;
	}

	function getModList($type = 'in')
	{
		$mmod = $this->getModel($type);
		if ($mmod) {
			$return = array();

			$mmod->_filter = 1;
			$mmod->type = 'pub';
			$list = $mmod->getList();
			if ($list) {
				$return = $list;
				return $return;
			}
		}
		return false;
	}

	function ins($val)
	{

		$valArr = explode('-', $val);
		if (count($valArr) == 2) {
			$type = $valArr[0];
			$name = $valArr[1];

			$mmod = $this->getModel($type);
			$mmod->name = $name;
			$mmod->insert();
		}
	}
}

?>
