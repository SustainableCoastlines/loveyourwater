<?php
$val .= <<<SSVIEWER
<article class="Layout CleanUpsPage">
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
	<section class="SecondaryBlock">

			<div class="col-1">
				<div class="home-intro">
					
SSVIEWER;
$val .=  $item->XML_val("Content",null,true) ;
 $val .= <<<SSVIEWER

				</div>
			</div>

			<div class="col-2">
				<div class="event-filter-form white-box">
					
SSVIEWER;
$val .=  $item->XML_val("EventFilterForm",null,true) ;
 $val .= <<<SSVIEWER

				</div>
			</div>

			<div class="col-4">
				
SSVIEWER;
 if($item->hasValue("Events")) {  ;
 $val .= <<<SSVIEWER

					
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Events")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

						<div class="event-item margin-right">
							<div class="home-feature event white-box">
								<div class="image">
									
SSVIEWER;
 if($item->hasValue("EventMainImage")) {  ;
 $val .= <<<SSVIEWER

										<a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventMainImage")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("220","145"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER
</a>
									
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

										<a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventCommunityBadge")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("220","145"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER
</a>
									
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

								</div>
								<div class="event-info">
									
SSVIEWER;
 if($item->hasValue("FromDate")) {  ;
 $val .= <<<SSVIEWER

										<div class="event-date">
											<p class="day">
SSVIEWER;
$val .=  $item->obj("FromDate")->XML_val("Format",array("d"),true) ;
 $val .= <<<SSVIEWER
</p>
											<p class="month">
SSVIEWER;
$val .=  $item->obj("FromDate")->XML_val("Format",array("M"),true) ;
 $val .= <<<SSVIEWER
 <span>
SSVIEWER;
$val .=  $item->obj("FromDate")->XML_val("Format",array("y"),true) ;
 $val .= <<<SSVIEWER
<span></p>
										</div>
									
SSVIEWER;
 } else if($item->hasValue("Date")) {  ;
 $val .= <<<SSVIEWER

										<div class="event-date">
											<p class="day">
SSVIEWER;
$val .=  $item->obj("Date")->XML_val("Format",array("d"),true) ;
 $val .= <<<SSVIEWER
</p>
											<p class="month">
SSVIEWER;
$val .=  $item->obj("Date")->XML_val("Format",array("M"),true) ;
 $val .= <<<SSVIEWER
 <span>
SSVIEWER;
$val .=  $item->obj("Date")->XML_val("Format",array("y"),true) ;
 $val .= <<<SSVIEWER
<span></p>
										</div>
									
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

										<div class="event-date">
											<p class="day">NA</p>
											<p class="month">no date</p>
										</div>
									
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

									<div class="event-details">
										<a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
"><h2>
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</h2></a>
										
SSVIEWER;
 if($item->hasValue("Organisation")) {  ;
 $val .= <<<SSVIEWER
<span>
SSVIEWER;
$val .=  $item->XML_val("Organisation",null,true) ;
 $val .= <<<SSVIEWER
</span>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

										<div class="clear"></div>
									</div>
								</div>
							</div>
						</div>
					
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

				
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

					<div id="PageNumbers"><span class="title">Sorry no upcoming results, <a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("CreateLink",null,true) ;
 $val .= <<<SSVIEWER
">create one here</a></span></div>
				
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

			</div>
	</section>
	<section class="PrimaryBlock">
		<div class="home">
			<div class="col-wrap">
				<!-- left col -->

				<!-- right col -->
				<div class="col-2 no-margin">
					<!-- google map -->
					<div class="google-map white-box">
						
SSVIEWER;
$val .=  $item->XML_val("googleMapEventsLarge",null,true) ;
 $val .= <<<SSVIEWER

					</div>
					<!-- past events -->
					<div class="past-events white-box">
						<h4>Past events</h4>
						<div class="recent">
							
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("RecentEvents")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

								<div class="recent-event-item">
									<div class="image">
										
SSVIEWER;
 if($item->hasValue("EventMainImage")) {  ;
 $val .= <<<SSVIEWER

											<a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventMainImage")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("65","65"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER
</a>
										
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

											<a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventCommunityBadge")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("65","65"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER
</a>
										
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

									</div>
									<div class="recent-event-info">
										<a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
"><h2>
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</h2></a>
										
SSVIEWER;
 if($item->hasValue("Organisation")) {  ;
 $val .= <<<SSVIEWER
<span>
SSVIEWER;
$val .=  $item->XML_val("Organisation",null,true) ;
 $val .= <<<SSVIEWER
</span>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

										
SSVIEWER;
 if($item->hasValue("FromDate")) {  ;
 $val .= <<<SSVIEWER

											<p>
SSVIEWER;
$val .=  $item->obj("FromDate",null,true)->XML_val("Nice",null,true) ;
 $val .= <<<SSVIEWER
</p>
										
SSVIEWER;
 } else if($item->hasValue("Date")) {  ;
 $val .= <<<SSVIEWER

											<p>
SSVIEWER;
$val .=  $item->obj("Date",null,true)->XML_val("Nice",null,true) ;
 $val .= <<<SSVIEWER
</p>
										
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

											<p>NA</p>
										
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

										<div class="clear"></div>
									</div>
								</div>
							
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

							<a href="
SSVIEWER;
$val .=  $item->XML_val("URLSegment",null,true) ;
 $val .= <<<SSVIEWER
?recent=100" class="see-more">See more recent events</a>
						</div>
					</div>
				</div><!-- end .col-2 -->
			</div><!-- end .col-wrap -->
		</div><!-- end .home -->
	</section>
</article>
SSVIEWER;
