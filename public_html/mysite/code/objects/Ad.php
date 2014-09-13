<?php

class Ad extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'Weblink' => 'Text',
        'Active' => 'Boolean'
    );
    static $has_one = array(
        'SponsorsPage' => 'SponsorsPage',
        'Image' => 'Image'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Name', 'Name'),
                new TextField('Weblink', 'Weblink'),
                new CheckboxField('Active', 'Active'),
                new ImageUploadField('Image')
        );
    }

    public function getDOMThumbnail() {
        if ($i = $this->Image()) {
            return $i->PaddedImage(200, 160);
        }
        return false;
    }

    public function getActiveStatus() {
        return ($this->Active ? "Yes" : "No");
    }

}

?>
