<?php
namespace Fmw\Core\Model;

class OutModuleModel extends ModuleModel
{

	protected $defTab = '_mod_out';

	function getPath($scope, $type = 'out')
	{
		return parent::getPath($scope, $type);
	}
}

?>
