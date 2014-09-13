<!DOCTYPE html>
<html lang="en">

<head>
<% base_tag %>

<title><% if MetaTitle %>$MetaTitle<% else %>$Title<% end_if %>&raquo; $SiteConfig.Title</title>

$MetaTags(false) 

<% if SiteConfig.AddFacebookData %>
    <% include FacebookTags %>
<% end_if %>

<link rel="shortcut icon" href="/favicon.png" />

<% require themedCSS(form) %>

<style type="text/css">  
<!--
/*.goog-te-gadget {background:#000000; color:#000000;z-index:1; position:relative}*/
.goog-te-menu-value {color:#666 !important; font-weight: normal !important; }
.goog-te-gadget-simple {background-color: transparent !important;border: none !important;}
.goog-te-gadget-simple>span {border:1px solid;border-color:#9B9B9B #D5D5D5 #E8E8E8;background:#FFF; padding:1px !important}
-->
</style>

 <!-- Google -->
<% if SiteConfig.GoogleVerificationCode %><meta name="google-site-verification" content="{$SiteConfig.GoogleVerificationCode}" /><% end_if %>
<!-- analytics tracking script-->
<% if SiteConfig.GoogleAnalyticsCode %>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '{$SiteConfig.GoogleAnalyticsCode}']);
        _gaq.push(['_trackPageview']);
        (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
<% end_if %>
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

<header>
	<% include Header %>
</header>
<div role="main" class="wrapper">
    <% include PageTop %>
    <div class="clear"></div>
    <div class="page-content">
    	$Layout
    </div>
</div>
<footer>
    <% include Footer %>
</footer>
    
</body>
</html>
