<?php
 
class ContactForm extends Form {
 
 function __construct($controller, $name) {

		$Name = new TextField('Name','Your name');
		$Phone = new TextField('Phone','Your phone number');
		$Email = new TextField('Email','Your email');
		$Subject = new TextField('Subject','Subject');
		$Message = new TextareaField('Message','Your message', '10', '45');
		
		$Name->addExtraClass('Required');
		$Email->addExtraClass('Required');
		$Message->addExtraClass('Required');
			
		$messageFields = new CompositeField(
			$Name,
			$Phone,
			$Email,
			$Subject,
			$Message
		);
		
		$fields = new FieldSet($messageFields);
		
		$actions = new FieldSet(new FormAction('processMessage', 'send'));
	
		
		
		Requirements::customScript('
			jQuery(document).ready(function() {
				
				jQuery("#ContactForm_ContactForm_Name").addClass("validate[required,custom[onlyLetter],length[0,100]] text-input");
				jQuery("#ContactForm_ContactForm_Email").addClass("validate[required,custom[email]] text-input");
				jQuery("#ContactForm_ContactForm_Message").addClass("validate[required,length[6,300]] text-input");
				
				jQuery("#ContactForm_ContactForm").validationEngine()
				
			});
		');
	
		parent::__construct($controller, $name, $fields, $actions);
	}
	
	
	protected function processMessage($data, $form, $request) {
		
		$from = (!empty($_REQUEST['Email'])) ? $_REQUEST['Email'] : 'loveyourcoast2010';
 		$to = 'marketing@loveyourcoast.org';
		$subject = (!empty($_REQUEST['Subject'])) ? $_REQUEST['Subject'] : 'Enquiry from Love Your Coast Site';
		//$body = 'BODY';
		$Name = (!empty($_REQUEST['Name'])) ? $_REQUEST['Name'] : 'No name given';
		$Phone = (!empty($_REQUEST['Phone'])) ? $_REQUEST['Phone'] : 'No phone given';
		$Email = (!empty($_REQUEST['Email'])) ? $_REQUEST['Email'] : 'No email given';
		$Message = (!empty($_REQUEST['Message'])) ? $_REQUEST['Message'] : 'No message given';
		
		$body = 'Name: '. $Name . '<br /><br /> Phone: '. $Phone .'<br /><br />  Email: '. $Email .'<br /><br />  Message: <br />'. $Message;
		
		$email = new Email($from, $to, $subject, $body);
		$email->send();
		
		Director::redirect('Success');
		
	}
	

}






?>