<div class="columns-wrapper">
	<div class="left-column">
    	<% if Content %>
            <div class="intro-text">
            	$Content
            </div><!--.intro-text ends-->
        <% end_if %>
               <div class="about-google-map white-box">
               		<% if MapTitle %>   
                    	<h4>$MapTitle</h4>
                     <% end_if %>
                     	<div class="map-wrap">
                        	$AboutMap
                        </div>
                    <% if MapDescription %>     
                        <div class="map-description">
                            <p>$MapDescription.Summary(350)</p>
                        </div>
                    <% end_if %>
                </div><!--about-google-map ends-->
                 <div class="clear"></div>  
        <div class="organisations"><!--.organisations-->
          <% if Organisations %>
               <% control Organisations %>
                  <div class="organisation"><!--organisation-->
                              <h4>$Name.LimitWordCount(6)</h4>
                              	<div class="organisation-img" ><!--organisation-img-->
                                	<% if OrganisationImage %>
                                    <a class="link-to-site"  target="_blank" href="$OrganisationLinkHTTP"><img src="$OrganisationImage.OrganisationImageThumbnail.URL" /><% else %><img src="$ThemeDir/img/organisation-img-holder.jpg" /><% end_if %></a>
                                </div><!--.organisation-img ends-->
                                <div class="clear"></div>
                                <div class="organisation-details">
                                    <% if Country %>
                                    	<p class="organisation-country">$Country</p>
                                    <% end_if %> 
                                    <% if OrganisationLinkHTTP %>
                                    	<a class="link-to-site"  target="_blank" href="$OrganisationLinkHTTP">Go to site</a>
                                    <% end_if %> 
                               </div>
                       <div class="clear"></div>
                   </div><!--.organisation ends-->
               <% end_control %>
             <% end_if %>
           <div class="clear"></div>
       </div><!--organisations ends-->
    </div><!--.left-column ends-->
    <div class="right-column">
    	<% if YoutubeLinks %>
			<% control YoutubeLinks %>
                <div class="youtube-embed white-box">
                	<h4>$YoutubeTitle</h4>
                    <iframe width="380" height="214" src="http://www.youtube.com/embed/$getYoutubeID" frameborder="0" allowfullscreen></iframe>
                    <p>$YoutubeDescription.Summary(150)</p>
                    <div class="clear"></div>
                </div>
            <% end_control %>
        <% end_if %>
        <div class="white-box">
        	<% include faq_box %>
        </div>
    </div>
    <div class="clear"></div>
</div><!--.columns-wrapper ends-->
