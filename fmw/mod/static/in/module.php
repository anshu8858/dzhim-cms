<?php

class staticModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		$this->mod = new \Fmw\Common\Model\StaticModel();
	}
}

?>
