(function($) {
    $(document).ready(function() {

        var latlng = new google.maps.LatLng($StartLat, $StartLng);


        var mapOptions = {
            zoom: $Zoom,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,

            //mapTypeControl: false,
            mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                position: google.maps.ControlPosition.TOP_RIGHT
            },

            navigationControl: true,
            navigationControlOptions: {
                style: google.maps.NavigationControlStyle.SMALL,
                position: google.maps.ControlPosition.TOP_LEFT
            }

        }
	               
        var map = new google.maps.Map(document.getElementById("map_$Name"), mapOptions);

        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            draggable: false
        });
              
  });
})(jQuery);