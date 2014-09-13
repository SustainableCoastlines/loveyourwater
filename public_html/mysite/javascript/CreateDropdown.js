jQuery(document).ready(function() {
	
jQuery("#RegionID").addClass("rowElem");
jQuery("#CityID").addClass("rowElem");

jQuery("#RegionID .jqTransformSelectWrapper ul li a").click(function(){														   
		alert("region selected");
});
	
});