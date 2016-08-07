<?php
class ProcessGroupsController extends AppController {

   var $name = 'ProcessGroups';
   var $helpers = array('Html', 'Form');

   function index() {
      $this->ProcessGroup->recursive = 0;
      $this->set('processGroups', $this->paginate());
   }

   function view($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid ProcessGroup.', true));
         $this->redirect(array('action'=>'index'));
      }
      $this->set('processGroup', $this->ProcessGroup->read(null, $id));
      $this->set('knowledgeArea', $this->ProcessGroup->Process->KnowledgeArea->find('list'));
   }

   function add() {
      if (!empty($this->data)) {
         $this->ProcessGroup->create();
         if ($this->ProcessGroup->save($this->data)) {
            $this->Session->setFlash(__('The ProcessGroup has been saved', true));
            $this->redirect(array('action'=>'index'));
         } else {
            $this->Session->setFlash(__('The ProcessGroup could not be saved. Please, try again.', true));
         }
      }
   }

   function edit($id = null) {
      if (!$id && empty($this->data)) {
         $this->Session->setFlash(__('Invalid ProcessGroup', true));
         $this->redirect(array('action'=>'index'));
      }
      if (!empty($this->data)) {
         if ($this->ProcessGroup->save($this->data)) {
            $this->Session->setFlash(__('The ProcessGroup has been saved', true));
            $this->redirect(array('action'=>'index'));
         } else {
            $this->Session->setFlash(__('The ProcessGroup could not be saved. Please, try again.', true));
         }
      }
      if (empty($this->data)) {
         $this->data = $this->ProcessGroup->read(null, $id);
      }
   }

   function delete($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid id for ProcessGroup', true));
         $this->redirect(array('action'=>'index'));
      }
      if ($this->ProcessGroup->del($id)) {
         $this->Session->setFlash(__('ProcessGroup deleted', true));
         $this->redirect(array('action'=>'index'));
      }
   }

}
?>