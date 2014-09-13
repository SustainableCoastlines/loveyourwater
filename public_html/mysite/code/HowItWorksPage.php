<?php
/**
 * @link HowItWorksPage
 */
 
class HowItWorksPage extends Page{
   static $db = array(
		'Content2' => 'HTMLText'
   );
   static $has_one = array(
   );
   static $has_many = array(
   "Faqs" => "Faq"						 
   );
   //static $icon = "themes/lyc/images/treeicons/faq";
 
 	function getCMSFields() {
		$f = parent::getCMSFields();
		
		$f->addFieldToTab('Root.Content.Main', new HtmlEditorField('Content2','Content'));
	
		$manager = new DataObjectManager(
		 $this,
		 'Faqs',
		 'Faq',
		 array('Question' => 'Question', 'Answer' => 'Answer'),
		 'getCMSFields_forPopup'
		);
                
	$manager->setConfirmDelete(true);
        $f->addFieldToTab("Root.Content.Faqs", $manager);
		
		return $f;
		
	}
 
 
}

class HowItWorksPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();

		// Page Specific Includes
		//e.g Requirements::themedCSS('layout'); 
		
	}
	
	public static $allowed_actions = array (
	);


}
?>