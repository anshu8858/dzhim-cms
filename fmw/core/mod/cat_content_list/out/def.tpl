{block name="content"}
	{if isset( $fields )}
		<form method="post">
			<div class="listMenu">
				<button  title="{i18n key='delete' def='Delete' plain=1}"  type="submit" name="submitList" value="del" class="l del imgBtn" data-msg="{i18n key="do_you_want_del" def="Do you really want to delete?" plain=1}"  >
					<img src="/ui/css/ico/16x16/delete.png"/>
				</button>
				<button  title="{i18n key='add' def='Add' plain=1}" type="button" onclick="location.href = '{$catContentOneUrl}?catid={$smarty.get.catid}'" class="r imgBtn">
					<img src="/ui/css/ico/16x16/add.png"/>
				</button>
			</div>
			<div class="clear"></div>

			<table>
				<tr>
					<th><input type="checkbox" class="selAllCb" /></th>
						{foreach $fields as $field}
						<th>{i18n key="{$field[ 'Field' ]}" strip=true}</th>
						{/foreach}
				</tr>
				{if isset( $list )}
					{foreach $list as $item}
						<tr {if $item@iteration % 2}class="even"{else}class="odd"{/if}>
							<td>
								<input type="checkbox" name="id[{$item->id}]" class="rowCb" />
							</td>
							{foreach $fields as $field}
								<td onclick="location.href = '{$catContentOneUrl}?catid={$smarty.get.catid}&id={$item->id}'" >{if $field[ 'Type'] == 'text' }{trimStr($item->$field[ 'Field' ])}{else}{$item->$field[ 'Field' ]}{/if}</td>
							{/foreach}
						</tr>
					{/foreach}
				{/if}
			</table>
		</form>
	{/if}
{/block}

{block "css"}
	<link rel="stylesheet" type="text/css" href="/admin/ui?t=css&n=cat_content_list"/>
{/block}
{block "js"}
	<script type="text/javascript" src="/admin/ui?t=js&n=cat_content_list"></script>
{/block}