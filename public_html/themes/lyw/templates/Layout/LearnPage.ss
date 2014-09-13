<article class="Layout LearnPage">
	<% include SocialSection %>
	<section class="TopBlock">
		<div class="LeftPart">
			$Content
		</div>
		<div class="RightPart">
			<div class="RightWrapper">
				<div class="VideoRow">
					<div class="FitVidWrapper">
						<% if YoutubeLinkHTTP %>
							<iframe width="450" height="250" src="http://www.youtube.com/embed/$getLearnPageYoutubeID" frameborder="0" allowfullscreen></iframe>
						<% else %>
							<iframe width="450" height="250" src="http://www.youtube.com/embed/7yGq2ba3NhQ" frameborder="0" allowfullscreen></iframe>
						<% end_if %>
					</div>
				</div>
				<div class="MessageRow">
					$VideoDescription
				</div>
				<div class="ActionRow">
					<img src="$ThemeDir/img/presenter_small_logo.png">
					<div class="ActionText">
						Arrange a Love your Coast presentation
					</div>
					<div class="btn learnpage">
						<a class="form-btn" href="my-events/">Find a presenter</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="SecondaryBlock">
		<div class="left-column">
			<div class="learn-downloads">
				<div class="ColumnHeader">
					Useful documents
				</div>
				<% include LearnDownloads %>
		   </div><!--learn-downloads ends-->
		</div><!--.left-column ends-->
	</section>
	<section class="PrimaryBlock">
		<div class="right-column">
			<div class="ColumnHeader">
				Useful videos
			</div>
			<% if YoutubeLinks %>
				<% control YoutubeLinks %>
					<div class="youtube-embed white-box">
						<div class="FitVidWrapper">
							<iframe width="450" height="260" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
						</div>
						<div class="item-title">
							<h4>$YoutubeTitle</h4>
						</div>
						<p>$YoutubeDescription.Summary(15)</p>
					</div>
				<% end_control %>
			<% end_if %>
		</div>
	</section>
	</div><!--.columns-wrapper ends-->
</article>