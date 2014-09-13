<?php
/**
 * Defines the EntryForm
 */
class DataEntryForm extends Form 
{
 	/**                                                              
	 * Constructor                                                   
	 *                                                               
	 * @param  object $controller The controller class                           
	 * @param  string $name       The name of the form class              
	 * @return object The form                                       
	 */
 	function __construct($controller, $name) {  
		
		//DATA STEP 1 : BASIC INFO
		
		// Create new group
		$oDataField1 = new CompositeField();
		// Set the field group ID
		$oDataField1->setID('Group1');
		// Add fields to the group
		$oDataField1->push(new LiteralField('Group1Title', '<div class="data-title-block"><img src="themes/lyc2012/img/s1.jpg" />
		<h2>Overview</h2><span>Basic event results. If you do not know the exact numbers, simply make an estimate.</span></div>'));
		$oDataField1->push(new DropdownField('CleanUpGroupID', 'Select an Event to add data for', self::mapCleanUps()));
		
		$oDataField1->push(new TextField('Participants', 'Number of participants'));
		$oDataField1->push(new LiteralField('Help1', '<p class="category-field-desc">How many people turned-up to help? Your number will be added to the tally at the top of this page.</p>'));
		
		$oDataField1->push(new TextField('Sacks', 'Sacks of rubbish'));
		$oDataField1->push(new LiteralField('Help2', '<p class="category-field-desc">How many full rubbish sacks did you collect? Your number will be added to the tally at the top of this page.</p>'));
		
		$oDataField1->push(new TextField('Distance', 'Distance covered'));
		$oDataField1->push(new LiteralField('Help3', '<p class="category-field-desc">How far did participants walk while cleaning-up? This provides an idea of the state of your coastlines.</p>'));
		
		$oDataField1->push(new TextField('Time', 'Time spent'));
		$oDataField1->push(new LiteralField('Help3', '<p class="category-field-desc">How long did participants spend cleaning-up? This provides an idea of the effort involved.</p>'));
		
		
        $oDataField1->push(new LiteralField('Group1Anchor', '
		<div class="Actions margin-top">
			<p class="continue">Got a photo or rubbish data? If yes, continue below. Otherwise</p><a class="orange action" href="#end">Finish now</a>
		</div>'));
		
		
		//DATA STEP 2 : UPLOAD IMAGE
		
		// Create new group
		$oDataField2 = new CompositeField();	
		// Set the field group ID
		$oDataField2->setID('Group2');
		//Set-up uploadify Field
		$oDataField2->push(new LiteralField('Group2Title', '<div class="data-title-block"><img src="themes/lyc2012/img/s2.jpg" />
		<h2>Photo</h2><span>(optional) If you do not have any photos from your event, skip this step. </span></div>'));
		
		$oDataField2->push(new SimpleImageField('DataImageFile', 'Upload event photo'));
		$oDataField2->push(new LiteralField('Help3', '<p class="category-field-desc">Any event photo, but the preference is for a photo of the rubbish collected or of your event participants. Max file size 100KB.</p>'));
		
		$oDataField2->push(new LiteralField('Group1Anchor', '
		<div class="Actions margin-top">
			<p class="continue">Got rubbish data? If yes, continue below. Otherwise</p><a class="orange action" href="#end">Finish now</a>
		</div>'));
		
		//DATA STEP 3 : DATA FIELDS
		
		// Create new group
		$oFieldsCat = new CompositeField();	
		$oFieldsCat->setID('Group3');
		
		
		$oFieldsCat->push(new LiteralField('Group3Title', '<div class="data-title-block"><img src="themes/lyc2012/img/s3.jpg" />
		<h2>Results</h2><span>(optional) Complete this section if you have estimated or counted the types of rubbish collected.</span></div>'));
		
		$oFieldsCat->push(new LiteralField('Group3Title2', '<div class="data-title-block"><img src="themes/lyc2012/img/either.png" />
		<h2>Upload</h2><span>Choose this option if you have filled-in your data electronically on our Event Results Spreadsheet.</span></div>'));
		
		$oFieldsCat->push(new FileField('DataSheetFile', 'Upload a spreadsheet containing your data'));
		//$oFieldsCat->push(new LiteralField('Help3', '<p class="category-field-desc">Choose this option if you have filled-in your data electronically on our Event Results Spreadsheet.</p>'));
		
		$oFieldsCat->push(new LiteralField('Group1Anchor', '
		<div class="Actions margin-top">
			<p class="continue">Skip this step and enter data below. Otherwise</p><a class="action orange" href="#end">Finish now</a>
		</div>'));
		
		$oFieldsCat->push(new LiteralField('Group3Title2', '<div class="data-title-block"><img src="themes/lyc2012/img/OR.png" />
		<h2>Enter</h2><span>Choose this option if you have recorded data but do not have it in our spreadsheet (e.g. you recorded it on paper).</span></div>'));
		
		//Get all FormCategorys
		$oFormCategorys = DataObject::get('FormCategory');
		if($oFormCategorys){
			foreach($oFormCategorys as $category){
				$oFieldsCat->push($category->getCompositeField());
			}
			
		}
		$oFieldsCat->push(new LiteralField('Group4Anchor', '
		<a name="end">&nbsp;</a>
		'));
		
		// Create new fieldset
		$oFields = new FieldSet();
		// Add the groups to the fieldset
		$oFields->push($oDataField1);
		$oFields->push($oDataField2);
		$oFields->push($oFieldsCat);
		//$oFields->push($oDataField4);
		
		// Create the form action
		$oAction = new FieldSet(
			new FormAction('SubmitDataSheet', 'Share Results')
		);
        
        // Add custom jQuery validation script for requred fields
		Requirements::javascript("mysite/javascript/DataFormVal.js");
		
		// Construct the form
		parent::__construct($controller, $name, $oFields, $oAction);
		
	}
	
	
	/**
	* DataEntry Form
	* 
	*/
	function SubmitDataSheet($data, $form, $request){
		// Create a new DataSheet object
		$oDataSheet = DataSheet::save_current_entry();
		$form->saveInto($oDataSheet);
		
		//save to current Member
		//check that this is member is the owner of the CleanUpEvent
		$oCurrentMember = Member::currentUser();
		$iMemberID = $oCurrentMember->ID;
		$oDataSheet->MemberID = $iMemberID;
		
		//Save Image
		
		//Save DataCategories -> DataItems
		$oDataEntryPage = DataObject::get_one('DataEntryPage');
		$iDataEntryPageID = $oDataEntryPage->ID;
		$oFormCategorys = DataObject::get('FormCategory', 'DataEntryPageID ='. $iDataEntryPageID, '', '');
		
		foreach($oFormCategorys as $category){
			$sCatFieldName = $category->ID. '_'.$category->FieldName;
			if($data[$sCatFieldName]){
				$oDataCategory = new DataCategory();
				$oDataCategory->Title = $category->Title;
				$oDataCategory->Percentage = $data[$sCatFieldName];
				//Save to page
				$oDataCategory->DataEntryPageID = $iDataEntryPageID;
				//Save to datasheet
				$oDataCategory->DataSheetID = $oDataSheet->ID;
				$oDataCategory->MemberID = $iMemberID;
				$oDataCategory->write();
				//Get the items
				$oCatItems = DataObject::get('FormItem', 'DataEntryPageID ='. $iDataEntryPageID . ' AND FormCategoryID = '. $category->ID, '', '');
				//Loop through category->items saving as DataItems
				foreach($oCatItems as $item){
					$oDataItem = new DataItem();
					$sItemFieldName = $item->ID .'_'. $item->FieldName;
					$oDataItem->Title = $item->Title;
					$oDataItem->Amount = $data[$sItemFieldName];
					//Save to page
					$oDataItem->DataEntryPageID = $iDataEntryPageID;
					//Save to datasheet
					$oDataItem->DataSheetID = $oDataSheet->ID;
					//Very Important that you save all items with the newly created Data Category ID
					$oDataItem->DataCategoryID = $oDataCategory->ID;
					$oDataItem->MemberID = $iMemberID;
					$oDataItem->write();	
				}
			}
		}
		//Write data to the data sheet
		$oDataSheet->write();
		// Email the administrator
        $oDataSheet->mailSiteOwner();
        // Email the user
		$oDataSheet->mailSiteUser();
		
		Director::redirect('my-data-sheets/success/');	
	}
	
	
	 /**
     * Map regions to an array
     * 
     * @return mixed An array of regions, or false 
     */
	function mapCleanUps() {
		// Get Member
		$oCurrentMember = Member::CurrentMember();
		$oCurrentMemberID = $oCurrentMember->ID;
		$oCleanUpGroups = DataObject::get('CleanUpGroup', "CreatorID = '$oCurrentMemberID'");
		
		// If there are CleanUpGroups
		if ($oCleanUpGroups) {
			// Set a return array
			$aReturn = array();
			// Loop through the CleanUpGroups
			foreach ($oCleanUpGroups as $oCleanUpGroup) {
				// Add the value, title, and class items
				$aReturn[$oCleanUpGroup->ID] = $oCleanUpGroup->Title;
			}
			// Return the array
			return $aReturn;
		} else {
			return false;	
		}
	}
	
	
}