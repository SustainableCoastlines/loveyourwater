<?php

class YoutubeLink extends DataObject {

    static $db = array(
        'YoutubeLinkHTTP' => 'Text',
		'YoutubeEmbed' => 'Text',
		'YoutubeTitle' => 'Text',
		'YoutubeDescription' => 'Text'
    );

    static $has_one = array(
		'HomePage' => 'HomePage',
		'LearnPage' => 'LearnPage',
        'NewsArticlePage' => 'NewsArticlePage',
		'AboutPage' => 'AboutPage'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
			new TextField('YoutubeLinkHTTP', 'Paste Youtube http link here'),
			new TextField('YoutubeTitle', 'Name of Youtube clip goes here'),
			new TextField('YoutubeDescription', 'Description of Youtube clip goes here')
			
        );
    }

    //http://www.youtube.com/watch?v=i7CuiuPiJRk

    function getYoutubeID() {
        $query = parse_url($this->YoutubeLinkHTTP, PHP_URL_QUERY);
        $str = parse_str($query, $data);
        if (array_key_exists('v', $data))
            $result = $data['v'];
        else
            $result = 'NOT_FOUND';
        return $result;
    }

    function getYoutubeImageURL() {
        return "http://img.youtube.com/vi/" . $this->getYoutubeID() . "/0.jpg";
    }

    function getYoutubeURL() {
        return "http://www.youtube.com/embed/" . $this->getYoutubeID();
    }
	
}

?>
