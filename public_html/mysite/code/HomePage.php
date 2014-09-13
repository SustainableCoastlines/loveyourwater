<?php

/**
 * @link HomePage
 */
class HomePage extends Page {

    static $db = array(
    	'FeatureTitle'	=> 'Text',
		'FeatureURL'	=> 'Text',
		'FileType' => "Enum('jpg, png, gif','jpg')"
    );

    static $has_one = array(
     	'FeatureImage'	=> 'Image',
		'FeatureLinkSiteUrl' => 'SiteTree'
    );
	
    static $has_many = array(
		'YoutubeLinks' => 'YoutubeLink'
    );
	
    static $icon = "themes/lyc/images/treeicons/home";

    function getCMSFields() {
        $oFields = parent::getCMSFields();
			$oFields->addFieldToTab("Root.Content.Feature", new TextField('FeatureTitle', 'Title for left column Feature'));
			$oFields->addFieldToTab("Root.Content.Feature", new ImageUploadField('FeatureImage', 'Image to display for left column Feature'));
			$oFields->addFieldToTab("Root.Content.Feature", new HeaderField('FeatureLink', 'Link Feature', 2));
			$oFields->addFieldToTab("Root.Content.Feature", new SimpleTreeDropdownField('FeatureLinkSiteUrlID', 'A) Link To Another Page On Your Website OR..', 'SiteTree', '', 'Title', null, 'NONE'));
			$oFields->addFieldToTab("Root.Content.Feature", new TextField('FeatureURL', 'B) Link To Another Website'));
						//$oFields->addFieldToTab("Root.Content.Create", new DropdownField('FileType','Image type', array ('jpg'=>'jpg','png'=>'png','gif'=>'gif')));
			$oYoutTubeManager = new DataObjectManager(
				$this,
				'YoutubeLinks',
				'YoutubeLink',
				array('YoutubeLinkHTTP' => 'Youtube Link'),
				'getCMSFields_forPopup'
			);
			$oYoutTubeManager->setConfirmDelete(true);
			
			$oFields->addFieldToTab("Root.Content.YouTubeVideos", $oYoutTubeManager);
		
        return $oFields;
    }

}

class HomePage_Controller extends Page_Controller {

    public function init() {
        parent::init();
        // Page Specific Includes
        //e.g Requirements::themedCSS('layout');
    }

    public static $allowed_actions = array(
    );
	
	 /**                                                              
	 * Create a Entry form                          
	 *                                                               
	 * @return object $oForm The request form                      
	 */
	function EventFilterForm() { 
        // Create the DataEntry form
        $oForm = new EventFilterForm($this, 'EventFilterForm');
        // Return the form
        return $oForm;
	}
	
	/**
     * FeatureLink to display in template
     *
     * @return mixed String or false
     */
    public function FeatureLink() {
        if ($this->FeatureURL) {
            return '<a class="more" href="' . $this->FeatureURL . '" target="_blank" title="' . $this->FeatureURL . '">';
        } else if ($this->FeatureLinkSiteUrlID) {
			return '<a class="more" href="' . $this->FeatureLinkSiteUrl()->AbsoluteLink() . '" title="' . $this->FeatureLinkSiteUrl()->Title . '">';
		} else {
			return false;
		}
    }

	public function HomeSearchForm(){
		$fields = new FieldSet(
			new OptionsetField(
				'OptionItem',
				'',
				array('Upcoming Events','Past Events', 'Presenters'),
				'anytime'
			)
		);
		$actions = new FieldSet(new FormAction("search", "Search"));
		return new Form($this, "MyCustomForm", $fields, $actions);
	}

   
}

?>