(function($) {
    $(function() {
        if($('#event-mini-gallery').length){
            $('#event-mini-gallery').galleryView({
                panel_width: 220,//345,
                panel_height: 153,//270,
                frame_width: 63,
                frame_height: 60,
                frame_gap: 5,
                pointer_size: 6,
                pause_on_hover: true,
                transition_speed: 300,				//INT - duration of panel/frame transition (in milliseconds)
                transition_interval: 6000,
                show_captions: true,
                fade_panels: false
            });
        }

        if($('#event-gallery').length){
            $('#event-gallery').galleryView({
                panel_width: 350,//345,
                panel_height: 175,//153,//270,
                frame_width: 63,
                frame_height: 60,
                frame_gap: 5,
                pointer_size: 6,
                pause_on_hover: true,
                transition_speed: 300,				//INT - duration of panel/frame transition (in milliseconds)
                transition_interval: 6000,
                show_captions: true,
                fade_panels: false
            });
        }
        
    });
})(jQuery);