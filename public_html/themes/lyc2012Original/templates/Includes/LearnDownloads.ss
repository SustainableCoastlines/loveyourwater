<% control LearnDownloads %>
  <% if Download %><div class="downloads">
          <% if FileURL %><a href="$FileURL" target="_blank"><% else %><a href="$Attachment.URL" target="_blank"><% end_if %>
              <h4>$Title.LimitWordCount(5)</h4>
                <div class="downloads-img" >
                    <% if DownloadThumbImage %>$DownloadThumbImage.CroppedImage(215,125)<% else %><img src="$ThemeDir/img/fileicons/display_{$FileType}.jpg" /><% end_if %>
                </div><!--.downloads-img ends-->
                  <div class="icon-text">
                      <% if FileType=none %>                                       
                          <p class="full-desc">$Description.Summary(15)</p>
                      <% else %>
                          <div class="icon {$FileType}">
                                <img src="$ThemeDir/img/fileicons/icon_{$FileType}.jpg" />
                          </div><!--.icon ends-->
                          <p>$Description.Summary(15)</p>
                      <% end_if %>
                  </div> <!--.icon-text ends-->
           </a>
       <div class="clear"></div>
   </div><!--.downloads ends--><% end_if %>
<% end_control %>