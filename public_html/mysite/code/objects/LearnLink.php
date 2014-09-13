<?php

class LearnLink extends DataObject {

    static $db = array(
        'Title' => 'Text',
        'Description' => 'Text',
        'Link' => 'Text'
    );
    
    static $has_one = array(
        'LearnPage' => 'LearnPage',
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

}

?>
