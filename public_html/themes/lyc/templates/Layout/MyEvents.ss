<div class="columns">

    <div class="left-column">
        $Form
        <div id="my-events">
            <% if CurrentMember %>
            <% if hasCleanUps %>
            <h1>$Title</h1>
            <h2 class="RED">Welcome, <% control CurrentMember %>$FirstName!<% end_control %></h2>
            <div id="messages">
            <% if ErrorMessage %>
            $ErrorMessage
            <% end_if %>
            <% if UploadMessage %>
            $UploadMessage
            <% end_if %>
            $ProfileMessage
            </div>
            <% if CreatedGroups %>
            <h3>Events you've created:</h3>
            <div id="created">
                <ul>
                    <% control CreatedGroups %>
                    <li>
                        <div class="my-events-img">
                            <div>
                               <% if EventMainImage %>
                                    <% control EventMainImage %>$PaddedImage(120,120)<% end_control %>
                                    <% else %>
                                    <% control EventCommunityBadge %>$PaddedImage(120,120)<% end_control %>
                                    <% end_if %>
                            </div>
                        </div>
                        <div class="my-events-title-created"><h2>$Title</h2></div>
                        <div class="my-events-info">
                            <p><b>When:</b> $Date.nice </p>
                            <p><b>Where:</b> <% if showLocationDetails %> $LocationDetails <% end_if %> $LocationAddress </p>
                            <% if Description %><p><b>What:</b> $Description.Summary(40) <a href="$Link" title="See event">more</a></p><% end_if %>
                        </div>
                        <div class="little-nav">
                            <a href="$Link" title="View event">View event </a> ·
                            <a href="$EditLink" title="Edit details">Edit details </a> ·
                            <a href="$UploadBadge" title="Upload Images">Upload Badge </a> ·
                            <a href="$UploadLink" title="Upload Images">Upload Images </a>
                        </div>
                        <div class="clear">
                            <!-- SPACE -->
                        </div>
                    </li>
                    <% end_control %>
                </ul>
                <div class="clear">
                    <!-- SPACE -->
                </div>
            </div>
            <% end_if %>

            <% if JoinedGroups %>
            <% control CurrentMember %>
            <% if CleanUpGroups %>
            <h3>Events you've joined:</h3>
            <div id="joined">
                <ul>
                    <% control CurrentMember %>
                    <% control CleanUpGroups %>
                    <% if CreatedByMe %><% else %>
                    <li>
                        <div class="my-events-img">
                            <div>
                               <% if EventMainImage %>
                                    <% control EventMainImage %>$PaddedImage(120,120)<% end_control %>
                                    <% else %>
                                    <% control EventCommunityBadge %>$PaddedImage(120,120)<% end_control %>
                                    <% end_if %>
                            </div>
                        </div>
                        <div class="my-events-title-joined"><h2>$Title</h2></div>
                        <div class="my-events-info">
                            <p><b>When:</b> $Date.nice </p>
                            <p><b>Where:</b> <% if showLocationDetails %> $LocationDetails <% end_if %> $LocationAddress </p>
                            <% if Description %><p><b>What:</b> $Description.Summary(40) <a href="$Link" title="See event">more</a></p><% end_if %>
                        </div>
                        <div class="little-nav">
                            <a href="$Link" title="View event">View event </a> ·
                            <% if hasFacebookLink %> <a href="$FacebookLink" title="Go to facebook" target="_blank">Event on Facebook </a> · <% end_if %>
                           <a href="#SendForm" id="$ID" class="contact contact-organiser">Email Event Coordinator</a>
                        </div>
                        <div class="clear">
                            <!-- SPACE -->
                        </div>
                    </li>
                    <% end_if %>
                    <% end_control %>
                    <% end_control %>
                </ul>
                <div class="clear">
                    <!-- SPACE -->
                </div>
            </div>
            <% end_if %>
            <% end_control %>
            <% end_if %>

            <!-- if the Logged in Member doesnt have clean ups -->
            <% else %>
            <h2>$Title</h2>
            $JoinMessage
            <% end_if %>
            <!-- Content if the User is not a Member or isn't currently logged on-->
            <% else %>
            
                <% if Action = verification %>
                <h1>Verification</h1>
                <div class="form-left">
                    <div class="form-cloud-background">
                        <div class="form-cloud-top">
                            <div class="form-cloud-bottom">
                                <div class="form-cloud-contents">
                                    $ActivationMessage
                                    $VerificationForm
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% else %>
                <h1>Login</h1>
                
                <div class="form-left">
                    <div class="form-cloud-background">
                        <div class="form-cloud-top">
                            <div class="form-cloud-bottom">
                                <div class="form-cloud-contents">
                                    $LoginMessage
                                    $LoginForm
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    
                <a name="signup"><h1> Sign-up </h1></a>
                <div class="form-left">
                    <div class="form-cloud-background">
                        <div class="form-cloud-top">
                            <div class="form-cloud-bottom">
                                <div class="form-cloud-contents">
                                    $RegisterMessage
                                    $RegisterForm
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% end_if %>

            <% end_if %>
            <!-- Needs to be here doesn't load in until instantiated -->
            <div style="display: none;">
                <div id="SendForm"> $SendForm </div>
            </div>
            <div style="display: none;">
                <div id="InviteForm"> $InviteForm </div>
            </div>
        </div>
    </div>

    <div class="right-column">
        <% include facebook_like_box %>
        <% include action_box %>
    </div>

</div>