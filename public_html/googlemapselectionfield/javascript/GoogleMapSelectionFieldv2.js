(function($) {
    
    /*$('iframe', parent.document).load(function() {
        loadmap();
    });*/

    $(document).ready(function() {
        //function loadmap () {
		
        var geocoder = new google.maps.Geocoder();

        var latlng = new google.maps.LatLng($DefaultLat, $DefaultLon);
        
        var mapOptions = {
            zoom: $Zoom,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,

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
            draggable: true
        });

        google.maps.event.addListener(marker, "dragend", function(event) {
            var location = marker.getPosition();
            map.setCenter(location);
            $("input[name=LocationLatitude]").val(location.lat());
            $("input[name=LocationLongitude]").val(location.lng());
            geocoder.geocode({
                'latLng': location
            },
            function(results, status) {
                if(status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        $("input[name=LocationAddress]").val(results[1].formatted_address);
                        
                    } else {
                        $("input[name=$LocationAddress]").val("No address found");
                    }
                } else {
                    $("input[name=LocationAddress]").val("No address found");
                }

            });

        });

      
        $("input[name=LocationAddress]").autocomplete({
            //This bit uses the geocoder to fetch address values
            source: function(request, response) {
                geocoder.geocode( {
                    'address': request.term + " New Zealand",
                    'region': 'nz'
                }, function(results, status) {
                    response($.map(results, function(item) {
                        return {
                            label:  item.formatted_address,
                            value: item.formatted_address,
                            latitude: item.geometry.location.lat(),
                            longitude: item.geometry.location.lng()
                        }
                    }));
                })
            },
            //This bit is executed upon selection of an address
            select: function(event, ui) {
                var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
                $("input[name=LocationLatitude]").val(location.lat());
                $("input[name=LocationLongitude]").val(location.lng());
                marker.setPosition(location);
                map.setCenter(location);
            }
        });
      
        $("input[name=LocationAddress]").focus(function() {
            if($(this).val() == "Enter Address") {
                $(this).val("");
            }
        });

        $('#LocationDetails').css('overflow', 'hidden');
        if ( $('input[name=LocationShowDetails]').attr("checked")) {
            $('#LocationDetails').css('height', '80px');
        } else {
            $('#LocationDetails').css('height', '0px');
        }


        $('input[name=LocationShowDetails]').change(function () {
            if ($(this).attr("checked")) {
                $('#LocationDetails').css('height', '80px');
            } else {
                $('#LocationDetails').css('height', '0px');
            }
        });
    });
})(jQuery);