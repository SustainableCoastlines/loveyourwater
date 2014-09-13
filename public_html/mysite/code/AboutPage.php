<?php
/**
 * Defines the AboutPage page type
 */
class AboutPage extends Page {
   static $db = array(
   'AboutMap'=> 'HTMLText',
   'MapTitle' => 'Text',
   'MapDescription' => 'Text'
   
   );
   static $has_one = array(
   	
   );
   static $has_many = array(
   	"Faqs" => "AboutFaq",
   	"Organisations" => "Organisation",
   	"YoutubeLinks" => "YoutubeLink"
   );

   //static $allowed_children = array('');

   static $icon = "themes/lyc/images/treeicons/faq";

   function getCMSFields() {
		$f = parent::getCMSFields();
		 $f->addFieldToTab("Root.Content.Map", new HtmlEditorField('AboutMap','Paste here Google Map iframe (480px x 300px)'));
		 $f->addFieldToTab("Root.Content.Map", new TextField('MapTitle','Map Title Goes Here'));
		 $f->addFieldToTab("Root.Content.Map", new TextField('MapDescription','Map Description Goes Here'));
		 
		 
		$manager = new DataObjectManager(
		 $this,
		 'Faqs',
		 'AboutFaq',
		 array('Question' => 'Question', 'Answer' => 'Answer'),
		 'getCMSFields_forPopup'
		);
        $manager->setConfirmDelete(true);
        $f->addFieldToTab("Root.Content.Faqs", $manager);
		
		$manager1 = new DataObjectManager(
		 $this,
		 'Organisations',
		 'Organisation',
		 array('Name' => 'Name', 'Country' => 'Country','OrganisationImage' => 'OrganisationImage', 'OrganisationLinkHTTP' => 'Organisation Link' ),
		 'getCMSFields_forPopup'
		);
        $manager1->setConfirmDelete(true);
        $f->addFieldToTab("Root.Content.Organisations", $manager1);
  
		
		$manager2 = new DataObjectManager(
		 $this,
		 'YoutubeLinks',
		 'YoutubeLink',
		 array('YoutubeLinkHTTP' => 'Youtube Link'),
		 'getCMSFields_forPopup'
		);
        $manager2->setConfirmDelete(true);
        $f->addFieldToTab("Root.Content.YoutubeLinks", $manager2);
		return $f;

	}
}

class AboutPage_Controller extends Page_Controller {

	public function init() {
		parent::init();

	}

	public static $allowed_actions = array (
	);


}
?>