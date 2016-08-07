<?php 
/* SVN FILE: $Id$ */
/* KnowledgeArea Test cases generated on: 2009-11-10 20:43:32 : 1257903812*/
App::import('Model', 'KnowledgeArea');

class KnowledgeAreaTestCase extends CakeTestCase {
	var $KnowledgeArea = null;
	var $fixtures = array('app.knowledge_area', 'app.process');

	function startTest() {
		$this->KnowledgeArea =& ClassRegistry::init('KnowledgeArea');
	}

	function testKnowledgeAreaInstance() {
		$this->assertTrue(is_a($this->KnowledgeArea, 'KnowledgeArea'));
	}

	function testKnowledgeAreaFind() {
		$this->KnowledgeArea->recursive = -1;
		$results = $this->KnowledgeArea->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('KnowledgeArea' => array(
			'id'  => 1,
			'name'  => 'Lorem ipsum dolor sit amet',
			'created'  => '2009-11-10 20:43:32',
			'modified'  => '2009-11-10 20:43:32',
			'order'  => 1
		));
		$this->assertEqual($results, $expected);
	}
}
?>