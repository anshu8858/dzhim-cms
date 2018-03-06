{if isset( $langs )}
	<ul class="menuUl langMenuUl uppercase">
		{foreach $langs as $lang}
			{if $lang->id == $currentLangId}
				<li class="menuLi langMenuLi activeLangMenuLi">
					{$lang->three_char}
				</li>
			{else}
				<li class="menuLi langMenuLi">
					<a href="/{if !$lang->is_def}{$lang->three_char}{/if}" class="langMenuItemTitle">{$lang->three_char}</a>
				</li>
			{/if}
		{/foreach}
	</ul>
{/if}
