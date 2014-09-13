<?php
/**
 * The verificationMember class which represents the temp users of the system
 * When a temp user enters the verification code send to his email, this record should be deleted
 * and inserted as a member
 */
class TempMember extends DataObject {

	static $db = array(
		'FirstName' => 'Varchar',
		'Surname' => 'Varchar',
		'Phone' => 'Text',
		'Email' => 'Varchar',
		'Password' => 'Varchar(160)',
		'PresentorRequestConfirmation' => "Enum('Pending, Granted, Denied')",
		'RequestListedAsPresenter' => 'Boolean',
		'LocationAddress' => 'Text',
		'LocationLatitude' => 'Text',
		'LocationLongitude' => 'Text',
		'Description' => 'HTMLText',
		'ReceiveMail' => 'Boolean',
		'DateSubscribed' => 'Date',
		'VerificationCode' => 'Varchar(30)'
	);
	
	/**
	 * Event handler called before writing to the database.
	 */
	function onBeforeWrite() {
		//there's no need to check if another record of this already exists
		//any number of temp users can be filled, 
		//a verification code must be created
		do {
			$hash = substr(base_convert(md5(uniqid(mt_rand(), true)), 16, 36),
										 0, 30);
		} while(DataObject::get_one('TempMember', "\"VerificationCode\" = '$hash'"));
		$this->VerificationCode = $hash;

		// save date of subscription
		if(!$this->DateSubscribed)
			$this->DateSubscribed = date('Y-m-d');

		parent::onBeforeWrite();
	}
	
	static function Emailexists($data) {
		$SQL_unique = Convert::raw2xml($data['Email']);
		$existingTempUniqueMember = DataObject::get_one('TempMember', "Email = '{$SQL_unique}'");
		if( !$existingTempUniqueMember )
			return false;
		return true;
	}
	
	static function codeExists($data) {
		$SQL_unique = Convert::raw2xml($data['VerificationCode']);
		$existingTempUniqueMember = DataObject::get_one("TempMember", "\"TempMember\".\"VerificationCode\" = '$SQL_unique'");
		if( !$existingTempUniqueMember )
			return false;
		return $existingTempUniqueMember;
	}
}
