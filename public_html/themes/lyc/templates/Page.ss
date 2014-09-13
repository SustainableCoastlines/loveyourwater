<!DOCTYPE html>

<html lang="en">

    <head>

        <% base_tag %>

        <title><% if MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>

        $MetaTags(false)

        <!--lycTODO favicon-->

        <link rel="shortcut icon" href="/favicon.png" />

        <% require themedCSS(fonts) %>

        <!--[if IE 6]>

			<style type="text/css">

			 @import url(themes/lyc/css/ie6.css);

			</style> 

		<![endif]-->








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







<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-19183339-1']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>



    </head>

    <!--[if gte IE 8]>

    <body class="ie8">

    <![endif]-->

    <!--[if !IE]>-->

    <body>

        <!--<![endif]-->

        <div id="header-wrapper">

            <div id="header">

                <div id="header-nav-wrapper">

                    <ul id="header-nav">

                        <li><a href="contact-us" id="contact-us">Contact Us</a> · </li

                        ><li> 

                        <li>

                            <% if CurrentMember %>

                            <a href="my-events/" title="" id="login-link">My events</a> · <a href="Security/logout" title="" id="login-link">Logout</a>

                            <% else %><a href="my-events/" title="Login" id="login-link">Login or Sign up</a>

                            <% end_if %>

                        </li>

						<li>&nbsp; &nbsp; <div id="google_translate_element"></div></li>

                    </ul>



                </div>



                <div class="clear"></div>



                <div id="header-main">



                    <div id="header-logo"><a href="home" title="Go to Home" id="home-link"><SPAN>HOME</SPAN></a></div>



                    <div id="header-updates">

                        <div id="header-updates-header">

                            <h2>LATEST UPDATES</h2>

                        </div>

                        <div id="header-updates-twitterlink">

                            <a href="http://twitter.com/Love_your_Coast">Follow Us</a>



                        </div>

                        <div class="clear"></div>

                        <div id="twitter-box">

                            <div id="twitterSlides">

                                $getLastXTwitterStatus(3)

                            </div>



                            <div id="twitterController">

                                <span class="jFlowControlTwit"></span>

                                <span class="jFlowControlTwit"></span>

                                <span class="jFlowControlTwit"></span>

                            </div>



                            <span class="jFlowPrev jFlowPrevTwit"><div></div></span>

                            <span class="jFlowNext jFlowNextTwit"><div></div></span>



                        </div>

                    </div>



                    <div class="clear"></div>



                </div>

            </div>

        </div>



        <div id="nav-wrapper">

            <div id="nav-menu">

                <ul id="nav">

                    <li><a href="about"<% if InSection(about) %> class="current"<% end_if %>>ABOUT</a></li> <img src="themes/lyc/images/lycbullet.png" style="position:relative;top:5px">                   

                    <li><a href="events"<% if InSection(events) %> class="current"<% end_if %>>EVENTS</a></li>  <img src="themes/lyc/images/lycbullet.png" style="position:relative;top:5px">                 

              <!--UNPUBLISHED 

			<li><a href="whos-in"<% if InSection(whos-in) %> class="current"<% end_if %>>WHO'S IN?</a></li> <img src="themes/lyc/images/lycbullet.png" style="position:relative;top:5px">
		
		-->                  

                    <li><a href="get-involved"<% if InSection(get-involved) %> class="current"<% end_if %>>GET&nbsp;&nbsp;&nbsp;&nbsp;INVOLVED</a></li>  <img src="themes/lyc/images/lycbullet.png" style="position:relative;top:5px">                 

                    <li><a href="learn"<% if InSection(learn) %> class="current"<% end_if %>>LEARN</a></li>  <img src="themes/lyc/images/lycbullet.png" style="position:relative;top:5px">
			
		<!--UNPUBLISHED              


                    <li><a href="news-and-media"<% if InSection(news-and-media) %> class="current"<% end_if %>>NEWS & MEDIA</a></li>  <img src="themes/lyc/images/lycbullet.png" style="position:relative;top:5px">                  

                    <li><a href="sponsors"<% if InSection(sponsors) %> class="current"<% end_if %>>SPONSORS</a></li>   <img src="themes/lyc/images/lycbullet.png" style="position:relative;top:5px">

		-->               

			<li><a href="create"<% if InSection(create) %> class="current"<% end_if %>>CREATE</a></li> 
                </ul>

                <span></span>

                <!--<div class="clear"></div>-->

            </div>

        </div>



        <div id="content-wrapper">

            <div id="content" class="typography<% if URLSegment = home %> home<% end_if %>">$Layout</div>

        </div>



        <div id="footer-wrapper">

            <div id="footer">

                <div id="keysponsors_wrapper">

                    <ul id="keysponsors">

                        <% control KeySponsorsList %>

                        <li><img src="themes/lyc/images/lyc/frame_sponsor_footer.gif"/><a href="$Weblink" class="keysponsor" title="$Name"><% control Image %>$PaddedImage(100,100)<% end_control %><em>$Name</em></a></li>

                        <% end_control %>

                    </ul>

                    <span></span>

                </div>

                <div class="clear"></div>

                <div class="columns">

                    <div class="left-column">

                        <div id="key-collaborators-wrapper">

                            <h2>KEY COLLABORATORS</h2>

                            <p>

                                <% control CollaboratorsList %>

                                <a href="{$Weblink}">$Name</a><% if Last %><% else %> · <% end_if %>

                                <% end_control %>

                        </div>

                    </div>

                    <div class="right-column">

                        <div id="key-contacts-wrapper">

                            <h2>KEY CONTACTS</h2>

                            <ul>

                                <% control KeyContactsList %>

                                <li>$Role · <a href="mailto:$Email">$Email</a></li>

                                <% end_control %>

                            </ul>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>

</html>







