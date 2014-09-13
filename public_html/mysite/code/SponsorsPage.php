<?php

/**
 * @link HomePage
 */
class SponsorsPage extends Page {

    static $db = array(
    );
    static $has_one = array(
    );
    static $has_many = array(
        "Ads" => "Ad",
        "Sponsors" => "Sponsor"
    );
    static $icon = "themes/lyc/images/treeicons/sponsor";

    public function getCMSFields() {
        $f = parent::getCMSFields();

        $managerSponsors = new DataObjectManager(
                        $this,
                        'Sponsors',
                        'Sponsor',
                        array('Name' => 'Name', 'Description' => 'Description', 'getDOMThumbnail' => 'Image', 'Weblink' => 'Weblink', 'Email' => 'Email', 'getKeySponsorStatus' => 'KeySponsor'),
                        'getCMSFields_forPopup'
        );
        $managerSponsors->setConfirmDelete(true);
        $managerSponsors->addPermission("duplicate");

        $managerSponsors->setFilter(
                'KeySponsor',
                'Show Key Sponsors',
                array(
                    '0' => 'Show only minor sponsors',
                    '1' => 'Show only key sponsors'
                )
        );

        $f->addFieldToTab("Root.Content.Sponsors", $managerSponsors);

        $managerAds = new DataObjectManager(
                        $this,
                        'Ads',
                        'Ad',
                        array('Name' => 'Name', 'getDOMThumbnail' => 'Image', 'Weblink' => 'Weblink', 'getActiveStatus' => 'Active'),
                        'getCMSFields_forPopup'
        );
        $managerAds->setConfirmDelete(true);
        $managerAds->addPermission("duplicate");

        $managerAds->setFilter(
                'Active',
                'Show Active Advertisements',
                array(
                    '0' => 'Show only inactive ads',
                    '1' => 'Show only active ads'
                )
        );

        $f->addFieldToTab("Root.Content.Ads", $managerAds);

        return $f;
    }

}

class SponsorsPage_Controller extends Page_Controller {

    public function init() {
        parent::init();

        // Page Specific Includes
        //e.g Requirements::themedCSS('layout');
    }

    public static $allowed_actions = array(
    );

}

?>