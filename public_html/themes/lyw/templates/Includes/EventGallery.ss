<div class="cleanups-images">
<h2>Event Images:</h2>
<% control getFlickrPhotos(100) %>
        <ul id="event-mini-gallery">
            <% control PhotoItems %>
                <li>
                    <img src="http://farm1.static.flickr.com/{$image_path}_s.jpg" alt="{$title}" />
                    <div class="panel-content">
                        <div style="margin-left: 8px; width:204px;">
                            <a href="http://farm1.static.flickr.com/{$image_path}.jpg" class="fancybox" rel="fancybox" title="{$title}" caption="<a href='{$page_url}'  target='_blank'>View this in Flickr</a>">
                                <span></span>
                                <img src="mysite/utils/cropResize.php?src=http://farm1.static.flickr.com/{$image_path}_m.jpg&width=204&height=153" alt="{$title}" />
                            </a>
                        </div>
                    </div>
                </li>
            <% end_control %>
        </ul>
     <% end_control %>
</div>