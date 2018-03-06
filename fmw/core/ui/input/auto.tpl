{block name="content"}
	{$ck = false}
	{$img = false}

	{if isset( $catId )}

		{if isset( $fields )}
			<form method="post">
				<div class="catContentOneMenu">
					<button title="{i18n key='cancel' def='Cancel' plain=1}" type="button" onclick="location.href = '{$catContentListUrl}?catid={$catId}'" class="l imgBtn"><img src="/ui/css/ico/16x16/cancel.png"/></button>
						{if isset( $smarty.get.id )}
						<button title="{i18n key='save' def='Save' plain=1}" type="submit" name="submitOne" value="upd" class="r imgBtn"><img src="/ui/css/ico/16x16/save.png"/></button>
						{else}
						<button title="{i18n key='save' def='Save' plain=1}" type="submit" name="submitOne" value="ins" class="r imgBtn"><img src="/ui/css/ico/16x16/save.png"/></button>
						{/if}
				</div>
				<div class="clear"></div>

				{foreach $fields[ $item->defTab ]  as $field}
					{if $field[ 'Type'] == 'varchar'} 
						{if $field[ 'Field' ] == 'img'}
							{$img = true}
							{include file="../input/img.tpl" item=$item itemNum=1 title=$field[ 'Field' ]}
						{elseif $field[ 'Field' ] == 'pw'}
							{include file="../input/pw.tpl" item=$item itemNum=1 title=$field[ 'Field' ]}
						{else}
							{include file="../input/text.tpl" item=$item itemNum=1 title=$field[ 'Field' ]}
						{/if}
					{elseif $field[ 'Type'] == 'tinyint(1)'}
						{include file="../input/cb.tpl" item=$item itemNum=1 title=$field[ 'Field' ]}
					{elseif $field[ 'Type'] == 'text'}
						{if isFormatedText({$field[ 'Field' ]})}
							{$ck = true}
							{include file="../input/f_textarea.tpl" item=$item itemNum=1 title=$field[ 'Field' ]}
						{else}
							{include file="../input/textarea.tpl" item=$item itemNum=1 title=$field[ 'Field' ]}
						{/if}
					{elseif $field[ 'Type'] == 'enum'}
						{include file="../input/sel.tpl" item=$item itemNum=1 title=$field[ 'Field' ] vals=$field[ 'Vals' ] defVal=$field[ 'Def' ] }
					{/if}
				{/foreach}

				{if isset( $item->rel )}
					<button type="button"  class="r addRepeatItem imgBtn">
						<img src="/ui/css/ico/16x16/add.png"/>
					</button>
					<div class="clear"></div>
					{foreach $item->rel as $rel }
						<div style="border:solid 1px;">
							{if isset( $rel->list ) && !empty( $rel->list )}
								<div style="border:solid 1px;display:none;" class="repeatItem">
									<div class="repeatBlockBtnBlock" style="width:100px;float:right;">
										<button type="button"  class="r delRepeatItem imgBtn">
											<img src="/ui/css/ico/16x16/delete.png"/>
										</button>
										<div class="clear"></div>
									</div>
									{foreach $fields[ $rel->defTab ] as $relField}
										{if $relField[ 'Type'] == 'varchar'} 
											{if $relField[ 'Field' ] == 'img'}
												{$img = true}
												{include file="../input/img.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
											{else}
												{include file="../input/text.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
											{/if}
										{elseif $relField[ 'Type'] == 'tinyint(1)'}
											{include file="../input/cb.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
										{elseif $relField[ 'Type'] == 'text'}
											{if isFormatedText({$relField[ 'Field' ]})}
												{$ck = true}
												{include file="../input/f_textarea.tpl" item=$rel field=$relField  itemNum=0 title=$relField[ 'Field' ]}
											{else}
												{include file="../input/textarea.tpl" item=$rel field=$relField  itemNum=0 title=$relField[ 'Field' ]}
											{/if}
										{/if}
									{/foreach}
								</div>
								{foreach $rel->list as $relItem }
									<div style="border:solid 1px;" class="repeatItem">
										<div class="repeatBlockBtnBlock" style="width:100px;float:right;">
											<button type="button"  class="r delRepeatItem imgBtn">
												<img src="/ui/css/ico/16x16/delete.png"/>
											</button>
											<div class="clear"></div>
										</div>

										{foreach $fields[ $relItem->defTab ] as $relField}
											{if $relField[ 'Type'] == 'varchar'} 
												{if $relField[ 'Field' ] == 'img'}
													{$img = true}
													{include file="../input/img.tpl" item=$relItem field=$relField itemNum=$relItem@iteration  title=$relField[ 'Field' ]}
												{else}
													{include file="../input/text.tpl" item=$relItem field=$relField itemNum=$relItem@iteration title=$relField[ 'Field' ]}
												{/if}
											{elseif $relField[ 'Type'] == 'tinyint(1)'}
												{include file="../input/cb.tpl" item=$relItem field=$relField itemNum=$relItem@iteration title=$relField[ 'Field' ]}
											{elseif $relField[ 'Type'] == 'text'}
												{if isFormatedText({$relField[ 'Field' ]})}
													{$ck = true}
													{include file="../input/f_textarea.tpl" item=$relItem field=$relField itemNum=$relItem@iteration title=$relField[ 'Field' ]}
												{else}
													{include file="../input/textarea.tpl" item=$relItem field=$relField itemNum=$relItem@iteration title=$relField[ 'Field' ]}
												{/if}
											{/if}
										{/foreach}
									</div>
								{/foreach}
							{else}
								<div style="border:solid 1px;display:none;" class="repeatItem">
									<div class="repeatBlockBtnBlock" style="width:100px;float:right;">
										<button type="button"  class="r delRepeatItem imgBtn">
											<img src="/ui/css/ico/16x16/delete.png"/>
										</button>
										<div class="clear"></div>
									</div>
									{foreach $fields[ $rel->defTab ] as $relField}

										{if $relField[ 'Type'] == 'varchar'} 
											{if $relField[ 'Field' ] == 'img'}
												{$img = true}
												{include file="../input/img.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
											{else}
												{include file="../input/text.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
											{/if}
										{elseif $relField[ 'Type'] == 'tinyint(1)'}
											{include file="../input/cb.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
										{elseif $relField[ 'Type'] == 'text'}
											{if isFormatedText({$relField[ 'Field' ]})}
												{$ck = true}
												{include file="../input/f_textarea.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
											{else}
												{include file="../input/textarea.tpl" item=$rel field=$relField itemNum=0 title=$relField[ 'Field' ]}
											{/if}
										{/if}
									{/foreach}
								</div>
							{/if}
						</div>
					{/foreach}
				{/if}
				<div class="catContentOneMenu">
					<button title="{i18n key='cancel' def='Cancel' plain=1}" type="button" onclick="location.href = '{$catContentListUrl}?catid={$catId}'" class="l imgBtn">
						<img src="/ui/css/ico/16x16/cancel.png"/>
					</button>
					{if isset( $smarty.get.id )}
						<input type="hidden" name="id" value="{$smarty.get.id}" />
						<button  title="{i18n key='save' def='Save' plain=1}" type="submit" name="submitOne" value="upd"  class="r imgBtn">
							<img src="/ui/css/ico/16x16/save.png"/>
						</button>
					{else}
						<button  title="{i18n key='save' def='Save' plain=1}" type="submit" name="submitOne" value="ins"  class="r imgBtn">
							<img src="/ui/css/ico/16x16/save.png"/>
						</button>
					{/if}
				</div>

			</form>
		{/if}
	{/if}
{/block}

{block "css"}
	<link rel="stylesheet" type="text/css" href="/admin/ui?t=css&n=cat_content_one"/>
{/block}


{block "js"}
	{if $img}
		<script	type="text/javascript" src="/admin/ui?t=js&n=img_browse"></script>
	{/if}
	{if $ck}
		<script	type="text/javascript">
			var ckConfig = [];
		</script>
		<script	type="text/javascript" src="/ui/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="/ui/js/ckeditor/adapters/jquery.js"></script>
		{if isset( $kcf, $item->defTab )}
			{createUplDir( $item->defTab )}
			<script	type="text/javascript" src="/admin/ui?t=js&n=kcf_init"></script>
			<script	type="text/javascript">
				setKcf('{$item->defTab}');
			</script>
		{/if}
		<script	type="text/javascript" src="/admin/ui?t=js&n=ck_init"></script>
	{/if}
{/block}