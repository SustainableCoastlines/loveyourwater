<div class="home">
    <div class="col-wrap">
        <!-- left col -->        
        <div class="col-4 no-margin">
        <!-- intro text -->
        <div class="col-1 margin-right">
            <div class="home-intro">
                $Content
            </div>
        </div>
        <!-- filterform -->
        <div class="col-1 margin-right">
            <div class="event-filter-form white-box">
                $EventFilterForm
            </div>
        </div>
        <!-- events results -->
            <div class="col-4 no-margin">
            <% if Events %>
		<% control Events %>
                    <div class="event-item margin-right">
                        <div class="home-feature event white-box">
                            <div class="image">
                                <% if EventMainImage %>
                                   <a href="$Link"><% control EventMainImage %>$CroppedImage(220,145)<% end_control %></a>
                                <% else %>
                                    <a href="$Link"><% control EventCommunityBadge %>$CroppedImage(220,145)<% end_control %></a>
                                <% end_if %>
                            </div>
                             <div class="event-info">
                                <% if FromDate %>
                                    <div class="event-date">
                                        <p class="day">$FromDate.Format(d)</p>
                                        <p class="month">$FromDate.Format(M) <span>$FromDate.Format(y)<span></p>
                            		</div>
                                    <% else_if Date %>
                                        <div class="event-date">
                                            <p class="day">$Date.Format(d)</p>
                                            <p class="month">$Date.Format(M) <span>$Date.Format(y)<span></p>
                                        </div>
                                    <% else %>
                                      <div class="event-date">
                                        <p class="day">NA</p>
                                        <p class="month">no date</p>
                            		</div>
                                <% end_if %>
                                <div class="event-details">
                                    <a href="$Link"><h2>$Title</h2></a>
                                    <% if Organisation %><span>$Organisation</span><% end_if %>
                                    <div class="clear"></div>
                                </div>
                            </div>   
                        </div>
                    </div>    
                <% end_control %>
		<% else %>
            	<div id="PageNumbers"><span class="title">Sorry no upcoming results, <a href="$SiteConfig.CreateLink">create one here</a></span></div>		
            <% end_if %>
            </div>
        </div><!-- end .col-4 -->
        <!-- right col -->      
        <div class="col-2 no-margin">
            <!-- google map -->
            <div class="google-map white-box">
                $googleMapEventsLarge
            </div>
            <!-- past events -->
            <div class="past-events white-box">
               <h4>Past events</h4>
               <div class="recent">
               		<% control RecentEvents %>
               		<div class="recent-event-item">
                        <div class="image">
                            <% if EventMainImage %>
                               <a href="$Link"><% control EventMainImage %>$CroppedImage(65,65)<% end_control %></a>
                            <% else %>
                                <a href="$Link"><% control EventCommunityBadge %>$CroppedImage(65,65)<% end_control %></a>
                            <% end_if %>
                        </div>
                        <div class="recent-event-info">
                        	<a href="$Link"><h2>$Title</h2></a>
                            <% if Organisation %><span>$Organisation</span><% end_if %>
                            <% if FromDate %>
                            	<p>$FromDate.Nice</p>                             
                                <% else_if Date %>
                                     <p>$Date.Nice</p>       
                                <% else %>
                                    <p>NA</p> 
                            <% end_if %>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <% end_control %>
                    <a href="{$URLSegment}?recent=100" class="see-more">See more recent events</a>
               </div>
            </div>
        </div><!-- end .col-2 --> 
    </div><!-- end .col-wrap -->
</div><!-- end .home -->
<div class="clear"></div>