<?php

/**
 * @link HomePage
 */
class LearnPage extends Page {

    static $db = array(
		'YoutubeLinkHTTP' => 'Text',
		'VideoDescription' => 'HTMLText'
    );

    static $has_one = array(
    );

    static $has_many = array(
		'YoutubeLinks' => 'YoutubeLink'
    );
	
	static $icon = "themes/lyc/images/treeicons/faq";

    public function getCMSFields() {
        $f = parent::getCMSFields();

		$f->addFieldToTab("Root.Content.Main",new TextField('YoutubeLinkHTTP', 'Intro Video Link'));
		$f->addFieldToTab("Root.Content.Main",new HtmlEditorField('VideoDescription', 'Intro Video Description', 2, 4));

		$oYoutTubeManager = new DataObjectManager(
			$this,
			'YoutubeLinks',
			'YoutubeLink',
			array('YoutubeLinkHTTP' => 'Youtube Link'),
			'getCMSFields_forPopup'
		);
		$oYoutTubeManager->setConfirmDelete(true);
		$f->addFieldToTab("Root.Content.YouTubeVideos", $oYoutTubeManager);

        return $f;
    }

	function getLearnPageYoutubeID() {
		$query = parse_url($this->YoutubeLinkHTTP, PHP_URL_QUERY);
		$str = parse_str($query, $data);
		if (array_key_exists('v', $data))
			$result = $data['v'];
		else
			$result = 'NOT_FOUND';
		return $result;
	}

}

class LearnPage_Controller extends Page_Controller {

    public function init() {
        parent::init();
		
        // Page Specific Includes
        //e.g Requirements::themedCSS('layout');
    }

    public static $allowed_actions = array(
    );

}

?>