<?php

class DataCategory extends DataObject
{
	static $db = array (
		'Title' => 'Text',
		'Percentage' => 'Text'
	);
	
	static $has_one = array (
		'DataEntryPage' => 'DataEntryPage',
		'DataSheet' => 'DataSheet',
		'Member' => 'Member'
	);
	
	static $has_many = array (
		'DataItems' => 'DataItem',
	);
	
	//ModelAdmin
	static $searchable_fields = array(
		'Title' => array(
			'title' => 'Title'
		),
		'Percentage' => array(
			'Percentage' => 'Percentage'
		)
	);
	static $summary_fields = array(
		'DataSheetID' => 'DataSheetID',
		'Title' => 'Title',
		'Percentage' => 'Percentage'
	); 
	
	public function RelatedClasses() {
		return array(
			'DataSheet',
			'DataItem',
			'Member'
		);
	}
	
	public function getCMSFields_forPopup() {
		$oFields = new FieldSet();
		
		$oFields->push(new TextField('Title'));
		$oFields->push(new TextField('Percentage'));
		
		return $oFields;
	}
	
	
	function getCompositeField() {
		//create new composite field group for each category
		$oCatFieldSet = new CompositeField();	
		// Set the field group ID
		$oCatFieldSet->setID('Cat'.$this->ID);
		$oCatFieldSet->addExtraClass('category');
		//create new composite field group for each category
		$oCatField = new TextField('Cat_' . $this->ID, $this->Title, $this->Percentage, null);
		$oCatField->addExtraClass('category-field');
		//Add Category Percentage Field to the Form 
		$oCatFieldSet->push($oCatField);
		if($this->Description){
			$oCatDescField = new LiteralField('Desc_' . $this->ID. '_Description', '<p class="category-field-desc">'. $this->Description .'</p>');
			$oCatDescField->addExtraClass('category-field');	
			$oCatFieldSet->push($oCatDescField);
		}
		//Add item Composite Field to this Composite Field
			//now get all of the items matched with this category
			$oItems = $this->DataItems();
			foreach($oItems as $oItem){
				$oCatFieldSet->push($oItem->getFormField());
			}
		
		return $oCatFieldSet;
	}
	
	
	/**
	 *
	 * @return array $DataCategoryItems objectset of FormItems
	 */
	public function DataCategoryItems() {
		// Set an empty return array
		$iSheetID = $this->DataSheetID;
		// Get all Items related to this Category
		$oDataCategoryItems = DataObject::get('DataItem', "DataCategoryID = '$this->ID' AND DataSheetID = '$iSheetID'");
		//Return 
		if($oDataCategoryItems){
			return $oDataCategoryItems;
		}
	}
	
	
}
 
?>