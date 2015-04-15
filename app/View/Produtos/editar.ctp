<?php
echo $this->Html->script(array('/js/renovasFuncs/maskMoney.js', '/js/renovasFuncs/custom-funcs.js'));
?>
<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Editar <?php echo $this->data['Produto']['descricao'] ?> <small>informe todos os detalhes do produto</small>
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
                    <?php echo $this->html->link('Produtos', '/produtos/listar'); ?>
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
                Editar Cadastro de Produto
            </div>
            <!-- Setinha para recolher form -->
            <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <?php echo $this->Form->create('Produto', array('action' => 'editar', 'class' => 'horizontal-form')) ?>
            <div class="form-actions top left">
                <button type="button" class="btn default">
                    <?php echo $this->Html->link('Cancelar', array('controller' => 'Produtos', 'action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                </button>
                <button type="submit" class="btn blue"><i class="icon-ok"></i> <?php echo __('Salvar') ?></button>
            </div>
            <div class="form-body">
                <h3 class="form-section"><?php echo __('Informações Básicas') ?></h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Código Interno') ?> *</label>
                            <?php echo $this->Form->input('codinterno', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => __('código interno do produto'))); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Referência') ?> </label>
                            <?php echo $this->Form->input('referencia', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => __('referência do produto'))); ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Descrição') ?> *</label>
                            <?php echo $this->Form->input('descricao', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'descrição do produto')); ?>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Código de Barras') ?></label>
                            <?php echo $this->Form->input('codbarras', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'código de barras original')); ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Categoria') ?></label>
                            <?php echo $this->Form->input('categoria_id', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'categoria do produto')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Unidade de Medida') ?> *</label>
                            <?php
                            $unidMedida = $this->requestAction('/auxiliares/unidadeMedida');
                            echo $this->Form->select('unidade_medida', $unidMedida, array('class' => 'form-control input-sm', 'empty' => __('- Selecione -')));
                            ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Peso') ?></label>
                            <?php echo $this->Form->input('peso', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'peso original')); ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Estoque Mínimo') ?></label>
                            <?php echo $this->Form->input('estoqueminimo', array('label' => false, 'class' => 'form-control input-sm mask_decimal', 'placeholder' => 'qtd minima estoque')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Estoque Máximo') ?></label>
                            <?php echo $this->Form->input('estoquemaximo', array('label' => false, 'class' => 'form-control input-sm mask_decimal', 'placeholder' => 'qtd máxima estoque')); ?>
                        </div>
                    </div>
                </div>
                <h3 class="form-section"><?php echo __('Compra e Venda') ?></h3>
                <!--/row-->
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Compra') ?></label>
                            <?php echo $this->Form->input('valor_compra', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Produto']['valor_compra'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'valor nf compra')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <label class="control-label"><?php echo __('Margem Lucro') ?> %</label>
                            <?php echo $this->Form->input('margem_lucro', array('value' => $this->Formatacao->porcentagem($this->data['Produto']['margem_lucro']), 'label' => false, 'class' => 'form-control input-group input-sm mask_decimal', 'placeholder' => '% lucro', 'onblur' => "javascript:calculaVenda(this.value);")); ?>
                            <?php //echo $this->Form->input('margem_lucro', array('value' => $this->Formatacao->porcentagem($this->data['Produto']['margem_lucro']), 'label' => false, 'class' => 'form-control input-sm mask_decimal', 'placeholder' => '% lucro', 'onchange' => "javascript:calculaVenda(this.value);")) . $this->Html->link('Calcular', 'javascript:void(0)', array('onClick' => "calculaVenda($('#ProdutoMargemLucro').val());")); ?>
                            <span class="input-group-btn">
                                <button class="btn blue" type="button" onclick="javascript:calculaVenda($('#ProdutoMargemLucro').val());">%</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Venda') ?></label>
                            <?php echo $this->Form->input('valor_venda', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Produto']['valor_venda'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'valor normal venda')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Promoção') ?></label>
                            <?php echo $this->Form->input('valor_promocao', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Produto']['valor_promocao'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'venda promoção')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Promoção') ?> 2</label>
                            <?php echo $this->Form->input('valor_promocao2', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Produto']['valor_promocao2'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'venda promoção 2')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Valor Promoção') ?> 3</label>
                            <?php echo $this->Form->input('valor_promocao3', array('label' => false, 'value' => $this->Formatacao->precisao($this->data['Produto']['valor_promocao3'], 2), 'class' => 'form-control input-sm', 'placeholder' => 'venda promoção 3')); ?>
                        </div>
                    </div>
                </div>
                <h3 class="form-section"><?php echo __('Referência') . ' / ' . __('Observação') ?></h3>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <?php echo $this->Form->input('observacoes', array('type' => 'textarea', 'label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Observações ou Referências para o produto...')); ?>
                        </div>
                    </div>
                </div>

                <h3 class="form-section">Status</h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <?php $checked = $this->data['Produto']['ativo'] ?>
                            <div class="radio-list">
                                <label class="radio-inline">
                                    <input type="radio" name="data[Produto][ativo]" id="optionsRadios1" value="1" <?php echo $this->data['Produto']['ativo'] == 1 ? 'checked' : '' ?>> Ativo
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="data[Produto][ativo]" id="optionsRadios2" value="0" <?php echo $this->data['Produto']['ativo'] == 0 ? 'checked' : '' ?>> Inativo
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-actions left">
                    <button type="button" class="btn default">
                        <?php echo $this->Html->link('Cancelar', array('controller' => 'Produtos', 'action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
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


        //$("#ProdutoValorCompra").maskMoney();
        $("#ProdutoValorCompra").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
        $("#ProdutoValorVenda").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
        $("#ProdutoValorPromocao").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
        $("#ProdutoValorPromocao2").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
        $("#ProdutoValorPromocao3").maskMoney({prefix: '', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});


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
