<?php 
/* SVN FILE: $Id$ */
/* ProcessGroupsController Test cases generated on: 2009-11-10 20:46:49 : 1257904009*/
App::import('Controller', 'ProcessGroups');

class TestProcessGroups extends ProcessGroupsController {
	var $autoRender = false;
}

class ProcessGroupsControllerTest extends CakeTestCase {
	var $ProcessGroups = null;

	function startTest() {
		$this->ProcessGroups = new TestProcessGroups();
		$this->ProcessGroups->constructClasses();
	}

	function testProcessGroupsControllerInstance() {
		$this->assertTrue(is_a($this->ProcessGroups, 'ProcessGroupsController'));
	}

	function endTest() {
		unset($this->ProcessGroups);
	}
}
?>