<?php
class Organisation extends DataObject {
 
		static $db = array (
		'Name' => 'Text',
		'Country' => 'Text',
		'OrganisationLinkHTTP' => 'Text'
	);
	
	static $has_one = array (
		'AboutPage' => 'AboutPage',
		'OrganisationImage' => 'OrganisationImage_Image'
	);
		
	public function getCMSFields_forPopup()
	{
			return new FieldSet(
			new TextField('Name', 'Name'),
			new SimpleImageField('OrganisationImage', 'Upload the logo image dimensions are 222 x 222'),
			new TextField('OrganisationLinkHTTP', 'Please enter Organisation URL address'),
			new TextField('Country', 'Please enter Country name')
		);
		
	}
	
	
	function canCreate() {return true;}
   	function canEdit() {return true;}
   	function canDelete() {return true;}
	function canPublish() {return true;}
	
	
}

class OrganisationImage_Image extends Image {
   function generateOrganisationImageThumbnail($gd) {
      return $gd->croppedResize(220,220);
   }
   function generateOrganisationImageMed($gd) {
      return $gd->croppedResize(450,250);
   }
   function generateOrganisationImageFull($gd) {
      return $gd->croppedResize(1280,375);
   } 
   //Thumbnail
   function useThumb() {
      return $this->OrganisationImageThumbnail();
   }
 

}

?>
