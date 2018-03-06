<ul class="stUl {if isset($class) && $class}{$class}{/if}">
	{if isset( $smarty.get.catid ) &&  $smarty.get.catid}
		<li class="sttLi" >
			<a href="{$catContentUrl}?catid={$item->id}" {if $smarty.get.catid == $item->id}class="stActive"{/if} >{$item->title}</a>
			{if isset( $item->children )}
				{foreach $item->children as $child}
					{include file="../out/child.tpl" item=$child class=false}
				{/foreach}
			{/if}
		</li>
	{else}
		<li class="sttLi" >
			<a href="{$catContentUrl}?catid={$item->id}" >{$item->title}</a>
			{if isset( $item->children )}
				{foreach $item->children as $child}
					{include file="../out/child.tpl" item=$child class=false}
				{/foreach}
			{/if}
		</li>
	{/if}
</ul>