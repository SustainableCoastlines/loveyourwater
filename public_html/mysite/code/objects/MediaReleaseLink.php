<?php

class MediaReleaseLink extends DataObject {

    static $db = array(
        'Title' => 'Text',
        'Description' => 'Text',
        'Link' => 'Text'
    );
    static $has_one = array(
        'NewsArticleHolderPage' => 'NewsArticleHolderPage',
        'Photo' => 'Image'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Title'),
                new TextareaField('Description'),
                new TextField('Link'),
                new ImageField('Photo', 'Photo')
        );
    }

    public function getDOMThumbnail() {
        if ($i = $this->Photo()) {
            return $i->PaddedImage(100, 100);
        }
        return false;
    }

}

?>
