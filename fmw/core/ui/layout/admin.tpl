<!DOCTYPE html>
<html>
    <head>
		<title>{block "title"}{$_web->cat->title}{/block}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/ui/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="/admin/ui?t=css&n=layout_2"/>
	{block "css"}{/block}
	<script type="text/javascript" src="/ui/js/jq.js" ></script>
</head>
<body>
	<div class="mainWrapBlock">
		<div class="headBlock">
			{*
			<div class="headTitle">
			<h1>{$_web->cat->title}</h1>
			</div>
			*}
			{ins_mod name='head_tabs' type="core"}
		</div>
		{block 'content'}
		{/block}

		<div class="footerBlock">
		</div>
	</div>
{block "js"}{/block}
</body>
</html>