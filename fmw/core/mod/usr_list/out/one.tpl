{block 'content'}
	<div class="modList">
		<table>
			<tr>
				<th>title</th>
			</tr>
			{if $regList } 
				{foreach $regList as  $regLayout}
					<tr {if $regLayout@iteration % 2}class="even"{else}class="odd"{/if}>
						<td>{$regLayout}</td>
					</tr>
				{/foreach}
			{/if}
		</table>
		{if $unRegList } 
			<form method="post">
				{foreach $unRegList  as  $unRegLayout}
					<div class="inputItemBlock">
						<div class="inputItemL">{$unRegLayout}</div>
						<div class=" inputItemR">
							<div class="inputItemBoxContent">
								<button type="submit" name="layoutIns" value="{$unRegLayout}" class="imgBtn">
									<img src="/ui/css/ico/16x16/add.png"/>
								</button>	
							</div>
						</div>
						<div class=" clear"></div>
					</div>
				{/foreach}
			</form>
		{/if}
	</div>


{/block}
{block "css"}
	<link rel="stylesheet" type="text/css" href="/admin/ui?t=css&n=cat_content_list"/>
{/block}