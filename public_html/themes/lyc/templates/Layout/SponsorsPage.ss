<div class="columns">
    <div class="left-column">
        <div class="sponsors-content">
            $Content
        </div>
        $Form
        $PageComments
    </div>
    <div class="right-column">
        <% include facebook_like_box %>
    </div>
</div>
<div class="clear"></div>

<div class="sponsor-logo-links">
    <% control Sponsors %>
    <% if Image %>
    <a href="#$ID" class="sponsor-logo <% if isEol %> sponsor-logo-eol <% end_if %>"><span>$Name</span><% control Image %>
        $PaddedImage(140,140)
        <% end_control %>
    </a>
    <% end_if %>
    <% end_control %>
    <div class="clear"><!-- SPACE --></div>
</div>


<% control Sponsors %>
<div class="sponsor-details" <% if Last %> style="background: none;"<% end_if %>>
     <a href="$Weblink" target="_blank" name="$ID" class="sponsor-logo"><span>$Name</span><% control Image %>
        $PaddedImage(136,140)
        <% end_control %>
    </a>
    <div style="float: right; width: 700px;">
        <h2 class="sponsor-title $colorRotator">$Name</h2>
        <p>$Description</p>
        <div class="little-nav">
            <a href="mailto:$Email" target="_blank">Send email </a> ·
            <a href="$Weblink" target="_blank">Go to website</a>
        </div>
    </div>
    <div class="clear"><!-- SPACE --></div>
</div>
<% end_control %>

