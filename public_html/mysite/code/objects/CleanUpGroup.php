<?php

class CleanUpGroup extends DataObject {

    static $db = array(
        'Title' => 'Text',
		'Organisation' => 'Text',
        'Subtitle' => 'Text',
        'Description' => 'HTMLText',
        'FacebookLink' => 'Text',
        'LocationAddress' => 'Text',
        'LocationDetails' => 'Text',
        'LocationShowDetails' => 'Boolean',
        'LocationLatitude' => 'Text',
        'LocationLongitude' => 'Text',
        'Agree' => 'Boolean',
        'TopEvent' => 'Boolean',
        'Private' => 'Boolean',
		// OLD Used only for display
		'Date' => 'Date',
		//DateTimes
		'FromDate' => 'Date',
		'ToDate' => 'Date',
		'FromTime' => 'Text',
		'ToTime' => 'Text',
		//Country
		'Country' => 'Text',
		'Region' => 'Text',
		//Admin
        'JoinedCount' => 'Int'
    );
    static $has_one = array(
        "Creator" => "Member",
        "EventImage" => "Image",
        "GoogleMapLocation" => "GoogleMapLocation",
        "CleanUpsPage" => "CleanUpsPage"
    );
    static $has_many = array(
        "CleanUpSponsors" => "CleanUpSponsor",
		"DataSheets" => "DataSheet"
    );
    static $many_many = array(
        "Members" => "Member",
    );
    static $summary_fields = array(
        'Title',
        'Subtitle',
        'Date',
        'Description',
        'FacebookLink',
        'Flickrtag',
        'LocationAddress',
        'LocationDetails',
        'LocationShowDetails',
        'LocationLatitude',
        'LocationLongitude',
        'Agree',
        'Private',
        'JoinedCount'
    );

    public function canDelete() {
        return false;
    }

    public static $allowed_actions = array(
        'add',
        'edit',
        'import',
        'renderimportform',
        'handleList',
        'handleItem',
        'ImportForm'
    );

//Used in all frontend searchs
    public function getCustomSearchContext() {
        $fields = $this->scaffoldSearchFields(array(
                    'restrictFields' => array('LocationAddress', 'Title')
                ));
        $filters = array(
            'Location' => new PartialMatchFilter('LocationAddress'),
            'Title' => new PartialMatchFilter('Title'),
        );
        return new SearchContext(
                $this->class,
                $fields,
                $filters
        );
    }

//Used in modeladmin
    static $searchable_fields = array(
        'LocationAddress' => array(
            'filter' => 'PartialMatchFilter',
        ),
        'Title' => array(
            'filter' => 'PartialMatchFilter',
        ),
        'Name' => array(
            'filter' => 'ExactMatchFilter',
        ),
        'LastName' => array(
            'filter' => 'ExactMatchFilter',
        ),
    );

    public function getCMSFields_forPopup() {
        $sponsors_manager = new DataObjectManager(
			$this,
			'CleanUpSponsors',
			'CleanUpSponsor',
			array('Name' => 'Name', 'Weblink' => 'Weblink', 'getDOMThumbnail' => 'Logo Image')
        );
        $sponsors_manager->addPermission("duplicate");
        $sponsors_manager->setConfirmDelete(true);
 
        $source = DataObject::get('Member');

        $members_manager =
                new MultiSelectField(
				"Members", // Relationship
				"CleanUpGroup", // Field name
				$source->map('ID', 'Title') // Source records (array)
        );
		
		$oCountryField = new DropdownField('Country', 'Country', Geoip::getCountryDropDown(), 'NZ');
						


        return new FieldSet(
                new CheckboxField('TopEvent', 'Top Event'),
                new TextField('Title', 'Title'),
                new TextField('Subtitle', 'Subtitle'),
		new TextField('Organisation', 'Organistaion'),
                new DatePickerField('Date', 'OLD - Event Date'),
                new DatePickerField('FromDate', 'From'),
                new DatePickerField('ToDate', 'To'),
                new TextField('FromTime', 'From time'),
                new TextField('ToTime', 'To time'),
		$oCountryField,
		new TextField('Region', 'Event Region'),
                new TextField('LocationAddress', 'Location Address'),
                new GoogleMapSelectableMapField('Location', "Location of the Event", "$this->LocationLatitude", "$this->LocationLongitude", "575px", "250px", "6"),
                new TextField('LocationLongitude', 'Longitude (don\'t edit, for reference only)'),
                new TextField('LocationLatitude', 'Latitude (don\'t edit, for reference only)'),
                new CheckboxField('LocationShowDetails', 'Show Location Details'),
                new TextField('LocationDetails', 'Location Meeting Point Details'),
                new TextField('FacebookLink', 'FacebookLink'),
                new SimpleHTMLEditorField('Description', 'Description', array(
                    'css' => 'mysite/css/my_simple_stylesheet.css',
                    'insertUnorderedList' => true,
                    'copy' => true,
                    'justifyCenter' => false), 30),
                new CheckboxField('Private', 'Private Event'),
                new CheckboxField('Agree', 'Agreed to T&C'),
                new TextField('JoinedCount', 'Number of participants'),
                new ImageUploadField('EventImage', 'Main Event Image, Only shown for Top Events'),
                $sponsors_manager,
                $members_manager
        );
    }

