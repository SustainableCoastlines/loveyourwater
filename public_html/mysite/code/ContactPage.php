<?php
/**
 * @link HomePage
 */

class ContactPage extends Page{
   static $db = array(
	"BeforeMessage" => "HTMLText",				  
	"SuccessMessage" => "HTMLText",
   );
   static $has_one = array(
   );
   static $many_many = array(
	);
   static $icon = "themes/lyc/images/treeicons/contact";
 
 	function getCMSFields() {
	   $fields = parent::getCMSFields();

           //$fields->removeFieldFromTab('Root.Content.Main','Content');
	   $fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('BeforeMessage','Information shown before', 2, 4));
	   $fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('SuccessMessage','Message shown imediately after message is sent', 2, 4));
	   
	   return $fields;
	}
 

 
 
}

class ContactPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();

		// Page Specific Includes
		//e.g Requirements::themedCSS('layout'); 
		
	}
	
	public static $allowed_actions = array (
	);
	
	function ContactForm() {
		return new ContactForm($this, 'ContactForm');
	}
	
	function Success() {
		return array(
			"BeforeMessage" => $this->SuccessMessage 
		);
	}
	
	
	
	

}
?>