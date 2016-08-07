<?php 
/* SVN FILE: $Id$ */
/* Output Test cases generated on: 2009-11-10 20:45:48 : 1257903948*/
App::import('Model', 'Output');

class OutputTestCase extends CakeTestCase {
	var $Output = null;
	var $fixtures = array('app.output', 'app.document', 'app.process');

	function startTest() {
		$this->Output =& ClassRegistry::init('Output');
	}

	function testOutputInstance() {
		$this->assertTrue(is_a($this->Output, 'Output'));
	}

	function testOutputFind() {
		$this->Output->recursive = -1;
		$results = $this->Output->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Output' => array(
			'id'  => 1,
			'document_id'  => 1,
			'process_id'  => 1,
			'created'  => '2009-11-10 20:45:48',
			'modified'  => '2009-11-10 20:45:48'
		));
		$this->assertEqual($results, $expected);
	}
}
?>