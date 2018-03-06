{if isset( $links) }
	<div class="headCatBlock">
		<ul class="menuUl">
			{foreach $links as $link}
				<li class="headCatLi menuLi{if $link->level > 1 && strpos(  $smarty.server.REQUEST_URI, $link->dir ) !== false} headCatActive{/if}">
					<a href="{$link->dir}" >{$link->title}</a>
				</li>
			{/foreach}
		</ul>
	</div>
	<div class="clear"></div>
{/if}
