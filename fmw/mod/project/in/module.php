<?php

class projectModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		$this->mod = new Fmw\Common\Model\ProjectModel();
		//$this->field = 'YES I KNOW!';
	}
}

?>
