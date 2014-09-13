<?php
$val .= <<<SSVIEWER
<article class="Layout MyEvents">

	
SSVIEWER;
 if($item->hasValue("CurrentMember")) {  ;
 $val .= <<<SSVIEWER

		<div class="col-wrap">
		<div class="col-1 no-margin">
			<div class="intro-text">
				<p>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("MyEventsContent",null,true) ;
 $val .= <<<SSVIEWER
</p>
			</div>
		</div>
		 <div class="learn-downloads">
			<div class="col-1 no-margin">
						
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
		   </div><!--col-1 no-margin ends-->
		</div><!--col-wrap ends-->

		<div class="content-right no-bg">
		 <div class="my-events-wrap">
      <div class="my-events-header">
                
SSVIEWER;
 if($item->hasValue("CurrentMember")) {  ;
 $val .= <<<SSVIEWER

                <!-- -------------------------------------------------------------------------------------------LOGGED IN -->
                
SSVIEWER;
 if($item->hasValue("hasCleanUps")) {  ;
 $val .= <<<SSVIEWER

                <div class="messages">
                
SSVIEWER;
 if($item->hasValue("ErrorMessage")) {  ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
$val .=  $item->XML_val("ErrorMessage",null,true) ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
 if($item->hasValue("UploadMessage")) {  ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
$val .=  $item->XML_val("UploadMessage",null,true) ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                
                </div>
     </div><!--my-events-header ends-->
 <div class="white-box"> 
   <div class="my-events">    
        
SSVIEWER;
 if($item->hasValue("CreatedGroups")) {  ;
 $val .= <<<SSVIEWER

        <div class="created-wrap">
         <h3>Events you've created:</h3>
          <div class="clear"><!-- SPACE --> </div>
            <div class="created">
                
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("CreatedGroups")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

                <div class="my-event white-box">
                <div class="my-event-wrap">
              		<div class="my-events-img">
                           
SSVIEWER;
 if($item->hasValue("EventMainImage")) {  ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventMainImage")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("167","167"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventCommunityBadge")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("167","167"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                    </div><!--my-events-img ends-->
                     <h4>
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</h4>
                     <div class="clear"><!-- SPACE --> </div>
                    <div class="my-events-info">
                     	
SSVIEWER;
 if($item->hasValue("FromDate")) {  ;
 $val .= <<<SSVIEWER

                        <p>Start Date:<span> 
SSVIEWER;
$val .=  $item->obj("FromDate",null,true)->XML_val("nice",null,true) ;
 $val .= <<<SSVIEWER
</span></p>
                        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                        
SSVIEWER;
 if($item->hasValue("ToDate")) {  ;
 $val .= <<<SSVIEWER

                        <p>To:<span> 
SSVIEWER;
$val .=  $item->obj("ToDate",null,true)->XML_val("nice",null,true) ;
 $val .= <<<SSVIEWER
</span></p>
                        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                        
SSVIEWER;
 if($item->hasValue("LocationAddress")) {  ;
 $val .= <<<SSVIEWER

                        <p>Location:<span>
SSVIEWER;
$val .=  $item->XML_val("LocationAddress",null,true) ;
 $val .= <<<SSVIEWER
</span></p>
                        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                      <!--  
SSVIEWER;
 if($item->hasValue("Description")) {  ;
 $val .= <<<SSVIEWER
<p>What:<span> 
SSVIEWER;
$val .=  $item->obj("Description")->XML_val("Summary",array("20"),true) ;
 $val .= <<<SSVIEWER
 <a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" title="See event">more</a></span></p>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
-->
                    </div>
                 </div><!--my-event-wrap ends-->
                  <div class="little-nav">
                        <a class="links-btn" href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" title="View event">View Event</a> 
                        <a class="links-btn" href="
SSVIEWER;
$val .=  $item->XML_val("EditLink",null,true) ;
 $val .= <<<SSVIEWER
" title="Edit details">Edit Event</a>
                    </div>
                 </div><!--my-event ends-->
                
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

            </div><!--created end-->
            <div class="clear"><!-- SPACE --> </div>
        </div><!--created-wrap ends-->
        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


        
SSVIEWER;
 if($item->hasValue("JoinedGroups")) {  ;
 $val .= <<<SSVIEWER

        
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("CurrentMember")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

        
SSVIEWER;
 if($item->hasValue("CleanUpGroups")) {  ;
 $val .= <<<SSVIEWER

        <h3>Events you've joined:</h3>
        <div class="joined-wrap">
             
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("CurrentMember")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("CleanUpGroups")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
 if($item->hasValue("CreatedByMe")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

                <div class="my-event white-box">
                <div class="my-event-wrap">
                    <div class="my-events-img">
                        <div>
                           
SSVIEWER;
 if($item->hasValue("EventMainImage")) {  ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventMainImage")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("167","167"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("EventCommunityBadge")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("CroppedImage",array("167","167"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                        </div>
                    </div>
                    <h4>
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</h4>
                    <div class="clear"><!-- SPACE --> </div>
                    <div class="my-events-info">
                        
SSVIEWER;
 if($item->hasValue("FromDate")) {  ;
 $val .= <<<SSVIEWER

                        <p>Start Date:<span> 
SSVIEWER;
$val .=  $item->obj("FromDate",null,true)->XML_val("nice",null,true) ;
 $val .= <<<SSVIEWER
</span></p>
                        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                        
SSVIEWER;
 if($item->hasValue("ToDate")) {  ;
 $val .= <<<SSVIEWER

                        <p>To:<span> 
SSVIEWER;
$val .=  $item->obj("ToDate",null,true)->XML_val("nice",null,true) ;
 $val .= <<<SSVIEWER
</span></p>
                         
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                        <p>Location:<span>
SSVIEWER;
$val .=  $item->XML_val("LocationAddress",null,true) ;
 $val .= <<<SSVIEWER
</span></p>
                       <!-- 
SSVIEWER;
 if($item->hasValue("Description")) {  ;
 $val .= <<<SSVIEWER
<p>What:<span> 
SSVIEWER;
$val .=  $item->obj("Description")->XML_val("Summary",array("20"),true) ;
 $val .= <<<SSVIEWER
 <a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" title="See event">more</a></span></p>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
-->
                    </div>
                    <div class="clear"><!-- SPACE --> </div>
                     </div><!-- my-event-wrap ends --> 
                     <div class="little-nav">
                        <a class="links-btn" href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" title="View event">View Event</a> 
                        <a class="links-btn" href="
SSVIEWER;
$val .=  $item->XML_val("SendLink",null,true) ;
 $val .= <<<SSVIEWER
" id="
SSVIEWER;
$val .=  $item->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
">Send Email</a>
                    </div>   
                </div><!-- my-event ends -->
                
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

                
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

            <div class="clear"><!-- SPACE --></div>
        </div><!--joined-wrap end-->
        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

        
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


        <!-- if the Logged in Member doesnt have clean ups -->
        
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

        <h2>
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</h2>
        
SSVIEWER;
$val .=  $item->XML_val("JoinMessage",null,true) ;
 $val .= <<<SSVIEWER

        
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

        <!-- Content if the User is not a Member or isn't currently logged on-->
        
       <!-- -------------------------------------------------------------------------------------------END MEMBER STATES  -->
  
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

</div> <!--my-events ends   -->
</div>          
</div> <!--my-events-wrap ends   --> 
			
            
		</div><!--content-right ends-->
		
SSVIEWER;
$val .=  $item->XML_val("Form",null,true) ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

		
     	<!-- -------------------------------------------------------------------------------------------LOGGED OUT -->
                
SSVIEWER;
 if($item->XML_val("Action",null,true) == "verification") {  ;
 $val .= <<<SSVIEWER

					<!-- verify account form -->
					<div class="form-box">
						<div class="form-header">
							<h1>Verification</h1>
							<div class="clear"></div>
						</div><!--form-header ends-->
							 
SSVIEWER;
$val .=  $item->XML_val("ActivationMessage",null,true) ;
 $val .= <<<SSVIEWER

							 
SSVIEWER;
$val .=  $item->XML_val("VerificationForm",null,true) ;
 $val .= <<<SSVIEWER

					</div><!--form-box ends-->
		        
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

                   
                    
SSVIEWER;
 if($item->hasValue("ShowCreateAccountForm")) {  ;
 $val .= <<<SSVIEWER

						<section class="SecondaryBlock">
							<div class="col-wrap">
								<div class="col-1 no-margin">
									<div class="home-intro">
										<p>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("CreateAccountContent",null,true) ;
 $val .= <<<SSVIEWER
</p>
									</div>
								</div>
							</div>
							<!-- create account form -->
							<div class="account-links">
								<div class="btn">
								 <a class="form-btn" href="my-events/">Login here</a>
								</div>
							</div>
						</section>
						<section class="PrimaryBlock">
							<div class="form-box">
								<div class="form-header">
									<div class="Row HeaderText">
										<h1>Create new account</h1>
									</div>
									<div class="Row MessageBox">
										
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("page", array("my-events"))) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

										
SSVIEWER;
$val .=  $item->XML_val("RegisterMessage",null,true) ;
 $val .= <<<SSVIEWER

										
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

									</div>
								</div><!--form-header ends-->
								
SSVIEWER;
$val .=  $item->XML_val("RegisterForm",null,true) ;
 $val .= <<<SSVIEWER

							</div><!--form-box ends-->
							<div class="clear"></div>
						</section>
                    
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

                        <!-- login form -->
                        <div class="col-wrap"> 
                            <div class="col-1 no-margin">
                                <div class="home-intro">
                                    <p>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("LoginContent",null,true) ;
 $val .= <<<SSVIEWER
</p>
                                </div>
                            </div>
                        </div>
                        <div class="account-links">
                            <div class="btn">
                                <a class="form-btn" href="
SSVIEWER;
$val .=  $item->XML_val("CreateAccountLink",null,true) ;
 $val .= <<<SSVIEWER
">Signup here</a>
                            </div>
                        </div>
                          <div class="form-box">
                            <div class="form-header">
                                <h1>Login</h1>
                                
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("page", array("my-events"))) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

                                	
SSVIEWER;
$val .=  $item->XML_val("LoginMessage",null,true) ;
 $val .= <<<SSVIEWER

                                
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

                               <div class="clear"></div>
                            </div><!--form-header ends-->
                            
SSVIEWER;
$val .=  $item->XML_val("LoginForm",null,true) ;
 $val .= <<<SSVIEWER

                         </div><!--form-box ends-->
                         <div class="clear"></div>
                    
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
<!-- end if CreateAccountForm State -->
                
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
<!--end if Action -->
     
     
		<div class="clear"></div>
	
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

</article>
SSVIEWER;
