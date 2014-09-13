<?php

$zend_lib_path = realpath( '..' . DIRECTORY_SEPARATOR ) . DIRECTORY_SEPARATOR . '_lib/ZendFramework/library';
set_include_path( $zend_lib_path . PATH_SEPARATOR . get_include_path() );

require_once 'Zend/Loader.php';
Zend_Loader::loadClass('Zend_Http_Client');

class Page extends SiteTree {

    public static $db = array(
        "Summary" => "Text",
    );
    public static $has_one = array();
	
	public static $many_many = array(
		'LearnDownloads' => 'LearnDownload'
	);

    function getCMSFields() {
        $oFields = parent::getCMSFields();
		$oFields->addFieldToTab('Root.Content.Summary', new TextareaField('Summary', 'Summary of this page'));
		
		$oLearnDocumentsManager = new ManyManyDataObjectManager(
			$this,
			'LearnDownloads',
			'LearnDownload',
			array('Title' => 'Title', 'Description' => 'Description'),
			'getCMSFields_forPopup'
        );
        //$oLearnDocumentsManager->setConfirmDelete(true);
		$oFields->addFieldToTab("Root.Content.Downloads", $oLearnDocumentsManager);
		
        return $oFields;
    }

//	function GenerateInstaGramPhotos(){
//		Zend_Loader::loadClass('Zend_Http_Client');
//
//		$CLIENT_ID = 'YOUR-CLIENT-ID';
//		$CLIENT_SECRET = 'YOUR-CLIENT-SECRET';
//
//		try{
//			$client = new Zend_Http_Client('https://api.instagram.com/v1/tags/loveyourcoast/media/recent');
//			$client->setParameterGet('client_id', $CLIENT_ID);
//
//			// get and display similar tags
//			$response = $client->request();
//			$result = json_decode($response->getBody());
//			$data = $result->data;
//		} catch (Exception $e) {
//			echo 'ERROR: ' . $e->getMessage() . print_r($client);
//			exit;
//		}
//
//	}



    function SponsorsList() {
        return DataObject::get("Sponsor");
    }

    function KeySponsorsList() {
        return DataObject::get("Sponsor", "KeySponsor = 1");
    }

    function AdsList() {
        return DataObject::get("Ad", "Active = 1");
    }

    function RandomAd() {
        return DataObject::get_one("Ad", "Active = 1", true, "RAND()");
    }

    function CollaboratorsList() {
        return DataObject::get("Collaborator");
    }

    function KeyContactsList() {
        return DataObject::get("KeyContact");
    }

    function ActionLinksList() {
        return DataObject::get("ActionLink");
    }

    function DisplayedActionLinksList() {
        return DataObject::get("ActionLink", "Display=1");
    }

    function getLatestFlickrPhotos($num) {
        $flickr = new FlickrService();
        $photos = $flickr->getPhotos("", "api", $num, 1, 'date-posted-desc');
        return $photos;
    }

    function getLatestNewsArticles($num) {
        $news = DataObject::get_one("NewsArticleHolderPage");
        return ($news) ? DataObject::get("NewsArticlePage", "ParentID = $news->ID", "Date DESC", "", $num) : false;
    }

    function getLatestYoutubeVideos($num) {
        $username = 'LoveyourCoast';
        $youtube = new YoutubeService();
        $videos1 = $youtube->getVideosUploadedByUser($username, $num, 1, 'published');
        $videos2 = $youtube->getFavoriteVideosByUser($username, $num, 1, 'published');
        $videos = new DataObjectSet();
        $videos->merge($videos1);
        $videos->merge($videos2);
        return $videos;
    }

    function getLastXTwitterStatus($x) {
        $url = "http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=Love_your_Coast&count=$x&include_rts=true";

        libxml_use_internal_errors(true);
        try {
            $xml = @simplexml_load_file($url);

            if (!$xml) {
                $e = '<div><p>Twitter service temporarily unavailable, please go to our <a href="http://www.twitter.com/Love_your_Coast/">Twitter page</a> to see our updates.</p></div>';
                $t = '';
                for ($i = 1; $i <= $x; $i++) {
                    $t = $t . $e;
                }
            } else {
                $t = '';
                foreach ($xml->status as $status) {
                    $text = $this->twitterify($status->text);
                    $t = $t . '<div><p>' . utf8_decode($text) . '</p><p>' . date('g:i A M jS', strtotime($status->created_at)) . ' via ' . $status->source . '</p></div>';
                }
            }
        } catch (Exception $e) {
            $t = '<div><p>Twitter service temporarily unavailable, please go to our <a href="http://www.twitter.com/Love_your_Coast/">Twitter page</a> to see our updates.</p></div>';
        }

        return $t;
    }

