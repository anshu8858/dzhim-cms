<div class="inputItemBlock">
	<div class="inputLabelBox l">
		{i18n key="{$title}" strip=true}
	</div>
	<div class=" inputItemBox">
		<textarea name="{$item->defTab}[{$itemNum}][{$title}]" >
			{if isset($item->$title)}
				{$item->$title}
			{/if}
		</textarea>
	</div>
	<div class=" clear" ></div>
</div>