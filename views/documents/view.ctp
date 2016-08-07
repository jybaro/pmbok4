<div id="column-container">
   <div id="column-center" class="documents view column">
      <h2>DOCUMENT: <?php echo $document['Document']['name'];?></h2>
      <dl><?php $i = 0; $class = ' class="altrow"';?>
         <dt<?php if ($i % 2 == 0) echo $class;?>>Description</dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $document['Document']['description']; ?>
            &nbsp;
         </dd>
         
         <dt<?php if ($i % 2 == 0) echo $class;?>>Nombre</dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $document['Document']['nombre']; ?>
            &nbsp;
         </dd>
         
         <dt<?php if ($i % 2 == 0) echo $class;?>>Descripción</dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $document['Document']['descripcion']; ?>
            &nbsp;
         </dd>
      </dl>
      <div class="actions">
         <ul>
            <li><?php echo $html->link(__('Edit Document', true), array('action' => 'edit', $document['Document']['id'])); ?> </li>
            <li><?php echo $html->link(__('Delete Document', true), array('action' => 'delete', $document['Document']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $document['Document']['id'])); ?> </li>
            <li><?php echo $html->link(__('List Documents', true), array('action' => 'index')); ?> </li>
            <li><?php echo $html->link(__('New Document', true), array('action' => 'add')); ?> </li>
         </ul>
      </div>

   </div>

   <div id="column-left" class="output column">
      <h3><?php __('Output of');?></h3>
      <?php if (!empty($document['Output'])):?>
      <table cellpadding = "0" cellspacing = "0">
      <tr>
         <th>Process</th>
      </tr>
      <?php
         $i = 0;
         foreach ($document['Output'] as $output):
            $class = null;
            if ($i++ % 2 == 0) {
               $class = ' class="altrow"';
            }
         ?>
         <tr<?php echo $class;?>>
            <td><?php echo $html->link($process_names[$output['process_id']], array('controller' => 'processes', 'action' => 'view', $output['process_id'])) . ' »';?></td>
         </tr>
      <?php endforeach; ?>
      </table>
      <?php endif; ?>
   </div>

   <div id="column-right" class="input column">
      <h3><?php __('Input of');?></h3>
      <?php if (!empty($document['Input'])):?>
      <table cellpadding = "0" cellspacing = "0">
      <tr>
         <th><?php __('Process'); ?></th>
      </tr>
      <?php
         $i = 0;
         foreach ($document['Input'] as $input):
            $class = null;
            if ($i++ % 2 == 0) {
               $class = ' class="altrow"';
            }
         ?>
         <tr<?php echo $class;?>>
            <td><?php echo '» ' . $html->link($process_names[$input['process_id']], array('controller' => 'processes', 'action' => 'view', $input['process_id']));?></td>
         </tr>
      <?php endforeach; ?>
      </table>
      <?php endif; ?>
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
            
            $isInput = false;
            $isOutput = false;

            foreach ($document['Output'] as $output) {
               $isOutput = ($id_p == $output['process_id']) || $isOutput;
            }
            
            foreach ($document['Input'] as $input) {
               $isInput = ($id_p == $input['process_id']) || $isInput;
            }
            
            $style_class = ''; 
            $in = '';
            $out = '';
            
            if ($isInput) { 
               $style_class = "class=\"input proc-foco\"";
               $in = '» ';
            } else if ($isOutput) { 
               $style_class = "class=\"output proc-foco\""; 
               $out = ' »';
            } 

            echo "<div $style_class>" . $in . $html->link($nom_p, array('controller' => 'processes', 'action' => 'view', $id_p)) . $out . '</div>';
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
      if ($b['value'] == $document['Document']['id']) {
         echo "<span class=\"doc-foco\">" . $docs[$b['value']]['name'] . '</span>';
      } else {
         echo $html->link($docs[$b['value']]['name'], array('controller' => 'documents', 'action' => 'view', $docs[$b['value']]['id']));
      }
   }
}

?>
   </div>
   
   <div style="width:40%;float:right;">
      <h3>Tool list</h3>
<?php
echo '<ul>';
foreach ($tools as $id => $name) {
   echo "<li>" . $html->link($name, array('controller' => 'tools', 'action' => 'view', $id)) . '</li>';
} 
echo '</ul>';
?>
   </div>
</div>