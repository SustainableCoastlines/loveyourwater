<?php
/**
 * Defines the Entry Object type
 */
 
class DataSheet extends DataObject {
    static $db = array(
		'Participants' => 'Text',
		'EstVolume' => 'Text',
		'Sacks' => 'Text',
		'Time' => 'Text',
		'Distance' => 'Text',
		'Recipient' => 'Text' 
    );

    static $has_one = array(
		'DataEntryPage' => 'DataEntryPage',
        'DataImageFile' => 'DataImage_Image',
		'DataSheetFile' => 'File',
		'CleanUpGroup' => 'CleanUpGroup',
		'Member' => 'Member'
    );

    static $has_many = array(
		'DataCategorys' => 'DataCategory',
		'DataItems' => 'DataItem'
    );
	
	//ModelAdmin
	static $searchable_fields = array(
		'Participants' => array(
			'participants' => 'Participants'
		),
		'EstVolume' => array(
			'EstVolume' => 'EstVolume'
		)
	);
	
	static $summary_fields = array(
		'ID' => 'ID',
		'Member.FirstName' => 'Member.FirstName',
		'Member.Surname' => 'Member.Surname',
		'Member.Email' => 'Member.Email',
		'Participants' => 'Participants',
		'EstVolume' => 'EstVolume'
		
	); 
	
	
	public function RelatedClasses() {
		return array(
			'DataCategory',
			'DataItem',
			'Member'
		);
	}
	
	function Title(){
		$oCleanUpGroup = $this->CleanUpGroup();
		$sTitle = $oCleanUpGroup->Title . ' results';
		return $sTitle;
	}
	
	function Link(){
		$oDataEntryPage = DataObject::get_one('DataEntryPage');
		$sDataSheetLink = $oDataEntryPage->URLSegment . '/datasheet/' . $this->ID;
		return $sDataSheetLink;
	}
	
	//delete DataSheet
	public function canRemoveData(){
	   $oCurrentMember = Member::CurrentMember();
	   $iCurrentMemberID = $oCurrentMember->ID;
	   $iDataSheetID = $this->ID;
       if( $iCurrentMemberID && $oDataSheetID = DataObject::get('DataSheet', "ID = '$iDataSheetID' AND MemberID = '$iCurrentMemberID'")){
			return true;
		}
	}
	function DeleteLink() {
        return DataEntryPage::remove_datasheet_link($this->ID);
    }
	
	function canEditData(){
		$oCurrentMember = Member::CurrentMember();
		$iCurrentMemberID = $oCurrentMember->ID;
		$iDataSheetID = $this->ID;
		if( $iCurrentMemberID && $oDataSheetID = DataObject::get('DataSheet', "ID = '$iDataSheetID' AND MemberID = '$iCurrentMemberID'")){
			return true;
		}	
	}
	function EditLink() {
        return DataEntryPage::edit_datasheet_link($this->ID);
    }
   
    //use this function on form to Send Email Message To Site Admin
	function mailSiteOwner(){
		$this->sendClientData('DataSheet_SiteOwnerMessage');
	}
	//use this function on form to Send Email Message To Site User
	function mailSiteUser(){
		$this->sendUserData('DataSheet_SiteUserMessage');
	}
	
