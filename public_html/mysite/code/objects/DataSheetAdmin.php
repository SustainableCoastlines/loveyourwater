<?php

class DataSheetAdmin extends ModelAdmin {
   static $managed_models = array(
   	  'DataItem' => array('title' => "Items"),
	  'DataCategory' => array('title' => "Categorys"),
   	  'DataSheet' => array('title' => "DataSheets")
   );
   static $model_importers = array(  
   );
   static $url_segment = 'datasheets';
   static $menu_title = "Data Management"; 
   
   // NOTE: This will give a Notice error when in Dev mode. Not sure why, but the Notice can be ignored.
	public static $collection_controller_class = 'DataSheetAdmin_CollectionController';
}

class DataSheetAdmin_CollectionController extends ModelAdmin_CollectionController {
	/**
	 *                                                                                     
	 * Overload the CreateForm method of the ModelAdmin class.                             
	 *                                                                                     
	 * Used to remove the "Add" panel from the left menu.                                  
	 *                                                                                     
	 * @return boolean false                                                               
	 */
	public function CreateForm() {	
		return false;
	}
	
	/**
	 *                                                                                     
	 * Overload the ImportForm method of the ModelAdmin class.                             
	 *                                                                                     
	 * Used to remove the "Clear Database" checkbox from the import form.                  
	 * This allows the functionality to be hardcoded in the MenuItemCsvBulkLoader class.   
	 * See the overloaded "load" method of the MenuItemCsvBulkLoader class, where          
	 * "deleteExistingRecords" is set to true.                                             
	 *                                                                                     
	 * @return object Form                                                                 
	 */
	public function ImportForm() {
		$modelName = $this->modelClass;
		// check if a import form should be generated
		if(!$this->showImportForm() || (is_array($this->showImportForm()) && !in_array($modelName,$this->showImportForm()))) return false;
		$importers = $this->parentController->getModelImporters();
		if(!$importers || !isset($importers[$modelName])) return false;
		
		if(!singleton($modelName)->canCreate(Member::currentUser())) return false;

		$fields = new FieldSet(
			new HiddenField('ClassName', _t('ModelAdmin.CLASSTYPE'), $modelName),
			new FileField('_CsvFile', false)
		);
		
		// get HTML specification for each import (column names etc.)
		$importerClass = $importers[$modelName];
		$importer = new $importerClass($modelName);
		$spec = $importer->getImportSpec();
		$specFields = new DataObjectSet();
		foreach($spec['fields'] as $name => $desc) {
			$specFields->push(new ArrayData(array('Name' => $name, 'Description' => $desc)));
		}
		$specRelations = new DataObjectSet();
		foreach($spec['relations'] as $name => $desc) {
			$specRelations->push(new ArrayData(array('Name' => $name, 'Description' => $desc)));
		}
		$specHTML = $this->customise(array(
			'ModelName' => Convert::raw2att($modelName),
			'Fields' => $specFields,
			'Relations' => $specRelations, 
		))->renderWith('ModelAdmin_ImportSpec');
		
		//$fields->push(new LiteralField("SpecFor{$modelName}", $specHTML));
		//$fields->push(new CheckboxField('EmptyBeforeImport', 'Clear Database before import', false)); 
		
		$actions = new FieldSet(
			new FormAction('import', _t('ModelAdmin.IMPORT', 'Import from CSV'))
		);
		
		$validator = new RequiredFields();
		$validator->setJavascriptValidationHandler('none');
		
		$form = new Form(
			$this,
			"ImportForm",
			$fields,
			$actions,
			$validator
		);
		$form->setHTMLID("Form_ImportForm_" . $this->modelClass);
		return $form;
	}
	
	
}

?>