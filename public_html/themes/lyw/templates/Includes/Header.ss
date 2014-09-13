<header id="MainHeader">
	<div id="header">
		<div id="header-top">
			<div class="MobileLogo">
				<a href="$BaseHref" id="lyc" class="lyc-logo" name="top">
					<img src="{$ThemeDir}/img/lyclogo.png">
				</a>
			</div>
			<button id="TouchMenu">Menu</button>
			<div class="MobileMenu">
				<nav class="MenuList">
					<ul>
						<li class="MenuItem<% if inSection(learn) %> current<% end_if %>"><a href="$SiteConfig.LearnLink">Learn</a></li>
						<li class="MenuItem<% if inSection(Events) %> current<% end_if %>"><a href="$SiteConfig.FindLink">Find</a></li>
						<li class="MenuItem<% if inSection(create) %> current<% end_if %>"><a href="$SiteConfig.CreateLink">Create</a></li>
						<li class="MenuItem<% if inSection(share) %> current<% end_if %>"><a href="$SiteConfig.ShareLink">Share</a></li>
						<li class="MenuItem<% if inSection(about) %> current<% end_if %>"><a href="about/">About Us</a></li>
						<li class="MenuItem<% if inSection(contact) %> current<% end_if %>"><a href="contact-us/">Contact Us</a></li>
						<li class="MenuItem<% if inSection(about) %> current<% end_if %>"><a href="my-events/">Login or Sign-up</a></li>
					</ul>
				</nav>
			</div>
			<div class="header-top-inner">
				<!--< % include TwitterFollowAll % >-->
				<div class="twitter-follow">
				<a href="https://twitter.com/Love_your_Coast" class="twitter-follow-button" data-show-count="false" data-show-screen-name="false">Follow @Love_your_Coast</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
				</div>
				<% include FacebookLikeAll %>
				<% include TallyCharts %>
			</div>
		</div>
		<div id="header-main">
			<div class="header-main-inner">
				<div class="Gapper">
					<a href="$BaseHref" id="lyc" class="lyc-logo" name="top">
						<img src="{$ThemeDir}/img/lyclogo.png">
					</a>
				</div>
				<ul id="top-nav">
					<% if inSection(learn) %><li class="current"><% else %><li><% end_if %><a href="$SiteConfig.LearnLink"><div>Learn</div><div class="description">about the issue</div></a></li>
					<% if inSection(Events) %><li class="current"><% else %><li><% end_if %><a href="$SiteConfig.FindLink"><div>Find</div><div class="description">a clean-up event</div></a></li>
					<% if inSection(create) %><li class="current"><% else %><li><% end_if %><a href="$SiteConfig.CreateLink"><div>Create</div><div class="description">your own event</div></a></li>
					<% if inSection(share) %><li class="current last"><% else %><li class="last"><% end_if %><a href="$SiteConfig.ShareLink"><div>Share</div><div class="description">your results</div></a></li>
				</ul>
				<ul id="admin-nav">
					<% if CurrentMember %>
						<li class="ProfileImage">
							<% control CurrentMember %>
								<div class="ProfilePhoto" <% if ProfileImage %>style="background-image: url('{$ProfileImage.CroppedImage(62, 62).URL}');"<% end_if %>>
									ProfilePic
								</div>
							<% end_control %>
						</li>
					<% end_if %>
					<% if CurrentMember %>
					<% else %>
						<li><a href="my-events/">Login or Sign-up</a></li>
					<% end_if %>
					<% if CurrentMember %>
						<li class="ProfileName">
							$CurrentMember.FirstName $CurrentMember.Surname
						</li>
					<% end_if %>
				</ul>
			</div>
		</div>
	</div>
	<% include ProfileStats %>
</header>