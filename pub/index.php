<?php
initSys();

$req = new \Fmw\Core\Request();
if(! $req->parse() ){
    to404();
}

function initSys() {
    define('__root', dirname($_SERVER['DOCUMENT_ROOT']));
    define('__fmw', __root . '/fmw');
    define( '__baseUrl', 'http://' . $_SERVER[ 'HTTP_HOST' ] );
    require( __fmw . '/sys.php' );
    $sys = new \Fmw\Sys();
}

?>