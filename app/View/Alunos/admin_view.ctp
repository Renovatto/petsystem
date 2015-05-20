<div class="alunos view">
<h2><?php echo __('Aluno'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Nome'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['nome']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Sobrenome'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['sobrenome']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Rg'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['rg']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Cpf'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['cpf']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Sexo'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['sexo']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Aniversario'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['aniversario']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Email'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['email']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Rede Social'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['rede_social']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Nome Pai'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['nome_pai']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Aniversario Pai'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['aniversario_pai']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Email Pai'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['email_pai']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Nome Mae'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['nome_mae']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Aniversario Mae'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['aniversario_mae']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Email Mae'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['email_mae']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Tel Residencia'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['tel_residencia']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Tel Responsavel'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['tel_responsavel']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Celular'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['celular']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Cel Responsavel'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['cel_responsavel']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Cep'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['cep']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Bairro'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['bairro']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Cidade'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['cidade']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Estado'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['estado']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Endereco'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['endereco']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Numero Endereco'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['numero_endereco']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Complemento'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['complemento']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Observacoes'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['observacoes']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Created'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['created']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Updated'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['updated']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Ativo'); ?></dt>
		<dd>
			<?php echo h($aluno['Aluno']['ativo']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Aluno'), array('action' => 'edit', $aluno['Aluno']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Aluno'), array('action' => 'delete', $aluno['Aluno']['id']), null, __('Are you sure you want to delete # %s?', $aluno['Aluno']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Alunos'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Aluno'), array('action' => 'add')); ?> </li>
	</ul>
</div>
