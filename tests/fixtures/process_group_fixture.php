<?php 
/* SVN FILE: $Id$ */
/* ProcessGroup Fixture generated on: 2009-11-10 20:42:54 : 1257903774*/

class ProcessGroupFixture extends CakeTestFixture {
	var $name = 'ProcessGroup';
	var $table = 'process_groups';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'name' => array('type'=>'string', 'null' => true, 'length' => 100),
		'order' => array('type'=>'integer', 'null' => true),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id'))
	);
	var $records = array(array(
		'id'  => 1,
		'name'  => 'Lorem ipsum dolor sit amet',
		'order'  => 1,
		'created'  => '2009-11-10 20:42:54',
		'modified'  => '2009-11-10 20:42:54'
	));
}
?>