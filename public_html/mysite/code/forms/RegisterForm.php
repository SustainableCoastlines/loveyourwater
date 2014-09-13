<?php

/**
 * AccountForm allows riskmanagement members to update
 * their details for riskmanagement centre.
 *
 * @package riskmanagement
 */
class RegisterForm extends Form {

    function __construct($controller, $name) {
		$openTagCheckField = "<div class='Row CField'>";
		$closeTag = "</div>";

		$imagePresenterLogo = "<img src='".$this->ThemeDir()."/img/presenter_small_logo.png'>";

		$rowPhotoMessageBox = '<div class="Row MessageBox">';
		$rowPhotoMessageBox.= "<p>Upload a photo or logo that best describes you or your organisation. Recommended size 800x800 pixels. Max file size 2MB.</p>";
		$rowPhotoMessageBox.= "</div>";

		$rowDescriptionMessageBox = '<div class="Row MessageBox">';
		$rowDescriptionMessageBox.= "<p>Introduce yourself so that other users know who you are and why you Love your Coast!</p>";
		$rowDescriptionMessageBox.= "</div>";

		$rowLocationMessageBox = '<div class="Row MessageBox">';
		$rowLocationMessageBox.= "<p>Either type the city you live in on the location field above, or drag and drop the red marker onto where you’re based on the map below.</p>";
		$rowLocationMessageBox.= "</div>";


		$rowApprovalMessageBox = '<div class="Row MessageBox End">';
		$rowApprovalMessageBox.= "<p>Requires approval by the Website Administrator before you will be listed as a trained presenter.</p>";
		$rowApprovalMessageBox.= "</div>";

		$firstname = new MyTextField('FirstName', 'First name');
		$firstname->setPlaceholder('');

		$lastname = new MyTextField('Surname', 'Last name');
		$lastname->setPlaceholder('');

		$email = new MyTextField('Email', 'Email');
		$email->setPlaceholder('');

		$password = new PasswordField('Password', 'Password');

		$confirmpassword = new PasswordField('ConfirmPassword', 'Confirm password');

		$description = new SimpleHTMLEditorField('Description', '', '10', '17');

        $registerFields = new CompositeField(
                        /* new HeaderField('Registration Form', 3), */
						$firstname,
        				$lastname,
                        $email,
						new TextField('Phone', 'Phone Number'),
						$password,
						$confirmpassword,
						new TextField('LocationAddress', 'Location &nbsp;'),
						new LiteralField('BoxMessage', $rowLocationMessageBox),
						new GoogleMapSelectableField('Location', "Location map", "-40.996484", "174.067383", "380px", "320px", "6"),
						new HiddenField('LocationLongitude', 'Longitude (hide this)'),
						new HiddenField('LocationLatitude', 'Latitude (hide this)'),
						new SimpleImageField('ProfileImage', 'Profile picture'),
						new LiteralField('BoxMessage', $rowPhotoMessageBox),
						$description,
						new LiteralField('BoxMessage', $rowDescriptionMessageBox),
						new LiteralField('OpenTag', $openTagCheckField),
						new CheckboxField('RequestListedAsPresenter', 'I have recieved training to deliver the Love your Coast litter awareness presentation and want people to contact me to arrange a presentation for their school, community group or business.'),
						new LiteralField('ImageHolder', $imagePresenterLogo),
						new LiteralField('CloseTag', $closeTag),
						new LiteralField('BoxMessage', $rowApprovalMessageBox)
                        //new CheckboxField('ReceiveMail', 'Yep, I want to hear more from Love Your Coast')
        );
        $fields = new FieldSet($registerFields);

        Requirements::customScript('
			jQuery(document).ready(function() {
				
				jQuery("#RegisterForm_RegisterForm_FirstName").addClass("validate[required,length[0,100]] text-input");
				jQuery("#RegisterForm_RegisterForm_Surname").addClass("validate[required,length[0,100]] text-input");
				jQuery("#RegisterForm_RegisterForm_Email").addClass("validate[required,custom[email]] text-input");
				jQuery("#RegisterForm_RegisterForm_Password").addClass("validate[required,length[6,100]] text-input");
				jQuery("#RegisterForm_RegisterForm_ConfirmPassword").addClass("validate[required,confirm[RegisterForm_RegisterForm_Password]] text-input");
				
				jQuery("#Password span.validation").addClass("formError RegisterForm_RegisterForm_Password");
				
				jQuery("#RegisterForm_RegisterForm").validationEngine()
				
			});
		');
        $actions = new FieldSet(
                        new FormAction('register', 'Create my account')
        );
        parent::__construct($controller, $name, $fields, $actions);
    }

    /**
     * Save the member and redirect
     */
    function register($data, $form, $request) {
        //Check if this member already exists
        // Create new OR update logged in {@link Member} record
        $member = CleanUpRole::createOrMerge($data);
		$tempMember = TempMember::Emailexists($data);
        if (!$member || $tempMember) {
            $form->sessionMessage(
                    _t(
                            'RegisterForm.MEMBEREXISTS', 'Sorry, a member already exists with that email address.
					If this is your email address, please <a href="my-events/">log in here</a>'
                    ),
                    'bad'
            );
            Director::redirectBack();
            return false;
        }

//CHANGE
		//Create temp member
		$tempMember = new TempMember();
		$form->saveInto($tempMember);
		if( $tempMember->write() ) {
			// Send a confirmation Email
			$from = Email::getAdminEmail();
			$to = $tempMember->Email;
			$name = $tempMember->FirstName;
			$subject = 'Thank you for joining Love Your Coast';
			$email = new joinEmail_SignUpMessage();
			$email->setFrom($from);
			$email->setTo($to);
			$email->setSubject($subject);

			$email->populateTemplate(
			        array(
			            'Contact' => $name,
						'VerificationCode' => $tempMember->VerificationCode
			        )
			);

			$email->send();
			
		    Director::redirect('success');
        } else {
            $form->sessionMessage(_t("Register.REGISTRATION ERROR", "Your registration wasn't successful please try again"), 'bad');
            Director::redirectBack();
		}
		
//END-OF-CHANGE
    }

}

class joinEmail_SignUpMessage extends Email {

    protected $ss_template = 'joinEmail_SignUpMessage';

}

?>