<?php
$val .= <<<SSVIEWER
<article class="Layout Home">
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
		<div class="TextIntro">
			<p>Help to keep beaches rubbish-free, the way they should be.</p>
			<p>Use this website to...</p>
		</div>
		<ul>
			<li>
				<a href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#">
					<div class="Icon Learn"></div>
					<div class="Text">Learn more about the issue</div>
				</a>
			</li>
			<li>
				<a href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#">
					<div class="Icon Find"></div>
					<div class="Text">Find events and trained presenters</div>
				</a>
			</li>
			<li>
				<a href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#">
					<div class="Icon Create"></div>
					<div class="Text">Create your own event</div>
				</a>
			</li>
			<li>
				<a href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#">
					<div class="Icon Share"></div>
					<div class="Text">Share your results</div>
				</a>
			</li>
		</ul>
	</section>
	<section class="PrimaryBlock">
		<div class="MapSection">
			<div class="SearchSection">
				
SSVIEWER;
$val .=  $item->XML_val("HomeSearchForm",null,true) ;
 $val .= <<<SSVIEWER

			</div>
			<div id="GoogleMapBigSection">
				<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/map2.png">
			</div>
		</div>
		<ul class="SearchResults">
			<li>
				<a href="">
					<div class="ImageBlock">
						<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/image_sample01.jpg">
					</div>
					<div class="ResultDetail">
						<div class="ResultDate">
							<div>28</div>
							<div>Sep 2014</div>
						</div>
						<div class="ResultDescription">
							Love your Coast Wellington Clean-up
						</div>
					</div>
					<div class="AccountName">
						<div class="PersonIcon"></div>
						<div class="PersonText">Davis Dimalen Foundation</div>
					</div>
				</a>
			</li>
			<li>
				<a href="">
					<div class="ImageBlock">
						<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/image_sample02.jpg">
					</div>
					<div class="ResultDetail">
						<div class="ResultDate">
							<div>28</div>
							<div>Sep 2014</div>
						</div>
						<div class="ResultDescription">
							Love your Coast Wellington Clean-up
						</div>
					</div>
					<div class="AccountName">
						<div class="PersonIcon"></div>
						<div class="PersonText">Isaac's cool group</div>
					</div>
				</a>
			</li>
			<li>
				<a href="">
					<div class="ImageBlock">
						<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/image_sample01.jpg">
					</div>
					<div class="ResultDetail">
						<div class="ResultDate">
							<div>28</div>
							<div>Sep 2014</div>
						</div>
						<div class="ResultDescription">
							Love your Coast Wellington Clean-up
						</div>
					</div>
					<div class="AccountName">
						<div class="PersonIcon"></div>
						<div class="PersonText">Edith's Foundation</div>
					</div>
				</a>
			</li>
			<li>
				<a href="">
					<div class="ImageBlock">
						<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/image_sample02.jpg">
					</div>
					<div class="ResultDetail">
						<div class="ResultDate">
							<div>28</div>
							<div>Sep 2014</div>
						</div>
						<div class="ResultDescription">
							Love your Coast Wellington Clean-up
						</div>
					</div>
					<div class="AccountName">
						<div class="PersonIcon"></div>
						<div class="PersonText">Sustainable Coastlines</div>
					</div>
				</a>
			</li>
		</ul>
	</section>
</article>
SSVIEWER;
