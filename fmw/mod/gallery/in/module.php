<?php

class galleryModule extends \Fmw\Core\Model\OutModel
{

	function __construct()
	{
		parent::__construct();
		$this->mod = new \Fmw\Common\Model\GalleryModel();
	}
}
