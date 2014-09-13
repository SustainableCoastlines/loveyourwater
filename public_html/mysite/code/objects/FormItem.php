<?php

class FormItem extends DataObject{
	
	static $db = array (
		'FieldName' => 'Text',
		'Title' => 'Text',
		'Description' => 'Text'
	);
	
	static $has_one = array (
		'DataEntryPage' => 'DataEntryPage',
		'FormCategory' => 'FormCategory'
	);
	
	static $has_many = array (
	);
	
	public function getCMSFields_forPopup() {
		
		$oFields = new FieldSet();
		
		$oFields->push(new TextField('FieldName', 'V.Important: No Spaces and abbreviated'));
		$oFields->push(new TextField('Title'));
		$oFields->push(new TextField('Description'));
		// If there are Categorys
		if (Dataobject::get('FormCategory')) {
			// Add a selection box
			$oFields->push(new DropdownField('FormCategoryID', 'FormCategory', self::FormCategorySections()));
		}
		
		return $oFields;
	}
	
	/**
	 * Custom getters
	 */
	function getCategoryName() {
		return $this->FormCategory()->Title;
	}
	
	function getCategoryNameFromId() {
		return $this->FormCategoryID;
	}
	
	
	
	/**
	 * Get the Category name to add into the CategorySections array drop-down list
	 *
	 * @return array $aCategorySections An array of mapped IDs and values
	 */
	public function FormCategorySections() {
		// Set an empty return array
		$aCategorySections = array();
		// Get all Categorys
		$oCategorySections = Dataobject::get('FormCategory');
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
		$oItemField = new TextField($this->ID .'_'. $this->FieldName, $this->Title, null, null);
		$oItemField->addExtraClass('category-item-field');
		return $oItemField;
	}
	
	
	
}
 
?>