<?php
echo $this->Html->script(array('/js/views/home/listar_cidades.js'));
?>

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
        <div class="form">
            <?php echo $this->Form->create(null); ?>
            <fieldset>
                <legend><?php echo __('Exemplo de select dinamico com cidades e estados do Brasil'); ?></legend>
                <?php echo $this->Form->input('estado_id', array('type' => 'select', 'options' => $estados, 'id' => 'estados', 'empty' => 'selecione um estado')) ?>
                <?php echo $this->Form->input('cidade_id', array('type' => 'select', 'id' => 'cidades', 'empty' => 'selecione uma cidade')) ?>
            </fieldset>
            <?php echo $this->Form->end(); ?>
        </div>
        <div class="actions">
            <h3><?php echo __('Links'); ?></h3>
            <ul>
                <li><?php echo $this->Html->link(__('código fonte'), 'https://github.com/emersonsoares/CakePHP-Dinamic-Select-Box'); ?></li>
                <li><?php echo $this->Html->link(__('emersonsoares.com'), 'http://emersonsoares.com'); ?></li>
            </ul>
        </div>
    </div>
</div>


</div>
