<div id="action-box-container">
    <div id="action-box-frame-top"><span>&nbsp;</span></div>
    <div id="action-box-frame-middle">
        <div id="action-box-content">
            <div id="action-box-description">
                <% control Page(get-involved) %>
                $ActionBoxMessage
                <% end_control %>
            </div>

            <div>
                <div id="action-box-fb-embed">
                    <iframe
                        src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FLove-your-Coast%2F119334551458105&amp;width=302&amp;colorscheme=light&amp;connections=5&amp;stream=false&amp;header=false&amp;height=186"
                        scrolling="no"
                        frameborder="0"
                        style="border:none; overflow:hidden; width:300px; height:161px; margin-left: -1px; margin-top: -1px; "
                        allowTransparency="true">

                    </iframe>
                </div>
            </div>
            <% control DisplayedActionLinksList %>
            <div class="action-box-link" style="background: $bgColorRotator ;">
                <div><a href="<% if CurrentMember %>$findMemberLink<% else %>$Link<% end_if %>" target="_blank"><span>$Image_Small $ShortDescription</span></a></div>
            </div>
            <% end_control %>
            <span>&nbsp;</span>
        </div>
    </div>
    <div id="action-box-frame-bottom"><span>&nbsp;</span></div>
</div>