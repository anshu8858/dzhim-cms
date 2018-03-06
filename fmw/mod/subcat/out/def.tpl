{block "content"}
	{if isset( $subcats )}
		<ul>
			{foreach $subcats as $subcat}
				<li>
					<a href="{$subcat->dir}">{$subcat->title}</a>
				</li>
			{/foreach}
		</ul>
	{/if}
{/block}