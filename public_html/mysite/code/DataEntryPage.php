<?php
class DataEntryPage extends Page {
	
	static $icon = "themes/blackcandy/images/icons/page";
    
    public static $db = array(
		'Success' => 'HTMLText',
		'Failure' => 'HTMLText'
	);
	
	public static $has_one = array(
	);
	
	static $has_many = array(
		"DataSheets" => "DataSheet",
		"DataCategorys" => "DataCategory",
		"DataItems" => "DataItem",
		"FormCategorys" => "FormCategory",
		"FormItems" => "FormItem"
	);
	
	static $defaults = array(
    );
	
    function getCMSFields() {
        // Get the parent CMS fields
        $oFields = parent::getCMSFields();
        // Add some fields
        $oFields->addFieldToTab('Root.Content.FormMessages', new HtmlEditorField('Success','Success Message',3,""));
		$oFields->addFieldToTab('Root.Content.FormMessages', new HtmlEditorField('Failure','Failure Message',3,""));
		
		//Add Rubbish Collection FormCategorys
		$oCategories = new DataObjectManager(
			$this,
			'FormCategorys',
			'FormCategory',
			array('Title' => 'Title', 'Description' => 'Description'),
			'getCMSFields_forPopup'
		);
		// Set the Filter
		
		$oFields->addFieldToTab("Root.Content.FormCategories", $oCategories);
		
		//Add Rubbish Collection Category -> FormItems
		$oItems = new DataObjectManager(
			$this,
			'FormItems',
			'FormItem',
			array('FormCategory.Title' => 'Form Category', 'Title' => 'Title', 'Description' => 'Description'),
			'getCMSFields_forPopup' // Detail fields (function name or FieldSet object)
			// Filter clause
			// Sort clause
			// Join clause
		);
		$oFields->addFieldToTab("Root.Content.FormItems", $oItems);
		// Set the Filter
		$oItems->setFilter('FormCategoryID','Filter by FormCategorys', FormItem::FormCategorySections());
		
		//Add DataSheets
		$oDataSheets = new DataObjectManager(
			$this,
			'DataSheets',
			'DataSheet',
			array(
				'Participants' => 'Total Participants',
				'EstVolume' => 'Estimated Volume',
				'Image' => 'Image',
				),
			'getCMSFields_forPopup'
		);
		$oFields->addFieldToTab("Root.Content.DataSheets", $oDataSheets);
		
		
       // Return the fields
        return $oFields;
    }
	