    public function getDOMThumbnail() {
        if ($i = $this->EventMainImage()) {
            return $i->PaddedImage(50, 50);
        }
        return false;
    }

    public function getTopEventStatus() {
        return ($this->TopEvent ? "Yes" : "No");
    }

    public function getAgreeStatus() {
        return ($this->Agree ? "Yes" : "No");
    }

    public function getPrivateStatus() {
        return ($this->Private ? "Yes" : "No");
    }

    function EventMainImage() {
        //if ($this->TopEvent)
        return $this->EventImage();
        //else
        //   return $this->CleanUpsPage()->findCommunityEventBadge();
    }

    function EventCommunityBadge() {
        return $this->CleanUpsPage()->findCommunityEventBadge();
    }

    function EmptyGalleryFiller() {
        if ($i = $this->CleanUpsPage()->findEmptyGalleryFiller())
            return $i;
        else
            return "";
    }

    function EmptyGalleryCreator() {
        if ($i = $this->CleanUpsPage()->findEmptyGalleryCreator())
            return $i;
        else
            return "";
    }

    function hasRelatedFlickr() {
        $photos = $this->getFlickrPhotos(1);
        if ($photos->PhotoItems->First())
            $result = true;
        else
            $result = false;
        return $result;
    }

    function getFlickrPhotos($num) {
        $flickr = new FlickrService();
        $photos = $flickr->getPhotosMT($this->machineTag(), "api", $num, 1, 'date-posted-desc');
        return $photos;
    }

    function getEventPhotoURL() {
        $photos = $this->getFlickrPhotos(1);
        if ($photos->PhotoItems->First()) {
            $photourl = 'http://farm1.static.flickr.com/' . $photos->PhotoItems->First()->image_path . '.jpg';
        } else {
            $photourl = $this->EmptyGalleryFiller()->URL;
        }
        return $photourl;
    }

    function getEventPhotoURLThumb() {
        $photos = $this->getFlickrPhotos(1);
        if ($photos->PhotoItems->First()) {
            $photourl = 'http://farm1.static.flickr.com/' . $photos->PhotoItems->First()->image_path . '_s.jpg';
        } else {
            $photourl = $this->EmptyGalleryFiller()->URL;
        }
        return $photourl;
    }

    function getAllEventPhotoURLThumbs() {
        $photos = $this->getFlickrPhotos(20);
        if ($photos->PhotoItems->First()) {
            $imagelist = '<ul style="list-style: none;">';
            foreach ($photos->PhotoItems as $photo) {
                $imagelist = $imagelist . '<li style="display: inline; margin: 5px 5px 5px 5px"><img src="http://farm1.static.flickr.com/' . $photo->image_path . '_s.jpg" /></li>';
            }
            $imagelist = $imagelist . '</ul>';
        } else {
            $imagelist = '<ul style="list-style: none;"><li><img src="assets/default_flickr_thumb.png" /></li></ul>';
        }
        return $imagelist;
    }

    public function numberOfMembers() {
        $members = $this->getManyManyComponents("Members");
        $num = $members->TotalItems();
        return $num;
    }

    public function machineTag() {
        return "LoveYourCoast:EventID=" . $this->ID;
    }

	function ListMembersLink() {
        return CleanUpsPage::list_members_link($this->ID);
    }
	
	function SendLink() {
        return CleanUpsPage::send_email_link($this->ID);
    }

    function Link() {
        return CleanUpsPage::get_cleanup_link($this->ID);
    }

    function JoinLink() {
        return CleanUpsPage::join_cleanup_link($this->ID);
    }

    function RemoveLink() {
        return CleanUpsPage::remove_cleanup_link($this->ID);
    }
	
	function DeleteLink() {
        return CleanUpsPage::delete_cleanup_link($this->ID);
    }

    function hasFacebookLink() {
        return ($this->FacebookLink != "");
    }

    function showLocationDetails() {
        return ($this->LocationShowDetails);
    }

    function showMap($mapWidth, $mapHeight, $zoom) {
        Requirements::javascript("http://maps.google.com/maps/api/js?sensor=true");
        Requirements::javascriptTemplate("googlemapselectionfield/javascript/GoogleMapDisplay.js", array(
                    'ID' => $this->ID,
                    'Lat' => $this->LocationLatitude,
                    'Lon' => $this->LocationLongitude,
                    'MapWidth' => $mapWidth,
                    'MapHeight' => $mapHeight,
                    'Zoom' => $zoom
                ));
        return "<div id=\"map_{$this->ID}\" style=\"width: {$mapWidth}px; height: {$mapHeight}px;\" class=\"googleMap\"></div>";
    }

