<div class="stBlock">
	{*
	<div class="catBlockTitle">
	<h3>{i18n key="cats" def="Categories"}</h3>
	</div>
	*}
	{if isset( $root) }
		{include file="../out/child.tpl" item=$root class="stRootUl"}
		<div class="clear"></div>
	{/if}
</div>