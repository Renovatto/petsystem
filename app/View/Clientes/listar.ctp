<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Lista de Clientes <small>todos os clientes ativos sāo exibidos</small>
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
                <li><li><?php echo $this->html->link('Listar', 'javascript:;'); ?></li></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <?php echo $this->Session->flash(); ?>

    <div class="row">
    <div class="col-md-12">
        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box light-grey">
            <div class="portlet-title">
                <div class="caption"><i class="icon-list-alt"></i>Todos os Clientes</div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="btn-group">
                        <a href="<?php echo $this->Html->url('novo'); ?>">
                            <button id="sample_editable_1_new" class="btn green">
                                Novo Cliente &nbsp;<i class="icon-plus"></i>
                            </button>
                        </a>
                    </div>
                    <div class="btn-group pull-right">
                        <button class="btn dropdown-toggle" data-toggle="dropdown"><i class="icon-cogs"></i>  Opções <i class="icon-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="#"><i class="icon-trash"></i> Excluir Seleção</a></li>
                            <li><a href="#"><i class="icon-print"></i>  Exportar Excel</a></li>
                            <li><a href="#etiqueta" data-toggle="modal"><i class="icon-plus"></i>  Exportar Etiquetas</a></li>
                        </ul>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover" id="tableDefault">
                    <thead>
                        <tr>
                            <th class="table-checkbox"><input type="checkbox" class="group-checkable" data-set="#tableDefault .checkboxes" /></th>
                            <th>Nome</th>
                            <th>Cpf/Cnpj</th>
                            <th>Telefone</th>
                            <th>E-mail</th>
                            <th>Cadastro</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($listclientes && count($listclientes) > 0) {
                            foreach ($listclientes as $key => $model) {
                                $dadoscliente = $model['Cliente'];
                                ?>
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                    <td><?php echo $dadoscliente['nome'] ?></td>
                                    <td ><?php echo $dadoscliente['cpfcnpj'] ?></td>
                                    <td ><?php echo!empty($dadoscliente['celular']) ? $dadoscliente['celular'] : $dadoscliente['tel_residencia'] ?></td>
                                    <td ><a href="mailto:<?php echo $dadoscliente['email'] ?>"><?php echo $dadoscliente['email'] ?></a></td>
                                    <td class="center"><?php echo $this->Formatacao->data($dadoscliente['created']) ?></td>
                                    <td class="center">
                                        <?php
                                        if ($dadoscliente['ativo']) {
                                            echo "<span class = 'label label-sm label-success'>Ativo</span></td>";
                                        } else {
                                            echo "<span class = 'label label-sm label-danger'>Inativo</span></td>";
                                        }
                                        ?>
                                    </td>
                                    <td class="center">
                                        <a class="edit" href="<?php echo $this->Html->url('editar/' . $dadoscliente['id']); ?>"><i class="icon-edit"></i></a>
                                            <?php
                                            echo $this->Form->postLink('', array('action' => 'delete', $dadoscliente['id']), array('class' => 'icon-trash', 'confirm' => 'Este registros será excluído permanentemente, deseja continuar?'));
                                            ?>
                                    </td>
                                </tr>

                                <?php
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    <!-- END EXAMPLE TABLE PORTLET-->

    <!-- MODAL ETIQUETA -->
    <?php echo $this->element('gerador_etiquetas'); ?>

</div>


<script>
    $(document).ready(function() {
        TableDefault.init();
        FormComponents.init();
    });
</script>






