    function twitterify($ret) {
        $ret = preg_replace("#(^|[\n ])([\w]+?://[\w]+[^ \"\n\r\t< ]*)#", "\\1<a href=\"\\2\" >\\2</a>", $ret);
        $ret = preg_replace("#(^|[\n ])((www|ftp)\.[^ \"\t\n\r< ]*)#", "\\1<a href=\"http://\\2\" >\\2</a>", $ret);
        $ret = preg_replace("/@(\w+)/", "<a href=\"http://www.twitter.com/\\1\" >@\\1</a>", $ret);
        $ret = preg_replace("/#(\w+)/", "<a href=\"http://search.twitter.com/search?q=\\1\" >#\\1</a>", $ret);
        return $ret;
    }

    public function TopEvents($num = 4) {
        if ($num == 0)
            $topevents = Dataobject::get('CleanUpGroup', 'TopEvent = 1', "Date ASC", "");
        else
            $topevents = Dataobject::get('CleanUpGroup', 'TopEvent = 1', "Date ASC", "", $num);
        return $topevents;
    }

    public function CommunityEvents($num = 4) {
        $now = date('Y-m-d H:i:s');
        if ($num == 0)
            $comevents = Dataobject::get('CleanUpGroup', "(TopEvent = 0)&(Date >= '$now')", "Date ASC", "");
        else
            $comevents = Dataobject::get('CleanUpGroup', "(TopEvent = 0)&(Date >= '$now')", "Date ASC", "", $num);
        return $comevents;
    }

    //function PopularEvents($num = 5) {
    //    return DataObject::get("CleanUpGroup", "", "JoinedCount DESC", "", $num);
    //}

    public function PastEvents($num = 4) {
        $now = date('Y-m-d H:i:s');
        if ($num == 0)
            return DataObject::get("CleanUpGroup", "Date < '$now'", "Date DESC", "");
        else
            return DataObject::get("CleanUpGroup", "Date < '$now'", "Date DESC", "", $num);
    }
	
	function UpcomingEvents(){
		$now = date('Y-m-d H:i:s');
        if ($allpastEvents = Dataobject::get('CleanUpGroup', "(ToDate > '$now')", "FromDate ASC", '', 30)) {
            return $allpastEvents;
        } else {
            return false;
        }	
	}
	

    public function googleMapPastEvents() {
        $startLat = "-40.996484";
        $startLng = "172.6";
        $mapWidth = "365";
        $mapHeight = "370";
        $zoom = "1";
        $communityevents = $this->PastEvents(0);
        return $this->googleMapMultiple($startLat, $startLng, $mapWidth, $mapHeight, $zoom, $communityevents);
    }

    public function googleMapCommunityEvents() {
        $startLat = "-40.996484";
        $startLng = "172.6";
        $mapWidth = "365";
        $mapHeight = "368";
        $zoom = "1";
        $communityevents = $this->Communityevents(0);
        return $this->googleMapMultiple($startLat, $startLng, $mapWidth, $mapHeight, $zoom, $communityevents);
    }
	
	public function googleMapUpcomingEvents() {
        $startLat = "-40.996484";
        $startLng = "172.6";
        $mapWidth = "380";
        $mapHeight = "220";
        $zoom = "1";
        $upcomingevents = $this->UpcomingEvents(0);
        return $this->googleMapMultiple($startLat, $startLng, $mapWidth, $mapHeight, $zoom, $upcomingevents);
    }
	
	public function googleMapEventsLarge() {
        $startLat = "-40.996484";
        $startLng = "172.6";
        $mapWidth = "380";
        $mapHeight = "380";
        $zoom = "1";
        $upcomingevents = $this->UpcomingEvents(0);
        return $this->googleMapMultiple($startLat, $startLng, $mapWidth, $mapHeight, $zoom, $upcomingevents);
    }

    public function googleMapTopEvents() {
        $startLat = "-40.996484";
        $startLng = "172.6";
        $mapWidth = "365";
        $mapHeight = "370";
        $zoom = "1";
        $topevents = $this->Topevents(0);
        return $this->googleMapMultiple($startLat, $startLng, $mapWidth, $mapHeight, $zoom, $topevents);
    }

