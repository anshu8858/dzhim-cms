{block name="content"}
	<div class="catContentMenuBlock">
		{if isset( $smarty.get.catid )}
			<ul class="catContentMenuUl">
				<li class="catContentMenuLi{if strpos(  $smarty.server.REQUEST_URI, '/admin/cat/settings' ) !== false} catContentMenuActive{/if}">
					<a href="/admin/cat/settings?catid={$smarty.get.catid}" >{i18n key="settings" def="Settings" plain=true}</a>
				</li>

				{if isset( $hasInMod )} 
					<li class="catContentMenuLi{if strpos(  $smarty.server.REQUEST_URI, '/admin/cat/content/list' ) !== false || strpos(  $smarty.server.REQUEST_URI, '/admin/cat/content/one' ) !== false } catContentMenuActive{/if}" >
						<a href="/admin/cat/content/list?catid={$smarty.get.catid}">{i18n key="content" def="Content" plain=true}</a>
					</li>
				{/if}
			</ul>
		{/if}
	</div>
{/block}