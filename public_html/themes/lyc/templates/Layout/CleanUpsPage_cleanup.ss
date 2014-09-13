<div id="event-page">
    <div class="columns">
        <div class="left-column">
            <% if CleanUpEvent %>
            <% control CleanUpEvent %>
            <div id="event-breadcrumb">
                <p>
                    <a href="events" title="Back to events">Events</a>&nbsp;»
                    <% if isPastEvent %>
                    <a href="events/past" title="Back to past events">Past Events</a>&nbsp;»
                    <% else %>
                    <% if TopEvent %><% else %>
                    <a href="events/community" title="Back to community events">Community Events</a>&nbsp;»
                    <% end_if %>
                    <% end_if %>
                    $Title
                </p>
            </div>
            <h2 class="RED">$Title</h2>
            <h2 class="ORANGE">
                <% if isPastEvent %>
                This is an archived event
                <% else %>
                $Date.Format(l) $Date.Format(j) $Date.Format(F), $Date.Format(Y)
                <% end_if %>
            </h2>

            <div id="left-photos-box">
                <div id="left-box-container">
                    <div id="left-box-frame-top"><span>&nbsp;</span></div>
                    <div id="left-box-frame-middle">
                        <div id="left-box-content">
                            <div class="columns-leftbox">
                                <div class="left-column">
                                    <% if EventMainImage %>
                                    <% control EventMainImage %>$PaddedImage(222,222)<% end_control %>
                                    <% else %>
                                    <% control EventCommunityBadge %>$PaddedImage(222,222)<% end_control %>
                                    <% end_if %>
                                    <% if CurrentMember %><% if CreatedByMe %>
                                    <div class="left-box-column-link"><a href="$UploadBadgeLink" title="Upload Event Badge">Upload a new event badge</a></div>
                                    <% end_if %><% end_if %>
                                </div>
                                <div class="right-column">
                                    <% if hasRelatedFlickr %>
                                    <% control getFlickrPhotos(100) %>
                                    <ul id="event-mini-gallery">
                                        <% control PhotoItems %>
                                        <li><img src="http://farm1.static.flickr.com/{$image_path}_s.jpg" alt="{$title}" />
                                            <div class="panel-content">
                                                <div style="margin-left: 8px; width:204px;">
                                                    <a href="http://farm1.static.flickr.com/{$image_path}.jpg" class="fancybox" rel="fancybox" title="{$title}" caption="<a href='{$page_url}'  target='_blank'>View this in Flickr</a>">
                                                        <span></span>
                                                        <img src="mysite/utils/cropResize.php?src=http://farm1.static.flickr.com/{$image_path}_m.jpg&width=204&height=153" alt="{$title}" />
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <% end_control %>
                                    </ul>
                                    <% end_control %>
                                    <% else %>
                                    <% if CurrentMember %><% if CreatedByMe %>
                                    <a href="$UploadLink" title="Upload Images">
                                        <% control EmptyGalleryCreator %>
                                        $PaddedImage(222,222)
                                        <% end_control %>
                                        <span>Upload Images</span>
                                    </a>
                                    <% else %>
                                    <% control EmptyGalleryFiller %>
                                    $CroppedImage(222,222)
                                    <% end_control %>
                                    <% end_if %>
                                    <% else %>
                                    <% control EmptyGalleryFiller %>
                                    $CroppedImage(222,222)
                                    <% end_control %>
                                    <% end_if %><% end_if %>
                                    <% if CurrentMember %><% if CreatedByMe %>
                                    <div class="left-box-column-link"><a href="$UploadLink" title="Upload Images">Upload Images</a></div>
                                    <% end_if %><% end_if %>
                                </div>
                            </div>
                        </div>
                        <div id="left-box-frame-bottom"><span>&nbsp;</span></div>
                    </div>
                </div>
            </div>

            <div id="event-info">
                <div id="event-details">
                    <% if Private %>
                    <h3>This is a closed event</h3>
                    <p>Closed Events are not able to be joined, even by registered members. You may contact the organiser for details</p>
                    <% end_if %>
                    <p>
                        <strong>Date:</strong> $Date.Format(l) $Date.Format(j) $Date.Format(F), $Date.Format(Y)<br/>
                        <strong>Location:</strong> $LocationAddress <br/>
                        <% if LocationShowDetails %>
                        <strong>Location Meeting Point Details:</strong> $LocationDetails
                        <% end_if %>
                    </p>
                    <div id="event-links" class="little-nav">
                        <% if CurrentMember %>
                        <% if CreatedByMe %>
                        <a href="$EditLink">Edit event</a> ·
                        <a href="$UploadLink" >Upload Images</a> ·
                        <% else %>
                        <% if Private %>
                        <% else %>
                        <% if AlreadyJoined %>
                        <a href="$RemoveLink" id="$ID">Leave event</a> ·
                        <% else %>
                        <a href="$JoinLink" id="$ID">Join event</a> ·
                        <% end_if %>
                        <% end_if %>
                        <% end_if %>
                        <% else %>
                        <a href="my-events/">Login/Sign-up to Join Event</a> ·
                        <% end_if %>
                        <% if hasFacebookLink %>
                        <a href="$FacebookLink" target='_blank'>Go to event on Facebook</a> ·
                        <% end_if %>
                        <% if CurrentMember %>
                        <% if CreatedByMe %>
                        <a href="#SendForm" id="$ID" class="contact contact-organiser">Group Email Event Members</a> ·
                        <a href="#JoinedMembers" id="JoinedMembersPopup" class="info-popup">List of Event Members</a>
                        <% else %>
                        <a href="#SendForm" id="$ID" class="contact contact-organiser">Email Event Coordinator</a>
                        <% end_if %>
                        <% else %>
                        <a href="#SendForm" id="$ID" class="contact contact-organiser">Email Event Coordinator</a>
                        <% end_if %>

                    </div>
                    <% if Private %>
                    <% else %>
                    <% if Description %>
                    <div id="event-description">$Description</div>
                    <% end_if %>
                    <% end_if %>
                </div>
                <div class="clear"></div>

            </div>

            <div class="clear"></div>

            <div id="left-box-container">
                <div id="left-box-frame-top"><span>&nbsp;</span></div>
                <div id="left-box-frame-middle">
                    <div id="left-box-content">
                        $googleMapEvent
                    </div>
                </div>
                <div id="left-box-frame-bottom"><span>&nbsp;</span></div>
            </div>
            <span>&nbsp;</span>

            <% end_control %>
            <% end_if %>

        </div>
        <div class="right-column">
            <% include facebook_like_box %>

            <% if CleanUpEvent %>
            <% control CleanUpEvent %>
            <% if CleanUpSponsors %>

            <div id="right-box-d-container">
                <div id="right-box-d-frame-top"><span>&nbsp;</span></div>
                <div id="right-box-d-frame-middle">
                    <div id="right-d-box-content">
                        <div id="cleanupsponsors-content">
                            $CleanUpSponsorMessage
                            <% control CleanUpSponsors %>
                            <% if IsEOL %> <div class='cleanupsponsor_eol'> <% else %> <div class='cleanupsponsor'> <% end_if %>                                    
                                    <a href="$Weblink" target="_blank" title="$Name"><span>$Name</span><% control Image %>$PaddedImage(150, 150)<% end_control %></a>
                                </div>
                                <% end_control %>
                            </div>
                        </div>
                    </div>
                    <div id="right-box-d-frame-bottom"><span>&nbsp;</span></div>
                </div>
                <span>&nbsp;</span>
                <% end_if %>
                <% end_control %>
                <% end_if %>
				
				<% include action_box %>
            </div>
        </div>
    </div>
    <!-- Needs to be here doesn't load in until instantiated -->
    <div style="display: none;">
        <div id="SendForm">
            $SendForm
        </div>
    </div>

    <div style="display: none;">
        <div id="InviteForm">
            $InviteForm
        </div>
        <!-- -->
    </div>

    <div style="display: none">
        <div id="JoinedMembers">
            <% if CleanUpEvent %>
            <% control CleanUpEvent %>
            <% if CurrentMember %>
            <% if CreatedByMe %>
            <div id="event-admin-details">
                <h2 class="DARK_BLUE">Event Members List</h2>
                <ul>
                    <% control Members %>
                    <li><p><strong>Name:</strong> $FirstName $Surname <br /><strong>Email:</strong> $Email <br /> <strong>Phone:</strong> $Phone <br /><br/></p></li>
                    <% end_control %>
                </ul>
            </div>
            <% end_if %>
            <% end_if %>

            <% end_control %>
            <% end_if %>
        </div>
    </div>
</div>