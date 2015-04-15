<?php
echo $this->Html->script(array('/js/renovasFuncs/maskMoney.js', '/js/renovasFuncs/custom-funcs.js'));
?>
<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Editar <?php echo $this->data['Servico']['descricao'] ?> <small>informe todos os detalhes do serviço</small>
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
                    <i class="icon-truck"></i>
                    <?php echo $this->html->link('Serviços', '/servicos/listar'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li><?php echo $this->html->link('Editar', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="portlet box light-grey">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-truck"></i>
                Editar Cadastro de Serviço
            </div>
            <!-- Setinha para recolher form -->
            <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <?php echo $this->Form->create('Servico', array('action' => 'editar', 'class' => 'horizontal-form')) ?>
            <div class="form-actions top left">
                <button type="button" class="btn default">
                    <?php echo $this->Html->link('Cancelar', array('controller' => 'Servicos', 'action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                </button>
                <button type="submit" class="btn blue"><i class="icon-ok"></i> <?php echo __('Salvar') ?></button>
            </div>
            <div class="form-body">
                <h3 class="form-section"><?php echo __('Informações Básicas') ?></h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Código Interno') ?> *</label>
                            <?php echo $this->Form->input('codinterno', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => __('código interno do servico'))); ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Descrição') ?> *</label>
                            <?php echo $this->Form->input('descricao', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'descrição do servico')); ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Categoria') ?></label>
                            <?php echo $this->Form->input('categoria_id', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'categoria do servico')); ?>
                        </div>
                    </div>
                </div>
                <h3 class="form-section"><?php echo __('Venda') ?></h3>
                <!--/row-->
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Venda') ?></label>
                            <?php echo $this->Form->input('valor_venda', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Servico']['valor_venda'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'valor normal venda')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Promoção') ?></label>
                            <?php echo $this->Form->input('valor_promocao', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Servico']['valor_promocao'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'venda promoção')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Promoção') ?> 2</label>
                            <?php echo $this->Form->input('valor_promocao2', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Servico']['valor_promocao2'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'venda promoção 2')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Promoção') ?> 3</label>
                            <?php echo $this->Form->input('valor_promocao3', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Servico']['valor_promocao3'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'venda promoção 3')); ?>
                        </div>
                    </div>
                </div>
                <h3 class="form-section"><?php echo __('Referência') . ' / ' . __('Observação') ?></h3>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <?php echo $this->Form->input('observacoes', array('type' => 'textarea', 'label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Observações ou Referências para o servico...')); ?>
                        </div>
                    </div>
                </div>

                <h3 class="form-section">Status</h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <?php $checked = $this->data['Servico']['ativo'] ?>
                            <div class="radio-list">
                                <label class="radio-inline">
                                    <input type="radio" name="data[Servico][ativo]" id="optionsRadios1" value="1" <?php echo $this->data['Servico']['ativo'] == 1 ? 'checked' : '' ?>> Ativo
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="data[Servico][ativo]" id="optionsRadios2" value="0" <?php echo $this->data['Servico']['ativo'] == 0 ? 'checked' : '' ?>> Inativo
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-actions left">
                    <button type="button" class="btn default">
                        <?php echo $this->Html->link('Cancelar', array('controller' => 'Servicos', 'action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                    </button>
                    <button type="submit" class="btn blue"><i class="icon-ok"></i> <?php echo __('Salvar') ?></button>
                </div>
                <?php echo $this->Form->end() ?>
                <!-- END FORM-->
            </div>
        </div>


    </div>
</div>

<script>
    jQuery(document).ready(function() {
        FormComponents.init();

        $("#ServicoValorVenda").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
        $("#ServicoValorPromocao").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
        $("#ServicoValorPromocao2").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
        $("#ServicoValorPromocao3").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});


    });
</script>

<style type="text/css">
    .input-group-btn{
        vertical-align: bottom !important;
    }
    .btn{
        font-size: 11px !important;
    }
</style>
