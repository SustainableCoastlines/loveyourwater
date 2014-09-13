<div class="columns">
    <div class="left-column">
        <div id="staff-content-container">
            <h2><span class="DARK_BLUE">$Title</span><span class="ORANGE">$Subtitle</span></h2>

            <div class="columns2">
                <div class="left-column">
                    <h2 class="RED">Auckland Team</h2>
                    <ul>
                        <% control getCityStaff(Auckland) %>
                        <li>
                            <div class="small_thumb"><% control Photo %>$CroppedImage(50,50)<% end_control %></div>
                            <h4>$Role</h4>
                            <p>$Name · $Phone</p>
                            <div class="little-nav">
                                <a href="mailto:{$Email}">Send email</a>
                                <% if hasFacebookLink %> · <a href="{$FacebookLink}" target="_blank">Find online</a> <% end_if %>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <% end_control %>
                    </ul>

                    <h2 class="DARK_BLUE">Christchurch Team</h2>
                    <ul>
                        <% control getCityStaff(Christchurch) %>
                        <li>
                            <div class="small_thumb"><% control Photo %>$CroppedImage(50,50)<% end_control %></div>
                            <h4>$Role</h4>
                            <p>$Name · $Phone</p>
                            <div class="little-nav">
                                <a href="mailto:{$Email}">Send email</a>
                                <% if hasFacebookLink %> · <a href="{$FacebookLink}" target="_blank">Find online</a> <% end_if %>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <% end_control %>
                    </ul>

                </div>
                <div class="right-column">
                    <h2 class="ORANGE">Wellington Team</h2>
                    <ul>
                        <% control getCityStaff(Wellington) %>
                        <li>
                            <div class="small_thumb"><% control Photo %>$CroppedImage(50,50)<% end_control %></div>
                            <h4>$Role</h4>
                            <p>$Name · $Phone</p>
                            <div class="little-nav">
                                <a href="mailto:{$Email}">Send email</a>
                                <% if hasFacebookLink %> · <a href="{$FacebookLink}" target="_blank">Find online</a> <% end_if %>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <% end_control %>
                    </ul>

                    <h2 class="LIGHT_BLUE">West Coast Team</h2>
                    <ul>
                        <% control getCityStaff(Westcoast) %>
                        <li>
                            <div class="small_thumb"><% control Photo %>$CroppedImage(50,50)<% end_control %></div>
                            <h4>$Role</h4>
                            <p>$Name · $Phone</p>
                            <div class="little-nav">
                                <a href="mailto:{$Email}">Send email</a>
                                <% if hasFacebookLink %> · <a href="{$FacebookLink}" target="_blank">Find online</a> <% end_if %>
                            </div>
                            <div class="clear"></div>
                        </li>
                        <% end_control %>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div id="whosin-collaborators-container">
            <h1>Collaborators</h1>
            <% control Collaborators %>
            <% if IsKeyCollaborator %>
            <div class="whosin-collaborator" <% if Last %> style="background: none;"<% end_if %>>
                 <a href="{$Weblink}" target="_blank" name="$ID" class="whosin-collaborator-logo"><span>$Name</span>
                    <% control Image %>
                    $PaddedImage(116,116)
                    <% end_control %>
                </a>
                <div class="whosin-collaborator-info">
                    <h2 class="whosin-collaborator-title {$colorRotator}">$Name</h2>
                    <p>$ShortDescription</p>
                    <div class="little-nav">
                        <a href="mailto:$Email" target="_blank">Send email </a> ·
                        <a href="$Weblink" target="_blank">Go to website</a>
                    </div>
                </div>
                <div class="clear"><!-- SPACE --></div>
            </div>
            <% end_if %>
            <% end_control %>


        </div>
    </div>
    <div class="right-column">
        <% include facebook_like_box %>
        <% include action_box %>
        <div id="founding-story-box">
            $FoundingStoryText
        </div>
    </div>
</div>







