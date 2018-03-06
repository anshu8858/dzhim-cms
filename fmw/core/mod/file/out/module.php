<?php

class fileModule
{

	public function __construct($id = false)
	{
		if ($id) {
			$this->id = $id;
			$this->getOne();
		} else {
			$this->getList();
		}
	}

	function getMod()
	{
		return new \Fmw\Core\Model\FileModel();
	}

	function getOne()
	{
		$mod = $this->getMod();

		if ($mod->load($this->id)) {
			pr($mod->path);
			if (is_r($mod->path)) {

				header('Content-Description: File Transfer');
				header('Content-Type: application/octet-stream');
				header('Content-Disposition: attachment; filename=' . $mod->name . '.' . $mod->getExt($mod->path));
				header('Content-Transfer-Encoding: binary');
				header('Expires: 0');
				header('Cache-Control: must-revalidate');
				header('Pragma: public');
				header('Content-Length: ' . filesize($mod->path));
				ob_clean();
				flush();
				readfile($mod->path);
				exit();
			}
		}
	}

	function getList()
	{
		return;
		$mod = $this->getMod();
		$list = $mod->getList();
		if ($list) {
			foreach ($list as $id => $item) {
				pr($item->getUrl());
			}
		}
	}
}

?>
