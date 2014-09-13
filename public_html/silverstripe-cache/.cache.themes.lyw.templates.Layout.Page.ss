<?php
$val .= <<<SSVIEWER
<article class="Layout Page">
	<div class="columns-wrapper">
		<div class="col-1 no-margin">
			
SSVIEWER;
 if($item->hasValue("Form")) {  ;
 $val .= <<<SSVIEWER

				<div class="intro-text">
					<p>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MemberDefaultMessage",null,true) ;
 $val .= <<<SSVIEWER

				</div><!--.intro-text ends-->
				  
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

				<div class="intro-text">
					
SSVIEWER;
$val .=  $item->XML_val("Content",null,true) ;
 $val .= <<<SSVIEWER

				</div><!--.intro-text ends-->
			
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

			<div class="learn-downloads">
					
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("LearnDownloads")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

  
SSVIEWER;
 if($item->hasValue("Download")) {  ;
 $val .= <<<SSVIEWER
<div class="downloads">
          
SSVIEWER;
 if($item->hasValue("FileURL")) {  ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->XML_val("FileURL",null,true) ;
 $val .= <<<SSVIEWER
" target="_blank">
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<a href="
SSVIEWER;
$val .=  $item->obj("Attachment",null,true)->XML_val("URL",null,true) ;
 $val .= <<<SSVIEWER
" target="_blank">
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                <div class="downloads-img" >
                    
SSVIEWER;
 if($item->hasValue("DownloadThumbImage")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->obj("DownloadThumbImage")->XML_val("CroppedImage",array("215", "125"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/fileicons/display_
SSVIEWER;
$val .=  $item->XML_val("FileType",null,true) ;
 $val .= <<<SSVIEWER
.jpg" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                </div><!--.downloads-img ends-->
                  <div class="icon-text">
                      
SSVIEWER;
 if($item->XML_val("FileType",null,true) == "none") {  ;
 $val .= <<<SSVIEWER
                                       
                          <p class="full-desc">
SSVIEWER;
$val .=  $item->obj("Description")->XML_val("Summary",array("15"),true) ;
 $val .= <<<SSVIEWER
</p>
                      
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

						  <div class="Row">
							  <div class="icon 
SSVIEWER;
$val .=  $item->XML_val("FileType",null,true) ;
 $val .= <<<SSVIEWER
">
									<img src="
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/img/fileicons/icon_
SSVIEWER;
$val .=  $item->XML_val("FileType",null,true) ;
 $val .= <<<SSVIEWER
.jpg" />
							  </div><!--.icon ends-->
							  <div class="item-title">
							  	<h4>
SSVIEWER;
$val .=  $item->obj("Title")->XML_val("LimitWordCount",array("5"),true) ;
 $val .= <<<SSVIEWER
</h4>
							  </div>
						  </div>
                          <p class="Description">
SSVIEWER;
$val .=  $item->obj("Description")->XML_val("Summary",array("15"),true) ;
 $val .= <<<SSVIEWER
</p>
                      
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                  </div> <!--.icon-text ends-->
           </a>
       <div class="clear"></div>
   </div><!--.downloads ends-->
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

			   <div class="clear"></div>
		   </div><!--learn-downloads ends-->
		</div>
	 
SSVIEWER;
 if($item->hasValue("Form")) {  ;
 $val .= <<<SSVIEWER

		<div class="data-content no-top-margin">
			
SSVIEWER;
 if($item->hasValue("YoutubeLinks")) {  ;
 $val .= <<<SSVIEWER

				
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("YoutubeLinks")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

					<div class="youtube-embed white-box">
						<h4>
SSVIEWER;
$val .=  $item->XML_val("YoutubeTitle",null,true) ;
 $val .= <<<SSVIEWER
</h4>
						<iframe width="380" height="214" src="http://www.youtube.com/embed/
SSVIEWER;
$val .=  $item->XML_val("getYoutubeID",null,true) ;
 $val .= <<<SSVIEWER
" frameborder="0" allowfullscreen></iframe>
						<p>
SSVIEWER;
$val .=  $item->obj("YoutubeDescription")->XML_val("Summary",array("15"),true) ;
 $val .= <<<SSVIEWER
</p>
						<div class="clear"></div>
					</div>
				
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

		  
SSVIEWER;
 if($item->hasValue("Form")) {  ;
 $val .= <<<SSVIEWER

			  <div class="form-box">
					<div class="form-header">
						 <h1> 
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MemberFormTitle",null,true) ;
 $val .= <<<SSVIEWER
 </h1>
						 <div class="clear"></div>
					</div><!--form-header ends-->
						 
SSVIEWER;
$val .=  $item->XML_val("Form",null,true) ;
 $val .= <<<SSVIEWER

			  </div><!--form-box ends-->
		  
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

		</div><!--data-content ends-->
	 
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

	 <div class="data-content">
			
SSVIEWER;
 if($item->hasValue("YoutubeLinks")) {  ;
 $val .= <<<SSVIEWER

				
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("YoutubeLinks")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

					<div class="youtube-embed white-box">
						<h4>
SSVIEWER;
$val .=  $item->XML_val("YoutubeTitle",null,true) ;
 $val .= <<<SSVIEWER
</h4>
						<iframe width="380" height="214" src="http://www.youtube.com/embed/
SSVIEWER;
$val .=  $item->XML_val("getYoutubeID",null,true) ;
 $val .= <<<SSVIEWER
" frameborder="0" allowfullscreen></iframe>
						<p>
SSVIEWER;
$val .=  $item->obj("YoutubeDescription")->XML_val("Summary",array("15"),true) ;
 $val .= <<<SSVIEWER
</p>
						<div class="clear"></div>
					</div>
				
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

		</div><!--data-content ends-->
	 
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

	<div class="clear"></div>
	</div><!--.columns-wrapper ends-->
</article>
 
SSVIEWER;
