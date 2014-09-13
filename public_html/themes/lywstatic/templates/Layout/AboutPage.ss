<article class="Layout AboutPage">
	<section class="Social">
		<div id="page-share">
			<% if InSection(my-events) %>
			<% else %>
			<% include FacebookLikeContent %>
			<% include TweetPage %>
			<% include GooglePlusOne %>
			<% end_if %>
			<div id="google_translate_element"></div>
		</div>
	</section>
	<section class="SecondaryBlock">
			<% if Content %>
				<div class="intro-text">
					$Content
				</div><!--.intro-text ends-->
			<% end_if %>
			<div class="about-google-map white-box">
				<% if MapTitle %>
					<h4>$MapTitle</h4>
				<% end_if %>
				<div class="map-wrap">
					$AboutMap
				</div>
				<% if MapDescription %>
					<div class="map-description">
						<p>$MapDescription.Summary(350)</p>
					</div>
				<% end_if %>
			</div><!--about-google-map ends-->
			<div class="clear"></div>
			<div class="organisations"><!--.organisations-->
				<% if Organisations %>
					<% control Organisations %>
						<div class="organisation"><!--organisation-->
							<h4>$Name.LimitWordCount(6)</h4>
							<div class="organisation-img" ><!--organisation-img-->
								<% if OrganisationImage %>
								<a class="link-to-site"  target="_blank" href="$OrganisationLinkHTTP"><img src="$OrganisationImage.OrganisationImageThumbnail.URL" /><% else %><img src="$ThemeDir/img/organisation-img-holder.jpg" /><% end_if %></a>
							</div><!--.organisation-img ends-->
							<div class="clear"></div>
							<div class="organisation-details">
								<% if Country %>
									<p class="organisation-country">$Country</p>
								<% end_if %>
								<% if OrganisationLinkHTTP %>
									<a class="link-to-site"  target="_blank" href="$OrganisationLinkHTTP">Go to site</a>
								<% end_if %>
							</div>
							<div class="clear"></div>
						</div><!--.organisation ends-->
					<% end_control %>
				<% end_if %>
				<div class="clear"></div>
			</div><!--organisations ends-->
	</section>
	<section class="PrimaryBlock">
			<% if YoutubeLinks %>
				<div class="right-column">
					<% control YoutubeLinks %>
						<div class="youtube-embed white-box">
							<h4>$YoutubeTitle</h4>
							<div class="FitVidWrapper">
								<iframe width="380" height="214" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
							</div>
							<p>$YoutubeDescription.Summary(150)</p>
						</div>
					<% end_control %>
				</div>
			<% end_if %>
			<div class="white-box">
				<% include faq_box %>
			</div>
	</section>
</article>