	//delete DataSheet
	public function remove_datasheet_link($iDatasheetID, $urlSegment = false){
        if (!$page = DataObject::get_one('DataEntryPage')) {
            user_error('No DataEntryPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
		if($iDatasheetID && $page){
			return ($page->URLSegment . '/delete/' . $iDatasheetID);
		}
	}
	
	//edit DataSheet
	public function edit_datasheet_link($iDatasheetID, $urlSegment = false){
        if (!$page = DataObject::get_one('DataEntryPage')) {
            user_error('No DataEntryPage was found. Please create one in the CMS!', E_USER_ERROR);
        }
		if($iDatasheetID && $page){
			return ($page->URLSegment . '/edit/' . $iDatasheetID);
		}
	}

  
}
		 
class DataEntryPage_Controller extends Page_Controller {

	public function init() {		
		// Initiate the parent class
		parent::init();
        // jQuery for select menus
		// Validation Engine
		Requirements::themedCSS('validationEngine');
		Requirements::themedCSS('dataform');
		Requirements::javascript("mysite/js/jquery.validationEngine.js");
		Requirements::javascript("mysite/js/jquery.validationEngine-en.js");
		Requirements::block("mysite/javascript/jquery.jqtransform.js");
		// Set no validator(frontend) this is just for the Entry form
		Validator::set_javascript_validation_handler('none');
		
	}
    
	function CreateAccountLink() {
        return $this->URLSegment . '/createaccount';
    }
   	
	function createaccount(){
		return array(
            "ShowCreateAccountForm" => true
        );
	}
	
	//Registration form
    function RegisterForm() {
        return new RegisterForm($this, 'RegisterForm');
    }
	
    /**                                                              
	 * Create a Entry form                          
	 *                                                               
	 * @return object $oForm The request form                      
	 */
	function DataEntryForm() { 
        // Create the DataEntry form
		$oMember = Member::CurrentMember();
		$iCurrentMemberID = $oMember->ID;
		if ($iCurrentMemberID && $oEvent = DataObject::get_one('CleanUpGroup', "CreatorID = '$iCurrentMemberID'")) {
        	$oForm = new DataEntryForm($this, 'DataEntryForm');
		}else{
			$oForm = "<p>Please create a Clean up Before Sharing data.</p>";
		}
        // Return the form
        return $oForm;
	}
	
	function EditDataEntryForm($iDataSheetID = null) { 
        // Create the DataEntry form
        $oForm = new EditDataEntryForm($this, 'EditDataEntryForm', $iDataSheetID = null);
        // Return the form
        return $oForm;
	}
	
	public function dataentry(){
		// Create the DataEntry form
        $oForm = new DataEntryForm($this, 'DataEntryForm');
		$oMember = Member::CurrentMember();
		$iCurrentMemberID = $oCurrentMember->ID;
		if ($iCurrentMemberID && $oEvent = DataObject::get_one('CleanUpGroup', "MemberID = '$iCurrentMemberID'")) {
			// Return the form
			return $this->customise(array(
				'DataEntryForm' => $oForm,
				'Content' => $this->Content,
				'Title' => $this->Title	
			))->renderWith(array('DataEntryForm', 'DataEntryForm'));
		} else {
			Director::redirect('my-events/');
		}
	}
	
	public function datasheet($request){
		Requirements::themedCSS('datasheet');
        //Check For Data Sheet
		if ($iDataSheetID = $request->param('ID')) {
			$oCurrentMember = Member::CurrentMember();
			$iCurrentMemberID = $oCurrentMember->ID;
			if ($iCurrentMemberID && $oDataSheet = DataObject::get_one('DataSheet', "ID = '$iDataSheetID' AND MemberID = '$iCurrentMemberID'")) {
              $oDataEntryForm = self::DataEntryForm($this, 'DataEntryForm', $iDataSheetID);
			  return $this->customise(array(
					'ShowData' => true,
					'DataSheet' => $oDataSheet,
					'Content' => $this->Content,
					'Title' => $this->Title	
				));
			  /*  return $this->customise(array(
					'DataSheet' => $oDataSheet,
					'Content' => $this->Content,
					'Title' => 'Your Data Sheet Entry'
				))->renderWith(array('Page', 'DataEntrySheet'));*/
            }else{
				return $this->customise(array(
					'DataEntryForm' => false,
					'Content' => $this->Content,
					'Title' => $this->Title	
				));
			}
		}
	}
	
	function delete($request) {
		//Get the CurrentMember ID
        $oCurrentMember = Member::CurrentMember();
		$iCurrentMemberID = $oCurrentMember->ID;
		//Get the DataSheet ID
        if ($iDataSheetID = $request->param('ID')) {
			//Get the DataSheet and make sure it belongs to current member
            if ($oDataSheet = DataObject::get_one('DataSheet', "ID = '$iDataSheetID' AND MemberID = '$iCurrentMemberID'")) { 
                $oDataSheet->delete();
                // Redirect back on current URL
                Director::redirectBack();
            } else {
                Director::redirectBack();
            }
        }
    }
	
	function edit($request) {
		//Get the CurrentMember ID
        $oCurrentMember = Member::CurrentMember();
		$iCurrentMemberID = $oCurrentMember->ID;
		//Get the DataSheet ID
        if ($iDataSheetID = $request->param('ID')) {
			//Get the DataSheet and make sure it belongs to current member
            if ($oDataSheet = DataObject::get_one('DataSheet', "ID = '$iDataSheetID' AND MemberID = '$iCurrentMemberID'")) { 
            	$oForm = new EditDataEntryForm($this, 'EditDataEntryForm', $iDataSheetID);
				return $this->customise(array(
					'Edit' => 1,
					'DataEntryForm' => $oForm,
					'Title' => 'Edit Result Sheet'
				));
            } else {
                Director::redirectBack();
            }
        }
    }
	
	public function MyDataSheets(){
		$oCurrentMember = Member::CurrentMember();
		$iCurrentMemberID = $oCurrentMember->ID;
		if ($iCurrentMemberID && $oDataSheets = DataObject::get('DataSheet', "MemberID = '$iCurrentMemberID'")) {
			return $oDataSheets;
		}
	}
    
    /**                                                              
	 * Display a feedback message after successful data entry submission                 
	 *                                                               
	 * @return A customized array      
	 */
    function success() {
		return $this->customise(array(
			'Sent' => 1,
			'SuccessMessage' => $this->Success
		));
	}
	
	/**                                                              
	 * Display a feedback message after failed data entry submission                      
	 *                                                               
	 * @return A customized array      
	 */
    function failure() {
		return $this->customise(array(
			'Fail' => 1,
			'FailMessage' => $this->Failure
		));
	}
  
  
}