    function googleMapMultiple($startLat="-40.996484", $startLng = "172.6", $mapWidth = "300", $mapHeight = "300", $zoom = "5", $events = "") {
        $LocationsString = $this->getEventsLatLngString('Locations', $events);

//Requirements::javascript("mysite/javascript/jquery-ui-1.8.6.custom.min.js");
        Requirements::javascript("http://maps.google.com/maps/api/js?sensor=true");
        Requirements::javascriptTemplate("googlemapselectionfield/javascript/GoogleMapDisplayMultiple.js", array('Name' => "topeventsmap",
                    'StartLat' => $startLat,
                    'StartLng' => $startLng,
                    'MapWidth' => $mapWidth,
                    'MapHeight' => $mapHeight,
                    'Zoom' => $zoom,
                    'LocationsString' => $LocationsString
                ));

        return "        <div class=\"googleMapField\">
                                <div id=\"map_topeventsmap\" style=\"width: {$mapWidth}px; height: {$mapHeight}px;\"></div>
			</div>";
    }

    function getEventsLatLngString($name, $events) {
        $array_string = "$name = [";
        $tevents = $events;
        $num_items = count($tevents);
        $i = 1;
        foreach ($tevents as $event) {
            $title = $event->Title . ", " . date('l j F Y', strtotime($event->Date)) . '  (click to go to event)';

            $link = $event->Link();
            $lat = $event->LocationLatitude;
            $lng = $event->LocationLongitude;
            $array_string .= "{title: \"$title\",  link:\"$link\",  lat:\"$lat\",   lng:\"$lng\"}";
            if ($i++ < $num_items)
                $array_string .= ",";
        }
        $array_string .= "]";

        return $array_string;
    }

    function curPageURL() {
        $pageURL = 'http';
        if ($_SERVER["HTTPS"] == "on") {
            $pageURL .= "s";
        }
        $pageURL .= "://";
        if ($_SERVER["SERVER_PORT"] != "80") {
            $pageURL .= $_SERVER["SERVER_NAME"] . ":" . $_SERVER["SERVER_PORT"] . $_SERVER["REQUEST_URI"];
        } else {
            $pageURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
        }
        return $pageURL;
    }

}

class Page_Controller extends ContentController {

    /**
     * An array of actions that can be accessed via a request. Each array element should be an action name, and the
     * permissions or conditions required to allow the user to access it.
     *
     * <code>
     * array (
     *     'action', // anyone can access this action
     *     'action' => true, // same as above
     *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
     *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
     * );
     * </code>
     *
     * @var array
     */
    public static $allowed_actions = array();

    public function init() {
        parent::init();

// Note: you should use SS template require tags inside your templates
// instead of putting Requirements calls here.  However these are
// included so that our older themes still work
        Requirements::themedCSS('layout');
		//Requirements::themedCSS('layout-sandra');
		Requirements::themedCSS('main');
        //Requirements::themedCSS('typography');

        Requirements::themedCSS('form');
        Requirements::themedCSS('fancybox.jquery');
        Requirements::themedCSS('jflow.style');
        Requirements::themedCSS('galleryview');

//validation
        Requirements::themedCSS('validationEngine.jquery');
//javascript
        //Requirements::javascript("mysite/javascript/jquery.js");
        //Requirements::javascript("mysite/javascript/jquery-1.4.2.min.js");
		//Requirements::javascript("mysite/javascript/jquery-1.9.1.js");
		Requirements::javascript("mysite/javascript/jquery-1.7.js");
		Requirements::javascript("mysite/javascript/owl-carousel/owl.carousel.js");
        Requirements::javascript("mysite/javascript/jquery-ui-1.8.6.custom.min.js");
        Requirements::javascript("mysite/javascript/jquery.timers-1.2.js");
        Requirements::javascript("mysite/javascript/jquery.easing.1.3.js");
// jqTransform Form Transform
        Requirements::javascript("mysite/javascript/jquery.jqtransform.js");
		Requirements::javascript("mysite/javascript/fitvid/jquery.fitvids.js");
		Requirements::javascript("mysite/javascript/main.js");
// facebook connect
//Requirements::javascript("facebookconenct/javascript/fbconnect.js");
//Requirements::javascript('http://connect.facebook.net/en_US/all.js#xfbml=1');
//
//init jqTrans on all forms


//Sort out dd issue
//Requirements::javascript("mysite/javascript/CreateDropdown.js");
//
//set no validator(frontend)
        Validator::set_javascript_validation_handler('none');
//set validationEngine addded case by case on each form
        Requirements::javascript("mysite/javascript/jquery.validationEngine.js"); //validation engine
        Requirements::javascript("mysite/javascript/jquery.validationEngine-en.js"); //validation engine
// SWF Object
        //Requirements::javascript("mysite/javascript/swfobject_modified.js");
// jFlow Sliding Content
        Requirements::javascript("mysite/javascript/jflow.plus.js");
// Custom jQuery
        Requirements::javascript("mysite/javascript/jquery.custom.js");
// GalleryView
        Requirements::javascript("mysite/javascript/jquery.galleryview-2.1.1.js");
        Requirements::javascript("mysite/javascript/gallery_init.js");
// Fancy Box
        Requirements::javascript("image_gallery/gallery_ui/fancybox/javascript/jquery.fancybox.js");
        //Requirements::javascript("image_gallery/gallery_ui/fancybox/javascript/jquery.pngFix.pack.js");
        Requirements::javascript("image_gallery/gallery_ui/fancybox/javascript/fancybox_init.js");
        //Requirements::javascript("mysite/javascript/fbml.js#xfbml=1");
//THESE REQUIRE BLOCKING!!
        Requirements::block('sapphire/thirdparty/jquery/jquery.js');
//Requirements::block('sapphire/thirdparty/prototype/prototype.js');
        Requirements::block('sapphire/thirdparty/behaviour/behaviour.js');
        Requirements::block('sapphire/javascript/prototype_improvements.js');
        Requirements::block('sapphire/javascript/ConfirmedPasswordField.js');
    }
	
