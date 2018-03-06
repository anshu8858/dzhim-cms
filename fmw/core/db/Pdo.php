<?php
namespace Fmw\Core\Db;

class Pdo extends \PDO
{

	public $conn;

	public function __construct()
	{
		global $_config;
		$params = array();

		// if shared host uses old_passwords then before connection must use this SET SESSION old_passwords=0;

		$type = $_config->db['type'] . ':';
		$host = 'host=' . $_config->db['host'] . ';';
		$dbname = 'dbname=' . $_config->db['name'] . ';';
		$charset = 'charset=utf8;';
		$dsn = $type . $host . $dbname . $charset;
		try {
			$this->conn = new \PDO($dsn, $_config->db['user'], $_config->db['pw'], $params);
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch (PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
			//echo $conn->errorCode();
			// echo $conn->errorInfo();
		}
	}

	function q($q, $params = array())
	{
		$res = false;

		if (!empty($params)) {
			$res = $this->conn->prepare($q);
			$res->execute($params);
			//print_r($res->rowCount());
		} else {
			$res = $this->conn->query($q);
		}
		if ($res) {
			return $res;
		}
		return false;
	}

	function sel($q, $params = array(), $returnField = false, $useReturnField = false)
	{
		$return = array();

		$res = $this->q($q, $params);

		if ($res) {
			if ($returnField) {
				if ($useReturnField) {
					while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
						$return[] = $row[$returnField];
					}
				} else {
					while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
						$return[$returnField][] = $row[$returnField];
					}
				}
			} else {
				while ($row = $res->fetch(PDO::FETCH_ASSOC)) {
					$return[] = $row;
				}
			}
		}
		// close connection
		$this->conn = null;

		if (!empty($return)) {
			return $return;
		}
		return false;
	}

	function getEnumCol($tab, $name)
	{
		$res = $this->q('SHOW COLUMNS FROM `' . $tab . '` WHERE Field = \'' . $name . '\'');
		$row = $res->fetch(PDO::FETCH_ASSOC);

		if (isset($row['Type'])) {
			return $row;
		}
		return false;
	}

	function getColumns($tab)
	{
		$fields = array();

		$res = $this->conn->prepare("DESCRIBE " . $tab);
		$res->execute();

		$fields = $res->fetchAll();
		if (!empty($fields)) {
			return $fields;
		}
		return false;
	}

	function insert($tab, $params)
	{
		$q = 'INSERT INTO ' . $tab;
		$keys = ' (`' . implode('`,`', $params['key']) . '` ) ';
		$vals = 'VALUES ( ' . implode(',', $params['insKey']) . ')';

		$q .= $keys . $vals;
		$res = $this->q($q, $params['val']);
		if ($res) {
			$id = $this->conn->lastInsertId();
			$this->conn = null;
			return $id;
		}
		$this->conn = null;
		return false;
	}

	function update($tab, $params)
	{
		$q = 'UPDATE ' . $tab . ' SET ';
		$where = $this->setUpdWhere($params);
		$first = array_shift($params['key']);
		$q .= '`' . $first . '`' . ' = ' . ':' . $first;

		if (!empty($params['key'])) {
			foreach ($params['key'] as $key) {
				$q .= ', ' . '`' . $key . '` = ' . ':' . $key;
			}
			$q .= $where;
			$res = $this->q($q, $params['val']);
			$this->conn = null;
			if ($res) {
				return $res;
			}
			return false;
		}
	}

	function setUpdWhere(&$params)
	{
		$where = '';
		foreach ($params['key'] as $keyIndex => &$keyVal) {
			if ($keyVal == 'id') {
				$where .= ' WHERE `id` = :' . $keyVal;
				unset($params['key'][$keyIndex]);
			}
		}
		return $where;
	}

	function delete()
	{
		
	}
}

?>
