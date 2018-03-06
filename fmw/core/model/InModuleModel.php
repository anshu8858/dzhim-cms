<?php
namespace Fmw\Core\Model;

class InModuleModel extends \Fmw\Core\Model\ModuleModel
{

	protected $defTab = '_mod_in';

	function __construct()
	{
		parent::__construct();
	}

	function getPath($scope = 'pub', $type = 'in')
	{
		return parent::getPath($scope, $type);
	}

	function getModuleFromCatId($id, $scope = 'pub')
	{
		$st = new \Fmw\Core\Model\StModel();
		if ($st->load($id)) {
			$inId = getPosNum($st->in);
			if ($inId) {
				if ($this->load($inId)) {
					$path = $this->getPath($scope);
					if ($path) {
						$module = $this->getModule();
						if ($module) {
							return $module;
						}
					}
				}
			}
		}
		return false;
	}
}

?>
