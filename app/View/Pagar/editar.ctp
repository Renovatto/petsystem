<?php
echo $this->Html->script(array('/js/renovasFuncs/maskMoney.js', '/js/renovasFuncs/custom-funcs.js'));
     
$action_buttons = "<button type='button' class='btn default'>";
$action_buttons .= $this->Html->link('Cancelar', array('controller' => 'Pagar', 'action' => 'index'),
                                    array('confirm' => __('Toda alteração será perdida, deseja continuar?')));
$action_buttons .= "</button>";
$action_buttons .= "<button type='submit' class='btn blue'><i class='icon-ok'></i> Salvar </button>";

?>
<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                <?php echo __('Contas a pagar') ?> <small>informe todos os detalhes do pagamento</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <?php echo $this->html->link('Home', '/'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-dollar"></i>
                    <?php echo $this->html->link('Financeiro', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class=""></i>
                    <?php echo $this->html->link('Contas a Pagar', '/pagar/pagar'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li><?php echo $this->html->link('Novo', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="col-md-12">
        <div class="portlet box yellow">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-upload-alt"></i>
                    Editar Pagamento
                </div>
                <!-- Setinha para recolher form -->
                <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->                
                <?php //echo $this->Form->create('Pagar', array('action' => 'editar', 'class' => 'horizontal-form')) ?>
                <?php echo $this->Form->create('Pagar', array('url'=>array('controller'=>'pagar','action'=>'editar')), array( 'class' => 'horizontal-form')) ?>
                <!--            <form action="#" class="horizontal-form">-->
                <div class="form-actions top left">
                    <?php echo $action_buttons; ?>
                </div>
                <div class="form-body">
                    <!--<h3 class="form-section"><?php //echo __('Informações Básicas') ?></h3>-->
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Descrição') ?></label>
                                <?php echo $this->Form->input('descricao', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Nome para o pagamento')); ?>
                            </div>
                        </div>                                    
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Categoria') ?></label>
                                <?php
                                echo $this->Form->select('categoria_financeiro_id', $listCategorias, array('class' => 'form-control input-sm select2me', 'placeholder' => __('Selecione uma categoria')));
                                ?>
                            </div>
                        </div> 

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Banco') ?></label>
                                <?php 
                                echo $this->Form->select('banco_id', $listBancos, array('class' => 'form-control input-sm select2me', 'placeholder' => __('Selecione uma conta bancária')));                                
                                ?>
                            </div>
                        </div>
                    </div>
                    <!--/row-->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Data Vencimento') ?></label>
                                <div class="input-group input-medium date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                    <?php 
                                    echo $this->Form->input('data_vencimento', array('type' => 'text', 'label' => false, 'class' => 'form-control',
                                    'value'=> $this->Formatacao->data($this->data['Pagar']['data_vencimento']))); 
                                    ?>
                                    <span class="input-group-btn">
                                        <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                    </span>
                                </div>                                    
                            </div>
                        </div>                                     
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Valor') ?></label>
                                <?php 
                                $valor = $this->data['Pagar']['valor'] > 0 ? $this->Formatacao->precisao($this->data['Pagar']['valor'],2) :'';
                                echo $this->Form->input('valor', array('label' => false, 'type'=> 'text', 'class' => 'form-control input-sm', 
                                        'value' => $valor)); ?> 
                            </div>
                        </div>
                    </div>
                    <div class="row">  

                    </div>                               
                    <!--<h3 class="form-section"><?php //echo __('Recorrência') ?></h3>-->
                    <hr>
                    <div class="row">
                        <div class="col-md-1">
                            <div class="form-group">
                                <label  class=""><?php echo __('Repetir') ?></label>
                                <div class="checkbox-list">
                                    <label>
                                        <?php echo $this->Form->checkbox('recorrencia'); ?>
                                    </label>
                                 </div>
                           </div>
                        </div>                  
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Recorrência') ?></label>
                                <?php
                                $repetir = array('diario'   =>__('Diáriamente'),
                                                 'semanal'  =>__('Semanalmente'),
                                                 'mensal'   =>__('Mensalmente'),
                                                 'bimestre' =>__('Bimestralmente'),
                                                 'trimestre'=>__('Trimestralmente'),
                                                 'semestre' =>__('Semestralmente'),
                                                 'anual'    =>__('Anualmente'));
                                echo $this->Form->select('ciclo', $repetir, array('class' => 'form-control select2me input-sm','placeholder'=>__('Selecione a repetição'),'value'=> $this->data['Pagar']['ciclo']));
                                ?>                         
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Vezes') ?></label>
                                <?php echo $this->Form->input('repeticoes', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Número repetições')); ?>
                            </div>
                        </div>
                    </div>
                    <!--<h3 class="form-section"><?php //echo __('Pagamento') ?></h3>-->
                    <hr>
                    <div class="row">
                        <div class="col-md-1">
                            <div class="form-group">
                                <label  class=""><?php echo __('Pago') ?></label>
                                <div class="checkbox-list">
                                    <label>
                                        <?php echo $this->Form->checkbox('pago'); ?>
                                    </label>
                                 </div>
                           </div>
                        </div>                               
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Data Pagamento') ?></label>
                                <div class="input-group input-medium date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                    <?php 
                                    $dt_pgto = !empty($this->data['Pagar']['data_pagamento'])? $this->Formatacao->data($this->data['Pagar']['  data_pagamento']) : '';
                                    echo $this->Form->input('data_pagamento', array('type' => 'text', 'label' => false, 'class' => 'form-control',
                                    'value'=> $dt_pgto,'readonly')); 
                                    ?>
                                    <span class="input-group-btn">
                                        <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                    </span>
                                </div>    
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Desconto') ?></label>
                                <?php 
                                 $desconto = $this->data['Pagar']['desconto'] > 0 ? $this->Formatacao->precisao($this->data['Pagar']['desconto'],2) :'';
                                 echo $this->Form->input('desconto', array('label' => false, 'type'=> 'text', 'class' => 'form-control input-sm', 
                                        'value' => $desconto)); 
                                ?>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Juros') ?></label>
                                <?php 
                                $juros = $this->data['Pagar']['juros'] > 0 ? $this->Formatacao->precisao($this->data['Pagar']['juros'],2) :'';
                                echo $this->Form->input('juros', array('label' => false, 'type'=> 'text', 'class' => 'form-control input-sm', 
                                        'value' => $juros)); 
                                    ?>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Valor') ?></label>
                                <?php 
                                $valor_pago =$this->data['Pagar']['valor_pago'] >0 ? $this->Formatacao->precisao($this->data['Pagar']['valor_pago'],2) : '';
                                echo $this->Form->input('valor_pago', array('label' => false, 'type'=> 'text',
                                'class' => 'form-control input-sm', 'value' =>$valor_pago)); ?>
                            </div>
                        </div>                                       
                    </div>

                    <h4><?php echo __('Mais Informações') ?></h4>
                    <hr>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Fornecedor') ?></label>
                                <?php echo $this->Form->select('fornecedor_id', $listFornecedores, array('class' => 'form-control input-sm select2me', '    placeholder' => __('Selecione o fornecedor para o pagamento')));
                                ?>
                            </div>
                        </div>       
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Competência') ?></label>
                                <div class="input-group input-medium date date-picker" data-date-format="mm/yyyy" data-date-viewmode="years">                                            
                                <?php 
                                    $dt_comp = !empty($this->data['Pagar']['data_competencia'])? $this->Formatacao->data($this->data['Pagar']['  data_competencia']) : '';
                                    echo $this->Form->input('data_competencia', array('type' => 'text', 'label' => false, 'class' => 'form-control',
                                    'value'=> $dt_comp,'readonly')); 
                                ?>

                                    <span class="input-group-btn">
                                        <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                    </span>
                                </div>                                            
                            </div>                                          
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">                                        
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Centro de Custo') ?></label>
                                <?php echo $this->Form->input('centrocusto_id', array('label' => false, 'class' => 'select2me form-control input-medium', 'placeholder' => '')); ?>
                            </div>                                  
                        </div>                         
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Observação') ?></label>
                                <?php echo $this->Form->input('observacoes', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Comentários sobre o pagamento ou Fornecedor')); ?>
                            </div>
                        </div>                                                                               
                    </div>

                    <?php echo $this->Form->end(); ?>
                    <!-- END FORM-->
                </div>
                <div class="form-actions bottom left">
                    <?php echo $action_buttons; ?>
                </div>                
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