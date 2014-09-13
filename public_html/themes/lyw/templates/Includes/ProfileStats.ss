<section class="UserStatsSection">
	<div class="ProfileStats">
		<div class="InnerContent">
			<div class="Group01">
				<div class="Presentations">
					<div class="total">8</div>
					<span>Presentations</span>
				</div>
				<div class="Attendees">
					<div class="total">1,500</div>
					<span>Attendees</span>
				</div>
			</div>
			<div class="Group02">
				<div class="Created">
					<div class="total">12</div>
					<span>Events created</span>
				</div>
				<div class="Participants">
					<div class="total">1,300</div>
					<span>Event participants</span>
				</div>
				<div class="Rubish">
					<div class="total">1,500</div>
					<span>Event participants</span>
				</div>
			</div>
			<div class="Group03">
				<div class="Joined">
					<div class="total">8</div>
					<span>Events joined</span>
				</div>
				<div class="ProfileThumb">
					<% control CurrentMember %>
						<% if ProfileImage %>
							$ProfileImage.SetWidth(119)
						<% else %>
							<img src="{$ThemeDir}/img/profile-thumb.png">
						<% end_if %>
					<% end_control %>
				</div>
			</div>
		</div>
	</div>

	<div class="UserMenu">
		<div class="InnerContent">
			<div class="LeftSide">
				<div class="PresenterLogo"><img src="{$ThemeDir}/images/presenter-logo.png"></div>
				<div class="PresenterDescription"><p>Trained presenter since 14 May 2014</p></div>
			</div>
			<div class="RightSide">
				<ul>
					<li><a href="$SiteConfig.MyEventsLink" class="C_groupsMenuItem">$SiteConfig.MyEventsTitle</a></li>
					<li><a href="$SiteConfig.MyResultsLink" class="C_groupsMenuItem">$SiteConfig.MyResultsTitle</a></li>
					<li><a href="$SiteConfig.MyAccountLink" class="C_groupsMenuItem">$SiteConfig.MyAccountTitle</a></li>
					<li><a href="Security/logout/" class="C_groupsMenuItem">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
</section>