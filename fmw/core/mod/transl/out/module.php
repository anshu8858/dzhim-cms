<?php

class translModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		header('Location: /admin/transl/list');
		exit();
	}
}

?>
