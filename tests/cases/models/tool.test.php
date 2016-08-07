<?php 
/* SVN FILE: $Id$ */
/* Tool Test cases generated on: 2009-11-18 21:54:06 : 1258599246*/
App::import('Model', 'Tool');

class ToolTestCase extends CakeTestCase {
	var $Tool = null;
	var $fixtures = array('app.tool');

	function startTest() {
		$this->Tool =& ClassRegistry::init('Tool');
	}

	function testToolInstance() {
		$this->assertTrue(is_a($this->Tool, 'Tool'));
	}

	function testToolFind() {
		$this->Tool->recursive = -1;
		$results = $this->Tool->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Tool' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'description'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'nombre'  => 'Lorem ipsum dolor sit amet',
			'descripcion'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'notes'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'created'  => '2009-11-18 21:54:06',
			'modified'  => '2009-11-18 21:54:06'
		));
		$this->assertEqual($results, $expected);
	}
}
?>