    function EditLink() {
        $page = DataObject::get_one('MyEvents');
        if (!$page) {
            user_error('Cannot find My Events. Please create one in the CMS!', E_USER_ERROR);
        }
        return $page->Link() . 'edit/' . $this->ID;
    }

    function MessageLink() {
        $page = DataObject::get_one('MyEvents');
        if (!$page) {
            user_error('Cannot find My Events. Please create one in the CMS!', E_USER_ERROR);
        }
        return $page->Link() . 'sendmessage/' . $this->ID;
    }

    function JoinPage() {
        $page = DataObject::get_one('JoinPage');
        if (!$page) {
            user_error('Cannot find the Join Page. Please create one in the CMS!', E_USER_ERROR);
        }
        return $page->Link();
    }

    function CreatedByMe() {
        $memberid = Member::currentUserID();
        $cleanupID = $this->ID;
        $cleangroup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'");
        $creatorID = $cleangroup->CreatorID;
        if ($creatorID == $memberid) {
            return true;
        } else {
            return false;
        }
    }

    function AlreadyJoined() {
        $member = Member::currentUser();
        $joinedcleanups = $member->getManyManyComponents("CleanUpGroups");
        $cleanupID = $this->ID;
        $cleangroup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'");
        if ($joinedcleanups) {
            foreach ($joinedcleanups as $joinedcleanup) {
                $jid = $joinedcleanup->ID;
                if ($jid == $cleanupID) {
                    return true;
                }
            }
        }
        return false;
    }

    function Contacts() {
        $members = $this->getManyManyComponents("Members");
        $emails = $members->Email;
        return $emails;
    }

    function Creator() {
        $cleanupID = $this->ID;
        $createdby = $this->CreatorID;
        $admin = DataObject::get_one('Member', "Member.ID = '$createdby'");
        $admincontact = $admin->Email;
        return $admincontact;
    }

    function CreatorName() {
        $cleanupID = $this->ID;
        $createdby = $this->CreatorID;
        $admin = DataObject::get_one('Member', "Member.ID = '$createdby'");
        $adminname = $admin->FirstName . $admin->Surname;
        return $adminname;
    }

    function TotalCount() {
        $members = $this->getManyManyComponents("Members");
        if ($members) {
            $totalMems = $members->Count();
            return $totalMems;
        }
        return '0';
    }

    /* function Description() {
      $description = $this->Description;
      if ($description) {
      return $description;
      } else {

      $mydesc = 'This Clean Up Event has been organised to run on: ' . $this->Date;
      return $mydesc;
      }
      } */

    /* Uploading Images for Clean Up Events */

    function UploadLink() {
        $page = DataObject::get_one('MyEvents');
        if (!$page) {
            user_error('Cannot find My Events. Please create one in the CMS!', E_USER_ERROR);
        }
        return $page->Link() . 'upload/' . $this->ID;
    }

    function UploadBadgeLink() {
        $page = DataObject::get_one('MyEvents');
        if (!$page) {
            user_error('Cannot find My Events. Please create one in the CMS!', E_USER_ERROR);
        }
        return $page->Link() . 'uploadbadge/' . $this->ID;
    }

    function ImageGallery() {
        $cleanup = DataObject::get_by_id('CleanUpGroup', $this->ID);
        $album = DataObject::get_one('ImageGalleryAlbum', "CleanUpGroupID = '$cleanup->ID'");
        if ($album) {
            $folderid = $album->FolderID;
            $folder = DataObject::get_one('Folder', "ID = '$folderid'");
            $gallerylink = 'gallery10/album/' . $folder->Name;
            return $gallerylink;
        } else {
            return false;
        }
    }

    function googleMapEvent() {
        $startLat = $this->LocationLatitude;
        $startLng = $this->LocationLongitude;
        $zoom = "7";
        $mapWidth = "482"; //"365";
        $mapHeight = "450"; //"370";

        Requirements::javascript("http://maps.google.com/maps/api/js?sensor=true");
        Requirements::javascriptTemplate("googlemapselectionfield/javascript/GoogleMapDisplay.js", array('Name' => "topeventsmap",
                    'StartLat' => $startLat,
                    'StartLng' => $startLng,
                    'MapWidth' => $mapWidth,
                    'MapHeight' => $mapHeight,
                    'Zoom' => $zoom
                ));

        return "        <div class=\"googleMapField\">
                                <div id=\"map_topeventsmap\" style=\"width: {$mapWidth}px; height: {$mapHeight}px;\"></div>
			</div>";
    }

    function isPastEvent() {
        $now = date('Y-m-d H:i:s');
        if ($this->Date < $now)
            return true;
        else
            return false;
    }

    function CleanUpSponsorMessage() {
        return $this->CleanUpsPage()->findCleanUpSponsorMessage();
    }

    function isLongTitle() {
        if (strlen($this->Title) > 25)
            return true;
        else
            return false;
    }

}

?>
