<div class="terms view">
<h2><?php  __('Term');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Description'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['description']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Nombre'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['nombre']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Descripcion'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['descripcion']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Acronym'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['acronym']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Acronimo'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['acronimo']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Related Child'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($term['relatedChild']['name'], array('controller' => 'terms', 'action' => 'view', $term['relatedChild']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Synonym Child'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($term['synonymChild']['name'], array('controller' => 'terms', 'action' => 'view', $term['synonymChild']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['modified']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Notes'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $term['Term']['notes']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Term', true), array('action' => 'edit', $term['Term']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Term', true), array('action' => 'delete', $term['Term']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $term['Term']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Terms', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Term', true), array('action' => 'add')); ?> </li>
		<li><?php echo $html->link(__('List Terms', true), array('controller' => 'terms', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Synonym Child', true), array('controller' => 'terms', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Related Terms');?></h3>
	<?php if (!empty($term['synonymParent'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th><?php __('Description'); ?></th>
		<th><?php __('Nombre'); ?></th>
		<th><?php __('Descripcion'); ?></th>
		<th><?php __('Acronym'); ?></th>
		<th><?php __('Acronimo'); ?></th>
		<th><?php __('Related'); ?></th>
		<th><?php __('Synonym'); ?></th>
		<th><?php __('Created'); ?></th>
		<th><?php __('Modified'); ?></th>
		<th><?php __('Notes'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($term['synonymParent'] as $synonymParent):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $synonymParent['id'];?></td>
			<td><?php echo $synonymParent['name'];?></td>
			<td><?php echo $synonymParent['description'];?></td>
			<td><?php echo $synonymParent['nombre'];?></td>
			<td><?php echo $synonymParent['descripcion'];?></td>
			<td><?php echo $synonymParent['acronym'];?></td>
			<td><?php echo $synonymParent['acronimo'];?></td>
			<td><?php echo $synonymParent['related'];?></td>
			<td><?php echo $synonymParent['synonym'];?></td>
			<td><?php echo $synonymParent['created'];?></td>
			<td><?php echo $synonymParent['modified'];?></td>
			<td><?php echo $synonymParent['notes'];?></td>
			<td class="actions">
				<?php echo $html->link(__('View', true), array('controller' => 'terms', 'action' => 'view', $synonymParent['id'])); ?>
				<?php echo $html->link(__('Edit', true), array('controller' => 'terms', 'action' => 'edit', $synonymParent['id'])); ?>
				<?php echo $html->link(__('Delete', true), array('controller' => 'terms', 'action' => 'delete', $synonymParent['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $synonymParent['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $html->link(__('New Synonym Parent', true), array('controller' => 'terms', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
<div class="related">
	<h3><?php __('Related Terms');?></h3>
	<?php if (!empty($term['relatedParent'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th><?php __('Description'); ?></th>
		<th><?php __('Nombre'); ?></th>
		<th><?php __('Descripcion'); ?></th>
		<th><?php __('Acronym'); ?></th>
		<th><?php __('Acronimo'); ?></th>
		<th><?php __('Related'); ?></th>
		<th><?php __('Synonym'); ?></th>
		<th><?php __('Created'); ?></th>
		<th><?php __('Modified'); ?></th>
		<th><?php __('Notes'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($term['relatedParent'] as $relatedParent):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $relatedParent['id'];?></td>
			<td><?php echo $relatedParent['name'];?></td>
			<td><?php echo $relatedParent['description'];?></td>
			<td><?php echo $relatedParent['nombre'];?></td>
			<td><?php echo $relatedParent['descripcion'];?></td>
			<td><?php echo $relatedParent['acronym'];?></td>
			<td><?php echo $relatedParent['acronimo'];?></td>
			<td><?php echo $relatedParent['related'];?></td>
			<td><?php echo $relatedParent['synonym'];?></td>
			<td><?php echo $relatedParent['created'];?></td>
			<td><?php echo $relatedParent['modified'];?></td>
			<td><?php echo $relatedParent['notes'];?></td>
			<td class="actions">
				<?php echo $html->link(__('View', true), array('controller' => 'terms', 'action' => 'view', $relatedParent['id'])); ?>
				<?php echo $html->link(__('Edit', true), array('controller' => 'terms', 'action' => 'edit', $relatedParent['id'])); ?>
				<?php echo $html->link(__('Delete', true), array('controller' => 'terms', 'action' => 'delete', $relatedParent['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $relatedParent['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $html->link(__('New Related Parent', true), array('controller' => 'terms', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
