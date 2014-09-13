<div class="columns">
    <div class="left-column">
        <div id="learn-content-container">
            <h2 class="DARK_BLUE">Keeping You in the Loop</h2>
            <div class="columns2">
                <div class="left-column newsArticlesList">
                    <h2 class="RED">Latest News</h2>
                    <ul>
                        <% control children %>
                        <li>
                            <a href="$Link">
                                <div class="small_thumb"><img src="{$getEventPhotoURLThumb}" width="50" height="50" /></div>
                            </a>
                            <div style="float:left; width: 170px;">
                                <h4>$Title</h4>
                                <p>$Content.Summary(15) <a href="$Link" title="$Title">more</a></p>
                            </div>

                            <div class="clear"></div>
                        </li>
                        <% end_control %>
                    </ul>

                </div>
                <div class="right-column mediaReleaseLinksList">
                    <h2 class="ORANGE">Media Releases</h2>

                    <ul>
                        <% control MediaReleaseDownloads %>
                        <li>

                            <div class="small_thumb"><% control Photo %>$PaddedImage(50,50)<% end_control %></div>
                            <div style="float:left; width: 170px;">
                                <h4>$Title</h4>
                                <p>$Description<br/><a href="$Attachment.URL">Download</a> </p>
                            </div>

                            <div class="clear"></div>
                        </li>
                        <% end_control %>
                    </ul>

                    <div id="lyclogodownload">
 
                        <div class="getinvolved-link">
                            <a href="$LYCLogoFile.URL" class="getinvolved-image">
                                $LYCLogoIcon.SetWidth(196)
                            </a>
                            <a href="$LYCLogoFile.URL" class="getinvolved-description">
                                $LYCLogoMessage
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="right-column">
        <% include facebook_like_box %>

        <div id="related-media-box-container">
            <div id="related-media-box-frame-top"><span>&nbsp;</span></div>
            <div id="related-media-box-frame-middle">
                <div id="related-media-box-content">
                    <h2 class="DARK_BLUE">Latest Flickr Photos</h2>

                    <% control getLatestFlickrPhotos(20) %>


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
                    $FlickrMessage
                </div>
            </div>
            <div id="related-media-box-frame-bottom"><span>&nbsp;</span></div>
        </div>

        <span>&nbsp;</span>

        <div id="related-media-box-container">
            <div id="related-media-box-frame-top"><span>&nbsp;</span></div>
            <div id="related-media-box-frame-middle">
                <div id="related-media-box-content">
                    <h2 class="DARK_BLUE">Latest Youtube Videos</h2>
                    <div id="related-youtube-slideshow">
                        <div id="youtubeSlides">
                            <% control getLatestYoutubeVideos(10) %>
                            <div class="youtube-thumb">
                                <a href="http://www.youtube.com/watch?v={$PlayerID}&feature=player_embedded&autoplay=1" class="fancyvideo"  >
                                    <span></span>
                                    <div style="float:left; width: 360px; height: 200px;"><img src="mysite/utils/cropResize.php?src=http://img.youtube.com/vi/{$PlayerID}/0.jpg&width=360&height=200" width="360" height="200"/></div>
                                    <div style="float:left; height: 360px; margin-left: -205px; margin-top: 85px;"><img src="themes/lyc/images/lyc/play_button.png" /></div>
                                    <!---->
                                </a>
                                <div class="clear"></div>
                            </div>
                            <% end_control %>
                        </div>

                        <div id="youtubeController">
                            <% control getLatestYoutubeVideos(10) %>

                            <span class="jFlowControl1"></span>
                            <% end_control %>
                        </div>


                        <span class="jFlowPrev jFlowPrev1 jFlowPrevRelatedBox"><div></div></span>
                        <span class="jFlowNext jFlowNext1 jFlowNextRelatedBox"><div></div></span>



                    </div>
                    $YoutubeMessage
                </div>
            </div>
            <div id="related-media-box-frame-bottom"><span>&nbsp;</span></div>
        </div>
        <span>&nbsp;</span>

        <% include action_box %>
    </div>
</div>





