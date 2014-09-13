<?php

class FlickrGalleryExtended extends FlickrGallery {

    function getFlickrPage($page) {
        $flickr = new FlickrService();

        switch ($this->Method) {
            case 1:
                $photos = $flickr->getPhotos($this->Tags, $this->User, $this->NumberToShow, $page, $this->Sortby);
                break;
            case 2:
                $photos = $flickr->getPhotos($this->Tags, NULL, $this->NumberToShow, $page, $this->Sortby);
                break;
            case 3:
                $photos = $flickr->getPhotoSet($this->Photoset, $this->User, $this->NumberToShow, $page);
                break;
            case 4:
                $photos = $flickr->getPhotosFromGroupPool($this->GroupID, $this->Tags, $this->User, $this->NumberToShow, $page, $this->SortBy);
                break;
        }

        return $photos;
    }

    function getFlickrPageHTMLext($page) {
        $photos = $this->getFlickrPage($page);

        $photoHTML = ""; //"<div class='flickrthumb'>";
        $even_odd = 'odd';
        foreach ($photos->PhotoItems as $photo) {
            $even_odd = ( 'odd' != $even_odd ) ? 'odd' : 'even';
            $photoHTML .= '<div class=\'' . $even_odd . '\'>';
            $caption = htmlentities("<a href='$photo->page_url'>" . _t('FlickrGallery.VIEWINFLICKR', 'View this in Flickr') . "</a>");
            $photoHTML .= '<a href="http://farm1.static.flickr.com/' . $photo->image_path . '.jpg" class="fancybox" rel="fancybox" id="ViewLink-1" title="' . htmlentities($photo->title) . '" caption="' . $caption . '"><span></span><img src="http://farm1.static.flickr.com/' . $photo->image_path . '_s.jpg" alt="' . htmlentities($photo->title) . '" width=104 height=104 /></a>';
            $photoHTML .= "</div>";
        }


        if ($photos->PhotoItems) {
          } else {
            $photoHTML .= "<p>" . _t('FlickrGallery.NOIMAGES', 'Sorry!  Gallery doesn\'t contain any images for this page.') . "</p>";
        }
        return $photoHTML;
    }


}

class FlickrGalleryExtended_Controller extends FlickrGallery_Controller {

    function init() {

        parent::init();
    }

    function Content() {
        return $this->Content . $this->FlickrPhotos();
    }

    function FlickrPhotos() {
        return $this->getFlickrPageHTMLext($this->currentFlickrPage());
    }

    function page() {
        return array();
    }

    function currentFlickrPage() {
        if ($this->action == 'page' && is_numeric($this->urlParams['ID']))
            return $this->urlParams['ID'];
        else
            return 1;
    }

}

?>