<?php

class partnerModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		$this->mod = new \Fmw\Common\Model\ParnterModel();
		//$this->field = 'YES I KNOW!';
	}
}

?>
