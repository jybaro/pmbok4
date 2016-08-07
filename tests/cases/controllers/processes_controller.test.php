<?php 
/* SVN FILE: $Id$ */
/* ProcessesController Test cases generated on: 2009-11-10 20:47:34 : 1257904054*/
App::import('Controller', 'Processes');

class TestProcesses extends ProcessesController {
	var $autoRender = false;
}

class ProcessesControllerTest extends CakeTestCase {
	var $Processes = null;

	function startTest() {
		$this->Processes = new TestProcesses();
		$this->Processes->constructClasses();
	}

	function testProcessesControllerInstance() {
		$this->assertTrue(is_a($this->Processes, 'ProcessesController'));
	}

	function endTest() {
		unset($this->Processes);
	}
}
?>