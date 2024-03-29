<?php
/**
 * Displays a summary of instances of a form submitted to the website
 *
 * @package userforms
 */

class SubmittedFormReportField extends FormField {
	
	function Field() {
		Requirements::css(SAPPHIRE_DIR . "/css/SubmittedFormReportField.css");
		Requirements::javascript("userforms/javascript/UserForm.js");
		return $this->renderWith("SubmittedFormReportField");
	}
	
	/**
	 * Return the submissions from the site
	 *
	 * @return ComponentSet
	 */ 
	function Submissions() {
		$pageStart = isset($_REQUEST['start']) && is_numeric($_REQUEST['start']) ? $_REQUEST['start'] : 0;
		$pageLength = 10;

		$items = $this->form->getRecord()->getComponents('Submissions', null, "\"Created\" DESC", null, "$pageStart,$pageLength");
		$formId = $this->form->getRecord()->ID;

		foreach(DB::query("SELECT COUNT(*) AS \"CountRows\" FROM \"SubmittedForm\" WHERE \"ParentID\" = $formId") as $r) $totalCount = $r['CountRows'];
		
		$items->setPageLimits($pageStart, $pageLength, $totalCount);
		$items->NextStart = $pageStart + $pageLength;
		$items->PrevStart = $pageStart - $pageLength;
		$items->Start = $pageStart;
		$items->StartPlusOffset = $pageStart+$pageLength;
		$items->TotalCount = $totalCount;

		return $items;
	}
	
	function getSubmissions() {
		return $this->customise(array(
			'Submissions' => $this->Submissions()
		))->renderWith(array('SubmittedFormReportField'));
	}

	/**
	 * ID of this forms record
	 * 
	 * @return int
	 */
	function RecordID() {
		return $this->form->getRecord()->ID;
	}
	
	/**
	 * Export each of the form submissions for this UserDefinedForm
	 * instance into a CSV file.
	 * 
	 * In order to run this export function, the user must be
	 * able to edit the page, so we check canEdit()
	 *
	 * @return HTTPResponse / bool
	 */
	public function export($id = false) {
		if($id && is_int($id)) {
			$SQL_ID = $id;
		}
		else {
			if(isset($_REQUEST['id'])) {
				$SQL_ID = Convert::raw2sql($_REQUEST['id']);
			}
			else {
				user_error("No UserDefinedForm Defined.", E_USER_ERROR);
				
				return false;
			}
		}

		$now = Date("Y-m-d_h.i.s");
		$fileName = "export-$now.csv";
		$separator = ",";

		$udf = DataObject::get_by_id("UserDefinedForm", $SQL_ID);
		
		if($udf) {
			$submissions = $udf->Submissions("", "\"ID\"");

			// Collect unique columns for use in the CSV.
			// Do it separately as we need a fixed number of columns for the file.
			// Include all fields that have ever existed in this form.
			// Preserve the ordering: the most recent form setup should be dominant.
			$inClause = array();
			foreach($submissions as $submission) { 
				$inClause[] = $submission->ID; 
			}
			$csvHeaders = DB::query("SELECT \"Name\" , \"Title\" FROM \"SubmittedFormField\" 
									 LEFT JOIN \"SubmittedForm\" ON \"SubmittedForm\".\"ID\" = \"SubmittedFormField\".\"ParentID\"
									 WHERE \"SubmittedFormField\".\"ParentID\" IN (" . implode(',', $inClause) . ") 
									 ORDER BY \"SubmittedFormField\".\"ParentID\" DESC, \"SubmittedFormField\".\"ID\"
									");
			if ($csvHeaders) $csvHeaders = $csvHeaders->map();

			if($submissions && $submissions->exists()) {
				$data = array();

				// Create CSV rows out of submissions. Fields on those submissions will become columns.
				foreach($submissions as $submission) {
					$fields = $submission->Values();

					$row = array();
					foreach($fields as $field) {
						$row[$field->Name] = $field->Value;
					}

					$row['Submitted'] = $submission->Created;
					$data[] = $row;
				}
				
				// Create the CSV header line first:
				$csvData = '"' . implode('","', $csvHeaders) . '"' . ',"Submitted"'."\n";

				// Now put the collected data under relevant columns
				foreach($data as $row) {
					$csvRowItems = array();
					foreach ($csvHeaders as $columnName=>$columnTitle) {
						if (!isset($row[$columnName])) $csvRowItems[] = ""; // This submission did not have that column, insert blank
						else $csvRowItems[] = str_replace('"', '""', $row[$columnName]);
					}
					$csvRowItems[] = $row['Submitted'];

					// Encode the row by hand (fputcsv fails to encode newlines properly)
					if (count($csvRowItems)) $csvData .= "\"".implode($csvRowItems, "\",\"")."\"\n";
				}
			} else {
				user_error("No submissions to export.", E_USER_ERROR);
			}

			if(SapphireTest::is_running_test()) {
				return $csvData;
			}
			else {
				SS_HTTPRequest::send_file($csvData, $fileName, 'text/csv')->output();	
				exit;
			}
		} else {
			user_error("'$SQL_ID' is a valid type, but we can't find a UserDefinedForm in the database that matches the ID.", E_USER_ERROR);
		}
	}
	
	/**
	 * Delete all the submissions listed in the user defined form
	 *
	 * @return Redirect|Boolean
	 */
	public function deletesubmissions($id = false) {
		if($id && is_int($id)) {
			$SQL_ID = $id;
		}
		else {
			if(isset($_REQUEST['id'])) {
				$SQL_ID = Convert::raw2sql($_REQUEST['id']);
			}
		}
		
		if(isset($SQL_ID)) {
			$udf = DataObject::get_by_id("UserDefinedForm", $SQL_ID);
			$submissions = $udf->Submissions();
			
			if($submissions) {
				foreach($submissions as $submission) {
					$submission->delete();
				}
				return (Director::is_ajax() || SapphireTest::is_running_test()) ? true : Director::redirectBack();
			}
		}
		return (Director::is_ajax() || SapphireTest::is_running_test()) ? false : Director::redirectBack();
	}
	
	/**
	 * Delete a given submission from a user defined form
	 *
	 * @return Redirect|Boolean
	 */
	public function deletesubmission($id = false) {
		if($id && is_int($id)) {
			$SQL_ID = $id;
		}
		else {
			if(isset($_REQUEST['id'])) {
				$SQL_ID = Convert::raw2sql($_REQUEST['id']);
			}
		}
		
		if(isset($SQL_ID)) {
			$submission = DataObject::get_by_id("SubmittedForm", $SQL_ID);
			if($submission) {
				$submission->delete();
				
				return (Director::is_ajax() || SapphireTest::is_running_test()) ? true : Director::redirectBack();
			}
		}
		return (Director::is_ajax() || SapphireTest::is_running_test()) ? false : Director::redirectBack();
	}
}
