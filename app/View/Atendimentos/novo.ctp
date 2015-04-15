<?php
echo $this->Html->script(array('/js/views/atendimentos/listar_pets.js'));
?>
<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Fila de Atendimento <small>informe todos os detalhes para o atendimento</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <?php echo $this->html->link('Home', '/'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-female"></i>
                    <?php echo $this->html->link('Atendimento', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-male"></i>
                    <?php echo $this->html->link('Fila Atendimento', '/atendimentos/fila'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li><?php echo $this->html->link('Novo', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <!--    Mensagem de Sucesso ou erro-->
    <?php echo $this->Session->flash(); ?>

    <div class="portlet box light-grey">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-female"></i>
                Novo Atendimento
            </div>
            <!-- Setinha para recolher form -->
            <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <?php echo $this->Form->create('Atendimento', array('action' => 'novo', 'class' => 'horizontal-form')) ?>
            <div class="form-actions top left">
                <button type="button" class="btn default">
                    <?php echo $this->Html->link('Cancelar', array('controller' => 'Atendimentos', 'action' => 'fila'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                </button>
                <button type="submit" class="btn blue"><i class="icon-ok"></i> <?php echo __('Salvar') ?></button>
            </div>
            <div class="form-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Cliente') ?> *</label>
                            <?php
                            echo $this->Form->hidden('datahora_chegada', array('value' => date('Y-m-d H:i:s')));
                            echo $this->Form->select('cliente_id', $listClientes, array('class' => 'form-control select2me', 'empty' => __('- Selecione -')));
                            ?>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Pet') ?> *</label>
                            <?php
                            echo $this->Form->select('pet_id', $listPets, array('class' => 'form-control select2me', 'empty' => __('- Selecione -')));
                            ?>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Tipo Atendimento') ?> *</label>
                            <?php
                            $tipo_atendimento = $this->requestAction('/auxiliares/tipoAtendimento');
                            ;
                            echo $this->Form->select('atendimento_tipo', $tipo_atendimento, array('class' => 'form-control', 'empty' => __('- Selecione -')));
                            ?>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label"><?php echo __('Prioridade') ?> *</label>
                            <?php
                            $prioridade_atendimento = $this->requestAction('/auxiliares/prioridadeAtendimento');
                            echo $this->Form->select('prioridade_tipo', $prioridade_atendimento, array('class' => 'form-control', 'empty' => false));
                            ?>
                        </div>
                    </div>
                </div>

                <h3 class="form-section"><?php echo __('Informações para atendimento') ?></h3>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <?php echo $this->Form->input('observacoes', array('type' => 'textarea', 'label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Breve detalhe sobre o atendimento...')); ?>
                        </div>
                    </div>
                </div>

                <div class="form-actions left">
                    <button type="button" class="btn default">
                        <?php echo $this->Html->link('Cancelar', array('controller' => 'Atendimentos', 'action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                    </button>
                    <button type="submit" class="btn blue"><i class="icon-ok"></i> <?php echo __('Salvar') ?></button>
                </div>

            </div>
            <?php echo $this->Form->end() ?>
            <!-- END FORM-->
        </div>
    </div>


</div>

</div>


</div>
