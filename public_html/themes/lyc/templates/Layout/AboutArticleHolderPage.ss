<div class="columns">

    <div class="left-column">
        <div id="about-articles-holder">
            <ul>
                <% control Children %>
                <li>
                    <div class="about-articles-title"><h2 class="$colorRotator">$Title</h2></div>
                    <div class="about-articles-photo">$Article_Photo.SetWidth(116)<span>&nbsp;</span></div>
                    <div class="about-articles-content">$Content</div>
                    
                </li>
                <% end_control %>
            </ul>
        </div>
        <% include ad_box %>
    </div>

    <div class="right-column">
        <% include facebook_like_box %>
        <% include action_box %>
        <% include faq_box %>
    </div>

    <div class="clear"><!-- SPACE --></div>
</div>
