<?php
echo $this->Html->script(
        array('/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js',
            '/scripts/form-wizard_alunos.js'
));

$action_buttons = "<button type='button' class='btn default'>";
$action_buttons .= $this->Html->link('Cancelar', array('controller' => 'Aluno', 'action' => 'index'), array('confirm' => __('Toda alteracao sera perdida, deseja continuar?')));
$action_buttons .= "</button>";
$action_buttons .= "<button type='submit' class='btn blue'><i class='icon-ok'></i> Salvar </button>";
?>
<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                <?php echo __('Novo Aluno') ?> <small>informe todos os detalhes do aluno</small>
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
                    <?php echo $this->html->link('Aluno', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li><?php echo $this->html->link('Novo', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <!-- BEGIN PAGE CONTENT-->
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue" id="form_wizard_1">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i> Novo Aluno - <span class="step-title">Etapa 1 de 5</span>
                    </div>
                    <div class="tools hidden-xs">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <?php echo $this->Form->create('Aluno', array('class' => 'form-horizontal')) ?>
                    <!--                    <form action="#" class="form-horizontal" id="submit_form">-->
                    <div class="form-wizard">
                        <div class="form-body">
                            <ul class="nav nav-pills nav-justified steps">
                                <li>
                                    <a href="#tab1" data-toggle="tab" class="step">
                                        <span class="number">1</span>
                                        <span class="desc"><i class="icon-ok"></i> Aluno </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab2" data-toggle="tab" class="step">
                                        <span class="number">2</span>
                                        <span class="desc"><i class="icon-ok"></i> Responsável</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab3" data-toggle="tab" class="step active">
                                        <span class="number">3</span>
                                        <span class="desc"><i class="icon-ok"></i> Endereço </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab4" data-toggle="tab" class="step">
                                        <span class="number">4</span>
                                        <span class="desc"><i class="icon-ok"></i> Escolar </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab5" data-toggle="tab" class="step">
                                        <span class="number">5</span>
                                        <span class="desc"><i class="icon-ok"></i> Faturamento </span>
                                    </a>
                                </li>
                            </ul>
                            <div id="bar" class="progress progress-striped" role="progressbar">
                                <div class="progress-bar progress-bar-success"></div>
                            </div>
                            <div class="tab-content">
                                <div class="alert alert-danger display-none">
                                    <button class="close" data-dismiss="alert"></button>
                                    <?php echo __('Para continuar, preencha os campos obrigatórios.') ?>
                                </div>
                                <div class="alert alert-success display-none">
                                    <button class="close" data-dismiss="alert"></button>
                                    Your form validation is successful!
                                </div>
                                <div class="tab-pane active" id="tab1">
                                    <h3 class="block">Principais informações do Aluno</h3>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Nome Completo') ?><span class="required">*</span></label>
                                        <div class="col-md-6">
                                            <?php
                                            echo $this->Form->input('nome', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'nome completo do aluno'));
                                            ?>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Registro Geral') ?> (RG)<span class="required">*</span></label>
                                        <div class="col-md-4">
                                            <?php
                                            echo $this->Form->input('rg', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Informar somente números'));
                                            ?>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Sexo') ?><span class="required">*</span></label>
                                        <div class="col-md-4">
                                            <div class="radio-list">
                                                <label>
                                                    <input type="radio" name="data[Aluno][sexo]" value="M" data-title="Masculino" <?php echo $this->data['Aluno']['sexo'] == 'M' ? 'checked' : '' ?>>
                                                    <?php echo __('Masculino') ?>
                                                </label>
                                                <label>
                                                    <input type="radio" name="data[Aluno][sexo]" value="F" data-title="Feminino" <?php echo $this->data['Aluno']['sexo'] == 'F' ? 'checked' : '' ?>>
                                                    <?php echo __('Feminino') ?>
                                                </label>
                                            </div>
                                            <div id="form_sexo_error"></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Aniversário') ?><span class="required">*</span></label>
                                        <div class="col-md-3 input-group input-medium date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                            <?php echo $this->Form->input('aniversario', array('type' => 'text', 'label' => false, 'class' => 'form-control', 'placeholder' => '13/02/2005', 'readonly')); ?>
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                            </span>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">E-mail</label>
                                        <div class="input-group col-md-4">
                                            <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                            <?php echo $this->Form->input('email', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'email')); ?>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Observações') ?></label>
                                        <div class="input-group col-md-6">
                                            <?php echo $this->Form->textarea('observacoes', array('label' => false, 'class' => 'form-control input-sm', 'rows' => 4, 'placeholder' => 'Comentários ou observações sobre o aluno, como restrições médicas, alimentação...')); ?>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Upload de Foto</label>
                                        <div class="col-md-9">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" />
                                                </div>
                                                <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileupload-new"><i class="icon-paper-clip"></i>&nbsp;<?php echo __('Selecione') ?></span>
                                                        <span class="fileupload-exists"><i class="icon-undo"></i> <?php echo __('Alterar') ?></span>
                                                        <input type="file" class="default" />
                                                    </span>
                                                    <a href="#" class="btn red fileupload-exists" data-dismiss="fileupload"><i class="icon-trash"></i> <?php echo __('Excluir') ?></a>
                                                </div>
                                            </div>
                                            <span class="label label-danger">Atenção!</span>
                                            <span>
                                                <?php
                                                echo __('Miniatura de imagem é suportado apenas nos navegadores mais recentes'
                                                        . ' Firefox, Chrome, Opera, Safari e Internet Explorer 10')
                                                ?>
                                            </span>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="tab2">
                                    <h3 class="block"><?php echo __('Informações do Responsável') ?></h3>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Tipo Filiação') ?><span class="required">*</span></label>
                                        <div class="col-md-3">
                                            <?php
                                            $options = array('pai' => 'Pai', 'mae' => 'Mãe', 'outro' => __('Outro'));
                                            echo $this->Form->select('filiacao', $options, array('escape' => false, 'class' => 'form-control input-sm'));
                                            ?>
                                            <span class="help-block"><?php echo __('Tipo responsável (Pai, Mãe, Outro)') ?></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Nome do Responsável') ?><span class="required">*</span></label>
                                        <div class="col-md-6">
                                            <?php echo $this->Form->input('nome_responsavel', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'nome completo do responsável')); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('CPF') ?><span class="required">*</span></label>
                                        <div class="col-md-3">
                                            <?php echo $this->Form->input('cpf_responsavel', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Informar somente números')); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">E-mail</label>
                                        <div class="input-group col-md-4">
                                            <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                            <?php echo $this->Form->input('email_responsavel', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'email')); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Aniversário') ?></label>
                                        <div class="col-md-3 input-group input-medium date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                            <?php echo $this->Form->input('aniversario_responsavel', array('type' => 'text', 'label' => false, 'class' => 'form-control', 'placeholder' => '13/02/2005', 'readonly')); ?>
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Telefone Principal') ?><span class="required">*</span></label>
                                        <div class="input-group col-md-3">
                                            <span class="input-group-addon"><i class="icon-phone"></i></span>
                                            <?php echo $this->Form->input('tel_principal', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(11) 999999999')); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Telefone Residêncial') ?></label>
                                        <div class="input-group col-md-3">
                                            <span class="input-group-addon"><i class="icon-phone"></i></span>
                                            <?php echo $this->Form->input('tel_residencia', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(11) 999999999')); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Telefone Comercial') ?></label>
                                        <div class="input-group col-md-3">
                                            <span class="input-group-addon"><i class="icon-phone"></i></span>
                                            <?php echo $this->Form->input('tel_comercial', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(11) 999999999')); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Telefone Celular') ?></label>
                                        <div class="input-group col-md-3">
                                            <span class="input-group-addon"><i class="icon-mobile-phone"></i></span>
                                            <?php echo $this->Form->input('celular', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(11) 999999999')); ?>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="tab3">
                                    <h3 class="block"><?php echo __('Detalhes do endereço') ?></h3>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Cep') ?></label>
                                        <div class="col-md-3">
                                            <?php echo $this->Form->input('cep', array('label' => false, 'class' => 'form-control input-sm')); ?>
                                            <span class="help-block"><?php echo __('Digite o cep para carregar o endereço') ?></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Bairro') ?></label>
                                        <div class="col-md-3">
                                            <?php echo $this->Form->input('bairro', array('label' => false, 'class' => 'form-control input-sm')); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Endereço') ?></label>
                                        <div class="col-md-4">
                                            <?php echo $this->Form->input('endereco', array('label' => false, 'class' => 'form-control input-sm')); ?>
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="col-md-2">
                                            <?php echo $this->Form->input('numero_endereco', array('maxlength' => 5, 'label' => false, 'class' => 'form-control input-sm numer_11', 'placeholder' => __('número'))); ?>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Complemento') ?></label>
                                        <div class="col-md-6">
                                            <?php
                                            echo $this->Form->input('complemento', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'apartamento, bloco'));
                                            ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3"><?php echo __('Cidade') ?></label>
                                        <div class="col-md-3">
                                            <?php
                                            $options = array('SP' => 'São Paulo', 'RJ' => 'Rio de Janeiro');
                                            echo $this->Form->select('cidade', $options, array('escape' => true, 'class' => 'form-control input-sm select2me', 'placeholder' => __('Selecione ou pesquise')));
                                            ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab4">

                                </div>
                                <div class="tab-pane" id="tab5">
                                    <h3 class="block">Confirm your account</h3>
                                    <h4 class="form-section">Account</h4>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Username:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="username"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Email:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="email"></p>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Profile</h4>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Fullname:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="fullname"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Gender:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="gender"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Phone:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="phone"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Address:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="address"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">City/Town:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="city"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Country:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="country"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Remarks:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="remarks"></p>
                                        </div>
                                    </div>
                                    <h4 class="form-section">Billing</h4>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Card Holder Name:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="card_name"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Card Number:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="card_number"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">CVC:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="card_cvc"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Expiration:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="card_expiry_date"></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Payment Options:</label>
                                        <div class="col-md-4">
                                            <p class="form-control-static" data-display="payment"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-offset-3 col-md-9">
                                        <a href="javascript:;" class="btn default button-previous">
                                            <i class="m-icon-swapleft"></i> Back
                                        </a>
                                        <a href="javascript:;" class="btn blue button-next">
                                            Continue <i class="m-icon-swapright m-icon-white"></i>
                                        </a>
                                        <!--<a href="javascript:;" class="btn red button-submit">
                                            Salvar <i class="m-icon-swapright m-icon-white"></i>
                                        </a>-->
                                        <button type='submit' class='btn green button-submit'> Salvar <i class="m-icon-swapright m-icon-white"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php echo $this->Form->end() ?>
                    <!--</form>-->
                </div>
            </div>
        </div>
    </div>
    <!-- END PAGE CONTENT-->

</div>

<script>
    jQuery(document).ready(function () {
        FormComponents.init();
        //FormSamples.init();
        FormWizard.init();

    });
</script>