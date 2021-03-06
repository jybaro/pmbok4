<?php 
/* SVN FILE: $Id$ */
/* Output Fixture generated on: 2009-11-10 20:45:48 : 1257903948*/

class OutputFixture extends CakeTestFixture {
	var $name = 'Output';
	var $table = 'outputs';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'document_id' => array('type'=>'integer', 'null' => true),
		'process_id' => array('type'=>'integer', 'null' => true),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id'), 'fki_outputs_documents' => array('unique' => false, 'column' => 'document_id'), 'fki_outputs_processes' => array('unique' => false, 'column' => 'process_id'))
	);
	var $records = array(array(
		'id'  => 1,
		'document_id'  => 1,
		'process_id'  => 1,
		'created'  => '2009-11-10 20:45:48',
		'modified'  => '2009-11-10 20:45:48'
	));
}
?>