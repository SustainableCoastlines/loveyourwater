<?php
/**                                                                                             
 * MenuItemCsvBulkLoader class. Extends CsvBulkLoader class.                                    
 * Process an uploaded CSV file and distribute it into various tables.                          
 *                                                                                              
 * @contact colin@toast.co.nz                                                                   
 * @date    23 June 2011                                                                        
 */
class DataSheetCsvBulkLoader extends CsvBulkLoader {
   
	public $columnMap = array(
		'Item' => '->importDataItem',
		'Category' => '->importDataCategory',
		'Name' => '->importItemName',
		'Amount' => 'Text',
		'Weight' => 'Text',
		'Volume' => 'Text'
	);
	
	public $duplicateChecks = array(
		'ItemName' => 'ItemName'
	);
	
	public $relationCallbacks = array(
	);
	
	/**
	 * Import the menu item Name
	 * Check for existing item with same ItemName and Subsection, and either update or insert.
	 *
	 * @param  object &$obj   The menu item object
	 * @param  string $val    The value of the ItemName
	 * @param  array  $record The record from the CSV
	 * @return void
	 */
	static function importItemName(&$obj, $val, $record) {
		$SQL_val = Convert::raw2sql($val);
		$oSubSection = DataObject::get_one('MenuSubSection', "Title = '{$record['->importSubsection']}'");
		// If the oSubSection object is not empty
		if (!empty($oSubSection)) {
			$oItem = DataObject::get_one('MenuItem', "ItemName = '{$SQL_val}' AND `MenuSubSectionID`=" . $oSubSection->ID);
		}
		// If the oItem object is not empty
		if (!empty($oItem)) {	
			$obj->ID = $oItem->ID;
			$obj->ItemName = $oItem->ItemName;
		} else {
			$obj->ItemName = $val;
		}
	}
	
	/**
	 * Import the menu item Section
	 * Check for existing records, ensuring no duplicates.
	 *
	 * @param  object &$obj   The menu item object
	 * @param  string $val    The name of the Section
	 * @param  array  $record The record from the CSV
	 * @return void
	 */
	static function importSection(&$obj, $val, $record) {
		// Get the Section Title from the passed in value
		$SQL_val = Convert::raw2sql($val);
		// Get a MenuSection record that matches the Title
		$oResult = DataObject::get_one('MenuSection', "Title = '{$SQL_val}'");
		// If no record with the current Title exists
		if (!$oResult) {
			// Set a new MenuSection object
			$oSection = new MenuSection();
			// Set the Title to the passed in value
			$oSection->Title = $SQL_val;
			// Set the MenuPageID from the session MenuPageID var
			$oSection->MenuPageID = Session::get('MenuPageID');
			// If there are SectionImageIDs session vars set in the load method
			if (Session::get('SectionImageIDs')) {
				// Loop through the session SectionImageIDs
				foreach (Session::get('SectionImageIDs') as $title => $imageId) {
					// If the MenuSection object Title matches the title of the session record
					if (strtolower($oSection->Title) == $title) {
						// Set the image ID for the MenuSection object
						$oSection->SectionImageID = $imageId;
					}
				}
			}
			// Save the MenuSection record
			$iResult = $oSection->write();
			// Set the MenuSectionID ID from the insert result
			$obj->MenuSubSection()->MenuSectionID = $iResult;
		} else {
			// Set the MenuSectionID from the existing record
			$obj->MenuSubSection()->MenuSectionID = $oResult->ID;
		}
		// Return the result
		//return $oResult;
	}
	
	/**
	 * Import the menu item Subsection
	 * Check for existing records, ensuring no duplicates.
	 *
	 * @param  object &$obj   The menu item object
	 * @param  string $val    The name of the Subsection
	 * @param  array  $record The record from the CSV
	 * @return void
	 */
	static function importSubsection(&$obj, $val, $record) {
		// Get the Subsection Title from the passed in value
		$SQL_val = Convert::raw2sql($val);
		// Get the MenuSection record by Title
		$oSection = DataObject::get_one('MenuSection', "Title = '{$record['->importSection']}'");
		// Get a MenuSubSection record that matches the Title and the Section
		$oResult = DataObject::get_one('MenuSubSection', "Title = '{$SQL_val}' AND `MenuSectionID`=" . $oSection->ID);
		// If no record with the current Title exists
		if (!$oResult) {
			$oSubSection = new MenuSubSection();
			$oSubSection->Title = $SQL_val;
			// Set the MenuSectionID
			$oSubSection->MenuSectionID = $oSection->ID;
			// Save the Subsection record
			$iResult = $oSubSection->write();
			// Set the MenuSubsection ID from the insert result
			$obj->MenuSubSectionID = $iResult;
		} else {
			// Set the MenuSubSectionID from the existing record
			$obj->MenuSubSectionID = $oResult->ID;
		} 
		// Return the result
		//return $oResult;
	}
	
