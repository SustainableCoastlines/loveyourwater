<?php

/**
 * CreateForm is the Create A Clean Up Group Form
 *
 */
class UploadForm extends Form {

    function __construct($controller, $name, $cleanupID) {

        // Get The clean Up we need to edit
        $cleanupgroup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'");
        //Get The Regions
        //$lat = $cleanupgroup->LocationLatitude;
        //$lon = $cleanupgroup->LocationLongitude;
        //$loc = $cleanupgroup->LocationAddress;

        $image1 = new ImageUploadField("Image", "Upload an image");
        $image1->setUploadFolder("EventImages2010");
        //$image1->uploadOnSubmit();
        //$image1->noUploadOnSubmit();
        //fields
        $uploadimagesFields = new CompositeField(
                        new HeaderField('Add an Image to your Event Gallery', 3),
                        new LiteralField('Help', '<p class="help">Please upload as many images as you would like by clicking "Upload Images" again when redirected to your event\'s page.</p><p>The maximum allowed file size is 2MB and allowed file extensions are jpg, gif and png.</p><p><strong>NOTE - Because this image is hosted on Flickr, there may be a delay between uploading your image and it appearing in your event\'s image gallery. </strong> <p>Thank you for contributing.</p>'),
                        $image1,
                        new TextField('Caption', 'Image Caption'),
                        new HiddenField('CleanUpID', 'CleanUpID', $cleanupID)
        );

        $fields = new FieldSet($uploadimagesFields);

        //val and doubleselect stuff
        Requirements::javascript("mysite/javascript/UploadFormVal.js");
        //actions
        $actions = new FieldSet(
                        new FormAction('uploadimages', 'Upload')
        );
        parent::__construct($controller, $name, $fields, $actions);
    }

    /**
     * Save the cleanup and redirect
     */
    function uploadimages($data, $form) {
        //Check there is a member! IF not return false
        $member = Member::currentUser();
        if (!$member) {
            $form->sessionMessage(_t("Create.CLEANUPCREATTIONERROR", "You Need to be logged in to Edit An Event"), 'bad');
            Director::redirectBack();
        } else {
            //$fri = (!empty($_REQUEST['Friday'])) ? $_REQUEST['Friday'] : null;
            //CLEANUP EVENT WE ARE ADDING IMAGES FO
            $cleanupID = (!empty($_REQUEST['CleanUpID'])) ? $_REQUEST['CleanUpID'] : null;
            $cleanupgroup = DataObject::get_one('CleanUpGroup', "CleanUpGroup.ID = '$cleanupID'");
            if (!$cleanupgroup) {
                $form->sessionMessage(_t("Create.CLEANUPIMAGEUPLOADERROR", "You Need to have a Clean Up Event to add images "), 'bad');
                Director::redirectBack();
            } else {

                $curralbum = DataObject::get_one('ImageGalleryAlbum', "ImageGalleryAlbum.CleanUpGroupID = '$cleanupgroup->ID'");
                //add image to flickr
                if (isset($data['ImageID'])) {
                    //Debug::show($data);
                    //Debug::show("Upload attempt: ImageID: " . $data['ImageID'] . "  Title: " . "Photo from Love Your Coast event: " . $cleanupgroup->Title . " . <a href=\"http://www.loveyourcoast.org".$cleanupgroup->Link()."\">Visit this event on LoveYourCoast.org</a>  Caption:  " . $data['Caption'] . "  MT: " . $cleanupgroup->machineTag());
                    $flickr = new FlickrService();
                    $flickr->uploadPhoto($data['ImageID'], "Love Your Coast Event - " . $cleanupgroup->Title, "- ".$data['Caption'] . " -      Visit this event -> http://www.loveyourcoast.org".$cleanupgroup->Link()."", $cleanupgroup->machineTag());
                }

                //1) Album Check Existing
                if ($curralbum) {
                    //2) Add Images
                    $imageitem = new ImageGalleryItem();
                    $imageitem->CleanUpGroupID = $cleanupgroup->ID;
                    $form->saveInto($imageitem);
                    $imageitem->ImageGalleryPageID = 13;
                    $imageitem->AlbumID = $curralbum->ID;
                    $imageitem->write();

                    //Should redirect to gallery
                    $folderid = $curralbum->FolderID;
                    $folder = DataObject::get_one('Folder', "ID = '$folderid'");
                    $gallerylink = '/lyc2010_live/gallery10/album/' . $folder->Name;
                    Director::redirect($cleanupgroup->Link());
                } else {
                    //1a) Create Album & Folder
                    $album = new ImageGalleryAlbum();
                    $album->AlbumName = $cleanupgroup->Title;
                    $album->CleanUpGroupID = $cleanupgroup->ID;
                    $album->ImageGalleryPageID = 13;
                    $folder = Folder::findOrMake('image-gallery/Gallery10/' . $cleanupgroup->Title);
                    $album->FolderID = $folder->ID;

                    $album->write();

                    //2) Add Images
                    $imageitem = new ImageGalleryItem();
                    $imageitem->CleanUpGroupID = $cleanupgroup->ID;
                    $form->saveInto($imageitem);
                    $imageitem->ImageGalleryPageID = 13;
                    $imageitem->AlbumID = $album->ID;

                    $imageitem->write();

                    //Should redirect to gallery
                    $gallerylink = '/lyc2010_live/gallery10/album/' . $folder->Name;
                    Director::redirect($cleanupgroup->Link());
                }
            }
        }
    }

//UPLOAD FORM CLASS ENDS
}

?>