<?php
class Tool extends AppModel {

	var $name = 'Tool';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $hasAndBelongsToMany = array(
		'Process' => array(
			'className' => 'Process',
			'joinTable' => 'processes_tools',
			'foreignKey' => 'tool_id',
			'associationForeignKey' => 'process_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		)
	);

}
?>