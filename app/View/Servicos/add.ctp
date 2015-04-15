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
        <div class="servicos form">
            <?php echo $this->Form->create('Servico'); ?>
            <fieldset>
                <legend><?php echo __('Add Servico'); ?></legend>
                <?php
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

                <li><?php echo $this->Html->link(__('List Servicos'), array('action' => 'index')); ?></li>
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