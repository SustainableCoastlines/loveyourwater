<div class="columns">
    <div class="left-column">
        <% include BreadCrumbs %>
        <div id="news-article-container">
            <h2 class="RED">$Title</h2>
            <h2 class="ORANGE">$Date.Nice</h2>
            <div class="article-content">$Content</div>
            <!--div class="little-nav">
                <a href="mailto:$AuthorEmail" target="_blank">Email Author</a>
            </div-->
        </div>
        $Comments
    </div>
     <div class="right-column">
        <% include facebook_like_box %>

         <% if hasRelatedFlickr %>
        <div id="related-media-box-container">
            <div id="related-media-box-frame-top"><span>&nbsp;</span></div>
            <div id="related-media-box-frame-middle">
                <div id="related-media-box-content">
                  
                    <h2 class="DARK_BLUE">Photos</h2>
                    <% control getFlickrPhotos(100) %>
                    <ul id="event-gallery">
                        <% control PhotoItems %>
                        <li><img src="http://farm1.static.flickr.com/{$image_path}_s.jpg" alt="{$title}" />
                            <div class="panel-content">
                                <div style="margin-left: 8px; width:204px;">
                                    <a href="http://farm1.static.flickr.com/{$image_path}.jpg" class="fancybox" rel="fancybox" title="{$title}" caption="<a href='{$page_url}'>View this in Flickr</a>">
                                        <span></span>
                                        <img src="mysite/utils/cropResize.php?src=http://farm1.static.flickr.com/{$image_path}_m.jpg&width=345&height=175" alt="{$title}" />
                                    </a>
                                </div>
                            </div>
                        </li>
                        <% end_control %>
                    </ul>

                    <% end_control %>
                    
                </div>
            </div>
            <div id="related-media-box-frame-bottom"><span>&nbsp;</span></div>
        </div>
        <% end_if %>

        <span>&nbsp;</span>

            <% if YoutubeLinks %>
        <div id="related-media-box-container">
            <div id="related-media-box-frame-top"><span>&nbsp;</span></div>
            <div id="related-media-box-frame-middle">
                <div id="related-media-box-content">
                    
                    <h2 class="DARK_BLUE">Videos</h2>
                    <div id="related-youtube-slideshow">
                        <div id="youtubeSlides">
                            <% control YoutubeLinks %>
                            <div class="youtube-thumb">
                                <a href="http://www.youtube.com/watch?v={$getYoutubeID}&feature=player_embedded&autoplay=1" class="fancyvideo"  >
                                    <span></span>
                                    <div style="float:left; width: 360px; height: 200px;"><img src="mysite/utils/cropResize.php?src=http://img.youtube.com/vi/{$getYoutubeID}/0.jpg&width=360&height=200" width="360" height="200"/></div>
                                    <div style="float:left; height: 360px; margin-left: -205px; margin-top: 85px;"><img src="themes/lyc/images/lyc/play_button.png" /></div>
                                    <!---->
                                </a>
                                <div class="clear"></div>
                            </div>
                            <% end_control %>
                        </div>

                        <div id="youtubeController">
                            <% control YoutubeLinks %>

                            <span class="jFlowControl1"></span>
                            <% end_control %>
                        </div>


                        <span class="jFlowPrev jFlowPrev1 jFlowPrevRelatedBox"><div></div></span>
                        <span class="jFlowNext jFlowNext1 jFlowNextRelatedBox"><div></div></span>



                    </div>
                    
                </div>
            </div>
            <div id="related-media-box-frame-bottom"><span>&nbsp;</span></div>
        </div>
            <% end_if %>
        <span>&nbsp;</span>

        <% include action_box %>
    </div>

</div>








