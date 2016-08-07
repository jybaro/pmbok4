<?php 
/* SVN FILE: $Id$ */
/* Process Test cases generated on: 2009-11-18 21:55:07 : 1258599307*/
App::import('Model', 'Process');

class ProcessTestCase extends CakeTestCase {
	var $Process = null;
	var $fixtures = array('app.process', 'app.knowledge_area', 'app.process_group', 'app.output', 'app.input');

	function startTest() {
		$this->Process =& ClassRegistry::init('Process');
	}

	function testProcessInstance() {
		$this->assertTrue(is_a($this->Process, 'Process'));
	}

	function testProcessFind() {
		$this->Process->recursive = -1;
		$results = $this->Process->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Process' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'description'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'created'  => '2009-11-18 21:54:57',
			'modified'  => '2009-11-18 21:54:57',
			'orden'  => 1,
			'knowledge_area_id'  => 1,
			'process_group_id'  => 1,
			'nombre'  => 'Lorem ipsum dolor sit amet',
			'descripcion'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'notes'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.'
		));
		$this->assertEqual($results, $expected);
	}
}
?>