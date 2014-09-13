

jQuery(document).ready(function() {

	jQuery("#EditDataEntryForm_EditDataEntryForm_Participants").addClass("validate[required,length[0,100]] text-input");
	jQuery("#EditDataEntryForm_EditDataEntryForm_Sacks").addClass("validate[required,length[0,100]] text-input");
	jQuery("#EditDataEntryForm_EditDataEntryForm_Distance").addClass("validate[required,length[0,100]] text-input");
	jQuery("#EditDataEntryForm_EditDataEntryForm_Time").addClass("validate[required,length[0,100]] text-input");
	
	jQuery("#EditDataEntryForm_EditDataEntryForm").validationEngine()

});