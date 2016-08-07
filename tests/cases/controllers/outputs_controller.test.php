<?php 
/* SVN FILE: $Id$ */
/* OutputsController Test cases generated on: 2009-11-10 20:48:11 : 1257904091*/
App::import('Controller', 'Outputs');

class TestOutputs extends OutputsController {
	var $autoRender = false;
}

class OutputsControllerTest extends CakeTestCase {
	var $Outputs = null;

	function startTest() {
		$this->Outputs = new TestOutputs();
		$this->Outputs->constructClasses();
	}

	function testOutputsControllerInstance() {
		$this->assertTrue(is_a($this->Outputs, 'OutputsController'));
	}

	function endTest() {
		unset($this->Outputs);
	}
}
?>