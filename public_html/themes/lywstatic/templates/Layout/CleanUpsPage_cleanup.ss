<div class="col-wrap"> 
    <div class="learn-downloads">
        <div class="col-1 no-margin">
			<% if CleanUpEvent %>
                <% control CleanUpEvent %>
                 <div class="white-box-cleanups">
                      <% if EventMainImage %>
                            <% control EventMainImage %>$PaddedImage(222,222)<% end_control %>
                      <% else %>
                            <% control EventCommunityBadge %>$PaddedImage(222,222)<% end_control %>
                      <% end_if %>
                  </div><!-- white-box-cleanups -->
                  
                      <% if CurrentMember %><% if CreatedByMe %><div class="btn-badge"><a class="blue-btn" href="$UploadBadgeLink" title="Upload Badge">Upload a new event badge</a></div><% end_if %><% end_if %>
                  
                  <div class="clear"></div>
                  <div class="white-box-map">
                    $googleMapEvent
                  </div><!-- white-box-map ends -->
               <% end_control %><!-- control CleanUpEvent ends-->
            <% end_if %><!-- if CleanUpEvent ends -->
		</div><!-- col-1 no-margin ends -->
    </div><!-- learn-downloads ends -->
</div><!-- col-wrap ends -->

<div class="content-wrapp">
    <% if CleanUpEvent %>
        <% control CleanUpEvent %>
        <div class="content-right">
            <div class="cleanups-content">
            	<div class="cleanups-header">
                	<div class="header-date-icon">
                        <% if FromDate %>
                                <p class="day">$FromDate.Format(d)</p>
                                <p class="month">$FromDate.Format(M)<span>$FromDate.Format(y)</span></p>
                            <% else_if Date %>
                                <p class="day">$Date.Format(d)</p>
                        		<p class="month">$Date.Format(M)<span>$Date.Format(y)</span></p>
                            <% else %>
                                <p class="day">NA</p>
                        		<p class="month">no date</span></p>	
                        <% end_if %>
                    </div><!-- header-icon ends -->
                    <div class="header-title">
                    	<h2>$Title</h2>
                        <% if Organisation %><h3>Organised by:<span class="org">$Organisation</span></h3><% end_if %>
                    </div><!--header-title ends-->
                <div class="clear"></div>
                </div><!--cleanups-header ends -->
                
                <div class="cleanups-event-links">
                	 <% if CurrentMember %>
                        <!-- logged in member -->
                            <% if CreatedByMe %>
                                <!-- owner -->
                                <a class="links-btn" href="$EditLink">Edit event</a><a class="links-btn" href="my-results/">Share results</a><a class="links-btn" href="$DeleteLink">Delete Event</a>
                            <% else %>
                                <!--  join links -->
                                <% if AlreadyJoined %>
                                    <a class="links-btn" href="$RemoveLink" id="$ID">Leave event</a>
                                <% else %>
                                    <a class="links-btn" href="$JoinLink" id="$ID">Join event</a>
                                <% end_if %>
                            <% end_if %>                        
                        <% else %>
                        <!-- logged out member -->
                        	<a class="links-btn" href="my-events/">Login/Sign-up to Join Event</a>
                        <% end_if %>
                        <!-- facebook link -->
                        <% if hasFacebookLink %>
                        	<a class="links-btn" href="$FacebookLink" target='_blank'>Go to event on Facebook</a>
                        <% end_if %>
                        
                        <% if CurrentMember %>
                        	<!-- logged in member -->
                            <% if CreatedByMe %>
                                <!-- owner -->
                                <a class="links-btn" href="$SendLink" id="$ID" >Group Email Event Members</a>
                                <a class="links-btn" href="$ListMembersLink" id="MembersList">List of Event Members</a>
                            <% else %>
                                <!--  logged in user -->
                                <a class="links-btn" href="$SendLink" id="$ID">Email Event Coordinator</a>
                            <% end_if %>
                        <% else %>
                        	<!-- logged out member -->
                        	<a class="links-btn" href="$SendLink" id="$ID">Email Event Coordinator</a>
                        <% end_if %>
                </div><!--cleanups-event-links-->
                <div class="event-details">
                    <ul>
                            <% if FromDate %>
                                <li>
                                    <p>Start Date:</p>
                                    <span>$FromDate.nice</span>
                                   
                                    <div class="clear"></div> 
                                </li>
                            <% end_if %>
                            <% if ToDate %>
                             <li>
                                    <p>To:</p>
                                    <span>$ToDate.nice</span>
                                   
                                    <div class="clear"></div> 
                                </li>
                            <% end_if %>
                            <% if FromTime %>
                            <li>
                                <p>Time:</p>
                                <span>$FromTime to $ToTime</span>
                                <div class="clear"></div>
                            </li>
                            <% end_if %>
                            <li>
                                <p>Location:</p>
                                <span>$LocationAddress</span>
                                <div class="clear"></div>
                            </li>
                            <% if LocationShowDetails %>
                                <li>
                                    <p>Location Details:</p>
                                    <span>$LocationDetails</span>
                                    <div class="clear"></div>
                                </li>
                            <% end_if %>
                            <li>
                                <p>Description:</p>
                                <span>$Description</span>
                                <div class="clear"></div>
                            </li>
                            
                    </ul>
                </div>
              <div class="clear"></div>
            </div><!--cleanups-content ends -->
          </div><!--content-right ends-->
          
		  <% if hasRelatedFlickr %>
          	  <!-- check whether this is required -->
              <!--< % include EventGallery % >-->
          <% end_if %>
          
        <% end_control %><!-- control CleanUpEvent ends-->
     <% end_if %><!-- if CleanUpEvent ends --> 
</div><!-- content-wrapp ends -->
<div class="clear"></div>
 