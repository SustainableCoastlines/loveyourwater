<?php

class CleanUpSponsor extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'Weblink' => 'Text'
    );
    static $has_one = array(
        'CleanUpGroup' => 'CleanUpGroup',
        'Image' => 'Image'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Name', 'Name'),
                new TextField('Weblink', 'Weblink'),
                new ImageField('Image','Logo Image')
        );
    }

    public function IsEol() {
        return ((($this->iteratorPos)) % 2) == 1;
    }

    public function getDOMThumbnail() {
        if ($i = $this->Image()) {
            return $i->PaddedImage(50, 50);
        }
        return false;
    }

}

?>
