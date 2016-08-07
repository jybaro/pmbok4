<?php 
/* SVN FILE: $Id$ */
/* KnowledgeAreasController Test cases generated on: 2009-11-10 20:47:14 : 1257904034*/
App::import('Controller', 'KnowledgeAreas');

class TestKnowledgeAreas extends KnowledgeAreasController {
	var $autoRender = false;
}

class KnowledgeAreasControllerTest extends CakeTestCase {
	var $KnowledgeAreas = null;

	function startTest() {
		$this->KnowledgeAreas = new TestKnowledgeAreas();
		$this->KnowledgeAreas->constructClasses();
	}

	function testKnowledgeAreasControllerInstance() {
		$this->assertTrue(is_a($this->KnowledgeAreas, 'KnowledgeAreasController'));
	}

	function endTest() {
		unset($this->KnowledgeAreas);
	}
}
?>