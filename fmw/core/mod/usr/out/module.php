<?php

class usrModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		header('Location: /admin/usr/list');
		exit();
	}
}

?>
