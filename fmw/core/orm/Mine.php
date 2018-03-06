<?php
namespace Fmw\Core\Orm;

class Mine
{

	function __construct()
	{
		
	}

	function getItemField()
	{
		return $this->defTab . '_id';
	}

	function loadRel($name = false)
	{
		if ($name) {
			if (isset($this->rel[$name]) && !empty($this->rel[$name])) {
				$itemField = $this->getItemField();
				$relMod = new $this->rel[$name];
				$relMod->_filter = 1;
				$relMod->$itemField = $this->id;
				$this->$name = $relMod->getList();
				return $this->$name;
			}
		} else {
			if (isset($this->rel) && !empty($this->rel)) {
				$itemField = $this->getItemField();
				foreach ($this->rel as $name => $rel) {
					$relMod = new $rel;
					$relMod->_filter = 1;
					$relMod->$itemField = $this->id;
					$this->$name = $relMod->getList();
				}
				return $this->$name;
			}
		}
		return false;
	}

	function findOne()
	{
		$return = $this->find(1);
		if (!empty($return)) {
			$row = array_pop($return);
			$this->populate($row);
			return true;
		}
		return false;
	}

	function findList($limit = false)
	{
		$return = $this->find($limit);

		if (!empty($return)) {
			return $return;
		}
		return false;
	}

	function getEnumVals($name)
	{
		$vals = array();
		$db = new \Fmw\Core\Db();
		$row = $db->getEnumCol($this->getTabName($this->defTab), $name);
		if ($row) {
			preg_match('/^enum\((.*)\)$/', $row['Type'], $matches);
			foreach (explode(',', $matches[1]) as $value) {
				$vals[] = trim($value, "'");
			}
		}
		if (!empty($vals)) {
			$return['val'] = $vals;
			if (isset($row['Default'])) {
				$return['def'] = $row['Default'];
			} else {
				$return['def'] = '';
			}
			return $return;
		}
	}

	function find($limit = false, $returnFields = '*', $oneReturnField = false, $useReturnField = false)
	{
		$params = array();
		$and = '';
		$db = new \Fmw\Core\Db();
		$fields = $db->getColumns($this->getTabName($this->defTab));
		if ($fields) {
			$q = "SELECT " . $returnFields . " FROM " . $this->getTabName($this->defTab)
				. " WHERE ";

			$q .= $this->getWhereQ($fields, $params);

			// search only if found set params
			if (!empty($params)) {

				// limit
				$limit = getPosNum($limit);
				if (isset($this->_orderBy)) {
					$q .= ' ORDER BY ' . $this->_orderBy;
				}
				if (isset($this->_gpBy)) {
					$q .= ' GROUP BY ' . $this->_gpBy;
				}
				if ($limit) {
					$limitQ = ' LIMIT ' . $limit;
					$q .= $limitQ;
				}

				return $db->sel($q, $params, $oneReturnField, $useReturnField);
			}
		}
		return false;
	}

	function getWhereAndQ($colName, $and, $op = '=')
	{
		$q = $and . " `" . $colName . "` " . $op . "  :" . $colName . " ";
		return $q;
	}

	function getWhereOrQ($colName, $op = '=')
	{
		return ' OR' . " `" . $colName . "` " . $op . " :" . $colName . " ";
	}

	function getWhereQ(&$fields, &$params)
	{
		$q = '';
		$and = '';

		// has OR operations
		if (isset($this->_or) && !empty($this->_or)) {
			// has different operators than =
			if (isset($this->_op)) {
				foreach ($fields as $field) {
					$colName = $field['Field'];
					// and fields
					if (isset($this->$colName)) {
						$params[$colName] = $this->gettWhereVal($this->$colName);
						$q .= $this->getWhereAndQ($colName, $and, isset($this->_op[$colName]) ? $this->_op[$colName] : '=');
						$and = ' AND ';
						// or fields
					} elseif (isset($this->_or[$colName])) {
						$params[$colName] = $this->gettWhereVal($this->$colName);
						$q .= $this->getWhereOrQ($colName, isset($this->_op[$colName]) ? $this->_op[$colName] : '=');
					}
				}
			} else {
				foreach ($fields as $field) {
					$colName = $field['Field'];
					// and fields
					if (isset($this->$colName)) {
						$params[$colName] = $this->gettWhereVal($this->$colName);
						$q .= $this->getWhereAndQ($colName, $and);
						$and = ' AND ';
						// or fields
					} elseif (isset($this->_or[$colName])) {
						$params[$colName] = $this->gettWhereVal($this->$colName);
						$q .= $this->getWhereOrQ($colName);
					}
				}
			}
			// has not OR operations
		} else {
			// has different operators than =
			if (isset($this->_op)) {
				foreach ($fields as $field) {
					$colName = $field['Field'];
					// and fields
					if (isset($this->$colName)) {
						$params[$colName] = $this->gettWhereVal($this->$colName);
						$q .= $this->getWhereAndQ($colName, $and, isset($this->_op[$colName]) ? $this->_op[$colName] : '=');
						$and = ' AND ';
					}
				}
			} else {
				foreach ($fields as $field) {
					$colName = $field['Field'];
					// and fields
					if (isset($this->$colName)) {
						$params[$colName] = $this->gettWhereVal($this->$colName);
						$q .= $this->getWhereAndQ($colName, $and);
						$and = ' AND ';
						// or fields
					}
				}
			}
		}
		return $q;
	}

