<div id="header">
<div id="header-top">
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
<div class="header-logo">
	<a href="$BaseHref" id="lyc" class="lyc-logo" name="top">Love Your Coast</a>
</div>
<div id="header-main">
	<div class="header-main-inner">
        <ul id="top-nav">
            <% if inSection(learn) %><li class="current"><% else %><li><% end_if %><a href="$SiteConfig.LearnLink">Learn<br /><span>about the issue</span></a></li>
            <% if inSection(Events) %><li class="current"><% else %><li><% end_if %><a href="$SiteConfig.FindLink">Find<br /><span>a clean-up event</span></a></li>
            <% if inSection(create) %><li class="current"><% else %><li><% end_if %><a href="$SiteConfig.CreateLink">Create<br /><span>your own event</span></a></li>
            <% if inSection(share) %><li class="current last"><% else %><li class="last"><% end_if %><a href="$SiteConfig.ShareLink">Share<br /><span>your results</span></a></li>
        </ul>
        <ul id="admin-nav">
            <% if CurrentMember %>
            	<li><a href="Security/logout/">Logout</a></li> 
            	<li class="hasDropDown">
                	<a href="$SiteConfig.MyAccountLink">Account</a><div class="C_arrowTab"></div>
                    <div class="dropdown-nav" style="width:150px">
                        <ul id="C_accountMenu" class="myGroupsSection">
                            <li class="C_userNavItem"><a href="$SiteConfig.MyEventsLink" class="C_groupsMenuItem">$SiteConfig.MyEventsTitle</a></li>
                            <li class="C_userNavItem"><a href="$SiteConfig.MyResultsLink" class="C_groupsMenuItem">$SiteConfig.MyResultsTitle</a></li>
                            <li class="C_userNavItem"><a href="$SiteConfig.MyAccountLink" class="C_groupsMenuItem">$SiteConfig.MyAccountTitle</a></li>
                        </ul>
                    </div>
                </li>
            <% else %>
            	<li><a href="my-events/">Login or Sign-up</a></li>
            <% end_if %>
            <li><a href="contact-us/">Contact</a>&bull;</li> 
            <li><a href="about/">About</a>&bull;</li>
        </ul>
    </div>
</div>
</div>


