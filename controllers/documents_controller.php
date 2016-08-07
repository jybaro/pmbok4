<?php
class DocumentsController extends AppController {

   var $name = 'Documents';
   var $helpers = array('Html', 'Form');

   function index() {
      $this->set('documents', $this->Document->find('all', array('order' => 'name ASC')));
   }

   function view($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid Document.', true));
         $this->redirect(array('action'=>'index'));
      }
      $this->set('document', $this->Document->read(null, $id));
      $this->set('process_names', $this->Document->Input->Process->find('list'));
      
      $this->set('knowledgeAreas', $this->Document->Input->Process->KnowledgeArea->find('list', array('order' => 'orden ASC')));
      $this->set('processGroups', $this->Document->Input->Process->ProcessGroup->find('list', array('order' => 'orden ASC')));
      $this->set('processes', $this->Document->Input->Process->find('all', array('order' => 'Process.orden ASC')));
      
      $this->set('documents', $this->Document->find('all', array('order' => 'name ASC')));
      $this->set('tools', $this->Document->Input->Process->Tool->find('list', array('order' => 'name ASC')));
   }

   function add($origen = null, $process_id = null) {
      if (!empty($this->data)) {
         $this->Document->create();
         if ($this->Document->save($this->data)) {
            $this->Session->setFlash(__('The Document has been saved', true));
            if (!empty($origen) && !empty($process_id)) {
               $this->redirect(array('controller'=>$origen, 'action'=>'add', $process_id, $this->Document->getInsertID()));
            } else {
               $this->redirect(array('action'=>'index'));
            }
         } else {
            $this->Session->setFlash(__('The Document could not be saved. Please, try again.', true));
         }
      }
      $this->set('origen', $origen);
      $this->set('process_id', $process_id);
      $this->set('documents', $this->Document->find('list', array('order' => 'name ASC')));
   }

   function edit($id = null) {
      if (!$id && empty($this->data)) {
         $this->Session->setFlash(__('Invalid Document', true));
         $this->redirect(array('action'=>'index'));
      }
      if (!empty($this->data)) {
         if ($this->Document->save($this->data)) {
            $this->Session->setFlash(__('The Document has been saved', true));
            $this->redirect(array('action'=>'view', $id));
         } else {
            $this->Session->setFlash(__('The Document could not be saved. Please, try again.', true));
         }
      }
      if (empty($this->data)) {
         $this->data = $this->Document->read(null, $id);
         $this->set('documents', $this->Document->find('list', array('order' => 'name ASC')));
      }
   }

   function delete($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid id for Document', true));
         $this->redirect(array('action'=>'index'));
      }
      if ($this->Document->del($id)) {
         $this->Session->setFlash(__('Document deleted', true));
         $this->redirect(array('action'=>'index'));
      }
   }
   
   function relate() {
   
   }
}
?>