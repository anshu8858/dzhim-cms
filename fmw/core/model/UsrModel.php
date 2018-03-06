<?php
namespace Fmw\Core\Model;

class UsrModel extends \Fmw\Core\Model
{

	public $defTab = '_usr';

	function setPw($pw)
	{
		$this->pw = $this->getPwHash($pw);
	}

	// hash that is stored at db
	function getPwHash($pw)
	{
		$salt = $this->getSalt();
		// SHA-512
		return crypt($pw, '$6$rounds=5000$' . $salt . '$');
	}

	function getSalt()
	{
		global $_config;
		// md5
		return md5($_config->auth['salt'] . time());
	}

	// $pw from post, $hash from db
	function isValidPw($pw, $hash)
	{
		return $hash == crypt($pw, $hash) ? true : false;
	}

	/**
	 * return status if user is valid for login
	 * @return boolean
	 */
	function canLogin()
	{
		// get and set tries from db
		if ($this->status == 'active' && $this->tries_left) {
			return true;
		}
		return false;
	}

	function setMaxTries()
	{
		global $_config;

		$this->tries_left = $_config->auth['max_tries'];
	}
}

?>
