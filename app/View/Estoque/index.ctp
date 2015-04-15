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
                    <i class="icon-random"></i>
                    <?php echo $this->html->link('Movimentações', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-dropbox"></i>
                    <?php echo $this->html->link('Estoque', '/estoque'); ?>
                    <i class="icon-angle-right"></i>
                </li>


            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <?php echo $this->Session->flash(); ?>

    <div class="col-md-12">
        <div class="portlet box light-grey">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-ok"></i>
                    <?php echo __('Movimento de Estoque') ?>
                </div>
                <!-- Setinha para recolher form -->
                <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <?php echo $this->Form->create('Estoque', array('url' => '/estoque/novo', 'class' => 'horizontal-form')) ?>
                <div class="form-actions top left">
                    <button type="button" class="btn default">
                        <?php echo $this->Html->link('Cancelar', array('controller' => 'Estoque', 'action' => 'index'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                    </button>
                    <button type="submit" class="btn blue"><i class="icon-ok"></i> Salvar</button>
                </div>
                <div class="form-body">

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Código') ?></label>
                                <?php echo $this->Form->input('codigo', array('label' => false, 'class' => 'form-control input-sm')); ?>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Referências') ?></label>
                                <?php echo $this->Form->input('referencia', array('label' => false, 'class' => 'form-control input-sm')); ?>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Produto') ?></label>
                                <?php
                                echo $this->Form->select('produto_id', $listProdutos, array('class' => 'form-control select2me', 'empty' => __('- Selecione -')));
                                ?>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Tipo') ?></label>
                                <?php
                                echo $this->Form->select('tipomovimento', array('E' => __('Entrada'), 'S' => __('Saída'), 'D' => __('Devolução')), array('class' => 'form-control input-sm', 'empty' => false));
                                ?>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Valor') ?></label>
                                <?php echo $this->Form->input('valormovimento', array('maxlength' => 4, 'label' => false, 'class' => 'form-control input-sm mask_number', 'placeholder' => '12345')); ?>
                            </div>
                        </div>
                    </div>


                    <h3 class="form-section"><?php echo __('Observação') ?></h3>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <?php echo $this->Form->input('observacao', array('type' => 'textarea', 'label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Observações ou Referências para o movimento...')); ?>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions left">
                        <button type="button" class="btn default">
                            <?php echo $this->Html->link('Cancelar', array('controller' => 'Estoque', 'action' => 'index'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                        </button>
                        <button type="submit" class="btn blue"><i class="icon-ok"></i> Salvar</button>
                    </div>
                    <?php echo $this->Form->end() ?>
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