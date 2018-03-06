{block "title"}
	{if !isset($item )}
		{i18n key="new_lang" def="New lang" plain=1}
	{/if}
{/block}
{block "content"}
	<form method="post">
		{if isset($item )}
			<input type="hidden" name="id" value="{$item->id}" />

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="name" def="Name" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" name="title"  value="{$item->title}"/>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="lang_three_char" def="3 char code"  plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" name="three_char" value="{$item->three_char}"/>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="two_char" def="2 char code" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" name="two_char"  value="{$item->two_char}"/>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					<label for="name">{i18n key="img" def="Image" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="def_lang" def="Default language" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input id="is_def" name="is_def" type="checkbox" {if $item->is_def}checked="checked"{/if} />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="status" def="Status" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select name="status" >
							<option value=""></option>
							<option value="active" {if $item->status == "active"}selected="selected"{/if}>{i18n key="active" def="Active" plain=1}</option>
							<option value="inactive" {if $item->status == "inactive"}selected="selected"{/if}>{i18n key="inactive" def="Inactive" plain=1}</option>
							<option value="hide" {if $item->status == "hide"}selected="selected"{/if}>{i18n key="hide" def="Hide" plain=1}</option>
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<!-- workaround for enter -->
						<button type="submit" name="submitLang" value="upd" style="display:none;">

							<button  title="{i18n key='up' def='Up' plain=1}" type="submit" name="submitLang"value="up" class="imgBtn" >
								<img src="/ui/css/ico/16x16/up.png"/>
							</button>
							<button title="{i18n key='down' def='Down' plain=1}" type="submit" name="submitLang" value="down" class="imgBtn" >
								<img src="/ui/css/ico/16x16/down.png"/>
							</button>
							<button title="{i18n key="delete" def="Delete" plain=1}" class="imgBtn del" type="submit" name="submitLang" value="del"  data-msg="{i18n key="do_you_want_del" def="Do you really want to delete?" plain=1}" >
								<img src="/ui/css/ico/16x16/delete.png">
							</button>
							<button title="{i18n key="save" def="Save" plain=1}" class="imgBtn" type="submit" name="submitLang" value="upd" >
								<img src="/ui/css/ico/16x16/save.png">
							</button>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

		{else}

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="name" def="Name" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" name="title"  />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="lang_three_char" def="3 char code"  plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" name="three_char" />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="two_char" def="2 char code" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" name="two_char" />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					<label for="name">{i18n key="img" def="Image" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input type="text" />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="def_lang" def="Default language" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input id="is_def" name="is_def" type="checkbox" />
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
					{i18n key="status" def="Status" plain=1}
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<select name="status" >
							<option value=""></option>
							<option value="active">{i18n key="active" def="Active" plain=1}</option>
							<option value="inactive">{i18n key="inactive" def="Inactive" plain=1}</option>
							<option value="dont_show_in_menu">{i18n key="do_not_show_in_menu" def="Do not show in menu" plain=1}</option>
						</select>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL">
				</div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<button title="{i18n key="save" def="Save" plain=1}" class="imgBtn" type="submit" name="submitLang" value="ins" >
							<img src="/ui/css/ico/16x16/save.png">
						</button>
					</div>
				</div>
				<div class=" clear" ></div>
			</div>

		{/if}

	</form>
{/block}