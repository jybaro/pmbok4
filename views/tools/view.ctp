<div id="column-container">
   <div id="column-center" class="tools view column">
   <h2><?php  __('TOOL: ' . $tool['Tool']['name']);?></h2>
      <dl><?php $i = 0; $class = ' class="altrow"';?>
         <dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Description'); ?></dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $tool['Tool']['description']; ?>
            &nbsp;
         </dd>
         <dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Nombre'); ?></dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $tool['Tool']['nombre']; ?>
            &nbsp;
         </dd>
         <dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Descripcion'); ?></dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $tool['Tool']['descripcion']; ?>
            &nbsp;
         </dd>
         <dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Notes'); ?></dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $tool['Tool']['notes']; ?>
            &nbsp;
         </dd>
      </dl>
      <div class="actions">
         <ul>
            <li><?php echo $html->link(__('Edit Tool', true), array('action' => 'edit', $tool['Tool']['id'])); ?> </li>
            <li><?php echo $html->link(__('Delete Tool', true), array('action' => 'delete', $tool['Tool']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $tool['Tool']['id'])); ?> </li>
            <li><?php echo $html->link(__('List Tools', true), array('action' => 'index')); ?> </li>
            <li><?php echo $html->link(__('New Tool', true), array('action' => 'add')); ?> </li>
         </ul>
      </div>
   </div>

   <div id="column-left" class="column">
      <h3><?php __('Used in procs:');?></h3>
      <?php if (!empty($tool['Process'])):?>
      <table cellpadding = "0" cellspacing = "0">
      <?php
         $i = 0;
         foreach ($tool['Process'] as $process):
            $class = null;
            if ($i++ % 2 == 0) {
               $class = ' class="altrow"';
            }
         ?>
         <tr<?php echo $class;?>>
            <td><?php echo "$i. " . $html->link($process['name'], array('controller' => 'processes', 'action' => 'view', $process['id'])); ?></td>
         </tr>
      <?php endforeach; ?>
      </table>
   <?php endif; ?>

      <div class="actions">
         <ul>
            <li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add'));?> </li>
         </ul>
      </div>
   </div>
   
   
</div>
<div id="column-footer">
   <div>
      <h3>Processes table</h3>
<?php
//Tabla de procesos
$procs = array();
foreach ($processes as $p) {
   $k_area = $p['Process']['knowledge_area_id'];
   $p_group = $p['Process']['process_group_id'];
   $id_p = $p['Process']['id'];
   
   if (!isset($procs[$k_area])) {
      $procs[$k_area] = array();
   }
   if (!isset($procs[$k_area][$p_group])) {
      $procs[$k_area][$p_group] = array();
   }
   $procs[$k_area][$p_group][$id_p] = $p['Process']['name'];
}

echo '<table border="1">';
echo '<tr><th rowspan="2">KNOWLEDGE AREAS</th>';
echo '<th colspan="5">PROCESS GROUPS</th></tr>';

echo '<tr>';
foreach ($processGroups as $p_group => $nom_p_group) {
   echo '<th>';
   echo $nom_p_group;
   echo '</th>';
}
echo '</tr>';

foreach ($knowledgeAreas as $k_area => $nom_k_area) {   
   echo "<tr>";
   echo '<th>';
   echo $nom_k_area;
   echo '</th>';
   foreach ($processGroups as $p_group => $nom_p_group) {
   
      echo "<td>";

      if (isset($procs[$k_area][$p_group])) {
         $glue = '';
         foreach ($procs[$k_area][$p_group] as $id_p => $nom_p) {
            echo $glue;
            $glue = '<hr/>';
            
            $isUsed = false;

            foreach ($tool['Process'] as $process) {
               $isUsed = ($id_p == $process['id']) || $isUsed;
            }
            
            $style_class = ''; 
            
            if ($isUsed) { 
               $style_class = "class=\"tool tool-foco\"";
            } 

            echo "<div $style_class>" . $html->link($nom_p, array('controller' => 'processes', 'action' => 'view', $id_p)) . '</div>';
/*
            if ($id_p == $process['Process']['id']) {
               echo '<span class="proc-foco">' . $nom_p . '</span>';
            } else {
               echo $html->link($nom_p, array('controller' => 'processes', 'action' => 'view', $id_p));
            }
*/
         }
      } else {
         echo '&nbsp;';
      }
      echo '</td>';
   }
   echo '</tr>';
}
echo '</table>';

?>
   </div>
   
   <div style="width:40%;float:left;">
      <h3>Document list</h3>
<?php
//lista de documentos
$docs = array();

foreach ($documents as $d) {
   $docs[$d['Document']['id']] = array(
      'id' => $d['Document']['id'],
      'name' => $d['Document']['name'],
      'related' => $d['Document']['related'],
      'child' => false,
      'docs' => array()
   );
}


foreach ($docs as $id => $doc) {
   if (!empty($doc['related'])) {
      $docs[$doc['related']]['docs'][$id] = & $docs[$id];
      $docs[$id]['child'] = true;
   }
}

//pr($docs);


function p_display_docs($docs = array(), $level = 0) {
   $buff = false;
   
   if (count($docs) > 0) {
      $buff = array();
      array_push($buff,  array('type' => 't', 'value' => '<ul>'));
      foreach ($docs as $doc) {
         if ($level != 0 || !$doc['child']) {
            array_push($buff, array('type' => 't', 'value' => '<li>'));
            array_push($buff, array('type' => 'id', 'value' => $doc['id']));
            if ($buff_return = p_display_docs($doc['docs'], $level + 1)) {
               $buff = array_merge($buff, $buff_return);
            }
            array_push($buff, array('type' => 't', 'value' => '</li>'));
         }
      }
      array_push($buff, array('type' => 't', 'value' => '</ul>'));
   }
   
   return $buff;
}

$buff = p_display_docs($docs);

foreach ($buff as $b) {
   if ($b['type'] == 't') {
      echo $b['value'];
   } else {
      echo "<span>" . $html->link($docs[$b['value']]['name'], array('controller' => 'documents', 'action' => 'view', $docs[$b['value']]['id'])) . '</span>';
   }
}
?>
   </div>
   
   <div style="width:40%;float:right;">
      <h3>Tool list</h3>
<?php
echo '<ul>';
foreach ($tools as $id => $name) {
   $class = '';
     
   if ($tool['Tool']['id'] == $id) {
      $class = ' class="tool tool-foco"';
   }

   
   echo "<li $class>" . $html->link($name, array('controller' => 'tools', 'action' => 'view', $id)) . '</li>';
} 
echo '</ul>';
?>
   </div>
</div>