<?php

class cropResizeImage {

    var $imgSrc, $myImage, $imgDest;

    function croppedResize($imageURL, $destwidth, $destheight) {

        $this->imgSrc = $imageURL;

        list($width, $height) = getimagesize($this->imgSrc);

        $this->myImage = imagecreatefromjpeg($this->imgSrc) or die("Error: Cannot find image!");

        $destAR = $destwidth / $destheight;
        if ($width > 0 && $height > 0) {
            // We can't divide by zero theres something wrong.

            $srcAR = $width / $height;

            // Destination narrower than the source
            if ($destAR < $srcAR) {
                $srcY = 0;
                $srcHeight = $height;

                $srcWidth = $height * $destAR;
                $srcX = ($width - $srcWidth) / 2;

                // Destination shorter than the source
            } else {
                $srcX = 0;
                $srcWidth = $width;

                $srcHeight = $width / $destAR;
                $srcY = ($height - $srcHeight) / 2;
            }

            $this->imgDest = imagecreatetruecolor($destwidth, $destheight);
            
            imagecopyresampled($this->imgDest, $this->myImage, 0, 0, $srcX, $srcY, $destwidth, $destheight, $srcWidth, $srcHeight);
        }
    }

    function renderImage() {

        header('Content-type: image/jpeg');
        imagejpeg($this->imgDest);
        imagedestroy($this->imgDest);
    }

}

$image = new cropResizeImage;
$image->croppedResize($_GET['src'], $_GET['width'], $_GET['height']);
$image->renderImage();
?>
