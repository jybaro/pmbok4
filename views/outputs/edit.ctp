<div class="outputs form">
<?php echo $form->create('Output');?>
   <fieldset>
      <legend><?php __('Edit Output');?></legend>
   <?php
      echo $form->input('id');
      echo $form->input('document_id');
      echo $form->input('process_id');
      echo $form->input('is_key', array('options' => array(0 => 'No', 1 => 'Yes')));
   ?>
   </fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Output.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Output.id'))); ?></li>
      <li><?php echo $html->link(__('List Outputs', true), array('action' => 'index'));?></li>
      <li><?php echo $html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add')); ?> </li>
      <li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
   </ul>
</div>
