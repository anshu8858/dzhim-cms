<!DOCTYPE html>
<html>
    <head>
		<title>{block "title"}{$_web->cat->title}{/block}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/ui/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="/admin/ui?t=css&n=layout_2"/>
	{block "css"}{/block}
	<script type="text/javascript" src="/ui/js/jq.js" ></script>
	<script type="text/javascript" src="/ui/js/base.js" ></script>
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
		<div class="contenWrapBlcok">
			<div class="lsideBlock">
				{ins_mod name="cat_lang_menu" type="core"}
				{ins_mod name='cat_edit_list' type="core"}
			</div>
			<div class="contentBlock">
				{ins_mod name='cat_content_menu' type="core"}
				<div class="clear"></div>
				{block 'content'}

				{/block}
			</div>
		</div>
		<div class="clear"></div>
		<div class="footerBlock">
			{ins_mod name="footer_fmw_info" type="core"}
		</div>
	</div>
{block "js"}{/block}	
</body>
</html>