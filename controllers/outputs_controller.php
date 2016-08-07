<?php
class OutputsController extends AppController {

   var $name = 'Outputs';
   var $helpers = array('Html', 'Form');

   function index() {
      $this->Output->recursive = 0;
      $this->set('outputs', $this->paginate());
   }

   function view($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid Output.', true));
         $this->redirect(array('action'=>'index'));
      }
      $this->set('output', $this->Output->read(null, $id));
   }

   function add($process_id = null, $document_id = null) {
      if (!empty($this->data)) {
         $this->Output->create();
         if ($this->Output->save($this->data)) {
            $this->Session->setFlash(__('The Output has been saved', true));
            $this->redirect(array('controller'=>'processes', 'action'=>'view', $this->data['Output']['process_id']));
         } else {
            $this->Session->setFlash(__('The Output could not be saved. Please, try again.', true));
         }
      }
      $documents = $this->Output->Document->find('list', array('order' => 'name'));
      $processes = $this->Output->Process->find('list');
      $this->set(compact('documents', 'processes'));
      $this->set('process_id', $process_id);
      $this->set('document_id', $document_id);
   }

   function edit($id = null) {
      if (!$id && empty($this->data)) {
         $this->Session->setFlash(__('Invalid Output', true));
         $this->redirect(array('action'=>'index'));
      }
      if (!empty($this->data)) {
         if ($this->Output->save($this->data)) {
            $this->Session->setFlash(__('The Output has been saved', true));
            $this->redirect(array('controller' => 'processes', 'action'=>'view', $this->data['Output']['process_id']));
         } else {
            $this->Session->setFlash(__('The Output could not be saved. Please, try again.', true));
         }
      }
      if (empty($this->data)) {
         $this->data = $this->Output->read(null, $id);
      }
      $documents = $this->Output->Document->find('list');
      $processes = $this->Output->Process->find('list');
      $this->set(compact('documents','processes'));
   }

   function delete($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid id for Output', true));
         $this->redirect(array('action'=>'index'));
      }
      if ($this->Output->del($id)) {
         $this->Session->setFlash(__('Output deleted', true));
         $this->redirect(array('action'=>'index'));
      }
   }

}
?>