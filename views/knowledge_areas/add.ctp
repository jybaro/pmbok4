<div class="knowledgeAreas form">
<?php echo $form->create('KnowledgeArea');?>
	<fieldset>
 		<legend><?php __('Add KnowledgeArea');?></legend>
	<?php
		echo $form->input('name');
		echo $form->input('orden');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List KnowledgeAreas', true), array('action' => 'index'));?></li>
		<li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
	</ul>
</div>
