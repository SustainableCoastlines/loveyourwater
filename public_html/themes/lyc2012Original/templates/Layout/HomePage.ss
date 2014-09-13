<div class="home">
    <div class="col-wrap">
    	<div class="col-4 no-margin">
            <div class="col-1 no-margin">
                <div class="home-intro">
                    $Content
                </div>
            </div>
            <div class="col-1 ">
                <div class="event-filter-form white-box">
                    $EventFilterForm
                </div>
            </div>
          <div class="clear"></div>
          <div class="col-1 no-margin">
          <div class="white-box">
                    <div class="create">
                        <div class="image">
							<% if FeatureImage %>
                                <% if FeatureLink %>
                                    {$FeatureLink}$FeatureImage.CroppedImage(220,145)</a>
                                <% else %>
                                    $FeatureImage.CroppedImage(220,145)
                                <% end_if %>
                            <% end_if %>
                        </div>
                        <div class="create-info">
                                <div class="create-icon">
                                     <% if FeatureLink %>{$FeatureLink}<% end_if %><img src="$ThemeDir/img/fileicons/create_{$FileType}.{$FileType}" /><% if FeatureLink %></a><% end_if %>
                                </div>
                                <h2><% if FeatureLink %>{$FeatureLink}<% end_if %>$FeatureTitle<% if FeatureLink %></a><% end_if %></h2>
                            <div class="clear"></div>
                        </div>  
                    </div>
                </div>
           </div> 
            <div class="col-1">
                <% control UpcomingEvent %>
                <div class="upcoming-event white-box">
                    <div class="home-feature event">
                        <div class="image">
                            <% if EventMainImage %>
                               <a href="$Link"><% control EventMainImage %>$CroppedImage(220,145)<% end_control %></a>
                            <% else %>
                                <a href="$Link"><% control EventCommunityBadge %>$CroppedImage(220,145)<% end_control %></a>
                            <% end_if %>
                        </div>	
                        <div class="event-info">
                            <div class="event-date">
                                <p class="day">$FromDate.Format(d)</p>
                                <p class="month">$FromDate.Format(M) <span>$FromDate.Format(y)<span></p>
                            </div>
                            <div class="event-details">
                                <a href="$Link"><h2>$Title</h2></a>
                                <% if Organisation %><span>$Organisation</span><% end_if %>
                                <div class="clear"></div>
                            </div>
                        </div>   
                    </div>
                    <div class="clear"></div>
                </div>
                <% end_control %>
            </div>
        </div><!-- end col-4 -->
        <div class="col-2 no-margin">
            <% if YoutubeLinks %>
                <% control YoutubeLinks %>
                    <div class="youtube-embed white-box">
                        <!--<h4>$YoutubeTitle</h4>-->
                        <iframe width="380" height="235" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
                       <!-- <p>$YoutubeDescription.Summary(15)</p>-->
                        <div class="clear"></div>
                    </div>
                <% end_control %>
            <% end_if %>
            <div class="google-map white-box">
                $googleMapUpcomingEvents
            </div>
        </div>
        
    </div><!-- col-wrap ends -->
</div><!-- home ends -->
<div class="clear"></div>