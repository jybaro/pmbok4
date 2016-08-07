<?php 
/* SVN FILE: $Id$ */
/* Process Fixture generated on: 2009-11-18 21:54:57 : 1258599297*/

class ProcessFixture extends CakeTestFixture {
	var $name = 'Process';
	var $table = 'processes';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'name' => array('type'=>'string', 'null' => true, 'length' => 100),
		'description' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'orden' => array('type'=>'integer', 'null' => true),
		'knowledge_area_id' => array('type'=>'integer', 'null' => true),
		'process_group_id' => array('type'=>'integer', 'null' => true),
		'nombre' => array('type'=>'string', 'null' => true, 'length' => 1000),
		'descripcion' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'notes' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id'), 'uk_processes_name' => array('unique' => true, 'column' => 'name'), 'fki_processes_knowledge_areas' => array('unique' => false, 'column' => 'knowledge_area_id'), 'fki_processes_process_groups' => array('unique' => false, 'column' => 'process_group_id'))
	);
	var $records = array(array(
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
}
?>