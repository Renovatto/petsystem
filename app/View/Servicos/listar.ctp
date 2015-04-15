<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Lista de Serviços <small>todos os serviços ativos sāo exibidos</small>
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
                    <div class="caption"><i class="icon-list-alt"></i>Tabela de Serviços</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-toolbar">
                        <div class="btn-group">
                            <a href="<?php echo $this->Html->url('novo'); ?>">
                                <button id="sample_editable_1_new" class="btn green">
                                    Novo Serviço &nbsp;<i class="icon-plus"></i>
                                </button>
                            </a>
                        </div>
                        <div class="btn-group pull-right">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">Ação <i class="icon-angle-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="#"><i class="icon-trash"></i> Excluir Seleção</a></li>
                                <li><a href="#"><i class="icon-print"></i>  Exportar Excel</a></li>
                            </ul>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="tableDefault">
                        <thead>
                            <tr>
                                <th class="table-checkbox"><input type="checkbox" class="group-checkable" data-set="#tableDefault .checkboxes" /></th>
                                <th>Código</th>
                                <th>Descrição</th>
                                <th>Categoria</th>
                                <th>Valor</th>
                                <th>Promoção</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($listservicos && count($listservicos) > 0) {
                                foreach ($listservicos as $key => $model) {
                                    $dadosServico = $model['Servico'];

                                    $listpromocao = array();
                                    $itemPromocao = '<div class="form-group">';
                                    $itemPromocao .= '<select name="promocao" class="form-control input-small">';
                                    $itemPromocao .= '<option value="">';
                                    $itemPromocao .= $dadosServico['valor_promocao'] > 0 ? $this->Formatacao->moeda($dadosServico['valor_promocao']) : 'R$ 0,00';
                                    $itemPromocao .= '</option>';

                                    $itemPromocao .= '<option value="">';
                                    $itemPromocao .= $dadosServico['valor_promocao2'] > 0 ? $this->Formatacao->moeda($dadosServico['valor_promocao2']) : 'R$ 0,00';
                                    $itemPromocao .= '</option>';

                                    $itemPromocao .= '<option value="">';
                                    $itemPromocao .= $dadosServico['valor_promocao3'] > 0 ? $this->Formatacao->moeda($dadosServico['valor_promocao3']) : 'R$ 0,00';
                                    $itemPromocao .= '</option>';
                                    $itemPromocao .= '</select>';
                                    ?>
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td ><?php echo $dadosServico['codinterno'] ?></td>
                                        <td ><?php echo $dadosServico['descricao'] ?></td>
                                        <td > Nenhum </td>
                                        <td ><?php echo $this->Formatacao->moeda($dadosServico['valor_venda']) ?></td>
                                        <td ><?php echo $itemPromocao ?></td>
                                        <td class="center">
                                            <?php
                                            if ($dadosServico['ativo']) {
                                                echo "<span class = 'label label-sm label-success'>Ativo</span></td>";
                                            } else {
                                                echo "<span class = 'label label-sm label-danger'>Inativo</span></td>";
                                            }
                                            ?>
                                        </td>
                                        <td class="center">
                                            <a class="edit" href="<?php echo $this->Html->url('editar/' . $dadosServico['id']); ?>"><i class="icon-edit"></i></a>
                                                <?php
                                                echo $this->Form->postLink('', array('action' => 'delete', $dadosServico['id']), array('class' => 'icon-trash', 'confirm' => 'Este registros será excluído permanentemente, deseja continuar?'));
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
</div>


<script>
    jQuery(document).ready(function() {
        TableDefault.init();
    });
</script>

