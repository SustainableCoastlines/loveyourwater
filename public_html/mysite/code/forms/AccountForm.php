<?php
 /**
  * AccountForm allows riskmanagement members to update
  * their details for riskmanagement centre.
  * 
  * @package riskmanagement
  */
class AccountForm extends Form {
	
	
	function __construct($controller, $name) {
		
		$member = Member::currentUser();
		
		if($member && $member->exists()) {
			
			$fields = $member->getCleanUpMemberRoleFields(); 
			$passwordField = new ConfirmedPasswordField('Password', 'Password');
			
			if($member->Password != '') {
				$passwordField->setCanBeEmpty(true);
			}
			$fields->push($passwordField);
                        
			$fields->push(new LiteralField('LogoutNote', "<div class=\"clear\"></div><p class=\"message good\">" . _t("MemberForm.LOGGEDIN","You are currently logged in as ") . $member->FirstName . ' ' . $member->Surname . ". Click <a href=\"Security/logout\" title=\"Click here to log out\">here</a> to log out.</p>"));
			//$fields->push(new HeaderField('Login Details', 3));
			
			$requiredFields=('');
		} else {
			$fields = new FieldSet();
		}
		
		Requirements::customScript('
			jQuery(document).ready(function() {
				
				jQuery("#AccountForm_MemberForm_FirstName").addClass("validate[required,custom[onlyLetter],length[0,100]] text-input");
				jQuery("#AccountForm_MemberForm_Surname").addClass("validate[required,custom[onlyLetter],length[0,100]] text-input");
				jQuery("#AccountForm_MemberForm_Address").addClass("validate[required,length[6,300]] text-input");
				jQuery("#AccountForm_MemberForm_Email").addClass("validate[required,custom[email]] text-input");
				jQuery("#AccountForm_MemberForm #Password input").addClass("validate[required,length[6,100]] text-input");
				
				jQuery("#AccountForm_MemberForm").validationEngine()
				
			});
		');
		
		$requiredFields = ('');
		
		$actions = new FieldSet(
			new FormAction('submit', 'Save Changes')
		);

		parent::__construct($controller, $name, $fields, $actions, $requiredFields);
		
		if($member) $this->loadDataFrom($member);
	}
	
	/**
	 * Save the changes to the form
	 */
	function submit($data, $form, $request) {
		$member = Member::currentUser();
		if(!$member) return false;
		
		$form->saveInto($member);
		$member->write();
		$form->sessionMessage(_t("MemberForm.DETAILSSAVED",'Your details have been saved'), 'bad');
		
		Director::redirectBack();
		return true;
	}
	
	
	
}
?>