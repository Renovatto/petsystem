<div class="servicos form">
<?php echo $this->Form->create('Servico'); ?>
	<fieldset>
		<legend><?php echo __('Edit Servico'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('codinterno');
		echo $this->Form->input('descricao');
		echo $this->Form->input('valor_normal');
		echo $this->Form->input('valor_promocao');
		echo $this->Form->input('valor_promocao2');
		echo $this->Form->input('valor_promocao3');
		echo $this->Form->input('categoria_id');
		echo $this->Form->input('observacoes');
		echo $this->Form->input('user_id_modifiedd');
		echo $this->Form->input('ativo');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Servico.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Servico.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Servicos'), array('action' => 'index')); ?></li>
	</ul>
</div>
