<div class="knowledgeAreas form">
<?php echo $form->create('KnowledgeArea');?>
	<fieldset>
 		<legend><?php __('Edit KnowledgeArea');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('name');
		echo $form->input('orden');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('KnowledgeArea.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('KnowledgeArea.id'))); ?></li>
		<li><?php echo $html->link(__('List KnowledgeAreas', true), array('action' => 'index'));?></li>
		<li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
	</ul>
</div>
