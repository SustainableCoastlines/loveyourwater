<?php
/**
 * Defines the EntryForm
 */
class EventFilterForm extends Form 
{
 	/**                                                              
	 * Constructor                                                   
	 *                                                               
	 * @param  object $controller The controller class                           
	 * @param  string $name       The name of the form class              
	 * @return object The form                                       
	 */
 	function __construct($controller, $name) {  
		
		//FILTER BLOCK 1 : WHERE ARE YOU
		
		
		// Create new group
		$oFilterField1 = new CompositeField();
		// Set the field group ID
		$oFilterField1->setID('Group1');
		// Add fields to the group
		$oFilterField1->push(new LiteralField('Group1Title', '<div class="filter-title-block">Where are you?</div>'));
		$oFilterField1->push(new DropdownField('Country', '', Geoip::getCountryDropDown(), 'NZ'));
        
		//FILTER BLOCK 2: UPLOAD IMAGE
		
		// Create new group
		$oFilterField2 = new CompositeField();	
		// Set the field group ID
		$oFilterField2->setID('Group2');
		// Add fields to the group
		$oFilterField2->push(new LiteralField('Group2Title', '<div class="filter-title-block">When can you help?</div>'));
		//Set Date Defaults
		$tToday = mktime(0,0,0,date("m"),date("d"),date("Y"));
		$dToday = date("d/m/Y", $tToday);
		$tNextMonth = mktime(0,0,0,date("m")+2,date("d"),date("Y"));
		$dNextMonth = date("d/m/Y", $tNextMonth);
		//Check if Dates are Set otherwise use Defaults
		$sFromDate      = ($this->sFromDate != '')      ? $this->sFromDate      : $dToday;
                $sToDate        = ($this->sToDate != '')        ? $this->sToDate        : $dNextMonth;
		
		
		//Date Fields
		$oFromDate = new DatePickerField('FromDate', 'From', $sFromDate);
                $oToDate = new DatePickerField('ToDate', 'To', $sToDate);
		$oFilterField2->push($oFromDate);
                $oFilterField2->push($oToDate);
		
		DatePickerField::$showclear = false;
		
		// Create new fieldset
		$oFields = new FieldSet();
		// Add the groups to the fieldset
		$oFields->push($oFilterField1);
		$oFields->push($oFilterField2);
		
		// Create the form action
		$oAction = new FieldSet(
			new FormAction('SubmitFilter', 'Find events')
		);
		
        // Add custom jQuery validation script for requred fields
		Requirements::customScript('
			
		');
		
		// Construct the form
		parent::__construct($controller, $name, $oFields, $oAction);
		
		
		
	}
	
	
	/**
	* SubmitFilter Form
	* 
	*/
	function SubmitFilter($data, $form, $request){
		
		// Get the current timestamp
        $iCurrentTimestamp = self::GetCurrentTimeStamp(); 
		
		/* selected Country */
		$oSelectedCountry = $data['Country'];
		$sFromDate = (isset($data['FromDate']) && !empty($data['FromDate'])) ? $data['FromDate'] : date('d/m/Y', $iCurrentTimestamp);
        $sToDate = (isset($data['ToDate']) && !empty($data['ToDate'])) ? $data['ToDate'] : date('d/m/Y', $iCurrentTimestamp);
		
		//set session variables to use on the showevents function
		Session::set('FilterCountry', $oSelectedCountry);
		Session::set('FilterFromDate', $sFromDate);
		Session::set('FilterToDate', $sToDate);
		
		Director::redirect('Events/showevents');

	}
	
	
	 public function GetCurrentTimeStamp() {
        //date_default_timezone_set('America/Los_Angeles');
        date_default_timezone_set('Pacific/Auckland');
		return time();
    }
	
	/**
     * Reformat a data string into an American date format, as used by MySQL Date field
     * 
     * @param  string $sOldDateFormat The old date format string
     * @return string $sNewDateFormat The new date format string
     */
    public function ReformatDate($sOldDateFormat) {
        // If the date contains forward slashes
        if (stristr($sOldDateFormat, '/')) {
            // Explode the date into an array
            $aDate = explode('/', $sOldDateFormat);
            // List the array as variables
            list($sDay, $sMonth, $sYear) = $aDate;
            // Create the new date format string
            $sNewDateFormat = $sYear . '-' . $sMonth . '-' . $sDay;
            // Return the new date string
            return $sNewDateFormat;
        // Otherwise just return the date
        } else {
            return $sOldDateFormat;
        }  
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