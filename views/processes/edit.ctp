<div class="processes form">
<?php echo $form->create('Process');?>
   <fieldset>
      <legend><?php __('Edit Process');?></legend>
   <?php
      echo $form->input('id');
      echo $form->input('name');
      echo $form->input('description');
      echo $form->input('nombre');
      echo $form->input('descripcion');
      echo $form->input('orden');
      echo $form->input('knowledge_area_id');
      echo $form->input('process_group_id');
   ?>
   </fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Process.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Process.id'))); ?></li>
      <li><?php echo $html->link(__('List Processes', true), array('action' => 'index'));?></li>
      <li><?php echo $html->link(__('List Knowledge Areas', true), array('controller' => 'knowledge_areas', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Knowledge Area', true), array('controller' => 'knowledge_areas', 'action' => 'add')); ?> </li>
      <li><?php echo $html->link(__('List Process Groups', true), array('controller' => 'process_groups', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Process Group', true), array('controller' => 'process_groups', 'action' => 'add')); ?> </li>
      <li><?php echo $html->link(__('List Inputs', true), array('controller' => 'inputs', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Input', true), array('controller' => 'inputs', 'action' => 'add')); ?> </li>
      <li><?php echo $html->link(__('List Outputs', true), array('controller' => 'outputs', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Output', true), array('controller' => 'outputs', 'action' => 'add')); ?> </li>
   </ul>
</div>
