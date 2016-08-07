<?php 
/* SVN FILE: $Id$ */
/* ToolsController Test cases generated on: 2009-11-18 21:56:11 : 1258599371*/
App::import('Controller', 'Tools');

class TestTools extends ToolsController {
	var $autoRender = false;
}

class ToolsControllerTest extends CakeTestCase {
	var $Tools = null;

	function startTest() {
		$this->Tools = new TestTools();
		$this->Tools->constructClasses();
	}

	function testToolsControllerInstance() {
		$this->assertTrue(is_a($this->Tools, 'ToolsController'));
	}

	function endTest() {
		unset($this->Tools);
	}
}
?>