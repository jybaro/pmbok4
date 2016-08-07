<?php
class ProcessGroup extends AppModel {

   var $name = 'ProcessGroup';
   var $validate = array(
      'name' => array('notempty'),
      'orden' => array('numeric')
   );

   //The Associations below have been created with all possible keys, those that are not needed can be removed
   var $hasMany = array(
      'Process' => array(
         'className' => 'Process',
         'foreignKey' => 'process_group_id',
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