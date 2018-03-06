{block name="content"}
	{if isset( $cat )}
		<form method="post">
			<input type="hidden" name="id" value="{$cat->id}" />

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="title" def="title" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input id="title" name="title" type="text" value="{$cat->title}" />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>


			{*if $cat->level > 1 }
			<div class="inputItemBlock">
			<div class="inputItemL">
			{i18n key="dir" def="Adress" plain=1}
			</div>
			<div class=" inputItemR">
			<div class="inputItemBoxContent">
			<input id="dir" name="dir" type="text" value="{$cat->dir}" />
			</div>
			</div>
			<div class=" clear" ></div>
			</div>
			{/if*}

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="status" def="Status" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="status" name="status" >
							<option value=""></option>
							<option value="active" {if $cat->status == 'active'}selected="selected"{/if} >Active</option>
							<option value="inactive" {if $cat->status == 'inactive'}selected="selected"{/if}>Inactive</option>
						</select> 
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="in_mod" def="Input module" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="in" name="in" >
							<option value=""></option>
							{foreach $inMods as $inMod}
								<option value="{$inMod->id}" {if $cat->in == $inMod->id}selected="selected"{/if} >{$inMod->name}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="out_mod" def="Output module" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="out" name="out" >
							<option value=""></option>
							{foreach $outMods as $outMod}
								<option value="{$outMod->id}" {if $cat->out == $outMod->id}selected="selected"{/if} >{$outMod->name}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="layout_templ" def="Layout template" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="layout_id" name="layout_id" >
							<option value=""></option>
							{foreach $layouts as $layout}
								<option value="{$layout->id}" {if $layout->id == $cat->layout_id}selected="selected"{/if}>{$layout->name}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="def_cat_for_lang" def="Language's default category" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input id="is_def" name="is_def" type="checkbox" {if $cat->is_def}checked="checked"{/if} />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<!-- enter workaround -->
						<button  type="submit" name="submCat" value="upd" style="display:none;" >

							<button  title="{i18n key='delete' def='Delete' plain=1}" type="submit" name="submCat" value="del" class="imgBtn del"  data-msg="{i18n key="do_you_want_del" def="Do you really want to delete?" plain=1}" >
								<img src="/ui/css/ico/16x16/delete.png"/>
							</button>
							<button  title="{i18n key='up' def='Up' plain=1}" type="submit" name="submCat"value="up" class="imgBtn" >
								<img src="/ui/css/ico/16x16/up.png"/>
							</button>
							<button title="{i18n key='down' def='Down' plain=1}" type="submit" name="submCat" value="down" class="imgBtn" >
								<img src="/ui/css/ico/16x16/down.png"/>
							</button>
							<button  title="{i18n key='add' def='Add' plain=1}" type="submit" name="add" value="1" class="imgBtn" >
								<img src="/ui/css/ico/16x16/add.png"/>
							</button> 
							<button  title="{i18n key='preview' def='Preview' plain=1}" type="submit" name="submCat" value="preview" class="imgBtn" >
								<img src="/ui/css/ico/16x16/zoom.png"/>
							</button>
							<button  title="{i18n key='save' def='Save' plain=1}" type="submit" name="submCat" value="upd" class="imgBtn" >
								<img src="/ui/css/ico/16x16/save.png"/>
							</button>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>
		</form>
	{else}
		<form method="post">
			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="title" def="title" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input id="title" name="title" type="text"/>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			{*
			<div class="inputItemBlock">
			<div class="inputItemL">
			{i18n key="dir" def="Adress" plain=1}
			</div>
			<div class=" inputItemR">
			<div class="inputItemBoxContent">
			<input id="dir" name="dir" type="text" />
			</div>
			</div>
			<div class=" clear" ></div>
			</div>
			*}

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="status" def="Status" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="status" name="status" >
							<option value=""></option>
							<option value="active">Active</option>
							<option value="active">Inactive</option>
						</select> 
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="in_mod" def="Input module" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="in" name="in" >
							<option value=""></option>
							{foreach $inMods as $inMod}
								<option value="{$inMod->id}" >{$inMod->name}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="out_mod" def="Output module" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="out" name="out" >
							<option value=""></option>
							{foreach $outMods as $outMod}
								<option value="{$outMod->id}" >{$outMod->name}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="layout_templ" def="Layout template" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select id="layout_id" name="layout_id" >
							<option value=""></option>
							{foreach $layouts as $layout}
								<option value="{$layout->id}">{$layout->name}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="def_cat_for_lang" def="Language's default category" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input id="is_def" name="is_def" type="checkbox"  />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<button title="{i18n key='save' def='Save' plain=1}" type="submit" name="submCat" value="ins" class="imgBtn" >
							<img src="/ui/css/ico/16x16/save.png"/>
						</button> 
					</div>
				</div>
				<div class=" clear" ></div>
			</div>
		</form>
	{/if}
{/block}
{block "js"}
	{if isset( $previewUrl ) }
		<script>
			$(function () {
				window.open('{$previewUrl}', '_blank');
			});
		</script>
	{/if}
{/block}