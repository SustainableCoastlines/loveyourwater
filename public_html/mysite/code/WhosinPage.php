<?php

/**
 * Defines the AboutArticleHolder page type
 */
class WhosinPage extends Page {

    static $db = array(
        "CollaboratorsText" => "HTMLText",
        "FoundingStoryText" => "HTMLText",
        "Subtitle" => "Text"
    );
    static $has_one = array(
    );
    static $has_many = array(
        "Staff_Members" => "Staff",
        "Collaborators" => "Collaborator",
        "KeyContacts" => "KeyContact"
    );
    static $icon = "themes/lyc/images/treeicons/staff";

    function getCMSFields() {
        $f = parent::getCMSFields();

        $f->addFieldToTab("Root.Content.Main", new TextField('Subtitle', 'Subtitle'));

        $f->addFieldToTab("Root.Content.Main", new HtmlEditorField('CollaboratorsText', 'Collaboratos section introduction', 20, 4));

        $f->addFieldToTab("Root.Content.Main", new HtmlEditorField('FoundingStoryText', 'Founding Story section text', 50, 4));

        $staffmanager = new DataObjectManager(
                        $this,
                        'Staff_Members',
                        'Staff',
                        array('Name' => 'Name',
                            'Role' => 'Role',
                            'Email' => 'Email',
                            'Phone' => 'Phone',
                            'getAucklandStatus' => 'Auckland',
                            'getWellingtonStatus' => 'Wellington',
                            'getChristchurchStatus' => 'Christchurch',
                            'getWestcoastStatus' => 'Westcoast',
                            'getDOMThumbnail' => 'Photo',
                            'FacebookLink' => 'FacebookLink'),
                        'getCMSFields_forPopup'
        );
        $staffmanager->setConfirmDelete(true);
        $staffmanager->addPermission("duplicate");

        $collabmanager = new DataObjectManager(
		 $this,
		 'Collaborators',
		 'Collaborator',
		 array('Name' => 'Name', 'ShortDescription' => 'ShortDescription', 'getDOMThumbnail' => 'Image', 'Weblink' => 'Weblink', 'Email' => 'Email', 'getKeyCollaboratorStatus' => 'KeyCollaborator'),
		 'getCMSFields_forPopup'
		);
        $collabmanager->setConfirmDelete(true);
        $collabmanager->addPermission("duplicate");

        $keycontactsmanager = new DataObjectManager(
		 $this,
		 'KeyContacts',
		 'KeyContact',
		 array('Name' => 'Name', 'Role' => 'Role', 'Email' => 'Email'),
		 'getCMSFields_forPopup'
		);
        $keycontactsmanager->setConfirmDelete(true);
        $keycontactsmanager->addPermission("duplicate");

        $f->addFieldToTab("Root.Content.Staff", $staffmanager);
        $f->addFieldToTab("Root.Content.KeyContacts", $keycontactsmanager);
        $f->addFieldToTab("Root.Content.Collaborators", $collabmanager);
        $f->removeFieldFromTab("Root.Content.Main", "Content");
        return $f;
    }

    function getCityStaff($city) {
        return DataObject::get("Staff",$city);
    }

}

class WhosinPage_Controller extends Page_Controller {

    public function init() {
        parent::init();

        // Page Specific Includes
        //e.g Requirements::themedCSS('layout');
    }

    public static $allowed_actions = array(
    );

}

?>