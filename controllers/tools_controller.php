<?php
class ToolsController extends AppController {

   var $name = 'Tools';
   var $helpers = array('Html', 'Form');

   function index() {
      $this->Tool->recursive = 0;
      $this->set('tools', $this->paginate());
   }

   function view($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid Tool.', true));
         $this->redirect(array('action'=>'index'));
      }
      
      $this->set('tool', $this->Tool->read(null, $id));
      
      $this->set('knowledgeAreas', $this->Tool->Process->KnowledgeArea->find('list', array('order' => 'orden ASC')));
      $this->set('processGroups', $this->Tool->Process->ProcessGroup->find('list', array('order' => 'orden ASC')));
      $this->set('processes', $this->Tool->Process->find('all', array('order' => 'Process.orden ASC')));
      
      $this->set('documents', $this->Tool->Process->Input->Document->find('all'));
      $this->set('tools', $this->Tool->find('list', array('order' => 'name ASC')));
   }

   function add($process = null) {
      if (!empty($this->data)) {

         if (isset($this->data['Tool']['id'])) {
            $all_tools = $this->Tool->find('all');
            //pr($all_tools);

            foreach ($all_tools as $local_tool) {
               //se barre todas las herramientas
               
               if ($local_tool['Tool']['id'] == $this->data['Tool']['id']) {
                  //si se encuentra la herramienta
                  
                  foreach ($local_tool['Process'] as $local_process) {
                     //se barre todos los procesos de la herramienta
                     $isRegister = false;
                     $save_processes = $this->data['Process']['Process'];

                     if (is_array($save_processes)) {
                        foreach ($save_processes as $save_process) {
                           $isRegister = ($save_process == $local_process['id']) ? true : $isRegister;
                        }
                     }
                     
                     if (!$isRegister) {
                        $this->data['Process']['Process'][] = $local_process['id'];
                     }
                  }
               }
            }
         }
         
         
//         pr($this->data);
//         die();

         if ($this->Tool->save($this->data)) {
            $this->Session->setFlash(__('The Tool has been saved', true));
            $this->redirect(array('controller'=>'processes', 'action'=>'view', $this->data['Process']['Process'][0]));
         } else {
            $this->Session->setFlash(__('The Tool could not be saved. Please, try again.', true));
         }
      }
      $processes = $this->Tool->Process->find('list');
      $this->set(compact('processes'));
      
      $tool_id = $this->Tool->find('list', array('order' => 'name ASC'));
      $this->set('tool_id', $tool_id);
      
      $this->set(compact('process'));
   }

   function edit($id = null) {
      if (!$id && empty($this->data)) {
         $this->Session->setFlash(__('Invalid Tool', true));
         $this->redirect(array('action'=>'index'));
      }
      if (!empty($this->data)) {
         if ($this->Tool->save($this->data)) {
            $this->Session->setFlash(__('The Tool has been saved', true));
            $this->redirect(array('action'=>'index'));
         } else {
            $this->Session->setFlash(__('The Tool could not be saved. Please, try again.', true));
         }
      }
      if (empty($this->data)) {
         $this->data = $this->Tool->read(null, $id);
      }
      $processes = $this->Tool->Process->find('list');
      $this->set(compact('processes'));
   }

   function delete($id = null) {
      if (!$id) {
         $this->Session->setFlash(__('Invalid id for Tool', true));
         $this->redirect(array('action'=>'index'));
      }
      if ($this->Tool->del($id)) {
         $this->Session->setFlash(__('Tool deleted', true));
         $this->redirect(array('action'=>'index'));
      }
   }

}
?>