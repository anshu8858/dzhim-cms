<div class="inputItemBlock">
	<div class="inputItemL">
		{i18n key="{$title}" strip=true}
	</div>
	<div class=" inputItemR">
		<div class="inputItemBoxContent">
			<select name="{$item->defTab}[{$itemNum}][{$title}]">
				{foreach $vals as $val}
					<option value="{$val}" {if isset($item->$title) && $item->$title == $val }selected="selected"{/if}>{i18n key="{$val}" strip=true}</option>
				{/foreach}
			</select>
		</div>
	</div>
	<div class=" clear" ></div>
</div>