<div class="inputItemBlock">
	<div class="inputItemL">
		{i18n key="{$title}" strip=true}
	</div>
	<div class=" inputItemR">
		<div class="inputItemBoxContent">
			<input name="{$item->defTab}[{$itemNum}][{$title}]" type="text" value="{if isset($item->$title)}{$item->$title}{/if}" />
		</div>
	</div>
	<div class=" clear" ></div>
</div>