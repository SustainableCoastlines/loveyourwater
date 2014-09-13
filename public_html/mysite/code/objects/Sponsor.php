<?php

class Sponsor extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'Description' => 'HTMLText',
        'Weblink' => 'Text',
        'Email' => 'Text',
        'KeySponsor' => 'Boolean'
    );
    static $has_one = array(
        'SponsorsPage' => 'SponsorsPage',
        'Image' => 'Image'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Name', 'Name'),
                new SimpleHTMLEditorField('Description', 'Description', array(
                    'css' => 'mysite/css/my_simple_stylesheet.css',
                    'insertUnorderedList' => true,
                    'copy' => true,
                    'justifyCenter' => false)),
                new TextField('Weblink', 'Weblink'),
                new TextField('Email', 'Email'),
                new ImageUploadField('Image'),
                new CheckboxField('KeySponsor', 'KeySponsor')
        );
    }

    public function IsEol() {

        return ((($this->iteratorPos)) % 4) == 3;
    }

    public function colorRotator() {
        $color = "RED";
        if (((($this->iteratorPos)) % 4) == 1)
            $color = "YELLOW";
        else if (((($this->iteratorPos)) % 4) == 2)
            $color = "DARK_BLUE";
        else if (((($this->iteratorPos)) % 4) == 3)
            $color = "LIGHT_BLUE";

        return $color;
    }

    public function IsKeySponsor() {
        return $this->KeySponsor;
    }
    
     public function getKeySponsorStatus() {
        return ($this->KeySponsor ? "Yes" : "No");
    }


    public function getDOMThumbnail() {
        if ($i = $this->Image()) {
            return $i->PaddedImage(100, 100);
        }
        return false;
    }

}

?>
