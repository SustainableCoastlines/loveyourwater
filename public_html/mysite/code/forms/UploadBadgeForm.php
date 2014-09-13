<?php

/**
 * CreateForm is the Create A Clean Up Group Form
 *
 */
class UploadBadgeForm extends Form {

    function __construct($controller, $name, $cleanupID) {

        // Get The clean Up we need to edit
        $cleanupgroup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'");
        //Get The Regions
        //$lat = $cleanupgroup->LocationLatitude;
        //$lon = $cleanupgroup->LocationLongitude;
        //$loc = $cleanupgroup->LocationAddress;

        $image1 = new ImageUploadField("EventImage", "Upload an event image");
        $image1->setUploadFolder("EventImages2010");
        //$image1->uploadOnSubmit();
        //$image1->noUploadOnSubmit();
        //fields
		
		
		
        $uploadimagesFields = new CompositeField(
			new LiteralField('Help', '<p class="help">The maximum allowed file size is 150KB and allowed file extensions are jpg, gif and png.</p>'),
			$image1,
			new HiddenField('CleanUpID', 'CleanUpID', $cleanupID)
        );

        $fields = new FieldSet($uploadimagesFields);

        //val and doubleselect stuff
        Requirements::javascript("mysite/javascript/UploadFormVal.js");
        //actions
        $actions = new FieldSet(
                        new FormAction('uploadimages', 'Upload')
        );
        parent::__construct($controller, $name, $fields, $actions);
    }

    /**
     * Save the cleanup and redirect
     */
    function uploadimages($data, $form) {
        //Check there is a member! IF not return false
        $member = Member::currentUser();
        if (!$member) {
            $form->sessionMessage(_t("Create.CLEANUPCREATTIONERROR", "You Need to be logged in to Edit An Event"), 'bad');
            Director::redirectBack();
        } else {
            //$fri = (!empty($_REQUEST['Friday'])) ? $_REQUEST['Friday'] : null;
            //CLEANUP EVENT WE ARE ADDING IMAGES FO
            $cleanupID = (!empty($_REQUEST['CleanUpID'])) ? $_REQUEST['CleanUpID'] : null;
            $cleanupgroup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'");
            if (!$cleanupgroup) {
                $form->sessionMessage(_t("Create.CLEANUPIMAGEUPLOADERROR", "You Need to have a Clean Up Event to add images "), 'bad');
                Director::redirectBack();
            } else {
                    $form->saveInto($cleanupgroup);
                    $cleanupgroup->write();
                    Director::redirect($cleanupgroup->Link());
                
            }
        }
    }

//UPLOAD FORM CLASS ENDS
}

?>