<?php
/**
 * Defines the AboutArticleHolder page type
 */
class AboutArticleHolderPage extends Page {
   static $db = array(
   );
   static $has_one = array(
   );
   static $has_many = array(
   "Faqs" => "AboutFaq"
   );

   static $allowed_children = array('AboutArticlePage');

   static $icon = "themes/lyc/images/treeicons/faq";

   function getCMSFields() {
		$f = parent::getCMSFields();

		$manager = new DataObjectManager(
		 $this,
		 'Faqs',
		 'AboutFaq',
		 array('Question' => 'Question', 'Answer' => 'Answer'),
		 'getCMSFields_forPopup'
		);
        $manager->setConfirmDelete(true);
        $f->addFieldToTab("Root.Content.Faqs", $manager);

		return $f;

	}
}

class AboutArticleHolderPage_Controller extends Page_Controller {

	public function init() {
		parent::init();

		// Page Specific Includes
		//e.g Requirements::themedCSS('layout');

	}

	public static $allowed_actions = array (
	);


}
?>