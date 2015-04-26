<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Contas a Pagar <small>visão geral das contas a pagar</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <?php echo $this->html->link('Home', '/'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-group"></i>
                    <?php echo $this->html->link('Financeiro', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class=""></i>
                    <?php echo $this->html->link('Contas a Pagar', '/clientes/listar'); ?>
                </li>

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
                <div class="caption"><i class="icon-list-alt"></i>Todos os Pagamentos</div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="btn-group">
                        <a href="<?php echo $this->Html->url('novo'); ?>">
                            <button id="sample_editable_1_new" class="btn green">
                                Novo Pagamento &nbsp;<i class="icon-plus"></i>
                            </button>
                        </a>
                    </div>
                    <div class="btn-group pull-right">
                        <button class="btn dropdown-toggle" data-toggle="dropdown"><i class="icon-cogs"></i>  Opções <i class="icon-angle-down"></i>
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
                            <th>Vencimento</th>
                            <th>Categoria</th>
                            <th>Descrição</th>                            
                            <th>Valor</th>
                            <th style="text-align:center">Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($listcontaspagar && count($listcontaspagar) > 0) {
                            //print_r($listcontaspagar);
                            $dataAtual = date('Y-m-d');
                            foreach ($listcontaspagar as $key => $model) {
                                $ = $model['Pagar'];
                                ?>
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                    <td ><?php echo $this->Formatacao->data($dadosPagamento['data_vencimento']) ?></td>
                                    <td ><?php echo $dadosPagamento['data_vencimento'] ?></td>
                                    <td ><?php echo $dadosPagamento['descricao'] ?></td>
                                    <td class="center"><?php echo $this->Formatacao->moeda($dadosPagamento['valor']) ?></td>                                
                                    <td style="text-align:center">
                                        <?php
                                        if ($dadosPagamento['pago']) {                                            
                                            echo "<span class ='label label-sm label-success'>&nbsp;&nbsp;&nbsp;Pago&nbsp;&nbsp;&nbsp;</span></td>";
                                        } else {
                                            
                                            //if(strtotime($dataAtual) > strtotime($dadosPagamento['data_vencimento'])){
                                            if(strtotime($dadosPagamento['data_vencimento']) > strtotime($dataAtual)){
                                                echo "<span class ='label label-sm label-danger'>Atrasado</span></td>";
                                            }else{                                            
                                                echo "<span class ='label label-sm label-warning'>Pendente</span></td>";
                                            }
                                        }
                                        ?>
                                    </td>
                                    <td class="center">
                                        <a class="edit" href="<?php echo $this->Html->url('editar/' . $dadosPagamento['id']); ?>"><i class="icon-edit"></i></a>
                                            <?php
                                            echo $this->Form->postLink('', array('action' => 'delete', $dadosPagamento['id']), array('class' => 'icon-trash', 'confirm' => 'Este registros será excluído permanentemente, deseja continuar?'));
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






















