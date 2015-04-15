<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                <?php echo __('Editar') . ' ' . $this->data['Cliente']['nome']; ?>
                <small>informe todos os detalhes do cliente</small>
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
                <li><?php echo $this->html->link('Editar', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="col-md-12">
        <div class="tabbable tabbable-custom boxless">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab_1" data-toggle="tab"><?php echo __('Clientes') ?>
                    </a>
                </li>
                <li ><a  href="#tab_2" data-toggle="tab"><?php echo __('Meus Pet`s') ?></a></li>
                <li ><a  href="#tab_3" data-toggle="tab"><?php echo __('Ultimas Consultas') ?></a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="portlet box light-grey">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-ok"></i>
                                Editar Cadastro de Cliente
                            </div>
                            <!-- Setinha para recolher form -->
                            <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <?php echo $this->Form->create('Cliente', array('action' => 'editar', 'class' => 'horizontal-form')) ?>
                            <!--            <form action="#" class="horizontal-form">-->
                            <div class="form-actions top left">
                                <button type="button" class="btn default">
                                    <?php echo $this->Html->link('Cancelar', array('action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                                </button>
                                <button type="submit" class="btn blue"><i class="icon-ok"></i> Salvar</button>
                            </div>
                            <div class="form-body">
                                <h3 class="form-section">Informações Pessoais</h3>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">Tipo Pessoa</label>
                                            <?php $checked = $this->data['Cliente']['tipo_pessoa'] ?>
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="data[Cliente][tipo_pessoa]" id="optionsRadios1" value="F" <?php echo $this->data['Cliente']['tipo_pessoa'] == 'F' ? 'checked' : '' ?>> Fisíca
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="data[Cliente][tipo_pessoa]" id="optionsRadios2" value="J" <?php echo $this->data['Cliente']['tipo_pessoa'] == 'J' ? 'checked' : '' ?>> Juridíca
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label">Nome Completo</label>
                                            <?php echo $this->Form->input('nome', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'nome completo')); ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Apelido</label>
                                            <?php echo $this->Form->input('apelido', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'apelido')); ?>
                                            <!-- <input type="text" id="apelido" class="form-control input-sm" placeholder="apelido">-->
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">RG/IE</label>
                                            <?php echo $this->Form->input('rgie', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'rg ou inscrição estadual')); ?>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">CPF/CNPJ</label>
                                            <?php echo $this->Form->input('cpfcnpj', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'cpf ou cnpj')); ?>
                                        </div>
                                    </div>
                                </div>
                                <!--/row-->
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Sexo</label>
                                            <select  name="data[Cliente][sexo]" class="form-control input-sm">
                                                <option value="F">Masculino</option>
                                                <option value="M">Feminino</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">E-mail</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                                <?php echo $this->Form->input('email', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'email')); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">Rede Social</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-facebook"></i></span>
                                                <?php echo $this->Form->input('rede_social', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'facebook, instagram, twitter')); ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="control-label">Residência</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-phone"></i></span>
                                                <?php echo $this->Form->input('tel_residencia', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(DDD) 99999-9999')); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="control-label">Comercial</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-phone"></i></span>
                                                <?php echo $this->Form->input('tel_comercial', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(DDD) 99999-9999')); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="control-label">Celular</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-mobile-phone"></i></span>
                                                <?php echo $this->Form->input('celular', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(DDD) 99999-9999')); ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/row-->
                                <h3 class="form-section">Endereço</h3>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">CEP</label>
                                            <?php echo $this->Form->input('cep', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'cep')); ?>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">Bairro</label>
                                            <?php echo $this->Form->input('bairro', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'bairro')); ?>
                                        </div>
                                    </div>
                                </div>
                                <!--/row-->
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">Endereço</label>
                                            <?php echo $this->Form->input('endereco', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'endereco')); ?>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Número</label>
                                            <?php echo $this->Form->input('numero_endereco', array('label' => false, 'class' => 'form-control input-small', 'placeholder' => 'N')); ?>
                                        </div>
                                    </div>
                                </div>
                                <!--/row-->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Complemento</label>
                                            <?php echo $this->Form->input('complemento', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'apartamento, bloco')); ?>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Cidade</label>
                                            <?php
                                            $options = array('SP' => 'São Paulo', 'RJ' => 'Rio de Janeiro');
                                            echo $this->Form->select('cidade', $options, array('escape' => true, 'class' => 'form-control input-sm'));
                                            ?>

                                        </div>
                                    </div>
                                </div>

                                <h3 class="form-section">Status</h3>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <?php $checked = $this->data['Cliente']['ativo'] ?>
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <input type="radio" name="data[Cliente][ativo]" id="optionsRadios1" value="1" <?php echo $this->data['Cliente']['ativo'] == 1 ? 'checked' : '' ?>> Ativo
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="data[Cliente][ativo]" id="optionsRadios2" value="0" <?php echo $this->data['Cliente']['ativo'] == 0 ? 'checked' : '' ?>> Inativo
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="form-actions left">
                                <button type="button" class="btn default">
                                    <?php echo $this->Html->link('Cancelar', array('action' => 'listar'), array(), __('Toda alteração será perdida, deseja continuar?')); ?>
                                </button>
                                <button type="submit" class="btn blue"><i class="icon-ok"></i> Salvar</button>
                            </div>
                            <?php echo $this->Form->end() ?>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab_2">
                    <div class="portlet box light-grey">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-edit"></i><?php echo __('Meus Pet`s') ?></div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <?php
                                        if (is_array($this->data['Pet']) && count($this->data['Pet']) > 0) {
                                            ?>
                                            <tr>
                                                <th >#</th>
                                                <th >Nome</th>
                                                <th >Cor</th>
                                                <th >Raça</th>
                                                <th>Sexo</th>
                                                <th></th>
                                            </tr>
                                            <?php
                                        }
                                        ?>
                                    </thead>
                                    <div class="table-toolbar">
                                        <div class="btn-group">
                                            <a href="<?php echo $this->Html->url('novo'); ?>">
                                                <button id="sample_editable_1_new" class="btn green">
                                                    Novo Pet &nbsp;<i class="icon-plus"></i>
                                                </button>
                                            </a>
                                        </div>
                                    </div>

                                    <tbody>
                                        <?php
                                        if (is_array($this->data['Pet']) && count($this->data['Pet']) > 0) {
                                            foreach ($this->data['Pet'] as $key => $dadosPet) {
                                                ?>
                                                <tr>
                                                    <td><?php echo $dadosPet['id'] ?></td>
                                                    <td><?php echo $dadosPet['nome'] ?></td>
                                                    <td><?php echo $dadosPet['cor'] ?></td>
                                                    <td><?php echo $dadosPet['raca'] ?></td>
                                                    <td><?php echo $dadosPet['sexo'] == 'F' ? __('Fêmea') : __('Macho') ?></td>
                                                    <td><a href="<?php echo $this->Html->url(array('action' => 'editar/' . $dadosPet['id'], 'controller' => 'Pets')); ?>" class="btn default btn-xs green-stripe"> Editar</a></td>
                                                    <!-- <i class="icon-edit"></i> -->
                                                </tr>
                                                <?php
                                            }
                                        } else {
                                            echo "<tr><td>" . __('Cliente não possui Pet`s cadastrados') . "</td></tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab_3">
                    Ultimas Consultas
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