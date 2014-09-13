<?php

class KeyContact extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'Role' => 'Text',
        'Email' => 'Text'        
    );
    static $has_one = array(
        'WhosinPage' => 'WhosinPage'
    );

    public function getCMSFields_forPopup() {

        return new FieldSet(
                new TextField('Name', 'Name'),
                new TextField('Role', 'Role'),
                new TextField('Email', 'Email')
        );
    }
  

}

?>
