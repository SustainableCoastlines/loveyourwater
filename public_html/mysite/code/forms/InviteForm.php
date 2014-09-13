<?php
/**
 * Defines the SendForm page type
 */
 
class InviteForm extends Form {
 
 function __construct($controller, $name) {
		$Header = new HeaderField('Invite people to join your clean up event', 3);
		$Name = new TextField('FirstName','Your name');
		$Phone = new TextField('Phone','Your phone number');
		$Email = new TextField('Email','Your email');
		$Subject = new TextField('Subject','Subject');
		$Recipients = new TextField('Recipients','Invite members (comma separated)', 'e.g. eg1@eg.co.nz, eg2@eg.co.nz');
		$Message = new TextareaField('Message','Your message', '10', '4');
		$Obj = new HiddenField('CleanupID','CleanupID');
		
		$Name->addExtraClass('Required');
		$Email->addExtraClass('Required');
		$Message->addExtraClass('Required');
			
		$messageFields = new CompositeField(
			$Header,
			$Name,
			$Phone,
			$Email,
			$Subject,
			$Recipients,
			$Message,
			$Obj
		);
		
		$fields = new FieldSet($messageFields);
		
		$actions = new FieldSet(new FormAction('processInvites', 'send'));
	
		Requirements::customScript('
			jQuery(document).ready(function() {
		
				jQuery("#InviteForm_InviteForm_FirstName").addClass("validate[required,custom[onlyLetter],length[0,100]] text-input");
				jQuery("#InviteForm_InviteForm_Name").addClass("validate[required,custom[onlyLetter],length[0,100]] text-input");
				jQuery("#InviteForm_InviteForm_Email").addClass("validate[required,custom[email]] text-input");
				jQuery("#InviteForm_InviteForm_Message").addClass("validate[required,length[6,300]] text-input");
				jQuery("#InviteForm_InviteForm_Recipients").addClass("validate[required,length[6,300]] text-input");
				
				jQuery("#InviteForm_InviteForm").validationEngine()
				
				
			});
		');
		
		
	
		parent::__construct($controller, $name, $fields, $actions);
		
		$member = Member::currentUser();
		if($member) $this->loadDataFrom($member);
	}
	
	
	protected function processInvites($data, $form, $request) {
		//Decide who to send this message to
		$cleanupid = $_REQUEST['CleanupID'];
		if(!$cleanupid){
			Director::redirect('my-events/Error/');
		}
		
		$cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupid'");
		$creator = Member::currentUser();
		$creatorid = Member::currentUserID();

			//CASE: Send Email to Recipients list!
			$emailmsg = EventEmail::save_current_msg();
				
			$form->saveInto($emailmsg);
			$emailmsg->MemberID = $creatorid;
			$emailmsg->SenderEmail = $_REQUEST['Email'];
			$emailmsg->Recipients = $_REQUEST['Recipients'];
			$emailmsg->CleanUpGroupID = $cleanupid;
			
			$emailmsg->write();
			$emailmsg->invitePeeps();
			
			Director::redirectBack();
			
		
		
	//PROCESS ENDS
	}


}



?>