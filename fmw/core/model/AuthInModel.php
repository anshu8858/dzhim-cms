<?php
namespace Fmw\Core\Model;

/**
 * inModel authorization control
 */
class AuthInModel extends \Fmw\Core\Out\Smarty
{

	public $errors = array();

	/**
	 * every /admin cat includes this auth model. redir to login page if is unauth
	 * @global type $_web
	 */
	function __construct()
	{
		parent::__construct();
		global $_web;
		$toAdmin = $toLogin = false;
		$loginUri = '/admin/login';

		/* e
		  $this->setTriesLeft(5);
		 */

		// check if logged in
		/**
		 * check if guest is valid for auth content
		 */
		if (IpInModel::isAllowed($_SERVER['REMOTE_ADDR'])) {
			$usrId = $this->isAuth();
			// not logged in
			if (!$usrId) {
				// redir to login, if is not already there 
				if ($_web->cat->dir !== $loginUri) {
					header('Location: ' . $loginUri);
					exit();
				}
				// logged in
			} else {
				if (isset($_GET['logout'])) {
					$this->logOut();
				} elseif ($_web->cat->dir === $loginUri) {
					header('Location: /admin');
					exit();
				}
			}
		} else {
			to404();
		}
	}

	/**
	 * handle login request
	 * @global type $_config
	 * @return boolean
	 */
	function handleLogin()
	{
		$isValid = false;
		$triesLeft = $this->getTriesLeft() - 1;

		// has filled fields
		if (isset($_POST['email'], $_POST['pw']) && !( isEmptyStr($_POST['email']) || isEmptyStr($_POST['pw']) )) {
			// find by email
			$usr = new UsrModel();
			$usr->_filter = 1;
			$usr->email = strtolower($_POST['email']);

			// found
			if ($usr->findOne()) {

				// when somebody tried to login w this email
				$usr->last_conn_time = time();

				// from which ip
				$usr->last_ip = $_SERVER['REMOTE_ADDR'];

				// is valid usr for login
				if ($usr->canLogin()) {
					global $_config;

					// pw is valid
					if ($usr->isValidPw($_POST['pw'], $usr->pw)) {
						$isValid = true;

						// set tries as max tries
						$triesLeft = $_config->auth['max_tries'];

						// login data
						$usr->last_login_time = time();
					} else {
						if ($triesLeft == 0) {
							$usr->status = 'blocked';
						}
					}

					// login process was successfull
					if ($isValid) {

						// create session
						$this->setUser((array) $usr);
					}
					// banned user
				}
				$usr->tries_left = $triesLeft;
				$usr->update();
			} else {
				// decrease tries if failed
				$this->errors[] = 'wrong_email';
			}
		} else {
			$this->errors[] = 'empty';
		}

		// tries exceeded
		if ($triesLeft < 1) {
			IpInModel::block($_SERVER['REMOTE_ADDR']);
			$this->errors[] = 'blocked';
		}

		// decrease login tries
		$this->setTriesLeft($triesLeft);
		return $isValid;
	}

	/**
	 * check if can try again to login
	 * @return boolean
	 */
	function canTry()
	{
		$triesLeft = $this->getTriesLeft();
		// check session
		if ($triesLeft) {
			return $triesLeft;
		}
		return false;
	}

	/**
	 * has this user active /admin session
	 * @return boolean
	 */
	function isAuth()
	{
		$usrId = $this->getUser('id');
		if ($usrId) {
			return $usrId;
		}
		return false;
	}

	/**
	 * get user's /admin session
	 * @param type $field
	 * @return boolean
	 */
	function getUser($field = false)
	{
		if (isset($_SESSION['in']['usr']) && $_SESSION['in']['usr']) {
			if ($field) {
				if (isset($_SESSION['in']['usr'][$field]) && $_SESSION['in']['usr'][$field]) {
					return $_SESSION['in']['usr'][$field];
				}
			} else {
				return $_SESSION['in']['usr'];
			}
		}
		return false;
	}

	/**
	 * set user's /admin session
	 * @param type $data
	 * @param type $field
	 * @return boolean
	 */
	function setUser($data, $field = false)
	{
		if ($field) {
			$_SESSION['in']['usr'][$field] = $data;
		} else {
			$_SESSION['in']['usr'] = $data;
		}
		return true;
	}

	function getTriesLeft()
	{
		if (isset($_SESSION['in']['login']['tries_left'])) {
			return $_SESSION['in']['login']['tries_left'];
		} else {
			global $_config;
			return $_config->auth['max_tries'];
		}
	}

	function setTriesLeft($cnt)
	{
		$_SESSION['in']['login']['tries_left'] = $cnt;
	}

	function logOut()
	{
		unset($_SESSION['in']['usr']);
		header('Location: /admin/login');
		exit();
	}
}

?>
