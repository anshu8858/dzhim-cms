<?php
namespace Fmw\Core\Model;

class FileModel extends \Fmw\Core\Model
{

	protected $defTab = '_file';

	function load($id)
	{
		if (parent::load($id)) {

			if (isset($this->path) && $this->path) {
				$this->path = utf82win($this->path);
			}

			if (isset($this->title)) {
				$str = getStr($this->title);
				if ($str) {
					$this->title = $str;
				} else {
					$this->title = $this->getHomeTitleFileName();
				}
			}

			return true;
		}
		return false;
	}

	function getHomeTitleFileName()
	{
		$title = getHomeTitle();
		$title = str_replace('.', ' ', $title);
		$slug = getSlug($title, '_');
		if ($slug) {
			return $slug;
		}
		return $this->getDateFileName();
	}

	function getDateFileName()
	{
		$now = date('Y-m-d_H-i');
		return 'file_' . $now;
	}

	function getUrl()
	{
		return __baseUrl . '/dl/' . $this->id;
	}

	function getExt($path)
	{
		return strtolower(pathinfo($path, PATHINFO_EXTENSION));
	}

	function beforeInsert()
	{
		$this->path = win2utf8($this->path);
	}
}

?>
