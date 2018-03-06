<?php
namespace Fmw\Core\Model;

class InOneModel extends \Fmw\Core\Model\InModel
{

	public $catId = false;
	public $id = false;
	public $mod = false;
	public $fields = false;
	public $customSubmit = false;

	function __construct()
	{
		parent::__construct();
	}

	// main fn
	function handleReq()
	{
		// init 
		if ($this->initOne()) {
			if ($this->customSubmit == false && isset($_POST['submitOne'])) {
				$this->submit();
			}
			if (!$this->id) {
				$this->setId();
			}
			if ($this->getOne()) {
				return true;
			}
		}
		return false;
	}

	function setId()
	{
		$id = $this->getId();
		if ($id) {
			$this->id = $id;
			return $this->id;
		}
		return false;
	}

	function getId()
	{
		if (isset($_GET['id'])) {
			return getPosNum($_GET['id']);
		}
		return false;
	}

	/**
	 * set all necessary data
	 * @return boolean
	 */
	function initOne()
	{
		if ($this->setCatId()) {
			if ($this->setMod($this->catId)) {
				return true;
			}
		}
		return false;
	}

	function loadPerms()
	{
		$_SESSION['KCFINDER'] = array();
		$_SESSION['KCFINDER']['disabled'] = false;
		$this->smarty->assign('kcf', true);
	}

	function getFields()
	{
		if (!$this->fields) {
			$this->fields = $this->mod->getFields();
		}
		return $this->fields;
	}

	function setField($title, $type, $data = false, $length = false)
	{
		if ($this->isValidFieldType($type)) {
			$fieldType = $this->getFieldType($type, $length);
			if ($fieldType) {
				if (!$this->fields) {
					$this->fields = array();
				}
				$this->fields[$title]['Field'] = $title;
				$this->fields[$title]['Type'] = $fieldType;
				if ($fieldType == 'enum') {
					$enum = $this->mod->getEnumVals('status');
					$this->fields[$title]['Vals'] = $enum['val'];
					$this->fields[$title]['Def'] = $enum['def'];
				}
			} else {
				die('Wrong field type ' . $type);
			}
		}
	}

	function getFieldType($type, $length = false)
	{
		switch ($type) {
			case 'text':
				return $this->getFieldGpType('varchar', $length);
			case 'sel':
				return $this->getFieldGpType('sel', $length);
			case 'pw':
				return $this->getFieldGpType('varchar', $length);
			case 'textarea':
				return $this->getFieldGpType('text', $length);
			case 'f_textarea':
				return $this->getFieldGpType('text', $length);
			case 'cb':
				return 'tinyint(1)';
			case 'img':
				return $this->getFieldGpType('varchar', $length);
		}
	}

	function getFieldGpType($type, $length = false)
	{
		switch ($type) {
			case 'sel':
				return 'enum';
			case 'varchar':
				$str = 'varchar';
				//$str .= '(' . ( $length ? $length : '250' ) . ')';
				return $str;
			case 'text':
				return 'text';
		}
	}

	function isValidFieldType($type)
	{
		$types = array(
			'radio',
			'sel',
			'cb',
			'text',
			'textarea',
			'img',
			'f_textarea',
			'pw'
		);
		if (in_array($type, $types)) {
			return true;
		}
		return false;
	}

	function getOne()
	{
		// get fields for specific item
		$itemFields = $this->getFields();

		if ($itemFields) {
			// set items fields into template
			$fields[$this->mod->defTab] = $itemFields;

			// if this is editing of existing item
			if ($this->id) {
				// load related data & fields
				if (!isset($this->mod->id)) {
					$this->mod->load($this->id);
				}
				if (isset($this->mod->rel) && !empty($this->mod->rel)) {
					foreach ($this->mod->rel as $relName => &$relClass) {
						$relMod = new $relClass;
						$fields[$relName] = $relMod->getFields();
						$relMod->list = $this->mod->loadRel($relName);
						$relClass = $relMod;
					}
				}

				// if ins new item
			} else {
				// load related ittem fields
				if (isset($this->mod->rel) && !empty($this->mod->rel)) {
					foreach ($this->mod->rel as $relName => &$relClass) {
						$relMod = new $relClass;
						$fields[$relName] = $relMod->getFields();
						$relClass = $relMod;
					}
				}
			}
			// load permision
			$this->loadPerms();

			$this->smarty->assign('item', $this->mod);
			$this->smarty->assign('fields', $fields);
			$this->smarty->assign('catId', $this->catId);
			return true;
		}
		return false;
	}

	function submit()
	{
		$itemPost = $this->getItemPost();
		if ($itemPost) {
			$this->mod->cat_id = $this->catId;
			$this->mod->setFields($itemPost);
		}

		if (isset($_POST['id'])) {
			$id = getPosNum($_POST['id']);
			if ($id) {
				$this->upd($this->mod, $_POST['id']);
				return;
			}
		}
		$this->ins($this->mod);
	}

	function ins($mod)
	{
		$id = $mod->insert();
		if ($id) {
			$this->insRelItem($mod, $id);
			$this->afterInsert();
		}
	}

	function goToList($useCatId = true)
	{
		header('Location: ' . $this->listUrl . ( $useCatId ? '?catid=' . $this->catId : ''));
		exit();
	}

	function afterInsert()
	{
		$this->goToList();
	}

	function insRelItem($mod, $id)
	{
		$mod->loadRel();
		if (isset($mod->rel) && !empty($mod->rel)) {
			foreach ($mod->rel as $relName => $relClass) {
				// del
				if (isset($mod->$relName) && !empty($mod->$relName)) {
					foreach ($mod->$relName as $relItem) {
						$relItem->delete();
					}
				}
				// ins
				if (isset($_POST[$relName]) && !empty($_POST[$relName])) {
					unset($_POST[$relName][0]);
					foreach ($_POST[$relName] as $relPost) {
						$relMod = new $relClass;
						$relMod->setFields($relPost);
						$itemField = $mod->getItemField();
						$relMod->$itemField = $id;
						$relMod->insert();
					}
				}
			}
		}
	}

	function upd($mod, $id)
	{
		$mod->id = $id;
		$this->insRelItem($mod, $id);
		$mod->cat_id = $this->catId;
		$mod->update();
	}

	function isValid()
	{
		return false;
	}

	function getItemPost($name = false)
	{
		if (isset($_POST[$this->mod->defTab][1])) {
			$post = $_POST[$this->mod->defTab][1];
			if ($name) {
				if (isset($post[$name])) {
					return $post[$name];
				}
			} else {
				return $post;
			}
		}
		return false;
	}
}

?>
