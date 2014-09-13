// Select the cascade menus
function cascadeSelect(parent, child) {
	var childOptions = child.find('option:not(.static)');
	child.data('options',childOptions);
	

    parent.change(function() {
        
         
        
        childOptions.remove();
        child
            .append(child.data('options').filter('.sub_' + this.value))
            .change();
//        alert(this.value);
//        if (this.value == '') {
//            alert(child.data[0].name);
//            child.disabled = true; 
//        }
	})
	childOptions.not('.static, .sub_' + parent.val()).remove();
}

jQuery(function() {
	// Target the form
	var cascadeForm = jQuery('form');
	// Find the selection fields
	var levelSelect_01 = cascadeForm.find('.levelOne');
	var levelSelect_02 = cascadeForm.find('.levelTwo');
	// Run the selection function
	cascadeSelect(levelSelect_01, levelSelect_02);
});