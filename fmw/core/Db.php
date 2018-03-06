<?php
namespace Fmw\Core;

class Db extends \Fmw\Core\Db\Pdo
{ // Mysqli

	function getOne($str, $params = array())
	{
		$row = $this->getRow($str, $params);
		if (is_array($row) && !empty($row)) {
			return array_pop($row);
		}
		return false;
	}

	function getRow($str, $params = array())
	{
		$return = $this->sel($str, $params);
		if ($return) {
			return array_pop($return);
		}
		return false;
	}

	static function getColType($str)
	{
		$types = array(
			'varchar',
			'smallint',
			'tinyint(1)',
			'bool',
			'int',
			'enum',
			'text'
		);

		foreach ($types as $type) {
			if (inStr($str, $type)) {
				return $type;
			}
		}
		return false;
	}

	static function isNull($str)
	{
		if (inStr($str, 'NOT NULL')) {
			return false;
		}
		return true;
	}
}

?>
