<% if CurrentMember %>
    <% if ShowData %>
        <% include DataEntrySideBar %>
        <div class="data-content">
            <% include DataSheet %> 
        </div>
        <div class="clear"></div>
        $Form
        $PageComments
    <% else_if Sent %>
    <div class="intro-text">$SuccessMessage</div>
        
        $Form
        $PageComments
    <% else_if Fail %>
    <div class="intro-text">$FailMessage</div>
       
        $Form
        $PageComments
    <% else %>
        <% include DataEntrySideBar %>
        <div class="form-content"> 
        <div class="form-box">
            $DataEntryForm
        </div>
        </div>
        <div class="clear"></div>
        $PageComments
    <% end_if %>
<% else %>
	<% include LoggedOut %>
	hello
<% end_if %>

	