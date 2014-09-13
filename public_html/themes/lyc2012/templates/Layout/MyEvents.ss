<% if CurrentMember %>
    <div class="col-wrap"> 
    <div class="col-1 no-margin">
        <div class="intro-text">
        	<p>$SiteConfig.MyEventsContent</p>
        </div>
    </div>
     <div class="learn-downloads">
        <div class="col-1 no-margin">
                    <% include LearnDownloads %>
               <div class="clear"></div>
           </div><!--learn-downloads ends-->
       </div><!--col-1 no-margin ends-->
    </div><!--col-wrap ends-->
    
    <div class="content-right no-bg">
    <% include LoggedIn %>
    </div><!--content-right ends-->
    $Form
   
<% else %>
	<% include LoggedOut %>
    <div class="clear"></div>
<% end_if %>

<div class="clear"></div>  