<div class="columns">
    <div class="left-column">

        <div class="getinvolved-container">
            <h2><span class="DARK-BLUE">Keen to Get Involved?</span>&nbsp;&nbsp;<span class="ORANGE">Here's How</span></h2>
            <% control DisplayedActionLinksList %>
            <div class="<% if isEol %> getinvolved-link-eol <% else %> getinvolved-link <% end_if %>">
            <a href="<% if CurrentMember %>$findMemberLink<% else %>$Link<% end_if %>" class="getinvolved-image">
               $Image_Big.SetWidth(196)
            </a>
            <a href="<% if CurrentMember %>$findMemberLink<% else %>$Link<% end_if %>" class="getinvolved-description">
               $Description
            </a>
            </div>

            <% end_control %>
            <div class="clear"><!-- SPACE --></div>
        </div>
    </div>
    <div class="right-column">
        <% include facebook_like_box %>

        <div id="download-box-container">
            <div id="download-box-frame-top"><span>&nbsp;</span></div>
            <div id="download-box-frame-middle">
                <div id="download-box-content">
                    <div id="download-box-description">
                        $DownloadBoxMessage
                    </div>

                    <% control GetInvolvedDownloads %>

                    <div class="download-box-link bg{$numRotator}">
                        <div><a href="$Attachment.URL"><img src="themes/lyc/images/lyc/download_arrow_{$numRotator}.png"/> <span> $Name</span></a></div>
                    </div>

                    <% end_control %>

                    <span>&nbsp;</span>
                </div>
            </div>
            <div id="download-box-frame-bottom"><span>&nbsp;</span></div>
        </div>
        <span>&nbsp;</span>
        <% control page(about) %>
        <% include faq_box %>
        <% end_control %>
    </div>
</div>







