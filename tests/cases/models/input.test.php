<?php 
/* SVN FILE: $Id$ */
/* Input Test cases generated on: 2009-11-10 20:45:32 : 1257903932*/
App::import('Model', 'Input');

class InputTestCase extends CakeTestCase {
	var $Input = null;
	var $fixtures = array('app.input', 'app.document', 'app.process');

	function startTest() {
		$this->Input =& ClassRegistry::init('Input');
	}

	function testInputInstance() {
		$this->assertTrue(is_a($this->Input, 'Input'));
	}

	function testInputFind() {
		$this->Input->recursive = -1;
		$results = $this->Input->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Input' => array(
			'id'  => 1,
			'document_id'  => 1,
			'process_id'  => 1,
			'created'  => '2009-11-10 20:45:32',
			'modified'  => '2009-11-10 20:45:32'
		));
		$this->assertEqual($results, $expected);
	}
}
?>