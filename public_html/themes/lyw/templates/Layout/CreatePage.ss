<div class="col-wrap"> 

	<div class="col-1 no-margin">
			<div class="home-intro">
				$Content
			</div>
	</div>

	<div class="learn-downloads">
    	<div class="col-1 no-margin">
                <% include LearnDownloads %>
           <div class="clear"></div>
       </div><!--learn-downloads ends-->
	</div><!--col-1 no-margin ends-->

</div><!--col-wrap ends -->

<% if CurrentMember %>
	<!-- logged in member state -->
	<div class="form-box">
		<div class="form-header">
			$JoinMessage
			<div class="clear"></div>
		</div><!--form-header ends-->
		$CreateForm
	</div><!--form-box ends-->
<% else %>

	<!-- logged out member state -->
	<% if ShowCreateAccountForm %>
	<!-- create account form -->
	<div class="account-links">
		<div class="btn">
			<a class="form-btn" href="create/">Login here</a>
		</div>
	</div>
	<div class="form-box">
		<div class="form-header">
			<h1>Sign-up</h1>
			<% control page(my-events) %>
			$RegisterMessage
			<% end_control %>
			<div class="clear"></div>
		</div><!--form-header ends-->
		$RegisterForm
	</div><!--form-box ends-->
<% else %>
<!-- login form -->
<div class="account-links">
	<div class="btn">
		<a class="form-btn" href="$CreateAccountLink">Signup here</a>
	</div>
</div>
<div class="form-box">
	<div class="form-header">
		<h1>Login</h1>
		<% control page(my-events) %>
		$LoginMessage
		<% end_control %>
		<div class="clear"></div>
	</div><!--form-header ends-->
	$LoginForm
</div><!--form-box ends-->
	<% end_if %><!-- end if CreateAccountForm State -->

<% end_if %><!-- end if CurrentMember states -->

<div class="clear"></div>