<?php

class layoutModule extends Fmw\Core\Model\InListModel
{

	function __construct()
	{
		parent::__construct();

		if (isset($_POST['layoutIns'])) {
			$this->ins($_POST['layoutIns']);
		}

		$this->getList();
	}

	function getList()
	{
		$regList = $this->getRegList();
		$unRegList = $this->getUnregList($regList);
		$this->smarty->assign('regList', $regList);
		$this->smarty->assign('unRegList', $unRegList);
	}

	function getUnregList($regList = false)
	{
		$return = array();
		global $_config;
		$base = $_config->layout['path'];

		if ($regList) {
			foreach (new \DirectoryIterator($base) as $fileInfo) {
				if ($fileInfo->isDot()) {
					continue;
				}
				$filename = $fileInfo->getBasename('.tpl');
				if (!in_array($filename, $regList)) {
					$return[$filename] = $filename;
				}
			}
		} else {
			foreach (new \DirectoryIterator($base) as $fileInfo) {
				if ($fileInfo->isDot()) {
					continue;
				}
				$return[$filename] = $fileInfo->getBasename('.tpl');
			}
		}
		return $return;
	}

	function getRegList()
	{
		$mod = new \Fmw\Core\Model\LayoutModel();
		$mod->_filter = 1;
		$mod->type = 'pub';
		return $mod->find(false, '`name`', 'name', true);
	}

	function ins($name)
	{
		$mod = new \Fmw\Core\Model\LayoutModel();
		$mod->name = $name;
		$mod->insert();
	}
}

?>
