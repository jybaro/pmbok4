<div class="terms index">
<h2><?php __('Terms');?></h2>
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
	<th><?php echo $paginator->sort('acronym');?></th>
	<th><?php echo $paginator->sort('acronimo');?></th>
	<th><?php echo $paginator->sort('related');?></th>
	<th><?php echo $paginator->sort('synonym');?></th>
	<th><?php echo $paginator->sort('created');?></th>
	<th><?php echo $paginator->sort('modified');?></th>
	<th><?php echo $paginator->sort('notes');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 0;
foreach ($terms as $term):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $term['Term']['id']; ?>
		</td>
		<td>
			<?php echo $term['Term']['name']; ?>
		</td>
		<td>
			<?php echo $term['Term']['description']; ?>
		</td>
		<td>
			<?php echo $term['Term']['nombre']; ?>
		</td>
		<td>
			<?php echo $term['Term']['descripcion']; ?>
		</td>
		<td>
			<?php echo $term['Term']['acronym']; ?>
		</td>
		<td>
			<?php echo $term['Term']['acronimo']; ?>
		</td>
		<td>
			<?php echo $html->link($term['relatedChild']['name'], array('controller' => 'terms', 'action' => 'view', $term['relatedChild']['id'])); ?>
		</td>
		<td>
			<?php echo $html->link($term['synonymChild']['name'], array('controller' => 'terms', 'action' => 'view', $term['synonymChild']['id'])); ?>
		</td>
		<td>
			<?php echo $term['Term']['created']; ?>
		</td>
		<td>
			<?php echo $term['Term']['modified']; ?>
		</td>
		<td>
			<?php echo $term['Term']['notes']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action' => 'view', $term['Term']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action' => 'edit', $term['Term']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action' => 'delete', $term['Term']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $term['Term']['id'])); ?>
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
		<li><?php echo $html->link(__('New Term', true), array('action' => 'add')); ?></li>
		<li><?php echo $html->link(__('List Terms', true), array('controller' => 'terms', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Synonym Child', true), array('controller' => 'terms', 'action' => 'add')); ?> </li>
	</ul>
</div>
