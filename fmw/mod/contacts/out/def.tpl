{block "content"}
	{if isset( $item )}
		<h2 style="font-size: 100px; text-align: center;">{$item->title}</h2>
		<div style="text-align: right;">
			{$item->f_content}
		</div>
	{/if}
{/block}