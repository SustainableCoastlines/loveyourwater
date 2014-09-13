<?php

class Collaborator extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'ShortDescription' => 'HTMLText',
        'Weblink' => 'Text',
        'Email' => 'Text',
        'KeyCollaborator' => 'Boolean'
    );
    static $has_one = array(
        'WhosinPage' => 'WhosinPage',
        'Image' => 'Image'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Name', 'Name'),
                new SimpleHTMLEditorField('ShortDescription', 'ShortDescription', array(
                    'css' => 'mysite/css/my_simple_stylesheet.css',
                    'insertUnorderedList' => true,
                    'copy' => true,
                    'justifyCenter' => false)),
                new TextField('Weblink', 'Weblink'),
                new TextField('Email', 'Email'),
                new SimpleImageField('Image'),
                new CheckboxField('KeyCollaborator', 'KeyCollaborator')
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

    public function IsKeyCollaborator() {
        return $this->KeyCollaborator;
    }

    public function getKeyCollaboratorStatus() {
        return ($this->KeyCollaborator ? "Yes" : "No");
    }

    public function getDOMThumbnail() {
        if ($i = $this->Image()) {
            return $i->PaddedImage(100, 100);
        }
        return false;
    }

}

?>
