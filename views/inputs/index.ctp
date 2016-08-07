<div class="inputs index">
<h2><?php __('Inputs');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('document_id');?></th>
	<th><?php echo $paginator->sort('process_id');?></th>
	<th><?php echo $paginator->sort('created');?></th>
	<th><?php echo $paginator->sort('modified');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 0;
foreach ($inputs as $input):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $input['Input']['id']; ?>
		</td>
		<td>
			<?php echo $html->link($input['Document']['name'], array('controller' => 'documents', 'action' => 'view', $input['Document']['id'])); ?>
		</td>
		<td>
			<?php echo $html->link($input['Process']['name'], array('controller' => 'processes', 'action' => 'view', $input['Process']['id'])); ?>
		</td>
		<td>
			<?php echo $input['Input']['created']; ?>
		</td>
		<td>
			<?php echo $input['Input']['modified']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action' => 'view', $input['Input']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action' => 'edit', $input['Input']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action' => 'delete', $input['Input']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $input['Input']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>
</div>
<div class="paging">
	<?php echo $paginator->prev('<< '.__('previous', true), array(), null, array('class'=>'disabled'));?>
 | 	<?php echo $paginator->numbers();?>
	<?php echo $paginator->next(__('next', true).' >>', array(), null, array('class' => 'disabled'));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('New Input', true), array('action' => 'add')); ?></li>
		<li><?php echo $html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add')); ?> </li>
		<li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
	</ul>
</div>
