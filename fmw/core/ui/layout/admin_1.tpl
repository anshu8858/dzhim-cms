<!DOCTYPE html>
<html>
    <head>
		<title>{block "title"}{$_web->cat->title}{/block}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/ui/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="/ui/css/layout_2.css"/>
        <script type="text/javascript" src="/ui/js/jq.js" ></script>
		<script type="text/javascript" src="/ui/js/base.js" ></script>
    </head>
    <body>
        <div class="mainWrapBlock">
            <div class="headBlock">
				<div class="headTitle">
					<h1>{$_web->cat->title}</h1>
				</div>
                {ins_mod name='head_tabs' type="core"}
            </div>
			{block 'content'}
			{/block}
			<div class="clear"></div>
			<div class="footerBlock">
			</div>
        </div>
    </body>
</html>