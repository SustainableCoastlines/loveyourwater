<?php

class DataItem extends DataObject
{
	static $db = array (
		'Title' => 'Text',
		'Amount' => 'Text',
		'Weight' => 'Text',
		'Volume' => 'Text'
	);
	
	static $has_one = array (
		'DataEntryPage' => 'DataEntryPage',
		'DataCategory' => 'DataCategory',
		'DataSheet' => 'DataSheet',
		'Member' => 'Member'
	);
	
	static $has_many = array(
	);
	
	//ModelAdmin
	static $searchable_fields = array(
		'DataSheetID' => array(
			'DataSheetID' => 'DataSheetID'
		),
		'DataSheet.CleanUpGroupID' => array(
			'DataSheet.CleanUpGroupID' => 'DataSheet.CleanUpGroupID'
		),
		'Member.FirstName' => array(
			'Member.FirstName' => 'Member.FirstName'
		),
		'Member.Email' => array(
			'Member.Email' => 'Member.Email'
		),
		'Amount' => array(
			'Amount' => 'Amount'
		),
		'Title' => array(
			'title' => 'Title'
		)
	);
	
	static $summary_fields = array(
		'DataSheetID' => 'DataSheetID',
		'DataSheet.CleanUpGroup.ID' => 'DataSheet.CleanUpGroup.ID',
		'DataSheet.CleanUpGroup.Title' => 'DataSheet.CleanUpGroup.Title',
		'Member.FirstName' => 'Member.FirstName',
		'Member.Email' => 'Member.Email',
		'DataSheet.Participants' => 'DataSheet.Participants',
		'DataSheet.EstVolume' => 'DataSheet.EstVolume',
		'DataCategory.Title' => 'DataCategory.Title',
		'DataCategory.Percentage' => 'DataCategory.Percentage',
		'Title' => 'ItemTitle',
		'Amount' => 'ItemAmount'
	); 
	
	public function RelatedClasses() {
		return array(
			'DataSheet',
			'DataCategory',
			'Member'
		);
	}
	
	
	public function getCMSFields_forPopup() {
		
		$oFields = new FieldSet();
		
		$oFields->push(new TextField('Title'));
		$oFields->push(new TextField('Amount'));
		// If there are Categorys
		if (Dataobject::get('DataCategory')) {
			// Add a selection box
			$oFields->push(new DropdownField('DataCategoryID', 'DataCategory', self::DataCategorySections()));
		}
		
		return $oFields;
	}
	
	/**
	 * Custom getters
	 */
	function getCategoryName() {
		return $this->DataCategory()->Title;
	}
	
	function getCategoryNameFromId() {
		return $this->DataCategoryID;
	}
	
	
	/**
	 * Get the Category name to add into the CategorySections array drop-down list
	 *
	 * @return array $aCategorySections An array of mapped IDs and values
	*/
	public function DataCategorySections() {
		// Set an empty return array
		$aCategorySections = array();
		// Get all Categorys
		$oCategorySections = Dataobject::get('DataCategory');
		if($oCategorySections){
			// Loop through each Category
			foreach ($oCategorySections as $category) {
				// Add it into the Categorys array
				$aCategorySections[$category->ID] = $category->Title;
			}
			// Return the Categorys array
			return $aCategorySections;
		}
	}
	
	/**
	 * @return TextField
	 */
	function getFormField() {
		$oItemField = new TextField('Item_'. $this->ID, $this->Title, $this->Amount, null);
		$oItemField->addExtraClass('category-item-field');
		return $oItemField;
	}
	
}
 
?>