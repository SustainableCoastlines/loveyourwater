<div class="col-wrap"> 
    <div class="col-1 no-margin">
        <div class="home-intro">
            $Message
        </div>
    </div>
    <div class="col-1 no-margin">
    <div class="learn-downloads">
        <% include LearnDownloads %>
        <div class="clear"></div>
    </div>
    </div>
    <div class="data-content">
		<% if CurrentMember %>
            <div class="form-box">
                <div class="form-left">
                    $EditForm
                </div>
            </div>
            <div class="clear"></div>
            <% if canDelete %><br /><br /><a class="blue-btn" href="$DeleteLink">DELETE EVENT</a><% end_if %>
        <% end_if %>
    </div>
</div>
<div class="clear"></div>