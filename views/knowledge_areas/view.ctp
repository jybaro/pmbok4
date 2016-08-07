<div class="knowledgeAreas view">
<h2>Knowledge Area: <?php echo $knowledgeArea['KnowledgeArea']['name'];?></h2>
Project <strong><?php echo $knowledgeArea['KnowledgeArea']['name'];?></strong> Management
</div>
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('List Knowledge Areas', true), array('action' => 'index')); ?> </li>
   </ul>
</div>
<div class="related">
   <?php if (!empty($knowledgeArea['Process'])):?>
   <table cellpadding = "0" cellspacing = "0">
   <tr>
      <th><?php __('Process'); ?></th>
      <th><?php __('Description'); ?></th>
      <th><?php __('Process Group'); ?></th>
   </tr>
   <?php
      $i = 0;
      foreach ($knowledgeArea['Process'] as $process):
         $class = null;
         if ($i++ % 2 == 0) {
            $class = ' class="altrow"';
         }
      ?>
      <tr<?php echo $class;?>>
         <td><?php echo $html->link($process['name'], array('controller' => 'processes', 'action' => 'view', $process['id']));?></td>
         <td><?php echo $process['description'];?></td>
         <td><?php echo $html->link($processGroup[$process['process_group_id']], array('controller' => 'process_groups', 'action' => 'view', $process['process_group_id']));?></td>
      </tr>
   <?php endforeach; ?>
   </table>
   
<?php endif; ?>

</div>
