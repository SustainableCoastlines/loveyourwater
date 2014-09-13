(function($) {
    $(document).ready(function() {

        eval('$LocationsString');
        window.maplocations = Locations;

            console.log(Locations);

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

        //var image = new google.maps.MarkerImage( "http://i55.tinypic.com/2uf5bt2.png",
        // This marker is 20 pixels wide by 32 pixels tall.
        //    new google.maps.Size(25, 38),
        // The origin for this image is 0,0.
        //  new google.maps.Point(0,0)
        // The anchor for this image is the base of the flagpole at 0,32.
        //new google.maps.Point(0, 32)
        //   );


        var markerArray = new Array();

        var i=0;

        for (i=0;i<Locations.length;i++)
        {
            latlng = new google.maps.LatLng(Locations[i].lat, Locations[i].lng);
            markerArray.push(new google.maps.Marker({
                position: latlng,
                map: map,
                draggable: false,
                clickable: true,
                title: Locations[i].title,
                zIndex: i
            //icon: image
            }));


            google.maps.event.addListener(markerArray[i], "click", function(event) {

                window.location = window.maplocations[this.getZIndex()].link;
            });
        }
    
              
    });
})(jQuery);