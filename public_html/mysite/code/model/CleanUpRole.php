<?php
/**
 * CleanUpRole provides customisations to the {@link Member}
 * class specifically for this site.
 * 
 */
 
class CleanUpRole extends DataObjectDecorator {

	function extraStatics(){
		return array(
			'db' => array(
				'ReceiveMail' => 'Boolean',
				'Phone' => 'Text',
				'PostalAddress' => 'Text',
				'PresentorRequestConfirmation' => "Enum('Pending, Granted, Denied')",
				'RequestListedAsPresenter' => 'Boolean',
				'LocationAddress' => 'Text',
				'Description' => 'HTMLText'
			),
			'has_one' => array(
				'ProfileImage' => 'Image'
			),
			'belongs_many_many' => array(
				'CleanUpGroups' => 'CleanUpGroup',
			)
		);
	}
	
	/**
	 * Return the member fields to be shown on {@link EditMembershipForm}
	 * @return FieldSet
	 */
	function getCleanUpRoleFields() {
		$fields = new FieldSet(
			new TextField('FirstName', 'First name'),
			new TextField('Surname', 'Last name'),
			new TextField('Phone', 'Phone'),
			new EmailField('Email', 'Email'),
            new TextField('PostalAddress', 'Postal adddress'),
			new TextField('MemberType', 'Your Membership Type')
		);
		$this->owner->extend('augmentCleanUpRoleFields', $fields);
		
		return $fields;
	}
	
	function getCleanUpMemberRoleFields() {
		$fields = new FieldSet(
			new TextField('FirstName', 'First name'),
			new TextField('Surname', 'Last name'),
			new TextField('Phone', 'Phone'),
			new SimpleImageField('ProfileImage', 'Upload avatar'),
			new EmailField('Email', 'Email')
		);
		$this->owner->extend('augmentCleanUpMemberRoleFields', $fields);
		
		return $fields;
	}

	/**
	 * Return which member fields should be required on {@link EditMembershipForm}
	 * and {@link AccountForm}.
	 * 
	 * @return array
	 */
	function getCleanUpRoleRequiredFields(){
		$fields = array(
			'FirstName',
			'Surname',
			'Phone',
			'Email',
			'Address'
			
		);
		$this->owner->extend('augmentManagementRequiredFields', $fields);
	
		return $fields;
	}
	
	/**
	 * Create a new member with given data for a new member,
	 * or merge the data into the logged in member.
	 * 
	 * IMPORTANT: Before creating a new Member record, we first
	 * check that the request email address doesn't already exist.
	 * 
	 * @param array $data Form request data to update the member with
	 * @return boolean|object Member object or boolean FALSE
	 */
	public static function createOrMerge($data) {
		// Because we are using a ConfirmedPasswordField, the password will
		// be an array of two fields
		if(isset($data['Password']) && is_array($data['Password'])) {
			$data['Password'] = $data['Password']['_Password'];
		}
		
		// We need to ensure that the unique field is never overwritten
		$uniqueField = Member::get_unique_identifier_field();
		if(isset($data[$uniqueField])) {
			$SQL_unique = Convert::raw2xml($data[$uniqueField]);
			$existingUniqueMember = DataObject::get_one('Member', "$uniqueField = '{$SQL_unique}'");
			if($existingUniqueMember && $existingUniqueMember->exists()) {
				if(Member::currentUserID() != $existingUniqueMember->ID) {
					return false;
				}
			}
		}
		
		if(!$member = Member::currentUser()) {
			$member = new Member();
		}
		
		$member->update($data);
		
		return $member;
	}
	
	public function joinedgroups(){
	  $cleanups = $this->getManyManyComponents("CleanUpGroups");
		if($cleanups){
			return true;
		}
	  return false;
	}
	
	
	public function hasCleanUps(){
		$creatorid = $this->ID;
		$cleanups = $this->getManyManyComponents("CleanUpGroups");
		if($groupscreated = DataObject::get('CleanUpGroup', "CreatorID = '$creatorid'")){
			return true;
		}else if($cleanups){
			return true;
		}
		return false;
	}
	
	
	public function myCleanUpGroups($memberID){
	  $memid = $memberID;
	  $member = DataObject::get_one('Member', "Member.ID = '$memid'");
	  $cleanups = $member->getManyManyComponents("CleanUpGroups");
	  
	  	if($groupscreated = DataObject::get('CleanUpGroup', "CreatorID = '$memid'") && $cleanups){
			$memid = $memberID;
			$mygroups = DataObject::get('CleanUpGroup', "CreatorID = '$memid'");
			$mygroups->merge($cleanups);
			return $mygroups;
		}else if($groupscreated = DataObject::get('CleanUpGroup', "CreatorID = '$memid'")){
			$memid = $memberID;
			$mygroups = DataObject::get('CleanUpGroup', "CreatorID = '$memid'");
			return $mygroups;
		}else if($cleanups){
			return $cleanups;
		}
	
	  return false;
	}
	

}
?>