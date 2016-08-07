<?php 
/* SVN FILE: $Id$ */
/* Input Fixture generated on: 2009-11-10 20:45:32 : 1257903932*/

class InputFixture extends CakeTestFixture {
	var $name = 'Input';
	var $table = 'inputs';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'document_id' => array('type'=>'integer', 'null' => true),
		'process_id' => array('type'=>'integer', 'null' => true),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id'), 'fki_inputs_documents' => array('unique' => false, 'column' => 'document_id'), 'fki_inputs_processes' => array('unique' => false, 'column' => 'process_id'))
	);
	var $records = array(array(
		'id'  => 1,
		'document_id'  => 1,
		'process_id'  => 1,
		'created'  => '2009-11-10 20:45:32',
		'modified'  => '2009-11-10 20:45:32'
	));
}
?>