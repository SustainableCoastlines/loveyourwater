// JavaScript Document
(function(){var d=window,e=document;function f(b){var a=e.getElementsByTagName("head")[0];a||(a=e.body.parentNode.appendChild(e.createElement("head")));a.appendChild(b)}function _loadJs(b){var a=e.createElement("script");a.type="text/javascript";a.charset="UTF-8";a.src=b;f(a)}function _loadCss(b){var a=e.createElement("link");a.type="text/css";a.rel="stylesheet";a.charset="UTF-8";a.href=b;f(a)}function _isNS(b){b=b.split(".");for(var a=d,c=0;c<b.length;++c)if(!(a=a[b[c]]))return false;return true}
function _setupNS(b){b=b.split(".");for(var a=d,c=0;c<b.length;++c)a=a[b[c]]||(a[b[c]]={});return a}d.addEventListener&&typeof e.readyState=="undefined"&&d.addEventListener("DOMContentLoaded",function(){e.readyState="complete"},false);
if (_isNS('google.translate.Element')){return}var c=_setupNS('google.translate._const');c._cl='en';c._cuc='googleTranslateElementInit';c._cac='';c._cam='';var h='translate.googleapis.com';var b=(window.location.protocol=='https:'?'https://':'http://')+h;c._pah=h;c._pbi=b+'/translate_static/img/te_banner_bk.gif';c._pci=b+'/translate_static/img/te_ctrl3.gif';c._phf=h+'/translate_static/js/element/hrs.swf';c._pli=b+'/translate_static/img/loading.gif';c._plla=h+'/translate_a/l';c._pmi=b+'/translate_static/img/mini_google.png';c._ps=b+'/translate_static/css/translateelement.css';c._puh='translate.google.com';_loadCss(c._ps);_loadJs(b+'/translate_static/js/element/main.js');})();
function googleTranslateElementInit() {

  new google.translate.TranslateElement({

    pageLanguage: 'en',

    layout: google.translate.TranslateElement.InlineLayout.SIMPLE

  }, 'google_translate_element');

}