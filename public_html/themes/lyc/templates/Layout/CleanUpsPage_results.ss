<h2>$Title</h2>
<div id="create-a-cleanup-event-2"><a href="$CreatePage" title="Create a clean up event"><span>CREATE A CLEAN UP EVENT</span></a></div>
<% if Results %>
<div id="paging_container" class="container">
  <div class="page_navigation"></div>
  <div class="clear"></div>
  <% if Query %>
  <br />
  <p class="query">$Query</p>
  <% end_if %>
  <ul class="all_results">
    <% control Results %>
    <li>
      <div class="result">
        <div class="info"> <a class="clean-up-image" class="link" href="$Link"> <span></span>
          <% if EventImage %>
              <% control EventImage %>
              $CroppedImage(200,150)
              <% end_control %>
          <% else %>
          <img src="themes/lyc/images/cleanupweek/image_placeholder.jpg" width="200" height="150" alt="No Image" />
          <% end_if %>
          </a>
          <h3><a class="header" href="$Link">$Title<span></span></a></h3>
          <div class="location">
            <p><strong>Location:</strong> <br />
              $Location</p>
            <p><strong>Area:</strong> <br />
              $Area</p>
          </div>
          <div class="desc">
            <p>$Description.LimitWordCount(20)</p>
          </div>
        </div>
      </div>
      <div class="clear">
        <!-- SPACE -->
      </div>
    </li>
    <% end_control %>
  </ul>
   <div class="page_navigation"></div>
</div>
<% else %>
<div id="paging_container" class="container">
<p>Sorry, your search did not return any results. Please <a href="javascript:history.go(-1)" title="search again">click here to go back</a> and try another search, or you could <a href="/create-a-clean-up-event">create your own Clean Up Event</a></p>
</div>
<% end_if %>
