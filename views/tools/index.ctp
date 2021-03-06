<div class="tools index">
<h2><?php __('Tools');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('name');?></th>
	<th><?php echo $paginator->sort('description');?></th>
	<th><?php echo $paginator->sort('nombre');?></th>
	<th><?php echo $paginator->sort('descripcion');?></th>
	<th><?php echo $paginator->sort('notes');?></th>
	<th><?php echo $paginator->sort('created');?></th>
	<th><?php echo $paginator->sort('modified');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 0;
foreach ($tools as $tool):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $tool['Tool']['id']; ?>
		</td>
		<td>
			<?php echo $tool['Tool']['name']; ?>
		</td>
		<td>
			<?php echo $tool['Tool']['description']; ?>
		</td>
		<td>
			<?php echo $tool['Tool']['nombre']; ?>
		</td>
		<td>
			<?php echo $tool['Tool']['descripcion']; ?>
		</td>
		<td>
			<?php echo $tool['Tool']['notes']; ?>
		</td>
		<td>
			<?php echo $tool['Tool']['created']; ?>
		</td>
		<td>
			<?php echo $tool['Tool']['modified']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action' => 'view', $tool['Tool']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action' => 'edit', $tool['Tool']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action' => 'delete', $tool['Tool']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $tool['Tool']['id'])); ?>
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
		<li><?php echo $html->link(__('New Tool', true), array('action' => 'add')); ?></li>
		<li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
	</ul>
</div>
