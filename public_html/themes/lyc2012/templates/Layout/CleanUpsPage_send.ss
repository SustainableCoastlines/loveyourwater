<div class="col-wrap"> 
	<div class="col-1 no-margin">
    	<div class="home-intro">
        	$Message
        </div>
    </div>
 <div class="learn-downloads">
    <div class="col-1 no-margin">
                <% control LearnDownloads %>
                  <% if Download %><div class="downloads">
                          <% if FileURL %><a href="$FileURL" target="_blank"><% else %><a href="$Attachment.URL" target="_blank"><% end_if %>
                              <h4>$Title.LimitWordCount(5)</h4>
                              	<div class="downloads-img" >
                                	<% if DownloadThumbImage %>$DownloadThumbImage.CroppedImage(215,125)<% else %><img src="$ThemeDir/img/fileicons/display_{$FileType}.jpg" /><% end_if %>
                                </div><!--.downloads-img ends-->
                                  <div class="icon-text">
                                      <div class="icon {$FileType}">
                                            <img src="$ThemeDir/img/fileicons/icon_{$FileType}.jpg" />
                                      </div><!--.icon ends-->
                                      <p>$Description.Summary(15)</p>
                                  </div> <!--.icon-text ends-->
                           </a>
                       <div class="clear"></div>
                   </div><!--.downloads ends--><% end_if %>
               <% end_control %>
           <div class="clear"></div>
       </div><!--learn-downloads ends-->
   </div>
</div>
	<% if CurrentMember %>
        <div class="form-box">
            <div class="form-left">
                $SendForm
            </div>
        </div>
    <% end_if %>
</div>
<div class="clear"></div>