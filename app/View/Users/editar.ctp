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
        <?php echo $this->Form->create('User'); ?>
        <fieldset>
            <legend><?php echo __('Edit User'); ?></legend>
            <?php
            echo $this->Form->input('id');
            echo $this->Form->input('nome');
            echo $this->Form->input('apelido');
            echo $this->Form->input('username');
            echo $this->Form->input('password');
            echo $this->Form->input('role');
            echo $this->Form->input('rgie');
            echo $this->Form->input('cpfcnpj');
            echo $this->Form->input('sexo');
            echo $this->Form->input('aniversario');
            echo $this->Form->input('email');
            echo $this->Form->input('tel_residencia');
            echo $this->Form->input('celular');
            echo $this->Form->input('cep');
            echo $this->Form->input('bairro');
            echo $this->Form->input('cidade');
            echo $this->Form->input('endereco');
            echo $this->Form->input('numero_endereco');
            echo $this->Form->input('complemento');
            echo $this->Form->input('id_endereco');
            echo $this->Form->input('id_telefone');
            echo $this->Form->input('ativo');
            ?>
        </fieldset>
        <?php echo $this->Form->end(__('Submit')); ?>
    </div>
    <div class="actions">
        <h3><?php echo __('Actions'); ?></h3>
        <ul>

            <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('User.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('User.id'))); ?></li>
            <li><?php echo $this->Html->link(__('List Users'), array('action' => 'index')); ?></li>
        </ul>
    </div>
</div>
