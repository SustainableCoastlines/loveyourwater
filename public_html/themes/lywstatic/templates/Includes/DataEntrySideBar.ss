<div id="data-entry-side-bar">
<% if Content %><div class="intro-text">$Content</div><% end_if %>
<% if MyDataSheets %>
<h2>My results</h2>
<ul id="datasheets">
	<% control MyDataSheets %>
            <li><a href="$Link">$Created.Nice - <br />$Title</a></li>	
        <% end_control %>
</ul>
<% end_if %>
<% if LearnDownloads %>
    <% include LearnDownloads %>
<% end_if %>
</div>