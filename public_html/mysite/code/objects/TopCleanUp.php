<?php
class TopCleanUp extends DataObject {
 
	static $db = array(
		'InternalTitle' => 'Text'
	);
 
	static $has_one = array(
	    "CleanUpsPage" => "CleanUpsPage",
		"CleanUpGroup" => "CleanUpGroup"
	);
	
	
	public function getCMSFields_forPopup() {
		
		$groups_obj = DataObject::get('CleanUpGroup');
		$groups = $groups_obj->toDropdownMap('ID', 'Title', '(Select one)', true);
		
		return new FieldSet(
		new TextField( 'InternalTitle', 'InternalTitle' ),
		new DropdownField('CleanUpGroupID', 'Clean Up Event', $groups)
		);
	}

	

}

?>