	/**                                                                                  
	 *                                                               
	 * @return object $oLatestAddedEvent The latest added event                    
	 */
	public function UpcomingEvent(){
                $now = date('Y-m-d H:i:s');
		$oLatestAddedEvent = DataObject::get('CleanUpGroup', "(FromDate > '$now')", 'FromDate ASC', '', 1);	
		if($oLatestAddedEvent) return $oLatestAddedEvent;
	}
	
	/**                                                              
	 * Create EventFilterForm form                          
	 *                                                               
	 * @return object $oForm The EvenFilter form                      
	 */
	function EventFilterForm() { 
        // Create the DataEntry form
        $oForm = new EventFilterForm($this, 'EventFilterForm');
        // Return the form
        return $oForm;
	}
	
	
	function RecentEvents(){
		$now = date('Y-m-d H:i:s');
        if ($allpastEvents = Dataobject::get('CleanUpGroup', "(FromDate < '$now')", "FromDate ASC", '', 30)) {
            return $allpastEvents;
        } else {
            return false;
        }	
	}
	
	
	/**                                                              
	 * Create EventFilterForm form                          
	 *                                                               
	 * @return object $oForm The EvenFilter form                      
	 */
	function ParticipantsTotal() {
	   $oDataSheets = DataObject::get('DataSheet');
	   $iParticipants = 0;
	   foreach($oDataSheets as $oDataSheet){
			$iParticipants = $iParticipants + $oDataSheet->Participants;
	   }
       return $iParticipants;
	}

	function EventsTotal(){
		return DB::query("SELECT COUNT(*) FROM CleanUpGroup")->value();
	}

	
	/**                                                              
	 * Create EventFilterForm form                          
	 *                                                               
	 * @return object $oForm The EvenFilter form                      
	 */
	function RubbishTotal() { 
        // Create the DataEntry form
       $oDataSheets = DataObject::get('DataSheet');
	   $iSacks = 0;
	   foreach($oDataSheets as $oDataSheet){
			$iSacks = $iSacks + $oDataSheet->Sacks;
	   }
       return $iSacks;
	}

	function GetInstramPhotos(){
		$CLIENT_ID = '8af248585b8f406ab3d973193a354747';

		try {
			// initialize client
			$client = new Zend_Http_Client('https://api.instagram.com/v1/tags/loveyourcoast/media/recent');
			$client->setParameterGet('client_id', $CLIENT_ID);

			// get images with matching tags
			// transmit request and decode response
			$response = $client->request();
			$result = json_decode($response->getBody());

			// display images
			$data = $result->data;

			$imageSet = new DataObjectSet();

			if (count($data) > 0) {
//				echo '<ul>';
				foreach ($data as $item) {
					$imageItem = new DataObject();
					$imageItem->ImageURL = $item->images->thumbnail->url;
					$imageSet->push($imageItem);
//					echo '<li style="display: inline-block; padding: 25px"><a href="' .
//						$item->link . '"><img src="' . $item->images->thumbnail->url .
//						'" /></a> <br/>';
//					echo 'By: <em>' . $item->user->username . '</em> <br/>';
//					echo 'Date: ' . date ('d M Y h:i:s', $item->created_time) . '<br/>';
//					echo $item->comments->count . ' comment(s). ' . $item->likes->count .
//						' likes. </li>';
				}
//				echo '</ul>';
			}

		} catch (Exception $e) {
			echo 'ERROR: ' . $e->getMessage() . print_r($client);
		}

		return $imageSet;
	}


}
