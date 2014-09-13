<?php
/**
 * Defines the SendForm page type
 */
 
class EventEmail extends DataObject {
	public static $db = array(
		'FirstName' => 'Text',
		'Phone' => 'Text',
		'Email' => 'Text',
		'Subject' => 'Text',
		'Message' => 'Text',
		'Recipient' => 'Text',
		'SenderEmail' => 'Text',
		'Recipients' => 'Text'
	);
	
	public static $has_one = array(
		'Member' => 'Member',
		'CleanUpGroup' => 'CleanUpGroup'
	);
	
	function goMessage() {
		$this->rollOut('SendEmail_EventMessage');
	}
	
	function invitePeeps() {
		$this->goTime('SendEmail_EventMessage');
	}
	
	function joinEmail() {
		$this->emailNotice('joinEmail_EventMessage');
	}
	
	
	protected function rollOut($emailClass) {
 		$from = $this->SenderEmail;
 		$to = $this->Recipient;
		$subject = $this->Subject ? $this->Subject : "Re: Love Your Coast Event";
		$name = $this->FirstName;
		$phone = $this->Phone;
		$message = $this->Message;
		$cleanupid = $this->CleanUpGroupID;
		$cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupid'");
 		
 		$email = new $emailClass();
 		$email->setFrom($from);
 		$email->setTo($to);
 		$email->setSubject($subject);
		
		$email->populateTemplate(
			array(
				'Contact' => $name,
				'Phone' => $phone,
				'Message' => $message,
				'CleanUp' => $cleanup,
			)
		);
		
		$email->send();
	}
	
	protected function goTime($emailClass) {
 		$from = $this->SenderEmail;
 		$to = $this->Recipients;
		$subject = $this->Subject ? $this->Subject : "Love Your Coast Event invitation";
		$name = $this->FirstName;
		$phone = $this->Phone;
		$message = $this->Message;

		$cleanupid = $this->CleanUpGroupID;
		$cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupid'");
 		
		$signup = true;
		
 		$email = new $emailClass();
 		$email->setFrom($from);
 		$email->setTo($to);
 		$email->setSubject($subject);
		
		$email->populateTemplate(
			array(
				'Contact' => $name,
				'Phone' => $phone,
				'Message' => $message,
				'Signup' => $signup,
				'CleanUp' => $cleanup,
			)
		);
		
		$email->send();
	}
	
	
	protected function emailNotice($emailClass) {
 		$from = Email::getAdminEmail();
 		$to = $this->Recipient;
		$subject = $this->Subject ? $this->Subject : "Thanks for joining in on a Love Your Coast Event";
		$name = $this->FirstName;

		$cleanupid = $this->CleanUpGroupID;
		$cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupid'");
		
 		$email = new $emailClass();
 		$email->setFrom($from);
 		$email->setTo($to);
 		$email->setSubject($subject);
		
		$email->populateTemplate(
			array(
				'Contact' => $name,
				'CleanUp' => $cleanup,
			)
		);
		
		$email->send();
	}
	
	
	public static function save_current_msg() {
		
		$emailmsg = new EventEmail();
		$emailmsg->write();
		
		// Set the Member relation to this order
		$emailmsg->Member = Member::currentUserID();
		
		// Write the order
		$emailmsg->write();
		
		return $emailmsg;
	}	
	

}

class SendEmail_EventMessage extends Email {

	protected $ss_template = 'SendEmail_EventMessage';

}

class joinEmail_EventMessage extends Email {

	protected $ss_template = 'joinEmail_EventMessage';

}


?>