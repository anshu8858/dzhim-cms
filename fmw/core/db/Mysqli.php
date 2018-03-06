<?php
namespace Fmw\Core\Db;

class Mysqli extends \MySQLi
{

	protected static $conn;
	protected static $db;

	public function __construct()
	{
		global $_config;
		parent::__construct($_config->db['host'], $_config->db['user'], $_config->db['pw'], $_config->db['name']);
		if (mysqli_connect_error()) {
			die('Connect Error (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
		}
		parent::set_charset("utf8");
	}

	function q($q, $showError = true)
	{
		$return = array();
		$result = $this->query($q);
		if ($result) {
			//printf("Select returned %d rows.\n", $result->num_rows);
			while ($row = mysqli_fetch_assoc($result)) {
				$return[] = $row;
			}
			$result->close();
		} else {
			if ($showError) {
				pr($q);
			}
		}
		$this->close();
		if (!empty($return)) {
			return $return;
		}
		return false;
	}

	function getOne($str)
	{
		$return = $this->q($str);
		if ($return) {
			$row = array_pop($return);
			if (is_array($row)) {
				if (!empty($row)) {
					return array_pop($row);
				}
			}
		}
		return false;
	}
}

?>
