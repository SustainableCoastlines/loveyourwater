<div class="home">
<div class="col-wrap">
    <div class="col-1 no-margin">
    	<div class="intro">
        	$Content
        </div>
    </div>
    </div>
  <div class="clear"></div>
 </div>
    <div class="col-2 no-margin">
		<% if YoutubeLinks %>
			<% control YoutubeLinks %>
                <div class="youtube-embed white-box">
                	<!--<h4>$YoutubeTitle</h4>-->
                    <iframe width="380" height="214" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
                   <!-- <p>$YoutubeDescription.Summary(15)</p>-->
                    <div class="clear"></div>
                </div>
            <% end_control %>
        <% end_if %>
        <div class="google-map white-box">
        	<% include faq_box %>
        </div>
    </div>
</div>
<div class="clear"></div>