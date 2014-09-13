<?php

class Staff extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'Role' => 'Text',
        'Email' => 'Text',
        'Phone' => 'Text',
        'FacebookLink' => 'Text',
        'Auckland' => 'Boolean',
        'Wellington' => 'Boolean',
        'Christchurch' => 'Boolean',
        'Westcoast' => 'Boolean'
    );
    static $has_one = array(
        'Photo' => 'Image',
        'WhosinPage' => 'WhosinPage'
    );

    public function getCMSFields_forPopup() {

        return new FieldSet(
                new TextField('Name', 'Name'),
                new TextField('Role', 'Role'),
                new TextField('Email', 'Email'),
                new TextField('Phone', 'Phone'),
                new TextField('FacebookLink', 'FacebookLink'),
                new CheckboxField('Auckland', 'Auckland'),
                new CheckboxField('Wellington', 'Wellington'),
                new CheckboxField('Christchurch', 'Christchurch'),
                new CheckboxField('Westcoast', 'Westcoast'),
                new ImageField('Photo', 'Photo')
        );
    }

    function hasFacebookLink() {
        return ($this->FacebookLink != "");
    }

    public function getDOMThumbnail() {
        if ($i = $this->Photo()) {
            return $i->PaddedImage(50, 50);
        }
        return false;
    }

    function getAucklandStatus() {
        return ($this->Auckland ? "Yes" : "No");
    }

    function getWellingtonStatus() {
        return ($this->Wellington ? "Yes" : "No");
    }

    function getWestcoastStatus() {
        return ($this->Westcoast ? "Yes" : "No");
    }

    function getChristchurchStatus() {
        return ($this->Christchurch ? "Yes" : "No");
    }

}

?>
