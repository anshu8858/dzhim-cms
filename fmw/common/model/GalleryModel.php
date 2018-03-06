<?php
namespace Fmw\Common\Model;

class GalleryModel extends \Fmw\Core\Model
{

	public $rel = array(
		'gallery_item' => '\Fmw\Common\Model\GalleryItemModel'
	);
	public $defTab = 'gallery';

}

?>
