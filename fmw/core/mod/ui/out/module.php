<?php

class uiModule extends \Fmw\Core\Model\OutModel
{

	private $ckFiles = array();
	private $ckDir = '';

	function __construct()
	{
		parent::__construct();

		// CHECK IF AUTH
		if (isset($_GET['t'], $_GET['n'])) {

			if (in_array($_GET['t'], array('js', 'css'))) {
				$file = __core . '/ui/' . $_GET['t'] . '/' . $_GET['n'] . '.' . $_GET['t'];
				prUi($file, $_GET['t']);
			}
			/* if (in_array($_GET['t'], array('browse', 'upload'))) {
			  $this->fileManager($_GET['t'], $_GET['n']);
			  exit;
			  } */
		}
		to404();
	}

	function fileManager($class, $name)
	{

		$this->type = $_GET['type'] = $name;
		$this->ckDir = $base = __core . '/tool/kcfinder/';
		define('__ckDir', $base);
		$path = $base . $class . '.php';
		require_once $path;
	}

	function recursDirIter($base)
	{
		foreach (new \DirectoryIterator($base) as $fileInfo) {
			if ($fileInfo->isDot())
				continue;
			if ($fileInfo->isDir()) {
				$this->recursDirIter($fileInfo->getPathname());
			}
			if ($fileInfo->getExtension() == 'php') {
				if (!in_array($fileInfo->getPathname(), array($this->ckDir . '\browse.php', $this->ckDir . '\upload.php'))) {
					$this->ckFiles[] = $fileInfo->getPathname();
				}
			}
		}
	}
}

?>
