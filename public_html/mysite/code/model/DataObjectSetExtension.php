<?php
class DataObjectSetExtension extends Extension {
	public function Pagination() {
		$pageLimits = $this->owner->getPageLimits();
		$items = $this->owner->toArray();
		$items = array_slice($items, $pageLimits["pageStart"], $pageLimits["pageLength"]);
		return new DataObjectSet($items);		
	}	
}
?>