<article class="Layout Page">
	<div class="columns-wrapper">
		<div class="col-1 no-margin">
			<% if Form %>
				<div class="intro-text">
					<p>$SiteConfig.MemberDefaultMessage
				</div><!--.intro-text ends-->
				  <% else %>
				<div class="intro-text">
					$Content
				</div><!--.intro-text ends-->
			<% end_if %>
			<div class="learn-downloads">
					<% include LearnDownloads %>
			   <div class="clear"></div>
		   </div><!--learn-downloads ends-->
		</div>
	 <% if Form %>
		<div class="data-content no-top-margin">
			<% if YoutubeLinks %>
				<% control YoutubeLinks %>
					<div class="youtube-embed white-box">
						<h4>$YoutubeTitle</h4>
						<iframe width="380" height="214" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
						<p>$YoutubeDescription.Summary(15)</p>
						<div class="clear"></div>
					</div>
				<% end_control %>
			<% end_if %>
		  <% if Form %>
			  <div class="form-box">
					<div class="form-header">
						 <h1> $SiteConfig.MemberFormTitle </h1>
						 <div class="clear"></div>
					</div><!--form-header ends-->
						 $Form
			  </div><!--form-box ends-->
		  <% end_if %>
		</div><!--data-content ends-->
	 <% else %>
	 <div class="data-content">
			<% if YoutubeLinks %>
				<% control YoutubeLinks %>
					<div class="youtube-embed white-box">
						<h4>$YoutubeTitle</h4>
						<iframe width="380" height="214" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
						<p>$YoutubeDescription.Summary(15)</p>
						<div class="clear"></div>
					</div>
				<% end_control %>
			<% end_if %>
		</div><!--data-content ends-->
	 <% end_if %>
	<div class="clear"></div>
	</div><!--.columns-wrapper ends-->
</article>
 