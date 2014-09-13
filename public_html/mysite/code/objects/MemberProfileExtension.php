<?php
/**
 * Created by PhpStorm.
 * User: davis
 * Date: 17/05/14
 * Time: 14:17
 */

class MemberProfileExtension extends DataObjectDecorator {
	function extraStatics(){
		return array(
			'has_one' => array(
				'ProfileImage' => 'Image'
			)
		);
	}
} 