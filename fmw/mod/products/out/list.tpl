{block "content"}
	{if isset( $products )}
		<ul>
			{foreach $products as $product}
				<li>
					<a href="{$product->getUrl()}">{$product->title}</a> / {$product->price}
				</li>
			{/foreach}
		</ul>
	{/if}

{/block}

{block "css"}
	<link rel="stylesheet" type="text/css" href="/ui/css/prods.css"/>
{/block}
