<?php
namespace Fmw\Core\Model;

class InModel extends AuthInModel
{

	public $catId = false;
	public $id = false;
	public $mod = false;

	function __construct()
	{
		parent::__construct();
		startSess();
	}
	// == MOD

	/**
	 * set active module
	 * @param type $catId
	 * @param type $scope
	 * @return boolean
	 */
	function setMod($catId, $scope = 'pub')
	{
		if (!$this->mod) {
			$this->mod = $this->getMod($catId, $scope);
		}
		if ($this->mod) {
			return $this->mod;
		}
		return false;
	}

	/**
	 * return in module's model
	 * @param type $id
	 * @return boolean
	 */
	function getMod($catid, $scope = 'pub')
	{
		$inModuleMod = new InModuleModel;
		$module = $inModuleMod->getModuleFromCatId($catid, $scope);
		if (isset($module->mod)) {
			return $module->mod;
		}
		return false;
	}
	// != MOD
	// == CAT

	/**
	 * get current cat's id
	 * @return boolean
	 */
	function getCatId()
	{
		if (isset($_GET['catid'])) {
			return getPosNum($_GET['catid']);
		}
		return false;
	}

	/**
	 * * set current cat's id
	 * @return boolean
	 */
	function setCatId()
	{
		if (!$this->catId) {
			$this->catId = $this->getCatId();
		}
		if ($this->catId) {
			return $this->catId;
		}
		return false;
	}

	function getTreeDepth($langId)
	{
		if ($langId) {
			if (isset($_SESSION['tree'][$langId]['depth'])) {
				return $_SESSION['tree'][$langId]['depth'];
			}
		}
		return false;
	}

	function setTreeDepth($langId, $depth = 0)
	{
		if ($langId) {
			if (!isset($_SESSION['tree'][$langId])) {
				$_SESSION['tree'][$langId] = array();
			}
		}
		$_SESSION['tree'][$langId]['depth'] = $depth;
	}

	// != CAT
// == LANG    
	function setcatLang($id)
	{
		if (!isset($_SESSION['cat'])) {
			$_SESSION['cat'] = array();
		}
		$_SESSION['cat']['lang_id'] = $id;
	}

	function getcatLang()
	{
		if (isset($_SESSION['cat']['lang_id'])) {
			return getPosNum($_SESSION['cat']['lang_id']);
		}
		return LangModel::getDefLang('id');
	}
	// != LANG
}

?>
