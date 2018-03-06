{block "content"}
	{if isset( $projects )}
		<div class="partnerList">
			{foreach $projects as $project}
				<div class="partnerItem" style="text-align:center">
					<div class="projectItemTop">
						<div>
							<h3>{$project->title}</h3>
						</div>
						<div>
							{if isset( $project->img ) && $project->img}
								<a title="{$project->title}" href="{$project->url}">
									<img width=800 height=200 alt="{$project->title}" src="{$project->img}"/>
								</a>
							{/if}
						</div>
					</div>
					<div class="projectItemContent" >
						{if isset( $project->f_content ) && $project->f_content}
							{$project->f_content}
						{/if}
					</div>
					<div class="clear"></div>
				</div>
			{/foreach}
		</div>
	</ul>
{/if}
{/block}