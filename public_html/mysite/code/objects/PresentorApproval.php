<?php
/**
 * Created by PhpStorm.
 * User: davis
 * Date: 27/05/14
 * Time: 17:33
 */

class PresentorApproval extends DataObject{

	public static $db = array(
		'MemberID' => 'Int',
		'MemberName' => 'Text',
		'Message' => 'Text',
		'Email' => 'Text',
		'Confirmation' => "Enum('Pending, Granted, Denied')",
		'IsDone' => 'Boolean'
	);

	static $searchable_fields = array(
		'Email' => array(
			'Email' => 'Email'
		),
		'Message' => array(
			'Message' => 'Message'
		),
		'Confirmation' => array(
			'Confirmation' => 'Confirmation'
		)
	);

	static $summary_fields = array(
		'MemberName' => 'MemberName',
		'Confirmation' => 'Confirmation',
		'IsDone' => 'IsDone'
	);

	public function onBeforeWrite() {
		if($this->Confirmation != 'Pending'){
			$member = DataObject::get_one('Member', "ID=".$this->MemberID);

			if($member){
				$member->PresentorRequestConfirmation = $this->Confirmation;
				$member->write();

				if($this->Confirmation == 'Granted'){
					// Ok Email
				} else {
					// Not Ok
				}
				$this->IsDone = true;
			}
		}

		parent::onBeforeWrite();
	}

}