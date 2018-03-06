<?php
namespace Fmw\Core\Model;

class IpInModel extends \Fmw\Core\Model
{

	public $defTab = '_ip';

	static function isAllowed($ip)
	{
		$mod = new self;
		$mod->ip = $ip;
		$mod->status = 'allowed';
		if ($mod->findOne()) {
			return true;
		}
		return false;
	}

	static function block($ip)
	{
		$mod = new self;
		$mod->ip = $ip;
		if ($mod->findOne()) {
			$mod->status = 'blocked';
			$mod->update();
			return true;
		}
		return false;
	}
}

?>
