<div class="alunos form">
<?php echo $this->Form->create('Aluno'); ?>
	<fieldset>
		<legend><?php echo __('Admin Add Aluno'); ?></legend>
	<?php
		echo $this->Form->input('nome');
		echo $this->Form->input('sobrenome');
		echo $this->Form->input('rg');
		echo $this->Form->input('cpf');
		echo $this->Form->input('sexo');
		echo $this->Form->input('aniversario');
		echo $this->Form->input('email');
		echo $this->Form->input('rede_social');
		echo $this->Form->input('nome_pai');
		echo $this->Form->input('aniversario_pai');
		echo $this->Form->input('email_pai');
		echo $this->Form->input('nome_mae');
		echo $this->Form->input('aniversario_mae');
		echo $this->Form->input('email_mae');
		echo $this->Form->input('tel_residencia');
		echo $this->Form->input('tel_responsavel');
		echo $this->Form->input('celular');
		echo $this->Form->input('cel_responsavel');
		echo $this->Form->input('cep');
		echo $this->Form->input('bairro');
		echo $this->Form->input('cidade');
		echo $this->Form->input('estado');
		echo $this->Form->input('endereco');
		echo $this->Form->input('numero_endereco');
		echo $this->Form->input('complemento');
		echo $this->Form->input('observacoes');
		echo $this->Form->input('ativo');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Alunos'), array('action' => 'index')); ?></li>
	</ul>
</div>
