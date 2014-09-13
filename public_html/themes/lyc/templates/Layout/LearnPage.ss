<div class="columns">
    <div class="left-column">
        <div id="learn-content-container">
            <h2 class="DARK_BLUE">Awesome Resources</h2>
            <div class="columns2">
                <div class="left-column learnDownloadList">
                    $DownloadsMessage
                    <ul>
                        <% control LearnDownloads %>
                        <li>
                            <a href="$Attachment.URL">
                                <div class="small_thumb"><% control Photo %>$CroppedImage(50,50)<% end_control %></div>
                                <h4>$Title</h4>
                                <p>$Description.Summary(15)</p>
                            </a>
                        </li>
                        <% end_control %>
                    </ul>

                </div>
                <div class="right-column learnLinksList">
                    $LinksMessage

                    <ul>
                        <% control LearnLinks %>
                        <li>
                            <a href="$Link" target="_blank">
                                <div class="small_thumb"><% control Photo %>$CroppedImage(50,50)<% end_control %></div>
                                <h4>$Title</h4>
                                <p>$Description.Summary(15)</p>
                            </a>
                        </li>
                        <% end_control %>
                    </ul>


                </div>
            </div>
        </div>
    </div>
    <div class="right-column">
        <% include facebook_like_box %>
        <% include action_box %>
    </div>
</div>







