
     	<!-- -------------------------------------------------------------------------------------------LOGGED OUT -->
                <% if Action = verification %>
					<!-- verify account form -->
					<div class="form-box">
						<div class="form-header">
							<h1>Verification</h1>
							<div class="clear"></div>
						</div><!--form-header ends-->
							 $ActivationMessage
							 $VerificationForm
					</div><!--form-box ends-->
		        <% else %>
                   
                    <% if ShowCreateAccountForm %>
						<section class="SecondaryBlock">
							<div class="col-wrap">
								<div class="col-1 no-margin">
									<div class="home-intro">
										<p>$SiteConfig.CreateAccountContent</p>
									</div>
								</div>
							</div>
							<!-- create account form -->
							<div class="account-links">
								<div class="btn">
								 <a class="form-btn" href="my-events/">Login here</a>
								</div>
							</div>
						</section>
						<section class="PrimaryBlock">
							<div class="form-box">
								<div class="form-header">
									<div class="Row HeaderText">
										<h1>Create new account</h1>
									</div>
									<div class="Row MessageBox">
										<% control page(my-events) %>
										$RegisterMessage
										<% end_control %>
									</div>
								</div><!--form-header ends-->
								$RegisterForm
							</div><!--form-box ends-->
							<div class="clear"></div>
						</section>
                    <% else %>
                        <!-- login form -->
                        <div class="col-wrap"> 
                            <div class="col-1 no-margin">
                                <div class="home-intro">
                                    <p>$SiteConfig.LoginContent</p>
                                </div>
                            </div>
                        </div>
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
                         <div class="clear"></div>
                    <% end_if %><!-- end if CreateAccountForm State -->
                <% end_if %><!--end if Action -->
     
     