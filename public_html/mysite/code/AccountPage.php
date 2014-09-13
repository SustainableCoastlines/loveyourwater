<?php
/**
 * Defines the Account page type
 */
 
class AccountPage extends Page {
   static $db = array(
   'IntroText' => 'HTMLText',
   );
   static $has_one = array(
   );
   static $has_many = array(
   );
   static $icon = "themes/lyc/images/treeicons/account";
 
 	function getCMSFields() {
	   $fields = parent::getCMSFields();
	
	   $fields->removeFieldFromTab("Root.Content.Main", "Content"); 
	   $fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('IntroText', 'Text description for Users', 5));
	
	   return $fields;
	}
 
 
}
 
class AccountPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		//includes
	}
	
	function loggedIn(){
		$currentMember = Member::currentUser();
		if(!($currentMember)){
			return false;
		}else{
			return true;
		}
	}
	
	function MemberForm() {
		return new AccountForm($this, 'MemberForm');
	}

}
?>