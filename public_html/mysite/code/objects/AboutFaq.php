<?php
class AboutFaq extends DataObject {
 
	static $db = array(
		'Question' => 'Text',
		'Answer' => 'HTMLText'
	);


    static $has_one = array(
		'AboutArticleHolderPage' => 'AboutArticleHolderPage',
		'AboutPage' => 'AboutPage'
	);


   	public function getCMSFields_forPopup() {
		return new FieldSet(
		new TextField( 'Question', 'Question'),
		new SimpleHTMLEditorField('Answer','Answer', array (
			  'css' => 'mysite/css/my_simple_stylesheet.css',
			  'insertUnorderedList' => true,
			  'copy' => true,
			  'justifyCenter' => false))
		);
	}

}

?>
