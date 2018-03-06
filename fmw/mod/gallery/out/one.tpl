{block "content"}
	{if isset( $gallery )}
		<div class="galleryBlock">
			<div class="galleryTitle">
				<h2>{$gallery->title}</h2>
			</div>
			<div class="galleryContent" >
				{if isset( $gallery->gallery_item ) && $gallery->gallery_item }
					{foreach $gallery->gallery_item as $img}
						<div class="galleryImgBlock" style="float:left;margin-right: 5px;">
							<div class="galleryContent">
								<a href="{$img->img}"  class="imgPreview">
									<img src="{$img->img}"  style="width:150px;height:150px;"/>
								</a>
							</div>
							<div class="galleryImgMeta">
								<div style="font-weight: bold;text-decoration: underline;">{$img->title}</div>
								<div>{$img->descr}</div>
							</div>
						</div>

					{/foreach}
				{/if}
			</div>
		</div>
	{/if}
{/block}
