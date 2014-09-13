// Search form
$('.form-search select').width(319);
$('.form-search input').attr('size', '34');
$('.form-wide select').width(319);
// Default form
$('.form-left input').attr('size', '34');
//$('#MemberLoginForm_LoginForm input').attr('size', '16');
//$('.form-wide textarea').width(720);
//$('.form-wide textarea').height(200);
// Invite form
$('#InviteForm input').attr('size', '34');
//$('#InviteForm select').width(319);
//$('#InviteForm textarea').width(720);
//$('#InviteForm textarea').height(200);
$('input#InviteForm_InviteForm_Recipients').attr('size', '72');
$('<div class="clear">&nbsp;</div>').insertBefore('.form-wide h3');
$('<div class="clear">&nbsp;</div>').insertAfter('.form-wide h3');
// Send form
$('#SendForm input').attr('size', '34');
//$('#SendForm select').width(319);
//$('#SendForm textarea').width(720);
////$('#SendForm textarea').height(200);

$('.ConnectActivityLogin').hide();

// FAQ's
function initMenu() {
    $('#faqs ul').hide();
    $('#faqs ul:first').show();
    $('#faqs li a').click(
        function() {
            var checkElement = $(this).next();
            if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                return false;
            }
            if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('#faqs ul:visible').slideUp('normal');
                checkElement.slideDown('normal');
                return false;
            }
        }
        );
}



$(document).ready(function() {
    initMenu();

    if($("#twitterController").length){
        $("#twitterController").jFlow({
            controller: ".jFlowControlTwit", // must be class, use . sign
            slideWrapper : "#twitterjFlow", // must be id, use # sign
            slides: "#twitterSlides",  // the div where all your sliding divs are nested in
            selectedWrapper: "jFlowSelected1",  // just pure text, no sign
            width: "345px",  // this is the width for the content-slider
            height: "100px",  // this is the height for the content-slider
            duration: 10,  // time in miliseconds to transition one slide
            pause: 10,
            prev: ".jFlowPrevTwit", // must be class, use . sign
            next: ".jFlowNextTwit", // must be class, use . sign
            auto: true
        });
    }

    if($("#youtubeController").length){
        $("#youtubeController").jFlow({
            controller: ".jFlowControl1", // must be class, use . sign
            slideWrapper : "#youtubejFlow", // must be id, use # sign
            slides: "#youtubeSlides",  // the div where all your sliding divs are nested in
            selectedWrapper: "jFlowSelected1",  // just pure text, no sign
            width: "360px",  // this is the width for the content-slider
            height: "240px",  // this is the height for the content-slider
            duration: 100,  // time in miliseconds to transition one slide
            pause: 20,
            prev: ".jFlowPrev1", // must be class, use . sign
            next: ".jFlowNext1", // must be class, use . sign
            auto: true
        });
    }

    if($("#flickrController").length){
        $("#flickrController").jFlow({
            controller: ".jFlowControl2", // must be class, use . sign
            slideWrapper : "#flickrjFlow", // must be id, use # sign
            slides: "#flickrSlides",  // the div where all your sliding divs are nested in
            selectedWrapper: "jFlowSelected2",  // just pure text, no sign
            width: "360px",  // this is the width for the content-slider
            height: "240px",  // this is the height for the content-slider
            duration: 100,  // time in miliseconds to transition one slide
            pause: 15,
            prev: ".jFlowPrev2", // must be class, use . sign
            next: ".jFlowNext2", // must be class, use . sign
            auto: true
        });
    }
    if($("#featureController").length){
        $("#featureController").jFlow({
            controller: ".jFlowControlFeature", // must be class, use . sign
            slideWrapper : "#featurejFlow", // must be id, use # sign
            slides: "#featureSlides",  // the div where all your sliding divs are nested in
            selectedWrapper: "jFlowSelectedFeature",  // just pure text, no sign
            width: "483px",  // this is the width for the content-slider
            height: "244px",  // this is the height for the content-slider
            duration: 100,  // time in miliseconds to transition one slide
            pause: 20,
            prev: ".jFlowPrevFeature", // must be class, use . sign
            next: ".jFlowNextFeature", // must be class, use . sign
            auto: true
        });
    
    }



});