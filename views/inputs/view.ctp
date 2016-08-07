<div class="inputs view">
<h2><?php  __('Input');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $input['Input']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Document'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($input['Document']['name'], array('controller' => 'documents', 'action' => 'view', $input['Document']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Process'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($input['Process']['name'], array('controller' => 'processes', 'action' => 'view', $input['Process']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $input['Input']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $input['Input']['modified']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Input', true), array('action' => 'edit', $input['Input']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Input', true), array('action' => 'delete', $input['Input']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $input['Input']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Inputs', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Input', true), array('action' => 'add')); ?> </li>
		<li><?php echo $html->link(__('List Documents', true), array('controller' => 'documents', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Document', true), array('controller' => 'documents', 'action' => 'add')); ?> </li>
		<li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
	</ul>
</div>
