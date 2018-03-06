<?php
namespace Fmw\Core;

class Model extends \Fmw\Core\Orm\Mine
{

	function getBaseUrl()
	{
		global $_web;
		return 'http://' . $_SERVER['HTTP_HOST'] . $_web->cat->dir;
	}

	function getUrl($dir = '')
	{
		global $_web;
		$dir = $dir ? $dir : $_web->cat->dir;
		return $dir . '/' . $this->id . '-' . getSlug($this->title);
	}

	/**
	 * return in modules's model's fields
	 * @return boolean
	 */
	function getFields($showFields = false)
	{
		$fields = array();
		if (isset($this->defTab)) {
			$db = new \Fmw\Core\Db();
			$fields = $db->getColumns($this->getTabName($this->defTab));
		}
		if (!empty($fields)) {
			// keep only specified fields
			if ($showFields) {
				foreach ($fields as $key => &$field) {
					if (!in_array($field['Field'], $showFields)) {
						unset($fields[$key]);
					} else {
						$field['Type'] = \Fmw\Core\Db::getColType($field['Type']);
						if ($field['Type'] == 'enum') {
							$enum = $this->getEnumVals('status');
							$field['Vals'] = $enum['val'];
							$field['Def'] = $enum['def'];
						}
					}
				}
			} else {
				foreach ($fields as &$field) {
					$field['Type'] = \Fmw\Core\Db::getColType($field['Type']);
					if ($field['Type'] == 'enum') {
						$enum = $this->getEnumVals('status');
						$field['Vals'] = $enum['val'];
						$field['Def'] = $enum['def'];
					}
				}
			}
			return $fields;
		}
		/*
		 * if (isset($module->_fields)) {
		  $fields = $module->_fields;
		  }
		 */
		return false;
	}

	/**
	 * convert array to object
	 * @param type $row
	 * @return boolean
	 */
	function populate($row)
	{
		if (is_array($row) || is_object($row)) {
			foreach ($row as $key => $value) {
				$this->$key = $value;
			}
			return true;
		}
		return false;
	}

	function getList($limit = false)
	{
		$return = array();
		$list = parent::getList($limit);

		if ($list) {
			$modName = get_class($this);
			if ($modName) {
				foreach ($list as $row) {
					$mod = new $modName;
					$mod->populate($row);
					$return[$mod->id] = $mod;
				}
				return $return;
			}
		}
		return false;
	}

	// insert
	function insert()
	{
		$this->beforeInsert();
		$id = parent::insert();
		$this->afterInsert();
		if ($id) {
			return $id;
		}
		return false;
	}

	function beforeInsert()
	{
		
	}

	function afterInsert()
	{
		
	}

	//!= insert
	// update
	function update()
	{
		$this->beforeInsert();
		$status = parent::update();
		$this->afterInsert();
		if ($status) {
			return $status;
		}
		return false;
	}

	function beforeUpdate()
	{
		
	}

	function afterUpdate()
	{
		
	}

	//!= update
	// delete
	function delete()
	{
		$this->beforeDelete();
		$status = parent::delete();
		$this->afterDelete();
		if ($status) {
			return $status;
		}
		return false;
	}

	function afterDelete()
	{
		
	}

	function beforeDelete()
	{
		
	}
	//!= delete
}

?>
