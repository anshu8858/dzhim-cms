{if isset( $links) }
	<div class="headCatBlock">
		<ul class="headCatUl">
			{foreach $links as $link}
				<li class="headCatLi" >
					<a href="{$link->dir}" {if strpos(  $smarty.server.REQUEST_URI, $link->dir ) !== false}class="headCatActive"{/if} >{$link->title}</a>
				</li>
			{/foreach}
		</ul>
		<button class="imgBtn" type="button" onclick="location.href = '/admin?logout';" title="{i18n key='logout' def='Logout' plain=1}">
			<img src="/ui/css/ico/16x16/logout.png">
		</button>
	</div>
	<div class="clear"></div>
{/if}