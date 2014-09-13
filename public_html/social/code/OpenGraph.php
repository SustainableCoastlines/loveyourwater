<?php

/** 
* Page Decorator, to give FBOpenGraph Options to every page 
*/ 
class OpenGraph extends SiteTreeDecorator {

	function extraStatics(){ 
		return array(
			'db' => array(
				'OGTitle' => 'VarChar(100)',
				'OGDescription' => 'VarChar(100)',
			),
			'has_one' => array(
				'OGImage' => 'Image'
			)
		); 
	}
	
	function updateCMSFields(&$fields){ 
		$fields->addFieldToTab('Root.Content.OpenGraphTags', new TextField('OGTitle', 'Facebook Title, for like function')); 
		$fields->addFieldToTab('Root.Content.OpenGraphTags', new TextField('OGDescription', 'Facebook Description, for like function'));
		$fields->addFieldToTab('Root.Content.OpenGraphTags', new ImageField('OGImage', 'Facebook Image, for like function')); 
	}
	

	
} 
?>