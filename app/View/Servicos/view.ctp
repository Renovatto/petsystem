<div class="servicos view">
<h2><?php echo __('Servico'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Codinterno'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['codinterno']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Descricao'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['descricao']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Valor Normal'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['valor_normal']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Valor Promocao'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['valor_promocao']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Valor Promocao2'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['valor_promocao2']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Valor Promocao3'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['valor_promocao3']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Categoria Id'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['categoria_id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Observacoes'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['observacoes']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('User Id Modifiedd'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['user_id_modifiedd']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Modified'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['modified']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Created'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['created']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Ativo'); ?></dt>
		<dd>
			<?php echo h($servico['Servico']['ativo']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Servico'), array('action' => 'edit', $servico['Servico']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Servico'), array('action' => 'delete', $servico['Servico']['id']), null, __('Are you sure you want to delete # %s?', $servico['Servico']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Servicos'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Servico'), array('action' => 'add')); ?> </li>
	</ul>
</div>
