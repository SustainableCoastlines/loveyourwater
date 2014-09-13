<?php

class FormCategory extends DataObject{
	
	static $db = array (
		'FieldName' => 'Text',
		'Title' => 'Text',
		'Description' => 'Text'
	);
	
	static $has_one = array (
		'DataEntryPage' => 'DataEntryPage'
	);
	
	static $has_many = array (
		'FormItems' => 'FormItem'
	);
	
	public function getCMSFields_forPopup() {
		$oFields = new FieldSet();
		
		$oFields->push(new TextField('FieldName', 'V.Important: No Spaces, Camel Case and abbreviate where possible'));
		$oFields->push(new TextField('Title'));
		$oFields->push(new TextField('Description'));
		
		return $oFields;
	}
	
	/**
	 * @return Comosite FieldSet with Categorys and Items
	 */
	function getCompositeField() {
		//create new composite field group for each category
		$oCatFieldSet = new CompositeField();	
		// Set the field group ID
		$oCatFieldSet->setID('Cat'.$this->ID);
		$oCatFieldSet->addExtraClass('category');
		//create new composite field group for each category
		$oCatField = new TextField($this->ID. '_'.$this->FieldName, $this->Title, null, null);
		$oCatField->addExtraClass('category-field');
		//Add Category Percentage Field to the Form 
		$oCatFieldSet->push($oCatField);
		if($this->Description){
			$oCatDescField = new LiteralField($this->ID. '_Description', '<p class="category-field-desc">'. $this->Description .'</p>');
			$oCatDescField->addExtraClass('category-field');	
			$oCatFieldSet->push($oCatDescField);
		}
		
		
		//Add item Composite Field to this Composite Field
			//now get all of the items matched with this category
			$oFormCategoryItems = self::FormCategoryItems();

			foreach($oFormCategoryItems as $item){
				$oCatFieldSet->push($item->getFormField());
			}
		
		return $oCatFieldSet;
	}
	
	/**
	 *
	 * @return array $FormCategoryItems objectset of FormItems
	 */
	public function FormCategoryItems() {
		// Set an empty return array
		$oFormCategoryItems = array();
		// Get all Items related to this Category
		$oFormCategoryItems = DataObject::get("FormItem","FormCategoryID = ". $this->ID);
		//Return 
		if($oFormCategoryItems){
			return $oFormCategoryItems;
		}
	}
	
	
}
 
?>