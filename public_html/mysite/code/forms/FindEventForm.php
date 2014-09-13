<?php
/**
 * Defines the SendForm page type
 */
 
class FindEventForm extends Form {
 
 function __construct($controller, $name) {
	 	
		$regions_obj = DataObject::get('Region');
		$regions = $regions_obj->toDropdownMap('Name', 'Name', '(Select one)', true);
		$cities_obj = DataObject::get('City');
		$cities = $cities_obj->toDropdownMap('Name', 'Name', '(Select one)', true);
		
		$Region = new DropdownField('Region', 'Region', $regions );
		$City = new DropdownField('City', 'Town/City', $cities);
		$Keyword = new TextField('Keyword','Keyword');
			
		$searchFields = new CompositeField(
			$Region,
			$City,
			$Keyword
		);
		
		$fields = new FieldSet($searchFields);
		
		$actions = new FieldSet(new FormAction('doSearch', 'find'));
	
	/* Requirements::javascript("mysite/javascript/jquery.doubleSelect.js");
		Requirements::javascript("mysite/javascript/FindEventForm.js"); */
		
	
		parent::__construct($controller, $name, $fields, $actions);
		
	}
	
	public function doSearch($data, $form) {
		
			$results = $this->getResults($data);
			$totalResults = $results->Count();
		
			return $this->customise(array(
				'Results' => $results, 
				'TotalResults' => $totalResults,
				'Title' => 'Clean Up Group(s) In your Area'
				
			))->renderWith(array('CleanUpsPage_results', 'Page'));
			
		}
		
	function getResults($searchCriteria = array()) {
			$start = ($this->request->getVar('start')) ? (int)$this->request->getVar('start') : 0;
			$limit = 3;
			
			$context = singleton('CleanUpGroup')->getDefaultSearchContext();
			$query = $context->getQuery($searchCriteria, null, array('start'=>$start,'limit'=>$limit));
			$records = $context->getResults($searchCriteria, null, array('start'=>$start,'limit'=>$limit));
			
			if($records) {
				$records->setPageLimits($start, $limit, $query->unlimitedRowCount());
				$totalResults = $records->Count();
				
				$i = 0; 
				$i < $totalResults; 
				foreach($records as $record){
					$record->Number = $i++;
				}
			}
			
			return $records;
		
		}


}



?>