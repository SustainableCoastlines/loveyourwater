<?php

/**
 * @link MyCleanUpWeek Page
 */
class MyEvents extends Page {

    static $db = array(
        "LoginMessage" => "HTMLText",
		"RegisterMessage" => "HTMLText",
        "JoinMessage" => "HTMLText",
        "ProfileMessage" => "HTMLText",
		"ActivationMessage" => "HTMLText"
    );
    static $has_one = array(
    );
    static $has_many = array(
    );
    static $icon = "themes/lyc/images/treeicons/intinerary";

    function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->removeFieldFromTab("Root.Content.Main", "Content");
		$fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('LoginMessage', 'Message to prompt user to login', 2, 4));
        $fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('RegisterMessage', 'Message to prompt user to register', 2, 4));
        //$fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('JoinMessage', 'Message to prompt logged in user to create or join a Clean Up Event if they have not done either', 2, 4));
        $fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('ProfileMessage', 'Message shown if user has Clean Up Events to manage', 2, 4));
		$fields->addFieldToTab('Root.Content.Main', new HtmlEditorField('ActivationMessage', 'Message to prompt user to activate account', 2, 4));

        return $fields;
    }

}

class MyEvents_Controller extends Page_Controller {

    public function init() {
        parent::init();

        // Page Specific Includes
        Requirements::customScript('
		 
		  //VITALSCRIPT!!!
		  jQuery("a.sendmessage").bind("click", function(){
			 var myval = $(this).attr("id");
			 jQuery("#SendForm_SendForm_CleanupID").attr("value", myval);
		  });


		  jQuery(".invite").fancybox({
			  "titleShow"		: "false",
			  "transitionIn"		: "elastic",
			  "transitionOut"		: "elastic"
			});

		  //VITALSCRIPT!!!
		  jQuery("a.invite").bind("click", function(){
			 var myval = $(this).attr("id");
			 jQuery("#InviteForm_InviteForm_CleanupID").attr("value", myval);
		  });

		  ');
    }

    /* public static $allowed_actions = array (
      ); */



	function CreateAccountLink() {
        return $this->URLSegment . '/createaccount';
    }
   	
	function createaccount(){
		return array(
            "ShowCreateAccountForm" => true
        );
	}
	
    //Registration form
    function RegisterForm() {
        return new RegisterForm($this, 'RegisterForm');
    }

    function Success() {
		//return new VerificationForm($this, 'VerificationForm');
		//Director::redirect(Director::baseURL().'verification');
        //return array(
        //    "JoinMessage" => $this->SuccessMessage
        //);
		Director::redirect('my-events/verification/');
    }
	
	function Verification() {
	    return array(
            "JoinMessage" => $this->ActivationMessage
        );
	}
	
	function VerificationForm() {
		return new VerificationForm($this, 'VerificationForm');
	}
	
    function SuccessVerification() {
		//return new VerificationForm($this, 'VerificationForm');
		//Director::redirect(Director::baseURL().'verification');
        //return array(
        //    "JoinMessage" => $this->SuccessMessage
        //);
		Director::redirect(Director::baseURL().'my-events');
    }
    
    public function CreatedGroups() {
        $creatorid = Member::currentUserID();
        $groupscreated = DataObject::get('CleanUpGroup', "CreatorID = '$creatorid'");
        return $groupscreated;
    }

    public function hasCleanUps() {
        $myid = Member::currentUserID();
        $member = Member::currentUser();
        $cleanups = DataObject::get('CleanUpGroup');
        $joined = $member->getManyManyComponents('CleanUpGroups');
        if (!$cleanups) {
            return false;
        }
        if ($groupscreated = DataObject::get('CleanUpGroup', "CreatorID = '$myid'")) {
            return true;
        }
        if ($joined) {
            return $joined;
        }
        return false;
    }

    function JoinedGroups() {
        $member = Member::currentUser();
        if ($cleanups = $member->getManyManyComponents('CleanUpGroups')) {
            return true;
        }
        return false;
    }

    function MyCleanUps() {
        $member = Member::currentUser();
        $creatorid = Member::currentUserID();
        $created = DataObject::get('CleanUpGroup', "CreatorID = '$creatorid'");
        $joined = $member->getManyManyComponents('CleanUpGroups');
        
        if ($created && $joined) {
            $allcleanups = $created->merge($joined);
            return $created;
        }
        if ($joined) {
            return $joined;
        }
        if ($created) {
            return $created;
        }

        return false;
    }

     function edit($request) {
        Requirements::themedCSS('cleanup');
        if ($cleanupID = $request->param('ID')) {
            if ($cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'")) {
                if (!($cleanup->CreatorID == Member::currentUserID())) {
                    Director::redirect('my-events/Failure');
                }
                $editform = MyEvents_Controller::editform($cleanupID);
                //$cleanup->JoinForm = CleanUpsPage_Controller::JoinForm($cleanupID);
                return array(
				'EditForm' => $editform,
				'canDelete' => true,
				'DeleteLink' => $cleanup->DeleteLink()
				);
            } else {
                Director::redirect('my-events/Error/');
            }
        } else {
            Director::redirect('my-events/Error/');
        }
    }

    function Failure() {
        return array(
            "ErrorMessage" => '<br /><br /><p class="message error">You cannot edit a Clean Up Event you did not create, please contact the event Administrator to edit it if necessary.</p>'
        );
    }

    function Nomembers() {
        return array(
            "ErrorMessage" => '<br /><br /><p class="message error">Sorry your Clean Up Event has no members yet, maybe you should invites some more people</p>'
        );
    }

    function Error() {
        return array(
            "ErrorMessage" => '<br /><br /><p class="message error">This clean up event seems to be linked incorrectly. It may be that your account is not linked as the Clean Up Event creator, to solve any errors please <a href="contact-us/">contact us</a> with the name and contact details for your Clean Up!</p>'
        );
    }

    function editform($cleanupID) {
        return new EditForm($this, 'EditForm', $cleanupID);
    }
	

    function sendmessage($request) {
        //$memberID = Member::currentUserID();
        if ($cleanupID = $request->param('ID')) {
            if ($cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'")) {
                $sendform = MyEvents_Controller::SendForm($cleanupID);
                //$cleanup->JoinForm = CleanUpsPage_Controller::JoinForm($cleanupID);
                //$test = array('MyText' => 'test');

                $cleanup->renderWith(array('SendForm', 'FormPage'));
                return $cleanup;
            } else {
                Director::redirect('my-events/Error/');
            }
        } else {
            Director::redirect('my-events/Error/');
        }
    }

    function SendForm() {
        return new SendForm($this, 'SendForm');
    }

    function InviteForm() {
        return new InviteForm($this, 'InviteForm');
    }

    function upload($request) {
        Requirements::themedCSS('cleanup');
        //Requirements::javascript("mysite/javascript/example.js");
        //$memberID = Member::currentUserID();
        if ($cleanupID = $request->param('ID')) {
            if ($cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'")) {
                if (!($cleanup->CreatorID == Member::currentUserID())) {
                    Director::redirect('my-events/Failure/');
                }
                $uploadform = MyEvents_Controller::uploadform($cleanupID);
                //$cleanup->JoinForm = CleanUpsPage_Controller::JoinForm($cleanupID);
                return array('UploadForm' => $uploadform);
            } else {
                Director::redirect('my-events/Error/');
            }
        } else {
            Director::redirect('my-events/Error/');
        }
    }

    function uploadform($cleanupID) {
        return new UploadForm($this, 'UploadForm', $cleanupID);
    }

    function uploadbadge($request) {
        Requirements::themedCSS('cleanup');
        //Requirements::javascript("mysite/javascript/example.js");
        //$memberID = Member::currentUserID();
        if ($cleanupID = $request->param('ID')) {
            if ($cleanup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'")) {
                if (!($cleanup->CreatorID == Member::currentUserID())) {
                    Director::redirect('my-events/Failure/');
                }
                $uploadbadgeform = MyEvents_Controller::uploadbadgeform($cleanupID);
                //$cleanup->JoinForm = CleanUpsPage_Controller::JoinForm($cleanupID);
                return array('UploadBadgeForm' => $uploadbadgeform);
            } else {
                Director::redirect('my-events/Error/');
            }
        } else {
            Director::redirect('my-events/Error/');
        }
    }

    function uploadbadgeform($cleanupID) {
        return new UploadBadgeForm($this, 'UploadBadgeForm', $cleanupID);
    }

    function options() {
        return array(
            "UploadMessage" => '<h3>Thanks, your image was added to your Clean Up Event Gallery.</h3><p> You can upload as many images as you like by clicking Upload Images on your Clean Up Event(s) listed below. Or you can view the images you have uploaded by clicking View Images on your Clean Up Event(s) listed below.</p>'
        );
    }

}

?>