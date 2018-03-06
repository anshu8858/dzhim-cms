<div class="inputItemBlock">
	<div class="inputItemL">
		{i18n key="{$title}" strip=true}
	</div>
	<div class="inputItemR">
		<div class="inputItemBoxContent">
			<textarea name="{$item->defTab}[{$itemNum}][{$title}]" class="ck">
				{if isset($item->$title)}
					{$item->$title}
				{/if}
			</textarea>			
		</div>
	</div>
	<div class=" clear" ></div>
</div>