	function gettWhereVal($val)
	{
		if ($val == 'NULL') {
			return NULL;
		}
		return $val;
	}

	/**
	 * sets only those that match db cols
	 * @param type $array
	 */
	function setFields($array)
	{
		$db = new \Fmw\Core\Db();
		$fields = $db->getColumns($this->getTabName($this->defTab));
		if ($fields) {
			$colName = false;

			foreach ($fields as $field) {
				$colName = $field['Field'];

				if (isset($array[$field['Field']])) {

					if ($field['Type'] == 'text') {
						if (isFormatedText($field['Field'])) {
							$array[$colName] = $array[$colName];
						}
					}
					$this->$colName = $array[$colName];
				}
			}
		}
	}

	function load($id)
	{
		$return = array();
		$params = array();

		$db = new \Fmw\Core\Db();
		$q = 'SELECT * FROM ' . $this->getTabName($this->defTab) . ' WHERE id = :id';
		$params = array('id' => $id);

		$return = $db->getRow($q, $params);

		if (!empty($return)) {
			$this->populate($return);
			return true;
		}
		return false;
	}

	function getList($limit = false)
	{
		$list = array();

		// use filters
		if (isset($this->_filter) && $this->_filter) {
			$list = $this->findList($limit);
		} else {
			$db = new \Fmw\Core\Db();
			$q = 'SELECT * FROM ' . $this->getTabName($this->defTab);
			if (isset($this->_gpBy)) {
				$q .= ' GROUP BY ' . $this->_gpBy;
			}
			if (isset($this->_orderBy)) {
				$q .= ' ORDER BY ' . $this->_orderBy;
			}
			if ($limit) {
				$limitQ = ' LIMIT ' . $limit;
				$q .= $limitQ;
			}
			$list = $db->sel($q);
		}

		if (!empty($list)) {
			return $list;
		}
		return false;
	}

	function insert()
	{
		$params['key'] = $params['val'] = $params = $fields = array();
		$db = new \Fmw\Core\Db();

		$fields = $db->getColumns($this->getTabName($this->defTab));
		if ($fields) {
			foreach ($fields as $field) {
				$colName = $field['Field'];

				if (isset($this->$colName)) {
					if (strlen(trim($this->$colName))) {
						$params['key'][$colName] = $colName;
						$params['insKey'][$colName] = ':' . $colName;
						$params['val'][$colName] = $this->$colName;
					} else {
						$emptyVal = $this->getEmptyVal($field);
						if ($emptyVal !== false) {
							$params['key'][$colName] = $colName;
							$params['insKey'][$colName] = ':' . $colName;
							$params['val'][$colName] = $emptyVal;
						}
					}
				} else {
					$emptyVal = $this->getEmptyVal($field);
					if ($emptyVal !== false) {
						$params['key'][$colName] = $colName;
						$params['insKey'][$colName] = ':' . $colName;
						$params['val'][$colName] = $emptyVal;
					}
				}
			}
			if (!empty($params['key'])) {
				$id = $db->insert($this->getTabName($this->defTab), $params);
				if ($id) {
					$this->id = $id;
					return $id;
				}
			}
		}
		return false;
	}

	function update()
	{
		$params['key'] = $params['val'] = $params = $fields = array();
		$db = new \Fmw\Core\Db();

		$fields = $db->getColumns($this->getTabName($this->defTab));
		if ($fields) {
			$colName = false;

			foreach ($fields as $field) {
				$colName = $field['Field'];

				if (isset($this->$colName)) {
					if (strlen(trim($this->$colName)) < 1) {
						$emptyVal = $this->getEmptyVal($field);
						if ($emptyVal !== false) {
							$params['key'][$colName] = $colName;
							$params['val'][$colName] = $emptyVal;
						}
					} else {
						$params['key'][$colName] = $colName;
						$params['val'][$colName] = $this->$colName;
					}
				} else {
					$emptyVal = $this->getEmptyVal($field);
					if ($emptyVal !== false) {
						$params['key'][$colName] = $colName;
						$params['val'][$colName] = $emptyVal;
					}
				}
			}
			if (!empty($params['key'])) {
				return $db->update($this->getTabName($this->defTab), $params);
			}
		}
		return false;
	}

	function getEmptyVal($field)
	{
		if (\Fmw\Core\Db::getColType($field['Type']) == 'tinyint(1)') {
			return 0;
		}
		if (isset($field['Null'])) {
			if ($field['Null'] != 'NO') {
				return NULL;
			}
		} else {
			if (\Fmw\Core\Db::isNull($field['Type'])) {
				return NULL;
			}
		}
		return false;
	}

	function delete()
	{
		$params['id'] = $this->id;
		$q = 'DELETE FROM ' . $this->getTabName($this->defTab) . ' WHERE `id` = :id';
		$db = new \Fmw\Core\Db();
		return $db->q($q, $params);
	}

	function getTabName($tab)
	{
		global $_config;

		return $_config->db['tab_prefix'] . $tab;
	}
}

?>
