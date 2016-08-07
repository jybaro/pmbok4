<?php 
/* SVN FILE: $Id$ */
/* TermsController Test cases generated on: 2009-11-18 21:56:32 : 1258599392*/
App::import('Controller', 'Terms');

class TestTerms extends TermsController {
	var $autoRender = false;
}

class TermsControllerTest extends CakeTestCase {
	var $Terms = null;

	function startTest() {
		$this->Terms = new TestTerms();
		$this->Terms->constructClasses();
	}

	function testTermsControllerInstance() {
		$this->assertTrue(is_a($this->Terms, 'TermsController'));
	}

	function endTest() {
		unset($this->Terms);
	}
}
?>