<div class="inputItemBlock">
	<div class="inputItemL">
		{i18n key="{$title}" strip=true}
	</div>
	<div class=" inputItemR">
		<div class="inputItemBoxContent">
			<input name="{$item->defTab}[{$itemNum}][{$title}]" type="checkbox" {if isset($item->$title) && $item->$title}checked="checked"{/if} value="1" /><br />
		</div>
	</div>
	<div class=" clear" ></div>
</div>