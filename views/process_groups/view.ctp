<div class="processGroups view">
<h2>Process Group: <?php echo $processGroup['ProcessGroup']['name']; ?></h2>
<strong><?php echo $processGroup['ProcessGroup']['name']; ?></strong> Process Group
</div>
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('List Process Groups', true), array('action' => 'index')); ?> </li>
   </ul>
</div>
<div class="related">
   <?php if (!empty($processGroup['Process'])):?>
   <table cellpadding = "0" cellspacing = "0">
   <tr>
      <th><?php __('Process'); ?></th>
      <th><?php __('Description'); ?></th>
      <th><?php __('Knowledge Area'); ?></th>
   </tr>
   <?php
      $i = 0;
      foreach ($processGroup['Process'] as $process):
         $class = null;
         if ($i++ % 2 == 0) {
            $class = ' class="altrow"';
         }
      ?>
      <tr<?php echo $class;?>>
         <td><?php echo $html->link($process['name'], array('controller' => 'processes', 'action' => 'view', $process['id']));?></td>
         <td><?php echo $process['description'];?></td>
         <td><?php echo $html->link($knowledgeArea[$process['knowledge_area_id']], array('controller' => 'knowledge_areas', 'action' => 'view', $process['knowledge_area_id']));?></td>
      </tr>
   <?php endforeach; ?>
   </table>
<?php endif; ?>
</div>
