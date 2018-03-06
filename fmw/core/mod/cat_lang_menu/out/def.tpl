{block "content"}
	{* <h3>{i18n key="langs" def="Valodas"}</h3> *}
	<div class="lCatLangMenuBlock">

		<form method="get" action="/admin/cat/lang"> 
			<button type="button" onclick='location.href = "/admin/cat/lang"' title="{i18n key='add_lang' def='Add language' plain=1}"  class="l imgBtn{if !(isset( $smarty.get.id ) && $smarty.get.id ) && strpos(  $smarty.server.REQUEST_URI, '/admin/cat/lang' ) !== false} imgBtnActive{/if}">
				<img src="/ui/css/ico/16x16/add.png"/>
			</button>

			<select name="id" class="langSel">
				{if isset( $list )}
					{if isset( $activeLang )}
						{foreach $list as $item}
							<option value="{$item->id}" {if $activeLang == $item->id}selected="selected"{/if}>{$item->title}</option>
						{/foreach}
					{else}
						{foreach $list as $item}
							<option value="{$item->id}">{$item->title}</option>
						{/foreach}
					{/if}
				{/if}
			</select>
			<button title="{i18n key='load' def='Load' plain=1}" type="submit" class="r imgBtn{if (isset( $smarty.get.id ) && $smarty.get.id ) && strpos(  $smarty.server.REQUEST_URI, '/admin/cat/lang' ) !== false} imgBtnActive{/if}">
				<img src="/ui/css/ico/16x16/zoom.png"/>
			</button>
		</form>

	</div>
{/block}