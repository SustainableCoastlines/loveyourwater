<?php

/**
 * CreateForm is the Create A Clean Up Group Form
 *
 */
class CreateForm extends Form {

    function __construct($controller, $name, $TermsAndConditions, $TermsAndConditionsFileURL, $TermsAndConditionsAgreeText, $TermsAndConditionsName) {


		// Detail Fields
		// Create new group
		$oCleanDetailFields = new CompositeField();
		// Set the field group ID
		$oCleanDetailFields->setID('CreateDetails');
		// Add fields to the group
		$oCleanDetailFields->push(new LiteralField('Group1Title', '<div class="data-title-block"><img src="themes/lyc2012/img/fileicons/create_png.png" /><h2>Create your own event</h2><span> Enter as much detail as possible to make it easy for others to find and join your event.</span></div>'));
		$oCleanDetailFields->push(new TextField('Title', 'Event name'));
		$oCleanDetailFields->push(new LiteralField('Help', '<p class="help clear"> e.g. Location Name Beach Clean-up. Write something that describes what your event is all about.</p>'));

		$oCleanDetailFields->push(new SimpleHTMLEditorField('Description', 'Event details', '16', '18'));
		
		$oCleanDetailFields->push(new LiteralField('Help', '<p class="help clear"> Give additional details like what the organiser will provide (e.g. gloves, sacks), what participants will need to bring (e.g. food, drink, strong shoes) and anything else that will help people prepare for the event.</p>'));


		// Date Fields
		// Create new group
		$oCleanDateFields = new CompositeField();	
		// Set the field group ID
		$oCleanDateFields->setID('CreateDateTime');
		//$oCleanDateFields->push(new LiteralField('Group3Title', '<div class="data-title-block"><img src="themes/lyc2012/img/s3.jpg" /><h2>When Is Your Event?</h2><span>Please enter these basic details, if you do not wish to provide more, you can submit the form after this stage.</span></div>'));
		$oCleanDateFields->push(new DatePickerField('FromDate', 'Start date'));
		$oCleanDateFields->push(new TextField('FromTime', 'Start time'));
		$oCleanDateFields->push(new DatePickerField('ToDate', 'Finish date'));
		$oCleanDateFields->push(new TextField('ToTime', 'Finish time'));
		
		//Location Fields
		// Create new group
		$oCleanLocationFields = new CompositeField();	
		// Set the field group ID
		$oCleanLocationFields->setID('CreateLocation');
		//$oCleanLocationFields->push(new LiteralField('Group2Title', '<div class="data-title-block"><img src="themes/lyc2012/img/s2.jpg" /><h2>Where Is Your Event?</h2><span>Please enter these basic details, if you do not wish to provide more, you can submit the form after this stage.</span></div>'));
		$oCleanLocationFields->push(new DropdownField('Country', 'Country', Geoip::getCountryDropDown(), 'NZ'));
		//$oCleanLocationFields->push(new TextField('Region', 'Event Region'));
		$oCleanLocationFields->push(new TextField('LocationAddress', 'Location &nbsp;'));
		$oCleanLocationFields->push(new LiteralField('Help', '<p class="help clear">Either type the address of your event location above, or use the map below to zoom-in and drag and drop the red marker onto your event meeting point.</p>'));
		$oCleanLocationFields->push(new GoogleMapSelectableField('Location', "Location map", "-40.996484", "174.067383", "380px", "320px", "6"));
		$oCleanLocationFields->push(new HiddenField('LocationLongitude', 'Longitude (hide this)'));
		$oCleanLocationFields->push(new HiddenField('LocationLatitude', 'Latitude (hide this)'));
		//$oCleanLocationFields->push(new CheckboxField('LocationShowDetails', 'Give a More Detailed Location Description?'));
		//$oCleanLocationFields->push(new TextField('LocationDetails', 'Location Meeting Point Details'));
		//$oCleanLocationFields->push(new LiteralField('Help', '<p class="help clear">Give as much detail as possible. 500 word limit</p>'));
		
		//Admin Fields
		// Create new group
		$oCleanAdminFields = new CompositeField();
		// Set the field group ID
		$oCleanAdminFields->setID('CreateAdmin');
		$oCleanAdminFields->push(new TextField('Organisation', 'Name of organiser'));
		$oCleanAdminFields->push(new LiteralField('Help', "<p class='help clear'>Name of your school, community group or business. If none of these apply, just use your name.</p>"));
		$oCleanAdminFields->push(new SimpleImageField('EventImage', 'Upload logo/photo'));
		$oCleanAdminFields->push(new LiteralField('Help', "<p class='help clear'>Logo for your school, community group or business. If you don't have one, upload a photo that describes your event. Max file size 2MB</p>"));
		$oCleanAdminFields->push(new TextField('Facebooklink', 'Facebook Link for the event'));
		$oCleanAdminFields->push(new LiteralField('Help', '<p class="help clear">Optional. If you have a Facebook event for this event, copy the web address from your browser and paste it here.</p>'));
		$oCleanAdminFields->push(new CheckboxField('Agree', $TermsAndConditionsAgreeText));
		$oCleanAdminFields->push(new LiteralField('AgreeLink',
					'<div style="float: left; font-size: 10px; padding:10px;"><a href="#tc" id="tc_inline" class="fancyboxTC">View</a> or 
					 <a href="' . $TermsAndConditionsFileURL . '" Title="Download the ' . $TermsAndConditionsName . '">Download</a> the ' . $TermsAndConditionsName . '</div>' .
					'<div style="display:none"><div id="tc" style="width: 500px; padding-right: 20px">' . $TermsAndConditions . '</div></div>'));
		
		
		// Create new fieldset
		$oFields = new FieldSet();
		// Add the groups to the fieldset
		$oFields->push($oCleanDetailFields);
		$oFields->push($oCleanLocationFields);
		$oFields->push($oCleanDateFields);		
		$oFields->push($oCleanAdminFields);
		
		// Create the form action
		$oAction = new FieldSet(
			new FormAction('createcleanup', 'Create Event')
		);
        /*
        $cleanupgroupFields = new CompositeField(
			new LiteralField('Group1Title', '<div class="data-title-block"><img src="themes/lyc2012/img/s1.jpg" /><h2>Create your own event</h2><span>Please enter these basic details, if you do not wish to provide more, you can submit the form after this stage.</span></div>'),
			new TextField('Title', 'Event name'),
			new TextField('Subtitle', 'Event subtitle'),
			new TextField('Organisation', 'Organisation Name'),
			new TextField('Facebooklink', 'Facebook Link for the event'),
			new DatePickerField('Date', 'Date'),
			new DropdownField('Country', 'Country', Geoip::getCountryDropDown(), 'NZ'),
			new TextField('Region', 'Event Region'),
			new TextField('LocationAddress', 'Location Address'),
			new GoogleMapSelectableMapField('Location', "Location of the Event", "-40.996484", "174.067383", "380px", "320px", "6"),
			new HiddenField('LocationLongitude', 'Longitude (hide this)'),
			new HiddenField('LocationLatitude', 'Latitude (hide this)'),
			
			new CheckboxField('LocationShowDetails', 'Give a More Detailed Location Description?'),
			new TextField('LocationDetails', 'Location Meeting Point Details'),
			new TextareaField('Description', 'Event Description', '30', '48'),
			new LiteralField('Help', '<p class="help clear">Give as much detail as possible. 500 word limit</p>'),  
			new CheckboxField('Agree', $TermsAndConditionsAgreeText),
			new LiteralField('AgreeLink',
					'<div style="float: left; font-size: 10px;"><a href="#tc" id="tc_inline" class="fancyboxTC">View</a> or 
					 <a href="' . $TermsAndConditionsFileURL . '" Title="Download the ' . $TermsAndConditionsName . '">Download</a> the ' . $TermsAndConditionsName . '</div>' .
					'<div style="display:none"><div id="tc" style="width: 500px; padding-right: 20px">' . $TermsAndConditions . '</div></div>')
        );
        $fields = new FieldSet($cleanupgroupFields);
        

        //add dropdown stuff


        $actions = new FieldSet(
                        new FormAction('createcleanup', 'Create')
        );*/
		
        //Debug::show($fields);
        //Debug::show($actions);
		
		//validation scripts
		Requirements::javascript("mysite/javascript/CreateFormVal.js");
		
        parent::__construct($controller, $name, $oFields, $oAction);
    }

