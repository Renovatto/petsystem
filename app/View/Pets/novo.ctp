<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Novo Pet <small>informe todos os detalhes do pet</small>
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
                    <?php echo $this->html->link('Pets', '/pets/listar'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li><?php echo $this->html->link('Novo', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <?php //echo $this->Session->flash('flash', array('params' => array('name' => 'alert'), 'element' => 'alert_message'));     ?>

    <div class="portlet box light-grey">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-ok"></i>
                Novo Cadastro de Pet
            </div>
            <!-- Setinha para recolher form -->
            <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <?php echo $this->Form->create('Pet', array('action' => 'novo', 'class' => 'horizontal-form')) ?>
            <!--            <form action="#" class="horizontal-form">-->
            <div class="form-actions top left">
                <button type="button" class="btn default">
                    <?php echo $this->Html->link('Cancelar', array('controller' => 'Pets', 'action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                </button>
                <button type="submit" class="btn blue"><i class="icon-ok"></i> Save</button>
            </div>
            <div class="form-body">
                <h3 class="form-section">Informações Pessoais</h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label">Espécie</label>
                            <?php
                            echo $this->Form->select('especie_id', $listEspecies, array('class' => 'form-control select2me', 'empty' => __('- Selecione -')));
                            ?>

                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label">Raça</label>
                            <?php
                            echo $this->Form->select('raca_id', $listRacas, array('class' => 'form-control select2me', 'empty' => __('- Selecione -')));
                            ?>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="control-label">Nome</label>
                            <?php echo $this->Form->input('nome', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'nome completo')); ?>
<!--                            <input type="text" id="nome" name="" class="form-control input-group-lg" placeholder="nome completo">-->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label">Data de Nascimento</label>
                            <?php echo $this->Form->input('nascimento', array('id' => 'mask_date', 'type' => 'text', 'label' => false, 'class' => 'form-control input-sm', 'placeholder' => '15/07/2005')); ?>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label">RGA</label>
                            <?php echo $this->Form->input('rg', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'rga ')); ?>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label">Cor</label>
                            <?php echo $this->Form->input('cor', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'cor ')); ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label">Peso</label>
                            <?php
                            $pesoPets = $this->requestAction('/auxiliares/pesoPets');
                            echo $this->Form->select('peso', $pesoPets, array('class' => 'form-control input-sm', 'empty' => __('- Selecione -')));
                            ?>

                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label">Porte</label>
                            <?php
                            $tamanhoPets = $this->requestAction('/auxiliares/tamanhoPets');
                            echo $this->Form->select('tamanho', $tamanhoPets, array('class' => 'form-control input-sm', 'empty' => __('- Selecione -')));
                            ?>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="control-label">Sexo</label>
                            <?php
                            echo $this->Form->select('sexo', array('M' => __('Macho'), 'F' => __('Fêmea')), array('class' => 'form-control input-sm', 'empty' => false));
                            ?>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label">Nome do Pai</label>
                            <?php echo $this->Form->input('nome_pai', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Nome do Pai')); ?>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label">Nome da Mãe</label>
                            <?php echo $this->Form->input('nome_mae', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Nome da Mãe')); ?>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-md-4">
                        <label class="control-label">Proprietário</label>
                        <select name="data[Pet][cliente_id]" class="form-control select2me" data-placeholder="Selecione o proprietário...">
                            <?php
                            if (is_array($listClientes) && count($listClientes) > 0) {
                                foreach ($listClientes as $idcliente => $nomecliente) {
                                    echo "<option value='$idcliente'>$nomecliente</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="form-actions left">
                    <button type="button" class="btn default">
                        <?php echo $this->Html->link('Cancelar', array('controller' => 'Pets', 'action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                    </button>
                    <button type="submit" class="btn blue"><i class="icon-ok"></i> Salvar </button>
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
    });
</script>