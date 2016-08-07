<?php 
/* SVN FILE: $Id$ */
/* Term Test cases generated on: 2009-11-18 21:53:37 : 1258599217*/
App::import('Model', 'Term');

class TermTestCase extends CakeTestCase {
	var $Term = null;
	var $fixtures = array('app.term', 'app.term', 'app.term', 'app.term', 'app.term');

	function startTest() {
		$this->Term =& ClassRegistry::init('Term');
	}

	function testTermInstance() {
		$this->assertTrue(is_a($this->Term, 'Term'));
	}

	function testTermFind() {
		$this->Term->recursive = -1;
		$results = $this->Term->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Term' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'description'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'nombre'  => 'Lorem ipsum dolor sit amet',
			'descripcion'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'acronym'  => 'Lorem ipsum dolor sit amet',
			'acronimo'  => 'Lorem ipsum dolor sit amet',
			'related'  => 1,
			'synonym'  => 1,
			'created'  => '2009-11-18 21:53:37',
			'modified'  => '2009-11-18 21:53:37',
			'notes'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.'
		));
		$this->assertEqual($results, $expected);
	}
}
?>