<?php

/**
 * @link Create a Clean Up Page
 */
class CreatePage extends Page {

    static $db = array(
        //"RegisterMessage" => "HTMLText",
        "JoinMessage" => "HTMLText",
        "SuccessMessage" => "HTMLText",
        "TermsAndConditions" => 'HTMLText',
        "TermsAndConditionsAgreeText" => 'Text',
        "TermsAndConditionsName" => 'Text'
    );
    static $has_one = array(
        'TermsAndConditionsFile' => 'File'
    );
    static $has_many = array(
    );

    static $icon = "themes/lyc/images/treeicons/create";

    function getCMSFields() {
        $fields = parent::getCMSFields();

        //$fields->removeFieldFromTab("Root.Content.Main", "Content");
        //$fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('RegisterMessage', 'Message to prompt user to register', 2, 4));
        //$fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('JoinMessage', 'Message to prompt logged in user to create or join a clean up event', 2, 4));
        //$fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('SuccessMessage', 'Message shown imediately after registering', 2, 4));
        $fields->addFieldToTab('Root.Content.TermsAndConditions', new TextField('TermsAndConditionsName', 'Description of T&C document (ie. could be called a Guide instead)'));
        $fields->addFieldToTab('Root.Content.TermsAndConditions', new TextField('TermsAndConditionsAgreeText', 'Wording of the Agree Checkbox'));
        $fields->addFieldToTab('Root.Content.TermsAndConditions', new FileUploadField('TermsAndConditionsFile', 'Terms and Conditions Download (PDF for example)'));
        $fields->addFieldToTab('Root.Content.TermsAndConditions', new HtmlEditorField('TermsAndConditions', 'Terms and Conditions', 2, 30));
        return $fields;
    }

}

class CreatePage_Controller extends Page_Controller {

    public function init() {
        parent::init();

        // Page Specific Includes
        //e.g Requirements::themedCSS('layout');
        //Requirements::set_write_js_to_body(false);
    }

    // NB: the below statement causes errors, I think 2.4
    // won't allow a form to be processed when it isn't part of the controller
    // public static $allowed_actions = array('register');

	function CreateAccountLink() {
        return $this->URLSegment . '/createaccount';
    }
   	
	function createaccount(){
		return array(
            "ShowCreateAccountForm" => true
        );
	}
	
    function RegisterForm() {
        return new RegisterForm($this, 'RegisterForm');
    }

    function CreateForm() {
        return new CreateForm($this, 'CreateForm', $this->TermsAndConditions, $this->getTermsAndConditionsURL2(), $this->TermsAndConditionsAgreeText, $this->TermsAndConditionsName);
    }

    function getTermsAndConditionsURL() {
        if ($tc = DataObject::get_by_id("File", "$this->TermsAndConditionsFileID"))
            return $tc->URL;
        else
            return "";
    }

    function getTermsAndConditionsURL2() {
        if ($tc = $this->TermsAndConditionsFile())
            return $tc->URL;
        else
            return "";
    }

    function Success() {
        return array(
            "JoinMessage" => $this->SuccessMessage
        );
    }

    function showTC() {
        if ($tc = DataObject::get_by_id("File", "$this->TermsAndConditionsFileID"))
            return $tc->getURL();
        else
            return "";
    }

}

?>