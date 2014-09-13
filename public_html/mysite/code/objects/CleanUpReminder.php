<?php

class CleanUpReminder extends QuarterHourlyTask {
 
    function process() {
    	
		//GET ALL THE SITES MEMBERS
		$members = DataObject::get('Member');
	
		foreach($members as $member){
			//Format Message
			$memberid = $member->ID;
			$recip = $member->Email; 
			$name = $member->FirstName;
			
			$emailmsg = new EventReminder();
	
			$emailmsg->MemberID = $memberid;
			$emailmsg->FirstName = $name;
			$emailmsg->Recipient = $recip;
			
			$emailmsg->write();
			$emailmsg->go();
			
			/*$from = 'lydiajack@gmail.com';
			$to = $recip;
			$subject = 'Clean Up Week Reminder';
			$body = 'Can we please, get this working?! Thanks, ' . $name . $memberid;
			$email = new Email($from, $to, $subject, $body);
			$email->send();*/
		
		}
		
	
	
    }
  }


?>