<?php

global $project;
$project = 'mysite';
// Get the DB connection details
require_once 'dbconn.php';
// Database config
global $databaseConfig;
// Set the database connection details
$databaseConfig = array(
	"type" 		=> 'MySQLDatabase',
	"server" 	=> $server,
	"username" 	=> $username,
	"password" 	=> $password,
	"database" 	=> $database,
	"path" 		=> '',
);
// Sites running on the following servers will be
// run in development mode. See
// http://doc.silverstripe.org/doku.php?id=configuration
// for a description of what dev mode does.
Director::set_dev_servers(array(
		'lyc.local',
		'127.0.0.1'//,
		//'192.168.1.253'
	));

Email::setAdminEmail('admin@loveyourcoast.org');

//Director::set_environment_type("dev");
//UploadifyField::show_debug();
//Security::setDefaultAdmin('lydia@toast.co.nz', 't627t');
Security::setDefaultAdmin('loveyourcoast', 'loveyour12345');

MySQLDatabase::set_connection_charset('utf8');

// Set the site locale
i18n::set_locale('en_NZ');

// enable nested URLs for this site (e.g. page/sub-page/)
SiteTree::enable_nested_urls();

//Add the CleanUpRole
//this extends the membership class and gives the 
//relationships between member and cleanup
DataObject::add_extension('Member', 'CleanUpRole');

//FB
//FacebookConnect::set_api_key('3c7656ec45da9e30dbac9fca551b9753');
//FacebookConnect::set_api_secret('bbde13e55878f786355b1eea84173dde');
//FacebookConnect::set_app_id('104014689670653');

// Sortable
//SortableDataObject::add_sortable_class('TopCleanUp');
SortableDataObject::add_sortable_class('AboutFaq');
SortableDataObject::add_sortable_class('Sponsor');
SortableDataObject::add_sortable_class('CleanUpSponsor');
SortableDataObject::add_sortable_class('GetInvolvedDownload');
SortableDataObject::add_sortable_class('LearnDownload');
SortableDataObject::add_sortable_class('LearnLink');
SortableDataObject::add_sortable_class('Staff');
SortableDataObject::add_sortable_class('Collaborator');
SortableDataObject::add_sortable_class('KeyContact');
SortableDataObject::add_sortable_class('MediaReleaseDownload');
SortableDataObject::add_sortable_class('MediaReleaseLink');
SortableDataObject::add_sortable_class('YoutubeLink');
SortableDataObject::add_sortable_class('ActionLink');
SortableDataObject::add_sortable_class('FormCategory');
SortableDataObject::add_sortable_class('FormItem');

// This line set's the current theme. More themes can be
// downloaded from http://www.silverstripe.org/themes/
SSViewer::set_theme('lyc');

// Add custom SiteConfig data
DataObject::add_extension('SiteConfig', 'CustomSiteConfig');
Object::add_extension('DataObjectSet', 'DataObjectSetExtension');
//Object::add_extension('Member','MemberProfileExtension');

// log errors and warnings
//SS_Log::add_writer(new SS_LogFileWriter('/log'), SS_Log::WARN, '<=');
// or just errors
//SS_Log::add_writer(new SS_LogFileWriter('/log'), SS_Log::ERR);

ini_set('memory_limit', '1000M');

define('TESTING_ENTRY_FORM', false);
define('TESTING_EMAIL', 'davis.dimalen@gmail.com');
define('EMAIL_ADMINS', 'davis.dimalen@gmail.com, davis.dimalen@gmail.com');
define('TOAST_ADMIN', 'davis.dimalen@gmail.com');

$zend_lib_path = realpath( '..' . DIRECTORY_SEPARATOR ) . DIRECTORY_SEPARATOR . '_lib/ZendFramework/library';
set_include_path( $zend_lib_path . PATH_SEPARATOR . get_include_path() );

EventFilterForm::disable_all_security_tokens();

?>