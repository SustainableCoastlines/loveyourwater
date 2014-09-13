

jQuery(document).ready(function() {

	jQuery("#CreateForm_CreateForm_Title").addClass("validate[required,length[0,50]] text-input");
	jQuery("#CreateForm_CreateForm_Description").addClass("validate[required, text-input");
	
	//FromDate
	jQuery("#CreateForm_CreateForm_FromDate").addClass("validate[required,length[0,100]] text-input");
	jQuery("#CreateForm_CreateForm_FromDate").change(function(){ $.validationEngine.intercept = true; });
	//ToDate
	jQuery("#CreateForm_CreateForm_ToDate").addClass("validate[required,length[0,100]] text-input");
	jQuery("#CreateForm_CreateForm_ToDate").change(function(){ $.validationEngine.intercept = true; });
	//Location
	jQuery("#CreateForm_CreateForm_LocationAddress").addClass("validate[required,length[0,200]] text-input");
	jQuery("#CreateForm_CreateForm_Agree").addClass("validate[required]");
	jQuery("#CreateForm_CreateForm_Agree").change(function(){ $.validationEngine.intercept = true; });

	jQuery("#CreateForm_CreateForm").validationEngine()

});