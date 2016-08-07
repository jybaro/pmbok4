<div class="documents index">
<h2>Documents</h2>

<div class="actions">
   <ul>
      <li><?php echo $html->link(__('New Document', true), array('action' => 'add')); ?> </li>
   </ul>
</div>

<?php

$docs = array();

foreach ($documents as $document) {
   $docs[$document['Document']['id']] = array(
      'id' => $document['Document']['id'],
      'name' => $document['Document']['name'],
      'related' => $document['Document']['related'],
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
      echo $html->link($docs[$b['value']]['name'], array('action' => 'view', $docs[$b['value']]['id']));
   }
}


?>
<!--table cellpadding="0" cellspacing="0">
<?php
/*
$i = 0;
foreach ($documents as $document):
   $class = null;
   if ($i++ % 2 == 0) {
      $class = ' class="altrow"';
   }
?>
   <tr<?php echo $class;?>>
      <td>
         <?php echo "$i. " . $html->link($document['Document']['name'], array('action' => 'view', $document['Document']['id'])); ?>
      </td>
   </tr>
<?php endforeach; */?>
</table-->
</div>

<div class="actions">
   <ul>
      <li><?php echo $html->link(__('New Document', true), array('action' => 'add')); ?> </li>
   </ul>
</div>
