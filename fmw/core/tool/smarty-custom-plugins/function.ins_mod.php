<?php

function smarty_function_ins_mod($params)
{
	if (isset($params['name'])) {
		$name = getStr($params['name']);
		if ($name) {
			global $_web;
			$out = new \Fmw\Core\Model\OutModuleModel();
			$out->name = $name;

			if ($out->findOne()) {
				$type = isset($params['type']) ? $params['type'] : 'pub';

				$path = $out->getPath($type, 'out');
				if ($path) {
					ob_start();
					$module = $out->getModule();
					$tplStr = $module->getTemplStr($out->dir);
					if ($tplStr) {
						$module->smarty->display($tplStr);
					} else {
						$return_from_module = ob_get_clean();
						echo $return_from_module;
					}
					return;
				}
			}
		}
	}
}
