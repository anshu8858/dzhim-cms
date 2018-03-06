{block "content"}
	{if isset( $item )}
		<h2>{$item->title}</h2>
		{$item->f_content}
	{/if}
{/block}