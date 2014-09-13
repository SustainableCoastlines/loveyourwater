<?php

class GetInvolvedDownload extends DataObject {

    static $db = array(
        'Name' => 'Text',
        'Description' => 'Text'
    );
    static $has_one = array(
        'GetInvolvedPage' => 'GetInvolvedPage',
        'Attachment' => 'File'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Name'),
                new TextareaField('Description'),
                new FileIFrameField('Attachment')
        );
    }

    public function numRotator() {
        $num = "1";
        if (((($this->iteratorPos)) % 4) == 1)
            $num = "2";
        else if (((($this->iteratorPos)) % 4) == 2)
            $num = "3";
        else if (((($this->iteratorPos)) % 4) == 3)
            $num = "4";

        return $num;
    }

}

?>
