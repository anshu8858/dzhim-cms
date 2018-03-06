{block "content"}
	{if isset( $galleries )}
		<div class="galleryListBlock">
			{foreach $galleries as $gallery}
				<div style="float:left;margin-right: 5px;" class="galleryBlock">
					<div class="galleryContent">
						<a href="{$gallery->getUrl()}">
							<img alt="{$gallery->title}" src="{$gallery->img}"  style="width:200px;height: 200px;"/>
						</a>
					</div>
					<div class="galleryImgMeta">
						<div style="font-weight: bold;text-decoration: underline;">{$gallery->title}</div>
					</div>
				</div>
			{/foreach}
		</div>
	{/if}

{/block}

{block "css"}
	<link rel="stylesheet" type="text/css" href="/ui/css/prods.css"/>
{/block}
