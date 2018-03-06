<?php

class usr_oneModule extends Fmw\Core\Model\InOneModel
{

	function __construct()
	{
		parent::__construct();

		// init custom data
		global $_web;
		$this->listUrl = '/admin/usr/list';
		$this->mod = new \Fmw\Core\Model\UsrModel();
		$this->catId = $_web->cat->id;
		$this->customSubmit = true;

		if (isset($_POST['submitOne'])) {
			$this->submit();
		}
		$this->setCustomFields();

		// launch req handling
		$this->handleReq();
		$this->smarty->assign('catContentListUrl', $this->listUrl);
	}

	function setCustomFields()
	{
		$this->setField('email', 'text');
		$this->setField('status', 'sel');
		$this->setField('name', 'text');
		$this->setField('surname', 'text');
		$this->setField('pw', 'pw');
	}

	function submit()
	{
		$itemPost = $this->getItemPost();
		if ($itemPost) {
			if (isset($_POST['id'])) {
				$id = getPosNum($_POST['id']);
				if ($id) {

					if ($this->mod->load($id)) {
						$this->mod->setFields($itemPost);
						$this->mod->setMaxTries();
						$this->mod->setPw($this->mod->pw);
						$this->mod->update();
					}
				}
			} else {

				$this->mod->setFields($itemPost);
				$this->mod->setPw($this->mod->pw);
				$this->mod->setMaxTries();
				$this->mod->insert();
				$this->goToList();
			}
		} else {
			prex('Did not save');
		}
	}
}

?>