    /**
     * Save the cleanup and redirect
     */
    function createcleanup($data, $form, $request) {
        //Check there is a member! IF not return false
        $member = Member::currentUser();
        if (!$member) {
            $form->sessionMessage(_t("Create.CLEANUPCREATTIONERROR", "You Need to be logged in to Create an Event"), 'bad');
            Director::redirectBack();
        } else {

            //$agreed = (!empty($_REQUEST['Agree'])) ? $_REQUEST['Agree'] : null;
            //if ($agreed == '') {
            //    $form->sessionMessage(_t("Create.CLEANUPCREATTIONERROR", "* You must agree to the terms and conditions"), 'bad');
            //    Director::redirectBack();
            //} else {

                $member = CleanUpRole::createOrMerge($_REQUEST);
                $member->write();

                $creatorid = Member::currentUserID();
                $cleanupgroup = new CleanUpGroup();

                //set creator
                $cleanupgroup->CreatorID = $creatorid;

                //add creator as a member to the Joined no
                //$cleanupgroup->JoinedCount = 1;
                // Set The CleanUpsPage as parent ID
                $cleanupgroup->CleanUpsPageID = 3;
                //save and write
                $form->saveInto($cleanupgroup);
                $cleanupgroup->write();

                //$cleanup = DataObject::get_by_id('CleanUpGroup', $cleanupID);
                //$member->CleanUpGroups()->add($cleangroup);

                Director::redirect($cleanupgroup->JoinLink());
            //}
        }
    }

}

?>