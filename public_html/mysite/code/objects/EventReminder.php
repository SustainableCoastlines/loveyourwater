<?php
/**
 * Defines the SendForm page type
 */
 
class EventReminder extends DataObject {
	public static $db = array(
		'FirstName' => 'Text',
		'Subject' => 'Text',
		'Recipient' => 'Text'
	);
	
	public static $has_one = array(
		'Member' => 'Member'
	);
	public static $has_many = array(
		'CleanUpGroups' => 'CleanUpGroup'
	);
	
	function go() {
 		$from = Email::getAdminEmail();
		$to = $this->Recipient;
		$subject = 'Clean Up Week Reminder';
		
		$memberid = $this->MemberID;
		$member = DataObject::get_one('Member', "Member.ID = '$memberid'");
		$cleanups = $member->myCleanUpGroups($memberid);
		
		$email = new EventReminderEmail();
		$email->setFrom($from);
 		$email->setTo($to);
 		$email->setSubject($subject);
		$email->populateTemplate(
			array(
				'Member' => $member,
				'CleanUps' => $cleanups
			)
		);
		
		$email->send();
		
	}
	
	public static function save_reminder() {
		
		$emailmsg = new EventReminder();
		$emailmsg->write();
		return $emailmsg;
	}	
	

}



class EventReminderEmail extends Email {

	protected $ss_template = 'SendEmail_EventReminder';

}

?>