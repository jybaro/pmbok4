<div class="tools form">
<?php echo $form->create('Tool');?>
	<fieldset>
 		<legend><?php __('Edit Tool');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('name');
		echo $form->input('description');
		echo $form->input('nombre');
		echo $form->input('descripcion');
		echo $form->input('notes');
		echo $form->input('Process');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Tool.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Tool.id'))); ?></li>
		<li><?php echo $html->link(__('List Tools', true), array('action' => 'index'));?></li>
		<li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
	</ul>
</div>
