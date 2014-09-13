<?php

class MediaReleaseDownload extends DataObject {

    static $db = array(
        'Title' => 'Text',
        'Description' => 'Text'
    );
    static $has_one = array(
        'NewsArticleHolderPage' => 'NewsArticleHolderPage',
        'Attachment' => 'File',
        'Photo' => 'Image'
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Title'),
                new TextareaField('Description'),
                new FileIFrameField('Attachment'),
                new ImageField('Photo')
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

        public function getDOMThumbnail() {
        if ($i = $this->Photo()) {
            return $i->PaddedImage(50, 50);
        }
        return false;
    }

}

?>
