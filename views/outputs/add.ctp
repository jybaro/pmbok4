<div class="outputs form">
<?php echo $form->create('Output');?>
   <fieldset>
      <legend><?php __('Add Output');?></legend>
   <?php
      echo $form->input('document_id', array('size' => "10", 'default' => $document_id));
      echo $form->input('process_id', array('default' => $process_id));
   ?>
   </fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('List Outputs', true), array('action' => 'index'));?></li>
      <li><?php echo $html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add', 'outputs', $process_id)); ?> </li>
      <li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
   </ul>
</div>
