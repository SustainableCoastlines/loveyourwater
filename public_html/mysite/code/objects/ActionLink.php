<?php

class ActionLink extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'ShortDescription' => 'Text',
        'Description' => 'HTMLText',
        'Link' => 'Text',
        'LinkMember' => 'Text',
        'Display' => 'Boolean'
    );
    static $has_one = array(
        'GetInvolvedPage' => 'GetInvolvedPage',
        'Image_Big' => 'Image',
        'Image_Small' => 'Image'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Name', 'Name'),
                new TextField('ShortDescription', 'ShortDescription'),
                new SimpleHTMLEditorField('Description', 'Description', array(
                    'css' => 'mysite/css/my_simple_stylesheet.css',
                    'insertUnorderedList' => true,
                    'copy' => true,
                    'justifyCenter' => false)),
                new TextField('Link', 'Link'),
                new TextField('LinkMember', '(Optional) Link for Members'),
                new CheckboxField('Display', 'Display'),
                new SimpleImageField('Image_Small'),
                new SimpleImageField('Image_Big')
        );
    }

    public function IsEol() {
        return ((($this->iteratorPos)) % 2) == 1;
    }

    public function bgColorRotator() {
        $color = "#FFF";
        if (((($this->iteratorPos)) % 2) == 1)
            $color = "#CCC";
        return $color;
    }

    public function IsDisplayed() {
        return $this->Display;
    }

    public function hasMemberLink() {
        return ($this->LinkMember != "");
    }

    public function findMemberLink() {
        return ($this->LinkMember ? $this->LinkMember : $this->Link);
    }

    function getDisplayStatus() {
        return ($this->Display ? "Yes" : "No");
    }

}

?>
