
<div class="modList">
	<table>
		<tr>
			<th>ID</th>
			<th>title</th>
		</tr>
		{foreach $regMods  as $type => $regMod}
			<tr {if $regMod@iteration % 2}class="even"{else}class="odd"{/if}>
				<td>{$regMod->id}</td>
				<td>{$regMod->name}</td>
			</tr>
		{/foreach}
	</table>
</div>
{*
{if isset( $list[ 'unreg' ]  )}
<form method="post">
{foreach $list[ 'reg' ]  as $unregMod}
<div class="inputBox">
<span>{$unregMod}</span>
<button type="submit" name="{$type}[{$unregMod}]">Add</button>
</div>
{/foreach}
</form>
{/if}
*}