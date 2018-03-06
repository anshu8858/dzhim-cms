<div class="inputItemBlock">
	<div class="inputItemL">
		{i18n key="{$title}" strip=true}
	</div>
	<div class=" inputItemR">
		<div class="inputItemBoxContent">
			<div class="imgBlock">
				<div style="float:left;">
					<div class="imgBrowse" >
						<input class="imgSrc" type="hidden" name="{$item->defTab}[{$itemNum}][{$title}]" {if isset($item->$title) && $item->$title}value="{$item->$title}"{/if} />
						<a href="{if isset($item->$title) && $item->$title}{$item->$title}{else}#{/if}" class="imgPreview">
							<img class="imgThumb" src="{if isset($item->$title) && $item->$title}{$item->$title}{else}#{/if}" />
						</a>
					</div>
				</div>
				<div style="float: left;margin-top: 40px; margin-left: 20px;">
					<button title="{i18n key='add' def='Add' plain=1}" type="button" style="margin-bottom: 10px;" onclick="openKCFinder(this, '{$item->defTab}')" class="imgBtn">
						<img src="/ui/css/ico/16x16/add.png"/><br />
					</button>
					<br/>
					<button title="{i18n key='delete' def='Delete' plain=1}" type="button" class="imgRm imgBtn" >
						<img src="/ui/css/ico/16x16/delete.png"/>
					</button>
					<br/>
				</div>
			</div>
		</div>
	</div>

	<div class=" clear" ></div>
</div>