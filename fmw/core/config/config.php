<?php
namespace Fmw;

class Config
{

	public $base, $tool;

	function __construct()
	{
		// root
		$this->file['path'] = __root . '/file';
		$this->ui['path'] = __root . '/ui';

		// common
		$this->common['path'] = __fmw . '/common';
		$this->layout['path'] = $this->common['path'] . '/layout';
		$this->model['path'] = $this->common['path'] . '/model';
		$this->tool['path'] = $this->common['path'] . '/tool';
		// temp
		$this->temp['path'] = $this->common['path'] . '/temp';
		$this->cache['path'] = $this->temp['path'] . '/cache';
		$this->templ_c['path'] = $this->temp['path'] . '/templ_c';

		// mod
		$this->mod['path'] = __fmw . '/mod';

		// db
		$this->db['type'] = 'mysql';
		$this->db['host'] = 'localhost';
		$this->db['user'] = 'DB_USER';
		$this->db['pw'] = 'DB_PASSWORD';
		$this->db['name'] = 'DB_NAME';
		$this->db['tab_prefix'] = 'dzhim_';

		// home
		$this->home['title'] = 'YOUR PROJECT TITLE';

		// Default language's ID from the `_lang` table. 2 - EN.
		$this->lang['id'] = 2;

		// usr
		$this->auth['salt'] = "de6be28549a0db9d5a9eb2v70dc70mf43eb85c4f";
		$this->auth['max_tries'] = 5;
	}

	function isOk()
	{
		$resp = $this->isPathOk();
		if ($resp) {
			return true;
		} /* else {
		  if( isset( $resp[ 'error' ], $resp[ 'case' ] ) ){
		  pr( $resp[ 'case' ] . \Fmw\Core\Model\MsgModel::getByName( 'missing' ) );
		  }
		  } */
		return false;
	}

	function isPathOk($name = 'all')
	{
		switch ($name) {
			case 'tool':
				if (is_r($this->tool['path'])) {
					return true;
				}
				pr(msg('missing', false, 'Missing') . ' ' . $name . ' ' . msg('dir', false, 'directory'));
				break;
			case 'mod':
				if (is_r($this->mod['path'])) {
					return true;
				}
				pr(msg('missing', false, 'Missing') . ' ' . $name . ' ' . msg('dir', false, 'directory'));
				break;
			default:
				$cases = array(
					'tool',
					'mod'
				);
				foreach ($cases as $case) {
					if (!$this->isPathOk($case)) {
						return false; //array( 'error' => true, 'case' => $case );
					}
				}
				return true;
		}
		return false;
	}
}

?>
