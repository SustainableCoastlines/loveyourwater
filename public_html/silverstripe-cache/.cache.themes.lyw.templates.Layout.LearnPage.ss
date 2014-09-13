<?php
$val .= <<<SSVIEWER
<article class="Layout LearnPage">
	<section class="Social">
	<div id="page-share">
		
SSVIEWER;
 if($item->hasValue("InSection",array("my-events"))) {  ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

		<div class="fb-like">
<iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2F
SSVIEWER;
$val .=  $item->XML_val("BaseHref",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("URLSegment",null,true) ;
 $val .= <<<SSVIEWER
&amp;send=false&amp;layout=button_count&amp;width=550&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=21&amp;appId=361138347272876" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
</div>
		<div class="tweet-count">
<a href="https://twitter.com/share" class="twitter-share-button" data-via="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("TwitterAtAccount",null,true) ;
 $val .= <<<SSVIEWER
">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>



		<div class="google-plus" style="width:60px;">
<!-- Place this tag where you want the +1 button to render. -->
<div class="g-plusone" data-size="medium" style="width:60px;"></div>
<!-- Place this tag after the last +1 button tag. -->
<script type="text/javascript">
  window.___gcfg = {lang: 'en-GB'};

  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
</div>
		
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

		<div id="google_translate_element"></div>
	</div>
</section>
	<section class="TopBlock">
		<div class="LeftPart">
			
SSVIEWER;
$val .=  $item->XML_val("Content",null,true) ;
 $val .= <<<SSVIEWER

		</div>
		<div class="RightPart">
			<div class="RightWrapper">
				<div class="VideoRow">
					<div class="FitVidWrapper">
						
SSVIEWER;
 if($item->hasValue("YoutubeLinkHTTP")) {  ;
 $val .= <<<SSVIEWER

							<iframe width="450" height="250" src="http://www.youtube.com/embed/
SSVIEWER;
$val .=  $item->XML_val("getLearnPageYoutubeID",null,true) ;
 $val .= <<<SSVIEWER
" frameborder="0" allowfullscreen></iframe>
						
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

							<iframe width="450" height="250" src="http://www.youtube.com/embed/7yGq2ba3NhQ" frameborder="0" allowfullscreen></iframe>
						
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

					</div>
				</div>
				<div class="MessageRow">
					
SSVIEWER;
$val .=  $item->XML_val("VideoDescription",null,true) ;
 $val .= <<<SSVIEWER

				</div>
				<div class="ActionRow">
					<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/presenter_small_logo.png">
					<div class="ActionText">
						Arrange a Love your Coast presentation
					</div>
					<div class="btn learnpage">
						<a class="form-btn" href="my-events/">Find a presenter</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="SecondaryBlock">
		<div class="left-column">
			<div class="learn-downloads">
				<div class="ColumnHeader">
					Useful documents
				</div>
				
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("LearnDownloads")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

  
SSVIEWER;
 if($item->hasValue("Download")) {  ;
 $val .= <<<SSVIEWER
<div class="downloads">
          
SSVIEWER;
 if($item->hasValue("FileURL")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->XML_val("FileURL",null,true) ;
 $val .= <<<SSVIEWER
" target="_blank">
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("Attachment",null,true)->XML_val("URL",null,true) ;
 $val .= <<<SSVIEWER
" target="_blank">
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                <div class="downloads-img" >
                    
SSVIEWER;
 if($item->hasValue("DownloadThumbImage")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->obj("DownloadThumbImage")->XML_val("CroppedImage",array("215", "125"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/fileicons/display_
SSVIEWER;
$val .=  $item->XML_val("FileType",null,true) ;
 $val .= <<<SSVIEWER
.jpg" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                </div><!--.downloads-img ends-->
                  <div class="icon-text">
                      
SSVIEWER;
 if($item->XML_val("FileType",null,true) == "none") {  ;
 $val .= <<<SSVIEWER
                                       
                          <p class="full-desc">
SSVIEWER;
$val .=  $item->obj("Description")->XML_val("Summary",array("15"),true) ;
 $val .= <<<SSVIEWER
</p>
                      
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

						  <div class="Row">
							  <div class="icon 
SSVIEWER;
$val .=  $item->XML_val("FileType",null,true) ;
 $val .= <<<SSVIEWER
">
									<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/fileicons/icon_
SSVIEWER;
$val .=  $item->XML_val("FileType",null,true) ;
 $val .= <<<SSVIEWER
.jpg" />
							  </div><!--.icon ends-->
							  <div class="item-title">
							  	<h4>
SSVIEWER;
$val .=  $item->obj("Title")->XML_val("LimitWordCount",array("5"),true) ;
 $val .= <<<SSVIEWER
</h4>
							  </div>
						  </div>
                          <p class="Description">
SSVIEWER;
$val .=  $item->obj("Description")->XML_val("Summary",array("15"),true) ;
 $val .= <<<SSVIEWER
</p>
                      
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                  </div> <!--.icon-text ends-->
           </a>
       <div class="clear"></div>
   </div><!--.downloads ends-->
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

		   </div><!--learn-downloads ends-->
		</div><!--.left-column ends-->
	</section>
	<section class="PrimaryBlock">
		<div class="right-column">
			<div class="ColumnHeader">
				Useful videos
			</div>
			
SSVIEWER;
 if($item->hasValue("YoutubeLinks")) {  ;
 $val .= <<<SSVIEWER

				
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("YoutubeLinks")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

					<div class="youtube-embed white-box">
						<div class="FitVidWrapper">
							<iframe width="450" height="260" src="http://www.youtube.com/embed/
SSVIEWER;
$val .=  $item->XML_val("getYoutubeID",null,true) ;
 $val .= <<<SSVIEWER
" frameborder="0" allowfullscreen></iframe>
						</div>
						<div class="item-title">
							<h4>
SSVIEWER;
$val .=  $item->XML_val("YoutubeTitle",null,true) ;
 $val .= <<<SSVIEWER
</h4>
						</div>
						<p>
SSVIEWER;
$val .=  $item->obj("YoutubeDescription")->XML_val("Summary",array("15"),true) ;
 $val .= <<<SSVIEWER
</p>
					</div>
				
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

		</div>
	</section>
	</div><!--.columns-wrapper ends-->
</article>
SSVIEWER;
