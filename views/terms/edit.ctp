<div class="terms form">
<?php echo $form->create('Term');?>
	<fieldset>
 		<legend><?php __('Edit Term');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('name');
		echo $form->input('description');
		echo $form->input('nombre');
		echo $form->input('descripcion');
		echo $form->input('acronym');
		echo $form->input('acronimo');
		echo $form->input('related');
		echo $form->input('synonym');
		echo $form->input('notes');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Term.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Term.id'))); ?></li>
		<li><?php echo $html->link(__('List Terms', true), array('action' => 'index'));?></li>
		<li><?php echo $html->link(__('List Terms', true), array('controller' => 'terms', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Synonym Child', true), array('controller' => 'terms', 'action' => 'add')); ?> </li>
	</ul>
</div>
