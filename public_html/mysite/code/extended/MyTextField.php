<?php
/**
 * Created by PhpStorm.
 * User: davis
 * Date: 27/05/14
 * Time: 05:50
 */


class MyTextField extends TextField{

	protected $placeholder = "";

	function setPlaceholder($text) {
		$this->placeholder = $text;
	}

	function getPlaceholder($text) {
		return $this->placeholder;
	}

	function Field() {
		$attributes = array(
			'type' => 'text',
			'class' => 'text' . ($this->extraClass() ? $this->extraClass() : ''),
			'id' => $this->id(),
			'name' => $this->Name(),
			'value' => $this->Value(),
			'tabindex' => $this->getTabIndex(),
			'maxlength' => ($this->maxLength) ? $this->maxLength : null,
			'size' => ($this->maxLength) ? min( $this->maxLength, 30 ) : null,
			'placeholder' => $this->placeholder
		);

		if($this->disabled) $attributes['disabled'] = 'disabled';

		return $this->createTag('input', $attributes);
	}
} 