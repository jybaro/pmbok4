<?php
class InputsController extends AppController {

   var $name = 'Inputs';
   var $helpers = array('Html', 'Form');

   function index() {
      $this->Input->recursive = 0;
      $this->set('inputs', $this->paginate());
   }

   function view($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid Input.', true));
         $this->redirect(array('action'=>'index'));
      }
      $this->set('input', $this->Input->read(null, $id));
   }

   function add($process_id = null, $document_id = null) {
      if (!empty($this->data)) {
         $this->Input->create();
         if ($this->Input->save($this->data)) {
            $this->Session->setFlash(__('The Input has been saved', true));
            $this->redirect(array('controller'=>'processes', 'action'=>'view', $this->data['Input']['process_id']));
         } else {
            $this->Session->setFlash(__('The Input could not be saved. Please, try again.', true));
         }
      }
      $documents = $this->Input->Document->find('list', array('order' => 'name'));
      $processes = $this->Input->Process->find('list');
      $this->set(compact('documents', 'processes'));
      $this->set('process_id', $process_id);
      $this->set('document_id', $document_id);
   }

   function edit($id = null) {
      if (!$id && empty($this->data)) {
         $this->Session->setFlash(__('Invalid Input', true));
         $this->redirect(array('action'=>'index'));
      }
      if (!empty($this->data)) {
         if ($this->Input->save($this->data)) {
            $this->Session->setFlash(__('The Input has been saved', true));
            $this->redirect(array('controller' => 'processes', 'action'=>'view', $this->data['Input']['process_id']));
         } else {
            $this->Session->setFlash(__('The Input could not be saved. Please, try again.', true));
         }
      }
      if (empty($this->data)) {
         $this->data = $this->Input->read(null, $id);
      }
      $documents = $this->Input->Document->find('list');
      $processes = $this->Input->Process->find('list');
      $this->set(compact('documents','processes'));
   }

   function delete($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid id for Input', true));
         $this->redirect(array('action'=>'index'));
      }
      if ($this->Input->del($id)) {
         $this->Session->setFlash(__('Input deleted', true));
         $this->redirect(array('action'=>'index'));
      }
   }

}
?>