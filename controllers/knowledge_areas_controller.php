<?php
class KnowledgeAreasController extends AppController {

   var $name = 'KnowledgeAreas';
   var $helpers = array('Html', 'Form');

   function index() {
      $this->KnowledgeArea->recursive = 0;
      $this->set('knowledgeAreas', $this->paginate());
   }

   function view($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid KnowledgeArea.', true));
         $this->redirect(array('action'=>'index'));
      }
      $this->set('knowledgeArea', $this->KnowledgeArea->read(null, $id));
      $this->set('processGroup', $this->KnowledgeArea->Process->ProcessGroup->find('list'));
   }

   function add() {
      if (!empty($this->data)) {
         $this->KnowledgeArea->create();
         if ($this->KnowledgeArea->save($this->data)) {
            $this->Session->setFlash(__('The KnowledgeArea has been saved', true));
            $this->redirect(array('action'=>'index'));
         } else {
            $this->Session->setFlash(__('The KnowledgeArea could not be saved. Please, try again.', true));
         }
      }
   }

   function edit($id = null) {
      if (!$id && empty($this->data)) {
         $this->Session->setFlash(__('Invalid KnowledgeArea', true));
         $this->redirect(array('action'=>'index'));
      }
      if (!empty($this->data)) {
         if ($this->KnowledgeArea->save($this->data)) {
            $this->Session->setFlash(__('The KnowledgeArea has been saved', true));
            $this->redirect(array('action'=>'index'));
         } else {
            $this->Session->setFlash(__('The KnowledgeArea could not be saved. Please, try again.', true));
         }
      }
      if (empty($this->data)) {
         $this->data = $this->KnowledgeArea->read(null, $id);
      }
   }

   function delete($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid id for KnowledgeArea', true));
         $this->redirect(array('action'=>'index'));
      }
      if ($this->KnowledgeArea->del($id)) {
         $this->Session->setFlash(__('KnowledgeArea deleted', true));
         $this->redirect(array('action'=>'index'));
      }
   }

}
?>