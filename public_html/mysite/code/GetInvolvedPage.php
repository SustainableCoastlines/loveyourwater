<?php

/**
 * @link HomePage
 */
class GetInvolvedPage extends Page {

    static $db = array(
        'ActionBoxMessage' => 'HTMLText',
        'DownloadBoxMessage' => 'HTMLText'
    );
    static $has_one = array(
    );
    static $has_many = array(
        "ActionLinks" => "ActionLink",
        "GetInvolvedDownloads" => "GetInvolvedDownload",
            //"Faqs" => "GetInvolvedFaq"
    );
    static $icon = "themes/lyc/images/treeicons/task";

    public function getCMSFields() {
        $f = parent::getCMSFields();

        $actionlinks_manager = new DataObjectManager(
                        $this,
                        'ActionLinks',
                        'ActionLink',
                        array('Image_Small' => 'Image_Small', 'Name' => 'Name',  'ShortDescription' => 'ShortDescription','Link' => 'Link', 'LinkMember' => 'Link for Members',  'getDisplayStatus' => 'Displayed?'),
                        'getCMSFields_forPopup'
        );

        $actionlinks_manager->setConfirmDelete(true);
        $actionlinks_manager->addPermission("duplicate");

        $downloads_manager = new FileDataObjectManager(
                        $this,
                        'GetInvolvedDownloads',
                        'GetInvolvedDownload',
                        'Attachment',
                        array('Name' => 'Name', 'Description' => 'Description'),
                        'getCMSFields_forPopup'
        );

        $downloads_manager->setConfirmDelete(true);
        $downloads_manager->addPermission("duplicate");

        $f->addFieldToTab("Root.Content.ActionLinks", $actionlinks_manager);
        $f->addFieldToTab("Root.Content.Downloads", $downloads_manager);

        $f->addFieldToTab('Root.Content.Main', new HtmlEditorField('ActionBoxMessage', 'Actionbox description text', 2, 4));
        $f->addFieldToTab('Root.Content.Main', new HtmlEditorField('DownloadBoxMessage', 'Downloadbox description text', 2, 4));
        $f->removeFieldFromTab("Root.Content.Main", "Content");
        return $f;
    }

}

class GetInvolvedPage_Controller extends Page_Controller {

    public function init() {
        parent::init();

        // Page Specific Includes
        //e.g Requirements::themedCSS('layout');
    }

    public static $allowed_actions = array(
    );

}

?>