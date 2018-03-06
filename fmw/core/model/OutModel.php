<?php
namespace Fmw\Core\Model;

class OutModel extends \Fmw\Core\Out\Smarty
{

	function __construct()
	{
		parent::__construct();
	}

	function isAjax()
	{
		if (isset($_POST['ajax']) && $_POST['ajax']) {
			return true;
		}
		return false;
	}
}

?>
