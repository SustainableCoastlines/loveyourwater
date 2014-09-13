<?php

/**
 * Defines the AboutArticleHolder page type
 */
class NewsArticleHolderPage extends Page {

    static $db = array(
        "NewsArticlesMessage" => "HTMLText",
        "MediaReleasesMessage" => "HTMLText",
        "LYCLogoMessage" => "HTMLText",
        "FlickrMessage" => "HTMLText",
        "YoutubeMessage" => "HTMLText"
    );
    static $has_one = array(
        "LYCLogoFile" => "File",
        "LYCLogoIcon" => "Image"
    );
    static $has_many = array(
        "MediaReleaseDownloads" => "MediaReleaseDownload"
    );
    static $allowed_children = array('NewsArticlePage');
    static $icon = "themes/lyc/images/treeicons/news";

    function getCMSFields() {
        $f = parent::getCMSFields();

        $downloads_manager = new FileDataObjectManager(
                        $this,
                        'MediaReleasedDownloads',
                        'MediaReleaseDownload',
                        'Attachment',
                        array('Title' => 'Title', 'Description' => 'Description', 'getDOMThumbnail' => 'Photo'),
                        'getCMSFields_forPopup'
        );
        $downloads_manager->setConfirmDelete(true);
        $downloads_manager->addPermission("duplicate");

        $f->addFieldToTab("Root.Content.LoveYourCoastLogo", new HtmlEditorField('LYCLogoMessage', 'Text for Love Your Coast Logo Download Link', 2, 4));
        $f->addFieldToTab("Root.Content.LoveYourCoastLogo", new ImageField('LYCLogoIcon', 'Download Icon'));
        $f->addFieldToTab("Root.Content.LoveYourCoastLogo", new FileUploadField('LYCLogoFile', 'Love Your Coast Logo File'));

        $f->addFieldToTab("Root.Content.MediaReleaseDownloads", $downloads_manager);

        $f->removeFieldFromTab('Root.Content.Main', 'Content');
        $f->addFieldToTab('Root.Content.Main', new HtmlEditorField('Content', 'Content', 2, 2));
        $f->addFieldToTab('Root.Content.Main', new HtmlEditorField('NewsArticlesMessage', 'News Articles title and optional description', 2, 2));
        $f->addFieldToTab('Root.Content.Main', new HtmlEditorField('MediaReleasesMessage', 'Media Release Links title and optional description', 2, 2));
        $f->addFieldToTab('Root.Content.Main', new HtmlEditorField('FlickrMessage', 'Latest Flickr link text', 2, 2));
        $f->addFieldToTab('Root.Content.Main', new HtmlEditorField('YoutubeMessage', 'Latest Youtube link text', 2, 2));

        return $f;
    }


}

class NewsArticleHolderPage_Controller extends Page_Controller {

    public function init() {
        parent::init();

        // Page Specific Includes
        //e.g Requirements::themedCSS('layout');
    }

    public static $allowed_actions = array(
    );

}

?>