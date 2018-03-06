{block 'content'}
	{foreach $regModsList  as $type => $regMods}

		<h2>{strtoupper( $type )}</h2>
		<div class="modList">
			<table>
				<tr>
					<th>ID</th>
					<th>title</th>
				</tr>
				{if !empty( $regMods )} 
					{foreach $regMods as  $regMod}
						<tr {if $regMod@iteration % 2}class="even"{else}class="odd"{/if}>
							<td>{$regMod->id}</td>
							<td>{$regMod->name}</td>
						</tr>
					{/foreach}
				{/if}
			</table>
			{if !empty( $unRegModsList[ $type ] )} 
				<form method="post">
					{foreach $unRegModsList[ $type ]  as  $unRegMod}
						<div class="inputItemBlock">
							<div class="inputItemL">{$unRegMod}</div>
							<div class=" inputItemR">
								<div class="inputItemBoxContent">
									<button type="submit" name="modIns" value="{$type}-{$unRegMod}" class="imgBtn">
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


	{/foreach}


{/block}
{block "css"}
	<link rel="stylesheet" type="text/css" href="/admin/ui?t=css&n=cat_content_list"/>
{/block}