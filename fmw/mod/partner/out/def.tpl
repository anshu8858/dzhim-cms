{block "content"}
	{if isset( $partners )}
		<div class="partnerList">
			{foreach $partners as $partner}
				<div class="partnerItem">
					<div class="partnerItemL" style="width:30%;float:left;">
						{if isset( $partner->img ) && $partner->img}
							<a title="{$partner->title}" href="{$partner->url}" target="_blank" rel="noopener noreferrer">
								<img class="cubicImg200" alt="{$partner->title}" src="{$partner->img}"/>
							</a>
						{/if}
					</div>
					<div class="partnerItemR">
						<div class="partnerTitle">
							<h1><a href="{$partner->url}" target="_blank" rel="noopener noreferrer">{$partner->title}</a></h1>
						</div>
						<div class="partnerContent">
							{if isset( $partner->f_content ) && $partner->f_content}
								{$partner->f_content}
							{/if}
						</div>
					</div>
					<div class="clear"></div>
				</div>
			{/foreach}
		</div>
	</ul>
{/if}
{/block}
