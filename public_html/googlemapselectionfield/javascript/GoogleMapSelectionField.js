(function($) {
    $(document).ready(function() {
	
        //$("input[name=$Name_MapURL]").val("User did not generate a Url as the field is not required");

        /*$('#Form_Form').submit(function() {
            var checkval = $("input[name=$Name_MapURL]").val();
            if( checkval == "User did not generate a Url as the field is not required" && $("#EditableGoogleMapSelectableField38").attr("class") == "field googlemapselectable  requiredField"){
                alert("please click 'Go' to check address in the map");
                return false;
            }
        });*/
		
        // default values


        var geocoder = new google.maps.Geocoder();

        var latlng = new google.maps.LatLng($DefaultLat, $DefaultLon);

        var mapOptions = {
            zoom: $Zoom,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.HYBRID,

            mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                position: google.maps.ControlPosition.BOTTOM
            },

            navigationControl: true,
            navigationControlOptions: {
                style: google.maps.NavigationControlStyle.SMALL,
                position: google.maps.ControlPosition.TOP_RIGHT
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
            $("input[name=$Name_Lat]").val(location.lat());
            $("input[name=$Name_Lng]").val(location.lng());
            geocoder.geocode({
                'latLng': location
            },
            function(results, status) {
                if(status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        $("input[name=$Name]").val(results[1].formatted_address);
                        
                    } else {
                        $("input[name=$Name]").val("No address found");
                    }
                } else {
                    //alert("Geocoder failed due to: " + status);
                    $("input[name=$Name]").val("No address found");
                }

            });

        });

      
        $("input[name=$Name]").autocomplete({
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
                $("input[name=$Name_Lat]").val(location.lat());
                $("input[name=$Name_Lng]").val(location.lng());
                marker.setPosition(location);
                map.setCenter(location);
            }
        });
      
        $("input[name=$Name]").focus(function() {
            if($(this).val() == $(this).attr("value")) {
                $(this).val("");
            }
        });


        $('input#ShowDetails').change(function () {
            if ($(this).attr("checked")) {
                $('#LocationDetailsInput').css('height', '50px');
            } else {
                $('#LocationDetailsInput').css('height', '0px');
            }
        });

      


    });
})(jQuery);