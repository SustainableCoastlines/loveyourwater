

jQuery(document).ready(function() {

	jQuery("#DataEntryForm_DataEntryForm_Participants").addClass("validate[required,length[0,100]] text-input");
	jQuery("#DataEntryForm_DataEntryForm_Sacks").addClass("validate[required,length[0,100]] text-input");
	jQuery("#DataEntryForm_DataEntryForm_Distance").addClass("validate[required,length[0,100]] text-input");
	jQuery("#DataEntryForm_DataEntryForm_Time").addClass("validate[required,length[0,100]] text-input");
	
	jQuery("#DataEntryForm_DataEntryForm").validationEngine()

});