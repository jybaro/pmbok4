<div class="documents form">
<?php echo $form->create('Document', array('action' => "add/$origen/$process_id"));?>
   <fieldset>
      <legend><?php __('Add Document');?></legend>
   <?php
      echo $form->input('name');
      //echo $form->input('description');
      echo $form->input('related', array('options' => $documents, 'type' => 'select', 'empty' => true, 'size' => "10"));
   ?>
   </fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('List Documents', true), array('action' => 'index'));?></li>
      <li><?php echo $html->link(__('List Inputs', true), array('controller' => 'inputs', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Input', true), array('controller' => 'inputs', 'action' => 'add')); ?> </li>
      <li><?php echo $html->link(__('List Outputs', true), array('controller' => 'outputs', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Output', true), array('controller' => 'outputs', 'action' => 'add')); ?> </li>
   </ul>
</div>
