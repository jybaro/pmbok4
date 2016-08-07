<?php
class Process extends AppModel {

	var $name = 'Process';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'KnowledgeArea' => array(
			'className' => 'KnowledgeArea',
			'foreignKey' => 'knowledge_area_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ProcessGroup' => array(
			'className' => 'ProcessGroup',
			'foreignKey' => 'process_group_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasMany = array(
		'Output' => array(
			'className' => 'Output',
			'foreignKey' => 'process_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'Input' => array(
			'className' => 'Input',
			'foreignKey' => 'process_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);

	var $hasAndBelongsToMany = array(
		'Tool' => array(
			'className' => 'Tool',
			'joinTable' => 'processes_tools',
			'foreignKey' => 'process_id',
			'associationForeignKey' => 'tool_id',
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