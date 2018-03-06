{block "content"}

	{if isset( $product )}

		<div class="topContentBlock">
			<div class="lContentBlock">
				<div class="lContentBlockImgBblock">
					{if isset( $product->img ) && $product->img}
						<img src="{$product->img}" />
					{/if}
				</div>
				<div class="whBlock">
					<div class="productPrice">{$product->price}</div>
				</div>
			</div>

			<div class="rContentBlock">

				<div class="prodsTitle">
					<h2>{$product->title}</h2>
				</div>
				<div class="headContent">
					{$product->f_content}
				</div>
				<div class="footerContent">
				</div>
			</div>
		</div>
		<div class="clear"></div>

		<div class="bottomContentBlock">

		</div>

	{/if}
{/block}

{block "css"}
	<link rel="stylesheet" type="text/css" href="/ui/css/prods.css"/>
{/block}
