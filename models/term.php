<?php
class Term extends AppModel {

	var $name = 'Term';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'synonymChild' => array(
			'className' => 'Term',
			'foreignKey' => 'synonym',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'relatedChild' => array(
			'className' => 'Term',
			'foreignKey' => 'related',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasMany = array(
		'synonymParent' => array(
			'className' => 'Term',
			'foreignKey' => 'synonym',
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
		'relatedParent' => array(
			'className' => 'Term',
			'foreignKey' => 'related',
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

}
?>