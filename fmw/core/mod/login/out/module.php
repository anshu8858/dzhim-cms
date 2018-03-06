<?php

class loginModule extends \Fmw\Core\Model\InOneModel
{

	// unauth users are redirected here from AuthInModel construct()
	function __construct()
	{
		parent::__construct();
		$showLogin = false;
		$blocked = false;


		// if is not banned and has paermissions
		$triesLeft = $this->canTry();
		if ($triesLeft) {
			// if fields are not empty
			if (isset($_POST['loginIn'])) {

				// this can be used anywhere :)
				$status = $this->handleLogin();

				// success
				if ($status) {
					header('Location: /admin');
					exit();

					// errors
				} else {
					$triesLeft--;
					if ($triesLeft > 0) {
						$this->smarty->assign('triesLeft', $triesLeft);
						$this->smarty->assign('errors', $this->errors);
						$showLogin = true;
						// blocked
					} else {
						$blocked = true;
					}
				}
			} else {
				// is valid guest that havent requested login
				$showLogin = true;
			}
		}

		if ($showLogin) {
			$this->setTempl('login');
		} else {
			if ($blocked) {
				$this->setTempl('blocked');
			} else {
				// nothing here to see
				to404();
			}
		}
	}
}

?>
