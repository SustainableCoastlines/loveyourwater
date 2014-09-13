<?php

/**
 * AccountForm allows loveyourcoast members to update
 * their details for loveyourcoast centre.
 *
 * @package riskmanagement
 */
class VerificationForm extends Form {

    function __construct($controller, $name) {
        $registerFields = new CompositeField(
        	new TextField('VerificationCode', 'Verification Code')
        );
        $fields = new FieldSet($registerFields);

        Requirements::customScript('
			jQuery(document).ready(function() {
				jQuery("#RegisterForm_RegisterForm_FirstName").addClass("validate[required,length[0,30]] text-input");
				jQuery("#RegisterForm_RegisterForm").validationEngine()

			});
		');
        $actions = new FieldSet(
                        new FormAction('activate', 'Activate My Account!')
        );
        parent::__construct($controller, $name, $fields, $actions);
    }

    /**
     * Save the member and redirect
     */
	// Create new OR update logged in {@link Member} record
    function activate($data, $form, $request) {
		//Check if there's a temp member with a Verification Code equal to this
		//if there is, register the new member and log him in
		//if not, tell him the code is wrong
        //Check if this member already exists
		$tempMember = TempMember::codeExists($data);
		if( !$tempMember ) {
            $form->sessionMessage(_t("Register.REGISTRATION ERROR", "There's no account waiting for activation with this code.
									 If you already have an account log in here <a href=\"my-events/\">here</a>"), 'bad');
            Director::redirectBack();
			return;
		}
		
        // Create a new Member object
        $member = new Member();
        $member->FirstName = $tempMember->FirstName;
		$member->Surname = $tempMember->Surname;
		$member->Phone = $tempMember->Phone;
		$member->Email = $tempMember->Email;
		$member->Password = $tempMember->Password;
		$member->ReceiveMail = $tempMember->ReceiveMail;
		$member->ReceiveMail = $tempMember->ReceiveMail;
		$member->RequestListedAsPresenter = $tempMember->RequestListedAsPresenter;
		$member->LocationAddress = $tempMember->LocationAddress;
		$member->LocationLatitude = $tempMember->LocationLatitude;
		$member->LocationLongitude = $tempMember->LocationLongitude;
		$member->Description = $tempMember->Description;
        // Write to db.
        // This needs to happen before we add it to a group
        $member->write();

		if($tempMember->RequestListedAsPresenter){

			$presentorApproval = new PresentorApproval();

			$presentorApproval->MemberID = $member->ID;
			$presentorApproval->MemberName = $tempMember->FirstName . ' ' . $tempMember->Surname;
			$presentorApproval->Message = $tempMember->Description;
			$presentorApproval->Email = $tempMember->Email;
			$presentorApproval->Confirmation = 'Pending';
			$presentorApproval->IsDone = false;

			$presentorApproval->write();

		}

		$tempMember->delete();
		
        $member->logIn();
        // Add the member to User Group
        // Check if it exists first
        if ($group = DataObject::get_one('Group', 'ID = 3')) {
            $member->Groups()->add($group);
            // Redirect based on URL
            // TO EDIT
            Director::redirect('SuccessVerification');
        } else {
            $form->sessionMessage(_t("Register.REGISTRATION ERROR", "Your registration wasn't successful please try again"), 'bad');
            Director::redirectBack();
        }
    }

}
?>