<?php 
/* SVN FILE: $Id$ */
/* Tool Fixture generated on: 2009-11-18 21:54:06 : 1258599246*/

class ToolFixture extends CakeTestFixture {
	var $name = 'Tool';
	var $table = 'tools';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'name' => array('type'=>'string', 'null' => true, 'length' => 1000),
		'description' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'nombre' => array('type'=>'string', 'null' => true, 'length' => 1000),
		'descripcion' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'notes' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id'))
	);
	var $records = array(array(
		'id'  => 1,
		'name'  => 'Lorem ipsum dolor sit amet',
		'description'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
		'nombre'  => 'Lorem ipsum dolor sit amet',
		'descripcion'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
		'notes'  => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida,phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam,vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit,feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
		'created'  => '2009-11-18 21:54:06',
		'modified'  => '2009-11-18 21:54:06'
	));
}
?>