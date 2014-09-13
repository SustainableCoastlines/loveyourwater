<?php

/**
 * Defines the AboutArticlePage page type
 */
class AboutArticlePage extends Page {

    static $db = array(
        //'Title_Colour' => "Varchar(10)"
    );
    static $has_one = array(
        'Article_Photo' => 'Image'
    );
    static $icon = "themes/lyc/images/treeicons/news";

    function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Content.Main', new ImageUploadField('Article_Photo', 'About article image for thumbnail'));

        return $fields;
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

}

class AboutArticlePage_Controller extends Page_Controller {

}

?>