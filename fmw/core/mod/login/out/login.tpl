{block 'content'}
	<form method="post">
		<div class="inputWrap">
			{if isset( $errors )}
				<div class="errorList">
					{foreach $errors as $error}
						<div class="errorItem">
							{if $error == "empty"}
								<span>Empty!</span>
							{elseif $error == "wrong_email" || $error == "wrong_pw"}
								<span>Wrong!</span>
							{/if}
						</div>
					{/foreach}
				</div>
				{if isset( $triesLeft )}
					<div class="triesLeft">
						<span>{$triesLeft} tries left.</span>
					</div>
				{/if}
			{/if}

			<div class="inputItemBlock">
				<div class="inputItemL"><img src="/ui/css/ico/24x24/email.png" title="Email" alt="Email" /></div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input title="Email" name="email" type="text" {if isset( $smarty.post.email )}value="{$smarty.post.email}"{/if} />
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div class="inputItemBlock">
				<div class="inputItemL"><img src="/ui/css/ico/24x24/pw.png" title="Password" alt="Password"/></div>
				<div class=" inputItemR">
					<div class="inputItemBoxContent">
						<input name="pw" type="password" title="Password" />
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>

		<div class="inputItemBlock">
			<div class="inputItemL"></div>
			<div class=" inputItemR">
				<div class="inputItemBoxContent">
					<button type="submit" name="loginIn" class="imgBtn" title="Login" alt="Login">
						<img src="/ui/css/ico/24x24/check.png" alt="Login" />
					</button>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</form>
	<div class="footerBlock">
		{ins_mod name="footer_fmw_info" type="core"}
	</div>
{/block}

{block "css"}
	<style>
		form{
			width: 370px;
			height: 120px;
			position: fixed;
			top: 10%;
			left: 40%;

		}
		.inputWrap{
			width: 310px;
			height: 80px;
		}
		.inputItemBlock{
			padding: 5px;
			margin: auto;
		}
		.inputItemL{
			float: left;
		}
		.inputItemR{
			float: right;
		}
		input{
			font-family: Arial,Helvetica,sans-serif;
			font-size: 18px;
			line-height: 18px;
			padding: 4px;
			height: 20px;
			width: 250px;
		}
		.imgBtn{
			width: 50px;
		}
		.footerBlock{
			position: absolute;
			right:30px;
			bottom:20px;
		}
	</style>
{/block}