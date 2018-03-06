<?php

function clean_buff()
{
	if (ob_get_length() > 0) {
		ob_end_clean();
	}
}

function to404()
{
	prex('404 Error');
}

function prUi($file, $type = 'css')
{
	if ($file && is_string($file) && strlen(trim($file)) > 0) {
		clean_buff();
		ob_start();

		switch ($type) {
			case 'css':
				$typeStr = 'text/css';
				break;
			case 'js':
				$typeStr = 'application/x-javascript';
				break;
		}

		header('Content-Type: ' . $typeStr);
		header('Expires: 0');
		header('Connection: close');
		header('Content-Length: ' . filesize($file));
		ob_clean();
		flush();
		readfile($file);
		exit();
	}
	return false;
}

function prFile($file)
{
	if ($file && is_string($file) && strlen(trim($file)) > 0) {
		$cont = file_get_contents($file);
		echo $cont;
		exit();
	}
	return false;
}

function dlDialog($file, $name = false)
{
	if ($file && is_string($file) && strlen(trim($file)) > 0) {
		$fileInfo = pathinfo($file);
		if (!$name) {
			$name = $fileInfo['filename'];
		}
		clean_buff();
		ob_start();

		header('Content-Description: File Transfer');
		header('Content-Type: application/octet-stream');
		header('Content-Disposition: attachment; filename=' . $name . '.' . $fileInfo['extension']);
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control: must-revalidate');
		header('Pragma: public');
		header('Content-Length: ' . filesize($file));
		ob_clean();
		flush();
		readfile($file);
		exit();
	}
	return false;
}

// set error reportinh
function setErrorReporting()
{
	error_reporting(E_ALL);
	ini_set('display_errors', TRUE);
	ini_set('display_startup_errors', TRUE);
}

function setDefLocale()
{
	date_default_timezone_set('Europe/Riga');
	header('Content-type: text/html; charset=utf-8');
	$locale = array('lv_LV.UTF-8', 'lat.UTF-8', 'Latvian_Latvia.UTF-8', 'latvian');
	if (setlocale(LC_ALL, $locale)) {
		return true;
	} else {
		prex('Can not set def locale fn87');
	}
}

// PRINT
function pr($item, $params = '')
{
	print '<p ' . $params . '>';
	if (is_string($item)) {
		print $item;
	} else {
		print_r($item);
	}
	print '</p>';
}

function prex($item)
{
	pr($item);
	exit();
}

function vd($item)
{
	var_dump($item);
}

function vdex($item)
{
	var_dump($item);
	exit();
}

//!= PRINT
function startUnbuf()
{
	ob_start();
	//echo str_pad('', 1024); // minimum start for Safari
}

function prUnbuf($item, $params = '')
{
	pr($item, $params);
	ob_flush();
	flush();
	sleep(1);
}

function stopUnbuf()
{
	clean_buff();
}

function setProgress($val)
{
	if (!isset($_SESSION['progress'])) {
		$_SESSION['progress']['step'] = $_SESSION['progress'] = array();
		$_SESSION['progress']['lastStep'] = 0;
	}
	$_SESSION['progress']['step'][] = $val;
}

function getProgress()
{
	if (isset($_SESSION['progress'], $_SESSION['progress']['step']) && !empty($_SESSION['progress']['step'])) {
		$return = array();
		$cnt = count($_SESSION['progress']['step']);
		$last = isset($_SESSION['progress']['lastStep']) ? $_SESSION['progress']['lastStep'] : 0;

		for ($i = $last; $i < $cnt; $i++) {
			$return[] = $_SESSION['progress']['step'][$i];
		}

		$_SESSION['progress']['lastStep'] = $cnt;

		return $return;
	}
	return false;
}

function is_r($path)
{

	if (file_exists($path) && is_readable($path)) {
		return true;
	}
	return false;
}

function isEmptyStr($str)
{
	if ($str && strlen(trim($str)) > 0) {
		return false;
	}
	return true;
}

function utf82win($str)
{
	return iconv('utf-8', 'windows-1257', $str);
}

