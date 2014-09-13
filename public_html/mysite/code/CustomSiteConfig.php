<?php

class CustomSiteConfig extends DataObjectDecorator 
{
    /**
	 * Add custom fields into the database table
	 *
	 * @return array An array of the custom database fields
	 */ 
    function extraStatics() {
        return array(
            'db' => array(
                'GoogleAnalyticsCode'		=> 'VarChar(150)',
                'GoogleVerificationCode'	=> 'VarChar(255)',
                'LearnLink'			=> 'VarChar(150)',
                'CreateLink'			=> 'VarChar(150)',
                'FindLink'			=> 'VarChar(150)',
                'ShareLink'			=> 'VarChar(150)',
                'MyEventsLink'			=> 'VarChar(150)',
                'MyResultsLink'			=> 'VarChar(150)',
                'MyAccountLink'			=> 'VarChar(150)',
                'MyEventsTitle'			=> 'VarChar(150)',
                'MyResultsTitle'		=> 'VarChar(150)',
                'MyAccountTitle'		=> 'VarChar(150)',
                'CreateAccountContent'		=> 'HTMLText',
                'LoginContent'			=> 'HTMLText',
                'MyEventsContent'		=> 'HTMLText',
                'MemberDefaultMessage'		=> 'HTMLText',
                'MemberFormTitle'		=> 'VarChar(250)',
                'FooterFAQLink'                 => 'VarChar(250)',
                'FooterCol1title'               => 'VarChar(250)',
                'FooterCol1content'             => 'HTMLText',
                'FooterCol2title'               => 'VarChar(250)',
                'FooterCol2content'             => 'HTMLText',
                'FooterCol3title'               => 'VarChar(250)',
                'FooterCol3content'             => 'HTMLText',
                'HelpEmail'                     => 'VarChar(250)',
				'FooterSocialMediaMessage'		=> 'VarChar(250)'
            )
        );
    }
	
	/**
	 * Add custom form fields into the CMS Main tab
	 *
	 * @return void
	 */
    public function updateCMSFields(FieldSet & $fields) {         
         $fields->addFieldsToTab('Root.GoogleSEO',
		array(
                // Appended Meta Data
                new HeaderField('Google Codes', 1),
		new HeaderField('SiteWide', 2),
                new TextField('GoogleVerificationCode', 'Verification Code (code only)'),
                new TextField('GoogleAnalyticsCode', 'Analytics Code (code only, starting with UA-)'),
                ));
          $fields->addFieldsToTab('Root.DefaultLinks',
		array(
                // Appended Meta Data
              	new HeaderField('Links & Messages for site users', 1),
                new TextField('HelpEmail', 'Help Email, used in footer and cross site'),
		new TextField('LearnLink', 'Link for Learn Site Section'),
		new TextField('CreateLink', 'Link for Create Site Section'),
                new TextField('FindLink', 'Link for Find Site Section'),
		new TextField('ShareLink', 'Link for Share Site Section'),
		new TextField('MyEventsLink', 'Link for Account Menu -> Events Site Section'),
		new TextField('MyEventsTitle', 'Title for Account Menu -> Events Site Section'),
		new TextField('MyResultsLink', 'Link for Account Menu -> Results Site Section'),
		new TextField('MyResultsTitle', 'Title for Account Menu -> Results Site Section'),
		new TextField('MyAccountLink', 'Link for Account Menu -> Account Site Section')
		));
          $fields->addFieldsToTab('Root.UserMessages',
		array(
		//Member Content
                new HtmlEditorField('CreateAccountContent', 'Prompt Member to Create an Account', 4,20),
		new HtmlEditorField('LoginContent', 'Prompt Member to Login', 4,20),
		new HtmlEditorField('MyEventsContent', 'User Account Content', 4,20),
		new HtmlEditorField('MemberDefaultMessage', 'Message Shown on Incorrect Login, Admin Login and Permissions Error', 4,20),
		new TextField('MemberFormTitle', 'Title Shown on Incorrect Login, Admin Login and Permissions Error')
                ));
          $fields->addFieldsToTab('Root.FooterContent',
		array(
		//Member Content
                new TextField('FooterFAQLink', 'URL Segement for FAQ link in footer e.g about/'),
                new TextField('FooterCol1title', 'Title Col1'),
			    new TextareaField('FooterSocialMediaMessage', 'Social Media Message'),
                new HtmlEditorField('FooterCol1content', 'Footer Column 1 Content', 4,20),
                new TextField('FooterCol2title', 'Title Col1'),
                new HtmlEditorField('FooterCol2content', 'Footer Column 1 Content', 4,20),
                new TextField('FooterCol3title', 'Title Col1'),
                new HtmlEditorField('FooterCol3content', 'Footer Column 1 Content', 4,20)
                ));
    }
    
    
    
}