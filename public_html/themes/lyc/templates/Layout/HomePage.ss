<div class="columns">
    <div class="left-column">
        <div id="featurebox">
            <div id="feature-box-container">
                <div id="feature-box-frame-top"><span>&nbsp;</span></div>
                <div id="feature-box-frame-middle">
                    <div id="feature-box-content">
                        <div id="featureSlides">
                            <div id="slide_customfeature">
                                <% control FeatureBoxSlideImage %>
                                <a href="http://www.loveyourcoast.org/create">$CroppedImage(483,223)</a>
                                <% end_control %>
                                <p class="feature-box-caption">$FeatureBoxSlideText</p>

                            </div>                            
<!--
                            <div id="slide_latestnews">
                                <% control getLatestNewsArticles(1) %>
                                <img src="mysite/utils/cropResize.php?src={$getEventPhotoURL}&width=483&height=223" />
                                <p class="feature-box-caption"><b>Latest News:</b>  <a href="$Link" title="$Title">$Title</a></p>
                                <% end_control %>
                            </div>
-->

<% if TopEvents(4) %>
    <div id="slide_latestnews" style="text-align:center">
        <% control TopEvents %>
            <a href="{$Link}" class="events-list-title">
                <% if EventImage %>
                <% control EventImage %>$CroppedImage(220,220)<% end_control %>
                <% else %>
                <img src="themes/lyc/images/lyc/image_placeholder.jpg" width="480" height="220" />
                <% end_if %>
            </a>
        <% end_control %>
    </div>
<% end_if %>


                            <div id="slide_latestflickr">
                                <% control getLatestFlickrPhotos(1) %>
                                <% control PhotoItems %>
                                <a href="http://farm1.static.flickr.com/{$image_path}.jpg" class="fancybox" rel="featurebox" title="$Title">
                                    <span></span>
                                    <img src="mysite/utils/cropResize.php?src=http://farm1.static.flickr.com/{$image_path}.jpg&width=483&height=223" alt="{$title}" />
                                </a>
                                <% end_control %>
                                <% end_control %>
                                <p class="feature-box-caption"><a href="http://www.flickr.com/photos/loveyourcoast/" target="_blank">Love Your Coast on Flickr</a></p>

                            </div>
                            <div id="slide_latestyoutube">
                                <% control getLatestYoutubeVideos(1) %>
                               

                                <a href="http://www.youtube.com/watch?v={$PlayerID}&feature=player_embedded&autoplay=1" class="fancyvideo"  >
                                    <span></span>
                                    <img src="mysite/utils/cropResize.php?src=http://img.youtube.com/vi/{$PlayerID}/0.jpg&width=483&height=223" />
                                    <img src="themes/lyc/images/lyc/play_button.png" style="position: absolute; left: 218px; top: 100px;" />
                                </a>
                                <p class="feature-box-caption"><a href="http://www.youtube.com/user/loveyourcoast/" target="_blank">Love Your Coast on Youtube</a></p>

                               
                                <% end_control %>

                            </div>
                        </div>

                        <div id="featureController">
                            <span class="jFlowControlFeature"></span>
                            <span class="jFlowControlFeature"></span>
                            <span class="jFlowControlFeature"></span>
<% if TopEvents(4) %>
                            <span class="jFlowControlFeature"></span>
<% end_if %>
                        </div>

                        <span class="jFlowPrev jFlowPrevFeature"><div></div></span>
                        <span class="jFlowNext jFlowNextFeature"><div></div></span>
                    </div>
                </div>
                <div id="feature-box-frame-bottom"><span>&nbsp;</span></div>
            </div>
        </div>
        <div class="columns-nested">
            <div class="left-column">
                <div id="events">
                    <h1>EVENTS</h1>
                    <% if TopEvents(4) %>
                    <ul id="top-events-list">
                        <% control TopEvents %>
                        <li>
                            <a href="{$Link}" class="events-list-title">
                                <div class="small_thumb">
                                    <% if EventImage %>
                                    <% control EventImage %>$CroppedImage(50,50)<% end_control %>
                                    <% else %>
                                    <img src="themes/lyc/images/lyc/image_placeholder.jpg" width="50" height="50" />
                                    <% end_if %>
                                </div>
                                <span class="{$colorRotator}">$Title</span>

                            </a>

                        </li>
                        <div class="clear"></div>
                        <% end_control %>
                    </ul>
                    <% end_if %>
                    <div class="little-nav"><a href="events">See all events and create your own</a></div>
                </div>
            </div>

            <div class="right-column">
                <div id="gallery">
                    <h1>PHOTOS</h1>
                    <div id="gallery-thumbs">
                        <% control getLatestFlickrPhotos(4) %>
                        <% control PhotoItems %>
                        <div class=''>
                            <a href="http://farm1.static.flickr.com/{$image_path}.jpg" class="fancybox" rel="featurebox" title="$Title">
                                <span></span>
                                <img src="http://farm1.static.flickr.com/{$image_path}_s.jpg" height="104" width="104" alt="{$title}" />
                            </a>
                        </div>
                        <% end_control %>
                        <% end_control %>
                    </div>
                    <div class="clear"></div>
                    <div class="little-nav"><a href="http://www.flickr.com/photos/loveyourcoast/" target="_blank">See all Love Your Coast photos on Flickr</a></div>
                </div>
            </div>
            <div class="clear"><!-- SPACE --></div>
        </div>

        <% include ad_box %>
    </div>

    <div class="right-column">
        <div id="welcome-box-container">
            <h2><span class="ORANGE">WHAT IS </span><span class="RED">LOVE YOUR COAST?</span></h2>
            <p><% control Page(what-is-love-your-coast) %>$Content.Summary(60) <a href="About" title="About">more</a><% end_control %></p>
        </div>

        <% include facebook_like_box_home %>
        <% include action_box %>
    </div>

</div>
<div class="clear"><!-- SPACE --></div>
