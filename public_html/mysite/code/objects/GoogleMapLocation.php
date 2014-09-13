<?php

class GoogleMapLocation extends DataObject {

    static $db = array(
        'Address' => 'Text',
        'MoreDetails' => 'Boolean',
        'Details' => 'Text',
        'Latitude' => 'Text',
        'Longitude' => 'Text'
    );

    static $has_one = array(
        'CleanUpGroup' => 'CleanUpGroup'
    );

    function showMap($mapWidth, $mapHeight, $zoom) {
         Requirements::javascript("http://maps.google.com/maps/api/js?sensor=true");
        Requirements::javascriptTemplate("googlemapselectionfield/javascript/GoogleMapDisplay.js", array(
                    'ID' => $this->ID,
                    'DefaultLat' => $this->Latitude,
                    'DefaultLon' => $this->Longitude,
                    'MapWidth' => $mapWidth,
                    'MapHeight' => $mapHeight,
                    'Zoom' => $zoom
                ));
        return "<div id=\"map_{$this->ID}\" style=\"width: $mapWidth; height: $mapHeight;\" class=\"googleMap\"></div>";
    }

}
?>
