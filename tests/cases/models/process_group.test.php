<?php 
/* SVN FILE: $Id$ */
/* ProcessGroup Test cases generated on: 2009-11-10 20:42:54 : 1257903774*/
App::import('Model', 'ProcessGroup');

class ProcessGroupTestCase extends CakeTestCase {
	var $ProcessGroup = null;
	var $fixtures = array('app.process_group', 'app.process');

	function startTest() {
		$this->ProcessGroup =& ClassRegistry::init('ProcessGroup');
	}

	function testProcessGroupInstance() {
		$this->assertTrue(is_a($this->ProcessGroup, 'ProcessGroup'));
	}

	function testProcessGroupFind() {
		$this->ProcessGroup->recursive = -1;
		$results = $this->ProcessGroup->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('ProcessGroup' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'order'  => 1,
			'created'  => '2009-11-10 20:42:54',
			'modified'  => '2009-11-10 20:42:54'
		));
		$this->assertEqual($results, $expected);
	}
}
?>