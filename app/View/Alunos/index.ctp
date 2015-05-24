


<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Default <small>informe todos os detalhes</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <?php echo $this->html->link('Home', '/'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-group"></i>
                    <?php echo $this->html->link('Cadastros', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class=""></i>
                    <?php echo $this->html->link('Clientes', '/clientes/listar'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li><?php echo $this->html->link('Novo', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="col-md-12">
<div class="alunos index">
	<h2><?php echo __('Alunos'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id'); ?></th>
			<th><?php echo $this->Paginator->sort('nome'); ?></th>
			<th><?php echo $this->Paginator->sort('sobrenome'); ?></th>
			<th><?php echo $this->Paginator->sort('rg'); ?></th>
			<th><?php echo $this->Paginator->sort('cpf'); ?></th>
			<th><?php echo $this->Paginator->sort('sexo'); ?></th>
			<th><?php echo $this->Paginator->sort('aniversario'); ?></th>
			<th><?php echo $this->Paginator->sort('email'); ?></th>
			<th><?php echo $this->Paginator->sort('rede_social'); ?></th>
			<th><?php echo $this->Paginator->sort('nome_pai'); ?></th>
			<th><?php echo $this->Paginator->sort('aniversario_pai'); ?></th>
			<th><?php echo $this->Paginator->sort('email_pai'); ?></th>
			<th><?php echo $this->Paginator->sort('nome_mae'); ?></th>
			<th><?php echo $this->Paginator->sort('aniversario_mae'); ?></th>
			<th><?php echo $this->Paginator->sort('email_mae'); ?></th>
			<th><?php echo $this->Paginator->sort('tel_residencia'); ?></th>
			<th><?php echo $this->Paginator->sort('tel_responsavel'); ?></th>
			<th><?php echo $this->Paginator->sort('celular'); ?></th>
			<th><?php echo $this->Paginator->sort('cel_responsavel'); ?></th>
			<th><?php echo $this->Paginator->sort('cep'); ?></th>
			<th><?php echo $this->Paginator->sort('bairro'); ?></th>
			<th><?php echo $this->Paginator->sort('cidade'); ?></th>
			<th><?php echo $this->Paginator->sort('estado'); ?></th>
			<th><?php echo $this->Paginator->sort('endereco'); ?></th>
			<th><?php echo $this->Paginator->sort('numero_endereco'); ?></th>
			<th><?php echo $this->Paginator->sort('complemento'); ?></th>
			<th><?php echo $this->Paginator->sort('observacoes'); ?></th>
			<th><?php echo $this->Paginator->sort('created'); ?></th>
			<th><?php echo $this->Paginator->sort('updated'); ?></th>
			<th><?php echo $this->Paginator->sort('ativo'); ?></th>
			<th class="actions"><?php echo __('Actions'); ?></th>
	</tr>
	<?php foreach ($alunos as $aluno): ?>
	<tr>
		<td><?php echo h($aluno['Aluno']['id']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['nome']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['sobrenome']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['rg']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['cpf']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['sexo']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['aniversario']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['email']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['rede_social']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['nome_pai']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['aniversario_pai']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['email_pai']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['nome_mae']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['aniversario_mae']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['email_mae']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['tel_residencia']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['tel_responsavel']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['celular']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['cel_responsavel']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['cep']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['bairro']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['cidade']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['estado']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['endereco']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['numero_endereco']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['complemento']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['observacoes']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['created']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['updated']); ?>&nbsp;</td>
		<td><?php echo h($aluno['Aluno']['ativo']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View'), array('action' => 'view', $aluno['Aluno']['id'])); ?>
			<?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $aluno['Aluno']['id'])); ?>
			<?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $aluno['Aluno']['id']), null, __('Are you sure you want to delete # %s?', $aluno['Aluno']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
	));
	?>	</p>
	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('previous'), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ''));
		echo $this->Paginator->next(__('next') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Aluno'), array('action' => 'add')); ?></li>
	</ul>
</div>
    </div>
</div>


</div>


<script>
    jQuery(document).ready(function() {
        FormComponents.init();
        FormSamples.init();
    });
</script>
