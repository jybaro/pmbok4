<div class="processes index">
<h2><?php __('Processes');?></h2>

<?php

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
            echo $html->link($nom_p, array('controller' => 'processes', 'action' => 'view', $id_p));
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
<!--
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('List Knowledge Areas', true), array('controller' => 'knowledge_areas', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('List Process Groups', true), array('controller' => 'process_groups', 'action' => 'index')); ?> </li>
   </ul>
</div>
-->

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
   echo "<li>" . $html->link($name, array('controller' => 'tools', 'action' => 'view', $id)) . '</li>';
} 
echo '</ul>';
?>
   </div>