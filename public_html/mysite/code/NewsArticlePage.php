<?php

/**
 * Defines the AboutArticlePage page type
 */
class NewsArticlePage extends Page {

    static $db = array(
        'Date' => 'Date',
        'Author' => 'Text',
        'AuthorEmail' => 'Text'
    );
    static $has_one = array(
    );
    static $has_many = array(
        'YoutubeLinks' => 'YoutubeLink'
    );
    //static $allowed_children = array('NewsFlickrGalleryPage','YoutubeGallery');
    static $icon = "themes/lyc/images/treeicons/news";
    static $defaults = array(
        'ProvideComments' => true
    );

    function getCMSFields() {
        $fields = parent::getCMSFields();



        $youtubemanager = new DataObjectManager(
				$this,
				'YoutubeLinks',
				'YoutubeLink',
				array('YoutubeLinkHTTP' => 'Youtube Link'),
				'getCMSFields_forPopup'
        );
		
        $youtubemanager->setConfirmDelete(true);
        $fields->addFieldToTab('Root.Content.Main', new DatePickerField('Date'), 'Content');
        $fields->addFieldToTab('Root.Content.Main', new TextField('Author'), 'Content');
        $fields->addFieldToTab('Root.Content.Main', new TextField('AuthorEmail'), 'Content');

        $fields->addFieldToTab('Root.Content.Main', new LiteralField('Machinetag',
                        '<div id="Machinetag">' .
                        '<p><b>MANUAL FOR NOW - Add this automatically generated Tag to your Flickr photos:</b>&nbsp;&nbsp;&nbsp;&nbsp;' . $this->machineTag() . '</p>' .
                        '<p>Results:</p>' .
                        $this->getAllEventPhotoURLThumbs() .
                        '</div>'));

        $fields->addFieldToTab("Root.Content.YoutubeContent", $youtubemanager);

        return $fields;
    }

    // $photo->title
    // $photo->page_url
    // $photo->image_path .jpg  OR _s.jpg

    function hasRelatedFlickr() {
        $photos = $this->getFlickrPhotos(1);
        $count = $photos->PhotoItems ? $photos->PhotoItems->Count() : 0;
        return ($count);
    }

    function getFlickrPhotos($num) {
        $flickr = new FlickrService();
        $photos = $flickr->getPhotosMT($this->machineTag(), "api", $num, 1, 'date-posted-desc');
        return $photos;
    }

    function getEventPhotoURL() {
        $photos = $this->getFlickrPhotos(1);
        if ($photos->PhotoItems->First()) {
            $photourl = 'http://farm1.static.flickr.com/' . $photos->PhotoItems->First()->image_path . '.jpg';
        } else {
            $photourl = 'assets/default_flickr_thumb.png';
        }
        return $photourl;
    }

    function getEventPhotoURLThumb() {
        $photos = $this->getFlickrPhotos(1);
        if ($photos->PhotoItems->First()) {
            $photourl = 'http://farm1.static.flickr.com/' . $photos->PhotoItems->First()->image_path . '_s.jpg';
        } else {
            $photourl = 'assets/default_flickr_thumb.png';
        }
        return $photourl;
    }

    function getAllEventPhotoURLThumbs() {
        $photos = $this->getFlickrPhotos(100);
        if ($photos->PhotoItems->First()) {
            $imagelist = '<ul style="list-style: none;">';
            foreach ($photos->PhotoItems as $photo) {
                $imagelist = $imagelist . '<li style="display: inline; margin: 5px 5px 5px 5px"><img src="http://farm1.static.flickr.com/' . $photo->image_path . '_s.jpg" /></li>';
            }
            $imagelist = $imagelist . '</ul>';
        } else {
            $imagelist = '<ul style="list-style: none;"><li><img src="assets/default_flickr_thumb.png" /></li></ul>';
        }
        return $imagelist;
    }

    function machineTag() {
        return "LoveYourCoast:NewsArticleID=" . $this->ID;
    }

    /* function onBeforeWrite() {
      $this->Flickrtag = "LoveYourCoast:NewsArticleID=" . $this->ID;
      parent::onBeforeWrite();
      } */
}

class NewsArticlePage_Controller extends Page_Controller {

}

?>