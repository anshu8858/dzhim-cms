<?php

function smarty_function_i18n($params, $template)
{
	$return = '';
	if (isset($params['key'])) {
		$strip = false;
		$trim = false;
		if (!isset($params['def'])) {
			$params['def'] = $params['key'];
		}
		global $_web;
		$msg = Fmw\Core\Model\MsgModel::getByName($params['key'], $_web->langId);
		if ($msg) {
			$return = $msg;
		} else {
			$return = $params['def'];
			Fmw\Core\Model\MsgModel::ins($params['key'], $params['def']);
		}
		if (isset($params['strip'])) {
			$strip = true;
		}
		if (isset($params['trim'])) {
			$trim = true;
		}
		if (isset($params['plain'])) {
			$strip = true;
			$trim = true;
		}
		if ($strip) {
			$return = strip_tags($return);
		}
		if ($trim) {
			$return = trim($return);
		}
	}
	return $return;
}
