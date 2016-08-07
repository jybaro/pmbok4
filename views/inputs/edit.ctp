<div class="inputs form">
<?php echo $form->create('Input');?>
   <fieldset>
      <legend><?php __('Edit Input');?></legend>
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
      <li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Input.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Input.id'))); ?></li>
      <li><?php echo $html->link(__('List Inputs', true), array('action' => 'index'));?></li>
      <li><?php echo $html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add')); ?> </li>
      <li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
   </ul>
</div>
