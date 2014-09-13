<% if DataSheet %>
	<% control DataSheet %>
    
        <h2>$Created.Nice <br /><% control CleanUpGroup %>$Title<% end_control %>, Results </h2>
      
        <div class="data-sheet-info">
        <h4>Overview</h4>
        <ul>
            <li><strong>Participants:</strong><span>$Participants</span></li>
            <li><strong>Sacks:</strong><span>$Sacks</span></li>
            <li><strong>Time:</strong><span>$Time</span></li>
            <li><strong>Distance:</strong><span>$Distance</span></li>
        </ul>
        <% if DataCategorys %>
        	<h4>Items Found</h4>
            <% control DataCategorys %>
            <ul class="data-categorys">
                <li>
                <% if Percentage %><div class="category"><strong>$Title:</strong><span>{$Percentage} %</span></div><% end_if %>
                <% if DataItems %>
                    <ul class="data-items">
                    <% control DataItems %>
                        <% if Amount %><li><strong>$Title:</strong><span>{$Amount} Items</span></li><% end_if %>
                    <% end_control %>
                    </ul>
                <% end_if %>
                </li>
            </ul>
            <% end_control %>
        <% end_if %>
        <% if DataImageFile %>
        	<h4>Event Image</h4>
            <ul class="image">
                <li><img src="$DataImageFile.DataImageFull.URL" /></li>
            </ul>
        <% end_if %>
        </div>
        
        <% if canRemoveData %><a class="blue-btn" href="$DeleteLink">DELETE</a><% end_if %>
        <% if canEditData %><a class="blue-btn" href="$EditLink">EDIT</a><% end_if %>
        
    <% end_control %>
<% end_if %>