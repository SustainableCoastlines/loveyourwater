<?php

/**
 * @link CleanUpsPage
 */
class CleanUpsPage extends Page {

    static $db = array(
        "CleanUpSponsorMessage" => "HTMLText"
    );
    static $has_one = array(
        "CreateEventIcon" => "Image",
        "CommunityEventBadge" => "Image",
        "EmptyGalleryFiller" => "Image",
        "EmptyGalleryCreator" => "Image"
    );
    static $has_many = array(
        //"TopCleanUps" => "TopCleanUp",
        "CleanUpGroups" => "CleanUpGroup"
    );
    static $icon = "themes/lyc/images/treeicons/event";

    function getCMSFields() {
        $f = parent::getCMSFields();

        //All Clean Ups
        $manager = new DataObjectManager(
			$this,
			'CleanUpGroups',
			'CleanUpGroup',
			array('Title' => 'Title',
				'FromDate' => 'FromDate',
                                'ToDate' => 'ToDate',
				//'CoordinatorLastName' => 'LastName',
				'numberOfMembers' => 'No of Members',
				'getDOMThumbnail' => 'Event-Image',
				'getTopEventStatus' => 'Top Event',
				'machineTag' => 'Flickr Machine Tag',
				'CreatorName' => 'Created by',
				'Organisation' => 'Organisation',
			),
			'getCMSFields_forPopup',
			'',
			''
        );

        $manager->setFilter(
                'TopEvent', // The field we're filtering
                'Show Top Events or Community Events', // The label for the filter field
                array(
                    '0' => 'Show only Community Events',
                    '1' => 'Show only Top Events'
                ) // The dropdown map of values => display text. The values will be matched against the Author field.
        );
        $manager->addPermission("duplicate");
        $manager->setConfirmDelete(true);
        $f->addFieldToTab("Root.Content.AllEvents", $manager);

        $f->addFieldToTab("Root.Content.Main", new HtmlEditorField('CleanUpSponsorMessage', 'Cleanup sponsors title and message', 2, 4));
        $f->addFieldToTab("Root.Content.Main", new ImageUploadField('CreateEventIcon', 'Create Event Icon'));
        $f->addFieldToTab("Root.Content.Main", new ImageUploadField('CommunityEventBadge', 'Community Event Badge'));
        $f->addFieldToTab("Root.Content.Main", new ImageUploadField('EmptyGalleryFiller', 'Image to use when an event image gallery is empty'));
        $f->addFieldToTab("Root.Content.Main", new ImageUploadField('EmptyGalleryCreator', 'Image to use when an event image gallery is empty and being viewed by the event creator, also acts as upload link'));
       
        return $f;
    }

    static function get_cleanup_link($cleanupID, $urlSegment = false) {
        if (!$page = DataObject::get_one('CleanUpsPage')) {
            user_error('No CleanUpsPagee was found. Please create one in the CMS!', E_USER_ERROR);
        }
        return ($urlSegment ? $page->URLSegment . '/' : $page->Link()) . 'cleanup/' . $cleanupID;
    }

