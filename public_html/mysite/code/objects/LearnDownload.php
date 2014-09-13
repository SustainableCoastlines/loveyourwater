<?php

class LearnDownload extends DataObject {

    static $db = array(
        'Title' => 'Text',
        'Description' => 'Text',
		'FileURL'	=> 'VarChar(150)', 
		'FileType' => "Enum('none, pdf, jpg, doc, xls, zip','pdf')"
    );
    static $has_one = array(
        'LearnPage' => 'LearnPage',
        'Attachment' => 'File',
        'Photo' => 'Image',
		'DownloadThumbImage' => 'Image'
    );
	static $many_many = array(
        'Page' => 'Page',
    );

    public function getCMSFields_forPopup() {
        return new FieldSet(
                new TextField('Title'),
				new ImageField('DownloadThumbImage', 'Downloads Thumbnail Image'),
				new DropdownField('FileType','Image type', array('none' => 'none', 'pdf'=>'pdf','jpg'=>'jpg','doc'=>'doc','xls'=>'xls','zip'=>'zip')),
                new TextAreaField('Description'),
				new TextField('FileURL', 'Link For External File'),
                new FileIFrameField('Attachment')
        );
    }
	
	public function Download(){
		$oExternalFile = $this->FileURL;
		$ointernalFile = $this->Attachment();
		if($oExternalFile || $ointernalFile){
			return true;	
		}else{
			return false;
		}
	}
	
	/**                                                                                         
	 * Generate an image thumbnail for the DOM                                                  
	 */
    public function getThumbImage() {
        if ($this->DownloadThumbImageID) {
			return $this->DownloadThumbImage()->CMSThumbnail();
		} else {   
            return '(No Image)';
		}
    }
	
	
}

?>
