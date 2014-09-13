 <div class="my-events-wrap">
      <div class="my-events-header">
                <% if CurrentMember %>
                <!-- -------------------------------------------------------------------------------------------LOGGED IN -->
                <% if hasCleanUps %>
                <div class="messages">
                <% if ErrorMessage %>
                $ErrorMessage
                <% end_if %>
                <% if UploadMessage %>
                $UploadMessage
                <% end_if %>
                
                </div>
     </div><!--my-events-header ends-->
 <div class="white-box"> 
   <div class="my-events">    
        <% if CreatedGroups %>
        <div class="created-wrap">
         <h3>Events you've created:</h3>
          <div class="clear"><!-- SPACE --> </div>
            <div class="created">
                <% control CreatedGroups %>
                <div class="my-event white-box">
                <div class="my-event-wrap">
              		<div class="my-events-img">
                           <% if EventMainImage %>
                                <% control EventMainImage %>$CroppedImage(167,167)<% end_control %>
                                <% else %>
                                <% control EventCommunityBadge %>$CroppedImage(167,167)<% end_control %>
                                <% end_if %>
                    </div><!--my-events-img ends-->
                     <h4>$Title</h4>
                     <div class="clear"><!-- SPACE --> </div>
                    <div class="my-events-info">
                     	<% if FromDate %>
                        <p>Start Date:<span> $FromDate.nice</span></p>
                        <% end_if %>
                        <% if ToDate %>
                        <p>To:<span> $ToDate.nice</span></p>
                        <% end_if %>
                        <% if LocationAddress %>
                        <p>Location:<span>$LocationAddress</span></p>
                        <% end_if %>
                      <!--  <% if Description %><p>What:<span> $Description.Summary(20) <a href="$Link" title="See event">more</a></span></p><% end_if %>-->
                    </div>
                 </div><!--my-event-wrap ends-->
                  <div class="little-nav">
                        <a class="links-btn" href="$Link" title="View event">View Event</a> 
                        <a class="links-btn" href="$EditLink" title="Edit details">Edit Event</a>
                    </div>
                 </div><!--my-event ends-->
                <% end_control %>
            </div><!--created end-->
            <div class="clear"><!-- SPACE --> </div>
        </div><!--created-wrap ends-->
        <% end_if %>

        <% if JoinedGroups %>
        <% control CurrentMember %>
        <% if CleanUpGroups %>
        <h3>Events you've joined:</h3>
        <div class="joined-wrap">
             <% control CurrentMember %>
                <% control CleanUpGroups %>
                <% if CreatedByMe %><% else %>
                <div class="my-event white-box">
                <div class="my-event-wrap">
                    <div class="my-events-img">
                        <div>
                           <% if EventMainImage %>
                                <% control EventMainImage %>$CroppedImage(167,167)<% end_control %>
                                <% else %>
                                <% control EventCommunityBadge %>$CroppedImage(167,167)<% end_control %>
                                <% end_if %>
                        </div>
                    </div>
                    <h4>$Title</h4>
                    <div class="clear"><!-- SPACE --> </div>
                    <div class="my-events-info">
                        <% if FromDate %>
                        <p>Start Date:<span> $FromDate.nice</span></p>
                        <% end_if %>
                        <% if ToDate %>
                        <p>To:<span> $ToDate.nice</span></p>
                         <% end_if %>
                        <p>Location:<span>$LocationAddress</span></p>
                       <!-- <% if Description %><p>What:<span> $Description.Summary(20) <a href="$Link" title="See event">more</a></span></p><% end_if %>-->
                    </div>
                    <div class="clear"><!-- SPACE --> </div>
                     </div><!-- my-event-wrap ends --> 
                     <div class="little-nav">
                        <a class="links-btn" href="$Link" title="View event">View Event</a> 
                        <a class="links-btn" href="$SendLink" id="$ID">Send Email</a>
                    </div>   
                </div><!-- my-event ends -->
                <% end_if %>
                <% end_control %>
                <% end_control %>
            <div class="clear"><!-- SPACE --></div>
        </div><!--joined-wrap end-->
        <% end_if %>
        <% end_control %>
        <% end_if %>

        <!-- if the Logged in Member doesnt have clean ups -->
        <% else %>
        <h2>$Title</h2>
        $JoinMessage
        <% end_if %>
        <!-- Content if the User is not a Member or isn't currently logged on-->
        
       <!-- -------------------------------------------------------------------------------------------END MEMBER STATES  -->
  <% end_if %>
</div> <!--my-events ends   -->
</div>          
</div> <!--my-events-wrap ends   --> 
			
            