	/**
	 * ----------------------------------------------------------------------------------- 
	 * Overload the load method of the BulkLoader class.                                   
	 * Optionally empty all related tables if required.                                    
	 *                                                                                     
	 * @return BulkLoader_Result See {@link self::processAll()}                            
	 * ----------------------------------------------------------------------------------- 
	 */
	public function load($filepath) {
		// Set the execution time and memory limit
		ini_set('max_execution_time', 3600);
		increase_memory_limit_to('512M');
		// Automatically remove all records before uploading new ones
		$this->deleteExistingRecords = true;
		// If the existing tables need to be emptied 
		if($this->deleteExistingRecords) { 
			// ---------------------------------------------------------- 
			// START : Get MenuSection table data for later use           
			// ---------------------------------------------------------- 
			// Get the MenuPageID
			$result = DataObject::get_one('MenuSection');
			// If there is a record
			if ($result) {
				// Set it into a session var
				Session::set('MenuPageID', $result->MenuPageID);
			// Otherwise
			} else {
				// Set the session var to 0
				Session::set('MenuPageID', 0);	
			}
			// Get any SectionImageIDs
			$result = DataObject::get('MenuSection');
			// If there are records returned
			if ($result) {
				// Add them into an array with the Title as the key
				$aImageIDs = array();
				foreach ($result as $record) {
					$aImageIDs[strtolower($record->Title)] = $record->SectionImageID;
				}
				// Set the array into a session var
				Session::set('SectionImageIDs', $aImageIDs);
			}
			// ---------------------------------------------------------- 
			// END : Get MenuSection table data for later use             
			// ---------------------------------------------------------- 
			// Empty the MenuItems table. Using TRUNCATE resets the ID value. 
			$sql = "TRUNCATE TABLE `" . $this->objectClass . "`";
			DB::query($sql);
			// This built-in functionality does not reset the ID values.
			/*
			$q = singleton($this->objectClass)->buildSQL();
			$q->select = array('"ID"');
			$ids = $q->execute()->column('ID');
			foreach($ids as $id) { 
				$obj = DataObject::get_by_id($this->objectClass, $id);
				$obj->delete(); 
				$obj->destroy();
				unset($obj);
			} 
			*/
			// Set a new instance of this current class
			$oThisClass = new $this->objectClass();
			// Get the related classes
			$aRelatedClasses = $oThisClass->RelatedClasses();
			// Loop through the related classes and empty the tables
			foreach ($aRelatedClasses as $Class) {	
				// Empty the related tables. Using TRUNCATE resets the ID values so that the navigation links don't change. 
				$sql = "TRUNCATE TABLE `" . $Class . "`";
				DB::query($sql);
				// This built-in functionality does not reset the ID values.
				/*
				$q = singleton($Class)->buildSQL();
				$q->select = array('"ID"');
				$ids = $q->execute()->column('ID');
				foreach($ids as $id) { 
					$obj = DataObject::get_by_id($Class, $id);
					$obj->delete(); 
					$obj->destroy();
					unset($obj);
				} 
				*/
			}
		} 
		// Process all the new records
		return $this->processAll($filepath);
	}
	
	/**
	 * ----------------------------------------------------------------------------------- 
	 * Overload the processAll method of the CsvBulkLoader class.                          
	 * Used so that the session vars can be cleared once they are no longer needed.        
	 *                                                                                     
	 * @return BulkLoader_Result See {@link self::processAll()}                            
	 * ----------------------------------------------------------------------------------- 
	 */
	protected function processAll($filepath, $preview = false) {
		
		$results = new BulkLoader_Result();
		// NOTE: CSVParser BUGFIX should be present in the remapHeader method to allow spaces before/after headings in a CSV file.
		$csv = new CSVParser($filepath, $this->delimiter, $this->enclosure);
		// ColumnMap has two uses, depending on whether hasHeaderRow is set
		if($this->columnMap) {
			if($this->hasHeaderRow) $csv->mapColumns($this->columnMap);
			else $csv->provideHeaderRow($this->columnMap);
		}
		foreach($csv as $row) {
			$this->processRecord($row, $this->columnMap, $results, $preview);
		}
		// Clear the session variables we set in the load method
		Session::clear('MenuPageID');
		Session::clear('SectionImageIDs');
		// Return the process results
		//die();
		return $results;
	}
}
?>