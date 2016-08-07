<?php 
/* SVN FILE: $Id$ */
/* KnowledgeArea Fixture generated on: 2009-11-10 20:43:32 : 1257903812*/

class KnowledgeAreaFixture extends CakeTestFixture {
	var $name = 'KnowledgeArea';
	var $table = 'knowledge_areas';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'name' => array('type'=>'string', 'null' => true, 'length' => 100),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'order' => array('type'=>'integer', 'null' => true),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id'))
	);
	var $records = array(array(
		'id'  => 1,
		'name'  => 'Lorem ipsum dolor sit amet',
		'created'  => '2009-11-10 20:43:32',
		'modified'  => '2009-11-10 20:43:32',
		'order'  => 1
	));
}
?>