	/**
     * Send a message to the email recipient
     * 
     * @param object $emailClass The email class, found at the bottom of this page.
     */
	protected function sendClientData($oEmailClass) {
		// Set the email data vars based on form submission
 		$sFrom = $this->Member()->Email;
 		$sTo = $this->Recipient;
		$sSubject = 'New Data Sheet Entry from Love Your Coast';
		
		//Data fields to use in Email Template
		$sFullName = $this->Member()->FirstName .' '. $this->Member()->Surname ;
		$sEmail = $this->Member()->Email;
		$sParticipants = $this->Participants;
		$sEstVolume = $this->EstVolume;
		
		//Find out if there is a DataSheetFile
		$oDataSheetFile = $this->DataSheetFile();
		
        // create the email class
 		$oEmail = new $oEmailClass();
 		// Set the values
        $oEmail->setFrom($sFrom);
        $oEmail->setSubject($sSubject);
		// If testing mode is set in the _config.php file
        if (TESTING_ENTRY_FORM) {
            $oEmail->setTo(TESTING_EMAIL);
        } else {
            $oEmail->setTo($sTo);
            $oEmail->setBcc(TOAST_ADMIN);
        }
		// Populate the email template
		$oEmail->populateTemplate(
			array(
				'DataSheet' => $this,
				'DataFile' => $this->DataSheetFile(),
				'Event' => $this->CleanUpGroup(),
				'Participants' => $this->Participants,
				'Sacks' => $this->Sacks,
				'Time' => $this->Time,
				'Distance' => $this->Distance
			)
		);
		if($oDataSheetFile){
			$oEmail->attachFile($oDataSheetFile->getFullPath(), $oDataSheetFile->Name);
        }
        // Send the email
		$oEmail->send();
	}
	
   
   /**
     * Send a message to the user
     * 
     * @param object $emailClass The email class, found at the bottom of this page.
     */
	protected function sendUserData($oEmailClass) {
		// Set the email data vars based on form submission
 		$sFrom = 'noreply@loveyourcoast.org.nz';
 		$sTo = $this->Member()->Email;
		$sSubject = 'New Data Sheet Entry from Love Your Coast';
		
		//Data fields to use in Email Template
		$sFullName = $this->Member()->FirstName .' '. $this->Member()->Surname ;
		$sEmail = $this->Member()->Email;
		$sParticipants = $this->Participants;
		$sEstVolume = $this->EstVolume;
		
        // create the email class
 		$oEmail = new $oEmailClass();
 		// Set the values
        $oEmail->setFrom($sFrom);
        $oEmail->setSubject($sSubject);
		// If testing mode is set in the _config.php file
        if (TESTING_ENTRY_FORM) {
            $oEmail->setTo(TESTING_EMAIL);
        } else {
            $oEmail->setTo($sTo);
            $oEmail->setBcc(TOAST_ADMIN);
        }
		// Populate the email template
		$oEmail->populateTemplate(
			array(
				'DataSheet' => $this,
				'DataFile' => $this->DataSheetFile(),
				'Event' => $this->CleanUpGroup(),
				'Participants' => $this->Participants,
				'EstVolume' => $this->EstVolume,
				'Sacks' => $this->Sacks,
				'Time' => $this->Time,
				'Distance' => $this->Distance
			)
		);
        // Send the email
		$oEmail->send();
	}
	
	
	public static function save_current_entry() {
		$oDataSheet = new DataSheet();
		$oDataEntryPage = DataObject::get_one('DataEntryPage');
		$iDataEntryPageID = $oDataEntryPage->ID;
		$oDataSheet->DataEntryPageID = $iDataEntryPageID;
		$oDataSheet->write();
		return $oDataSheet;
	}
	
	
}

// Email Class for Sending Data Sheet to Site Owner
class DataSheet_SiteOwnerMessage extends Email {
	protected $ss_template = 'DataSheet_SiteOwnerMessage';
}

// Email Class for Sending Data Sheet to Site User
class DataSheet_SiteUserMessage extends Email {
	protected $ss_template = 'DataSheet_SiteUserMessage';
}

// Data Image Class
class DataImage_Image extends Image {
   function generateDataImageThumbnail($gd) {
      return $gd->croppedResize(150,150);
   }
   function generateDataImageMed($gd) {
      return $gd->croppedResize(250,250);
   }
   function generateDataImageFull($gd) {
      return $gd->croppedResize(620,620);
   }
      
   //Thumbnail
   function useThumb() {
      return $this->DataImageThumbnail();
   }
 
}