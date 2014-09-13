<?php
$val .= <<<SSVIEWER
<div class="field UploadifyField backend">
	<div class="horizontal_tab_wrap">
	  <div class="tabNavigation clearfix">
		<label for="
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</label>
	    <ul class="navigation">
	        <li class="first"><a href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#import-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" id="tab-import-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  _t('Uploadify.CHOOSEEXISTING','Choose existing') ;
 $val .= <<<SSVIEWER
</a></li>        
	        <li><a href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#upload-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" id="tab-upload-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  _t('Uploadify.UPLOADNEW','Upload new') ;
 $val .= <<<SSVIEWER
</a></li>
	    </ul>
	  </div>
	  <div class="horizontal_tabs">
	      <div id="upload-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" class="horizontal_tab upload">
			<div class="middleColumn">
				<div class="button_wrapper">
					<a class="uploadify_button upload">
SSVIEWER;
$val .=  $item->XML_val("ButtonText",null,true) ;
 $val .= <<<SSVIEWER
</a>
					<div class="object_wrapper">
						<input type="file" class="uploadify { 
SSVIEWER;
$val .=  $item->XML_val("Metadata",null,true) ;
 $val .= <<<SSVIEWER
 }" name="
SSVIEWER;
$val .=  $item->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
" id="
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" />
					</div>
				</div>
				
SSVIEWER;
 if($item->hasValue("CanSelectFolder")) {  ;
 $val .= <<<SSVIEWER

					<div class="folder_select_wrap" id="folder_select_wrap_
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
">
						<div class="folder_select" id="folder_select_
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
">
	<h5>
SSVIEWER;
$val .=  _t('Uploadify.CHOOSEUPLOADFOLDER','Choose an upload folder') ;
 $val .= <<<SSVIEWER
</h5>
	
SSVIEWER;
$val .=  $item->XML_val("FolderDropdown",null,true) ;
 $val .= <<<SSVIEWER

</div>

					</div>
				
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

					<input type="hidden" id="folder_hidden_
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" name="FolderID" value="
SSVIEWER;
$val .=  $item->obj("CurrentUploadFolder",null,true)->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
" />
				
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
			

				<div id="UploadifyFieldQueue_
SSVIEWER;
$val .=  $item->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
" class="uploadifyfield_queue"></div>
			</div>
	      </div>
	      <div id="import-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" class="horizontal_tab import">
			<div class="middleColumn">
				<div class="import_dropdown">
					<div class="import_message"></div>
					
SSVIEWER;
$val .=  $item->XML_val("ImportDropdown",null,true) ;
 $val .= <<<SSVIEWER

					<div class="import_list"></div>
					<button type="submit" class="{'url' : '
SSVIEWER;
$val .=  $item->XML_val("Link",array("import"),true) ;
 $val .= <<<SSVIEWER
'}">
SSVIEWER;
$val .=  _t('Uploadify.DOIMPORT','Import') ;
 $val .= <<<SSVIEWER
</button>					
				</div>
			</div>
	      </div>
	  </div>
	</div>
	<div class="attached_files_wrap">
		<div class="middleColumn">
			<div id="upload_preview_
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" class="preview">
				<div class="file_heading">
SSVIEWER;
$val .=  _t('Uploadify.ATTACHEDFILES','Attached files') ;
 $val .= <<<SSVIEWER
</div>
<div class="upload_previews">
	
SSVIEWER;
 if($item->hasValue("Files")) {  ;
 $val .= <<<SSVIEWER

	<ul class="
SSVIEWER;
 if($item->hasValue("Sortable")) {  ;
 $val .= <<<SSVIEWER
sortable {'url' : '
SSVIEWER;
$val .=  $item->XML_val("Link",array("dosort"),true) ;
 $val .= <<<SSVIEWER
'}
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
">
		
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Files")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

			<li id="file-
SSVIEWER;
$val .=  $item->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
" class="uploadifyFile clr">
				<div class="image"><img src="
SSVIEWER;
$val .=  $item->XML_val("Thumb",null,true) ;
 $val .= <<<SSVIEWER
" width="32" height="32" alt="
SSVIEWER;
$val .=  $item->XML_val("Thumb",null,true) ;
 $val .= <<<SSVIEWER
" /></div>
				<div class="filename">
SSVIEWER;
$val .=  $item->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
</div>
				<div class="delete">
					
SSVIEWER;
 if($item->obj("Top",null,true)->hasValue("Backend")) {  ;
 $val .= <<<SSVIEWER

						<a class="remove" title="
SSVIEWER;
$val .=  _t('Uploadify.REMOVE','Remove') ;
 $val .= <<<SSVIEWER
" rel="
SSVIEWER;
$val .=  $item->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  _t('Uploadify.REMOVEANDDELETE','Remove') ;
 $val .= <<<SSVIEWER
" href="
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Top")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("Link",array("removefile"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER
"><img src="uploadify/images/remove.png" height="16" width="16" alt="
SSVIEWER;
$val .=  _t('Uploadify.REMOVEANDDELETE','Remove') ;
 $val .= <<<SSVIEWER
" /></a>&nbsp;
						<a class="delete" title="
SSVIEWER;
$val .=  _t('Uploadify.REMOVEANDDELETE','Remove and delete') ;
 $val .= <<<SSVIEWER
" rel="
SSVIEWER;
$val .=  $item->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  _t('Uploadify.REMOVEANDDELETE','Remove and delete') ;
 $val .= <<<SSVIEWER
" href="
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Top")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("Link",array("deletefile"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER
"><img src="uploadify/images/delete.png" height="16" width="16" alt="
SSVIEWER;
$val .=  _t('Uploadify.REMOVEANDDELETE','Remove and delete') ;
 $val .= <<<SSVIEWER
" /></a>
					
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

						<a class="delete" title="
SSVIEWER;
$val .=  _t('Uploadify.REMOVE','Remove') ;
 $val .= <<<SSVIEWER
" rel="
SSVIEWER;
$val .=  $item->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  _t('Uploadify.REMOVEANDDELETE','Remove') ;
 $val .= <<<SSVIEWER
" href="
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Top")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("Link",array("removefile"),true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER
"><img src="uploadify/images/delete.png" height="16" width="16" alt="
SSVIEWER;
$val .=  _t('Uploadify.REMOVEANDDELETE','Remove') ;
 $val .= <<<SSVIEWER
" /></a>
					
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

				</div>
			</li>
		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

	</ul>
	
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

	<div class="no_files">
		
SSVIEWER;
 if($item->hasValue("Multi")) {  ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
$val .=  _t('Uploadify.NOFILES','No files attached') ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
$val .=  _t('Uploadify.NOFILE','No file attached') ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

	</div>
	
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

</div>

<div class="inputs">
	
SSVIEWER;
 if($item->hasValue("Files")) {  ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Files")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

			<input type="hidden" name="
SSVIEWER;
 if($item->obj("Top",null,true)->hasValue("Multi")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->obj("Top",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
[]
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->obj("Top",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
ID
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
" value="
SSVIEWER;
$val .=  $item->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
" />
		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

</div>
			</div>
		</div>
	</div>	
	
SSVIEWER;
 if($item->hasValue("DebugMode")) {  ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
$val .=  $item->XML_val("DebugOutput",null,true) ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

</div>
SSVIEWER;
