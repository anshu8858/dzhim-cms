<?php

class authModule extends Fmw\Core\Model\InOneModel
{

	private $langs = false;
	private $langFieldPrefx = 'f_';

	function __construct()
	{
		parent::__construct();

		// check if logged in
		$usrId = $this->isAuth();

		// redir to admin site
		if ($usrId) {
			header('Location: /admin');
			exit();
		}
		// ask credentials
		prex('ask credentials');



		// init custom data
		global $_web;
		$this->listUrl = '/admin/transl/list';
		$this->catId = $_web->cat->id;
		$this->mod = new Fmw\Core\Model\MsgModel();
		$this->customSubmit = true;
		// transl for each lang
		$this->setLangs();

		// mmust be atleast one lang
		if ($this->langs) {

			if (isset($_POST['submitOne'])) {
				$this->submit();
			}
			$this->setCustomFields();
		} else {
			prex('Langs missing');
		}

		// launch req handling
		$this->handleReq();
		$this->smarty->assign('catContentListUrl', $this->listUrl);
	}

	/**
	 * set custom form fields
	 */
	function setCustomFields()
	{
		$data = false;

		if ($this->setId()) {
			// find all lang msgs by name and fill form w data
			$this->mod->load($this->id);
			if (isset($this->mod->name)) {
				$name = getStr($this->mod->name);
				if ($name) {
					$mod = new $this->mod;
					$mod->_filter = 1;
					$mod->name = $name;
					$msgs = $mod->getList();
					if ($msgs) {
						$data = array();
						foreach ($msgs as $msg) {
							$data[$msg->lang_id] = $msg->content;
						}
					}
				}
			}
		}
		$this->setField('name', 'text');

		if ($data) {
			foreach ($this->langs as $lang) {
				if (isset($data[$lang->id])) {
					$index = $this->langFieldPrefx . $lang->three_char;
					$this->mod->$index = $data[$lang->id];
				}

				$this->setField($this->langFieldPrefx . $lang->three_char, 'textarea');
			}
		} else {
			foreach ($this->langs as $lang) {
				$this->setField($this->langFieldPrefx . $lang->three_char, 'textarea');
			}
		}
	}

	/**
	 * set active langs into var
	 */
	function setLangs()
	{
		$this->langs = \Fmw\Core\Model\LangModel::getActiveList();
	}

	function submit()
	{
		$itemPost = $this->getItemPost();
		if ($itemPost) {
			if (isset($itemPost['name']) && getStr($itemPost['name'])) {
				// del oldies
				Fmw\Core\Model\MsgModel::delByName($itemPost['name']);
				foreach ($this->langs as $lang) {
					$mod = new $this->mod;
					$mod->name = $itemPost['name'];
					$mod->lang_id = $lang->id;

					if (isset($itemPost[$this->langFieldPrefx . $lang->three_char])) {
						$mod->content = $itemPost[$this->langFieldPrefx . $lang->three_char];
					}

					$mod->insert();
				}
				$this->goToList(false);
			} else {
				prex('Wrong name');
			}
		} else {
			prex('Did not save');
		}
		//parent::submit();
	}
}

?>
