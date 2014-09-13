// Tweets
getTwitters('love_your_coast', {
    id: 'love_your_coast',
    prefix: '<a href="http://twitter.com/%screen_name%" target="_blank">%name%</a> said:',
    clearContents: false,
    // leave the original message in place
    count: 1,
    withFriends: true,
    ignoreReplies: false,
    newwindow: true
});

function initMenu() {
  $('#menu ul').hide();
  $('#menu ul:first').show();
  $('#menu li a').click(
    function() {
      var checkElement = $(this).next();
      if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        return false;
        }
      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('#menu ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }
      }
    );
  }
$(document).ready(function() {initMenu();});