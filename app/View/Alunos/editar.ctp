<?php
echo $this->Html->script(array('/js/renovasFuncs/maskMoney.js', '/js/renovasFuncs/custom-funcs.js'));

$action_buttons = "<button type='button' class='btn default'>";
$action_buttons .= $this->Html->link('Cancelar', array('controller' => 'Alunos', 'action' => 'index'), array('confirm' => __('Toda alteracao sera perdida, deseja continuar?')));
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
                    <?php echo $this->html->link('Alunos', 'javascript:;'); ?>
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
                    Novo Cadastro de Aluno
                </div>
                <!-- Setinha para recolher form -->
                <?php echo $this->Html->div('tools', $this->html->link('', 'javascript:;', array('class' => 'collapse'))); ?>

            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <?php echo $this->Form->create('Alunos', array('url' => array('controller' => 'alunos', 'action' => 'novo')), array('class' => 'horizontal-form')) ?>
                <!--            <form action="#" class="horizontal-form">-->
                <div class="form-actions top left">
                    <?php echo $action_buttons; ?>
                </div>
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Matricula') ?></label>
                                <?php echo $this->Form->input('matricula', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => __('matricula gerada automaticamente'), 'readonly')); ?>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Nome') ?></label>
                                <?php echo $this->Form->input('nome', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'nome completo do aluno')); ?>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('RG') ?></label>
                                <?php
                                echo $this->Form->input('rg', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'numero rg'));
                                ?>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('CPF') ?></label>
                                <?php
                                echo $this->Form->input('cpf', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'numero cpf'));
                                ?>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">Sexo</label>
                                <select  name="data[Alunos][sexo]" class="form-control input-sm">
                                    <option value="F">Masculino</option>
                                    <option value="M">Feminino</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!--/row-->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Aniversário') ?></label>
                                <div class="input-group input-medium date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                    <?php echo $this->Form->input('aniversario', array('type' => 'text', 'label' => false, 'class' => 'form-control', 'placeholder' => '13/02/2005', 'readonly')); ?>
                                    <span class="input-group-btn">
                                        <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                    </span>
                                </div>
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
                        <div class="col-md-4">
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
                                <label class="control-label">Celular</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-mobile-phone"></i></span>
                                    <?php echo $this->Form->input('celular', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(DDD) 99999-9999')); ?>
                                </div>
                            </div>
                        </div>
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
                                <label class="control-label">Responsável</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-phone"></i></span>
                                    <?php echo $this->Form->input('tel_responsavel', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(DDD) 99999-9999')); ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label">Outro</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-phone"></i></span>
                                    <?php echo $this->Form->input('tel_outro', array('label' => false, 'class' => 'form-control input-sm mask_phone', 'placeholder' => '(DDD) 99999-9999')); ?>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h4><?php echo __('Mais Informações') ?></h4>
                    <hr>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Nome do Pai') ?></label>
                                <?php echo $this->Form->input('nome_pai', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'nome completo do pai')); ?>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">E-mail</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                    <?php echo $this->Form->input('email_pai', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'email')); ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Aniversário') ?></label>
                                <div class="input-group input-medium date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                    <?php echo $this->Form->input('aniversario_pai', array('type' => 'text', 'label' => false, 'class' => 'form-control', 'placeholder' => '13/02/1964', 'readonly')); ?>
                                    <span class="input-group-btn">
                                        <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Nome do Mãe') ?></label>
                                <?php echo $this->Form->input('nome_mae', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'nome completo do pai')); ?>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label">E-mail</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                    <?php echo $this->Form->input('email_mae', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'email')); ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Aniversário') ?></label>
                                <div class="input-group input-medium date date-picker" data-date-format="dd/mm/yyyy" data-date-viewmode="years">
                                    <?php echo $this->Form->input('aniversario_mae', array('type' => 'text', 'label' => false, 'class' => 'form-control', 'placeholder' => '13/02/1964', 'readonly')); ?>
                                    <span class="input-group-btn">
                                        <button class="btn default" type="button"><i class="icon-calendar"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label"><?php echo __('Observação') ?></label>
                                <?php echo $this->Form->textarea('observacoes', array('label' => false, 'class' => 'form-control input-sm', 'placeholder' => 'Comentários ou observações sobre o aluno, como restrições médicas, alimentação...')); ?>
                            </div>
                        </div>
                    </div>
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

                    <?php echo $this->Form->end() ?>
                    <!-- END FORM-->
                </div>
                <div class="form-actions left">
                    <?php echo $action_buttons; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function () {
        FormComponents.init();
        FormSamples.init();

    });
</script>