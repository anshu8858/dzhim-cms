<!DOCTYPE html>
<html>
    <head>
		<title>{block "title"}{$_home[ 'title' ]} - {$_web->cat->title}{/block}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/ui/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="/ui/css/layout-def.css?v=2"/>
	{block "css"}{/block}
	<script type="text/javascript" src="/ui/js/jq.js" ></script>
</head>
<body>
	<div class="mainWrapBlock">
		<div class="headBlock">
			<div class="headTopBlock">
				<div class="headTitle l">
					<h1><a href="/">{$_home[ 'title' ]}</a></h1>
				</div>
				<div class="langMenu r">
					{ins_mod name='head_lang_menu'}
				</div>
				<div class="clear"></div>
			</div>
			<div class="headBottomBlock">
				{ins_mod name='head_cat_menu'}
				<div class="clear"></div>
			</div>
		</div>
		<div class="contentBlock">
			<div class="contentBlock2">
				{block 'content'}
				{/block}
			</div>
			<div class="clear"></div>
		</div>
		<div class="footerBlock">
			{ins_mod name='footer_about'}
		</div>
	</div>
{block "js"}{/block}
</body>
</html>
