<div class="col-wrap"> 
	<div class="col-1 no-margin">
    	<div class="home-intro">
        	$Message
        </div>
    </div>
 <div class="learn-downloads">
    <div class="col-1 no-margin">
                  <% include LearnDownloads %>
           <div class="clear"></div>
       </div><!--learn-downloads ends-->
   </div>
</div>
<div class="member-list-content">
	<% if Event %>
    	<h2>$Title</h2>
        <div class="member-list-info">
        	<% control Event %>
            	<h4>$Title</h4>
                <ul class="member-list">
                	<li><span class="name"><em>Member Name</em></span><span class="email"><em>Member Email</em></span></li>
                	<% control Members %>
                    <li><span class="name">$FirstName, $Surname</span><span class="email"><a href="mailto:{$Email}">$Email</a></span></li>
                	<% end_control %>
               </ul>
            <% end_control %>
        </div>
    <% end_if %>
</div>
</div>
<div class="clear"></div>