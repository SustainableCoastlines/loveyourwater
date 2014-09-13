<div class="columns-wrapper">
	<div class="left-column">
    	<% if Content %>
            <div class="intro-text">
            	$Content
            </div><!--.intro-text ends-->
        <% end_if %>
        <div class="learn-downloads">
                <% include LearnDownloads %>
           <div class="clear"></div>
       </div><!--learn-downloads ends-->
    </div><!--.left-column ends-->
    <div class="right-column">
    	<% if YoutubeLinks %>
			<% control YoutubeLinks %>
                <div class="youtube-embed white-box">
                	<h4>$YoutubeTitle</h4>
                    <iframe width="380" height="214" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
                    <p>$YoutubeDescription.Summary(150)</p>
                    <div class="clear"></div>
                </div>
            <% end_control %>
        <% end_if %>
    </div>
    <div class="clear"></div>
</div><!--.columns-wrapper ends-->






