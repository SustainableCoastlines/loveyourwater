<?php

/**
 * Add custom fields into the Site Config.
 * The SiteConfig extension also needs to be set in the mysite/_config.php file
 */
 
class SocialSiteConfig extends DataObjectDecorator 
{
    /**
	 * Add custom fields into the database table
	 *
	 * @return array An array of the custom database fields
	 */ 
    function extraStatics() {
        return array( 
            'db' => array(
                'FacebookLink' => 'VarChar(100)',
				'UseLikeAll' => 'Boolean',
				'TwitterLink' => 'VarChar(100)',
				'TwitterAtAccount' => 'VarChar(100)',
				'UseFollowAll' => 'Boolean',
				'GooglePlusLink' => 'VarChar(100)',
				'GooglePlusOne' => 'Boolean',
				'PinterestLink' => 'VarChar(100)',
				'LinkedInLink' => 'VarChar(100)',
				'YouTubeLink' => 'VarChar(100)',
				'VimeoLink' => 'VarChar(100)',
				'StumbleUponLink' => 'VarChar(100)',
				'DiggLink' => 'VarChar(100)',
				'FlickrLink' => 'VarChar(100)',
				"IconSetNo" => "Enum('001, 002, 003, 004, 005, 006, 007', '004')",
				//FacebookOG Set-up
				'AddFacebookData' => 'Boolean',
				'OGType' => 'VarChar(100)',
				'FBAdmin' => 'VarChar(100)'
            ),
			'has_one' => array(
				'OGImage' => 'Image'
			)
        );
    }
	
	/**
	 * Add custom form fields into the CMS Main tab
	 *
	 * @return void
	 */
    public function updateCMSFields(FieldSet & $fields) {         
        $fields->addFieldsToTab('Root.SocialLinks',
			array(
                // Appended Meta Data
                new HeaderField('SocialLinks', 1),
                new TextField('FacebookLink', 'Link to your Facebook Page'),
				new CheckboxField('UseLikeAll', 'Use the default Facebook Like System, NB: Open Graph Tags must be set'),
                new TextField('TwitterLink', 'Link to your Twitter Page'),
				new TextField('TwitterAtAccount', 'Your Twitter @ Account ID (without @) e.g hello_toast'),
				new CheckboxField('UseFollowAll', 'Use the default Twitter Follow Link'),
				new TextField('YouTubeLink', 'Link to your YouTube Account'),
				new TextField('GooglePlusLink', 'Link to Google + 1 '),
				new CheckboxField('GooglePlusOne', 'Use the Google + 1 recommend indicator'),
				new TextField('VimeoLink', 'Link to your Vimeo Account'),
				new TextField('PinterestLink', 'Link to your Pinterest'),
				new TextField('DiggLink', 'Link to your Digg Account'),
				new TextField('FlickrLink', 'Link to your Flickr Account'),
				new TextField('StumbleUponLink', 'Link to your StumbleUpon Account'),
				new HeaderField('Select Icon Set', 1),
				new DropdownField('IconSetNo', 'Select The icon set to use', $this->owner->getIconSetOptions()),
				new LiteralField('IconSetPreview', 'Preview the social <a href="social/social-packs/social-icon-packs.php" target"_blank" >icon packs here</a>')
            )
        );
		$fields->addFieldsToTab('Root.FBLikeSetUp',
			array(
                // Appended Meta Data
                new HeaderField('Set-Up for Facebook like OG Tags', 1),
                new CheckboxField('AddFacebookData', 'Check this box and add OG Data if using Facebook Like'),
				new DropdownField('OGType', 'Select what type of information your site conveys', $this->owner->getOGTypeOptions()),
				new TextField('FBAdmin', 'Add FB Admin account number'),
				new ImageField('OGImage', 'Upload a Default Image to be used on Facebook - perhaps your logo')
            )
        );
    }
	
	public function getIconSetOptions() {
		$aIconSets = array(
			001 => 'Sketch', 
			002 => 'Sketch 2', 
			003 => 'Standard - Round', 
			004 => 'Standard - Square', 
			005 => 'Small', 
			//006 => 'Black Sheen',
			007 => 'Share Buttons'
		);
		// Return the list
		return $aIconSets;
	}
	
	public function getOGTypeOptions(){
		$aOGTypes = array(
			'activity' => 'activity', 
			'sport' => 'sport', 
			'bar' => 'bar', 
			'company' => 'company', 
			'cafe' => 'cafe', 
			'hotel' => 'hotel', 
			'restaurant' => 'restaurant', 
			'cause' => 'cause', 
			'sports_league' => 'sports_league',
			'sports_team' => 'sports_team', 
			'band' => 'band', 
			'government' => 'government', 
			'non_profit' => 'non_profit', 
			'school' => 'school',
			'university' => 'university',
			'actor' => 'actor',
			'athlete' => 'athlete', 
			'author' => 'author', 
			'director' => 'director', 
			'musician' => 'musician', 
			'politician' => 'politician', 
			'public_figure' => 'public_figure', 
			'city' => 'city', 
			'country' => 'country', 
			'landmark' => 'landmark', 
			'state_province' => 'state_province',
			'album' => 'album', 
			'book' => 'book', 
			'drink' => 'drink', 
			'food' => 'food', 
			'game' => 'game', 
			'product' => 'product',
			'song' => 'song',
			'movie' => 'movie', 
			'tv_show' => 'tv_show',
			'blog' => 'blog',
			'website' => 'website',
			'article' => 'article'
		);
		return $aOGTypes;
	}
	
}