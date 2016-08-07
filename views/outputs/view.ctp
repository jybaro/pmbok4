<div class="outputs view">
<h2><?php  __('Output');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $output['Output']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Document'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($output['Document']['name'], array('controller' => 'documents', 'action' => 'view', $output['Document']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Process'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($output['Process']['name'], array('controller' => 'processes', 'action' => 'view', $output['Process']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $output['Output']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $output['Output']['modified']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Output', true), array('action' => 'edit', $output['Output']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Output', true), array('action' => 'delete', $output['Output']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $output['Output']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Outputs', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Output', true), array('action' => 'add')); ?> </li>
		<li><?php echo $html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add')); ?> </li>
		<li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
	</ul>
</div>
