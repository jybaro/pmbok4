<div id="column-container">
   <div id="column-center" class="processes view column">
      <h2>PROCESS: <?php echo $process['Process']['name']; ?></h2>
      <dl><?php $i = 0; $class = ' class="altrow"';?>
         <dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Knowledge Area'); ?></dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $html->link($process['KnowledgeArea']['name'], array('controller' => 'knowledge_areas', 'action' => 'view', $process['KnowledgeArea']['id'])); ?>
            &nbsp;
         </dd>
         
         <dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Process Group'); ?></dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $html->link($process['ProcessGroup']['name'], array('controller' => 'process_groups', 'action' => 'view', $process['ProcessGroup']['id'])); ?>
            &nbsp;
         </dd>
         
         <dt<?php if ($i % 2 == 0) echo $class;?>>Description</dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $process['Process']['description']; ?>
            &nbsp;
         </dd>
         
         <dt<?php if ($i % 2 == 0) echo $class;?>>Nombre</dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $process['Process']['nombre']; ?>
            &nbsp;
         </dd>
         
         <dt<?php if ($i % 2 == 0) echo $class;?>>Descripcion</dt>
         <dd<?php if ($i++ % 2 == 0) echo $class;?>>
            <?php echo $process['Process']['descripcion']; ?>
            &nbsp;
         </dd>
      </dl>
      <div class="actions">
         <ul>
            <li><?php echo $html->link(__('Edit Process', true), array('action' => 'edit', $process['Process']['id'])); ?> </li>
         </ul>
      </div>
      <h3><?php __('Tools');?></h3>
      <?php if (!empty($process['Tool'])):?>
      <table cellpadding = "0" cellspacing = "0">
      <?php
         $i = 0;
         foreach ($process['Tool'] as $tool):
            $class = null;
            $doc_foco = null;
            if ($i++ % 2 == 0) {
               $class = ' class="altrow"';
            }
            if ($tool['is_key'] == 1) {
               $doc_foco = ' class="doc-foco"';
            }
            
         ?>
         <tr<?php echo $class;?>>
            <td <?php echo $doc_foco;?>><?php echo "$i. " . $html->link('- ' . $tool['name'], array('controller' => 'tools', 'action' => 'view', $tool['id']));?></td>
         </tr>
      <?php endforeach; ?>
      </table>
      <?php endif; ?>
      <div class="actions">
         <ul>
            <li><?php echo $html->link(__('Add tool', true), array('controller' => 'tools', 'action' => 'add', $process['Process']['id'])); ?> </li>
         </ul>
      </div>
   </div>

   <div id="column-left" class="input column">
      <h3><?php __('Inputs »');?></h3>
      <?php if (!empty($process['Input'])):?>
      <table cellpadding = "0" cellspacing = "0">
      <?php
         $i = 0;
         foreach ($process['Input'] as $input):
            $class = null;
            $doc_foco = null;
            if ($i++ % 2 == 0) {
               $class = ' class="altrow"';
            }
            if ($input['is_key'] == 1) {
               $doc_foco = ' class="doc-foco"';
            }
            
            $edit = ' - [' . $html->link('edit', array('controller' => 'inputs', 'action' => 'edit', $input['id'])) . ']';
            $edit = '';
            
         ?>
         <tr<?php echo $class;?>>
            <td <?php echo $doc_foco;?>><?php echo "$i. " . $html->link($document_names[$input['document_id']], array('controller' => 'documents', 'action' => 'view', $input['document_id'])) . $edit;?></td>
         </tr>
      <?php endforeach; ?>
      </table>
      <?php endif; ?>

<!-- 
      <div class="actions">
         <ul>
            <li><?php echo $html->link(__('List Inputs', true), array('controller' => 'inputs', 'action' => 'index')); ?> </li>
            <li><?php echo $html->link(__('New Input', true), array('controller' => 'inputs', 'action' => 'add', $process['Process']['id']));?> </li>
         </ul>
      </div>
-->

   </div>
   
   <div id="column-right" class="output column">
      <h3><?php __('» Outputs');?></h3>
      <?php if (!empty($process['Output'])):?>
      <table cellpadding = "0" cellspacing = "0">
      <?php
         $i = 0;
         foreach ($process['Output'] as $output):
            $class = null;
            $doc_foco = null;
            if ($i++ % 2 == 0) {
               $class = ' class="altrow"';
            }
            if ($output['is_key'] == 1) {
               $doc_foco = ' class="doc-foco"';
            }
            
            $edit = ' - [' . $html->link('edit', array('controller' => 'outputs', 'action' => 'edit', $output['id'])) . ']';
            $edit = '';
         ?>
         <tr<?php echo $class;?>>
            <td <?php echo $doc_foco;?>><?php echo "$i. " . $html->link($document_names[$output['document_id']], array('controller' => 'documents', 'action' => 'view', $output['document_id'])) . $edit;?></td>
         </tr>
      <?php endforeach; ?>
      </table>
      <?php endif; ?>
<!-- 
      <div class="actions">
         <ul>
            <li><?php echo $html->link(__('List Outputs', true), array('controller' => 'outputs', 'action' => 'index')); ?> </li>
            <li><?php echo $html->link(__('New Output', true), array('controller' => 'outputs', 'action' => 'add', $process['Process']['id']));?> </li>
         </ul>
      </div>
-->
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
      $style_class = ($k_area == $process['KnowledgeArea']['id']) ? 'k-area-' : '';
      $style_class .= ($p_group == $process['ProcessGroup']['id']) ? 'p-group-' : '';
      $style_class .= 'foco';
   
      echo "<td class=\"$style_class\">";

      if (isset($procs[$k_area][$p_group])) {
         $glue = '';
         foreach ($procs[$k_area][$p_group] as $id_p => $nom_p) {
            echo $glue;
            $glue = '<hr/>';

            if ($id_p == $process['Process']['id']) {
               echo '<span class="proc-foco">' . $nom_p . '</span>';
            } else {
               echo $html->link($nom_p, array('controller' => 'processes', 'action' => 'view', $id_p));
            }
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
      $isInput = false;
      $isOutput = false;
      
      foreach ($process['Input'] as $input) {
         $isInput = $isInput || ($input['document_id'] == $b['value']);
      }
      
      foreach ($process['Output'] as $output) {
         $isOutput = $isOutput || ($output['document_id'] == $b['value']);
      }
      
      $style_class = ''; 
      $in = '';
      $out = '';

      if ($isInput) { 
         $style_class = "class=\"input doc-foco\"";
         $in = ' »';
      } else if ($isOutput) { 
         $style_class = "class=\"output doc-foco\""; 
         $out = '» ';
      } 

      echo "<span $style_class>" . $out . $html->link($docs[$b['value']]['name'], array('controller' => 'documents', 'action' => 'view', $docs[$b['value']]['id'])) . $in . '</span>';
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
   foreach ($process['Tool'] as $local_tool) {
      
      if ($local_tool['id'] == $id) {
         $class = ' class="tool tool-foco"';
      }
   }
   
   echo "<li $class>" . $html->link($name, array('controller' => 'tools', 'action' => 'view', $id)) . '</li>';
} 
echo '</ul>';
?>
   </div>
</div>