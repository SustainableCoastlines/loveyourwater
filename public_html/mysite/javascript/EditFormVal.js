jQuery(document).ready(function() {

	jQuery("#EditForm_EditForm_Title").addClass("validate[required,length[0,50]] text-input");
	jQuery("#EditForm_EditForm_Description").addClass("validate[required]] text-input");
	
	//FromDate
	jQuery("#EditForm_EditForm_FromDate").addClass("validate[required,length[0,100]] text-input");
	jQuery("#EditForm_EditForm_FromDate").change(function(){ $.validationEngine.intercept = true; });
	//ToDate
	jQuery("#EditForm_EditForm_ToDate").addClass("validate[required,length[0,100]] text-input");
	jQuery("#EditForm_EditForm_ToDate").change(function(){ $.validationEngine.intercept = true; });
	//Location
	jQuery("#EditForm_EditForm_LocationAddress").addClass("validate[required,length[0,200]] text-input");
	jQuery("#EditForm_EditForm_Agree").addClass("validate[required]");
	jQuery("#EditForm_EditForm_Agree").change(function(){ $.validationEngine.intercept = true; });

	jQuery("#EditForm_EditForm").validationEngine()
	

});