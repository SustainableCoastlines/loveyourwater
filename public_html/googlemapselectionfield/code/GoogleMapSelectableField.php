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
class GoogleMapSelectableField extends FormField {

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
        Requirements::javascriptTemplate("googlemapselectionfield/javascript/GoogleMapSelectionField.js", array(
                    'Name' => $this->name,
                    'DefaultLat' => $this->startLat,
                    'DefaultLon' => $this->startLong,
                    'MapWidth' => $this->mapWidth,
                    'MapHeight' => $this->mapHeight,
                    'Zoom' => $this->zoom
                ));
        return "        
			<div class=\"googleMapField\">
                                <div class=\"mapdetails\">
                                    <p class=\"left\"><input type=\"text\" id=\"{$this->id()}\" name=\"{$this->name}\" value=\"" . _t('GoogleMapSelectableField.ENTERADDRESS', 'Enter Address') . "\" class=\"longText\"/></p>
                                    <p class=\"left\"><input type=\"text\" id=\"{$this->id()}_Lng\" name=\"{$this->name}_Lng\" /></p>
                                    <p class=\"left\"><input type=\"text\" id=\"{$this->id()}_Lat\" name=\"{$this->name}_Lat\" /></p>
                                    <p class=\"field checkbox\">
                                        <input class=\"left\" type=\"checkbox\" id=\"ShowDetails\" name=\"{$this->name}_ShowDetails\" />
                                        <label class=\"right\" for=\"ShowDetails\" style=\"cursor: pointer\">Add a better description of the location?</label>
                                    </p>
                                    <div id=\"LocationDetailsInput\" style=\"float: left; overflow: hidden; height: 0px\"><p class=\"left\"><input type=\"text\" id=\"{$this->id()}\"_Details\" name=\"{$this->name}_Details\"  class=\"longText\"//></p></div>
                                
                                </div>
                                <div class=\"clear\"></div>
                                <div id=\"map_{$this->name}\" style=\"margin-top: 20px; width: $this->mapWidth; height: $this->mapHeight;\"></div>
			</div>";

        //<input type=\"hidden\" id=\"{$this->id()}_MapURL\" name=\"{$this->name}_MapURL\" />
        //<input type=\"submit\" value=\"" . _t('EditableFormField.GO', 'Go') . "\" class=\"submit googleMapAddressSubmit\" />
    }

}
