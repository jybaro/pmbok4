<?php 
/* SVN FILE: $Id$ */
/* Term Fixture generated on: 2009-11-18 21:53:37 : 1258599217*/

class TermFixture extends CakeTestFixture {
	var $name = 'Term';
	var $table = 'terms';
	var $fields = array(
		'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 11, 'key' => 'primary'),
		'name' => array('type'=>'string', 'null' => true, 'length' => 1073741824),
		'description' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'nombre' => array('type'=>'string', 'null' => true, 'length' => 1000),
		'descripcion' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'acronym' => array('type'=>'string', 'null' => true, 'length' => 100),
		'acronimo' => array('type'=>'string', 'null' => true, 'length' => 100),
		'related' => array('type'=>'integer', 'null' => true),
		'synonym' => array('type'=>'integer', 'null' => true),
		'created' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'modified' => array('type'=>'datetime', 'null' => true, 'default' => 'now()'),
		'notes' => array('type'=>'text', 'null' => true, 'length' => 1073741824),
		'indexes' => array('PRIMARY' => array('unique' => true, 'column' => 'id'), 'uk_terms_name' => array('unique' => true, 'column' => 'name'), 'fki_terms_related' => array('unique' => false, 'column' => 'related'), 'fki_terms_synonym' => array('unique' => false, 'column' => 'synonym'))
	);
	var $records = array(array(
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
}
?>