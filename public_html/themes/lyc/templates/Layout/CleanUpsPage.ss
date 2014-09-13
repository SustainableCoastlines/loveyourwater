<div class="columns">
    <div class="left-column">
        <a href="create" class="create-event-icon">$CreateEventIcon</a>
        <h1>$Title</h1>
        <% if TopEvents(4) %>
        <ul id="top-events-list">
            <% control TopEvents %>
            <li class="top-events<% if isEol %>-eol<% end_if %>">
                <a href="{$Link}" class="events-list-title">
                    <div class="small_thumb">
                        <% if EventMainImage %>
                        <% control EventMainImage %>$CroppedImage(50,50)<% end_control %>
                        <% else %>
                        <% control EventCommunityBadge %>$CroppedImage(50,50)<% end_control %>
                        <% end_if %>
                    </div>
                    <span class="{$colorRotator}" <% if isLongTitle %> style="margin-top:4px;" <% else %> style="margin-top:16px;"<% end_if %>>$Title</span>

                </a>

                <div class="clear"></div>                
                <p class="top-events-subtitle">$Subtitle<br/>$Date.Format(l) $Date.Format(j) $Date.Format(F), $Date.Format(Y)</p>
                <% if Description %><p class="top-events-description">$Description.Summary(40) <a href="$Link" title="See event">more</a></p><% end_if %>
                <div class="little-nav">
                    <a href="$FacebookLink" title="View event on Facebook" target="_blank">Event on Facebook</a> ·
                    <a href="#SendForm" id="$ID" class="contact contact-organiser">Email Event Coordinator</a>
                </div>
                <div class="clear">
                    <!-- SPACE -->
                </div>

            </li>
            <% if last %> <div class="clear"></div><% end_if %>
            <% end_control %>
        </ul>
        <div class="clear"></div>
        <% end_if %>
        <div class="columns-nested">
            <div class="left-column">
                <a href="events/past" title="See all pastevents" class="events-list-title2"><span class="ORANGE">PAST EVENTS</span></a>
                <ul id="top-events-list">
                    <% control PastEvents(2) %>
                    <li class="past-events">
                        <a href="{$Link}">
                            <span></span>
                            <div class="small_thumb">
                                <% if EventMainImage %>
                                <% control EventMainImage %>$CroppedImage(50,50)<% end_control %>
                                <% else %>
                                <% if hasRelatedFlickr %>
                                <img src="mysite/utils/cropResize.php?src={$getEventPhotoURLThumb}&width=50&height=50" />
                                <% else %>
                                <% control EventCommunityBadge %>$CroppedImage(50,50)<% end_control %>
                                <% end_if %>
                                <% end_if %>
                            </div>
                        </a>
                        <p><b>$Title</b><br/>
                            $Date.Format(l) $Date.Format(j) $Date.Format(F), $Date.Format(Y). <br/>
                            <a href="$Link" title="See event">See event</a>
                        </p>


                        <div class="clear">
                            <!-- SPACE -->
                        </div>

                    </li>
                    <% end_control %>
                </ul>
                <div class="little-nav">
                    <a href="events/past" title="See all past events">See all past events</a>
                </div>
            </div>
            <div class="right-column">
                <% if CommunityEvents(1) %>
                <a href="events/community" title="See all community events" class="events-list-title2""><span class="DARK_BLUE">COMMUNITY EVENTS</span></a>
                <ul id="top-events-list">

                    <% control CommunityEvents(2) %>
                    <li class="community-events">
                        <a href="{$Link}">
                            <span></span>
                            <div class="small_thumb">
                                <% if EventMainImage %>
                                <% control EventMainImage %>$CroppedImage(50,50)<% end_control %>
                                <% else %>
                                <% if hasRelatedFlickr %>
                                <img src="mysite/utils/cropResize.php?src={$getEventPhotoURLThumb}&width=50&height=50" />
                                <% else %>
                                <% control EventCommunityBadge %>$CroppedImage(50,50)<% end_control %>
                                <% end_if %>
                                <% end_if %>
                            </div>
                        </a>
                        <p><b>$Title</b><br/>
                            $Date.Format(l) $Date.Format(j) $Date.Format(F), $Date.Format(Y). <br/>
                            <a href="$Link" title="See event">See event</a>    
                        </p>

                        <div class="clear">
                            <!-- SPACE -->
                        </div>

                    </li>
                    <% end_control %>
                </ul>
                <div class="little-nav">
                    <a href="events/community" title="See all community events">See all community events</a>
                </div>
                <% end_if %>
            </div>
        </div>
    </div>

    <div class="right-column">
        <% include facebook_like_box %>
        <div id="right-box-d-container">
            <div id="right-box-d-frame-top"><span>&nbsp;</span></div>
            <div id="right-box-d-frame-middle">
                <div id="right-box-d-content">
                    $googleMapTopEvents
                </div>
            </div>
            <div id="right-box-d-frame-bottom"><span>&nbsp;</span></div>
        </div>
        <span>&nbsp;</span>

        <% include action_box %>
    </div>

</div>

<!-- Needs to be here doesn't load in until instantiated -->
<div style="display: none;">
    <div id="SendForm">
        $SendForm
    </div>
</div>