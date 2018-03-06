{block 'content'}
	<div class="startpageWrapper">

		{if isset( $item )}
			<div class="startpageBlock">
				{if $item->title}
					<h2 class="uppercase" style="text-align: center;">{$item->title}</h2>
				{/if}
				{if  $item->f_content}
					{$item->f_content}
				{/if}
			</div>
		{/if}

		{if isset($products) }
			<div class="startpageBlock" style="background: #a6ff3e;">
				<div class="startpageBlockHead">
					<h3 class="uppercase"><a href="{$productPage->dir}">{$productPage->title}</a></h3>
				</div>
				<div class="startpageBlockBody">
					{foreach $products as $product}
						<div class="partnerItemL l">
							{if isset( $product->img ) && $product->img}
								<a title="{$product->title}" href="{$product->getUrl($productPage->dir)}">
									<img alt="{$product->title}" src="{$product->img}" style="width:200px;height:200px;"/>
								</a>
								<div class="productPrice">
									{$product->price}
								</div>
							{/if}
						</div>
					{/foreach}
				</div>
			</div>
		{/if}

		{if isset($projects) }
			<div class="startpageBlock" style="background: #ed9d64;">
				<div class="startpageBlockHead">
					<h3 class="uppercase"><a href="{$projectPage->dir}">{$projectPage->title}</a></h3>
				</div>
				<div class="startpageBlockBody">
					{foreach $projects as $project}
						<div class="partnerItemL l">
							{if isset( $project->img ) && $project->img}
								<a title="{$project->title}" href="{$project->getUrl($projectPage->dir)}">
									<img alt="{$project->title}" src="{$project->img}" style="width:200px;height:200px;"/>
								</a>
							{/if}
						</div>
					{/foreach}
				</div>
			</div>
		{/if}

		{if isset($partners) }
			<div class="startpageBlock" style="background: #2fb0f0;">
				<div class="startpageBlockHead">
					<h3 class="uppercase"><a href="{$partnerPage->dir}">{$partnerPage->title}</a></h3>
				</div>
				<div class="startpageBlockBody">
					{foreach $partners as $partner}
						<div class="partnerItemL l">
							{if isset( $partner->img ) && $partner->img}
								<a title="{$partner->title}" href="{$partner->url}">
									<img alt="{$partner->title}" src="{$partner->img}" style="width:200px;height:200px;"/>
								</a>
							{/if}
						</div>
					{/foreach}
				</div>
			</div>
		{/if}

		{if isset($albums) }
			<div class="startpageBlock" style="background: #ff3ea5;">
				<div class="startpageBlockHead">
					<h3 class="uppercase"><a href="{$albumPage->dir}">{$albumPage->title}</a></h3>
				</div>
				<div class="startpageBlockBody">
					{foreach $albums as $album}
						<div class="partnerItemL l">
							{if isset( $album->img ) && $album->img}
								<a title="{$album->title}" href="{$album->getUrl($albumPage->dir)}">
									<img alt="{$album->title}" src="{$album->img}" style="width:200px;height:200px;"/>
								</a>
							{/if}
						</div>
					{/foreach}
				</div>
			</div>
		{/if}
	</div>

{/block}
