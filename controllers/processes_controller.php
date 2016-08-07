<?php
class ProcessesController extends AppController {

   var $name = 'Processes';
   var $helpers = array('Html', 'Form');

   function index() {
      //$this->Process->recursive = 0;
      //$this->set('processes', $this->paginate());
      
      $this->set('knowledgeAreas', $this->Process->KnowledgeArea->find('list', array('order' => 'orden ASC')));
      $this->set('processGroups', $this->Process->ProcessGroup->find('list', array('order' => 'orden ASC')));
      $this->set('processes', $this->Process->find('all', array('order' => 'Process.orden ASC')));
      
      $this->set('documents', $this->Process->Input->Document->find('all', array('order' => 'name ASC')));
      $this->set('tools', $this->Process->Tool->find('list', array('order' => 'Tool.name ASC')));
   }

   function view($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid Process.', true));
         $this->redirect(array('action'=>'index'));
      }
      $this->set('process', $this->Process->read(null, $id));
      $this->set('document_names', $this->Process->Input->Document->find('list'));
      
      $this->set('knowledgeAreas', $this->Process->KnowledgeArea->find('list', array('order' => 'orden ASC')));
      $this->set('processGroups', $this->Process->ProcessGroup->find('list', array('order' => 'orden ASC')));
      $this->set('processes', $this->Process->find('all', array('order' => 'Process.orden ASC')));
      
      $this->set('documents', $this->Process->Input->Document->find('all', array('order' => 'name ASC')));
      $this->set('tools', $this->Process->Tool->find('list', array('order' => 'Tool.name ASC')));
   }

   function add() {
      if (!empty($this->data)) {
         $this->Process->create();
         if ($this->Process->save($this->data)) {
            $this->Session->setFlash(__('The Process has been saved', true));
            $this->redirect(array('action'=>'index'));
         } else {
            $this->Session->setFlash(__('The Process could not be saved. Please, try again.', true));
         }
      }
      $knowledgeAreas = $this->Process->KnowledgeArea->find('list');
      $processGroups = $this->Process->ProcessGroup->find('list');
      $this->set(compact('knowledgeAreas', 'processGroups'));
   }

   function edit($id = null) {
      if (!$id && empty($this->data)) {
         $this->Session->setFlash(__('Invalid Process', true));
         $this->redirect(array('action'=>'index'));
      }
      if (!empty($this->data)) {
         if ($this->Process->save($this->data)) {
            $this->Session->setFlash(__('The Process has been saved', true));
            $this->redirect(array('action'=>'view', $id));
         } else {
            $this->Session->setFlash(__('The Process could not be saved. Please, try again.', true));
         }
      }
      if (empty($this->data)) {
         $this->data = $this->Process->read(null, $id);
      }
      $knowledgeAreas = $this->Process->KnowledgeArea->find('list');
      $processGroups = $this->Process->ProcessGroup->find('list');
      $this->set(compact('knowledgeAreas','processGroups'));
   }

   function delete($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid id for Process', true));
         $this->redirect(array('action'=>'index'));
      }
      if ($this->Process->del($id)) {
         $this->Session->setFlash(__('Process deleted', true));
         $this->redirect(array('action'=>'index'));
      }
   }

}
?>