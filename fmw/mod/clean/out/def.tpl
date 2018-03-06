{block "content"}
	{if isset( $partners )}
		<ul>
			{foreach $partners as $partner}
				<li>
					<a href="{$partner->url}">{$partner->title}</a>
				</li>
			{/foreach}
		</ul>
	{/if}
{/block}