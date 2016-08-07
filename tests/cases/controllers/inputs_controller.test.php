<?php 
/* SVN FILE: $Id$ */
/* InputsController Test cases generated on: 2009-11-10 20:47:59 : 1257904079*/
App::import('Controller', 'Inputs');

class TestInputs extends InputsController {
	var $autoRender = false;
}

class InputsControllerTest extends CakeTestCase {
	var $Inputs = null;

	function startTest() {
		$this->Inputs = new TestInputs();
		$this->Inputs->constructClasses();
	}

	function testInputsControllerInstance() {
		$this->assertTrue(is_a($this->Inputs, 'InputsController'));
	}

	function endTest() {
		unset($this->Inputs);
	}
}
?>