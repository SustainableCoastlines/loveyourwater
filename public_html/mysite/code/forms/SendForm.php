<?php
/**
 * Defines the SendForm page type
 */
 
class SendForm extends Form {
 
 function __construct($controller, $name, $cleanupID) {
	 	
		
		
       	if($cleanupID) {
         	$oEvent = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'")	;
		}else{
			Director::redirectBack();
		}
         
		$Header = new HeaderField('Send a message', 3);
		$Name = new TextField('FirstName','Your name');
		$Phone = new TextField('Phone','Your phone number');
		$Email = new TextField('Email','Your email');
		$Subject = new TextField('Subject','Subject');
		$Message = new TextareaField('Message','Your message', '20', '45');
		$Obj = new HiddenField('CleanupID','CleanupID', $cleanupID);
                
		
		$Name->addExtraClass('Required');
		$Email->addExtraClass('Required');
		$Message->addExtraClass('Required');
			
		$messageFields = new CompositeField(
			$Header,
			$Name,
			$Phone,
			$Email,
			$Subject,
			$Message,
			$Obj
		);
		
		$fields = new FieldSet($messageFields);
		
		$actions = new FieldSet(new FormAction('processMessage', 'send'));
                //$validator = new RequiredFields('FirstName', 'Email', 'Message');
		Requirements::customScript('
			jQuery(document).ready(function() {

				jQuery("#SendForm_SendForm_FirstName").addClass("validate[required,custom[onlyLetter],length[0,100]] text-input");
				jQuery("#SendForm_SendForm_Name").addClass("validate[required,custom[onlyLetter],length[0,100]] text-input");
				jQuery("#SendForm_SendForm_Email").addClass("validate[required,custom[email]] text-input");
				jQuery("#SendForm_SendForm_Message").addClass("validate[required,length[6,300]] text-input");
				
				jQuery("#SendForm_SendForm").validationEngine()
				
			});
		');
		
		
	
		parent::__construct($controller, $name, $fields, $actions);//, $validator);
		
		$member = Member::currentUser();
		if($member) $this->loadDataFrom($member);
	}
	
	
	protected function processMessage($data, $form, $request) {
		//Decide who to send this message to
		$cleanupid = $_REQUEST['CleanupID'];
		if(!$cleanupid){
			Director::redirect('my-events/Error/');
		}
		
		$cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupid'");
		$creatorid = $cleanup->CreatorID;
		$curr_member = Member::currentUser();
		$memberid = Member::currentUserID();
		
		if($creatorid == $memberid){
			//CASE1: CLEANUP ADMIN EMAIL! sends to group
			$members = $cleanup->getManyManyComponents("Members");
			
			if(!$members){
				//this better work
				Director::redirect('Nomembers');	
			}
			
				foreach($members as $member){
				$emailmsg = EventEmail::save_current_msg();
				
				$form->saveInto($emailmsg);
				$emailmsg->MemberID = $memberid;
				$emailmsg->SenderEmail = $_REQUEST['Email'];
				$emailmsg->Recipient = $member->Email;
				$emailmsg->CleanUpGroupID = $cleanupid;
				
				$emailmsg->write();
				$emailmsg->goMessage();
				
				}
	
			Director::redirectBack();
			
		}else{
			
			
			//CASE2: SEND CLEANUP ADMIN AN EMAIL!
			$creator = DataObject::get_by_id('Member', $creatorid);
			
			$emailmsg = EventEmail::save_current_msg();
				
			$form->saveInto($emailmsg);
			$emailmsg->MemberID = $memberid;
			$emailmsg->FirstName = $_REQUEST['FirstName'];
			$emailmsg->Phone = $_REQUEST['Phone'];
			$emailmsg->SenderEmail = $_REQUEST['Email'];
			$emailmsg->Message = $_REQUEST['Message'];
			$emailmsg->Recipient = $creator->Email;
			$emailmsg->CleanUpGroupID = $cleanupid;
			
			$emailmsg->write();
			$emailmsg->goMessage();
			
			Director::redirectBack();
			
		}
		
		
		
	//PROCESS ENDS
	}


}



?>