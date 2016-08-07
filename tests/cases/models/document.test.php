<?php 
/* SVN FILE: $Id$ */
/* Document Test cases generated on: 2009-11-10 20:45:04 : 1257903904*/
App::import('Model', 'Document');

class DocumentTestCase extends CakeTestCase {
	var $Document = null;
	var $fixtures = array('app.document', 'app.input', 'app.output');

	function startTest() {
		$this->Document =& ClassRegistry::init('Document');
	}

	function testDocumentInstance() {
		$this->assertTrue(is_a($this->Document, 'Document'));
	}

	function testDocumentFind() {
		$this->Document->recursive = -1;
		$results = $this->Document->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Document' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'description'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'created'  => '2009-11-10 20:45:04',
			'modified'  => '2009-11-10 20:45:04'
		));
		$this->assertEqual($results, $expected);
	}
}
?>