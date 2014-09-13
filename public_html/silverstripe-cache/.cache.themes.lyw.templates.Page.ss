<?php
$val .= <<<SSVIEWER
<!DOCTYPE html>
<html lang="en">

<head>

SSVIEWER;
$val .=  SSViewer::get_base_tag($val); ;
 $val .= <<<SSVIEWER


<title>
SSVIEWER;
 if($item->hasValue("MetaTitle")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("MetaTitle",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
&raquo; 
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</title>


SSVIEWER;
$val .=  $item->XML_val("MetaTags",array("false"),true) ;
 $val .= <<<SSVIEWER

	<meta charset="utf-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">  -->

SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("AddFacebookData")) {  ;
 $val .= <<<SSVIEWER

    
<!-- OPEN GRAPH META TAGS FOR FACEBOOK -->
<meta property="og:site_name" content="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
" />
<meta property="og:url" content="
SSVIEWER;
$val .=  $item->XML_val("BaseHref",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("URLSegment",null,true) ;
 $val .= <<<SSVIEWER
" />
<meta property="fb:admins" content="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FBAdmin",null,true) ;
 $val .= <<<SSVIEWER
" />

SSVIEWER;
 if($item->hasValue("OGType")) {  ;
 $val .= <<<SSVIEWER
<meta property="og:type" content="
SSVIEWER;
$val .=  $item->XML_val("OGType",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<meta property="og:type" content="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("OGType",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

<!-- SET ON PAGE -->

SSVIEWER;
 if($item->hasValue("OGTitle")) {  ;
 $val .= <<<SSVIEWER
<meta property="og:title" content="
SSVIEWER;
$val .=  $item->XML_val("OGTitle",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<meta property="og:title" content="
SSVIEWER;
$val .=  $item->XML_val("MetaTitle",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 

SSVIEWER;
 if($item->hasValue("OGDescription")) {  ;
 $val .= <<<SSVIEWER
<meta property="og:description" content="
SSVIEWER;
$val .=  $item->XML_val("OGDescription",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<meta property="og:type" content="
SSVIEWER;
$val .=  $item->XML_val("MetaDescription",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 

SSVIEWER;
 if($item->hasValue("OGImage")) {  ;
 $val .= <<<SSVIEWER
<meta property="og:image" content="
SSVIEWER;
$val .=  $item->obj("OGImage",null,true)->XML_val("URL",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<meta property="og:image" content="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->obj("OGImage",null,true)->XML_val("URL",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 


SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


<link rel="shortcut icon" href="/favicon.png" />


SSVIEWER;
 Requirements::themedCSS("form"); ;
 $val .= <<<SSVIEWER


<style type="text/css">  
<!--
/*.goog-te-gadget {background:#000000; color:#000000;z-index:1; position:relative}*/
.goog-te-menu-value {color:#666 !important; font-weight: normal !important; }
.goog-te-gadget-simple {background-color: transparent !important;border: none !important;}
.goog-te-gadget-simple>span {border:1px solid;border-color:#9B9B9B #D5D5D5 #E8E8E8;background:#FFF; padding:1px !important}
-->
</style>

 <!-- Google -->

SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("GoogleVerificationCode")) {  ;
 $val .= <<<SSVIEWER
<meta name="google-site-verification" content="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("GoogleVerificationCode",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

<!-- analytics tracking script-->

SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("GoogleAnalyticsCode")) {  ;
 $val .= <<<SSVIEWER

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("GoogleAnalyticsCode",null,true) ;
 $val .= <<<SSVIEWER
']);
        _gaq.push(['_trackPageview']);
        (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

<!-- GOOGLE TRANSLATE -->

<script>
(function(){var d=window,e=document;function f(b){var a=e.getElementsByTagName("head")[0];a||(a=e.body.parentNode.appendChild(e.createElement("head")));a.appendChild(b)}function _loadJs(b){var a=e.createElement("script");a.type="text/javascript";a.charset="UTF-8";a.src=b;f(a)}function _loadCss(b){var a=e.createElement("link");a.type="text/css";a.rel="stylesheet";a.charset="UTF-8";a.href=b;f(a)}function _isNS(b){b=b.split(".");for(var a=d,c=0;c<b.length;++c)if(!(a=a[b[c]]))return false;return true}
function _setupNS(b){b=b.split(".");for(var a=d,c=0;c<b.length;++c)a=a[b[c]]||(a[b[c]]={});return a}d.addEventListener&&typeof e.readyState=="undefined"&&d.addEventListener("DOMContentLoaded",function(){e.readyState="complete"},false);
if (_isNS('google.translate.Element')){return}var c=_setupNS('google.translate._const');c._cl='en';c._cuc='googleTranslateElementInit';c._cac='';c._cam='';var h='translate.googleapis.com';var b=(window.location.protocol=='https:'?'https://':'http://')+h;c._pah=h;c._pbi=b+'/translate_static/img/te_banner_bk.gif';c._pci=b+'/translate_static/img/te_ctrl3.gif';c._phf=h+'/translate_static/js/element/hrs.swf';c._pli=b+'/translate_static/img/loading.gif';c._plla=h+'/translate_a/l';c._pmi=b+'/translate_static/img/mini_google.png';c._ps=b+'/translate_static/css/translateelement.css';c._puh='translate.google.com';_loadCss(c._ps);_loadJs(b+'/translate_static/js/element/main.js');})();
function googleTranslateElementInit() {

  new google.translate.TranslateElement({

    pageLanguage: 'en',

    layout: google.translate.TranslateElement.InlineLayout.SIMPLE

  }, 'google_translate_element');

}

</script>

</head>

	<body>

		<header id="MainHeader">
	<div id="header">
		<div id="header-top">
			<div class="MobileLogo">
				<a href="
SSVIEWER;
$val .=  $item->XML_val("BaseHref",null,true) ;
 $val .= <<<SSVIEWER
" id="lyc" class="lyc-logo" name="top">
					<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/lyclogo.png">
				</a>
			</div>
			<button id="TouchMenu">Menu</button>
			<div class="MobileMenu">
				<nav class="MenuList">
					<ul>
						<li class="MenuItem
SSVIEWER;
 if($item->hasValue("inSection",array("learn"))) {  ;
 $val .= <<<SSVIEWER
 current
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
"><a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("LearnLink",null,true) ;
 $val .= <<<SSVIEWER
">Learn</a></li>
						<li class="MenuItem
SSVIEWER;
 if($item->hasValue("inSection",array("Events"))) {  ;
 $val .= <<<SSVIEWER
 current
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
"><a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FindLink",null,true) ;
 $val .= <<<SSVIEWER
">Find</a></li>
						<li class="MenuItem
SSVIEWER;
 if($item->hasValue("inSection",array("create"))) {  ;
 $val .= <<<SSVIEWER
 current
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
"><a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("CreateLink",null,true) ;
 $val .= <<<SSVIEWER
">Create</a></li>
						<li class="MenuItem
SSVIEWER;
 if($item->hasValue("inSection",array("share"))) {  ;
 $val .= <<<SSVIEWER
 current
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
"><a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("ShareLink",null,true) ;
 $val .= <<<SSVIEWER
">Share</a></li>
						<li class="MenuItem
SSVIEWER;
 if($item->hasValue("inSection",array("about"))) {  ;
 $val .= <<<SSVIEWER
 current
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
"><a href="about/">About Us</a></li>
						<li class="MenuItem
SSVIEWER;
 if($item->hasValue("inSection",array("contact"))) {  ;
 $val .= <<<SSVIEWER
 current
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
"><a href="contact-us/">Contact Us</a></li>
						<li class="MenuItem
SSVIEWER;
 if($item->hasValue("inSection",array("about"))) {  ;
 $val .= <<<SSVIEWER
 current
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
"><a href="my-events/">Login or Sign-up</a></li>
					</ul>
				</nav>
			</div>
			<div class="header-top-inner">
				<!--< % include TwitterFollowAll % >-->
				<div class="twitter-follow">
				<a href="https://twitter.com/Love_your_Coast" class="twitter-follow-button" data-show-count="false" data-show-screen-name="false">Follow @Love_your_Coast</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
				</div>
				<div class="fb-like">
    <iframe src="//www.facebook.com/plugins/like.php?href=
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FacebookLink",null,true) ;
 $val .= <<<SSVIEWER
&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=verdana&amp;height=21&amp;appId=361138347272876" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:21px;" allowTransparency="true"></iframe>
</div>
				<div id="site-charts">
	<div class="events">
		<div class="total">
SSVIEWER;
$val .=  $item->XML_val("EventsTotal",null,true) ;
 $val .= <<<SSVIEWER
</div>
		<span>Event</span>
	</div>
	<div class="participants">
        <div class="total">
SSVIEWER;
$val .=  $item->XML_val("ParticipantsTotal",null,true) ;
 $val .= <<<SSVIEWER
</div>
		<span>Event participants</span>
    </div>
    <div class="rubbish">
        <div class="total">
SSVIEWER;
$val .=  $item->XML_val("RubbishTotal",null,true) ;
 $val .= <<<SSVIEWER
</div>
		<span>Sacks of rubbish</span>
    </div>
</div>
			</div>
		</div>
		<div id="header-main">
			<div class="header-main-inner">
				<div class="Gapper">
					<a href="
SSVIEWER;
$val .=  $item->XML_val("BaseHref",null,true) ;
 $val .= <<<SSVIEWER
" id="lyc" class="lyc-logo" name="top">
						<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/lyclogo.png">
					</a>
				</div>
				<ul id="top-nav">
					
SSVIEWER;
 if($item->hasValue("inSection",array("learn"))) {  ;
 $val .= <<<SSVIEWER
<li class="current">
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<li>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("LearnLink",null,true) ;
 $val .= <<<SSVIEWER
"><div>Learn</div><div class="description">about the issue</div></a></li>
					
SSVIEWER;
 if($item->hasValue("inSection",array("Events"))) {  ;
 $val .= <<<SSVIEWER
<li class="current">
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<li>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FindLink",null,true) ;
 $val .= <<<SSVIEWER
"><div>Find</div><div class="description">a clean-up event</div></a></li>
					
SSVIEWER;
 if($item->hasValue("inSection",array("create"))) {  ;
 $val .= <<<SSVIEWER
<li class="current">
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<li>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("CreateLink",null,true) ;
 $val .= <<<SSVIEWER
"><div>Create</div><div class="description">your own event</div></a></li>
					
SSVIEWER;
 if($item->hasValue("inSection",array("share"))) {  ;
 $val .= <<<SSVIEWER
<li class="current last">
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<li class="last">
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("ShareLink",null,true) ;
 $val .= <<<SSVIEWER
"><div>Share</div><div class="description">your results</div></a></li>
				</ul>
				<ul id="admin-nav">
					
SSVIEWER;
 if($item->hasValue("CurrentMember")) {  ;
 $val .= <<<SSVIEWER

						<li class="ProfileImage">
							
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("CurrentMember")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

								<div class="ProfilePhoto" 
SSVIEWER;
 if($item->hasValue("ProfileImage")) {  ;
 $val .= <<<SSVIEWER
style="background-image: url('{
SSVIEWER;
$val .=  $item->obj("ProfileImage")->XML_val("CroppedImage",array("62", "62"),true) ;
 $val .= <<<SSVIEWER
.URL}');"
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
>
									ProfilePic
								</div>
							
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

						</li>
					
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

					
SSVIEWER;
 if($item->hasValue("CurrentMember")) {  ;
 $val .= <<<SSVIEWER

					
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

						<li><a href="my-events/">Login or Sign-up</a></li>
					
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

					
SSVIEWER;
 if($item->hasValue("CurrentMember")) {  ;
 $val .= <<<SSVIEWER

						<li class="ProfileName">
							
SSVIEWER;
$val .=  $item->obj("CurrentMember",null,true)->XML_val("FirstName",null,true) ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->obj("CurrentMember",null,true)->XML_val("Surname",null,true) ;
 $val .= <<<SSVIEWER

						</li>
					
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

				</ul>
			</div>
		</div>
	</div>
	<section class="UserStatsSection">
	<div class="ProfileStats">
		<div class="InnerContent">
			<div class="Group01">
				<div class="Presentations">
					<div class="total">8</div>
					<span>Presentations</span>
				</div>
				<div class="Attendees">
					<div class="total">1,500</div>
					<span>Attendees</span>
				</div>
			</div>
			<div class="Group02">
				<div class="Created">
					<div class="total">12</div>
					<span>Events created</span>
				</div>
				<div class="Participants">
					<div class="total">1,300</div>
					<span>Event participants</span>
				</div>
				<div class="Rubish">
					<div class="total">1,500</div>
					<span>Event participants</span>
				</div>
			</div>
			<div class="Group03">
				<div class="Joined">
					<div class="total">8</div>
					<span>Events joined</span>
				</div>
				<div class="ProfileThumb">
					
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("CurrentMember")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

						
SSVIEWER;
 if($item->hasValue("ProfileImage")) {  ;
 $val .= <<<SSVIEWER

							
SSVIEWER;
$val .=  $item->obj("ProfileImage")->XML_val("SetWidth",array("119"),true) ;
 $val .= <<<SSVIEWER

						
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

							<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/profile-thumb.png">
						
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

					
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

				</div>
			</div>
		</div>
	</div>

	<div class="UserMenu">
		<div class="InnerContent">
			<div class="LeftSide">
				<div class="PresenterLogo"><img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/images/presenter-logo.png"></div>
				<div class="PresenterDescription"><p>Trained presenter since 14 May 2014</p></div>
			</div>
			<div class="RightSide">
				<ul>
					<li><a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MyEventsLink",null,true) ;
 $val .= <<<SSVIEWER
" class="C_groupsMenuItem">
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MyEventsTitle",null,true) ;
 $val .= <<<SSVIEWER
</a></li>
					<li><a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MyResultsLink",null,true) ;
 $val .= <<<SSVIEWER
" class="C_groupsMenuItem">
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MyResultsTitle",null,true) ;
 $val .= <<<SSVIEWER
</a></li>
					<li><a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MyAccountLink",null,true) ;
 $val .= <<<SSVIEWER
" class="C_groupsMenuItem">
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MyAccountTitle",null,true) ;
 $val .= <<<SSVIEWER
</a></li>
					<li><a href="Security/logout/" class="C_groupsMenuItem">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
</section>
</header>

		
SSVIEWER;
$val .=  $item->XML_val("Layout",null,true) ;
 $val .= <<<SSVIEWER


		<footer id="MainFooter">
	<div id="footer">

		<div class="footer-mask-one">
			<div id="InstaGramMessageHolder">
				<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/instagram-icon_s1.png"><span>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterSocialMediaMessage",null,true) ;
 $val .= <<<SSVIEWER
</span>
			</div>
		</div>

		<div id="InstaGramCarouselHolder">
			<div class="customNavigation">
				<a class="btn prev"><img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/left-arrow.png"></a>
			</div>
			<div class="SmallerFit">
				<div id="owl-demo" class="owl-carousel owl-theme">
					
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("GetInstramPhotos")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

						<div class="item"><img src="
SSVIEWER;
$val .=  $item->XML_val("ImageURL",null,true) ;
 $val .= <<<SSVIEWER
"></div>
					
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

				</div>
			</div>
			<div class="customNavigation">
				<a class="btn next"><img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/right-arrow.png"></a>
			</div>
		</div>

		<div id="footer-top">
			<div class="footer-inner">
				<div class="col1">
					<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterFAQLink",null,true) ;
 $val .= <<<SSVIEWER
" class="faq">Frequently asked questions</a>
				</div>
				<div class="col2">
					<div class="connect">
						<!-- REQUIRE CSS -->

SSVIEWER;
 Requirements::themedCSS("social"); ;
 $val .= <<<SSVIEWER



SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("GooglePlusLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("GooglePlusLink",null,true) ;
 $val .= <<<SSVIEWER
" class="googleplus" target="_blank"><img src="social/social-packs/googleplus_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="googleplus" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("PinterestLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("PinterestLink",null,true) ;
 $val .= <<<SSVIEWER
" class="pinterest" target="_blank"><img src="social/social-packs/pinterest_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="pinterest" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("StumbleUponLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("StumbleUponLink",null,true) ;
 $val .= <<<SSVIEWER
" class="stumbleupon" target="_blank"><img src="social/social-packs/stumbleupon_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="stumbleupon" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("DiggLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("DiggLink",null,true) ;
 $val .= <<<SSVIEWER
" class="digg" target="_blank"><img src="social/social-packs/digg_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="digg" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("VimeoLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("VimeoLink",null,true) ;
 $val .= <<<SSVIEWER
" class="vimeo" target="_blank"><img src="social/social-packs/vimeo_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="vimeo" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("YouTubeLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("YouTubeLink",null,true) ;
 $val .= <<<SSVIEWER
" class="youtube" target="_blank"><img src="social/social-packs/youtube_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="youtube" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("LinkedInLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("LinkedInLink",null,true) ;
 $val .= <<<SSVIEWER
" class="linkedin" target="_blank"><img src="social/social-packs/linkedin_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="linkedin" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("FlickrLink")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FlickrLink",null,true) ;
 $val .= <<<SSVIEWER
" class="flickr" target="_blank"><img src="social/social-packs/flickr_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="flickr" /></a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


<!-- OPTION TO USE TWITTERS FOLLOW LINK -->


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("TwitterLink")) {  ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("UseFollowAll")) {  ;
 $val .= <<<SSVIEWER

        <div class="twitter-follow">
<a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("TwitterLink",null,true) ;
 $val .= <<<SSVIEWER
" class="twitter-follow-button" data-show-count="false">Follow @twitter</a>
<script>
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script></div>
    
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

        <a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("TwitterLink",null,true) ;
 $val .= <<<SSVIEWER
" class="twitter" target="_blank"><img src="social/social-packs/twitter_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="twitter" /></a>
    
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


<!-- OPTION TO REPLACE WITH A FACEBOOK LIKE LINK -->


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("FacebookLink")) {  ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("UseLikeAll")) {  ;
 $val .= <<<SSVIEWER

        <div class="fb-like">
    <iframe src="//www.facebook.com/plugins/like.php?href=
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FacebookLink",null,true) ;
 $val .= <<<SSVIEWER
&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=verdana&amp;height=21&amp;appId=361138347272876" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:21px;" allowTransparency="true"></iframe>
</div>
    
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

        <a href="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FacebookLink",null,true) ;
 $val .= <<<SSVIEWER
" class="facebook" target="_blank"><img src="social/social-packs/facebook_
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("IconSetNo",null,true) ;
 $val .= <<<SSVIEWER
.png" alt="facebook" /></a>
    
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


						<div class="footer-links">
							<ul>
								<li><a href="about/">About</a></li>
								<li><a href="contact-us/">Contact</a></li>
							</ul>
						</div>
					</div>
					<a class="top" href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#top">Back<br /><span>to top</span></a>
				</div>
			</div>
		</div>
		<div id="footer-bottom">
			<div class="footer-inner">
				<div class="footer-col">
					<h4>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterCol1title",null,true) ;
 $val .= <<<SSVIEWER
</h4>
					
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterCol1content",null,true) ;
 $val .= <<<SSVIEWER

				</div>
				<div class="footer-col">
					<h4>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterCol2title",null,true) ;
 $val .= <<<SSVIEWER
</h4>
					
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterCol2content",null,true) ;
 $val .= <<<SSVIEWER

				</div>
				<div class="footer-col last">
					<h4>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterCol3title",null,true) ;
 $val .= <<<SSVIEWER
</h4>
					
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("FooterCol3content",null,true) ;
 $val .= <<<SSVIEWER

				</div>
				 <div class="col-full-width">
					<p class="left help"><span>Still need a hand? Email <a href="mailto:
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("HelpEmail",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("HelpEmail",null,true) ;
 $val .= <<<SSVIEWER
</a></span></p>
					<a class="right" href="
SSVIEWER;
$val .=  $item->XML_val("BaseHref",null,true) ;
 $val .= <<<SSVIEWER
"><img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/lyclogo-small.png" /></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</footer>

	</body>
</html>

SSVIEWER;
