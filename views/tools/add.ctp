<div class="tools form">
<?php echo $form->create('Tool');?>
   <fieldset>
      <legend><?php __('Add Tool');?></legend>
   <?php
      echo $form->input('id', array('label' => 'Tool', 'empty' => true, 'size' => "14", 'options' => $tool_id));
      echo $form->input('name', array('label' => 'New tool'));
      //echo $form->input('description');
      //echo $form->input('nombre');
      //echo $form->input('descripcion');
      //echo $form->input('notes');
      echo $form->input('Process', array('size' => "4", 'selected' => $process));
   ?>
   </fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
   <ul>
      <li><?php echo $html->link(__('List Tools', true), array('action' => 'index'));?></li>
      <li><?php echo $html->link(__('List Processes', true), array('controller' => 'processes', 'action' => 'index')); ?> </li>
      <li><?php echo $html->link(__('New Process', true), array('controller' => 'processes', 'action' => 'add')); ?> </li>
   </ul>
</div>

<script>

ToolId = document.getElementById('ToolId');

function p_change_name() {
   ToolName = document.getElementById('ToolName')
   ToolName.value = ToolId.options[ToolId.selectedIndex].text;
}


ToolId.onclick = function () {p_change_name()};
ToolId.onchange = function () {p_change_name()};

</script>
