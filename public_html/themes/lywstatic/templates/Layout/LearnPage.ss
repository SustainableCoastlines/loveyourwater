<article class="Layout LearnPage">
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
		<div class="left-column">
			<% if Content %>
				<div class="intro-text">
					$Content
				</div><!--.intro-text ends-->
			<% end_if %>
			<div class="learn-downloads">
					<% include LearnDownloads %>
		   </div><!--learn-downloads ends-->
		</div><!--.left-column ends-->
	</section>
	<section class="PrimaryBlock">
		<div class="right-column">
			<% if YoutubeLinks %>
				<% control YoutubeLinks %>
					<div class="youtube-embed white-box">
						<h4>$YoutubeTitle</h4>
						<div class="FitVidWrapper">
							<iframe width="450" height="314" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
						</div>
						<p>$YoutubeDescription.Summary(150)</p>
						<div class="clear"></div>
					</div>
				<% end_control %>
			<% end_if %>
		</div>
	</section>
	</div><!--.columns-wrapper ends-->
</article>