<?php
/**
 * Created by PhpStorm.
 * User: davis
 * Date: 27/05/14
 * Time: 17:41
 */

class PresentorApprovalAdmin extends ModelAdmin {
	static $managed_models = array(
		'PresentorApproval' => array('title' => "Presentor Approval")
	);

	static $url_segment = 'presentor-approval';
	static $menu_title = "Presentor Approval";
} 