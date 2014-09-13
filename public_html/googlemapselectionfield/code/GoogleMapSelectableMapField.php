<?php

/**
 * A form field which outputs a google map, input field for an address which moves
 * the map.
 *
 * Currently saves the address of a given point. 
 *
 * @todo Save the Long, Lat fields as well
 * @package googlemapselectionfield
 */
class GoogleMapSelectableMapField extends FormField {

    /**
     * @var Mixed
     */
    private $startLat, $startLong, $mapWidth, $mapHeight, $zoom;

    /**
     * @param String - Name of Field
     * @param String - Title for Field
     * @param Int - Start Latitude
     * @param Int - Starting Map Longitude
     * @param String - Width of map (px or % to be included)
     * @param String - Height of map (px or % to be included)
     * @param Int - Zoom Level (1 to 12)
     */
    function __construct($name = "", $title = "", $startLat = 0, $startLong = 0, $mapWidth = '300px', $mapHeight = '300px', $zoom = '2') {
        if (strpos($mapWidth, 'px') === false && strpos($mapWidth, '%') === false)
            $mapWidth .= "px";
        if (strpos($mapHeight, 'px') === false || strpos($mapHeight, '%') !== false) {
            $mapHeight = str_replace("%", "", $mapHeight);
            $mapHeight .= "px";
        }
        parent::__construct($name, $title);
        $this->startLat = $startLat;
        $this->startLong = $startLong;
        $this->mapWidth = $mapWidth;
        $this->mapHeight = $mapHeight;
        $this->zoom = $zoom;
    }

    function Field() {
        Requirements::javascript("mysite/javascript/jquery-ui-1.8.6.custom.min.js");
        Requirements::javascript("http://maps.google.com/maps/api/js?sensor=true");
        Requirements::javascriptTemplate("googlemapselectionfield/javascript/GoogleMapSelectionFieldv2.js", array(
                    'Name' => $this->name,
                    'DefaultLat' => $this->startLat,
                    'DefaultLon' => $this->startLong,
                    'MapWidth' => $this->mapWidth,
                    'MapHeight' => $this->mapHeight,
                    'Zoom' => $this->zoom
                ));
        return "        
			<div class=\"googleMapField\">                                
                                <div id=\"map_{$this->name}\" style=\"margin-top: 20px; width: $this->mapWidth; height: $this->mapHeight;\"></div>
			</div>";
    }

}
