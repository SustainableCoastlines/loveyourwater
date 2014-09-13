<!-- REQUIRE CSS -->
<% require themedCSS(social) %>

<% if SiteConfig.GooglePlusLink %><a href="$SiteConfig.GooglePlusLink" class="googleplus" target="_blank"><img src="social/social-packs/googleplus_{$SiteConfig.IconSetNo}.png" alt="googleplus" /></a><% end_if %>
<% if SiteConfig.PinterestLink %><a href="$SiteConfig.PinterestLink" class="pinterest" target="_blank"><img src="social/social-packs/pinterest_{$SiteConfig.IconSetNo}.png" alt="pinterest" /></a><% end_if %>
<% if SiteConfig.StumbleUponLink %><a href="$SiteConfig.StumbleUponLink" class="stumbleupon" target="_blank"><img src="social/social-packs/stumbleupon_{$SiteConfig.IconSetNo}.png" alt="stumbleupon" /></a><% end_if %>
<% if SiteConfig.DiggLink %><a href="$SiteConfig.DiggLink" class="digg" target="_blank"><img src="social/social-packs/digg_{$SiteConfig.IconSetNo}.png" alt="digg" /></a><% end_if %>
<% if SiteConfig.VimeoLink %><a href="$SiteConfig.VimeoLink" class="vimeo" target="_blank"><img src="social/social-packs/vimeo_{$SiteConfig.IconSetNo}.png" alt="vimeo" /></a><% end_if %>
<% if SiteConfig.YouTubeLink %><a href="$SiteConfig.YouTubeLink" class="youtube" target="_blank"><img src="social/social-packs/youtube_{$SiteConfig.IconSetNo}.png" alt="youtube" /></a><% end_if %>
<% if SiteConfig.LinkedInLink %><a href="$SiteConfig.LinkedInLink" class="linkedin" target="_blank"><img src="social/social-packs/linkedin_{$SiteConfig.IconSetNo}.png" alt="linkedin" /></a><% end_if %>
<% if SiteConfig.FlickrLink %><a href="$SiteConfig.FlickrLink" class="flickr" target="_blank"><img src="social/social-packs/flickr_{$SiteConfig.IconSetNo}.png" alt="flickr" /></a><% end_if %>

<!-- OPTION TO USE TWITTERS FOLLOW LINK -->

<% if SiteConfig.TwitterLink %>
	<% if SiteConfig.UseFollowAll %>
        <% include TwitterFollowAll %>
    <% else %>
        <a href="$SiteConfig.TwitterLink" class="twitter" target="_blank"><img src="social/social-packs/twitter_{$SiteConfig.IconSetNo}.png" alt="twitter" /></a>
    <% end_if %>
<% end_if %>

<!-- OPTION TO REPLACE WITH A FACEBOOK LIKE LINK -->

<% if SiteConfig.FacebookLink %>
	<% if SiteConfig.UseLikeAll %>
        <% include FacebookLikeAll %>
    <% else %>
        <a href="$SiteConfig.FacebookLink" class="facebook" target="_blank"><img src="social/social-packs/facebook_{$SiteConfig.IconSetNo}.png" alt="facebook" /></a>
    <% end_if %>
<% end_if %>
