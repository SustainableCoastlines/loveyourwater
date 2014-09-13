<?php
$val .= <<<SSVIEWER
<div id="
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" class="RequestHandler FormField DataObjectManager RelationDataObjectManager 
SSVIEWER;
$val .=  $item->XML_val("RelationType",null,true) ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("NestedType",null,true) ;
 $val .= <<<SSVIEWER
 field" href="
SSVIEWER;
$val .=  $item->XML_val("CurrentLink",null,true) ;
 $val .= <<<SSVIEWER
">
	<div class="ajax-loader"></div>
	<div class="dataobjectmanager-actions 
SSVIEWER;
 if($item->hasValue("HasFilter")) {  ;
 $val .= <<<SSVIEWER
filter
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
">
		
SSVIEWER;
 if($item->hasValue("Can",array("add"))) {  ;
 $val .= <<<SSVIEWER

			<a class="popup-button" rel="
SSVIEWER;
$val .=  $item->XML_val("PopupWidth",null,true) ;
 $val .= <<<SSVIEWER
" href="
SSVIEWER;
$val .=  $item->XML_val("AddLink",null,true) ;
 $val .= <<<SSVIEWER
" alt="add">
				<span class="uploadlink"><img src="dataobject_manager/images/add.png" alt="" />
SSVIEWER;
$val .=  sprintf(_t('DataObjectManager.ADDITEM','Add %s',PR_MEDIUM,'Add [name]'),$item->XML_val("AddTitle",null,true)) ;
 $val .= <<<SSVIEWER
</span>
			</a>
		
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

			<h3>
SSVIEWER;
$val .=  $item->XML_val("PluralTitle",null,true) ;
 $val .= <<<SSVIEWER
</h3>
		
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

	</div>
	
SSVIEWER;
 if($item->hasValue("HasFilter")) {  ;
 $val .= <<<SSVIEWER

		<div class="dataobjectmanager-filter">
			
SSVIEWER;
$val .=  $item->XML_val("FilterDropdown",null,true) ;
 $val .= <<<SSVIEWER

		</div>
	
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

	<div style="clear:both;"></div>
	<div class="top-controls">
		<div class="rounded_table_top_right">
			<div class="rounded_table_top_left">
				<div class="Pagination">
					
SSVIEWER;
 if($item->hasValue("FirstLink")) {  ;
 $val .= <<<SSVIEWER
<a class="First" href="
SSVIEWER;
$val .=  $item->XML_val("FirstLink",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  _t('DataObjectManager.VIEWFIRST', 'View first') ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("PageSize",null,true) ;
 $val .= <<<SSVIEWER
"><img src="dataobject_manager/images/resultset_first.png" alt="" /></a>
					
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<span class="First"><img  src="dataobject_manager/images/resultset_first_disabled.png" alt="" /></span>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

					
SSVIEWER;
 if($item->hasValue("PrevLink")) {  ;
 $val .= <<<SSVIEWER
<a class="Prev" href="
SSVIEWER;
$val .=  $item->XML_val("PrevLink",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  _t('DataObjectManager.VIEWPREVIOUS', 'View previous') ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("PageSize",null,true) ;
 $val .= <<<SSVIEWER
"><img src="dataobject_manager/images/resultset_previous.png" alt="" /></a>
					
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<img class="Prev" src="dataobject_manager/images/resultset_previous_disabled.png" alt="" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

					<span class="Count">
						
SSVIEWER;
$val .=  _t('DataObjectManager.DISPLAYING', 'Displaying') ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("FirstItem",null,true) ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  _t('DataObjectManager.TO', 'to') ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("LastItem",null,true) ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  _t('DataObjectManager.OF', 'of') ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("TotalCount",null,true) ;
 $val .= <<<SSVIEWER

					</span>
					
SSVIEWER;
 if($item->hasValue("NextLink")) {  ;
 $val .= <<<SSVIEWER
<a class="Next" href="
SSVIEWER;
$val .=  $item->XML_val("NextLink",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  _t('DataObjectManager.VIEWNEXT', 'View next') ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("PageSize",null,true) ;
 $val .= <<<SSVIEWER
"><img src="dataobject_manager/images/resultset_next.png" alt="" /></a>
					
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<img class="Next" src="dataobject_manager/images/resultset_next_disabled.png" alt="" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

					
SSVIEWER;
 if($item->hasValue("LastLink")) {  ;
 $val .= <<<SSVIEWER
<a class="Last" href="
SSVIEWER;
$val .=  $item->XML_val("LastLink",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  _t('DataObjectManager.VIEWLAST', 'View last') ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("PageSize",null,true) ;
 $val .= <<<SSVIEWER
"><img src="dataobject_manager/images/resultset_last.png" alt="" /></a>
					
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
<span class="Last"><img src="dataobject_manager/images/resultset_last_disabled.png" alt="" /></span>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

				</div>
				<div class="dataobjectmanager-search">
					<span class="sbox_l"></span><span class="sbox"><input value="
SSVIEWER;
 if($item->hasValue("SearchValue")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("SearchValue",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  _t('DataObjectManager.SEARCH','Search') ;
 $val .= <<<SSVIEWER

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
" type="text" id="srch_fld"  /></span><span class="sbox_r" id="srch_clear"></span>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
	</div>
	<div class="list column
SSVIEWER;
$val .=  $item->obj("Headings",null,true)->XML_val("Count",null,true) ;
 $val .= <<<SSVIEWER
" class="list-holder" style="width:100%;">
		<div class="dataobject-list">		
		<ul 
SSVIEWER;
 if($item->hasValue("ShowAll")) {  ;
 $val .= <<<SSVIEWER
class="sortable-
SSVIEWER;
$val .=  $item->XML_val("SortableClass",null,true) ;
 $val .= <<<SSVIEWER
"
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
>
				<li class="head">
					<div class="fields-wrap">
					
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Headings")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

					<div class="col 
SSVIEWER;
$val .=  $item->XML_val("FirstLast",null,true) ;
 $val .= <<<SSVIEWER
" 
SSVIEWER;
$val .=  $item->XML_val("ColumnWidthCSS",null,true) ;
 $val .= <<<SSVIEWER
>
						<div class="pad">
								
SSVIEWER;
 if($item->hasValue("IsSortable")) {  ;
 $val .= <<<SSVIEWER

								<a href="
SSVIEWER;
$val .=  $item->XML_val("SortLink",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
 &nbsp;
								
SSVIEWER;
 if($item->hasValue("IsSorted")) {  ;
 $val .= <<<SSVIEWER

									
SSVIEWER;
 if($item->XML_val("SortDirection",null,true) == "ASC") {  ;
 $val .= <<<SSVIEWER

									<img src="cms/images/bullet_arrow_up.png" alt="" />
									
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

									<img src="cms/images/bullet_arrow_down.png" alt="" />
									
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

								
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

								</a>
								
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

								
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER

								
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

						</div>
					</div>
					
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

					</div>
					<div class="actions col">
SSVIEWER;
 if($item->hasValue("hasMarkingPermission")) {  ;
 $val .= <<<SSVIEWER
<a href="javascript:void(0)" rel="clear">
SSVIEWER;
$val .=  _t('DataObjectManager.DESELECTALL','deselect all') ;
 $val .= <<<SSVIEWER
</a>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
</div>
				</li>
			
SSVIEWER;
 if($item->hasValue("Items")) {  ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Items")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

				<li class="data" id="record-
SSVIEWER;
$val .=  $item->obj("Parent",null,true)->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
-
SSVIEWER;
$val .=  $item->XML_val("ID",null,true) ;
 $val .= <<<SSVIEWER
">
						<div class="fields-wrap">
						
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Fields")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

						<div class="col" 
SSVIEWER;
$val .=  $item->XML_val("ColumnWidthCSS",null,true) ;
 $val .= <<<SSVIEWER
><div class="pad">
SSVIEWER;
 if($item->hasValue("Value")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("Value",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER
&nbsp;
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
</div></div>
						
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

						</div>
						<div class="actions col">
								
SSVIEWER;
$val .=  $item->XML_val("MarkingCheckbox",null,true) ;
 $val .= <<<SSVIEWER

								
SSVIEWER;
 if($item->hasValue("Actions")) {  ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Actions")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

		<a class="
SSVIEWER;
$val .=  $item->XML_val("Behaviour",null,true) ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
$val .=  $item->XML_val("ActionClass",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
" href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" rel="
SSVIEWER;
$val .=  $item->XML_val("Rel",null,true) ;
 $val .= <<<SSVIEWER
"><img src="
SSVIEWER;
$val .=  $item->XML_val("IconURL",null,true) ;
 $val .= <<<SSVIEWER
" alt="
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
" height="12px" /></a>
	
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER


SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


						</div>
				</li>
			
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

					<li><i>
SSVIEWER;
$val .=  sprintf(_t('DataObjectManager.NOITEMSFOUND','No %s found'),$item->XML_val("PluralTitle",null,true)) ;
 $val .= <<<SSVIEWER
</i></li>
			
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

		</ul>
		</div>
	</div>
	<div class="bottom-controls">
		<div class="rounded_table_bottom_right">
			<div class="rounded_table_bottom_left">
			  <div class="checkboxes">
					
SSVIEWER;
 if($item->hasValue("Sortable")) {  ;
 $val .= <<<SSVIEWER

    				<div class="sort-control">
    						<input id="showall-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" type="checkbox" 
SSVIEWER;
 if($item->hasValue("ShowAll")) {  ;
 $val .= <<<SSVIEWER
checked="checked"
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 value="
SSVIEWER;
 if($item->hasValue("Paginated")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("ShowAllLink",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("PaginatedLink",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
" /><label for="showall-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  _t('DataObjectManager.DRAGDROP','Allow drag &amp; drop reordering') ;
 $val .= <<<SSVIEWER
</label>
    				</div>
					
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

			  
SSVIEWER;
 if($item->XML_val("RelationType",null,true) == "ManyMany") {  ;
 $val .= <<<SSVIEWER

  			  
SSVIEWER;
 if($item->hasValue("Can",array("only_related"))) {  ;
 $val .= <<<SSVIEWER

  			    <div class="only-related-control">
  					   <input id="only-related-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
" type="checkbox" 
SSVIEWER;
 if($item->hasValue("OnlyRelated")) {  ;
 $val .= <<<SSVIEWER
checked="checked"
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 value="
SSVIEWER;
 if($item->hasValue("OnlyRelated")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("AllRecordsLink",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("OnlyRelatedLink",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
" /><label for="only-related-
SSVIEWER;
$val .=  $item->XML_val("id",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  _t('DataObjectManager.ONLYRELATED','Show only related records') ;
 $val .= <<<SSVIEWER
</label>
            </div>
          
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

			  
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
				
				<div class="per-page-control">
					
SSVIEWER;
 if($item->hasValue("ShowAll")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("PerPageDropdown",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

				</div>
			</div>
		</div>
	</div>
	</div>
	
SSVIEWER;
$val .=  $item->XML_val("ExtraData",null,true) ;
 $val .= <<<SSVIEWER
	
</div>
SSVIEWER;
