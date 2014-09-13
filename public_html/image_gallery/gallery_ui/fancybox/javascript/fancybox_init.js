(function($) {
    $(function() {
        if($('a.fancybox').length){
            $('a.fancybox').fancybox({
                'zoomSpeedIn':	0,
                'zoomSpeedOut':	0,
                'overlayShow':	true
            });
        }

        if ($('a.fancyboxTC').length) {
            $('a.fancyboxTC').fancybox({
                'zoomSpeedIn':	0,
                'zoomSpeedOut':	0,
                'overlayShow':	true,
                'scrolling':         'vertical'
            });
        }
        
        if ($('a.fancyvideo').length) {
            $('a.fancyvideo').click(function() {
                $.fancybox({
                    'padding'		: 0,
                    'autoScale'		: false,
                    'transitionIn'          : 'none',
                    'transitionOut'         : 'none',
                    'title'			: this.title,
                    'width'                 : 680,
                    'height'		: 495,
                    'href'			: this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
                    'type'			: 'swf',
                    'swf'			: {
                        'wmode'             : 'transparent',
                        'allowfullscreen'	: 'true'
                    }
                });
                return false;
            });
        }
    });
})(jQuery);