    static function join_cleanup_link($cleanupID, $urlSegment = false) {
        if (!$page = DataObject::get_one('CleanUpsPage')) {
            user_error('No CleanUpsPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
        return ($urlSegment ? $page->URLSegment . '/' : $page->Link()) . 'joinevent/' . $cleanupID;
    }

    static function remove_cleanup_link($cleanupID, $urlSegment = false) {
        if (!$page = DataObject::get_one('CleanUpsPage')) {
            user_error('No CleanUpsPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
        return ($urlSegment ? $page->URLSegment . '/' : $page->Link()) . 'removeevent/' . $cleanupID;
    }
	
	static function delete_cleanup_link($cleanupID, $urlSegment = false) {
        if (!$page = DataObject::get_one('CleanUpsPage')) {
            user_error('No CleanUpsPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
        return ($urlSegment ? $page->URLSegment . '/' : $page->Link()) . 'deleteevent/' . $cleanupID;
    }

    static function find_link($urlSegment = false) {
        if (!$page = DataObject::get_one('CleanUpsPage')) {
            user_error('No CleanUpsPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
        return ($urlSegment) ? $page->URLSegment : $page->Link();
    }
	
	static function send_email_link($cleanupID, $urlSegment = false) {
        if (!$page = DataObject::get_one('CleanUpsPage')) {
            user_error('No CleanUpsPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
        return ($urlSegment ? $page->URLSegment . '/' : $page->Link()) . 'emailmember/' . $cleanupID;
    }
	
	static function list_members_link($cleanupID, $urlSegment = false) {
        if (!$page = DataObject::get_one('CleanUpsPage')) {
            user_error('No CleanUpsPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
        return ($urlSegment ? $page->URLSegment . '/' : $page->Link()) . 'listmembers/' . $cleanupID;
    }

    function findCommunityEventBadge() {
        return $this->CommunityEventBadge();
    }

    function findEmptyGalleryFiller() {
        return $this->EmptyGalleryFiller();
    }

    function findEmptyGalleryCreator() {
        return $this->EmptyGalleryCreator();
    }

    function findCleanUpSponsorMessage() {
        return $this->CleanUpSponsorMessage;
    }

}

class CleanUpsPage_Controller extends Page_Controller {

    public function init() {
        parent::init();
       
	Requirements::customScript('
		  jQuery(".contact").fancybox({
			  "titlePosition"		: "inside",
			  "zoomSpeedIn":	0,
                            "zoomSpeedOut":	0,
                          "scrolling":         "vertical"
			});
		  
		  //VITALSCRIPT!!!
		  jQuery("a.contact").bind("click", function(){
			 var myval = $(this).attr("id");
			 jQuery("#SendForm_SendForm_CleanupID").attr("value", myval);
		  });


		  jQuery(".info-popup").fancybox({
			  "titlePosition"		: "inside",
			  "zoomSpeedIn":	0,
                            "zoomSpeedOut":	0,
                          "scrolling":         "vertical"
			});

		  ');
   
    }

    public static $allowed_actions = array(
    );

    function community($request) {

        $now = date('Y-m-d H:i:s');
        if ($allcommunityEvents = Dataobject::get('CleanUpGroup', "(TopEvent = 0)&(Date >= '$now')", "Date ASC")) {
            return array('AllCommunityEvents' => $allcommunityEvents);
        } else {
            return array(
                'AllCommunityEvents' => false,
                'Message' => 'There was a problem'
            );
        }
    }

    function past($request) {
        $now = date('Y-m-d H:i:s');
        if ($allpastEvents = Dataobject::get('CleanUpGroup', "(Date < '$now')", "Date DESC")) {
            return array('AllPastEvents' => $allpastEvents);
        } else {
            return array(
                'AllPastEvents' => false,
                'Message' => 'There was a problem'
            );
        }
    }

    function cleanup($request) {
        Requirements::themedCSS('cleanup');
        if ($cleanupID = $request->param('ID')) {
            if ($cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'")) {
                //$cleanup->JoinForm = CleanUpsPage_Controller::JoinForm($cleanupID);
                return array('CleanUpEvent' => $cleanup);
            } else {
                return array(
                    'CleanUpEvent' => false,
                    'Message' => 'This clean up event seems to be linked incorrectly.'
                );
            }
        } else {
            return array(
                'CleanUpEvent' => false,
                'Message' => 'This clean up event seems to be linked incorrectly.'
            );
        }
    }
	
	
	function deleteevent($request) {
        $iMemberID = Member::currentUserID();
        if ($iMemberID && $iEventID = $request->param('ID')) {
			$oEvent = DataObject::get_by_id('CleanUpGroup', $iEventID);
			$iCreatorID = $oEvent->CreatorID;
            //checking that the member logged in does own this event
			if ($iMemberID == $iCreatorID) {
				//if($oEvent->EventImage()){$oEvent->EventImage()->delete();}
				$oEvent->delete();
				Director::redirect('my-events/');
            } else {
                Director::redirectBack();
            }
        }
    }

    function joinevent($request) {
        $member = Member::currentUser();
        if ($cleanupID = $request->param('ID')) {
            if ($cleangroup = DataObject::get_by_id('CleanUpGroup', $cleanupID)) {
                $memberid = Member::currentUserID();
                //$curr_mems = $cleangroup->JoinedCount;
                //Send an email
                $emailmsg = new EventEmail();
                $emailmsg->MemberID = $memberid;
                $emailmsg->FirstName = $member->FirstName;
                $emailmsg->Subject = 'Thanks for Joining in on Love Your Coast';
                $emailmsg->Recipient = $member->Email;
                $emailmsg->CleanUpGroupID = $cleanupID;
                $emailmsg->write();
                $emailmsg->joinEmail();

                //Add the member as a Joined record
                $cleanup = DataObject::get_by_id('CleanUpGroup', $cleanupID);
                //$cleanup->JoinedCount = ++$curr_mems;
                $cleanup->write();
                //Add the member to the group
                $member->CleanUpGroups()->add($cleangroup);

                // Redirect to my cleanup week
                Director::redirect($cleangroup->Link());
            } else {
                Director::redirectBack();
            }
        }
    }

    function removeevent($request) {
        $member = Member::currentUser();
        if ($cleanupID = $request->param('ID')) {
            if ($cleangroup = DataObject::get_by_id('CleanUpGroup', $cleanupID)) {
                $curr_mems = $cleangroup->numberOfMembers();
                //Remove the member as a Joined record but only if theyr not the last
                if ($curr_mems > 1) {
                    $cleanup = DataObject::get_by_id('CleanUpGroup', $cleanupID);
                    //$cleanup->JoinedCount = $curr_mems - 1;
                    $cleanup->write();
                }
                $member->CleanUpGroups()->remove($cleangroup);
                // Redirect back on current URL
                Director::redirectBack();
            } else {
                Director::redirectBack();
            }
        }
    }

    function SendForm($cleanupID) {
        return new SendForm($this, 'SendForm', $cleanupID);
    }
	
	function emailmember($request) {
        $member = Member::currentUser();
        if ($member && $cleanupID = $request->param('ID')) {
            if ($cleangroup = DataObject::get_by_id('CleanUpGroup', $cleanupID)) {
                $memberid = Member::currentUserID();
				$oSendForm = self::SendForm($cleanupID);
				//return records
				return $this->customise(array(
					'Title' => 'Send Group Email to Members',
					'Event' => $cleangroup,
					'SendForm' => $oSendForm
				))->renderWith(array('CleanUpsPage_send', 'Page'));
            } else {
                Director::redirectBack();
            }
        }
    }
	
	function listmembers($request) {
		$iMemberID = Member::currentUserID();
        if ($iMemberID && $iEventID = $request->param('ID')) {
			$oEvent = DataObject::get_by_id('CleanUpGroup', $iEventID);
			$iCreatorID = $oEvent->CreatorID;
            //checking that the member logged in does own this event
			if ($iMemberID == $iCreatorID) {
				//return records
				return $this->customise(array(
					'Title' => 'Event members list',
					'Event' => $oEvent
				))->renderWith(array('CleanUpsPage_listmembers', 'Page'));
            } else {
                Director::redirectBack();
            }
        }
    }
	
	/**                                                              
	 * Create a Entry form                          
	 *                                                               
	 * @return object $oForm The request form                      
	 */
	function EventFilterForm() { 
        // Create the DataEntry form
        $oForm = new EventFilterForm($this, 'EventFilterForm');
        // Return the form
        return $oForm;
	}

    //Create a clean up page link
    function CreatePage() {
        $page = DataObject::get_one('CreatePage');
        if (!$page) {
            user_error('Cannot find the Create Page. Please create one in the CMS!', E_USER_ERROR);
        }
        return $page->Link();
    }
	
    
    function Events() {
        $now = date('Y-m-d H:i:s');	
        $oAllEvents = Dataobject::get('CleanUpGroup', "(ToDate > '$now')", 'FromDate ASC', '', 10);
        if ($oAllEvents) {
            return $oAllEvents;
        } else {
            return array(
                'Events' => null,
                'Message' => 'Sorry no events for us to show you'
            );
        }
    }
	
	function RecentEvents(){
		if(!isset($_GET['recent']) || !is_numeric($_GET['recent']) || (int)$_GET['recent'] < 1){
			$_GET['recent'] = 12;
		}
		// Filter Dates
		$sRecent = (int)$_GET['recent'];
		$now = date('Y-m-d H:i:s');
		//Get Events
		$oEvents = DataObject::get(
			$callerClass = "CleanUpGroup",
			$filter = "(ToDate < '$now')",
			//$filter = "`TestimonialPageID` = '34'",
			$sort = "ToDate DESC",
			$join = "",
			$limit = "$sRecent"
		);
		//Return $oEvents object
		return $oEvents;
		
	}
	
	
	/**
     * Display a filtered set of results from EventFilterForm
     * 
     * @param  string $request Array, start, sFilterCountry, sFilterFromDate, sFilterToDate
     */
	function showevents($request) {
		
		if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1){
			$_GET['start'] = 0;
		}
		$SQL_start = (int)$_GET['start'];
		$limit = 10;
		
		//set a session and get the session variables here
		$sFilterCountry = Session::get('FilterCountry');
		$sFilterFromDate = Session::get('FilterFromDate');
		$sFilterToDate = Session::get('FilterToDate');
		
		//reformat the date
		$sSearchFromDate = self::ReformatDate($sFilterFromDate);
        $sSearchToDate = self::ReformatDate($sFilterToDate);
		
		//query database
		$SQL_start = (int)$_GET['start'];
		$oEvents = DataObject::get(
			$callerClass = "CleanUpGroup",
			$filter = "`Country` = '" . $sFilterCountry . "' AND ( `FromDate` BETWEEN '" . $sSearchFromDate . "' AND '" . $sSearchToDate . "' )",
			//$filter = "`TestimonialPageID` = '34'",
			$sort = "FromDate ASC",
			$join = "",
			$limit = "{$SQL_start}, $limit"
		);
		
		//$oEvents->setPageLength($limit);
		
		//return records
		return $this->customise(array(
			'Results' => $oEvents,
			'CountryQuery' => $sFilterCountry,
			'FromQuery' => $sFilterFromDate,
			'ToQuery' => $sFilterToDate
		))->renderWith(array('CleanUpsPage_filter', 'Page'));
		
	}
	
	public function GetCurrentTimeStamp() {
        //date_default_timezone_set('America/Los_Angeles');
        date_default_timezone_set('Pacific/Auckland');
		return time();
		
    }
	
	/**
     * Reformat a data string into an American date format, as used by MySQL Date field
     * 
     * @param  string $sOldDateFormat The old date format string
     * @return string $sNewDateFormat The new date format string
     */
    public function ReformatDate($sOldDateFormat) {
        // If the date contains forward slashes
        if (stristr($sOldDateFormat, '/')) {
            // Explode the date into an array
            $aDate = explode('/', $sOldDateFormat);
            // List the array as variables
            list($sDay, $sMonth, $sYear) = $aDate;
            // Create the new date format string
            $sNewDateFormat = $sYear . '-' . $sMonth . '-' . $sDay;
            // Return the new date string
            return $sNewDateFormat;
        // Otherwise just return the date
        } else {
            return $sOldDateFormat;
        }  
    }
	
	

}

?>