function win2utf8($str)
{
	$newStr = @iconv('windows-1257', 'utf-8', $str);
	if (!$newStr) {
		return $str;
	} else {
		return $newStr;
	}
}

// HIGHLY RECOMMEND == NOT TO USE == BECAUSE OF TRACABILTY ISSUES
function getMod($name, $type = 'pub')
{
	$class = false;

	switch ($name) {
		case 'file':
			if ($type == 'core') {
				$ns = getNamespace('coreModel');
			}
			$class = $ns . "\FileModel";
			break;
	}

	if ($class) {
		return $mod = new $class;
	}
	return false;
}

function getNamespace($type)
{
	switch ($type) {
		case 'core':
			return;
		case 'coreModel':
			return "\Fmw\Core\Model";
		default:
			return;
	}
}

// != HIGHLY RECOMMEND == NOT TO USE == BECAUSE OF TRACABILTY ISSUES

function getPosNum($item)
{
	if ($item) {
		$item = (int) $item;
		if ($item > 0) {
			return $item;
		}
	}
	return false;
}

function isStringEmpty($item)
{
	if (strlen(trim($item))) {
		return false;
	}
}

function isEmpty($item, $type = 'str')
{
	if ($type) {
		switch ($type) {
			case 'str':
				return isStringEmpty($item);
		}
	} else {
		if (is_string($item)) {
			return isStringEmpty($item);
		} elseif (is_array($item)) {
			if (!empty($item)) {
				return false;
			}
		}
	}
	return true;
}

function getStr($item)
{
	if (!is_string($item)) {
		$item = (string) $item;
	}
	if (isStringEmpty($item)) {
		return false;
	}
	return $item;
}

function getHomeTitle()
{
	global $_config;

	if (isset($_config->home['title']) && $_config->home['title']) {
		$title = $_config->home['title'];
	} else {
		$title = $_SERVER['HTTP_HOST'];
	}
	return $title;
}

function getSlug($string, $space = '-')
{

	if (!function_exists('utf8_to_ascii')) {
		$path = __core . '/tool/utf8_to_ascii/utf8_to_ascii.php';
		require_once $path;
	}

	$string = trim($string);
	$string = utf8_to_ascii($string);
	$string = preg_replace("/[^a-zA-Z0-9 -]/", "", $string);
	$string = strtolower($string);
	$string = str_replace(" ", $space, $string);
	$string = preg_replace("/-{2,}/", "-", $string);
	return $string;
}

function inStr($str, $substr)
{
	$pos = strpos($str, $substr);
	if ($pos === false) {
		return false;
	}
	return true;
}

function isFormatedText($name)
{
	return inStr($name, 'f_');
}

function createUplDir($name)
{
	$types = array(
		'image',
		'file',
		'flash'
	);
	foreach ($types as $type) {

		$typeDir = __root . '/pub/res/' . $type;
		if (!is_r($typeDir)) {
			mkdir($typeDir);
		}

		$path = $typeDir . '/' . $name;
		if (!is_r($path)) {
			mkdir($path);
		}
	}
}

function isSess()
{
	if (function_exists('session_status')) {
		if (session_status() != 2) {
			return true;
		}
	} else if (session_id() != '') {
		return true;
	}
	return false;
}

function startSess()
{
	if (isSess()) {
		session_start();
	}
}

function gpByField($list, $field, $order = false)
{
	$return = array();
	foreach ($list as $item) {
		if (!isset($return[$item->$field])) {
			$return[$item->$field] = array();
		}
		$return[$item->$field][] = $item;
	}
	if (!empty($return) && $order) {
		if ($order == 'asc') {
			ksort($return);
		} else {
			krsort($return);
		}
	}
	return $return;
}

function msg($name, $langId = false, $content = false)
{
	return \Fmw\Core\Model\MsgModel::getByName($name, $langId, $content);
}

function plain($str)
{
	$str = strip_tags($str);
	$str = trim($str);
	return $str;
}

function trimStr($str, $maxLength = 30)
{
	$str = plain($str);
	$strLen = strlen($str);

	$trimmed = substr($str, 0, $maxLength);

	// add dots
	if ($strLen > $maxLength) {
		$trimmed .= '...';
	}
	return $trimmed;
}

?>